hook.Add( "PostGamemodeLoaded", "TranquilizerGunInitialize", function()

	if SERVER then
		AddCSLuaFile( "languages/language.lua" )
		include( "languages/language.lua" )
	end
end )