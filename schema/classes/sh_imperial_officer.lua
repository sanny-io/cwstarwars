local CLASS = Clockwork.class:New("Imperial Officer");
local rankSkins = {
	["Ensign"] = 0,
	["Lieutenant"] = 0,
	["Captain"] = 1,
	["Commodore"] = 1,
	["Admiral"] = 2,
	["Grand Admiral"] = 2,
	["General"] = 2,
};

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_IMPERIAL_NAVY};
CLASS.isDefault = true;

function CLASS:GetModel(player, default)
	local rank = player:GetCharacterData("factionrank", "Ensign");

	return default, rankSkins[rank];
end;

CLASS_IMPERIAL_OFFICER = CLASS:Register();