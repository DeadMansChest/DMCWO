--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

function NewRaycastWeaponBase:weapon_hold()
	if self:in_burst_mode() and self._burst_fire_weapon_hold then
		return self._burst_fire_weapon_hold
	else
		return self:weapon_tweak_data().weapon_hold
	end
end

local old_update_stats_values = NewRaycastWeaponBase._update_stats_values
local ids_single = Idstring("single")
local ids_auto = Idstring("auto")
local track_weight = track_weight or nil
function NewRaycastWeaponBase:_update_stats_values()
	old_update_stats_values(self)
	
	--Ozzy's burstfire stuff
	if not self:is_npc() then
		self._has_auto = not self._locked_fire_mode and (self:can_toggle_firemode() or self:weapon_tweak_data().FIRE_MODE == "auto") and true or false
		self._has_burst_fire = self._is_akimbo or (self:can_toggle_firemode() or self:weapon_tweak_data().BURST_FIRE) and self:weapon_tweak_data().BURST_FIRE ~= false
		self._burst_size = (self._is_akimbo and 2) or self:weapon_tweak_data().BURST_FIRE or 3
		
		--self._adaptive_burst_size = self._adaptive_burst_size or self:weapon_tweak_data().ADAPTIVE_BURST_SIZE or true
		--self._auto_anim_burst = self:weapon_tweak_data().AUTO_ANIM_BURST or nil
	end
		
	self._ignore_use_shotgun_reload = self:weapon_tweak_data().ignore_use_shotgun_reload or nil
	self._can_toggle_burst = self:weapon_tweak_data().CAN_TOGGLE_BURST or nil
	self._burst_fire_rate_multiplier = self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER or 1
	self._force_burst = self:weapon_tweak_data().force_burst or nil
	self._no_reset_burst = DMCWO.ar15_burst_suckage == true and self:weapon_tweak_data().NO_RESET_BURST or nil
	self._burst_delay = self:weapon_tweak_data().BURST_DELAY or nil
	self._no_ads_burst = self:weapon_tweak_data().NO_ADS_BURST or false
	self._burst_only = nil
	self._auto_burst = self:weapon_tweak_data().AUTO_BURST or nil
	self._burst_fire_recoil_mult = self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER or nil
	self._burst_fire_hip_mult = self:weapon_tweak_data().BURST_FIRE_HIP_MULTIPLIER or nil
	self._burst_fire_weapon_hold = self:weapon_tweak_data().BURST_FIRE_WEAPON_HOLD or nil
	
	self._no_ads_auto = self:weapon_tweak_data().NO_ADS_AUTO or false
	self._auto_fire_rate_multiplier = self:weapon_tweak_data().AUTO_FIRE_RATE_MULTIPLIER or nil
	self._auto_fire_recoil_mult = self:weapon_tweak_data().AUTO_FIRE_RECOIL_MULTIPLIER or nil
	self._auto_fire_hip_mult = self:weapon_tweak_data().AUTO_FIRE_HIP_MULTIPLIER or nil
		
	self._anim_delay = self:weapon_tweak_data().anim_delay or nil
	self._anim_speed_mult = self:weapon_tweak_data().anim_speed_mult or nil
	self._burst_anim_speed_mult = self:weapon_tweak_data().burst_anim_speed_mult or nil
	self._auto_anim_speed_mult = self:weapon_tweak_data().auto_anim_speed_mult or nil
	self._no_singlefire_anim = self:weapon_tweak_data().no_singlefire_anim or nil
	self._no_auto_anims = self:weapon_tweak_data().no_auto_anims or nil
	
	self._ads_for_hipfire_anim = self:weapon_tweak_data().ads_for_hipfire_anim or nil
	self._hipfire_for_ads_anim = self:weapon_tweak_data().hipfire_for_ads_anim or nil
	
	self._damage_bonus_range = self:weapon_tweak_data().damage_bonus_range or nil
	if self._damage_bonus_range then 
		self._damage_bonus_range = self._damage_bonus_range * 100
		self._damage_bonus = self:weapon_tweak_data().damage_bonus or 2
	end
	self._damage_near = (self:weapon_tweak_data().damage_near or 10) * 100 -- 10 meters
	self._damage_far = (self:weapon_tweak_data().damage_far or 80) * 100 -- 80 meters
	self._damage_min = self:weapon_tweak_data().damage_min or 0.0 -- 30 damage
	self._supp_range_mult = nil
	self._damage_near_set = nil
	self._damage_far_set = nil
	self._damage_min_set = nil
	
	self._flame_max_range = self:weapon_tweak_data().flame_max_range or nil
	
	self._recoil_speed = self:weapon_tweak_data().r_speed or 40
	self._center_speed = self:weapon_tweak_data().c_speed or 6
	self._recoil_recover = self:weapon_tweak_data().r_recover or 1
	
	self._movement_penalty = self:weapon_tweak_data().weapon_movement_penalty or tweak_data.upgrades.weapon_movement_penalty[self:weapon_tweak_data().category] or 1
			
	self._min_shield_pen_dam = self:weapon_tweak_data().min_shield_pen_dam or nil
	
	self._base_reload_speed_mult = self:weapon_tweak_data().reload_speed_mult or 1
	self._mod_reload_speed_mult = 1
	
	self._ads_speed_mult = 1
	
	self._rof_mult = 1
	
	self._penetration_power = self:weapon_tweak_data().penetration_power or 0.5
	self._penetration_damage = self:weapon_tweak_data().penetration_damage or 0.5
	
	self._starwars = nil
	self._is_tracer = nil
	
	self._has_ap = nil
	self._has_hp = nil
	
	self._use_sound = nil
	
	self._block_eq_aced = nil
			
	self._shield_damage = math.clamp(self:weapon_tweak_data().shield_damage, 0, 1) or nil
	
	self._hipfire_mod = 1
	
	self._hs_mult = self:weapon_tweak_data().hs_mult or 1
	
	self._no_crits = self:weapon_tweak_data().no_crits or false
	self._block_b_storm = self:weapon_tweak_data().block_b_storm or nil
	
	self._stocker = 1
			
	self._rms = self:weapon_tweak_data().rms or 1
	self._ams = self:weapon_tweak_data().ams or 0.5
	self._ads_sms = self:weapon_tweak_data().ads_sms or 1
	self._sms = self:weapon_tweak_data().sms or 1
	
	self._dual_mags = nil
	self._ignore_dmg_boosts = nil
	
	self._shotsfired = 0
	self._fire_rate_init_count = self:weapon_tweak_data().fire_rate_init_count or nil
	self._fire_rate_init_mult = self:weapon_tweak_data().fire_rate_init_mult or 1
	
	self._jam_shotsfired = 0
	self._jam_it_in = self._jam_it_in or 0.0001
	self._stop_calc = false
	self._jam_start = self:weapon_tweak_data().jam_start or nil
	self._jam_add = self:weapon_tweak_data().jam_add or 0.00001 
	self._jam_cap = self:weapon_tweak_data().jam_cap or .025 
	self._jam_cd = self:weapon_tweak_data().jam_cd or 20
	
	self._ads_fire_only = self:weapon_tweak_data().ads_fire_only or false 
	
	self._no_recoil_anim = nil
	
	self._regen_rate = nil
	self._regen_rate_overheat = nil
	self._regen_ammo_time = nil
	self._overheat_pen = nil
	
	self._override_factory_id = self:weapon_tweak_data().override_factory_id or nil 
	
	self._hip_fire_rate_inc = self:weapon_tweak_data().category == "shotgun" and managers.player:upgrade_value("shotgun", "hip_rate_of_fire", 0)
	
	self._warsaw = self:weapon_tweak_data().warsaw
	self._nato = self:weapon_tweak_data().nato
	
	self._large_tracers = self:weapon_tweak_data().large_tracers
			
	local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
	for part_id, stats in pairs(custom_stats) do
		if stats.movement_speed then
			if self._movement_penalty * stats.movement_speed > 1 then
				self._movement_penalty = 1
			else
				self._movement_penalty = self._movement_penalty * stats.movement_speed
			end
		end
		if stats.hs_mult then
			if self._hs_mult * stats.hs_mult > 1 then
				self._hs_mult = 1
			else
				self._hs_mult = stats.hs_mult
			end
		end
		if stats.damage_near_set then
			self._damage_near_set = true
			self._damage_near = stats.damage_near_set * 100
		end
		if stats.damage_far_set then
			self._damage_far_set = true
			self._damage_far = stats.damage_far_set * 100
		end
		if stats.damage_min_set then
			self._damage_min_set = true
			self._damage_min = stats.damage_min_set
		end
		if stats.damage_near_mul and not stats.damage_near_set then
			self._damage_near = self._damage_near * stats.damage_near_mul
			if self._damage_bonus_range then 
				self._damage_bonus_range = self._damage_bonus_range * stats.damage_near_mul
			end
		end
		if stats.damage_far_mul and not self._damage_far_set then
			self._damage_far = self._damage_far * stats.damage_far_mul
		end
		if stats.supp_range_mult then
			self._supp_range_mult = stats.supp_range_mult
		end
		if stats.damage_min_mul and not self._damage_min_set then
			self._damage_min = self._damage_min * stats.damage_min_mul
		end
		if stats.reload_speed_mult then
			self._mod_reload_speed_mult = self._mod_reload_speed_mult * stats.reload_speed_mult
		end
		if stats.ads_speed_mult then
			self._ads_speed_mult = self._ads_speed_mult * stats.ads_speed_mult
		end
		if stats.penetration_power_mult then
			self._penetration_power = self._penetration_power * stats.penetration_power_mult
		end
		if stats.penetration_damage_mult then
			self._penetration_damage = self._penetration_damage * stats.penetration_damage_mult
		end
		if stats.starwars then
			self._starwars = true
		end
		if stats.is_tracer then
			self._is_tracer = true
		end
		if stats.has_ap then
			self._has_ap = true
		elseif stats.has_hp then
			self._has_hp = true
		end
		if stats.has_burst_fire then
			self._has_burst_fire = stats.has_burst_fire
		end
		if stats.use_sound then
			self._use_sound = stats.use_sound
		end
		if stats.can_toggle_burst then
			self._can_toggle_burst = stats.can_toggle_burst
		end
		if stats.can_switch_selector then
			self._can_switch_selector = stats.can_switch_selector
		end
		if stats.block_eq_aced then
			self._block_eq_aced = stats.block_eq_aced
		end
		if stats.rof_mult then
			self._rof_mult = self._rof_mult * stats.rof_mult
		end
		if stats.burst_rof_mult then
			self._burst_fire_rate_multiplier = self._burst_fire_rate_multiplier * stats.burst_rof_mult
		end
		if stats.can_shoot_through_enemy then
			self._can_shoot_through_enemy = stats.can_shoot_through_enemy
		end
		if stats.can_shoot_through_wall then
			self._can_shoot_through_wall = stats.can_shoot_through_wall
		end
		if stats.can_shoot_through_shield then
			self._can_shoot_through_shield = stats.can_shoot_through_shield
		end
		if stats.shield_damage then
			self._shield_damage = math.clamp(self._shield_damage + stats.shield_damage, 0, 1)
		end
		if stats.hipfire_mod then
			self._hipfire_mod = self._hipfire_mod * stats.hipfire_mod 
		end
		if stats.r_recover then
			self._recoil_recover = self._recoil_recover * stats.r_recover 
		end
		if stats.no_crits then
			self._no_crits = true
		end
		if stats.stocker then
			self._stocker = self._stocker * stats.stocker
		end
		if stats.dual_mags then
			self._dual_mags = true
			self._alternate_reload = true
		end
		if stats.ignore_dmg_boosts then
			self._ignore_dmg_boosts = true
		end
		if stats.burst_size then
			self._burst_size = stats.burst_size
		end
		if stats.force_burst then
			self._force_burst = true
		end
		if stats.burst_only then
			self._burst_only = true
		end
		if stats.burst_delay then
			self._burst_delay = stats.burst_delay
		end
		if stats.auto_burst then
			self._auto_burst = stats.burst_delay
		end
		if stats.no_recoil_anim  then
			self._no_recoil_anim = true
		end
		if stats.regen_rate then
			self._regen_rate = stats.regen_rate
		end	
		if stats.regen_rate_overheat then
			self._regen_rate_overheat = stats.regen_rate_overheat
		end	
		if stats.regen_ammo_time then
			self._regen_ammo_time = stats.regen_ammo_time
		end	
		if stats.overheat_pen then
			self._overheat_pen = stats.overheat_pen
		end	
		if stats.fire_rate_init_count then
			self._fire_rate_init_count = stats.fire_rate_init_count
		end
		if stats.fire_rate_init_mult  then
			self._fire_rate_init_mult = stats.fire_rate_init_mult
		end
		if stats.ams_mult then
			self._ams = self._ams * stats.ams_mult
		end
		if stats.sms_mult then
			self._sms = self._sms * stats.sms_mult
		end
		if stats.rms_mult then
			self._rms = self._rms * stats.rms_mult
		end
		if stats.ads_sms_mult then
			self._ads_sms = self._ads_sms * stats.ads_sms_mult
		end
		if self._flame_max_range and stats.flame_max_range_set then
			self._flame_max_range = stats.flame_max_range_set
			NewRaycastWeaponBase.flame_max_range = stats.flame_max_range_set
		end
		if stats.block_b_storm == true then
			self._block_b_storm = true
		end
		if stats.ignore_region_pickup then
			self._ignore_region_pickup = true
		end
		if stats.switch_nato then
			self._warsaw = false
			self._nato = true
		end
		if stats.switch_warsaw then
			self._warsaw = true
			self._nato = false
		end
		if stats.large_tracers then
			self._large_tracers = true
		end
		if stats.ammo_pickup_min_set then
			self._ammo_pickup[1] = stats.ammo_pickup_min_set
		end
		if stats.ammo_pickup_max_set then
			self._ammo_pickup[2] = stats.ammo_pickup_max_set
		end
		if stats.override_factory_id then
			self._override_factory_id = stats.override_factory_id
		end
		if stats.disable_steelsight_stance then
			if self:weapon_tweak_data().animations then
				self:weapon_tweak_data().animations.has_steelsight_stance = false
			end
		end
		if tweak_data.weapon.factory.parts[part_id].type ~= "ammo" then
			if stats.ammo_pickup_min_mul then
				self._ammo_data.ammo_pickup_min_mul = self._ammo_data.ammo_pickup_min_mul and self._ammo_data.ammo_pickup_min_mul * stats.ammo_pickup_min_mul or stats.ammo_pickup_min_mul
			end
			if stats.ammo_pickup_max_mul then
				self._ammo_data.ammo_pickup_max_mul = self._ammo_data.ammo_pickup_max_mul and self._ammo_data.ammo_pickup_max_mul * stats.ammo_pickup_max_mul or stats.ammo_pickup_max_mul
			end
			if stats.fire_dot_data then
				self._ammo_data.fire_dot_data = stats.fire_dot_data
			end
		end
	end
	
	if self._supp_range_mult then
		self._supp_range_mult = math.clamp( self._supp_range_mult * (managers.player:upgrade_value("weapon", "supp_range_buff", 1) or 1) ,0 ,1 )
		self._damage_near = self._damage_near * self._supp_range_mult
		self._damage_far = self._damage_far * self._supp_range_mult
	end
	
	if not self._ignore_region_pickup then	
	local pickup_type = tweak_data.levels:get_ai_group_type()	
		if pickup_type == "america" then
			if self._nato  then
				self._ammo_pickup[1] = self._ammo_pickup[1] * 1.5
				self._ammo_pickup[2] = self._ammo_pickup[2] * 1.5
			end
		elseif pickup_type == "russia" then
			if self._warsaw then
				self._ammo_pickup[1] = self._ammo_pickup[1] * 1.5
				self._ammo_pickup[2] = self._ammo_pickup[2] * 1.5
			end
		end
	end
	
	if BeardLib then
		if self._starwars == true then
		--log("STARWARS TRACERS")
			self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail") 
		elseif self._nato then
		--log("NATO TRACERS")
			self._trail_effect_table.effect = Idstring("_dmc/effects/nato_trail")
		elseif self._warsaw then
		--log("WARSAW TRACERS")
			self._trail_effect_table.effect = Idstring("_dmc/effects/warsaw_trail")
		elseif self._large_tracers then
		--log("LARGE TRACERS")
			self._trail_effect_table.effect = Idstring("_dmc/effects/large_trail")
		end 
	end
	
	--[[ 
	track_weight = 1
	if self._movement_penalty < track_weight then
		track_weight = self._movement_penalty
	end ]]
	
	if self._can_toggle_burst then
		self._fire_mode = Idstring("single")
		--self:_set_burst_mode(true, true)
	end
	
	if self._burst_only == true then 
		self._fire_mode = Idstring("auto")
		self:_set_burst_mode(true, true)
	end
	
	self._silencer = managers.weapon_factory:has_perk("silencer", self._factory_id, self._blueprint)
	self._flash_hide = managers.weapon_factory:has_perk("flash_hider", self._factory_id, self._blueprint)
	self._side_comp = managers.weapon_factory:has_perk("side_comp", self._factory_id, self._blueprint)
	self._big_flash = managers.weapon_factory:has_perk("big_flash", self._factory_id, self._blueprint)
	if self._ammo_data and self._ammo_data.muzzleflash ~= nil then
		self._muzzle_effect = Idstring(self._ammo_data.muzzleflash)
	elseif self._side_comp then
		self._muzzle_effect = Idstring("effects/particles/weapons/c45/muzzleflash_3dp")
	elseif self._big_flash then
		self._muzzle_effect = Idstring("effects/payday2/particles/weapons/big_762_auto_fps")
	elseif self._flash_hide then
		self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash_silenced or "effects/payday2/particles/weapons/9mm_auto_silence_fps")
	elseif self._silencer then
		self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash_silenced or "effects/payday2/particles/weapons/9mm_auto_silence_fps")
	else
		self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash or "effects/particles/test/muzzleflash_maingun")
	end
	self._muzzle_effect_table = {
		effect = self._muzzle_effect,
		parent = self._obj_fire,
		force_synch = self._muzzle_effect_table.force_synch or false
	}
	
	self._check_damage = self._current_stats and self._current_stats.damage or 0		
	
	if self._scopes then
		local factory = tweak_data.weapon.factory
		for _, part_id in ipairs(self._scopes) do
			if factory.parts[part_id].type == "sight" then
				self._has_scope = true
			end
		end
	end
	
	self:_check_laser()
	self:fire_mode()
	self:can_toggle_firemode()
