--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

--fire rate multiplier blackmarket statchart stuff	
function BlackMarketManager:fire_rate_multiplier(name, category, sub_category, silencer, detection_risk, current_state, blueprint)
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
	self._block_eq_aced = nil
	
	for part_id, stats in pairs(custom_stats) do
		if stats.rof_mult then
			rof_multiplier = rof_multiplier * stats.rof_mult
		end
		if stats.block_eq_aced then
			self._block_eq_aced = true
		end
	end
	
	multiplier = rof_multiplier
									
	if not upgrade_blocked(weapon.category, "fire_rate_multiplier") then	
		if not self._block_eq_aced and category then
			multiplier = multiplier * managers.player:upgrade_value(category, "fire_rate_multiplier", 1)
		end
	end
	if not upgrade_blocked(weapon.name, "fire_rate_multiplier") then
		if not self._block_eq_aced and name then
			multiplier = multiplier * managers.player:upgrade_value(name, "fire_rate_multiplier", 1)
		end
	end
	if not upgrade_blocked(weapon.sub_category, "fire_rate_multiplier") then
		if not self._block_eq_aced and sub_category then
			multiplier = multiplier * managers.player:upgrade_value(sub_category, "fire_rate_multiplier", 1)
		end
	end
	if not upgrade_blocked(weapon["weapon"], "fire_rate_multiplier") then
		if not self._block_eq_aced and weapon then
			multiplier = multiplier * managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1)
		end
	end
	return multiplier
end

function BlackMarketManager:accuracy_multiplier(name, category, sub_category, silencer, current_state, spread_moving, fire_mode, blueprint, is_single_shot)
	local multiplier = 1
	multiplier = multiplier * (managers.player:upgrade_value("weapon", "spread_multiplier", 1))
	multiplier = multiplier * (managers.player:upgrade_value(category, "spread_multiplier", 1))
	multiplier = multiplier * (managers.player:upgrade_value("weapon", fire_mode .. "_spread_multiplier", 1))
	multiplier = multiplier * (managers.player:upgrade_value(name, "spread_multiplier", 1))
	if sub_category then
		multiplier = multiplier * ( managers.player:upgrade_value(sub_category, "spread_multiplier", 1))
	end
	if silencer then
		multiplier = multiplier * (managers.player:upgrade_value("weapon", "silencer_spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value(category, "silencer_spread_multiplier", 1))
		if sub_category then
			multiplier = multiplier * (managers.player:upgrade_value(sub_category, "silencer_spread_multiplier", 1))
		end
	end
	if current_state then
		if self._name_id ~= "flamethrower_mk2" then
			if current_state._state_data.in_air then 
				if current_state:in_steelsight() then
					multiplier = multiplier * 1.25
				else
					multiplier = multiplier * 1.5
				end
			end
			if current_state._running then
				multiplier = multiplier * 1.25
			end
		end
		if current_state._moving then
			multiplier = multiplier * (managers.player:upgrade_value(category, "move_spread_multiplier", 1))
			multiplier = multiplier * (managers.player:team_upgrade_value("weapon", "move_spread_multiplier", 1))
			spread_moving = spread_moving and spread_moving * managers.player:upgrade_value("player", "weapon_movement_stability", 1)
			--multiplier = multiplier * (self._spread_moving or 1)
			if sub_category then
				multiplier = multiplier * (managers.player:upgrade_value(sub_category, "move_spread_multiplier", 1))
			end
		end
		if current_state._state_data.in_full_steelsight then
			multiplier = multiplier * (tweak_data.weapon[name].spread[current_state._moving and "moving_steelsight" or "steelsight"])
			multiplier = multiplier * (managers.player:upgrade_value(category, "steelsight_accuracy_inc", 1))
			if sub_category then
				multiplier = multiplier * (managers.player:upgrade_value(sub_category, "steelsight_accuracy_inc", 1))
			end
		else
			multiplier = multiplier * (managers.player:upgrade_value(category, "hip_fire_spread_multiplier", 1))
			if sub_category then
				multiplier = multiplier * (managers.player:upgrade_value(sub_category, "hip_fire_spread_multiplier", 1))
			end
			if current_state._state_data.ducking then
				multiplier = multiplier * (tweak_data.weapon[name].spread[current_state._moving and "moving_crouching" or "crouching"])
			else
				multiplier = multiplier * (tweak_data.weapon[name].spread[current_state._moving and "moving_standing" or "standing"])
			end
		end
		if current_state._state_data.using_bipod then
			multiplier = multiplier * 0.5
		end
	end
	if blueprint and self:is_weapon_modified(managers.weapon_factory:get_factory_id_by_weapon_id(name), blueprint) then
		multiplier = multiplier * (managers.player:upgrade_value("weapon", "modded_spread_multiplier", 1))
	end
	multiplier = multiplier * (managers.player:get_accuracy_multiplier())
	return multiplier
end

local old_damage_add = BlackMarketManager.damage_addend
function BlackMarketManager:damage_addend(name, category, sub_category, silencer, detection_risk, current_state, blueprint)
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
	local default_blueprint = factory_id and tweak_data.weapon.factory[factory_id].default_blueprint

	local custom_stats = factory_id and managers.weapon_factory:get_custom_stats_from_weapon(factory_id, blueprint or default_blueprint)
	
	if custom_stats then
		for part_id, stats in pairs(custom_stats) do
			if stats.ignore_dmg_boosts then
				return 0
			end
		end
	end

	local value = 0
	if tweak_data.weapon[name] and tweak_data.weapon[name].ignore_damage_upgrades then
		return value
	end
	value = value + managers.player:upgrade_value("player", "damage_addend", 0)
	value = value + managers.player:upgrade_value("weapon", "damage_addend", 0)
	value = value + managers.player:upgrade_value(category, "damage_addend", 0)
	if sub_category then
		value = value + managers.player:upgrade_value(sub_category, "damage_addend", 0)
	end
	value = value + managers.player:upgrade_value(name, "damage_addend", 0)
	return value
end

local old_damage_mult = BlackMarketManager.damage_multiplier
function BlackMarketManager:damage_multiplier(name, category, sub_category, silencer, detection_risk, current_state, blueprint)
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
	local default_blueprint = factory_id and tweak_data.weapon.factory[factory_id].default_blueprint

	local custom_stats = factory_id and managers.weapon_factory:get_custom_stats_from_weapon(factory_id, blueprint or default_blueprint)
	
	if custom_stats then
		for part_id, stats in pairs(custom_stats) do
			if stats.ignore_dmg_boosts then
				return 1
			end
		end
	end
	local multiplier = 1
	if tweak_data.weapon[name] and tweak_data.weapon[name].ignore_damage_upgrades then
		return multiplier
	end
	multiplier = multiplier + (1 - managers.player:upgrade_value(category, "damage_multiplier", 1))
	if sub_category then
		multiplier = multiplier + (1 - managers.player:upgrade_value(sub_category, "damage_multiplier", 1))
	end
	multiplier = multiplier + (1 - managers.player:upgrade_value(name, "damage_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:upgrade_value("player", "passive_damage_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "passive_damage_multiplier", 1))
	if silencer then
		multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "silencer_damage_multiplier", 1))
	end
	local detection_risk_damage_multiplier = managers.player:upgrade_value("player", "detection_risk_damage_multiplier")
	multiplier = multiplier - managers.player:get_value_from_risk_upgrade(detection_risk_damage_multiplier, detection_risk)
	if managers.player:has_category_upgrade("player", "overkill_health_to_damage_multiplier") then
		local damage_ratio = managers.player:upgrade_value("player", "overkill_health_to_damage_multiplier", 1) - 1
		multiplier = multiplier + damage_ratio
	end
	if not current_state or current_state:in_steelsight() then
	else
		multiplier = multiplier + (1 - managers.player:upgrade_value(category, "hip_fire_damage_multiplier", 1))
		if sub_category then
			multiplier = multiplier + (1 - managers.player:upgrade_value(sub_category, "hip_fire_damage_multiplier", 1))
		end
	end
	if blueprint and self:is_weapon_modified(managers.weapon_factory:get_factory_id_by_weapon_id(name), blueprint) then
		multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "modded_damage_multiplier", 1))
	end
	return self:_convert_add_to_mul(multiplier)
