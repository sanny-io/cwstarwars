local CLASS = Clockwork.class:New("ARC Trooper");
local rankModels = {
	Lieutenant = "models/sgg/starwars/clonetrooper_arc_soldier.mdl",
	Captain = "models/sgg/starwars/clonetrooper_arc_captain.mdl",
	Commander = "models/sgg/starwars/clonetrooper_arc_commander.mdl"
};

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_REPUBLIC};
CLASS.hasJetpack = true;

function CLASS:GetModel(player)
	local rank = player:GetCharacterData("factionrank", "Lieutenant");

	if (rank != "" and rankModels[rank]) then
		return rankModels[rank];
	end;

	return "models/sgg/starwars/clonetrooper_arc_soldier.mdl";
end;

CLASS_ARC_TROOPER = CLASS:Register();