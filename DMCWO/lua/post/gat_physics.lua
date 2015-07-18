--[[
v1.41
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/units/weapons/raycastweaponbase" then

	--nothing here

elseif RequiredScript == "lib/managers/blackmarketmanager" then
	
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
		
		for part_id, stats in pairs(custom_stats) do
			if stats.rof_mult then
				rof_multiplier = rof_multiplier * stats.rof_mult
			end
		end
		
		multiplier = rof_multiplier
		
		self._block_eq_aced = managers.weapon_factory:has_perk("fire_mode_auto", factory_id, blueprint or default_blueprint)
		self._db_charge = managers.weapon_factory:has_perk("db_charge", factory_id, blueprint or default_blueprint)
		
		if self._db_charge and not (name == "r870" or name == "serbu" or name == "ksg" or name == "judge" or name == "huntsman" or name == "b682" or name == "striker") then
			multiplier = multiplier * 0.9
		end
						
		if not upgrade_blocked(weapon.category, "fire_rate_multiplier") then	
			if (name == "tec9" or name == "c96") and self._block_eq_aced then
			else
				multiplier = multiplier * managers.player:upgrade_value(category, "fire_rate_multiplier", 1)
			end
		end
		if not upgrade_blocked(weapon.name, "fire_rate_multiplier") then
			if (name == "tec9" or name == "c96") and self._block_eq_aced then
			else
				multiplier = multiplier * managers.player:upgrade_value(name, "fire_rate_multiplier", 1)
			end
		end
		return multiplier
	end

elseif RequiredScript == "lib/units/weapons/newraycastweaponbase" then

	
	--Movement
	tweak_data.upgrades.weapon_movement_penalty.lmg = 1 --0.8
	
	tweak_data.weapon.m134.weapon_movement_penalty = 0.5
	
	tweak_data.weapon.m95.weapon_movement_penalty = 0.7
	tweak_data.weapon.mg42.weapon_movement_penalty = 0.7
	
	tweak_data.weapon.hk21.weapon_movement_penalty = 0.75
	
	tweak_data.weapon.m249.weapon_movement_penalty = 0.8
	tweak_data.weapon.r93.weapon_movement_penalty = 0.8
	tweak_data.weapon.rpg7.weapon_movement_penalty = 0.8
	
	tweak_data.weapon.rpk.weapon_movement_penalty = 0.85
	tweak_data.weapon.galil.weapon_movement_penalty = 0.85
	tweak_data.weapon.wa2000.weapon_movement_penalty = 0.85
	
	tweak_data.weapon.fal.weapon_movement_penalty = 0.9
	tweak_data.weapon.striker.weapon_movement_penalty = 0.9
	tweak_data.weapon.g3.weapon_movement_penalty = 0.9
	tweak_data.weapon.spas12.weapon_movement_penalty = 0.9
	tweak_data.weapon.mosin.weapon_movement_penalty = 0.9
	tweak_data.weapon.m1928.weapon_movement_penalty = 0.9
	tweak_data.weapon.l85a2.weapon_movement_penalty = 0.9
	tweak_data.weapon.akm_gold.weapon_movement_penalty = 0.9
	tweak_data.weapon.aa12.weapon_movement_penalty = 0.9
	tweak_data.weapon.m32.weapon_movement_penalty = 0.9
	tweak_data.weapon.msr.weapon_movement_penalty = 0.9
	
	tweak_data.weapon.new_m14.weapon_movement_penalty = 0.95
	
	--Muzzle flash stuff
	local old_update_stats_values = NewRaycastWeaponBase._update_stats_values
	
	function NewRaycastWeaponBase:_update_stats_values()
		old_update_stats_values(self)
		
		self._damage_near = tweak_data.weapon[self._name_id].damage_near or 1000 -- 10 m
		self._damage_far = tweak_data.weapon[self._name_id].damage_far or 20000 -- 200 m
		self._damage_min = tweak_data.weapon[self._name_id].damage_min or 0.5 -- maximum 60% drop
		self._movement_penalty = tweak_data.weapon[self._name_id].weapon_movement_penalty or 1
		self._reload_speed_mult = self._reload_speed_mult or 1
		self._ads_speed_mult = self._ads_speed_mult or 1
		self._rof_mult = 1
		self._penetration_power = self._penetration_power or tweak_data.weapon[self._name_id].penetration_power or 0.5
		self._penetration_damage = self._penetration_damage or tweak_data.weapon[self._name_id].penetration_damage or 0.5
		self._starwars = nil
		self._is_tracer = nil
		self._has_ap = nil
		self._has_hp = nil
		
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
			if stats.rof_mult then
				self._rof_mult = self._rof_mult * stats.rof_mult
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
		
		--ROF Multiplier perks--{
		self._block_eq_aced = managers.weapon_factory:has_perk("fire_mode_auto", self._factory_id, self._blueprint)
		self._db_charge = managers.weapon_factory:has_perk("db_charge", self._factory_id, self._blueprint)
		--}
				
		self:_check_laser()
		
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
					clamp_dist = 0.075
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
				clamp_dist = 0.075
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
						if not self._can_shoot_through_shield then
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
					dmg_mul = ( dmg_mul or 1 ) * (tweak_data.weapon[self._name_id].shield_damage or 0.25)
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
			local multi_kill, enemy_pass, obstacle_pass, weapon_pass, weapons_pass
			for achievement, achievement_data in pairs(tweak_data.achievement.sniper_kill_achievements) do
				multi_kill = not achievement_data.multi_kill or self._shoot_through_data.kills == achievement_data.multi_kill
				enemy_pass = not achievement_data.enemy or unit_type == achievement_data.enemy
				obstacle_pass = not achievement_data.obstacle or achievement_data.obstacle == "wall" and self._shoot_through_data.has_hit_wall or achievement_data.obstacle == "shield" and self._shoot_through_data.has_passed_shield
				weapon_pass = not achievement_data.weapon or self._name_id == achievement_data.weapon
				weapons_pass = not achievement_data.weapons or table.contains(achievement_data.weapons, self._name_id)
				if multi_kill and enemy_pass and obstacle_pass and weapon_pass and weapons_pass then
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

	--[[	fire rate multipler in-game stuff	]]--
	function NewRaycastWeaponBase:fire_rate_multiplier()
		local multiplier = self._rof_mult or 1
				
		if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "fire_rate_multiplier") then
			if (self._name_id == "tec9" or self._name_id == "c96") and self._block_eq_aced then
			else
				multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "fire_rate_multiplier", 1)
			end
		end
		if not self:upgrade_blocked("weapon", "fire_rate_multiplier") then
			if (self._name_id == "tec9" or self._name_id == "c96") and self._block_eq_aced then
			else
				multiplier = multiplier * managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1)
			end
		end
		if not self:upgrade_blocked(self._name_id, "fire_rate_multiplier") then
			if (self._name_id == "tec9" or self._name_id == "c96") and self._block_eq_aced then
			else
				multiplier = multiplier * managers.player:upgrade_value(self._name_id, "fire_rate_multiplier", 1)
			end
		end
		return multiplier
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
	
	function NewRaycastWeaponBase:recoil_wait()
		local tweak_is_auto = tweak_data.weapon[self._name_id].FIRE_MODE == "auto"
		local weapon_is_auto = self:fire_mode() == "auto"
		if not tweak_is_auto then
			return nil
		end
		local multiplier = tweak_is_auto == weapon_is_auto and 1 or 2
		return nil--self:weapon_tweak_data().fire_mode_data.fire_rate * multiplier
	end
	
