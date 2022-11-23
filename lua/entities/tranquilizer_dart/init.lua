AddCSLuaFile("shared.lua")

include("shared.lua")

local BlurryVisionTired = "BlurryVisionTired"
local DelayBlurryVision = "DelayBlurryVision"
local ResetBlurryVisionTired = "ResetBlurryVisionTired"

util.AddNetworkString( BlurryVisionTired )
util.AddNetworkString( DelayBlurryVision )
util.AddNetworkString( ResetBlurryVisionTired )

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
		net.Start(BlurryVisionTired)
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
						victim:Say("/me "..BIBI.Translate( "woke_up" ))
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
	--! TODO : A virer ou à remplacer par une ConVar avec possibilité de le modifier dans le menu des props (Non utilisé pour le moment)
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
		-- !table.HasValue(self.jobNotAffected, team.GetName( ent:Team() )) and 
		!ent.IsTired and 
		!ent.MaskControl) then
			self:EmitSound("physics/flesh/flesh_impact_bullet"..math.random(1,5)..".wav", 95, 100)
			local PrintTired = {
				[1] = BIBI.Translate( "state_sleep_1" ),
				[2] = BIBI.Translate( "state_sleep_2" ),
				[3] = BIBI.Translate( "state_sleep_3" ),
				[4] = BIBI.Translate( "state_sleep_4" ),
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

if CLIENT then
    net.Receive(BlurryVisionTired, function ( )
        ply = LocalPlayer()
        tableData = net.ReadTable()
        ply.Step = tableData[1]
        ply.Index = tableData[2]
        if (tableData[1] == tableData[2]) then
            ply.BlurryShockTired = false
            ply.Step = nil
            ply.Index = nil
        else
            ply.BlurryShockTired = true
        end
    end)

    net.Receive(DelayBlurryVision, function ( )
        ply = LocalPlayer()
        delay = net.ReadFloat()
        timer.Simple(delay, function()
            if !IsValid(ply) then return end
            ply.BlurryShockTired = false
        end)
    end)

    net.Receive(ResetBlurryVisionTired, function ( )
        Check = net.ReadBool()
        local ply = LocalPlayer()
        if (Check and ply.BlurryShockTired) then
            ply.BlurryShockTired = nil
        end
    end)
    
    function ShockEffectTired()
        local ply = LocalPlayer()
        local curTime = FrameTime()
        if !ply.AddAlpha then ply.AddAlpha = 1 end
        if !ply.DrawAlpha then ply.DrawAlpha = 0 end
        if !ply.Delay then ply.Delay = 0 end
            
        if ply.BlurryShockTired then 
            ply.AddAlpha = 0.2 * ply.Index / ply.Step
            ply.DrawAlpha = 0.99 * ply.Index / ply.Step
            ply.Delay = 0.05 * ply.Index / ply.Step
        else
            ply.AddAlpha = math.Clamp(ply.AddAlpha + curTime * 0.4, 0.2, 1)
            ply.DrawAlpha = math.Clamp(ply.DrawAlpha - curTime * 0.4, 0, 0.99)
            ply.Delay = math.Clamp(ply.Delay - curTime * 0.4, 0, 0.05)
        end
        
        DrawMotionBlur( ply.AddAlpha, ply.DrawAlpha, ply.Delay )
    end

    hook.Add("RenderScreenspaceEffects","ShockEffectTired",ShockEffectTired)
end

-- Function called to remove an blurry vision on the client side.
function SendResetBlurryVisionTired(victim)
	net.Start(ResetBlurryVisionTired)
	net.WriteBool(true)
	net.Send(victim)
end

-- Function called to remove all effect on death or changed team
function RemoveEffectGettingTired(victim)
    if timer.Exists("getting_tired_"..victim:SteamID()) then
        timer.Remove("getting_tired_"..victim:SteamID())
    end
    if timer.Exists("getting_sleepy_"..victim:SteamID()) then
        timer.Remove("getting_sleepy_"..victim:SteamID())
	end
    victim.IsTired = false
    SendResetBlurryVisionTired(victim)
end

hook.Add( "PlayerDeath", "PlayerDeath.RemoveTiredEffectGunTranquilizer", RemoveEffectGettingTired )
hook.Add( "PlayerChangedTeam", "PlayerChangedTeam.RemoveTiredEffectGunTranquilizer", RemoveEffectGettingTired )
hook.Add("canSleep", "canSleep.tranquilizer_dart.can_wake_up", function (ply)
	if (ply.Sleeping and (ply.TranquilizedByDart or ply.IsTired)) then return false, "Tu es sous l'effet d'une drogue." end
end)