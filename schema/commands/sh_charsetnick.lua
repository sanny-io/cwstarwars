local COMMAND = Clockwork.command:New("CharSetNick");
COMMAND.access = "a";
COMMAND.tip = "Set a character's nick name.";
COMMAND.text = "<string Name> [string Nick]";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local nickName = arguments[2] or "";

	if (target) then
		target:SetCharacterData("NickName", nickName);
		target:SetSharedVar("NickName", nickName);

		if (nickName != "") then
			player:Notify("You've set "..target:GetName().."'s nick name to '"..nickName.."'.");
			target:Notify(player:Name().." has set your nick name to '"..nickName.."'.");
		else
			player:Notify("You've removed "..target:GetName().."'s nick name.");
			target:Notify(player:Name().." has removed your nick name.");
		end;
	else
		player:Notify(L(player, "NotValidCharacter", arguments[1]));
	end;
end;

COMMAND:Register();