end

function NewRaycastWeaponBase:reload_exit_expire_t()
	if self._use_shotgun_reload then
		return self:weapon_tweak_data().timers.shotgun_reload_exit_empty or 0.7
	end
	return self:weapon_tweak_data().timers.reload_exit_empty or nil
end
function NewRaycastWeaponBase:reload_not_empty_exit_expire_t()
	if self._use_shotgun_reload then
		return self:weapon_tweak_data().timers.shotgun_reload_exit_not_empty or 0.3
	end
	return self:weapon_tweak_data().timers.reload_exit_not_empty or nil
end

function NewRaycastWeaponBase:can_toggle_firemode()
	if self._locked_fire_mode then
		return false
	elseif self._burst_only == true then
		return false
	elseif self._can_toggle_burst == true then
		return false
	elseif self._can_switch_selector then
		if self._can_switch_selector == false then
			return false
		elseif self._can_switch_selector == true then
			return true
		end
	else
		return tweak_data.weapon[self._name_id].CAN_TOGGLE_FIREMODE
	end
end	

function NewRaycastWeaponBase:in_burst_mode()
	return self._fire_mode == Idstring("auto") and self._in_burst_mode
end

function NewRaycastWeaponBase:toggle_firemode()
	local state = managers.player:player_unit():movement():current_state()
	local can_toggle = not self._locked_fire_mode and self:can_toggle_firemode()
	--log(tostring( state._shooting ))
	if not self._locked_fire_mode and (can_toggle or self._has_burst_fire) and not self._burst_only and not (state and state._shooting) then
	--log("SWITCHING")
		if self._fire_mode == ids_single then
			if self._has_burst_fire then
				self:weapon_hold()
				self:_set_burst_mode(true, true)
			end
			self._fire_mode = ids_auto
			self._sound_fire:post_event("wp_auto_switch_on")
		elseif self._fire_mode == ids_auto and self._has_burst_fire and self:in_burst_mode() then
			self:_set_burst_mode(false, true)
			self._track_burst = nil
			if self._can_toggle_burst then
				self._fire_mode = ids_single
				self._sound_fire:post_event("wp_auto_switch_off")
			else
				self._fire_mode = ids_auto
				self._sound_fire:post_event("wp_auto_switch_on")
			end
		elseif self._fire_mode == ids_auto and not self:in_burst_mode() then
			self._track_burst = nil
			self._fire_mode = ids_single
			self._sound_fire:post_event("wp_auto_switch_off")
		end
		return true
	end
	if (can_toggle or self._has_burst_fire) and (state and state._shooting) then
		managers.hud:show_hint({text = "Cannot switch firemode while shooting!",time = 3})
	end
	return false
