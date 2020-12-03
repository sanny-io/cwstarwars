local PLUGIN = PLUGIN;
local COMMAND = Clockwork.command:New("MediaResume");

COMMAND.tip = "Resumes the currently paused media.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (PLUGIN.media) then
		PLUGIN.media.paused = nil;
	end;
	
	timer.UnPause("ClockworkMediaTimer");
	Clockwork.datastream:Start(nil, "MediaResume");
end;

COMMAND:Register();