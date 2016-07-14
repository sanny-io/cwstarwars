local CLASS = Clockwork.class:New("Clone Pilot");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_REPUBLIC};

function CLASS:GetModel(player)
	return "models/sgg/starwars/clonetrooper_pilot.mdl";
end;

CLASS_CLONE_PILOT = CLASS:Register();