end

	
function NewRaycastWeaponBase:_set_burst_mode(status, skip_sound)
	self._in_burst_mode = status
	--log("BURST STATUS: " .. tostring(status))
	self._fire_mode = Idstring(status and "auto" or "single")
	if not skip_sound then
		self._sound_fire:post_event(status and "wp_auto_switch_on" or self._has_auto and "wp_auto_switch_on" or "wp_auto_switch_off")
	end
end
	
local old_stop_shooting_original = NewRaycastWeaponBase.stop_shooting
function RaycastWeaponBase:stop_shooting()
	if self._no_reset_burst and self:in_burst_mode() then
		self._track_burst = (self._track_burst and self._track_burst + self._shotsfired) or self._shotsfired
		if self._track_burst and self._track_burst >= self._burst_size then
			self._track_burst = nil
		end
	else
		self._track_burst = nil
	end
	self._shotsfired = 0
	old_stop_shooting_original(self)
end

local old_fire_original = NewRaycastWeaponBase.fire
function NewRaycastWeaponBase:fire(...)	
	local result = {}
	if DMCWO.GEDDAN == true then 
		local consume_ammo = not managers.player:has_activate_temporary_upgrade("temporary", "no_ammo_cost")
		if consume_ammo and self._jam_start and not self._starwars then
			self._jam_shotsfired = self._jam_shotsfired + 1
			--log( "shots fired: " .. tostring(self._jam_shotsfired) )
			local rando = math.random(2,0)
			local rando_2 = self._jam_add * rando
			if self._jam_shotsfired >= self._jam_start then
				if self._stop_calc ~= true then
					self._jam_it_in = self._jam_it_in + rando_2
				end
				local loli_butts = math.random()
				if self._jam_it_in > self._jam_cap then
					--log( "JAM CHANCE CAPPED AT: " .. tostring(self._jam_cap * 100) .. "%")
					self._jam_it_in = self._jam_cap
					self._stop_calc = true
				end
				--log( "chance: " ..tostring(self._jam_it_in * 100) .. "%" )
				--log( "roll: " .. tostring(loli_butts * 100) )
				if self._jam_it_in >= loli_butts then
					--log("\nLOL JAM\n")
					self._jam_start = self._jam_shotsfired + self._jam_cd
					managers.player:local_player():sound():say("g29",false,nil)
					self:set_ammo_remaining_in_clip(0, true)
				end
			end
		end	
	end
	
	if self._ads_fire_only == true then 
		local state = managers.player:player_unit():movement():current_state()
		local bypass = managers.player:player_unit():movement():current_state_name() == "tased" or managers.player:player_unit():movement():current_state_name() == "bleed_out"
		if state._state_data.in_full_steelsight or bypass then	
			self._shotsfired = self._shotsfired + 1
			result = old_fire_original(self, ...)
			return result
		else 
			managers.hud:show_hint({text = "You must be fully aiming to fire this weapon!",time = 3})
			self:play_tweak_data_sound("dryfire")
			--managers.player:local_player():sound():say("g10",nil,false)
		end
	else 
		self._shotsfired = self._shotsfired + 1
			
		if self._track_burst and self._track_burst >= self._burst_size then
			self._track_burst = nil
		end
		result = old_fire_original(self, ...)
		return result
	end
