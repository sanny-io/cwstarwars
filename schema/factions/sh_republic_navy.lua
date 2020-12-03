local FACTION = Clockwork.faction:New("Republic Navy");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.autoRecognise = true;
FACTION.models = {male = {}, female = {}};
FACTION.ranks = {
	["Petty Officer"] = {
		default = true,
		position = 9,
		short = "PtO"
	},

	["Ensign"] = {
		position = 8,
		short = "Ens"
	},

	["Sub-Lieutenant"] = {
		position = 7,
		short = "SbLt"
	},

	["Lieutenant"] = {
		position = 6,
		canPromote = 8,
		short = "Lt"
	},

	["Lieutenant Commander"] = {
		position = 5,
		canPromote = 6,
		short = "LtCmdr"
	},

	["Commander"] = {
		position = 4,
		canPromote = 5,
		short = "Cmdr"
	},

	["Captain"] = {
		position = 3,
		canPromote = 4,
		short = "Cpt"
	},

	["Commodore"] = {
		position = 2,
		canPromote = 3,
		short = "Cmdre"
	},

	["Admiral"] = {
		position = 1,
		canPromote = 2,
		short = "Adm"
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

FACTION_REPUBLIC_NAVY = FACTION:Register();