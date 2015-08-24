--[[
v1.42
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

function FPCameraPlayerBase:stop_shooting( wait )
	local weapon = self._parent_unit:inventory():equipped_unit()
	local recoil_recover = weapon and self._parent_unit:inventory():equipped_unit():base()._recoil_recover	
	if self._parent_unit:inventory():equipped_unit():base():in_burst_mode() then
		recoil_recover = recoil_recover * 0.80
	end
	if recoil_recover > 1 then
		recoil_recover = 1
	elseif recoil_recover < 0 then
		recoil_recover = 0
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
		 v = 0
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
	local weapon = self._parent_unit:inventory():equipped_unit()
	local center_speed = weapon and self._parent_unit:inventory():equipped_unit():base()._center_speed
	if center_speed < 5 then
		center_speed = 5
	elseif center_speed > 10 then
		center_speed = 10
	end
	local recoil_speed = weapon and self._parent_unit:inventory():equipped_unit():base()._recoil_speed
	if recoil_speed < 0 then
		recoil_speed = 0
	end
	if self._recoil_kick.current and self._recoil_kick.current ~= self._recoil_kick.accumulated then
		local n = math.step(self._recoil_kick.current, self._recoil_kick.accumulated, recoil_speed * dt)
		r_value = n - self._recoil_kick.current
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
		if self._recoil_kick.to_reduce == 0 then
			self._recoil_kick.to_reduce = nil
		end

	end
	return r_value
end


function FPCameraPlayerBase:_horizonatal_recoil_kick(t, dt)
	local r_value = 0
	local weapon = self._parent_unit:inventory():equipped_unit()
	local center_speed = weapon and self._parent_unit:inventory():equipped_unit():base()._center_speed
	if center_speed < 5 then
		center_speed = 5
	elseif center_speed > 10 then
		center_speed = 10
	end
	local recoil_speed = weapon and self._parent_unit:inventory():equipped_unit():base()._recoil_speed
	if recoil_speed < 0 then
		recoil_speed = 0
	end
	if self._recoil_kick.h.current and self._recoil_kick.h.current ~= self._recoil_kick.h.accumulated then
		local n = math.step(self._recoil_kick.h.current, self._recoil_kick.h.accumulated, recoil_speed * dt)
		r_value = n - self._recoil_kick.h.current
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
		if self._recoil_kick.h.to_reduce == 0 then
			self._recoil_kick.h.to_reduce = nil
		end

	end

	return r_value
end
