local CLASS = Clockwork.class:New("Imperial Guard Stormtrooper");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_EMPIRE};

function CLASS:GetModel(player)
	return "models/kriegsyntax/starwars/rgstormtrooper.mdl";
end;

CLASS_STORM_GUARD = CLASS:Register();