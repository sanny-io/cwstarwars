local CLASS = Clockwork.class:New("MagnaGuard");

CLASS.color = Color(150, 125, 100, 255);
CLASS.factions = {FACTION_CIS};
CLASS.wages = 20;

function CLASS:GetModel(player)
	return "models/npc/magnaguard/magnaguard.mdl";
end;

CLASS_MAGNAGUARD = CLASS:Register();