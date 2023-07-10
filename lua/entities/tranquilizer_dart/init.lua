-- Tranquilizer Gun, A representation of a tranquilizer gun on the game Garry's Mod.
-- Copyright (C) 2023  MrMarrant aka BIBI.

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
						victim:Say("/me "..tranquilizer_gun.TranslateLanguage(TRANQUILIZER_GUN_CONFIG, "woke_up" ))
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
		ent:IsPlayer() and
		-- !table.HasValue(self.jobNotAffected, team.GetName( ent:Team() )) and 
		!ent.IsTired and 
		!ent.MaskControl) then
			self:EmitSound("physics/flesh/flesh_impact_bullet"..math.random(1,5)..".wav", 95, 100)
			local PrintTired = {
				[1] = tranquilizer_gun.TranslateLanguage(TRANQUILIZER_GUN_CONFIG, "state_sleep_1" ),
				[2] = tranquilizer_gun.TranslateLanguage(TRANQUILIZER_GUN_CONFIG, "state_sleep_2" ),
				[3] = tranquilizer_gun.TranslateLanguage(TRANQUILIZER_GUN_CONFIG, "state_sleep_3" ),
				[4] = tranquilizer_gun.TranslateLanguage(TRANQUILIZER_GUN_CONFIG, "state_sleep_4" ),
			}
			SetSleepPlayer(ent, TRANQUILIZER_GUN_CONFIG.TimeToGetTired, TRANQUILIZER_GUN_CONFIG.TimeToSleep, 4, PrintTired, 1)
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