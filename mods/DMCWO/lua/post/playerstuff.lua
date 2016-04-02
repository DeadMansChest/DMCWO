--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/units/beings/player/playerdamage" then
--{

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
	
	

--}
elseif RequiredScript == "lib/units/beings/player/states/playerincapacitated" then
--{


--}
elseif RequiredScript == "lib/units/beings/player/states/playerstandard" then
--{

	function PlayerStandard:_do_action_melee(t, input, skip_damage)
		self._state_data.meleeing = nil
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
		local pre_calc_hit_ray = tweak_data.blackmarket.melee_weapons[melee_entry].hit_pre_calculation
		local speed = tweak_data.blackmarket.melee_weapons[melee_entry].speed_mult or 1
		local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
		melee_damage_delay = math.min(melee_damage_delay, tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t)
		local primary = managers.blackmarket:equipped_primary()
		local primary_id = primary.weapon_id
		local bayonet_id = managers.blackmarket:equipped_bayonet(primary_id)
		local bayonet_melee = false
		if bayonet_id and self._equipped_unit:base():selection_index() == 2 then
			bayonet_melee = true
		end
		self._state_data.melee_expire_t = t + tweak_data.blackmarket.melee_weapons[melee_entry].expire_t
		self._state_data.melee_repeat_expire_t = t + math.min(tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t, tweak_data.blackmarket.melee_weapons[melee_entry].expire_t)
		if not instant_hit and not skip_damage then
			self._state_data.melee_damage_delay_t = t + melee_damage_delay
			if pre_calc_hit_ray then
				self._state_data.melee_hit_ray = self:_calc_melee_hit_ray(t, 20) or true
			else
				self._state_data.melee_hit_ray = nil
			end
		end
		local send_redirect = instant_hit and (bayonet_melee and "melee_bayonet" or "melee") or "melee_item"
		managers.network:session():send_to_peers_synched("play_distance_interact_redirect", self._unit, send_redirect)
		if self._state_data.melee_charge_shake then
			self._ext_camera:shaker():stop(self._state_data.melee_charge_shake)
			self._state_data.melee_charge_shake = nil
		end
		if instant_hit then
			local hit = skip_damage or self:_do_melee_damage(t, bayonet_melee)
			if hit then
				self._ext_camera:play_redirect(bayonet_melee and self.IDS_MELEE_BAYONET or self.IDS_MELEE)
			else
				self._ext_camera:play_redirect(bayonet_melee and self.IDS_MELEE_MISS_BAYONET or self.IDS_MELEE_MISS)
			end
		else
			self:_play_melee_sound(melee_entry, "hit_air")
			local state = self._ext_camera:play_redirect(PlayerStandard.IDS_MELEE_ATTACK, speed)
			local anim_attack_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_vars
			if anim_attack_vars then
				self._camera_unit:anim_state_machine():set_parameter(state, anim_attack_vars[math.random(#anim_attack_vars)], 1)
			end
			if self._state_data.melee_hit_ray and self._state_data.melee_hit_ray ~= true then
				self._camera_unit:anim_state_machine():set_parameter(state, "hit", 1)
			end
		end
	end 


	local old_start_action_running = PlayerStandard._start_action_running
	function PlayerStandard:_start_action_running(...)
		self._equipped_unit:base():tweak_data_anim_stop("fire")
		if self._queue_reload_interupt and not self.RUN_AND_RELOAD then
			self._queue_reload_interupt = nil
		end
		old_start_action_running(self, ...)
	end

	function PlayerStandard:full_steelsight()
		return self._state_data.in_steelsight and self._camera_unit:base():is_stance_done()
	end
	
	function PlayerStandard:_end_action_running(t)
		if not self._end_running_expire_t then
			local speed_multiplier = self._equipped_unit:base():exit_run_speed_multiplier()
			self._end_running_expire_t = t + 0.45 / speed_multiplier
			if not self.RUN_AND_SHOOT and (not self.RUN_AND_RELOAD or not self:_is_reloading()) then
				self._ext_camera:play_redirect(self.IDS_STOP_RUNNING, speed_multiplier)
			end
		end
	end
		
	local old_check_action_steelsight = PlayerStandard._check_action_steelsight
	function PlayerStandard:_check_action_steelsight(t, input)
		if (self._end_running_expire_t and not self.RUN_AND_SHOOT) then
			if input.btn_steelsight_press then
				self._steelsight_wanted = true
			end
			if managers.user:get_setting("hold_to_steelsight") and input.btn_steelsight_release then
				self._steelsight_wanted = false
			end
			return
		end
		old_check_action_steelsight(self, t, input)
	end


	local old_update = PlayerStandard.update
	function PlayerStandard:update(t, dt)
		old_update(self, t, dt)
		local weap_base = self._equipped_unit:base()
		local secondary = self._unit:inventory():unit_by_selection(1):base()
		local primary = self._unit:inventory():unit_by_selection(2):base()
		if weap_base then
			if not weap_base._starwars and weap_base:clip_empty() and weap_base:weapon_tweak_data().lock_slide and not self:_is_reloading() then
				weap_base:tweak_data_anim_play("reload", 1)
			end
		end
		if secondary then
			if secondary._starwars then
				self:_secondary_regen_ammo(t, dt)
			end
		end
		if primary then
			if primary._starwars then
				self:_primary_regen_ammo(t, dt)
			end
		end
		if self._burst_delay then
			self:_update_burst_delay(t, dt)
		end
		if self._anim_delay then
			self:_update_anim_delay(t, dt)
		end
		if self:full_steelsight() then
			--log("ayy")
			self._state_data.in_full_steelsight = true
		end
		if not self:in_steelsight() then
			--log("rip")
			self._state_data.in_full_steelsight = nil
		end
	end
			
	function PlayerStandard:_update_burst_delay(t, dt)
		if self._burst_delay then
			self._burst_delay = self._burst_delay - dt
			if self._burst_delay < 0 then
				self._burst_delay = nil
			end
		end
	end	
	
	function PlayerStandard:_update_anim_delay(t, dt)
		if self._anim_delay then
			self._anim_delay = self._anim_delay - dt
			if self._anim_delay < 0 then
				self._anim_delay = nil
			end
		end	
	end	
	
	function PlayerStandard:_secondary_regen_ammo(t, dt)
		local secondary = self._unit:inventory():unit_by_selection(1):base()
		self._secondary_regen_rate = self._secondary_regen_rate or secondary._regen_rate or 10
		self._secondary_regenerate_ammo_timer = self._secondary_regenerate_ammo_timer or 0
		if secondary:get_ammo_total() <= 0 then
			return
		end
		if self._unit:inventory():equipped_selection() == 1 and self._shooting then
			self._secondary_regenerate_ammo_timer = secondary._regen_ammo_time or 0.5
		end
		if secondary:clip_empty() then
			self._secondary_regen_rate = secondary._regen_rate_overheat or 4.5
			if not self._secondary_overheat_pen then
				self._secondary_overheat_pen = secondary._overheat_pen or 2.75
			end
		end
		if self._secondary_overheat_pen and self._secondary_overheat_pen <= 0 then
			--log( "COOL" )
			self._secondary_regen_rate = secondary._regen_rate or 10
			self._secondary_overheat_pen = nil
			self._secondary_overheat_yell = nil
		end
		if self._secondary_overheat_pen then
			self._secondary_overheat_pen = self._secondary_overheat_pen - dt
			--log( "OVERHEAT TIME: " .. tostring(self._secondary_overheat_pen) )
			if not self._secondary_overheat_yell then
				managers.player:local_player():sound():say("g29",false,nil)
				self._secondary_overheat_yell = true
			end
		end
		if secondary:get_ammo_remaining_in_clip() >= secondary:get_ammo_total() then 
			--log("NO AMMO")
			self._secondary_regenerate_ammo_timer = nil
		end
		if secondary:get_ammo_remaining_in_clip() >= secondary:get_ammo_max_per_clip() then
			self._secondary_regenerate_ammo_timer = nil
		end
		if self._secondary_regenerate_ammo_timer then
			self._secondary_regenerate_ammo_timer = self._secondary_regenerate_ammo_timer - dt
			if self._secondary_regenerate_ammo_timer < 0 then
				self:secondary_add_ammo(dt * self._secondary_regen_rate)
			end
		end
	end
	
	function PlayerStandard:secondary_add_ammo(value)
		local secondary = self._unit:inventory():unit_by_selection(1):base()
		self._secondary_add_bullet = self._secondary_add_bullet or value
		if self._secondary_add_bullet then
			self._secondary_add_bullet = self._secondary_add_bullet + value
			if math.floor(self._secondary_add_bullet+0.5) >= 1 then
				secondary:set_ammo_remaining_in_clip( secondary:get_ammo_remaining_in_clip() + math.floor(self._secondary_add_bullet+0.5))
				managers.hud:set_ammo_amount(secondary:selection_index(), secondary:ammo_info())
				self._secondary_add_bullet = nil
			end
		end
	end
	
	function PlayerStandard:_primary_regen_ammo(t, dt)
		local primary = self._unit:inventory():unit_by_selection(2):base()
		self._primary_regen_rate = self._primary_regen_rate or primary._regen_rate or 10
		self._primary_regenerate_ammo_timer = self._primary_regenerate_ammo_timer or 0
		if primary:get_ammo_total() <= 0 then
			return
		end
		if self._unit:inventory():equipped_selection() == 2 and self._shooting then
			self._primary_regenerate_ammo_timer = primary._regen_ammo_time or 0.5
		end
		if primary:clip_empty() then
			self._primary_regen_rate = primary._regen_rate_overheat or 4.5
			if not self._primary_overheat_pen then
				self._primary_overheat_pen = primary._overheat_pen or 2.75
			end
		end
		if self._primary_overheat_pen and self._primary_overheat_pen <= 0 then
			--log( "COOL" )
			self._primary_regen_rate = primary._regen_rate or 10
			self._primary_overheat_pen = nil
			self._primary_overheat_yell = nil
		end
		if self._primary_overheat_pen then
			self._primary_overheat_pen = self._primary_overheat_pen - dt
			--log( "OVERHEAT TIME: " .. tostring(self._primary_overheat_pen) )
			if not self._primary_overheat_yell then
				managers.player:local_player():sound():say("g29",false,nil)
				self._primary_overheat_yell = true
			end
		end
		if primary:get_ammo_remaining_in_clip() >= primary:get_ammo_total() then 
			--log("NO AMMO")
			self._primary_regenerate_ammo_timer = nil
		end
		if primary:get_ammo_remaining_in_clip() >= primary:get_ammo_max_per_clip() then
			self._primary_regenerate_ammo_timer = nil
		end
		if self._primary_regenerate_ammo_timer then
			self._primary_regenerate_ammo_timer = self._primary_regenerate_ammo_timer - dt
			if self._primary_regenerate_ammo_timer < 0 then
				self:primary_add_ammo(dt * self._primary_regen_rate)
			end
		end
	end
	
	function PlayerStandard:primary_add_ammo(value)
		local primary = self._unit:inventory():unit_by_selection(2):base()
		self._primary_add_bullet = self._primary_add_bullet or value
		if self._primary_add_bullet then
			self._primary_add_bullet = self._primary_add_bullet + value
			if math.floor(self._primary_add_bullet+0.5) >= 1 then
				primary:set_ammo_remaining_in_clip( primary:get_ammo_remaining_in_clip() + math.floor(self._primary_add_bullet+0.5))
				managers.hud:set_ammo_amount(primary:selection_index(), primary:ammo_info())
				self._primary_add_bullet = nil
			end
		end
	end
		
	function PlayerStandard:_start_action_unequip_weapon(t, data)
		local speed_multiplier = self:_get_swap_speed_multiplier()
		local tweak_data = self._equipped_unit:base():weapon_tweak_data()
		speed_multiplier = speed_multiplier / (tweak_data.unequip or 1)
		
		self._equipped_unit:base():tweak_data_anim_stop("equip", speed_multiplier)
		self._equipped_unit:base():tweak_data_anim_play("unequip", speed_multiplier)
		
		self._change_weapon_data = data
		self._unequip_weapon_expire_t = t + (tweak_data.timers.unequip or 0.5) / speed_multiplier
		self:_interupt_action_running(t)
		self:_interupt_action_charging_weapon(t)
		local result = self._ext_camera:play_redirect(self.IDS_UNEQUIP, speed_multiplier)
		self:_interupt_action_reload(t)
		self:_interupt_action_steelsight(t)
	end

	function PlayerStandard:_start_action_equip_weapon(t)
		if self._change_weapon_data.next then
			self._ext_inventory:equip_next(false)
		elseif self._change_weapon_data.previous then
			self._ext_inventory:equip_previous(false)
		elseif self._change_weapon_data.selection_wanted then
			self._ext_inventory:equip_selection(self._change_weapon_data.selection_wanted, false)
		end
		local speed_multiplier = self:_get_swap_speed_multiplier()
		local tweak_data = self._equipped_unit:base():weapon_tweak_data()
		speed_multiplier = speed_multiplier / (tweak_data.equip or 1)
		
		self._equipped_unit:base():tweak_data_anim_stop("unequip")
		self._equipped_unit:base():tweak_data_anim_play("equip", speed_multiplier)
		
		self._equip_weapon_expire_t = t + (tweak_data.timers.equip or 0.7) / speed_multiplier
		self._ext_camera:play_redirect(self.IDS_EQUIP, speed_multiplier)
		self._equipped_unit:base():tweak_data_anim_stop("unequip")
		self._equipped_unit:base():tweak_data_anim_play("equip", speed_multiplier)
		managers.upgrades:setup_current_weapon()
	end
	
	function PlayerStandard:_stance_entered(unequipped)
		local stance_standard = tweak_data.player.stances.default[managers.player:current_state()] or tweak_data.player.stances.default.standard
		local head_stance = self._state_data.ducking and tweak_data.player.stances.default.crouched.head or stance_standard.head
		local stance_id
		local stance_mod = {
			translation = Vector3(0, 0, 0)
		}
		if not unequipped then
			stance_id = self._equipped_unit:base():get_stance_id()
			stance_mod = self._state_data.in_steelsight and self._equipped_unit:base().stance_mod and self._equipped_unit:base():stance_mod() or stance_mod
		end
		local stances
		if self:_is_meleeing() or self:_is_throwing_projectile() then
			stances = tweak_data.player.stances.default
		else
			stances = tweak_data.player.stances[stance_id] or tweak_data.player.stances.default
		end
		local misc_attribs = stances.standard
		if self:_is_using_bipod() and not self:_is_throwing_projectile() then
			misc_attribs = stances.bipod
			if self._state_data.in_steelsight then 
				misc_attribs = stances.steelsight
			end
		else
			misc_attribs = self._state_data.in_steelsight and stances.steelsight or self._state_data.ducking and stances.crouched or stances.standard
		end
		local duration = tweak_data.player.TRANSITION_DURATION + (self._equipped_unit:base():transition_duration() or 0)
		local duration_multiplier = not self._state_data.in_full_steelsight and self._state_data.in_steelsight and 1 / self._equipped_unit:base():enter_steelsight_speed_multiplier() or 1
		local new_fov = self:get_zoom_fov(misc_attribs) + 0
		self._camera_unit:base():clbk_stance_entered(misc_attribs.shoulders, head_stance, misc_attribs.vel_overshot, new_fov, misc_attribs.shakers, stance_mod, duration_multiplier, duration)
		managers.menu:set_mouse_sensitivity(self:in_steelsight())
	end
	
	 
	function PlayerStandard:_check_action_deploy_bipod(t, input)
		if not input.btn_deploy_bipod then
			return
		end
		local weapon = self._equipped_unit:base()
		local bipod_part = managers.weapon_factory:get_parts_from_weapon_by_perk("bipod", weapon._parts)
		local bipod_unit = nil
		local can_deploy = nil
		if bipod_part and bipod_part[1] then
			bipod_unit = bipod_part[1].unit:base()
			can_deploy = bipod_unit:_is_deployable()
		end
		if bipod_part and bipod_part[1] and ( self._moving or self:running() or self:_on_zipline() or self:_is_throwing_projectile() or self:_is_meleeing() or self._camera_unit:base():is_stance_done() ~= true or self._state_data.in_air or self:in_steelsight() ) then
			if self:_on_zipline() then
				managers.hud:show_hint({text = "Cannot Deploy While Ziplining",time = 2})
			elseif self._state_data.in_air then
				managers.hud:show_hint({text = "Cannot Deploy While Airborne",time = 2})
			elseif self:_is_throwing_projectile() then
				managers.hud:show_hint({text = "Cannot Deploy While Throwing",time = 2})
			elseif can_deploy ~= true then 
				managers.hud:show_hint({text = managers.localization:text("hud_hint_bipod_nomount"), time = 2})
			elseif self._camera_unit:base():is_stance_done() ~= true then
				managers.hud:show_hint({text = "Cannot Deploy While Changing Stance",time = 2})
			elseif self:in_steelsight() then
				managers.hud:show_hint({text = "Cannot Deploy While Aiming",time = 2})
			elseif self._moving or self:running() then
				managers.hud:show_hint({text = "Cannot Deploy While Moving",time = 2})
			end
			return
		end
		if bipod_unit then
			bipod_unit:check_state()
		end
	end 
	
	local old_update_reload_timers = PlayerStandard._update_reload_timers
	function PlayerStandard:_update_reload_timers(t, dt, input)
		if self._state_data.reload_expire_t or self._state_data.reload_enter_expire_t then
			self._equipped_unit:base():tweak_data_anim_stop("fire")
		end
		old_update_reload_timers(self, t, dt, input)
	end
	
	function PlayerStandard:_check_action_primary_attack(t, input)
		local new_action
		local action_wanted = input.btn_primary_attack_state or input.btn_primary_attack_release or self._sticky_burst
		local weap_base = self._equipped_unit:base()
		local secondary = self._unit:inventory():unit_by_selection(1):base()
		local primary = self._unit:inventory():unit_by_selection(2):base()
		local burst = weap_base and ((weap_base._track_burst and weap_base._burst_size - weap_base._track_burst) or weap_base._burst_size)
		
		if weap_base:in_burst_mode() and self._sticky_burst then
			input.btn_primary_attack_state = true
		end
		
		if weap_base:in_burst_mode() then
			if weap_base._shotsfired >= burst then
				--log("STOP")
				self._sticky_burst = nil
				self._end_burst = true
				if weap_base._burst_delay then
					self._burst_delay = weap_base._burst_delay
				end		
			elseif weap_base._shotsfired > 0 and weap_base._shotsfired < burst and not action_wanted then
				if weap_base._burst_delay and not weap_base._no_reset_burst then
					self._burst_delay = weap_base._burst_delay
				end	
			end
		elseif not weap_base:in_burst_mode() and weap_base._fire_rate_init_count then
			if not action_wanted and weap_base._shotsfired > 0 and weap_base._shotsfired <= weap_base._fire_rate_init_count then
				if weap_base._burst_delay then
					self._burst_delay = weap_base._burst_delay
				end	
			end
		end
		
		if action_wanted or self._sticky_burst then
			
			--log(tostring(self._primary_overheat_pen))			
			
			local action_forbidden = self:_is_reloading() or self:_changing_weapon() or self:_is_meleeing() or self._use_item_expire_t or self:_interacting() or self:_is_throwing_projectile() or self:_is_deploying_bipod() or (self._unit:inventory():equipped_selection() == 2 and primary._starwars and self._primary_overheat_pen) or (self._unit:inventory():equipped_selection() == 1 and secondary._starwars and self._secondary_overheat_pen) or (self._end_burst and not weap_base._auto_burst) or self._burst_delay or (self._end_running_expire_t and not self.RUN_AND_SHOOT)

			if weap_base:in_burst_mode() and weap_base._force_burst and not action_forbidden and not weap_base:clip_empty() then
				self._sticky_burst = true
			else 
				self._sticky_burst = nil
			end
			
			if not action_forbidden then
				self._queue_reload_interupt = nil
				self._ext_inventory:equip_selected_primary(false)
				if self._equipped_unit then
					local fire_mode = weap_base:fire_mode()
					--log(tostring(fire_mode))
					local fire_on_release = weap_base:fire_on_release()
					if weap_base:out_of_ammo() then
						if input.btn_primary_attack_press then
							weap_base:dryfire()
						end
					elseif weap_base.clip_empty and weap_base:clip_empty() then
						if self:_is_using_bipod() then
							if input.btn_primary_attack_press then
								weap_base:dryfire()
							end
							self._equipped_unit:base():tweak_data_anim_stop("fire")
						elseif fire_mode == "single" then
							if input.btn_primary_attack_press then
								self:_start_action_reload_enter(t)
							end
						else
							new_action = true
							self:_start_action_reload_enter(t)
						end
					elseif self._running and not self.RUN_AND_SHOOT then
						self:_interupt_action_running(t)
					else
						if not self._shooting then
							if weap_base:start_shooting_allowed() then
								local start = fire_mode == "single" and input.btn_primary_attack_press
								start = start or fire_mode ~= "single" and input.btn_primary_attack_state
								start = start and not fire_on_release
								start = start or fire_on_release and input.btn_primary_attack_release
								if start then
									weap_base:start_shooting()
									self._camera_unit:base():start_shooting()
									self._shooting = true
									self._shooting_t = t
									if fire_mode == "auto" and not weap_base._no_auto_anims and not weap_base._starwars then
									--log("FSFDSFDS")
										self._unit:camera():play_redirect(self.IDS_RECOIL_ENTER, weap_base:fire_rate_multiplier())
									end
								end
							else
								return false
							end
						end
						local suppression_ratio = self._unit:character_damage():effective_suppression_ratio()
						local spread_mul = math.lerp(1, tweak_data.player.suppression.spread_mul, suppression_ratio)
						local autohit_mul = math.lerp(1, tweak_data.player.suppression.autohit_chance_mul, suppression_ratio)
						local suppression_mul = managers.blackmarket:threat_multiplier()
						local dmg_mul = managers.player:temporary_upgrade_value("temporary", "dmg_multiplier_outnumbered", 1)
						local weapon_category = weap_base:weapon_tweak_data().category
						if managers.player:has_category_upgrade("player", "overkill_all_weapons") or weapon_category == "shotgun" or weapon_category == "saw" then
							dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
						end
						local health_ratio = self._ext_damage:health_ratio()
						local damage_health_ratio = managers.player:get_damage_health_ratio(health_ratio, weapon_category)
						if damage_health_ratio > 0 then
							local upgrade_name = weapon_category == "saw" and "melee_damage_health_ratio_multiplier" or "damage_health_ratio_multiplier"
							local damage_ratio = damage_health_ratio
							dmg_mul = dmg_mul * (1 + managers.player:upgrade_value("player", upgrade_name, 0) * damage_ratio)
						end
						dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "berserker_damage_multiplier", 1)
						if managers.player:has_category_upgrade(weapon_category, "stacking_hit_damage_multiplier") then
							self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
							self._state_data.stacking_dmg_mul[weapon_category] = self._state_data.stacking_dmg_mul[weapon_category] or {nil, 0}
							local stack = self._state_data.stacking_dmg_mul[weapon_category]
							if stack[1] and t < stack[1] then
								dmg_mul = dmg_mul * (1 + managers.player:upgrade_value(weapon_category, "stacking_hit_damage_multiplier", 0) * stack[2])
							else
								stack[2] = 0
							end
						end
						local fired
						if fire_mode == "single" then
							if input.btn_primary_attack_press then
								fired = weap_base:trigger_pressed(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
							elseif fire_on_release then
								if input.btn_primary_attack_release then
									fired = weap_base:trigger_released(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
								elseif input.btn_primary_attack_state then
									weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
								end
							elseif weap_base._auto_anim_burst and weap_base:in_burst_mode() and input.btn_primary_attack_state then
								fired = weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
							end
						elseif input.btn_primary_attack_state then
							fired = weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
						end
						if weap_base.manages_steelsight and weap_base:manages_steelsight() then
							if weap_base:wants_steelsight() and not self._state_data.in_steelsight then
								self:_start_action_steelsight(t)
							elseif not weap_base:wants_steelsight() and self._state_data.in_steelsight then
								self:_end_action_steelsight(t)
							end
						end
						local charging_weapon = fire_on_release and weap_base:charging()
						if not self._state_data.charging_weapon and charging_weapon then
							self:_start_action_charging_weapon(t)
						elseif self._state_data.charging_weapon and not charging_weapon then
							self:_end_action_charging_weapon(t)
						end
						new_action = true
												
						if fired then
							managers.rumble:play("weapon_fire")
							local weap_tweak_data = tweak_data.weapon[weap_base:get_name_id()]
							local shake_multiplier = weap_tweak_data.shake[self._state_data.in_steelsight and "fire_steelsight_multiplier" or "fire_multiplier"]
							self._ext_camera:play_shaker("fire_weapon_rot", 1 * shake_multiplier)
							self._ext_camera:play_shaker("fire_weapon_kick", 1 * shake_multiplier, 1, 0.15)
							self._equipped_unit:base():tweak_data_anim_stop("unequip")
							self._equipped_unit:base():tweak_data_anim_stop("equip")
							
							local anim_speed_mult
							anim_speed_mult = weap_base:fire_rate_multiplier() or 1
							if weap_base:in_burst_mode() and weap_base._burst_anim_speed_mult then
								anim_speed_mult = weap_base._burst_anim_speed_mult
							end
							if weap_base._anim_speed_mult then
								anim_speed_mult = anim_speed_mult * weap_base._anim_speed_mult
							end
							
							if not self._anim_delay then
								if weap_base._anim_delay then
									self._anim_delay = weap_base._anim_delay
								end
								if not self._state_data.in_steelsight or not weap_base:tweak_data_anim_play("fire_steelsight", anim_speed_mult) then
									weap_base:tweak_data_anim_play("fire", anim_speed_mult)
								end
							end
							
							anim_speed_mult = ( weap_base._anim_speed_mult and weap_base:fire_rate_multiplier() ) or 1
							if weap_base:in_burst_mode() and weap_base._burst_anim_speed_mult then
								anim_speed_mult = weap_base._burst_anim_speed_mult
							end
							if weap_base._anim_speed_mult then
								anim_speed_mult = anim_speed_mult * weap_base._anim_speed_mult
							end
							
							if fire_mode == "single" or weap_base._no_auto_anims or weap_base._starwars and weap_base:get_name_id() ~= "saw" then
								if not self._state_data.in_steelsight then
									self._ext_camera:play_redirect( weap_base._no_singlefire_anim and self.IDS_RECOIL_EXIT or self.IDS_RECOIL, anim_speed_mult or 1)
								elseif weap_tweak_data.animations.recoil_steelsight and not weap_base._no_recoil_anim then
									self._ext_camera:play_redirect( (weap_base._no_singlefire_anim and self.IDS_RECOIL_EXIT) or (weap_base:is_second_sight_on() and self.IDS_RECOIL) or self.IDS_RECOIL_STEELSIGHT, anim_speed_mult or 1)
								end
							end
							
							if (weap_base:in_burst_mode() and weap_base._no_ads_burst == true) or (not weap_base:in_burst_mode() and fire_mode == "auto" and weap_base._no_ads_auto == true) then
								self:_interupt_action_steelsight(t)
							end
							
							local recoil_multiplier = (weap_base:recoil() + weap_base:recoil_addend()) * weap_base:recoil_multiplier()
							cat_print("jansve", "[PlayerStandard] Weapon Recoil Multiplier: " .. tostring(recoil_multiplier))
							local up, down, left, right = unpack(weap_tweak_data.kick[self._state_data.in_steelsight and "steelsight" or self._state_data.ducking and "crouching" or "standing"])
							self._camera_unit:base():recoil_kick(up * recoil_multiplier, down * recoil_multiplier, left * recoil_multiplier, right * recoil_multiplier)
							if self._shooting_t then
								local time_shooting = t - self._shooting_t
								local achievement_data = tweak_data.achievement.never_let_you_go
								if achievement_data and weap_base:get_name_id() == achievement_data.weapon_id and time_shooting >= achievement_data.timer then
									managers.achievment:award(achievement_data.award)
									self._shooting_t = nil
								end
							end
							if managers.player:has_category_upgrade(weapon_category, "stacking_hit_damage_multiplier") then
								self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
								self._state_data.stacking_dmg_mul[weapon_category] = self._state_data.stacking_dmg_mul[weapon_category] or {nil, 0}
								local stack = self._state_data.stacking_dmg_mul[weapon_category]
								if fired.hit_enemy then
									stack[1] = t + managers.player:upgrade_value(weapon_category, "stacking_hit_expire_t", 1)
									stack[2] = math.min(stack[2] + 1, tweak_data.upgrades.max_weapon_dmg_mul_stacks or 5)
								else
									stack[1] = nil
									stack[2] = 0
								end
							end
							if weap_base.set_recharge_clbk then
								weap_base:set_recharge_clbk(callback(self, self, "weapon_recharge_clbk_listener"))
							end
							managers.hud:set_ammo_amount(weap_base:selection_index(), weap_base:ammo_info())
							local impact = not fired.hit_enemy
							if weap_base.third_person_important and weap_base:third_person_important() then
								self._ext_network:send("shot_blank_reliable", impact)
							else
								self._ext_network:send("shot_blank", impact)
							end
						elseif fire_mode == "single" then
							new_action = false
						end
					end
				end
			elseif self:_is_reloading() and self._equipped_unit:base():reload_interuptable() and input.btn_primary_attack_press then
				self._queue_reload_interupt = true
			end
		else
			self._end_burst = nil
		end
		if not new_action then
			self:_check_stop_shooting()
		end
		return new_action
	end
	
	function PlayerStandard:_check_stop_shooting()
		if self._shooting then
			self._equipped_unit:base():stop_shooting()
			self._camera_unit:base():stop_shooting(self._equipped_unit:base():recoil_wait())
			local weap_base = self._equipped_unit:base()
			local fire_mode = weap_base:fire_mode()
			if not weap_base._starwars and (not weap_base._no_auto_anims and fire_mode == "auto") and not self:_is_reloading() and not self:_is_meleeing() then
				self._unit:camera():play_redirect(self.IDS_RECOIL_EXIT)
			end
			self._shooting = false
			self._shooting_t = nil
		end
	end
	
	local melee_vars = {
		"player_melee",
		"player_melee_var2"
	}
	function PlayerStandard:_do_melee_damage(t, bayonet_melee, melee_hit_ray)
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
		local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
		local charge_lerp_value = instant_hit and 0 or self:_get_melee_charge_lerp_value(t, melee_damage_delay)
		self._ext_camera:play_shaker(melee_vars[math.random(#melee_vars)], math.max(0.3, charge_lerp_value))
		local sphere_cast_radius = 20
		local col_ray
		local special_weapon = tweak_data.blackmarket.melee_weapons[melee_entry].special_weapon
		local tase_chance = math.random()
		if melee_hit_ray then
			col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
		else
			col_ray = self:_calc_melee_hit_ray(t, sphere_cast_radius)
		end
		if col_ray and alive(col_ray.unit) then
			local damage, damage_effect = managers.blackmarket:equipped_melee_weapon_damage_info(charge_lerp_value)
			local damage_effect_mul = math.max(managers.player:upgrade_value("player", "melee_knockdown_mul", 1), managers.player:upgrade_value(self._equipped_unit:base():weapon_tweak_data().category, "melee_knockdown_mul", 1))
			damage_effect = damage_effect * damage_effect_mul
			col_ray.sphere_cast_radius = sphere_cast_radius
			local hit_unit = col_ray.unit
			if hit_unit:character_damage() then
				if bayonet_melee then
					self._unit:sound():play("fairbairn_hit_body", nil, false)
				elseif special_weapon == "taser" and charge_lerp_value < tase_chance then
					self._unit:sound():play("melee_hit_gen", nil, false)
				elseif special_weapon == "taser" and charge_lerp_value >= tase_chance then
					self._unit:sound():play("tasered_shock")
					self:_play_melee_sound(melee_entry, "hit_body")
				else
					self:_play_melee_sound(melee_entry, "hit_body")
				end
				if not hit_unit:character_damage()._no_blood then
					managers.game_play_central:play_impact_flesh({col_ray = col_ray})
					managers.game_play_central:play_impact_sound_and_effects({
						col_ray = col_ray,
						no_decal = true,
						no_sound = true
					})
				end
			else
				if bayonet_melee then
					self._unit:sound():play("knife_hit_gen", nil, false)
				elseif special_weapon == "taser" and charge_lerp_value < tase_chance then
					self._unit:sound():play("melee_hit_gen", nil, false)
				else
					self:_play_melee_sound(melee_entry, "hit_gen")
				end
				managers.game_play_central:play_impact_sound_and_effects({
					col_ray = col_ray,
					effect = Idstring("effects/payday2/particles/impacts/fallback_impact_pd2"),
					no_decal = true,
					no_sound = true
				})
			end
			if hit_unit:damage() and col_ray.body:extension() and col_ray.body:extension().damage then
				col_ray.body:extension().damage:damage_melee(self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
				if hit_unit:id() ~= -1 then
					managers.network:session():send_to_peers_synched("sync_body_damage_melee", col_ray.body, self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
				end
			end
			managers.rumble:play("melee_hit")
			managers.game_play_central:physics_push(col_ray)
			local character_unit, shield_knock
			local can_shield_knock = managers.player:has_category_upgrade("player", "shield_knock")
			if can_shield_knock and hit_unit:in_slot(8) and alive(hit_unit:parent()) then
				shield_knock = true
				character_unit = hit_unit:parent()
			end
			character_unit = character_unit or hit_unit
			if character_unit:character_damage() and character_unit:character_damage().damage_melee then
				local dmg_multiplier = 1
				if not managers.enemy:is_civilian(character_unit) and not managers.groupai:state():is_enemy_special(character_unit) then
					dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "non_special_melee_multiplier", 1)
				else
					dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_damage_multiplier", 1)
				end
				dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[melee_entry].stats.weapon_type) .. "_damage_multiplier", 1)
				if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
					self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
					self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {nil, 0}
					local stack = self._state_data.stacking_dmg_mul.melee
					if stack[1] and t < stack[1] then
						dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("melee", "stacking_hit_damage_multiplier", 0) * stack[2])
					else
						stack[2] = 0
					end
				end
				local health_ratio = self._ext_damage:health_ratio()
				local damage_health_ratio = managers.player:get_damage_health_ratio(health_ratio, "melee")
				if damage_health_ratio > 0 then
					local damage_ratio = damage_health_ratio
					dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("player", "melee_damage_health_ratio_multiplier", 0) * damage_ratio)
				end
				dmg_multiplier = dmg_multiplier * managers.player:temporary_upgrade_value("temporary", "berserker_damage_multiplier", 1)
				if character_unit:character_damage().dead and not character_unit:character_damage():dead() and managers.enemy:is_enemy(character_unit) and managers.player:has_category_upgrade("temporary", "melee_life_leech") and not managers.player:has_activate_temporary_upgrade("temporary", "melee_life_leech") then
					managers.player:activate_temporary_upgrade("temporary", "melee_life_leech")
					self._unit:character_damage():restore_health(managers.player:temporary_upgrade_value("temporary", "melee_life_leech", 1))
				end
				--local special_weapon = tweak_data.blackmarket.melee_weapons[melee_entry].special_weapon
				local action_data = {}
				action_data.variant = "melee"
				if special_weapon == "taser" and charge_lerp_value >= tase_chance then
					action_data.variant = "taser_tased"	
					--dmg_multiplier = 0
				end
				action_data.damage = shield_knock and 0 or damage * dmg_multiplier
				action_data.damage_effect = damage_effect
				action_data.attacker_unit = self._unit
				action_data.col_ray = col_ray
				action_data.shield_knock = can_shield_knock
				action_data.name_id = melee_entry
				action_data.charge_lerp_value = charge_lerp_value
				if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
					self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
					self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {nil, 0}
					local stack = self._state_data.stacking_dmg_mul.melee
					if character_unit:character_damage().dead and not character_unit:character_damage():dead() then
						stack[1] = t + managers.player:upgrade_value("melee", "stacking_hit_expire_t", 1)
						stack[2] = math.min(stack[2] + 1, tweak_data.upgrades.max_melee_weapon_dmg_mul_stacks or 5)
					else
						stack[1] = nil
						stack[2] = 0
					end
				end
				local defense_data = character_unit:character_damage():damage_melee(action_data)
				self:_check_melee_dot_damage(col_ray, defense_data, melee_entry)
				return defense_data
			end
		else
		end
		if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
			self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
			self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {nil, 0}
			local stack = self._state_data.stacking_dmg_mul.melee
			stack[1] = nil
			stack[2] = 0
		end
		return col_ray
	end
	
	local old_upd_melee_timers = PlayerStandard._update_melee_timers
	function PlayerStandard:_update_melee_timers(t, input)
		if self._state_data.meleeing then
			self:set_running(false)
			local melee_entry = managers.blackmarket:equipped_melee_weapon()
			local special_weapon = tweak_data.blackmarket.melee_weapons[melee_entry].special_weapon
			local lerp_value = self:_get_melee_charge_lerp_value(t)
			if lerp_value == 1 and special_weapon == "taser" and not self._stopsound then
				self._unit:sound():play("tasered_loop")
				self._stopsound = true
			end
		else
			self._unit:sound():play("tasered_stop")
			self._stopsound = nil
		end
		old_upd_melee_timers(self, t, input)
	end

	
--}

elseif RequiredScript == "lib/units/beings/player/states/playerbipod" then
--{

	--Thanks to SC for making/finding this
	function PlayerBipod:_check_action_steelsight(t, input)
		local new_action
		if self._equipped_unit then
			local result
			local weap_base = self._equipped_unit:base()
			if weap_base.manages_steelsight and weap_base:manages_steelsight() then
				if input.btn_steelsight_press and weap_base.steelsight_pressed then
					result = weap_base:steelsight_pressed()
				elseif input.btn_steelsight_release and weap_base.steelsight_released then
					result = weap_base:steelsight_released()
				end
				if result then
					if result.enter_steelsight and not self._state_data.in_steelsight then
						self:_start_action_steelsight(t)
						new_action = true
					elseif result.exit_steelsight and self._state_data.in_steelsight then
						self:_end_action_steelsight(t)
						new_action = true
					end
				end
				return new_action
			end
		end
		if managers.user:get_setting("hold_to_steelsight") and input.btn_steelsight_release then
			self._steelsight_wanted = false
			if self._state_data.in_steelsight then
				self:_end_action_steelsight(t)
				new_action = true
			end
		elseif input.btn_steelsight_press or self._steelsight_wanted then
			if self._state_data.in_steelsight then
				self:_end_action_steelsight(t)
				new_action = true
			elseif not self._state_data.in_steelsight then
				self:_start_action_steelsight(t)
				new_action = true
			end
		end
		return new_action
	end

	function PlayerBipod:_enter(enter_data)
		local player = managers.player:player_unit()
		if player and self._unit:base().is_local_player then
			local tweak_data = self._equipped_unit:base():weapon_tweak_data()
			local speed_multiplier = 1.1 --self._equipped_unit:base():reload_speed_multiplier()
			local reload_name_id = tweak_data.animations.reload_name_id or self._equipped_unit:base().name_id
			local equipped_unit_id = self._equipped_unit:base().name_id
			self._unit_deploy_position = player:position()
			self._unit:camera():camera_unit():base():set_limits(tweak_data.bipod_camera_spin_limit, tweak_data.bipod_camera_pitch_limit)
			PlayerBipod.super:start_deploying_bipod(tweak_data.timers.deploy_bipod)
			self._equipped_unit:base():tweak_data_anim_stop("undeploy")
			
			local require_optic = tweak_data.anim_req_scope
			local has_optic = self._equipped_unit:base()._has_scope
			local disable_bipod_anims = (require_optic and not has_optic) or nil
			
			if not disable_bipod_anims then
				local result = self._ext_camera:play_redirect(Idstring(tweak_data.animations.bipod_enter .. "_" .. equipped_unit_id), speed_multiplier)
			end
			
			local result_deploy = self._equipped_unit:base():tweak_data_anim_play("deploy", speed_multiplier)
			self._headbob = 0
			self._target_headbob = 0
			self._ext_camera:set_shaker_parameter("headbob", "amplitude", 0)
			
			if not disable_bipod_anims then
				PlayerStandard.IDS_RECOIL = Idstring(tweak_data.animations.bipod_recoil .. "_" .. equipped_unit_id)
				PlayerStandard.IDS_RECOIL_ENTER = Idstring(tweak_data.animations.bipod_recoil_enter .. "_" .. equipped_unit_id)
				PlayerStandard.IDS_RECOIL_LOOP = Idstring(tweak_data.animations.bipod_recoil_loop .. "_" .. equipped_unit_id)
				PlayerStandard.IDS_RECOIL_EXIT = Idstring(tweak_data.animations.bipod_recoil_exit .. "_" .. equipped_unit_id)
			end
			
			self._unit:sound_source():post_event("wp_steady_in")
			self:_stance_entered()
			self:_husk_bipod_data()
		end
	end
	
	function PlayerBipod:exit(state_data, new_state_name)
		PlayerBipod.super.exit(self, state_data or self._state_data, new_state_name)
		local tweak_data = self._equipped_unit:base():weapon_tweak_data()
		local speed_multiplier = 1.1 --self._equipped_unit:base():reload_speed_multiplier()
		local equipped_unit_id = self._equipped_unit:base().name_id
		self._equipped_unit:base():tweak_data_anim_stop("deploy")
		
		local require_optic = tweak_data.anim_req_scope
		local has_optic = self._equipped_unit:base()._has_scope
		local disable_bipod_anims = (require_optic and not has_optic) or nil
		
		if not disable_bipod_anims then
			local result = self._ext_camera:play_redirect(Idstring(tweak_data.animations.bipod_exit .. "_" .. equipped_unit_id), speed_multiplier)
		end
		local result_deploy = self._equipped_unit:base():tweak_data_anim_play("undeploy", speed_multiplier)
		self._unit:camera():camera_unit():base():set_target_tilt(0)
		self._unit:camera():camera_unit():base():remove_limits()
		self._unit:camera():camera_unit():base().bipod_location = nil
		local exit_data = {}
		exit_data.skip_equip = true
		self._dye_risk = nil
		PlayerStandard.IDS_RECOIL = Idstring("recoil")
		PlayerStandard.IDS_RECOIL_ENTER = Idstring("recoil_enter")
		PlayerStandard.IDS_RECOIL_LOOP = Idstring("recoil_loop")
		PlayerStandard.IDS_RECOIL_EXIT = Idstring("recoil_exit")
		self._unit:sound_source():post_event("wp_steady_out")
		local peer_id = managers.network:session():peer_by_unit(self._unit):id()
		Application:trace("PlayerBipod:exit: ", peer_id)
		managers.player:set_bipod_data_for_peer({peer_id = peer_id})
		return exit_data
	end

--}
end