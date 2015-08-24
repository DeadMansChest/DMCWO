--[[
v1.42
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/units/weapons/raycastweaponbase" then
	
	if DMCWO.fix_pickup then
	--While I made this myself, credits to LazyOzzy for making the pickup fix in the first place
		function RaycastWeaponBase:add_ammo(ratio, add_amount_override)
			if self:ammo_max() then
				return false
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
				picked_up = rng_ammo > 0
				add_amount = math.max(0, math.round(rng_ammo))
			end
			add_amount = math.floor(add_amount * (ratio or 1))
			self:set_ammo_total(math.clamp(self:get_ammo_total() + add_amount, 0, self:get_ammo_max()))
			if Application:production_build() then
				managers.player:add_weapon_ammo_gain(self._name_id, add_amount)
			end
			return picked_up
		end
	end


elseif RequiredScript == "lib/managers/blackmarketmanager" then
--{

	--fire rate multiplier blackmarket statchart stuff	
	function BlackMarketManager:fire_rate_multiplier(name, category, silencer, detection_risk, current_state, blueprint)
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
		return multiplier
	end
	
	function BlackMarketManager:accuracy_multiplier(name, category, silencer, current_state, fire_mode, blueprint)
		local multiplier = 1
		multiplier = multiplier * (managers.player:upgrade_value("weapon", "spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value(category, "spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value("weapon", fire_mode .. "_spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value(name, "spread_multiplier", 1))
		if silencer then
			multiplier = multiplier * (managers.player:upgrade_value("weapon", "silencer_spread_multiplier", 1))
			multiplier = multiplier * (managers.player:upgrade_value(category, "silencer_spread_multiplier", 1))
		end
		if current_state then
			if self._name_id ~= "flamethrower_mk2" then
				if current_state._state_data.in_air and not	current_state:in_steelsight() then
					multiplier = multiplier * 2
				elseif current_state._state_data.in_air and	current_state:in_steelsight() then
					multiplier = multiplier * 1.25
				end
			end
			if current_state._moving then
				multiplier = multiplier * (managers.player:upgrade_value(category, "move_spread_multiplier", 1))
				multiplier = multiplier * (managers.player:team_upgrade_value("weapon", "move_spread_multiplier", 1))
				multiplier = multiplier * (self._spread_moving or 1)
			end
			if current_state:in_steelsight() then
				multiplier = multiplier * (tweak_data.weapon[name].spread[current_state._moving and "moving_steelsight" or "steelsight"])
			else
				multiplier = multiplier * (managers.player:upgrade_value(category, "hip_fire_spread_multiplier", 1))
				if current_state._state_data.ducking then
					multiplier = multiplier * (tweak_data.weapon[name].spread[current_state._moving and "moving_crouching" or "crouching"])
				else
					multiplier = multiplier * (tweak_data.weapon[name].spread[current_state._moving and "moving_standing" or "standing"])
				end
			end
		end
		if blueprint and self:is_weapon_modified(managers.weapon_factory:get_factory_id_by_weapon_id(name), blueprint) then
			multiplier = multiplier * (managers.player:upgrade_value("weapon", "modded_spread_multiplier", 1))
		end
		return multiplier
	end

--}	
elseif RequiredScript == "lib/units/weapons/newraycastweaponbase" then
--{	

	
	local old_update_stats_values = NewRaycastWeaponBase._update_stats_values
	local ids_single = Idstring("single")
	local ids_auto = Idstring("auto")
	function NewRaycastWeaponBase:_update_stats_values()
		old_update_stats_values(self)
		
		--Ozzy's burstfire stuff
		if not self:is_npc() then
			self._has_auto = not self._locked_fire_mode and (self:can_toggle_firemode() or self:weapon_tweak_data().FIRE_MODE == "auto") and true or false
			self._has_burst_fire = self._is_akimbo or (self:can_toggle_firemode() or self:weapon_tweak_data().BURST_FIRE) and self:weapon_tweak_data().BURST_FIRE ~= false
			self._burst_size = (self._is_akimbo and 2) or self:weapon_tweak_data().BURST_FIRE or 3
			self._adaptive_burst_size = self:weapon_tweak_data().ADAPTIVE_BURST_SIZE or false
			self._burst_fire_rate_multiplier = self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER or 1
		end
		
		self._damage_near = self:weapon_tweak_data().damage_near or 1000 -- 10 m
		self._damage_far = self:weapon_tweak_data().damage_far or 20000 -- 200 m
		self._damage_near = self._damage_near * 100
		self._damage_far = self._damage_far * 100
		self._damage_min = self:weapon_tweak_data().damage_min or 0.5 -- maximum 60% drop
		self._recoil_speed = self:weapon_tweak_data().r_speed or 40
		self._center_speed = self:weapon_tweak_data().c_speed or 6
		self._recoil_recover = self:weapon_tweak_data().r_recover or 1
		self._movement_penalty = self:weapon_tweak_data().weapon_movement_penalty or 1
		self._min_shield_pen_dam = self:weapon_tweak_data().min_shield_pen_dam or nil
		self._reload_speed_mult = 1
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
		self._disable_selector = false
		self._shield_damage = self:weapon_tweak_data().shield_damage or nil
		self._hipfire_mod = 1
		
		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
		for part_id, stats in pairs(custom_stats) do
			if stats.movement_speed then
				self._movement_penalty = self._movement_penalty * stats.movement_speed
			end
			if stats.damage_near_mul then
				self._damage_near = self._damage_near * stats.damage_near_mul
			end
			if stats.damage_far_mul then
				self._damage_far = self._damage_far * stats.damage_far_mul
			end
			if stats.damage_min then
				self._damage_min = self._damage_min * stats.damage_min
			end
			if stats.reload_speed_mult then
				self._reload_speed_mult = self._reload_speed_mult * stats.reload_speed_mult
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
			if stats.disable_selector then
				self._disable_selector = stats.disable_selector
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
			if tweak_data.weapon.factory.parts[part_id].type ~= "ammo" then
				if stats.ammo_pickup_min_mul then
					self._ammo_data.ammo_pickup_min_mul = self._ammo_data.ammo_pickup_min_mul and self._ammo_data.ammo_pickup_min_mul * stats.ammo_pickup_min_mul or stats.ammo_pickup_min_mul
				end
				if stats.ammo_pickup_max_mul then
					self._ammo_data.ammo_pickup_max_mul = self._ammo_data.ammo_pickup_max_mul and self._ammo_data.ammo_pickup_max_mul * stats.ammo_pickup_max_mul or stats.ammo_pickup_max_mul
				end
			end
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
							
		self:_check_laser()
		self:fire_mode()
		self:can_toggle_firemode()
	end
	
	function NewRaycastWeaponBase:can_toggle_firemode()
		if self._disable_selector == true then
			return false
		else
			return tweak_data.weapon[self._name_id].CAN_TOGGLE_FIREMODE
		end
	end
	
	function NewRaycastWeaponBase:update_damage()
		if not tweak_data.weapon[self._name_id].ignore_damage_upgrades == true then
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
		self._fire_mode = self._locked_fire_mode or self._fire_mode or Idstring(tweak_data.weapon[self._name_id].FIRE_MODE or "single")
		if self._disable_selector == true then
			return "single"
		end
		return self._fire_mode == ids_single and "single" or "auto"
	end
	
	function NewRaycastWeaponBase:recoil_wait()
		return nil
	end
		
	function NewRaycastWeaponBase:get_damage_falloff(damage, col_ray, user_unit, distance)
		local dist = distance or col_ray.distance or mvector3.distance(col_ray.unit:position(), user_unit:position())
		local min_damage = (((self._current_stats.damage / self._damage) * damage) * self._damage_min)
		
		if DMCWO.debug_range == true then
			log("Dist: " .. tostring(dist/100) .. "\nDrop Start: " .. tostring(self._damage_near/100) .. "m\n\nInit Dmg: " .. tostring(damage * 10) .. "\nMin. Dmg at: " .. tostring(self._damage_far/100) .. "m \nMin. Dmg: " .. tostring(min_damage * 10) .. "\n")
		end
		
		if dist > self._damage_near and dist < self._damage_far then
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
			if (not shoot_through_data or hit_unit) and (not self._ammo_data or not self._ammo_data.ignore_statistic) then
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
			if (col_ray and tracer_dist > 0 or not col_ray) and alive(self._obj_fire) and not shoot_through_data then
				self._obj_fire:m_position(self._trail_effect_table.position)
				mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)
				if self:weapon_tweak_data().has_trail == true or self._starwars == true then
					self._trail_effect_table.effect = Idstring("effects/particles/weapons/sniper_trail")
				end
				local clamp_dist = tracer_dist
				if self._starwars then
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
			if self:weapon_tweak_data().has_trail == true or self._starwars == true then
				self._trail_effect_table.effect = Idstring("effects/particles/weapons/sniper_trail")
			end
			local clamp_dist = 0.5
			if self._starwars then
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
					spread_mul = ( spread_mul or 1 ) * 3
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
				else
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
		if self:_is_laser_on() and not (self:weapon_tweak_data().category == "shotgun" or self._name_id == "judge") then
			return 0.85 --15% spread reduction
		else
			return 1
		end
	end
	
	--[[
	function NewRaycastWeaponBase:_get_spread(user_unit)
		local spread_multiplier = self:spread_multiplier()
		local current_state = user_unit:movement()._current_state
		if self._name_id ~= "flamethrower_mk2" then
			if current_state._state_data.in_air and not	current_state:in_steelsight() then
				spread_multiplier = spread_multiplier * 2
			elseif current_state._state_data.in_air and	current_state:in_steelsight() then
				spread_multiplier = spread_multiplier * 1.25
			end
		end
		if current_state._moving then
			spread_multiplier = spread_multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "move_spread_multiplier", 1)
		end
		if current_state:in_steelsight() and tweak_data.weapon[self._name_id].always_hipfire == true then
			return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_steelsight" or "steelsight"] * spread_multiplier * self:_laser_spread()
		elseif current_state:in_steelsight() then
			return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_steelsight" or "steelsight"] * spread_multiplier
		end
		spread_multiplier = spread_multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "hip_fire_spread_multiplier", 1)
		if current_state._state_data.ducking then
			return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_crouching" or "crouching"] * spread_multiplier * self:_laser_spread()
		end
		return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_standing" or "standing"] * spread_multiplier * self:_laser_spread()
	end
	]]
	
	function NewRaycastWeaponBase:_get_spread(user_unit)
		local current_state = user_unit:movement()._current_state
		local spread_multiplier = self:spread_multiplier(current_state)
		if not current_state:in_steelsight() then
			spread_multiplier = spread_multiplier * self:_laser_spread()
		elseif tweak_data.weapon[self._name_id].always_hipfire == true then 
			spread_multiplier = spread_multiplier * self:_laser_spread()
		end
		if self._hipfire_mod and not current_state:in_steelsight() then
			spread_multiplier = spread_multiplier * self._hipfire_mod
		end
		return self._spread * spread_multiplier
	end

	--[[	fire rate multipler in-game stuff	]]--
	function NewRaycastWeaponBase:fire_rate_multiplier()
		local multiplier = self._rof_mult or 1
		
		if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "fire_rate_multiplier") then
			if not self._block_eq_aced then
				multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "fire_rate_multiplier", 1)
			end
		end
		if not self:upgrade_blocked("weapon", "fire_rate_multiplier") then
			if not self._block_eq_aced then
				multiplier = multiplier * managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1)
			end
		end
		if not self:upgrade_blocked(self._name_id, "fire_rate_multiplier") then
			if not self._block_eq_aced then
				multiplier = multiplier * managers.player:upgrade_value(self._name_id, "fire_rate_multiplier", 1)
			end
		end
		
		return multiplier * (self:in_burst_mode() and self._burst_fire_rate_multiplier or 1)
	end
	
		
	--[[	Reload stuff	]]--
	function NewRaycastWeaponBase:reload_speed_multiplier()
		local multiplier = 1
		
		multiplier = multiplier * self._reload_speed_mult
		
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "reload_speed_multiplier", 1)
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

	function NewRaycastWeaponBase:enter_steelsight_speed_multiplier()
		local multiplier = 1
				
		multiplier = multiplier * self._ads_speed_mult

		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "enter_steelsight_speed_multiplier", 1)
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "combat_medic_enter_steelsight_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "enter_steelsight_speed_multiplier", 1)
		
		return multiplier
	end
	
--}
end
