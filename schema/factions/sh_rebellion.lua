local FACTION = Clockwork.faction:New("Rebel Alliance");

FACTION.whitelist = true;
FACTION.singleGender = GENDER_MALE;
FACTION.useFullName = true;
FACTION.ranks = {
	Trooper = {
		default = true,
		position = 2
	},

	Captain = {
		position = 1
	},
};

FACTION.models = {male = {}};

FACTION.defaultInventory = {
	weapon_752_dc15s = 1	
};

for i = 1, 9 do
	table.insert(FACTION.models.male, ("models/sgg/starwars/rebels/r_trooper/male_0%d.mdl"):format(i));
end;

FACTION_REBELLION = FACTION:Register();