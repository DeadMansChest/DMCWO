--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if DMCWO.fix_pickup then
--While I made this myself, credits to LazyOzzy for making the pickup fix in the first place
	function RaycastWeaponBase:add_ammo(ratio, add_amount_override)
		if self:ammo_max() then
			return false, 0
		end
		local multiplier_min = 1
		local multiplier_max = 1
		local ammo_min = self._ammo_data and self._ammo_data.ammo_pickup_min_mul
		local ammo_max = self._ammo_data and self._ammo_data.ammo_pickup_max_mul
		if ammo_min then
			multiplier_min = multiplier_min * self._ammo_data.ammo_pickup_min_mul
		end
		multiplier_min = multiplier_min * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
		
		if ammo_max then
			multiplier_max = multiplier_max * self._ammo_data.ammo_pickup_max_mul
		end
		multiplier_max = multiplier_max * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
		
		local add_amount = add_amount_override
		local picked_up = true
					
		if not add_amount then
			local rng_ammo = math.lerp(self._ammo_pickup[1] * multiplier_min, self._ammo_pickup[2] * multiplier_max, math.random())
			--picked_up = rng_ammo > 0
			add_amount = math.max(0, math.round(rng_ammo))
		end
		add_amount = math.floor(add_amount * (ratio or 1))
		self:set_ammo_total(math.clamp(self:get_ammo_total() + add_amount, 0, self:get_ammo_max()))
		if Application:production_build() then
			managers.player:add_weapon_ammo_gain(self._name_id, add_amount)
		end
		log("ffdfsdfsd")
		return picked_up, add_amount
	end
end


function RaycastWeaponBase:fire(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	if managers.player:has_activate_temporary_upgrade("temporary", "no_ammo_cost_buff") then
		managers.player:deactivate_temporary_upgrade("temporary", "no_ammo_cost_buff")
		if managers.player:has_category_upgrade("temporary", "no_ammo_cost") then
			managers.player:activate_temporary_upgrade("temporary", "no_ammo_cost")
		end
	end
	local consume_ammo = self._block_b_storm or ( not managers.player:has_active_temporary_property("bullet_storm") and (not managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") or not managers.player:has_category_upgrade("player", "berserker_no_ammo_cost")) )
	if consume_ammo then
		local base = self.parent_weapon and self.parent_weapon:base() or self
		if base:get_ammo_remaining_in_clip() == 0 then
			return
		end
		local ammo_usage = 1
		if managers.player:has_category_upgrade(self:weapon_tweak_data().category, "consume_no_ammo_chance") then
			local roll = math.rand(1)
			local chance = managers.player:upgrade_value(self:weapon_tweak_data().category, "consume_no_ammo_chance", 0)
			if roll < chance then
				ammo_usage = 0
				print("NO AMMO COST")
			end
		end
		if managers.player:has_category_upgrade(self:weapon_tweak_data().sub_category, "consume_no_ammo_chance") then
			local roll = math.rand(1)
			local chance = managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "consume_no_ammo_chance", 0)
			if roll < chance then
				ammo_usage = 0
				print("NO AMMO COST")
			end
		end
		base:set_ammo_remaining_in_clip(base:get_ammo_remaining_in_clip() - ammo_usage)
		base:set_ammo_total(base:get_ammo_total() - ammo_usage)
	end
	local user_unit = self._setup.user_unit
	self:_check_ammo_total(user_unit)
	if alive(self._obj_fire) then
		self:_spawn_muzzle_effect(from_pos, direction)
	end
	if self._use_shell_ejection_effect then
		World:effect_manager():spawn(self._shell_ejection_effect_table)
	end
	local ray_res = self:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	if self._alert_events and ray_res.rays then
		self:_check_alert(ray_res.rays, from_pos, direction, user_unit)
	end
	if ray_res.enemies_in_cone then
		for enemy_data, dis_error in pairs(ray_res.enemies_in_cone) do
			if not enemy_data.unit:movement():cool() then
				enemy_data.unit:character_damage():build_suppression(suppr_mul * dis_error * self._suppression, self._panic_suppression_chance)
			end
		end
	end
	return ray_res
end

FlameBulletBase.EFFECT_PARAMS = {
	sound_event = "round_explode",
	feedback_range = tweak_data.upgrades.flame_bullet.feedback_range,
	camera_shake_max_mul = tweak_data.upgrades.flame_bullet.camera_shake_max_mul,
	sound_muffle_effect = true,
	on_unit = true,
	pushunits = tweak_data.upgrades
}

local FlameBulletBase_on_collision_old = FlameBulletBase.on_collision
function FlameBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank)
	local hit_unit = col_ray.unit
	local weapon_name_id = weapon_unit.base and weapon_unit:base()._name_id 
	if weapon_name_id ~= "flamethrower_mk2" and (not hit_unit:character_damage() or not hit_unit:character_damage()._no_blood) then
		self:play_impact_sound_and_effects(col_ray)
	end
	FlameBulletBase_on_collision_old(self, col_ray, weapon_unit, user_unit, damage, blank)
end

function FlameBulletBase:play_impact_sound_and_effects(col_ray)
	managers.game_play_central:play_impact_sound_and_effects({col_ray = col_ray})
end

-- Header comment that will likely be deleted. This was made by 90e.
-- Reverb fixed by Doctor Mister Cool

-- Don't play a sound conventionally (unless using the saw which lacks a single fire sound)
local base_fire_sound = RaycastWeaponBase._fire_sound
function RaycastWeaponBase:_fire_sound()
	if self:get_name_id() == "saw" or self:get_name_id() == "saw_secondary" or self:get_name_id() == "flamethrower_mk2" then
		base_fire_sound(self)
	end
end

-- Instead play the single fire noise here
local old_fire = RaycastWeaponBase.fire
function RaycastWeaponBase:fire(...)
	local result = old_fire(self, ...)
	
	-- Don't try playing the single fire sound with the saw
	if self:get_name_id() == "saw" or self:get_name_id() == "saw_secondary" or self:get_name_id() == "flamethrower_mk2" then
		return result
	end
	
	if result then
		self:play_tweak_data_sound("fire_single", "fire")
		self:play_tweak_data_sound("stop_fire") --DMC did a thing here, that's it really
		--[[
		if not self:weapon_tweak_data().no_click and (self:get_ammo_remaining_in_clip() < (self:get_ammo_max_per_clip() * 0.25)) then
			log("click")
			self._sound_fire:post_event("wp_auto_switch_on")
		end
		]]
	end
	
	return result
end

local base_shoot_stop = RaycastWeaponBase.stop_shooting
function RaycastWeaponBase:stop_shooting()
	if self:get_name_id() == "saw" or self:get_name_id() == "saw_secondary" or self:get_name_id() == "flamethrower_mk2" then
		base_shoot_stop(self)
	end
end