local CLASS = Clockwork.class:New("Sand Trooper");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_EMPIRE};

function CLASS:GetModel(player)
	return "models/kriegsyntax/starwars/sandtrooper.mdl";
end;

CLASS_SAND = CLASS:Register();