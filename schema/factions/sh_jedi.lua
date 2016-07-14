local FACTION = Clockwork.faction:New("Jedi Order");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.singleGender = GENDER_MALE;
FACTION.autoRecognise = true;
FACTION.canWieldLightsaber = true;
FACTION.ranks = {
	Padawan = {
		default = true,
		position = 4
	},

	Knight = {
		position = 3
	},

	Master = {
		position = 2
	},

	["Grand Master"] = {
		position = 1
	},
};

FACTION.defaultInventory = {
	weapon_lightsaber = 1
};

-- FACTION_JEDI = FACTION:Register();