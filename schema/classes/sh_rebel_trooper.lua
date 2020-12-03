local CLASS = Clockwork.class:New("Rebel Trooper");

CLASS.color = Color(41, 103, 144);
CLASS.factions = {FACTION_REBELLION};

function CLASS:GetModel(player, model)
	local rank = player:GetCharacterData("factionrank", "Trooper");
	model = model:match("male_0(%d)");

	if (rank == "Captain") then
		return ("models/sgg/starwars/rebels/r_trooper_captain/male_0%d.mdl"):format(model);
	else
		return ("models/sgg/starwars/rebels/r_trooper/male_0%d.mdl"):format(model);
	end;
end;

CLASS_REBEL = CLASS:Register();