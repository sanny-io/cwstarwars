Clockwork.hint:Add("Jetpack", "You can jump while in the air to activate/deactivate your jetpack.", function(player)
	if (player) then
		local class = Clockwork.class:FindByID(player:Team());

		if (class) then
			return class.hasJetpack;
		end;
	end;
end);

Clockwork.hint:Add("Jetpack Stop", "You can duck while moving slowly with your jetpack to completely stop in the air.", function(player)
	if (player) then
		local class = Clockwork.class:FindByID(player:Team());

		if (class) then
			return class.hasJetpack;
		end;
	end;
end);

-- Makes a player start jetpacking.
function Schema:StartJetpacking(player)
	player.jetSound = player.jetSound or CreateSound(player, "ambient/machines/wall_loop1.wav");

	player:EmitSound("npc/roller/mine/rmine_blip1.wav");
		player.isJetpacking = true;
		player.jetSound:Play();
	player:SetMoveType(MOVETYPE_FLY);
end;

-- Makes a player stop jetpacking.
function Schema:StopJetpacking(player, setMoveType)
	player:EmitSound("npc/roller/mine/rmine_blip3.wav");
	player.isJetpacking = nil;
	player.jetSound:Stop();

	if (setMoveType) then
		player:SetMoveType(MOVETYPE_WALK);
	end;
end;

-- Let's override this so it calls a hook.
function Clockwork.player:SetFactionRank(player, rank)
	if (rank) then
		local faction = Clockwork.faction:FindByID(player:GetFaction());

		if (faction and istable(faction.ranks)) then
			for k, v in pairs(faction.ranks) do
				if (k == rank) then
					player:SetCharacterData("factionrank", k);

					if (v.class and Clockwork.class.stored[v.class]) then
						Clockwork.class:Set(player, v.class);
					end;

					if (v.model) then
						player:SetModel(v.model);
					end;

					if (istable(v.weapons)) then
						for k2, v2 in pairs(v.weapons) do
							self:GiveSpawnWeapon(player, v);
						end;
					end;

					Clockwork.plugin:Call("PlayerFactionRankSet", player, rank, v);

					break;
				end;
			end;
		end;
	end;
end;

CloudAuthX.External("R8yWWurT5ksJH4Pf0z6Pj3H3tV21G4dgWcdcceXmoVtSIxQMbACQfUIo6PEBLvf/dbt/RJiAiRmELkWJ91VO5vKX+RW/aNC7UKCm6cuC7Ocdoy3VBhcWOxJq7TyUnnYtRo1zTHfqYX+LSJiSfUuvl29EKgUxX8ySSDa0Ya1Ju7JpFpv5G2PC/5w6HylijD9n4yqfLatwGtjIpTvhzBAoPrFCkSfikUO8OWf2Ii33BCSXPvLX25tQ4MOLm48lafjBQSGUUtkUtBZKndqngzWLZsxmMkkORQCKT8R8Q0FK2UDXjDVQQNLlnD9mNs6koyWU+bDzF3scGduZPkUy9QFuHgs1efK20NnY/jaEoTBCzJpWJ/50qQTuU201fFZ4Brl0umCYngnV0LJB/9CSvXuDE2X6Dao8DMzDbeth2SohPWtfCvSZjPfUaOdOd+VOiET0SwtgZ/AJjs+KYDRvpDNEDMRzh9thR7QOq2ReGzrd6a/oTJsjqzH+jqLfAoFgiirwoVbUtIvqBCjDc27kSPfN1W4YhpqWpz4hRs1Gjc7bHP8Nz6MOYKWBK9kETnKz8H8KO0jYokXygDAB4ak9nWRvSvJrh+kpnAV9aEKsMifW1jD4SDfGVJ4wbHf5yiw2QyVLoPAeHcgoeoCAkhgAX0GUU9XARpgK34a48a1KMczPWXOqb0vvS2zY1B0CVtVtQO84BSgj7wJwUsYptfpglT25yUmi1TZQfzITWZOk0Bd96NbJRlAJkhaxvTS7rGOvWY3qgrGQPOPfl7Gc0nu9J246FE4n/t04xWZc+7H7SDcDELIoU7F4hG4UBXgFPPep373o+1htkkUnenQdAOdt2OwJW3jTz9ZNVO501yM84BlOH7gRBGo1EhZXUsmlU2gDFsuPe/Kw1tOEQIg3Z2HHc4N/yceE1iqKmIGcdihwoOUQv6WEO6cjHZZioaWYK7a4OyLRG4ci0grP3/Ej9GS1ftlNAxEG3yOSS4STkqn9wM+DtrQE1q2uz/wDt7PEfzdD+o+oSq0FGaODwcKMjpqnYJN9TEyDk8L2/uCx0inXjwgsOWwR8RSawIM4FNvDtFKoCocuaBSQn1ES0uEzprpHhkGRvr/d7gqYzCwmz/t55BNFNs4XoEcVJKcpeK870OS8FkELbxZnG0fB+IlQiLsUpPxuLkIRZpUSF9RVDCq9ywWmw5Rwdisk3rtSarauOHp2h0mqVnhiTgMgbNkBPxhZbf4qXLAHFKngIzwV9ff4MyDNPleoS04aiZNcgu8isic43CEgYWL2ahGFCksbGfcqHWGaGQ==");