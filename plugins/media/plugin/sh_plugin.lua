local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("sh_medialib.lua");

if (SERVER) then
	function PLUGIN:PlayerInitialSpawn(player)
		if (self.media) then
			Clockwork.datastream:Start(player, "MediaPlay", self.media);
		end;
	end;
else
	Clockwork.datastream:Hook("MediaPlay", function(data)
		if (IsValid(PLUGIN.media)) then
			PLUGIN.media:stop();
		end;

		PLUGIN.media = medialib.load("media").guessService(data.url):load(data.url);
		PLUGIN.media:seek(data.time);
		PLUGIN.media:setQuality("medium");

		PLUGIN.media:on("error", function(id, description)
			Clockwork.kernel:AddTopHint(description, 5, Color(255, 0, 0));
		end);

		PLUGIN.media:on("ended", function(stopped)
			if (!stopped and data.loop) then
				PLUGIN.media:seek(0);
				PLUGIN.media:play();
			end;
		end);

		if (!data.paused) then
			PLUGIN.media:play();
		end;

		if (data.volume) then
			PLUGIN.media:setVolume(data.volume);
		end;
	end);

	Clockwork.datastream:Hook("MediaStop", function()
		if (IsValid(PLUGIN.media)) then
			PLUGIN.media:stop();
		end;
	end);

	Clockwork.datastream:Hook("MediaPause", function()
		if (IsValid(PLUGIN.media)) then
			PLUGIN.media:pause();
		end;
	end);

	Clockwork.datastream:Hook("MediaResume", function()
		if (IsValid(PLUGIN.media)) then
			PLUGIN.media:play();
		end;
	end);

	Clockwork.datastream:Hook("MediaVolume", function(data)
		if (IsValid(PLUGIN.media)) then
			PLUGIN.media:setVolume(data);
		end;
	end);
end;