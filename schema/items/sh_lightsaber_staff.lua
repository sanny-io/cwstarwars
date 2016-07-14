local ITEM = Clockwork.item:New("weapon_base");
ITEM.name = "Lightsaber Staff";
ITEM.cost = 200;
ITEM.model = "models/sgg/starwars/weapons/w_maul_saber_staff_hilt.mdl";
ITEM.weight = 2.5;
ITEM.uniqueID = "weapon_lightsaber_staff";
ITEM.weaponClass = "weapon_lightsaber";
ITEM.description = "";
ITEM.isLightsaber = true;

function ITEM:OnEquip(player)
	local r, g, b = player:GetInfoNum("cwSaberColorR", 0), player:GetInfoNum("cwSaberColorG", 195), player:GetInfoNum("cwSaberColorB", 255);

	player:SelectWeapon("weapon_lightsaber");
	player:GetActiveWeapon():SetWorldModel("models/sgg/starwars/weapons/w_maul_saber_staff_hilt.mdl");
	player:GetActiveWeapon():SetCrystalColor(Vector(r, g, b));
end;

ITEM:Register();