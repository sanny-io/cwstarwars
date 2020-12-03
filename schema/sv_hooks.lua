function Schema:PlayerClassSet(player, newClass, oldClass, noRespawn, addDelay, noModelChange)
	player:SetCharacterData("Class", newClass.name);

	if (!noModelChange) then
		player:SetCharacterData("Model", player:GetModel(), true);
	end;

	if (!player.cwFirstSpawn and newClass.scoreboard) then
		player:SetCharacterData("customclass", newClass.scoreboard);
		player:SetSharedVar("customClass", newClass.scoreboard);
	end;
end;

function Schema:PlayerCanUseCharacter(player, character)
	if (character.faction == FACTION_CITIZEN and !Clockwork.config:Get("citizens_allowed"):Get()) then
		return "Citizens are not allowed to be used at this time.";
	end;
end;

function Schema:PlayerSpawnedSENT(player, sent)
	if (sent.Base == "fighter_base") then
		player.cwShip = sent;
	end;
end;

function Schema:PlayerSpawnSENT(player, class)
	if (!player:IsSuperAdmin()) then
		local sent = scripted_ents.GetStored(class);

		if (sent and sent.Base == "fighter_base" and Clockwork.attributes:Get(player, ATB_SPACECRAFT) >= 1) then
			return !IsValid(player.cwShip);
		end;
	end;
end;

function Schema:PlayerSpawnedNPC(player, npc)
	if (self:IsDroidModel(npc:GetModel())) then
		local droidFriends = {};

		for k, v in pairs(Clockwork.faction:GetAll()) do
			if (v.isDroidFriend) then
				for k2, v2 in pairs(Clockwork.faction:GetPlayers(v.name)) do
					droidFriends[#droidFriends + 1] = v2;
				end;
			end;
		end;

		for k, v in pairs(droidFriends) do
			npc:AddEntityRelationship(v, D_LI, 99);
		end;
	end;
end;

function Schema:PlayerAdjustCharacterScreenInfo(player, character, info)
	local class = Clockwork.class:FindByID(character.data.Class);
	local model, skin;

	if (class and class.GetModel) then
		model, skin = class:GetModel(player, nil, character.data);
	end;

	if (character.data.Model and character.data.Model != "") then
		model = character.data.Model;
	end;

	if (character.data.factionrank) then
		local faction = Clockwork.faction:FindByID(info.faction);

		if (faction and faction.ranks) then
			local rank = faction.ranks[character.data.factionrank];

			if (rank) then
				if (rank.short and !rank.hidden) then
					info.name = ("%s. %s"):format(rank.short, info.name);
				else
					info.name = ("%s %s"):format(character.data.factionrank, info.name);
				end;
			end;
		end;
	end;

	if (character.data.NickName and character.data.NickName != "") then
		info.name = ("%s '%s'"):format(info.name, character.data.NickName);
	end;

	if (model) then
		info.model = model;
	end;

	if (skin) then
		info.skin = skin;
	end;

	info.factionrank = character.data.factionrank
	info.nickName = character.data.NickName;
end;

function Schema:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar("NickName", player:GetCharacterData("NickName", ""));
end;

function Schema:PlayerCharacterInitialized(player)
	local class = player:GetCharacterData("Class", "");

	if (class != "" and Clockwork.class:FindByID(class)) then
		Clockwork.class:Set(player, class, true);
	end;
end;

function Schema:PlayerDisconnected(player)
	if (IsValid(player.cwShip)) then
		player.cwShip:Remove();
	end;
end;

function Schema:PlayerCharacterLoaded(player)
	local isDroidFriend = Clockwork.faction:FindByID(player:GetFaction()).isDroidFriend;

	if (IsValid(player.cwShip)) then
		player.cwShip:Remove();
	end;

	if (isDroidFriend) then
		for k, v in pairs(ents.FindByClass("npc_combine_s")) do
			v:AddEntityRelationship(player, D_LI, 99);
		end;
	else
		for k, v in pairs(ents.FindByClass("npc_combine_s")) do
			v:AddEntityRelationship(player, D_HT, 99);
		end;
	end;
end;

function Schema:PlayerAdjustCharacterCreationInfo(player, info, data)
	if (Clockwork.faction:FindByID(info.faction).nickName) then
		if (!data.nickName or data.nickName:utf8len() > 16 or data.nickName:utf8len() < 2) then
			return "You did not choose a nick name, or the name that you chose is not valid!";
		end;
	end;

	for k, v in pairs(Clockwork.class:GetAll()) do
		if (v.factions and v.isDefault and table.HasValue(v.factions, info.faction) and v.scoreboard) then
			info.data["customclass"] = v.scoreboard;
		end;
	end;

	info.data["Class"] = "";
	info.data["NickName"] = data.nickName or "";
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
				self:StopJetpacking(player, true);
			end;
		elseif (key == IN_DUCK and player:GetVelocity():Length() <= 100) then
			player:SetLocalVelocity(vector_origin);
		end;
	end;
end;

function Schema:PlayerNoClip(player)
	if (player.isJetpacking) then
		return false;
	end;
end;

function Schema:PlayerRagdolled(player, state, ragdoll)
	if (player.isJetpacking) then
		self:StopJetpacking(player);
	end;
end;

function Schema:PlayerThink(player, curTime, infoTable)
	if (player:OnGround() and player.isJetpacking) then
		self:StopJetpacking(player, true);
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