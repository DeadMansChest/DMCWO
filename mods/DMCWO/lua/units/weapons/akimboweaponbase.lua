--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local init_original = AkimboWeaponBase.init	
function AkimboWeaponBase:init(...)
	init_original(self, ...)
	
	if not self:is_npc() then
		self._is_akimbo = true
		self._native_fire_rate = tweak_data.weapon[self._name_id].fire_mode_data.fire_rate
	end
end

function AkimboWeaponBase:fire(...)
	self._second_turn = not self._second_turn
	local result
	
	if not self._second_turn then
		result = AkimboWeaponBase.super.fire(self, ...)
	elseif alive(self._second_gun) then
		result = self._second_gun:base().super.fire(self._second_gun:base(), ...)
		if result then
			self._second_gun:base():_fire_sound()
			managers.hud:set_ammo_amount(self:selection_index(), self:ammo_info())
			self._second_gun:base():tweak_data_anim_play("fire")
			self._shotsfired = self._shotsfired + 1
		end
	end
	
	return result
end

