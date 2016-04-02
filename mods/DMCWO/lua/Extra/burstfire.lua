--[[
Credits to LazyOzzy 
Used with permission
]]

if RequiredScript == "lib/units/weapons/newraycastweaponbase" then
			
	function NewRaycastWeaponBase:in_burst_mode()
		return self._fire_mode == Idstring("auto") and self._in_burst_mode
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
				self._shotsfired = self._shotsfired + 1
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
 
	--[[
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
	]]
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
	--[[
	function PlayerStandard:_update_burst_fire(t)
		if alive(self._equipped_unit) and self._equipped_unit:base():burst_rounds_remaining() and not self._equipped_unit:base()._auto_anim_burst then
			self:_check_action_primary_attack(t, { btn_primary_attack_state = true, btn_primary_attack_press = true })
		elseif alive(self._equipped_unit) and self._equipped_unit:base():burst_rounds_remaining() and self._equipped_unit:base()._auto_anim_burst then
			log("FASDFDFASAASAFFDAAFASFAFADSFDASFADFADFADSASD")
			self:_check_action_primary_attack(t, { btn_primary_attack_state = true })
		end
	end
	]]
	
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