end

function BlackMarketManager:get_silencer_concealment_modifiers(weapon)
	local factory_id = weapon.factory_id
	local blueprint = weapon.blueprint
	local weapon_id = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(factory_id)
	local base_stats = tweak_data.weapon[weapon_id].stats
	local bonus = 0
	if not base_stats or not base_stats.concealment then
		return 0
	end
	local silencer = managers.weapon_factory:has_perk("silencer", weapon.factory_id, blueprint)
	if silencer and managers.player:has_category_upgrade("player", "silencer_concealment_increase") then
		bonus = managers.player:upgrade_value("player", "silencer_concealment_increase", 0)
	end
	if silencer and managers.player:has_category_upgrade("player", "silencer_concealment_penalty_decrease") then
		local stats = managers.weapon_factory:get_perk_stats("silencer", factory_id, blueprint)
		if stats and stats.concealment and stats.concealment < 0 then
			bonus = bonus + math.min(managers.player:upgrade_value("player", "silencer_concealment_penalty_decrease", 0), math.abs(stats.concealment))
		end
	end
	return bonus
end

function BlackMarketManager:visibility_modifiers()
	local skill_bonuses = 0
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "passive_concealment_modifier", 0)
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "concealment_modifier", 0)
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "melee_concealment_modifier", 0)
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true, true)]
	if armor_data.upgrade_level == 2 or armor_data.upgrade_level == 3 or armor_data.upgrade_level == 4 then
		skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "ballistic_vest_concealment", 0)
	end
	--[[
	--Why are these heeeeeeere, OVK
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "silencer_concealment_increase", 0)
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "silencer_concealment_penalty_decrease", 0)
	]]
	local silencer_bonus = 0
	silencer_bonus = silencer_bonus + self:get_silencer_concealment_modifiers(self:equipped_primary())
	silencer_bonus = silencer_bonus + self:get_silencer_concealment_modifiers(self:equipped_secondary())
	skill_bonuses = skill_bonuses - silencer_bonus
	return skill_bonuses
end


