--[[
v1.42.3
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/units/weapons/shotgun/newshotgunbase" then
	local old_update_stats_values = NewShotgunBase._update_stats_values
	
	function NewShotgunBase:setup_default()
		self._range = self._damage_far
		self._damage_near = (tweak_data.weapon[self._name_id].damage_near * 100) or 1000
		self._damage_far = (tweak_data.weapon[self._name_id].damage_far * 100) or 4000
		self._damage_far = self._damage_far - self._damage_near -- - damage_near = 40 m
		self._rays = tweak_data.weapon[self._name_id].rays or 8
		self._use_shotgun_reload = self._use_shotgun_reload or self._use_shotgun_reload == nil
	end
	
	function NewShotgunBase:_update_stats_values()

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
		end
		
		old_update_stats_values(self)	
	end
	
	--Makes shotgun pellet damage accumulative, code thanks to LazyOzzy
	local mvec_to = Vector3()
	local mvec_direction = Vector3()
	local mvec_spread_direction = Vector3()
	function NewShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
		local result
		local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_enemy or self._can_shoot_through_wall
		if add_shoot_through_bullet then
			result = NewShotgunBase.super._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
		end
		local hit_enemies = {}
		local hit_something, col_rays
		if self._alert_events then
			col_rays = {}
		end
		local damage = self:_get_current_damage(dmg_mul)
		local autoaim, dodge_enemies = self:check_autoaim(from_pos, direction, self._range)
		local weight = 0.1
		local enemy_died = false
		local pellets = self._rays
		--[[
		if self:in_burst_mode() then
			pellets = pellets * 2
		end
		]]
		
		local function hit_enemy(col_ray)
			if col_ray.unit:character_damage() and col_ray.unit:character_damage().is_head then
				table.insert(hit_enemies, col_ray)
			else
				self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			end
		end
	
		local spread = self:_get_spread(user_unit)
		mvector3.set(mvec_direction, direction)
	
		damage = damage / self._rays --split damage across all pellets
		spread = spread
		
		for i = add_shoot_through_bullet and 2 or 1, pellets do
			mvector3.set(mvec_spread_direction, mvec_direction)
			if spread then
				mvector3.spread(mvec_spread_direction, spread * (spread_mul or 1))
			end
	
			mvector3.set(mvec_to, mvec_spread_direction)
			mvector3.multiply(mvec_to, 20000)
			mvector3.add(mvec_to, from_pos)
			
			local col_ray = World:raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
			if col_rays then
				if col_ray then
					table.insert(col_rays, col_ray)
				else
					local ray_to = mvector3.copy(mvec_to)
					local spread_direction = mvector3.copy(mvec_spread_direction)
					table.insert(col_rays, {position = ray_to, ray = spread_direction})
				end
			end
			
			if col_ray then
				local tracer_dist = col_ray.distance
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
	
		for _, col_ray in pairs( hit_enemies ) do
			local damage = self:get_damage_falloff(damage, col_ray, user_unit)
			if damage > 0 and not col_ray.unit:character_damage():dead() then
				local my_result = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
				if my_result and my_result.type == "death" then
					managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance)
				end
			else
				if damage > 0 then
					managers.game_play_central:play_impact_flesh({col_ray = col_ray})
					managers.game_play_central:play_impact_sound_and_effects({col_ray = col_ray})
				end
			end
		end
	
		if dodge_enemies and self._suppression then
			for enemy_data, dis_error in pairs( dodge_enemies ) do
				enemy_data.unit:character_damage():build_suppression(suppr_mul * dis_error * self._suppression)
			end
		end
	
		if not result then
			result = {}
			result.hit_enemy = next(hit_enemies) and true or false
			if self._alert_events then
				result.rays = #col_rays > 0 and col_rays
			end
		end
		if not shoot_through_data then
			managers.statistics:shot_fired({
				hit = false,
				weapon_unit = self._unit
			})
		end
		
		local exclude_hit_unit = {}
		for k,v in pairs(hit_enemies) do
			if not exclude_hit_unit[v.unit:key()] then
				managers.statistics:shot_fired({ hit = true, weapon_unit = self._unit, skip_bullet_count = true })
				exclude_hit_unit[v.unit:key()] = true
			end
		end
		
		return result
	end

elseif RequiredScript == "lib/managers/gameplaycentralmanager" then

	--Shotgun push code
	--provided by B1313
	function GamePlayCentralManager:do_shotgun_push( unit, hit_pos, dir, distance )
		if distance > 500 then
			return
		end
		
		if unit:movement()._active_actions[1] and unit:movement()._active_actions[1]:type() == "hurt" then
			unit:movement()._active_actions[1]:force_ragdoll()
		end
		
		local scale = math.clamp( 1 - distance / 500, 0.5, 1 ) * 1 -- <<<< NEW MULTIPLIER HERE
		
		local height = mvector3.distance( hit_pos, unit:position() ) - 100
		
		local twist_dir = math.random( 2 ) == 1 and 1 or -1
		local rot_acc = ( dir:cross( math.UP ) + math.UP * ( 0.5 * twist_dir ) ) * ( -1000 * math.sign( height ) )
		local rot_time = 1 + math.rand( 2 )
		
		local nr_u_bodies = unit:num_bodies()
		local i_u_body = 0
		while i_u_body < nr_u_bodies do
			local u_body = unit:body( i_u_body )
			if u_body:enabled() and u_body:dynamic() then
				local body_mass = u_body:mass()
				
				World:play_physic_effect( Idstring( "physic_effects/shotgun_hit" ), u_body, Vector3( dir.x, dir.y, dir.z + 0.5 ) * 600 --[[600]] * scale, 4 * body_mass / math.random( 2 ), rot_acc, rot_time )
			end
			i_u_body = i_u_body + 1
		end
	end

end