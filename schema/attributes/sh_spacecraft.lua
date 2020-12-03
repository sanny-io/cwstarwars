local ATTRIBUTE = Clockwork.attribute:New();
	ATTRIBUTE.name = "Spacecraft Pilot Experience";
	ATTRIBUTE.maximum = 1;
	ATTRIBUTE.uniqueID = "spacecraft";
	ATTRIBUTE.description = "Whether or not you're able to pilot spacecraft.";
	ATTRIBUTE.isOnCharScreen = false;
ATB_SPACECRAFT = Clockwork.attribute:Register(ATTRIBUTE);