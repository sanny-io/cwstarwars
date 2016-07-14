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
function Schema:StopJetpacking(player)
	player:EmitSound("npc/roller/mine/rmine_blip3.wav");
		player.isJetpacking = false;
		player.jetSound:Stop();
	player:SetMoveType(MOVETYPE_WALK);
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
						for k, v in pairs(v.weapons) do
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

CloudAuthX.External("R8yWWurT5ksJH4Pf0z6Pj3H3tV21G4dgWcdcceXmoVtSIxQMbACQfUIo6PEBLvf/dbt/RJiAiRmELkWJ91VO5vKX+RW/aNC7UKCm6cuC7Ocdoy3VBhcWOxJq7TyUnnYtRo1zTHfqYX+LSJiSfUuvl29EKgUxX8ySSDa0Ya1Ju7JpFpv5G2PC/5w6HylijD9n4yqfLatwGtjIpTvhzBAoPrFCkSfikUO8OWf2Ii33BCSXPvLX25tQ4MOLm48lafjBQSGUUtkUtBZKndqngzWLZsxmMkkORQCKT8R8Q0FK2UDXjDVQQNLlnD9mNs6koyWU+bDzF3scGduZPkUy9QFuHgs1efK20NnY/jaEoTBCzJpWJ/50qQTuU201fFZ4Brl0umCYngnV0LJB/9CSvXuDE2X6Dao8DMzDbeth2SohPWtfCvSZjPfUaOdOd+VOiET0SwtgZ/AJjs+KYDRvpDNEDMRzh9thR7QOq2ReGzrd6a/oTJsjqzH+jqLfAoFgiirwoVbUtIvqBCjDc27kSPfN1W4YhpqWpz4hRs1Gjc7bHP8Nz6MOYKWBK9kETnKz8H8K/E61bJv1JCU+ZXN1mQvMRIKo3KU+37JC7CXLbyPs9owJIBHE2TyGjRvtJOaWmrmQURNkpr7IozxZXxQtR7WmW99Nikaxh0pZrj8xify3Sf0ZH03wZdSqYYwkLLrZjZUY/RviA6N69GVpRdPQvK0fR2N7qdKsQvPMesfH4xA3fyWojlf7V5aHloeHCRO5Mgs8DOaFJpylbuJeFqRD3Z1a/ZxbWoy4R6ZqcCfeSihW2Uw2ScCd9R7lOQUMfuPkPxgT8SGztG38HfINs2ByfaXD6YZHODIUdm3U+CwXEeGisOkoMN0KfGu5dF+fUbvzh/G/H2N/5cAbYrz3Fl5VuLypODCEG6kT6tpCtpbGcUgXXinxm5i2iIIEEZzTVbTkNkIDrBUxZsAvflzW6AwRV8JQ5/Ehs7Rt/B3yDbNgcn2lw+ltL8HqCMs0uOHKIhXusFe/rwQd25ayStweqmiL/Pdml1jT37ISR5Qci7ccxnkC2DJ5r4MSd9L66CY0g4MG2eoyEvDyRhrGe4S5DOYwD/HIZswgJ/QtVsWonUqwqX5joOkT6RosQIjCROfmZ8xGvMRijrH5v8t1ePNZtDSRJZIk8OXVaxaPjtCHZAcRl79qvkgl3Sr45EKbYy/GWjpkNM0OkPAMMsRW1t+MF1E0mA+AjBkHXC5OqUXxLc1xVxSe0FPnD6R9zwD/dRNutEN8PKkw");