end
	
	
function NewRaycastWeaponBase:set_ammo_remaining_in_clip(ammo, no_check)
	NewRaycastWeaponBase.super.set_ammo_remaining_in_clip(self, ammo)
	if not no_check then
		self:check_bullet_objects()
	end
end
	
function NewRaycastWeaponBase:update_damage()
	if not tweak_data.weapon[self._name_id].ignore_damage_upgrades or not self._ignore_dmg_boosts then
		self._damage = ((self._current_stats and self._current_stats.damage or 0) + self:damage_addend()) * self:damage_multiplier()
	else
		self._damage = self._current_stats and self._current_stats.damage or 0
	end
end

function NewRaycastWeaponBase:play_tweak_data_sound(event, alternative_event)
	local sounds = self._use_sound and tweak_data.weapon[self._use_sound].sounds or tweak_data.weapon[self._name_id].sounds
	local event = sounds and (sounds[event] or sounds[alternative_event])
	if event then
		self:play_sound(event)
	end
end

function NewRaycastWeaponBase:fire_mode()
	self._fire_mode = self._locked_fire_mode or self._fire_mode or (self:in_burst_mode() and Idstring("auto")) or Idstring(tweak_data.weapon[self._name_id].FIRE_MODE or "single")
	return self._fire_mode == ids_single and "single" or "auto"
end

function NewRaycastWeaponBase:recoil_wait()
	return nil
end

function NewRaycastWeaponBase:movement_penalty()
	local mult = 1
	local state = managers.player:player_unit():movement():current_state()
	
	local dicks = tweak_data.player.movement_state.standard.movement.speed.STANDARD_MAX / tweak_data.player.movement_state.standard.movement.speed.STEELSIGHT_MAX
	if state._state_data.ducking then
		dicks = tweak_data.player.movement_state.standard.movement.speed.CROUCHING_MAX / tweak_data.player.movement_state.standard.movement.speed.STEELSIGHT_MAX
	end		
	if state._state_data.in_steelsight and not managers.player:has_category_upgrade("player", "steelsight_normal_movement_speed") then
		if self._ams then
			mult = dicks * (self._ams * self._stocker)
		end
		
		--bullpup bonus speed
		if self:weapon_tweak_data().is_bullpup then 
			mult = mult * 1.2
		end	
	
	end
	
	if (state._state_data.reload_expire_t or state._state_data.reload_enter_expire_t or state._state_data.reload_exit_expire_t) then
		mult = mult * self._rms
	end
	
	if state._shooting then
		if state._state_data.in_steelsight then
			mult = mult * self._ads_sms
		else
			mult = mult * self._sms
		end
	end
	
	--if magic occurs, prevents modified steelsight speeds exceeding the walking/crouched state's speed
	if mult > dicks then
		mult = dicks
	end
	return (track_weight or self._movement_penalty or 1) * mult
end
		
