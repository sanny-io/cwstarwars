local FACTION = Clockwork.faction:New("Galactic Empire");

FACTION.whitelist = true;
FACTION.singleGender = GENDER_MALE;
FACTION.autoRecognise = true;
FACTION.ranks = {
	Trooper = {
		default = true,
		hidden = true,
		position = 4
	},

	Sergeant = {
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
	weapon_752_e11 = 1
};

function FACTION:GetName(player, character)
	return "TK-"..Clockwork.kernel:ZeroNumberToDigits(math.random(1, 9999), 4);
end;

function FACTION:GetModel(player)
	return "models/kriegsyntax/starwars/stormtrooper.mdl";
end;

FACTION_EMPIRE = FACTION:Register();