--[[
v1.42.3
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/units/beings/player/playerdamage" then
--{



--}
elseif RequiredScript == "lib/units/beings/player/states/playerstandard" then
--{
	function PlayerStandard:in_steelsight()
		return self._state_data.in_steelsight and self._camera_unit:base():is_stance_done()
	end
	
--[[ 	function PlayerStandard:_get_max_walk_speed(t)
		local speed_weed = self._tweak_data.movement.speed
		local movement_speed = speed_weed.STANDARD_MAX
		local speed_state = "walk"
		local dicks = self._equipped_unit and self._equipped_unit:base():weapon_tweak_data()
		if self._state_data.in_steelsight and not self._state_data.ducking and not managers.player:has_category_upgrade("player", "steelsight_normal_movement_speed") then
			movement_speed = speed_weed.STEELSIGHT_MAX
			if self._equipped_unit then
				if dicks.category == "pistol" then
					movement_speed = speed_weed.STANDARD_MAX * 0.95
					if dicks.sub_category == "carbine" then
						movement_speed = speed_weed.STANDARD_MAX * 0.6
					end
				elseif dicks.category == "akimbo" then
					movement_speed = speed_weed.STANDARD_MAX * 0.85
				elseif dicks.category == "assault_rifle" then
					movement_speed = speed_weed.STANDARD_MAX * 0.5
					if dicks.sub_category == "battle_rifle" then
						movement_speed = speed_weed.STANDARD_MAX * 0.45
					elseif dicks.sub_category == "carbine" then
						movement_speed = speed_weed.STANDARD_MAX * 0.6
					end
				elseif dicks.category == "smg" then
					movement_speed = speed_weed.STANDARD_MAX * 0.8
					if dicks.sub_category == "pdw" then
						movement_speed = speed_weed.STANDARD_MAX * 0.75
					end
				elseif dicks.category == "shotgun" then
					movement_speed = speed_weed.STANDARD_MAX * 0.7
				elseif dicks.category == "lmg" then
					movement_speed = speed_weed.STANDARD_MAX * 0.4
					if dicks.sub_category == "gpmg" then
						movement_speed = speed_weed.STANDARD_MAX * 0.3
					end
				elseif dicks.category == "snp" then
					movement_speed = speed_weed.STANDARD_MAX * 0.475
				end
				
				--bullpup bonus speed
				if dicks.is_bullpup then 
					movement_speed = movement_speed * 1.2
				end
				
				--if magic occurs, prevents modified steelsight speeds exceeding the walking state's speed
				if movement_speed > speed_weed.STANDARD_MAX then
					movement_speed = speed_weed.STANDARD_MAX
				end
			end
			speed_state = "steelsight"
		elseif self._state_data.in_steelsight and self._state_data.ducking and not managers.player:has_category_upgrade("player", "steelsight_normal_movement_speed") then
			movement_speed = speed_weed.STEELSIGHT_MAX
			if self._equipped_unit then	
				if dicks.category == "pistol" then
					movement_speed = speed_weed.CROUCHING_MAX * 0.95
					if dicks.sub_category == "carbine" then
						movement_speed = speed_weed.CROUCHING_MAX * 0.6
					end
				elseif dicks.category == "akimbo" then
					movement_speed = speed_weed.CROUCHING_MAX * 0.85
				elseif dicks.category == "assault_rifle" then
					movement_speed = speed_weed.CROUCHING_MAX * 0.5
					if dicks.sub_category == "battle_rifle" then
						movement_speed = speed_weed.CROUCHING_MAX * 0.45
					elseif dicks.sub_category == "carbine" then
						movement_speed = speed_weed.CROUCHING_MAX * 0.6
					end
				elseif dicks.category == "smg" then
					movement_speed = speed_weed.CROUCHING_MAX * 0.8
					if dicks.sub_category == "pdw" then
						movement_speed = speed_weed.CROUCHING_MAX * 0.75
					end
				elseif dicks.category == "shotgun" then
					movement_speed = speed_weed.CROUCHING_MAX * 0.7
				elseif dicks.category == "lmg" then
					movement_speed = speed_weed.CROUCHING_MAX * 0.4
					if dicks.sub_category == "gpmg" then
						movement_speed = speed_weed.CROUCHING_MAX * 0.3
					end
				elseif dicks.category == "snp" then
					movement_speed = speed_weed.CROUCHING_MAX * 0.45
				end
				
				--bullpup bonus speed
				if dicks.is_bullpup then 
					movement_speed = movement_speed * 1.2
				end
				
				--if magic occurs, prevents modified steelsight speeds exceeding the crouched state's speed
				if movement_speed > speed_weed.CROUCHING_MAX then
					movement_speed = speed_weed.CROUCHING_MAX
				end
			end
			speed_state = "steelsight"
		elseif self:on_ladder() then
			movement_speed = speed_weed.CLIMBING_MAX
			speed_state = "climb"
		elseif self._state_data.ducking then
			movement_speed = speed_weed.CROUCHING_MAX
			speed_state = "crouch"
		elseif self._state_data.in_air then
			movement_speed = speed_weed.INAIR_MAX
			speed_state = nil
		elseif self._running then
			movement_speed = speed_weed.RUNNING_MAX
			speed_state = "run"
		end
		local morale_boost_bonus = self._ext_movement:morale_boost()
		local multiplier = managers.player:movement_speed_multiplier(speed_state, speed_state and morale_boost_bonus and morale_boost_bonus.move_speed_bonus)
		local apply_weapon_penalty = true
		if self:_is_meleeing() then
			local melee_entry = managers.blackmarket:equipped_melee_weapon()
			apply_weapon_penalty = not tweak_data.blackmarket.melee_weapons[melee_entry].stats.remove_weapon_movement_penalty
		end
		if alive(self._equipped_unit) and apply_weapon_penalty then
			multiplier = multiplier * self._equipped_unit:base():movement_penalty()
		end
		return movement_speed * multiplier
	end
 ]]
--}
end