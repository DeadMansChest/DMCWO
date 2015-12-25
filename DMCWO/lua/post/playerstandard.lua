--[[
v1.5
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
		
		local speed = tweak_data.blackmarket.melee_weapons[melee_entry].speed_mult or 1
		
		local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
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
			self._state_data.melee_damage_delay_t = t + math.min(melee_damage_delay, tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t)
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

--}
end