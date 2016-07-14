local CLASS = Clockwork.class:New("TIE Pilot");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_EMPIRE};

function CLASS:GetModel(player)
	return "models/sgg/starwars/tie_pilot.mdl", 3;
end;

CLASS_TIE_PILOT = CLASS:Register();