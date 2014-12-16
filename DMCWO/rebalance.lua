--[[
v1.0.1
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

if not RebalanceScript then

--If set to true, sets the name and description to reference The Walking Dead
local twdbat = false

--if set to true, changes the money bundle name and description to reference Harry Enfield's "Loadsamoney" music video
local lodsofemone = false

--If set to true, using the fists allows you to turn into Kenshiro from Hokuto No Ken (Fist of the North Star)
--AAAH-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA
local kenshiro = false

--[[DONT TOUCH THE SHIZZLE BELOW (if you don't know what you're doing)]]--

if not tweak_data then return end

--[[ GENERAL ]]--

local pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
local pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
local ar_type_hold = {'amcar','m16','new_m4','olympic','new_mp5','ak5'}
for i, wep_id in ipairs(ar_type_hold) do
	local pivot_head_translation = Vector3(9,20,-4)
	local pivot_head_rotation = Rotation(0,0,-1)
	tweak_data.player.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(7,18,-2)
	pivot_head_rotation = Rotation(0,0,-2)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()	
end

pivot_shoulder_translation = Vector3(10.7353, 23.0139, -1.43553)
pivot_shoulder_rotation = Rotation(0.106665, -0.0845104, 0.629231)
ak_type_hold = {'saiga','akm','ak74','akmsu'}
for i, wep_id in ipairs(ak_type_hold) do
	pivot_head_translation = Vector3(9, 24, 0)
	pivot_head_rotation = Rotation(0.0, 0.0, -1)
	tweak_data.player.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(7, 22, 2)
	pivot_head_rotation = Rotation(0.0, 0.0, -2)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

pivot_shoulder_translation = Vector3(11.4931, 42.3369, -0.596629)
pivot_shoulder_rotation = Rotation(-0.34809, 0.254047, 0.28066)
akimbo_type_wep = {'jowi','x_deagle','x_1911','x_b92fs'}
for i, wep_id in ipairs(akimbo_type_wep) do
	pivot_head_translation = Vector3(10.95, 38, -2)
	pivot_head_rotation = Rotation(0, 0, 0)
	tweak_data.player.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(10.95, 32, -1)
	pivot_head_rotation = Rotation(0, 0, 0)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(10.95, 50, 1)
	pivot_head_rotation = Rotation(0, 0, 0)
	tweak_data.player.stances[wep_id].steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pistol_type_wep = {'glock_17','glock_18c','g22c','g26','b92fs','usp','colt_1911','ppk','p226','deagle','judge','new_raging_bull','mac10','c96'}
for i, wep_id in ipairs(pistol_type_wep) do

	pivot_head_translation = Vector3(9, 32, -4)
	pivot_head_rotation = Rotation(0, 0, -1)
	tweak_data.player.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(7, 30, -2)
	pivot_head_rotation = Rotation(0, 0, -2)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
smg_type_wep = {'mp7','mp9','uzi','scorpion'}
for i, wep_id in ipairs(smg_type_wep) do
	pivot_head_translation = Vector3(7, 42, -2)
	pivot_head_rotation = Rotation(0, 0, -1)
	tweak_data.player.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(5, 38, -0)
	pivot_head_rotation = Rotation(0, 0, -2)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
local semi_shotgun = {'benelli','spas12'}
for i, wep_id in ipairs(semi_shotgun) do
	pivot_head_translation = Vector3(10, 25, -4 )
	pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
	tweak_data.player.stances[wep_id].standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(8,23,-2)	
	pivot_head_rotation = Rotation( -0.2, 0.5, -2 )
	tweak_data.player.stances[wep_id].crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
local pump_shotgun = {'serbu','r870'}
for i, wep_id in ipairs(pump_shotgun) do
	pivot_head_translation = Vector3(9,26,-4)
	pivot_head_rotation = Rotation( 0, 0, -1 )
	tweak_data.player.stances[wep_id].standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(7,24,-2)
	pivot_head_rotation = Rotation(-0,-0,-2)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

--[[WEAPONS]]--

--SAW(s)

--just to fix it for the new extra_ammo and total_ammo_mod calculations
tweak_data.weapon.saw.stats = {
		alert_size = 9,
		suppression = 7,
		zoom = 1,
		spread = 3,
		recoil = 18,
		spread_moving = 7,
		damage = 10,
		concealment = 16,
		value = 1,
		extra_ammo = 11,
		total_ammo_mod = 101,
	}
tweak_data.weapon.saw_secondary.stats = {
		alert_size = 9,
		suppression = 7,
		zoom = 1,
		spread = 3,
		recoil = 18,
		spread_moving = 7,
		damage = 10,
		concealment = 16,
		value = 1,
		extra_ammo = 11,
		total_ammo_mod = 101,
	}

	
--M67
--Nothing to see here	

--M79
tweak_data.weapon.gre_m79.fire_mode_data.fire_rate = 0.105

tweak_data.weapon.gre_m79.stats_modifiers = {
		damage = 3.4,
	}

tweak_data.weapon.gre_m79.stats = {
		alert_size = 9,
		suppression = 2,
		zoom = 1,
		spread = 7,
		recoil = 9,
		spread_moving = 7,
		damage = 42,
		concealment = 18,
		value = 1,
		extra_ammo = 11,
		total_ammo_mod = 101,
	}

pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pivot_head_translation = Vector3(5, 42, -2)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.gre_m79.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.gre_m79.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 38, -0)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.gre_m79.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.gre_m79.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

--Judge
tweak_data.weapon.judge.category = "pistol"

tweak_data.weapon.judge.kick.standing = {2.9, 3.8, -1.8, 1.8 }
tweak_data.weapon.judge.kick.crouching = tweak_data.weapon.judge.kick.standing
tweak_data.weapon.judge.kick.steelsight = tweak_data.weapon.judge.kick.standing
		
tweak_data.weapon.judge.spread.standing = 6
tweak_data.weapon.judge.spread.crouching = tweak_data.weapon.judge.spread.standing
tweak_data.weapon.judge.spread.steelsight = tweak_data.weapon.judge.spread.standing * 0.5
tweak_data.weapon.judge.spread.moving_standing = tweak_data.weapon.judge.spread.standing
tweak_data.weapon.judge.spread.moving_crouching = tweak_data.weapon.judge.spread.standing
tweak_data.weapon.judge.spread.moving_steelsight = tweak_data.weapon.judge.spread.standing * 0.6

tweak_data.weapon.judge.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.judge.CLIP_AMMO_MAX = 5
tweak_data.weapon.judge.NR_CLIPS_MAX = 6
tweak_data.weapon.judge.AMMO_MAX = tweak_data.weapon.judge.CLIP_AMMO_MAX * tweak_data.weapon.judge.NR_CLIPS_MAX

tweak_data.weapon.judge.rays = 5

tweak_data.weapon.judge.damage_near = 100
tweak_data.weapon.judge.damage_far = 1700

tweak_data.weapon.judge.shake.fire_multiplier = 1.25
tweak_data.weapon.judge.shake.fire_steelsight_multiplier = -1.25

tweak_data.weapon.judge.fire_mode_data.fire_rate = 0.3

tweak_data.weapon.judge.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.judge.stats = {
		damage = 29,
		spread = 5,
		recoil = 6,
		spread_moving = 5,
		zoom = 1,
		concealment = 29,
		suppression = 4,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1
	}
	
	
--FAMAS (DEAGLE)
tweak_data.weapon.deagle.kick.standing = { 5.8, 6.9, -3.7, 4.0 } --changes recoil pattern to literally "fuck you"
tweak_data.weapon.deagle.kick.crouching = tweak_data.weapon.deagle.kick.standing
tweak_data.weapon.deagle.kick.steelsight = tweak_data.weapon.deagle.kick.standing

tweak_data.weapon.deagle.spread.standing = 5
tweak_data.weapon.deagle.spread.crouching = 4.5
tweak_data.weapon.deagle.spread.steelsight = 1.6
tweak_data.weapon.deagle.spread.moving_standing = tweak_data.weapon.deagle.spread.standing * 2
tweak_data.weapon.deagle.spread.moving_crouching = tweak_data.weapon.deagle.spread.crouching * 2
tweak_data.weapon.deagle.spread.moving_steelsight = tweak_data.weapon.deagle.spread.steelsight * 2

tweak_data.weapon.deagle.CLIP_AMMO_MAX = 7
tweak_data.weapon.deagle.AMMO_MAX = 35

tweak_data.weapon.deagle.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.deagle.shake.fire_multiplier = 3.5
tweak_data.weapon.deagle.shake.fire_steelsight_multiplier = -3.5

tweak_data.weapon.deagle.fire_mode_data.fire_rate = 0.27272727272727272727272727272727

tweak_data.weapon.deagle.can_shoot_through_enemy = true
tweak_data.weapon.deagle.can_shoot_through_wall = true

tweak_data.weapon.deagle.armor_piercing_chance = 0.5

tweak_data.weapon.deagle.stats = {
		damage = 49,
		spread = 6,
		recoil = 5,
		spread_moving = 6,
		zoom = 1,
		concealment = 28,
		suppression = 4,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

pivot_shoulder_translation = Vector3(8.51744, 40.6489, -3.66934)
pivot_shoulder_rotation = Rotation(0.100008, -0.96687698, 0.630289)
pivot_head_translation = Vector3(0,35,-0.75)
pivot_head_rotation = Rotation(0,-0.0,0)
tweak_data.player.stances.deagle.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.deagle.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

--AKIMBO DEAGLE
pivot_shoulder_translation = Vector3(11.4931, 42.3369, -0.596629)
pivot_shoulder_rotation = Rotation(-0.34809, 0.254047, 0.28066)
pivot_head_translation = Vector3(10.95, 58, 1)
pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.x_deagle.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.x_deagle.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.x_deagle.kick.standing = { 5.8, 6.9, -3.7, 4.0 } --changes recoil pattern to literally "fuck you"
tweak_data.weapon.x_deagle.kick.crouching = tweak_data.weapon.x_deagle.kick.standing
tweak_data.weapon.x_deagle.kick.steelsight = tweak_data.weapon.x_deagle.kick.standing

tweak_data.weapon.x_deagle.spread.standing = 5 * 1.75
tweak_data.weapon.x_deagle.spread.crouching = 4.5 * 1.75
tweak_data.weapon.x_deagle.spread.steelsight = 1.6 * 1.75
tweak_data.weapon.x_deagle.spread.moving_standing = tweak_data.weapon.x_deagle.spread.standing * 2
tweak_data.weapon.x_deagle.spread.moving_crouching = tweak_data.weapon.x_deagle.spread.crouching * 2
tweak_data.weapon.x_deagle.spread.moving_steelsight = tweak_data.weapon.x_deagle.spread.steelsight * 2

tweak_data.weapon.x_deagle.CLIP_AMMO_MAX = 7 * 2
tweak_data.weapon.x_deagle.AMMO_MAX = 35 * 2

tweak_data.weapon.x_deagle.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.x_deagle.shake.fire_multiplier = 3.5
tweak_data.weapon.x_deagle.shake.fire_steelsight_multiplier = 3.5

tweak_data.weapon.x_deagle.fire_mode_data.fire_rate = 0.27272727272727272727272727272727

tweak_data.weapon.x_deagle.can_shoot_through_enemy = true
tweak_data.weapon.x_deagle.can_shoot_through_wall = true

tweak_data.weapon.x_deagle.armor_piercing_chance = 0.5

tweak_data.weapon.x_deagle.animations.has_steelsight_stance = false

tweak_data.weapon.x_deagle.stats = {
		damage = 49,
		spread = 6,
		recoil = 5,
		spread_moving = 6,
		zoom = 1,
		concealment = 26,
		suppression = 4,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
--RAGING BULL (Bronco. 44)
tweak_data.weapon.new_raging_bull.kick.standing = { 3.9, 4.1, -2.3, 2.3 } --changes recoil pattern to heavy vertical kick
tweak_data.weapon.new_raging_bull.kick.crouching = tweak_data.weapon.new_raging_bull.kick.standing
tweak_data.weapon.new_raging_bull.kick.steelsight = tweak_data.weapon.new_raging_bull.kick.standing

tweak_data.weapon.new_raging_bull.spread.standing = 3.5
tweak_data.weapon.new_raging_bull.spread.crouching = 3
tweak_data.weapon.new_raging_bull.spread.steelsight = 1
tweak_data.weapon.new_raging_bull.spread.moving_standing = tweak_data.weapon.new_raging_bull.spread.standing * 1.9
tweak_data.weapon.new_raging_bull.spread.moving_crouching = tweak_data.weapon.new_raging_bull.spread.crouching * 1.9
tweak_data.weapon.new_raging_bull.spread.moving_steelsight = tweak_data.weapon.new_raging_bull.spread.steelsight * 2.2

tweak_data.weapon.new_raging_bull.fire_mode_data.fire_rate = 0.21428571428571428571428571428571

tweak_data.weapon.new_raging_bull.CLIP_AMMO_MAX = 6
tweak_data.weapon.new_raging_bull.AMMO_MAX = 42

tweak_data.weapon.new_raging_bull.shake.fire_multiplier = 1.75
tweak_data.weapon.new_raging_bull.shake.fire_steelsight_multiplier = -1.75

tweak_data.weapon.new_raging_bull.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.new_raging_bull.can_shoot_through_shield = true
tweak_data.weapon.new_raging_bull.can_shoot_through_enemy = true
tweak_data.weapon.new_raging_bull.can_shoot_through_wall = true

tweak_data.weapon.new_raging_bull.animations.recoil_steelsight = true

tweak_data.weapon.new_raging_bull.armor_piercing_chance = 1

tweak_data.weapon.new_raging_bull.stats = {
		damage = 41,
		spread = 8,
		recoil = 7,
		spread_moving = 5,
		zoom = 1,
		concealment = 26,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--M1911
tweak_data.weapon.colt_1911.kick.standing = { 2.0, 1.3, -1.4, 1.4 }
tweak_data.weapon.colt_1911.kick.crouching = tweak_data.weapon.colt_1911.kick.standing
tweak_data.weapon.colt_1911.kick.steelsight = tweak_data.weapon.colt_1911.kick.standing

tweak_data.weapon.colt_1911.spread.standing = 5.25
tweak_data.weapon.colt_1911.spread.crouching = 4.75
tweak_data.weapon.colt_1911.spread.steelsight = 1.5
tweak_data.weapon.colt_1911.spread.moving_standing = tweak_data.weapon.colt_1911.spread.standing * 1.5
tweak_data.weapon.colt_1911.spread.moving_crouching = tweak_data.weapon.colt_1911.spread.crouching * 1.5
tweak_data.weapon.colt_1911.spread.moving_steelsight = tweak_data.weapon.colt_1911.spread.steelsight * 1.75

tweak_data.weapon.colt_1911.CLIP_AMMO_MAX = 8
tweak_data.weapon.colt_1911.AMMO_MAX = 80

tweak_data.weapon.colt_1911.fire_mode_data.fire_rate = 0.1319

tweak_data.weapon.colt_1911.can_shoot_through_enemy = true
tweak_data.weapon.colt_1911.can_shoot_through_wall = true

tweak_data.weapon.colt_1911.armor_piercing_chance = 0.15

tweak_data.weapon.colt_1911.shake.fire_multiplier = 1.1
tweak_data.weapon.colt_1911.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.colt_1911.stats = {
		damage = 19,
		spread = 6,
		recoil = 11,
		spread_moving = 5,
		zoom = 1,
		concealment = 29,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
--AKIMBO 1911
tweak_data.weapon.x_1911.kick.standing = { 2.0, 1.3, -1.4, 1.4 }
tweak_data.weapon.x_1911.kick.crouching = tweak_data.weapon.x_1911.kick.standing
tweak_data.weapon.x_1911.kick.steelsight = tweak_data.weapon.x_1911.kick.standing

tweak_data.weapon.x_1911.spread.standing = 5.25 * 1.75
tweak_data.weapon.x_1911.spread.crouching = 4.75 * 1.75
tweak_data.weapon.x_1911.spread.steelsight = 1.5 * 1.75
tweak_data.weapon.x_1911.spread.moving_standing = tweak_data.weapon.x_1911.spread.standing * 2
tweak_data.weapon.x_1911.spread.moving_crouching = tweak_data.weapon.x_1911.spread.crouching * 2
tweak_data.weapon.x_1911.spread.moving_steelsight = tweak_data.weapon.x_1911.spread.steelsight * 2

tweak_data.weapon.x_1911.CLIP_AMMO_MAX = 8 *2
tweak_data.weapon.x_1911.AMMO_MAX = 80 *2

tweak_data.weapon.x_1911.fire_mode_data.fire_rate = 0.1319

tweak_data.weapon.x_1911.can_shoot_through_enemy = true
tweak_data.weapon.x_1911.can_shoot_through_wall = true

tweak_data.weapon.x_1911.armor_piercing_chance = 0.15

tweak_data.weapon.x_1911.shake.fire_multiplier = 1.1
tweak_data.weapon.x_1911.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.x_1911.stats = {
		damage = 19,
		spread = 6,
		recoil = 11,
		spread_moving = 5,
		zoom = 1,
		concealment = 27,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
--USP .45
tweak_data.weapon.usp.weapon_hold = "colt_1911"

tweak_data.weapon.usp.kick.standing = { 2.5, 1.7, -1.65, 1.65 }
tweak_data.weapon.usp.kick.crouching = tweak_data.weapon.usp.kick.standing
tweak_data.weapon.usp.kick.steelsight = tweak_data.weapon.usp.kick.standing

tweak_data.weapon.usp.spread.standing = 4.75
tweak_data.weapon.usp.spread.crouching = 4.25
tweak_data.weapon.usp.spread.steelsight = 1.3
tweak_data.weapon.usp.spread.moving_standing = tweak_data.weapon.usp.spread.standing * 1.45
tweak_data.weapon.usp.spread.moving_crouching = tweak_data.weapon.usp.spread.crouching * 1.45
tweak_data.weapon.usp.spread.moving_steelsight = tweak_data.weapon.usp.spread.steelsight * 1.8

tweak_data.weapon.usp.CLIP_AMMO_MAX = 12
tweak_data.weapon.usp.AMMO_MAX = 84

tweak_data.weapon.usp.fire_mode_data.fire_rate = 0.1277

tweak_data.weapon.usp.can_shoot_through_enemy = true
tweak_data.weapon.usp.can_shoot_through_wall = true

tweak_data.weapon.usp.armor_piercing_chance = 0.15

tweak_data.weapon.usp.shake.fire_multiplier = 1.3
tweak_data.weapon.usp.shake.fire_steelsight_multiplier = -1.3

tweak_data.weapon.usp.stats = {
		damage = 19,
		spread = 8,
		recoil = 9,
		spread_moving = 8,
		zoom = 1,
		concealment = 29,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--C96
tweak_data.weapon.c96.kick.standing = { 1.8, 2.4, -2.1, 2.1 }
tweak_data.weapon.c96.kick.crouching = tweak_data.weapon.c96.kick.standing
tweak_data.weapon.c96.kick.steelsight = tweak_data.weapon.c96.kick.standing

tweak_data.weapon.c96.spread.standing = 5
tweak_data.weapon.c96.spread.crouching = 4.5
tweak_data.weapon.c96.spread.steelsight = 1.3
tweak_data.weapon.c96.spread.moving_standing = tweak_data.weapon.c96.spread.standing * 1.3
tweak_data.weapon.c96.spread.moving_crouching = tweak_data.weapon.c96.spread.crouching * 1.3
tweak_data.weapon.c96.spread.moving_steelsight = tweak_data.weapon.c96.spread.steelsight * 1.6

tweak_data.weapon.c96.AMMO_MAX = 80

tweak_data.weapon.c96.fire_mode_data.fire_rate = 0.06

tweak_data.weapon.c96.can_shoot_through_enemy = true
tweak_data.weapon.c96.can_shoot_through_wall = true

tweak_data.weapon.c96.armor_piercing_chance = 0.30

tweak_data.weapon.c96.shake.fire_multiplier = 1.3
tweak_data.weapon.c96.shake.fire_steelsight_multiplier = -1.3	
	
tweak_data.weapon.c96.stats = {
		damage = 19,
		spread = 8,
		recoil = 8,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1
	}
	
	
--P226 (Signature .40)
tweak_data.weapon.p226.weapon_hold = "glock"

tweak_data.weapon.p226.kick.standing = { 1.3, 1.85, -1.9, 1.9 }
tweak_data.weapon.p226.kick.crouching = tweak_data.weapon.p226.kick.standing
tweak_data.weapon.p226.kick.steelsight = tweak_data.weapon.p226.kick.standing

tweak_data.weapon.p226.spread.standing = 5
tweak_data.weapon.p226.spread.crouching = 4.5
tweak_data.weapon.p226.spread.steelsight = 1.45
tweak_data.weapon.p226.spread.moving_standing = tweak_data.weapon.p226.spread.standing * 1.55
tweak_data.weapon.p226.spread.moving_crouching = tweak_data.weapon.p226.spread.crouching * 1.55
tweak_data.weapon.p226.spread.moving_steelsight = tweak_data.weapon.p226.spread.steelsight * 1.875

tweak_data.weapon.p226.fire_mode_data.fire_rate = 0.12

tweak_data.weapon.p226.CLIP_AMMO_MAX = 13
--tweak_data.weapon.p226.NR_CLIPS_MAX = 6
tweak_data.weapon.p226.AMMO_MAX = 91

tweak_data.weapon.p226.shake.fire_multiplier = 1
tweak_data.weapon.p226.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.p226.can_shoot_through_wall = true

tweak_data.weapon.p226.armor_piercing_chance = 0.075

tweak_data.weapon.p226.stats = {
		damage = 17,
		spread = 7,
		recoil = 15,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 12,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 4,
	}


	
--GRENADE 22c (Chimano Custom)
tweak_data.weapon.g22c.weapon_hold = "colt_1911"

tweak_data.weapon.g22c.kick.standing = { 1.95, 1.5, -1.5, 1.55 }
tweak_data.weapon.g22c.kick.crouching = tweak_data.weapon.g22c.kick.standing
tweak_data.weapon.g22c.kick.steelsight = tweak_data.weapon.g22c.kick.standing

tweak_data.weapon.g22c.spread.standing = 5.5
tweak_data.weapon.g22c.spread.crouching = 4.5
tweak_data.weapon.g22c.spread.steelsight = 1.7
tweak_data.weapon.g22c.spread.moving_standing = tweak_data.weapon.g22c.spread.standing * 1.45
tweak_data.weapon.g22c.spread.moving_crouching = tweak_data.weapon.g22c.spread.crouching * 1.45
tweak_data.weapon.g22c.spread.moving_steelsight = tweak_data.weapon.g22c.spread.steelsight * 1.6

tweak_data.weapon.g22c.CLIP_AMMO_MAX = 15
tweak_data.weapon.g22c.NR_CLIPS_MAX = 6
tweak_data.weapon.g22c.AMMO_MAX = tweak_data.weapon.g22c.CLIP_AMMO_MAX * tweak_data.weapon.g22c.NR_CLIPS_MAX

tweak_data.weapon.g22c.fire_mode_data.fire_rate = 0.10344827586206896551724137931034

tweak_data.weapon.g22c.can_shoot_through_wall = true

tweak_data.weapon.g22c.shake.fire_multiplier = 1
tweak_data.weapon.g22c.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.g22c.armor_piercing_chance = 0.05

tweak_data.weapon.g22c.stats = {
		damage = 17,
		spread = 6,
		recoil = 11,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 12,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
		
--GRENADE 17 (Chimano 88)
tweak_data.weapon.glock_17.kick.standing = { 1.2, 1.7, -0.8, 0.8 }
tweak_data.weapon.glock_17.kick.crouching = tweak_data.weapon.glock_17.kick.standing
tweak_data.weapon.glock_17.kick.steelsight = tweak_data.weapon.glock_17.kick.standing

tweak_data.weapon.glock_17.spread.standing = 3.5
tweak_data.weapon.glock_17.spread.crouching = 3
tweak_data.weapon.glock_17.spread.steelsight = 1.5
tweak_data.weapon.glock_17.spread.moving_standing = tweak_data.weapon.glock_17.spread.standing * 1.35
tweak_data.weapon.glock_17.spread.moving_crouching = tweak_data.weapon.glock_17.spread.crouching * 1.35
tweak_data.weapon.glock_17.spread.moving_steelsight = tweak_data.weapon.glock_17.spread.steelsight * 1.5

tweak_data.weapon.glock_17.CLIP_AMMO_MAX = 17
tweak_data.weapon.glock_17.AMMO_MAX = 153

tweak_data.weapon.glock_17.fire_mode_data.fire_rate = 0.09230769230769230769230769230769

tweak_data.weapon.glock_17.shake.fire_multiplier = 1
tweak_data.weapon.glock_17.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.glock_17.stats = {
		damage = 11,
		spread = 7,
		recoil = 17,
		spread_moving = 7,
		zoom = 1,
		concealment = 30,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	

--GRENADE 18c (Stryk 18c)
tweak_data.weapon.glock_18c.kick.standing = { 1.7, -0.8, -1.7, 1.7 }
tweak_data.weapon.glock_18c.kick.crouching = tweak_data.weapon.glock_18c.kick.standing
tweak_data.weapon.glock_18c.kick.steelsight = tweak_data.weapon.glock_18c.kick.standing

tweak_data.weapon.glock_18c.CLIP_AMMO_MAX = 17
tweak_data.weapon.glock_18c.AMMO_MAX = 153

tweak_data.weapon.glock_18c.spread.standing = 4
tweak_data.weapon.glock_18c.spread.crouching = 3.5
tweak_data.weapon.glock_18c.spread.steelsight = 1.6
tweak_data.weapon.glock_18c.spread.moving_standing = tweak_data.weapon.glock_18c.spread.standing * 1.35
tweak_data.weapon.glock_18c.spread.moving_crouching = tweak_data.weapon.glock_18c.spread.crouching * 1.35
tweak_data.weapon.glock_18c.spread.moving_steelsight = tweak_data.weapon.glock_18c.spread.steelsight * 1.5

tweak_data.weapon.glock_18c.fire_mode_data.fire_rate = 0.05

tweak_data.weapon.glock_18c.shake.fire_multiplier = 1
tweak_data.weapon.glock_18c.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.glock_18c.stats = {
		damage = 11,
		spread = 7,
		recoil = 11,
		spread_moving = 9,
		zoom = 1,
		concealment = 29,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--GRENADE 26 (Compact Chimano)
pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pivot_head_translation = Vector3(-0.02, 37, 0.3)
pivot_head_rotation = Rotation(0, 0.2, 0)
tweak_data.player.stances.g26.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g26.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.g26.kick.standing = { 1.2, 0.8, -0.95, 0.95 }
tweak_data.weapon.g26.kick.crouching = tweak_data.weapon.g26.kick.standing
tweak_data.weapon.g26.kick.steelsight = tweak_data.weapon.g26.kick.standing

tweak_data.weapon.g26.spread.standing = 3.5
tweak_data.weapon.g26.spread.crouching = 3
tweak_data.weapon.g26.spread.steelsight = 1.65
tweak_data.weapon.g26.spread.moving_standing = tweak_data.weapon.g26.spread.standing * 1.1
tweak_data.weapon.g26.spread.moving_crouching = tweak_data.weapon.g26.spread.crouching * 1.1
tweak_data.weapon.g26.spread.moving_steelsight = tweak_data.weapon.g26.spread.steelsight * 1.3

tweak_data.weapon.g26.CLIP_AMMO_MAX = 10
tweak_data.weapon.g26.AMMO_MAX = 150

tweak_data.weapon.g26.shake.fire_multiplier = 1.1
tweak_data.weapon.g26.shake.fire_steelsight_multiplier = -1.1
	
tweak_data.weapon.g26.stats = {
		damage = 11,
		spread = 5,
		recoil = 21,
		spread_moving = 9,
		zoom = 1,
		concealment = 30,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1
	}
--AKIMBO G26
tweak_data.weapon.jowi.kick.standing = { 1.2, 0.8, -0.95, 0.95 }
tweak_data.weapon.jowi.kick.crouching = tweak_data.weapon.jowi.kick.standing
tweak_data.weapon.jowi.kick.steelsight = tweak_data.weapon.jowi.kick.standing

tweak_data.weapon.jowi.spread.standing = 3.5 * 1.75
tweak_data.weapon.jowi.spread.crouching = 3 * 1.75
tweak_data.weapon.jowi.spread.steelsight = 1.65 * 1.75
tweak_data.weapon.jowi.spread.moving_standing = tweak_data.weapon.jowi.spread.standing * 2
tweak_data.weapon.jowi.spread.moving_crouching = tweak_data.weapon.jowi.spread.crouching * 2
tweak_data.weapon.jowi.spread.moving_steelsight = tweak_data.weapon.jowi.spread.steelsight * 2

tweak_data.weapon.jowi.CLIP_AMMO_MAX = 10 * 2
tweak_data.weapon.jowi.AMMO_MAX = 150 * 2

tweak_data.weapon.jowi.shake.fire_multiplier = 1.1
tweak_data.weapon.jowi.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.jowi.stats = {
		damage = 11,
		spread = 5,
		recoil = 21,
		spread_moving = 9,
		zoom = 1,
		concealment = 28,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1
	}
	
	
--92FS (Bernetti 9)
tweak_data.weapon.b92fs.kick.standing = { 1.8, 1.9, -0.6, 0.6 }
tweak_data.weapon.b92fs.kick.crouching = tweak_data.weapon.b92fs.kick.standing
tweak_data.weapon.b92fs.kick.steelsight = tweak_data.weapon.b92fs.kick.standing

tweak_data.weapon.b92fs.CLIP_AMMO_MAX = 15
tweak_data.weapon.b92fs.NR_CLIPS_MAX = 10
tweak_data.weapon.b92fs.AMMO_MAX = tweak_data.weapon.b92fs.CLIP_AMMO_MAX * tweak_data.weapon.b92fs.NR_CLIPS_MAX

tweak_data.weapon.b92fs.spread.standing = 3.5
tweak_data.weapon.b92fs.spread.crouching = 3
tweak_data.weapon.b92fs.spread.steelsight = 1.4
tweak_data.weapon.b92fs.spread.moving_standing = tweak_data.weapon.b92fs.spread.standing * 1.5
tweak_data.weapon.b92fs.spread.moving_crouching = tweak_data.weapon.b92fs.spread.crouching * 1.5
tweak_data.weapon.b92fs.spread.moving_steelsight = tweak_data.weapon.b92fs.spread.steelsight * 1.8

tweak_data.weapon.b92fs.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.b92fs.shake.fire_multiplier = 1
tweak_data.weapon.b92fs.shake.fire_steelsight_multiplier = -1
	
tweak_data.weapon.b92fs.stats = {
		damage = 11,
		spread = 8,
		recoil = 15,
		spread_moving = 5,
		zoom = 1,
		concealment = 30,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
--AKIMBO 92FS
tweak_data.weapon.x_b92fs.kick.standing = { 1.8, 1.9, -0.6, 0.6 }
tweak_data.weapon.x_b92fs.kick.crouching = tweak_data.weapon.x_b92fs.kick.standing
tweak_data.weapon.x_b92fs.kick.steelsight = tweak_data.weapon.x_b92fs.kick.standing

tweak_data.weapon.x_b92fs.CLIP_AMMO_MAX = 15 * 2
tweak_data.weapon.x_b92fs.AMMO_MAX = 150 * 2

tweak_data.weapon.x_b92fs.spread.standing = 3.5 * 1.75
tweak_data.weapon.x_b92fs.spread.crouching = 3 * 1.75
tweak_data.weapon.x_b92fs.spread.steelsight = 1.4 * 1.75
tweak_data.weapon.x_b92fs.spread.moving_standing = tweak_data.weapon.x_b92fs.spread.standing * 2
tweak_data.weapon.x_b92fs.spread.moving_crouching = tweak_data.weapon.x_b92fs.spread.crouching * 2
tweak_data.weapon.x_b92fs.spread.moving_steelsight = tweak_data.weapon.x_b92fs.spread.steelsight * 2

tweak_data.weapon.x_b92fs.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.x_b92fs.shake.fire_multiplier = 1
tweak_data.weapon.x_b92fs.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.x_b92fs.stats = {
		damage = 11,
		spread = 8,
		recoil = 15,
		spread_moving = 5,
		zoom = 1,
		concealment = 28,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	

--James Bond (Gruber Kurz)
tweak_data.weapon.ppk.kick.standing = { 1.1, 1.5, -0.55, 0.55 }
tweak_data.weapon.ppk.kick.crouching = tweak_data.weapon.ppk.kick.standing
tweak_data.weapon.ppk.kick.steelsight = tweak_data.weapon.ppk.kick.standing

tweak_data.weapon.ppk.CLIP_AMMO_MAX = 10
tweak_data.weapon.ppk.AMMO_MAX = 150

tweak_data.weapon.ppk.spread.standing = 3.3
tweak_data.weapon.ppk.spread.crouching = 2.8
tweak_data.weapon.ppk.spread.steelsight = 1.55
tweak_data.weapon.ppk.spread.moving_standing = tweak_data.weapon.ppk.spread.standing * 1.2
tweak_data.weapon.ppk.spread.moving_crouching = tweak_data.weapon.ppk.spread.crouching * 1.2
tweak_data.weapon.ppk.spread.moving_steelsight = tweak_data.weapon.ppk.spread.steelsight * 1.4

tweak_data.weapon.ppk.fire_mode_data.fire_rate = 0.083333333333333

tweak_data.weapon.ppk.shake.fire_multiplier = 1
tweak_data.weapon.ppk.shake.fire_steelsight_multiplier = -1
	
tweak_data.weapon.ppk.stats = {
		damage = 11,
		spread = 6,
		recoil = 17,
		spread_moving = 9,
		zoom = 1,
		concealment = 30,
		suppression = 17,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--MARK 10
tweak_data.weapon.mac10.kick.standing = { -0.7, 1.8, -1.7, 1.7 }
tweak_data.weapon.mac10.kick.crouching = tweak_data.weapon.mac10.kick.standing
tweak_data.weapon.mac10.kick.steelsight = tweak_data.weapon.mac10.kick.standing

tweak_data.weapon.mac10.spread.standing = 3.75
tweak_data.weapon.mac10.spread.crouching = 3.25
tweak_data.weapon.mac10.spread.steelsight = 1.55
tweak_data.weapon.mac10.spread.moving_standing = tweak_data.weapon.mac10.spread.standing * 1.3
tweak_data.weapon.mac10.spread.moving_crouching = tweak_data.weapon.mac10.spread.crouching * 1.3
tweak_data.weapon.mac10.spread.moving_steelsight = tweak_data.weapon.mac10.spread.steelsight * 1.3

tweak_data.weapon.mac10.fire_mode_data.fire_rate = 0.0521739130434

tweak_data.weapon.mac10.can_shoot_through_enemy = true
tweak_data.weapon.mac10.can_shoot_through_wall = true

tweak_data.weapon.mac10.CLIP_AMMO_MAX = 20
tweak_data.weapon.mac10.AMMO_MAX = 120

tweak_data.weapon.mac10.armor_piercing_chance = 0.1

tweak_data.weapon.mac10.shake.fire_multiplier = 0.75
tweak_data.weapon.mac10.shake.fire_steelsight_multiplier = -0.75

tweak_data.weapon.mac10.stats = {
		damage = 17,
		spread = 6,
		recoil = 11,
		spread_moving = 8,
		zoom = 1,
		concealment = 27,
		suppression = 9,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--Thompson
pivot_head_translation = Vector3(8, 36, -8)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.m1928.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.m1928.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6, 34, -6)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.m1928.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.m1928.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.m1928.kick.standing = { -0.6, 1.2, -2.0, 2.0 }
tweak_data.weapon.m1928.kick.crouching = tweak_data.weapon.m1928.kick.standing
tweak_data.weapon.m1928.kick.steelsight = tweak_data.weapon.m1928.kick.standing

tweak_data.weapon.m1928.spread.standing = 6.25
tweak_data.weapon.m1928.spread.crouching = 5.75
tweak_data.weapon.m1928.spread.steelsight = 1.3
tweak_data.weapon.m1928.spread.moving_standing = tweak_data.weapon.m1928.spread.standing * 1.6
tweak_data.weapon.m1928.spread.moving_crouching = tweak_data.weapon.m1928.spread.crouching * 1.6
tweak_data.weapon.m1928.spread.moving_steelsight = tweak_data.weapon.m1928.spread.steelsight * 1.6

tweak_data.weapon.m1928.fire_mode_data.fire_rate = 0.08275862068965517241379310344828

tweak_data.weapon.m1928.can_shoot_through_enemy = true
tweak_data.weapon.m1928.can_shoot_through_wall = true

tweak_data.weapon.m1928.CLIP_AMMO_MAX = 50
tweak_data.weapon.m1928.AMMO_MAX = 100

tweak_data.weapon.m1928.armor_piercing_chance = 0.1

tweak_data.weapon.m1928.shake.fire_multiplier = 0.45
tweak_data.weapon.m1928.shake.fire_steelsight_multiplier = -0.45

tweak_data.weapon.m1928.stats = {
		damage = 19,
		spread = 7,
		recoil = 19,
		spread_moving = 8,
		zoom = 1,
		concealment = 18,
		suppression = 9,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--M45
pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pivot_head_translation = Vector3(8, 42, -1)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.m45.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.m45.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6, 40, 1)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.m45.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.m45.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
tweak_data.weapon.m45.kick.standing = { -0.5, 1.45, -2.2, 2.2 }
tweak_data.weapon.m45.kick.crouching = tweak_data.weapon.m45.kick.standing
tweak_data.weapon.m45.kick.steelsight = tweak_data.weapon.m45.kick.standing

tweak_data.weapon.m45.spread.standing = 4.75
tweak_data.weapon.m45.spread.crouching = 4.25
tweak_data.weapon.m45.spread.steelsight = 1.7
tweak_data.weapon.m45.spread.moving_standing = tweak_data.weapon.m45.spread.standing * 1.3
tweak_data.weapon.m45.spread.moving_crouching = tweak_data.weapon.m45.spread.crouching * 1.3
tweak_data.weapon.m45.spread.moving_steelsight = tweak_data.weapon.m45.spread.steelsight * 1.3

tweak_data.weapon.m45.CLIP_AMMO_MAX = 36
tweak_data.weapon.m45.AMMO_MAX = 144 

tweak_data.weapon.m45.stats = {
		damage = 13,
		spread = 6,
		recoil = 20,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 5,
	}
	

--Uzi
tweak_data.weapon.uzi.kick.standing = { -0.4, 1.7, -1.1, 1.1 }
tweak_data.weapon.uzi.kick.crouching = tweak_data.weapon.uzi.kick.standing
tweak_data.weapon.uzi.kick.steelsight = tweak_data.weapon.uzi.kick.standing

tweak_data.weapon.uzi.spread.standing = 4
tweak_data.weapon.uzi.spread.crouching = 3.5
tweak_data.weapon.uzi.spread.steelsight = 1.5
tweak_data.weapon.uzi.spread.moving_standing = tweak_data.weapon.uzi.spread.standing * 1.5
tweak_data.weapon.uzi.spread.moving_crouching = tweak_data.weapon.uzi.spread.crouching * 1.5
tweak_data.weapon.uzi.spread.moving_steelsight = tweak_data.weapon.uzi.spread.steelsight * 1.5

tweak_data.weapon.uzi.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.uzi.CLIP_AMMO_MAX = 32
tweak_data.weapon.uzi.AMMO_MAX = 160

tweak_data.weapon.uzi.timers.reload_not_empty = 2.2

tweak_data.weapon.uzi.stats = {
		damage = 13,
		spread = 7,
		recoil = 18,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}


--Glorious Czechnology (Skorpion)
tweak_data.weapon.scorpion.kick.standing = { 1.5, -0.7, -1.3, 1.3 }
tweak_data.weapon.scorpion.kick.crouching = tweak_data.weapon.scorpion.kick.standing
tweak_data.weapon.scorpion.kick.steelsight = tweak_data.weapon.scorpion.kick.standing

tweak_data.weapon.scorpion.spread.standing = 3.25
tweak_data.weapon.scorpion.spread.crouching = 2.75
tweak_data.weapon.scorpion.spread.steelsight = 1.55
tweak_data.weapon.scorpion.spread.moving_standing = tweak_data.weapon.scorpion.spread.standing * 1.4
tweak_data.weapon.scorpion.spread.moving_crouching = tweak_data.weapon.scorpion.spread.crouching * 1.4
tweak_data.weapon.scorpion.spread.moving_steelsight = tweak_data.weapon.scorpion.spread.steelsight * 1.4

tweak_data.weapon.scorpion.fire_mode_data.fire_rate = 0.070588235294117

tweak_data.weapon.scorpion.AMMO_MAX = 160

tweak_data.weapon.scorpion.shake.fire_multiplier = 1
tweak_data.weapon.scorpion.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.scorpion.stats = {
		damage = 11,
		spread = 6,
		recoil = 16,
		spread_moving = 7,
		zoom = 1,
		concealment = 28,
		suppression = 17,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 7
	}

	
--S-cool Shooting (TEC-9)
tweak_data.weapon.tec9.category = "pistol"

tweak_data.weapon.tec9.kick.standing = { -0.3, 1.9, -1.8, 0.9 }
tweak_data.weapon.tec9.kick.crouching = tweak_data.weapon.tec9.kick.standing
tweak_data.weapon.tec9.kick.steelsight = tweak_data.weapon.tec9.kick.standing

tweak_data.weapon.tec9.spread.standing = 5.25
tweak_data.weapon.tec9.spread.crouching = 4.75
tweak_data.weapon.tec9.spread.steelsight = 1.65
tweak_data.weapon.tec9.spread.moving_standing = tweak_data.weapon.tec9.spread.standing * 1.6
tweak_data.weapon.tec9.spread.moving_crouching = tweak_data.weapon.tec9.spread.crouching * 1.6
tweak_data.weapon.tec9.spread.moving_steelsight = tweak_data.weapon.tec9.spread.steelsight * 1.6

tweak_data.weapon.tec9.CLIP_AMMO_MAX = 32
tweak_data.weapon.tec9.AMMO_MAX = 128

tweak_data.weapon.tec9.shake.fire_multiplier = 1.2
tweak_data.weapon.tec9.shake.fire_steelsight_multiplier = -1.2

tweak_data.weapon.tec9.fire_mode_data.fire_rate = 0.075

tweak_data.weapon.tec9.stats = {
		damage = 13,
		spread = 7,
		recoil = 12,
		spread_moving = 9,
		zoom = 1,
		concealment = 29,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
}

tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_body_standard.forbids = {
		"wpn_fps_upg_i_singlefire"
	}

pivot_shoulder_translation = Vector3(8.60825, 44.5082, -5.26645)
pivot_shoulder_rotation = Rotation(0.11042, 0.0131379, 0.63049)
pivot_head_translation = Vector3(6, 36, -5)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.tec9.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.tec9.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8, 30, -3)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.tec9.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.tec9.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--Gay for FNC too (MP9)
tweak_data.weapon.mp9.kick.standing = {1.2, -0.4, -1.3, 1.3 }
tweak_data.weapon.mp9.kick.crouching = tweak_data.weapon.mp9.kick.standing
tweak_data.weapon.mp9.kick.steelsight = tweak_data.weapon.mp9.kick.standing

tweak_data.weapon.mp9.fire_mode_data.fire_rate = 0.0667

tweak_data.weapon.mp9.spread.standing = 2.75
tweak_data.weapon.mp9.spread.crouching = 2.25
tweak_data.weapon.mp9.spread.steelsight = 1.4
tweak_data.weapon.mp9.spread.moving_standing = tweak_data.weapon.mp9.spread.standing * 1.2
tweak_data.weapon.mp9.spread.moving_crouching = tweak_data.weapon.mp9.spread.crouching * 1.2
tweak_data.weapon.mp9.spread.moving_steelsight = tweak_data.weapon.mp9.spread.steelsight * 1.2

tweak_data.weapon.mp9.CLIP_AMMO_MAX = 20
tweak_data.weapon.mp9.AMMO_MAX = 150

tweak_data.weapon.mp9.shake.fire_multiplier = 0.65
tweak_data.weapon.mp9.shake.fire_steelsight_multiplier = -0.65

tweak_data.weapon.mp9.stats = {
		damage = 13,
		spread = 7,
		recoil = 14,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}


--EMPI (MP5)
pivot_shoulder_translation = Vector3(10.7414, 18.4543, -3.29175)
pivot_shoulder_rotation = Rotation(0.106934, -0.220015, 0.629729)
pivot_head_translation = Vector3(0,10,-0.05) --7
pivot_head_rotation = Rotation(0,0.25,0)
tweak_data.player.stances.new_mp5.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.new_mp5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.new_mp5.kick.standing = {1.5, -0.8, -1.35, 1.35 }
tweak_data.weapon.new_mp5.kick.crouching = tweak_data.weapon.new_mp5.kick.standing
tweak_data.weapon.new_mp5.kick.steelsight = tweak_data.weapon.new_mp5.kick.standing

tweak_data.weapon.new_mp5.spread.standing = 3.5
tweak_data.weapon.new_mp5.spread.crouching = 3
tweak_data.weapon.new_mp5.spread.steelsight = 1.3
tweak_data.weapon.new_mp5.spread.moving_standing = tweak_data.weapon.new_mp5.spread.standing * 1.3
tweak_data.weapon.new_mp5.spread.moving_crouching = tweak_data.weapon.new_mp5.spread.crouching * 1.3
tweak_data.weapon.new_mp5.spread.moving_steelsight = tweak_data.weapon.new_mp5.spread.steelsight * 1.3

tweak_data.weapon.new_mp5.fire_mode_data.fire_rate = 0.0779

tweak_data.weapon.new_mp5.AMMO_MAX = 150

tweak_data.weapon.new_mp5.shake.fire_multiplier = 0.8
tweak_data.weapon.new_mp5.shake.fire_steelsight_multiplier = -0.8

tweak_data.weapon.new_mp5.stats = {
		damage = 13,
		spread = 8,
		recoil = 18,
		spread_moving = 8,
		zoom = 1,
		concealment = 23,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--Sterling
pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pivot_head_translation = Vector3(11, 45, -6)
pivot_head_rotation = Rotation(0, 0, -8)
tweak_data.player.stances.sterling.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.sterling.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(9, 43, -4)
pivot_head_rotation = Rotation(0, 0, -6)
tweak_data.player.stances.sterling.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.sterling.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.sterling.kick.standing = {1.5, -1.0, -1.2, 1.2 }
tweak_data.weapon.sterling.kick.crouching = tweak_data.weapon.sterling.kick.standing
tweak_data.weapon.sterling.kick.steelsight = tweak_data.weapon.sterling.kick.standing

tweak_data.weapon.sterling.spread.standing = 4.75
tweak_data.weapon.sterling.spread.crouching = 4.25
tweak_data.weapon.sterling.spread.steelsight = 1.3
tweak_data.weapon.sterling.spread.moving_standing = tweak_data.weapon.sterling.spread.standing * 1.8
tweak_data.weapon.sterling.spread.moving_crouching = tweak_data.weapon.sterling.spread.crouching * 1.8
tweak_data.weapon.sterling.spread.moving_steelsight = tweak_data.weapon.sterling.spread.steelsight * 1.8

tweak_data.weapon.sterling.shake.fire_multiplier = 0.9
tweak_data.weapon.sterling.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.sterling.AMMO_MAX = 140

tweak_data.weapon.sterling.stats = {
		damage = 13,
		spread = 8,
		recoil = 16,
		spread_moving = 8,
		zoom = 1,
		concealment = 20,
		suppression = 12,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 7
	}

--MP7
tweak_data.weapon.mp7.kick.standing = {1.8, -0.6, -1.0, 1.6}
tweak_data.weapon.mp7.kick.crouching = tweak_data.weapon.mp7.kick.standing
tweak_data.weapon.mp7.kick.steelsight = tweak_data.weapon.mp7.kick.standing

tweak_data.weapon.mp7.spread.standing = 4.25
tweak_data.weapon.mp7.spread.crouching = 3.75
tweak_data.weapon.mp7.spread.steelsight = 1.2
tweak_data.weapon.mp7.spread.moving_standing = tweak_data.weapon.mp7.spread.standing * 1.4
tweak_data.weapon.mp7.spread.moving_crouching = tweak_data.weapon.mp7.spread.crouching * 1.4
tweak_data.weapon.mp7.spread.moving_steelsight = tweak_data.weapon.mp7.spread.steelsight * 1.4

tweak_data.weapon.mp7.can_shoot_through_wall = true
tweak_data.weapon.mp7.can_shoot_through_enemy = true
tweak_data.weapon.mp7.can_shoot_through_shield = true

tweak_data.weapon.mp7.CLIP_AMMO_MAX = 20
tweak_data.weapon.mp7.AMMO_MAX = 200

tweak_data.weapon.mp7.armor_piercing_chance = 0.7

tweak_data.weapon.mp7.fire_mode_data.fire_rate = 0.06315789473

tweak_data.weapon.mp7.shake.fire_multiplier = 0.7
tweak_data.weapon.mp7.shake.fire_steelsight_multiplier = -0.7

tweak_data.weapon.mp7.stats = {
		damage = 9,
		spread = 7,
		recoil = 20,
		spread_moving = 7,
		zoom = 1,
		concealment = 23,
		suppression = 15,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 7,
	}
	
--P90
pivot_shoulder_translation = Vector3(11.0002, 24.3293, -0.962641)
pivot_shoulder_rotation = Rotation(0.21279, 0.970214, 0.197877)
pivot_head_translation = Vector3(11, 24, -2)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.p90.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.p90.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(9, 22, 1)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.p90.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.p90.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.p90.kick.standing = {0.95, -0.225, -1.6, 1.6 }
tweak_data.weapon.p90.kick.crouching = tweak_data.weapon.p90.kick.standing
tweak_data.weapon.p90.kick.steelsight = tweak_data.weapon.p90.kick.standing

tweak_data.weapon.p90.spread.standing = 3.5
tweak_data.weapon.p90.spread.crouching = 3
tweak_data.weapon.p90.spread.steelsight = 1.1
tweak_data.weapon.p90.spread.moving_standing = tweak_data.weapon.p90.spread.standing * 1.3
tweak_data.weapon.p90.spread.moving_crouching = tweak_data.weapon.p90.spread.crouching * 1.3
tweak_data.weapon.p90.spread.moving_steelsight = tweak_data.weapon.p90.spread.steelsight * 1.3

tweak_data.weapon.p90.can_shoot_through_shield = true
tweak_data.weapon.p90.can_shoot_through_enemy = true
tweak_data.weapon.p90.can_shoot_through_wall = true

tweak_data.weapon.p90.armor_piercing_chance = 0.8

tweak_data.weapon.p90.fire_mode_data.fire_rate = 0.066666666666

tweak_data.weapon.p90.CLIP_AMMO_MAX = 50
tweak_data.weapon.p90.AMMO_MAX = 150

tweak_data.weapon.p90.shake.fire_multiplier = 0.57
tweak_data.weapon.p90.shake.fire_steelsight_multiplier = -0.57

tweak_data.weapon.p90.stats = {
		damage = 9,
		spread = 8,
		recoil = 16,
		spread_moving = 9,
		zoom = 1,
		concealment = 25,
		suppression = 12,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--AKMSU (Krinkov)
tweak_data.weapon.akmsu.category = "assault_rifle"

tweak_data.weapon.akmsu.kick.standing = {1.65, -0.6, -1.4, 1.4 }
tweak_data.weapon.akmsu.kick.crouching = tweak_data.weapon.akmsu.kick.standing
tweak_data.weapon.akmsu.kick.steelsight = tweak_data.weapon.akmsu.kick.standing

tweak_data.weapon.akmsu.spread.standing = 5.75
tweak_data.weapon.akmsu.spread.crouching = 4.25
tweak_data.weapon.akmsu.spread.steelsight = 1.6
tweak_data.weapon.akmsu.spread.moving_standing = tweak_data.weapon.akmsu.spread.standing * 1.6
tweak_data.weapon.akmsu.spread.moving_crouching = tweak_data.weapon.akmsu.spread.crouching * 1.6
tweak_data.weapon.akmsu.spread.moving_steelsight = tweak_data.weapon.akmsu.spread.steelsight * 1.6

tweak_data.weapon.akmsu.CLIP_AMMO_MAX = 30
tweak_data.weapon.akmsu.AMMO_MAX = 90

tweak_data.weapon.akmsu.can_shoot_through_enemy = true
tweak_data.weapon.akmsu.can_shoot_through_wall = true

tweak_data.weapon.akmsu.fire_mode_data.fire_rate = 0.0816

tweak_data.weapon.akmsu.armor_piercing_chance = 0.4

tweak_data.weapon.akmsu.stats = {
		damage = 21,
		spread = 5,
		recoil = 12,
		spread_moving = 9,
		zoom = 1,
		concealment = 21,
		suppression = 9,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--Para-triot (Olympic AR)
tweak_data.weapon.olympic.category = "assault_rifle"

tweak_data.weapon.olympic.kick.standing = { -0.9, 1.5, -1.3, 1.4 }
tweak_data.weapon.olympic.kick.crouching = tweak_data.weapon.olympic.kick.standing
tweak_data.weapon.olympic.kick.steelsight = tweak_data.weapon.olympic.kick.standing

tweak_data.weapon.olympic.spread.standing = 4
tweak_data.weapon.olympic.spread.crouching = 3.5
tweak_data.weapon.olympic.spread.steelsight = 1.5
tweak_data.weapon.olympic.spread.moving_standing = tweak_data.weapon.olympic.spread.standing * 1.25
tweak_data.weapon.olympic.spread.moving_crouching = tweak_data.weapon.olympic.spread.crouching * 1.25
tweak_data.weapon.olympic.spread.moving_steelsight = tweak_data.weapon.olympic.spread.steelsight * 1.25

tweak_data.weapon.olympic.can_shoot_through_enemy = true
tweak_data.weapon.olympic.can_shoot_through_wall = true

tweak_data.weapon.olympic.armor_piercing_chance = 0.15

tweak_data.weapon.olympic.CLIP_AMMO_MAX = 20
--tweak_data.weapon.olympic.NR_CLIPS_MAX = 8
tweak_data.weapon.olympic.AMMO_MAX = 120

tweak_data.weapon.olympic.fire_mode_data.fire_rate = 0.075

tweak_data.weapon.olympic.stats = {
		damage = 15,
		spread = 6,
		recoil = 14,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	

--AKM
tweak_data.weapon.akm.kick.standing = {1.6, -0.3, -1.35, 1.35 }
tweak_data.weapon.akm.kick.crouching = tweak_data.weapon.akm.kick.standing
tweak_data.weapon.akm.kick.steelsight = tweak_data.weapon.akm.kick.standing

tweak_data.weapon.akm.can_shoot_through_enemy = true
tweak_data.weapon.akm.can_shoot_through_wall = true

tweak_data.weapon.akm.armor_piercing_chance = 0.5

tweak_data.weapon.akm.spread.standing = 6.5
tweak_data.weapon.akm.spread.crouching = 6
tweak_data.weapon.akm.spread.steelsight = 1.5
tweak_data.weapon.akm.spread.moving_standing = tweak_data.weapon.akm.spread.standing * 1.55
tweak_data.weapon.akm.spread.moving_crouching = tweak_data.weapon.akm.spread.crouching * 1.55
tweak_data.weapon.akm.spread.moving_steelsight = tweak_data.weapon.akm.spread.steelsight * 1.55

tweak_data.weapon.akm.CLIP_AMMO_MAX = 30
tweak_data.weapon.akm.NR_CLIPS_MAX = 4
tweak_data.weapon.akm.AMMO_MAX = tweak_data.weapon.akm.CLIP_AMMO_MAX * tweak_data.weapon.akm.NR_CLIPS_MAX

tweak_data.weapon.akm.shake.fire_multiplier = 1.1
tweak_data.weapon.akm.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.akm.fire_mode_data.fire_rate = 0.1
tweak_data.weapon.akm.stats = {
		damage = 27,
		spread = 6,
		recoil = 15,
		spread_moving = 6,
		zoom = 1,
		concealment = 13,
		suppression = 8,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--GOLD AKM
tweak_data.weapon.akm_gold.kick.standing = {1.4, -0.75, -1.65, 1.65 }
tweak_data.weapon.akm_gold.kick.crouching = tweak_data.weapon.akm_gold.kick.standing
tweak_data.weapon.akm_gold.kick.steelsight = tweak_data.weapon.akm_gold.kick.standing

tweak_data.weapon.akm_gold.can_shoot_through_enemy = true
tweak_data.weapon.akm_gold.can_shoot_through_wall = true

tweak_data.weapon.akm_gold.armor_piercing_chance = 0.5

tweak_data.weapon.akm_gold.spread.standing = 6.5
tweak_data.weapon.akm_gold.spread.crouching = 6
tweak_data.weapon.akm_gold.spread.steelsight = 1.5
tweak_data.weapon.akm_gold.spread.moving_standing = tweak_data.weapon.akm_gold.spread.standing * 1.7
tweak_data.weapon.akm_gold.spread.moving_crouching = tweak_data.weapon.akm_gold.spread.crouching * 1.7
tweak_data.weapon.akm_gold.spread.moving_steelsight = tweak_data.weapon.akm_gold.spread.steelsight * 1.7

tweak_data.weapon.akm_gold.CLIP_AMMO_MAX = 30
tweak_data.weapon.akm_gold.NR_CLIPS_MAX = 4
tweak_data.weapon.akm_gold.AMMO_MAX = tweak_data.weapon.akm_gold.CLIP_AMMO_MAX * tweak_data.weapon.akm_gold.NR_CLIPS_MAX

tweak_data.weapon.akm_gold.sounds.enter_steelsight = "lmg_steelsight_enter"
tweak_data.weapon.akm_gold.sounds.leave_steelsight = "lmg_steelsight_exit"

tweak_data.weapon.akm_gold.fire_mode_data.fire_rate = 0.1142857

tweak_data.weapon.akm_gold.shake.fire_multiplier = 1.1
tweak_data.weapon.akm_gold.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.akm_gold.stats = {
		damage = 27,
		spread = 6,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 10,
		suppression = 8,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
pivot_shoulder_translation = Vector3( 10.6725, 27.7166, -4.93564 )
pivot_shoulder_rotation = Rotation( 0.1067, -0.0850111, 0.629008 )
pivot_head_translation = Vector3( 9, 22, -5 )
pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
tweak_data.player.stances.akm_gold.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.akm_gold.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 7, 20, -3 )
pivot_head_rotation = Rotation( 0.2, 0.5, -2 )
tweak_data.player.stances.akm_gold.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.akm_gold.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()


--ICHIROKU (M16)
tweak_data.weapon.m16.spread.standing = 6.25
tweak_data.weapon.m16.spread.crouching = 5.75
tweak_data.weapon.m16.spread.steelsight = 0.95
tweak_data.weapon.m16.spread.moving_standing = tweak_data.weapon.m16.spread.standing * 1.55
tweak_data.weapon.m16.spread.moving_crouching = tweak_data.weapon.m16.spread.crouching * 1.55
tweak_data.weapon.m16.spread.moving_steelsight = tweak_data.weapon.m16.spread.steelsight * 1.55

tweak_data.weapon.m16.kick.standing = { -0.45, 1.675, -1.45, 1.45 }
tweak_data.weapon.m16.kick.crouching = tweak_data.weapon.m16.kick.standing
tweak_data.weapon.m16.kick.steelsight = tweak_data.weapon.m16.kick.standing

tweak_data.weapon.m16.fire_mode_data.fire_rate = 0.070588 --850 RPM

tweak_data.weapon.m16.can_shoot_through_enemy = true
tweak_data.weapon.m16.can_shoot_through_wall = true

tweak_data.weapon.m16.armor_piercing_chance = 0.2

tweak_data.weapon.m16.shake.fire_multiplier = 0.9
tweak_data.weapon.m16.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.m16.CLIP_AMMO_MAX = 20
tweak_data.weapon.m16.AMMO_MAX = 150

tweak_data.weapon.m16.stats = {
		damage = 19,
		spread = 7,
		recoil = 13,
		spread_moving = 5,
		zoom = 1,
		concealment = 17,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--Gay for FNC (AUG)
pivot_shoulder_translation = Vector3(12.4978, 36.9949, -1.6971)
pivot_shoulder_rotation = Rotation(2.58401, -0.0831424, 0.629405)
pivot_head_translation = Vector3(11, 41, 1.5)
pivot_head_rotation = Rotation(2.5, 0, -1)
tweak_data.player.stances.aug.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.aug.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(9, 39, 3.5)
pivot_head_rotation = Rotation(2.5, 0, -2)
tweak_data.player.stances.aug.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.aug.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.aug.kick.standing = { -0.2, 1.9, -1.0, 1.0}
tweak_data.weapon.aug.kick.crouching = tweak_data.weapon.aug.kick.standing
tweak_data.weapon.aug.kick.steelsight = tweak_data.weapon.aug.kick.standing

tweak_data.weapon.aug.spread.standing = 5
tweak_data.weapon.aug.spread.crouching = 4.5
tweak_data.weapon.aug.spread.steelsight = 0.8
tweak_data.weapon.aug.spread.moving_standing = tweak_data.weapon.aug.spread.standing * 1.35
tweak_data.weapon.aug.spread.moving_crouching = tweak_data.weapon.aug.spread.crouching * 1.35
tweak_data.weapon.aug.spread.moving_steelsight = tweak_data.weapon.aug.spread.steelsight * 1.35

tweak_data.weapon.aug.CLIP_AMMO_MAX = 30
--tweak_data.weapon.aug.NR_CLIPS_MAX = 5
tweak_data.weapon.aug.AMMO_MAX = 150

tweak_data.weapon.aug.can_shoot_through_enemy = true
tweak_data.weapon.aug.can_shoot_through_wall = true

tweak_data.weapon.aug.armor_piercing_chance = 0.25

tweak_data.weapon.aug.fire_mode_data.fire_rate = 0.08571428571428571

tweak_data.weapon.aug.shake.fire_multiplier = 1
tweak_data.weapon.aug.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.aug.stats = {
		damage = 19,
		spread = 8,
		recoil = 15,
		spread_moving = 7,
		zoom = 1,
		concealment = 20,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--*Jam* (L85)
tweak_data.weapon.l85a2.kick.standing = { -0.8, 1.2, -0.95, 0.95}
tweak_data.weapon.l85a2.kick.crouching = tweak_data.weapon.l85a2.kick.standing
tweak_data.weapon.l85a2.kick.steelsight = tweak_data.weapon.l85a2.kick.standing

tweak_data.weapon.l85a2.spread.standing = 5.5
tweak_data.weapon.l85a2.spread.crouching = 5
tweak_data.weapon.l85a2.spread.steelsight = 0.6
tweak_data.weapon.l85a2.spread.moving_standing = tweak_data.weapon.l85a2.spread.standing * 1.45
tweak_data.weapon.l85a2.spread.moving_crouching = tweak_data.weapon.l85a2.spread.crouching * 1.45
tweak_data.weapon.l85a2.spread.moving_steelsight = tweak_data.weapon.l85a2.spread.steelsight * 1.45

tweak_data.weapon.l85a2.CLIP_AMMO_MAX = 30
tweak_data.weapon.l85a2.AMMO_MAX = 150

tweak_data.weapon.l85a2.can_shoot_through_enemy = true
tweak_data.weapon.l85a2.can_shoot_through_wall = true

tweak_data.weapon.l85a2.armor_piercing_chance = 0.25

tweak_data.weapon.l85a2.fire_mode_data.fire_rate = 0.098360655737704

tweak_data.weapon.l85a2.shake.fire_multiplier = 0.7
tweak_data.weapon.l85a2.shake.fire_steelsight_multiplier = -0.7

tweak_data.weapon.l85a2.stats = {
		damage = 19,
		spread = 7,
		recoil = 19,
		spread_moving = 7,
		zoom = 1,
		concealment = 16,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--DEAGLE (FAMAS)
pivot_shoulder_translation = Vector3(12.4978, 36.9949, -1.6971)
pivot_shoulder_rotation = Rotation(2.58401, -0.0831424, 0.629405)
pivot_head_translation = Vector3(10, 39, -1)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.famas.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.famas.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8, 37, 1)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.famas.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.famas.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(0, 26, 0)
pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.famas.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.famas.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.famas.kick.standing = { -1.1, 1.75, -1.7, 1.7}
tweak_data.weapon.famas.kick.crouching = tweak_data.weapon.famas.kick.standing
tweak_data.weapon.famas.kick.steelsight = tweak_data.weapon.famas.kick.standing

tweak_data.weapon.famas.spread.standing = 5.25
tweak_data.weapon.famas.spread.crouching = 4.75
tweak_data.weapon.famas.spread.steelsight = 1
tweak_data.weapon.famas.spread.moving_standing = tweak_data.weapon.famas.spread.standing * 1.4
tweak_data.weapon.famas.spread.moving_crouching = tweak_data.weapon.famas.spread.crouching * 1.4
tweak_data.weapon.famas.spread.moving_steelsight = tweak_data.weapon.famas.spread.steelsight * 1.4

tweak_data.weapon.famas.CLIP_AMMO_MAX = 25
tweak_data.weapon.famas.NR_CLIPS_MAX = 6
tweak_data.weapon.famas.AMMO_MAX = tweak_data.weapon.famas.CLIP_AMMO_MAX * tweak_data.weapon.famas.NR_CLIPS_MAX 

tweak_data.weapon.famas.can_shoot_through_enemy = true
tweak_data.weapon.famas.can_shoot_through_wall = true

tweak_data.weapon.famas.armor_piercing_chance = 0.2

tweak_data.weapon.famas.shake.fire_multiplier = 1.0
tweak_data.weapon.famas.shake.fire_steelsight_multiplier = -1.0

tweak_data.weapon.famas.stats = {
		damage = 19,
		spread = 8,
		recoil = 15,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
	
--M4A1 (CAR-4)
tweak_data.weapon.new_m4.kick.standing = { -0.8, 1.5, -1.5, 1.5}
tweak_data.weapon.new_m4.kick.crouching = tweak_data.weapon.new_m4.kick.standing
tweak_data.weapon.new_m4.kick.steelsight = tweak_data.weapon.new_m4.kick.standing

tweak_data.weapon.new_m4.spread.standing = 5.75
tweak_data.weapon.new_m4.spread.crouching = 5.25
tweak_data.weapon.new_m4.spread.steelsight = 1.1
tweak_data.weapon.new_m4.spread.moving_standing = tweak_data.weapon.new_m4.spread.standing * 1.45
tweak_data.weapon.new_m4.spread.moving_crouching = tweak_data.weapon.new_m4.spread.standing * 1.45
tweak_data.weapon.new_m4.spread.moving_steelsight = tweak_data.weapon.new_m4.spread.steelsight * 1.45

tweak_data.weapon.new_m4.fire_mode_data.fire_rate = 0.08333333333333333333333333333333

tweak_data.weapon.new_m4.can_shoot_through_enemy = true
tweak_data.weapon.new_m4.can_shoot_through_wall = true

tweak_data.weapon.new_m4.armor_piercing_chance = 0.2

tweak_data.weapon.new_m4.shake.fire_multiplier = 0.7
tweak_data.weapon.new_m4.shake.fire_steelsight_multiplier = -0.7

tweak_data.weapon.new_m4.stats = {
		damage = 19,
		spread = 6,
		recoil = 15,
		spread_moving = 6,
		zoom = 1,
		concealment = 20,
		suppression = 11,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--FNC's Sexy Swedish Cousin (AK5)
pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
pivot_head_translation = Vector3(0.01,9,-0.0)
pivot_head_rotation = Rotation(0,-0,0)
tweak_data.player.stances.ak5.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.ak5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.ak5.kick.standing = { -0.5, 1.25, -1.8, 1.8 }
tweak_data.weapon.ak5.kick.crouching = tweak_data.weapon.ak5.kick.standing
tweak_data.weapon.ak5.kick.steelsight = tweak_data.weapon.ak5.kick.standing

tweak_data.weapon.ak5.spread.standing = 5.75
tweak_data.weapon.ak5.spread.crouching = 5.25
tweak_data.weapon.ak5.spread.steelsight = 0.9
tweak_data.weapon.ak5.spread.moving_standing = tweak_data.weapon.ak5.spread.standing * 1.8
tweak_data.weapon.ak5.spread.moving_crouching = tweak_data.weapon.ak5.spread.crouching * 1.8
tweak_data.weapon.ak5.spread.moving_steelsight = tweak_data.weapon.ak5.spread.steelsight * 1.8

tweak_data.weapon.ak5.fire_mode_data.fire_rate = 0.096

tweak_data.weapon.ak5.can_shoot_through_enemy = true
tweak_data.weapon.ak5.can_shoot_through_wall = true

tweak_data.weapon.ak5.armor_piercing_chance = 0.2

tweak_data.weapon.ak5.shake.fire_multiplier = 0.95
tweak_data.weapon.ak5.shake.fire_steelsight_multiplier = -0.95

tweak_data.weapon.ak5.stats = {
		damage = 21,
		spread = 7,
		recoil = 19,
		spread_moving = 7,
		zoom = 1,
		concealment = 18,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--A Cat (AK74)
tweak_data.weapon.ak74.spread.standing = 5.75
tweak_data.weapon.ak74.spread.crouching = 5.25
tweak_data.weapon.ak74.spread.steelsight = 1.2
tweak_data.weapon.ak74.spread.moving_standing = tweak_data.weapon.ak74.spread.standing * 1.375
tweak_data.weapon.ak74.spread.moving_crouching = tweak_data.weapon.ak74.spread.crouching * 1.375
tweak_data.weapon.ak74.spread.moving_steelsight = tweak_data.weapon.ak74.spread.steelsight * 1.375

tweak_data.weapon.ak74.can_shoot_through_enemy = true
tweak_data.weapon.ak74.can_shoot_through_wall = true

tweak_data.weapon.ak74.armor_piercing_chance = 0.35

tweak_data.weapon.ak74.AMMO_MAX = 150

tweak_data.weapon.ak74.fire_mode_data.fire_rate = 0.0923

tweak_data.weapon.ak74.kick.standing = { -0.1, 1.45, -1.3, 1.3 }
tweak_data.weapon.ak74.kick.crouching = tweak_data.weapon.ak74.kick.standing
tweak_data.weapon.ak74.kick.steelsight = tweak_data.weapon.ak74.kick.standing

tweak_data.weapon.ak74.shake.fire_multiplier = 1
tweak_data.weapon.ak74.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.ak74.stats = {
		damage = 21,
		spread = 7,
		recoil = 16,
		spread_moving = 6,
		zoom = 1,
		concealment = 16,
		suppression = 9,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--M733 (AMCAR)

tweak_data.weapon.amcar.spread.standing = 4.75
tweak_data.weapon.amcar.spread.crouching = 4.25
tweak_data.weapon.amcar.spread.steelsight = 1.2
tweak_data.weapon.amcar.spread.moving_standing = tweak_data.weapon.amcar.spread.standing * 1.5
tweak_data.weapon.amcar.spread.moving_crouching = tweak_data.weapon.amcar.spread.standing * 1.5
tweak_data.weapon.amcar.spread.moving_steelsight = tweak_data.weapon.amcar.spread.steelsight * 1.5

tweak_data.weapon.amcar.kick.standing = { -0.60, 1.4, -2.1, 2.1 }
tweak_data.weapon.amcar.kick.crouching = tweak_data.weapon.amcar.kick.standing
tweak_data.weapon.amcar.kick.steelsight = tweak_data.weapon.amcar.kick.standing

tweak_data.weapon.amcar.can_shoot_through_enemy = true
tweak_data.weapon.amcar.can_shoot_through_wall = true

tweak_data.weapon.amcar.armor_piercing_chance = 0.15

tweak_data.weapon.amcar.AMMO_MAX = 180

tweak_data.weapon.amcar.fire_mode_data.fire_rate = 0.0857

tweak_data.weapon.amcar.shake.fire_multiplier = 0.9
tweak_data.weapon.amcar.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.amcar.stats = {
		damage = 17,
		spread = 6,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 21,
		suppression = 11,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
}


--No Pan (SG552)	
pivot_shoulder_translation = Vector3(10.5658, 24.8768, -1.07923)
pivot_shoulder_rotation = Rotation(-0.000313746, 0.000813967, -0.00027678)
pivot_head_translation = Vector3(11, 25, 1)
pivot_head_rotation = Rotation(0.0, 0.0, -1)
tweak_data.player.stances.s552.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.s552.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(9, 23, 3)
pivot_head_rotation = Rotation(0.0, 0.0, -2)
tweak_data.player.stances.s552.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.s552.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
tweak_data.weapon.s552.kick.standing = { -0.15, 1.9, -1.1, 1.1 }
tweak_data.weapon.s552.kick.crouching = tweak_data.weapon.s552.kick.standing
tweak_data.weapon.s552.kick.steelsight = tweak_data.weapon.s552.kick.standing

tweak_data.weapon.s552.spread.standing = 5.5
tweak_data.weapon.s552.spread.crouching = 5
tweak_data.weapon.s552.spread.steelsight = 1.1
tweak_data.weapon.s552.spread.moving_standing = tweak_data.weapon.s552.spread.standing * 1.3
tweak_data.weapon.s552.spread.moving_crouching = tweak_data.weapon.s552.spread.crouching * 1.3
tweak_data.weapon.s552.spread.moving_steelsight = tweak_data.weapon.s552.spread.steelsight * 1.3

tweak_data.weapon.s552.fire_mode_data.fire_rate = 0.0769

tweak_data.weapon.s552.can_shoot_through_enemy = true
tweak_data.weapon.s552.can_shoot_through_wall = true

tweak_data.weapon.s552.CLIP_AMMO_MAX = 30
--tweak_data.weapon.s552.NR_CLIPS_MAX = 6
tweak_data.weapon.s552.AMMO_MAX = 180

tweak_data.weapon.s552.armor_piercing_chance = 0.2

tweak_data.weapon.s552.shake.fire_multiplier = 0.6
tweak_data.weapon.s552.shake.fire_steelsight_multiplier = -0.6

tweak_data.weapon.s552.stats = {
		damage = 15,
		spread = 7,
		recoil = 14,
		spread_moving = 0,
		zoom = 1,
		concealment = 22,
		suppression = 9,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}	


--Meltgun (G36)
pivot_shoulder_translation = Vector3(10.5658, 24.8768, -1.07923)
pivot_shoulder_rotation = Rotation(-0.000313746, 0.000813967, -0.00027678)
pivot_head_translation = Vector3(-0.01,12,0)
pivot_head_rotation = Rotation(0,0,0)
tweak_data.player.stances.g36.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.g36.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(10, 26, -2)
pivot_head_rotation = Rotation(0.0, 0.0, -1)
tweak_data.player.stances.g36.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g36.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8, 24, 0)
pivot_head_rotation = Rotation(0.0, 0.0, -2)
tweak_data.player.stances.g36.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g36.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.g36.spread.standing = 5.25
tweak_data.weapon.g36.spread.crouching = 4.75
tweak_data.weapon.g36.spread.steelsight = 1.15
tweak_data.weapon.g36.spread.moving_standing = tweak_data.weapon.g36.spread.standing * 1.25
tweak_data.weapon.g36.spread.moving_crouching = tweak_data.weapon.g36.spread.crouching * 1.25
tweak_data.weapon.g36.spread.moving_steelsight = tweak_data.weapon.g36.spread.steelsight * 1.25

tweak_data.weapon.g36.kick.standing = { -0.85, 1.45, -1.55, 1.55}
tweak_data.weapon.g36.kick.crouching = tweak_data.weapon.g36.kick.standing
tweak_data.weapon.g36.kick.steelsight = tweak_data.weapon.g36.kick.standing

tweak_data.weapon.g36.can_shoot_through_enemy = true
tweak_data.weapon.g36.can_shoot_through_wall = true

tweak_data.weapon.g36.armor_piercing_chance = 0.15

tweak_data.weapon.g36.AMMO_MAX = 180

tweak_data.weapon.g36.fire_mode_data.fire_rate = 0.08

tweak_data.weapon.g36.shake.fire_multiplier = 1
tweak_data.weapon.g36.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.g36.stats = {
		damage = 17,
		spread = 7,
		recoil = 17,
		spread_moving = 8,
		zoom = 1,
		concealment = 19,
		suppression = 9,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--Pink Twintails (Saiga)
tweak_data.weapon.saiga.spread.standing = 6
tweak_data.weapon.saiga.spread.crouching = tweak_data.weapon.saiga.spread.standing
tweak_data.weapon.saiga.spread.steelsight = tweak_data.weapon.saiga.spread.standing * 0.7
tweak_data.weapon.saiga.spread.moving_standing = tweak_data.weapon.saiga.spread.standing
tweak_data.weapon.saiga.spread.moving_crouching = tweak_data.weapon.saiga.spread.standing
tweak_data.weapon.saiga.spread.moving_steelsight = tweak_data.weapon.saiga.spread.standing * 0.8

tweak_data.weapon.saiga.CLIP_AMMO_MAX = 8
tweak_data.weapon.saiga.NR_CLIPS_MAX = 10
tweak_data.weapon.saiga.AMMO_MAX = tweak_data.weapon.saiga.CLIP_AMMO_MAX * tweak_data.weapon.saiga.NR_CLIPS_MAX

tweak_data.weapon.saiga.kick.standing = {3.40, -1.80, -3.00, 3.00 }
tweak_data.weapon.saiga.kick.crouching = tweak_data.weapon.saiga.kick.standing
tweak_data.weapon.saiga.kick.steelsight = tweak_data.weapon.saiga.kick.standing

tweak_data.weapon.saiga.fire_mode_data.fire_rate = 0.109090909090909

tweak_data.weapon.saiga.rays = 8 --pellets per shot

tweak_data.weapon.saiga.damage_near = 100
tweak_data.weapon.saiga.damage_far = 2900

tweak_data.weapon.saiga.shake.fire_multiplier = 2
tweak_data.weapon.saiga.shake.fire_steelsight_multiplier = -2

tweak_data.weapon.saiga.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.saiga.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.saiga.stats = {
		damage = 19,
		spread = 5,
		recoil = 11,
		spread_moving = 7,
		zoom = 1,
		concealment = 13,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}	
	
--R870 (Reinfield 880)
--makes the shotgun less in-your-face/cover-half-of-your-screen when hip firing
pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
pivot_head_translation = Vector3(0,22,0)
pivot_head_rotation = Rotation(0,0,-0)
tweak_data.player.stances.r870.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r870.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.r870.spread.standing = 6
tweak_data.weapon.r870.spread.crouching = tweak_data.weapon.r870.spread.standing
tweak_data.weapon.r870.spread.steelsight = tweak_data.weapon.r870.spread.standing * 0.75
tweak_data.weapon.r870.spread.moving_standing = tweak_data.weapon.r870.spread.standing
tweak_data.weapon.r870.spread.moving_crouching = tweak_data.weapon.r870.spread.standing
tweak_data.weapon.r870.spread.moving_steelsight = tweak_data.weapon.r870.spread.standing * 0.85

tweak_data.weapon.r870.kick.standing = {6.0, 5.0, -4.0, 4.0 }--{3.75, 2.6, -3.25, 3.25 }
tweak_data.weapon.r870.kick.crouching = tweak_data.weapon.r870.kick.standing
tweak_data.weapon.r870.kick.steelsight = tweak_data.weapon.r870.kick.standing

tweak_data.weapon.r870.rays = 8--pellets per shot

tweak_data.weapon.r870.fire_mode_data.fire_rate = 0.66666666666666

tweak_data.weapon.r870.shake.fire_multiplier = 2.5
tweak_data.weapon.r870.shake.fire_steelsight_multiplier = -2.5

tweak_data.weapon.r870.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.r870.damage_near = 100
tweak_data.weapon.r870.damage_far = 3900

tweak_data.weapon.r870.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.r870.stats = {
		damage = 31,
		spread = 7,
		recoil = 9,
		spread_moving = 6,
		zoom = 1,
		concealment = 11,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--DOUBEAU BAWWEL SHOTGUN (MOSCONI)
--Makes the barrel end closer to the PoI for pellets instead of the vanilla ADS where PoI would be quite a ways above the end of the barrel
pivot_shoulder_translation = Vector3(10.6562, 32.9715, -6.73279)
pivot_shoulder_rotation = Rotation(0.106667, -0.0844876, 0.629223)
pivot_head_translation = Vector3(0,30,-0.6)
pivot_head_rotation = Rotation(0,1.5,-0)
tweak_data.player.stances.huntsman.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.huntsman.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6,28,-5)
pivot_head_rotation = Rotation( 0, 0, -1 )
tweak_data.player.stances.huntsman.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.huntsman.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8,26,-2)
pivot_head_rotation = Rotation( -0, -0, -2 )
tweak_data.player.stances.huntsman.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.huntsman.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.huntsman.spread.standing = 6
tweak_data.weapon.huntsman.spread.crouching = tweak_data.weapon.huntsman.spread.standing 
tweak_data.weapon.huntsman.spread.steelsight = tweak_data.weapon.huntsman.spread.standing * 0.7
tweak_data.weapon.huntsman.spread.moving_standing = tweak_data.weapon.huntsman.spread.standing 
tweak_data.weapon.huntsman.spread.moving_crouching = tweak_data.weapon.huntsman.spread.standing 
tweak_data.weapon.huntsman.spread.moving_steelsight = tweak_data.weapon.huntsman.spread.standing * 0.8

tweak_data.weapon.huntsman.rays = 8

tweak_data.weapon.huntsman.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.huntsman.damage_near = 100
tweak_data.weapon.huntsman.damage_far = 4400

tweak_data.weapon.huntsman.kick.standing = {5.0, 6.0, -4.0, 4.0 }
tweak_data.weapon.huntsman.kick.crouching = tweak_data.weapon.huntsman.kick.standing
tweak_data.weapon.huntsman.kick.steelsight = tweak_data.weapon.huntsman.kick.standing

tweak_data.weapon.huntsman.shake.fire_multiplier = 2.
tweak_data.weapon.huntsman.shake.fire_steelsight_multiplier = 2

tweak_data.weapon.huntsman.CLIP_AMMO_MAX = 2
tweak_data.weapon.huntsman.NR_CLIPS_MAX = 20
tweak_data.weapon.huntsman.AMMO_MAX = tweak_data.weapon.huntsman.CLIP_AMMO_MAX * tweak_data.weapon.huntsman.NR_CLIPS_MAX

tweak_data.weapon.huntsman.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.huntsman.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.huntsman.stats = {
		damage = 37, --52
		spread = 7,
		recoil = 11,
		spread_moving = 6,
		zoom = 1,
		concealment = 7,
		suppression = 2,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	
	
--SPAS-12
tweak_data.weapon.spas12.spread.standing = 6
tweak_data.weapon.spas12.spread.crouching = tweak_data.weapon.spas12.spread.standing
tweak_data.weapon.spas12.spread.steelsight = tweak_data.weapon.spas12.spread.standing * 0.8
tweak_data.weapon.spas12.spread.moving_standing = tweak_data.weapon.spas12.spread.standing
tweak_data.weapon.spas12.spread.moving_crouching = tweak_data.weapon.spas12.spread.standing
tweak_data.weapon.spas12.spread.moving_steelsight = tweak_data.weapon.spas12.spread.standing * 0.9

tweak_data.weapon.spas12.kick.standing = {4.0, 3.0, -6.5, 6.5 }
tweak_data.weapon.spas12.kick.crouching = tweak_data.weapon.spas12.kick.standing
tweak_data.weapon.spas12.kick.steelsight = tweak_data.weapon.spas12.kick.standing

tweak_data.weapon.spas12.shake.fire_multiplier = 1.5
tweak_data.weapon.spas12.shake.fire_steelsight_multiplier = -1.5

tweak_data.weapon.spas12.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.spas12.damage_near = 100
tweak_data.weapon.spas12.damage_far = 3150

tweak_data.weapon.spas12.rays = 8

tweak_data.weapon.spas12.CLIP_AMMO_MAX = 6
tweak_data.weapon.spas12.NR_CLIPS_MAX = 9
tweak_data.weapon.spas12.AMMO_MAX = tweak_data.weapon.spas12.CLIP_AMMO_MAX * tweak_data.weapon.spas12.NR_CLIPS_MAX

tweak_data.weapon.spas12.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.spas12.stats = {
		damage = 27,
		spread = 5,
		recoil = 13,
		spread_moving = 6,
		zoom = 1,
		concealment = 14,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--Benelli M4
tweak_data.weapon.benelli.CLIP_AMMO_MAX = 5
--tweak_data.weapon.benelli.NR_CLIPS_MAX = 12
tweak_data.weapon.benelli.AMMO_MAX = 70

tweak_data.weapon.benelli.spread.standing = 6
tweak_data.weapon.benelli.spread.crouching = tweak_data.weapon.benelli.spread.standing
tweak_data.weapon.benelli.spread.steelsight = tweak_data.weapon.benelli.spread.standing * 0.75
tweak_data.weapon.benelli.spread.moving_standing = tweak_data.weapon.benelli.spread.standing
tweak_data.weapon.benelli.spread.moving_crouching = tweak_data.weapon.benelli.spread.standing
tweak_data.weapon.benelli.spread.moving_steelsight = tweak_data.weapon.benelli.spread.standing * 0.85

tweak_data.weapon.benelli.kick.standing = {5.0, 4.5, -2.0, 2.0 }
tweak_data.weapon.benelli.kick.crouching = tweak_data.weapon.benelli.kick.standing
tweak_data.weapon.benelli.kick.steelsight = tweak_data.weapon.benelli.kick.standing

tweak_data.weapon.benelli.damage_near = 100
tweak_data.weapon.benelli.damage_far = 3400

tweak_data.weapon.benelli.shake.fire_multiplier = 2
tweak_data.weapon.benelli.shake.fire_steelsight_multiplier = -2

tweak_data.weapon.benelli.rays = 8

tweak_data.weapon.benelli.fire_mode_data.fire_rate = 0.15

tweak_data.weapon.benelli.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.benelli.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.benelli.stats = {
		damage = 21,
		spread = 6,
		recoil = 9,
		spread_moving = 70,
		zoom = 1,
		concealment = 12,
		suppression = 6,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1
	}
	
--KSG (RAVEN)
pivot_shoulder_translation = Vector3(10.8727, 25.2606, -2.09537)
pivot_shoulder_rotation = Rotation(0.248115, 0.354997, 0.892959)
pivot_head_translation = Vector3(9, 29, -2)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.ksg.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.ksg.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 27, -0)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.ksg.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.ksg.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.ksg.kick.standing = {5.0, 4.0, -5.0, 5.0 }
tweak_data.weapon.ksg.kick.crouching = tweak_data.weapon.ksg.kick.standing
tweak_data.weapon.ksg.kick.steelsight = tweak_data.weapon.ksg.kick.standing

tweak_data.weapon.ksg.fire_mode_data.fire_rate = 0.6

tweak_data.weapon.ksg.shake.fire_multiplier = 2.2
tweak_data.weapon.ksg.shake.fire_steelsight_multiplier = -2.2

tweak_data.weapon.ksg.damage_near = 100
tweak_data.weapon.ksg.damage_far = 3650

tweak_data.weapon.ksg.AMMO_MAX = 56

tweak_data.weapon.ksg.spread.standing = 6
tweak_data.weapon.ksg.spread.crouching = tweak_data.weapon.ksg.spread.standing
tweak_data.weapon.ksg.spread.steelsight = tweak_data.weapon.ksg.spread.standing * 0.6
tweak_data.weapon.ksg.spread.moving_standing = tweak_data.weapon.ksg.spread.standing
tweak_data.weapon.ksg.spread.moving_crouching = tweak_data.weapon.ksg.spread.standing
tweak_data.weapon.ksg.spread.moving_steelsight = tweak_data.weapon.ksg.spread.standing * 0.7

tweak_data.weapon.ksg.sounds.enter_steelsight = "secondary_steel_sight_enter"
tweak_data.weapon.ksg.sounds.leave_steelsight = "secondary_steel_sight_exit"

tweak_data.weapon.ksg.rays = 8

tweak_data.weapon.ksg.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.ksg.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.ksg.stats = {
		damage = 27,
		spread = 7,
		recoil = 11,
		spread_moving = 7,
		zoom = 1,
		concealment = 22,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1
	}

	
--Stubby 870 (Locomotive)
--makes the shotgun less in-your-face/cover-half-of-your-screen when hip firing
pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
pivot_head_translation = Vector3(0,22,0)
pivot_head_rotation = Rotation(0,0,0)
tweak_data.player.stances.serbu.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.serbu.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.serbu.spread.standing = 6
tweak_data.weapon.serbu.spread.crouching = tweak_data.weapon.serbu.spread.standing
tweak_data.weapon.serbu.spread.steelsight = tweak_data.weapon.serbu.spread.standing * 0.7
tweak_data.weapon.serbu.spread.moving_standing = tweak_data.weapon.serbu.spread.standing
tweak_data.weapon.serbu.spread.moving_crouching = tweak_data.weapon.serbu.spread.standing
tweak_data.weapon.serbu.spread.moving_steelsight = tweak_data.weapon.serbu.spread.standing * 0.8

tweak_data.weapon.serbu.kick.standing = {6.0, 5.0, -6.5, 6.5 }
tweak_data.weapon.serbu.kick.crouching = tweak_data.weapon.serbu.kick.standing
tweak_data.weapon.serbu.kick.steelsight = tweak_data.weapon.serbu.kick.standing

tweak_data.weapon.serbu.CLIP_AMMO_MAX = 3
tweak_data.weapon.serbu.NR_CLIPS_MAX = 16
tweak_data.weapon.serbu.AMMO_MAX = tweak_data.weapon.serbu.CLIP_AMMO_MAX * tweak_data.weapon.serbu.NR_CLIPS_MAX

tweak_data.weapon.serbu.rays = 8

tweak_data.weapon.serbu.damage_near = 100
tweak_data.weapon.serbu.damage_far = 2400

tweak_data.weapon.serbu.fire_mode_data.fire_rate = 0.42857142857142857142857142857143

tweak_data.weapon.serbu.shake.fire_multiplier = 3
tweak_data.weapon.serbu.shake.fire_steelsight_multiplier = -3

tweak_data.weapon.serbu.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
tweak_data.weapon.serbu.stats_modifiers = {
		damage = 2,
	}	
	
tweak_data.weapon.serbu.stats = {
		damage = 31,
		spread = 2,
		recoil = 5,
		spread_moving = 6,
		zoom = 1,
		concealment = 23,
		suppression = 6,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	

--Striker (STREET SWEEPER)
pivot_shoulder_translation = Vector3(10.761, 11.8207, -3.78517)
pivot_shoulder_rotation = Rotation(0.106622, -0.0844409, 0.629204)
pivot_head_translation = Vector3(8, 20, -5)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.striker.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.striker.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6, 18, -3)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.striker.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.striker.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.striker.kick.standing = {5.0, 4.0, -4.0, 4.0 } --{3.1, 2.25, -3.45, 3.45 }
tweak_data.weapon.striker.kick.crouching = tweak_data.weapon.striker.kick.standing
tweak_data.weapon.striker.kick.steelsight = tweak_data.weapon.striker.kick.standing

tweak_data.weapon.striker.spread.standing = 6
tweak_data.weapon.striker.spread.crouching = tweak_data.weapon.striker.spread.standing
tweak_data.weapon.striker.spread.steelsight = tweak_data.weapon.striker.spread.standing * 0.85
tweak_data.weapon.striker.spread.moving_standing = tweak_data.weapon.striker.spread.standing
tweak_data.weapon.striker.spread.moving_crouching = tweak_data.weapon.striker.spread.standing
tweak_data.weapon.striker.spread.moving_steelsight = tweak_data.weapon.striker.spread.standing * 0.95

tweak_data.weapon.striker.sounds.enter_steelsight = "secondary_steel_sight_enter"
tweak_data.weapon.striker.sounds.leave_steelsight = "secondary_steel_sight_exit"

tweak_data.upgrades.values.striker.reload_speed_multiplier = {0.55}

tweak_data.weapon.striker.shake.fire_multiplier = 1.5
tweak_data.weapon.striker.shake.fire_steelsight_multiplier = -1.5

tweak_data.weapon.striker.rays = 8

tweak_data.weapon.striker.AMMO_MAX = 72

tweak_data.weapon.striker.fire_mode_data.fire_rate = 0.15

tweak_data.weapon.striker.damage_near = 100
tweak_data.weapon.striker.damage_far = 2900

tweak_data.weapon.striker.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.striker.stats_modifiers = {
		damage = 2,
	}
	
tweak_data.weapon.striker.stats = {
		damage = 21,
		spread = 5,
		recoil = 6,
		spread_moving = 7,
		zoom = 1,
		concealment = 21,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1
	}

	
--ICHIYON (M308)
pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
pivot_head_translation = Vector3(10,16,-3)
pivot_head_rotation = Rotation(0,0,-1)
tweak_data.player.stances.new_m14.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.new_m14.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8,14,-1)
pivot_head_rotation = Rotation(0,0,-2)
tweak_data.player.stances.new_m14.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.new_m14.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
tweak_data.weapon.new_m14.category = "snp"

tweak_data.weapon.new_m14.spread.standing = 6.5
tweak_data.weapon.new_m14.spread.crouching = 6
tweak_data.weapon.new_m14.spread.steelsight = 0.8
tweak_data.weapon.new_m14.spread.moving_standing = tweak_data.weapon.new_m14.spread.standing * 1.5
tweak_data.weapon.new_m14.spread.moving_crouching = tweak_data.weapon.new_m14.spread.crouching * 1.5
tweak_data.weapon.new_m14.spread.moving_steelsight = tweak_data.weapon.new_m14.spread.steelsight * 2.1

tweak_data.weapon.new_m14.kick.standing = {2.45, 1.65, -1.5, 1.5 }
tweak_data.weapon.new_m14.kick.crouching = tweak_data.weapon.new_m14.kick.standing
tweak_data.weapon.new_m14.kick.steelsight = tweak_data.weapon.new_m14.kick.standing

tweak_data.weapon.new_m14.shake.fire_multiplier = 1.25
tweak_data.weapon.new_m14.shake.fire_steelsight_multiplier = -1.25

tweak_data.weapon.new_m14.fire_mode_data.fire_rate = 0.0857142857142857

tweak_data.weapon.new_m14.CLIP_AMMO_MAX = 20
tweak_data.weapon.new_m14.NR_CLIPS_MAX = 3
tweak_data.weapon.new_m14.AMMO_MAX = tweak_data.weapon.new_m14.CLIP_AMMO_MAX * tweak_data.weapon.new_m14.NR_CLIPS_MAX

tweak_data.weapon.new_m14.can_shoot_through_shield = true
tweak_data.weapon.new_m14.can_shoot_through_enemy = true
tweak_data.weapon.new_m14.can_shoot_through_wall = true

tweak_data.weapon.new_m14.armor_piercing_chance = 0.85

tweak_data.weapon.new_m14.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"

tweak_data.weapon.new_m14.stats = {
		damage = 47,
		spread = 9,
		recoil = 8,
		spread_moving = 5,
		zoom = 1,
		concealment = 8,
		suppression = 3,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

--MK17 (SCAR/MK17)
tweak_data.weapon.scar.category = "snp"

tweak_data.weapon.scar.spread.standing = 5.5
tweak_data.weapon.scar.spread.crouching = 5
tweak_data.weapon.scar.spread.steelsight = 0.85
tweak_data.weapon.scar.spread.moving_standing = tweak_data.weapon.scar.spread.standing * 1.5
tweak_data.weapon.scar.spread.moving_crouching = tweak_data.weapon.scar.spread.crouching * 1.5
tweak_data.weapon.scar.spread.moving_steelsight = tweak_data.weapon.scar.spread.steelsight * 1.9

tweak_data.weapon.scar.kick.standing = {-0.45, 1.95, -1.9, 1.9 }
tweak_data.weapon.scar.kick.crouching = tweak_data.weapon.scar.kick.standing
tweak_data.weapon.scar.kick.steelsight = tweak_data.weapon.scar.kick.standing

tweak_data.weapon.scar.shake.fire_multiplier = 1.1
tweak_data.weapon.scar.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.scar.fire_mode_data.fire_rate = 0.096

tweak_data.weapon.scar.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.scar.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.scar.can_shoot_through_shield = true
tweak_data.weapon.scar.can_shoot_through_enemy = true
tweak_data.weapon.scar.can_shoot_through_wall = true

tweak_data.weapon.scar.armor_piercing_chance = 0.85

tweak_data.weapon.scar.CLIP_AMMO_MAX = 20
tweak_data.weapon.scar.AMMO_MAX = 80

tweak_data.weapon.scar.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"

tweak_data.weapon.scar.stats = {
		damage = 35,
		spread = 8,
		recoil = 10,
		spread_moving = 5,
		zoom = 1,
		concealment = 8,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 9,
	}

pivot_shoulder_translation = Vector3(10.7353, 23.0139, -1.43553)
pivot_shoulder_rotation = Rotation(0.106665, -0.0845104, 0.629231)
pivot_head_translation = Vector3(10, 26, -2)
pivot_head_rotation = Rotation(0.0, 0.0, -1)
tweak_data.player.stances.scar.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.scar.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8, 24, 0)
pivot_head_rotation = Rotation(0.0, 0.0, -2)
tweak_data.player.stances.scar.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.scar.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

--Nee-san (FAL)
pivot_shoulder_translation = Vector3(10.6889, 30.1129, -4.31372)
pivot_shoulder_rotation = Rotation(0.106623, -0.0844514, 0.629209)
pivot_head_translation = Vector3(10, 34, -4)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.fal.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.fal.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8, 32, -2)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.fal.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.fal.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.fal.category = "snp"

tweak_data.weapon.fal.spread.standing = 5.75
tweak_data.weapon.fal.spread.crouching = 5.25
tweak_data.weapon.fal.spread.steelsight = 1.05
tweak_data.weapon.fal.spread.moving_standing = tweak_data.weapon.fal.spread.standing * 1.5
tweak_data.weapon.fal.spread.moving_crouching = tweak_data.weapon.fal.spread.crouching * 1.5
tweak_data.weapon.fal.spread.moving_steelsight = tweak_data.weapon.fal.spread.steelsight * 2.15

tweak_data.weapon.fal.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.fal.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.fal.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"

tweak_data.weapon.fal.CLIP_AMMO_MAX = 20
tweak_data.weapon.fal.NR_CLIPS_MAX = 3
tweak_data.weapon.fal.AMMO_MAX = tweak_data.weapon.fal.CLIP_AMMO_MAX * tweak_data.weapon.fal.NR_CLIPS_MAX

tweak_data.weapon.fal.can_shoot_through_shield = true
tweak_data.weapon.fal.can_shoot_through_enemy = true
tweak_data.weapon.fal.can_shoot_through_wall = true

tweak_data.weapon.fal.armor_piercing_chance = 0.85

tweak_data.weapon.fal.shake.fire_multiplier = 0.95
tweak_data.weapon.fal.shake.fire_steelsight_multiplier = -0.95

tweak_data.weapon.fal.kick.standing = {-0.7, 1.3, -2.45, 2.45 }
tweak_data.weapon.fal.kick.crouching = tweak_data.weapon.fal.kick.standing
tweak_data.weapon.fal.kick.steelsight = tweak_data.weapon.fal.kick.standing

tweak_data.weapon.fal.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.fal.stats = {
		damage = 47,
		spread = 6,
		recoil = 9,
		spread_moving = 6,
		zoom = 1,
		concealment = 10,
		suppression = 3,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

--Bottle Opener (Galil-chan)
pivot_shoulder_translation = Vector3(10.7344, 22.1028, -3.71493)
pivot_shoulder_rotation = Rotation(0.107212, -0.0843867, 0.629332)
pivot_head_translation = Vector3(0, 15, 0)
pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.galil.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.galil.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(11, 23, -3)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.galil.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.galil.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(9, 21,-1)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.galil.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.galil.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.galil.category = "snp"

tweak_data.weapon.galil.kick.standing = {-1.60, 2.45, -2.00, 2.00 }
tweak_data.weapon.galil.kick.crouching = tweak_data.weapon.galil.kick.standing
tweak_data.weapon.galil.kick.steelsight = tweak_data.weapon.galil.kick.standing

tweak_data.weapon.galil.spread.standing = 6.25
tweak_data.weapon.galil.spread.crouching = 5.75
tweak_data.weapon.galil.spread.steelsight = 1
tweak_data.weapon.galil.spread.moving_standing = tweak_data.weapon.galil.spread.standing * 1.5
tweak_data.weapon.galil.spread.moving_crouching = tweak_data.weapon.galil.spread.crouching * 1.5
tweak_data.weapon.galil.spread.moving_steelsight = tweak_data.weapon.galil.spread.steelsight * 2.35

tweak_data.weapon.galil.fire_mode_data.fire_rate = 0.08

tweak_data.weapon.galil.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"

tweak_data.weapon.galil.armor_piercing_chance = 0.8

tweak_data.weapon.galil.sounds.leave_steelsight = "primary_steel_sight_exit"
tweak_data.weapon.galil.sounds.enter_steelsight = "primary_steel_sight_enter"

tweak_data.weapon.galil.can_shoot_through_shield = true
tweak_data.weapon.galil.can_shoot_through_enemy = true
tweak_data.weapon.galil.can_shoot_through_wall = true

tweak_data.weapon.galil.CLIP_AMMO_MAX = 25
tweak_data.weapon.galil.AMMO_MAX = 75

tweak_data.weapon.galil.shake.fire_multiplier = 0.9
tweak_data.weapon.galil.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.galil.stats = {
		damage = 47,
		spread = 7,
		recoil = 8,
		spread_moving = 6,
		zoom = 1,
		concealment = 15,
		suppression = 4,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}


--Mai Raifu~ (G3)
pivot_shoulder_translation = Vector3(10.7158, 21.5452, -1.67945)
pivot_shoulder_rotation = Rotation(0.107438, -0.0837396, 0.629882)
pivot_head_translation = Vector3(0, 15, 0.2)
pivot_head_rotation = Rotation(0.0, 0.2, 0)
tweak_data.player.stances.g3.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g3.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(10, 26, -3)
pivot_head_rotation = Rotation(0.0, 0.2, -1)
tweak_data.player.stances.g3.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g3.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8, 24, -1)
pivot_head_rotation = Rotation(0.0, 0.2, -2)
tweak_data.player.stances.g3.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g3.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.g3.category = "snp"

tweak_data.weapon.g3.kick.standing = {1.2, 1.95, -1.85, 1.85 }
tweak_data.weapon.g3.kick.crouching = tweak_data.weapon.g3.kick.standing
tweak_data.weapon.g3.kick.steelsight = tweak_data.weapon.g3.kick.standing

tweak_data.weapon.g3.spread.standing = 5.75
tweak_data.weapon.g3.spread.crouching = 5.25
tweak_data.weapon.g3.spread.steelsight = 0.9
tweak_data.weapon.g3.spread.moving_standing = tweak_data.weapon.g3.spread.standing * 1.5
tweak_data.weapon.g3.spread.moving_crouching = tweak_data.weapon.g3.spread.crouching * 1.5
tweak_data.weapon.g3.spread.moving_steelsight = tweak_data.weapon.g3.spread.steelsight * 2.05

tweak_data.weapon.g3.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"

tweak_data.weapon.g3.armor_piercing_chance = 0.85

tweak_data.weapon.g3.sounds.leave_steelsight = "primary_steel_sight_exit"
tweak_data.weapon.g3.sounds.enter_steelsight = "primary_steel_sight_enter"

tweak_data.weapon.g3.can_shoot_through_shield = true
tweak_data.weapon.g3.can_shoot_through_enemy = true
tweak_data.weapon.g3.can_shoot_through_wall = true

tweak_data.weapon.g3.CLIP_AMMO_MAX = 20
tweak_data.weapon.g3.NR_CLIPS_MAX = 4
tweak_data.weapon.g3.AMMO_MAX = tweak_data.weapon.g3.CLIP_AMMO_MAX * tweak_data.weapon.g3.NR_CLIPS_MAX

tweak_data.weapon.g3.shake.fire_multiplier = 1.1
tweak_data.weapon.g3.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.g3.fire_mode_data.fire_rate = 0.12

tweak_data.weapon.g3.timers.reload_not_empty = 2.5
tweak_data.weapon.g3.timers.reload_empty = 4

tweak_data.weapon.g3.stats = {
		damage = 37,
		spread = 8,
		recoil = 10,
		spread_moving = 6,
		zoom = 1,
		concealment = 12,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}


--HK21
--Thanks to gir489 for the LMG ironsights codes
pivot_shoulder_translation = Vector3( 11.3874, 18.55, -2.08902 )
pivot_shoulder_rotation = Rotation( 3.03061, 1.08595, 1.87441 )
pivot_head_rotation = Rotation( -2.98, -0.9, -2 ) --( -3, -1, -2 )
tweak_data.player.stances.hk21.steelsight.shoulders.translation = Vector3( 0.98, 15, 0.15 ) - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation ) --( 0.99, 20, 0.1 )
tweak_data.player.stances.hk21.steelsight.shoulders.rotation = pivot_head_rotation

pivot_head_translation = Vector3( 10, 18, -7 )
pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
tweak_data.player.stances.hk21.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.hk21.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 8, 16, -5 )
pivot_head_rotation = Rotation( 0.2, 0.5, -2 )
tweak_data.player.stances.hk21.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.hk21.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.hk21.kick.standing = {2.10, -1.45, -1.95, 1.95 }
tweak_data.weapon.hk21.kick.crouching = tweak_data.weapon.hk21.kick.standing
tweak_data.weapon.hk21.kick.steelsight = tweak_data.weapon.hk21.kick.standing

tweak_data.weapon.hk21.fire_mode_data.fire_rate = 0.075

tweak_data.weapon.hk21.spread.standing = 6.5
tweak_data.weapon.hk21.spread.crouching = 6
tweak_data.weapon.hk21.spread.steelsight = 1.10
tweak_data.weapon.hk21.spread.moving_standing = tweak_data.weapon.hk21.spread.standing * 2.2
tweak_data.weapon.hk21.spread.moving_crouching = tweak_data.weapon.hk21.spread.crouching * 2.2
tweak_data.weapon.hk21.spread.moving_steelsight = tweak_data.weapon.hk21.spread.steelsight * 3

tweak_data.weapon.hk21.CLIP_AMMO_MAX = 100
tweak_data.weapon.hk21.NR_CLIPS_MAX = 2
tweak_data.weapon.hk21.AMMO_MAX = tweak_data.weapon.hk21.CLIP_AMMO_MAX * tweak_data.weapon.hk21.NR_CLIPS_MAX

tweak_data.weapon.hk21.shake.fire_multiplier = 1.0
tweak_data.weapon.hk21.shake.fire_steelsight_multiplier = -1.0

tweak_data.weapon.hk21.can_shoot_through_shield = true
tweak_data.weapon.hk21.can_shoot_through_enemy = true
tweak_data.weapon.hk21.can_shoot_through_wall = true

tweak_data.weapon.hk21.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.hk21.armor_piercing_chance = 0.6

tweak_data.weapon.hk21.stats = {
		damage = 35,
		spread = 7,
		recoil = 12,
		spread_moving = 8,
		zoom = 1,
		concealment = 2,
		suppression = 4,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 9,
	}

--M249 (KSP)
--Thanks to gir489 for the LMG ironsights codes
pivot_shoulder_translation = Vector3( 10.7806, 4.38612, 0 )
pivot_shoulder_rotation = Rotation( 0.106596, -0.0844502, 0.629187 )
pivot_head_rotation = Rotation( -0.12, 0.2, -0 )
tweak_data.player.stances.m249.steelsight.shoulders.translation = Vector3( 0.02, 10.7, 0.7 ) - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m249.steelsight.shoulders.rotation = pivot_head_rotation

pivot_head_translation = Vector3( 12, 20, -6 )
pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
tweak_data.player.stances.m249.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m249.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 10, 18, -4 )
pivot_head_rotation = Rotation( 0.2, 0.5, -2)
tweak_data.player.stances.m249.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m249.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.m249.kick.standing = { 1.60, -0.85, -1.90, 1.90 }
tweak_data.weapon.m249.kick.crouching = tweak_data.weapon.m249.kick.standing
tweak_data.weapon.m249.kick.steelsight = tweak_data.weapon.m249.kick.standing

tweak_data.weapon.m249.CLIP_AMMO_MAX = 200
tweak_data.weapon.m249.NR_CLIPS_MAX = 2
tweak_data.weapon.m249.AMMO_MAX = tweak_data.weapon.m249.CLIP_AMMO_MAX * tweak_data.weapon.m249.NR_CLIPS_MAX

tweak_data.weapon.m249.spread.standing = 6
tweak_data.weapon.m249.spread.crouching = 5.5
tweak_data.weapon.m249.spread.steelsight = 1.3
tweak_data.weapon.m249.spread.moving_standing = tweak_data.weapon.m249.spread.standing * 2
tweak_data.weapon.m249.spread.moving_crouching = tweak_data.weapon.m249.spread.crouching * 2
tweak_data.weapon.m249.spread.moving_steelsight = tweak_data.weapon.m249.spread.steelsight * 3

tweak_data.weapon.m249.fire_mode_data.fire_rate = 0.0631578

tweak_data.weapon.m249.shake.fire_multiplier = 0.8
tweak_data.weapon.m249.shake.fire_steelsight_multiplier = -0.8

tweak_data.weapon.m249.sounds.enter_steelsight = "lmg_steelsight_enter"
tweak_data.weapon.m249.sounds.leave_steelsight = "lmg_steelsight_exit"

tweak_data.weapon.m249.muzzleflash = "effects/payday2/particles/weapons/556_auto"

tweak_data.weapon.m249.can_shoot_through_enemy = true
tweak_data.weapon.m249.can_shoot_through_wall = true

tweak_data.weapon.m249.armor_piercing_chance = 0.175

tweak_data.weapon.m249.stats = {
		damage = 19,
		spread = 6,
		recoil = 21,
		spread_moving = 9,
		zoom = 1,
		concealment = 2,
		suppression = 2,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 9,
	}
	

--RPK
--Thanks to gir489 for the LMG ironsights codes
pivot_shoulder_translation = Vector3( 10.6725, 27.7166, -4.93564 )
pivot_shoulder_rotation = Rotation( 0.1067, -0.0850111, 0.629008 )
pivot_head_rotation = Rotation( 0, 0.2, 0 )
tweak_data.player.stances.rpk.steelsight.shoulders.translation = Vector3( .08, 26, 0.22 ) - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.rpk.steelsight.shoulders.rotation = pivot_head_rotation

pivot_head_translation = Vector3( 10, 36, -5 )
pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
tweak_data.player.stances.rpk.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.rpk.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 8, 34, -3 )
pivot_head_rotation = Rotation( 0.2, 0.5, -2 )
tweak_data.player.stances.rpk.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.rpk.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.rpk.kick.standing = {1.7, -0.4, -1.6, 1.6 }
tweak_data.weapon.rpk.kick.crouching = tweak_data.weapon.rpk.kick.standing
tweak_data.weapon.rpk.kick.steelsight = tweak_data.weapon.rpk.kick.standing

tweak_data.weapon.rpk.sounds.fire = "akm_fire_single"
tweak_data.weapon.rpk.sounds.fire_single = "akm_fire_single"
tweak_data.weapon.rpk.sounds.fire_auto = "akm_fire"
tweak_data.weapon.rpk.sounds.stop_fire = "akm_stop"
tweak_data.weapon.rpk.sounds.dryfire = "primary_dryfire"

tweak_data.weapon.rpk.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.rpk.sounds.leave_steelsight = "primary_steel_sight_exit"
	
tweak_data.weapon.rpk.CLIP_AMMO_MAX = 75
tweak_data.weapon.rpk.AMMO_MAX = 300

tweak_data.weapon.rpk.spread.standing = 5.5
tweak_data.weapon.rpk.spread.crouching = 5
tweak_data.weapon.rpk.spread.steelsight = 1.225
tweak_data.weapon.rpk.spread.moving_standing = tweak_data.weapon.rpk.spread.standing * 1.5
tweak_data.weapon.rpk.spread.moving_crouching = tweak_data.weapon.rpk.spread.crouching * 1.5
tweak_data.weapon.rpk.spread.moving_steelsight = tweak_data.weapon.rpk.spread.steelsight * 2.75

tweak_data.weapon.rpk.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.rpk.shake.fire_multiplier = 1
tweak_data.weapon.rpk.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.rpk.can_shoot_through_enemy = true
tweak_data.weapon.rpk.can_shoot_through_wall = true

tweak_data.weapon.rpk.armor_piercing_chance = 0.35

tweak_data.weapon.rpk.stats = {
		damage = 27 ,
		spread = 6,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 5,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 9,
	}

--MG42
pivot_shoulder_translation = Vector3( 10.7806, 4.38612, 0 )
pivot_shoulder_rotation = Rotation( 0.106596, -0.0844502, 0.629187 )
pivot_head_translation = Vector3( 0.02, 0.7, -0.8 )
pivot_head_rotation = Rotation( -0.12, 0.2, -0 )
tweak_data.player.stances.mg42.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mg42.steelsight.shoulders.rotation = pivot_head_rotation

pivot_head_translation = Vector3( 11, 10, -10 )
pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
tweak_data.player.stances.mg42.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mg42.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 9, 8, -8 )
pivot_head_rotation = Rotation( 0.2, 0.5, -2)
tweak_data.player.stances.mg42.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mg42.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.mg42.kick.standing = {1.1, -0.90, -1.2, 1.2 }
tweak_data.weapon.mg42.kick.crouching = tweak_data.weapon.mg42.kick.standing
tweak_data.weapon.mg42.kick.steelsight = {1.50, 1.30, -1.1, 1.1 }

tweak_data.weapon.mg42.sounds.fire = "mg42_fire"
tweak_data.weapon.mg42.sounds.fire_single = "mg42_fire"

tweak_data.weapon.mg42.spread.standing = 6.75
tweak_data.weapon.mg42.spread.crouching = 6.25
tweak_data.weapon.mg42.spread.steelsight = 1.175
tweak_data.weapon.mg42.spread.moving_standing = tweak_data.weapon.mg42.spread.standing * 2.5
tweak_data.weapon.mg42.spread.moving_crouching = tweak_data.weapon.mg42.spread.crouching * 2.5
tweak_data.weapon.mg42.spread.moving_steelsight = tweak_data.weapon.mg42.spread.steelsight * 3.5

tweak_data.weapon.mg42.CLIP_AMMO_MAX = 50
tweak_data.weapon.mg42.NR_CLIPS_MAX = 3
tweak_data.weapon.mg42.AMMO_MAX = tweak_data.weapon.mg42.CLIP_AMMO_MAX * tweak_data.weapon.mg42.NR_CLIPS_MAX

tweak_data.weapon.mg42.shake.fire_multiplier = 1.1
tweak_data.weapon.mg42.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.mg42.can_shoot_through_shield = true
tweak_data.weapon.mg42.can_shoot_through_enemy = true
tweak_data.weapon.mg42.can_shoot_through_wall = true

tweak_data.weapon.mg42.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.mg42.armor_piercing_chance = 0.5

tweak_data.weapon.mg42.stats = {
		damage = 41,
		spread = 7,
		recoil = 11,
		spread_moving = 8,
		zoom = 1,
		concealment = 2,
		suppression = 0,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 9,
	}

	
--MSR
pivot_shoulder_translation = Vector3( 10.7223, 44.8494, -2.19714 )
pivot_shoulder_rotation = Rotation( 0.106634, -0.0844042, 0.629169 )
pivot_head_translation = Vector3( -0.025, 35, 0.075 )
pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.msr.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.msr.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 11, 46, -4 )
pivot_head_rotation = Rotation( 0, 0, -1 )
tweak_data.player.stances.msr.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.msr.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 9, 44, -2 )
pivot_head_rotation = Rotation( 0, 0, -2 )
tweak_data.player.stances.msr.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.msr.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.msr.spread.standing = 4
tweak_data.weapon.msr.spread.crouching = tweak_data.weapon.msr.spread.standing
tweak_data.weapon.msr.spread.steelsight = 0.05
tweak_data.weapon.msr.spread.moving_standing = tweak_data.weapon.msr.spread.standing * 1.9
tweak_data.weapon.msr.spread.moving_crouching = tweak_data.weapon.msr.spread.standing * 1.9
tweak_data.weapon.msr.spread.moving_steelsight = tweak_data.weapon.msr.spread.standing * 0.5

tweak_data.weapon.msr.fire_mode_data.fire_rate = 0.923076923076

tweak_data.weapon.msr.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.msr.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.msr.timers.reload_not_empty = 2.55

tweak_data.weapon.msr.CLIP_AMMO_MAX = 10
tweak_data.weapon.msr.NR_CLIPS_MAX = 5
tweak_data.weapon.msr.AMMO_MAX = tweak_data.weapon.msr.CLIP_AMMO_MAX * tweak_data.weapon.msr.NR_CLIPS_MAX

tweak_data.weapon.msr.kick.standing = {4.8, 5.9, -2.75, 2.75 }
tweak_data.weapon.msr.kick.crouching = tweak_data.weapon.msr.kick.standing
tweak_data.weapon.msr.kick.steelsight = tweak_data.weapon.msr.kick.standing

tweak_data.weapon.msr.shake.fire_multiplier = 4
tweak_data.weapon.msr.shake.fire_steelsight_multiplier = -4

tweak_data.weapon.msr.stats_modifiers = { 
		damage = 6, 
		suppression = 3
		}

tweak_data.weapon.msr.stats = {
		damage = 11,
		spread = 10,
		recoil = 11,
		spread_moving = 6,
		zoom = 1,
		concealment = 5,
		suppression = 6,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	

--R93
pivot_shoulder_translation = Vector3( 10.6978, 45.3183, -4.51382 )
pivot_shoulder_rotation = Rotation( 0.107839, -0.0834037, 0.628987 )
pivot_head_translation = Vector3( -0.01, 30, 0.025 )
pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.r93.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r93.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 12, 47, -2 )
pivot_head_rotation = Rotation( 0, 0, -1 )
tweak_data.player.stances.r93.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r93.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 10, 45, -0 )
pivot_head_rotation = Rotation( 0, 0, -2 )
tweak_data.player.stances.r93.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r93.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
tweak_data.weapon.r93.spread.standing = 6
tweak_data.weapon.r93.spread.crouching = tweak_data.weapon.r93.spread.standing
tweak_data.weapon.r93.spread.steelsight = 0.05
tweak_data.weapon.r93.spread.moving_standing = tweak_data.weapon.r93.spread.standing * 1.9
tweak_data.weapon.r93.spread.moving_crouching = tweak_data.weapon.r93.spread.standing * 1.9
tweak_data.weapon.r93.spread.moving_steelsight = tweak_data.weapon.r93.spread.standing * 0.5

tweak_data.weapon.r93.fire_mode_data.fire_rate = 1.2

tweak_data.weapon.r93.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.r93.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.r93.kick.standing = {6.9, 5.9, -3.75, 3.75 }
tweak_data.weapon.r93.kick.crouching = tweak_data.weapon.r93.kick.standing
tweak_data.weapon.r93.kick.steelsight = tweak_data.weapon.r93.kick.standing

tweak_data.weapon.r93.CLIP_AMMO_MAX = 6
tweak_data.weapon.r93.NR_CLIPS_MAX = 5
tweak_data.weapon.r93.AMMO_MAX = tweak_data.weapon.r93.CLIP_AMMO_MAX * tweak_data.weapon.r93.NR_CLIPS_MAX

tweak_data.weapon.r93.shake.fire_multiplier = 4
tweak_data.weapon.r93.shake.fire_steelsight_multiplier = -4

tweak_data.weapon.r93.stats_modifiers = {
		damage = 2,
		suppression = 3,
	}

tweak_data.weapon.r93.stats = {
		damage = 65,
		spread = 10,
		recoil = 7,
		spread_moving = 0,
		zoom = 1,
		concealment = 5,
		suppression = 4,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}


--M95
pivot_shoulder_translation = Vector3( 12.9429, 21.4699, -2.48515 )
pivot_shoulder_rotation = Rotation( 0.113195, 0.518822, 0.628052 )
pivot_head_translation = Vector3( -0.01, 0, 0.01 )
pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.m95.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m95.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 12, 30, -4 )
pivot_head_rotation = Rotation( 0, 0, -1 )
tweak_data.player.stances.m95.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m95.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 10, 28, -2 )
pivot_head_rotation = Rotation( 0, 0, -2 )
tweak_data.player.stances.m95.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m95.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	

tweak_data.weapon.m95.spread.standing = 10
tweak_data.weapon.m95.spread.crouching = tweak_data.weapon.m95.spread.standing
tweak_data.weapon.m95.spread.steelsight = 0.075
tweak_data.weapon.m95.spread.moving_standing = tweak_data.weapon.m95.spread.standing * 2.4
tweak_data.weapon.m95.spread.moving_crouching = tweak_data.weapon.m95.spread.standing * 2.4
tweak_data.weapon.m95.spread.moving_steelsight = tweak_data.weapon.m95.spread.standing * 0.5

tweak_data.weapon.m95.kick.standing = {8.9, 7.9, -2.9, 6.9 }
tweak_data.weapon.m95.kick.crouching = tweak_data.weapon.m95.kick.standing
tweak_data.weapon.m95.kick.steelsight = tweak_data.weapon.m95.kick.standing

tweak_data.weapon.m95.sounds.enter_steelsight = "lmg_steelsight_enter"
tweak_data.weapon.m95.sounds.leave_steelsight = "lmg_steelsight_exit"

tweak_data.weapon.m95.fire_mode_data.fire_rate = 1.5

tweak_data.weapon.m95.shake.fire_multiplier = 5
tweak_data.weapon.m95.shake.fire_steelsight_multiplier = -4.5

tweak_data.weapon.m95.ignore_damage_upgrades = true

tweak_data.weapon.m95.stats_modifiers = {
		damage = 12,
		suppression = 5,
	}

tweak_data.weapon.m95.stats = {
		damage = 97,
		spread = 9,
		recoil = 1,
		spread_moving = 6,
		zoom = 1,
		concealment = 2,
		suppression = 2,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	

--MOIST NUGGET
pivot_shoulder_translation = Vector3( 12.9429, 21.4699, -2.48515 )
pivot_shoulder_rotation = Rotation( 0.113195, 0.518822, 0.628052 )
pivot_head_translation = Vector3( 14, 20, -2 )
pivot_head_rotation = Rotation( 0, 0, -1 )
tweak_data.player.stances.mosin.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mosin.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 12, 18, -0 )
pivot_head_rotation = Rotation( 0, 0, -2 )
tweak_data.player.stances.mosin.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mosin.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.mosin.spread.standing = 5
tweak_data.weapon.mosin.spread.crouching = tweak_data.weapon.mosin.spread.standing
tweak_data.weapon.mosin.spread.steelsight = 0.1
tweak_data.weapon.mosin.spread.moving_standing = tweak_data.weapon.mosin.spread.standing * 2
tweak_data.weapon.mosin.spread.moving_crouching = tweak_data.weapon.mosin.spread.standing * 2
tweak_data.weapon.mosin.spread.moving_steelsight = tweak_data.weapon.mosin.spread.standing * 0.5

tweak_data.weapon.mosin.fire_mode_data.fire_rate = 1

tweak_data.weapon.mosin.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.mosin.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.mosin.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.mosin.CLIP_AMMO_MAX = 5
tweak_data.weapon.mosin.NR_CLIPS_MAX = 8
tweak_data.weapon.mosin.AMMO_MAX = tweak_data.weapon.mosin.CLIP_AMMO_MAX * tweak_data.weapon.mosin.NR_CLIPS_MAX

tweak_data.weapon.mosin.kick.standing = {4.8, 6.0, -2.9, 2.9 }
tweak_data.weapon.mosin.kick.crouching = tweak_data.weapon.mosin.kick.standing
tweak_data.weapon.mosin.kick.steelsight = tweak_data.weapon.mosin.kick.standing

tweak_data.weapon.mosin.shake.fire_multiplier = 4
tweak_data.weapon.mosin.shake.fire_steelsight_multiplier = -4

tweak_data.weapon.mosin.stats_modifiers = { 
		damage = 6, 
		suppression = 3
		}

tweak_data.weapon.mosin.stats = {
		damage = 17,
		spread = 9,
		recoil = 9,
		spread_moving = 6,
		zoom = 1,
		concealment = 5,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--[[ MELEE ]]--

--Buttstock Melee
tweak_data.blackmarket.melee_weapons.weapon.stats.range = 150
tweak_data.blackmarket.melee_weapons.weapon.stats.min_damage = 2
tweak_data.blackmarket.melee_weapons.weapon.stats.max_damage = 2
tweak_data.blackmarket.melee_weapons.weapon.stats.min_damage_effect = 2
tweak_data.blackmarket.melee_weapons.weapon.stats.max_damage_effect = 2

--ORAORAORAORAORAORAORAORAORAORAORA(Fists)
if kenshiro == true then
	tweak_data.blackmarket.melee_weapons.fists.repeat_expire_t = 0.01
else
	tweak_data.blackmarket.melee_weapons.fists.repeat_expire_t = 0.325
end
tweak_data.blackmarket.melee_weapons.fists.stats.range = 120
tweak_data.blackmarket.melee_weapons.fists.stats.charge_time = 0.2
tweak_data.blackmarket.melee_weapons.fists.expire_t = 1
tweak_data.blackmarket.melee_weapons.fists.stats.min_damage = 1
tweak_data.blackmarket.melee_weapons.fists.stats.max_damage = 2
tweak_data.blackmarket.melee_weapons.fists.stats.min_damage_effect = 3
tweak_data.blackmarket.melee_weapons.fists.stats.max_damage_effect = 3
tweak_data.blackmarket.melee_weapons.fists.anim_attack_vars = { "var1", "var4" } --Gets rid of the two hook animations as those don't even match up with the impact delay
tweak_data.blackmarket.melee_weapons.fists.sounds.charge = "fist_equip"
--Brass
tweak_data.blackmarket.melee_weapons.brass_knuckles.repeat_expire_t = 0.325
tweak_data.blackmarket.melee_weapons.brass_knuckles.expire_t = 1
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.range = 125
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.min_damage = 1.5
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.max_damage = 3
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.min_damage_effect = 4
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.max_damage_effect = 4
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.charge_time = 0.5
tweak_data.blackmarket.melee_weapons.brass_knuckles.anim_attack_vars = { "var1", "var4" } --ditto
tweak_data.blackmarket.melee_weapons.brass_knuckles.sounds.charge = "fist_equip"


--Toothbrush
tweak_data.blackmarket.melee_weapons.toothbrush.repeat_expire_t = 0.2
tweak_data.blackmarket.melee_weapons.toothbrush.expire_t = 0.8
tweak_data.blackmarket.melee_weapons.toothbrush.stats.range = 100
tweak_data.blackmarket.melee_weapons.toothbrush.stats.charge_time = 3
tweak_data.blackmarket.melee_weapons.toothbrush.stats.min_damage = 2
tweak_data.blackmarket.melee_weapons.toothbrush.stats.max_damage = 20
tweak_data.blackmarket.melee_weapons.toothbrush.stats.min_damage_effect = 0.2
tweak_data.blackmarket.melee_weapons.toothbrush.stats.max_damage_effect = 0.04
--Gerber Knife
tweak_data.blackmarket.melee_weapons.gerber.repeat_expire_t = 0.3
tweak_data.blackmarket.melee_weapons.gerber.expire_t = 1
tweak_data.blackmarket.melee_weapons.gerber.anim_global_param = "melee_knife"
tweak_data.blackmarket.melee_weapons.gerber.anim_attack_vars = { "var1", "var3" } --gets rid of the the two long swipes
tweak_data.blackmarket.melee_weapons.gerber.stats.range = 130
tweak_data.blackmarket.melee_weapons.gerber.stats.charge_time = 0.4
tweak_data.blackmarket.melee_weapons.gerber.stats.min_damage = 2
tweak_data.blackmarket.melee_weapons.gerber.stats.max_damage = 4
tweak_data.blackmarket.melee_weapons.gerber.stats.min_damage_effect = 1
tweak_data.blackmarket.melee_weapons.gerber.stats.max_damage_effect = 1
--Bayonet
tweak_data.blackmarket.melee_weapons.bayonet.anim_global_param = "melee_stab"
tweak_data.blackmarket.melee_weapons.bayonet.align_objects = {"a_weapon_right"}
tweak_data.blackmarket.melee_weapons.bayonet.repeat_expire_t = 0.35
tweak_data.blackmarket.melee_weapons.bayonet.expire_t = 1
tweak_data.blackmarket.melee_weapons.bayonet.stats.range = 130
tweak_data.blackmarket.melee_weapons.bayonet.stats.charge_time = 0.45
tweak_data.blackmarket.melee_weapons.bayonet.stats.min_damage = 3
tweak_data.blackmarket.melee_weapons.bayonet.stats.max_damage = 6
tweak_data.blackmarket.melee_weapons.bayonet.stats.min_damage_effect = 0.4
tweak_data.blackmarket.melee_weapons.bayonet.stats.max_damage_effect = 0.4
--Trench
tweak_data.blackmarket.melee_weapons.fairbair.repeat_expire_t = 0.4
tweak_data.blackmarket.melee_weapons.fairbair.expire_t = 1.1
tweak_data.blackmarket.melee_weapons.fairbair.stats.charge_time = 0.75
tweak_data.blackmarket.melee_weapons.fairbair.stats.min_damage = 4
tweak_data.blackmarket.melee_weapons.fairbair.stats.max_damage = 8
tweak_data.blackmarket.melee_weapons.fairbair.stats.min_damage_effect = 0.4
tweak_data.blackmarket.melee_weapons.fairbair.stats.max_damage_effect = 0.4
--X46
tweak_data.blackmarket.melee_weapons.x46.repeat_expire_t = 0.375
tweak_data.blackmarket.melee_weapons.x46.expire_t = 1
tweak_data.blackmarket.melee_weapons.x46.stats.range = 140
tweak_data.blackmarket.melee_weapons.x46.stats.charge_time = 1.1
tweak_data.blackmarket.melee_weapons.x46.stats.min_damage = 2.5
tweak_data.blackmarket.melee_weapons.x46.stats.max_damage = 5
tweak_data.blackmarket.melee_weapons.x46.stats.min_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.x46.stats.max_damage_effect = 1.2
--Tanto
tweak_data.blackmarket.melee_weapons.kabartanto.repeat_expire_t = 0.375
tweak_data.blackmarket.melee_weapons.kabartanto.expire_t = 1.05
tweak_data.blackmarket.melee_weapons.kabartanto.stats.charge_time = 1.3
tweak_data.blackmarket.melee_weapons.kabartanto.stats.min_damage = 3
tweak_data.blackmarket.melee_weapons.kabartanto.stats.max_damage = 6
tweak_data.blackmarket.melee_weapons.kabartanto.stats.range = 170
tweak_data.blackmarket.melee_weapons.kabartanto.stats.min_damage_effect = 0.5
tweak_data.blackmarket.melee_weapons.kabartanto.stats.max_damage_effect = 0.5
--Krieger
tweak_data.blackmarket.melee_weapons.kampfmesser.repeat_expire_t = 0.4
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.range = 160
tweak_data.blackmarket.melee_weapons.kampfmesser.expire_t = 1
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.min_damage = 4
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.max_damage = 8
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.min_damage_effect = 0.6
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.max_damage_effect = 0.6
--Kabar (URSA)
tweak_data.blackmarket.melee_weapons.kabar.repeat_expire_t = 0.45
tweak_data.blackmarket.melee_weapons.kabar.expire_t = 1.05
tweak_data.blackmarket.melee_weapons.kabar.stats.min_damage = 5
tweak_data.blackmarket.melee_weapons.kabar.stats.max_damage = 10
tweak_data.blackmarket.melee_weapons.kabar.stats.range = 170
tweak_data.blackmarket.melee_weapons.kabar.stats.min_damage_effect = 0.5
tweak_data.blackmarket.melee_weapons.kabar.stats.max_damage_effect = 0.5
--Rambo
tweak_data.blackmarket.melee_weapons.rambo.anim_global_param = "melee_knife"
tweak_data.blackmarket.melee_weapons.rambo.repeat_expire_t = 0.5
tweak_data.blackmarket.melee_weapons.rambo.expire_t = 1.1
tweak_data.blackmarket.melee_weapons.rambo.stats.min_damage = 6
tweak_data.blackmarket.melee_weapons.rambo.stats.max_damage = 12
tweak_data.blackmarket.melee_weapons.rambo.stats.range = 180
tweak_data.blackmarket.melee_weapons.rambo.stats.min_damage_effect = 0.6
tweak_data.blackmarket.melee_weapons.rambo.stats.max_damage_effect = 0.6

--Becker Machete
tweak_data.blackmarket.melee_weapons.becker.stats.range = 170
tweak_data.blackmarket.melee_weapons.becker.repeat_expire_t = 0.6
tweak_data.blackmarket.melee_weapons.becker.expire_t = 1.15
tweak_data.blackmarket.melee_weapons.becker.stats.min_damage = 7
tweak_data.blackmarket.melee_weapons.becker.stats.max_damage = 14
tweak_data.blackmarket.melee_weapons.becker.stats.min_damage_effect = 0.6
tweak_data.blackmarket.melee_weapons.becker.stats.max_damage_effect = 0.6
tweak_data.blackmarket.melee_weapons.becker.stats.charge_time = 2.25
tweak_data.blackmarket.melee_weapons.becker.type = "knife" --"axe" doesn't let you hurt dozers
tweak_data.blackmarket.melee_weapons.becker.anim_global_param = "melee_machete"
tweak_data.blackmarket.melee_weapons.becker.align_objects = {"a_weapon_right"}
--Machete
tweak_data.blackmarket.melee_weapons.machete.repeat_expire_t = 0.75
tweak_data.blackmarket.melee_weapons.machete.expire_t = 1.2
tweak_data.blackmarket.melee_weapons.machete.stats.charge_time = 2.6
tweak_data.blackmarket.melee_weapons.machete.stats.min_damage = 9
tweak_data.blackmarket.melee_weapons.machete.stats.max_damage = 18
tweak_data.blackmarket.melee_weapons.machete.stats.min_damage_effect = 0.2
tweak_data.blackmarket.melee_weapons.machete.stats.max_damage_effect = 0.2
tweak_data.blackmarket.melee_weapons.machete.type = "knife" --"axe" doesn't let you hurt dozers	
	

--SW Hatchet
tweak_data.blackmarket.melee_weapons.bullseye.stats.range = 160
tweak_data.blackmarket.melee_weapons.bullseye.repeat_expire_t = 0.6
tweak_data.blackmarket.melee_weapons.bullseye.expire_t = 1.15
tweak_data.blackmarket.melee_weapons.bullseye.stats.min_damage = 4
tweak_data.blackmarket.melee_weapons.bullseye.stats.max_damage = 8
tweak_data.blackmarket.melee_weapons.bullseye.stats.min_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.bullseye.stats.max_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.bullseye.stats.charge_time = 1.15
tweak_data.blackmarket.melee_weapons.bullseye.type = "knife" --"axe" doesn't let you hurt dozers
tweak_data.blackmarket.melee_weapons.bullseye.anim_global_param = "melee_knife2" --Normal axe animation clips through your head
tweak_data.blackmarket.melee_weapons.bullseye.align_objects = {"a_weapon_left"}
--Cleaver
tweak_data.blackmarket.melee_weapons.cleaver.stats.range = 165
tweak_data.blackmarket.melee_weapons.cleaver.repeat_expire_t = 0.625
tweak_data.blackmarket.melee_weapons.cleaver.stats.charge_time = 1.25
tweak_data.blackmarket.melee_weapons.cleaver.expire_t = 1.3
tweak_data.blackmarket.melee_weapons.cleaver.stats.min_damage = 5
tweak_data.blackmarket.melee_weapons.cleaver.stats.max_damage = 10
tweak_data.blackmarket.melee_weapons.cleaver.stats.min_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.cleaver.stats.max_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.cleaver.type = "knife" --"axe" doesn't let you hurt dozers
--Tomahawk
tweak_data.blackmarket.melee_weapons.tomahawk.stats.range = 210
tweak_data.blackmarket.melee_weapons.tomahawk.repeat_expire_t = 0.65
tweak_data.blackmarket.melee_weapons.tomahawk.expire_t = 1.3
tweak_data.blackmarket.melee_weapons.tomahawk.stats.min_damage = 7
tweak_data.blackmarket.melee_weapons.tomahawk.stats.max_damage = 14
tweak_data.blackmarket.melee_weapons.tomahawk.stats.min_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.tomahawk.stats.max_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.tomahawk.stats.charge_time = 2.25
tweak_data.blackmarket.melee_weapons.tomahawk.type = "knife"
tweak_data.blackmarket.melee_weapons.tomahawk.anim_attack_vars = {"var1","var3","var4"}
--Fireaxe
tweak_data.blackmarket.melee_weapons.fireaxe.repeat_expire_t = 1.5
tweak_data.blackmarket.melee_weapons.fireaxe.stats.charge_time = 3.5
tweak_data.blackmarket.melee_weapons.fireaxe.stats.min_damage = 30
tweak_data.blackmarket.melee_weapons.fireaxe.stats.max_damage = 60
tweak_data.blackmarket.melee_weapons.fireaxe.stats.min_damage_effect = .5
tweak_data.blackmarket.melee_weapons.fireaxe.stats.max_damage_effect = .5
tweak_data.blackmarket.melee_weapons.fireaxe.stats.range = 275
tweak_data.blackmarket.melee_weapons.fireaxe.melee_damage_delay = 0.3
tweak_data.blackmarket.melee_weapons.fireaxe.type = "knife"

--LODS OF EMONEE
if lodsofemone == true then 
	tweak_data.blackmarket.melee_weapons.moneybundle.name_id = "bm_melee_emone"
else
	tweak_data.blackmarket.melee_weapons.moneybundle.name_id = "bm_melee_moneybundle"
end
tweak_data.blackmarket.melee_weapons.moneybundle.stats.min_damage = 0.2
tweak_data.blackmarket.melee_weapons.moneybundle.stats.max_damage = 0.4
tweak_data.blackmarket.melee_weapons.moneybundle.stats.min_damage_effect = 20
tweak_data.blackmarket.melee_weapons.moneybundle.stats.max_damage_effect = 20
tweak_data.blackmarket.melee_weapons.moneybundle.repeat_expire_t = 0.275
tweak_data.blackmarket.melee_weapons.moneybundle.stats.range = 100
tweak_data.blackmarket.melee_weapons.moneybundle.expire_t = 1
tweak_data.blackmarket.melee_weapons.moneybundle.anim_attack_vars = {"var1","var3","var4"}
tweak_data.blackmarket.melee_weapons.moneybundle.stats.charge_time = 0.2
--Erica Hartmann
tweak_data.blackmarket.melee_weapons.model24.type = "axe"
tweak_data.blackmarket.melee_weapons.model24.repeat_expire_t = 0.385
tweak_data.blackmarket.melee_weapons.model24.expire_t = 1.05
tweak_data.blackmarket.melee_weapons.model24.stats.charge_time = 0.85
tweak_data.blackmarket.melee_weapons.model24.stats.min_damage = 2
tweak_data.blackmarket.melee_weapons.model24.stats.max_damage = 4
tweak_data.blackmarket.melee_weapons.model24.stats.min_damage_effect = 2
tweak_data.blackmarket.melee_weapons.model24.stats.max_damage_effect = 2
tweak_data.blackmarket.melee_weapons.model24.stats.range = 175
--WATCHDOGES
tweak_data.blackmarket.melee_weapons.baton.repeat_expire_t = 0.425
tweak_data.blackmarket.melee_weapons.baton.expire_t = 1.1
tweak_data.blackmarket.melee_weapons.baton.stats.min_damage = 1
tweak_data.blackmarket.melee_weapons.baton.stats.max_damage = 2
tweak_data.blackmarket.melee_weapons.baton.stats.min_damage_effect = 6
tweak_data.blackmarket.melee_weapons.baton.stats.max_damage_effect = 6
tweak_data.blackmarket.melee_weapons.baton.stats.charge_time = 1.15	
tweak_data.blackmarket.melee_weapons.baton.stats.range = 200
--Shovel
tweak_data.blackmarket.melee_weapons.shovel.repeat_expire_t = 0.7
tweak_data.blackmarket.melee_weapons.shovel.expire_t = 1.25
tweak_data.blackmarket.melee_weapons.shovel.stats.charge_time = 2
tweak_data.blackmarket.melee_weapons.shovel.stats.range = 250
tweak_data.blackmarket.melee_weapons.shovel.stats.min_damage = 1.5
tweak_data.blackmarket.melee_weapons.shovel.stats.max_damage = 3
tweak_data.blackmarket.melee_weapons.shovel.stats.min_damage_effect = 5
tweak_data.blackmarket.melee_weapons.shovel.stats.max_damage_effect = 5
--YOLO SWAG
tweak_data.blackmarket.melee_weapons.swagger.type = "axe"
tweak_data.blackmarket.melee_weapons.swagger.repeat_expire_t = 0.7
tweak_data.blackmarket.melee_weapons.swagger.expire_t = 1.15
tweak_data.blackmarket.melee_weapons.swagger.stats.charge_time = 1.4
tweak_data.blackmarket.melee_weapons.swagger.stats.min_damage = 3
tweak_data.blackmarket.melee_weapons.swagger.stats.max_damage = 6
tweak_data.blackmarket.melee_weapons.swagger.stats.min_damage_effect = 1.5
tweak_data.blackmarket.melee_weapons.swagger.stats.max_damage_effect = 1.5

--Lucille
tweak_data.blackmarket.melee_weapons.barbedwire.anim_global_param = "melee_baseballbat_miami"
tweak_data.blackmarket.melee_weapons.barbedwire.stats.charge_time = 2.6
tweak_data.blackmarket.melee_weapons.barbedwire.repeat_expire_t = 0.95
tweak_data.blackmarket.melee_weapons.barbedwire.expire_t = 1.4
tweak_data.blackmarket.melee_weapons.barbedwire.stats.min_damage = 3.5
tweak_data.blackmarket.melee_weapons.barbedwire.stats.max_damage = 7
tweak_data.blackmarket.melee_weapons.barbedwire.stats.min_damage_effect = 4
tweak_data.blackmarket.melee_weapons.barbedwire.stats.max_damage_effect = 4
if twdbat == true then
	tweak_data.blackmarket.melee_weapons.barbedwire.name_id = "bm_melee_twd"
else
	tweak_data.blackmarket.melee_weapons.barbedwire.name_id = "bm_melee_baseballbat"
end
--Normal Bat
tweak_data.blackmarket.melee_weapons.baseballbat.stats.charge_time = 2.5
tweak_data.blackmarket.melee_weapons.baseballbat.repeat_expire_t = 0.85
tweak_data.blackmarket.melee_weapons.baseballbat.expire_t = 1.4
tweak_data.blackmarket.melee_weapons.baseballbat.stats.min_damage = 3.0
tweak_data.blackmarket.melee_weapons.baseballbat.stats.max_damage = 6.0
tweak_data.blackmarket.melee_weapons.baseballbat.stats.min_damage_effect = 3
tweak_data.blackmarket.melee_weapons.baseballbat.stats.max_damage_effect = 3
tweak_data.blackmarket.melee_weapons.baseballbat.stats.range = 275
--You touch my Tralala Hammer
tweak_data.blackmarket.melee_weapons.dingdong.stats.charge_time = 3
tweak_data.blackmarket.melee_weapons.dingdong.repeat_expire_t = 1.0
tweak_data.blackmarket.melee_weapons.dingdong.expire_t = 1.4
tweak_data.blackmarket.melee_weapons.dingdong.stats.min_damage = 5
tweak_data.blackmarket.melee_weapons.dingdong.stats.max_damage = 10
tweak_data.blackmarket.melee_weapons.dingdong.stats.min_damage_effect = 5
tweak_data.blackmarket.melee_weapons.dingdong.stats.max_damage_effect = 5
tweak_data.blackmarket.melee_weapons.dingdong.stats.range = 250
--Ayy Lmao Overkike Hammer
tweak_data.blackmarket.melee_weapons.alien_maul.stats.charge_time = 5
tweak_data.blackmarket.melee_weapons.alien_maul.repeat_expire_t = 1.15
tweak_data.blackmarket.melee_weapons.alien_maul.expire_t = 1.4
tweak_data.blackmarket.melee_weapons.alien_maul.stats.min_damage = 6
tweak_data.blackmarket.melee_weapons.alien_maul.stats.max_damage = 12
tweak_data.blackmarket.melee_weapons.alien_maul.stats.min_damage_effect = 5
tweak_data.blackmarket.melee_weapons.alien_maul.stats.max_damage_effect = 5
tweak_data.blackmarket.melee_weapons.alien_maul.stats.range = 275

--FUCK YEAH
tweak_data.blackmarket.melee_weapons.freedom.stats.min_damage = 8
tweak_data.blackmarket.melee_weapons.freedom.stats.max_damage = 16
tweak_data.blackmarket.melee_weapons.freedom.stats.min_damage_effect = 0.2
tweak_data.blackmarket.melee_weapons.freedom.stats.max_damage_effect = 0.2
tweak_data.blackmarket.melee_weapons.freedom.stats.charge_time = 3
tweak_data.blackmarket.melee_weapons.freedom.melee_damage_delay = 0.1
--SPOOPY KNIFE
tweak_data.blackmarket.melee_weapons.chef.repeat_expire_t = 0.45
tweak_data.blackmarket.melee_weapons.chef.stats.min_damage = 1.3
tweak_data.blackmarket.melee_weapons.chef.stats.max_damage = 66.6
tweak_data.blackmarket.melee_weapons.chef.stats.min_damage_effect = .45
tweak_data.blackmarket.melee_weapons.chef.stats.max_damage_effect = .099
tweak_data.blackmarket.melee_weapons.chef.stats.charge_time = 13.3
tweak_data.blackmarket.melee_weapons.chef.stats.range = 130
--50 Blessings
tweak_data.blackmarket.melee_weapons.briefcase.expire_t = 1.0
tweak_data.blackmarket.melee_weapons.briefcase.stats.min_damage = 2
tweak_data.blackmarket.melee_weapons.briefcase.stats.max_damage = 4
tweak_data.blackmarket.melee_weapons.briefcase.stats.min_damage_effect = 5
tweak_data.blackmarket.melee_weapons.briefcase.stats.max_damage_effect = 5
tweak_data.blackmarket.melee_weapons.briefcase.stats.range = 140
tweak_data.blackmarket.melee_weapons.briefcase.stats.charge_time = 1.8

RebalanceScript = true
io.write("rebalance.lua is working", "\n")

end