function Schema:PlayerClassSet(player, newClass, oldClass, noRespawn, addDelay, noModelChange) 
	player:SetCharacterData("Class", newClass.name);

	if (!noModelChange) then
		player:SetCharacterData("Model", player:GetModel(), true);
	end;
end;

function Schema:PlayerCharacterInitialized(player)
	local class = player:GetCharacterData("Class", "");

	if (class != "" and Clockwork.class:FindByID(class)) then
		Clockwork.class:Set(player, class, true);
	end;
end;

function Schema:PlayerAdjustCharacterCreationInfo(player, info, data) 
	info.data["Class"] = "";

	info.data["factionrank"] = (
		Clockwork.faction:GetDefaultRank(data.faction) or 
		Clockwork.faction:GetLowestRank(data.faction) or ""
	);
end;

function Schema:KeyPress(player, key)
	local class = Clockwork.class:FindByID(player:Team());

	if (class and class.hasJetpack) then
		if (key == IN_JUMP) then
			if (!player:OnGround() and !player.isJetpacking and player:GetMoveType() == MOVETYPE_WALK) then
				self:StartJetpacking(player);
			elseif (player.isJetpacking) then
				self:StopJetpacking(player);
			end;
		elseif (key == IN_DUCK and player:GetVelocity():Length() <= 100) then
			player:SetLocalVelocity(vector_origin);
		end;
	end;
end;

function Schema:PlayerThink(player, curTime, infoTable)
	if (player:OnGround() and player.isJetpacking) then
		self:StopJetpacking(player);
	end;
end;

function Schema:GetPlayerDefaultInventory(player, character, inventory)
	local faction = Clockwork.faction:FindByID(character.faction);

	if (faction and faction.defaultInventory) then
		for k, v in pairs(faction.defaultInventory) do
			for i = 1, v do
				Clockwork.inventory:AddInstance(
					inventory, Clockwork.item:CreateInstance(k)
				);
			end;
		end;
	end;
end;

function Schema:PlayerFactionRankSet(player, rank, rankTable)
	Clockwork.class:Set(player, player:GetCharacterData("Class"));
end;

function Schema:PlayerCanUseItem(player, itemTable, bNoMsg)
	if (!bNoMsg and itemTable("isLightsaber") and !Clockwork.faction:FindByID(player:GetFaction()).canWieldLightsaber) then
		return false, player:Notify("The saber refuses to activate.");
	end;
end;

function Schema:PlayerPlayPainSound(player, gender, damageInfo, hitGroup)
	return false
end;

function Schema:PlayerGivenWeapon(player, class, itemTable)
	local weapon = player:GetWeapon(class);

	player:SetAmmo(9999, weapon:GetPrimaryAmmoType());
	player:SetAmmo(9999, weapon:GetSecondaryAmmoType());
end;