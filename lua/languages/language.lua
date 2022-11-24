LANGUAGE_TRANQUILIZER = {}
local HandledLanguage = {
    "fr",
    "en"
}
-- Get the current language of the user
local langUser = GetConVar("gmod_language"):GetString()
cvars.AddChangeCallback("gmod_language", function(name, old, new)
    langUser = new
end)
if (langUser) then
    if !table.HasValue(HandledLanguage, langUser) then
        langUser = "en"
    end
else
    langUser = "en"
end

include( "languages/" .. langUser .. ".lua" )
if SERVER then AddCSLuaFile( "languages/" .. langUser .. ".lua" ) end

assert( LANGUAGE_TRANQUILIZER, "[Tranquilizer Gun] Language not found" )

function TranslateTranquilizer( trans, ... )
	return string.format( LANGUAGE_TRANQUILIZER[ trans ] or trans, ... )
end