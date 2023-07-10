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

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Author = "BIBI"
ENT.PrintName= "Fléchette tranquilizante"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "BIBI entities"
ENT.ID = "tranquilizer-dart"

if (SERVER) then
    util.AddNetworkString( "BlurryVision" )
    util.AddNetworkString( "DelayBlurryVision" )
    util.AddNetworkString( "ResetBlurryVision" )
end

if CLIENT then
    net.Receive("BlurryVision", function ( )
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

    net.Receive("DelayBlurryVision", function ( )
        ply = LocalPlayer()
        delay = net.ReadFloat()
        timer.Simple(delay, function()
            if !IsValid(ply) then return end
            ply.BlurryShockTired = false
        end)
    end)

    net.Receive("ResetBlurryVision", function ( )
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

    hook.Add("RenderScreenspaceEffects","RenderScreenspaceEffects.ShockEffectTired",ShockEffectTired)
end

-- Function called to remove an blurry vision on the client side.
function SendResetBlurryVision(victim)
	net.Start("ResetBlurryVision")
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
    SendResetBlurryVision(victim)
end

hook.Add( "PlayerDeath", "PlayerDeath.RemoveTiredEffectGunTranquilizer", RemoveEffectGettingTired )
hook.Add( "PlayerChangedTeam", "PlayerChangedTeam.RemoveTiredEffectGunTranquilizer", RemoveEffectGettingTired )
hook.Add("canSleep", "canSleep.tranquilizer_dart.can_wake_up", function (ply)
	if (ply.Sleeping and (ply.TranquilizedByDart or ply.IsTired)) then return false, "Tu es sous l'effet d'une drogue." end
end)