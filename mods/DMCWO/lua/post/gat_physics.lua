--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/units/weapons/raycastweaponbase" then
	
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
			return picked_up, add_amount
		end
	end
	


elseif RequiredScript == "lib/managers/blackmarketmanager" then
--{

	--fire rate multiplier blackmarket statchart stuff	
	function BlackMarketManager:fire_rate_multiplier(name, category, sub_category, silencer, detection_risk, current_state, blueprint)
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local tweak_data = tweak_data.weapon
		local weapon = tweak_data[name]
		local factory = tweak_data.factory[factory_id]
		local default_blueprint = factory.default_blueprint
		local function upgrade_blocked(category, upgrade)
			if not weapon.upgrade_blocks then
				return false
			end
			if not weapon.upgrade_blocks[category] then
				return false
			end
			return table.contains(weapon.upgrade_blocks[category], upgrade)
		end
			
		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(factory_id, blueprint or default_blueprint)
		local multiplier = 1
		local rof_multiplier = 1
		self._block_eq_aced = nil
		
		for part_id, stats in pairs(custom_stats) do
			if stats.rof_mult then
				rof_multiplier = rof_multiplier * stats.rof_mult
			end
			if stats.block_eq_aced then
				self._block_eq_aced = true
			end
		end
		
		multiplier = rof_multiplier
										
		if not upgrade_blocked(weapon.category, "fire_rate_multiplier") then	
			if not self._block_eq_aced then
				multiplier = multiplier * managers.player:upgrade_value(category, "fire_rate_multiplier", 1)
			end
		end
		if not upgrade_blocked(weapon.name, "fire_rate_multiplier") then
			if not self._block_eq_aced then
				multiplier = multiplier * managers.player:upgrade_value(name, "fire_rate_multiplier", 1)
			end
		end
		if not upgrade_blocked(weapon.sub_category, "fire_rate_multiplier") then
			if not self._block_eq_aced and sub_category then
				multiplier = multiplier * managers.player:upgrade_value(sub_category, "fire_rate_multiplier", 1)
			end
		end
		return multiplier
	end
	
	function BlackMarketManager:accuracy_multiplier(name, category, sub_category, silencer, current_state, spread_moving, fire_mode, blueprint)
		local multiplier = 1
		multiplier = multiplier * (managers.player:upgrade_value("weapon", "spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value(category, "spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value("weapon", fire_mode .. "_spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value(name, "spread_multiplier", 1))
		if sub_category then
			multiplier = multiplier * ( managers.player:upgrade_value(sub_category, "spread_multiplier", 1))
		end
		if silencer then
			multiplier = multiplier * (managers.player:upgrade_value("weapon", "silencer_spread_multiplier", 1))
			multiplier = multiplier * (managers.player:upgrade_value(category, "silencer_spread_multiplier", 1))
			if sub_category then
				multiplier = multiplier * (managers.player:upgrade_value(sub_category, "silencer_spread_multiplier", 1))
			end
		end
		if current_state then
			if self._name_id ~= "flamethrower_mk2" then
				if current_state._state_data.in_air then 
					if current_state:in_steelsight() then
						multiplier = multiplier * 1.25
					else
						multiplier = multiplier * 1.5
					end
				end
				if current_state._running then
					multiplier = multiplier * 1.25
				end
			end
			if current_state._moving then
				multiplier = multiplier * (managers.player:upgrade_value(category, "move_spread_multiplier", 1))
				multiplier = multiplier * (managers.player:team_upgrade_value("weapon", "move_spread_multiplier", 1))
				--multiplier = multiplier * (self._spread_moving or 1)
				if sub_category then
					multiplier = multiplier * (managers.player:upgrade_value(sub_category, "move_spread_multiplier", 1))
				end
			end
			if current_state._state_data.in_full_steelsight then
				multiplier = multiplier * (tweak_data.weapon[name].spread[current_state._moving and "moving_steelsight" or "steelsight"])
			else
				multiplier = multiplier * (managers.player:upgrade_value(category, "hip_fire_spread_multiplier", 1))
				if sub_category then
					multiplier = multiplier * (managers.player:upgrade_value(sub_category, "hip_fire_spread_multiplier", 1))
				end
				if current_state._state_data.ducking then
					multiplier = multiplier * (tweak_data.weapon[name].spread[current_state._moving and "moving_crouching" or "crouching"])
				else
					multiplier = multiplier * (tweak_data.weapon[name].spread[current_state._moving and "moving_standing" or "standing"])
				end
			end
			if current_state._state_data.using_bipod then
				multiplier = multiplier * 0.5
			end
		end
		if blueprint and self:is_weapon_modified(managers.weapon_factory:get_factory_id_by_weapon_id(name), blueprint) then
			multiplier = multiplier * (managers.player:upgrade_value("weapon", "modded_spread_multiplier", 1))
		end
		return multiplier
	end
	
	local old_damage_add = BlackMarketManager.damage_addend
	function BlackMarketManager:damage_addend(name, category, sub_category, silencer, detection_risk, current_state, blueprint)
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local default_blueprint = factory_id and tweak_data.weapon.factory[factory_id].default_blueprint

		local custom_stats = factory_id and managers.weapon_factory:get_custom_stats_from_weapon(factory_id, blueprint or default_blueprint)
		
		if custom_stats then
			for part_id, stats in pairs(custom_stats) do
				if stats.ignore_dmg_boosts then
					return 0
				end
			end
		end

		local value = 0
		if tweak_data.weapon[name] and tweak_data.weapon[name].ignore_damage_upgrades then
			return value
		end
		value = value + managers.player:upgrade_value("player", "damage_addend", 0)
		value = value + managers.player:upgrade_value("weapon", "damage_addend", 0)
		value = value + managers.player:upgrade_value(category, "damage_addend", 0)
		if sub_category then
			value = value + managers.player:upgrade_value(sub_category, "damage_addend", 0)
		end
		value = value + managers.player:upgrade_value(name, "damage_addend", 0)
		return value
	end
	
	local old_damage_mult = BlackMarketManager.damage_multiplier
	function BlackMarketManager:damage_multiplier(name, category, sub_category, silencer, detection_risk, current_state, blueprint)
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local default_blueprint = factory_id and tweak_data.weapon.factory[factory_id].default_blueprint

		local custom_stats = factory_id and managers.weapon_factory:get_custom_stats_from_weapon(factory_id, blueprint or default_blueprint)
		
		if custom_stats then
			for part_id, stats in pairs(custom_stats) do
				if stats.ignore_dmg_boosts then
					return 1
				end
			end
		end
		local multiplier = 1
		if tweak_data.weapon[name] and tweak_data.weapon[name].ignore_damage_upgrades then
			return multiplier
		end
		multiplier = multiplier + (1 - managers.player:upgrade_value(category, "damage_multiplier", 1))
		if sub_category then
			multiplier = multiplier + (1 - managers.player:upgrade_value(sub_category, "damage_multiplier", 1))
		end
		multiplier = multiplier + (1 - managers.player:upgrade_value(name, "damage_multiplier", 1))
		multiplier = multiplier + (1 - managers.player:upgrade_value("player", "passive_damage_multiplier", 1))
		multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "passive_damage_multiplier", 1))
		if silencer then
			multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "silencer_damage_multiplier", 1))
		end
		local detection_risk_damage_multiplier = managers.player:upgrade_value("player", "detection_risk_damage_multiplier")
		multiplier = multiplier - managers.player:get_value_from_risk_upgrade(detection_risk_damage_multiplier, detection_risk)
		if managers.player:has_category_upgrade("player", "overkill_health_to_damage_multiplier") then
			local damage_ratio = managers.player:upgrade_value("player", "overkill_health_to_damage_multiplier", 1) - 1
			multiplier = multiplier + damage_ratio
		end
		if not current_state or current_state:in_steelsight() then
		else
			multiplier = multiplier + (1 - managers.player:upgrade_value(category, "hip_fire_damage_multiplier", 1))
			if sub_category then
				multiplier = multiplier + (1 - managers.player:upgrade_value(sub_category, "hip_fire_damage_multiplier", 1))
			end
		end
		if blueprint and self:is_weapon_modified(managers.weapon_factory:get_factory_id_by_weapon_id(name), blueprint) then
			multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "modded_damage_multiplier", 1))
		end
		return self:_convert_add_to_mul(multiplier)
	end

