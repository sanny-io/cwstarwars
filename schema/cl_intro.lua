--[[
	Made by NightAngel.
--]]

Schema.intro = {};

local episodeText = "CW: Star Wars";
local titleText = "Dank Memes Awaken";
local paragraphs = {
	{
		"It    is    a   time  of   great   peril.", 
		"Shitty	   memes  and   ERP   have   ravaged",
		"the    Clockwork    community.  Our   hero,",
		"duck,  fights  off  the  remaining   ERPers",
		"with a new schema. Through   the   combined",
		"effort of duck and  NightAngel, it    looks",
		"like  there may be hope for the roleplaying",
		"community afterall."
	},
};

playIntro = playIntro or nil;
longTimeFadeIn = longTimeFadeIn or nil;
longTimeFadeOut = longTimeFadeOut or nil;
longTimeFadedOut = longTimeFadedOut or nil;
longToLogoWait = longToLogoWait or nil;
stopAnim = stopAnim or nil;
logoShrinkTime = logoShrinkTime or nil;
lastShrinkCalc = lastShrinkCalc or 0;
mlH = mlH or nil;
mlW = mlW or nil;
startFade = startFade or nil;
logoAlpha = logoAlpha or nil;
mainTheme = mainTheme or nil;
shortDelay = shortDelay or nil;
crawlTime = crawlTime or nil;
crawlPosition = crawlPosition or nil;

local LONGTIMEMAT = Material("starwars/long_time_ago.png");
local MAINLOGOMAT = Material("starwars/main_logo.png");
local BACKGROUNDMAT = Material("starwars/crawlback.png");
local colorBlack = Color(0, 0, 0, 255);
local cColor = Color(229, 177, 58, 255);

local offsetCrawlTime = 79;

function Schema.intro:Intro()
	local scrW, scrH = ScrW(), ScrH();
	local curTime = CurTime();

	if (playIntro) then
		Schema.intro:DrawCrawlBackground(scrW, scrH);

		if (!longTimeFadedOut) then
			Schema.intro:DoLongTimeAgoAnimation(scrW, scrH, curTime);
		else
			if (!longToLogoWait) then
				longToLogoWait = curTime + 2;
			end;

			if (longToLogoWait <= curTime) then
				if (!mainTheme) then mainTheme = CreateSound(LocalPlayer(), "starwars/music/main_title.mp3"); mainTheme:Play(); end;
				if (!shortDelay) then shortDelay = curTime + 0.5; end;

				if (shortDelay <= curTime) then
					Schema.intro:DoMainLogoAnimation(scrW, scrH, curTime);
				end;
			end;

			if (logoShrinkTime and logoShrinkTime - 2.5 <= curTime) then
				if (!crawlTime) then
					crawlTime = curTime + offsetCrawlTime;
				end;

				Schema.intro:DoCrawlAnimation(scrW, scrH, curTime);
			end;
		end;

		Schema.intro:DrawSkipPrompt(scrW, scrH, curTime);
	end;
end;

