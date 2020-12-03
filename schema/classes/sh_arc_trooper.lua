local CLASS = Clockwork.class:New("ARC Trooper");
local rankModels = {
	["Second Lieutenant"] = "models/sgg/starwars/clonetrooper_arc_soldier.mdl",
	["Lieutenant"] = "models/sgg/starwars/clonetrooper_arc_soldier.mdl",
	["Captain"] = "models/sgg/starwars/clonetrooper_arc_captain.mdl",
	["Major"] = "models/sgg/starwars/clonetrooper_arc_captain.mdl",
	["Battalion Commander"] = "models/sgg/starwars/clonetrooper_arc_commander.mdl",
	["Marshal Commander"] = "models/sgg/starwars/clonetrooper_arc_commander.mdl",
};

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_REPUBLIC};
CLASS.wages = 20;
CLASS.hasJetpack = true;
CLASS.scoreboard = "Grand Army of the Republic";

function CLASS:GetModel(player)
	local rank = player:GetCharacterData("factionrank", "Lieutenant");

	if (rank != "" and rankModels[rank]) then
		return rankModels[rank];
	end;

	return "models/sgg/starwars/clonetrooper_arc_soldier.mdl";
end;

CLASS_ARC_TROOPER = CLASS:Register();