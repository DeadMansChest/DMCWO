--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

function FPCameraPlayerBase:stop_shooting( wait )
	local weapon = self._parent_unit:inventory():equipped_unit()
	local recoil_recover = weapon and weapon:base()._recoil_recover
	if recoil_recover then
		if self._parent_unit:inventory():equipped_unit():base():in_burst_mode() then
			recoil_recover = recoil_recover * 0.75
		end
		if recoil_recover > 1 then
			recoil_recover = 1
		elseif recoil_recover < 0 then
			recoil_recover = 0
		end
	end
	self._recoil_kick.to_reduce 	= self._recoil_kick.accumulated or 0 --Crash prevention for getting elctrocuted
	self._recoil_kick.h.to_reduce 	= self._recoil_kick.h.accumulated or 0 --ditto
	self._recoil_kick.to_reduce 	= self._recoil_kick.to_reduce * recoil_recover
	self._recoil_kick.h.to_reduce 	= self._recoil_kick.h.to_reduce	* recoil_recover
	self._recoil_wait = wait or 0
end

function FPCameraPlayerBase:recoil_kick( up, down, left, right )
	local v
	v = math.lerp( up, down, math.random() )
	if self._recoil_kick.accumulated and (v + self._recoil_kick.accumulated) < 0 then
		 v = v * -1
	end
	self._recoil_kick.accumulated = (self._recoil_kick.accumulated or 0 ) + v
	if self._recoil_kick.accumulated < 0 then
		self._recoil_kick.accumulated = 0
	end
	
	local h
	h = math.lerp( left, right, math.random() )
	self._recoil_kick.h.accumulated = (self._recoil_kick.h.accumulated or 0 ) + h
end

function FPCameraPlayerBase:_vertical_recoil_kick(t, dt)
	local r_value = 0
	local player_state = self._parent_unit:movement():current_state()
	local weapon = self._parent_unit:inventory():equipped_unit()
	local center_speed = weapon and weapon:base()._center_speed
	local recoil_speed = weapon and weapon:base()._recoil_speed
	if not center_speed or not recoil_speed then 
		log("something got bust")
		return 
	end
	if center_speed then
		if center_speed < 5 then
			center_speed = 5
		elseif center_speed > 10 then
			center_speed = 10
		end
	end
	if recoil_speed then
		if recoil_speed < 0 then
			recoil_speed = 0
		end
		if player_state and player_state:in_air() then
			recoil_speed = recoil_speed * 3
		end
	end
	if self._recoil_kick.current and self._recoil_kick.current ~= self._recoil_kick.accumulated then
		local n = math.step(self._recoil_kick.current, self._recoil_kick.accumulated, (recoil_speed or 40)  * dt)
		r_value = n - self._recoil_kick.current
		if player_state and player_state:_is_using_bipod() then
			r_value = r_value * 0.25
		end
		self._recoil_kick.current = n
	elseif self._recoil_wait then
		self._recoil_wait = self._recoil_wait - dt
		if 0 > self._recoil_wait then
			self._recoil_wait = nil
		end
	elseif self._recoil_kick.to_reduce then
		self._recoil_kick.current = nil
		local n = math.lerp(self._recoil_kick.to_reduce, 0, center_speed * dt)
		r_value = -(self._recoil_kick.to_reduce - n)
		self._recoil_kick.to_reduce = n
		if player_state and player_state:_is_using_bipod() then
			r_value = r_value * 0.25
		end
		if self._recoil_kick.to_reduce == 0 then
			self._recoil_kick.to_reduce = nil
		end

	end
	return r_value
end

