--[[
v1.2
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

if RequiredScript == "lib/tweak_data/weapontweakdata" then

	local old_wtd_init_new_weapons = WeaponTweakData._init_new_weapons

	function WeaponTweakData:_init_new_weapons(...)
		old_wtd_init_new_weapons (self, ...)
	
		local tact_rel = {'deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','new_m14','scar','fal','rpk','msr','r93','m95','famas','galil','g3','scorpion','benelli','serbu','r870','ksg','g26','spas12','l85a2','vhs','hs2000'}
		for i, wep_id in ipairs(tact_rel) do
			self[wep_id].tactical_reload = true
		end
	
		local tact_akimbo = {'x_deagle','x_1911','x_b92fs','jowi'}
		for i, wep_id in ipairs(tact_akimbo) do
			self[wep_id].tactical_akimbo = true
		end
		
		self.c96.uses_clip = true
		self.mosin.uses_clip = true
		self.c96.clip_capacity = 10
		self.mosin.clip_capacity = 5
	end

elseif RequiredScript == "lib/units/weapons/raycastweaponbase" then

--This script is by Deadly Mutton Chops and B1313
	function RaycastWeaponBase:clip_full()
		if tweak_data.weapon[self._name_id].tactical_reload == true then
			return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip() + 1
		elseif tweak_data.weapon[self._name_id].tactical_akimbo == true then
			return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip() + 2
		else
			return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip()
		end
	end
	
	function RaycastWeaponBase:can_reload()
		if tweak_data.weapon[self._name_id].uses_clip == true and ((self:get_ammo_max_per_clip() == tweak_data.weapon[self._name_id].clip_capacity and self:get_ammo_remaining_in_clip() > 0 ) or self:get_ammo_remaining_in_clip() > tweak_data.weapon[self._name_id].clip_capacity) then
		return false
		elseif self:get_ammo_total() > self:get_ammo_remaining_in_clip() then
			return true
		end
	end
	
	function RaycastWeaponBase:on_reload()
		if self:get_ammo_remaining_in_clip() > 0 and tweak_data.weapon[self._name_id].tactical_reload == true then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
		elseif self:get_ammo_remaining_in_clip() > 1 and tweak_data.weapon[self._name_id].tactical_akimbo == true then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 2))
		elseif self:get_ammo_remaining_in_clip() == 1 and tweak_data.weapon[self._name_id].tactical_akimbo == true then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
		elseif tweak_data.weapon[self._name_id].uses_clip == true and self:get_ammo_remaining_in_clip() <= tweak_data.weapon[self._name_id].clip_capacity  then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + tweak_data.weapon[self._name_id].clip_capacity))
		elseif self._setup.expend_ammo then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip()))
		else
			self:set_ammo_remaining_in_clip(self:get_ammo_max_per_clip())
			self:set_ammo_total(self:get_ammo_max_per_clip())
		end
	end
	
elseif RequiredScript == "lib/units/weapons/shotgun/newshotgunbase" then
	
	function NewShotgunBase:reload_expire_t()
		local ammo_remaining_in_clip = self:get_ammo_remaining_in_clip()
		if self:get_ammo_remaining_in_clip() > 0 and tweak_data.weapon[self._name_id].tactical_reload == true then
			return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() + 1 - ammo_remaining_in_clip) * self:reload_shell_expire_t()
		else
			return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() - ammo_remaining_in_clip) * self:reload_shell_expire_t()
		end
	end
	
	function NewShotgunBase:update_reloading(t, dt, time_left)
		if t > self._next_shell_reloded_t then
			local speed_multiplier = self:reload_speed_multiplier()
			self._next_shell_reloded_t = self._next_shell_reloded_t + self:reload_shell_expire_t() / speed_multiplier
			if self:get_ammo_remaining_in_clip() > 0 and tweak_data.weapon[self._name_id].tactical_reload == true then
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip() + 1, self:get_ammo_remaining_in_clip() + 1))
				return true
			else
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + 1))
				return true
			end
		end
	end
	
end