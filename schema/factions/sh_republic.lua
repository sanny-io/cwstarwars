local FACTION = Clockwork.faction:New("Grand Army of the Republic");

FACTION.whitelist = false;
FACTION.singleGender = GENDER_MALE;
FACTION.autoRecognise = true;
FACTION.radio = true;
FACTION.ranks = {
	["Cadet"] = {
		default = true,
		short = "Cdt",
		position = 14
	},

	["Private"] = {
		position = 13,
		short = "Pvt",
	},

	["Private First Class"] = {
		position = 12,
		short = "PfC",
	},


	["Lance Corporal"] = {
		position = 11,
		short = "LCpl",
	},

	["Corporal"] = {
		position = 10,
		short = "Cpl",
	},

	["Sergeant"] = {
		position = 9,
		short = "Sgt",
		canPromote = 10
	},

	["Master Sergeant"] = {
		position = 8,
		short = "MSgt",
		canPromote = 10
	},

	["Sergeant Major"] = {
		position = 7,
		short = "SgtMaj",
		canPromote = 10
	},

	["Second Lieutenant"] = {
		position = 6,
		short = "2Lt",
		canPromote = 8
	},

	["Lieutenant"] = {
		position = 5,
		short = "Lt",
		canPromote = 6
	},

	["Captain"] = {
		position = 4,
		short = "Cpt",
		canPromote = 5
	},

	["Major"] = {
		position = 3,
		short = "Mjr",
		canPromote = 4
	},

	["Battalion Commander"] = {
		position = 2,
		short = "BCmdr",
		canPromote = 3
	},

	["Marshal Commander"] = {
		position = 1,
		short = "MCmdr",
		canPromote = 2
	},

	["Pilot Officer"] = {
		position = -1,
		short = "PO",
	},

	["Flight Officer"] = {
		position = -2,
		short = "FO",
	},

	["Flight Lieutenant"] = {
		position = -3,
		short = "FLt",
	},

	["Wing Commander"] = {
		position = -4,
		short = "WCmdr",
	},
};

--[[FACTION.defaultInventory = {
	weapon_752_dc15a = 1
};]]

function FACTION:GetName(player, info, data)
	return "CT-"..Clockwork.kernel:ZeroNumberToDigits(math.random(1, 9999), 4);
end;

function FACTION:GetModel(player)
	return "models/sgg/starwars/clonetrooper.mdl";
end;

FACTION_REPUBLIC = FACTION:Register();