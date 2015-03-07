--[[
v1.2.2
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

--[[
VARIABLES AND TABLES FOR WEAPONS AND WHAT THEY DO

tweak_data.weapon.gun.category = "pistol"
	--What category the weapon is considered
		--Affects blackmarket categorization AND skill modifiers (if the weapon category has any, things like LMGs don't have any category based skill modifiers)

tweak_data.weapon.gun.kick.standing = {1.0, -1.0, -1.0, 1.0 }
	--Kick in degrees while standing
		--Args 1 and 2 are vertical recoil, positive goes up, negative goes down
		--Args 3 and 4 are horizontal recoil, positive goes left, negative goes right
		--Get multiplied by the current "recoil" index table value
tweak_data.weapon.gun.kick.crouching = tweak_data.weapon.gun.kick.standing
	--Ditto but while crouching
tweak_data.weapon.gun.kick.steelsight = tweak_data.weapon.gun.kick.standing
	--Ditto but while ADS
		
tweak_data.weapon.gun.spread.standing = 1 
	--Spread in degrees while standing and **NOT moving**
tweak_data.weapon.gun.spread.crouching = 1
	--Ditto but while crouching
tweak_data.weapon.gun.spread.steelsight = 1
	--Ditto but while ADS
	
tweak_data.weapon.gun.spread.moving_standing = 2
	--Spread in degrees while standing and **MOVING**
tweak_data.weapon.gun.spread.moving_crouching = 2
	--Ditto but while crouching
tweak_data.weapon.gun.spread.moving_steelsight = 2
	--Ditto but while ADS

tweak_data.weapon.gun.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	--Default muzzle effect your gun produces
	
tweak_data.weapon.gun.CLIP_AMMO_MAX = 30 
	--Default magazine capacity
tweak_data.weapon.gun.AMMO_MAX = 150 
	--Default total ammo

tweak_data.weapon.gun.rays = 8
	*ONLY WORKS FOR SHOTGUNS
	--Default pellet count 

tweak_data.weapon.gun.damage_near = 100
	--Distance in cm for how far you keep your max damage
tweak_data.weapon.gun.damage_far = 1500
	--Distance in cm at which you hit 0 damage
tweak_data.weapon.gun.damage_min = 0.5
	*ONLY WORKS IF gat_physics.lua IS ACTIVE
		*ONLY WORKS FOR NON-SHOTGUNS
		--Decimal value for the lowest possible damage output for your weapon i.e. a 100 damage weapon with a damage_min value of 0.5 will deal damage as low as 50 (100 * 0.5 = 50)
		

tweak_data.weapon.gun.shake.fire_multiplier = 1.25
	--Screen shake while HIPFIRING
		--Positive values pull to gun towards you, negative values push away, larger values in either direction make screen shake more violently
tweak_data.weapon.gun.shake.fire_steelsight_multiplier = -1.25
	--Screen shake while AIMING
		--Positive values pull to gun towards you, negative values push away, larger values in either direction make screen shake more violently

tweak_data.weapon.gun.fire_mode_data.fire_rate = 0.23076923076923076923076923076923
	--Default RoF
		--RoF is calculated like this: 60/*desired RoF* i.e. 60/600 = 0.1

tweak_data.weapon.gun.stats_modifiers = {damage = 2,} 
	--Multiplies w/e stat(s) is/are contained in the table with the current index value
	
tweak_data.weapon.gun.stats.damage = 36 
	--index value you pull from the damage table. Higher values = Greater damage
tweak_data.weapon.gun.stats.spread = 17 
	--ditto but for spread/accuracy. Higher values = Tighter spread
tweak_data.weapon.gun.stats.recoil = 6	
	--ditto but for recoil/stability. Higher values = Lower recoil
tweak_data.weapon.gun.stats.suppression = 4 
	--ditto but for suppression/threat. Lower values = Greater threat
]]

if not RebalanceScript and DMCWO.rebalance_gen == true then

--Set to true if you use LazyOzzy's burst fire script
local ozzy_burst = false

--if set to true, changes the money bundle name and description to reference Harry Enfield's "Loadsamoney" music video
local lodsofemone = false

--If set to true, using the fists allows you to turn into Kenshiro from Hokuto No Ken (Fist of the North Star)
--AAAH-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA
local kenshiro = false

----------------------------------------------[[DONT TOUCH THE SHIZZLE BELOW (if you don't know what you're doing)]]----------------------------------------------

if not tweak_data then return end

if DMCWO.Setup_Stfu ~= true then
	if not DMCWO.stfu_wep then
		DMCWO.stfu_wep = true
		io.stdout:write("[DMCWO] rebalance.lua...")
	end
end

----------------------------------------------[[GENERAL]]----------------------------------------------
--{
local pivot_head_translation = Vector3()
local pivot_head_rotation = Rotation()
local pivot_shoulder_translation = Vector3()
local pivot_shoulder_rotation = Rotation()

pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
local ar_type_hold = {'amcar','m16','new_m4','olympic','new_mp5','ak5'}
for i, wep_id in ipairs(ar_type_hold) do
	pivot_head_translation = Vector3(9,20,-5)
	pivot_head_rotation = Rotation(0,0,-1)
	tweak_data.player.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(7,18,-3)
	pivot_head_rotation = Rotation(0,0,-2)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()	
end

pivot_shoulder_translation = Vector3(10.7353, 23.0139, -1.43553)
pivot_shoulder_rotation = Rotation(0.106665, -0.0845104, 0.629231)
ak_type_hold = {'saiga','akm','ak74','akmsu','akm_gold'}
for i, wep_id in ipairs(ak_type_hold) do
	pivot_head_translation = Vector3(9, 26, -3)
	pivot_head_rotation = Rotation(0.3, 0.5, -1)
	tweak_data.player.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(7, 24, -1)
	pivot_head_rotation = Rotation(0.3, 0.5, -2)
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
pistol_type_wep = {'glock_17','glock_18c','g22c','g26','b92fs','usp','colt_1911','ppk','p226','deagle','judge','new_raging_bull','c96','hs2000'}
for i, wep_id in ipairs(pistol_type_wep) do
	pivot_head_translation = Vector3(8, 32, -6)
	pivot_head_rotation = Rotation(0, 0, -1)
	tweak_data.player.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(6, 30, -4)
	pivot_head_rotation = Rotation(0, 0, -2)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
smg_type_wep = {'mp7','mp9','uzi','scorpion'}
for i, wep_id in ipairs(smg_type_wep) do
	pivot_head_translation = Vector3(7, 42, -4)
	pivot_head_rotation = Rotation(0, 0, -1)
	tweak_data.player.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(5, 38, -2)
	pivot_head_rotation = Rotation(0, 0, -2)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
local semi_shotgun = {'benelli','spas12'}
for i, wep_id in ipairs(semi_shotgun) do
	pivot_head_translation = Vector3(9, 29, -5 )
	pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
	tweak_data.player.stances[wep_id].standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(7,25,-3)	
	pivot_head_rotation = Rotation( -0.2, 0.5, -2 )
	tweak_data.player.stances[wep_id].crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
local pump_shotgun = {'serbu','r870'}
for i, wep_id in ipairs(pump_shotgun) do
	pivot_head_translation = Vector3(9,28,-6)
	pivot_head_rotation = Rotation( 0, 0, -1 )
	tweak_data.player.stances[wep_id].standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_head_translation = Vector3(7,26,-4)
	pivot_head_rotation = Rotation(-0,-0,-2)
	tweak_data.player.stances[wep_id].crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

local standard_stat_shit = {'new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','r870','huntsman','benelli','ksg','serbu','striker','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','judge','famas','galil','g3','gre_m79','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','spas12','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000','m134','rpg7'}

for i, wep_id in ipairs(standard_stat_shit) do
	tweak_data.weapon[wep_id].stats.zoom = 1
	tweak_data.weapon[wep_id].stats.alert_size = 7
	tweak_data.weapon[wep_id].stats.extra_ammo = 101
	tweak_data.weapon[wep_id].stats.total_ammo_mod = 101
end

local enable_cstw = {'new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','famas','galil','g3','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000','m134'}
for i, wep_id in ipairs(enable_cstw) do
	tweak_data.weapon[ wep_id ].can_shoot_through_wall = true
end

local enable_cste = {'new_raging_bull','deagle','colt_1911','usp','mac10','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','famas','galil','g3','x_deagle','x_1911','mg42','mosin','c96','m1928','l85a2','vhs','m134'}
for i, wep_id in ipairs(enable_cste) do
	tweak_data.weapon[wep_id].can_shoot_through_enemy = true
end

local ammo_32 = {'ppk','scorpion'}
for i, wep_id in ipairs(ammo_32) do
	tweak_data.weapon[ wep_id ].penetration_power = 0.2 --percent of how much your weapon's current damage AT THE TIME OF IMPACT (drop-off will reduce penetration) translates to penetration distance (max of 80 cm)
	tweak_data.weapon[ wep_id ].penetration_damage = 0.4 --percent of how much damage is KEPT through surfaces
end

local ammo_9mm = {'new_mp5','mp9','m45','glock_17','glock_18c','b92fs','tec9','uzi','sterling','g26','jowi','x_b92fs'}
for i, wep_id in ipairs(ammo_9mm) do
	tweak_data.weapon[ wep_id ].penetration_power = 0.45
	tweak_data.weapon[ wep_id ].penetration_damage = 0.65
end

local ammo_40sw = {'g22c','p226','hs2000'}
for i, wep_id in ipairs(ammo_40sw) do
	tweak_data.weapon[ wep_id ].penetration_power = 0.5
	tweak_data.weapon[ wep_id ].penetration_damage = 0.55
end

local ammo_45acp = {'mac10','colt_1911','usp','m1928','x_1911'}
for i, wep_id in ipairs(ammo_45acp) do
	tweak_data.weapon[ wep_id ].penetration_power = 0.6
	tweak_data.weapon[ wep_id ].penetration_damage = 0.45
end

tweak_data.weapon.c96.penetration_power = 0.6
tweak_data.weapon.c96.penetration_damage = 0.4

tweak_data.weapon.new_raging_bull.penetration_power = 0.9
tweak_data.weapon.new_raging_bull.penetration_damage = 0.8

tweak_data.weapon.deagle.penetration_power = 0.45
tweak_data.weapon.deagle.penetration_damage = 0.4

tweak_data.weapon.x_deagle.penetration_power = 0.45
tweak_data.weapon.x_deagle.penetration_damage = 0.4

tweak_data.weapon.mp7.penetration_power = 1.7
tweak_data.weapon.mp7.penetration_damage = 0.7

tweak_data.weapon.p90.penetration_power = 1.85
tweak_data.weapon.p90.penetration_damage = 0.8

local ammo_slug = {'r870','serbu','benelli','ksg','striker','huntsman','spas12'}
for i, wep_id in ipairs(ammo_slug) do
	tweak_data.weapon[ wep_id ].penetration_power = 0.5 --Only relevant if you're using slugs!!
	tweak_data.weapon[ wep_id ].penetration_damage = 0.4 --ditto
end

local ammo_556 = {'olympic','m16','amcar','new_m4','ak5','s552','g36','aug','famas','m249','l85a2','vhs'}
for i, wep_id in ipairs(ammo_556) do
	tweak_data.weapon[ wep_id ].penetration_power = 0.65
	tweak_data.weapon[ wep_id ].penetration_damage = 0.6
end

local ammo_762_ak = {'ak74','akmsu','akm','akm_gold','rpk'}
for i, wep_id in ipairs(ammo_762_ak) do
	tweak_data.weapon[ wep_id ].penetration_power = 0.70
	tweak_data.weapon[ wep_id ].penetration_damage = 0.7
end

local ammo_762_nato = {'new_m14','scar','fal','galil','g3','msr','hk21','m134'}
for i, wep_id in ipairs(ammo_762_nato) do
	tweak_data.weapon[ wep_id ].penetration_power = 0.8
	tweak_data.weapon[ wep_id ].penetration_damage = 0.8
end

tweak_data.weapon.mg42.penetration_power = 0.82
tweak_data.weapon.mg42.penetration_damage = 0.85

tweak_data.weapon.mosin.penetration_power = 0.9
tweak_data.weapon.mosin.penetration_damage = 0.9

tweak_data.weapon.r93.penetration_power = 1.0
tweak_data.weapon.r93.penetration_damage = 0.95

tweak_data.weapon.m95.penetration_power = 10 --SHOOT THROUGH ALL THE THINGS
tweak_data.weapon.m95.penetration_damage = 0.99
--}

----------------------------------------------[[WEAPONS]]----------------------------------------------
----------------------------------------------[[SPECIAL]]----------------------------------------------
--{
--[[     SAW(S)     ]]--
--just to fix it for the index calculations
tweak_data.weapon.saw.stats = {
		alert_size = 9,
		suppression = 7,
		zoom = 1,
		spread = 17,
		recoil = 18,
		spread_moving = 7,
		damage = 10,
		concealment = 16,
		value = 1,
		extra_ammo = 101,
		total_ammo_mod = 101,
	}
tweak_data.weapon.saw_secondary.stats = {
		alert_size = 9,
		suppression = 7,
		zoom = 1,
		spread = 17,
		recoil = 18,
		spread_moving = 7,
		damage = 10,
		concealment = 16,
		value = 1,
		extra_ammo = 101,
		total_ammo_mod = 101,
	}
	
	
--[[     M79     ]]--
tweak_data.weapon.gre_m79.fire_mode_data.fire_rate = 1.1 --sets the ROF just at the edge of the anti-cheat timer (1 per second)

tweak_data.weapon.gre_m79.stats_modifiers = {
		damage = 34,
	}

tweak_data.weapon.gre_m79.stats = {
		alert_size = 9,
		suppression = 2,
		zoom = 1,
		spread = 13,
		recoil = 9,
		spread_moving = 7,
		damage = 4,
		concealment = 18,
		value = 1,
		extra_ammo = 101,
		total_ammo_mod = 101,
	}

pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pivot_head_translation = Vector3(6, 39, -4)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.gre_m79.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.gre_m79.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(4, 37, -2)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.gre_m79.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.gre_m79.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()


--[[     Vulcan Raven     ]]--
tweak_data.weapon.m134.kick.standing = {2, -2, -2, 2 }
tweak_data.weapon.m134.kick.crouching = tweak_data.weapon.m134.kick.standing
tweak_data.weapon.m134.kick.steelsight = tweak_data.weapon.m134.kick.standing

tweak_data.weapon.m134.spread.standing = 7.5
tweak_data.weapon.m134.spread.crouching = 7
tweak_data.weapon.m134.spread.steelsight = 4
tweak_data.weapon.m134.spread.moving_standing = tweak_data.weapon.m134.spread.standing * 1.5
tweak_data.weapon.m134.spread.moving_crouching = tweak_data.weapon.m134.spread.crouching * 1.5
tweak_data.weapon.m134.spread.moving_steelsight = tweak_data.weapon.m134.spread.steelsight * 1.25

tweak_data.weapon.m134.shake.fire_multiplier = 1
tweak_data.weapon.m134.shake.fire_steelsight_multiplier = 1

tweak_data.weapon.m134.AMMO_MAX = 750

--tweak_data.weapon.m134.fire_mode_data.fire_rate = 0.02

tweak_data.weapon.m134.HAS_BURST_FIRE = true
tweak_data.weapon.m134.burst_size = 10

tweak_data.weapon.m134.can_shoot_through_shield = true

tweak_data.weapon.m134.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.m134.armor_piercing_chance = 0.8

tweak_data.weapon.m134.damage_near = 15 * 100
tweak_data.weapon.m134.damage_far = 165 * 100
tweak_data.weapon.m134.damage_min = 0.5

tweak_data.weapon.m134.stats.damage = 36
tweak_data.weapon.m134.stats.spread = 11
tweak_data.weapon.m134.stats.recoil = 21
tweak_data.weapon.m134.stats.suppression = 0

pivot_shoulder_translation = Vector3(4.11438, 35.5734, -13.4323)
pivot_shoulder_rotation = Rotation(-1.22503E-5, 0.00110689, 2.82252E-4)
pivot_head_translation = Vector3(5, 40, -15)
pivot_head_rotation = Rotation(0, 1, -6)
tweak_data.player.stances.m134.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m134.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8, 35, -17)
pivot_head_rotation = Rotation(0, 1, -14)
tweak_data.player.stances.m134.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m134.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(0, 24, -10)
pivot_head_rotation = Rotation(0, 0.5, 0)
tweak_data.player.stances.m134.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m134.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()


--[[     ENEMY RPG!!! GET DOOOOWWWWN!!!!     ]]--
tweak_data.weapon.rpg7.stats.damage = 40
tweak_data.weapon.rpg7.stats.spread = 19
tweak_data.weapon.rpg7.stats.recoil = 10
tweak_data.weapon.rpg7.stats.alert_size = 1
tweak_data.weapon.rpg7.stats.suppression = 0

pivot_shoulder_translation = Vector3(9.65215, 14.1036, 1.91009)
pivot_shoulder_rotation = Rotation(-2.176E-4, 0.00147512, -1.03691E-4)
pivot_head_translation = Vector3(8, 14, 2)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.rpg7.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.rpg7.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 12, 4)
pivot_head_rotation = Rotation(0, 0, -4)	
tweak_data.player.stances.rpg7.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.rpg7.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
--}



----------------------------------------------[[PISTOLS]]----------------------------------------------
--{
--[[     JUDY     ]]--
tweak_data.weapon.judge.category = "pistol"

tweak_data.weapon.judge.kick.standing = {3.7, 4.5, -2.8, 2.8 }
tweak_data.weapon.judge.kick.crouching = tweak_data.weapon.judge.kick.standing
tweak_data.weapon.judge.kick.steelsight = tweak_data.weapon.judge.kick.standing
		
tweak_data.weapon.judge.spread.standing = 5
tweak_data.weapon.judge.spread.crouching = tweak_data.weapon.judge.spread.standing
tweak_data.weapon.judge.spread.steelsight = tweak_data.weapon.judge.spread.standing * 0.45
tweak_data.weapon.judge.spread.moving_standing = tweak_data.weapon.judge.spread.standing
tweak_data.weapon.judge.spread.moving_crouching = tweak_data.weapon.judge.spread.standing
tweak_data.weapon.judge.spread.moving_steelsight = tweak_data.weapon.judge.spread.standing * 0.55

tweak_data.weapon.judge.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.judge.CLIP_AMMO_MAX = 5
tweak_data.weapon.judge.AMMO_MAX = 30

tweak_data.weapon.judge.rays = 5

tweak_data.weapon.judge.damage_near = 100
tweak_data.weapon.judge.damage_far = 1500

tweak_data.weapon.judge.shake.fire_multiplier = 1.25
tweak_data.weapon.judge.shake.fire_steelsight_multiplier = -1.25

tweak_data.weapon.judge.fire_mode_data.fire_rate = 0.23076923076923076923076923076923

tweak_data.weapon.judge.stats_modifiers = {
		damage = 2,
	}
	
tweak_data.weapon.judge.stats.damage = 36
tweak_data.weapon.judge.stats.spread = 17
tweak_data.weapon.judge.stats.recoil = 6
tweak_data.weapon.judge.stats.suppression = 4
	
	
	
--[[     Grenade 18C     ]]--
tweak_data.weapon.glock_18c.upgrade_blocks = {
		pistol = {
			"fire_rate_multiplier"
		}
	}
tweak_data.weapon.glock_18c.kick.standing = { 2.6, -1.8, -1.0, 1.0 }
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

tweak_data.weapon.glock_18c.damage_near = 8 * 100
tweak_data.weapon.glock_18c.damage_far = 86 * 100
tweak_data.weapon.glock_18c.damage_min = 0.6

tweak_data.weapon.glock_18c.stats.damage = 12
tweak_data.weapon.glock_18c.stats.spread = 12
tweak_data.weapon.glock_18c.stats.recoil = 11
tweak_data.weapon.glock_18c.stats.suppression = 16



--[[     Grenade 17     ]]--
tweak_data.weapon.glock_17.kick.standing = { 1.0, 2.0, -0.8, 0.8 }
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

tweak_data.weapon.glock_17.damage_near = 10 * 100
tweak_data.weapon.glock_17.damage_far = 93 * 100
tweak_data.weapon.glock_17.damage_min = 0.6

tweak_data.weapon.glock_17.stats.damage = 12
tweak_data.weapon.glock_17.stats.spread = 13
tweak_data.weapon.glock_17.stats.recoil = 17
tweak_data.weapon.glock_17.stats.suppression = 16



--[[     Bardoda     ]]--
tweak_data.weapon.b92fs.kick.standing = { 1.25, 1.5, -1.35, 1.35 }
tweak_data.weapon.b92fs.kick.crouching = tweak_data.weapon.b92fs.kick.standing
tweak_data.weapon.b92fs.kick.steelsight = tweak_data.weapon.b92fs.kick.standing

tweak_data.weapon.b92fs.CLIP_AMMO_MAX = 15
tweak_data.weapon.b92fs.NR_CLIPS_MAX = 10
tweak_data.weapon.b92fs.AMMO_MAX = tweak_data.weapon.b92fs.CLIP_AMMO_MAX * tweak_data.weapon.b92fs.NR_CLIPS_MAX

tweak_data.weapon.b92fs.spread.standing = 3.5
tweak_data.weapon.b92fs.spread.crouching = 3
tweak_data.weapon.b92fs.spread.steelsight = 1.25
tweak_data.weapon.b92fs.spread.moving_standing = tweak_data.weapon.b92fs.spread.standing * 1.5
tweak_data.weapon.b92fs.spread.moving_crouching = tweak_data.weapon.b92fs.spread.crouching * 1.5
tweak_data.weapon.b92fs.spread.moving_steelsight = tweak_data.weapon.b92fs.spread.steelsight * 1.5

tweak_data.weapon.b92fs.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.b92fs.shake.fire_multiplier = 1
tweak_data.weapon.b92fs.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.b92fs.damage_near = 12 * 100
tweak_data.weapon.b92fs.damage_far = 96 * 100
tweak_data.weapon.b92fs.damage_min = 0.6
	
tweak_data.weapon.b92fs.stats.damage = 12
tweak_data.weapon.b92fs.stats.spread = 15
tweak_data.weapon.b92fs.stats.recoil = 15
tweak_data.weapon.b92fs.stats.suppression = 16
	
pivot_shoulder_translation = Vector3(8.50075, 40.9227, -4.15328)
pivot_shoulder_rotation = Rotation(0.0994, -0.687851, 0.630047)
pivot_head_translation = Vector3(0, 37, 0)
pivot_head_rotation = Rotation(0, 0.5, 0)
tweak_data.player.stances.b92fs.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.b92fs.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Revy     ]]--
tweak_data.weapon.x_b92fs.kick.standing = { 1.25, 1.5, -1.35, 1.35 }
tweak_data.weapon.x_b92fs.kick.crouching = tweak_data.weapon.x_b92fs.kick.standing
tweak_data.weapon.x_b92fs.kick.steelsight = tweak_data.weapon.x_b92fs.kick.standing

tweak_data.weapon.x_b92fs.CLIP_AMMO_MAX = 15 * 2
tweak_data.weapon.x_b92fs.AMMO_MAX = 180

tweak_data.weapon.x_b92fs.spread.standing = 3.5 * 2.5
tweak_data.weapon.x_b92fs.spread.crouching = 3 * 2.5
tweak_data.weapon.x_b92fs.spread.steelsight = 1.25 * 2.5
tweak_data.weapon.x_b92fs.spread.moving_standing = tweak_data.weapon.x_b92fs.spread.standing * 1.5
tweak_data.weapon.x_b92fs.spread.moving_crouching = tweak_data.weapon.x_b92fs.spread.crouching * 1.5
tweak_data.weapon.x_b92fs.spread.moving_steelsight = tweak_data.weapon.x_b92fs.spread.steelsight * 1.5

tweak_data.weapon.x_b92fs.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.x_b92fs.shake.fire_multiplier = 1.5
tweak_data.weapon.x_b92fs.shake.fire_steelsight_multiplier = 1.5

tweak_data.weapon.x_b92fs.damage_near = 12 * 100
tweak_data.weapon.x_b92fs.damage_far = 96 * 100
tweak_data.weapon.x_b92fs.damage_min = 0.6

tweak_data.weapon.x_b92fs.stats.damage = 12
tweak_data.weapon.x_b92fs.stats.spread = 15
tweak_data.weapon.x_b92fs.stats.recoil = 15
tweak_data.weapon.x_b92fs.stats.suppression = 16



--[[     Grenade 26     ]]--
tweak_data.weapon.g26.kick.standing = { 1.0, 2.0, -0.95, 0.95 }
tweak_data.weapon.g26.kick.crouching = tweak_data.weapon.g26.kick.standing
tweak_data.weapon.g26.kick.steelsight = tweak_data.weapon.g26.kick.standing

tweak_data.weapon.g26.spread.standing = 5
tweak_data.weapon.g26.spread.crouching = 4.5
tweak_data.weapon.g26.spread.steelsight = 1.45
tweak_data.weapon.g26.spread.moving_standing = tweak_data.weapon.g26.spread.standing * 1.1
tweak_data.weapon.g26.spread.moving_crouching = tweak_data.weapon.g26.spread.crouching * 1.1
tweak_data.weapon.g26.spread.moving_steelsight = tweak_data.weapon.g26.spread.steelsight * 1.1

tweak_data.weapon.g26.CLIP_AMMO_MAX = 10
tweak_data.weapon.g26.AMMO_MAX = 130

tweak_data.weapon.g26.shake.fire_multiplier = 0.8
tweak_data.weapon.g26.shake.fire_steelsight_multiplier = -0.8

tweak_data.weapon.g26.damage_near = 5 * 100
tweak_data.weapon.g26.damage_far = 54 * 100
tweak_data.weapon.g26.damage_min = 0.35
	
tweak_data.weapon.g26.stats.damage = 14
tweak_data.weapon.g26.stats.spread = 13
tweak_data.weapon.g26.stats.recoil = 21
tweak_data.weapon.g26.stats.suppression = 16
	
pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pivot_head_translation = Vector3(-0.02, 37, 0.3)
pivot_head_rotation = Rotation(0, 0.2, 0)
tweak_data.player.stances.g26.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g26.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Akimbo Glocknades     ]]--
tweak_data.weapon.jowi.kick.standing = { 1.0, 2.0, -0.95, 0.95 }
tweak_data.weapon.jowi.kick.crouching = tweak_data.weapon.jowi.kick.standing
tweak_data.weapon.jowi.kick.steelsight = tweak_data.weapon.jowi.kick.standing

tweak_data.weapon.jowi.spread.standing = 5 * 4
tweak_data.weapon.jowi.spread.crouching = 4.5 * 4
tweak_data.weapon.jowi.spread.steelsight = 1.45 * 4
tweak_data.weapon.jowi.spread.moving_standing = tweak_data.weapon.jowi.spread.standing * 1.1
tweak_data.weapon.jowi.spread.moving_crouching = tweak_data.weapon.jowi.spread.crouching * 1.1
tweak_data.weapon.jowi.spread.moving_steelsight = tweak_data.weapon.jowi.spread.steelsight * 1.1

tweak_data.weapon.jowi.CLIP_AMMO_MAX = 10 * 2
tweak_data.weapon.jowi.AMMO_MAX = 160

tweak_data.weapon.jowi.shake.fire_multiplier = 1.1
tweak_data.weapon.jowi.shake.fire_steelsight_multiplier = 1.1

tweak_data.weapon.jowi.damage_near = 5 * 100
tweak_data.weapon.jowi.damage_far = 54 * 100
tweak_data.weapon.jowi.damage_min = 0.35

tweak_data.weapon.jowi.stats.damage = 14
tweak_data.weapon.jowi.stats.spread = 13
tweak_data.weapon.jowi.stats.recoil = 21
tweak_data.weapon.jowi.stats.suppression = 16



--[[     S-cool Shooting     ]]--
tweak_data.weapon.tec9.category = "pistol"
tweak_data.weapon.tec9.upgrade_blocks = {
		pistol = {
			"fire_rate_multiplier"
		}
	}

tweak_data.weapon.tec9.kick.standing = { -0.3, 1.9, -1.8, 0.9 }
tweak_data.weapon.tec9.kick.crouching = tweak_data.weapon.tec9.kick.standing
tweak_data.weapon.tec9.kick.steelsight = tweak_data.weapon.tec9.kick.standing

tweak_data.weapon.tec9.spread.standing = 5.25
tweak_data.weapon.tec9.spread.crouching = 4.75
tweak_data.weapon.tec9.spread.steelsight = 1.65
tweak_data.weapon.tec9.spread.moving_standing = tweak_data.weapon.tec9.spread.standing * 1.5
tweak_data.weapon.tec9.spread.moving_crouching = tweak_data.weapon.tec9.spread.crouching * 1.5
tweak_data.weapon.tec9.spread.moving_steelsight = tweak_data.weapon.tec9.spread.steelsight * 1.5

tweak_data.weapon.tec9.CLIP_AMMO_MAX = 32
tweak_data.weapon.tec9.AMMO_MAX = 128

tweak_data.weapon.tec9.shake.fire_multiplier = 1.1
tweak_data.weapon.tec9.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.tec9.CAN_TOGGLE_FIREMODE = false

tweak_data.weapon.tec9.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.tec9.damage_near = 9 * 100
tweak_data.weapon.tec9.damage_far = 59 * 100
tweak_data.weapon.tec9.damage_min = 0.35

tweak_data.weapon.tec9.stats.damage = 14
tweak_data.weapon.tec9.stats.spread = 13
tweak_data.weapon.tec9.stats.recoil = 12
tweak_data.weapon.tec9.stats.suppression = 10

tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_body_standard.forbids = {
		"wpn_fps_upg_i_singlefire"
	}

pivot_shoulder_translation = Vector3(8.60825, 44.5082, -5.26645)
pivot_shoulder_rotation = Rotation(0.11042, 0.0131379, 0.63049)
pivot_head_translation = Vector3(9, 36, -7)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.tec9.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.tec9.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 34, -5)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.tec9.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.tec9.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     007     ]]--
tweak_data.weapon.ppk.kick.standing = { 1.0, 2.0, -0.55, 0.55 }
tweak_data.weapon.ppk.kick.crouching = tweak_data.weapon.ppk.kick.standing
tweak_data.weapon.ppk.kick.steelsight = tweak_data.weapon.ppk.kick.standing

tweak_data.weapon.ppk.CLIP_AMMO_MAX = 10
tweak_data.weapon.ppk.AMMO_MAX = 130

tweak_data.weapon.ppk.spread.standing = 3.3
tweak_data.weapon.ppk.spread.crouching = 2.8
tweak_data.weapon.ppk.spread.steelsight = 1.55
tweak_data.weapon.ppk.spread.moving_standing = tweak_data.weapon.ppk.spread.standing * 1.2
tweak_data.weapon.ppk.spread.moving_crouching = tweak_data.weapon.ppk.spread.crouching * 1.2
tweak_data.weapon.ppk.spread.moving_steelsight = tweak_data.weapon.ppk.spread.steelsight * 1.4

tweak_data.weapon.ppk.fire_mode_data.fire_rate = 0.083333333333333

tweak_data.weapon.ppk.shake.fire_multiplier = 0.6
tweak_data.weapon.ppk.shake.fire_steelsight_multiplier = -0.6

tweak_data.weapon.ppk.damage_near = 12 * 100
tweak_data.weapon.ppk.damage_far = 47 * 100
tweak_data.weapon.ppk.damage_min = 0.35

tweak_data.weapon.ppk.stats.damage = 14
tweak_data.weapon.ppk.stats.spread = 11
tweak_data.weapon.ppk.stats.recoil = 19
tweak_data.weapon.ppk.stats.suppression = 17



--[[     Grenade 22C     ]]--
tweak_data.weapon.g22c.weapon_hold = "glock"

tweak_data.weapon.g22c.kick.standing = { 1.5, 2.0, -1.75, 1.75 }
tweak_data.weapon.g22c.kick.crouching = tweak_data.weapon.g22c.kick.standing
tweak_data.weapon.g22c.kick.steelsight = tweak_data.weapon.g22c.kick.standing

tweak_data.weapon.g22c.spread.standing = 5
tweak_data.weapon.g22c.spread.crouching = 4.5
tweak_data.weapon.g22c.spread.steelsight = 1.65
tweak_data.weapon.g22c.spread.moving_standing = tweak_data.weapon.g22c.spread.standing * 1.5
tweak_data.weapon.g22c.spread.moving_crouching = tweak_data.weapon.g22c.spread.crouching * 1.5
tweak_data.weapon.g22c.spread.moving_steelsight = tweak_data.weapon.g22c.spread.steelsight * 1.5

tweak_data.weapon.g22c.CLIP_AMMO_MAX = 15
tweak_data.weapon.g22c.AMMO_MAX = 120

tweak_data.weapon.g22c.fire_mode_data.fire_rate = 0.10344827586206896551724137931034

tweak_data.weapon.g22c.shake.fire_multiplier = 1
tweak_data.weapon.g22c.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.g22c.armor_piercing_chance = 0.05

tweak_data.weapon.g22c.damage_near = 7 * 100
tweak_data.weapon.g22c.damage_far = 90 * 100
tweak_data.weapon.g22c.damage_min = 0.5

tweak_data.weapon.g22c.stats.damage = 16
tweak_data.weapon.g22c.stats.spread = 11
tweak_data.weapon.g22c.stats.recoil = 16
tweak_data.weapon.g22c.stats.suppression = 12
	
pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pivot_head_translation = Vector3(0, 37, 0.3)
pivot_head_rotation = Rotation(0, 0.3, 0)
tweak_data.player.stances.g22c.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g22c.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     PEE TOOT TOOT SEX     ]]--
tweak_data.weapon.p226.weapon_hold = "colt_1911"

tweak_data.weapon.p226.kick.standing = { 1.5, 2.5, -1.0, 1.0 }
tweak_data.weapon.p226.kick.crouching = tweak_data.weapon.p226.kick.standing
tweak_data.weapon.p226.kick.steelsight = tweak_data.weapon.p226.kick.standing

tweak_data.weapon.p226.spread.standing = 5.25
tweak_data.weapon.p226.spread.crouching = 4.75
tweak_data.weapon.p226.spread.steelsight = 1.45
tweak_data.weapon.p226.spread.moving_standing = tweak_data.weapon.p226.spread.standing * 1.65
tweak_data.weapon.p226.spread.moving_crouching = tweak_data.weapon.p226.spread.crouching * 1.65
tweak_data.weapon.p226.spread.moving_steelsight = tweak_data.weapon.p226.spread.steelsight * 1.65

tweak_data.weapon.p226.fire_mode_data.fire_rate = 0.11111111111111111111111111111111

tweak_data.weapon.p226.CLIP_AMMO_MAX = 16
tweak_data.weapon.p226.AMMO_MAX = 117

tweak_data.weapon.p226.shake.fire_multiplier = 1
tweak_data.weapon.p226.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.p226.armor_piercing_chance = 0.075

tweak_data.weapon.p226.damage_near = 13 * 100
tweak_data.weapon.p226.damage_far = 84 * 100
tweak_data.weapon.p226.damage_min = 0.5

tweak_data.weapon.p226.stats.damage = 16
tweak_data.weapon.p226.stats.spread = 15
tweak_data.weapon.p226.stats.recoil = 12
tweak_data.weapon.p226.stats.suppression = 12



--[[     HS2000     ]]--
tweak_data.weapon.hs2000.weapon_hold = "glock"

tweak_data.weapon.hs2000.kick.standing = { 1.5, 1.75, -2.4, 2.4 }
tweak_data.weapon.hs2000.kick.crouching = tweak_data.weapon.hs2000.kick.standing
tweak_data.weapon.hs2000.kick.steelsight = tweak_data.weapon.hs2000.kick.standing

tweak_data.weapon.hs2000.spread.standing = 4.75
tweak_data.weapon.hs2000.spread.crouching = 4.25
tweak_data.weapon.hs2000.spread.steelsight = 1.525
tweak_data.weapon.hs2000.spread.moving_standing = tweak_data.weapon.hs2000.spread.standing * 1.55
tweak_data.weapon.hs2000.spread.moving_crouching = tweak_data.weapon.hs2000.spread.crouching * 1.55
tweak_data.weapon.hs2000.spread.moving_steelsight = tweak_data.weapon.hs2000.spread.steelsight * 1.55

tweak_data.weapon.hs2000.fire_mode_data.fire_rate = 0.11764705882352941176470588235294

tweak_data.weapon.hs2000.CLIP_AMMO_MAX = 16
tweak_data.weapon.hs2000.AMMO_MAX = 112

tweak_data.weapon.hs2000.shake.fire_multiplier = 1.2
tweak_data.weapon.hs2000.shake.fire_steelsight_multiplier = -1.2

tweak_data.weapon.hs2000.armor_piercing_chance = 0.075

tweak_data.weapon.hs2000.damage_near = 10 * 100
tweak_data.weapon.hs2000.damage_far = 100 * 100
tweak_data.weapon.hs2000.damage_min = 0.5

tweak_data.weapon.hs2000.stats.damage = 16
tweak_data.weapon.hs2000.stats.spread = 14
tweak_data.weapon.hs2000.stats.recoil = 15
tweak_data.weapon.hs2000.stats.suppression = 12



--[[     STOPPAN POWAH     ]]--
tweak_data.weapon.colt_1911.kick.standing = { 1.5, 2.5, -1.6, 1.6 }
tweak_data.weapon.colt_1911.kick.crouching = tweak_data.weapon.colt_1911.kick.standing
tweak_data.weapon.colt_1911.kick.steelsight = tweak_data.weapon.colt_1911.kick.standing

tweak_data.weapon.colt_1911.spread.standing = 5
tweak_data.weapon.colt_1911.spread.crouching = 4.5
tweak_data.weapon.colt_1911.spread.steelsight = 1.55
tweak_data.weapon.colt_1911.spread.moving_standing = tweak_data.weapon.colt_1911.spread.standing * 1.6
tweak_data.weapon.colt_1911.spread.moving_crouching = tweak_data.weapon.colt_1911.spread.crouching * 1.6
tweak_data.weapon.colt_1911.spread.moving_steelsight = tweak_data.weapon.colt_1911.spread.steelsight * 1.6

tweak_data.weapon.colt_1911.CLIP_AMMO_MAX = 8
tweak_data.weapon.colt_1911.AMMO_MAX = 104

tweak_data.weapon.colt_1911.fire_mode_data.fire_rate = 0.1319

tweak_data.weapon.colt_1911.armor_piercing_chance = 0.15

tweak_data.weapon.colt_1911.shake.fire_multiplier = 1.1
tweak_data.weapon.colt_1911.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.colt_1911.damage_near = 11 * 100
tweak_data.weapon.colt_1911.damage_far = 66 * 100
tweak_data.weapon.colt_1911.damage_min = 0.3

tweak_data.weapon.colt_1911.stats.damage = 18
tweak_data.weapon.colt_1911.stats.spread = 11
tweak_data.weapon.colt_1911.stats.recoil = 11
tweak_data.weapon.colt_1911.stats.suppression = 10



--[[     DOUBLE THE STOPPAN POWAH     ]]--
tweak_data.weapon.x_1911.kick.standing = { 1.5, 2.5, -1.6, 1.6 }
tweak_data.weapon.x_1911.kick.crouching = tweak_data.weapon.x_1911.kick.standing
tweak_data.weapon.x_1911.kick.steelsight = tweak_data.weapon.x_1911.kick.standing

tweak_data.weapon.x_1911.spread.standing = 5 * 2
tweak_data.weapon.x_1911.spread.crouching = 4.5 * 2
tweak_data.weapon.x_1911.spread.steelsight = 1.55 * 2
tweak_data.weapon.x_1911.spread.moving_standing = tweak_data.weapon.x_1911.spread.standing * 1.6
tweak_data.weapon.x_1911.spread.moving_crouching = tweak_data.weapon.x_1911.spread.crouching * 1.6
tweak_data.weapon.x_1911.spread.moving_steelsight = tweak_data.weapon.x_1911.spread.steelsight * 1.6

tweak_data.weapon.x_1911.CLIP_AMMO_MAX = 8 * 2
tweak_data.weapon.x_1911.AMMO_MAX = 120

tweak_data.weapon.x_1911.fire_mode_data.fire_rate = 0.1319

tweak_data.weapon.x_1911.armor_piercing_chance = 0.15

tweak_data.weapon.x_1911.shake.fire_multiplier = 1.7
tweak_data.weapon.x_1911.shake.fire_steelsight_multiplier = 1.7

tweak_data.weapon.x_1911.damage_near = 11 * 100
tweak_data.weapon.x_1911.damage_far = 66 * 100
tweak_data.weapon.x_1911.damage_min = 0.3

tweak_data.weapon.x_1911.stats.damage = 18
tweak_data.weapon.x_1911.stats.spread = 11
tweak_data.weapon.x_1911.stats.recoil = 11
tweak_data.weapon.x_1911.stats.suppression = 10



--[[     USP     ]]--
tweak_data.weapon.usp.weapon_hold = "colt_1911"

tweak_data.weapon.usp.kick.standing = { 2.0, 2.5, -1.0, 1.0 }
tweak_data.weapon.usp.kick.crouching = tweak_data.weapon.usp.kick.standing
tweak_data.weapon.usp.kick.steelsight = tweak_data.weapon.usp.kick.standing

tweak_data.weapon.usp.spread.standing = 4.75
tweak_data.weapon.usp.spread.crouching = 4.25
tweak_data.weapon.usp.spread.steelsight = 1.35
tweak_data.weapon.usp.spread.moving_standing = tweak_data.weapon.usp.spread.standing * 1.55
tweak_data.weapon.usp.spread.moving_crouching = tweak_data.weapon.usp.spread.crouching * 1.55
tweak_data.weapon.usp.spread.moving_steelsight = tweak_data.weapon.usp.spread.steelsight * 1.55

tweak_data.weapon.usp.CLIP_AMMO_MAX = 12
tweak_data.weapon.usp.AMMO_MAX = 108

tweak_data.weapon.usp.fire_mode_data.fire_rate = 0.1277

tweak_data.weapon.usp.armor_piercing_chance = 0.15

tweak_data.weapon.usp.shake.fire_multiplier = 1.3
tweak_data.weapon.usp.shake.fire_steelsight_multiplier = -1.3

tweak_data.weapon.usp.damage_near = 8 * 100
tweak_data.weapon.usp.damage_far = 75 * 100
tweak_data.weapon.usp.damage_min = 0.3

tweak_data.weapon.usp.stats.damage = 18
tweak_data.weapon.usp.stats.spread = 15
tweak_data.weapon.usp.stats.recoil = 9
tweak_data.weapon.usp.stats.suppression = 10



--[[     C Nien-ty Six     ]]--	
tweak_data.weapon.c96.upgrade_blocks = {
		pistol = {
			"fire_rate_multiplier"
		}
	}
tweak_data.weapon.c96.kick.standing = { 1.30, 2.70, -1.7, 1.7 }
tweak_data.weapon.c96.kick.crouching = tweak_data.weapon.c96.kick.standing
tweak_data.weapon.c96.kick.steelsight = tweak_data.weapon.c96.kick.standing

tweak_data.weapon.c96.spread.standing = 5
tweak_data.weapon.c96.spread.crouching = 4.5
tweak_data.weapon.c96.spread.steelsight = 1.3
tweak_data.weapon.c96.spread.moving_standing = tweak_data.weapon.c96.spread.standing * 1.55
tweak_data.weapon.c96.spread.moving_crouching = tweak_data.weapon.c96.spread.crouching * 1.55
tweak_data.weapon.c96.spread.moving_steelsight = tweak_data.weapon.c96.spread.steelsight * 1.55

tweak_data.weapon.c96.AMMO_MAX = 120

tweak_data.weapon.c96.fire_mode_data.fire_rate = 0.12

tweak_data.weapon.c96.armor_piercing_chance = 0.40

tweak_data.weapon.c96.shake.fire_multiplier = 1.3
tweak_data.weapon.c96.shake.fire_steelsight_multiplier = -1.3

tweak_data.weapon.c96.damage_near = 7 * 100
tweak_data.weapon.c96.damage_far = 97 * 100
tweak_data.weapon.c96.damage_min = 0.4
	
tweak_data.weapon.c96.stats.damage = 16
tweak_data.weapon.c96.stats.spread = 15
tweak_data.weapon.c96.stats.recoil = 8
tweak_data.weapon.c96.stats.suppression = 14



--[[     HUEHUEHUEHUEHUE     ]]--
tweak_data.weapon.new_raging_bull.kick.standing = { 5.5, 6.5, -1.6, 1.6 } --changes recoil pattern to heavy vertical kick
tweak_data.weapon.new_raging_bull.kick.crouching = tweak_data.weapon.new_raging_bull.kick.standing
tweak_data.weapon.new_raging_bull.kick.steelsight = tweak_data.weapon.new_raging_bull.kick.standing

tweak_data.weapon.new_raging_bull.spread.standing = 4.5
tweak_data.weapon.new_raging_bull.spread.crouching = 4
tweak_data.weapon.new_raging_bull.spread.steelsight = 1
tweak_data.weapon.new_raging_bull.spread.moving_standing = tweak_data.weapon.new_raging_bull.spread.standing * 2.0
tweak_data.weapon.new_raging_bull.spread.moving_crouching = tweak_data.weapon.new_raging_bull.spread.crouching * 2.0
tweak_data.weapon.new_raging_bull.spread.moving_steelsight = tweak_data.weapon.new_raging_bull.spread.steelsight * 2.0

tweak_data.weapon.new_raging_bull.fire_mode_data.fire_rate = 0.18461538461538461538461538461538

tweak_data.weapon.new_raging_bull.CLIP_AMMO_MAX = 6
tweak_data.weapon.new_raging_bull.AMMO_MAX = 48

tweak_data.weapon.new_raging_bull.shake.fire_multiplier = 1.75
tweak_data.weapon.new_raging_bull.shake.fire_steelsight_multiplier = -1.75

tweak_data.weapon.new_raging_bull.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.new_raging_bull.can_shoot_through_shield = true

tweak_data.weapon.new_raging_bull.armor_piercing_chance = 1

tweak_data.weapon.new_raging_bull.damage_near = 10 * 100
tweak_data.weapon.new_raging_bull.damage_far = 100 * 100
tweak_data.weapon.new_raging_bull.damage_min = 0.4

tweak_data.weapon.new_raging_bull.stats.damage = 40
tweak_data.weapon.new_raging_bull.stats.spread = 15
tweak_data.weapon.new_raging_bull.stats.recoil = 7
tweak_data.weapon.new_raging_bull.stats.suppression = 5



--[[     Is that a FAMAS?     ]]--
tweak_data.weapon.deagle.kick.standing = { 3.0, 5.0, 1.0, 5.5 } --changes recoil pattern to literally "fuck you"
tweak_data.weapon.deagle.kick.crouching = tweak_data.weapon.deagle.kick.standing
tweak_data.weapon.deagle.kick.steelsight = tweak_data.weapon.deagle.kick.standing

tweak_data.weapon.deagle.spread.standing = 5.25
tweak_data.weapon.deagle.spread.crouching = 4.75
tweak_data.weapon.deagle.spread.steelsight = 1.55
tweak_data.weapon.deagle.spread.moving_standing = tweak_data.weapon.deagle.spread.standing * 1.8
tweak_data.weapon.deagle.spread.moving_crouching = tweak_data.weapon.deagle.spread.crouching * 1.8
tweak_data.weapon.deagle.spread.moving_steelsight = tweak_data.weapon.deagle.spread.steelsight * 1.8

tweak_data.weapon.deagle.CLIP_AMMO_MAX = 7
tweak_data.weapon.deagle.AMMO_MAX = 42

tweak_data.weapon.deagle.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.deagle.shake.fire_multiplier = 3.5
tweak_data.weapon.deagle.shake.fire_steelsight_multiplier = -3.5

tweak_data.weapon.deagle.fire_mode_data.fire_rate = 0.2

tweak_data.weapon.deagle.armor_piercing_chance = 0.5

tweak_data.weapon.deagle.damage_near = 6 * 100
tweak_data.weapon.deagle.damage_far = 88 * 100
tweak_data.weapon.deagle.damage_min = 0.3

tweak_data.weapon.deagle.stats.damage = 48
tweak_data.weapon.deagle.stats.spread = 11
tweak_data.weapon.deagle.stats.recoil = 5
tweak_data.weapon.deagle.stats.suppression = 4

pivot_shoulder_translation = Vector3(8.51744, 40.6489, -3.66934)
pivot_shoulder_rotation = Rotation(0.100008, -0.96687698, 0.630289)
pivot_head_translation = Vector3(0,35,-0.75)
pivot_head_rotation = Rotation(0,-0.0,0)
tweak_data.player.stances.deagle.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.deagle.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     DUAL FAMAS     ]]--
tweak_data.weapon.x_deagle.kick.standing = { -5.1, 5.1, -3.25, 3.25 }
tweak_data.weapon.x_deagle.kick.crouching = tweak_data.weapon.x_deagle.kick.standing
tweak_data.weapon.x_deagle.kick.steelsight = tweak_data.weapon.x_deagle.kick.standing

tweak_data.weapon.x_deagle.spread.standing = 5.25 * 2
tweak_data.weapon.x_deagle.spread.crouching = 4.75 * 2
tweak_data.weapon.x_deagle.spread.steelsight = 1.55 * 2
tweak_data.weapon.x_deagle.spread.moving_standing = tweak_data.weapon.x_deagle.spread.standing * 1.8
tweak_data.weapon.x_deagle.spread.moving_crouching = tweak_data.weapon.x_deagle.spread.crouching * 1.8
tweak_data.weapon.x_deagle.spread.moving_steelsight = tweak_data.weapon.x_deagle.spread.steelsight * 1.8

tweak_data.weapon.x_deagle.CLIP_AMMO_MAX = 7 * 2
tweak_data.weapon.x_deagle.AMMO_MAX = 56

tweak_data.weapon.x_deagle.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.x_deagle.shake.fire_multiplier = 4.2
tweak_data.weapon.x_deagle.shake.fire_steelsight_multiplier = 4.2

tweak_data.weapon.x_deagle.fire_mode_data.fire_rate = 0.2

tweak_data.weapon.x_deagle.armor_piercing_chance = 0.5

tweak_data.weapon.x_deagle.animations.has_steelsight_stance = false

tweak_data.weapon.x_deagle.damage_near = 6 * 100
tweak_data.weapon.x_deagle.damage_far = 88 * 100
tweak_data.weapon.x_deagle.damage_min = 0.3

tweak_data.weapon.x_deagle.stats.damage = 48
tweak_data.weapon.x_deagle.stats.spread = 11
tweak_data.weapon.x_deagle.stats.recoil = 5
tweak_data.weapon.x_deagle.stats.suppression = 4
	
pivot_shoulder_translation = Vector3(11.4931, 42.3369, -0.596629)
pivot_shoulder_rotation = Rotation(-0.34809, 0.254047, 0.28066)
pivot_head_translation = Vector3(10.5, 40, 1)
pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.x_deagle.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.x_deagle.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
--}


	
----------------------------------------------[[SMGS]]----------------------------------------------
--{
--[[     GLORIOUS CZECHNOLOGY     ]]--
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

tweak_data.weapon.scorpion.damage_near = 9 * 100
tweak_data.weapon.scorpion.damage_far = 55 * 100
tweak_data.weapon.scorpion.damage_min = 0.4

tweak_data.weapon.scorpion.stats.damage = 14
tweak_data.weapon.scorpion.stats.spread = 11
tweak_data.weapon.scorpion.stats.recoil = 18
tweak_data.weapon.scorpion.stats.suppression = 17



--[[     Loli no pantsu     ]]--
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

tweak_data.weapon.mp9.damage_near = 8 * 100
tweak_data.weapon.mp9.damage_far = 65 * 100
tweak_data.weapon.mp9.damage_min = 0.4

tweak_data.weapon.mp9.stats.damage = 16
tweak_data.weapon.mp9.stats.spread = 13
tweak_data.weapon.mp9.stats.recoil = 14
tweak_data.weapon.mp9.stats.suppression = 14



--[[     I'd G3's little sister     ]]--
pivot_shoulder_translation = Vector3(10.7414, 18.4543, -3.29175)
pivot_shoulder_rotation = Rotation(0.106934, -0.220015, 0.629729)
pivot_head_translation = Vector3(0,10,-0.05) --7
pivot_head_rotation = Rotation(0,0.25,0)
tweak_data.player.stances.new_mp5.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.new_mp5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.new_mp5.kick.standing = {1.6, -0.8, -1.4, 1.4 }
tweak_data.weapon.new_mp5.kick.crouching = tweak_data.weapon.new_mp5.kick.standing
tweak_data.weapon.new_mp5.kick.steelsight = tweak_data.weapon.new_mp5.kick.standing

tweak_data.weapon.new_mp5.spread.standing = 3.5
tweak_data.weapon.new_mp5.spread.crouching = 3
tweak_data.weapon.new_mp5.spread.steelsight = 1.3
tweak_data.weapon.new_mp5.spread.moving_standing = tweak_data.weapon.new_mp5.spread.standing * 1.3
tweak_data.weapon.new_mp5.spread.moving_crouching = tweak_data.weapon.new_mp5.spread.crouching * 1.3
tweak_data.weapon.new_mp5.spread.moving_steelsight = tweak_data.weapon.new_mp5.spread.steelsight * 1.3

tweak_data.weapon.new_mp5.fire_mode_data.fire_rate = 0.075

tweak_data.weapon.new_mp5.AMMO_MAX = 150

tweak_data.weapon.new_mp5.shake.fire_multiplier = 0.8
tweak_data.weapon.new_mp5.shake.fire_steelsight_multiplier = -0.8

tweak_data.weapon.new_mp5.damage_near = 7 * 100
tweak_data.weapon.new_mp5.damage_far = 126 * 100
tweak_data.weapon.new_mp5.damage_min = 0.6

tweak_data.weapon.new_mp5.stats.damage = 16
tweak_data.weapon.new_mp5.stats.spread = 15
tweak_data.weapon.new_mp5.stats.recoil = 18
tweak_data.weapon.new_mp5.stats.suppression = 14



--[[     DID WE MENTION WE'RE SWEDISH -Overkill     ]]--
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

tweak_data.weapon.m45.damage_near = 10 * 100
tweak_data.weapon.m45.damage_far = 106 * 100
tweak_data.weapon.m45.damage_min = 0.6


tweak_data.weapon.m45.stats.damage = 16
tweak_data.weapon.m45.stats.spread = 11
tweak_data.weapon.m45.stats.recoil = 20
tweak_data.weapon.m45.stats.suppression = 14

pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pivot_head_translation = Vector3(7, 42, -3)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.m45.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.m45.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(5, 40, -1)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.m45.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.m45.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Ooze E     ]]--
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

tweak_data.weapon.uzi.damage_near = 13 * 100
tweak_data.weapon.uzi.damage_far = 68 * 100
tweak_data.weapon.uzi.damage_min = 0.5

tweak_data.weapon.uzi.stats.damage = 16
tweak_data.weapon.uzi.stats.spread = 13
tweak_data.weapon.uzi.stats.recoil = 18
tweak_data.weapon.uzi.stats.suppression = 14



--[[     Star Wars     ]]--
pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
pivot_head_translation = Vector3(11, 45, -7)
pivot_head_rotation = Rotation(0, 0, -8)
tweak_data.player.stances.sterling.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.sterling.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(9, 43, -5)
pivot_head_rotation = Rotation(0, 0, -6)
tweak_data.player.stances.sterling.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.sterling.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.sterling.kick.standing = {1.6, -0.9, -1.1, 1.1 }
tweak_data.weapon.sterling.kick.crouching = tweak_data.weapon.sterling.kick.standing
tweak_data.weapon.sterling.kick.steelsight = tweak_data.weapon.sterling.kick.standing

tweak_data.weapon.sterling.spread.standing = 4.5
tweak_data.weapon.sterling.spread.crouching = 4
tweak_data.weapon.sterling.spread.steelsight = 1.3
tweak_data.weapon.sterling.spread.moving_standing = tweak_data.weapon.sterling.spread.standing * 1.8
tweak_data.weapon.sterling.spread.moving_crouching = tweak_data.weapon.sterling.spread.crouching * 1.8
tweak_data.weapon.sterling.spread.moving_steelsight = tweak_data.weapon.sterling.spread.steelsight * 1.8

tweak_data.weapon.sterling.shake.fire_multiplier = 0.9
tweak_data.weapon.sterling.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.sterling.AMMO_MAX = 160

tweak_data.weapon.sterling.damage_near = 12 * 100
tweak_data.weapon.sterling.damage_far = 100 * 100
tweak_data.weapon.sterling.damage_min = 0.5

tweak_data.weapon.sterling.stats.damage = 15
tweak_data.weapon.sterling.stats.spread = 15
tweak_data.weapon.sterling.stats.recoil = 16
tweak_data.weapon.sterling.stats.suppression = 12



--[[     ILIKESHOOTINGTHINGSREALLYREALLYFASTFASTERTHANSANICAMITOOFASTFORYOUTOOBADDEALWITHIT     ]]--
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

tweak_data.weapon.mac10.CLIP_AMMO_MAX = 20
tweak_data.weapon.mac10.AMMO_MAX = 150

tweak_data.weapon.mac10.armor_piercing_chance = 0.1

tweak_data.weapon.mac10.shake.fire_multiplier = 0.75
tweak_data.weapon.mac10.shake.fire_steelsight_multiplier = -0.75

tweak_data.weapon.mac10.damage_near = 6 * 100
tweak_data.weapon.mac10.damage_far = 63 * 100
tweak_data.weapon.mac10.damage_min = 0.3

tweak_data.weapon.mac10.stats.damage = 18
tweak_data.weapon.mac10.stats.spread = 11
tweak_data.weapon.mac10.stats.recoil = 12
tweak_data.weapon.mac10.stats.suppression = 9
	
pivot_head_translation = Vector3(7, 32, -5)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.mac10.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.mac10.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(5, 30, -3)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.mac10.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.mac10.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Thompson-sensei     ]]--
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

tweak_data.weapon.m1928.CLIP_AMMO_MAX = 50
tweak_data.weapon.m1928.AMMO_MAX = 150

tweak_data.weapon.m1928.armor_piercing_chance = 0.1

tweak_data.weapon.m1928.shake.fire_multiplier = 0.45
tweak_data.weapon.m1928.shake.fire_steelsight_multiplier = -0.45

tweak_data.weapon.m1928.damage_near = 10 * 100
tweak_data.weapon.m1928.damage_far = 75 * 100
tweak_data.weapon.m1928.damage_min = 0.3

tweak_data.weapon.m1928.stats.damage = 18
tweak_data.weapon.m1928.stats.spread = 13
tweak_data.weapon.m1928.stats.recoil = 19
tweak_data.weapon.m1928.stats.suppression = 9

pivot_head_translation = Vector3(8, 42, -8)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.m1928.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.m1928.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6, 40, -6)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.m1928.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.m1928.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
--}


	
----------------------------------------------[[PDWS]]----------------------------------------------
--{
--[[     I'd this little sister too (I'd all the H&K gun girls tbh)     ]]--
tweak_data.weapon.mp7.kick.standing = {1.2, -0.4, -0.7, 1.2}
tweak_data.weapon.mp7.kick.crouching = tweak_data.weapon.mp7.kick.standing
tweak_data.weapon.mp7.kick.steelsight = tweak_data.weapon.mp7.kick.standing

tweak_data.weapon.mp7.spread.standing = 4.25
tweak_data.weapon.mp7.spread.crouching = 3.75
tweak_data.weapon.mp7.spread.steelsight = 1.2
tweak_data.weapon.mp7.spread.moving_standing = tweak_data.weapon.mp7.spread.standing * 1.4
tweak_data.weapon.mp7.spread.moving_crouching = tweak_data.weapon.mp7.spread.crouching * 1.4
tweak_data.weapon.mp7.spread.moving_steelsight = tweak_data.weapon.mp7.spread.steelsight * 1.4

tweak_data.weapon.mp7.can_shoot_through_shield = true

tweak_data.weapon.mp7.CLIP_AMMO_MAX = 20
tweak_data.weapon.mp7.AMMO_MAX = 180

tweak_data.weapon.mp7.armor_piercing_chance = 0.7

tweak_data.weapon.mp7.fire_mode_data.fire_rate = 0.06315789473

tweak_data.weapon.mp7.shake.fire_multiplier = 0.7
tweak_data.weapon.mp7.shake.fire_steelsight_multiplier = -0.7

tweak_data.weapon.mp7.damage_near = 11 * 100
tweak_data.weapon.mp7.damage_far = 296 * 100
tweak_data.weapon.mp7.damage_min = 0.8

tweak_data.weapon.mp7.stats.damage = 13
tweak_data.weapon.mp7.stats.spread = 13
tweak_data.weapon.mp7.stats.recoil = 23
tweak_data.weapon.mp7.stats.suppression = 15



--[[     Overpriced .22LR     ]]--
pivot_shoulder_translation = Vector3(11.0002, 24.3293, -0.962641)
pivot_shoulder_rotation = Rotation(0.21279, 0.970214, 0.197877)
pivot_head_translation = Vector3(9, 25, -3)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.p90.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.p90.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 23, -1)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.p90.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.p90.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.p90.kick.standing = {0.55, -0.3, -0.8, 0.8 }
tweak_data.weapon.p90.kick.crouching = tweak_data.weapon.p90.kick.standing
tweak_data.weapon.p90.kick.steelsight = tweak_data.weapon.p90.kick.standing

tweak_data.weapon.p90.spread.standing = 3.5
tweak_data.weapon.p90.spread.crouching = 3
tweak_data.weapon.p90.spread.steelsight = 1.1
tweak_data.weapon.p90.spread.moving_standing = tweak_data.weapon.p90.spread.standing * 1.3
tweak_data.weapon.p90.spread.moving_crouching = tweak_data.weapon.p90.spread.crouching * 1.3
tweak_data.weapon.p90.spread.moving_steelsight = tweak_data.weapon.p90.spread.steelsight * 1.3

tweak_data.weapon.p90.can_shoot_through_shield = true

tweak_data.weapon.p90.armor_piercing_chance = 0.8

tweak_data.weapon.p90.fire_mode_data.fire_rate = 0.066666666666

tweak_data.weapon.p90.CLIP_AMMO_MAX = 50
tweak_data.weapon.p90.AMMO_MAX = 150

tweak_data.weapon.p90.shake.fire_multiplier = 0.57
tweak_data.weapon.p90.shake.fire_steelsight_multiplier = -0.57

tweak_data.weapon.p90.damage_near = 8 * 100
tweak_data.weapon.p90.damage_far = 386 * 100
tweak_data.weapon.p90.damage_min = 0.8

tweak_data.weapon.p90.stats.damage = 13
tweak_data.weapon.p90.stats.spread = 15
tweak_data.weapon.p90.stats.recoil = 18
tweak_data.weapon.p90.stats.suppression = 12
--}

	
	
----------------------------------------------[[CARBINES]]----------------------------------------------
--{
--[[     I'm Special     ]]--
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

tweak_data.weapon.olympic.armor_piercing_chance = 0.15

tweak_data.weapon.olympic.CLIP_AMMO_MAX = 20
tweak_data.weapon.olympic.AMMO_MAX = 150

tweak_data.weapon.olympic.fire_mode_data.fire_rate = 0.07317073170731707317073170731707

tweak_data.weapon.olympic.damage_near = 6 * 100
tweak_data.weapon.olympic.damage_far = 220 * 100
tweak_data.weapon.olympic.damage_min = 0.7

tweak_data.weapon.olympic.stats.damage = 16
tweak_data.weapon.olympic.stats.spread = 11
tweak_data.weapon.olympic.stats.recoil = 14
tweak_data.weapon.olympic.stats.suppression = 10



--[[     Krink     ]]--
tweak_data.weapon.akmsu.category = "assault_rifle"

tweak_data.weapon.akmsu.kick.standing = {1.65, -0.6, -1.4, 1.4 }
tweak_data.weapon.akmsu.kick.crouching = tweak_data.weapon.akmsu.kick.standing
tweak_data.weapon.akmsu.kick.steelsight = tweak_data.weapon.akmsu.kick.standing

tweak_data.weapon.akmsu.spread.standing = 5.75
tweak_data.weapon.akmsu.spread.crouching = 4.25
tweak_data.weapon.akmsu.spread.steelsight = 1.6
tweak_data.weapon.akmsu.spread.moving_standing = tweak_data.weapon.akmsu.spread.standing * 1.45
tweak_data.weapon.akmsu.spread.moving_crouching = tweak_data.weapon.akmsu.spread.crouching * 1.45
tweak_data.weapon.akmsu.spread.moving_steelsight = tweak_data.weapon.akmsu.spread.steelsight * 1.45

tweak_data.weapon.akmsu.CLIP_AMMO_MAX = 30
tweak_data.weapon.akmsu.AMMO_MAX = 120

tweak_data.weapon.akmsu.fire_mode_data.fire_rate = 0.0816

tweak_data.weapon.akmsu.armor_piercing_chance = 0.4

tweak_data.weapon.akmsu.damage_near = 5 * 100
tweak_data.weapon.akmsu.damage_far = 130 * 100
tweak_data.weapon.akmsu.damage_min = 0.5

tweak_data.weapon.akmsu.stats.damage = 25
tweak_data.weapon.akmsu.stats.spread = 17
tweak_data.weapon.akmsu.stats.recoil = 12
tweak_data.weapon.akmsu.stats.suppression = 9



--[[     Heat     ]]--
tweak_data.weapon.amcar.spread.standing = 4.75
tweak_data.weapon.amcar.spread.crouching = 4.25
tweak_data.weapon.amcar.spread.steelsight = 1.2
tweak_data.weapon.amcar.spread.moving_standing = tweak_data.weapon.amcar.spread.standing * 1.45
tweak_data.weapon.amcar.spread.moving_crouching = tweak_data.weapon.amcar.spread.standing * 1.45
tweak_data.weapon.amcar.spread.moving_steelsight = tweak_data.weapon.amcar.spread.steelsight * 1.45

tweak_data.weapon.amcar.kick.standing = { -0.60, 1.4, -2.1, 2.1 }
tweak_data.weapon.amcar.kick.crouching = tweak_data.weapon.amcar.kick.standing
tweak_data.weapon.amcar.kick.steelsight = tweak_data.weapon.amcar.kick.standing

tweak_data.weapon.amcar.armor_piercing_chance = 0.15

tweak_data.weapon.amcar.AMMO_MAX = 180

tweak_data.weapon.amcar.fire_mode_data.fire_rate = 0.0857

tweak_data.weapon.amcar.shake.fire_multiplier = 0.9
tweak_data.weapon.amcar.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.amcar.damage_near = 7 * 100
tweak_data.weapon.amcar.damage_far = 267* 100
tweak_data.weapon.amcar.damage_min = 0.7

tweak_data.weapon.amcar.stats.damage = 17
tweak_data.weapon.amcar.stats.spread = 11
tweak_data.weapon.amcar.stats.recoil = 19
tweak_data.weapon.amcar.stats.suppression = 11



--[[     Meltgun     ]]--
tweak_data.weapon.g36.spread.standing = 5.25
tweak_data.weapon.g36.spread.crouching = 4.75
tweak_data.weapon.g36.spread.steelsight = 1.15
tweak_data.weapon.g36.spread.moving_standing = tweak_data.weapon.g36.spread.standing * 1.25
tweak_data.weapon.g36.spread.moving_crouching = tweak_data.weapon.g36.spread.crouching * 1.25
tweak_data.weapon.g36.spread.moving_steelsight = tweak_data.weapon.g36.spread.steelsight * 1.25

tweak_data.weapon.g36.kick.standing = { -0.85, 1.45, -1.55, 1.55}
tweak_data.weapon.g36.kick.crouching = tweak_data.weapon.g36.kick.standing
tweak_data.weapon.g36.kick.steelsight = tweak_data.weapon.g36.kick.standing

tweak_data.weapon.g36.armor_piercing_chance = 0.15

tweak_data.weapon.g36.AMMO_MAX = 180

tweak_data.weapon.g36.fire_mode_data.fire_rate = 0.08

tweak_data.weapon.g36.burst_size = 2

tweak_data.weapon.g36.shake.fire_multiplier = 1
tweak_data.weapon.g36.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.g36.damage_near = 10 * 100
tweak_data.weapon.g36.damage_far = 240 * 100
tweak_data.weapon.g36.damage_min = 0.7

tweak_data.weapon.g36.stats.damage = 17
tweak_data.weapon.g36.stats.spread = 13
tweak_data.weapon.g36.stats.recoil = 17
tweak_data.weapon.g36.stats.suppression = 9
	
pivot_shoulder_translation = Vector3(10.5658, 24.8768, -1.07923)
pivot_shoulder_rotation = Rotation(-0.000313746, 0.000813967, -0.00027678)
pivot_head_translation = Vector3(-0.01,12,0)
pivot_head_rotation = Rotation(0,0,0)
tweak_data.player.stances.g36.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.g36.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(10, 28, -4)
pivot_head_rotation = Rotation(0.0, 0.0, -1)
tweak_data.player.stances.g36.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g36.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8, 26, -2)
pivot_head_rotation = Rotation(0.0, 0.0, -2)
tweak_data.player.stances.g36.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g36.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Shigu     ]]--
tweak_data.weapon.s552.kick.standing = { -0.15, 1.9, -1.1, 1.1 }
tweak_data.weapon.s552.kick.crouching = tweak_data.weapon.s552.kick.standing
tweak_data.weapon.s552.kick.steelsight = tweak_data.weapon.s552.kick.standing

tweak_data.weapon.s552.spread.standing = 5.5
tweak_data.weapon.s552.spread.crouching = 5
tweak_data.weapon.s552.spread.steelsight = 1.1
tweak_data.weapon.s552.spread.moving_standing = tweak_data.weapon.s552.spread.standing * 1.3
tweak_data.weapon.s552.spread.moving_crouching = tweak_data.weapon.s552.spread.crouching * 1.3
tweak_data.weapon.s552.spread.moving_steelsight = tweak_data.weapon.s552.spread.steelsight * 1.3

tweak_data.weapon.s552.fire_mode_data.fire_rate = 0.07692307692307692307692307692308

tweak_data.weapon.s552.CLIP_AMMO_MAX = 30
tweak_data.weapon.s552.AMMO_MAX = 180

tweak_data.weapon.s552.armor_piercing_chance = 0.2

tweak_data.weapon.s552.shake.fire_multiplier = 0.6
tweak_data.weapon.s552.shake.fire_steelsight_multiplier = -0.6

tweak_data.weapon.s552.damage_near = 12 * 100
tweak_data.weapon.s552.damage_far = 260 * 100
tweak_data.weapon.s552.damage_min = 0.7

tweak_data.weapon.s552.stats.damage = 17
tweak_data.weapon.s552.stats.spread = 13
tweak_data.weapon.s552.stats.recoil = 15
tweak_data.weapon.s552.stats.suppression = 9

pivot_shoulder_translation = Vector3(10.5658, 24.8768, -1.07923)
pivot_shoulder_rotation = Rotation(-0.000313746, 0.000813967, -0.00027678)
pivot_head_translation = Vector3(8, 25, 0)
pivot_head_rotation = Rotation(0.0, 0.0, -1)
tweak_data.player.stances.s552.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.s552.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6, 23, 2)
pivot_head_rotation = Rotation(0.0, 0.0, -2)
tweak_data.player.stances.s552.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.s552.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
--}



----------------------------------------------[[ARs]]----------------------------------------------
--{
--[[     FAM-ASS (see Rufuira! 4)     ]]--
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

tweak_data.weapon.famas.armor_piercing_chance = 0.2

tweak_data.weapon.famas.shake.fire_multiplier = 0.9
tweak_data.weapon.famas.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.famas.damage_near = 8 * 100
tweak_data.weapon.famas.damage_far = 396 * 100
tweak_data.weapon.famas.damage_min = 0.8

tweak_data.weapon.famas.stats.damage = 17
tweak_data.weapon.famas.stats.spread = 14
tweak_data.weapon.famas.stats.recoil = 15
tweak_data.weapon.famas.stats.suppression = 10
	
pivot_shoulder_translation = Vector3(12.4978, 36.9949, -1.6971)
pivot_shoulder_rotation = Rotation(2.58401, -0.0831424, 0.629405)
pivot_head_translation = Vector3(8, 39, -3)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.famas.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.famas.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6, 37, -1)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.famas.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.famas.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(0, 26, 0)
pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.famas.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.famas.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Rewinding [<<]    ]]--
tweak_data.weapon.vhs.kick.standing = { -0.3, 0.7, -0.85, 0.85}
tweak_data.weapon.vhs.kick.crouching = tweak_data.weapon.vhs.kick.standing
tweak_data.weapon.vhs.kick.steelsight = tweak_data.weapon.vhs.kick.standing

tweak_data.weapon.vhs.spread.standing = 4.75
tweak_data.weapon.vhs.spread.crouching = 4.25
tweak_data.weapon.vhs.spread.steelsight = 0.9
tweak_data.weapon.vhs.spread.moving_standing = tweak_data.weapon.vhs.spread.standing * 1.3
tweak_data.weapon.vhs.spread.moving_crouching = tweak_data.weapon.vhs.spread.crouching * 1.3
tweak_data.weapon.vhs.spread.moving_steelsight = tweak_data.weapon.vhs.spread.steelsight * 1.3

tweak_data.weapon.vhs.sounds.enter_steelsight = "secondary_steel_sight_enter"
tweak_data.weapon.vhs.sounds.leave_steelsight = "secondary_steel_sight_exit"

tweak_data.weapon.vhs.CLIP_AMMO_MAX = 30
tweak_data.weapon.vhs.AMMO_MAX = 150
tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_m.stats = {value = 1} --gets rid of the stats the *default*, **non-removable** magazine applies.

tweak_data.weapon.vhs.fire_mode_data.fire_rate = 0.07058823529411764705882352941176		

tweak_data.weapon.vhs.armor_piercing_chance = 0.2

tweak_data.weapon.vhs.shake.fire_multiplier = 0.4
tweak_data.weapon.vhs.shake.fire_steelsight_multiplier = -0.4

tweak_data.weapon.vhs.damage_near = 10 * 100
tweak_data.weapon.vhs.damage_far = 451 * 100
tweak_data.weapon.vhs.damage_min = 0.8

tweak_data.weapon.vhs.stats.damage = 18
tweak_data.weapon.vhs.stats.spread = 17
tweak_data.weapon.vhs.stats.recoil = 11
tweak_data.weapon.vhs.stats.suppression = 10
	
pivot_shoulder_translation = Vector3(9.11614, 8.59096, -0.476531)
pivot_shoulder_rotation = Rotation(1.99016E-5, 0.00109528, 3.12054E-4)
pivot_head_translation = Vector3(8, 19, -2)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.vhs.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.vhs.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6, 17, -0)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.vhs.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.vhs.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Safety pins     ]]--
tweak_data.weapon.new_m4.kick.standing = { -0.55, 1.45, -1.65, 1.65}
tweak_data.weapon.new_m4.kick.crouching = tweak_data.weapon.new_m4.kick.standing
tweak_data.weapon.new_m4.kick.steelsight = tweak_data.weapon.new_m4.kick.standing

tweak_data.weapon.new_m4.spread.standing = 5.75
tweak_data.weapon.new_m4.spread.crouching = 5.25
tweak_data.weapon.new_m4.spread.steelsight = 1.1
tweak_data.weapon.new_m4.spread.moving_standing = tweak_data.weapon.new_m4.spread.standing * 1.45
tweak_data.weapon.new_m4.spread.moving_crouching = tweak_data.weapon.new_m4.spread.standing * 1.45
tweak_data.weapon.new_m4.spread.moving_steelsight = tweak_data.weapon.new_m4.spread.steelsight * 1.45

tweak_data.weapon.new_m4.fire_mode_data.fire_rate = 0.08333333333333333333333333333333

tweak_data.weapon.new_m4.armor_piercing_chance = 0.2

tweak_data.weapon.new_m4.timers.reload_not_empty = 2.5

tweak_data.weapon.new_m4.shake.fire_multiplier = 0.7
tweak_data.weapon.new_m4.shake.fire_steelsight_multiplier = -0.7

tweak_data.weapon.new_m4.damage_near = 12 * 100
tweak_data.weapon.new_m4.damage_far = 391 * 100
tweak_data.weapon.new_m4.damage_min = 0.8

tweak_data.weapon.new_m4.stats.damage = 17
tweak_data.weapon.new_m4.stats.spread = 11
tweak_data.weapon.new_m4.stats.recoil = 15
tweak_data.weapon.new_m4.stats.suppression = 11



--[[     Ichiroku     ]]--
tweak_data.weapon.m16.spread.standing = 6.25
tweak_data.weapon.m16.spread.crouching = 5.75
tweak_data.weapon.m16.spread.steelsight = 0.95
tweak_data.weapon.m16.spread.moving_standing = tweak_data.weapon.m16.spread.standing * 1.5
tweak_data.weapon.m16.spread.moving_crouching = tweak_data.weapon.m16.spread.crouching * 1.5
tweak_data.weapon.m16.spread.moving_steelsight = tweak_data.weapon.m16.spread.steelsight * 1.5

tweak_data.weapon.m16.kick.standing = { -0.45, 1.85, -1.3, 1.3 }
tweak_data.weapon.m16.kick.crouching = tweak_data.weapon.m16.kick.standing
tweak_data.weapon.m16.kick.steelsight = tweak_data.weapon.m16.kick.standing

tweak_data.weapon.m16.armor_piercing_chance = 0.2

tweak_data.weapon.m16.shake.fire_multiplier = 0.9
tweak_data.weapon.m16.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.m16.CLIP_AMMO_MAX = 20
tweak_data.weapon.m16.AMMO_MAX = 150

tweak_data.weapon.m16.fire_mode_data.fire_rate = 0.07272727272727272727272727272727

tweak_data.weapon.m16.damage_near = 12 * 100
tweak_data.weapon.m16.damage_far = 416 * 100
tweak_data.weapon.m16.damage_min = 0.8

if ozzy_burst == true then
	tweak_data.weapon.m16.FORBIDS_BURST_FIRE = false
	tweak_data.weapon.m16.CAN_TOGGLE_FIREMODE = true
	tweak_data.weapon.m16.HAS_BURST_FIRE = true
	tweak_data.weapon.m16.name_id = "bm_w_m16a4"
else
	tweak_data.weapon.m16.FORBIDS_BURST_FIRE = true
	tweak_data.weapon.m16.CAN_TOGGLE_FIREMODE = true
	tweak_data.weapon.m16.HAS_BURST_FIRE = false
	tweak_data.weapon.m16.name_id = "bm_w_m16"
end

tweak_data.weapon.m16.stats.damage = 18
tweak_data.weapon.m16.stats.spread = 13
tweak_data.weapon.m16.stats.recoil = 14
tweak_data.weapon.m16.stats.suppression = 10



--[[     AUG     ]]--
tweak_data.weapon.aug.kick.standing = { -0.2, 1.9, -0.7, 0.7}
tweak_data.weapon.aug.kick.crouching = tweak_data.weapon.aug.kick.standing
tweak_data.weapon.aug.kick.steelsight = tweak_data.weapon.aug.kick.standing

tweak_data.weapon.aug.spread.standing = 5
tweak_data.weapon.aug.spread.crouching = 4.5
tweak_data.weapon.aug.spread.steelsight = 0.8
tweak_data.weapon.aug.spread.moving_standing = tweak_data.weapon.aug.spread.standing * 1.25
tweak_data.weapon.aug.spread.moving_crouching = tweak_data.weapon.aug.spread.crouching * 1.25
tweak_data.weapon.aug.spread.moving_steelsight = tweak_data.weapon.aug.spread.steelsight * 1.25

tweak_data.weapon.aug.CLIP_AMMO_MAX = 30
tweak_data.weapon.aug.AMMO_MAX = 150

tweak_data.weapon.aug.armor_piercing_chance = 0.25

tweak_data.weapon.aug.fire_mode_data.fire_rate = 0.08571428571428571

tweak_data.weapon.aug.shake.fire_multiplier = 1
tweak_data.weapon.aug.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.aug.damage_near = 14 * 100
tweak_data.weapon.aug.damage_far = 431 * 100
tweak_data.weapon.aug.damage_min = 0.8

tweak_data.weapon.aug.stats.damage = 18
tweak_data.weapon.aug.stats.spread = 15
tweak_data.weapon.aug.stats.recoil = 17
tweak_data.weapon.aug.stats.suppression = 10
	
pivot_shoulder_translation = Vector3(12.4978, 36.9949, -1.6971)
pivot_shoulder_rotation = Rotation(2.58401, -0.0831424, 0.629405)
pivot_head_translation = Vector3(9, 41, 0)
pivot_head_rotation = Rotation(2.5, 0, -1)
tweak_data.player.stances.aug.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.aug.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 39, 2)
pivot_head_rotation = Rotation(2.5, 0, -2)
tweak_data.player.stances.aug.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.aug.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Close enough to being Funco     ]]--
tweak_data.weapon.ak5.kick.standing = { -0.5, 1.1, -1.6, 1.6 }
tweak_data.weapon.ak5.kick.crouching = tweak_data.weapon.ak5.kick.standing
tweak_data.weapon.ak5.kick.steelsight = tweak_data.weapon.ak5.kick.standing

tweak_data.weapon.ak5.spread.standing = 5.75
tweak_data.weapon.ak5.spread.crouching = 5.25
tweak_data.weapon.ak5.spread.steelsight = 0.9
tweak_data.weapon.ak5.spread.moving_standing = tweak_data.weapon.ak5.spread.standing * 1.5
tweak_data.weapon.ak5.spread.moving_crouching = tweak_data.weapon.ak5.spread.crouching * 1.5
tweak_data.weapon.ak5.spread.moving_steelsight = tweak_data.weapon.ak5.spread.steelsight * 1.5

tweak_data.weapon.ak5.fire_mode_data.fire_rate = 0.08888888888888888888888888888889

tweak_data.weapon.ak5.armor_piercing_chance = 0.2

tweak_data.weapon.ak5.shake.fire_multiplier = 0.95
tweak_data.weapon.ak5.shake.fire_steelsight_multiplier = -0.95

tweak_data.weapon.ak5.damage_near = 17 * 100
tweak_data.weapon.ak5.damage_far = 366 * 100
tweak_data.weapon.ak5.damage_min = 0.8

tweak_data.weapon.ak5.stats.damage = 19
tweak_data.weapon.ak5.stats.spread = 13
tweak_data.weapon.ak5.stats.recoil = 19
tweak_data.weapon.ak5.stats.suppression = 10

pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
pivot_head_translation = Vector3(0.01,9,-0.0)
pivot_head_rotation = Rotation(0,-0,0)
tweak_data.player.stances.ak5.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.ak5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     You expected a cute girl? Too bad! It's just me, Eru! *JAM*     ]]--
tweak_data.weapon.l85a2.kick.standing = { -0.85, 1.1, -0.9, 0.9}
tweak_data.weapon.l85a2.kick.crouching = tweak_data.weapon.l85a2.kick.standing
tweak_data.weapon.l85a2.kick.steelsight = tweak_data.weapon.l85a2.kick.standing

tweak_data.weapon.l85a2.spread.standing = 6.5
tweak_data.weapon.l85a2.spread.crouching = 6
tweak_data.weapon.l85a2.spread.steelsight = 0.6
tweak_data.weapon.l85a2.spread.moving_standing = tweak_data.weapon.l85a2.spread.standing * 1.5
tweak_data.weapon.l85a2.spread.moving_crouching = tweak_data.weapon.l85a2.spread.crouching * 1.5
tweak_data.weapon.l85a2.spread.moving_steelsight = tweak_data.weapon.l85a2.spread.steelsight * 1.5

tweak_data.weapon.l85a2.CLIP_AMMO_MAX = 30
tweak_data.weapon.l85a2.AMMO_MAX = 150

tweak_data.weapon.l85a2.timers.reload_empty = 4.1
tweak_data.weapon.l85a2.timers.reload_not_empty = 3.1

tweak_data.weapon.l85a2.armor_piercing_chance = 0.25

tweak_data.weapon.l85a2.fire_mode_data.fire_rate = 0.098360655737704

tweak_data.weapon.l85a2.shake.fire_multiplier = -0.9
tweak_data.weapon.l85a2.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.l85a2.damage_near = 19 * 100
tweak_data.weapon.l85a2.damage_far = 456 * 100
tweak_data.weapon.l85a2.damage_min = 0.8

tweak_data.weapon.l85a2.stats.damage = 17
tweak_data.weapon.l85a2.stats.spread = 13
tweak_data.weapon.l85a2.stats.recoil = 21
tweak_data.weapon.l85a2.stats.suppression = 14

pivot_shoulder_translation = Vector3(9.494, 25.5678, -0.986251)
pivot_shoulder_rotation = Rotation(0.00116616, 0.00248113, 6.06522E-4)
pivot_head_translation = Vector3(9, 30, -2)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.l85a2.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.l85a2.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 28, 0)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.l85a2.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.l85a2.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     AKs are cats    ]]--
tweak_data.weapon.ak74.spread.standing = 5.75
tweak_data.weapon.ak74.spread.crouching = 5.25
tweak_data.weapon.ak74.spread.steelsight = 1.2
tweak_data.weapon.ak74.spread.moving_standing = tweak_data.weapon.ak74.spread.standing * 1.375
tweak_data.weapon.ak74.spread.moving_crouching = tweak_data.weapon.ak74.spread.crouching * 1.375
tweak_data.weapon.ak74.spread.moving_steelsight = tweak_data.weapon.ak74.spread.steelsight * 1.375

tweak_data.weapon.ak74.armor_piercing_chance = 0.35

tweak_data.weapon.ak74.AMMO_MAX = 150

tweak_data.weapon.ak74.fire_mode_data.fire_rate = 0.0923

tweak_data.weapon.ak74.kick.standing = { -0.3, 1.45, -1.3, 1.3 }
tweak_data.weapon.ak74.kick.crouching = tweak_data.weapon.ak74.kick.standing
tweak_data.weapon.ak74.kick.steelsight = tweak_data.weapon.ak74.kick.standing

tweak_data.weapon.ak74.shake.fire_multiplier = 1
tweak_data.weapon.ak74.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.ak74.damage_near = 11 * 100
tweak_data.weapon.ak74.damage_far = 427 * 100
tweak_data.weapon.ak74.damage_min = 0.85

tweak_data.weapon.ak74.stats.damage = 19
tweak_data.weapon.ak74.stats.spread = 13
tweak_data.weapon.ak74.stats.recoil = 16
tweak_data.weapon.ak74.stats.suppression = 9



--[[     Slavshit     ]]--
tweak_data.weapon.akm.kick.standing = {1.6, -0.3, -1.35, 1.35 }
tweak_data.weapon.akm.kick.crouching = tweak_data.weapon.akm.kick.standing
tweak_data.weapon.akm.kick.steelsight = tweak_data.weapon.akm.kick.standing

tweak_data.weapon.akm.armor_piercing_chance = 0.5

tweak_data.weapon.akm.spread.standing = 6.5
tweak_data.weapon.akm.spread.crouching = 6
tweak_data.weapon.akm.spread.steelsight = 1.5
tweak_data.weapon.akm.spread.moving_standing = tweak_data.weapon.akm.spread.standing * 1.55
tweak_data.weapon.akm.spread.moving_crouching = tweak_data.weapon.akm.spread.crouching * 1.55
tweak_data.weapon.akm.spread.moving_steelsight = tweak_data.weapon.akm.spread.steelsight * 1.55

tweak_data.weapon.akm.CLIP_AMMO_MAX = 30
tweak_data.weapon.akm.AMMO_MAX = 120

tweak_data.weapon.akm.shake.fire_multiplier = 1.1
tweak_data.weapon.akm.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.akm.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.akm.damage_near = 13 * 100
tweak_data.weapon.akm.damage_far = 160 * 100
tweak_data.weapon.akm.damage_min = 0.6

tweak_data.weapon.akm.stats.damage = 25
tweak_data.weapon.akm.stats.spread = 11
tweak_data.weapon.akm.stats.recoil = 15
tweak_data.weapon.akm.stats.suppression = 8



--[[     GOLD Slavshit     ]]--
tweak_data.weapon.akm_gold.kick.standing = {1.4, -0.75, -1.65, 1.65 }
tweak_data.weapon.akm_gold.kick.crouching = tweak_data.weapon.akm_gold.kick.standing
tweak_data.weapon.akm_gold.kick.steelsight = tweak_data.weapon.akm_gold.kick.standing

tweak_data.weapon.akm_gold.armor_piercing_chance = 0.5

tweak_data.weapon.akm_gold.spread.standing = 6.5
tweak_data.weapon.akm_gold.spread.crouching = 6
tweak_data.weapon.akm_gold.spread.steelsight = 1.5
tweak_data.weapon.akm_gold.spread.moving_standing = tweak_data.weapon.akm_gold.spread.standing * 1.65
tweak_data.weapon.akm_gold.spread.moving_crouching = tweak_data.weapon.akm_gold.spread.crouching * 1.65
tweak_data.weapon.akm_gold.spread.moving_steelsight = tweak_data.weapon.akm_gold.spread.steelsight * 1.65

tweak_data.weapon.akm_gold.CLIP_AMMO_MAX = 30
tweak_data.weapon.akm_gold.AMMO_MAX = 120

tweak_data.weapon.akm_gold.sounds.enter_steelsight = "lmg_steelsight_enter"
tweak_data.weapon.akm_gold.sounds.leave_steelsight = "lmg_steelsight_exit"

tweak_data.weapon.akm_gold.fire_mode_data.fire_rate = 0.1142857

tweak_data.weapon.akm_gold.shake.fire_multiplier = 1.1
tweak_data.weapon.akm_gold.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.akm_gold.damage_near = 13 * 100
tweak_data.weapon.akm_gold.damage_far = 160 * 100
tweak_data.weapon.akm_gold.damage_min = 0.6

tweak_data.weapon.akm_gold.stats.damage = 25
tweak_data.weapon.akm_gold.stats.spread = 11
tweak_data.weapon.akm_gold.stats.recoil = 19
tweak_data.weapon.akm_gold.stats.suppression = 8

--}



----------------------------------------------[[SHOTGUNS]]----------------------------------------------
--{
--[[     Nyan Nyan     ]]--
tweak_data.weapon.saiga.spread.standing = 6
tweak_data.weapon.saiga.spread.crouching = tweak_data.weapon.saiga.spread.standing
tweak_data.weapon.saiga.spread.steelsight = tweak_data.weapon.saiga.spread.standing * 0.7
tweak_data.weapon.saiga.spread.moving_standing = tweak_data.weapon.saiga.spread.standing
tweak_data.weapon.saiga.spread.moving_crouching = tweak_data.weapon.saiga.spread.standing
tweak_data.weapon.saiga.spread.moving_steelsight = tweak_data.weapon.saiga.spread.standing * 0.85

tweak_data.weapon.saiga.CLIP_AMMO_MAX = 8
tweak_data.weapon.saiga.AMMO_MAX = 72

tweak_data.weapon.saiga.kick.standing = {3.00, -1.80, -2.80, 2.80 }
tweak_data.weapon.saiga.kick.crouching = tweak_data.weapon.saiga.kick.standing
tweak_data.weapon.saiga.kick.steelsight = tweak_data.weapon.saiga.kick.standing

tweak_data.weapon.saiga.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.saiga.rays = 8 --pellets per shot

tweak_data.weapon.saiga.damage_near = 100
tweak_data.weapon.saiga.damage_far = 2900

tweak_data.weapon.saiga.armor_piercing_chance = 0.2

tweak_data.weapon.saiga.shake.fire_multiplier = 2
tweak_data.weapon.saiga.shake.fire_steelsight_multiplier = -2

tweak_data.weapon.saiga.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.saiga.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.saiga.stats.damage = 20
tweak_data.weapon.saiga.stats.spread = 12
tweak_data.weapon.saiga.stats.recoil = 17
tweak_data.weapon.saiga.stats.suppression = 5



--[[     R8 70 out of 100     ]]--
pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
pivot_head_translation = Vector3(0,22,0)
pivot_head_rotation = Rotation(0,0,-0)
tweak_data.player.stances.r870.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r870.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.r870.spread.standing = 6
tweak_data.weapon.r870.spread.crouching = tweak_data.weapon.r870.spread.standing
tweak_data.weapon.r870.spread.steelsight = tweak_data.weapon.r870.spread.standing * 0.5
tweak_data.weapon.r870.spread.moving_standing = tweak_data.weapon.r870.spread.standing
tweak_data.weapon.r870.spread.moving_crouching = tweak_data.weapon.r870.spread.standing
tweak_data.weapon.r870.spread.moving_steelsight = tweak_data.weapon.r870.spread.standing * 0.65

tweak_data.weapon.r870.kick.standing = {6.0, 5.0, -4.0, 4.0 }
tweak_data.weapon.r870.kick.crouching = tweak_data.weapon.r870.kick.standing
tweak_data.weapon.r870.kick.steelsight = tweak_data.weapon.r870.kick.standing

tweak_data.weapon.r870.rays = 8--pellets per shot

tweak_data.weapon.r870.fire_mode_data.fire_rate = 0.63157894736842105263157894736842

tweak_data.weapon.r870.armor_piercing_chance = 0.2

tweak_data.weapon.r870.AMMO_MAX = 40

tweak_data.weapon.r870.shake.fire_multiplier = 2.5
tweak_data.weapon.r870.shake.fire_steelsight_multiplier = -2.5

tweak_data.weapon.r870.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.r870.damage_near = 600
tweak_data.weapon.r870.damage_far = 3400

tweak_data.weapon.r870.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.r870.stats.damage = 36
tweak_data.weapon.r870.stats.spread = 15
tweak_data.weapon.r870.stats.recoil = 9
tweak_data.weapon.r870.stats.suppression = 5



--[[     Elmer Fudd     ]]--
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

pivot_head_translation = Vector3(4,26,-3)
pivot_head_rotation = Rotation( -0, -0, -2 )
tweak_data.player.stances.huntsman.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.huntsman.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.huntsman.spread.standing = 6
tweak_data.weapon.huntsman.spread.crouching = tweak_data.weapon.huntsman.spread.standing 
tweak_data.weapon.huntsman.spread.steelsight = tweak_data.weapon.huntsman.spread.standing * 0.6
tweak_data.weapon.huntsman.spread.moving_standing = tweak_data.weapon.huntsman.spread.standing 
tweak_data.weapon.huntsman.spread.moving_crouching = tweak_data.weapon.huntsman.spread.standing 
tweak_data.weapon.huntsman.spread.moving_steelsight = tweak_data.weapon.huntsman.spread.standing * 0.75

tweak_data.weapon.huntsman.rays = 8

tweak_data.weapon.huntsman.fire_mode_data.fire_rate = 0.06

tweak_data.weapon.huntsman.damage_near = 1000
tweak_data.weapon.huntsman.damage_far = 3500

tweak_data.weapon.huntsman.kick.standing = {5.0, 6.0, -4.0, 4.0 }
tweak_data.weapon.huntsman.kick.crouching = tweak_data.weapon.huntsman.kick.standing
tweak_data.weapon.huntsman.kick.steelsight = tweak_data.weapon.huntsman.kick.standing

tweak_data.weapon.huntsman.armor_piercing_chance = 0.2

tweak_data.weapon.huntsman.shake.fire_multiplier = 2.
tweak_data.weapon.huntsman.shake.fire_steelsight_multiplier = 2

tweak_data.weapon.huntsman.HAS_BURST_FIRE = true
tweak_data.weapon.huntsman.burst_size = 2

tweak_data.weapon.huntsman.CLIP_AMMO_MAX = 2
tweak_data.weapon.huntsman.AMMO_MAX = 36

tweak_data.weapon.huntsman.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.huntsman.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.huntsman.stats.damage = 40
tweak_data.weapon.huntsman.stats.spread = 16
tweak_data.weapon.huntsman.stats.recoil = 11
tweak_data.weapon.huntsman.stats.suppression = 2



--[[     Roberta (best girl, fuck the OVA ending)     ]]--
tweak_data.weapon.spas12.spread.standing = 6
tweak_data.weapon.spas12.spread.crouching = tweak_data.weapon.spas12.spread.standing
tweak_data.weapon.spas12.spread.steelsight = tweak_data.weapon.spas12.spread.standing * 0.65
tweak_data.weapon.spas12.spread.moving_standing = tweak_data.weapon.spas12.spread.standing
tweak_data.weapon.spas12.spread.moving_crouching = tweak_data.weapon.spas12.spread.standing
tweak_data.weapon.spas12.spread.moving_steelsight = tweak_data.weapon.spas12.spread.standing * 0.75

tweak_data.weapon.spas12.kick.standing = {4.0, 3.0, -5.5, 5.5 }
tweak_data.weapon.spas12.kick.crouching = tweak_data.weapon.spas12.kick.standing
tweak_data.weapon.spas12.kick.steelsight = tweak_data.weapon.spas12.kick.standing

tweak_data.weapon.spas12.shake.fire_multiplier = 1.5
tweak_data.weapon.spas12.shake.fire_steelsight_multiplier = -1.5

tweak_data.weapon.spas12.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.spas12.fire_mode_data.fire_rate = 0.18461538461538461538461538461538

tweak_data.weapon.spas12.damage_near = 600
tweak_data.weapon.spas12.damage_far = 2400

tweak_data.weapon.spas12.armor_piercing_chance = 0.2

tweak_data.weapon.spas12.rays = 8

tweak_data.weapon.spas12.CLIP_AMMO_MAX = 6
tweak_data.weapon.spas12.NR_CLIPS_MAX = 8
tweak_data.weapon.spas12.AMMO_MAX = tweak_data.weapon.spas12.CLIP_AMMO_MAX * tweak_data.weapon.spas12.NR_CLIPS_MAX

tweak_data.weapon.spas12.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.spas12.stats.damage = 30
tweak_data.weapon.spas12.stats.spread = 13
tweak_data.weapon.spas12.stats.recoil = 15
tweak_data.weapon.spas12.stats.suppression = 5



--[[     Benjamins M4    ]]--
tweak_data.weapon.benelli.spread.standing = 6
tweak_data.weapon.benelli.spread.crouching = tweak_data.weapon.benelli.spread.standing
tweak_data.weapon.benelli.spread.steelsight = tweak_data.weapon.benelli.spread.standing * 0.6
tweak_data.weapon.benelli.spread.moving_standing = tweak_data.weapon.benelli.spread.standing
tweak_data.weapon.benelli.spread.moving_crouching = tweak_data.weapon.benelli.spread.standing
tweak_data.weapon.benelli.spread.moving_steelsight = tweak_data.weapon.benelli.spread.standing * 0.75

tweak_data.weapon.benelli.kick.standing = {5.0, 4.5, -2.0, 2.0 }
tweak_data.weapon.benelli.kick.crouching = tweak_data.weapon.benelli.kick.standing
tweak_data.weapon.benelli.kick.steelsight = tweak_data.weapon.benelli.kick.standing

tweak_data.weapon.benelli.CLIP_AMMO_MAX = 5
tweak_data.weapon.benelli.AMMO_MAX = 60

tweak_data.weapon.benelli.damage_near = 400
tweak_data.weapon.benelli.damage_far = 3100

tweak_data.weapon.benelli.shake.fire_multiplier = 2
tweak_data.weapon.benelli.shake.fire_steelsight_multiplier = -2

tweak_data.weapon.benelli.armor_piercing_chance = 0.2

tweak_data.weapon.benelli.rays = 8

tweak_data.weapon.benelli.fire_mode_data.fire_rate = 0.13333333333333333333333333333333

tweak_data.weapon.benelli.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.benelli.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.benelli.stats.damage = 24
tweak_data.weapon.benelli.stats.spread = 14
tweak_data.weapon.benelli.stats.recoil = 9
tweak_data.weapon.benelli.stats.suppression = 6



--[[     Kel La Tec     ]]--
pivot_shoulder_translation = Vector3(10.8727, 25.2606, -2.09537)
pivot_shoulder_rotation = Rotation(0.248115, 0.354997, 0.892959)
pivot_head_translation = Vector3(9, 29, -3)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.ksg.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.ksg.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 27, -1)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.ksg.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.ksg.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

tweak_data.weapon.ksg.kick.standing = {5.0, 4.0, -5.0, 5.0 }
tweak_data.weapon.ksg.kick.crouching = tweak_data.weapon.ksg.kick.standing
tweak_data.weapon.ksg.kick.steelsight = tweak_data.weapon.ksg.kick.standing

tweak_data.weapon.ksg.fire_mode_data.fire_rate = 0.54545454545454545454545454545455

tweak_data.weapon.ksg.shake.fire_multiplier = 2.2
tweak_data.weapon.ksg.shake.fire_steelsight_multiplier = -2.2

tweak_data.weapon.ksg.damage_near = 1000
tweak_data.weapon.ksg.damage_far = 2800

tweak_data.weapon.ksg.armor_piercing_chance = 0.2

tweak_data.weapon.ksg.AMMO_MAX = 48

tweak_data.weapon.ksg.spread.standing = 6
tweak_data.weapon.ksg.spread.crouching = tweak_data.weapon.ksg.spread.standing
tweak_data.weapon.ksg.spread.steelsight = tweak_data.weapon.ksg.spread.standing * 0.55
tweak_data.weapon.ksg.spread.moving_standing = tweak_data.weapon.ksg.spread.standing
tweak_data.weapon.ksg.spread.moving_crouching = tweak_data.weapon.ksg.spread.standing
tweak_data.weapon.ksg.spread.moving_steelsight = tweak_data.weapon.ksg.spread.standing * 0.65

tweak_data.weapon.ksg.sounds.enter_steelsight = "secondary_steel_sight_enter"
tweak_data.weapon.ksg.sounds.leave_steelsight = "secondary_steel_sight_exit"

tweak_data.weapon.ksg.rays = 8

tweak_data.weapon.ksg.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.ksg.stats_modifiers = {
		damage = 2,
	}

tweak_data.weapon.ksg.stats.damage = 30
tweak_data.weapon.ksg.stats.spread = 14
tweak_data.weapon.ksg.stats.recoil = 11
tweak_data.weapon.ksg.stats.suppression = 5



--[[     Babby 870     ]]--
tweak_data.weapon.serbu.spread.standing = 6
tweak_data.weapon.serbu.spread.crouching = tweak_data.weapon.serbu.spread.standing
tweak_data.weapon.serbu.spread.steelsight = tweak_data.weapon.serbu.spread.standing * 0.7
tweak_data.weapon.serbu.spread.moving_standing = tweak_data.weapon.serbu.spread.standing
tweak_data.weapon.serbu.spread.moving_crouching = tweak_data.weapon.serbu.spread.standing
tweak_data.weapon.serbu.spread.moving_steelsight = tweak_data.weapon.serbu.spread.standing * 0.85

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

tweak_data.weapon.serbu.armor_piercing_chance = 0.2

tweak_data.weapon.serbu.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.serbu.stats_modifiers = {
		damage = 2,
	}	
	
tweak_data.weapon.serbu.stats.damage = 30
tweak_data.weapon.serbu.stats.spread = 7
tweak_data.weapon.serbu.stats.recoil = 5
tweak_data.weapon.serbu.stats.suppression = 6
	
pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
pivot_head_translation = Vector3(0,22,0)
pivot_head_rotation = Rotation(0,0,0)
tweak_data.player.stances.serbu.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.serbu.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Striker     ]]--
tweak_data.weapon.striker.kick.standing = {4.0, 3.0, -4.0, 4.0 }
tweak_data.weapon.striker.kick.crouching = tweak_data.weapon.striker.kick.standing
tweak_data.weapon.striker.kick.steelsight = tweak_data.weapon.striker.kick.standing

tweak_data.weapon.striker.spread.standing = 6
tweak_data.weapon.striker.spread.crouching = tweak_data.weapon.striker.spread.standing
tweak_data.weapon.striker.spread.steelsight = tweak_data.weapon.striker.spread.standing * 0.8
tweak_data.weapon.striker.spread.moving_standing = tweak_data.weapon.striker.spread.standing
tweak_data.weapon.striker.spread.moving_crouching = tweak_data.weapon.striker.spread.standing
tweak_data.weapon.striker.spread.moving_steelsight = tweak_data.weapon.striker.spread.standing * 0.95

tweak_data.weapon.striker.sounds.enter_steelsight = "secondary_steel_sight_enter"
tweak_data.weapon.striker.sounds.leave_steelsight = "secondary_steel_sight_exit"

tweak_data.upgrades.values.striker.reload_speed_multiplier = {0.85}

tweak_data.weapon.striker.shake.fire_multiplier = 1.5
tweak_data.weapon.striker.shake.fire_steelsight_multiplier = -1.5

tweak_data.weapon.striker.armor_piercing_chance = 0.2

tweak_data.weapon.striker.rays = 8

tweak_data.weapon.striker.AMMO_MAX = 72

tweak_data.weapon.striker.fire_mode_data.fire_rate = 0.15

tweak_data.weapon.striker.damage_near = 500
tweak_data.weapon.striker.damage_far = 2500

tweak_data.weapon.striker.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.striker.stats_modifiers = {
		damage = 2,
	}
	
tweak_data.weapon.striker.stats.damage = 20
tweak_data.weapon.striker.stats.spread = 13
tweak_data.weapon.striker.stats.recoil = 6
tweak_data.weapon.striker.stats.suppression = 5
	
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
--}


	
----------------------------------------------[[BRs]]----------------------------------------------
--{
--[[     EAG H     ]]--
tweak_data.weapon.scar.category = "snp"

tweak_data.weapon.scar.spread.standing = 5.5
tweak_data.weapon.scar.spread.crouching = 5
tweak_data.weapon.scar.spread.steelsight = 0.8
tweak_data.weapon.scar.spread.moving_standing = tweak_data.weapon.scar.spread.standing * 1.4
tweak_data.weapon.scar.spread.moving_crouching = tweak_data.weapon.scar.spread.crouching * 1.4
tweak_data.weapon.scar.spread.moving_steelsight = tweak_data.weapon.scar.spread.steelsight * 1.4

tweak_data.weapon.scar.kick.standing = {-0.45, 1.8, -1.9, 1.9 }
tweak_data.weapon.scar.kick.crouching = tweak_data.weapon.scar.kick.standing
tweak_data.weapon.scar.kick.steelsight = tweak_data.weapon.scar.kick.standing

tweak_data.weapon.scar.shake.fire_multiplier = 1.1
tweak_data.weapon.scar.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.scar.fire_mode_data.fire_rate = 0.096

tweak_data.weapon.scar.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.scar.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.scar.can_shoot_through_shield = true

tweak_data.weapon.scar.armor_piercing_chance = 0.85

tweak_data.weapon.scar.CLIP_AMMO_MAX = 20
tweak_data.weapon.scar.AMMO_MAX = 80

tweak_data.weapon.scar.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.scar.damage_near = 7 * 100
tweak_data.weapon.scar.damage_far = 100 * 100
tweak_data.weapon.scar.damage_min = 0.5

tweak_data.weapon.scar.stats.damage = 36
tweak_data.weapon.scar.stats.spread = 15
tweak_data.weapon.scar.stats.recoil = 14
tweak_data.weapon.scar.stats.suppression = 5

pivot_shoulder_translation = Vector3(10.7353, 23.0139, -1.43553)
pivot_shoulder_rotation = Rotation(0.106665, -0.0845104, 0.629231)
pivot_head_translation = Vector3(8, 26, -4)
pivot_head_rotation = Rotation(0.0, 0.0, -1)
tweak_data.player.stances.scar.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.scar.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6, 24, -2)
pivot_head_rotation = Rotation(0.0, 0.0, -2)
tweak_data.player.stances.scar.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.scar.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Jiisuri is mai raifu~     ]]--
tweak_data.weapon.g3.category = "snp"

tweak_data.weapon.g3.kick.standing = {1.75, 2.75, -1.75, 1.75 }
tweak_data.weapon.g3.kick.crouching = tweak_data.weapon.g3.kick.standing
tweak_data.weapon.g3.kick.steelsight = tweak_data.weapon.g3.kick.standing

tweak_data.weapon.g3.spread.standing = 5.75
tweak_data.weapon.g3.spread.crouching = 5.25
tweak_data.weapon.g3.spread.steelsight = 0.6
tweak_data.weapon.g3.spread.moving_standing = tweak_data.weapon.g3.spread.standing * 1.45
tweak_data.weapon.g3.spread.moving_crouching = tweak_data.weapon.g3.spread.crouching * 1.45
tweak_data.weapon.g3.spread.moving_steelsight = tweak_data.weapon.g3.spread.steelsight * 1.45

tweak_data.weapon.g3.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.g3.armor_piercing_chance = 0.85

tweak_data.weapon.g3.sounds.leave_steelsight = "primary_steel_sight_exit"
tweak_data.weapon.g3.sounds.enter_steelsight = "primary_steel_sight_enter"

tweak_data.weapon.g3.can_shoot_through_shield = true

tweak_data.weapon.g3.CLIP_AMMO_MAX = 20
tweak_data.weapon.g3.AMMO_MAX = 80

tweak_data.weapon.g3.shake.fire_multiplier = 1.1
tweak_data.weapon.g3.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.g3.fire_mode_data.fire_rate = 0.12

tweak_data.weapon.g3.timers.reload_not_empty = 2.5
tweak_data.weapon.g3.timers.reload_empty = 4

tweak_data.weapon.g3.damage_near = 12 * 100
tweak_data.weapon.g3.damage_far = 124 * 100
tweak_data.weapon.g3.damage_min = 0.5

tweak_data.weapon.g3.stats.damage = 36
tweak_data.weapon.g3.stats.spread = 15
tweak_data.weapon.g3.stats.recoil = 11
tweak_data.weapon.g3.stats.suppression = 5
	
pivot_shoulder_translation = Vector3(10.7158, 21.5452, -1.67945)
pivot_shoulder_rotation = Rotation(0.107438, -0.0837396, 0.629882)
pivot_head_translation = Vector3(0, 15, 0.2)
pivot_head_rotation = Rotation(0.0, 0.2, 0)
tweak_data.player.stances.g3.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g3.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(9, 26, -4)
pivot_head_rotation = Rotation(0.0, 0.2, -1)
tweak_data.player.stances.g3.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g3.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 24, -2)
pivot_head_rotation = Rotation(0.0, 0.2, -2)
tweak_data.player.stances.g3.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.g3.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Faru Nee-san     ]]--
tweak_data.weapon.fal.category = "snp"

tweak_data.weapon.fal.spread.standing = 5.75
tweak_data.weapon.fal.spread.crouching = 5.25
tweak_data.weapon.fal.spread.steelsight = 0.8
tweak_data.weapon.fal.spread.moving_standing = tweak_data.weapon.fal.spread.standing * 1.55
tweak_data.weapon.fal.spread.moving_crouching = tweak_data.weapon.fal.spread.crouching * 1.55
tweak_data.weapon.fal.spread.moving_steelsight = tweak_data.weapon.fal.spread.steelsight * 1.55

tweak_data.weapon.fal.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.fal.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.fal.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.fal.CLIP_AMMO_MAX = 20
tweak_data.weapon.fal.AMMO_MAX = 60

tweak_data.weapon.fal.can_shoot_through_shield = true

tweak_data.weapon.fal.armor_piercing_chance = 0.85

tweak_data.weapon.fal.shake.fire_multiplier = 0.95
tweak_data.weapon.fal.shake.fire_steelsight_multiplier = -0.95

tweak_data.weapon.fal.kick.standing = {-0.45, 1.0, -2.1, 2.1}
tweak_data.weapon.fal.kick.crouching = tweak_data.weapon.fal.kick.standing
tweak_data.weapon.fal.kick.steelsight = tweak_data.weapon.fal.kick.standing

tweak_data.weapon.fal.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.fal.damage_near = 15 * 100
tweak_data.weapon.fal.damage_far = 100 * 100
tweak_data.weapon.fal.damage_min = 0.5

tweak_data.weapon.fal.stats.damage = 48
tweak_data.weapon.fal.stats.spread = 11
tweak_data.weapon.fal.stats.recoil = 13
tweak_data.weapon.fal.stats.suppression = 3

pivot_shoulder_translation = Vector3(10.6889, 30.1129, -4.31372)
pivot_shoulder_rotation = Rotation(0.106623, -0.0844514, 0.629209)
pivot_head_translation = Vector3(9, 34, -6)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.fal.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.fal.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(7, 32, -4)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.fal.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.fal.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Galil-chan     ]]--
tweak_data.weapon.galil.category = "snp"

tweak_data.weapon.galil.kick.standing = {-1.0, 1.55, -1.45, 1.45 }
tweak_data.weapon.galil.kick.crouching = tweak_data.weapon.galil.kick.standing
tweak_data.weapon.galil.kick.steelsight = tweak_data.weapon.galil.kick.standing

tweak_data.weapon.galil.spread.standing = 6.25
tweak_data.weapon.galil.spread.crouching = 5.75
tweak_data.weapon.galil.spread.steelsight = 0.7
tweak_data.weapon.galil.spread.moving_standing = tweak_data.weapon.galil.spread.standing * 1.5
tweak_data.weapon.galil.spread.moving_crouching = tweak_data.weapon.galil.spread.crouching * 1.5
tweak_data.weapon.galil.spread.moving_steelsight = tweak_data.weapon.galil.spread.steelsight * 1.5

tweak_data.weapon.galil.fire_mode_data.fire_rate = 0.08571428571428571428571428571429

tweak_data.weapon.galil.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.galil.armor_piercing_chance = 0.8

tweak_data.weapon.galil.sounds.leave_steelsight = "primary_steel_sight_exit"
tweak_data.weapon.galil.sounds.enter_steelsight = "primary_steel_sight_enter"

tweak_data.weapon.galil.can_shoot_through_shield = true

tweak_data.weapon.galil.CLIP_AMMO_MAX = 25
tweak_data.weapon.galil.AMMO_MAX = 75

tweak_data.weapon.galil.shake.fire_multiplier = 0.9
tweak_data.weapon.galil.shake.fire_steelsight_multiplier = -0.9

tweak_data.weapon.galil.damage_near = 18 * 100
tweak_data.weapon.galil.damage_far = 87 * 100
tweak_data.weapon.galil.damage_min = 0.5

tweak_data.weapon.galil.stats.damage = 48
tweak_data.weapon.galil.stats.spread = 13
tweak_data.weapon.galil.stats.recoil = 12
tweak_data.weapon.galil.stats.suppression = 4
	
pivot_shoulder_translation = Vector3(10.7344, 22.1028, -3.71493)
pivot_shoulder_rotation = Rotation(0.107212, -0.0843867, 0.629332)
pivot_head_translation = Vector3(0, 15, 0)
pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.galil.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.galil.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(8, 23, -3)
pivot_head_rotation = Rotation(0, 0, -1)
tweak_data.player.stances.galil.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.galil.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(6, 21,-1)
pivot_head_rotation = Rotation(0, 0, -2)
tweak_data.player.stances.galil.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.galil.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Puns     ]]--
pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
pivot_head_translation = Vector3(11,14,-4)
pivot_head_rotation = Rotation(0,0,-1)
tweak_data.player.stances.new_m14.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.new_m14.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3(9,12,-2)
pivot_head_rotation = Rotation(0,0,-2)
tweak_data.player.stances.new_m14.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
tweak_data.player.stances.new_m14.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
tweak_data.weapon.new_m14.category = "snp"

tweak_data.weapon.new_m14.spread.standing = 6.5
tweak_data.weapon.new_m14.spread.crouching = 6
tweak_data.weapon.new_m14.spread.steelsight = 0.35
tweak_data.weapon.new_m14.spread.moving_standing = tweak_data.weapon.new_m14.spread.standing * 1.6
tweak_data.weapon.new_m14.spread.moving_crouching = tweak_data.weapon.new_m14.spread.crouching * 1.6
tweak_data.weapon.new_m14.spread.moving_steelsight = tweak_data.weapon.new_m14.spread.steelsight * 1.6

tweak_data.weapon.new_m14.kick.standing = {2.25, 3.25, -1.5, 1.5 }
tweak_data.weapon.new_m14.kick.crouching = tweak_data.weapon.new_m14.kick.standing
tweak_data.weapon.new_m14.kick.steelsight = tweak_data.weapon.new_m14.kick.standing

tweak_data.weapon.new_m14.shake.fire_multiplier = 1.25
tweak_data.weapon.new_m14.shake.fire_steelsight_multiplier = -1.25

tweak_data.weapon.new_m14.fire_mode_data.fire_rate = 0.0857142857142857

tweak_data.weapon.new_m14.CLIP_AMMO_MAX = 20
tweak_data.weapon.new_m14.NR_CLIPS_MAX = 3
tweak_data.weapon.new_m14.AMMO_MAX = tweak_data.weapon.new_m14.CLIP_AMMO_MAX * tweak_data.weapon.new_m14.NR_CLIPS_MAX

tweak_data.weapon.new_m14.can_shoot_through_shield = true

tweak_data.weapon.new_m14.armor_piercing_chance = 0.85

tweak_data.weapon.new_m14.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.new_m14.damage_near = 22 * 100
tweak_data.weapon.new_m14.damage_far = 117 * 100
tweak_data.weapon.new_m14.damage_min = 0.5

tweak_data.weapon.new_m14.stats.damage = 48
tweak_data.weapon.new_m14.stats.spread = 17
tweak_data.weapon.new_m14.stats.recoil = 8
tweak_data.weapon.new_m14.stats.suppression = 3
--}	
	
	
	
--[[LMGS]]
--{
--[[     M@$(     ]]--
tweak_data.weapon.m249.kick.standing = { 1.60, -0.85, -1.90, 1.90 }
tweak_data.weapon.m249.kick.crouching = tweak_data.weapon.m249.kick.standing
tweak_data.weapon.m249.kick.steelsight = tweak_data.weapon.m249.kick.standing

tweak_data.weapon.m249.spread.standing = 6
tweak_data.weapon.m249.spread.crouching = 5.5
tweak_data.weapon.m249.spread.steelsight = 1.5
tweak_data.weapon.m249.spread.moving_standing = tweak_data.weapon.m249.spread.standing * 2.4
tweak_data.weapon.m249.spread.moving_crouching = tweak_data.weapon.m249.spread.crouching * 2.4
tweak_data.weapon.m249.spread.moving_steelsight = tweak_data.weapon.m249.spread.steelsight * 2.4

tweak_data.weapon.m249.CLIP_AMMO_MAX = 200
tweak_data.weapon.m249.AMMO_MAX = 400

tweak_data.weapon.m249.fire_mode_data.fire_rate = 0.0631578

tweak_data.weapon.m249.shake.fire_multiplier = 0.8
tweak_data.weapon.m249.shake.fire_steelsight_multiplier = -0.8

tweak_data.weapon.m249.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"

tweak_data.weapon.m249.armor_piercing_chance = 0.175

tweak_data.weapon.m249.damage_near = 7 * 100
tweak_data.weapon.m249.damage_far = 227 * 100
tweak_data.weapon.m249.damage_min = 0.7

tweak_data.weapon.m249.stats.damage = 18
tweak_data.weapon.m249.stats.spread = 11
tweak_data.weapon.m249.stats.recoil = 21
tweak_data.weapon.m249.stats.suppression = 2
	
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



--[[     Longcat     ]]--
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
tweak_data.weapon.rpk.spread.steelsight = 1.3
tweak_data.weapon.rpk.spread.moving_standing = tweak_data.weapon.rpk.spread.standing * 2
tweak_data.weapon.rpk.spread.moving_crouching = tweak_data.weapon.rpk.spread.crouching * 2
tweak_data.weapon.rpk.spread.moving_steelsight = tweak_data.weapon.rpk.spread.steelsight * 2

tweak_data.weapon.rpk.fire_mode_data.fire_rate = 0.1

tweak_data.weapon.rpk.shake.fire_multiplier = 1
tweak_data.weapon.rpk.shake.fire_steelsight_multiplier = -1

tweak_data.weapon.rpk.armor_piercing_chance = 0.35

tweak_data.weapon.rpk.damage_near = 14 * 100
tweak_data.weapon.rpk.damage_far = 166 * 100
tweak_data.weapon.rpk.damage_min = 0.6

tweak_data.weapon.rpk.stats.damage = 25 
tweak_data.weapon.rpk.stats.spread = 11
tweak_data.weapon.rpk.stats.recoil = 19
tweak_data.weapon.rpk.stats.suppression = 5

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



--[[     Realated to mai raifu     ]]--
tweak_data.weapon.hk21.kick.standing = {1.90, -1.15, -1.95, 1.95 }
tweak_data.weapon.hk21.kick.crouching = tweak_data.weapon.hk21.kick.standing
tweak_data.weapon.hk21.kick.steelsight = tweak_data.weapon.hk21.kick.standing

tweak_data.weapon.hk21.fire_mode_data.fire_rate = 0.075

tweak_data.weapon.hk21.spread.standing = 6.5
tweak_data.weapon.hk21.spread.crouching = 6
tweak_data.weapon.hk21.spread.steelsight = 1.10
tweak_data.weapon.hk21.spread.moving_standing = tweak_data.weapon.hk21.spread.standing * 2.6
tweak_data.weapon.hk21.spread.moving_crouching = tweak_data.weapon.hk21.spread.crouching * 2.6
tweak_data.weapon.hk21.spread.moving_steelsight = tweak_data.weapon.hk21.spread.steelsight * 2.6

tweak_data.weapon.hk21.CLIP_AMMO_MAX = 100
tweak_data.weapon.hk21.NR_CLIPS_MAX = 2
tweak_data.weapon.hk21.AMMO_MAX = tweak_data.weapon.hk21.CLIP_AMMO_MAX * tweak_data.weapon.hk21.NR_CLIPS_MAX

tweak_data.weapon.hk21.shake.fire_multiplier = 1.0
tweak_data.weapon.hk21.shake.fire_steelsight_multiplier = -1.0

tweak_data.weapon.hk21.can_shoot_through_shield = true

tweak_data.weapon.hk21.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.hk21.armor_piercing_chance = 0.6

tweak_data.weapon.hk21.damage_near = 16 * 100
tweak_data.weapon.hk21.damage_far = 142 * 100
tweak_data.weapon.hk21.damage_min = 0.5

tweak_data.weapon.hk21.stats.damage = 36
tweak_data.weapon.hk21.stats.spread = 13
tweak_data.weapon.hk21.stats.recoil = 15
tweak_data.weapon.hk21.stats.suppression = 4
	
--Thanks to gir489 for the LMG ironsights codes
pivot_shoulder_translation = Vector3( 11.3874, 18.55, -2.08902 )
pivot_shoulder_rotation = Rotation( 3.03061, 1.08595, 1.87441 )
pivot_head_translation = Vector3( 0.98, 15, 0.15 )
pivot_head_rotation = Rotation( -2.98, -0.9, -2 )
tweak_data.player.stances.hk21.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.hk21.steelsight.shoulders.rotation = pivot_head_rotation

pivot_head_translation = Vector3( 10, 18, -7 )
pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
tweak_data.player.stances.hk21.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.hk21.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 8, 16, -5 )
pivot_head_rotation = Rotation( 0.2, 0.5, -2 )
tweak_data.player.stances.hk21.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.hk21.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     Kerberos (kinda)     ]]--
tweak_data.weapon.mg42.kick.standing = {1.0, -0.50, -1.2, 1.2 }
tweak_data.weapon.mg42.kick.crouching = tweak_data.weapon.mg42.kick.standing
tweak_data.weapon.mg42.kick.steelsight = {1.70, -0.10, -1.1, 1.1 }

tweak_data.weapon.mg42.spread.standing = 7
tweak_data.weapon.mg42.spread.crouching = 6.5
tweak_data.weapon.mg42.spread.steelsight = 1.175
tweak_data.weapon.mg42.spread.moving_standing = tweak_data.weapon.mg42.spread.standing * 1.5
tweak_data.weapon.mg42.spread.moving_crouching = tweak_data.weapon.mg42.spread.crouching * 1.5
tweak_data.weapon.mg42.spread.moving_steelsight = tweak_data.weapon.mg42.spread.steelsight * 1.5

tweak_data.weapon.mg42.fire_mode_data.fire_rate = 0.05

tweak_data.weapon.mg42.CLIP_AMMO_MAX = 50
tweak_data.weapon.mg42.NR_CLIPS_MAX = 3
tweak_data.weapon.mg42.AMMO_MAX = tweak_data.weapon.mg42.CLIP_AMMO_MAX * tweak_data.weapon.mg42.NR_CLIPS_MAX

tweak_data.weapon.mg42.shake.fire_multiplier = 1.1
tweak_data.weapon.mg42.shake.fire_steelsight_multiplier = -1.1

tweak_data.weapon.mg42.can_shoot_through_shield = true

tweak_data.weapon.mg42.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.mg42.armor_piercing_chance = 0.5

tweak_data.weapon.mg42.damage_near = 9 * 100
tweak_data.weapon.mg42.damage_far = 109 * 100
tweak_data.weapon.mg42.damage_min = 0.3

tweak_data.weapon.mg42.stats.damage = 48
tweak_data.weapon.mg42.stats.spread = 14
tweak_data.weapon.mg42.stats.recoil = 15
tweak_data.weapon.mg42.stats.suppression = 0
	
pivot_shoulder_translation = Vector3( 10.7806, 4.38612, 0 )
pivot_shoulder_rotation = Rotation( 0.106596, -0.0844502, 0.629187 )
pivot_head_translation = Vector3( 0.02, 0.7, -0.8 )
pivot_head_rotation = Rotation( -0.12, 0.2, -0 )
tweak_data.player.stances.mg42.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mg42.steelsight.shoulders.rotation = pivot_head_rotation

pivot_head_translation = Vector3( 11, 12, -8 )
pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
tweak_data.player.stances.mg42.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mg42.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 9, 10, -6 )
pivot_head_rotation = Rotation( 0.2, 0.5, -2)
tweak_data.player.stances.mg42.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mg42.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
--}


--[[Snipers (GET NO SCOOOOOOOOPED]]	
--{
--[[     (P)MSR     ]]--
tweak_data.weapon.msr.spread.standing = 4
tweak_data.weapon.msr.spread.crouching = tweak_data.weapon.msr.spread.standing
tweak_data.weapon.msr.spread.steelsight = 0.06
tweak_data.weapon.msr.spread.moving_standing = tweak_data.weapon.msr.spread.standing * 1.9
tweak_data.weapon.msr.spread.moving_crouching = tweak_data.weapon.msr.spread.standing * 1.9
tweak_data.weapon.msr.spread.moving_steelsight = tweak_data.weapon.msr.spread.standing * 0.5

tweak_data.weapon.msr.fire_mode_data.fire_rate = 0.85714285714285714285714285714286

tweak_data.weapon.msr.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.msr.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.msr.timers.reload_not_empty = 2.55

tweak_data.weapon.msr.CLIP_AMMO_MAX = 10
tweak_data.weapon.msr.NR_CLIPS_MAX = 5
tweak_data.weapon.msr.AMMO_MAX = tweak_data.weapon.msr.CLIP_AMMO_MAX * tweak_data.weapon.msr.NR_CLIPS_MAX

tweak_data.weapon.msr.kick.standing = {5.3, 6.3, -3.75, 3.75 }
tweak_data.weapon.msr.kick.crouching = tweak_data.weapon.msr.kick.standing
tweak_data.weapon.msr.kick.steelsight = tweak_data.weapon.msr.kick.standing

tweak_data.weapon.msr.shake.fire_multiplier = 4
tweak_data.weapon.msr.shake.fire_steelsight_multiplier = -4

tweak_data.weapon.msr.damage_near = 20 * 100
tweak_data.weapon.msr.damage_far = 580 * 100
tweak_data.weapon.msr.damage_min = 0.6

tweak_data.weapon.msr.stats_modifiers = { 
		damage = 6, 
		suppression = 3
		}
		
tweak_data.weapon.msr.stats.damage = 10
tweak_data.weapon.msr.stats.spread = 17
tweak_data.weapon.msr.stats.recoil = 11
tweak_data.weapon.msr.stats.suppression = 6
	
pivot_shoulder_translation = Vector3( 10.7223, 44.8494, -2.19714 )
pivot_shoulder_rotation = Rotation( 0.106634, -0.0844042, 0.629169 )
pivot_head_translation = Vector3( -0.0, 22, -3 )
pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.msr.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.msr.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 9, 46, -5 )
pivot_head_rotation = Rotation( 0, 0, -1 )
tweak_data.player.stances.msr.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.msr.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 7, 44, -3 )
pivot_head_rotation = Rotation( 0, 0, -2 )
tweak_data.player.stances.msr.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.msr.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     MOIST NUGGET     ]]--
tweak_data.weapon.mosin.spread.standing = 5
tweak_data.weapon.mosin.spread.crouching = tweak_data.weapon.mosin.spread.standing
tweak_data.weapon.mosin.spread.steelsight = 0.08
tweak_data.weapon.mosin.spread.moving_standing = tweak_data.weapon.mosin.spread.standing * 1.9
tweak_data.weapon.mosin.spread.moving_crouching = tweak_data.weapon.mosin.spread.standing * 1.9
tweak_data.weapon.mosin.spread.moving_steelsight = tweak_data.weapon.mosin.spread.standing * 0.5

tweak_data.weapon.mosin.fire_mode_data.fire_rate = 1

tweak_data.weapon.mosin.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.mosin.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.mosin.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"

tweak_data.weapon.mosin.CLIP_AMMO_MAX = 5
tweak_data.weapon.mosin.NR_CLIPS_MAX = 8
tweak_data.weapon.mosin.AMMO_MAX = tweak_data.weapon.mosin.CLIP_AMMO_MAX * tweak_data.weapon.mosin.NR_CLIPS_MAX

tweak_data.weapon.mosin.kick.standing = {5.9, 6.9, -2.9, 2.9 }
tweak_data.weapon.mosin.kick.crouching = tweak_data.weapon.mosin.kick.standing
tweak_data.weapon.mosin.kick.steelsight = tweak_data.weapon.mosin.kick.standing

tweak_data.weapon.mosin.shake.fire_multiplier = 4
tweak_data.weapon.mosin.shake.fire_steelsight_multiplier = -4

tweak_data.weapon.mosin.damage_near = 33 * 100
tweak_data.weapon.mosin.damage_far = 767 * 100
tweak_data.weapon.mosin.damage_min = 0.7

tweak_data.weapon.mosin.stats_modifiers = { 
		damage = 6, 
		suppression = 3
		}

tweak_data.weapon.mosin.stats.damage = 16
tweak_data.weapon.mosin.stats.spread = 18
tweak_data.weapon.mosin.stats.recoil = 9
tweak_data.weapon.mosin.stats.suppression = 5
	
pivot_shoulder_translation = Vector3( 12.9429, 21.4699, -2.48515 )
pivot_shoulder_rotation = Rotation( 0.113195, 0.518822, 0.628052 )
pivot_head_translation = Vector3( 14, 22, -3 )
pivot_head_rotation = Rotation( 0, 0, -1 )
tweak_data.player.stances.mosin.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mosin.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 12, 20, -1 )
pivot_head_rotation = Rotation( 0, 0, -2 )
tweak_data.player.stances.mosin.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.mosin.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()



--[[     R93     ]]--
tweak_data.weapon.r93.spread.standing = 6
tweak_data.weapon.r93.spread.crouching = tweak_data.weapon.r93.spread.standing
tweak_data.weapon.r93.spread.steelsight = 0.05
tweak_data.weapon.r93.spread.moving_standing = tweak_data.weapon.r93.spread.standing * 1.9
tweak_data.weapon.r93.spread.moving_crouching = tweak_data.weapon.r93.spread.standing * 1.9
tweak_data.weapon.r93.spread.moving_steelsight = tweak_data.weapon.r93.spread.standing * 0.5

tweak_data.weapon.r93.fire_mode_data.fire_rate = 1.2

tweak_data.weapon.r93.sounds.enter_steelsight = "primary_steel_sight_enter"
tweak_data.weapon.r93.sounds.leave_steelsight = "primary_steel_sight_exit"

tweak_data.weapon.r93.kick.standing = {7.2, 8.2, -3.75, 3.75 }
tweak_data.weapon.r93.kick.crouching = tweak_data.weapon.r93.kick.standing
tweak_data.weapon.r93.kick.steelsight = tweak_data.weapon.r93.kick.standing

tweak_data.weapon.r93.CLIP_AMMO_MAX = 6
tweak_data.weapon.r93.NR_CLIPS_MAX = 5
tweak_data.weapon.r93.AMMO_MAX = tweak_data.weapon.r93.CLIP_AMMO_MAX * tweak_data.weapon.r93.NR_CLIPS_MAX

tweak_data.weapon.r93.shake.fire_multiplier = 4
tweak_data.weapon.r93.shake.fire_steelsight_multiplier = -4

tweak_data.weapon.r93.damage_near = 45 * 100
tweak_data.weapon.r93.damage_far = 1500 * 100
tweak_data.weapon.r93.damage_min = 0.8

tweak_data.weapon.r93.stats_modifiers = {
		damage = 2,
		suppression = 3,
	}

tweak_data.weapon.r93.stats.damage = 64
tweak_data.weapon.r93.stats.spread = 19
tweak_data.weapon.r93.stats.recoil = 7
tweak_data.weapon.r93.stats.suppression = 4

pivot_shoulder_translation = Vector3( 10.6978, 45.3183, -4.51382 )
pivot_shoulder_rotation = Rotation( 0.107839, -0.0834037, 0.628987 )
pivot_head_translation = Vector3( -0.01, 25, -3.2 )
pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.r93.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r93.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 9, 47, -3 )
pivot_head_rotation = Rotation( 0, 0, -1 )
tweak_data.player.stances.r93.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r93.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 6, 45, -0 )
pivot_head_rotation = Rotation( 0, 0, -2 )
tweak_data.player.stances.r93.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.r93.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	

--[[     SHITTER BAIT     ]]--
tweak_data.weapon.m95.spread.standing = 10
tweak_data.weapon.m95.spread.crouching = tweak_data.weapon.m95.spread.standing
tweak_data.weapon.m95.spread.steelsight = 0.075
tweak_data.weapon.m95.spread.moving_standing = tweak_data.weapon.m95.spread.standing * 2.4
tweak_data.weapon.m95.spread.moving_crouching = tweak_data.weapon.m95.spread.standing * 2.4
tweak_data.weapon.m95.spread.moving_steelsight = tweak_data.weapon.m95.spread.standing * 0.5

tweak_data.weapon.m95.kick.standing = {12, 9.5, -1.9, 10 }
tweak_data.weapon.m95.kick.crouching = tweak_data.weapon.m95.kick.standing
tweak_data.weapon.m95.kick.steelsight = tweak_data.weapon.m95.kick.standing

tweak_data.weapon.m95.sounds.enter_steelsight = "lmg_steelsight_enter"
tweak_data.weapon.m95.sounds.leave_steelsight = "lmg_steelsight_exit"

tweak_data.weapon.m95.fire_mode_data.fire_rate = 1.5

tweak_data.weapon.m95.shake.fire_multiplier = 5
tweak_data.weapon.m95.shake.fire_steelsight_multiplier = -4.5

tweak_data.weapon.m95.ignore_damage_upgrades = true

tweak_data.weapon.m95.damage_near = 50 * 100
tweak_data.weapon.m95.damage_far = 1700 * 100
tweak_data.weapon.m95.damage_min = 0.75

tweak_data.weapon.m95.stats_modifiers = {
		damage = 12,
		suppression = 5,
	}

tweak_data.weapon.m95.stats.damage = 96
tweak_data.weapon.m95.stats.spread = 18
tweak_data.weapon.m95.stats.recoil = 1
tweak_data.weapon.m95.stats.suppression = 2

pivot_shoulder_translation = Vector3( 12.9429, 21.4699, -2.48515 )
pivot_shoulder_rotation = Rotation( 0.113195, 0.518822, 0.628052 )
pivot_head_translation = Vector3( -0.01, 25, -1.5 )
pivot_head_rotation = Rotation( 0, 0, 0 )
tweak_data.player.stances.m95.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m95.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 10, 30, -6 )
pivot_head_rotation = Rotation( 0, 0, -1 )
tweak_data.player.stances.m95.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m95.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

pivot_head_translation = Vector3( 8, 28, -4 )
pivot_head_rotation = Rotation( 0, 0, -2 )
tweak_data.player.stances.m95.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.m95.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
--}


--[[ MELEE ]]--
--{
--Buttstock Melee
tweak_data.blackmarket.melee_weapons.weapon.repeat_expire_t = 0.5
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
tweak_data.blackmarket.melee_weapons.brass_knuckles.repeat_expire_t = 0.35
tweak_data.blackmarket.melee_weapons.brass_knuckles.expire_t = 1
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.range = 125
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.min_damage = 1.5
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.max_damage = 3
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.min_damage_effect = 4
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.max_damage_effect = 4
tweak_data.blackmarket.melee_weapons.brass_knuckles.stats.charge_time = 0.5
tweak_data.blackmarket.melee_weapons.brass_knuckles.anim_attack_vars = { "var1", "var4" } --ditto
tweak_data.blackmarket.melee_weapons.brass_knuckles.sounds.charge = "fist_equip"
--Gloves
tweak_data.blackmarket.melee_weapons.boxing_gloves.repeat_expire_t = 0.42
tweak_data.blackmarket.melee_weapons.boxing_gloves.stats.min_damage = 1.8
tweak_data.blackmarket.melee_weapons.boxing_gloves.stats.max_damage = 3.6
tweak_data.blackmarket.melee_weapons.boxing_gloves.stats.min_damage_effect = 4
tweak_data.blackmarket.melee_weapons.boxing_gloves.stats.max_damage_effect = 4

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
tweak_data.blackmarket.melee_weapons.fairbair.repeat_expire_t = 0.45
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
tweak_data.blackmarket.melee_weapons.bullseye.stats.range = 185
tweak_data.blackmarket.melee_weapons.bullseye.repeat_expire_t = 0.6
tweak_data.blackmarket.melee_weapons.bullseye.expire_t = 1.125
tweak_data.blackmarket.melee_weapons.bullseye.stats.min_damage = 4
tweak_data.blackmarket.melee_weapons.bullseye.stats.max_damage = 8
tweak_data.blackmarket.melee_weapons.bullseye.stats.min_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.bullseye.stats.max_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.bullseye.stats.charge_time = 1.1
tweak_data.blackmarket.melee_weapons.bullseye.type = "knife" --"axe" doesn't let you hurt dozers
tweak_data.blackmarket.melee_weapons.bullseye.anim_global_param = "melee_knife2" --Normal axe animation clips through your head
tweak_data.blackmarket.melee_weapons.bullseye.align_objects = {"a_weapon_left"}
--Cleaver
tweak_data.blackmarket.melee_weapons.cleaver.stats.range = 160
tweak_data.blackmarket.melee_weapons.cleaver.repeat_expire_t = 0.675
tweak_data.blackmarket.melee_weapons.cleaver.stats.charge_time = 1.3
tweak_data.blackmarket.melee_weapons.cleaver.expire_t = 1.25
tweak_data.blackmarket.melee_weapons.cleaver.stats.min_damage = 6
tweak_data.blackmarket.melee_weapons.cleaver.stats.max_damage = 12
tweak_data.blackmarket.melee_weapons.cleaver.stats.min_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.cleaver.stats.max_damage_effect = 1.2
tweak_data.blackmarket.melee_weapons.cleaver.type = "knife"
--Rerr's Cleaver
tweak_data.blackmarket.melee_weapons.meat_cleaver.stats.range = 175
tweak_data.blackmarket.melee_weapons.meat_cleaver.repeat_expire_t = 0.625
tweak_data.blackmarket.melee_weapons.meat_cleaver.stats.charge_time = 1.2
tweak_data.blackmarket.melee_weapons.meat_cleaver.expire_t = 1.175
tweak_data.blackmarket.melee_weapons.meat_cleaver.stats.min_damage = 4.5
tweak_data.blackmarket.melee_weapons.meat_cleaver.stats.max_damage = 9
tweak_data.blackmarket.melee_weapons.meat_cleaver.stats.min_damage_effect = 0.8
tweak_data.blackmarket.melee_weapons.meat_cleaver.stats.max_damage_effect = 0.8
tweak_data.blackmarket.melee_weapons.meat_cleaver.type = "knife"
tweak_data.blackmarket.melee_weapons.meat_cleaver.anim_global_param = "melee_cleaver"
tweak_data.blackmarket.melee_weapons.meat_cleaver.align_objects = {"a_weapon_left"}
--Tomahawk
tweak_data.blackmarket.melee_weapons.tomahawk.stats.range = 225
tweak_data.blackmarket.melee_weapons.tomahawk.repeat_expire_t = 0.65
tweak_data.blackmarket.melee_weapons.tomahawk.expire_t = 1.3
tweak_data.blackmarket.melee_weapons.tomahawk.stats.min_damage = 8
tweak_data.blackmarket.melee_weapons.tomahawk.stats.max_damage = 16
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
--Clover's club thing
--I'm actually okay with how they handled this
tweak_data.blackmarket.melee_weapons.shillelagh.type = "axe"
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
--}

RebalanceScript = true
if not DMCWO.rebalance_wep then
	DMCWO.rebalance_wep = true
	if DMCWO.Setup_Stfu ~= true then
		io.stdout:write("is working!", "\n")
	end
	if not RebalanceScript then
		io.stdout:write("[!] You left RebalanceScript commented out (or nil), you may experience FPS drops", "\n")
	end
	AddPersistScript("RebalanceAtchScript", "lib/Lua/DMCWO/rebalance_attach.lua")
end

end