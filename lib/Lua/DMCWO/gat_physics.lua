--[[
v1.2.4
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

if RequiredScript == "lib/units/weapons/raycastweaponbase" then
		
	local mvec3_set = mvector3.set
	local mvec3_add = mvector3.add
	local mvec3_dot = mvector3.dot
	local mvec3_sub = mvector3.subtract
	local mvec3_mul = mvector3.multiply
	local mvec3_norm = mvector3.normalize
	local mvec3_dir = mvector3.direction
	local mvec3_set_l = mvector3.set_length
	local mvec3_len = mvector3.length
	local math_clamp = math.clamp
	local math_lerp = math.lerp
	local tmp_vec1 = Vector3()
	local tmp_vec2 = Vector3()
	local tmp_rot1 = Rotation()
	function InstantExplosiveBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank)
		local slot_mask = managers.slot:get_mask("explosion_targets")
		local hit_unit = col_ray.unit
		if not hit_unit:character_damage() or not hit_unit:character_damage()._no_blood then
			self:play_impact_sound_and_effects(col_ray)
		end
		if blank then
		else
			local network_damage = damage
			mvec3_set(tmp_vec1, col_ray.position)
			mvec3_set(tmp_vec2, col_ray.ray)
			mvec3_norm(tmp_vec2)
			mvec3_mul(tmp_vec2, 20)
			mvec3_sub(tmp_vec1, tmp_vec2)
			managers.explosion:play_sound_and_effects(tmp_vec1, col_ray.normal, self.RANGE, self.EFFECT_PARAMS)
			local hit_units, splinters, results = managers.explosion:detect_and_give_dmg({
				hit_pos = tmp_vec1,
				range = self.RANGE,
				collision_slotmask = slot_mask,
				curve_pow = self.CURVE_POW,
				damage = damage,
				player_damage = damage * self.PLAYER_DMG_MUL,
				ignore_unit = weapon_unit,
				user = user_unit,
				owner = weapon_unit
			})
			managers.network:session():send_to_peers_synched("sync_explosive_bullet", col_ray.position, col_ray.normal, network_damage)
			if hit_unit:damage() and col_ray.body:extension() and col_ray.body:extension().damage then
				local sync_damage = not blank and hit_unit:id() ~= -1
				if sync_damage then
					local normal_vec_yaw, normal_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.normal, 128, 64)
					local dir_vec_yaw, dir_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.ray, 128, 64)
					managers.network:session():send_to_peers_synched("sync_body_damage_bullet", col_ray.body, user_unit:id() ~= -1 and user_unit or nil, normal_vec_yaw, normal_vec_pitch, col_ray.position, dir_vec_yaw, dir_vec_pitch, network_damage)
				end
				local local_damage = not blank or hit_unit:id() == -1
				if local_damage then
					col_ray.body:extension().damage:damage_bullet(user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)
					col_ray.body:extension().damage:damage_damage(user_unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
				end
			end
			return {
				col_ray = col_ray,
				type = hit_unit:character_damage() and hit_unit:character_damage().is_head and hit_unit:character_damage().dead and hit_unit:character_damage():dead() and "death" or nil,
				variant = "explosion"
			}
		end
		return nil
	end	

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
		local multiplier = 1


		self._mp5k_rof = managers.weapon_factory:has_perk("mp5k_rof", factory_id, blueprint or default_blueprint)
		self._mp5sd_rof = managers.weapon_factory:has_perk("mp5sd_rof", factory_id, blueprint or default_blueprint)
		
		self._mg34_rof = managers.weapon_factory:has_perk("mg34_rof", factory_id, blueprint or default_blueprint)
		
		self._famas2_rof = managers.weapon_factory:has_perk("famas2_rof", factory_id, blueprint or default_blueprint)
		
		self._mk14_rof = managers.weapon_factory:has_perk("mk14_rof", factory_id, blueprint or default_blueprint)
		
		self._mar_rof = managers.weapon_factory:has_perk("mar_rof", factory_id, blueprint or default_blueprint)
		self._galatz_rof = managers.weapon_factory:has_perk("galatz_rof", factory_id, blueprint or default_blueprint)
		
		self._ak5c_rof = managers.weapon_factory:has_perk("ak5c_rof", factory_id, blueprint or default_blueprint)
		self._fnfnc_rof = managers.weapon_factory:has_perk("fnfnc_rof", factory_id, blueprint or default_blueprint)
		
		self._m119_slow = managers.weapon_factory:has_perk("m119_slow", factory_id, blueprint or default_blueprint)
		
		self._rapid_fire = managers.weapon_factory:has_perk("fire_mode_auto", factory_id, blueprint or default_blueprint)
		self._slow_fire = managers.weapon_factory:has_perk("fire_mode_single", factory_id, blueprint or default_blueprint)
		
		self._fast_bolt = managers.weapon_factory:has_perk("fast_bolt", factory_id, blueprint or default_blueprint)
		self._slow_bolt = managers.weapon_factory:has_perk("slow_bolt", factory_id, blueprint or default_blueprint)
		
		if self._mp5k_rof then 
			multiplier = multiplier / 0.88888888888888888888888888888889
		elseif self._mp5sd_rof or self._mg34_rof then
			multiplier = multiplier / 1.3333333333333333333333333333333
		elseif self._famas2_rof then
			multiplier = multiplier / 0.83333333333333333333333333333333
		elseif self._mk14_rof or self._mar_rof then
			multiplier = multiplier / 0.93333333333333333333333333333333
		elseif self._galatz_rof then
			multiplier = multiplier / 1.1111111111111111111111111111111
		elseif self._ak5c_rof then
			multiplier = multiplier / 1.0384615384615384615384615384615
		elseif self._fnfnc_rof then
			multiplier = multiplier / 0.96428571428571428571428571428571
		elseif self._m119_slow then
			multiplier = multiplier / 1.4117647058823529411764705882353
		end
		
		if self._quick_bolt then
			multiplier = multiplier * 1.02
		elseif self._fast_bolt then
			multiplier = multiplier * 1.05
		elseif self._slow_bolt then
			multiplier = multiplier * 0.95
		end
		
		if self._rapid_fire and not (name == "c96" or name == "tec9") then 
			multiplier = multiplier * 1.15
		elseif self._rapid_fire and name == "c96" then 
			multiplier = multiplier * 2
		elseif self._rapid_fire and name == "tec9" then 
			multiplier = multiplier * 1.33333333333333
		elseif self._slow_fire then 
			multiplier = multiplier * 0.9
		end
				
		if not upgrade_blocked(weapon.category, "fire_rate_multiplier") then
			multiplier = multiplier * managers.player:upgrade_value(category, "fire_rate_multiplier", 1)
		end
		if not upgrade_blocked(weapon.name, "fire_rate_multiplier") then
			multiplier = multiplier * managers.player:upgrade_value(name, "fire_rate_multiplier", 1)
		end
		return multiplier
	end

elseif RequiredScript == "lib/units/weapons/newraycastweaponbase" then
				
	--Damage falloff for non-shotguns (Penetration/Distance and col_ray bugs fixed by LazyOzzy)
	function NewRaycastWeaponBase:get_damage_falloff(damage, col_ray, user_unit, distance)
			
		local dist = distance or mvector3.distance(col_ray.unit:position(), user_unit:position())
	
		self._damage_near = tweak_data.weapon[self._name_id].damage_near or 1000 -- 10 m
		self._damage_far = tweak_data.weapon[self._name_id].damage_far or 20000 -- 200 m
		self._damage_min = tweak_data.weapon[self._name_id].damage_min or 0.6 -- maximum 60% drop
		
		if self._long_barrel then
			self._damage_near = self._damage_near * 1.15
			self._damage_far = self._damage_far * 1.15
		elseif self._dmr_barrel then
			self._damage_near = self._damage_near * 1.30
			self._damage_far = self._damage_far * 1.30		
		elseif self._short_barrel then
			self._damage_near = self._damage_near * 0.90
			self._damage_far = self._damage_far * 0.90
		end
		
		if self._silencer and not self._supp_barrel then
			self._damage_near = self._damage_near * 0.80
			self._damage_far = self._damage_far * 0.80
			self._damage_min = self._damage_min * 0.9
		end
--[[ 			
		io.stdout:write("Dist: ", tostring(dist/100), "\n") --Distance from the surface/object/enemy you hit
		io.stdout:write("Drop Dist: ", tostring(self._damage_near/100), "m \n") --Distance drop-off starts
		io.stdout:write("Min. Dmg at: ", (((1 - self._damage_min) * (self._damage_far/100)) + (self._damage_near / 100)), "m \n") --Distance you'll hit minimum damage in meters
		io.stdout:write("Min. Dmg: ", tostring((damage * 10) * self._damage_min), "\n") --Lowest possible damage your gun will output at max range
		io.stdout:write("Init Dmg: ", tostring(damage * 10), "\n") --Initial damage from your shot
		 ]]
		
		local ratio = (1 - math.min(1, math.max(0, dist - self._damage_near) / self._damage_far))
		if ratio < self._damage_min then
			ratio = self._damage_min
		end
	
		damage = ratio * damage
		
		--io.stdout:write("Impact Dmg: ", tostring(damage * 10), "\n\n") --Damage on impact
		
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
		
		if col_ray and col_ray.unit then
			total_distance = shoot_through_data and (shoot_through_data.total_distance + col_ray.distance) or col_ray.distance
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
		if (col_ray and total_distance > 700 or not col_ray) and alive(self._obj_fire) then
			self._obj_fire:m_position(self._trail_effect_table.position)
			mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)
			local trail = World:effect_manager():spawn(self._trail_effect_table)
			if col_ray then
				World:effect_manager():set_remaining_lifetime(trail, math.clamp((total_distance - 600) / 10000, 0, total_distance))
			end
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
					dmg_mul = ( dmg_mul or 1 ) * tweak_data.weapon[self._name_id].shield_damage or 0.15
				end
				
				
				
				self._shoot_through_data.has_hit_wall = has_hit_wall or is_wall
				self._shoot_through_data.has_passed_shield = has_passed_shield or is_shield
				self._shoot_through_data.ray_from_unit = ray_from_unit
				self._shoot_through_data.ray_distance = ray_distance - col_ray.distance
		
				mvector3.set( self._shoot_through_data.from, mvec_spread_direction )
				
				local penetration_power = tweak_data.weapon[self._name_id].penetration_power or 0.5
				local penetration
				if (damage * 10) * penetration_power > 75 then
					penetration = 75
				else
					penetration = (damage * 10) * penetration_power
				end
				
				local penetration_damage = tweak_data.weapon[self._name_id].penetration_damage or 0.5
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
				
				self._shoot_through_data.total_distance = total_distance + penetration_dist
				
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


	--Muzzle flash stuff
	
	tweak_data.upgrades.weapon_movement_penalty.lmg = 1 --0.8
	tweak_data.weapon.m134.weapon_movement_penalty = 0.5
	tweak_data.weapon.rpg7.weapon_movement_penalty = 0.8
	tweak_data.weapon.m95.weapon_movement_penalty = 0.7
	tweak_data.weapon.mg42.weapon_movement_penalty = 0.7
	tweak_data.weapon.hk21.weapon_movement_penalty = 0.75
	tweak_data.weapon.m249.weapon_movement_penalty = 0.8
	tweak_data.weapon.r93.weapon_movement_penalty = 0.8
	tweak_data.weapon.rpk.weapon_movement_penalty = 0.85
	tweak_data.weapon.galil.weapon_movement_penalty = 0.85
	tweak_data.weapon.fal.weapon_movement_penalty = 0.9
	tweak_data.weapon.striker.weapon_movement_penalty = 0.9
	tweak_data.weapon.g3.weapon_movement_penalty = 0.9
	tweak_data.weapon.spas12.weapon_movement_penalty = 0.9
	tweak_data.weapon.mosin.weapon_movement_penalty = 0.9
	tweak_data.weapon.m1928.weapon_movement_penalty = 0.9
	tweak_data.weapon.l85a2.weapon_movement_penalty = 0.9
	tweak_data.weapon.akm_gold.weapon_movement_penalty = 0.9
	tweak_data.weapon.msr.weapon_movement_penalty = 0.95
	tweak_data.weapon.new_m14.weapon_movement_penalty = 0.95
	
	local old_update_stats_values = NewRaycastWeaponBase._update_stats_values
	
	function NewRaycastWeaponBase:_update_stats_values()
		old_update_stats_values(self)
		
		self._movement_penalty = tweak_data.weapon[self._name_id].weapon_movement_penalty or 1
		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
		for part_id, stats in pairs(custom_stats) do
			if stats.movement_speed then
				self._movement_penalty = self._movement_penalty * stats.movement_speed
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
		self._long_barrel = managers.weapon_factory:has_perk("long_barrel", self._factory_id, self._blueprint)
		self._dmr_barrel = managers.weapon_factory:has_perk("dmr_barrel", self._factory_id, self._blueprint)
		self._short_barrel = managers.weapon_factory:has_perk("short_barrel", self._factory_id, self._blueprint)
		self._supp_barrel = managers.weapon_factory:has_perk("supp_barrel", self._factory_id, self._blueprint)
		
		self._silencer = managers.weapon_factory:has_perk("silencer", self._factory_id, self._blueprint)
		self._flash_hide = managers.weapon_factory:has_perk("flash_hider", self._factory_id, self._blueprint)
		self._side_comp = managers.weapon_factory:has_perk("side_comp", self._factory_id, self._blueprint)
		self._big_flash = managers.weapon_factory:has_perk("big_flash", self._factory_id, self._blueprint)
		if self._silencer then
			self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash_silenced or "effects/payday2/particles/weapons/9mm_auto_silence_fps")
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
		self._mp5k_rof = managers.weapon_factory:has_perk("mp5k_rof", self._factory_id, self._blueprint)
		self._mp5sd_rof = managers.weapon_factory:has_perk("mp5sd_rof", self._factory_id, self._blueprint)
		self._mg34_rof = managers.weapon_factory:has_perk("mg34_rof", self._factory_id, self._blueprint)
		self._famas2_rof = managers.weapon_factory:has_perk("famas2_rof", self._factory_id, self._blueprint)
		self._mk14_rof = managers.weapon_factory:has_perk("mk14_rof", self._factory_id, self._blueprint)
		self._mar_rof = managers.weapon_factory:has_perk("mar_rof", self._factory_id, self._blueprint)
		self._galatz_rof = managers.weapon_factory:has_perk("galatz_rof", self._factory_id, self._blueprint)
		self._ak5c_rof = managers.weapon_factory:has_perk("ak5c_rof", self._factory_id, self._blueprint)
		self._fnfnc_rof = managers.weapon_factory:has_perk("fnfnc_rof", self._factory_id, self._blueprint)
		self._m119_slow = managers.weapon_factory:has_perk("m119_slow", self._factory_id, self._blueprint)
		
		self._rapid_fire = managers.weapon_factory:has_perk("fire_mode_auto", self._factory_id, self._blueprint)
		self._slow_fire = managers.weapon_factory:has_perk("fire_mode_single", self._factory_id, self._blueprint)
		self._quick_bolt = managers.weapon_factory:has_perk("quick_bolt", self._factory_id, self._blueprint)
		self._fast_bolt = managers.weapon_factory:has_perk("fast_bolt", self._factory_id, self._blueprint)
		self._slow_bolt = managers.weapon_factory:has_perk("slow_bolt", self._factory_id, self._blueprint)
		--}
		
		--Reload speed perks--{
		self._fast_reload = managers.weapon_factory:has_perk("fast_reload", self._factory_id, self._blueprint)
		self._faster_reload = managers.weapon_factory:has_perk("faster_reload", self._factory_id, self._blueprint)
		self._fastest_reload = managers.weapon_factory:has_perk("fastest_reload", self._factory_id, self._blueprint)
		self._dual_reload = managers.weapon_factory:has_perk("dual_reload", self._factory_id, self._blueprint)		
		
		self._slow_reload = managers.weapon_factory:has_perk("slow_reload", self._factory_id, self._blueprint)
		self._slower_reload = managers.weapon_factory:has_perk("slower_reload", self._factory_id, self._blueprint)
		self._slowest_reload = managers.weapon_factory:has_perk("slowest_reload", self._factory_id, self._blueprint)
		
		self._lower_fast_reload = managers.weapon_factory:has_perk("lower_fast_reload", self._factory_id, self._blueprint)
		
		--ADS speed perks--{
		self._fast_ads_grip = managers.weapon_factory:has_perk("fast_ads_grip", self._factory_id, self._blueprint)
		
		self._fast_ads_brl = managers.weapon_factory:has_perk("fast_ads_brl", self._factory_id, self._blueprint)		
		self._slow_ads_brl = managers.weapon_factory:has_perk("slow_ads_brl", self._factory_id, self._blueprint)
		self._slower_ads_brl = managers.weapon_factory:has_perk("slower_ads_brl", self._factory_id, self._blueprint)
		self._slowest_ads_brl = managers.weapon_factory:has_perk("slowest_ads_brl", self._factory_id, self._blueprint)
		
		self._fast_ads_hg = managers.weapon_factory:has_perk("fast_ads_hg", self._factory_id, self._blueprint)
		self._faster_ads_hg = managers.weapon_factory:has_perk("faster_ads_hg", self._factory_id, self._blueprint)
		self._fastest_ads_hg = managers.weapon_factory:has_perk("fastest_ads_hg", self._factory_id, self._blueprint)
		self._slow_ads_hg = managers.weapon_factory:has_perk("slow_ads_hg", self._factory_id, self._blueprint)
		self._slower_ads_hg = managers.weapon_factory:has_perk("slower_ads_hg", self._factory_id, self._blueprint)
		self._slowest_ads_hg = managers.weapon_factory:has_perk("slowest_ads_hg", self._factory_id, self._blueprint)		
	
		self._fast_ads_op = managers.weapon_factory:has_perk("fast_ads_op", self._factory_id, self._blueprint)
		self._slow_ads_op = managers.weapon_factory:has_perk("slow_ads_op", self._factory_id, self._blueprint)
		self._slower_ads_op = managers.weapon_factory:has_perk("slower_ads_op", self._factory_id, self._blueprint)
		self._slowest_ads_op = managers.weapon_factory:has_perk("slowest_ads_op", self._factory_id, self._blueprint)
		
		self._slow_ads_ns = managers.weapon_factory:has_perk("slow_ads_ns", self._factory_id, self._blueprint)
		self._slower_ads_ns = managers.weapon_factory:has_perk("slower_ads_ns", self._factory_id, self._blueprint)
		self._slowest_ads_ns = managers.weapon_factory:has_perk("slowest_ads_ns", self._factory_id, self._blueprint)
		--}
		
		self:_check_laser()
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
			return 0.75
		else
			return 1
		end
	end
	
	function NewRaycastWeaponBase:_get_spread(user_unit)
		local spread_multiplier = self:spread_multiplier()
		local current_state = user_unit:movement()._current_state
		if current_state._moving then
			spread_multiplier = spread_multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "move_spread_multiplier", 1)
		end
		if current_state:in_steelsight() then
			return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_steelsight" or "steelsight"] * spread_multiplier
		end
		spread_multiplier = spread_multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "hip_fire_spread_multiplier", 1)
		if current_state._state_data.ducking then
			return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_crouching" or "crouching"] * spread_multiplier * self:_laser_spread()
		end
		return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_standing" or "standing"] * spread_multiplier * self:_laser_spread()
	end

	--fire rate multipler in-game stuff
