local FACTION = Clockwork.faction:New("Imperial Cabinet");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.singleGender = GENDER_MALE;
FACTION.autoRecognise = true;
FACTION.ranks = {
	Ensign = {
		default = true,
		position = 7
	},

	Lieutenant = {
		position = 6
	},

	Captain = {
		position = 5
	},

	Commodore = {
		position = 4
	},

	Admiral = {
		position = 3,
	},

	["Grand Admiral"] = {
		position = 2
	},

	General = {
		position = 1
	},
};

function FACTION:GetModel(player)
	return "models/kriegsyntax/starwars/ensign.mdl";
end;

FACTION_CABINET = FACTION:Register();