elseif RequiredScript == "lib/units/enemies/cop/copdamage" then

	function CopDamage:damage_bullet(attack_data)
		if self._dead or self._invulnerable then
			return
		end
		if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
			return "friendly_fire"
		end
		
		--
		local damage = attack_data.damage
		local unit_type = self._unit:base()._tweak_table
		local has_ap = attack_data.weapon_unit:base()._has_ap
		local has_hp = attack_data.weapon_unit:base()._has_hp
		--
		
		if self._has_plate and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_plate_name then
			local armor_pierce_roll = math.rand(1)
			local armor_pierce_value = 0
			if attack_data.attacker_unit == managers.player:player_unit() and not attack_data.weapon_unit:base().thrower_unit then
				armor_pierce_value = armor_pierce_value + attack_data.weapon_unit:base():armor_piercing_chance()
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("player", "armor_piercing_chance", 0)
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance", 0)
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_2", 0)
				if attack_data.weapon_unit:base():got_silencer() then
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_silencer", 0)
				end
				local weapon_category = attack_data.weapon_unit:base():weapon_tweak_data().category
				if weapon_category == "saw" then
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("saw", "armor_piercing_chance", 0)
				end
			elseif attack_data.attacker_unit:base() and attack_data.attacker_unit:base().sentry_gun then
				local owner = attack_data.attacker_unit:base():get_owner()
				if alive(owner) then
					if owner == managers.player:player_unit() then
						armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance", 0)
						armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance_2", 0)
					else
						armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance") or 0)
						armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance_2") or 0)
					end
				end
			end
			damage = damage * armor_pierce_value
			if armor_pierce_roll >= armor_pierce_value then
				return
			end
		end
		local result
		local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
		local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
		
		if unit_type == "tank" then 
			if has_ap then
				damage = damage * 1.20
			elseif has_hp then
				damage = damage * 0.6
			end
		elseif unit_type == "city_swat" then 
			if has_ap then
				damage = damage * 1.20
			elseif has_hp then
				damage = damage * 0.6
			end
		elseif unit_type == "fbi_heavy_swat" then 
			if has_ap and head then
				damage = damage * 1.20
			elseif has_hp and head then
				damage = damage * 0.6
			end
		end
		
		if self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET then
			damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET)
		end
		damage = damage * (self._marked_dmg_mul or 1)
		if self._unit:movement():cool() then
			damage = self._HEALTH_INIT
		end
		local headshot_multiplier = 1
		if attack_data.attacker_unit == managers.player:player_unit() then
			local critical_hit, crit_damage = self:roll_critical_hit(damage)
			if critical_hit then
				managers.hud:on_crit_confirmed()
				damage = crit_damage
			else
				managers.hud:on_hit_confirmed()
			end
			headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
			if tweak_data.character[self._unit:base()._tweak_table].priority_shout then
				damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
			end
			if head then
				managers.player:on_headshot_dealt()
			end
		end
		if self._damage_reduction_multiplier then
			damage = damage * self._damage_reduction_multiplier
		elseif head then
			if self._char_tweak.headshot_dmg_mul then
				damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
			else
				damage = self._health * 10
			end
		end
		local damage_percent = math.ceil(math.clamp(damage / self._HEALTH_INIT_PRECENT, 1, self._HEALTH_GRANULARITY))
		damage = damage_percent * self._HEALTH_INIT_PRECENT
		if damage >= self._health then
			if head and damage > math.random(10) then
				self:_spawn_head_gadget({
					position = attack_data.col_ray.body:position(),
					rotation = attack_data.col_ray.body:rotation(),
					dir = attack_data.col_ray.ray
				})
			end
			attack_data.damage = self._health
			result = {
				type = "death",
				variant = attack_data.variant
			}
			self:die(attack_data.variant)
			self:chk_killshot(attack_data.attacker_unit, attack_data.variant)
		else
			attack_data.damage = damage
			local result_type = self:get_damage_type(damage_percent, "bullet")
			result = {
				type = result_type,
				variant = attack_data.variant
			}
			self._health = self._health - damage
			self._health_ratio = self._health / self._HEALTH_INIT
		end
		attack_data.result = result
		attack_data.pos = attack_data.col_ray.position
		if result.type == "death" then
			local data = {
				name = self._unit:base()._tweak_table,
				head_shot = head,
				weapon_unit = attack_data.weapon_unit,
				variant = attack_data.variant
			}
			if managers.groupai:state():all_criminals()[attack_data.attacker_unit:key()] then
				managers.statistics:killed_by_anyone(data)
			end
			if attack_data.attacker_unit == managers.player:player_unit() then
				self:_comment_death(attack_data.attacker_unit, self._unit:base()._tweak_table)
				self:_show_death_hint(self._unit:base()._tweak_table)
				local attacker_state = managers.player:current_state()
				data.attacker_state = attacker_state
				managers.statistics:killed(data)
				if attack_data.attacker_unit:character_damage():bleed_out() and not CopDamage.is_civilian(self._unit:base()._tweak_table) then
					local messiah_revive = false
					if managers.player:has_category_upgrade("player", "pistol_revive_from_bleed_out") and not data.weapon_unit:base().thrower_unit then
						local weapon_category = data.weapon_unit:base():weapon_tweak_data().category
						if (weapon_category == "pistol" or weapon_category == "akimbo") and attack_data.attacker_unit:character_damage():consume_messiah_charge() then
							messiah_revive = true
						end
					end
					if messiah_revive then
						attack_data.attacker_unit:character_damage():revive(true)
					end
				end
				self:_check_damage_achievements(attack_data, head)
				if not CopDamage.is_civilian(self._unit:base()._tweak_table) and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and not attack_data.weapon_unit:base().thrower_unit then
					local weapon_category = attack_data.weapon_unit:base():weapon_tweak_data().category
					if weapon_category == "shotgun" or weapon_category == "saw" then
						managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
					end
				end
				if CopDamage.is_civilian(self._unit:base()._tweak_table) then
					managers.money:civilian_killed()
				end
			elseif attack_data.attacker_unit:in_slot(managers.slot:get_mask("criminals_no_deployables")) then
				self:_AI_comment_death(attack_data.attacker_unit, self._unit:base()._tweak_table)
			elseif attack_data.attacker_unit:base().sentry_gun and Network:is_server() then
				local server_info = attack_data.weapon_unit:base():server_information()
				if server_info and server_info.owner_peer_id ~= managers.network:session():local_peer():id() then
					local owner_peer = managers.network:session():peer(server_info.owner_peer_id)
					if owner_peer then
						owner_peer:send_queued_sync("sync_player_kill_statistic", data.name, data.head_shot and true or false, data.weapon_unit, data.variant)
					end
				else
					data.attacker_state = managers.player:current_state()
					managers.statistics:killed(data)
				end
			end
		end
		local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:movement():m_pos().z, 0, 300)
		local attacker = attack_data.attacker_unit
		if attacker:id() == -1 then
			attacker = self._unit
		end
		if alive(attack_data.weapon_unit) and attack_data.weapon_unit:base() and attack_data.weapon_unit:base().add_damage_result then
			attack_data.weapon_unit:base():add_damage_result(self._unit, attacker, result.type == "death", damage_percent)
		end
		self:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height)
		self:_on_damage_received(attack_data)
		return result
	end


