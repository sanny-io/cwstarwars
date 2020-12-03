local ITEM = Clockwork.item:New();
ITEM.name = "Ground Vehicle Operator Handbook";
ITEM.model = "models/props_lab/bindergreenlabel.mdl";
ITEM.business = false;
ITEM.description = "A book that teaches you how to operate special ground vehicles.";

function ITEM:OnUse(player)
	Clockwork.attributes:Progress(player, ATB_GVO, 100);
end;

ITEM:Register();