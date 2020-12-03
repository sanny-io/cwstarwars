local PLUGIN = PLUGIN;
local COMMAND = Clockwork.command:New("MediaStop");

COMMAND.tip = "Stops the currently playing media.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	PLUGIN.media = nil;
	timer.Remove("ClockworkMediaTimer");
	Clockwork.datastream:Start(nil, "MediaStop");
end;

COMMAND:Register();