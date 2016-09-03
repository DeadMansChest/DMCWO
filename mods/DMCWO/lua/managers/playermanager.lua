--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

--Thanks to Rokk
local player_movement_speed_multiplier_orig = PlayerManager.movement_speed_multiplier
function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level, health_ratio)
    
    local multiplier = player_movement_speed_multiplier_orig(self, speed_state, bonus_multiplier, upgrade_level, health_ratio)
    
    if self:has_category_upgrade("player", "detection_risk_add_movement_speed") then
        --Apply Moving Target movement speed bonus (additively)
        multiplier = multiplier + self:detection_risk_movement_speed_bonus()
    end
    
	return multiplier
end

--Thanks to Rokk
function PlayerManager:detection_risk_movement_speed_bonus()
	local multiplier = 0
	local detection_risk_add_movement_speed = managers.player:upgrade_value("player", "detection_risk_add_movement_speed")
	multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_movement_speed)
	return multiplier
end

function PlayerManager:damage_reduction_skill_multiplier(damage_type, current_state, enemy_type)
	local multiplier = 1
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered", 1)
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered_strong", 1)
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "dmg_dampener_close_contact", 1)
	multiplier = multiplier * self:upgrade_value("player", "damage_dampener", 1)
	--multiplier = multiplier * self:upgrade_value("player", "health_damage_reduction", 1) --fuck off
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "first_aid_damage_reduction", 1)
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "revive_damage_reduction", 1)
	multiplier = multiplier * self:get_hostage_bonus_multiplier("damage_dampener")
	multiplier = multiplier * self._properties:get_property("revive_damage_reduction", 1)
	multiplier = multiplier * self._temporary_properties:get_property("revived_damage_reduction", 1)
	local dmg_red_mul = self:team_upgrade_value("damage_dampener", "team_damage_reduction", 1)
	if self:has_category_upgrade("player", "passive_damage_reduction") then
		local health_ratio = self:player_unit():character_damage():health_ratio()
		local min_ratio = self:upgrade_value("player", "passive_damage_reduction")
		if health_ratio < min_ratio then
			dmg_red_mul = dmg_red_mul - (1 - dmg_red_mul)
		end
	end
	multiplier = multiplier * dmg_red_mul
	if damage_type == "melee" then
		multiplier = multiplier * managers.player:upgrade_value("player", "melee_damage_dampener", 1)
	end
	if current_state and current_state:_interacting() then
		multiplier = multiplier * managers.player:upgrade_value("player", "interacting_damage_multiplier", 1)
	end
	if CopDamage and CopDamage.is_gangster(enemy_type) then
		multiplier = multiplier * managers.player:upgrade_value("player", "gangster_damage_dampener", 1)
	end
	return multiplier
end

function PlayerManager:fadjfbasjhas()
	if self._max_messiah_charges then
		self._messiah_charges = self._max_messiah_charges
	end
end