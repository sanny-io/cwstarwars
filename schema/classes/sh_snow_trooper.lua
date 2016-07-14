local CLASS = Clockwork.class:New("Snow Trooper");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_EMPIRE};

function CLASS:GetModel(player)
	return "models/kriegsyntax/starwars/snowtrooper.mdl";
end;

CLASS_SNOW = CLASS:Register();