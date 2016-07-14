local CLASS = Clockwork.class:New("Clone Trooper");
local rankSkins = {
	Private = 0,
	Sergeant = 2,
	Lieutenant = 1,
	Captain = 5,
	Commander = 3
};

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_REPUBLIC};
CLASS.isDefault = true;

function CLASS:GetModel(player)
	local rank = player:GetCharacterData("factionrank", "Private");

	if (rankSkins[rank]) then
		return "models/sgg/starwars/clonetrooper.mdl", rankSkins[rank];
	end;

	return "models/sgg/starwars/clonetrooper.mdl";
end;

CLASS_CLONE = CLASS:Register();