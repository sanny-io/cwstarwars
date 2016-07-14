function Schema:Initialize()
	CW_CONVAR_SABERCOLORR = Clockwork.kernel:CreateClientConVar("cwSaberColorR", 0, true, true);
	CW_CONVAR_SABERCOLORG = Clockwork.kernel:CreateClientConVar("cwSaberColorG", 195, true, true);
	CW_CONVAR_SABERCOLORB = Clockwork.kernel:CreateClientConVar("cwSaberColorB", 255, true, true);
	CW_CONVAR_SABERCOLORA = Clockwork.kernel:CreateClientConVar("cwSaberColorA", 255, true, true);

	print("Star Wars "..self:GetVersion().." loaded.");
end;

function Schema:ShouldCharacterMenuBeCreated()
	if (!self.intro.Finished) then
		return false;
	end;
end;

function Schema:ShouldDrawCharacterBackground()
	if (!self.intro.Finished) then
		return false;
	end;
end;

function Schema:ClockworkLoadShared()
	Clockwork:ClockworkLoadShared();
	Clockwork.plugin:Add("StarWars", StarWars);

	function CLOCKWORK_LOGO_PLUGIN:StartIntro()
		surface.PlaySound("buttons/button1.wav");
		self:OpenIntroHTML("http://authx.cloudsixteen.com/data/loading/clockwork.php", 2, Schema.intro.Start);
	end;

	StarWars:Override();

	return false;
end;

function Schema:HUDPaint()
	if (!self.intro.Finished) then
		self.intro:Intro();
	end;
end;

function Schema:KeyPress()
	if (playIntro) then
		self.intro:ResetVariables();
		self.intro.Finished = true;
	end;
end;

function Schema:GetTargetPlayerName(player)
	local rank, rankTable = player:GetFactionRank();

	if (rank and rank != "" and !rankTable.hidden) then
		return rank.." "..player:Name();
	end;
end;