--}	
elseif RequiredScript == "lib/units/weapons/flamethrowereffectextension" then
--{
	
	local old_effect_update = FlamethrowerEffectExtension.update
	function FlamethrowerEffectExtension:update(...)
		if FlamethrowerEffectExtension.super.flame_max_range then
			self._flame_max_range = FlamethrowerEffectExtension.super.flame_max_range
		end
		old_effect_update(self, ...)
	end

--}
elseif RequiredScript == "lib/units/weapons/newflamethrowerbase" then
--{	
	function NewFlamethrowerBase:_update_stats_values()
		NewFlamethrowerBase.super._update_stats_values(self)
		--self:setup_default() --why was this here
		if self._ammo_data and self._ammo_data.rays ~= nil then
			self._rays = self._ammo_data.rays
		end
	end
		
	function NewFlamethrowerBase:get_damage_falloff(damage, col_ray, user_unit)
		local dist = col_ray.distance or mvector3.distance(col_ray.unit:position(), user_unit:position())
		local fuck = ( (self._current_stats.damage / self._damage) * damage )
		
		if DMCWO.debug_range == true then
			log("Dist: " .. tostring(dist/100) .. "\nDrop Start: " .. tostring(self._damage_near/100) .. "m\n\nInit Dmg: " .. tostring(damage * 10) .. "\nMin. Dmg at: " .. tostring(self._flame_max_range/100) .. "m \nMin. Dmg: " .. tostring( (0) * 10) .. "\n")
		end
		if dist > 500 and dist < self._flame_max_range then
			damage = damage - (( dist/self._flame_max_range ) *  damage )
		elseif dist >= self._flame_max_range then
			damage = 0 
		end
		if DMCWO.debug_range == true then
			log("Impact Dmg: " .. tostring(damage * 10) .. "\n\n") --Damage on impact
		end
		return damage
	end
	
	local mvec_to = Vector3()
	local mvec_direction = Vector3()
	local mvec_spread_direction = Vector3()
	function NewFlamethrowerBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
		if self._rays == 1 then
			local result = NewFlamethrowerBase.super._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
			return result
		end
		local result = {}
		local hit_enemies = {}
		local hit_something, col_rays
		if self._alert_events then
			col_rays = {}
		end
		local damage = self:_get_current_damage(dmg_mul)
		local autoaim, dodge_enemies = self:check_autoaim(from_pos, direction, self._range)
		local weight = 0.1
		local enemy_died = false
		local function hit_enemy(col_ray)
			if col_ray.unit:character_damage() and col_ray.unit:character_damage().is_head then
				local enemy_key = col_ray.unit:key()
				if not hit_enemies[enemy_key] or col_ray.unit:character_damage():is_head(col_ray.body) then
					hit_enemies[enemy_key] = col_ray
				end
			else
				self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			end
		end
		local spread = self:_get_spread(user_unit)
		mvector3.set(mvec_direction, direction)
		if spread then
		end
		for i = 1, self._rays do
			mvector3.set(mvec_spread_direction, mvec_direction)
			if spread then
				mvector3.spread(mvec_spread_direction, spread * (spread_mul or 1))
			end
			mvector3.set(mvec_to, mvec_spread_direction)
			mvector3.multiply(mvec_to, 20000)
			mvector3.add(mvec_to, from_pos)
			local search_for_targets = true
			local raycast_from = from_pos
			local raycast_to = mvec_to
			local raycast_ignore_units = clone(self._setup.ignore_units)
			local test_color = 1
			local col_ray, test_last_raycast_hit_position
			while search_for_targets do
				col_ray = World:raycast("ray", raycast_from, raycast_to, "slot_mask", self._bullet_slotmask, "ignore_unit", raycast_ignore_units)
				if test_last_raycast_hit_position == nil then
					test_last_raycast_hit_position = raycast_from
				end
				if col_rays then
					if col_ray then
						if col_ray then
							test_last_raycast_hit_position = col_ray.hit_position
						end
						if col_ray.distance > self._flame_max_range then
							search_for_targets = false
							break
						elseif col_ray.unit:in_slot(managers.slot:get_mask("world_geometry")) then
							table.insert(col_rays, col_ray)
							search_for_targets = false
						elseif col_ray.unit:in_slot(managers.slot:get_mask("melee_equipment")) then
							table.insert(col_rays, col_ray)
							search_for_targets = false
						else
							table.insert(raycast_ignore_units, col_ray.unit)
						end
					else
						local ray_to = mvector3.copy(raycast_to)
						local spread_direction = mvector3.copy(mvec_spread_direction)
						table.insert(col_rays, {position = ray_to, ray = spread_direction})
						search_for_targets = false
					end
				end
				if self._autoaim and autoaim then
					if col_ray and col_ray.unit:in_slot(managers.slot:get_mask("enemies")) then
						self._autohit_current = (self._autohit_current + weight) / (1 + weight)
						hit_enemy(col_ray)
						autoaim = false
					else
						autoaim = false
						local autohit = self:check_autoaim(from_pos, direction, self._range)
						if autohit then
							local autohit_chance = 1 - math.clamp((self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0, 1)
							if autohit_chance > math.random() then
								self._autohit_current = (self._autohit_current + weight) / (1 + weight)
								hit_something = true
								hit_enemy(autohit)
							else
								self._autohit_current = self._autohit_current / (1 + weight)
							end
						elseif col_ray then
							hit_something = true
							hit_enemy(col_ray)
						end
					end
				elseif col_ray then
					hit_something = true
					hit_enemy(col_ray)
				end
			end
		end
		for _, col_ray in pairs(hit_enemies) do
			local damage = self:get_damage_falloff(damage, col_ray, user_unit)
			if damage > 0 then
				local result = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
				if not result or result.type == "death" then
				end
			end
		end
		if dodge_enemies and self._suppression then
			for enemy_data, dis_error in pairs(dodge_enemies) do
				enemy_data.unit:character_damage():build_suppression(suppr_mul * dis_error * self._suppression, self._panic_suppression_chance)
			end
		end
		result.hit_enemy = next(hit_enemies) and true or false
		if self._alert_events then
			result.rays = #col_rays > 0 and col_rays
		end
		managers.statistics:shot_fired({
			hit = false,
			weapon_unit = self._unit
		})
		for _, _ in pairs(hit_enemies) do
			managers.statistics:shot_fired({
				hit = true,
				weapon_unit = self._unit,
				skip_bullet_count = true
			})
		end
		return result
	end
--}
elseif RequiredScript == "lib/units/weapons/newraycastweaponbase" then
--{	

	
	local old_update_stats_values = NewRaycastWeaponBase._update_stats_values
	local ids_single = Idstring("single")
	local ids_auto = Idstring("auto")
	local track_weight = track_weight or nil
	function NewRaycastWeaponBase:_update_stats_values()
		old_update_stats_values(self)
		
		--Ozzy's burstfire stuff
		if not self:is_npc() then
			self._has_auto = not self._locked_fire_mode and (self:can_toggle_firemode() or self:weapon_tweak_data().FIRE_MODE == "auto") and true or false
			self._has_burst_fire = self._is_akimbo or (self:can_toggle_firemode() or self:weapon_tweak_data().BURST_FIRE) and self:weapon_tweak_data().BURST_FIRE ~= false
			self._burst_size = (self._is_akimbo and 2) or self:weapon_tweak_data().BURST_FIRE or 3
			
			--self._adaptive_burst_size = self._adaptive_burst_size or self:weapon_tweak_data().ADAPTIVE_BURST_SIZE or true
			--self._auto_anim_burst = self:weapon_tweak_data().AUTO_ANIM_BURST or nil
		end
			
		self._can_toggle_burst = self:weapon_tweak_data().CAN_TOGGLE_BURST or nil
		self._burst_fire_rate_multiplier = self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER or 1
		self._force_burst = self:weapon_tweak_data().force_burst or nil
		self._no_reset_burst = DMCWO.ar15_burst_suckage == true and self:weapon_tweak_data().NO_RESET_BURST or nil
		self._burst_delay = self:weapon_tweak_data().BURST_DELAY or nil
		self._no_ads_burst = self:weapon_tweak_data().NO_ADS_BURST or false
		self._auto_burst = self:weapon_tweak_data().AUTO_BURST or nil
		self._burst_fire_recoil_mult = self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER or nil
		self._burst_fire_hip_mult = self:weapon_tweak_data().BURST_FIRE_HIP_MULTIPLIER or nil
		
		self._no_ads_auto = self:weapon_tweak_data().NO_ADS_AUTO or false
		self._auto_fire_rate_multiplier = self:weapon_tweak_data().AUTO_FIRE_RATE_MULTIPLIER or nil
		self._auto_fire_recoil_mult = self:weapon_tweak_data().AUTO_FIRE_RECOIL_MULTIPLIER or nil
		self._auto_fire_hip_mult = self:weapon_tweak_data().AUTO_FIRE_HIP_MULTIPLIER or nil
			
		self._anim_delay = self:weapon_tweak_data().anim_delay or nil
		self._anim_speed_mult = self:weapon_tweak_data().anim_speed_mult or nil
		self._burst_anim_speed_mult = self:weapon_tweak_data().burst_anim_speed_mult or nil
		self._auto_anim_speed_mult = self:weapon_tweak_data().auto_anim_speed_mult or nil
		self._no_singlefire_anim = self:weapon_tweak_data().no_singlefire_anim or nil
		self._no_auto_anims = self:weapon_tweak_data().no_auto_anims or nil
		
		self._damage_bonus_range = self:weapon_tweak_data().damage_bonus_range or nil
		if self._damage_bonus_range then 
			self._damage_bonus_range = self._damage_bonus_range * 100
			self._damage_bonus = self:weapon_tweak_data().damage_bonus or 2
		end
		self._damage_near = (self:weapon_tweak_data().damage_near or 10) * 100 -- 10 meters
		self._damage_far = (self:weapon_tweak_data().damage_far or 80) * 100 -- 80 meters
		self._damage_min = self:weapon_tweak_data().damage_min or 3.0 -- 30 damage
		self._damage_near_set = nil
		self._damage_far_set = nil
		self._damage_min_set = nil
		
		self._flame_max_range = self:weapon_tweak_data().flame_max_range or nil
		
		self._recoil_speed = self:weapon_tweak_data().r_speed or 40
		self._center_speed = self:weapon_tweak_data().c_speed or 6
		self._recoil_recover = self:weapon_tweak_data().r_recover or 1
		
		self._movement_penalty = self:weapon_tweak_data().weapon_movement_penalty or tweak_data.upgrades.weapon_movement_penalty[self:weapon_tweak_data().category] or 1
				
		self._min_shield_pen_dam = self:weapon_tweak_data().min_shield_pen_dam or nil
		
		self._base_reload_speed_mult = self:weapon_tweak_data().reload_speed_mult or 1
		self._mod_reload_speed_mult = 1
		
		self._ads_speed_mult = 1
		
		self._rof_mult = 1
		
		self._penetration_power = self:weapon_tweak_data().penetration_power or 0.5
		self._penetration_damage = self:weapon_tweak_data().penetration_damage or 0.5
		
		self._starwars = nil
		self._is_tracer = nil
		
		self._has_ap = nil
		self._has_hp = nil
		
		self._use_sound = nil
		
		self._block_eq_aced = nil
				
		self._shield_damage = self:weapon_tweak_data().shield_damage or nil
		
		self._hipfire_mod = 1
		
		self._hs_mult = self:weapon_tweak_data().hs_mult or 1
		
		self._no_crits = self:weapon_tweak_data().no_crits or false
		
		self._stocker = 1
				
		self._ads_sms = self:weapon_tweak_data().ads_sms or 1
		self._sms = self:weapon_tweak_data().sms or 1
		
		self._dual_mags = nil
		self._ignore_dmg_boosts = nil
		
		self._shotsfired = 0
		self._fire_rate_init_count = self:weapon_tweak_data().fire_rate_init_count or nil
		self._fire_rate_init_mult = self:weapon_tweak_data().fire_rate_init_mult or 1
		
		self._jam_shotsfired = 0
		self._jam_it_in = self._jam_it_in or 0.0001
		self._stop_calc = false
		self._jam_start = self:weapon_tweak_data().jam_start or nil
		self._jam_add = self:weapon_tweak_data().jam_add or 0.00001 
		self._jam_cap = self:weapon_tweak_data().jam_cap or .025 
		self._jam_cd = self:weapon_tweak_data().jam_cd or 20
		
		self._ads_fire_only = self:weapon_tweak_data().ads_fire_only or false 
		
		self._no_recoil_anim = nil
		
		self._regen_rate = nil
		self._regen_rate_overheat = nil
		self._regen_ammo_time = nil
		self._overheat_pen = nil
		
		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
		for part_id, stats in pairs(custom_stats) do
			if stats.movement_speed then
				if self._movement_penalty * stats.movement_speed > 1 then
					self._movement_penalty = 1
				else
					self._movement_penalty = self._movement_penalty * stats.movement_speed
				end
			end
			if stats.hs_mult then
				if self._hs_mult * stats.hs_mult > 1 then
					self._hs_mult = 1
				else
					self._hs_mult = stats.hs_mult
				end
			end
			if stats.damage_near_set then
				self._damage_near_set = true
				self._damage_near = stats.damage_near_set * 100
			end
			if stats.damage_far_set then
				self._damage_far_set = true
				self._damage_far = stats.damage_far_set * 100
			end
			if stats.damage_min_set then
				self._damage_min_set = true
				self._damage_min = stats.damage_min_set
			end
			if stats.damage_near_mul and not stats.damage_near_set then
				self._damage_near = self._damage_near * stats.damage_near_mul
				if self._damage_bonus_range then 
					self._damage_bonus_range = self._damage_bonus_range * stats.damage_near_mul
				end
			end
			if stats.damage_far_mul and not stats.damage_far_set then
				self._damage_far = self._damage_far * stats.damage_far_mul
			end
			if stats.damage_min_mul and not stats.damage_min_set then
				self._damage_min = self._damage_min * stats.damage_min_mul
			end
			if stats.reload_speed_mult then
				self._mod_reload_speed_mult = self._mod_reload_speed_mult * stats.reload_speed_mult
			end
			if stats.ads_speed_mult then
				self._ads_speed_mult = self._ads_speed_mult * stats.ads_speed_mult
			end
			if stats.penetration_power_mult then
				self._penetration_power = self._penetration_power * stats.penetration_power_mult
			end
			if stats.penetration_damage_mult then
				self._penetration_damage = self._penetration_damage * stats.penetration_damage_mult
			end
			if stats.starwars then
				self._starwars = true
			end
			if stats.is_tracer then
				self._is_tracer = true
			end
			if stats.has_ap then
				self._has_ap = true
			elseif stats.has_hp then
				self._has_hp = true
			end
			if stats.has_burst_fire then
				self._has_burst_fire = stats.has_burst_fire
			end
			if stats.use_sound then
				self._use_sound = stats.use_sound
			end
			if stats.can_toggle_burst then
				self._can_toggle_burst = stats.can_toggle_burst
			end
			if stats.can_switch_selector then
				self._can_switch_selector = stats.can_switch_selector
			end
			if stats.block_eq_aced then
				self._block_eq_aced = stats.block_eq_aced
			end
			if stats.rof_mult then
				self._rof_mult = self._rof_mult * stats.rof_mult
			end
			if stats.burst_rof_mult then
				self._burst_fire_rate_multiplier = self._burst_fire_rate_multiplier * stats.burst_rof_mult
			end
			if stats.can_shoot_through_enemy then
				self._can_shoot_through_enemy = stats.can_shoot_through_enemy
			end
			if stats.can_shoot_through_wall then
				self._can_shoot_through_wall = stats.can_shoot_through_wall
			end
			if stats.can_shoot_through_shield then
				self._can_shoot_through_shield = stats.can_shoot_through_shield
			end
			if stats.shield_damage then
				self._shield_damage = self._shield_damage + stats.shield_damage
			end
			if stats.hipfire_mod then
				self._hipfire_mod = self._hipfire_mod * stats.hipfire_mod 
			end
			if stats.r_recover then
				self._recoil_recover = self._recoil_recover * stats.r_recover 
			end
			if stats.no_crits then
				self._no_crits = true
			end
			if stats.stocker then
				self._stocker = self._stocker * stats.stocker
			end
			if stats.dual_mags then
				self._dual_mags = true
				self._alternate_reload = true
			end
			if stats.ignore_dmg_boosts then
				self._ignore_dmg_boosts = true
			end
			if stats.burst_size then
				self._burst_size = stats.burst_size
			end
			if stats.force_burst then
				self._force_burst = true
			end
			if stats.burst_delay then
				self._burst_delay = stats.burst_delay
			end
			if stats.auto_burst then
				self._auto_burst = stats.burst_delay
			end
			if stats.no_recoil_anim  then
				self._no_recoil_anim = true
			end
			if stats.regen_rate then
				self._regen_rate = stats.regen_rate
			end	
			if stats.regen_rate_overheat then
				self._regen_rate_overheat = stats.regen_rate_overheat
			end	
			if stats.regen_ammo_time then
				self._regen_ammo_time = stats.regen_ammo_time
			end	
			if stats.overheat_pen then
				self._overheat_pen = stats.overheat_pen
			end	
			if stats.fire_rate_init_count then
				self._fire_rate_init_count = stats.fire_rate_init_count
			end
			if stats.fire_rate_init_mult  then
				self._fire_rate_init_mult = stats.fire_rate_init_mult
			end
			if self._flame_max_range and stats.flame_max_range_set then
				self._flame_max_range = stats.flame_max_range_set
				NewRaycastWeaponBase.flame_max_range = stats.flame_max_range_set
			end
			if stats.block_b_storm then
				if not self:weapon_tweak_data().sub_category then
					 self:weapon_tweak_data().sub_category = {}
				end
				self:weapon_tweak_data().sub_category = "grenade_launcher"
			end
			if stats.ammo_pickup_min_set then
				self._ammo_pickup[1] = stats.ammo_pickup_min_set
			end
			if stats.ammo_pickup_max_set then
				self._ammo_pickup[2] = stats.ammo_pickup_max_set
			end
			if tweak_data.weapon.factory.parts[part_id].type ~= "ammo" then
				if stats.ammo_pickup_min_mul then
					self._ammo_data.ammo_pickup_min_mul = self._ammo_data.ammo_pickup_min_mul and self._ammo_data.ammo_pickup_min_mul * stats.ammo_pickup_min_mul or stats.ammo_pickup_min_mul
				end
				if stats.ammo_pickup_max_mul then
					self._ammo_data.ammo_pickup_max_mul = self._ammo_data.ammo_pickup_max_mul and self._ammo_data.ammo_pickup_max_mul * stats.ammo_pickup_max_mul or stats.ammo_pickup_max_mul
				end
				if stats.fire_dot_data then
					self._ammo_data.fire_dot_data = stats.fire_dot_data
				end
			end
		end
		
		local pickup_type = tweak_data.levels:get_ai_group_type()		
		if pickup_type == "america" then
			if self:weapon_tweak_data().nato then
				self._ammo_pickup[1] = self._ammo_pickup[1] * 1.5
				self._ammo_pickup[2] = self._ammo_pickup[2] * 1.5
			end
		elseif pickup_type == "russia" then
			if self:weapon_tweak_data().warsaw then
				self._ammo_pickup[1] = self._ammo_pickup[1] * 1.5
				self._ammo_pickup[2] = self._ammo_pickup[2] * 1.5
			end
		end
		
		--[[
		track_weight = 1
		if self._movement_penalty < track_weight then
			track_weight = self._movement_penalty
		end
		]]
		if self._can_toggle_burst then
			self._fire_mode = Idstring("single")
			--self:_set_burst_mode(true, true)
		end
		self._silencer = managers.weapon_factory:has_perk("silencer", self._factory_id, self._blueprint)
		self._flash_hide = managers.weapon_factory:has_perk("flash_hider", self._factory_id, self._blueprint)
		self._side_comp = managers.weapon_factory:has_perk("side_comp", self._factory_id, self._blueprint)
		self._big_flash = managers.weapon_factory:has_perk("big_flash", self._factory_id, self._blueprint)
		if self._silencer then
			self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash_silenced or "effects/payday2/particles/weapons/9mm_auto_silence_fps")
		elseif self._ammo_data and self._ammo_data.muzzleflash ~= nil then
			self._muzzle_effect = Idstring(self._ammo_data.muzzleflash)
		elseif self._flash_hide then
			self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash_silenced or "effects/payday2/particles/weapons/9mm_auto_silence_fps")
		elseif self._side_comp then
			self._muzzle_effect = Idstring("effects/payday2/particles/weapons/50cal_auto_fps")
		elseif self._big_flash then
			self._muzzle_effect = Idstring("effects/payday2/particles/weapons/big_762_auto_fps")
		else
			self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash or "effects/particles/test/muzzleflash_maingun")
		end
		self._muzzle_effect_table = {
			effect = self._muzzle_effect,
			parent = self._obj_fire,
			force_synch = self._muzzle_effect_table.force_synch or false
		}
		
		self._check_damage = self._current_stats and self._current_stats.damage or 0		
		
		if self._scopes then
			local factory = tweak_data.weapon.factory
			for _, part_id in ipairs(self._scopes) do
				if factory.parts[part_id].type == "sight" then
					self._has_scope = true
				end
			end
		end
		
		self:_check_laser()
		self:fire_mode()
		self:can_toggle_firemode()
	end
	
	function NewRaycastWeaponBase:can_toggle_firemode()
		if self._can_toggle_burst == true then
			return false
		elseif self._can_switch_selector then
			if self._can_switch_selector == false then
				return false
			elseif self._can_switch_selector == true then
				return true
			end
		else
			return tweak_data.weapon[self._name_id].CAN_TOGGLE_FIREMODE
		end
	end	
	
	
	function NewRaycastWeaponBase:toggle_firemode()
		local state = managers.player:player_unit():movement():current_state()
		local can_toggle = not self._locked_fire_mode and self:can_toggle_firemode()
		--log(tostring( state._shooting ))
		if (can_toggle or self._has_burst_fire) and not (state and state._shooting) then
		--log("SWITCHING")
			if self._fire_mode == ids_single then
				if self._has_burst_fire then
					self:_set_burst_mode(true, true)
				end
				self._fire_mode = ids_auto
				self._sound_fire:post_event("wp_auto_switch_on")
			elseif self._fire_mode == ids_auto and self._has_burst_fire and self:in_burst_mode() then
				self:_set_burst_mode(false, true)
				self._track_burst = nil
				if self._can_toggle_burst then
					self._fire_mode = ids_single
					self._sound_fire:post_event("wp_auto_switch_off")
				else
					self._fire_mode = ids_auto
					self._sound_fire:post_event("wp_auto_switch_on")
				end
			elseif self._fire_mode == ids_auto and not self:in_burst_mode() then
				self._track_burst = nil
				self._fire_mode = ids_single
				self._sound_fire:post_event("wp_auto_switch_off")
			end
			return true
		end
		if (can_toggle or self._has_burst_fire) and (state and state._shooting) then
			managers.hud:show_hint({text = "Cannot switch firemode while shooting!",time = 3})
		end
		return false
	end
		
	function NewRaycastWeaponBase:_set_burst_mode(status, skip_sound)
		self._in_burst_mode = status
		--log("BURST STATUS: " .. tostring(status))
		self._fire_mode = Idstring(status and "auto" or "single")
		if not skip_sound then
			self._sound_fire:post_event(status and "wp_auto_switch_on" or self._has_auto and "wp_auto_switch_on" or "wp_auto_switch_off")
		end
	end
		
	local old_stop_shooting_original = NewRaycastWeaponBase.stop_shooting
	function RaycastWeaponBase:stop_shooting()
		if self._no_reset_burst and self:in_burst_mode() then
			self._track_burst = (self._track_burst and self._track_burst + self._shotsfired) or self._shotsfired
			if self._track_burst and self._track_burst >= self._burst_size then
				self._track_burst = nil
			end
		else
			self._track_burst = nil
		end
		self._shotsfired = 0
		old_stop_shooting_original(self)
	end
	
	local old_fire_original = NewRaycastWeaponBase.fire
	function NewRaycastWeaponBase:fire(...)	
		local result = {}
		if DMCWO.GEDDAN == true then 
			local consume_ammo = not managers.player:has_activate_temporary_upgrade("temporary", "no_ammo_cost")
			if consume_ammo and self._jam_start and not self._starwars then
				self._jam_shotsfired = self._jam_shotsfired + 1
				--log( "shots fired: " .. tostring(self._jam_shotsfired) )
				local rando = math.random(2,0)
				local rando_2 = self._jam_add * rando
				if self._jam_shotsfired >= self._jam_start then
					if self._stop_calc ~= true then
						self._jam_it_in = self._jam_it_in + rando_2
					end
					local loli_butts = math.random()
					if self._jam_it_in > self._jam_cap then
						--log( "JAM CHANCE CAPPED AT: " .. tostring(self._jam_cap * 100) .. "%")
						self._jam_it_in = self._jam_cap
						self._stop_calc = true
					end
					--log( "chance: " ..tostring(self._jam_it_in * 100) .. "%" )
					--log( "roll: " .. tostring(loli_butts * 100) )
					if self._jam_it_in >= loli_butts then
						--log("\nLOL JAM\n")
						self._jam_start = self._jam_shotsfired + self._jam_cd
						managers.player:local_player():sound():say("g29",false,nil)
						self:set_ammo_remaining_in_clip(0, true)
					end
				end
			end	
		end
		
		if self._ads_fire_only == true then 
			local state = managers.player:player_unit():movement():current_state()
			local bypass = managers.player:player_unit():movement():current_state_name() == "tased" or managers.player:player_unit():movement():current_state_name() == "bleed_out"
			if state._state_data.in_full_steelsight or bypass then	
				self._shotsfired = self._shotsfired + 1
				result = old_fire_original(self, ...)
				return result
			else 
				managers.hud:show_hint({text = "You must be fully aiming to fire this weapon!",time = 3})
				self:play_tweak_data_sound("dryfire")
				--managers.player:local_player():sound():say("g10",nil,false)
			end
		else 
			self._shotsfired = self._shotsfired + 1
				
			if self._track_burst and self._track_burst >= self._burst_size then
				self._track_burst = nil
			end
			result = old_fire_original(self, ...)
			return result
		end
	end
		
		
	function NewRaycastWeaponBase:set_ammo_remaining_in_clip(ammo, no_check)
		NewRaycastWeaponBase.super.set_ammo_remaining_in_clip(self, ammo)
		if not no_check then
			self:check_bullet_objects()
		end
	end
		
	function NewRaycastWeaponBase:update_damage()
		if not tweak_data.weapon[self._name_id].ignore_damage_upgrades or not self._ignore_dmg_boosts then
			self._damage = ((self._current_stats and self._current_stats.damage or 0) + self:damage_addend()) * self:damage_multiplier()
		else
			self._damage = self._current_stats and self._current_stats.damage or 0
		end
	end
	
	function NewRaycastWeaponBase:play_tweak_data_sound(event, alternative_event)
		local sounds = self._use_sound and tweak_data.weapon[self._use_sound].sounds or tweak_data.weapon[self._name_id].sounds
		local event = sounds and (sounds[event] or sounds[alternative_event])
		if event then
			self:play_sound(event)
		end
	end

	function NewRaycastWeaponBase:fire_mode()
		self._fire_mode = self._locked_fire_mode or self._fire_mode or (self:in_burst_mode() and Idstring("auto")) or Idstring(tweak_data.weapon[self._name_id].FIRE_MODE or "single")
		return self._fire_mode == ids_single and "single" or "auto"
	end
	
	function NewRaycastWeaponBase:recoil_wait()
		return nil
	end
	
	function NewRaycastWeaponBase:movement_penalty()
		local mult = 1
		local state = managers.player:player_unit():movement():current_state()
		
		local dicks = 1.8918918918918918918918918918919
		if state._state_data.ducking then
			dicks = 1.2162162162162162162162162162162
		end		
		if state._state_data.in_steelsight and not managers.player:has_category_upgrade("player", "steelsight_normal_movement_speed") then
			if self:weapon_tweak_data().ams then
				mult = dicks * self:weapon_tweak_data().ams
			else
				mult = dicks * 0.5
			end
			
			--bullpup bonus speed
			if self:weapon_tweak_data().is_bullpup then 
				mult = mult * 1.2
			end	
			
			--mult = mult * self._stocker
		
		end
		
		if (state._state_data.reload_expire_t or state._state_data.reload_enter_expire_t or state._state_data.reload_exit_expire_t) and self:weapon_tweak_data().rms then
			mult = mult * self:weapon_tweak_data().rms
		end
		
		if state._shooting then
			if state._state_data.in_steelsight then
				mult = mult * self._ads_sms
			else
				mult = mult * self._sms
			end
		end
		
		--if magic occurs, prevents modified steelsight speeds exceeding the walking/crouched state's speed
		if mult > dicks then
			mult = dicks
		end
		
		return (track_weight or self._movement_penalty or 1) * mult
	end
			
	function NewRaycastWeaponBase:get_damage_falloff(damage, col_ray, user_unit, distance)
		local dist = distance or col_ray.distance or mvector3.distance(col_ray.unit:position(), user_unit:position())
		local fuck = ( (self._current_stats.damage / self._damage) * damage )
		local min_damage = self._damage_min or 0
		if min_damage > damage then
			min_damage = damage
		end
		
		if DMCWO.debug_range == true then
			log("Dist: " .. tostring(dist/100) .. "\nDrop Start: " .. tostring(self._damage_near/100) .. "m\n\nInit Dmg: " .. tostring(damage * 10) .. "\nMin. Dmg at: " .. tostring(self._damage_far/100) .. "m \nMin. Dmg: " .. tostring( (min_damage) * 10) .. "\n")
		end
		
		if self._damage_bonus_range and dist < self._damage_bonus_range then
			damage = damage + (self._damage_bonus or 0)
		elseif dist > self._damage_near and dist < self._damage_far then
			damage = damage - (( dist - self._damage_near) / ( self._damage_far - self._damage_near ) * ( damage - min_damage ))
		elseif dist >= self._damage_far then
			damage = min_damage 
		end
		
		if DMCWO.debug_range == true then
			log("Impact Dmg: " .. tostring(damage * 10) .. "\n\n") --Damage on impact
		end
		
		return damage
	end

 
	local mvec_to = Vector3()
	local mvec_spread_direction = Vector3()
	local mvec1 = Vector3()
	function NewRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
		local result = {}
		local hit_unit
		local total_distance
		local spread = self:_get_spread(user_unit)
		mvector3.set(mvec_spread_direction, direction)
		if spread then
			mvector3.spread(mvec_spread_direction, spread * (spread_mul or 1))
		end
		local ray_distance = shoot_through_data and shoot_through_data.ray_distance or 20000
		mvector3.set(mvec_to, mvec_spread_direction)
		mvector3.multiply(mvec_to, ray_distance)
		mvector3.add(mvec_to, from_pos)
		if DMCWO.debug_damage == true or self._ignore_dmg_boosts then
			dmg_mul = 1
		end
		local damage = self:_get_current_damage(dmg_mul)
		local ray_from_unit = shoot_through_data and alive(shoot_through_data.ray_from_unit) and shoot_through_data.ray_from_unit or nil
		local col_ray = (ray_from_unit or World):raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
		
		if shoot_through_data and col_ray and col_ray.unit then
			total_distance = (shoot_through_data.total_distance + col_ray.distance) or col_ray.distance
		end
				
		if shoot_through_data and shoot_through_data.has_hit_wall then
			if not col_ray then
				return result
			end
			mvector3.set(mvec1, col_ray.ray)
			mvector3.multiply(mvec1, -5)
			mvector3.add(mvec1, col_ray.position)
			local ray_blocked = World:raycast("ray", mvec1, shoot_through_data.from, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "report")
			if ray_blocked then
				return result
			end
		end
		local autoaim, suppression_enemies = self:check_autoaim(from_pos, direction)
		if self._autoaim then
			local weight = 0.1
			if col_ray and col_ray.unit:in_slot(managers.slot:get_mask("enemies")) then
				self._autohit_current = (self._autohit_current + weight) / (1 + weight)
				damage = self:get_damage_falloff(damage, col_ray, user_unit, total_distance)
				hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			elseif autoaim then
				local autohit_chance = 1 - math.clamp((self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0, 1)
				if autohit_mul then
					autohit_chance = autohit_chance * autohit_mul
				end
				if autohit_chance > math.random() then
					self._autohit_current = (self._autohit_current + weight) / (1 + weight)
					damage = self:get_damage_falloff(damage, autoaim, user_unit, total_distance)
					hit_unit = self._bullet_class:on_collision(autoaim, self._unit, user_unit, damage)
					col_ray = autoaim
				else
					self._autohit_current = self._autohit_current / (1 + weight)
				end
			elseif col_ray then
				damage = self:get_damage_falloff(damage, col_ray, user_unit, total_distance)
				hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			end
			self._shot_fired_stats_table.hit = hit_unit and true or false
			if (not shoot_through_data or hit_unit) and (not self._ammo_data or not self._ammo_data.ignore_statistic) and not self._rays then
				self._shot_fired_stats_table.skip_bullet_count = shoot_through_data and true
				managers.statistics:shot_fired(self._shot_fired_stats_table)
			end
		elseif col_ray then
			damage = self:get_damage_falloff(damage, col_ray, user_unit, total_distance)
			hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
		end
		if suppression_enemies and self._suppression then
			result.enemies_in_cone = suppression_enemies
		end
		if hit_unit and hit_unit.type == "death" and self:weapon_tweak_data().category == tweak_data.achievement.easy_as_breathing.weapon_type then
			local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
			if unit_type and not CopDamage.is_civilian(unit_type) then
				self._kills_without_releasing_trigger = (self._kills_without_releasing_trigger or 0) + 1
				if self._kills_without_releasing_trigger >= tweak_data.achievement.easy_as_breathing.count then
					managers.achievment:award(tweak_data.achievement.easy_as_breathing.award)
				end
			end
		end
		if col_ray then
			local tracer_dist = total_distance or col_ray.distance
			if (col_ray and tracer_dist > 300 or not col_ray) and alive(self._obj_fire) and not shoot_through_data then
				self._obj_fire:m_position(self._trail_effect_table.position)
				mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)
				if self:weapon_tweak_data().has_trail == true or self._starwars == true or self._is_tracer == true then
					self._trail_effect_table.effect = Idstring("effects/particles/weapons/sniper_trail")
				end
				local clamp_dist = tracer_dist
				if self._starwars or self._is_tracer then
					clamp_dist = 0.01
				end
				local trail = World:effect_manager():spawn(self._trail_effect_table)
				if col_ray then
					World:effect_manager():set_remaining_lifetime(trail, math.clamp(tracer_dist / 10000, 0, clamp_dist))
				end
			end
		elseif not col_ray then
			self._obj_fire:m_position(self._trail_effect_table.position)
			mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)
			if self:weapon_tweak_data().has_trail == true or self._starwars == true or self._is_tracer == true then
				self._trail_effect_table.effect = Idstring("effects/particles/weapons/sniper_trail")
			end
			local clamp_dist = 0.5
			if self._starwars or self._is_tracer then
				clamp_dist = 0.01
			end
			local trail = World:effect_manager():spawn(self._trail_effect_table)
			World:effect_manager():set_remaining_lifetime(trail, clamp_dist)
		end
		result.hit_enemy = hit_unit
		if self._alert_events then
			result.rays = {col_ray}
		end
	
		repeat
			if col_ray and col_ray.unit then
				
				local kills
				if hit_unit then
					if not self._can_shoot_through_enemy then
						break
					end
					local killed = hit_unit.type == "death"
					local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
					
					local is_enemy = unit_type ~= "civilian" and unit_type ~= "civilian_female" and unit_type ~= "bank_manager"
					kills = ( shoot_through_data and shoot_through_data.kills or 0 ) + ( killed and is_enemy and 1 or 0 )
				end
				
				self._shoot_through_data.kills = kills
				
				if ( col_ray.distance < 0.1 ) or
					( ray_distance - col_ray.distance < 50 ) then
						break
				end
				
				local has_hit_wall = shoot_through_data and shoot_through_data.has_hit_wall
				local has_passed_shield = shoot_through_data and shoot_through_data.has_passed_shield
				local is_shoot_through, is_shield, is_wall
				if hit_unit then
				else
					local is_world_geometry = col_ray.unit:in_slot( managers.slot:get_mask( "world_geometry" ) )
					if is_world_geometry then
						is_shoot_through = not col_ray.body:has_ray_type( Idstring( "ai_vision" ) )
						
						if not is_shoot_through then
							if has_hit_wall or not self._can_shoot_through_wall then
								break
							end
							is_wall = true
						end
					else
						--log("Hit shield")
						if self._can_shoot_through_shield ~= true then
							--log("Can't shoot through shield")
							break
						end
						if self._min_shield_pen_dam and damage < (self._damage * self._min_shield_pen_dam) then 
							--log("Failed to penetrate shield: Below damage threshold!")
							break
						end
						is_shield = col_ray.unit:in_slot( 8 ) --[[and alive( col_ray.unit:parent() )]]
					end
				end
				
				if not hit_unit and not is_shoot_through and not is_shield and not is_wall then
					break
				end
				
				local ray_from_unit = hit_unit and col_ray.unit
				if is_shield then
					dmg_mul = ( dmg_mul or 1 ) * (self._shield_damage or 0.10)
					if col_ray.unit:name():key() == '8816e70e510c8c2e' then --fbi
						dmg_mul = dmg_mul * 0.75
					elseif col_ray.unit:name():key() == 'af254947f0288a6c' or col_ray.unit:name():key() == '63c0a27ecd41fc5e' then --phalanx/russian
						dmg_mul = dmg_mul * 0.5
					elseif col_ray.unit:name():key() == '4a4a5e0034dd5340' then --winters
						dmg_mul = dmg_mul * 0.25
					end
				end

				self._shoot_through_data.has_hit_wall = has_hit_wall or is_wall
				self._shoot_through_data.has_passed_shield = has_passed_shield or is_shield
				self._shoot_through_data.ray_from_unit = ray_from_unit
				self._shoot_through_data.ray_distance = ray_distance - col_ray.distance
		
				mvector3.set( self._shoot_through_data.from, mvec_spread_direction )
				
				local penetration_power = self._penetration_power
				local penetration
				if (damage * 10) * penetration_power > 55 then
					penetration = 55
				else
					penetration = (damage * 10) * penetration_power
				end
				
				local penetration_damage = self._penetration_damage
				if is_wall then
					if penetration_damage > 1 then
						penetration_damage = 1
					end
					dmg_mul = ( dmg_mul or 1 ) * penetration_damage
					spread_mul = ( spread_mul or 1 ) * 2
				end
				
				mvector3.multiply( self._shoot_through_data.from, (is_shield and 20) or (is_wall and penetration) or 40)
				mvector3.add( self._shoot_through_data.from, col_ray.position )
				
				local penetration_dist = math.sqrt(((col_ray.position.x - self._shoot_through_data.from.x) ^ 2) + ((col_ray.position.y - self._shoot_through_data.from.y) ^ 2) + ((col_ray.position.z - self._shoot_through_data.from.z) ^ 2)) or 0
				
				local dongs
				if col_ray and col_ray.unit then
					dongs = col_ray.distance
				end
				if total_distance ~= nil then
					dongs = total_distance
				end
					
				self._shoot_through_data.total_distance = dongs + penetration_dist
				
				managers.game_play_central:queue_fire_raycast( Application:time() + 0.0125, self._unit, user_unit, self._shoot_through_data.from, mvec_spread_direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, self._shoot_through_data )
			end
		until true
		
		if self._shoot_through_data and hit_unit and col_ray and self._shoot_through_data.kills and 0 < self._shoot_through_data.kills and hit_unit.type == "death" then
			local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
			local multi_kill, enemy_pass, obstacle_pass, weapon_pass, weapons_pass, weapon_type_pass
			for achievement, achievement_data in pairs(tweak_data.achievement.sniper_kill_achievements) do
				multi_kill = not achievement_data.multi_kill or self._shoot_through_data.kills == achievement_data.multi_kill
				enemy_pass = not achievement_data.enemy or unit_type == achievement_data.enemy
				obstacle_pass = not achievement_data.obstacle or achievement_data.obstacle == "wall" and self._shoot_through_data.has_hit_wall or achievement_data.obstacle == "shield" and self._shoot_through_data.has_passed_shield
				weapon_pass = not achievement_data.weapon or self._name_id == achievement_data.weapon
				weapons_pass = not achievement_data.weapons or table.contains(achievement_data.weapons, self._name_id)
				weapon_type_pass = not achievement_data.weapon_type or self:weapon_tweak_data().category == achievement_data.weapon_type
				if multi_kill and enemy_pass and obstacle_pass and weapon_pass and weapons_pass and weapon_type_pass then
					if achievement_data.stat then
						managers.achievment:award_progress(achievement_data.stat)
					elseif achievement_data.award then
						managers.achievment:award(achievement_data.award)
					end
				end
			end
		end
		return result
	end

	function NewRaycastWeaponBase:_check_laser()
		self._laser_data = nil
		if self._has_gadget then
			local factory = tweak_data.weapon.factory
			for _, part_id in ipairs(self._has_gadget) do
				if factory.parts[part_id].sub_type == "laser" then
					self._laser_data = {}
					self._laser_data.part_id = part_id
					self._laser_data.unit = self._parts and self._parts[part_id] and alive(self._parts[part_id].unit) and self._parts[part_id].unit
				end
			end
		end
	end
		
	function NewRaycastWeaponBase:_is_laser_on()
		if not self._laser_data or not self._laser_data.unit then
			return false
		end
		return self._laser_data.unit:base():is_on()
	end
	
	function NewRaycastWeaponBase:_laser_spread()
		if self:_is_laser_on() then
			return 0.8 --20% spread reduction
		else
			return 1
		end
	end
	
	function NewRaycastWeaponBase:_get_min_spread()
		local multiplier = 1
		local current_state = managers.player:player_unit():movement()._current_state
		multiplier = multiplier * (managers.player:upgrade_value("weapon", "spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value(self:weapon_tweak_data().category, "spread_multiplier", 1))
		if self:weapon_tweak_data().sub_category then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "spread_multiplier", 1)
		end
		multiplier = multiplier * (managers.player:upgrade_value("weapon", self:fire_mode() .. "_spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value(self._name_id, "spread_multiplier", 1))
		if self._silencer then
			multiplier = multiplier * (managers.player:upgrade_value("weapon", "silencer_spread_multiplier", 1))
			multiplier = multiplier * (managers.player:upgrade_value(self:weapon_tweak_data().category, "silencer_spread_multiplier", 1))
			if self:weapon_tweak_data().sub_category then
				multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "silencer_spread_multiplier", 1)
			end
		end
		if current_state._moving then
			multiplier = multiplier * (managers.player:upgrade_value(self:weapon_tweak_data().category, "move_spread_multiplier", 1))
			if self:weapon_tweak_data().sub_category then
				multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "move_spread_multiplier", 1)
			end
			multiplier = multiplier * (managers.player:team_upgrade_value("weapon", "move_spread_multiplier", 1))
		end
		if current_state._state_data.using_bipod then
			multiplier = multiplier * 0.5
		end
		multiplier = multiplier * ( self:weapon_tweak_data().spread[current_state._moving and "moving_steelsight" or "steelsight"])
		local min_spread = multiplier * self._spread
		return min_spread
	end
	
	function NewRaycastWeaponBase:_get_spread(user_unit)
		--local state = managers.player:player_unit():movement()._current_state
		local current_state = user_unit:movement()._current_state
		local spread_multiplier = self:spread_multiplier(current_state)
		local min_spread = self:_get_min_spread()
		local the_ass_was_fat = self._spread
		if self._hipfire_mod and not current_state:in_steelsight() then
			spread_multiplier = spread_multiplier * self._hipfire_mod
		end
		--log( tostring( self._spread ) )
		if not current_state:in_steelsight() and the_ass_was_fat < 0.5 then
			the_ass_was_fat = 0.5
		end
		if not ( current_state:in_steelsight() or current_state:_is_using_bipod() ) then
			spread_multiplier = spread_multiplier * self:_laser_spread()
		elseif tweak_data.weapon[self._name_id].always_hipfire == true then 
			spread_multiplier = spread_multiplier * self:_laser_spread()
		end
		
		local spread = the_ass_was_fat * spread_multiplier
		if spread > 20 then
			spread = 20
		elseif spread < min_spread then
			spread = min_spread
		end
		if self:in_burst_mode() and self._burst_fire_hip_mult then
			spread = spread * self._burst_fire_hip_mult
		end
		if not self:in_burst_mode() and self._firemode == Idstring("auto") and self._auto_fire_hip_mult then
			spread = spread * self._auto_fire_hip_mult
		end
		return spread
	end

	--[[	recoil multipler stuff	]]--
	function NewRaycastWeaponBase:recoil_multiplier()
		local current_state = managers.player:player_unit():movement()._current_state
		return managers.blackmarket:recoil_multiplier(self._name_id, self:weapon_tweak_data().category, self:weapon_tweak_data().sub_category, self._silencer, self._blueprint) * ((current_state and current_state._state_data.in_air and 2) or 1)
		* ((current_state and current_state._state_data.ducking and 0.7) or 1) * ((self:in_burst_mode() and self._burst_fire_recoil_mult) or (self._firemode == Idstring("auto") and not self:in_burst_mode() and self._auto_fire_recoil_mult) or 1)
	end
	
	--[[	fire rate multipler in-game stuff	]]--
	function NewRaycastWeaponBase:fire_rate_multiplier()
		local multiplier = self._rof_mult or 1
		
		if self._fire_mode == Idstring("auto") and not self:in_burst_mode() and self._auto_fire_rate_multiplier then
			multiplier = multiplier * self._auto_fire_rate_multiplier
		end
		
		if self._fire_rate_init_count and (self._fire_rate_init_count > self._shotsfired) and self:fire_mode() ~= "single" then
		--log("DICSK")
			multiplier = multiplier * self._fire_rate_init_mult
		end
		
		if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "fire_rate_multiplier") then
			if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
				multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "fire_rate_multiplier", 1)
			end
		end
		if self:weapon_tweak_data().sub_category then
			if not self:upgrade_blocked(tweak_data.weapon[self._name_id].sub_category, "fire_rate_multiplier") then
				if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
					multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "fire_rate_multiplier", 1)
				end
			end
		end
		if not self:upgrade_blocked("weapon", "fire_rate_multiplier") then
			if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
				multiplier = multiplier * managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1)
			end
		end
		if not self:upgrade_blocked(self._name_id, "fire_rate_multiplier") then
			if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
				multiplier = multiplier * managers.player:upgrade_value(self._name_id, "fire_rate_multiplier", 1)
			end
		end
		
		return multiplier * ( (self:in_burst_mode() and self._burst_fire_rate_multiplier) or 1)
	end
	
		
	--[[	Reload stuff	]]--
	function NewRaycastWeaponBase:reload_speed_multiplier()
		local multiplier = 1
		multiplier = multiplier * self._base_reload_speed_mult
		if self._dual_mags then
			if self._alternate_reload == true then
				multiplier = multiplier * self._mod_reload_speed_mult
			end
		else
			multiplier = multiplier * self._mod_reload_speed_mult
		end
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "reload_speed_multiplier", 1)
		if self:weapon_tweak_data().sub_category then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "reload_speed_multiplier", 1)
		end
		multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)
		if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
			local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()
			if morale_boost_bonus then
				multiplier = multiplier * morale_boost_bonus.reload_speed_bonus
			end
		end
		return multiplier
	end
	
	function NewRaycastWeaponBase:exit_run_speed_multiplier()
		local multiplier = managers.player:upgrade_value(self:weapon_tweak_data().category, "exit_run_speed_multiplier", 1)
		if self:weapon_tweak_data().sub_category then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "exit_run_speed_multiplier", 1)
		end
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "exit_run_speed_multiplier", 1)
		multiplier = multiplier / ( (self:weapon_tweak_data().sprintout_time or 0.300) / 0.45 )
		return multiplier
	end

	function NewRaycastWeaponBase:enter_steelsight_speed_multiplier()
		local multiplier = 1
		local ads_time = self:weapon_tweak_data().ADS_TIMER or 0.200
		
		multiplier = multiplier / ( ads_time / tweak_data.player.TRANSITION_DURATION)
					
		multiplier = multiplier * self._ads_speed_mult
		
		if self:weapon_tweak_data().category == "assault_rifle" and self:weapon_tweak_data().recategorize == "battle_rifle" then
			multiplier = multiplier * managers.player:upgrade_value("snp", "enter_steelsight_speed_multiplier", 1)
		else
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "enter_steelsight_speed_multiplier", 1)
		end
		if self:weapon_tweak_data().sub_category then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "enter_steelsight_speed_multiplier", 1)
		end
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "combat_medic_enter_steelsight_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "enter_steelsight_speed_multiplier", 1)
		
		if self._silencer then
			multiplier = multiplier * managers.player:upgrade_value("weapon", "silencer_enter_steelsight_speed_multiplier", 1)
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "silencer_enter_steelsight_speed_multiplier", 1)
		end
		--[[ local state = managers.player:player_unit():movement():current_state()
		if state._shooting then
			multiplier = multiplier * 0.75
		end ]]
		return multiplier
	end
			
--}
end
