local CLASS = Clockwork.class:New("Commander Bacara");

CLASS.access = "s";
CLASS.color = Color(128, 128, 128);
CLASS.factions = {};

function CLASS:GetModel(player)
	return "models/sgg/starwars/clonetrooper_bacara.mdl";
end;

function CLASS:HasObjectAccess(player, bHasAccess)
	return bHasAccess and player:GetFaction() == FACTION_REPUBLIC;
end;

CLASS_BACARA = CLASS:Register();