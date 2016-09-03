--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_playerdamage_init = PlayerDamage.init
function PlayerDamage:init(...)
	old_playerdamage_init(self, ...)
	self._has_damage_speed_team = managers.player:has_team_category_upgrade("player", "team_damage_speed_multiplier_send")
	self._has_damage_speed = managers.player:has_category_upgrade("temporary", "damage_speed_multiplier")
end

function PlayerDamage:damage_bullet(attack_data)
	if not self:_chk_can_take_dmg() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "bullet"},
		attacker_unit = attack_data.attacker_unit
	}
	local dmg_mul = managers.player:damage_reduction_skill_multiplier("bullet", self._unit:movement()._current_state, attack_data.attacker_unit and attack_data.attacker_unit:base()._tweak_table)
	attack_data.damage = attack_data.damage * dmg_mul
	local damage_absorption = managers.player:get_best_cocaine_damage_absorption()
	if damage_absorption > 0 then
		attack_data.damage = math.max(0, attack_data.damage - damage_absorption)
	end
	local dodge_roll = math.rand(1)
	local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
	local armor_dodge_chance = managers.player:body_armor_value("dodge")
	local skill_dodge_chance = managers.player:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
	dodge_value = dodge_value + armor_dodge_chance + skill_dodge_chance
	if dodge_roll < dodge_value then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, 0)
		end
		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.col_ray)
		self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = attack_data.damage
		return
	end
	if self._god_mode then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, attack_data.damage)
		end
		self:_call_listeners(damage_info)
		return
	elseif self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	elseif self._revive_miss and math.random() < self._revive_miss then
		self:play_whizby(attack_data.col_ray.position)
		return
	end
	if attack_data.attacker_unit:base()._tweak_table == "tank" then
		managers.achievment:set_script_data("dodge_this_fail", true)
	end
	if 0 < self:get_real_armor() then
		self._unit:sound():play("player_hit")
	else
		self._unit:sound():play("player_hit_permadamage")
	end
	local shake_armor_multiplier = managers.player:body_armor_value("damage_shake") * managers.player:upgrade_value("player", "damage_shake_multiplier", 1)
	local gui_shake_number = tweak_data.gui.armor_damage_shake_base / shake_armor_multiplier
	gui_shake_number = gui_shake_number + managers.player:upgrade_value("player", "damage_shake_addend", 0)
	shake_armor_multiplier = tweak_data.gui.armor_damage_shake_base / gui_shake_number
	local shake_multiplier = math.clamp(attack_data.damage, 0.2, 2) * shake_armor_multiplier
	self._unit:camera():play_shaker("player_bullet_damage", 1 * shake_multiplier)
	self._unit:camera():play_shaker("player_land", -1 * shake_multiplier)
	managers.rumble:play("damage_bullet")
	self:_hit_direction(attack_data.col_ray)
	managers.player:check_damage_carry(attack_data)
	if self._bleed_out then
		self:_bleed_out_damage(attack_data)
		return
	end
	if not self:is_suppressed() then
		return
	end
	local armor_reduction_multiplier = 0
	if 0 >= self:get_real_armor() then
		armor_reduction_multiplier = 1
	end
	local health_subtracted = self:_calc_armor_damage(attack_data)
	if attack_data.armor_piercing then
		attack_data.damage = attack_data.damage - health_subtracted
	else
		attack_data.damage = attack_data.damage * armor_reduction_multiplier
	end
	health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)
	managers.player:activate_temporary_upgrade("temporary", "wolverine_health_regen")
	self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
	self._last_received_dmg = health_subtracted
	if not self._bleed_out and health_subtracted > 0 then
		self:_send_damage_drama(attack_data, health_subtracted)
	elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "tank" then
		self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
		managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt", attack_data), TimerManager:game():time() + tweak_data.timespeed.downed.fade_in + tweak_data.timespeed.downed.sustain + tweak_data.timespeed.downed.fade_out)
	end
	self:_call_listeners(damage_info)
end


function PlayerDamage:_calc_health_damage(attack_data)
	local health_subtracted = 0
	health_subtracted = self:get_real_health()
	attack_data.damage = attack_data.damage * managers.player:upgrade_value("player", "real_health_damage_reduction", 1)
	self:change_health(-attack_data.damage)
	health_subtracted = health_subtracted - self:get_real_health()
	local bullet_or_explosion_or_melee = attack_data.variant and (attack_data.variant == "bullet" or attack_data.variant == "explosion") or attack_data.variant == "melee"
	if self:get_real_health() == 0 and bullet_or_explosion_or_melee then
		self:_chk_cheat_death()
	end
	self:_damage_screen()
	self:_check_bleed_out(bullet_or_explosion_or_melee)
	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})
	self:_send_set_health()
	self:_set_health_effect()
	managers.statistics:health_subtracted(health_subtracted)
	return health_subtracted
end

local damage_bullet_original = PlayerDamage.damage_bullet
function PlayerDamage:damage_bullet(attack_data, ...)
	self._last_bullet_damage = attack_data.damage
	local next_allowed_dmg_t_old = self._next_allowed_dmg_t
	
	local result = damage_bullet_original(self, attack_data, ...)
	
	if self._next_allowed_dmg_t ~= next_allowed_dmg_t_old then
		self._last_received_dmg = self._last_bullet_damage
	end
	
	return result
end

local old_player_regenerated = PlayerDamage._regenerated
function PlayerDamage:_regenerated(no_messiah)
	old_player_regenerated(self, no_messiah)
	if not no_messiah then
		managers.player:fadjfbasjhas()
	end
end