-- These are addons for the client, not the server.
Schema.workshop = (
{
	127992073,
	127992588,
	183549197,
	107567765,
	181551699,
	626826818,
	694906255,
	111412589,
	126760786,
	536802852,
	698149588,
	618777027,
	488629405,
	123180537,
	173923845,
	732192956,
	495762961,
	608632308,
	284266415,
	104486597,
	603880998,
	612389671,
	686671472,
});

Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_schema.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_theme.lua");
Clockwork.kernel:IncludePrefixed("cl_intro.lua");
Clockwork.kernel:IncludePrefixed("sv_schema.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

Clockwork.animation:AddCivilProtectionModel("models/sgg/starwars/clonetrooper.mdl");

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

Clockwork.config:Add("citizens_allowed", true, true);

do
	local SENTSLoaded = scripted_ents.OnLoaded;
	local WeaponsLoaded = weapons.OnLoaded;

	function scripted_ents.OnLoaded()
		if (SERVER) then
			local fighter = scripted_ents.GetStored("fighter_base");

			if (fighter) then
				local enter = fighter.t.Enter;

				function fighter.t:Enter(player)
					if (Clockwork.attributes:Get(player, ATB_SPACECRAFT) >= 1) then
						return enter(self, player);
					end;

					player:Notify("You lack the necessary experience to pilot this spacecraft.");
				end;
			end;
		end;

		return SENTSLoaded();
	end;

	function weapons.OnLoaded()
		local weaponBase = weapons.GetStored("weapon_swsft_base");

		if (weaponBase) then
			weaponBase.DrawHUD = function() end;
		end;

		return WeaponsLoaded();
	end;
end;

function Schema:IsDroidModel(model)
	model = model:lower();

	return model:find("droid") or model:find("geonosian") or model:find("magnaguard");
end;

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