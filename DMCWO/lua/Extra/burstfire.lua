--[[
Credits to LazyOzzy 
Used with permission
]]

if RequiredScript == "lib/units/weapons/newraycastweaponbase" then

	local init_original = NewRaycastWeaponBase.init
	local _update_stats_values_original = NewRaycastWeaponBase._update_stats_values
	local fire_rate_multiplier_original = NewRaycastWeaponBase.fire_rate_multiplier
	local on_enabled_original = NewRaycastWeaponBase.on_enabled
	local on_disabled_original = NewRaycastWeaponBase.on_disabled
	local start_reload_original = NewRaycastWeaponBase.start_reload
	local fire_original = NewRaycastWeaponBase.fire
	local toggle_firemode_original = NewRaycastWeaponBase.toggle_firemode
	
	function NewRaycastWeaponBase:init(...)
		init_original(self, ...)
		
		if not self:is_npc() then
			self._burst_rounds_remaining = 0
			self._track_burst = nil
			self._tracking = nil
		end
	end
	
	--The "_update_stats_values" and "fire_rate_multiplier" functions were merged with gat_physics.lua
	
	function NewRaycastWeaponBase:on_enabled(...)
		self:cancel_burst(true)
		return on_enabled_original(self, ...)
	end
	
	function NewRaycastWeaponBase:on_disabled(...)
		self:cancel_burst(true)
		return on_disabled_original(self, ...)
	end
	
	function NewRaycastWeaponBase:start_reload(...)
		self:cancel_burst(true)
		return start_reload_original(self, ...)
	end
	
	function NewRaycastWeaponBase:fire(...)
		local result = fire_original(self, ...)
		
		if not self._is_akimbo and result and self:in_burst_mode() then		
			if self:clip_empty() then
				self:cancel_burst(true)
			else
				if self._no_reset_burst and self._track_burst then
					self._burst_rounds_remaining = self._track_burst
					self._track_burst = nil
					self._tracking = nil
				end
				self._burst_rounds_remaining = (self._burst_rounds_remaining <= 0 and self._burst_size or self._burst_rounds_remaining) - 1
			end
		end
		
		return result
	end
	
	--Semi-override
	function NewRaycastWeaponBase:toggle_firemode(...)
		return self._has_burst_fire and not self._locked_fire_mode and self:_check_toggle_burst() or toggle_firemode_original(self, ...)
	end
	
	function NewRaycastWeaponBase:_check_toggle_burst()
		if self:in_burst_mode() then
			self:_set_burst_mode(false)
			return true
		elseif (self._fire_mode == Idstring("single")) or (self._fire_mode == Idstring("auto") and not self:can_toggle_firemode()) then
			self:_set_burst_mode(true)
			return true
		end
	end
 
	function NewRaycastWeaponBase:_set_burst_mode(status, skip_sound)
		self._in_burst_mode = status
		self._fire_mode = Idstring(status and "single" or self._has_auto and "auto" or "single")
		if not skip_sound then
			self._sound_fire:post_event(status and "wp_auto_switch_on" or self._has_auto and "wp_auto_switch_on" or "wp_auto_switch_off")
		end
		self:cancel_burst(true)
	end
	
	function NewRaycastWeaponBase:can_use_burst_mode()
		return self._has_burst_fire
	end
	
	function NewRaycastWeaponBase:in_burst_mode()
		return self._fire_mode == Idstring("single") and self._in_burst_mode
	end
	
	function NewRaycastWeaponBase:burst_rounds_remaining()
		return self._burst_rounds_remaining > 0 and self._burst_rounds_remaining or false
	end
	
	function NewRaycastWeaponBase:cancel_burst(force)
		if self._no_reset_burst and not self._track_burst then
			self._track_burst = self._burst_rounds_remaining
		end
		if self:clip_empty() and self:in_burst_mode() and self._track_burst and not self._tracking then
			if self._track_burst == 0 then
				self._track_burst = self._burst_size - 1
			else
				self._track_burst = self._track_burst - 1
			end
			self._tracking = true
			if self._track_burst < 0 then
				self._track_burst = 0
			end
		end
		if self._adaptive_burst_size or force then
			self._burst_rounds_remaining = 0
		end
	end
	
