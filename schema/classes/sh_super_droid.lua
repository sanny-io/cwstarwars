local CLASS = Clockwork.class:New("Super battle droid");

CLASS.color = Color(150, 125, 100, 255);
CLASS.factions = {FACTION_CIS};
CLASS.wages = 20;

function CLASS:GetModel(player)
	return "models/npc/super_droid/super_droid.mdl";
end;

CLASS_SUPER_DROID = CLASS:Register();