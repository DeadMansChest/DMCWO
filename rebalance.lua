--[[
v0.4.2.1
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

if not RebalanceScript then

--If set to true, sets the name and description to reference The Walking Dead
local twdbat = true

--if set to true, changes the money bundle name and description to reference Harry Enfield's "Loadsamoney" music video
local lodsofemone = true

--If set to true, using the fists allows you to turn into Kenshiro from Hokuto No Ken (Fist of the North Star)
--AAAH-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA
local kenshiro = false

--[[DONT TOUCH THIS SHIZZLE]]--

if not tweak_data then return end

--SAW

--just to fix it for the new extra_ammo and total_ammo_mod calculations

tweak_data.weapon.saw.stats = {
		alert_size = 9,
		suppression = 7,
		zoom = 1,
		spread = 3,
		recoil = 17,
		spread_moving = 7,
		damage = 10,
		concealment = 16,
		value = 1,
		extra_ammo = 11,
		total_ammo_mod = 101,
	}

--M67
--tweak_data.grenades.frag.damage = 75 --Explosion damage
	
--M79
-- tweak_data.weapon.gre_m79.fire_mode_data.fire_rate = 1.05 --just a bit slower than the anti-cheat limit
-- tweak_data.grenades.launcher_frag.range = 500 --Range in centimeters, default 350
-- tweak_data.grenades.launcher_frag.damage = 45 --Explosion damage

--[[ tweak_data.weapon.gre_m79.CLIP_AMMO_MAX = 1
tweak_data.weapon.gre_m79.NR_CLIPS_MAX = 6
tweak_data.weapon.gre_m79.AMMO_MAX = tweak_data.weapon.gre_m79.CLIP_AMMO_MAX * tweak_data.weapon.gre_m79.NR_CLIPS_MAX ]]

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
	
--Judge
tweak_data.weapon.judge.category = "pistol"

tweak_data.weapon.judge.kick.standing = {2.4, 3.1, -1.8, 1.8 }
tweak_data.weapon.judge.kick.crouching = tweak_data.weapon.judge.kick.standing
tweak_data.weapon.judge.kick.steelsight = tweak_data.weapon.judge.kick.standing
		
tweak_data.weapon.judge.spread.standing = 4.85
tweak_data.weapon.judge.spread.crouching = tweak_data.weapon.judge.spread.standing
tweak_data.weapon.judge.spread.steelsight = tweak_data.weapon.judge.spread.standing * 0.6
tweak_data.weapon.judge.spread.moving_standing = tweak_data.weapon.judge.spread.standing
tweak_data.weapon.judge.spread.moving_crouching = tweak_data.weapon.judge.spread.standing
tweak_data.weapon.judge.spread.moving_steelsight = tweak_data.weapon.judge.spread.standing * 0.8

tweak_data.weapon.judge.muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash"

tweak_data.weapon.judge.CLIP_AMMO_MAX = 5
tweak_data.weapon.judge.NR_CLIPS_MAX = 6
tweak_data.weapon.judge.AMMO_MAX = tweak_data.weapon.judge.CLIP_AMMO_MAX * tweak_data.weapon.judge.NR_CLIPS_MAX

tweak_data.weapon.judge.rays = 5

tweak_data.weapon.judge.damage_near = 100
tweak_data.weapon.judge.damage_far = 1700

tweak_data.weapon.judge.shake.fire_multiplier = 1.25
tweak_data.weapon.judge.shake.fire_steelsight_multiplier = -1.25

tweak_data.weapon.judge.fire_mode_data.fire_rate = 0.2143

tweak_data.weapon.judge.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.judge.stats = {
		damage = 25,
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
tweak_data.weapon.deagle.kick.standing = { 3.2, 4.6, -2.7, 3.0 } --changes recoil pattern to literally "fuck you"
tweak_data.weapon.deagle.kick.crouching = tweak_data.weapon.deagle.kick.standing
tweak_data.weapon.deagle.kick.steelsight = tweak_data.weapon.deagle.kick.standing

tweak_data.weapon.deagle.spread.standing = 5.5
tweak_data.weapon.deagle.spread.crouching = 5
tweak_data.weapon.deagle.spread.steelsight = 1.6
tweak_data.weapon.deagle.spread.moving_standing = tweak_data.weapon.deagle.spread.standing * 2.45
tweak_data.weapon.deagle.spread.moving_crouching = tweak_data.weapon.deagle.spread.crouching * 2.45
tweak_data.weapon.deagle.spread.moving_steelsight = tweak_data.weapon.deagle.spread.steelsight * 2.65

tweak_data.weapon.deagle.CLIP_AMMO_MAX = 7
--tweak_data.weapon.deagle.NR_CLIPS_MAX = 5
tweak_data.weapon.deagle.AMMO_MAX = 35

tweak_data.weapon.deagle.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.deagle.shake.fire_multiplier = 3.5
tweak_data.weapon.deagle.shake.fire_steelsight_multiplier = -3.5

tweak_data.weapon.deagle.fire_mode_data.fire_rate = 0.1875

tweak_data.weapon.deagle.can_shoot_through_enemy = true
tweak_data.weapon.deagle.can_shoot_through_wall = true

tweak_data.weapon.deagle.armor_piercing_chance = 0.5

tweak_data.weapon.deagle.stats = {
		damage = 37,
		spread = 6,
		recoil = 4,
		spread_moving = 6,
		zoom = 1,
		concealment = 28,
		suppression = 4,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

local pivot_shoulder_translation = Vector3(8.51744, 40.6489, -3.66934)
local pivot_shoulder_rotation = Rotation(0.100008, -0.96687698, 0.630289)
local pivot_head_translation = Vector3(0,35,-0.75)
local pivot_head_rotation = Rotation(0,-0.0,0)
tweak_data.player.stances.deagle.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.deagle.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
--RAGING BULL (Bronco. 44)
tweak_data.weapon.new_raging_bull.kick.standing = { 2.1, 3.4, -2.3, 2.3 } --changes recoil pattern to heavy vertical kick
tweak_data.weapon.new_raging_bull.kick.crouching = tweak_data.weapon.new_raging_bull.kick.standing
tweak_data.weapon.new_raging_bull.kick.steelsight = tweak_data.weapon.new_raging_bull.kick.standing

tweak_data.weapon.new_raging_bull.spread.standing = 4
tweak_data.weapon.new_raging_bull.spread.crouching = 3
tweak_data.weapon.new_raging_bull.spread.steelsight = 1
tweak_data.weapon.new_raging_bull.spread.moving_standing = tweak_data.weapon.new_raging_bull.spread.standing * 1.9
tweak_data.weapon.new_raging_bull.spread.moving_crouching = tweak_data.weapon.new_raging_bull.spread.crouching * 1.9
tweak_data.weapon.new_raging_bull.spread.moving_steelsight = tweak_data.weapon.new_raging_bull.spread.steelsight * 2.2

tweak_data.weapon.new_raging_bull.fire_mode_data.fire_rate = 0.1579

tweak_data.weapon.new_raging_bull.CLIP_AMMO_MAX = 6
--tweak_data.weapon.new_raging_bull.NR_CLIPS_MAX = 7
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
		damage = 33,
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
tweak_data.weapon.colt_1911.kick.standing = { 2.0, 1.5, -1.45, 1.45 }
tweak_data.weapon.colt_1911.kick.crouching = tweak_data.weapon.colt_1911.kick.standing
tweak_data.weapon.colt_1911.kick.steelsight = tweak_data.weapon.colt_1911.kick.standing

tweak_data.weapon.colt_1911.spread.standing = 5.25
tweak_data.weapon.colt_1911.spread.crouching = 4.75
tweak_data.weapon.colt_1911.spread.steelsight = 1.5
tweak_data.weapon.colt_1911.spread.moving_standing = tweak_data.weapon.colt_1911.spread.standing * 1.5
tweak_data.weapon.colt_1911.spread.moving_crouching = tweak_data.weapon.colt_1911.spread.crouching * 1.5
tweak_data.weapon.colt_1911.spread.moving_steelsight = tweak_data.weapon.colt_1911.spread.steelsight * 1.75

tweak_data.weapon.colt_1911.CLIP_AMMO_MAX = 8
--tweak_data.weapon.colt_1911.NR_CLIPS_MAX = 9
tweak_data.weapon.colt_1911.AMMO_MAX = 80

tweak_data.weapon.colt_1911.fire_mode_data.fire_rate = 0.1319

tweak_data.weapon.colt_1911.weapon_hold = "glock"

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
	
--USP .45
tweak_data.weapon.usp.weapon_hold = "glock"

tweak_data.weapon.usp.kick.standing = { 2.2, 1.7, -1.5, 1.5 }
tweak_data.weapon.usp.kick.crouching = tweak_data.weapon.usp.kick.standing
tweak_data.weapon.usp.kick.steelsight = tweak_data.weapon.usp.kick.standing

tweak_data.weapon.usp.spread.standing = 4.75
tweak_data.weapon.usp.spread.crouching = 4.25
tweak_data.weapon.usp.spread.steelsight = 1.3
tweak_data.weapon.usp.spread.moving_standing = tweak_data.weapon.usp.spread.standing * 1.45
tweak_data.weapon.usp.spread.moving_crouching = tweak_data.weapon.usp.spread.crouching * 1.45
tweak_data.weapon.usp.spread.moving_steelsight = tweak_data.weapon.usp.spread.steelsight * 1.8

tweak_data.weapon.usp.CLIP_AMMO_MAX = 12
--tweak_data.weapon.usp.NR_CLIPS_MAX = 6
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
	
	
--P226 (Signature .40)
tweak_data.weapon.p226.weapon_hold = "glock"

tweak_data.weapon.p226.kick.standing = { 1.3, 1.85, -1.9, 1.9 }
tweak_data.weapon.p226.kick.crouching = tweak_data.weapon.p226.kick.standing
tweak_data.weapon.p226.kick.steelsight = tweak_data.weapon.p226.kick.standing

tweak_data.weapon.p226.spread.standing = 5
tweak_data.weapon.p226.spread.crouching = 4.5
tweak_data.weapon.p226.spread.steelsight = 1.4
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

tweak_data.weapon.g22c.fire_mode_data.fire_rate = 0.109090909090

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
--tweak_data.weapon.glock_17.NR_CLIPS_MAX = 6
tweak_data.weapon.glock_17.AMMO_MAX = 153

tweak_data.weapon.glock_17.fire_mode_data.fire_rate = 0.0968

tweak_data.weapon.glock_17.shake.fire_multiplier = 1
tweak_data.weapon.glock_17.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.factory.wpn_fps_pis_g17.unit = "units/payday2/weapons/wpn_fps_pis_g17/wpn_fps_pis_g17"

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
tweak_data.weapon.glock_18c.kick.standing = { 1.85, -0.8, -1.85, 1.85 }
tweak_data.weapon.glock_18c.kick.crouching = tweak_data.weapon.glock_18c.kick.standing
tweak_data.weapon.glock_18c.kick.steelsight = tweak_data.weapon.glock_18c.kick.standing

tweak_data.weapon.glock_18c.CLIP_AMMO_MAX = 17
--tweak_data.weapon.glock_18c.NR_CLIPS_MAX = 8 
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
	
	
--92FS (Bernetti 9)
tweak_data.weapon.b92fs.kick.standing = { 1.6, 1.9, -0.6, 0.6 }
tweak_data.weapon.b92fs.kick.crouching = tweak_data.weapon.b92fs.kick.standing
tweak_data.weapon.b92fs.kick.steelsight = tweak_data.weapon.b92fs.kick.standing

tweak_data.weapon.b92fs.CLIP_AMMO_MAX = 15
tweak_data.weapon.b92fs.NR_CLIPS_MAX = 10
tweak_data.weapon.b92fs.AMMO_MAX = tweak_data.weapon.b92fs.CLIP_AMMO_MAX * tweak_data.weapon.b92fs.NR_CLIPS_MAX

tweak_data.weapon.b92fs.spread.standing = 3.5
tweak_data.weapon.b92fs.spread.crouching = 3
tweak_data.weapon.b92fs.spread.steelsight = 1.5
tweak_data.weapon.b92fs.spread.moving_standing = tweak_data.weapon.b92fs.spread.standing * 1.5
tweak_data.weapon.b92fs.spread.moving_crouching = tweak_data.weapon.b92fs.spread.crouching * 1.5
tweak_data.weapon.b92fs.spread.moving_steelsight = tweak_data.weapon.b92fs.spread.steelsight * 1.8

tweak_data.weapon.b92fs.fire_mode_data.fire_rate = 0.1035

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
	

--James Bond (Gruber Kurz)
tweak_data.weapon.ppk.kick.standing = { 1.1, 1.5, -0.55, 0.55 }
tweak_data.weapon.ppk.kick.crouching = tweak_data.weapon.ppk.kick.standing
tweak_data.weapon.ppk.kick.steelsight = tweak_data.weapon.ppk.kick.standing

tweak_data.weapon.ppk.CLIP_AMMO_MAX = 10
tweak_data.weapon.ppk.AMMO_MAX = 150

tweak_data.weapon.ppk.spread.standing = 3.3
tweak_data.weapon.ppk.spread.crouching = 2.8
tweak_data.weapon.ppk.spread.steelsight = 1.7
tweak_data.weapon.ppk.spread.moving_standing = tweak_data.weapon.ppk.spread.standing * 1.2
tweak_data.weapon.ppk.spread.moving_crouching = tweak_data.weapon.ppk.spread.crouching * 1.2
tweak_data.weapon.ppk.spread.moving_steelsight = tweak_data.weapon.ppk.spread.steelsight * 1.4

tweak_data.weapon.ppk.fire_mode_data.fire_rate = 0.08695652

tweak_data.weapon.ppk.shake.fire_multiplier = 1
tweak_data.weapon.ppk.shake.fire_steelsight_multiplier = -1
	
tweak_data.weapon.ppk.stats = {
		damage = 9,
		spread = 5,
		recoil = 19,
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
tweak_data.weapon.mac10.kick.standing = { -0.6, 1.4, -1.55, 1.55 }
tweak_data.weapon.mac10.kick.crouching = tweak_data.weapon.mac10.kick.standing
tweak_data.weapon.mac10.kick.steelsight = tweak_data.weapon.mac10.kick.standing

tweak_data.weapon.mac10.spread.standing = 3.5
tweak_data.weapon.mac10.spread.crouching = 3
tweak_data.weapon.mac10.spread.steelsight = 1.6
tweak_data.weapon.mac10.spread.moving_standing = tweak_data.weapon.mac10.spread.standing * 1.2
tweak_data.weapon.mac10.spread.moving_crouching = tweak_data.weapon.mac10.spread.crouching * 1.2
tweak_data.weapon.mac10.spread.moving_steelsight = tweak_data.weapon.mac10.spread.steelsight * 1.3

tweak_data.weapon.mac10.fire_mode_data.fire_rate = 0.0521739130434

tweak_data.weapon.mac10.can_shoot_through_enemy = true
tweak_data.weapon.mac10.can_shoot_through_wall = true

tweak_data.weapon.mac10.CLIP_AMMO_MAX = 20
tweak_data.weapon.mac10.NR_CLIPS_MAX = 6
tweak_data.weapon.mac10.AMMO_MAX = tweak_data.weapon.mac10.CLIP_AMMO_MAX * tweak_data.weapon.mac10.NR_CLIPS_MAX

tweak_data.weapon.mac10.armor_piercing_chance = 0.1

tweak_data.weapon.mac10.shake.fire_multiplier = 0.75
tweak_data.weapon.mac10.shake.fire_steelsight_multiplier = -0.75

tweak_data.weapon.mac10.stats = {
		damage = 17,
		spread = 6,
		recoil = 9,
		spread_moving = 8,
		zoom = 1,
		concealment = 27,
		suppression = 9,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

	
--M45
tweak_data.weapon.m45.kick.standing = { -0.9, 1.25, -1.75, 1.8 }
tweak_data.weapon.m45.kick.crouching = tweak_data.weapon.m45.kick.standing
tweak_data.weapon.m45.kick.steelsight = tweak_data.weapon.m45.kick.standing

tweak_data.weapon.m45.spread.standing = 4.5
tweak_data.weapon.m45.spread.crouching = 4
tweak_data.weapon.m45.spread.steelsight = 1.5
tweak_data.weapon.m45.spread.moving_standing = tweak_data.weapon.m45.spread.standing * 1.4
tweak_data.weapon.m45.spread.moving_crouching = tweak_data.weapon.m45.spread.crouching * 1.4
tweak_data.weapon.m45.spread.moving_steelsight = tweak_data.weapon.m45.spread.steelsight * 1.3

tweak_data.weapon.m45.CLIP_AMMO_MAX = 36
--tweak_data.weapon.m45.NR_CLIPS_MAX = 4
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
tweak_data.weapon.uzi.kick.standing = { -0.4, 1.65, -1.4, 1.4 }
tweak_data.weapon.uzi.kick.crouching = tweak_data.weapon.uzi.kick.standing
tweak_data.weapon.uzi.kick.steelsight = tweak_data.weapon.uzi.kick.standing

tweak_data.weapon.uzi.spread.standing = 4
tweak_data.weapon.uzi.spread.crouching = 3.5
tweak_data.weapon.uzi.spread.steelsight = 1.5
tweak_data.weapon.uzi.spread.moving_standing = tweak_data.weapon.uzi.spread.standing * 1.3
tweak_data.weapon.uzi.spread.moving_crouching = tweak_data.weapon.uzi.spread.crouching * 1.3
tweak_data.weapon.uzi.spread.moving_steelsight = tweak_data.weapon.uzi.spread.steelsight * 1.5

tweak_data.weapon.uzi.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.uzi.AMMO_MAX = 150

tweak_data.weapon.uzi.stats = {
		damage = 13,
		spread = 7,
		recoil = 17,
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

tweak_data.weapon.scorpion.spread.standing = 3.5
tweak_data.weapon.scorpion.spread.crouching = 3
tweak_data.weapon.scorpion.spread.steelsight = 1.55
tweak_data.weapon.scorpion.spread.moving_standing = tweak_data.weapon.scorpion.spread.standing * 1.4
tweak_data.weapon.scorpion.spread.moving_crouching = tweak_data.weapon.scorpion.spread.crouching * 1.4
tweak_data.weapon.scorpion.spread.moving_steelsight = tweak_data.weapon.scorpion.spread.steelsight * 1.5

tweak_data.weapon.scorpion.fire_mode_data.fire_rate = 0.070588235294117

tweak_data.weapon.scorpion.AMMO_MAX = 180

tweak_data.weapon.scorpion.shake.fire_multiplier = 1
tweak_data.weapon.scorpion.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.scorpion.stats = {
		damage = 11,
		spread = 6,
		recoil = 16,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 17,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 7
	}

	
--S-cool Shooting (TEC-9)
tweak_data.weapon.tec9.kick.standing = { -0.35, 1.7, -1.6, 1.1 }
tweak_data.weapon.tec9.kick.crouching = tweak_data.weapon.tec9.kick.standing
tweak_data.weapon.tec9.kick.steelsight = tweak_data.weapon.tec9.kick.standing

tweak_data.weapon.tec9.spread.standing = 4.5
tweak_data.weapon.tec9.spread.crouching = 4
tweak_data.weapon.tec9.spread.steelsight = 1.55
tweak_data.weapon.tec9.spread.moving_standing = tweak_data.weapon.tec9.spread.standing * 1.3
tweak_data.weapon.tec9.spread.moving_crouching = tweak_data.weapon.tec9.spread.crouching * 1.3
tweak_data.weapon.tec9.spread.moving_steelsight = tweak_data.weapon.tec9.spread.steelsight * 1.5

tweak_data.weapon.tec9.CLIP_AMMO_MAX = 32
tweak_data.weapon.tec9.AMMO_MAX = 160

tweak_data.weapon.tec9.shake.fire_multiplier = 1.2
tweak_data.weapon.tec9.shake.fire_steelsight_multiplier = -1.2

tweak_data.weapon.tec9.stats = {
		damage = 13,
		spread = 6,
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

local pivot_shoulder_translation = Vector3(8.60825, 44.5082, -5.26645)
local pivot_shoulder_rotation = Rotation(0.11042, 0.0131379, 0.63049)
local pivot_head_translation = Vector3(8, 32, -4)
local pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.tec9.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.tec9.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

--Gay for FNC too (MP9)
tweak_data.weapon.mp9.kick.standing = {1.1, -0.6, -1.2, 1.2 }
tweak_data.weapon.mp9.kick.crouching = tweak_data.weapon.mp9.kick.standing
tweak_data.weapon.mp9.kick.steelsight = tweak_data.weapon.mp9.kick.standing

tweak_data.weapon.mp9.fire_mode_data.fire_rate = 0.0667

tweak_data.weapon.mp9.spread.standing = 2.75
tweak_data.weapon.mp9.spread.crouching = 2.25
tweak_data.weapon.mp9.spread.steelsight = 1.4
tweak_data.weapon.mp9.spread.moving_standing = tweak_data.weapon.mp9.spread.standing * 1.15
tweak_data.weapon.mp9.spread.moving_crouching = tweak_data.weapon.mp9.spread.crouching * 1.15
tweak_data.weapon.mp9.spread.moving_steelsight = tweak_data.weapon.mp9.spread.steelsight * 1.3

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
		concealment = 24,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}


--EMPI (MP5)
local pivot_shoulder_translation = Vector3(10.7414, 18.4543, -3.29175)
local pivot_shoulder_rotation = Rotation(0.106934, -0.220015, 0.629729)
local pivot_head_translation = Vector3(0,10,-0.05)
local pivot_head_rotation = Rotation(0,0.25,0)
tweak_data.player.stances.new_mp5.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.new_mp5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.new_mp5.kick.standing = {0.85, 0.2, -1.35, 1.35 }
tweak_data.weapon.new_mp5.kick.crouching = tweak_data.weapon.new_mp5.kick.standing
tweak_data.weapon.new_mp5.kick.steelsight = tweak_data.weapon.new_mp5.kick.standing

tweak_data.weapon.new_mp5.spread.standing = 3.5
tweak_data.weapon.new_mp5.spread.crouching = 3
tweak_data.weapon.new_mp5.spread.steelsight = 1.3
tweak_data.weapon.new_mp5.spread.moving_standing = tweak_data.weapon.new_mp5.spread.standing * 1.3
tweak_data.weapon.new_mp5.spread.moving_crouching = tweak_data.weapon.new_mp5.spread.crouching * 1.3
tweak_data.weapon.new_mp5.spread.moving_steelsight = tweak_data.weapon.new_mp5.spread.steelsight * 1.5

tweak_data.weapon.new_mp5.fire_mode_data.fire_rate = 0.0779

tweak_data.weapon.new_mp5.AMMO_MAX = 150

tweak_data.weapon.new_mp5.shake.fire_multiplier = 0.8
tweak_data.weapon.new_mp5.shake.fire_steelsight_multiplier = -0.8

tweak_data.weapon.new_mp5.stats = {
		damage = 13,
		spread = 8,
		recoil = 17,
		spread_moving = 8,
		zoom = 1,
		concealment = 23,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}


--MP7
tweak_data.weapon.mp7.kick.standing = {1.9, -0.4, -1.0, 1.6}
tweak_data.weapon.mp7.kick.crouching = tweak_data.weapon.mp7.kick.standing
tweak_data.weapon.mp7.kick.steelsight = tweak_data.weapon.mp7.kick.standing

tweak_data.weapon.mp7.spread.standing = 4.5
tweak_data.weapon.mp7.spread.crouching = 4
tweak_data.weapon.mp7.spread.steelsight = 1.2
tweak_data.weapon.mp7.spread.moving_standing = tweak_data.weapon.mp7.spread.standing * 1.3
tweak_data.weapon.mp7.spread.moving_crouching = tweak_data.weapon.mp7.spread.crouching * 1.3
tweak_data.weapon.mp7.spread.moving_steelsight = tweak_data.weapon.mp7.spread.steelsight * 1.5

tweak_data.weapon.mp7.can_shoot_through_wall = true
tweak_data.weapon.mp7.can_shoot_through_enemy = true
tweak_data.weapon.mp7.can_shoot_through_shield = true

tweak_data.weapon.mp7.CLIP_AMMO_MAX = 20
tweak_data.weapon.mp7.NR_CLIPS_MAX = 9
tweak_data.weapon.mp7.AMMO_MAX = tweak_data.weapon.mp7.CLIP_AMMO_MAX * tweak_data.weapon.mp7.NR_CLIPS_MAX

tweak_data.weapon.mp7.armor_piercing_chance = 0.7

tweak_data.weapon.mp7.fire_mode_data.fire_rate = 0.06315789473

tweak_data.weapon.mp7.shake.fire_multiplier = 0.7
tweak_data.weapon.mp7.shake.fire_steelsight_multiplier = -0.7

tweak_data.weapon.mp7.stats = {
		damage = 11,
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
tweak_data.weapon.p90.kick.standing = {0.85, -0.225, -1.55, 1.55 }
tweak_data.weapon.p90.kick.crouching = tweak_data.weapon.p90.kick.standing
tweak_data.weapon.p90.kick.steelsight = tweak_data.weapon.p90.kick.standing

tweak_data.weapon.p90.spread.standing = 3.5
tweak_data.weapon.p90.spread.crouching = 2.5
tweak_data.weapon.p90.spread.steelsight = 1
tweak_data.weapon.p90.spread.moving_standing = tweak_data.weapon.p90.spread.standing * 1.2
tweak_data.weapon.p90.spread.moving_crouching = tweak_data.weapon.p90.spread.crouching * 1.2
tweak_data.weapon.p90.spread.moving_steelsight = tweak_data.weapon.p90.spread.steelsight * 1.3

tweak_data.weapon.p90.can_shoot_through_shield = true
tweak_data.weapon.p90.can_shoot_through_enemy = true
tweak_data.weapon.p90.can_shoot_through_wall = true

tweak_data.weapon.p90.armor_piercing_chance = 0.9

tweak_data.weapon.p90.fire_mode_data.fire_rate = 0.066666666666

tweak_data.weapon.p90.CLIP_AMMO_MAX = 50
--tweak_data.weapon.p90.NR_CLIPS_MAX = 2
tweak_data.weapon.p90.AMMO_MAX = 150

tweak_data.weapon.p90.shake.fire_multiplier = 0.57
tweak_data.weapon.p90.shake.fire_steelsight_multiplier = -0.57

tweak_data.weapon.p90.stats = {
		damage = 11,
		spread = 8,
		recoil = 16,
		spread_moving = 9,
		zoom = 1,
		concealment = 23,
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
tweak_data.weapon.akmsu.spread.moving_standing = tweak_data.weapon.akmsu.spread.standing * 1.55
tweak_data.weapon.akmsu.spread.moving_crouching = tweak_data.weapon.akmsu.spread.crouching * 1.55
tweak_data.weapon.akmsu.spread.moving_steelsight = tweak_data.weapon.akmsu.spread.steelsight * 1.75

tweak_data.weapon.akmsu.CLIP_AMMO_MAX = 30
--tweak_data.weapon.akmsu.NR_CLIPS_MAX = 4
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

tweak_data.weapon.olympic.spread.standing = 3.5
tweak_data.weapon.olympic.spread.crouching = 3
tweak_data.weapon.olympic.spread.steelsight = 1.5
tweak_data.weapon.olympic.spread.moving_standing = tweak_data.weapon.olympic.spread.standing * 1.2
tweak_data.weapon.olympic.spread.moving_crouching = tweak_data.weapon.olympic.spread.crouching * 1.2
tweak_data.weapon.olympic.spread.moving_steelsight = tweak_data.weapon.olympic.spread.steelsight * 1.35

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
tweak_data.weapon.akm.kick.standing = {1.7, -0.7, -1.4, 1.4 }
tweak_data.weapon.akm.kick.crouching = tweak_data.weapon.akm.kick.standing
tweak_data.weapon.akm.kick.steelsight = tweak_data.weapon.akm.kick.standing

tweak_data.weapon.akm.can_shoot_through_enemy = true
tweak_data.weapon.akm.can_shoot_through_wall = true

tweak_data.weapon.akm.armor_piercing_chance = 0.5

tweak_data.weapon.akm.spread.standing = 6
tweak_data.weapon.akm.spread.crouching = 5.5
tweak_data.weapon.akm.spread.steelsight = 1.5
tweak_data.weapon.akm.spread.moving_standing = tweak_data.weapon.akm.spread.standing * 1.5
tweak_data.weapon.akm.spread.moving_crouching = tweak_data.weapon.akm.spread.crouching * 1.5
tweak_data.weapon.akm.spread.moving_steelsight = tweak_data.weapon.akm.spread.steelsight * 1.8

tweak_data.weapon.akm.CLIP_AMMO_MAX = 30
tweak_data.weapon.akm.NR_CLIPS_MAX = 4
tweak_data.weapon.akm.AMMO_MAX = tweak_data.weapon.akm.CLIP_AMMO_MAX * tweak_data.weapon.akm.NR_CLIPS_MAX

tweak_data.weapon.akm.shake.fire_multiplier = 1.25
tweak_data.weapon.akm.shake.fire_steelsight_multiplier = -1.25

tweak_data.weapon.akm.fire_mode_data.fire_rate = 0.1
tweak_data.weapon.akm.stats = {
		damage = 27,
		spread = 6,
		recoil = 14,
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
tweak_data.weapon.akm_gold.kick.standing = {1.4, -0.75, -1.55, 1.55 }
tweak_data.weapon.akm_gold.kick.crouching = tweak_data.weapon.akm_gold.kick.standing
tweak_data.weapon.akm_gold.kick.steelsight = tweak_data.weapon.akm_gold.kick.standing

tweak_data.weapon.akm_gold.can_shoot_through_enemy = true
tweak_data.weapon.akm_gold.can_shoot_through_wall = true

tweak_data.weapon.akm_gold.armor_piercing_chance = 0.5

tweak_data.weapon.akm_gold.spread.standing = 6.25
tweak_data.weapon.akm_gold.spread.crouching = 5.75
tweak_data.weapon.akm_gold.spread.steelsight = 1.5
tweak_data.weapon.akm_gold.spread.moving_standing = tweak_data.weapon.akm_gold.spread.standing * 1.8
tweak_data.weapon.akm_gold.spread.moving_crouching = tweak_data.weapon.akm_gold.spread.crouching * 1.8
tweak_data.weapon.akm_gold.spread.moving_steelsight = tweak_data.weapon.akm_gold.spread.steelsight * 1.85

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
	
local pivot_shoulder_translation = Vector3( 10.6725, 27.7166, -4.93564 )
local pivot_shoulder_rotation = Rotation( 0.1067, -0.0850111, 0.629008 )
local pivot_head_translation = Vector3( 10, 22, -5 )
local pivot_head_rotation = Rotation( 0.2, 0.5, -0 )
tweak_data.player.stances.akm_gold.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.akm_gold.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3( 8, 22, -1 )
local pivot_head_rotation = Rotation( 0.2, 0.5, -0 )
tweak_data.player.stances.akm_gold.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.akm_gold.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()


--ICHIROKU (M16)
tweak_data.weapon.m16.spread.standing = 6.25
tweak_data.weapon.m16.spread.crouching = 5.75
tweak_data.weapon.m16.spread.steelsight = 0.9
tweak_data.weapon.m16.spread.moving_standing = tweak_data.weapon.m16.spread.standing * 1.6
tweak_data.weapon.m16.spread.moving_crouching = tweak_data.weapon.m16.spread.crouching * 1.6
tweak_data.weapon.m16.spread.moving_steelsight = tweak_data.weapon.m16.spread.steelsight * 1.65

tweak_data.weapon.m16.kick.standing = { -0.7, 1.675, -1.475, 1.475 }
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
tweak_data.weapon.aug.kick.standing = { -0.6, 1.2, -1.55, 1.55}
tweak_data.weapon.aug.kick.crouching = tweak_data.weapon.aug.kick.standing
tweak_data.weapon.aug.kick.steelsight = tweak_data.weapon.aug.kick.standing

tweak_data.weapon.aug.spread.standing = 4.5
tweak_data.weapon.aug.spread.crouching = 4
tweak_data.weapon.aug.spread.steelsight = 0.8
tweak_data.weapon.aug.spread.moving_standing = tweak_data.weapon.aug.spread.standing * 1.35
tweak_data.weapon.aug.spread.moving_crouching = tweak_data.weapon.aug.spread.crouching * 1.35
tweak_data.weapon.aug.spread.moving_steelsight = tweak_data.weapon.aug.spread.steelsight * 1.55

tweak_data.weapon.aug.CLIP_AMMO_MAX = 30
--tweak_data.weapon.aug.NR_CLIPS_MAX = 5
tweak_data.weapon.aug.AMMO_MAX = 150

tweak_data.weapon.aug.can_shoot_through_enemy = true
tweak_data.weapon.aug.can_shoot_through_wall = true

tweak_data.weapon.aug.armor_piercing_chance = 0.25

tweak_data.weapon.aug.fire_mode_data.fire_rate = 0.08

tweak_data.weapon.aug.shake.fire_multiplier = 1
tweak_data.weapon.aug.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.aug.stats = {
		damage = 19,
		spread = 9,
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
	
	
--DEAGLE (FAMAS)
local pivot_shoulder_translation = Vector3(12.4978, 36.9949, -1.6971)
local pivot_shoulder_rotation = Rotation(2.58401, -0.0831424, 0.629405)
local pivot_head_translation = Vector3(0, 32, 0)
local pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.famas.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.famas.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.famas.kick.standing = { -1.0, 1.7, -1.6, 1.6}
tweak_data.weapon.famas.kick.crouching = tweak_data.weapon.famas.kick.standing
tweak_data.weapon.famas.kick.steelsight = tweak_data.weapon.famas.kick.standing

tweak_data.weapon.famas.spread.standing = 5
tweak_data.weapon.famas.spread.crouching = 4.5
tweak_data.weapon.famas.spread.steelsight = 1
tweak_data.weapon.famas.spread.moving_standing = tweak_data.weapon.famas.spread.standing * 1.4
tweak_data.weapon.famas.spread.moving_crouching = tweak_data.weapon.famas.spread.crouching * 1.4
tweak_data.weapon.famas.spread.moving_steelsight = tweak_data.weapon.famas.spread.steelsight * 1.6

tweak_data.weapon.famas.CLIP_AMMO_MAX = 25
tweak_data.weapon.famas.NR_CLIPS_MAX = 6
tweak_data.weapon.famas.AMMO_MAX = tweak_data.weapon.famas.CLIP_AMMO_MAX * tweak_data.weapon.famas.NR_CLIPS_MAX 

tweak_data.weapon.famas.can_shoot_through_enemy = true
tweak_data.weapon.famas.can_shoot_through_wall = true

tweak_data.weapon.famas.armor_piercing_chance = 0.2

tweak_data.weapon.famas.shake.fire_multiplier = 1.0
tweak_data.weapon.famas.shake.fire_steelsight_multiplier = -1.0

tweak_data.weapon.famas.stats = {
		damage = 17,
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
tweak_data.weapon.new_m4.kick.standing = { -0.2, 1.4, -1.3, 1.3}
tweak_data.weapon.new_m4.kick.crouching = tweak_data.weapon.new_m4.kick.standing
tweak_data.weapon.new_m4.kick.steelsight = tweak_data.weapon.new_m4.kick.standing

tweak_data.weapon.new_m4.spread.standing = 4.5
tweak_data.weapon.new_m4.spread.crouching = 4
tweak_data.weapon.new_m4.spread.steelsight = 1
tweak_data.weapon.new_m4.spread.moving_standing = tweak_data.weapon.new_m4.spread.standing * 1.3
tweak_data.weapon.new_m4.spread.moving_crouching = tweak_data.weapon.new_m4.spread.standing * 1.3
tweak_data.weapon.new_m4.spread.moving_steelsight = tweak_data.weapon.new_m4.spread.steelsight * 1.45

tweak_data.weapon.new_m4.fire_mode_data.fire_rate = 0.08

tweak_data.weapon.new_m4.can_shoot_through_enemy = true
tweak_data.weapon.new_m4.can_shoot_through_wall = true

tweak_data.weapon.new_m4.armor_piercing_chance = 0.2

tweak_data.weapon.new_m4.shake.fire_multiplier = 0.7
tweak_data.weapon.new_m4.shake.fire_steelsight_multiplier = -0.7

tweak_data.weapon.new_m4.stats = {
		damage = 19,
		spread = 6,
		recoil = 14,
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
local pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
local pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
local pivot_head_translation = Vector3(0.01,9,-0.0)
local pivot_head_rotation = Rotation(0,-0,0)
tweak_data.player.stances.ak5.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.ak5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.ak5.kick.standing = { -0.5, 1.25, -1.5, 1.5 }
tweak_data.weapon.ak5.kick.crouching = tweak_data.weapon.ak5.kick.standing
tweak_data.weapon.ak5.kick.steelsight = tweak_data.weapon.ak5.kick.standing

tweak_data.weapon.ak5.spread.standing = 5.25
tweak_data.weapon.ak5.spread.crouching = 4.75
tweak_data.weapon.ak5.spread.steelsight = 0.9
tweak_data.weapon.ak5.spread.moving_standing = tweak_data.weapon.ak5.spread.standing * 1.7
tweak_data.weapon.ak5.spread.moving_crouching = tweak_data.weapon.ak5.spread.crouching * 1.7
tweak_data.weapon.ak5.spread.moving_steelsight = tweak_data.weapon.ak5.spread.steelsight * 1.75

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
tweak_data.weapon.ak74.spread.standing = 5.5
tweak_data.weapon.ak74.spread.crouching = 5
tweak_data.weapon.ak74.spread.steelsight = 1.2
tweak_data.weapon.ak74.spread.moving_standing = tweak_data.weapon.ak74.spread.standing * 1.225
tweak_data.weapon.ak74.spread.moving_crouching = tweak_data.weapon.ak74.spread.crouching * 1.225
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
tweak_data.weapon.amcar.spread.standing = 4.5
tweak_data.weapon.amcar.spread.crouching = 4
tweak_data.weapon.amcar.spread.steelsight = 1.2
tweak_data.weapon.amcar.spread.moving_standing = tweak_data.weapon.amcar.spread.standing * 1.3
tweak_data.weapon.amcar.spread.moving_crouching = tweak_data.weapon.amcar.spread.standing * 1.3
tweak_data.weapon.amcar.spread.moving_steelsight = tweak_data.weapon.amcar.spread.steelsight * 1.5

tweak_data.weapon.amcar.kick.standing = { -0.1, 1.2, -1.75, 1.75 }
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
		damage = 15,
		spread = 6,
		recoil = 17,
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
tweak_data.weapon.s552.kick.standing = { -0.2, 1.55, -1.25, 1.25 }
tweak_data.weapon.s552.kick.crouching = tweak_data.weapon.s552.kick.standing
tweak_data.weapon.s552.kick.steelsight = tweak_data.weapon.s552.kick.standing

tweak_data.weapon.s552.spread.standing = 5.25
tweak_data.weapon.s552.spread.crouching = 4.75
tweak_data.weapon.s552.spread.steelsight = 1.1
tweak_data.weapon.s552.spread.moving_standing = tweak_data.weapon.s552.spread.standing * 1.25
tweak_data.weapon.s552.spread.moving_crouching = tweak_data.weapon.s552.spread.crouching * 1.25
tweak_data.weapon.s552.spread.moving_steelsight = tweak_data.weapon.s552.spread.steelsight * 1.4

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
		recoil = 13,
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
tweak_data.weapon.g36.spread.standing = 5
tweak_data.weapon.g36.spread.crouching = 4.5
tweak_data.weapon.g36.spread.steelsight = 1.15
tweak_data.weapon.g36.spread.moving_standing = tweak_data.weapon.g36.spread.standing * 1.35
tweak_data.weapon.g36.spread.moving_crouching = tweak_data.weapon.g36.spread.crouching * 1.35
tweak_data.weapon.g36.spread.moving_steelsight = tweak_data.weapon.g36.spread.steelsight * 1.5

tweak_data.weapon.g36.kick.standing = { -0.8, 1.3, -1.3, 1.3}
tweak_data.weapon.g36.kick.crouching = tweak_data.weapon.g36.kick.standing
tweak_data.weapon.g36.kick.steelsight = tweak_data.weapon.g36.kick.standing

tweak_data.weapon.g36.can_shoot_through_enemy = true
tweak_data.weapon.g36.can_shoot_through_wall = true

tweak_data.weapon.g36.armor_piercing_chance = 0.15

tweak_data.weapon.g36.AMMO_MAX = 180

tweak_data.weapon.g36.fire_mode_data.fire_rate = 0.08

tweak_data.weapon.g36.shake.fire_multiplier = 1
tweak_data.weapon.g36.shake.fire_steelsight_multiplier = -1

local pivot_shoulder_translation = Vector3(10.5658, 24.8768, -1.07923)
local pivot_shoulder_rotation = Rotation(-0.000313746, 0.000813967, -0.00027678)
local pivot_head_translation = Vector3(-0.01,12,0)
local pivot_head_rotation = Rotation(0,0,0)
tweak_data.player.stances.g36.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.g36.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

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
tweak_data.weapon.saiga.spread.standing = 4.75
tweak_data.weapon.saiga.spread.crouching = tweak_data.weapon.saiga.spread.standing
tweak_data.weapon.saiga.spread.steelsight = tweak_data.weapon.saiga.spread.standing * 0.8
tweak_data.weapon.saiga.spread.moving_standing = tweak_data.weapon.saiga.spread.standing
tweak_data.weapon.saiga.spread.moving_crouching = tweak_data.weapon.saiga.spread.standing
tweak_data.weapon.saiga.spread.moving_steelsight = tweak_data.weapon.saiga.spread.standing * 0.9

tweak_data.weapon.saiga.CLIP_AMMO_MAX = 8
--tweak_data.weapon.saiga.NR_CLIPS_MAX = 11
tweak_data.weapon.saiga.AMMO_MAX = 88

tweak_data.weapon.saiga.kick.standing = {2.9, 1.9, -2.95, 2.95 }
tweak_data.weapon.saiga.kick.crouching = tweak_data.weapon.saiga.kick.standing
tweak_data.weapon.saiga.kick.steelsight = tweak_data.weapon.saiga.kick.standing

tweak_data.weapon.saiga.fire_mode_data.fire_rate = 0.12

tweak_data.weapon.saiga.rays = 8 --pellets per shot

tweak_data.weapon.saiga.damage_near = 100
tweak_data.weapon.saiga.damage_far = 2900

tweak_data.weapon.saiga.shake.fire_multiplier = 2
tweak_data.weapon.saiga.shake.fire_steelsight_multiplier = -2

tweak_data.weapon.saiga.muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash"

tweak_data.weapon.saiga.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.saiga.stats = {
		damage = 17,
		spread = 5,
		recoil = 13,
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
local pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
local pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
local pivot_head_translation = Vector3(10,22,-5	)
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.r870.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r870.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3(6,20,-4)
local pivot_head_rotation = Rotation( -0, -0, 0 )
tweak_data.player.stances.r870.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r870.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3(0,22,0.1)
local pivot_head_rotation = Rotation(0,0,0)
tweak_data.player.stances.r870.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r870.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.r870.spread.standing = 4.75
tweak_data.weapon.r870.spread.crouching = tweak_data.weapon.r870.spread.standing
tweak_data.weapon.r870.spread.steelsight = tweak_data.weapon.r870.spread.standing * 0.85
tweak_data.weapon.r870.spread.moving_standing = tweak_data.weapon.r870.spread.standing
tweak_data.weapon.r870.spread.moving_crouching = tweak_data.weapon.r870.spread.standing
tweak_data.weapon.r870.spread.moving_steelsight = tweak_data.weapon.r870.spread.standing * 0.9

tweak_data.weapon.r870.kick.standing = {3.75, 2.6, -3.25, 3.25 }
tweak_data.weapon.r870.kick.crouching = tweak_data.weapon.r870.kick.standing
tweak_data.weapon.r870.kick.steelsight = tweak_data.weapon.r870.kick.standing

tweak_data.weapon.r870.rays = 8--pellets per shot

tweak_data.weapon.r870.fire_mode_data.fire_rate = 0.8

tweak_data.weapon.r870.shake.fire_multiplier = 2.5
tweak_data.weapon.r870.shake.fire_steelsight_multiplier = -2.5

tweak_data.weapon.r870.muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash"

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
local pivot_shoulder_translation = Vector3(10.6562, 32.9715, -6.73279)
local pivot_shoulder_rotation = Rotation(0.106667, -0.0844876, 0.629223)
local pivot_head_translation = Vector3(0,20,-0.6)
local pivot_head_rotation = Rotation(0,1.5,0)
tweak_data.player.stances.huntsman.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.huntsman.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.huntsman.spread.standing = 4.75
tweak_data.weapon.huntsman.spread.crouching = tweak_data.weapon.huntsman.spread.standing 
tweak_data.weapon.huntsman.spread.steelsight = tweak_data.weapon.huntsman.spread.standing * 0.9
tweak_data.weapon.huntsman.spread.moving_standing = tweak_data.weapon.huntsman.spread.standing 
tweak_data.weapon.huntsman.spread.moving_crouching = tweak_data.weapon.huntsman.spread.standing 
tweak_data.weapon.huntsman.spread.moving_steelsight = tweak_data.weapon.huntsman.spread.standing * 0.95

tweak_data.weapon.huntsman.rays = 8

tweak_data.weapon.huntsman.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.huntsman.damage_near = 100
tweak_data.weapon.huntsman.damage_far = 3400

tweak_data.weapon.huntsman.kick.standing = {3.5, 3.8, -3.8, 3.8}
tweak_data.weapon.huntsman.kick.crouching = tweak_data.weapon.huntsman.kick.standing
tweak_data.weapon.huntsman.kick.steelsight = tweak_data.weapon.huntsman.kick.standing

tweak_data.weapon.huntsman.shake.fire_multiplier = -2.25
tweak_data.weapon.huntsman.shake.fire_steelsight_multiplier = -2.25

tweak_data.weapon.huntsman.CLIP_AMMO_MAX = 2
tweak_data.weapon.huntsman.NR_CLIPS_MAX = 20
tweak_data.weapon.huntsman.AMMO_MAX = tweak_data.weapon.huntsman.CLIP_AMMO_MAX * tweak_data.weapon.huntsman.NR_CLIPS_MAX

tweak_data.weapon.huntsman.muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash"

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
	
	
--Benelli M4
local pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
local pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
local pivot_head_translation = Vector3(10,22,-2	)
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.benelli.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.benelli.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3(8,21,0)
local pivot_head_rotation = Rotation( -0, -0, 0 )
tweak_data.player.stances.benelli.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.benelli.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.benelli.CLIP_AMMO_MAX = 5
--tweak_data.weapon.benelli.NR_CLIPS_MAX = 12
tweak_data.weapon.benelli.AMMO_MAX = 70

tweak_data.weapon.benelli.spread.standing = 4.75
tweak_data.weapon.benelli.spread.crouching = tweak_data.weapon.benelli.spread.standing
tweak_data.weapon.benelli.spread.steelsight = tweak_data.weapon.benelli.spread.standing * 0.8
tweak_data.weapon.benelli.spread.moving_standing = tweak_data.weapon.benelli.spread.standing
tweak_data.weapon.benelli.spread.moving_crouching = tweak_data.weapon.benelli.spread.standing
tweak_data.weapon.benelli.spread.moving_steelsight = tweak_data.weapon.benelli.spread.standing * 0.9

tweak_data.weapon.benelli.kick.standing = {2.9, 2.2, -2.3, 3.95 }
tweak_data.weapon.benelli.kick.crouching = tweak_data.weapon.benelli.kick.standing
tweak_data.weapon.benelli.kick.steelsight = tweak_data.weapon.benelli.kick.standing

tweak_data.weapon.benelli.damage_near = 100
tweak_data.weapon.benelli.damage_far = 3150

tweak_data.weapon.benelli.shake.fire_multiplier = 2
tweak_data.weapon.benelli.shake.fire_steelsight_multiplier = -2

tweak_data.weapon.benelli.rays = 8

tweak_data.weapon.benelli.fire_mode_data.fire_rate = 0.1333

tweak_data.weapon.benelli.muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash"

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
tweak_data.weapon.ksg.kick.standing = {3.75, 3.75, -3.75, 3.75 }
tweak_data.weapon.ksg.kick.crouching = tweak_data.weapon.ksg.kick.standing
tweak_data.weapon.ksg.kick.steelsight = tweak_data.weapon.ksg.kick.standing

tweak_data.weapon.ksg.fire_mode_data.fire_rate = 0.705882

tweak_data.weapon.ksg.shake.fire_multiplier = 2.2
tweak_data.weapon.ksg.shake.fire_steelsight_multiplier = -2.2

tweak_data.weapon.ksg.damage_near = 100
tweak_data.weapon.ksg.damage_far = 3650

tweak_data.weapon.ksg.AMMO_MAX = 56

tweak_data.weapon.ksg.spread.standing = 4.75
tweak_data.weapon.ksg.spread.crouching = tweak_data.weapon.ksg.spread.standing
tweak_data.weapon.ksg.spread.steelsight = tweak_data.weapon.ksg.spread.standing * 0.85
tweak_data.weapon.ksg.spread.moving_standing = tweak_data.weapon.ksg.spread.standing
tweak_data.weapon.ksg.spread.moving_crouching = tweak_data.weapon.ksg.spread.standing
tweak_data.weapon.ksg.spread.moving_steelsight = tweak_data.weapon.ksg.spread.standing * 0.9

tweak_data.weapon.ksg.sounds.enter_steelsight = "secondary_steel_sight_enter"
tweak_data.weapon.ksg.sounds.leave_steelsight = "secondary_steel_sight_exit"

tweak_data.weapon.ksg.rays = 8

tweak_data.weapon.ksg.muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash"

tweak_data.weapon.ksg.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.ksg.stats = {
		damage = 25,
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
local pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
local pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
local pivot_head_translation = Vector3(10,22,-5	)
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.serbu.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.serbu.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3(6,20,-4)
local pivot_head_rotation = Rotation( -0, -0, 0 )
tweak_data.player.stances.serbu.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.serbu.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3(0,22,0)
local pivot_head_rotation = Rotation(0,0,0)
tweak_data.player.stances.serbu.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.serbu.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.serbu.spread.standing = 4.75
tweak_data.weapon.serbu.spread.crouching = tweak_data.weapon.serbu.spread.standing
tweak_data.weapon.serbu.spread.steelsight = tweak_data.weapon.serbu.spread.standing * 0.85
tweak_data.weapon.serbu.spread.moving_standing = tweak_data.weapon.serbu.spread.standing
tweak_data.weapon.serbu.spread.moving_crouching = tweak_data.weapon.serbu.spread.standing
tweak_data.weapon.serbu.spread.moving_steelsight = tweak_data.weapon.serbu.spread.standing * 0.9

tweak_data.weapon.serbu.kick.standing = {4.0, 3.8, -3.75, 3.75 }
tweak_data.weapon.serbu.kick.crouching = tweak_data.weapon.serbu.kick.standing
tweak_data.weapon.serbu.kick.steelsight = tweak_data.weapon.serbu.kick.standing

tweak_data.weapon.serbu.CLIP_AMMO_MAX = 3
tweak_data.weapon.serbu.NR_CLIPS_MAX = 16
tweak_data.weapon.serbu.AMMO_MAX = tweak_data.weapon.serbu.CLIP_AMMO_MAX * tweak_data.weapon.serbu.NR_CLIPS_MAX

tweak_data.weapon.serbu.rays = 8

tweak_data.weapon.serbu.damage_near = 100
tweak_data.weapon.serbu.damage_far = 2400

tweak_data.weapon.serbu.fire_mode_data.fire_rate = 0.6

tweak_data.weapon.serbu.shake.fire_multiplier = 3
tweak_data.weapon.serbu.shake.fire_steelsight_multiplier = -3

tweak_data.weapon.serbu.muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash"
	
tweak_data.weapon.serbu.stats_modifiers = {
		damage = 2,
	}	
	
tweak_data.weapon.serbu.stats = {
		damage = 31,
		spread = 2,
		recoil = 5,
		spread_moving = 6,
		zoom = 1,
		concealment = 26,
		suppression = 6,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}
	

--Striker (STREET SWEEPER)

tweak_data.weapon.striker.kick.standing = {2.2, 2.1, -2.95, 2.95 }
tweak_data.weapon.striker.kick.crouching = tweak_data.weapon.striker.kick.standing
tweak_data.weapon.striker.kick.steelsight = tweak_data.weapon.striker.kick.standing

tweak_data.weapon.striker.spread.standing = 4.75
tweak_data.weapon.striker.spread.crouching = tweak_data.weapon.striker.spread.standing
tweak_data.weapon.striker.spread.steelsight = tweak_data.weapon.striker.spread.standing * 0.85
tweak_data.weapon.striker.spread.moving_standing = tweak_data.weapon.striker.spread.standing
tweak_data.weapon.striker.spread.moving_crouching = tweak_data.weapon.striker.spread.standing
tweak_data.weapon.striker.spread.moving_steelsight = tweak_data.weapon.striker.spread.standing * 0.9

tweak_data.weapon.striker.sounds.enter_steelsight = "secondary_steel_sight_enter"
tweak_data.weapon.striker.sounds.leave_steelsight = "secondary_steel_sight_exit"

tweak_data.weapon.striker.shake.fire_multiplier = 1.5
tweak_data.weapon.striker.shake.fire_steelsight_multiplier = -1.5

tweak_data.weapon.striker.rays = 8

tweak_data.weapon.striker.AMMO_MAX = 72

tweak_data.weapon.striker.fire_mode_data.fire_rate = 0.1429

tweak_data.weapon.striker.damage_near = 100
tweak_data.weapon.striker.damage_far = 2900

tweak_data.weapon.striker.muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash"

tweak_data.weapon.striker.stats_modifiers = {
		damage = 2,
	}
	
tweak_data.weapon.striker.stats = {
		damage = 19,
		spread = 5,
		recoil = 7,
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
tweak_data.weapon.new_m14.category = "snp"

tweak_data.weapon.new_m14.spread.standing = 7.25
tweak_data.weapon.new_m14.spread.crouching = 6.25
tweak_data.weapon.new_m14.spread.steelsight = 0.8
tweak_data.weapon.new_m14.spread.moving_standing = tweak_data.weapon.new_m14.spread.standing * 1.75
tweak_data.weapon.new_m14.spread.moving_crouching = tweak_data.weapon.new_m14.spread.crouching * 1.75
tweak_data.weapon.new_m14.spread.moving_steelsight = tweak_data.weapon.new_m14.spread.steelsight * 2.2

tweak_data.weapon.new_m14.kick.standing = {2.25, 1.55, -1.5, 1.5 }
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

tweak_data.weapon.new_m14.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.new_m14.stats = {
		damage = 49,
		spread = 9,
		recoil = 8,
		spread_moving = 5,
		zoom = 1,
		concealment = 6,
		suppression = 3,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 1,
	}

--MK17 (SCAR/MK17)
tweak_data.weapon.scar.category = "snp"

tweak_data.weapon.scar.spread.standing = 6
tweak_data.weapon.scar.spread.crouching = 5.5
tweak_data.weapon.scar.spread.steelsight = 0.85
tweak_data.weapon.scar.spread.moving_standing = tweak_data.weapon.scar.spread.standing * 1.9
tweak_data.weapon.scar.spread.moving_crouching = tweak_data.weapon.scar.spread.crouching * 1.9
tweak_data.weapon.scar.spread.moving_steelsight = tweak_data.weapon.scar.spread.steelsight * 1.85

tweak_data.weapon.scar.kick.standing = {-0.6, 1.95, -1.9, 1.9 }
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
--tweak_data.weapon.scar.NR_CLIPS_MAX = 4
tweak_data.weapon.scar.AMMO_MAX = 80

tweak_data.weapon.scar.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

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
	
--Nee-san (FAL)
tweak_data.weapon.fal.category = "snp"

tweak_data.weapon.fal.spread.standing = 6.25
tweak_data.weapon.fal.spread.crouching = 5.75
tweak_data.weapon.fal.spread.steelsight = 1.05
tweak_data.weapon.fal.spread.moving_standing = tweak_data.weapon.fal.spread.standing * 1.7
tweak_data.weapon.fal.spread.moving_crouching = tweak_data.weapon.fal.spread.crouching * 1.7
tweak_data.weapon.fal.spread.moving_steelsight = tweak_data.weapon.fal.spread.steelsight * 2.3

tweak_data.weapon.fal.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.fal.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.fal.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.fal.CLIP_AMMO_MAX = 20
tweak_data.weapon.fal.NR_CLIPS_MAX = 3
tweak_data.weapon.fal.AMMO_MAX = tweak_data.weapon.fal.CLIP_AMMO_MAX * tweak_data.weapon.fal.NR_CLIPS_MAX

tweak_data.weapon.fal.can_shoot_through_shield = true
tweak_data.weapon.fal.can_shoot_through_enemy = true
tweak_data.weapon.fal.can_shoot_through_wall = true

tweak_data.weapon.fal.armor_piercing_chance = 0.85

tweak_data.weapon.fal.shake.fire_multiplier = 0.95
tweak_data.weapon.fal.shake.fire_steelsight_multiplier = -0.95

tweak_data.weapon.fal.kick.standing = {-0.45, 1.3, -2.15, 2.15 }
tweak_data.weapon.fal.kick.crouching = tweak_data.weapon.fal.kick.standing
tweak_data.weapon.fal.kick.steelsight = tweak_data.weapon.fal.kick.standing

tweak_data.weapon.fal.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.fal.stats = {
		damage = 49,
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

local pivot_shoulder_translation = Vector3(10.7344, 22.1028, -3.71493)
local pivot_shoulder_rotation = Rotation(0.107212, -0.0843867, 0.629332)
local pivot_head_translation = Vector3(0, 15, 0)
local pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.galil.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.galil.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.galil.category = "snp"

tweak_data.weapon.galil.kick.standing = {-1.35, 2.25, -1.8, 1.8 }
tweak_data.weapon.galil.kick.crouching = tweak_data.weapon.galil.kick.standing
tweak_data.weapon.galil.kick.steelsight = tweak_data.weapon.galil.kick.standing

tweak_data.weapon.galil.spread.standing = 6.5
tweak_data.weapon.galil.spread.crouching = 6
tweak_data.weapon.galil.spread.steelsight = 1
tweak_data.weapon.galil.spread.moving_standing = tweak_data.weapon.galil.spread.standing * 1.85
tweak_data.weapon.galil.spread.moving_crouching = tweak_data.weapon.galil.spread.crouching * 1.85
tweak_data.weapon.galil.spread.moving_steelsight = tweak_data.weapon.galil.spread.steelsight * 2.55

tweak_data.weapon.galil.fire_mode_data.fire_rate = 0.08

tweak_data.weapon.galil.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.galil.armor_piercing_chance = 0.8

tweak_data.weapon.galil.sounds.leave_steelsight = "primary_steel_sight_exit"
tweak_data.weapon.galil.sounds.enter_steelsight = "primary_steel_sight_enter"

tweak_data.weapon.galil.can_shoot_through_shield = true
tweak_data.weapon.galil.can_shoot_through_enemy = true
tweak_data.weapon.galil.can_shoot_through_wall = true

tweak_data.weapon.galil.CLIP_AMMO_MAX = 25
tweak_data.weapon.galil.AMMO_MAX = 50

tweak_data.weapon.galil.shake.fire_multiplier = 0.9
tweak_data.weapon.galil.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.galil.stats = {
		damage = 49,
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
local pivot_shoulder_translation = Vector3(10.7158, 21.5452, -1.67945)
local pivot_shoulder_rotation = Rotation(0.107438, -0.0837396, 0.629882)
local pivot_head_translation = Vector3(0, 15, 0.2)
local pivot_head_rotation = Rotation(0.0, 0.2, 0)
tweak_data.player.stances.g3.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g3.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.g3.category = "snp"

tweak_data.weapon.g3.kick.standing = {1.2, 1.95, -1.85, 1.85 }
tweak_data.weapon.g3.kick.crouching = tweak_data.weapon.g3.kick.standing
tweak_data.weapon.g3.kick.steelsight = tweak_data.weapon.g3.kick.standing

tweak_data.weapon.g3.spread.standing = 6
tweak_data.weapon.g3.spread.crouching = 5.5
tweak_data.weapon.g3.spread.steelsight = 0.9
tweak_data.weapon.g3.spread.moving_standing = tweak_data.weapon.g3.spread.standing * 1.825
tweak_data.weapon.g3.spread.moving_crouching = tweak_data.weapon.g3.spread.crouching * 1.825
tweak_data.weapon.g3.spread.moving_steelsight = tweak_data.weapon.g3.spread.steelsight * 2.25

tweak_data.weapon.g3.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

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

tweak_data.weapon.g3.fire_mode_data.fire_rate = 0.1090909090909090909

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
tweak_data.weapon.hk21.kick.standing = {2.3, -1.2, -2.2, 2.2 }
tweak_data.weapon.hk21.kick.crouching = tweak_data.weapon.hk21.kick.standing
tweak_data.weapon.hk21.kick.steelsight = tweak_data.weapon.hk21.kick.standing

tweak_data.weapon.hk21.fire_mode_data.fire_rate = 0.075

tweak_data.weapon.hk21.spread.standing = 6.5
tweak_data.weapon.hk21.spread.crouching = 6
tweak_data.weapon.hk21.spread.steelsight = 1.2
tweak_data.weapon.hk21.spread.moving_standing = tweak_data.weapon.hk21.spread.standing * 2.2
tweak_data.weapon.hk21.spread.moving_crouching = tweak_data.weapon.hk21.spread.crouching * 2.2
tweak_data.weapon.hk21.spread.moving_steelsight = tweak_data.weapon.hk21.spread.steelsight * 3.75

tweak_data.weapon.hk21.CLIP_AMMO_MAX = 100
tweak_data.weapon.hk21.NR_CLIPS_MAX = 2
tweak_data.weapon.hk21.AMMO_MAX = tweak_data.weapon.hk21.CLIP_AMMO_MAX * tweak_data.weapon.hk21.NR_CLIPS_MAX

tweak_data.weapon.hk21.shake.fire_multiplier = 1.0
tweak_data.weapon.hk21.shake.fire_steelsight_multiplier = -1.0

tweak_data.weapon.hk21.can_shoot_through_shield = true
tweak_data.weapon.hk21.can_shoot_through_enemy = true
tweak_data.weapon.hk21.can_shoot_through_wall = true

tweak_data.weapon.hk21.armor_piercing_chance = 0.7

tweak_data.weapon.hk21.stats = {
		damage = 33,
		spread = 7,
		recoil = 9,
		spread_moving = 8,
		zoom = 1,
		concealment = 2,
		suppression = 4,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 9,
	}

--Thanks to gir489 for the LMG ironsights codes
local pivot_shoulder_translation = Vector3( 11.3874, 18.55, -2.08902 )
local pivot_shoulder_rotation = Rotation( 3.03061, 1.08595, 1.87441 )
local pivot_head_rotation = Rotation( -2.98, -0.9, -2 ) --( -3, -1, -2 )
tweak_data.player.stances[ "hk21" ].steelsight.shoulders.translation = Vector3( 0.98, 15, 0.15 ) - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation ) --( 0.99, 20, 0.1 )
tweak_data.player.stances[ "hk21" ].steelsight.shoulders.rotation = pivot_head_rotation

local pivot_head_translation = Vector3( 10, 13, -7 )
local pivot_head_rotation = Rotation( 0.2, 0.5, -4 )
tweak_data.player.stances.hk21.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.hk21.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3( 10, 13, -3 )
local pivot_head_rotation = Rotation( 0.2, 0.5, -4 )
tweak_data.player.stances.hk21.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.hk21.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

--M249 (KSP)
tweak_data.weapon.m249.kick.standing = { 1.5, -0.95, -1.9, 1.9 }
tweak_data.weapon.m249.kick.crouching = tweak_data.weapon.m249.kick.standing
tweak_data.weapon.m249.kick.steelsight = tweak_data.weapon.m249.kick.standing

tweak_data.weapon.m249.CLIP_AMMO_MAX = 200
tweak_data.weapon.m249.NR_CLIPS_MAX = 2
tweak_data.weapon.m249.AMMO_MAX = tweak_data.weapon.m249.CLIP_AMMO_MAX * tweak_data.weapon.m249.NR_CLIPS_MAX

tweak_data.weapon.m249.spread.standing = 6
tweak_data.weapon.m249.spread.crouching = 5.5
tweak_data.weapon.m249.spread.steelsight = 1.4
tweak_data.weapon.m249.spread.moving_standing = tweak_data.weapon.m249.spread.standing * 2.35
tweak_data.weapon.m249.spread.moving_crouching = tweak_data.weapon.m249.spread.crouching * 2.35
tweak_data.weapon.m249.spread.moving_steelsight = tweak_data.weapon.m249.spread.steelsight * 2.7

tweak_data.weapon.m249.fire_mode_data.fire_rate = 0.0631578

tweak_data.weapon.m249.shake.fire_multiplier = 0.8
tweak_data.weapon.m249.shake.fire_steelsight_multiplier = -0.8

tweak_data.weapon.m249.sounds.enter_steelsight = "lmg_steelsight_enter"
tweak_data.weapon.m249.sounds.leave_steelsight = "lmg_steelsight_exit"

tweak_data.weapon.m249.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"

tweak_data.weapon.m249.can_shoot_through_enemy = true
tweak_data.weapon.m249.can_shoot_through_wall = true

tweak_data.weapon.m249.armor_piercing_chance = 0.175

tweak_data.weapon.m249.stats = {
		damage = 17,
		spread = 6,
		recoil = 19,
		spread_moving = 9,
		zoom = 1,
		concealment = 2,
		suppression = 2,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 9,
	}
	
--Thanks to gir489 for the LMG ironsights codes
local pivot_shoulder_translation = Vector3( 10.7806, 4.38612, 0 )
local pivot_shoulder_rotation = Rotation( 0.106596, -0.0844502, 0.629187 )
local pivot_head_rotation = Rotation( -0.12, 0.2, 0 )
tweak_data.player.stances[ "m249" ].steelsight.shoulders.translation = Vector3( 0.02, 10.7, 0.7 ) - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances[ "m249" ].steelsight.shoulders.rotation = pivot_head_rotation

local pivot_head_translation = Vector3( 8, 11, -4 )
local pivot_head_rotation = Rotation( 0.2, 0.5, -0 )
tweak_data.player.stances.m249.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m249.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3( 8, 11, -2 )
local pivot_head_rotation = Rotation( 0.2, 0.5, -5 )
tweak_data.player.stances.m249.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m249.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()


--RPK
tweak_data.weapon.rpk.kick.standing = {1.5, -0.6, -1.45, 1.45 }
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
--tweak_data.weapon.rpk.NR_CLIPS_MAX = 4
tweak_data.weapon.rpk.AMMO_MAX = 300

tweak_data.weapon.rpk.spread.standing = 5.5
tweak_data.weapon.rpk.spread.crouching = 5
tweak_data.weapon.rpk.spread.steelsight = 1.35
tweak_data.weapon.rpk.spread.moving_standing = tweak_data.weapon.rpk.spread.standing * 1.5
tweak_data.weapon.rpk.spread.moving_crouching = tweak_data.weapon.rpk.spread.crouching * 1.5
tweak_data.weapon.rpk.spread.moving_steelsight = tweak_data.weapon.rpk.spread.steelsight * 2.45

tweak_data.weapon.rpk.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.rpk.shake.fire_multiplier = 1
tweak_data.weapon.rpk.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.rpk.can_shoot_through_enemy = true
tweak_data.weapon.rpk.can_shoot_through_wall = true

tweak_data.weapon.rpk.armor_piercing_chance = 0.35

tweak_data.weapon.rpk.stats = {
		damage = 27 ,
		spread = 6,
		recoil = 17,
		spread_moving = 6,
		zoom = 1,
		concealment = 5,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 11,
		total_ammo_mod = 101,
		value = 9,
	}

--Thanks to gir489 for the LMG ironsights codes
local pivot_shoulder_translation = Vector3( 10.6725, 27.7166, -4.93564 )
local pivot_shoulder_rotation = Rotation( 0.1067, -0.0850111, 0.629008 )
local pivot_head_rotation = Rotation( 0, 0.2, 0 )
tweak_data.player.stances[ "rpk" ].steelsight.shoulders.translation = Vector3( .08, 26, 0.22 ) - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances[ "rpk" ].steelsight.shoulders.rotation = pivot_head_rotation

local pivot_head_translation = Vector3( 10, 32, -4 )
local pivot_head_rotation = Rotation( 0.2, 0.5, -0 )
tweak_data.player.stances.rpk.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.rpk.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3( 8, 32, -1 )
local pivot_head_rotation = Rotation( 0.2, 0.5, -2 )
tweak_data.player.stances.rpk.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.rpk.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

--MSR
local pivot_shoulder_translation = Vector3( 10.7223, 44.8494, -2.19714 )
local pivot_shoulder_rotation = Rotation( 0.106634, -0.0844042, 0.629169 )
local pivot_head_translation = Vector3( -0.025, 35, 0.075 )
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.msr.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.msr.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3( 10, 42, -3 )
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.msr.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.msr.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3( 6, 38, -1 )
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.msr.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.msr.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.msr.spread.standing = 4
tweak_data.weapon.msr.spread.crouching = tweak_data.weapon.msr.spread.standing
tweak_data.weapon.msr.spread.steelsight = 0.05
tweak_data.weapon.msr.spread.moving_standing = tweak_data.weapon.msr.spread.standing * 1.9
tweak_data.weapon.msr.spread.moving_crouching = tweak_data.weapon.msr.spread.standing * 1.9
tweak_data.weapon.msr.spread.moving_steelsight = tweak_data.weapon.msr.spread.steelsight * 20

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
		spread = 9,
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
local pivot_shoulder_translation = Vector3( 10.6978, 45.3183, -4.51382 )
local pivot_shoulder_rotation = Rotation( 0.107839, -0.0834037, 0.628987 )
local pivot_head_translation = Vector3( -0.01, 30, 0.025 )
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.r93.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r93.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3( 10, 42, -3 )
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.r93.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r93.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

local pivot_head_translation = Vector3( 8, 40, -0 )
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.r93.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r93.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
tweak_data.weapon.r93.spread.standing = 6
tweak_data.weapon.r93.spread.crouching = tweak_data.weapon.r93.spread.standing
tweak_data.weapon.r93.spread.steelsight = 0.05
tweak_data.weapon.r93.spread.moving_standing = tweak_data.weapon.r93.spread.standing * 1.9
tweak_data.weapon.r93.spread.moving_crouching = tweak_data.weapon.r93.spread.standing * 1.9
tweak_data.weapon.r93.spread.moving_steelsight = tweak_data.weapon.r93.spread.steelsight * 40

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
local pivot_shoulder_translation = Vector3( 12.9429, 21.4699, -2.48515 )
local pivot_shoulder_rotation = Rotation( 0.113195, 0.518822, 0.628052 )
local pivot_head_translation = Vector3( -0.01, 0, 0.01 )
local pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.m95.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m95.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.m95.spread.standing = 10
tweak_data.weapon.m95.spread.crouching = tweak_data.weapon.m95.spread.standing
tweak_data.weapon.m95.spread.steelsight = 0.075
tweak_data.weapon.m95.spread.moving_standing = tweak_data.weapon.m95.spread.standing * 2.4
tweak_data.weapon.m95.spread.moving_crouching = tweak_data.weapon.m95.spread.standing * 2.4
tweak_data.weapon.m95.spread.moving_steelsight = tweak_data.weapon.m95.spread.steelsight * 65

tweak_data.weapon.m95.kick.standing = {8.9, 7.9, -2.9, 6.9 }
tweak_data.weapon.m95.kick.crouching = tweak_data.weapon.m95.kick.standing
tweak_data.weapon.m95.kick.steelsight = tweak_data.weapon.m95.kick.standing

tweak_data.weapon.m95.sounds.enter_steelsight = "lmg_steelsight_enter"
tweak_data.weapon.m95.sounds.leave_steelsight = "lmg_steelsight_exit"

tweak_data.weapon.m95.fire_mode_data.fire_rate = 1.5

tweak_data.weapon.m95.shake.fire_multiplier = 5
tweak_data.weapon.m95.shake.fire_steelsight_multiplier = -4.5

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



--Buttstock Melee
tweak_data.blackmarket.melee_weapons.weapon.stats.range = 140
tweak_data.blackmarket.melee_weapons.weapon.stats.min_damage = 1.75
tweak_data.blackmarket.melee_weapons.weapon.stats.max_damage = 1.75
tweak_data.blackmarket.melee_weapons.weapon.stats.min_damage_effect = 1.74
tweak_data.blackmarket.melee_weapons.weapon.stats.max_damage_effect = 1.74

--ORAORAORAORAORAORAORAORAORAORAORA(Fists)
if kenshiro == true then
	tweak_data.blackmarket.melee_weapons.fists.repeat_expire_t = 0.01
else
	tweak_data.blackmarket.melee_weapons.fists.repeat_expire_t = 0.325
end
tweak_data.blackmarket.melee_weapons.fists.stats.range = 145
tweak_data.blackmarket.melee_weapons.fists.stats.charge_time = 0.5
tweak_data.blackmarket.melee_weapons.fists.expire_t = 1
tweak_data.blackmarket.melee_weapons.fists.stats.min_damage = 1
tweak_data.blackmarket.melee_weapons.fists.stats.max_damage = 3
tweak_data.blackmarket.melee_weapons.fists.stats.min_damage_effect = 2
tweak_data.blackmarket.melee_weapons.fists.stats.max_damage_effect = 3
tweak_data.blackmarket.melee_weapons.fists.anim_attack_vars = { "var1", "var4" } --Gets rid of the two hook animations as those don't even match up with the impact delay
tweak_data.blackmarket.melee_weapons.fists.sounds.charge = "fist_equip"

--Brass
tweak_data.blackmarket.melee_weapons.brass_knuckles.repeat_expire_t = 0.325
tweak_data.blackmarket.melee_weapons.brass_knuckles.expire_t = 1
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.range = 145
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.min_damage = 1.5
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.max_damage = 3.5
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.min_damage_effect = 2
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.max_damage_effect = 2.85
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.charge_time = 0.7
tweak_data.blackmarket.melee_weapons.brass_knuckles.anim_attack_vars = { "var1", "var4" } --ditto
tweak_data.blackmarket.melee_weapons.brass_knuckles.sounds.charge = "fist_equip"

--Gerber Knife
tweak_data.blackmarket.melee_weapons.gerber.repeat_expire_t = 0.35
tweak_data.blackmarket.melee_weapons.gerber.expire_t = 1
tweak_data.blackmarket.melee_weapons.gerber.anim_global_param = "melee_knife"
tweak_data.blackmarket.melee_weapons.gerber.anim_attack_vars = { "var1", "var3" } --gets rid of the the two long swipes
tweak_data.blackmarket.melee_weapons.gerber.stats.range = 150
tweak_data.blackmarket.melee_weapons.gerber.stats.charge_time = 0.8
tweak_data.blackmarket.melee_weapons.gerber.stats.min_damage = 2
tweak_data.blackmarket.melee_weapons.gerber.stats.max_damage = 4
tweak_data.blackmarket.melee_weapons.gerber.stats.min_damage_effect = 1.
tweak_data.blackmarket.melee_weapons.gerber.stats.max_damage_effect = 1.25

--Kabar (URSA)
tweak_data.blackmarket.melee_weapons.kabar.repeat_expire_t = 0.45
tweak_data.blackmarket.melee_weapons.kabar.expire_t = 1.05
tweak_data.blackmarket.melee_weapons.kabar.stats.min_damage = 4
tweak_data.blackmarket.melee_weapons.kabar.stats.max_damage = 8
tweak_data.blackmarket.melee_weapons.kabar.stats.range = 170
tweak_data.blackmarket.melee_weapons.kabar.stats.min_damage_effect = 0.75
tweak_data.blackmarket.melee_weapons.kabar.stats.max_damage_effect = 0.81

--Krieger
tweak_data.blackmarket.melee_weapons.kampfmesser.repeat_expire_t = 0.4
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.range = 160
tweak_data.blackmarket.melee_weapons.kampfmesser.expire_t = 1
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.min_damage = 3
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.max_damage = 6
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.min_damage_effect = 0.82
tweak_data.blackmarket.melee_weapons.kampfmesser.stats.max_damage_effect = 0.92

--Rambo
tweak_data.blackmarket.melee_weapons.rambo.anim_global_param = "melee_knife"
tweak_data.blackmarket.melee_weapons.rambo.repeat_expire_t = 0.5
tweak_data.blackmarket.melee_weapons.rambo.expire_t = 1.1
tweak_data.blackmarket.melee_weapons.rambo.stats.min_damage = 5
tweak_data.blackmarket.melee_weapons.rambo.stats.max_damage = 10
tweak_data.blackmarket.melee_weapons.rambo.stats.range = 180
tweak_data.blackmarket.melee_weapons.rambo.stats.min_damage_effect = 0.7
tweak_data.blackmarket.melee_weapons.rambo.stats.max_damage_effect = 0.7

--WATCHDOGES
tweak_data.blackmarket.melee_weapons.baton.repeat_expire_t = 0.425
tweak_data.blackmarket.melee_weapons.baton.expire_t = 1.1
tweak_data.blackmarket.melee_weapons.baton.stats.min_damage = 1
tweak_data.blackmarket.melee_weapons.baton.stats.max_damage = 2
tweak_data.blackmarket.melee_weapons.baton.stats.min_damage_effect = 6.5
tweak_data.blackmarket.melee_weapons.baton.stats.max_damage_effect = 10
tweak_data.blackmarket.melee_weapons.baton.stats.charge_time = 1.15	
tweak_data.blackmarket.melee_weapons.baton.stats.range = 200

--Machete
tweak_data.blackmarket.melee_weapons.machete.repeat_expire_t = 0.8
tweak_data.blackmarket.melee_weapons.machete.expire_t = 1.2
tweak_data.blackmarket.melee_weapons.machete.stats.charge_time = 2.6
tweak_data.blackmarket.melee_weapons.machete.stats.min_damage = 9
tweak_data.blackmarket.melee_weapons.machete.stats.max_damage = 15
tweak_data.blackmarket.melee_weapons.machete.stats.min_damage_effect = 0.39
tweak_data.blackmarket.melee_weapons.machete.stats.max_damage_effect = 0.5

--Becker Machete
tweak_data.blackmarket.melee_weapons.becker.stats.range = 170
tweak_data.blackmarket.melee_weapons.becker.repeat_expire_t = 0.6
tweak_data.blackmarket.melee_weapons.becker.expire_t = 1.15
tweak_data.blackmarket.melee_weapons.becker.stats.min_damage = 7
tweak_data.blackmarket.melee_weapons.becker.stats.max_damage = 12
tweak_data.blackmarket.melee_weapons.becker.stats.min_damage_effect = 0.57
tweak_data.blackmarket.melee_weapons.becker.stats.max_damage_effect = 0.75
tweak_data.blackmarket.melee_weapons.becker.stats.charge_time = 2.25
tweak_data.blackmarket.melee_weapons.becker.type = "knife"
tweak_data.blackmarket.melee_weapons.becker.anim_global_param = "melee_machete"
tweak_data.blackmarket.melee_weapons.becker.align_objects = {
		"a_weapon_right"
	}
	
--Tomahawk
tweak_data.blackmarket.melee_weapons.tomahawk.stats.range = 210
tweak_data.blackmarket.melee_weapons.tomahawk.repeat_expire_t = 0.65
tweak_data.blackmarket.melee_weapons.tomahawk.expire_t = 1.2
tweak_data.blackmarket.melee_weapons.tomahawk.stats.min_damage = 6
tweak_data.blackmarket.melee_weapons.tomahawk.stats.max_damage = 14
tweak_data.blackmarket.melee_weapons.tomahawk.stats.min_damage_effect = 0.83
tweak_data.blackmarket.melee_weapons.tomahawk.stats.max_damage_effect = 0.89
tweak_data.blackmarket.melee_weapons.tomahawk.stats.charge_time = 2.25
tweak_data.blackmarket.melee_weapons.tomahawk.type = "knife"
tweak_data.blackmarket.melee_weapons.tomahawk.anim_attack_vars = {
		"var1",
		--"var2", --removes the awkward horizontal swipe that looks like you're swinging using the side
		"var3",
		"var4"
	}
	
--SW Hatchet
tweak_data.blackmarket.melee_weapons.bullseye.stats.range = 160
tweak_data.blackmarket.melee_weapons.bullseye.repeat_expire_t = 0.6
tweak_data.blackmarket.melee_weapons.bullseye.expire_t = 1.25
tweak_data.blackmarket.melee_weapons.bullseye.stats.min_damage = 5
tweak_data.blackmarket.melee_weapons.bullseye.stats.max_damage = 10
tweak_data.blackmarket.melee_weapons.bullseye.stats.min_damage_effect = 0.9
tweak_data.blackmarket.melee_weapons.bullseye.stats.max_damage_effect = 0.8
tweak_data.blackmarket.melee_weapons.bullseye.stats.charge_time = 1.25
tweak_data.blackmarket.melee_weapons.bullseye.type = "knife"
tweak_data.blackmarket.melee_weapons.bullseye.anim_global_param = "melee_knife2" --Normal axe animation clips through your head
tweak_data.blackmarket.melee_weapons.bullseye.align_objects = {
		"a_weapon_left"
	}
	
--Cleaver
tweak_data.blackmarket.melee_weapons.cleaver.stats.range = 165
tweak_data.blackmarket.melee_weapons.cleaver.repeat_expire_t = 0.625
tweak_data.blackmarket.melee_weapons.cleaver.stats.charge_time = 1.1
tweak_data.blackmarket.melee_weapons.cleaver.expire_t = 1.1
tweak_data.blackmarket.melee_weapons.cleaver.stats.min_damage = 4
tweak_data.blackmarket.melee_weapons.cleaver.stats.max_damage = 6
tweak_data.blackmarket.melee_weapons.cleaver.stats.min_damage_effect = 0.9
tweak_data.blackmarket.melee_weapons.cleaver.stats.max_damage_effect = 1
tweak_data.blackmarket.melee_weapons.cleaver.type = "knife"

--Shovel
tweak_data.blackmarket.melee_weapons.shovel.repeat_expire_t = 0.75
tweak_data.blackmarket.melee_weapons.shovel.expire_t = 1.25
tweak_data.blackmarket.melee_weapons.shovel.stats.charge_time = 2
tweak_data.blackmarket.melee_weapons.shovel.stats.range = 245
tweak_data.blackmarket.melee_weapons.shovel.stats.min_damage = 1.5
tweak_data.blackmarket.melee_weapons.shovel.stats.max_damage = 3.5
tweak_data.blackmarket.melee_weapons.shovel.stats.min_damage_effect = 6.3
tweak_data.blackmarket.melee_weapons.shovel.stats.max_damage_effect = 12

--Lucille
tweak_data.blackmarket.melee_weapons.barbedwire.anim_global_param = "melee_baseballbat_miami"
tweak_data.blackmarket.melee_weapons.barbedwire.stats.charge_time = 2.55
tweak_data.blackmarket.melee_weapons.barbedwire.repeat_expire_t = 0.95
tweak_data.blackmarket.melee_weapons.barbedwire.expire_t = 1.4
tweak_data.blackmarket.melee_weapons.barbedwire.stats.min_damage = 3.5
tweak_data.blackmarket.melee_weapons.barbedwire.stats.max_damage = 6.5
tweak_data.blackmarket.melee_weapons.barbedwire.stats.min_damage_effect = 5.7
tweak_data.blackmarket.melee_weapons.barbedwire.stats.max_damage_effect = 7.69

if twdbat == true then
	tweak_data.blackmarket.melee_weapons.barbedwire.name_id = "bm_melee_twd"
	tweak_data.blackmarket.melee_weapons.barbedwire.desc_id = "glenn"
else
	tweak_data.blackmarket.melee_weapons.barbedwire.name_id = "bm_melee_baseballbat"
	tweak_data.blackmarket.melee_weapons.barbedwire.desc_id = "bm_melee_baseballbat_desc"
end

--LODS OF EMONEE
if lodsofemone == true then 
	tweak_data.blackmarket.melee_weapons.moneybundle.name_id = "bm_melee_emone"
	tweak_data.blackmarket.melee_weapons.moneybundle.desc_id = "emone"
else
	tweak_data.blackmarket.melee_weapons.moneybundle.name_id = "bm_melee_moneybundle"
	tweak_data.blackmarket.melee_weapons.moneybundle.desc_id = "bm_melee_moneybundle_desc"
end
tweak_data.blackmarket.melee_weapons.moneybundle.stats.max_damage = 1
tweak_data.blackmarket.melee_weapons.moneybundle.stats.min_damage_effect = 10
tweak_data.blackmarket.melee_weapons.moneybundle.stats.max_damage_effect = 15
tweak_data.blackmarket.melee_weapons.moneybundle.repeat_expire_t = 0.275
tweak_data.blackmarket.melee_weapons.moneybundle.stats.range = 130
tweak_data.blackmarket.melee_weapons.moneybundle.expire_t = 1
tweak_data.blackmarket.melee_weapons.moneybundle.anim_attack_vars = {
		"var1",
		--"var2", --removes the awkward horizontal swipe that honestly wouldn't really hit anything
		"var3",
		"var4"
	}
tweak_data.blackmarket.melee_weapons.moneybundle.stats.charge_time = 0.2


--You touch my Tralala Hammer
tweak_data.blackmarket.melee_weapons.dingdong.stats.charge_time = 3
tweak_data.blackmarket.melee_weapons.dingdong.repeat_expire_t = 1.1
tweak_data.blackmarket.melee_weapons.dingdong.expire_t = 1.4
tweak_data.blackmarket.melee_weapons.dingdong.stats.min_damage = 6
tweak_data.blackmarket.melee_weapons.dingdong.stats.max_damage = 10
tweak_data.blackmarket.melee_weapons.dingdong.stats.min_damage_effect = 5.83
tweak_data.blackmarket.melee_weapons.dingdong.stats.max_damage_effect = 6
tweak_data.blackmarket.melee_weapons.dingdong.stats.range = 250

--Bayonet
tweak_data.blackmarket.melee_weapons.bayonet.anim_global_param = "melee_knife"
tweak_data.blackmarket.melee_weapons.bayonet.repeat_expire_t = 0.375
tweak_data.blackmarket.melee_weapons.bayonet.expire_t = 1
tweak_data.blackmarket.melee_weapons.bayonet.stats.range = 155
tweak_data.blackmarket.melee_weapons.bayonet.stats.charge_time = 1.3
tweak_data.blackmarket.melee_weapons.bayonet.stats.min_damage = 2.5
tweak_data.blackmarket.melee_weapons.bayonet.stats.max_damage = 5.5
tweak_data.blackmarket.melee_weapons.bayonet.stats.min_damage_effect = 0.6
tweak_data.blackmarket.melee_weapons.bayonet.stats.max_damage_effect = 0.73

--X46
tweak_data.blackmarket.melee_weapons.x46.repeat_expire_t = 0.375
tweak_data.blackmarket.melee_weapons.x46.expire_t = 1
tweak_data.blackmarket.melee_weapons.x46.stats.range = 155
tweak_data.blackmarket.melee_weapons.x46.stats.charge_time = 1.3
tweak_data.blackmarket.melee_weapons.x46.stats.min_damage = 1.5
tweak_data.blackmarket.melee_weapons.x46.stats.max_damage = 5
tweak_data.blackmarket.melee_weapons.x46.stats.min_damage_effect = 1
tweak_data.blackmarket.melee_weapons.x46.stats.max_damage_effect = 1.5

--Normal Bat
tweak_data.blackmarket.melee_weapons.baseballbat.stats.charge_time = 2.5
tweak_data.blackmarket.melee_weapons.baseballbat.repeat_expire_t = 0.925
tweak_data.blackmarket.melee_weapons.baseballbat.expire_t = 1.4
tweak_data.blackmarket.melee_weapons.baseballbat.stats.min_damage = 3.0
tweak_data.blackmarket.melee_weapons.baseballbat.stats.max_damage = 5.0
tweak_data.blackmarket.melee_weapons.baseballbat.stats.min_damage_effect = 6.1
tweak_data.blackmarket.melee_weapons.baseballbat.stats.max_damage_effect = 8
tweak_data.blackmarket.melee_weapons.baseballbat.stats.range = 275

--Fireaxe
tweak_data.blackmarket.melee_weapons.fireaxe.repeat_expire_t = 1.55
tweak_data.blackmarket.melee_weapons.fireaxe.stats.charge_time = 3.5
tweak_data.blackmarket.melee_weapons.fireaxe.stats.min_damage = 10
tweak_data.blackmarket.melee_weapons.fireaxe.stats.max_damage = 30
tweak_data.blackmarket.melee_weapons.fireaxe.stats.min_damage_effect = .5
tweak_data.blackmarket.melee_weapons.fireaxe.stats.max_damage_effect = .5
tweak_data.blackmarket.melee_weapons.fireaxe.stats.range = 250
tweak_data.blackmarket.melee_weapons.fireaxe.melee_damage_delay = 0.3

--50 Blessings
tweak_data.blackmarket.melee_weapons.briefcase.expire_t = 1.4
tweak_data.blackmarket.melee_weapons.briefcase.stats.min_damage = 2
tweak_data.blackmarket.melee_weapons.briefcase.stats.max_damage = 3
tweak_data.blackmarket.melee_weapons.briefcase.stats.min_damage_effect = 5
tweak_data.blackmarket.melee_weapons.briefcase.stats.max_damage_effect = 10
tweak_data.blackmarket.melee_weapons.briefcase.stats.range = 160
tweak_data.blackmarket.melee_weapons.briefcase.stats.charge_time = 1.8

RebalanceScript = true

end