elseif RequiredScript == "lib/units/weapons/akimboweaponbase" then

	local init_original = AkimboWeaponBase.init
	
	--[[
	function AkimboWeaponBase:init(...)
		init_original(self, ...)
		
		if not self:is_npc() then
			self._is_akimbo = true
			self:_set_burst_mode(not self._manual_fire_second_gun, true)
			self._native_fire_rate = tweak_data.weapon[self._name_id].fire_mode_data.fire_rate
		end
	end
	]]
	
	function AkimboWeaponBase:init(...)
		init_original(self, ...)
		
		if not self:is_npc() then
			self._is_akimbo = true
			self._native_fire_rate = tweak_data.weapon[self._name_id].fire_mode_data.fire_rate
		end
	end
	
	function AkimboWeaponBase:fire(...)
		self._second_turn = not self._second_turn
		local result
		
		if not self._second_turn then
			result = AkimboWeaponBase.super.fire(self, ...)
		elseif alive(self._second_gun) then
			result = self._second_gun:base().super.fire(self._second_gun:base(), ...)
			if result then
				self._second_gun:base():_fire_sound()
				managers.hud:set_ammo_amount(self:selection_index(), self:ammo_info())
				self._second_gun:base():tweak_data_anim_play("fire")
			end
		end
		
		if result and self:in_burst_mode() then
			if self:clip_empty() then
				self._burst_rounds_remaining = 0
			else			
				self._burst_rounds_remaining = (self._burst_rounds_remaining <= 0 and self._burst_size or self._burst_rounds_remaining) - 1
				self._burst_expire_t = Application:time() + self._native_fire_rate / self:fire_rate_multiplier() + 0.1
			end
		end
		
		return result
	end
 
	--Override
--[[
 	function AkimboWeaponBase:toggle_firemode()
		if self._has_burst_fire then
			self._manual_fire_second_gun = not self._manual_fire_second_gun
			tweak_data.weapon[self._name_id].fire_mode_data.fire_rate = self._native_fire_rate / (self._manual_fire_second_gun and 2 or 1)
			self:_set_burst_mode(not self._manual_fire_second_gun, true)
			return true
		end
	end 
	]]

elseif RequiredScript == "lib/units/beings/player/states/playerstandard" then

	local update_original = PlayerStandard.update
	local _check_action_primary_attack_original = PlayerStandard._check_action_primary_attack
 
	function PlayerStandard:update(t, ...)
		update_original(self, t, ...)
		self:_update_burst_fire(t)
	end
	
	function PlayerStandard:_check_action_primary_attack(t, input, ...)
		if self._trigger_down and not input.btn_primary_attack_state then
			self._equipped_unit:base():cancel_burst()
		end
		self._trigger_down = input.btn_primary_attack_state
		
		return _check_action_primary_attack_original(self, t, input, ...)
	end
	
	--Override
	function PlayerStandard:_check_action_weapon_firemode(t, input)
		local wbase = self._equipped_unit:base()
		if input.btn_weapon_firemode_press and wbase.toggle_firemode then
			self:_check_stop_shooting()
			if wbase:toggle_firemode() then
				if wbase:in_burst_mode() then
					managers.hud:set_teammate_weapon_firemode_burst(self._unit:inventory():equipped_selection())
				else
					managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), wbase:fire_mode())
				end
			end
		end
	end
	
	
	function PlayerStandard:_update_burst_fire(t)
		if alive(self._equipped_unit) and self._equipped_unit:base():burst_rounds_remaining() then
			self:_check_action_primary_attack(t, { btn_primary_attack_state = true, btn_primary_attack_press = true })
		end
	end
	
elseif RequiredScript == "lib/managers/hudmanagerpd2" then

	HUDManager._USE_BURST_MODE = true	--Custom HUD compatibility
 
	function HUDManager:set_teammate_weapon_firemode_burst(id)
		self._teammate_panels[HUDManager.PLAYER_PANEL]:set_weapon_firemode_burst(id)
	end

elseif RequiredScript == "lib/managers/hud/hudteammate" then
	
	HUDTeammate.set_weapon_firemode_burst = HUDTeammate.set_weapon_firemode_burst or function(self, id, firemode, burst_fire)	--Custom HUD compatibility
		local is_secondary = id == 1
		local secondary_weapon_panel = self._player_panel:child("weapons_panel"):child("secondary_weapon_panel")
		local primary_weapon_panel = self._player_panel:child("weapons_panel"):child("primary_weapon_panel")
		local weapon_selection = is_secondary and secondary_weapon_panel:child("weapon_selection") or primary_weapon_panel:child("weapon_selection")
		if alive(weapon_selection) then
			local firemode_single = weapon_selection:child("firemode_single")
			local firemode_auto = weapon_selection:child("firemode_auto")
			if alive(firemode_single) and alive(firemode_auto) then
				firemode_single:show()
				firemode_auto:show()
			end
		end
	end
	
end