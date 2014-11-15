--[[
v0.4.2.4
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

if not RecoilFixer then

if not FPCameraPlayerBase then return end

function FPCameraPlayerBase:stop_shooting( wait )
	self._recoil_kick.to_reduce 	= self._recoil_kick.accumulated or 0 --Crash prevention for getting elctrocuted
	self._recoil_kick.h.to_reduce 	= self._recoil_kick.h.accumulated or 0 --ditto
	self._recoil_kick.to_reduce 	= self._recoil_kick.to_reduce * 1 --Feel free to change this to w/e multiplier (0-1)
	self._recoil_kick.h.to_reduce 	= self._recoil_kick.h.to_reduce	* 1  -- 1 = 100% recoil recovery, 0.5 = 50% recoil recovery, etc.
	self._recoil_wait = wait or 0
end

function FPCameraPlayerBase:recoil_kick( up, down, left, right )
	if math.abs( self._recoil_kick.accumulated ) < 1000 then
		local v
			v = math.lerp( up, down, math.random() )
		self._recoil_kick.accumulated = (self._recoil_kick.accumulated or 0 ) + v
	end
	
	local h
		h = math.lerp( left, right, math.random() )
	self._recoil_kick.h.accumulated = (self._recoil_kick.h.accumulated or 0 ) + h
end

function FPCameraPlayerBase:_vertical_recoil_kick(t, dt)
	local r_value = 0
	if self._recoil_kick.current and self._recoil_kick.current ~= self._recoil_kick.accumulated then
		local n = math.step(self._recoil_kick.current, self._recoil_kick.accumulated, 150 * dt)
		r_value = n - self._recoil_kick.current
		self._recoil_kick.current = n
	elseif self._recoil_wait then
		self._recoil_wait = self._recoil_wait - dt
		if 0 > self._recoil_wait then
			self._recoil_wait = nil
		end
	elseif self._recoil_kick.to_reduce then
		self._recoil_kick.current = nil
		local n = math.lerp(self._recoil_kick.to_reduce, 0, 6 * dt)
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
	if self._recoil_kick.h.current and self._recoil_kick.h.current ~= self._recoil_kick.h.accumulated then
		local n = math.step(self._recoil_kick.h.current, self._recoil_kick.h.accumulated, 150 * dt)
		r_value = n - self._recoil_kick.h.current
		self._recoil_kick.h.current = n
	elseif self._recoil_wait then
		self._recoil_wait = self._recoil_wait - dt
		if 0 > self._recoil_wait then
			self._recoil_wait = nil
		end
	elseif self._recoil_kick.h.to_reduce then
		self._recoil_kick.h.current = nil
		local n = math.lerp(self._recoil_kick.h.to_reduce, 0, 6 * dt)
		r_value = -(self._recoil_kick.h.to_reduce - n)
		self._recoil_kick.h.to_reduce = n
		if self._recoil_kick.h.to_reduce == 0 then
			self._recoil_kick.h.to_reduce = nil
		end

	end

	return r_value
end

RecoilFixer = true

end
