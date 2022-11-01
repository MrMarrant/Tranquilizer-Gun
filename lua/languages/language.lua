LANGUAGE = {}
BIBI = {}
HandledLanguage = {
    "fr",
    "en"
}
-- Get the current language of the user
langUser = GetConVar("gmod_language"):GetString()
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

assert( LANGUAGE, "[Tranquilizer Gun] Language not found" )

function BIBI.Translate( trans, ... )
	return string.format( LANGUAGE[ trans ] or trans, ... )
end