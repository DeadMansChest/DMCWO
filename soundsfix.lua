if not SoundFix then

if not RaycastWeaponBase then return end

-- Header comment that will likely be deleted. This was made by 90e.
-- Reverb fixed by Doctor Mister Cool

-- Don't play a sound conventionally (unless using the saw which lacks a single fire sound)
local base_fire_sound = RaycastWeaponBase._fire_sound
function RaycastWeaponBase:_fire_sound()
	if self:get_name_id() == "saw" then
		base_fire_sound(self)
	end
end

-- Instead play the single fire noise here
local old_fire = RaycastWeaponBase.fire
function RaycastWeaponBase:fire(...)
	local result = old_fire(self, ...)
	
	-- Don't try playing the single fire sound with the saw
	if self:get_name_id() == "saw" then
		return result
	end
	
	if result then
		self:play_tweak_data_sound("fire_single", "fire")
		self:play_tweak_data_sound("stop_fire")
	end
	
	return result
end

local base_shoot_stop = RaycastWeaponBase.stop_shooting
function RaycastWeaponBase:stop_shooting()
	if self:get_name_id() == "saw" then
		base_shoot_stop(self)
	end
end

SoundFix = true

end