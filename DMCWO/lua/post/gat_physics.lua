--[[
v1.33
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
		local multiplier = 1

		self._block_eq_aced = managers.weapon_factory:has_perk("fire_mode_auto", factory_id, blueprint or default_blueprint)
		
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
		
		self._f90_rof = managers.weapon_factory:has_perk("f90_rof", factory_id, blueprint or default_blueprint)
		
		self._rapid_fire = managers.weapon_factory:has_perk("fire_mode_auto", factory_id, blueprint or default_blueprint)
		self._slow_fire = managers.weapon_factory:has_perk("fire_mode_single", factory_id, blueprint or default_blueprint)
		
		self._quick_bolt = managers.weapon_factory:has_perk("quick_bolt", factory_id, blueprint or default_blueprint)
		self._fast_bolt = managers.weapon_factory:has_perk("fast_bolt", factory_id, blueprint or default_blueprint)
		self._slow_bolt = managers.weapon_factory:has_perk("slow_bolt", factory_id, blueprint or default_blueprint)
		
		self._db_charge = managers.weapon_factory:has_perk("db_charge", factory_id, blueprint or default_blueprint)
		
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
		elseif self._f90_rof then
			multiplier = multiplier / 0.82352941176470588235294117647059
		end
		
		if self._quick_bolt then
			multiplier = multiplier * 1.02
		elseif self._fast_bolt then
			multiplier = multiplier * 1.05
		elseif self._slow_bolt then
			multiplier = multiplier * 0.95
		end
		
		if self._db_charge and not (name == "r870" or name == "serbu" or name == "ksg" or name == "judge" or name == "huntsman" or name == "b682" or name == "striker") then
			multiplier = multiplier * 0.9
		end
		
		if self._rapid_fire and not (name == "c96" or name == "tec9" or name == "colt_1911") then 
			multiplier = multiplier * 1.15
		elseif self._rapid_fire and name == "c96" then 
			multiplier = multiplier * 2
		elseif self._rapid_fire and name == "tec9" then 
			multiplier = multiplier * 1.33333333333333
		elseif self._rapid_fire and name == "colt_1911" then 
			multiplier = multiplier * 2.1978021978021978021978021978022
		elseif self._slow_fire then 
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
	
	tweak_data.weapon.m134.weapon_movement_penalty = 0.4
	
	tweak_data.weapon.m95.weapon_movement_penalty = 0.7
	tweak_data.weapon.mg42.weapon_movement_penalty = 0.7
	
	tweak_data.weapon.hk21.weapon_movement_penalty = 0.75
	
	tweak_data.weapon.m249.weapon_movement_penalty = 0.8
	tweak_data.weapon.r93.weapon_movement_penalty = 0.8
	tweak_data.weapon.rpg7.weapon_movement_penalty = 0.8
	
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
	tweak_data.weapon.aa12.weapon_movement_penalty = 0.9
	tweak_data.weapon.m32.weapon_movement_penalty = 0.9
	
	tweak_data.weapon.msr.weapon_movement_penalty = 0.95
	tweak_data.weapon.new_m14.weapon_movement_penalty = 0.95
	
	--Muzzle flash stuff
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
		self._f90_rof = managers.weapon_factory:has_perk("f90_rof", self._factory_id, self._blueprint)
		
		self._rapid_fire = managers.weapon_factory:has_perk("fire_mode_auto", self._factory_id, self._blueprint)
		self._slow_fire = managers.weapon_factory:has_perk("fire_mode_single", self._factory_id, self._blueprint)
		self._quick_bolt = managers.weapon_factory:has_perk("quick_bolt", self._factory_id, self._blueprint)
		self._fast_bolt = managers.weapon_factory:has_perk("fast_bolt", self._factory_id, self._blueprint)
		self._slow_bolt = managers.weapon_factory:has_perk("slow_bolt", self._factory_id, self._blueprint)
		
		self._db_charge = managers.weapon_factory:has_perk("db_charge", self._factory_id, self._blueprint)
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
		
		self._damage_near = tweak_data.weapon[self._name_id].damage_near or 1000 -- 10 m
		self._damage_far = tweak_data.weapon[self._name_id].damage_far or 20000 -- 200 m
		self._damage_min = tweak_data.weapon[self._name_id].damage_min or 0.6 -- maximum 60% drop
		
		if self._long_barrel then
			self._damage_near = self._damage_near * 1.15
			self._damage_far = self._damage_far * 1.15
		elseif self._dmr_barrel then
			self._damage_near = self._damage_near * 1.30
			self._damage_far = self._damage_far * 1.30		
			self._damage_min = self._damage_min * 1.1		
		elseif self._short_barrel then
			self._damage_near = self._damage_near * 0.90
			self._damage_far = self._damage_far * 0.90
		end
		
		if self._silencer and not self._supp_barrel then
			self._damage_near = self._damage_near * 0.75
			self._damage_far = self._damage_far * 0.75
			self._damage_min = self._damage_min * 0.85
		end
	end
				
	--Damage falloff for non-shotguns (Penetration/Distance and col_ray bugs fixed by LazyOzzy)
	function NewRaycastWeaponBase:get_damage_falloff(damage, col_ray, user_unit, distance)
		local dist = distance or mvector3.distance(col_ray.unit:position(), user_unit:position())
		
		--[[ 			
		log("Dist: " .. tostring(dist/100) .. "\n") --Distance from the surface/object/enemy you hit
		log("Drop Dist: " .. tostring(self._damage_near/100) .. "m \n") --Distance drop-off starts
		log("Min. Dmg at: " .. (((1 - self._damage_min) * (self._damage_far/100)) + (self._damage_near / 100)) .. "m \n") --Distance you'll hit minimum damage in meters
		log("Min. Dmg: " .. tostring((damage * 10) * self._damage_min) .. "\n") --Lowest possible damage your gun will output at max range
		log("Init Dmg: " .. tostring(damage * 10) .. "\n") --Initial damage from your shot
		  ]]
		
		local ratio = (1 - math.min(1, math.max(0, dist - self._damage_near) / self._damage_far))
		if ratio < self._damage_min then
			ratio = self._damage_min
		end
	
		damage = ratio * damage
		
		--log("Impact Dmg: " .. tostring(damage * 10) .. "\n\n") --Damage on impact
		
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
			total_distance = shoot_through_data and shoot_through_data.total_distance and (shoot_through_data.total_distance + col_ray.distance) or col_ray.distance
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
					damage = self:get_damage_falloff(damage, col_ray, user_unit, total_distance)
					hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
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
		if col_ray and total_distance ~=nil then
			if (col_ray and total_distance > 700 or not col_ray) and alive(self._obj_fire) then
				self._obj_fire:m_position(self._trail_effect_table.position)
				mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)
				local trail = World:effect_manager():spawn(self._trail_effect_table)
				if col_ray then
					World:effect_manager():set_remaining_lifetime(trail, math.clamp((total_distance - 600) / 10000, 0, total_distance))
				end
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
					dmg_mul = ( dmg_mul or 1 ) * (tweak_data.weapon[self._name_id].shield_damage or 0.25)
				end

				self._shoot_through_data.has_hit_wall = has_hit_wall or is_wall
				self._shoot_through_data.has_passed_shield = has_passed_shield or is_shield
				self._shoot_through_data.ray_from_unit = ray_from_unit
				self._shoot_through_data.ray_distance = ray_distance - col_ray.distance
		
				mvector3.set( self._shoot_through_data.from, mvec_spread_direction )
				
				local penetration_power = tweak_data.weapon[self._name_id].penetration_power or 0.5
				local penetration
				if (damage * 10) * penetration_power > 55 then
					penetration = 55
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
		elseif self._f90_rof then
			multiplier = multiplier / 0.82352941176470588235294117647059
		end
		
		if self._quick_bolt then
			multiplier = multiplier * 1.02
		elseif self._fast_bolt then
			multiplier = multiplier * 1.05
		elseif self._slow_bolt then
			multiplier = multiplier * 0.95
		end
		
		if self._db_charge and not (self._name_id == "r870" or self._name_id == "serbu" or self._name_id == "ksg" or self._name_id == "huntsman" or self._name_id == "b682" or self._name_id == "judge" or self._name_id == "striker") then
			multiplier = multiplier * 0.9
		end
		
		if self._rapid_fire and not (self._name_id == "c96" or self._name_id == "tec9" or self._name_id == "colt_1911") then 
			multiplier = multiplier * 1.15
		elseif self._rapid_fire and self._name_id == "c96" then 
			multiplier = multiplier * 2
		elseif self._rapid_fire and self._name_id == "tec9" then 
			multiplier = multiplier * 1.33333333333333
		elseif self._rapid_fire and self._name_id == "colt_1911" then 
			multiplier = multiplier * 2.1978021978021978021978021978022
		elseif self._slow_fire then 
			multiplier = multiplier * 0.9
		end

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
end
