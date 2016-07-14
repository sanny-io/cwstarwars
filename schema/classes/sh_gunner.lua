local CLASS = Clockwork.class:New("Imperial Gunner");

CLASS.color = Color(150, 125, 100, 255);
CLASS.factions = {FACTION_EMPIRE};

function CLASS:GetModel(player)
	return "models/kriegsyntax/starwars/gunner.mdl";
end;

CLASS_GUNNER = CLASS:Register();