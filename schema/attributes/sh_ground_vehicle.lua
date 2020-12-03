local ATTRIBUTE = Clockwork.attribute:New();
	ATTRIBUTE.name = "Ground Vehicle Operator Experience";
	ATTRIBUTE.maximum = 1;
	ATTRIBUTE.uniqueID = "ground_vehicle";
	ATTRIBUTE.description = "Whether or not you're able to operate special ground vehicles.";
	ATTRIBUTE.isOnCharScreen = false;
ATB_GVO = Clockwork.attribute:Register(ATTRIBUTE);