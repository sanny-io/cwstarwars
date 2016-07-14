local FACTION = Clockwork.faction:New("Grand Army of the Republic");

FACTION.whitelist = true;
FACTION.singleGender = GENDER_MALE;
FACTION.autoRecognise = true;
FACTION.ranks = {
	Trooper = {
		default = true,
		hidden = true,
		position = 5
	},

	Sergeant = {
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
	weapon_752_dc15a = 1
};

function FACTION:GetName(player, character)
	return "CT-"..Clockwork.kernel:ZeroNumberToDigits(math.random(1, 9999), 4);
end;

function FACTION:GetModel(player)
	return "models/sgg/starwars/clonetrooper.mdl";
end;

FACTION_REPUBLIC = FACTION:Register();