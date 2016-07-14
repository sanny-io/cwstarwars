local COMMAND = Clockwork.command:New("CharSetClass");
COMMAND.access = "s";
COMMAND.tip = "Set a character's class.";
COMMAND.text = "<string Name> <string Class>";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local class = Clockwork.class:FindByID(arguments[2]);

	if (target) then
		if (class and table.HasValue(class.factions, target:GetFaction())) then
			Clockwork.class:Set(target, class.name, true);
			player:Notify("You have set "..target:Name().."'s class to "..class.name..".");

			if (target != player) then
				target:Notify(player:Name().." has set your class to "..class.name..".");
			end;
		else
			player:Notify(arguments[2].." is not a valid class!");
		end;
	else
		player:Notify(L(player, "NotValidCharacter", arguments[1]));
	end;
end;

COMMAND:Register();