function NewRaycastWeaponBase:get_damage_falloff(damage, col_ray, user_unit, distance)
	local dist = distance or col_ray.distance or mvector3.distance(col_ray.unit:position(), user_unit:position())
	local fuck = ( (self._current_stats.damage / self._damage) * damage )
	local min_damage = self._damage_min or 0
	if min_damage > damage then
		min_damage = damage
	end
	
	if DMCWO.debug_range == true then
		log("Dist: " .. tostring(dist/100) .. "\nDrop Start: " .. tostring(self._damage_near/100) .. "m\n\nInit Dmg: " .. tostring(damage * 10) .. "\nMin. Dmg at: " .. tostring(self._damage_far/100) .. "m \nMin. Dmg: " .. tostring( (min_damage) * 10) .. "\n")
	end
	
	if self._damage_bonus_range and dist < self._damage_bonus_range then
		damage = damage + (self._damage_bonus or 0)
	elseif dist > self._damage_near and dist < self._damage_far then
		damage = damage - (( dist - self._damage_near) / ( self._damage_far - self._damage_near ) * ( damage - min_damage ))
	elseif dist >= self._damage_far then
		damage = min_damage 
	end
	
	if DMCWO.debug_range == true then
		log("Impact Dmg: " .. tostring(damage * 10) .. "\n\n") --Damage on impact
	end
	
	return damage
end

 
local mvec_to = Vector3()
local mvec_spread_direction = Vector3()
local mvec1 = Vector3()
function NewRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	local result = {}
	local hit_unit
	local total_distance
	local spread = self:_get_spread(user_unit)
	mvector3.set(mvec_spread_direction, direction)
	if spread then
		mvector3.spread(mvec_spread_direction, spread * (spread_mul or 1))
	end
	local ray_distance = shoot_through_data and shoot_through_data.ray_distance or 20000
	mvector3.set(mvec_to, mvec_spread_direction)
	mvector3.multiply(mvec_to, ray_distance)
	mvector3.add(mvec_to, from_pos)
	if DMCWO.debug_damage == true or self._ignore_dmg_boosts then
		dmg_mul = 1
	end
	local damage = self:_get_current_damage(dmg_mul)
	local ray_from_unit = shoot_through_data and alive(shoot_through_data.ray_from_unit) and shoot_through_data.ray_from_unit or nil
	local col_ray = (ray_from_unit or World):raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
	
	if shoot_through_data and col_ray and col_ray.unit then
		total_distance = (shoot_through_data.total_distance + col_ray.distance) or col_ray.distance
	end
			
	if shoot_through_data and shoot_through_data.has_hit_wall then
		if not col_ray then
			return result
		end
		mvector3.set(mvec1, col_ray.ray)
		mvector3.multiply(mvec1, -5)
		mvector3.add(mvec1, col_ray.position)
		local ray_blocked = World:raycast("ray", mvec1, shoot_through_data.from, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "report")
		if ray_blocked then
			return result
		end
	end
	local autoaim, suppression_enemies = self:check_autoaim(from_pos, direction)
	if self._autoaim then
		local weight = 0.1
		if col_ray and col_ray.unit:in_slot(managers.slot:get_mask("enemies")) then
			self._autohit_current = (self._autohit_current + weight) / (1 + weight)
			damage = self:get_damage_falloff(damage, col_ray, user_unit, total_distance)
			hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
		elseif autoaim then
			local autohit_chance = 1 - math.clamp((self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0, 1)
			if autohit_mul then
				autohit_chance = autohit_chance * autohit_mul
			end
			if autohit_chance > math.random() then
				self._autohit_current = (self._autohit_current + weight) / (1 + weight)
				damage = self:get_damage_falloff(damage, autoaim, user_unit, total_distance)
				hit_unit = self._bullet_class:on_collision(autoaim, self._unit, user_unit, damage)
				col_ray = autoaim
			else
				self._autohit_current = self._autohit_current / (1 + weight)
			end
		elseif col_ray then
			damage = self:get_damage_falloff(damage, col_ray, user_unit, total_distance)
			hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
		end
		self._shot_fired_stats_table.hit = hit_unit and true or false
		if (not shoot_through_data or hit_unit) and (not self._ammo_data or not self._ammo_data.ignore_statistic) and not self._rays then
			self._shot_fired_stats_table.skip_bullet_count = shoot_through_data and true
			managers.statistics:shot_fired(self._shot_fired_stats_table)
		end
	elseif col_ray then
		damage = self:get_damage_falloff(damage, col_ray, user_unit, total_distance)
		hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
	end
	if suppression_enemies and self._suppression then
		result.enemies_in_cone = suppression_enemies
	end
	if hit_unit and hit_unit.type == "death" and self:weapon_tweak_data().category == tweak_data.achievement.easy_as_breathing.weapon_type then
		local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
		if unit_type and not CopDamage.is_civilian(unit_type) then
			self._kills_without_releasing_trigger = (self._kills_without_releasing_trigger or 0) + 1
			if self._kills_without_releasing_trigger >= tweak_data.achievement.easy_as_breathing.count then
				managers.achievment:award(tweak_data.achievement.easy_as_breathing.award)
			end
		end
	end
	if col_ray then
		local tracer_dist = total_distance or col_ray.distance
		if (col_ray and tracer_dist > 300 or not col_ray) and alive(self._obj_fire) and not shoot_through_data then
			self._obj_fire:m_position(self._trail_effect_table.position)
			mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)
			if self:weapon_tweak_data().has_trail == true or self._is_tracer == true then
				self._trail_effect_table.effect = Idstring("effects/particles/weapons/sniper_trail")
			end
			local clamp_dist = tracer_dist
			if self._is_tracer then
				clamp_dist = 0.01
			end
			local trail = World:effect_manager():spawn(self._trail_effect_table)
			if col_ray then
				World:effect_manager():set_remaining_lifetime(trail, math.clamp(tracer_dist / 10000, 0, clamp_dist))
			end
		end
	elseif not col_ray then
		self._obj_fire:m_position(self._trail_effect_table.position)
		mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)
		if self:weapon_tweak_data().has_trail == true or self._is_tracer == true then
			self._trail_effect_table.effect = Idstring("effects/particles/weapons/sniper_trail")
		end
		local clamp_dist = 0.5
		if self._is_tracer then
			clamp_dist = 0.01
		end
		local trail = World:effect_manager():spawn(self._trail_effect_table)
		World:effect_manager():set_remaining_lifetime(trail, clamp_dist)
	end
	result.hit_enemy = hit_unit
	if self._alert_events then
		result.rays = {col_ray}
	end

	repeat
		if col_ray and col_ray.unit then
			
			local kills
			if hit_unit then
				if not self._can_shoot_through_enemy then
					break
				end
				local killed = hit_unit.type == "death"
				local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
				
				local is_enemy = unit_type ~= "civilian" and unit_type ~= "civilian_female" and unit_type ~= "bank_manager"
				kills = ( shoot_through_data and shoot_through_data.kills or 0 ) + ( killed and is_enemy and 1 or 0 )
			end
			
			self._shoot_through_data.kills = kills
			
			if ( col_ray.distance < 0.1 ) or
				( ray_distance - col_ray.distance < 50 ) then
					break
			end
			
			local has_hit_wall = shoot_through_data and shoot_through_data.has_hit_wall
			local has_passed_shield = shoot_through_data and shoot_through_data.has_passed_shield
			local is_shoot_through, is_shield, is_wall
			if hit_unit then
			else
				local is_world_geometry = col_ray.unit:in_slot( managers.slot:get_mask( "world_geometry" ) )
				if is_world_geometry then
					is_shoot_through = not col_ray.body:has_ray_type( Idstring( "ai_vision" ) )
					
					if not is_shoot_through then
						if has_hit_wall or not self._can_shoot_through_wall then
							break
						end
						is_wall = true
					end
				else
					--log("Hit shield")
					if self._can_shoot_through_shield ~= true then
						--log("Can't shoot through shield")
						break
					end
					if self._min_shield_pen_dam and damage < (self._damage * self._min_shield_pen_dam) then 
						--log("Failed to penetrate shield: Below damage threshold!")
						break
					end
					is_shield = col_ray.unit:in_slot( 8 ) --[[and alive( col_ray.unit:parent() )]]
				end
			end
			
			if not hit_unit and not is_shoot_through and not is_shield and not is_wall then
				break
			end
			
			local ray_from_unit = hit_unit and col_ray.unit
			if is_shield then
				dmg_mul = ( dmg_mul or 1 ) * (self._shield_damage or 0.15)
				if col_ray.unit:name():key() == '8816e70e510c8c2e' then --fbi
					dmg_mul = dmg_mul * 0.75
				elseif col_ray.unit:name():key() == 'af254947f0288a6c' or col_ray.unit:name():key() == '63c0a27ecd41fc5e' then --phalanx/russian
					dmg_mul = dmg_mul * 0.5
				elseif col_ray.unit:name():key() == '4a4a5e0034dd5340' then --winters
					dmg_mul = dmg_mul * 0.25
				end
			end

			self._shoot_through_data.has_hit_wall = has_hit_wall or is_wall
			self._shoot_through_data.has_passed_shield = has_passed_shield or is_shield
			self._shoot_through_data.ray_from_unit = ray_from_unit
			self._shoot_through_data.ray_distance = ray_distance - col_ray.distance
	
			mvector3.set( self._shoot_through_data.from, mvec_spread_direction )
			
			local penetration_power = self._penetration_power
			local penetration
			if (damage * 10) * penetration_power > 55 then
				penetration = 55
			else
				penetration = (damage * 10) * penetration_power
			end
			
			local penetration_damage = self._penetration_damage
			if is_wall then
				if penetration_damage > 1 then
					penetration_damage = 1
				end
				dmg_mul = ( dmg_mul or 1 ) * penetration_damage
				spread_mul = ( spread_mul or 1 ) * 2
			end
			
			mvector3.multiply( self._shoot_through_data.from, (is_shield and 20) or (is_wall and penetration) or 40)
			mvector3.add( self._shoot_through_data.from, col_ray.position )
			
			local penetration_dist = math.sqrt(((col_ray.position.x - self._shoot_through_data.from.x) ^ 2) + ((col_ray.position.y - self._shoot_through_data.from.y) ^ 2) + ((col_ray.position.z - self._shoot_through_data.from.z) ^ 2)) or 0
			
			local dongs
			if col_ray and col_ray.unit then
				dongs = col_ray.distance
			end
			if total_distance ~= nil then
				dongs = total_distance
			end
				
			self._shoot_through_data.total_distance = dongs + penetration_dist
			
			managers.game_play_central:queue_fire_raycast( Application:time() + 0.0125, self._unit, user_unit, self._shoot_through_data.from, mvec_spread_direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, self._shoot_through_data )
		end
	until true
	
	if self._shoot_through_data and hit_unit and col_ray and self._shoot_through_data.kills and 0 < self._shoot_through_data.kills and hit_unit.type == "death" then
		local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
		local multi_kill, enemy_pass, obstacle_pass, weapon_pass, weapons_pass, weapon_type_pass
		for achievement, achievement_data in pairs(tweak_data.achievement.sniper_kill_achievements) do
			multi_kill = not achievement_data.multi_kill or self._shoot_through_data.kills == achievement_data.multi_kill
			enemy_pass = not achievement_data.enemy or unit_type == achievement_data.enemy
			obstacle_pass = not achievement_data.obstacle or achievement_data.obstacle == "wall" and self._shoot_through_data.has_hit_wall or achievement_data.obstacle == "shield" and self._shoot_through_data.has_passed_shield
			weapon_pass = not achievement_data.weapon or self._name_id == achievement_data.weapon
			weapons_pass = not achievement_data.weapons or table.contains(achievement_data.weapons, self._name_id)
			weapon_type_pass = not achievement_data.weapon_type or self:weapon_tweak_data().category == achievement_data.weapon_type
			if multi_kill and enemy_pass and obstacle_pass and weapon_pass and weapons_pass and weapon_type_pass then
				if achievement_data.stat then
					managers.achievment:award_progress(achievement_data.stat)
				elseif achievement_data.award then
					managers.achievment:award(achievement_data.award)
				end
			end
		end
	end
	return result
