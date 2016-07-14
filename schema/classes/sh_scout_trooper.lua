local CLASS = Clockwork.class:New("Scout Trooper");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_EMPIRE};

function CLASS:GetModel(player)
	return "models/kriegsyntax/starwars/scouttrooper.mdl";
end;

CLASS_SCOUT = CLASS:Register();