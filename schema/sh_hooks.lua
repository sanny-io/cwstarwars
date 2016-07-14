function Schema:ClockworkSchemaLoaded()
	Clockwork.plugin:SetUnloaded("Animated Legs", true);
end;

function Schema:AdjustCModelHandsInfo(model, info)
	info.model = "models/weapons/c_arms_hev.mdl";
end;

function Schema:CanUseLightsaberForcePower(player, power)
	local faction = player:GetFaction();

	if (faction == FACTION_JEDI and power == "Force Combust" or power == "Force Lightning") then
		return false;
	elseif (faction == FACTION_SITH and power == "Force Heal") then
		return false;
	end;
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