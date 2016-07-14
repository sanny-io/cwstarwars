local CLASS = Clockwork.class:New("Nova Trooper");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_EMPIRE};

function CLASS:GetModel(player)
	return "models/kriegsyntax/starwars/novatrooper.mdl";
end;

CLASS_NOVA = CLASS:Register();