function FPCameraPlayerBase:_horizonatal_recoil_kick(t, dt)
	local r_value = 0
	local player_state = self._parent_unit:movement():current_state()
	local weapon = self._parent_unit:inventory():equipped_unit()
	local center_speed = weapon and weapon:base()._center_speed
	local recoil_speed = weapon and weapon:base()._recoil_speed
	if not center_speed or not recoil_speed then 
		log("something got bust")
		return 
	end
	if center_speed then
		if center_speed < 5 then
			center_speed = 5
		elseif center_speed > 10 then
			center_speed = 10
		end
	end
	if recoil_speed then
		if recoil_speed < 0 then
			recoil_speed = 0
		end
		if player_state and player_state:in_air() then
			recoil_speed = recoil_speed * 3
		end
	end
	if self._recoil_kick.h.current and self._recoil_kick.h.current ~= self._recoil_kick.h.accumulated then
		local n = math.step(self._recoil_kick.h.current, self._recoil_kick.h.accumulated, (recoil_speed or 1) * dt)
		r_value = n - self._recoil_kick.h.current
		if player_state and player_state:_is_using_bipod() then
			r_value = r_value * 0.5
		end
		self._recoil_kick.h.current = n
	elseif self._recoil_wait then
		self._recoil_wait = self._recoil_wait - dt
		if 0 > self._recoil_wait then
			self._recoil_wait = nil
		end
	elseif self._recoil_kick.h.to_reduce then
		self._recoil_kick.h.current = nil
		local n = math.lerp(self._recoil_kick.h.to_reduce, 0, center_speed * dt)
		r_value = -(self._recoil_kick.h.to_reduce - n)
		self._recoil_kick.h.to_reduce = n
		if player_state and player_state:_is_using_bipod() then
			r_value = r_value * 0.5
		end
		if self._recoil_kick.h.to_reduce == 0 then
			self._recoil_kick.h.to_reduce = nil
		end

	end

	return r_value
end

