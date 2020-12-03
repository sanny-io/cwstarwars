local COMMAND = Clockwork.command:New("RankSet");
COMMAND.access = "s";
COMMAND.tip = "Set a character's rank.";
COMMAND.text = "<string Name> <string Rank>";
COMMAND.arguments = 2;
COMMAND.alias = {"CharRankSet"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local rank = arguments[2]:lower();

	if (target) then
		local faction = Clockwork.faction:FindByID(target:GetFaction());

		if (faction.ranks) then
			for k in pairs(faction.ranks) do
				if (k:lower() == rank) then
					target:SetFactionRank(k);
					player:Notify("You have set "..target:Name().."'s rank to "..k..".");

					if (target != player) then
						target:Notify(player:Name().." has set your rank to "..k..".");
					end;
				end;
			end;
		end;
	else
		player:Notify(L(player, "NotValidCharacter", arguments[1]));
	end;
end;

COMMAND:Register();