function Schema.intro:DrawSkipPrompt(scrW, scrH, curTime)
	local textAlpha = math.abs(math.sin(curTime) * 255);

	draw.SimpleText("Press any key to skip!", "SW_Skip_Font", scrW/2, scrH - 25, Color(255, 255, 255, textAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP);
end;

function Schema.intro:DrawCrawlBackground(scrW, scrH)
	surface.SetDrawColor(100, 100, 100, 255);
	surface.SetMaterial(BACKGROUNDMAT);
	surface.DrawTexturedRect(0, 0, scrW, scrH);
end;

function Schema.intro:CrawlSentenceCount()
	local count = 2;

	for k, v in ipairs(paragraphs) do
		count = count + #v;
	end;

	return count;
end;

function Schema.intro:DoCrawlAnimation(scrW, scrH, curTime)
	local angle = EyeAngles();
	local position = EyePos();

	if (!crawlPosition) then 
		crawlPosition = EyePos(); 
		crawlPosition = crawlPosition + angle:Forward() * 1030;
		crawlPosition = crawlPosition + angle:Right() * -1200;
		crawlPosition = crawlPosition + angle:Up() * -750;
	end;

	angle:RotateAroundAxis(angle:Forward(), 90);
	angle:RotateAroundAxis(angle:Right(), 90);

	angle = angle + Angle(0, 0, -60);

	crawlPosition = crawlPosition + angle:Right() * -0.31
	crawlPosition = crawlPosition + angle:Up() * -0.03;

	local crawlCount = Schema.intro:CrawlSentenceCount();

	cam.Start3D();
		cam.Start3D2D(crawlPosition, angle, 1.5);
			cam.IgnoreZ(true);
			--	surface.SetTextColor(cColor);
				
				surface.SetFont("SW_Episode_Font");

				
				local textW, textH = surface.GetTextSize(episodeText);
				local episodeAlpha = ((crawlTime - (crawlCount - 1 * 4) - curTime) * (255/offsetCrawlTime));

				surface.SetTextColor(cColor.r, cColor.g, cColor.b, episodeAlpha);
				surface.SetTextPos(scrW/2 - textW/2, 0);
				surface.DrawText(episodeText);

				surface.SetFont("SW_Title_Font");

				textW, textH = surface.GetTextSize(titleText);

				episodeAlpha = ((crawlTime - (crawlCount - 2 * 4) - curTime) * (255/offsetCrawlTime));

				surface.SetTextPos(scrW/2 - textW/2, 100);
				surface.SetTextColor(cColor.r, cColor.g, cColor.b, episodeAlpha);
				surface.DrawText(titleText);
			cam.IgnoreZ(false);
		cam.End3D2D();
	cam.End3D();

	local offsetAmount = 0;
	local currentCount = 0.8;

	for key, paragraph in ipairs(paragraphs) do
		local lastPara = paragraphs[key - 1];
		
		if (lastPara) then
			for k2, v2 in ipairs(lastPara) do
				local v2W, v2H = surface.GetTextSize(v2);

				offsetAmount = offsetAmount + v2H * 2.5;
			end;
		end;

		if (offsetAmount == 0) then offsetAmount = 500; end;

		if (!paragraph.pos) then 
			paragraph.pos = crawlPosition;
			paragraph.pos = paragraph.pos + angle:Right() * (offsetAmount);
		end;

		paragraph.pos = paragraph.pos + angle:Right() * -0.31
		paragraph.pos = paragraph.pos + angle:Up() * -0.03;

		cam.Start3D();
			cam.Start3D2D(paragraph.pos, angle, 1.5);
				cam.IgnoreZ(true);

				surface.SetFont("SW_Episode_Font");

				local offsetX = nil;

				for k, v in ipairs(paragraph) do
					if (!offsetX) then
						textW, textH = surface.GetTextSize(v);

						offsetX = scrW/2 - textW/2;
					end;

					local textAlpha = ((crawlTime - (crawlCount - currentCount * 4) - curTime) * (255/offsetCrawlTime));

					surface.SetTextColor(cColor.r, cColor.g, cColor.b, textAlpha);
					surface.SetTextPos(offsetX, ((k - 1) * 80));
					surface.DrawText(v);

					currentCount = currentCount + 0.4;
				end;

				cam.IgnoreZ(false);
			cam.End3D2D();
		cam.End3D();
	end;

	if (crawlTime and crawlTime <= curTime) then
		Schema.intro:ResetVariables();
	end;
end;

function Schema.intro:DoMainLogoAnimation(scrW, scrH, curTime)
	local startW = scrW * 1.5;
	local startH = scrH * 1.5;
	local startX = scrW/2 - startW/2;
	local startY = scrH/2 - startH/2;

	if (!logoAlpha) then logoAlpha = 255; end;

	if (!logoShrinkTime) then 
		logoShrinkTime = curTime + 10; 
		mlW = startW; 
		mlH = startH;
		startFade = curTime + 3;
	end;

	local shrinkRate = 0.005;

	mlW = mlW - (mlW * shrinkRate);
	mlH = mlH - (mlH * shrinkRate);

	local mlX = scrW/2 - mlW/2;
	local mlY = scrH/2 - mlH/2;

	if (startFade <= curTime and logoShrinkTime >= curTime) then
		logoAlpha = logoAlpha - 0.5;
	end;

	surface.SetDrawColor(255, 255, 255, logoAlpha);
	surface.SetMaterial(MAINLOGOMAT);
	surface.DrawTexturedRect(mlX, mlY, mlW, mlH);
end;

function Schema.intro:DoLongTimeAgoAnimation(scrW, scrH, curTime)
	if (longTimeFadeIn == nil) then
		longTimeFadeIn = curTime + 2;
		longTimeFadeOut = curTime + 4;
	end;

	local longTimeAlpha;

	if (longTimeFadeIn) then
		if (longTimeFadeIn >= curTime) then
			longTimeAlpha = math.abs(((longTimeFadeIn - curTime) * 127) - 255);
		elseif (longTimeFadeOut <= curTime) then
			longTimeAlpha = (((longTimeFadeOut + 1) - curTime) * 255);
		elseif (longTimeFadeIn <= curTime and longTimeFadeOut >= curTime) then
			longTimeAlpha = 255;
		end;
	else
		longTimeAlpha = 0;
	end;

	if (longTimeAlpha and longTimeAlpha > 0 and longTimeAlpha <= 255) then
		local ltW = 636;
		local ltH = 358;

		surface.SetDrawColor(255, 255, 255, longTimeAlpha);
		surface.SetMaterial(LONGTIMEMAT);
		surface.DrawTexturedRect(scrW/2 - ltW/2, scrH/2 - ltH/2, ltW, ltH);
	end;

	if (longTimeFadeOut < curTime and longTimeAlpha <= 0) then
		longTimeFadedOut = true;
	end;
end;

function Schema.intro:Start()
	Schema.intro:ResetVariables();
	playIntro = true;
end;

function Schema.intro:ResetVariables()
	if (mainTheme) then
		mainTheme:Stop();
	end;

	playIntro = nil;
	longTimeFadeIn = nil;
	longTimeFadeOut = nil;
	longTimeFadedOut = nil;
	longToLogoWait = nil;
	stopAnim = nil
	logoShrinkTime = nil;
	mlH = nil;
	mlW = nil;
	startFade = nil;
	logoAlpha = nil;	
	mainTheme = nil;
	shortDelay = nil;
	crawlTime = nil;
	crawlPosition = nil;

	for k, v in pairs(paragraphs) do
		v.pos = nil;
	end;
end;