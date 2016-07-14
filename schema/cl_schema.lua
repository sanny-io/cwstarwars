Clockwork.setting:AddColorMixer("Schema", "Lightsaber Color", "cwSaberColor", "The color of your lightsaber.", function()
	return Clockwork.faction:FindByID(Clockwork.Client:GetFaction()).canWieldLightsaber;
end);