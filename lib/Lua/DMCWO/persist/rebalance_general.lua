--[[
v1.41
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if DMCWO and not RebalanceGen then
 
if not tweak_data then return end
if DMCWO.Setup_Stfu ~= true then
	if not stfu_gen then
		stfu_gen = true
		io.stdout:write("\n[DMCWO] rebalance_general.lua...")
	end
end
 
--[[ INDEX TABLE TWEAKS ]]
 
--fixes the extra_ammo index so rounds can be added one by one instead of the default increments of two
tweak_data.weapon.stats.extra_ammo = {} --empties the original table
for i = -100, 100, 1 do
	table.insert( tweak_data.weapon.stats.extra_ammo, i )
end

--fixes the total_ammo_mod index so I can adjust in smaller increments
tweak_data.weapon.stats.total_ammo_mod = {}
for i = -100, 100, 1 do
	table.insert(tweak_data.weapon.stats.total_ammo_mod, i / 200)
end

--alters the first level of zoom to not zoom at all (if at lowest FOV slider setting)
tweak_data.weapon.stats.zoom = { 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 18 }

--alters the damage index to be more fucking consistent in the higher levels
tweak_data.weapon.stats.damage = {} --empties original table
for i = 0.25, 40, 0.25 do
	table.insert( tweak_data.weapon.stats.damage, i )
end
--[[
Drawn out the table would look like this:

tweak_data.weapon.stats.damage = {
	0.25,
	0.5,
	0.75,
	1.0,
	1.25,
	1.5,
	...

And so on

0.25 = 2.5 damage in game
]]

--alters the stability/recoil index to get rid of the duplicate entry and make more fine adjustments (doing a for loop left me with rounding errors)
--also recreating the accuracy table (doing a for loop left me with rounding errors)
--The contained values are multiplied wih w/e the weapon's spread/kick value is
local kick_n_spread = {'recoil','spread'}
for i, stat_id in ipairs(kick_n_spread) do

	tweak_data.weapon.stats[stat_id] = {
	10,
	9.9,9.8,9.7,9.6,9.5,9.4,9.3,9.2,9.1,9.0,
	8.9,8.8,8.7,8.6,8.5,8.4,8.3,8.2,8.1,8.0,
	7.9,7.8,7.7,7.6,7.5,7.4,7.3,7.2,7.1,7.0,
	6.9,6.8,6.7,6.6,6.5,6.4,6.3,6.2,6.1,6.0,
	5.9,5.8,5.7,5.6,5.5,5.4,5.3,5.2,5.1,5.0,
	4.9,4.8,4.7,4.6,4.5,4.4,4.3,4.2,4.1,4.0,
	3.9,3.8,3.7,3.6,3.5,3.4,3.3,3.2,3.1,3.0,
	2.9,2.8,2.7,2.6,2.5,2.4,2.3,2.2,2.1,2.0,
	1.9,1.8,1.7,1.6,1.5,1.4,1.3,1.2,1.1,1.0,
	0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1 --,0.0
}
	
end

---Gunslinger adjustments
tweak_data.upgrades.skill_descs.gun_fighter.multipro = "10"
tweak_data.upgrades.values.pistol.damage_addend = {1.0}
tweak_data.upgrades.values.akimbo.damage_addend = {1.0}

--"Silent Killer" adjustments
tweak_data.upgrades.values.weapon.silencer_damage_multiplier = { 1.125, 1.25}	--BASIC, ACE
tweak_data.upgrades.skill_descs.hitman.multibasic = "12.5%"
tweak_data.upgrades.skill_descs.hitman.multipro = "25%"

--"The Professional" adjustments
tweak_data.upgrades.values.weapon.silencer_recoil_multiplier = {0.90}
tweak_data.upgrades.values.weapon.silencer_spread_multiplier = {0.85}
tweak_data.upgrades.values.weapon.silencer_enter_steelsight_speed_multiplier = {1.25}
tweak_data.upgrades.skill_descs.silence_expert.multibasic = "10%"
tweak_data.upgrades.skill_descs.silence_expert.multipro = "15%"
tweak_data.upgrades.skill_descs.silence_expert.multipro2 = "25%"

--"Mag Plus" adjustments
tweak_data.upgrades.values.weapon.clip_ammo_increase = { 10, 20 }
tweak_data.upgrades.skill_descs.mag_plus.multibasic = "10"
tweak_data.upgrades.skill_descs.mag_plus.multipro = "10"

--"Shotgun Impact" adjustments
tweak_data.upgrades.values.shotgun.recoil_multiplier = { 0.90  }
tweak_data.upgrades.values.shotgun.damage_multiplier = { 1.25 }
tweak_data.upgrades.skill_descs.shotgun_impact.multibasic = "10%"
tweak_data.upgrades.skill_descs.shotgun_impact.multipro = "25%"

tweak_data.upgrades.values.team.pistol.recoil_multiplier = {0.90}
tweak_data.upgrades.values.team.weapon.recoil_multiplier = {0.90}
tweak_data.upgrades.skill_descs.leadership.multibasic = "10%"
tweak_data.upgrades.skill_descs.leadership.multipro = "10%"

tweak_data.upgrades.values.snp.recoil_multiplier = {0.90}
tweak_data.upgrades.values.assault_rifle.recoil_multiplier = {0.90}
tweak_data.upgrades.skill_descs.sharpshooter.multipro = "10%"

--Akimbo recoil penalty adjustments so they actually are the +75/50/25% increase in recoil, matching the descriptions, and not 150/100/50% that they were coded to have
tweak_data.upgrades.values.akimbo.recoil_multiplier = {
		1.75, --Third card
		1.5, --Last card, Basic skill
		1.25 --Aced skill
	}
	
--[[ Viewmodel "Sway" and Drag ]]	

--ADS "sway" and pivot point for all weapons
local gun_drag = {'default','new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','r870','huntsman','benelli','ksg','serbu','striker','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','judge','famas','galil','g3','gre_m79','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','spas12','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000','cobray','rpg7','b682','x_usp','x_g17','x_g22c','aa12','flamethrower_mk2','m32','plainsrider','peacemaker','winchester1874','m134','mateba','sub2000','asval','polymer','wa2000','hunter'}
for i, wep_id in ipairs(gun_drag) do
	tweak_data.player.stances[ wep_id ].steelsight.shakers.breathing.amplitude = 0.00075

	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pivot = Vector3(10, -8, -25)
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pivot = Vector3(10, -4, -12.5) 
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pivot = Vector3(10, -10, -2) 
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.125
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -3
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 3
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 3 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -3
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -2.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 2.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 2.5 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -2.5
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = 0
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = 0
end

local lmg_drag = {'m249','rpk','hk21','striker','mg42'}
for i, wep_id in ipairs(lmg_drag) do
	tweak_data.player.stances[ wep_id ].steelsight.shakers.breathing.amplitude = 0.035
end


tweak_data.player.TRANSITION_DURATION = 0.23

--Adjustments made below add or subtract from TRANSITION_DURATION
local babby_pistol = {'usp','g22c','glock_17','glock_18c','ppk','judge','jowi','g26','c96','hs2000','x_usp','x_g17','x_g22c','peacemaker','plainsrider','hunter'}
for i, wep_id in ipairs(babby_pistol) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.1
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.2
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.125
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -3
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 3
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 3 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -3
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -2.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 2.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 2.5 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -2.5
end 
tweak_data.weapon.jowi.transition_duration = -0.05
tweak_data.weapon.x_usp.transition_duration = -0.05
tweak_data.weapon.x_g17.transition_duration = -0.05
tweak_data.weapon.x_g22c.transition_duration = -0.05
tweak_data.weapon.jowi.timers.equip = 0.4
tweak_data.weapon.x_usp.timers.equip = 0.4
tweak_data.weapon.x_g17.timers.equip = 0.4
tweak_data.weapon.x_g22c.timers.equip = 0.4

local med_pistol = {'colt_1911','p226','b92fs','x_1911','x_b92fs','mateba'}
for i, wep_id in ipairs(med_pistol) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.09
	tweak_data.weapon.x_1911.transition_duration = -0.045
	tweak_data.weapon.x_b92fs.transition_duration = -0.045
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.25
	tweak_data.weapon.x_1911.timers.equip = 0.5
	tweak_data.weapon.x_b92fs.timers.equip = 0.5
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.175
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -3.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 3.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 3.5 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -3.5
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -3
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 3
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 3 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -3
end 

local beeg_pistol = {'new_raging_bull','deagle','x_deagle','sub2000'}
for i, wep_id in ipairs(beeg_pistol) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.08
	tweak_data.weapon.x_deagle.transition_duration = -0.04
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.3
	tweak_data.weapon.x_deagle.timers.equip = 0.6
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -4
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 4
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 4 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -4
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -3.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 3.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 3.5 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -3.5
end 

local lightweight = {'mp7','mp9','amcar','new_mp5','p90','olympic','tec9','scorpion','cobray','asval'}
for i, wep_id in ipairs(lightweight) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.075
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.45
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.15
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -4.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 4.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 4.5 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -4.5	
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -4
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 4
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 4 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -4
end 

local med_weight = {'mac10','akmsu','new_m4','ak74','g36','gre_m79','ksg','sterling','polymer'}
for i, wep_id in ipairs(med_weight) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.06
	tweak_data.weapon.ksg.transition_duration = -0.085
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.5
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 5 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -5
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -4.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 4.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 4.5 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -4.5
end 

local med_weight_2 = {'serbu','s552','m16','m45','saiga','akm','scar','aug','huntsman','uzi','vhs','b682','flamethrower_mk2'}
for i, wep_id in ipairs(med_weight_2) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.055
	tweak_data.weapon.aug.transition_duration = -0.08
	tweak_data.weapon.vhs.transition_duration = -0.08
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.55
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.25
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -5.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 5.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 5.5 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -5.5
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 5 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -5
end 

local heavy = {'r870','benelli','ak5','new_m14','famas','g3','spas12','mosin','m1928','l85a2','aa12','m32','winchester1874'}
for i, wep_id in ipairs(heavy) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.04
	tweak_data.weapon.famas.transition_duration = -0.06
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.6
		
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.3
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -6
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 6
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 6 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -6
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -5.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 5.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 5.5 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -5.5
	
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = 0
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = 0
end 

local heavy_2 = {'striker','fal','rpk','msr','r93','galil','wa2000'}
for i, wep_id in ipairs(heavy_2) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.03
	tweak_data.weapon.r93.transition_duration = 0
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.65
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.4
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -6.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 6.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 6.5 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -6.5
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -6
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 6
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 6 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -6
end 

local super_heavy = {'akm_gold','m95','hk21','m249','mg42','rpg7'}
for i, wep_id in ipairs(super_heavy) do
	tweak_data.weapon[ wep_id ].transition_duration = 0.02
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.7
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.45
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -7
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 7
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 7 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -7
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -6.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 6.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 6.5 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -6.5
end 

local the_fuck_even = {'m134'}
for i, wep_id in ipairs(the_fuck_even) do
	tweak_data.weapon[ wep_id ].transition_duration = 0.05
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.9
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -8
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 8
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 8 / 2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -8
	
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -7.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 7.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 7.5 / 2
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -7.5
end 

--[[ AMMO PICKUP RATES ]]

tweak_data.weapon.c96.AMMO_PICKUP = {0.90, 3.00}

tweak_data.weapon.mateba.AMMO_PICKUP = {0.86, 2.50}

local pis_44 = {'new_raging_bull','judge'}
for i, wep_id in ipairs(pis_44) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {0.55, 2.10}
end

local pis_50ae = {'deagle','x_deagle'}
for i, wep_id in ipairs(pis_50ae) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {0.50, 1.50}
end

local pis_45_colt = {'peacemaker','judge'}
for i, wep_id in ipairs(pis_45_colt) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {0.50, 2.00}
end

local thirty_two = {'ppk','scorpion'}
for i, wep_id in ipairs(thirty_two) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {2.50, 5.20}
end

local nine_mil = {'new_mp5','mp9','m45','glock_17','glock_18c','b92fs','tec9','uzi','sterling','g26','jowi','x_b92fs','cobray','x_g17'}
for i, wep_id in ipairs(nine_mil) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {2.40, 5.10}
end

local its_not_10mm_auto = {'g22c','p226','x_g22c'}
for i, wep_id in ipairs(its_not_10mm_auto) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {2.00, 4.50}
end

local forty_five = {'mac10','colt_1911','usp','m1928','x_1911','x_usp','polymer'} --UMP45 never :'(
for i, wep_id in ipairs(forty_five) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {1.40, 3.60}
end

local pdw_ammo = {'p90','mp7'}
for i, wep_id in ipairs(pdw_ammo) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {1.20, 3.20}
end

local shell_ammo = {'r870','serbu','benelli','ksg','striker','huntsman','spas12','b682'}
for i, wep_id in ipairs(shell_ammo) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {0.80, 2.10}
end
tweak_data.weapon.saiga.AMMO_PICKUP = {0.50, 1.60}
tweak_data.weapon.aa12.AMMO_PICKUP = {0.50, 1.60}

local ammo_ar = {'olympic','m16','amcar','new_m4','ak5','s552','g36','aug','famas','l85a2','vhs'}
for i, wep_id in ipairs(ammo_ar) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {1.50, 4.50}
end
tweak_data.weapon.m249.AMMO_PICKUP = {1.20, 2.80}

local ammo_ak = {'akmsu','akm','akm_gold','ak74','rpk'}
for i, wep_id in ipairs(ammo_ak) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {1.20, 3.50}
end
tweak_data.weapon.asval.AMMO_PICKUP = {1.00, 2.70}

local ammo_762 = {'new_m14','scar','fal','galil','g3','msr','wa2000'}
for i, wep_id in ipairs(ammo_762) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {1.00, 2.40}
end
tweak_data.weapon.m134.AMMO_PICKUP = {0.50, 1.50}
tweak_data.weapon.hk21.AMMO_PICKUP = {0.80, 2.00}

tweak_data.weapon.mg42.AMMO_PICKUP = {0.50, 1.30}
tweak_data.weapon.mosin.AMMO_PICKUP = {0.50, 1.30}

tweak_data.weapon.r93.AMMO_PICKUP = {0.50, 0.90}
tweak_data.weapon.winchester1874.AMMO_PICKUP = {0.50, 1.20}


--[[ MUSCLE DECK "PANIC" PERCENT CHANCES ]]
local babby_panic = {'mp7','p90','ppk','scorpion'}
for i, wep_id in ipairs(babby_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.01
end

local low_panic = {'new_mp5','mp9','m45','glock_17','glock_18c','b92fs','uzi','g26','jowi','x_b92fs','plainsrider','hunter'}
for i, wep_id in ipairs(low_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.025
end

local low2_panic = {'p226','g22c'}
for i, wep_id in ipairs(low2_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.04
end

local low3_panic = {'mac10','usp','colt_1911','olympic','s552','g36','amcar','tec9','x_1911','m1928','polymer'}
for i, wep_id in ipairs(low3_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.05
end

local mid_panic = {'new_m4','ak5','aug','m16','famas','akmsu','vhs'}
for i, wep_id in ipairs(mid_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.07
end

local mid2_panic = {'ak74','m249','akm','akm_gold'}
for i, wep_id in ipairs(mid2_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.08
end

local weed_panic = {'new_m14','scar','fal','galil','g3','rpk','m134'}
for i, wep_id in ipairs(weed_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.1
end

local weed2_panic = {'benelli','saiga','serbu','striker','huntsman','r870','ksg','judge','spas12','hk21','mg42','b682','aa12','wa2000'}
for i, wep_id in ipairs(weed2_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.12
end

local weed3_panic = {'new_raging_bull','msr','peacemaker','winchester1874'}
for i, wep_id in ipairs(weed3_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.15
end

local spooky_panic = {'deagle','r93','x_deagle'}
for i, wep_id in ipairs(spooky_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.18
end

local its2spooky_panic = {'gre_m79','m95','rpg7','flamethrower_mk2','m32'}
for i, wep_id in ipairs(its2spooky_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.30
end

--Burst fire stuff if you're using Ozzy's burst fire script
local no_burst = {'glock_18c','mac10','m45','mp9','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','amcar','new_m4','ak5','aug','saiga','new_m14','scar','fal','galil','g3','tec9','scorpion','uzi','sterling','m1928','l85a2','vhs','cobray','aa12','flamethrower_mk2','m32','asval'}
for i, wep_id in ipairs(no_burst) do
	tweak_data.weapon[ wep_id ].FORBIDS_BURST_FIRE = true
end

local bullpup = {'p90','ksg','l85a2','famas','vhs','aug','m95','wa2000'}
for i, wep_id in ipairs(bullpup) do
	tweak_data.weapon[ wep_id ].is_bullpup = true
end

tweak_data.projectiles.west_arrow.launch_speed = 2000
tweak_data.projectiles.west_arrow.adjust_z = -45

tweak_data.projectiles.west_arrow_exp.launch_speed = 1800
tweak_data.projectiles.west_arrow_exp.adjust_z = -45

tweak_data.projectiles.crossbow_arrow.launch_speed = 1900
tweak_data.projectiles.crossbow_arrow.adjust_z = 45

tweak_data.projectiles.crossbow_poison_arrow.launch_speed = 1800
tweak_data.projectiles.crossbow_poison_arrow.adjust_z = 45
tweak_data.projectiles.crossbow_poison_arrow.damage = 3.25

tweak_data.projectiles.crossbow_arrow_exp.launch_speed = 1700
tweak_data.projectiles.crossbow_arrow_exp.adjust_z = 45

tweak_data.projectiles.wpn_prj_four.launch_speed = 1200
tweak_data.projectiles.wpn_prj_four.adjust_z = 45

if DMCWO.debug_damage == true then
	local debug_damage = {'new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','r870','huntsman','benelli','ksg','serbu','striker','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','judge','famas','galil','g3','gre_m79','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','spas12','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000','m134','rpg7','cobray','b682','x_usp','x_g17','x_g22c','aa12','flamethrower_mk2','m32','plainsrider','peacemaker','winchester1874','mateba','sub2000','asval','polymer','wa2000','hunter'}
	for i, wep_id in ipairs(debug_damage) do
		tweak_data.weapon[ wep_id ].ignore_damage_upgrades = true
	end
end

RebalanceGen = true
if not DMCWO.rebalance_gen then
	DMCWO.rebalance_gen = true
	if DMCWO.Setup_Stfu ~= true then
		io.stdout:write("is working!", "\n")
	end
	if not RebalanceGen then
		io.stdout:write("[!] You left RebalanceGen commented out (or nil), you may experience FPS drops", "\n")
	end
end

end