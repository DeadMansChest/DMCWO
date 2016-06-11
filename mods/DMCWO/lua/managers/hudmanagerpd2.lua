--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

HUDManager._USE_BURST_MODE = true	--Custom HUD compatibility

function HUDManager:set_teammate_weapon_firemode_burst(id)
	self._teammate_panels[HUDManager.PLAYER_PANEL]:set_weapon_firemode_burst(id)
end