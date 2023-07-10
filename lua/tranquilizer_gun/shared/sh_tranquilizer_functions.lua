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

/*
* Returns the element to be translated according to the server language.
* @table langData Array containing all translations.
* @string name Element to translate.
*/
function tranquilizer_gun.TranslateLanguage(langData, name)
    local langUsed = TRANQUILIZER_GUN_CONFIG.LangServer
    if not langData[langUsed] then
        langUsed = "en" -- Default lang is EN.
    end
    return string.format( langData[langUsed][ name ] or "Not Found" )
end