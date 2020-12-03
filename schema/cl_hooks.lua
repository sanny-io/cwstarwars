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

function Schema:ScoreboardAdjustPlayerInfo(info)
	if (info.doesRecognise or Clockwork.faction:FindByID(info.faction).autoRecognise) then
		local rank, rankTable = info.player:GetFactionRank();
		local nickName = info.player:GetSharedVar("NickName");

		if (rank and rank != "" and !rankTable.hidden) then
			if (rankTable.short) then
				info.name = ("%s. %s"):format(rankTable.short, info.name);
			else
				info.name = ("%s %s"):format(rank, info.name);
			end;
		end;

		if (nickName and nickName != "") then
			info.name = ("%s '%s'"):format(info.name, nickName);
		end;
	end;
end;

--[[function Schema:ScoreboardSortClassPlayers(class, a, b)

end;]]

function Schema:GetCharacterPanelSequence(entity, character)
	if (character.skin) then
		entity:SetSkin(character.skin);
	end;
end;

function Schema:ClockworkLoadShared()
	Clockwork:ClockworkLoadShared();
	Clockwork.plugin:Add("StarWars", StarWars);

	function CLOCKWORK_LOGO_PLUGIN:StartIntro()
		surface.PlaySound("buttons/button1.wav");
		self:OpenIntroHTML("http://authx.cloudsixteen.com/data/loading/clockwork.php", 6, Schema.intro.Start);
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

function Schema:ChatBoxAdjustInfo(info)
	if (IsValid(info.speaker)) then
		local rank, rankTable = info.speaker:GetFactionRank();
		local nickName = info.speaker:GetSharedVar("NickName");

		if (!info.unrecognised) then
			if (rank and rank != "" and rankTable.short and !rankTable.hidden) then
				info.name = ("%s. %s"):format(rankTable.short, info.name);
			end;

			if (nickName and nickName != "") then
				info.name = ("%s '%s'"):format(info.name, nickName);
			end;
		end;
	end;
end;

function Schema:GetTargetPlayerName(player)
	local rank, rankTable = player:GetFactionRank();
	local name = player:Name();
	local nickName = player:GetSharedVar("NickName");

	if (rank and rank != "" and !rankTable.hidden) then
		if (rankTable.short) then
			name = ("%s. %s"):format(rankTable.short, name);
		else
			name = ("%s %s"):format(rank, name);
		end;
	end;

	if (nickName and nickName != "") then
		name = ("%s '%s'"):format(name, nickName);
	end;

	return name;
end;