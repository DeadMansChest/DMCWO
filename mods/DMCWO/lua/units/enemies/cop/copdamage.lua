--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

function CopDamage:damage_bullet(attack_data)
	self._attack_data = attack_data
	if self._dead or self._invulnerable then
		return
	end
	if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
		return "friendly_fire"
	end
	
	local damage = attack_data.damage
	
	local has_ap = attack_data.weapon_unit:base()._has_ap or nil
	local has_hp = attack_data.weapon_unit:base()._has_hp or nil
	
	if attack_data.col_ray.body and ( (self._has_plate and attack_data.col_ray.body:name() == self._ids_plate_name) or ( self._char_tweak and self._char_tweak == "tank" and (attack_data.col_ray.body:name() == Idstring("body_armor_chest") or attack_data.col_ray.body:name() == Idstring("body_armor_stomache") or attack_data.col_ray.body:name() == Idstring("body_armor_back"))) ) and not attack_data.armor_piercing
	then
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
	elseif self._char_tweak and self._char_tweak == "tank" then
		if attack_data.col_ray.body then
			if attack_data.col_ray.body:name() == Idstring("body_helmet_plate") or attack_data.col_ray.body:name() == Idstring("body_armor_throat") or attack_data.col_ray.body:name() == Idstring("body_armor_neck") or attack_data.col_ray.body:name() == Idstring("body_helmet_glass") then
				damage = damage * 0.25
			end
		end
	end
	local result
	local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	
	if self._char_tweak then
		if self._char_tweak == "tank" then --Dozers, Winters, Commissar and The Rat
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
		elseif self._char_tweak == "city_swat" or self._char_tweak == "phalanx_minion" then --Gensec SWAT and phalanx shields
			if has_ap then
				damage = damage * 1.2
			elseif has_hp then
				damage = damage * 0.6
			end
		elseif self._char_tweak == "fbi_heavy_swat" then --Tans/MFRs
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
		
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
	
		if critical_hit then
			managers.hud:on_crit_confirmed()
			damage = crit_damage
		else
			managers.hud:on_hit_confirmed()
		end
		headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
		if self._char_tweak and self._char_tweak.priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end
		if head then
			managers.player:on_headshot_dealt()
			headshot = true
		end
	end
		
		
	local char_hs_mult
	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	elseif head then
		if self._char_tweak and self._char_tweak.headshot_dmg_mul then
			char_hs_mult = (self._char_tweak.headshot_dmg_mul * headshot_multiplier) * hs_mult
			if char_hs_mult < 1.0 then 
				char_hs_mult = 1.0
			end
		else
			char_hs_mult = (self._health * 10) * hs_mult
			if char_hs_mult < 1.0 then 
				char_hs_mult = 1.0
			end
		end
		damage = damage * char_hs_mult
	end
	
	if not head and attack_data.add_head_shot_mul and self._char_tweak and self._char_tweak.access ~= "tank" and self._char_tweak.headshot_dmg_mul then
		local mul = self._char_tweak.headshot_dmg_mul * attack_data.add_head_shot_mul
		if mul < 1 then
			mul = mul + 1
		end
		damage = damage * mul
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
		self:chk_killshot(attack_data.attacker_unit, "bullet", headshot)
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
			--[[
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
			]]
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
	
	local knock_down = false
	if attack_data.knock_down and attack_data.weapon_unit:base()._fire_mode == "auto" and result.type ~= "death" and self._char_tweak and self._char_tweak.access ~= "tank" then
		local rand = math.random()
		if rand < attack_data.knock_down then
			attack_data.type = "heavy_hurt"
			attack_data.result.type = "heavy_hurt"
			knock_down = true
		end
	end
	if not knock_down and attack_data.stagger and result.type ~= "death" then
		attack_data.type = "hurt"
		attack_data.result.type = "hurt"
	end

	self:_on_damage_received(attack_data)
	managers.player:send_message(Message.OnEnemyShot, nil, nil)
	return result
end

local orig_damage_tase = CopDamage.damage_tase
function CopDamage:damage_tase(attack_data)
	self._attack_data = attack_data
	return orig_damage_tase(self, attack_data)
end

local orig_damage_explosion = CopDamage.damage_explosion
function CopDamage:damage_explosion(attack_data)
	self._attack_data = attack_data
	return orig_damage_explosion(self, attack_data)
