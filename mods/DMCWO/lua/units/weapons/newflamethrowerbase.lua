--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

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

--Provided by SC
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