end

function NewRaycastWeaponBase:_check_laser()
	self._laser_data = nil
	if self._has_gadget then
		local factory = tweak_data.weapon.factory
		for _, part_id in ipairs(self._has_gadget) do
			if factory.parts[part_id].sub_type == "laser" then
				self._laser_data = {}
				self._laser_data.part_id = part_id
				self._laser_data.unit = self._parts and self._parts[part_id] and alive(self._parts[part_id].unit) and self._parts[part_id].unit
			end
		end
	end
end
	
function NewRaycastWeaponBase:_is_laser_on()
	if not self._laser_data or not self._laser_data.unit then
		return false
	end
	return self._laser_data.unit:base():is_on()
end

function NewRaycastWeaponBase:_laser_spread()
	if self:_is_laser_on() then
		return 0.8 --20% spread reduction
	else
		return 1
	end
end

function NewRaycastWeaponBase:_get_min_spread(user_unit)
	local multiplier = 1
	local current_state = user_unit:movement()._current_state
	multiplier = multiplier * (managers.player:upgrade_value("weapon", "spread_multiplier", 1))
	multiplier = multiplier * (managers.player:upgrade_value(self:weapon_tweak_data().category, "spread_multiplier", 1))
	if self:weapon_tweak_data().sub_category then
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "spread_multiplier", 1)
	end
	multiplier = multiplier * (managers.player:upgrade_value("weapon", self:fire_mode() .. "_spread_multiplier", 1))
	multiplier = multiplier * (managers.player:upgrade_value(self._name_id, "spread_multiplier", 1))
	
	multiplier = multiplier * (managers.player:upgrade_value(category, "steelsight_accuracy_inc", 1))
	if self:weapon_tweak_data().sub_category then
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "steelsight_accuracy_inc", 1)
	end
	
	if self._silencer then
		multiplier = multiplier * (managers.player:upgrade_value("weapon", "silencer_spread_multiplier", 1))
		multiplier = multiplier * (managers.player:upgrade_value(self:weapon_tweak_data().category, "silencer_spread_multiplier", 1))
		if self:weapon_tweak_data().sub_category then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "silencer_spread_multiplier", 1)
		end
	end
	
	if current_state._moving then
		multiplier = multiplier * (managers.player:upgrade_value(self:weapon_tweak_data().category, "move_spread_multiplier", 1))
		if self:weapon_tweak_data().sub_category then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "move_spread_multiplier", 1)
		end
		multiplier = multiplier * (managers.player:team_upgrade_value("weapon", "move_spread_multiplier", 1))
	end
	if current_state._state_data.using_bipod then
		multiplier = multiplier * 0.5
	end
	multiplier = multiplier * ( self:weapon_tweak_data().spread[current_state._moving and "moving_steelsight" or "steelsight"])
	local min_spread = multiplier * self._spread
	return min_spread
