hook.Add( "PostGamemodeLoaded", "TranquilizerGunInitialize", function()

	if SERVER then
		--! TODO : Vérifier si j'ai pas merdé ça
		AddCSLuaFile( "languages/language.lua" )
		include( "languages/language.lua" )
	end
end )