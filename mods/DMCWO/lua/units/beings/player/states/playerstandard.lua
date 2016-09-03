--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

function PlayerStandard:_do_action_melee(t, input, skip_damage)
	self._state_data.meleeing = nil
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
	local pre_calc_hit_ray = tweak_data.blackmarket.melee_weapons[melee_entry].hit_pre_calculation
	local speed = tweak_data.blackmarket.melee_weapons[melee_entry].speed_mult or 1
	local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
	melee_damage_delay = math.min(melee_damage_delay, tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t)
	local charge_lerp_value = instant_hit and 0 or self:_get_melee_charge_lerp_value(t)
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
		local anim_attack_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_vars
		local anim_attack_charged_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_charged_vars
		local anim_attack_left_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_left_vars
		local anim_attack_right_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_right_vars
		local timing_fix = tweak_data.blackmarket.melee_weapons[melee_entry].timing_fix
		local timing_fix_speed_mult = tweak_data.blackmarket.melee_weapons[melee_entry].timing_fix_speed_mult or 1
		self._melee_attack_var = anim_attack_vars and math.random(#anim_attack_vars)
		self:_play_melee_sound(melee_entry, "hit_air", self._melee_attack_var)
		local melee_item_tweak_anim = "attack"
		local melee_item_prefix = ""
		local melee_item_suffix = ""
		local anim_attack_param = anim_attack_vars and anim_attack_vars[self._melee_attack_var]
		
		
		if anim_attack_charged_vars and charge_lerp_value >= 0.5 then
			self._melee_attack_var = anim_attack_charged_vars and math.random(#anim_attack_charged_vars)
			anim_attack_param = anim_attack_charged_vars and anim_attack_charged_vars[self._melee_attack_var]
		elseif self._stick_move then
			local angle = mvector3.angle(self._stick_move, math.X)
			if anim_attack_left_vars and angle and (angle <= 180) and (angle >= 135) then
				self._melee_attack_var = anim_attack_left_vars and math.random(#anim_attack_left_vars)
				anim_attack_param = anim_attack_left_vars and anim_attack_left_vars[self._melee_attack_var]
			elseif anim_attack_right_vars and angle and (angle <= 45) and (angle >= 0) then
				self._melee_attack_var = anim_attack_right_vars and math.random(#anim_attack_right_vars)
				anim_attack_param = anim_attack_right_vars and anim_attack_right_vars[self._melee_attack_var]
			end
		end
		local fix_anim_timer = anim_attack_param and timing_fix and table.contains(timing_fix, anim_attack_param)
		if fix_anim_timer then
			speed = speed * timing_fix_speed_mult
		end
		
		local state = self._ext_camera:play_redirect(PlayerStandard.IDS_MELEE_ATTACK, speed)
		
		if anim_attack_param then
			self._camera_unit:anim_state_machine():set_parameter(state, anim_attack_param, 1)
			melee_item_prefix = anim_attack_param .. "_"
		end
		if self._state_data.melee_hit_ray and self._state_data.melee_hit_ray ~= true then
			self._camera_unit:anim_state_machine():set_parameter(state, "hit", 1)
			melee_item_suffix = "_hit"
		end
		melee_item_tweak_anim = melee_item_prefix .. melee_item_tweak_anim .. melee_item_suffix
		self._camera_unit:base():play_anim_melee_item(melee_item_tweak_anim)
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
		if not managers.player.RUN_AND_SHOOT and (not self.RUN_AND_RELOAD or not self:_is_reloading()) then
			self._ext_camera:play_redirect(self.IDS_STOP_RUNNING, speed_multiplier)
		end
	end
end
	
local old_check_action_steelsight = PlayerStandard._check_action_steelsight
function PlayerStandard:_check_action_steelsight(t, input)
	if (self._end_running_expire_t and not managers.player.RUN_AND_SHOOT) then
		if input.btn_steelsight_press then
			self._steelsight_wanted = true
		end
		if managers.user:get_setting("hold_to_steelsight") and input.btn_steelsight_release then
			self._steelsight_wanted = false
		end
		return
	end
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
		if DMCWO._data.bipod_ads_autodeploy == true then
			self:_check_action_deploy_bipod(t, {btn_deploy_bipod = true}, true)
		end
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


local old_update = PlayerStandard.update
function PlayerStandard:update(t, dt)
	old_update(self, t, dt)
	local weap_base = self._equipped_unit:base()
	local secondary = self._unit:inventory():unit_by_selection(1):base()
	local primary = self._unit:inventory():unit_by_selection(2):base()
	if weap_base then
		if not weap_base._starwars and weap_base:clip_empty() and weap_base:weapon_tweak_data().lock_slide and not self:_is_reloading() then
			weap_base:tweak_data_anim_stop("fire", 1)
			weap_base:tweak_data_anim_play("reload", 0.1 / dt)
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
	if self._melee_equip_weapon_expire_t then
		self:_update_melee_equip_weapon_expire_t(t, dt)
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


function PlayerStandard:_update_melee_equip_weapon_expire_t(t, dt)
	if self._melee_equip_weapon_expire_t then
		self._melee_equip_weapon_expire_t = self._melee_equip_weapon_expire_t - dt
		if self._melee_equip_weapon_expire_t < 0 then
			self._melee_equip_weapon_expire_t = nil
		end
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
	secondary._secondary_regen_rate = secondary._secondary_regen_rate or secondary._regen_rate or 10
	secondary._secondary_regenerate_ammo_timer = secondary._secondary_regenerate_ammo_timer or 0
	if secondary:get_ammo_total() <= 0 then
		return
	end
	if self._unit:inventory():equipped_selection() == 1 and self._shooting then
		secondary._secondary_regenerate_ammo_timer = secondary._regen_ammo_time or 0.5
	end
	if secondary:clip_empty() then
		secondary._secondary_regen_rate = secondary._regen_rate_overheat or 4.5
		if not secondary._secondary_overheat_pen then
			secondary._secondary_overheat_pen = secondary._overheat_pen or 2.75
		end
	end
	if secondary._secondary_overheat_pen and secondary._secondary_overheat_pen <= 0 then
		--log( "COOL" )
		secondary._secondary_regen_rate = secondary._regen_rate or 10
		secondary._secondary_overheat_pen = nil
		secondary._secondary_overheat_yell = nil
	end
	if secondary._secondary_overheat_pen then
		secondary._secondary_overheat_pen = secondary._secondary_overheat_pen - dt
		--log( "OVERHEAT TIME: " .. tostring(self._secondary_overheat_pen) )
		if not secondary._secondary_overheat_yell then
			managers.player:local_player():sound():say("g29",false,nil)
			secondary._secondary_overheat_yell = true
		end
	end
	if secondary:get_ammo_remaining_in_clip() >= secondary:get_ammo_total() then 
		--log("NO AMMO")
		secondary._secondary_regenerate_ammo_timer = nil
	end
	if secondary:get_ammo_remaining_in_clip() >= secondary:get_ammo_max_per_clip() then
		secondary._secondary_regenerate_ammo_timer = nil
	end
	if secondary._secondary_regenerate_ammo_timer then
		secondary._secondary_regenerate_ammo_timer = secondary._secondary_regenerate_ammo_timer - dt
		if secondary._secondary_regenerate_ammo_timer < 0 then
			self:secondary_add_ammo(dt * secondary._secondary_regen_rate)
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
	primary._primary_regen_rate = primary._primary_regen_rate or primary._regen_rate or 10
	primary._primary_regenerate_ammo_timer = primary._primary_regenerate_ammo_timer or 0
	if primary:get_ammo_total() <= 0 then
		return
	end
	if self._unit:inventory():equipped_selection() == 2 and self._shooting then
		primary._primary_regenerate_ammo_timer = primary._regen_ammo_time or 0.5
	end
	if primary:clip_empty() then
		primary._primary_regen_rate = primary._regen_rate_overheat or 4.5
		if not primary._primary_overheat_pen then
			primary._primary_overheat_pen = primary._overheat_pen or 2.75
		end
	end
	if primary._primary_overheat_pen and primary._primary_overheat_pen <= 0 then
		--log( "COOL" )
		primary._primary_regen_rate = primary._regen_rate or 10
		primary._primary_overheat_pen = nil
		primary._primary_overheat_yell = nil
	end
	if primary._primary_overheat_pen then
		primary._primary_overheat_pen = primary._primary_overheat_pen - dt
		--log( "OVERHEAT TIME: " .. tostring(self._primary_overheat_pen) )
		if not primary._primary_overheat_yell then
			managers.player:local_player():sound():say("g29",false,nil)
			primary._primary_overheat_yell = true
		end
	end
	if primary:get_ammo_remaining_in_clip() >= primary:get_ammo_total() then 
		--log("NO AMMO")
		primary._primary_regenerate_ammo_timer = nil
	end
	if primary:get_ammo_remaining_in_clip() >= primary:get_ammo_max_per_clip() then
		primary._primary_regenerate_ammo_timer = nil
	end
	if primary._primary_regenerate_ammo_timer then
		primary._primary_regenerate_ammo_timer = primary._primary_regenerate_ammo_timer - dt
		if primary._primary_regenerate_ammo_timer < 0 then
			self:primary_add_ammo(dt * primary._primary_regen_rate)
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
	if GoonBase and GoonBase.SupportedVersion then
		Hooks:Call("PlayerStandardStartActionEquipWeapon", self, t)
	end
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

 
function PlayerStandard:_check_action_deploy_bipod(t, input, autodeploy)
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
	if bipod_part and bipod_part[1] and ( self._moving or self:running() or self:_on_zipline() or self:_is_throwing_projectile() or self:_is_meleeing() or self._camera_unit:base():is_stance_done() ~= true or self._state_data.in_air or self:in_steelsight() or can_deploy ~= true ) then
		if not autodeploy then
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
		bipod_unit = nil
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

function PlayerStandard:_start_action_reload_enter(t)
	if self._equipped_unit:base():can_reload() then
		managers.player:send_message_now(Message.OnPlayerReload, nil, self._equipped_unit)
		self:_interupt_action_steelsight(t)
		if not self.RUN_AND_RELOAD then
			self:_interupt_action_running(t)
		end
		if self._equipped_unit:base():reload_enter_expire_t() then
			local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
			self._ext_camera:play_redirect(Idstring("reload_enter_" .. (self._equipped_unit:base():weapon_tweak_data().use_reload or self._equipped_unit:base().name_id) ), speed_multiplier)
			self._state_data.reload_enter_expire_t = t + self._equipped_unit:base():reload_enter_expire_t() / speed_multiplier
			self._equipped_unit:base():tweak_data_anim_play("reload_enter", speed_multiplier)
			return
		end
		self:_start_action_reload(t)
	end
end

function PlayerStandard:_interupt_action_reload(t)
	if alive(self._equipped_unit) then
		self._equipped_unit:base():check_bullet_objects()
	end
	if self:_is_reloading() then
		self._equipped_unit:base():tweak_data_anim_stop("reload_enter")
		self._equipped_unit:base():tweak_data_anim_stop("reload")
		self._equipped_unit:base():tweak_data_anim_stop("reload_not_empty")
		self._equipped_unit:base():tweak_data_anim_stop("reload_exit")
	end
	self._state_data.reload_enter_expire_t = nil
	local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
	if self._state_data.reload_expire_t and self._equipped_unit:base():reload_exit_expire_t() and self._equipped_unit:base():reload_not_empty_exit_expire_t() then
		if self._equipped_unit:base():reload_interuptable() or not self._state_data.reload_expire_t then
			if self._equipped_unit:base():started_reload_empty() or self._equipped_unit:base():clip_empty() then
				self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_exit_expire_t() / speed_multiplier
			else
				self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_not_empty_exit_expire_t() / speed_multiplier
			end
		end
	end
	self._state_data.reload_expire_t = nil
	if not (self.RUN_AND_RELOAD and self._running) then
		self._state_data.reload_exit_expire_t = nil
	end
	managers.player:remove_property("shock_and_awe_reload_multiplier")
end

function PlayerStandard:_update_reload_timers(t, dt, input)
	if self._state_data.reload_enter_expire_t and t >= self._state_data.reload_enter_expire_t then
		self._state_data.reload_enter_expire_t = nil
		self:_start_action_reload(t)
	end
	if self._state_data.reload_expire_t then
		local interupt
		if self._equipped_unit:base():update_reloading(t, dt, self._state_data.reload_expire_t - t) then
			managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
			if self._queue_reload_interupt then
				self._queue_reload_interupt = nil
				interupt = true
			end
		end
		if t >= self._state_data.reload_expire_t or interupt then
			managers.player:remove_property("shock_and_awe_reload_multiplier")
			self._state_data.reload_expire_t = nil
			if self._equipped_unit:base():reload_exit_expire_t() and self._equipped_unit:base():reload_not_empty_exit_expire_t() then
				local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
				if self._equipped_unit:base():started_reload_empty() or self._equipped_unit:base():clip_empty() then
					if self._equipped_unit:base()._ignore_use_shotgun_reload or not self._equipped_unit:base()._use_shotgun_reload then
						if not interupt then
							self._equipped_unit:base():on_reload()
							self._dingdong = 0
						end
						self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_exit_expire_t() / speed_multiplier
						managers.statistics:reloaded()
						managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
						if input.btn_steelsight_state then
							self._steelsight_wanted = true
						end
					else
						self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_exit_expire_t() / speed_multiplier
						self._ext_camera:play_redirect(self.IDS_RELOAD_EXIT, speed_multiplier)
						self._equipped_unit:base():tweak_data_anim_play("reload_exit", speed_multiplier)
					end
				else
					if self._equipped_unit:base()._ignore_use_shotgun_reload or not self._equipped_unit:base()._use_shotgun_reload then
						if not interupt then
							self._equipped_unit:base():on_reload()
							self._dingdong = 0
						end
						self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_not_empty_exit_expire_t() / speed_multiplier
						managers.statistics:reloaded()
						managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
						if input.btn_steelsight_state then
							self._steelsight_wanted = true
						end
					else
						self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_not_empty_exit_expire_t() / speed_multiplier
						self._ext_camera:play_redirect(self.IDS_RELOAD_NOT_EMPTY_EXIT, speed_multiplier)
						self._equipped_unit:base():tweak_data_anim_play("reload_not_empty_exit", speed_multiplier)
					end
				end
			elseif self._equipped_unit then
				if not interupt then
					self._equipped_unit:base():on_reload()
					self._dingdong = 0
				end
				managers.statistics:reloaded()
				managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
				if input.btn_steelsight_state then
					self._steelsight_wanted = true
				elseif self.RUN_AND_RELOAD and self._running and not self._end_running_expire_t and not managers.player.RUN_AND_SHOOT then
					self._ext_camera:play_redirect(self.IDS_START_RUNNING)
				end
			end
		end
	end
	if self._state_data.reload_exit_expire_t and t >= self._state_data.reload_exit_expire_t then
		self._state_data.reload_exit_expire_t = nil
		if self._equipped_unit then
			managers.statistics:reloaded()
			managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
			if input.btn_steelsight_state then
				self._steelsight_wanted = true
			elseif self.RUN_AND_RELOAD and self._running and not self._end_running_expire_t and not managers.player.RUN_AND_SHOOT then
				self._ext_camera:play_redirect(self.IDS_START_RUNNING)
			end
			if self._equipped_unit:base().on_reload_stop then
				self._equipped_unit:base():on_reload_stop()
			end
		end
	end
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
		
		local action_forbidden = self:_is_reloading() or self:_changing_weapon() or self:_is_meleeing() or self._use_item_expire_t or self:_interacting() or self:_is_throwing_projectile() or self:_is_deploying_bipod() or (self._unit:inventory():equipped_selection() == 2 and primary._starwars and primary._primary_overheat_pen) or (self._unit:inventory():equipped_selection() == 1 and secondary._starwars and secondary._secondary_overheat_pen) or (self._end_burst and not weap_base._auto_burst) or self._burst_delay or self._melee_equip_weapon_expire_t or (self._end_running_expire_t and not managers.player.RUN_AND_SHOOT)

		if weap_base:in_burst_mode() and weap_base._force_burst and not action_forbidden and not weap_base:clip_empty() then
			self._sticky_burst = true
		else 
			self._sticky_burst = nil
		end
		
		self._dingdong = self._dingdong or 0
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
						self._dingdong = self._dingdong + 1
						if self._dingdong >= 5 then
							--managers.hud:show_hint({text = "No ammo",time = 2})
							self._dingdong = 0
						end
					end
				elseif weap_base.clip_empty and weap_base:clip_empty() then
					if self:_is_using_bipod() then
						if input.btn_primary_attack_press then
							weap_base:dryfire()
							self._dingdong = self._dingdong + 1
							if self._dingdong >= 5 then
								--managers.hud:show_hint({text = "Reload",time = 2})
								self._dingdong = 0
							end
						end
						self._equipped_unit:base():tweak_data_anim_stop("fire")
					elseif fire_mode == "single" then
						if input.btn_primary_attack_press then
							weap_base:dryfire()
							self._dingdong = self._dingdong + 1
							if self._dingdong >= 5 then
								--managers.hud:show_hint({text = "Reload",time = 2})
								self._dingdong = 0
							end
						end
					else
						self:_check_stop_shooting()
						if input.btn_primary_attack_press then
							weap_base:dryfire()
							self._equipped_unit:base():tweak_data_anim_stop("fire")
							self._dingdong = self._dingdong + 1
							if self._dingdong >= 5 then
								--managers.hud:show_hint({text = "Reload",time = 2})
								self._dingdong = 0
							end
						end
					end
				elseif self._running and not managers.player.RUN_AND_SHOOT then
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
								start_shooting = true
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
					dmg_mul = dmg_mul * managers.player:get_property("trigger_happy", 1)
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
						
						if self._weapon_hold then
							self._camera_unit:anim_state_machine():set_global(self._weapon_hold, 0)
						end
						self._weapon_hold = weap_base.weapon_hold and weap_base:weapon_hold() or weap_base:get_name_id()
						self._camera_unit:anim_state_machine():set_global(self._weapon_hold, 1)
						
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
						
							if not self._state_data.in_steelsight then
								if weap_base._second_gun and not weap_base._fire_second_gun_next then
								else
									weap_base:tweak_data_anim_play("fire", anim_speed_mult)
								end
							else
								if weap_base._second_gun and not weap_base._fire_second_gun_next then
								else
									if weap_base._second_gun then
										weap_base:tweak_data_anim_play("fire", anim_speed_mult)
									else
										weap_base:tweak_data_anim_play("fire_steelsight", anim_speed_mult) 
									end
								end
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
								self._ext_camera:play_redirect( (weap_base._no_singlefire_anim and self.IDS_RECOIL_EXIT) or (weap_base._ads_for_hipfire_anim and self.IDS_RECOIL_STEELSIGHT) or self.IDS_RECOIL, anim_speed_mult or 1)
							elseif weap_tweak_data.animations.recoil_steelsight and not weap_base._no_recoil_anim then
								self._ext_camera:play_redirect( (weap_base._no_singlefire_anim and self.IDS_RECOIL_EXIT) or (weap_base:is_second_sight_on() and self.IDS_RECOIL) or (weap_base._hipfire_for_ads_anim and self.IDS_RECOIL) or self.IDS_RECOIL_STEELSIGHT, anim_speed_mult or 1)
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
	local make_effect = tweak_data.blackmarket.melee_weapons[melee_entry].make_effect or nil
	local make_decal = tweak_data.blackmarket.melee_weapons[melee_entry].make_decal or nil
	local tase_chance = math.random()
	if melee_hit_ray then
		col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
	else
		col_ray = self:_calc_melee_hit_ray(t, sphere_cast_radius)
	end
	if col_ray and alive(col_ray.unit) then
		local damage, damage_effect = managers.blackmarket:equipped_melee_weapon_damage_info(charge_lerp_value)
		local damage_effect_mul = math.max(managers.player:upgrade_value("player", "melee_knockdown_mul", 1), managers.player:upgrade_value(self._equipped_unit:base():weapon_tweak_data().category, "melee_knockdown_mul", 1))
		damage = damage * managers.player:get_melee_dmg_multiplier()
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
					no_sound = false
				})
			end
		elseif self._on_melee_restart_drill and hit_unit:base() and hit_unit:base().is_drill then
			hit_unit:base():on_melee_hit(managers.network:session():local_peer():id())
		else
			if bayonet_melee then
				self._unit:sound():play("knife_hit_gen", nil, false)
			elseif special_weapon == "taser" and charge_lerp_value < tase_chance then
				self._unit:sound():play("melee_hit_gen", nil, false)
			else
				self:_play_melee_sound(melee_entry, "hit_gen")
			end
			if make_effect then
				managers.game_play_central:play_impact_sound_and_effects({
					col_ray = col_ray,
					no_decal = not make_decal and true,
					no_sound = true
				})
			else
				managers.game_play_central:play_impact_sound_and_effects({
					col_ray = col_ray,
					effect = Idstring("effects/payday2/particles/impacts/fallback_impact_pd2"),
					no_decal = not make_decal and true,
					no_sound = true
				})
			end
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
		if can_shield_knock and hit_unit:in_slot(8) and alive(hit_unit:parent()) and not hit_unit:parent():character_damage():is_immune_to_shield_knockback() then
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

function PlayerStandard:_update_melee_timers(t, input)
	if self._state_data.meleeing then
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
	if self._state_data.meleeing then
		local lerp_value = self:_get_melee_charge_lerp_value(t)
		self._camera_unit:anim_state_machine():set_parameter(PlayerStandard.IDS_MELEE_CHARGE_STATE, "charge_lerp", math.bezier({
			0,
			0,
			1,
			1
		}, lerp_value))
		if self._state_data.melee_charge_shake then
			self._ext_camera:shaker():set_parameter(self._state_data.melee_charge_shake, "amplitude", math.bezier({
				0,
				0,
				1,
				1
			}, lerp_value))
		end
	end
	if self._state_data.melee_damage_delay_t and t >= self._state_data.melee_damage_delay_t then
		self:_do_melee_damage(t, nil, self._state_data.melee_hit_ray)
		self._state_data.melee_damage_delay_t = nil
		self._state_data.melee_hit_ray = nil
	end
	if self._state_data.melee_attack_allowed_t and t >= self._state_data.melee_attack_allowed_t then
		self._state_data.melee_start_t = t
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		local melee_charge_shaker = tweak_data.blackmarket.melee_weapons[melee_entry].melee_charge_shaker or "player_melee_charge"
		self._state_data.melee_charge_shake = self._ext_camera:play_shaker(melee_charge_shaker, 0)
		self._state_data.melee_attack_allowed_t = nil
	end
	
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
	if self._state_data.melee_repeat_expire_t and t >= self._state_data.melee_repeat_expire_t then
		self._state_data.melee_repeat_expire_t = nil
		if input.btn_meleet_state then
			self._state_data.melee_charge_wanted = not instant_hit and true
		end
	end
	if self._state_data.melee_expire_t and t >= self._state_data.melee_expire_t then
		local tweak_data = self._equipped_unit:base():weapon_tweak_data()
		if not instant_hit then
			self._melee_equip_weapon_expire_t = tweak_data.timers.equip or 0.7
		end
		self._state_data.melee_expire_t = nil
		self._state_data.melee_repeat_expire_t = nil
		self:_stance_entered()
		if self._equipped_unit and input.btn_steelsight_state then
			self._steelsight_wanted = true
		end
	end
end

--Function by LazyOzzy
--Override
function PlayerStandard:_check_action_weapon_firemode(t, input)
	local wbase = self._equipped_unit:base()
	if input.btn_weapon_firemode_press and wbase.toggle_firemode then
		--self:_check_stop_shooting()
		if wbase:toggle_firemode() then
			if wbase:in_burst_mode() then
				managers.hud:set_teammate_weapon_firemode_burst(self._unit:inventory():equipped_selection())
			else
				managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), wbase:fire_mode())
			end
		end
	end
end
	

