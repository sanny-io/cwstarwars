local PLUGIN = PLUGIN;
local COMMAND = Clockwork.command:New("MediaPlay");

COMMAND.tip = "Plays the media on all clients.";
COMMAND.text = "<string Link> [number Volume] [number StartTime] [boolean Loop]";
COMMAND.access = "a";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 3;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local url = arguments[1];
	local volume = tonumber(arguments[2]) or 50;
	local time = tonumber(arguments[3]) or 0;
	local loop = tobool(arguments[4]);
	local service = medialib.load("media").guessService(url);

	service:query(url, function(_, data)
		PLUGIN.media = {url = url, volume = volume, time = time, loop = loop};
		Clockwork.datastream:Start(nil, "MediaPlay", PLUGIN.media);

		timer.Create("ClockworkMediaTimer", 1, data.duration, function()
			PLUGIN.media.time = PLUGIN.media.time + 1;
		end);
	end);
end;

COMMAND:Register();