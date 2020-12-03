local CLASS = Clockwork.class:New("Republic Officer");
local rankSkins = {
	["Petty Officer"] = 0,
	["Ensign"] = 0,
	["Sub-Lieutenant"] = 0,
	["Lieutenant"] = 1,
	["Lieutenant Commander"] = 1,
	["Commander"] = 2,
	["Captain"] = 2,
	["Commodore"] = 2,
	["Admiral"] = 2,
};

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_REPUBLIC_NAVY};
CLASS.isDefault = true;
CLASS.scoreboard = "Republic Navy";

function CLASS:GetModel(player, default)
	local rank = player:GetCharacterData("factionrank", "Petty Officer");

	return default, rankSkins[rank];
end;

CLASS_REPUBLIC_OFFICER = CLASS:Register();