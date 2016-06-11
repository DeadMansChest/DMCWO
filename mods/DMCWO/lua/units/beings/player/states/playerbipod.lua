--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_update_check_actions = PlayerBipod._update_check_actions
function PlayerBipod:_update_check_actions(t, dt)
	old_update_check_actions(self, t ,dt)
	local input = self:_get_input(t, dt)
	new_action = new_action or self:_check_action_weapon_firemode(t, input)
end

if DMCWO.bipod_wasd_undeploy == true then
	function PlayerBipod:_update_movement(t, dt)
		local current_state = managers.player:get_current_state()
		if self._move_dir then
			self:_unmount_bipod()
		end
	end
end

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


