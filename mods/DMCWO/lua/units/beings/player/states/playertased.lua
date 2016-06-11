--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

function PlayerTased:_check_action_primary_attack(t, input)
	local new_action
	local action_forbidden = self:chk_action_forbidden("primary_attack")
	local action_wanted = input.btn_primary_attack_state or self._sticky_burst
	
	local weap_base = self._equipped_unit:base()
	local secondary = self._unit:inventory():unit_by_selection(1):base()
	local primary = self._unit:inventory():unit_by_selection(2):base()
	local burst = weap_base and ((weap_base._track_burst and weap_base._burst_size - weap_base._track_burst) or weap_base._burst_size)
			
	if weap_base:in_burst_mode() and self._sticky_burst then
		input.btn_primary_attack_state = true
	end
	
	if weap_base:in_burst_mode() and self._end_burst and input.btn_primary_attack_press then
		self._end_burst = nil
	end
		
	if weap_base:in_burst_mode() then
		if weap_base._shotsfired >= burst then
			--log("STOP")
			self._sticky_burst = nil
			self._end_burst = true
			if weap_base._burst_delay then
				self._burst_delay = weap_base._burst_delay
			end		
		elseif weap_base._shotsfired > 0 and weap_base._shotsfired < burst and not self._shooting then
			if weap_base._burst_delay and not weap_base._no_reset_burst then
				self._burst_delay = weap_base._burst_delay
			end	
		end
	elseif not weap_base:in_burst_mode() and weap_base._fire_rate_init_count then
		if not self._shooting and weap_base._shotsfired > 0 and weap_base._shotsfired <= weap_base._fire_rate_init_count then
			if weap_base._burst_delay then
				self._burst_delay = weap_base._burst_delay
			end	
		end
	end
	
	action_forbidden = action_forbidden or self:_is_reloading() or self:_changing_weapon() or self._melee_expire_t or self._use_item_expire_t or self:_interacting() or alive(self._counter_taser_unit) or (self._unit:inventory():equipped_selection() == 2 and primary._starwars and primary._primary_overheat_pen) or (self._unit:inventory():equipped_selection() == 1 and secondary._starwars and secondary._secondary_overheat_pen) or (weap_base:in_burst_mode() and self._end_burst and not weap_base._auto_burst) or self._burst_delay or (self._end_running_expire_t and not self.RUN_AND_SHOOT)
	
	if weap_base:in_burst_mode() and weap_base._force_burst and not action_forbidden and not weap_base:clip_empty() then
		self._sticky_burst = true
	else 
		self._sticky_burst = nil
	end
	
	if action_wanted then
		if not action_forbidden then
			self._queue_reload_interupt = nil
			self._ext_inventory:equip_selected_primary(false)
			if self._equipped_unit then
				local weap_base = self._equipped_unit:base()
				local fire_mode = weap_base:fire_mode()
				if weap_base:out_of_ammo() then
					if input.btn_primary_attack_press then
						weap_base:dryfire()
					end
				elseif weap_base.clip_empty and weap_base:clip_empty() then
					if fire_mode == "single" and input.btn_primary_attack_press then
						weap_base:dryfire()
					end
				elseif self._num_shocks > 1 and weap_base.can_refire_while_tased and not weap_base:can_refire_while_tased() then
				elseif self._running then
					self:_interupt_action_running(t)
				else
					if not self._shooting and weap_base:start_shooting_allowed() then
						local start = fire_mode == "single" and input.btn_primary_attack_press
						start = start or fire_mode ~= "single" and input.btn_primary_attack_state
						if start then
							weap_base:start_shooting()
							self._camera_unit:base():start_shooting()
							if not self._state_data.in_steelsight or not weap_base:tweak_data_anim_play("fire_steelsight", weap_base:fire_rate_multiplier()) then
								weap_base:tweak_data_anim_play("fire", weap_base:fire_rate_multiplier())
							end
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
							fired = weap_base:trigger_pressed(self._ext_camera:position(), self._ext_camera:forward(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
							if weap_base:fire_on_release() then
								if weap_base.set_tased_shot then
									weap_base:set_tased_shot(true)
								end
								fired = weap_base:trigger_released(self._ext_camera:position(), self._ext_camera:forward(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
								if weap_base.set_tased_shot then
									weap_base:set_tased_shot(false)
								end
							end
						end
					elseif input.btn_primary_attack_state then
						fired = weap_base:trigger_held(self._ext_camera:position(), self._ext_camera:forward(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
					end
					new_action = true
					if fired then
						local weap_tweak_data = tweak_data.weapon[weap_base:get_name_id()]
						local recoil_multiplier = weap_base:recoil() * weap_base:recoil_multiplier() + weap_base:recoil_addend()
						local up, down, left, right = unpack(weap_tweak_data.kick[self._state_data.in_steelsight and "steelsight" or self._state_data.ducking and "crouching" or "standing"])
						self._camera_unit:base():recoil_kick(up * recoil_multiplier, down * recoil_multiplier, left * recoil_multiplier, right * recoil_multiplier)
						local spread_multiplier = weap_base:spread_multiplier()
						self._equipped_unit:base():tweak_data_anim_stop("unequip")
						self._equipped_unit:base():tweak_data_anim_stop("equip")
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
						managers.hud:set_ammo_amount(weap_base:selection_index(), weap_base:ammo_info())
						if self._ext_network then
							local impact = not fired.hit_enemy
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
	if not new_action and self._shooting then
		self._equipped_unit:base():stop_shooting()
		self._camera_unit:base():stop_shooting()
	end
	return new_action
end


