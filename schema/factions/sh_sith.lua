local FACTION = Clockwork.faction:New("Sith Order");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.singleGender = GENDER_MALE;
FACTION.autoRecognise = true;
FACTION.canWieldLightsaber = true;
FACTION.ranks = {
	Acolyte = {
		default = true,
		position = 4
	},

	Adept = {
		position = 3
	},

	Master = {
		position = 2
	},

	Lord = {
		position = 1
	},
};

FACTION.defaultInventory = {
	weapon_lightsaber = 1
};

function FACTION:GetModel(player)
	return "models/endeavorroleplay/swtor/revan/revan_npc.mdl";
end;

FACTION_SITH = FACTION:Register();