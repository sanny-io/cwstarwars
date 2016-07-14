local FACTION = Clockwork.faction:New("Citizen");

FACTION.useFullName = true;
FACTION.whitelist = false;
FACTION.models = {male = {}, female = {
	"models/humans/group02/temale_01.mdl",
	"models/humans/group02/temale_02.mdl",
	"models/humans/group02/temale_07.mdl"
}};

for i = 1, 9 do
	if (i != 2) then
		table.insert(FACTION.models.male, ("models/humans/group02/tale_0%d.mdl"):format(i));
	end;
end;

FACTION_CITIZEN = FACTION:Register();