end

local orig_damage_fire = CopDamage.damage_fire
function CopDamage:damage_fire(attack_data)
	self._attack_data = attack_data
	return orig_damage_fire(self, attack_data)
end

local orig_damage_dot = CopDamage.damage_dot
function CopDamage:damage_dot(attack_data)
	self._attack_data = attack_data
	return orig_damage_dot(self, attack_data)
end

--Thanks to Rokk
if not SC then
	Hooks:PostHook(CopDamage, "_on_death", "DMCRemoveJoker", function(self)
		if self._unit:unit_data().is_convert and DMC._converts then
			for i, unit in pairs(DMC._converts) do
				if unit == self._unit then
					table.remove(DMC._converts, i)
				end
			end
		end
	end)
end

local melee_original = CopDamage.damage_melee
if DMCWO.melee_hs == true then
	--Melee hsmult code courtesy of SC
	function CopDamage:damage_melee(attack_data)
		self._attack_data = attack_data
		
		local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
		local damage = attack_data.damage
		local damage_effect = attack_data.damage_effect
		local headshot_multiplier = 1
		if attack_data.attacker_unit == managers.player:player_unit() then
			headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
			if self._char_tweak.priority_shout then
				damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
			end
			if head then
				managers.player:on_headshot_dealt()
			end
		end
		if self._damage_reduction_multiplier then
			damage = damage * self._damage_reduction_multiplier
			damage_effect = damage_effect * self._damage_reduction_multiplier
		elseif head then
			if self._char_tweak.headshot_dmg_mul then
				damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
				damage_effect = damage_effect * self._char_tweak.headshot_dmg_mul * headshot_multiplier
			else
				damage = self._health * 10
				damage_effect = self._health * 10
			end
		end
		
		local target_is_spook = (alive(attack_data.col_ray.unit) and attack_data.col_ray.unit:base() and attack_data.col_ray.unit:base()._tweak_table == "spooc") or nil
		local can_counter_spooc = managers.player:has_category_upgrade("player", "counter_strike_spooc")
	
		if not target_is_spook then
			attack_data.damage_effect = damage_effect	
		elseif target_is_spook and can_counter_spooc then
			attack_data.damage_effect = damage_effect
		end
		attack_data.damage = damage
		
		return melee_original(self, attack_data)
	end
else
	function CopDamage:damage_melee(attack_data)
		self._attack_data = attack_data
		return melee_original(self, attack_data)
	end
end

local critical_hit_original = CopDamage.roll_critical_hit
function CopDamage:roll_critical_hit(damage)
	if self._attack_data then
		local head = self._head_body_name and self._attack_data.col_ray.body and self._attack_data.col_ray.body:name() == self._ids_head_body_name
		if self._attack_data.weapon_unit then
			local no_crits = self._attack_data.weapon_unit:base()._no_crits or false
			local stat_damage = self._attack_data.weapon_unit:base()._check_damage
			local rays = self._attack_data.weapon_unit:base()._rays or 1
		end
	else
		return false, damage
	end
	self._attack_data = nil
	if stat_damage and rays and (stat_damage / rays) >= 8 then
		no_crits = true		
		--log("Damage per ray exceeds 80! Critical hits will not proc!!")
	end
	if self._char_tweak and self._char_tweak == "tank" and not head then
		no_crits = true		
		--log("Ray did not hit the Tank's face! Critical hits will not proc!!")
	end
	if no_crits then
		return false, damage
	else
		return critical_hit_original(self, damage)
	end
end

if DMCWO.all_dismember_cloaker == true then
	function CopDamage:_dismember_condition(attack_data)
		local dismember_victim = false
		local target_is_spook = false
		target_is_spook = alive(attack_data.col_ray.unit) and attack_data.col_ray.unit:base() and attack_data.col_ray.unit:base()._tweak_table == "spooc"
		local criminal_name = managers.criminals:local_character_name()
		local criminal_melee_weapon = managers.blackmarket:equipped_melee_weapon()
		local weapon_charged = false
		weapon_charged = attack_data.charge_lerp_value and attack_data.charge_lerp_value > 0.5
		if target_is_spook and weapon_charged and criminal_melee_weapon == "sandsteel" then
			dismember_victim = true
		end
		return dismember_victim
	end
end



