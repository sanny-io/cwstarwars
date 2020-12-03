local CLASS = Clockwork.class:New("Commander Bacara");

CLASS.access = "s";
CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_REPUBLIC};
CLASS.wages = 20;
CLASS.scoreboard = "Grand Army of the Republic";

function CLASS:GetModel(player)
	return "models/sgg/starwars/clonetrooper_bacara.mdl";
end;

function CLASS:HasObjectAccess(player, bHasAccess)
	return bHasAccess and player:GetFaction() == FACTION_REPUBLIC;
end;

CLASS_BACARA = CLASS:Register();