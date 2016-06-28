--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local init_original = AkimboWeaponBase.init	
function AkimboWeaponBase:init(...)
	init_original(self, ...)
	
	if not self:is_npc() then
		self._is_akimbo = true
	end
end

function AkimboWeaponBase:fire(...)
	local result
	
	if self._fire_second_gun_next then
		if alive(self._second_gun) then
			result = self._second_gun:base().super.fire(self._second_gun:base(), ...)
			if result then
				if self._fire_second_sound then
					self._fire_second_sound = false
					self._second_gun:base():_fire_sound()
				end
				managers.hud:set_ammo_amount(self:selection_index(), self:ammo_info())
				self._second_gun:base():tweak_data_anim_play("fire")
				self._shotsfired = self._shotsfired + 1
			end
		end
		self._fire_second_gun_next = false
	else
		result = AkimboWeaponBase.super.fire(self, ...)
		self._fire_second_gun_next = true
	end
	
	return result
end