end

function NewRaycastWeaponBase:_get_spread(user_unit)
	local current_state = user_unit:movement()._current_state
	local spread_multiplier = self:spread_multiplier(current_state)
	local min_spread = self:_get_min_spread(user_unit)
	local the_ass_was_fat = self._spread
	if self._hipfire_mod and not current_state:in_steelsight() then
		spread_multiplier = spread_multiplier * self._hipfire_mod
	end
	if not current_state:in_steelsight() and the_ass_was_fat < 1 then
		the_ass_was_fat = 1
	end
	if not ( current_state:in_steelsight() or current_state:_is_using_bipod() ) then
		spread_multiplier = spread_multiplier * self:_laser_spread()
	elseif self:weapon_tweak_data().always_hipfire == true then 
		spread_multiplier = spread_multiplier * self:_laser_spread()
	end
	
	local spread = the_ass_was_fat * spread_multiplier
	if spread > 20 then
		spread = 20
	elseif not current_state:in_steelsight() and spread < min_spread then
		spread = min_spread
	end
	if not current_state:in_steelsight() or (current_state:in_steelsight() and self:weapon_tweak_data().always_hipfire == true) then
	
		if self:in_burst_mode() and self._burst_fire_hip_mult then
			spread = spread * self._burst_fire_hip_mult
		end
		if not self:in_burst_mode() and self:fire_mode() == "auto" and self._auto_fire_hip_mult then
			spread = spread * self._auto_fire_hip_mult
		end
	end
	return spread
end

--[[	recoil multipler stuff	]]--
function NewRaycastWeaponBase:recoil_multiplier()
	local user_unit = self._setup and self._setup.user_unit
	local is_moving = false
	is_moving = user_unit and alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state and user_unit:movement()._current_state._moving
	local current_state = user_unit and alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
	
	return managers.blackmarket:recoil_multiplier(self._name_id, self:weapon_tweak_data().category, self:weapon_tweak_data().sub_category, self._silencer, self._blueprint, is_moving) * ((current_state and current_state._state_data.in_air and 3) or 1)
	* ((current_state and current_state._state_data.ducking and 0.7) or 1) * ((self:in_burst_mode() and self._burst_fire_recoil_mult) or (self._firemode == Idstring("auto") and not self:in_burst_mode() and self._auto_fire_recoil_mult) or 1)
end

--These functions were made by Deadly Mutton Chops and B1313
--{
function NewRaycastWeaponBase:clip_full()
	if  self:weapon_tweak_data().tactical_reload then
		return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip() +  self:weapon_tweak_data().tactical_reload
	else
		return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip()
	end
end

function NewRaycastWeaponBase:can_reload()
	if self._starwars then
		return false
	end
	if  self:weapon_tweak_data().uses_clip == true and ( (self:get_ammo_max_per_clip() ==  self:weapon_tweak_data().clip_capacity and self:get_ammo_remaining_in_clip() > 0 ) or self:get_ammo_remaining_in_clip() > self:get_ammo_max_per_clip() -  self:weapon_tweak_data().clip_capacity) then
		return false
	elseif self:get_ammo_total() > self:get_ammo_remaining_in_clip() then
		return true
	end
end
	
function NewRaycastWeaponBase:on_reload()
	if  self:weapon_tweak_data().uses_clip == true then
		if self:get_ammo_remaining_in_clip() <= self:get_ammo_max_per_clip()  then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() +  self:weapon_tweak_data().clip_capacity))
		end
	else
		if self:get_ammo_remaining_in_clip() > 0 and  self:weapon_tweak_data().tactical_reload == 1 then
			if DMCWO.no_ammo_purse == true and not  self:weapon_tweak_data().keep_ammo then
				self:set_ammo_total(self:get_ammo_total() - (self:get_ammo_remaining_in_clip() - 1))
			end
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
		elseif self:get_ammo_remaining_in_clip() > 1 and  self:weapon_tweak_data().tactical_reload == 2 then
			if DMCWO.no_ammo_purse == true then
				self:set_ammo_total(self:get_ammo_total() - (self:get_ammo_remaining_in_clip() - 2))
			end
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 2))
		elseif self:get_ammo_remaining_in_clip() == 1 and  self:weapon_tweak_data().tactical_reload == 2 then
			if DMCWO.no_ammo_purse == true then
				self:set_ammo_total(self:get_ammo_total() - (self:get_ammo_remaining_in_clip() - 1))
			end
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
		elseif self:get_ammo_remaining_in_clip() > 0 and not  self:weapon_tweak_data().tactical_reload then
			if DMCWO.no_ammo_purse == true and not  self:weapon_tweak_data().keep_ammo then
				self:set_ammo_total(self:get_ammo_total() - self:get_ammo_remaining_in_clip())
			end
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip()))
		elseif self._setup.expend_ammo then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip()))
		else
			self:set_ammo_remaining_in_clip(self:get_ammo_max_per_clip())
			self:set_ammo_total(self:get_ammo_max_per_clip())
		end
	end
	if self._dual_mags then
		if self._alternate_reload == true then
			self._alternate_reload = false
		elseif self._alternate_reload == false then
			self._alternate_reload = true
		end
	end
	managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)
end
	
function NewRaycastWeaponBase:reload_expire_t()
	if self._use_shotgun_reload then
		local ammo_remaining_in_clip = self:get_ammo_remaining_in_clip()
		if self:get_ammo_remaining_in_clip() > 0 and  self:weapon_tweak_data().tactical_reload == 1 then
			return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() + 1 - ammo_remaining_in_clip) * self:reload_shell_expire_t()
		else
			return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() - ammo_remaining_in_clip) * self:reload_shell_expire_t()
		end
	end
	return nil
end

function NewRaycastWeaponBase:update_reloading(t, dt, time_left)
	if self._use_shotgun_reload and t > self._next_shell_reloded_t then
		local speed_multiplier = self:reload_speed_multiplier()
		self._next_shell_reloded_t = self._next_shell_reloded_t + self:reload_shell_expire_t() / speed_multiplier
		if self:get_ammo_remaining_in_clip() > 0 and  self:weapon_tweak_data().tactical_reload == 1 then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip() + 1, self:get_ammo_remaining_in_clip() + 1))
			return true
		else
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + 1))
			return true
		end
		managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)
		return true
	end
