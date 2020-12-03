local FACTION = Clockwork.faction:New("Jedi Order");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.autoRecognise = true;
FACTION.canWieldLightsaber = true;
FACTION.ranks = {
	["Padawan"] = {
		default = true,
		position = 4
	},

	["Knight"] = {
		position = 3
	},

	["Master"] = {
		position = 2
	},

	["Grand Master"] = {
		position = 1
	},
};

FACTION.models = (
{
	female = (
	{
		"models/npc/hgn/swrp/swrp/jedi_shaak_ti_sexy.mdl",
		"models/npc/syntheticgaming/characters/marajade/marajade.mdl",
		"models/npc/jazzmcfly/jka/ashoka/jka_ashoka.mdl"
	}),

	male = (
	{
		"models/npc/hgn/swrp/swrp/jedi_kyle_katarn.mdl",
		"models/npc/hostile/kriegsyntax/sw_752/anakin_est.mdl",
		"models/npc/hostile/kriegsyntax/sw_752/plokoon_est.mdl",
		"models/npc/hostile/kriegsyntax/sw_752/obiwan_est.mdl",
		"models/npc/hostile/ryan7259/mace_windu/mace_windu.mdl",
		"models/npc/grealms/characters/kitfisto/fisto.mdl",
		"models/npc/cultist_kun/sw/coleman.mdl",
		"models/npc/cultist_kun/sw/mm.mdl",
		"models/npc/cultist_kun/sw/yarael_poof.mdl",
		"models/npc/cultist_kun/sw/saesee_tiin.mdl",
		"models/npc/syntheticgaming/characters/quinlanvos/quinlanvos.mdl",
		"models/npc/jazzmcfly/jka/quigon/quigon.mdl",
		"models/npc/jazzmcfly/jka/jtg/jtg.mdl",
	})
})

FACTION_JEDI = FACTION:Register();