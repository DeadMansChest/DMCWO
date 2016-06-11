--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

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
	
	for i = add_shoot_through_bullet and 2 or 1, self._rays do
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
	
	
--[[ 
local mvec_temp = Vector3()
local mvec_to = Vector3()
local mvec_direction = Vector3()
local mvec_spread_direction = Vector3()
function NewShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	local result
	local hit_enemies = {}
	local hit_objects = {}
	local hit_something, col_rays
	if self._alert_events then
		col_rays = {}
	end
	local damage = self:_get_current_damage(dmg_mul)
	local autoaim, dodge_enemies = self:check_autoaim(from_pos, direction, self._range)
	local weight = 0.1
	local enemy_died = false
	local function hit_enemy(col_ray)
		if col_ray.unit:character_damage() then
			local enemy_key = col_ray.unit:key()
			if not hit_enemies[enemy_key] or col_ray.unit:character_damage().is_head and col_ray.unit:character_damage():is_head(col_ray.body) then
				hit_enemies[enemy_key] = col_ray
			end
		else
			local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_wall
			if add_shoot_through_bullet then
				hit_objects[col_ray.unit:key()] = hit_objects[col_ray.unit:key()] or {}
				table.insert(hit_objects[col_ray.unit:key()], col_ray)
			else
				self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			end
		end
	end
	local spread = self:_get_spread(user_unit)
	mvector3.set(mvec_direction, direction)
	
	
	damage = damage / self._rays --split damage across all pellets
	
	for i = 1, shoot_through_data and 1 or self._rays do
		mvector3.set(mvec_spread_direction, mvec_direction)
		if spread then
			mvector3.spread(mvec_spread_direction, spread * (spread_mul or 1))
		end
		mvector3.set(mvec_to, mvec_spread_direction)
		mvector3.multiply(mvec_to, 20000)
		mvector3.add(mvec_to, from_pos)
		local ray_from_unit = shoot_through_data and alive(shoot_through_data.ray_from_unit) and shoot_through_data.ray_from_unit or nil
		local col_ray = (ray_from_unit or World):raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
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
	for _, col_rays in pairs(hit_objects) do
		local center_ray = col_rays[1]
		if #col_rays > 1 then
			mvector3.set_static(mvec_temp, center_ray)
			for _, col_ray in ipairs(col_rays) do
				mvector3.add(mvec_temp, col_ray.position)
			end
			mvector3.divide(mvec_temp, #col_rays)
			local closest_dist_sq = mvector3.distance_sq(mvec_temp, center_ray.position)
			local dist_sq
			for _, col_ray in ipairs(col_rays) do
				dist_sq = mvector3.distance_sq(mvec_temp, col_ray.position)
				if closest_dist_sq > dist_sq then
					closest_dist_sq = dist_sq
					center_ray = col_ray
				end
			end
		end
		NewShotgunBase.super._fire_raycast(self, user_unit, from_pos, center_ray.ray, dmg_mul, shoot_player, 0, autohit_mul, suppr_mul, shoot_through_data)
	end
	for _, col_ray in pairs(hit_enemies) do
		local damage = self:get_damage_falloff(damage, col_ray, user_unit)
		if damage > 0 then
			local my_result
			local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_enemy or self._can_shoot_through_wall
			if add_shoot_through_bullet then
				my_result = NewShotgunBase.super._fire_raycast(self, user_unit, from_pos, col_ray.ray, dmg_mul, shoot_player, 0, autohit_mul, suppr_mul, shoot_through_data)
			else
				my_result = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			end
			if my_result and my_result.type == "death" then
				managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance)
			end
		end
	end
	if dodge_enemies and self._suppression then
		for enemy_data, dis_error in pairs(dodge_enemies) do
			enemy_data.unit:character_damage():build_suppression(suppr_mul * dis_error * self._suppression, self._panic_suppression_chance)
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
	for _, _ in pairs(hit_enemies) do
		managers.statistics:shot_fired({
			hit = true,
			weapon_unit = self._unit,
			skip_bullet_count = true
		})
	end
	return result
end
]]

--These functions were made by Deadly Mutton Chops and B1313
--{
function NewShotgunBase:reload_expire_t()
	local ammo_remaining_in_clip = self:get_ammo_remaining_in_clip()
	if self:get_ammo_remaining_in_clip() > 0 and  self:weapon_tweak_data().tactical_reload == 1 then
		return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() + 1 - ammo_remaining_in_clip) * self:reload_shell_expire_t()
	else
		return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() - ammo_remaining_in_clip) * self:reload_shell_expire_t()
	end
end

function NewShotgunBase:reload_enter_expire_t()
	return self:weapon_tweak_data().timers.shotgun_reload_enter or 0.3
end

function NewShotgunBase:reload_exit_expire_t()
	return self:weapon_tweak_data().timers.shotgun_reload_exit_empty or 0.7
end

function NewShotgunBase:reload_not_empty_exit_expire_t()
	return self:weapon_tweak_data().timers.shotgun_reload_exit_not_empty or 0.3
end

function NewShotgunBase:reload_shell_expire_t()
	return self:weapon_tweak_data().timers.shotgun_reload_shell or 0.56666666
end

function NewShotgunBase:_first_shell_reload_expire_t()
	return self:reload_shell_expire_t() - (self:weapon_tweak_data().timers.shotgun_reload_first_shell_offset or 0.33)
end

function NewShotgunBase:start_reload(...)
	NewShotgunBase.super.start_reload(self, ...)
	self._started_reload_empty = self:clip_empty()
	local speed_multiplier = self:reload_speed_multiplier()
	self._next_shell_reloded_t = managers.player:player_timer():time() + self:_first_shell_reload_expire_t() / speed_multiplier
end

function NewShotgunBase:started_reload_empty()
	return self._started_reload_empty
end

function NewShotgunBase:update_reloading(t, dt, time_left)
	if t > self._next_shell_reloded_t then
		local speed_multiplier = self:reload_speed_multiplier()
		self._next_shell_reloded_t = self._next_shell_reloded_t + self:reload_shell_expire_t() / speed_multiplier
		if self:get_ammo_remaining_in_clip() > 0 and  self:weapon_tweak_data().tactical_reload == 1 then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip() + 1, self:get_ammo_remaining_in_clip() + 1))
			return true
		else
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + 1))
			return true
		end
	end
end

function NewShotgunBase:fire_rate_multiplier()
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
		
	if self._hip_fire_rate_inc and self._hip_fire_rate_inc > 0 then
		local user_unit = self._setup and self._setup.user_unit
		local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
		if current_state and not current_state:in_steelsight() then
			multiplier = multiplier * (self._hip_fire_rate_inc or 1)
		end
	end
	
	return multiplier * ( (self:in_burst_mode() and self._burst_fire_rate_multiplier) or 1)
end

SaigaShotgun = SaigaShotgun or class(NewShotgunBase)
function SaigaShotgun:reload_expire_t()
	return nil
end

function SaigaShotgun:reload_enter_expire_t()
	return nil
end

function SaigaShotgun:reload_exit_expire_t()
	return nil
end

function SaigaShotgun:reload_not_empty_exit_expire_t()
	return nil
end

function SaigaShotgun:update_reloading(t, dt, time_left)
end
--}