end
--}

--[[	fire rate multipler in-game stuff	]]--
function NewRaycastWeaponBase:fire_rate_multiplier()
	local multiplier = self._rof_mult or 1
	
	if self._fire_mode == Idstring("auto") and not self:in_burst_mode() and self._auto_fire_rate_multiplier then
		multiplier = multiplier * self._auto_fire_rate_multiplier
	end
	
	if self._fire_rate_init_count and (self._fire_rate_init_count > self._shotsfired) and self:fire_mode() ~= "single" then
	--log("DICSK")
		multiplier = multiplier * self._fire_rate_init_mult
	end
	
	if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "fire_rate_multiplier") then
		if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "fire_rate_multiplier", 1)
		end
	end
	if self:weapon_tweak_data().sub_category then
		if not self:upgrade_blocked(tweak_data.weapon[self._name_id].sub_category, "fire_rate_multiplier") then
			if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
				multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "fire_rate_multiplier", 1)
			end
		end
	end
	if not self:upgrade_blocked("weapon", "fire_rate_multiplier") then
		if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
			multiplier = multiplier * managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1)
		end
	end
	if not self:upgrade_blocked(self._name_id, "fire_rate_multiplier") then
		if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
			multiplier = multiplier * managers.player:upgrade_value(self._name_id, "fire_rate_multiplier", 1)
		end
	end
	
	if self._hip_fire_rate_inc and self._hip_fire_rate_inc > 0 then
		local user_unit = self._setup and self._setup.user_unit
		local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
		if current_state and not current_state:in_steelsight() then
			multiplier = multiplier * (self._hip_fire_rate_inc or 1)
		end
	end
	
	return multiplier * ( (self:in_burst_mode() and self._burst_fire_rate_multiplier) or 1)
end

	
--[[	Reload stuff	]]--
function NewRaycastWeaponBase:reload_speed_multiplier()
	local multiplier = 1
	multiplier = multiplier * self._base_reload_speed_mult
	if self._dual_mags then
		if self._alternate_reload == true then
			multiplier = multiplier * self._mod_reload_speed_mult
		end
	else
		multiplier = multiplier * self._mod_reload_speed_mult
	end
	multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "reload_speed_multiplier", 1)
	if self:weapon_tweak_data().sub_category then
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "reload_speed_multiplier", 1)
	end
	multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)
	--[[ if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
		local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()
		if morale_boost_bonus then
			multiplier = multiplier * morale_boost_bonus.reload_speed_bonus
		end
	end ]]
	
	if managers.player:has_activate_temporary_upgrade("temporary", "reload_weapon_faster") then
		multiplier = multiplier * (managers.player:temporary_upgrade_value("temporary", "reload_weapon_faster", 1))
	end
	if managers.player:has_activate_temporary_upgrade("temporary", "single_shot_fast_reload") then
		multiplier = multiplier * (managers.player:temporary_upgrade_value("temporary", "single_shot_fast_reload", 1))
	end
	multiplier = multiplier * (managers.player:get_property("shock_and_awe_reload_multiplier", 1))
	multiplier = multiplier * (managers.player:get_temporary_property("bloodthirst_reload_speed", 1))
	
	return multiplier
end

function NewRaycastWeaponBase:exit_run_speed_multiplier()
	local multiplier = managers.player:upgrade_value(self:weapon_tweak_data().category, "exit_run_speed_multiplier", 1)
	if self:weapon_tweak_data().sub_category then
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "exit_run_speed_multiplier", 1)
	end
	multiplier = multiplier * managers.player:upgrade_value("weapon", "exit_run_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "exit_run_speed_multiplier", 1)
	multiplier = multiplier / ( (self:weapon_tweak_data().sprintout_time or 0.300) / 0.45 )
	return multiplier
end

--From SC's Mod
if DMCWO._data_skills.havel_mum ~= true then
function NewRaycastWeaponBase:calculate_ammo_max_per_clip()
    local ammo = tweak_data.weapon[self._name_id].CLIP_AMMO_MAX + (self._extra_ammo or 0)
    ammo = ammo * managers.player:upgrade_value(self._name_id, "clip_ammo_increase", 1)
    if not self:upgrade_blocked("weapon", "clip_ammo_increase") then
        ammo = ammo * managers.player:upgrade_value("weapon", "clip_ammo_increase", 1)
    end
    if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "clip_ammo_increase") then
    	ammo = ammo * managers.player:upgrade_value(tweak_data.weapon[self._name_id].category, "clip_ammo_increase", 1)
    end
    ammo = math.floor(ammo)
    return ammo
end
end

function NewRaycastWeaponBase:enter_steelsight_speed_multiplier()
	local multiplier = 1
	local ads_time = self:weapon_tweak_data().ADS_TIMER or 0.200
	
	multiplier = multiplier / ( ads_time / tweak_data.player.TRANSITION_DURATION)
				
	multiplier = multiplier * self._ads_speed_mult
	
	if self:weapon_tweak_data().category == "assault_rifle" and self:weapon_tweak_data().recategorize == "battle_rifle" then
		multiplier = multiplier * managers.player:upgrade_value("snp", "enter_steelsight_speed_multiplier", 1)
	else
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "enter_steelsight_speed_multiplier", 1)
	end
	if self:weapon_tweak_data().sub_category then
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "enter_steelsight_speed_multiplier", 1)
	end
	multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "combat_medic_enter_steelsight_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "enter_steelsight_speed_multiplier", 1)
	
	if self._silencer then
		multiplier = multiplier * managers.player:upgrade_value("weapon", "silencer_enter_steelsight_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "silencer_enter_steelsight_speed_multiplier", 1)
	end
	--[[ local state = managers.player:player_unit():movement():current_state()
	if state._shooting then
		multiplier = multiplier * 0.75
	end ]]
	return multiplier
end


function NewRaycastWeaponBase:tweak_data_anim_play(anim, speed_multiplier)
	local data = tweak_data.weapon.factory[self._factory_id]
	if data.animations and data.animations[anim] then
		local anim_name = data.animations[anim]
		local length = self._unit:anim_length(Idstring(anim_name))
		speed_multiplier = speed_multiplier or 1
		self._unit:anim_stop(Idstring(anim_name))
		self._unit:anim_play_to(Idstring(anim_name), length, speed_multiplier)
	end
	for part_id, data in pairs(self._parts) do
		if not (self:in_burst_mode() and data.animations and data.animations.burst_stop_anim) then
			if data.animations and data.animations[anim] then
				local anim_name = data.animations[anim]
				local length = data.unit:anim_length(Idstring(anim_name))
				speed_multiplier = speed_multiplier or 1
				data.unit:anim_stop(Idstring(anim_name))
				data.unit:anim_play_to(Idstring(anim_name), length, speed_multiplier)
			end
		end
	end
	NewRaycastWeaponBase.super.tweak_data_anim_play(self, anim, speed_multiplier)
	return true
end