local FACTION = Clockwork.faction:New("Imperial Navy");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.autoRecognise = true;
FACTION.models = {male = {}, female = {}};
FACTION.ranks = {
	["Ensign"] = {
		default = true,
		position = 7
	},

	["Lieutenant"] = {
		position = 6
	},

	["Captain"] = {
		position = 5
	},

	["Commodore"] = {
		position = 4
	},

	["Admiral"] = {
		position = 3,
	},

	["Grand Admiral"] = {
		position = 2
	},

	["General"] = {
		position = 1
	},
};

FACTION.defaultInventory = {
	handheld_radio = 1
};

for i = 1, 9 do
	local model = ("models/npc/lt_c/sci_fi/humans/male_0%d.mdl"):format(i);

	Clockwork.animation:AddMaleHumanModel(model);
	table.insert(FACTION.models.male, model);
end;

for i = 1, 7 do
	if (i != 5) then
		local model = ("models/npc/lt_c/sci_fi/humans/female_0%d.mdl"):format(i);

		Clockwork.animation:AddFemaleHumanModel(model);
		table.insert(FACTION.models.female, model);
	end
end;

--[[function FACTION:GetModel(player)
	return "models/kriegsyntax/starwars/ensign.mdl";
end;]]

FACTION_IMPERIAL_NAVY = FACTION:Register();