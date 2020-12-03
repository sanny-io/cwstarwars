local PLUGIN = PLUGIN;
local COMMAND = Clockwork.command:New("MediaPause");

COMMAND.tip = "Pauses the currently playing media.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (PLUGIN.media) then
		PLUGIN.media.paused = true;
	end;
	
	timer.Pause("ClockworkMediaTimer");
	Clockwork.datastream:Start(nil, "MediaPause");
end;

COMMAND:Register();