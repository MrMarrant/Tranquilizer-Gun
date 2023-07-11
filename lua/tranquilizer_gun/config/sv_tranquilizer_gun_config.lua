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

if CLIENT then return end

TRANQUILIZER_GUN_CONFIG.TimeToGetTired = CreateConVar( "time_to_get_tired_tranquilized", 60, {FCVAR_PROTECTED}, "The timer total for a player to be fatigu before sleep in second.", 4, 600 )
TRANQUILIZER_GUN_CONFIG.TimeToSleep = CreateConVar( "time_to_sleep_tranquilized", 60, {FCVAR_PROTECTED}, "The timer total a player sleep when tranquilized in second.", 1, 600 )