local PLUGIN = PLUGIN;
local COMMAND = Clockwork.command:New("MediaVolume");

COMMAND.tip = "Adjusts the volume of the currently playing media. Use 1 to 100.";
COMMAND.text = "<number Volume>";
COMMAND.access = "a";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local volume = tonumber(arguments[1]);

	if (volume) then
		if (PLUGIN.media) then
			volume = math.Clamp(volume, 0, 100) / 100;
			PLUGIN.media.volume = volume;
		end;
	else
		player:Notify(arguments[1].. " is not a valid number.");
	end;
end;

COMMAND:Register();