function NewRaycastWeaponBase:fire_rate_multiplier()
		local multiplier = 1
		
		if self._mp5k_rof then 
			multiplier = multiplier / 0.88888888888888888888888888888889
		elseif self._mp5sd_rof or self._mg34_rof then
			multiplier = multiplier / 1.3333333333333333333333333333333
		elseif self._famas2_rof then
			multiplier = multiplier / 0.83333333333333333333333333333333
		elseif self._mk14_rof or self._mar_rof then
			multiplier = multiplier / 0.93333333333333333333333333333333
		elseif self._galatz_rof then
			multiplier = multiplier / 1.1111111111111111111111111111111
		elseif self._ak5c_rof then
			multiplier = multiplier / 1.0384615384615384615384615384615
		elseif self._fnfnc_rof then
			multiplier = multiplier / 0.96428571428571428571428571428571
		elseif self._m119_slow then
			multiplier = multiplier / 1.4117647058823529411764705882353
		end
		
		if self._quick_bolt then
			multiplier = multiplier * 1.02
		elseif self._fast_bolt then
			multiplier = multiplier * 1.05
		elseif self._slow_bolt then
			multiplier = multiplier * 0.95
		end
		
		if self._rapid_fire and not (self._name_id == "c96" or self._name_id == "tec9") then 
			multiplier = multiplier * 1.15
		elseif self._rapid_fire and self._name_id == "c96" then 
			multiplier = multiplier * 2
		elseif self._rapid_fire and self._name_id == "tec9" then 
			multiplier = multiplier * 1.33333333333333
		elseif self._slow_fire then 
			multiplier = multiplier * 0.9
		end

		if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "fire_rate_multiplier") then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "fire_rate_multiplier", 1)
		end
		if not self:upgrade_blocked("weapon", "fire_rate_multiplier") then
			multiplier = multiplier * managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1)
		end
		if not self:upgrade_blocked(self._name_id, "fire_rate_multiplier") then
			multiplier = multiplier * managers.player:upgrade_value(self._name_id, "fire_rate_multiplier", 1)
		end
		return multiplier
	end
	
		
	--Reload stuff
	function NewRaycastWeaponBase:reload_speed_multiplier()
		local multiplier = 1
		
		if self._lower_fast_reload then
			multiplier = multiplier * 1.05
		end
		
		if self._fast_reload then
			multiplier = multiplier * 1.05
		elseif self._faster_reload then
			multiplier = multiplier * 1.1
		elseif self._fastest_reload then
			multiplier = multiplier * 1.15
		elseif self._dual_reload then
			multiplier = multiplier * 1.25
		elseif self._slow_reload then
			multiplier = multiplier * 0.95
		elseif self._slower_reload then
			multiplier = multiplier * 0.9
		elseif self._slowest_reload then
			multiplier = multiplier * 0.85
		end
		
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
				
		if self._slow_ads_ns then
			multiplier = 0.95
		elseif self._slower_ads_ns then
			multiplier = 0.925
		elseif self._slowest_ads_ns then
			multiplier = 0.9
		end
		
		if self._slow_ads_brl then
			multiplier = multiplier - 0.05
		elseif self._slower_ads_brl then
			multiplier = multiplier - 0.075
		elseif self._slowest_ads_brl then
			multiplier = multiplier - 0.1
		elseif self._fast_ads_brl then
			multiplier = multiplier + 0.05
		end
		
		if self._slow_ads_hg then
			multiplier = multiplier - 0.05
		elseif self._slower_ads_hg then
			multiplier = multiplier - 0.075
		elseif self._slowest_ads_hg then
			multiplier = multiplier - 0.1
		elseif self._fast_ads_hg then
			multiplier = multiplier + 0.05
		elseif self._faster_ads_hg then
			multiplier = multiplier + 0.075
		elseif self._fastest_ads_hg then
			multiplier = multiplier + 0.1
		end
		
		if self._fast_ads_op then
			multiplier = multiplier + 0.05
		elseif self._slow_ads_op then
			multiplier = multiplier - 0.05
		elseif self._slower_ads_op then
			multiplier = multiplier - 0.075
		elseif self._slowest_ads_op then
			multiplier = multiplier - 0.1
		end		
		
		if self._fast_ads_grip then
			multiplier = multiplier + 0.05
		end

		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "enter_steelsight_speed_multiplier", 1)
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "combat_medic_enter_steelsight_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "enter_steelsight_speed_multiplier", 1)
		
		return multiplier
	end
	
