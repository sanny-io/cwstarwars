local ITEM = Clockwork.item:New();
ITEM.name = "Spacecraft Pilot Handbook";
ITEM.model = "models/props_lab/binderbluelabel.mdl";
ITEM.business = false;
ITEM.description = "A book that teaches you how to pilot spacecraft.";

function ITEM:OnUse(player)
	Clockwork.attributes:Progress(player, ATB_SPACECRAFT, 100);
end;

ITEM:Register();