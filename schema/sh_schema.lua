-- These are addons for the client, not the server.
Schema.workshop = (
{
	127992073,
	127992588,
	183549197,
	107567765,
	181551699,
	626826818,
	230425520,
	694906255,
	111412589,
	600567407,
	126760786,
	536802852,
	698149588,
	618777027,
	488629405,
	123180537,
});

Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_schema.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_theme.lua");
Clockwork.kernel:IncludePrefixed("cl_intro.lua");
Clockwork.kernel:IncludePrefixed("sv_schema.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

Clockwork.option:SetKey("name_cash", "Credits");
Clockwork.option:SetKey("format_cash", "%a %n");
Clockwork.option:SetKey("format_singular_cash", "%a");
Clockwork.option:SetKey("model_cash", "models/props_lab/box01a.mdl");

Clockwork.option:SetKey("gradient", "starwars/crawlback");
Clockwork.option:SetKey("intro_image", "starwars/main_logo");
Clockwork.option:SetKey("schema_logo", "starwars/main_logo");
Clockwork.option:SetKey("menu_music", "starwars/music/imperial_march.mp3");
Clockwork.option:SetKey("intro_sound", "starwars/music/main_title.mp3");

Clockwork.player:AddCharacterData("factionrank", NWTYPE_STRING, "");

function Clockwork.class:FindByID(identifier)
	if (!identifier) then return; end;

	if (tonumber(identifier)) then
		return self.buffer[tonumber(identifier)];
	else
		for k, v in pairs(self.stored) do
			if (v.name:lower() == identifier:lower()) then
				return v;
			end;
		end;
	end;
end;

if (SERVER) then
	for k, v in pairs(Schema.workshop) do
		resource.AddWorkshop(tostring(v));
	end;
else
	-- This thing lags like crazy.
	hook.Remove("HUDPaint", "SW_V_TANK_HUD");
end;

penis = true;