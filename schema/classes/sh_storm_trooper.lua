local CLASS = Clockwork.class:New("Stormtrooper");
local rankModels = {
	Private = "models/kriegsyntax/starwars/stormtrooper.mdl",
	Sergeant = "models/kriegsyntax/starwars/stormtrooper_med.mdl",
	Captain = "models/kriegsyntax/starwars/stormtrooper_com.mdl",
	Commander = "models/kriegsyntax/starwars/stormtrooper_cap.mdl"
};

CLASS.color = Color(128, 128, 128);
CLASS.factions = {FACTION_EMPIRE};
CLASS.isDefault = true;

function CLASS:GetModel(player)
	local rank = player:GetCharacterData("factionrank", "Private");

	if (rank != "" and rankModels[rank]) then
		return rankModels[rank];
	end;

	return "models/kriegsyntax/starwars/stormtrooper.mdl";
end;

CLASS_STORM = CLASS:Register();