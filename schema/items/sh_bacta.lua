local ITEM = Clockwork.item:New();
ITEM.name = "Bacta";
ITEM.cost = 30;
ITEM.model = "models/healthvial.mdl";
ITEM.weight = 1;
ITEM.useText = "Apply";
ITEM.category = "Medical"
ITEM.useSound = "items/medshot4.wav";
ITEM.description = "A small container filled with a gelatinous substance.";
ITEM.customFunctions = {"Give"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth(math.Clamp(player:Health() + 15, 0, player:GetMaxHealth()));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "Give") then
			local target = player:GetEyeTrace().Entity;

			if (IsValid(target) and target:IsPlayer() and target:GetPos():Distance(player:GetShootPos()) <= 192) then
				target:SetHealth(math.Clamp(target:Health() + 15, 0, target:GetMaxHealth()));
			end;
		end;
	end;
end;

ITEM:Register();