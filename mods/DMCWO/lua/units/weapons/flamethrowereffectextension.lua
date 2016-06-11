--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_effect_update = FlamethrowerEffectExtension.update
function FlamethrowerEffectExtension:update(...)
	if FlamethrowerEffectExtension.super.flame_max_range then
		self._flame_max_range = FlamethrowerEffectExtension.super.flame_max_range
	end
	old_effect_update(self, ...)
end