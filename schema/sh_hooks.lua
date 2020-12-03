function Schema:ClockworkSchemaLoaded()
	local attribute = Clockwork.attribute:FindByID("Stamina");

	if (attribute) then
		attribute.isOnCharScreen = false;
	end;

	if (SERVER) then
		local loading = GetConVarString("sv_loadingurl");

		if (loading == "" or loading:find("cloudsixteen")) then
			RunConsoleCommand("sv_loadingurl", "http://sanny.io/starwars");
		end;

		if (cwObserverMode) then
			local enter = cwObserverMode.MakePlayerEnterObserverMode;
			local exit = cwObserverMode.MakePlayerExitObserverMode;

			function cwObserverMode:MakePlayerEnterObserverMode(player)
				player:SetNoTarget(true);
				return enter(self, player);
			end;

			function cwObserverMode:MakePlayerExitObserverMode(player)
				player:SetNoTarget(false);
				return exit(self, player);
			end;
		end;
	end;

	Clockwork.event:Hook("limb_damage", "weapon_fire", false);
end;

function Schema:PostGamemodeLoaded()
	local setClass = Clockwork.command:FindByID("SetClass");

	if (setClass) then
		setClass.access = "s";
	end;
end;

function Schema:AdjustCModelHandsInfo(model, info)
	info.model = "models/weapons/c_arms_hev.mdl";
end;

function Schema:CanUseLightsaberForcePower(player, power)
	local faction = player:GetFaction();

	if (faction == FACTION_JEDI) then
		if (power == "Force Combust" or power == "Force Lightning") then
			return false;
		end;
	elseif (faction == FACTION_SITH) then
		if (power == "Force Heal") then
			return false;
		end;
	end;
end;

function Schema:EntityFireBullets(entity, data)
	if (entity:IsNPC() and entity:GetActiveWeapon().Base == "weapon_swsft_base") then
		if (self:IsDroidModel(entity:GetModel())) then
			sound.Play("weapons/DC15A_fire.wav", entity:GetPos(), 75, 100, 1);
		end;
	elseif (entity:IsPlayer()) then
		if (entity:IsRunning() or entity:IsJogging()) then
			data.Spread = Vector(0.08, 0.08);
		end;
	end;
end;

function Schema:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:String("NickName");
end;

if (SERVER) then
	function Schema:PlayerDoesRecognisePlayer(player, target, status, isAccurate, realValue)
		if (Clockwork.faction:FindByID(target:GetFaction()).autoRecognise) then
			return true;
		end;
	end;
else
	function Schema:PlayerDoesRecognisePlayer(player, status, isAccurate, realValue)
		if (Clockwork.faction:FindByID(player:GetFaction()).autoRecognise) then
			return true;
		end;
	end;
end;