local CLASS = Clockwork.class:New("Battle droid Pilot");

CLASS.color = Color(150, 125, 100, 255);
CLASS.factions = {FACTION_CIS};

function CLASS:GetModel(player)
	return "models/sgg/starwars/battledroid_pilot.mdl";
end;

CLASS_DROID_PILOT = CLASS:Register();