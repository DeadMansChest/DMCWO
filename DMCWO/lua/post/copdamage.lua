--[[
v1.6
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]
function CopDamage:damage_bullet(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
		return "friendly_fire"
	end
	
	local damage = attack_data.damage
	local unit_type = self._unit:base()._tweak_table
	
	local has_ap = attack_data.weapon_unit:base()._has_ap or nil
	local has_hp = attack_data.weapon_unit:base()._has_hp or nil
	

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
	
	if unit_type == "tank" then --Dozers
		if has_ap then
			if head then
			else
				damage = damage * 1.2
			end
		elseif has_hp then
			if head then
				damage = damage * 0.6
			else
				damage = damage * 1.2
			end
		end
	elseif unit_type == "city_swat" or unit_type == "phalanx_minion" then --Gensec SWAT and shields
		if has_ap then
			damage = damage * 1.2
		elseif has_hp then
			damage = damage * 0.6
		end
	elseif unit_type == "phalanx_vip" then --Cpt. Winters
		if has_ap then
			if head then
			else
				damage = damage * 1.2
			end
		elseif has_hp then
			if head then
				damage = damage * 1.2
			else
				damage = damage * 0.6
			end
		end
	elseif unit_type == "fbi_heavy_swat" then --Tans/MFRs
		if has_ap then
			if head then
				damage = damage * 1.2
			else
				damage = damage * 0.6
			end
		elseif has_hp then
			if head then
				damage = damage * 0.6
			else
				damage = damage * 1.2
			end
		end
	else --other units
		if has_ap then
			if head then
			else
				damage = damage * 0.6
			end
		elseif has_hp then
			damage = damage * 1.2
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
	
	local hs_mult = attack_data.weapon_unit:base()._hs_mult or 1
	
	local no_crits = attack_data.weapon_unit:base()._no_crits or false
	local stat_damage = attack_data.weapon_unit:base()._check_damage
	local rays = attack_data.weapon_unit:base()._rays or 1
	--[[
	log("\n\nWeapon damage (w/o skills): " .. tostring(stat_damage * 10))
	log("Raycast count: " .. tostring(rays))
	log("Damage per ray: " .. tostring( (stat_damage * 10) / rays ))
	]]
	
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		if stat_damage and rays and (stat_damage / rays) >= 8 then
			no_crits = true		
			--log("Damage per ray exceeds 80! Critical hits will not proc!!")
		end
		if unit_type == "tank" and not head then
			no_crits = true		
			--log("Ray did not hit the Tank's face! Critical hits will not proc!!")
		end
		
		if critical_hit and no_crits ~= true then
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
		
		
	local char_hs_mult
	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	elseif head then
		if self._char_tweak.headshot_dmg_mul then
			char_hs_mult = (self._char_tweak.headshot_dmg_mul * headshot_multiplier) * hs_mult
			if char_hs_mult < 1.1 then 
				char_hs_mult = 1.1
			end
		else
			char_hs_mult = (self._health * 10) * hs_mult
			if char_hs_mult < 1.1 then 
				char_hs_mult = 1.1
			end
		end
		damage = damage * char_hs_mult
	end
	
	damage = self:_apply_damage_reduction(damage)
	local damage_percent = math.ceil(math.clamp(damage / self._HEALTH_INIT_PRECENT, 1, self._HEALTH_GRANULARITY))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)
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
		self:die(attack_data)
		self:chk_killshot(attack_data.attacker_unit, "bullet")
	else
		attack_data.damage = damage
		local result_type = self:get_damage_type(damage_percent, "bullet")
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		self:_apply_damage_to_health(damage)
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant
		}
		if managers.groupai:state():all_criminals()[attack_data.attacker_unit:key()] then
			managers.statistics:killed_by_anyone(data)
		end
		if attack_data.attacker_unit == managers.player:player_unit() then
			local special_comment = self:_check_special_death_conditions(attack_data.variant, attack_data.col_ray.body, attack_data.attacker_unit, attack_data.weapon_unit)
			self:_comment_death(attack_data.attacker_unit, self._unit:base()._tweak_table, special_comment)
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
					owner_peer:send_queued_sync("sync_player_kill_statistic", data.name, data.head_shot and true or false, data.weapon_unit, data.variant, data.stats_name)
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

if DMCWO.melee_hs == true then

--Melee hsmult code courtesy of SC
local melee_original = CopDamage.damage_melee
function CopDamage:damage_melee(attack_data)
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	local damage = attack_data.damage
	local headshot_multiplier = 1
	if attack_data.attacker_unit == managers.player:player_unit() then
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
	
	attack_data.damage = damage
	
	return melee_original(self, attack_data)
end

end


