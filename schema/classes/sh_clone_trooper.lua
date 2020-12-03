local CLASS = Clockwork.class:New("Clone Trooper");
local rankSkins = {
	["Cadet"] = 0,
	["Private"] = 0,
	["Private First Class"] = 0,
	["Lance Corporal"] = 0,
	["Corporal"] = 0,
	["Sergeant"] = 2,
	["Master Sergeant"] = 2,
	["Sergeant Major"] = 2,
	["Second Lieutenant"] = 1,
	["Lieutenant"] = 1,
	["Captain"] = 5,
	["Major"] = 5,
	["Battalion Commander"] = 6,
	["Marshal Commander"] = 6,
};

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_REPUBLIC};
CLASS.wages = 20;
CLASS.isDefault = true;
CLASS.scoreboard = "Grand Army of the Republic";

function CLASS:GetModel(player, default, data)
	local rank = data and data.factionrank or player:GetCharacterData("factionrank", "Cadet");

	if (rankSkins[rank]) then
		return "models/sgg/starwars/clonetrooper.mdl", rankSkins[rank];
	end;

	return "models/sgg/starwars/clonetrooper.mdl";
end;

CLASS_CLONE = CLASS:Register();