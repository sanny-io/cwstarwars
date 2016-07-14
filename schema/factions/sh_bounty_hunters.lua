local FACTION = Clockwork.faction:New("Bounty Hunters");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.singleGender = GENDER_MALE;
FACTION.models = {
	male = (
	{
		"models/endeavorroleplay/swtor/mandalorian/mandalorian_npc.mdl",
		"models/endeavorroleplay/swtor/triumvirate/triumvirate_npc.mdl",
		"models/endeavorroleplay/swtor/imperial/imperial_npc.mdl",
		"models/endeavorroleplay/swtor/bh_underworld/underworld_npc.mdl",
		"models/endeavorroleplay/swtor/bh_arkanian/arkanian_npc.mdl"
	})
}

FACTION.defaultInventory = {
	weapon_752_kyd21 = 1
};

FACTION_HUNTERS = FACTION:Register();