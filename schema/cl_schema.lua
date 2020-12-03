Clockwork.config:AddToSystem("Citizens Allowed", "citizens_allowed", "Whether or not citizens are allowed to be used.");

Clockwork.setting:AddColorMixer("Schema", "Lightsaber Color", "cwSaberColor", "The color of your lightsaber.", function()
	return Clockwork.faction:FindByID(Clockwork.Client:GetFaction()).canWieldLightsaber;
end);