elseif RequiredScript == "lib/units/beings/player/states/playerstandard" then

	function PlayerStandard:_get_max_walk_speed(t)
		local speed_tweak = self._tweak_data.movement.speed
		local movement_speed = speed_tweak.STANDARD_MAX
		local speed_state = "walk"
		local dicks = self._equipped_unit and self._equipped_unit:base():weapon_tweak_data()
		if self._state_data.in_steelsight and not self._state_data.ducking and not managers.player:has_category_upgrade("player", "steelsight_normal_movement_speed") then
			movement_speed = speed_tweak.STEELSIGHT_MAX
			if self._equipped_unit then
				if dicks.category == "pistol" then
					movement_speed = speed_tweak.STANDARD_MAX * 0.95
					if dicks.sub_category == "carbine" then
						movement_speed = speed_tweak.STANDARD_MAX * 0.6
					end
				elseif dicks.category == "akimbo" then
					movement_speed = speed_tweak.STANDARD_MAX * 0.85
				elseif dicks.category == "assault_rifle" then
					movement_speed = speed_tweak.STANDARD_MAX * 0.5
					if dicks.sub_category == "battle_rifle" then
						movement_speed = speed_tweak.STANDARD_MAX * 0.45
					elseif dicks.sub_category == "carbine" then
						movement_speed = speed_tweak.STANDARD_MAX * 0.6
					end
				elseif dicks.category == "smg" then
					movement_speed = speed_tweak.STANDARD_MAX * 0.8
				elseif dicks.category == "shotgun" then
					movement_speed = speed_tweak.STANDARD_MAX * 0.7
				elseif dicks.category == "lmg" then
					movement_speed = speed_tweak.STANDARD_MAX * 0.4
					if dicks.sub_category == "gpmg" then
						movement_speed = speed_tweak.STANDARD_MAX * 0.3
					end
				elseif dicks.category == "snp" then
					movement_speed = speed_tweak.STANDARD_MAX * 0.475
				end
				
				--bullpup bonus speed
				if dicks.is_bullpup then 
					movement_speed = movement_speed * 1.2
					if movement_speed > speed_tweak.STANDARD_MAX then
						movement_speed = speed_tweak.STANDARD_MAX
					end
				end
				
				--if magic occurs, prevents modified steelsight speeds exceeding the walking state's speed
				if movement_speed > speed_tweak.STANDARD_MAX then
					movement_speed = speed_tweak.STANDARD_MAX
				end
			end
			speed_state = "steelsight"
		elseif self._state_data.in_steelsight and self._state_data.ducking and not managers.player:has_category_upgrade("player", "steelsight_normal_movement_speed") then
			movement_speed = speed_tweak.STEELSIGHT_MAX
			if self._equipped_unit then	
				if dicks.category == "pistol" then
					movement_speed = speed_tweak.CROUCHING_MAX * 0.95
					if dicks.sub_category == "carbine" then
						movement_speed = speed_tweak.CROUCHING_MAX * 0.6
					end
				elseif dicks.category == "akimbo" then
					movement_speed = speed_tweak.CROUCHING_MAX * 0.85
				elseif dicks.category == "assault_rifle" then
					movement_speed = speed_tweak.CROUCHING_MAX * 0.5
					if dicks.sub_category == "battle_rifle" then
						movement_speed = speed_tweak.CROUCHING_MAX * 0.45
					elseif dicks.sub_category == "carbine" then
						movement_speed = speed_tweak.CROUCHING_MAX * 0.6
					end
				elseif dicks.category == "smg" then
					movement_speed = speed_tweak.CROUCHING_MAX * 0.8
				elseif dicks.category == "shotgun" then
					movement_speed = speed_tweak.CROUCHING_MAX * 0.7
				elseif dicks.category == "lmg" then
					movement_speed = speed_tweak.CROUCHING_MAX * 0.4
					if dicks.sub_category == "gpmg" then
						movement_speed = speed_tweak.CROUCHING_MAX * 0.3
					end
				elseif dicks.category == "snp" then
					movement_speed = speed_tweak.CROUCHING_MAX * 0.45
				end
				
				--bullpup bonus speed
				if dicks.is_bullpup then 
					movement_speed = movement_speed * 1.2
					if movement_speed > speed_tweak.CROUCHING_MAX then
						movement_speed = speed_tweak.CROUCHING_MAX
					end
				end
				
				--if magic occurs, prevents modified steelsight speeds exceeding the crouched state's speed
				if movement_speed > speed_tweak.CROUCHING_MAX then
					movement_speed = speed_tweak.CROUCHING_MAX
				end
			end
			speed_state = "steelsight"
		elseif self:on_ladder() then
			movement_speed = speed_tweak.CLIMBING_MAX
			speed_state = "climb"
		elseif self._state_data.ducking then
			movement_speed = speed_tweak.CROUCHING_MAX
			speed_state = "crouch"
		elseif self._state_data.in_air then
			movement_speed = speed_tweak.INAIR_MAX
			speed_state = nil
		elseif self._running then
			movement_speed = speed_tweak.RUNNING_MAX
			speed_state = "run"
		end
		local morale_boost_bonus = self._ext_movement:morale_boost()
		local multiplier = managers.player:movement_speed_multiplier(speed_state, speed_state and morale_boost_bonus and morale_boost_bonus.move_speed_bonus)
		local apply_weapon_penalty = true
		if self:_is_meleeing() then
			local melee_entry = managers.blackmarket:equipped_melee_weapon()
			apply_weapon_penalty = not tweak_data.blackmarket.melee_weapons[melee_entry].stats.remove_weapon_movement_penalty
		end
		if alive(self._equipped_unit) and apply_weapon_penalty then
			multiplier = multiplier * self._equipped_unit:base():movement_penalty()
		end
		return movement_speed * multiplier
	end

end
