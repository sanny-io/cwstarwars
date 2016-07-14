local CLASS = Clockwork.class:New("Clone Marine");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_REPUBLIC};

function CLASS:GetModel(player)
	return "models/sgg/starwars/clonetrooper_marine.mdl";
end;

CLASS_MARINE = CLASS:Register();