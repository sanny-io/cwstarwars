local CLASS = Clockwork.class:New("Battle droid");
local rankModels = {
	["Private"] = "models/sgg/starwars/battledroid.mdl",
	["Lieutenant"] = "models/sgg/starwars/battledroid_security.mdl",
	["Captain"] = "models/sgg/starwars/battledroid_security.mdl",
	["Commander"] = "models/sgg/starwars/battledroid_commander.mdl"
};

CLASS.color = Color(150, 125, 100, 255);
CLASS.factions = {FACTION_CIS};
CLASS.wages = 20;
CLASS.isDefault = true;

function CLASS:GetModel(player)
	local rank = player:GetCharacterData("factionrank", "Private");

	if (rankModels[rank]) then
		return rankModels[rank];
	end;

	return rankModels.Private;
end;

CLASS_DROID = CLASS:Register();