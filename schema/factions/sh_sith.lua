local FACTION = Clockwork.faction:New("Sith Order");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.singleGender = GENDER_MALE;
FACTION.autoRecognise = true;
FACTION.canWieldLightsaber = true;
FACTION.isDroidFriend = true;
FACTION.ranks = {
	["Acolyte"] = {
		default = true,
		position = 4
	},

	["Adept"] = {
		position = 3
	},

	["Master"] = {
		position = 2
	},

	["Lord"] = {
		position = 1
	},
};

FACTION.models = (
{
	male = (
	{
		"models/endeavorroleplay/swtor/revan/revan_npc.mdl",
		"models/npc/syntheticgaming/characters/savageopress/savageopress.mdl",
		"models/npc/syntheticgaming/characters/sithassassin/sithassassin.mdl",
		"models/npc/kriegsyntax/sw_752/dooku_est.mdl"
	})
})

FACTION_SITH = FACTION:Register();