local mrot1 = Rotation()
local mrot2 = Rotation()
local mrot3 = Rotation()
local mrot4 = Rotation()
local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
local mvec4 = Vector3()
function FPCameraPlayerBase:_update_rot(axis)
	if self._animate_pitch then
		self:animate_pitch_upd()
	end
	local t = managers.player:player_timer():time()
	local dt = t - (self._last_rot_t or t)
	self._last_rot_t = t
	local data = self._camera_properties
	local new_head_pos = mvec2
	local new_shoulder_pos = mvec1
	local new_shoulder_rot = mrot1
	local new_head_rot = mrot2
	self._parent_unit:m_position(new_head_pos)
	mvector3.add(new_head_pos, self._head_stance.translation)
	self._input.look = axis
	self._input.look_multiplier = self._parent_unit:base():controller():get_setup():get_connection("look"):get_multiplier()
	local stick_input_x, stick_input_y = self._look_function(axis, self._input.look_multiplier, dt)
	local look_polar_spin = data.spin - stick_input_x
	local look_polar_pitch = math.clamp(data.pitch + stick_input_y, -85, 85)
	local player_state = managers.player:current_state()
	if self._limits then
		if self._limits.spin then
			local d = (look_polar_spin - self._limits.spin.mid) / self._limits.spin.offset
			d = math.clamp(d, -1, 1)
			look_polar_spin = data.spin - math.lerp(stick_input_x, 0, math.abs(d))
		end
		if self._limits.pitch then
			local d = math.abs((look_polar_pitch - self._limits.pitch.mid) / self._limits.pitch.offset)
			d = math.clamp(d, -1, 1)
			look_polar_pitch = data.pitch + math.lerp(stick_input_y, 0, math.abs(d))
			look_polar_pitch = math.clamp(look_polar_pitch, -85, 85)
		end
	end
	if not self._limits or not self._limits.spin then
		look_polar_spin = look_polar_spin % 360
	end
	local look_polar = Polar(1, look_polar_pitch, look_polar_spin)
	local look_vec = look_polar:to_vector()
	local cam_offset_rot = mrot3
	mrotation.set_look_at(cam_offset_rot, look_vec, math.UP)
	if self._animate_pitch == nil then
		mrotation.set_zero(new_head_rot)
		mrotation.multiply(new_head_rot, self._head_stance.rotation)
		mrotation.multiply(new_head_rot, cam_offset_rot)
		data.pitch = look_polar_pitch
		data.spin = look_polar_spin
	end
	self._output_data.position = new_head_pos
	if self._p_exit then
		self._p_exit = false
		self._output_data.rotation = self._parent_unit:movement().fall_rotation
		mrotation.multiply(self._output_data.rotation, self._parent_unit:camera():rotation())
		data.spin = self._output_data.rotation:y():to_polar().spin
	else
		self._output_data.rotation = new_head_rot or self._output_data.rotation
	end
	if self._camera_properties.current_tilt ~= self._camera_properties.target_tilt then
		self._camera_properties.current_tilt = math.step(self._camera_properties.current_tilt, self._camera_properties.target_tilt, 150 * dt)
	end
	if self._camera_properties.current_tilt ~= 0 then
		self._output_data.rotation = Rotation(self._output_data.rotation:yaw(), self._output_data.rotation:pitch(), self._output_data.rotation:roll() + self._camera_properties.current_tilt)
	end
	local equipped_weapon = self._parent_unit:inventory():equipped_unit()
	local bipod_weapon_translation = Vector3(0, 0, 0)
	if equipped_weapon and equipped_weapon:base() then
		local weapon_tweak_data = equipped_weapon:base():weapon_tweak_data()
		if weapon_tweak_data and weapon_tweak_data.bipod_weapon_translation then
			bipod_weapon_translation = weapon_tweak_data.bipod_weapon_translation
		end
	end
	local bipod_pos = Vector3(0, 0, 0)
	local bipod_rot = new_shoulder_rot
	mvector3.set(bipod_pos, bipod_weapon_translation)
	mvector3.rotate_with(bipod_pos, self._output_data.rotation)
	mvector3.add(bipod_pos, new_head_pos)
	mvector3.set(new_shoulder_pos, self._shoulder_stance.translation)
	mvector3.add(new_shoulder_pos, self._vel_overshot.translation)
	mvector3.rotate_with(new_shoulder_pos, self._output_data.rotation)
	mvector3.add(new_shoulder_pos, new_head_pos)
	mrotation.set_zero(new_shoulder_rot)
	mrotation.multiply(new_shoulder_rot, self._output_data.rotation)
	mrotation.multiply(new_shoulder_rot, self._shoulder_stance.rotation)
	mrotation.multiply(new_shoulder_rot, self._vel_overshot.rotation)
	if player_state == "driving" then
		self:_set_camera_position_in_vehicle()
	elseif player_state == "jerry1" or player_state == "jerry2" then
		mrotation.set_zero(cam_offset_rot)
		mrotation.multiply(cam_offset_rot, self._parent_unit:movement().fall_rotation)
		mrotation.multiply(cam_offset_rot, self._output_data.rotation)
		local shoulder_pos = mvec3
		local shoulder_rot = mrot4
		mrotation.set_zero(shoulder_rot)
		mrotation.multiply(shoulder_rot, cam_offset_rot)
		mrotation.multiply(shoulder_rot, self._shoulder_stance.rotation)
		mrotation.multiply(shoulder_rot, self._vel_overshot.rotation)
		mvector3.set(shoulder_pos, self._shoulder_stance.translation)
		mvector3.add(shoulder_pos, self._vel_overshot.translation)
		mvector3.rotate_with(shoulder_pos, cam_offset_rot)
		mvector3.add(shoulder_pos, self._parent_unit:position())
		self:set_position(shoulder_pos)
		self:set_rotation(shoulder_rot)
		self._parent_unit:camera():set_position(self._parent_unit:position())
		self._parent_unit:camera():set_rotation(cam_offset_rot)
	else
		self:set_position(new_shoulder_pos)
		self:set_rotation(new_shoulder_rot)
		self._parent_unit:camera():set_position(self._output_data.position)
		self._parent_unit:camera():set_rotation(self._output_data.rotation)
	end
	if player_state == "bipod" and not self._parent_unit:movement()._current_state:in_steelsight() then
		self._parent_unit:camera():set_position(PlayerBipod._camera_pos or self._output_data.position)
		if self:is_stance_done() and DMCWO._data.no_bipod_swivel == false then
			self:set_position(PlayerBipod._shoulder_pos or new_shoulder_pos)
			self:set_rotation(bipod_rot)
		end
	elseif not self._parent_unit:movement()._current_state:in_steelsight() then
		PlayerBipod:set_camera_positions(bipod_pos, self._output_data.position)
	end
end
