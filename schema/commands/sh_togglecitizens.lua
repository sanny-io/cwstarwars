local COMMAND = Clockwork.command:New("ToggleCitizens");
COMMAND.access = "a";
COMMAND.tip = "Enable or disable the usage of citizens.";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local citizens_allowed = Clockwork.config:Get("citizens_allowed");

	citizens_allowed:Set(!citizens_allowed:Get());

	if (citizens_allowed:Get()) then
		Clockwork.player:NotifyAll(player:Name().." has allowed the usage of citizens.");
	else
		Clockwork.player:NotifyAll(player:Name().." has prohibited the usage of citizens.");
	end;
end;

COMMAND:Register();