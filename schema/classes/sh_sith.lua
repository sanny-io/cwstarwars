local CLASS = Clockwork.class:New("Sith");

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_SITH};
CLASS.isDefault = true;

function CLASS:GetModel(player)
	return "models/endeavorroleplay/swtor/revan/revan_npc.mdl";
end;

CLASS_SITH = CLASS:Register();