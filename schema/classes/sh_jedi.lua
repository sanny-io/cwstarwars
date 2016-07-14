local CLASS = Clockwork.class:New("Jedi");

CLASS.color = Color(88, 50, 0);
CLASS.factions = {FACTION_JEDI};
CLASS.isDefault = true;

function CLASS:GetModel(player)
	return "models/endeavorroleplay/swtor/revan/revan_npc.mdl";
end;

CLASS_JEDI = CLASS:Register();