--[[
v1.6
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/units/beings/player/playerdamage" then
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
		old_start_action_running(self, ...)
	end

	function PlayerStandard:full_steelsight()
		return self._state_data.in_steelsight and self._camera_unit:base():is_stance_done()
	end
	
	function PlayerStandard:_start_action_unequip_weapon(t, data)
		local speed_multiplier = self:_get_swap_speed_multiplier()
		local tweak_data = self._equipped_unit:base():weapon_tweak_data()
		speed_multiplier = speed_multiplier / (tweak_data.unequip or 1)
		
		self._equipped_unit:base():tweak_data_anim_stop("equip")
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
		local duration_multiplier = self._state_data.in_steelsight and 1 / self._equipped_unit:base():enter_steelsight_speed_multiplier() or 1
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
		local action_wanted = input.btn_primary_attack_state or input.btn_primary_attack_release
		if action_wanted then
			local action_forbidden = self:_is_reloading() or self:_changing_weapon() or self:_is_meleeing() or self._use_item_expire_t or self:_interacting() or self:_is_throwing_projectile() or self:_is_deploying_bipod()
			if not action_forbidden then
				self._queue_reload_interupt = nil
				self._ext_inventory:equip_selected_primary(false)
				if self._equipped_unit then
					local weap_base = self._equipped_unit:base()
					local fire_mode = weap_base:fire_mode()
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
									if fire_mode == "auto" then
										self._unit:camera():play_redirect(self.IDS_RECOIL_ENTER)
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
							
							if not self._state_data.in_steelsight or not weap_base:tweak_data_anim_play("fire_steelsight", anim_speed_mult) then
									weap_base:tweak_data_anim_play("fire", anim_speed_mult)
							end
							
							anim_speed_mult = ( weap_base._anim_speed_mult and weap_base:fire_rate_multiplier() ) or 1
							if weap_base:in_burst_mode() and weap_base._burst_anim_speed_mult then
								anim_speed_mult = weap_base._burst_anim_speed_mult
							end
							if weap_base._anim_speed_mult then
								anim_speed_mult = anim_speed_mult * weap_base._anim_speed_mult
							end
							
							if fire_mode == "single" and weap_base:get_name_id() ~= "saw" then
								if not self._state_data.in_steelsight then
									self._ext_camera:play_redirect( weap_base._no_singlefire_anim and self.IDS_RECOIL_EXIT or self.IDS_RECOIL, anim_speed_mult or 1)
								elseif weap_tweak_data.animations.recoil_steelsight then
									self._ext_camera:play_redirect( (weap_base._no_singlefire_anim and self.IDS_RECOIL_EXIT) or (weap_base:is_second_sight_on() and self.IDS_RECOIL) or self.IDS_RECOIL_STEELSIGHT, anim_speed_mult or 1)
								end
							end
							
							if weap_base:in_burst_mode() and weap_base._no_ads_burst == true then
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
		end
		if not new_action then
			self:_check_stop_shooting()
		end
		return new_action
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
--}
end