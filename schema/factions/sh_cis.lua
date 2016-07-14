local FACTION = Clockwork.faction:New("Confederacy of Independent Systems");

FACTION.whitelist = true;
FACTION.singleGender = GENDER_MALE;
FACTION.autoRecognise = true;
FACTION.ranks = {
	Droid = {
		default = true,
		hidden = true,
		position = 4
	},

	Lieutenant = {
		position = 3
	},

	Captain = {
		position = 2
	},

	Commander = {
		position = 1
	},
};

FACTION.defaultInventory = {
	weapon_752_e5 = 1
};

function FACTION:GetName(player, character)
	return "BD-"..Clockwork.kernel:ZeroNumberToDigits(math.random(1, 9999), 4);
end;

function FACTION:GetModel(player)
	return "models/sgg/starwars/battledroid.mdl";
end;

FACTION_CIS = FACTION:Register();