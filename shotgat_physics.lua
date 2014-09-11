if not Shotty then 

if not NewShotgunBase then return end

--Makes shotgun pellet damage accumulative, code thanks to LazyOzzy

function NewShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	if self._rays == 1 then
		local result = NewShotgunBase.super._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
		return result
	end

	local mvec_to = Vector3()
	local mvec_direction = Vector3()
	local mvec_spread_direction = Vector3()
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
	local pellets = self._rays
	
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
	
	for i = 1, self._rays do
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
		if damage > 0 --[[and not col_ray.unit:character_damage():dead()]] then
			local result = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			if result and result.type == "death" then
				managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance)
			end
		end
	end

	if dodge_enemies and self._suppression then
		for enemy_data, dis_error in pairs( dodge_enemies ) do
			enemy_data.unit:character_damage():build_suppression(suppr_mul * dis_error * self._suppression)
		end
	end

	result.hit_enemy = next(hit_enemies) and true or false
	if self._alert_events then
		result.rays = #col_rays > 0 and col_rays
	end
	managers.statistics:shot_fired({ hit = false, weapon_unit = self._unit })
	
	local exclude_hit_unit = {}
	for k,v in pairs(hit_enemies) do
		if not exclude_hit_unit[v.unit:key()] then
			managers.statistics:shot_fired({ hit = true, weapon_unit = self._unit, skip_bullet_count = true })
			exclude_hit_unit[v.unit:key()] = true
		end
	end
	
	return result
end


if not GamePlayCentralManager then return end

--Shotgun push code
--provided by B1313
function GamePlayCentralManager:do_shotgun_push( unit, hit_pos, dir, distance )
    if distance > 1000 then
        return
    end
    
    if unit:movement()._active_actions[1] and unit:movement()._active_actions[1]:type() == "hurt" then
        unit:movement()._active_actions[1]:force_ragdoll()
    end
    
    local scale = math.clamp( 1 - distance / 500, 0.5, 1 ) * 0.4 -- <<<< NEW MULTIPLIER HERE
	
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

Shotty = true
end