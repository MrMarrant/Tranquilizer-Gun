AddCSLuaFile("shared.lua")

include("shared.lua")

local BlurryVision = "BlurryVision"
local DelayBlurryVision = "DelayBlurryVision"

util.AddNetworkString( BlurryVision )
util.AddNetworkString( DelayBlurryVision )

-- Set a player to sleep, index start to 1
local function SetSleepPlayer(victim, timeToGetTired, timeToSleep, step, tableText, index)
	if (index == 1) then
		victim.IsTired = true 
		net.Start(DelayBlurryVision)
		net.WriteFloat(timeToGetTired)
		net.Send(victim)
	end
	timer.Create("getting_tired_"..victim:SteamID(), timeToGetTired/step, 1, function()
		if (!victim.IsTired or !IsValid(victim)) then return end
		net.Start(BlurryVision)
		net.WriteTable({step, index})
		net.Send(victim)
		factorSpeed = (step - index) / step
		if (!victim.WalkSpeed and !victim.RunSpeed) then
			victim.WalkSpeed = victim:GetWalkSpeed()
			victim.RunSpeed = victim:GetRunSpeed()
		end
		victim:SetWalkSpeed(victim.WalkSpeed * factorSpeed )
		victim:SetRunSpeed(victim.RunSpeed * factorSpeed)
		victim:Say("/me "..tableText[index])

		index = index + 1
		if (index <= step) then
			SetSleepPlayer(victim, timeToGetTired, timeToSleep, step, tableText, index)
		else
			victim.IsTired = false
			victim.TranquilizedByDart = true
			DarkRP.toggleSleep(victim)
			timer.Create("getting_sleepy_"..victim:SteamID(), timeToSleep, 1, function()
				if victim.TranquilizedByDart and IsValid(victim) then
					DarkRP.toggleSleep(victim,"wake")
					victim.TranquilizedByDart = false
					-- When a player spawns, his movement speed cannot be changed immediately afterwards.
					timer.Simple(0.1, function ()
						if !IsValid(victim) then return end
						victim:Say("/me "..TranslateTranquilizer( "woke_up" ))
						victim:SetWalkSpeed(1)
						victim:SetRunSpeed(1)
						timer.Simple(5, function ()
							if !IsValid(victim) then return end
							if (victim.WalkSpeed and victim.RunSpeed) then
								victim:SetWalkSpeed(victim.WalkSpeed)
								victim:SetRunSpeed(victim.RunSpeed)
							end
						end)
					end)
				end
			end)
		end
	end )
end

function ENT:Initialize()
	self:SetModel( "models/dart_tranquilizer/w_syringe.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS ) 
	self:SetMoveType(MOVETYPE_FLYGRAVITY)
	self:SetSolid( SOLID_VPHYSICS ) 
	self:SetUseType(SIMPLE_USE)
	self.IsTouch = false
	--! TODO : A virer ou ?? remplacer par une ConVar avec possibilit?? de le modifier dans le menu des props (Non utilis?? pour le moment)
	self.jobNotAffected = { ---- Jobs that are not affected by the tranquilizer.
	
	"SCP 999",
	"SCP 131",
	"SCP 049",
	"SCP 096",
	"SCP 457",
	"SCP 079",
	"SCP 205",
	"SCP 173",
	"SCP 106",
	"SCP 682",
	"SCP 1048",
}
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Touch(ent)
	if (!self.IsTouch) then
		self:SetMoveType( MOVETYPE_NONE )
		self.IsTouch = true
		-- Check if the player is not already tired or SCP 035.
		if (
		ent:IsPlayer() and
		-- !table.HasValue(self.jobNotAffected, team.GetName( ent:Team() )) and 
		!ent.IsTired and 
		!ent.MaskControl) then
			self:EmitSound("physics/flesh/flesh_impact_bullet"..math.random(1,5)..".wav", 95, 100)
			local PrintTired = {
				[1] = TranslateTranquilizer( "state_sleep_1" ),
				[2] = TranslateTranquilizer( "state_sleep_2" ),
				[3] = TranslateTranquilizer( "state_sleep_3" ),
				[4] = TranslateTranquilizer( "state_sleep_4" ),
			}
			SetSleepPlayer(ent, 60, 60, 4, PrintTired, 1)
			self:SetParent( ent )
			timer.Simple(5, function ()
				self:Remove()
			end)
		else
			timer.Simple(3, function ()
				self:Remove()
			end)
		end
	end
end