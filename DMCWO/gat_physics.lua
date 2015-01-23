--[[
v1.1
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

if not Raifu then 

if not RaycastWeaponBase then return end
if not NewRaycastWeaponBase then return end

--Damage falloff for non-shotguns (Penetration/Distance and col_ray bugs fixed by LazyOzzy)
function RaycastWeaponBase:get_damage_falloff(damage, col_ray, user_unit, distance)
		
    local dist = distance or mvector3.distance(col_ray.unit:position(), user_unit:position())

    self._damage_near = tweak_data.weapon[self._name_id].damage_near or 1000 -- 10 m
    self._damage_far = tweak_data.weapon[self._name_id].damage_far or 20000 -- 200 m
	self._damage_min = tweak_data.weapon[self._name_id].damage_min or 0.6 -- maximum 60% drop
	
--[[ 	
	io.stderr:write("Dist: ", tostring(dist/100), "\n") --Distance from the surface/object/enemy you hit
	io.stderr:write("Min. dmg at: ", (((1 - self._damage_min) * (self._damage_far/100)) + (self._damage_near / 100)), "m \n") --Distance you'll hit minimum damage in meters
	io.stderr:write("Min. Damage: ", tostring((damage * 10) * self._damage_min), "\n") --Lowest possible damage your gun will output at max range
	io.stderr:write("Damage Hi: ", tostring(damage * 10), "\n") --Initial damage from your shot
	 ]]
	
	local ratio = (1 - math.min(1, math.max(0, dist - self._damage_near) / self._damage_far))
	if ratio < self._damage_min then
		ratio = self._damage_min
	end

    damage = ratio * damage
	
	
	--io.stderr:write("Damage Lo: ", tostring(damage * 10), "\n\n") --Damage on impact
	
	
    return damage
end


local mvec_to = Vector3()
local mvec_spread_direction = Vector3()
local mvec1 = Vector3()
local penetration_dist
function RaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
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
                dmg_mul = ( dmg_mul or 1 ) * 0.25
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
			
            mvector3.multiply( self._shoot_through_data.from, is_shield and 20 or penetration)
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


--Movement speed stuff
function RaycastWeaponBase:movement_penalty()
	return tweak_data.weapon[self._name_id].weapon_movement_penalty or 1
end

tweak_data.upgrades.weapon_movement_penalty.lmg = 1 --0.8

local handgun_speed = {'ppk','new_raging_bull','deagle','judge','c96','glock_17','glock_18c','b92fs','g26','g22c','p226','colt_1911','usp'}
for i, wep_id in ipairs(handgun_speed) do
	tweak_data.weapon[ wep_id ].weapon_movement_penalty = 1.05
end

tweak_data.weapon.m95.weapon_movement_penalty = 0.7
tweak_data.weapon.mg42.weapon_movement_penalty = 0.7
tweak_data.weapon.hk21.weapon_movement_penalty = 0.75
tweak_data.weapon.m249.weapon_movement_penalty = 0.8
tweak_data.weapon.r93.weapon_movement_penalty = 0.8
tweak_data.weapon.rpk.weapon_movement_penalty = 0.85
tweak_data.weapon.galil.weapon_movement_penalty = 0.85
tweak_data.weapon.msr.weapon_movement_penalty = 0.9
tweak_data.weapon.fal.weapon_movement_penalty = 0.9
tweak_data.weapon.striker.weapon_movement_penalty = 0.9
tweak_data.weapon.g3.weapon_movement_penalty = 0.9
tweak_data.weapon.spas12.weapon_movement_penalty = 0.9
tweak_data.weapon.mosin.weapon_movement_penalty = 0.9
tweak_data.weapon.m1928.weapon_movement_penalty = 0.9
tweak_data.weapon.l85a2.weapon_movement_penalty = 0.9
tweak_data.weapon.new_m14.weapon_movement_penalty = 0.95
tweak_data.weapon.akm_gold.weapon_movement_penalty = 0.95

--Muzzle flash stuff
local old_update_stats_values = NewRaycastWeaponBase._update_stats_values

function NewRaycastWeaponBase:_update_stats_values()
	old_update_stats_values(self)
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
end

Raifu = true
end