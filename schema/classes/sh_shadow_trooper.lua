local CLASS = Clockwork.class:New("Shadow Trooper");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_EMPIRE};

function CLASS:GetModel(player)
	return "models/kriegsyntax/starwars/shadowtrooper.mdl";
end;

CLASS_SHADOW = CLASS:Register();