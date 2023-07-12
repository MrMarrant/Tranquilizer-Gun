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

TRANQUILIZER_GUN_CONFIG.LangServer = GetConVar("gmod_language"):GetString()
TRANQUILIZER_GUN_CONFIG.HandledLanguage = {
    "fr",
    "en",
}

-- Get Lang of the server
cvars.AddChangeCallback("gmod_language", function(name, old, new)
    TRANQUILIZER_GUN_CONFIG.LangServer = new
end)

game.AddAmmoType( {
	name = "tranquilizer_flechette",
	dmgtype = DMG_BULLET,
	tracer = TRACER_NONE,
	plydmg = 0,
	npcdmg = 0,
	force = 0,
	minsplash = 0,
	maxsplash = 0
} )

TRANQUILIZER_GUN_CONFIG.jobNotAffected = { ---- Jobs that are not affected by the tranquilizer.
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
	"Soldat Mastodonte",
	"IAA",
	"UIAA",
	"UIAA Lourde",
	"Mastodonte FIM",
	"SDC (spécialiste du confinement)",
	"Soldat Mastodonte",
	"SCP 1370",
	"SCP 073",
	"SCP 006fr",
	"Membre du personnel Process"
}

tranquilizer_gun.LoadLanguage(TRANQUILIZER_GUN_CONFIG.RootFolder.."language/", TRANQUILIZER_GUN_CONFIG.HandledLanguage, TRANQUILIZER_GUN_LANG)
tranquilizer_gun.LoadDirectory(TRANQUILIZER_GUN_CONFIG.RootFolder.."shared/")