elseif RequiredScript == "lib/managers/menu/blackmarketgui" then
		
	tweak_data.upgrades.weapon_movement_penalty.lmg = 1 --0.8
	tweak_data.weapon.m134.weapon_movement_penalty = 0.5
	tweak_data.weapon.rpg7.weapon_movement_penalty = 0.8
	tweak_data.weapon.m95.weapon_movement_penalty = 0.7
	tweak_data.weapon.mg42.weapon_movement_penalty = 0.7
	tweak_data.weapon.hk21.weapon_movement_penalty = 0.75
	tweak_data.weapon.m249.weapon_movement_penalty = 0.8
	tweak_data.weapon.r93.weapon_movement_penalty = 0.8
	tweak_data.weapon.rpk.weapon_movement_penalty = 0.85
	tweak_data.weapon.galil.weapon_movement_penalty = 0.85
	tweak_data.weapon.fal.weapon_movement_penalty = 0.9
	tweak_data.weapon.striker.weapon_movement_penalty = 0.9
	tweak_data.weapon.g3.weapon_movement_penalty = 0.9
	tweak_data.weapon.spas12.weapon_movement_penalty = 0.9
	tweak_data.weapon.mosin.weapon_movement_penalty = 0.9
	tweak_data.weapon.m1928.weapon_movement_penalty = 0.9
	tweak_data.weapon.l85a2.weapon_movement_penalty = 0.9
	tweak_data.weapon.akm_gold.weapon_movement_penalty = 0.9
	tweak_data.weapon.msr.weapon_movement_penalty = 0.95
	tweak_data.weapon.new_m14.weapon_movement_penalty = 0.95
	
	local massive_font = tweak_data.menu.pd2_massive_font
	local large_font = tweak_data.menu.pd2_large_font
	local medium_font = tweak_data.menu.pd2_medium_font
	local small_font = tweak_data.menu.pd2_small_font
	local massive_font_size = tweak_data.menu.pd2_massive_font_size
	local large_font_size = tweak_data.menu.pd2_large_font_size
	local medium_font_size = tweak_data.menu.pd2_medium_font_size
	local small_font_size = tweak_data.menu.pd2_small_font_size
	function BlackMarketGui:update_info_text()
		local slot_data = self._slot_data
		local tab_data = self._tabs[self._selected]._data
		local prev_data = tab_data.prev_node_data
		local ids_category = Idstring(slot_data.category)
		local identifier = tab_data.identifier
		local updated_texts = {
			{text = ""},
			{text = ""},
			{text = ""},
			{text = ""},
			{text = ""}
		}
		local ignore_lock = false
		self._stats_text_modslist:set_text("")
		local suspicion, max_reached = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
		self:_set_detection(suspicion, max_reached)
		self:_set_rename_info_text(nil)
		local is_renaming_this = self._renaming_item and not self._data.is_loadout and self._renaming_item.category == slot_data.category and self._renaming_item.slot == slot_data.slot
		if identifier == self.identifiers.weapon then
			local price = slot_data.price or 0
			if not slot_data.empty_slot then
				updated_texts[1].text = slot_data.name_localized
				local resource_color = {}
				updated_texts[2].resource_color = resource_color
				if price > 0 then
					updated_texts[2].text = "##" .. managers.localization:to_upper_text(slot_data.not_moddable and "st_menu_cost" or "st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##"
					table.insert(resource_color, slot_data.can_afford and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
				end
				if not slot_data.not_moddable and not self._data.is_loadout then
					self:_set_rename_info_text(1)
				end
				if not slot_data.unlocked then
					local skill_based = slot_data.skill_based
					local level_based = slot_data.level and 0 < slot_data.level
					local dlc_based = tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not tweak_data.dlc[slot_data.global_value].free and not managers.dlc:has_dlc(slot_data.global_value)
					local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
					local level_text_id = level_based and "bm_menu_level_req" or false
					local dlc_text_id = dlc_based and slot_data.dlc_locked or false
					local text = ""
					if skill_text_id then
						text = text .. managers.localization:to_upper_text(skill_text_id, {
							slot_data.name_localized
						}) .. "\n"
					elseif dlc_text_id then
						text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
					elseif level_text_id then
						text = text .. managers.localization:to_upper_text(level_text_id, {
							level = slot_data.level
						}) .. "\n"
					end
					updated_texts[3].text = text
					updated_texts[3].below_stats = true
				elseif self._slot_data.can_afford == false then
				end
				if slot_data.last_weapon then
					updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_last_weapon_warning") .. "\n"
				end
				if slot_data.global_value and slot_data.global_value ~= "normal" then
					updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
					updated_texts[4].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
					updated_texts[4].below_stats = true
				end
				if slot_data.not_moddable then
					do
						local weapon_id = slot_data.name
						local weapon_tweak = weapon_id and tweak_data.weapon[weapon_id]
						local movement_penalty = weapon_tweak.weapon_movement_penalty or 1
						if movement_penalty < 1 then
							local penalty_as_string = string.format("%d%%", math.round((1 - movement_penalty) * 100))
							updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_weapon_movement_penalty_info", {penalty = penalty_as_string})
						end
						if weapon_tweak.has_description then
							updated_texts[4].text = updated_texts[4].text .. [[


]] .. managers.localization:text(tweak_data.weapon[slot_data.name].desc_id)
						end
					end
				else
				end
				updated_texts[5].below_stats = true
			elseif slot_data.locked_slot then
				ignore_lock = true
				updated_texts[1].text = managers.localization:to_upper_text("bm_menu_locked_weapon_slot")
				if slot_data.cannot_buy then
					updated_texts[3].text = slot_data.dlc_locked
				else
					updated_texts[2].text = slot_data.dlc_locked
				end
				updated_texts[4].text = managers.localization:text("bm_menu_locked_weapon_slot_desc")
			elseif not slot_data.is_loadout then
				local prefix = ""
				if not managers.menu:is_pc_controller() then
					prefix = managers.localization:get_default_macro("BTN_A")
				end
				updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_weapon")
				updated_texts[4].text = managers.localization:text("bm_menu_empty_weapon_slot_buy_info")
			end
		elseif identifier == self.identifiers.melee_weapon then
			updated_texts[1].text = self._slot_data.name_localized
			if not slot_data.unlocked then
				local skill_based = slot_data.skill_based
				local level_based = slot_data.level and 0 < slot_data.level
				local dlc_based = not slot_data.dlc_based and tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not tweak_data.dlc[slot_data.global_value].free and not managers.dlc:has_dlc(slot_data.global_value)
				local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
				local level_text_id = level_based and "bm_menu_level_req" or false
				local dlc_text_id = dlc_based and slot_data.dlc_locked or false
				local text = ""
				if skill_text_id then
					text = text .. managers.localization:to_upper_text(skill_text_id, {
						slot_data.name_localized
					}) .. "\n"
				elseif dlc_text_id then
					text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
				elseif level_text_id then
					text = text .. managers.localization:to_upper_text(level_text_id, {
						level = slot_data.level
					}) .. "\n"
				end
				updated_texts[3].text = text
			end
			updated_texts[4].resource_color = {}
			local desc_text = managers.localization:text(tweak_data.blackmarket.melee_weapons[slot_data.name].desc_id)
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
			end
			updated_texts[4].below_stats = true
			--updated_texts[4].text = desc_text --Gotta make descriptions for all the melee weapons first
		elseif identifier == self.identifiers.armor then
			updated_texts[1].text = self._slot_data.name_localized
			if not self._slot_data.unlocked then
				updated_texts[3].text = utf8.to_upper(managers.localization:text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
					level = slot_data.level,
					SKILL = slot_data.name
				}))
			end
		elseif identifier == self.identifiers.mask then
			local price = slot_data.price
			if not price then
				if type(slot_data.unlocked) ~= "number" then
					price = managers.money:get_mask_slot_sell_value(slot_data.slot)
				else
					price = managers.money:get_mask_sell_value(slot_data.name, slot_data.global_value)
				end
			end
			if not slot_data.empty_slot then
				updated_texts[1].text = slot_data.name_localized
				if not self._data.is_loadout and slot_data.slot ~= 1 and slot_data.unlocked == true then
					self:_set_rename_info_text(1)
				end
				local resource_colors = {}
				if price > 0 and slot_data.slot ~= 1 then
					updated_texts[2].text = "##" .. managers.localization:to_upper_text("st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##" .. "   "
					table.insert(resource_colors, slot_data.can_afford ~= false and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
				end
				if slot_data.num_backs then
					updated_texts[2].text = updated_texts[2].text .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
						amount = math.abs(slot_data.unlocked)
					}) .. "##"
					table.insert(resource_colors, tweak_data.screen_colors.text)
				end
				if #resource_colors == 1 then
					updated_texts[2].resource_color = resource_colors[1]
				else
					updated_texts[2].resource_color = resource_colors
				end
				local achievement_tracker = tweak_data.achievement.mask_tracker
				local mask_id = slot_data.name
				if slot_data.dlc_locked then
					updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
				elseif slot_data.infamy_lock then
					updated_texts[3].text = managers.localization:to_upper_text("menu_infamy_lock_info")
				elseif mask_id and achievement_tracker[mask_id] and (type(slot_data.unlocked) ~= "number" and not slot_data.unlocked or slot_data.unlocked == 0) then
					local achievement_data = achievement_tracker[mask_id]
					local max_progress = achievement_data.max_progress
					local text_id = achievement_data.text_id
					local award = achievement_data.award
					local stat = achievement_data.stat
					if stat and max_progress > 0 then
						local progress_left = max_progress - (managers.achievment:get_stat(stat) or 0)
						if progress_left > 0 then
							local progress = tostring(progress_left)
							updated_texts[3].text = "##" .. managers.localization:text(achievement_data.text_id, {progress = progress}) .. "##"
							updated_texts[3].resource_color = tweak_data.screen_colors.button_stage_2
						end
					elseif award and not managers.achievment:get_info(award).awarded then
						updated_texts[3].text = "##" .. managers.localization:text(achievement_data.text_id) .. "##"
						updated_texts[3].resource_color = tweak_data.screen_colors.button_stage_2
					end
				end
				if mask_id then
					local desc_id = tweak_data.blackmarket.masks[mask_id].desc_id
					updated_texts[4].text = desc_id and managers.localization:text(desc_id) or Application:production_build() and "Add ##desc_id## to ##" .. mask_id .. "## in tweak_data.blackmarket.masks" or ""
					if slot_data.global_value and slot_data.global_value ~= "normal" then
						updated_texts[4].text = updated_texts[4].text .. [[

##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
						updated_texts[4].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
					end
					if Application:production_build() and not desc_id then
						updated_texts[4].resource_color = Color.red
					end
				end
			elseif slot_data.locked_slot then
				ignore_lock = true
				updated_texts[1].text = managers.localization:to_upper_text("bm_menu_locked_mask_slot")
				if slot_data.cannot_buy then
					updated_texts[3].text = slot_data.dlc_locked
				else
					updated_texts[2].text = slot_data.dlc_locked
				end
				updated_texts[4].text = managers.localization:text("bm_menu_locked_mask_slot_desc")
			else
				if slot_data.cannot_buy then
					updated_texts[2].text = managers.localization:to_upper_text("bm_menu_empty_mask_slot")
					updated_texts[3].text = managers.localization:to_upper_text("bm_menu_no_masks_in_stash_varning")
				else
					local prefix = ""
					if not managers.menu:is_pc_controller() then
						prefix = managers.localization:get_default_macro("BTN_A")
					end
					updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_mask")
				end
				updated_texts[4].text = managers.localization:text("bm_menu_empty_mask_slot_buy_info")
			end
		elseif identifier == self.identifiers.weapon_mod then
			local price = slot_data.price or managers.money:get_weapon_modify_price(prev_data.name, slot_data.name, slot_data.global_value)
			updated_texts[1].text = slot_data.name_localized
			local resource_colors = {}
			if price > 0 then
				updated_texts[2].text = "##" .. managers.localization:to_upper_text("st_menu_cost") .. " " .. managers.experience:cash_string(price) .. "##"
				table.insert(resource_colors, slot_data.can_afford and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
			end
			local unlocked = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked or 0
			updated_texts[2].text = updated_texts[2].text .. (price > 0 and "   " or "")
			if slot_data.free_of_charge then
				if unlocked > 0 then
					updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("bm_menu_item_unlocked")
				else
					updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("bm_menu_item_locked")
				end
			else
				updated_texts[2].text = updated_texts[2].text .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
					amount = tostring(math.abs(unlocked))
				}) .. "##"
				table.insert(resource_colors, tweak_data.screen_colors.text)
			end
			if #resource_colors == 1 then
				updated_texts[2].resource_color = resource_colors[1]
			else
				updated_texts[2].resource_color = resource_colors
			end
			local can_not_afford = slot_data.can_afford == false
			local conflicted = slot_data.conflict
			local out_of_item = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked == 0
			if slot_data.dlc_locked then
				updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
			elseif conflicted then
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_conflict", {
					conflict = slot_data.conflict
				})
			end
			local part_id = slot_data.name
			local perks = part_id and tweak_data.weapon.factory.parts[part_id].perks
			local is_gadget = part_id and tweak_data.weapon.factory.parts[part_id].type == "gadget" or perks and table.contains(perks, "gadget")
			local is_ammo = part_id and tweak_data.weapon.factory.parts[part_id].type == "ammo" or perks and table.contains(perks, "ammo")
			local is_bayonet = part_id and tweak_data.weapon.factory.parts[part_id].type == "bayonet" or perks and table.contains(perks, "bayonet")
			local has_desc = part_id and tweak_data.weapon.factory.parts[part_id].has_description == true
			if is_gadget or is_ammo or is_bayonet or has_desc or perks then
				local crafted = managers.blackmarket:get_crafted_category_slot(prev_data.category, prev_data.slot)
				updated_texts[4].text = managers.weapon_factory:get_part_desc_by_part_id_from_weapon(part_id, crafted.factory_id, crafted.blueprint)
			end
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				if is_gadget or is_ammo or is_bayonet or has_desc or perks then
					updated_texts[4].text = updated_texts[4].text .. [[

##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				else
					updated_texts[4].text = "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				end
				updated_texts[4].resource_color = {
					tweak_data.lootdrop.global_values[slot_data.global_value].color
				}
			end
			updated_texts[4].below_stats = true
		elseif identifier == self.identifiers.mask_mod then
			if not managers.blackmarket:currently_customizing_mask() then
				return
			end
			local mask_mod_info = managers.blackmarket:info_customize_mask()
			updated_texts[2].text = managers.localization:to_upper_text("bm_menu_mask_customization") .. "\n"
			local material_text = managers.localization:to_upper_text("bm_menu_materials")
			local pattern_text = managers.localization:to_upper_text("bm_menu_textures")
			local colors_text = managers.localization:to_upper_text("bm_menu_colors")
			if mask_mod_info[1].overwritten then
				updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
			elseif mask_mod_info[1].is_good then
				updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. managers.localization:text(mask_mod_info[1].text)
				if mask_mod_info[1].price and 0 < mask_mod_info[1].price then
					updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[1].price)
				end
				updated_texts[2].text = updated_texts[2].text .. "\n"
			else
				updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
			end
			if mask_mod_info[2].overwritten then
				updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
			elseif mask_mod_info[2].is_good then
				updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. managers.localization:text(mask_mod_info[2].text)
				if mask_mod_info[2].price and 0 < mask_mod_info[2].price then
					updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[2].price)
				end
				updated_texts[2].text = updated_texts[2].text .. "\n"
			else
				updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
			end
			if mask_mod_info[3].overwritten then
				updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
			elseif mask_mod_info[3].is_good then
				updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. managers.localization:text(mask_mod_info[3].text)
				if mask_mod_info[3].price and 0 < mask_mod_info[3].price then
					updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[3].price)
				end
				updated_texts[2].text = updated_texts[2].text .. "\n"
			else
				updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
			end
			updated_texts[2].text = updated_texts[2].text .. "\n"
			local price, can_afford = managers.blackmarket:get_customize_mask_value()
			if slot_data.global_value then
				local mask = managers.blackmarket:get_crafted_category("masks")[slot_data.prev_slot] or {}
				updated_texts[4].text = [[
	

]] .. managers.localization:to_upper_text("menu_bm_highlighted") .. "\n" .. slot_data.name_localized
				local mod_price = managers.money:get_mask_part_price_modified(slot_data.category, slot_data.name, slot_data.global_value, mask.mask_id) or 0
				if mod_price > 0 then
					updated_texts[4].text = updated_texts[4].text .. " " .. managers.experience:cash_string(mod_price)
				else
					updated_texts[4].text = updated_texts[4].text
				end
				if slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked ~= 0 then
					updated_texts[4].text = updated_texts[4].text .. "\n" .. managers.localization:to_upper_text("bm_menu_item_amount", {
						amount = math.abs(slot_data.unlocked)
					})
				end
				updated_texts[4].resource_color = {}
				if slot_data.global_value and slot_data.global_value ~= "normal" then
					updated_texts[4].text = updated_texts[4].text .. [[

##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
					table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
				end
				if slot_data.dlc_locked then
					updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
				end
				local customize_mask_blueprint = managers.blackmarket:get_customize_mask_blueprint()
				local index = {
					materials = 1,
					textures = 2,
					colors = 3
				}
				index = index[slot_data.category]
				if index == 1 then
					customize_mask_blueprint.material = {
						global_value = slot_data.global_value,
						id = slot_data.name
					}
				elseif index == 2 then
					customize_mask_blueprint.pattern = {
						global_value = slot_data.global_value,
						id = slot_data.name
					}
				elseif index == 3 then
					customize_mask_blueprint.color = {
						global_value = slot_data.global_value,
						id = slot_data.name
					}
				end
				local part_info = managers.blackmarket:get_info_from_mask_blueprint(customize_mask_blueprint, mask.mask_id)
				part_info = part_info[index]
				if part_info.override then
					updated_texts[4].text = updated_texts[4].text .. [[

##]] .. managers.localization:to_upper_text("menu_bm_overwrite", {
						category = managers.localization:text("bm_menu_" .. part_info.override)
					}) .. "##"
					table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
				end
			end
			if price and price > 0 then
				updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("menu_bm_total_cost", {
					cost = (not can_afford and "##" or "") .. managers.experience:cash_string(price) .. (not can_afford and "##" or "")
				})
			end
			updated_texts[2].resource_color = tweak_data.screen_colors.important_1
			if not managers.blackmarket:can_finish_customize_mask() then
				local list_of_mods = ""
				local missed_mods = {}
				for _, data in ipairs(mask_mod_info) do
					if not data.is_good and not data.overwritten then
						table.insert(missed_mods, managers.localization:text(data.text))
					end
				end
				if #missed_mods > 1 then
					for i = 1, #missed_mods do
						list_of_mods = list_of_mods .. missed_mods[i]
						if i < #missed_mods - 1 then
							list_of_mods = list_of_mods .. ", "
						elseif i == #missed_mods - 1 then
							list_of_mods = list_of_mods .. managers.localization:text("bm_menu_last_of_kind")
						end
					end
				elseif #missed_mods == 1 then
					list_of_mods = missed_mods[1]
				end
				if slot_data.dlc_locked then
					updated_texts[3].text = updated_texts[3].text .. "\n" .. managers.localization:to_upper_text("bm_menu_missing_to_finalize_mask", {missed_mods = list_of_mods}) .. "\n"
				else
					updated_texts[3].text = managers.localization:to_upper_text("bm_menu_missing_to_finalize_mask", {missed_mods = list_of_mods}) .. "\n"
				end
			end
		elseif identifier == self.identifiers.deployable then
			updated_texts[1].text = slot_data.name_localized
			if not self._slot_data.unlocked then
				updated_texts[3].text = managers.localization:to_upper_text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
					level = slot_data.level,
					SKILL = slot_data.name
				})
				updated_texts[3].text = updated_texts[3].text .. "\n"
			end
			updated_texts[4].text = managers.localization:text(tweak_data.blackmarket.deployables[slot_data.name].desc_id, {
				BTN_INTERACT = managers.localization:btn_macro("interact", true),
				BTN_USE_ITEM = managers.localization:btn_macro("use_item", true)
			})
		elseif identifier == self.identifiers.character then
			updated_texts[1].text = slot_data.name_localized
			if not slot_data.unlocked then
				local dlc_text_id = slot_data.dlc_locked or "ERR"
				local text = managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
				updated_texts[3].text = text
			end
			updated_texts[4].text = managers.localization:text(slot_data.name .. "_desc")
		end
		if self._desc_mini_icons then
			for _, gui_object in pairs(self._desc_mini_icons) do
				self._panel:remove(gui_object[1])
			end
		end
		self._desc_mini_icons = {}
		local desc_mini_icons = self._slot_data.desc_mini_icons
		local info_box_panel = self._panel:child("info_box_panel")
		if desc_mini_icons and 0 < table.size(desc_mini_icons) then
			for _, mini_icon in pairs(desc_mini_icons) do
				local new_icon = self._panel:bitmap({
					texture = mini_icon.texture,
					x = info_box_panel:left() + 10 + mini_icon.right,
					w = mini_icon.w or 32,
					h = mini_icon.h or 32
				})
				table.insert(self._desc_mini_icons, {new_icon, 2})
			end
			updated_texts[2].text = string.rep("     ", table.size(desc_mini_icons)) .. updated_texts[2].text
		else
		end
		if not ignore_lock and slot_data.lock_texture and slot_data.lock_texture ~= true then
			local new_icon = self._panel:bitmap({
				texture = slot_data.lock_texture,
				x = info_box_panel:left() + 10,
				w = 20,
				h = 20,
				color = self._info_texts[3]:color(),
				blend_mode = "add"
			})
			updated_texts[3].text = "     " .. updated_texts[3].text
			table.insert(self._desc_mini_icons, {new_icon, 3})
		else
		end
		if is_renaming_this and self._rename_info_text then
			local text = self._renaming_item.custom_name ~= "" and self._renaming_item.custom_name or "##" .. tostring(slot_data.raw_name_localized) .. "##"
			updated_texts[self._rename_info_text].text = text
			updated_texts[self._rename_info_text].resource_color = tweak_data.screen_colors.text:with_alpha(0.35)
		end
		for id, _ in ipairs(self._info_texts) do
			self:set_info_text(id, updated_texts[id].text, updated_texts[id].resource_color)
		end
		local _, _, _, th = self._info_texts[1]:text_rect()
		self._info_texts[1]:set_h(th)
		local y = self._info_texts[1]:bottom()
		local title_offset = y
		local bg = self._info_texts_bg[1]
		if alive(bg) then
			bg:set_shape(self._info_texts[1]:shape())
		end
		local below_y
		for i = 2, #self._info_texts do
			local info_text = self._info_texts[i]
			info_text:set_font_size(small_font_size)
			_, _, _, th = info_text:text_rect()
			info_text:set_y(y)
			info_text:set_h(th)
			if updated_texts[i].below_stats then
				if slot_data.comparision_data and alive(self._stats_text_modslist) then
					info_text:set_world_y(below_y or self._stats_text_modslist:world_top())
					below_y = (below_y or info_text:world_y()) + th
				else
					info_text:set_top((below_y or info_text:top()) + 20)
					below_y = (below_y or info_text:top()) + th
				end
			end
			local scale = 1
			if info_text:bottom() > self._info_texts_panel:h() then
				scale = self._info_texts_panel:h() / info_text:bottom() * .85
			end
			info_text:set_font_size(small_font_size * scale)
			_, _, _, th = info_text:text_rect()
			info_text:set_h(th)
			local bg = self._info_texts_bg[i]
			if alive(bg) then
				bg:set_shape(info_text:shape())
			end
			y = info_text:bottom()
		end
		for _, desc_mini_icon in ipairs(self._desc_mini_icons) do
			desc_mini_icon[1]:set_y(title_offset)
			desc_mini_icon[1]:set_world_top(self._info_texts[desc_mini_icon[2]]:world_top())
		end
		if is_renaming_this and self._rename_info_text and self._rename_caret then
			local info_text = self._info_texts[self._rename_info_text]
			local x, y, w, h = info_text:text_rect()
			if self._renaming_item.custom_name == "" then
				w = 0
			end
			self._rename_caret:set_w(2)
			self._rename_caret:set_h(h)
			self._rename_caret:set_world_position(x + w, y)
		end
	end

end
