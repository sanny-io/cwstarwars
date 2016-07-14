local CLASS = Clockwork.class:New("Imperial Officer");
local rankModels = {
	Ensign = "models/kriegsyntax/starwars/ensign.mdl",
	Lieutenant = "models/kriegsyntax/starwars/lieutenant.mdl",
	Captain = "models/kriegsyntax/starwars/captain.mdl",
	Commodore = "models/kriegsyntax/starwars/commodore.mdl",
	Admiral = "models/kriegsyntax/starwars/admiral.mdl",
	["Grand Admiral"] = "models/kriegsyntax/starwars/grandadmiral.mdl",
	General = "models/kriegsyntax/starwars/general.mdl"
};

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_CABINET};
CLASS.isDefault = true;

function CLASS:GetModel(player, character)
	local rank = player:GetCharacterData("factionrank", "Ensign");

	if (rank != "" and rankModels[rank]) then
		return rankModels[rank];
	end;

	return "models/kriegsyntax/starwars/ensign.mdl";
end;

CLASS_OFFICER = CLASS:Register();