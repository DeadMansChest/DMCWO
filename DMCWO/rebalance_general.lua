--[[
v1.1
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

if not RebalanceGen then
 
if not tweak_data then return end
 
--[[ INDEX TABLE TWEAKS ]]
 
--fixes the extra_ammo index so rounds can be added one by one instead of the default increments of two
tweak_data.weapon.stats.extra_ammo = {} --empties the original table
for i = -10, 100, 1 do
	table.insert( tweak_data.weapon.stats.extra_ammo, i )
end

--fixes the total_ammo_mod index so I can adjust in smaller increments
tweak_data.weapon.stats.total_ammo_mod = {}
for i = -100, 100, 1 do
	table.insert(tweak_data.weapon.stats.total_ammo_mod, i / 150)
end

--alters the first level of zoom to not zoom at all (if at lowest FOV slider setting)
tweak_data.weapon.stats.zoom	= { 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 18 }

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
]]

--alters the stability/recoil index to get rid of the duplicate entry	
tweak_data.weapon.stats.recoil = {}
for i = 3, 0.5, -0.1 do
	table.insert( tweak_data.weapon.stats.recoil, i )
end

--recreating the accuracy table
tweak_data.weapon.stats.spread = {
	2,
	1.9,
	1.8,
	1.7,
	1.6,
	1.5,
	1.4,
	1.3,
	1.2,
	1.1,
	1,
	0.9,
	0.8,
	0.7,
	0.6,
	0.5,
	0.4,
	0.3,
	0.2
}

--"Silent Killer" adjustments
tweak_data.upgrades.values.weapon.silencer_damage_multiplier = { 1.125, 1.25}	--BASIC, ACE
tweak_data.upgrades.skill_descs.hitman.multibasic = "12.5%"
tweak_data.upgrades.skill_descs.hitman.multipro = "25%"

--"The Professional" adjustments
tweak_data.upgrades.values.weapon.silencer_recoil_multiplier = {0.8}
tweak_data.upgrades.values.weapon.silencer_spread_multiplier = {0.8}
tweak_data.upgrades.values.weapon.silencer_enter_steelsight_speed_multiplier = {1.5}
tweak_data.upgrades.skill_descs.silence_expert.multibasic = "20%"
tweak_data.upgrades.skill_descs.silence_expert.multipro = "20%"
tweak_data.upgrades.skill_descs.silence_expert.multipro2 = "50%"

--"Mag Plus" adjustments
tweak_data.upgrades.values.weapon.clip_ammo_increase = { 10, 20 }
tweak_data.upgrades.skill_descs.mag_plus.multibasic = "10"
tweak_data.upgrades.skill_descs.mag_plus.multipro = "10"

--"Shotgun Impact" adjustments
tweak_data.upgrades.values.shotgun.recoil_multiplier = { 0.75 }
tweak_data.upgrades.values.shotgun.damage_multiplier = { 1.25 }
tweak_data.upgrades.skill_descs.shotgun_impact.multibasic = "25%"
tweak_data.upgrades.skill_descs.shotgun_impact.multipro = "25%"

--Akimbo recoil penalty adjustments so they actually are the +75/50/25% increase in recoil, matching the descriptions, and not 175/150/125% that they were coded to have
tweak_data.upgrades.values.akimbo.recoil_multiplier = {
		1.75, --Third card
		1.5, --Last card, Basic skill
		1.25 --Aced skill
	}

--[[ Viewmodel "Sway" and Drag ]]	

--ADS "sway" and pivot point for all weapons
local gun_drag = {'default','new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','r870','huntsman','benelli','ksg','serbu','striker','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','judge','famas','galil','g3','gre_m79','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','spas12','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000'}
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
end

local lmg_drag = {'m249','rpk','hk21','striker','mg42'}
for i, wep_id in ipairs(lmg_drag) do
	tweak_data.player.stances[ wep_id ].steelsight.shakers.breathing.amplitude = 0.035
end


tweak_data.player.TRANSITION_DURATION = 0.23

--Adjustments made below add or subtract from TRANSITION_DURATION
local light_pistol = {'usp','g22c','glock_17','glock_18c','ppk','judge','jowi','g26','c96','hs2000'}
for i, wep_id in ipairs(light_pistol) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.125
	tweak_data.weapon.jowi.transition_duration = -0.0625
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.2
	tweak_data.weapon.jowi.timers.equip = 0.4
	
	
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
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.25
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.25
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.25
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.25
end 

local med_pistol = {'colt_1911','p226','b92fs','x_1911','x_b92fs'}
for i, wep_id in ipairs(med_pistol) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.1
	tweak_data.weapon.x_1911.transition_duration = -0.05
	tweak_data.weapon.x_b92fs.transition_duration = -0.05
	
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
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.275
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.275
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.275
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.275
end 

local heavy_pistol = {'new_raging_bull','deagle','x_deagle'}
for i, wep_id in ipairs(heavy_pistol) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.09
	tweak_data.weapon.x_deagle.transition_duration = -0.045
	
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
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.3
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.3
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.3
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.3
end 

local lightweight = {'mp7','mp9','amcar','new_mp5','p90','olympic','tec9','scorpion'}
for i, wep_id in ipairs(lightweight) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.085
	
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
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.35
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.35
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.35
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.35
end 

local med_weight = {'mac10','akmsu','new_m4','ak74','g36','gre_m79','ksg','sterling'}
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
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

local med_weight_2 = {'serbu','s552','m16','m45','saiga','akm','scar','aug','huntsman','uzi','vhs'}
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
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.5
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.5
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

local heavy = {'r870','benelli','ak5','new_m14','famas','g3','spas12','mosin','m1928','l85a2'}
for i, wep_id in ipairs(heavy) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.04
	tweak_data.weapon.famas.transition_duration = -0.06
	tweak_data.weapon.l85a2.transition_duration = -0.01
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.6
	tweak_data.weapon.l85a2.timers.equip = 0.65
		
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
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.55
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.55
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

local heavy_2 = {'striker','fal','rpk','msr','r93'}
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
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.6
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.6
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

local super_heavy = {'akm_gold','m95','hk21','m249','galil','mg42'}
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
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.65
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.65
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

--[[ AMMO PICKUP RATES ]]
local pis_high = {'new_raging_bull','deagle','x_deagle','judge','c96'}
for i, wep_id in ipairs(pis_high) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {0.45, 3.30}
end

local thirty_two = {'ppk','scorpion'}
for i, wep_id in ipairs(thirty_two) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {3.30, 5.50}
end

local nine_mil = {'new_mp5','mp9','m45','glock_17','glock_18c','b92fs','tec9','uzi','sterling','g26','jowi','x_b92fs'}
for i, wep_id in ipairs(nine_mil) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {3.00, 5.30}
end

local forty = {'g22c','p226'}
for i, wep_id in ipairs(forty) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {2.20, 4.80}
end

local forty_five = {'mac10','colt_1911','usp','m1928','x_1911'} --UMP45 never :'(
for i, wep_id in ipairs(forty_five) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {1.45, 4.60}
end

local pdw_ammo = {'p90','mp7'}
for i, wep_id in ipairs(pdw_ammo) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {2.40, 4.70}
end

local shell_ammo = {'r870','serbu','benelli','ksg','striker','huntsman','spas12'}
for i, wep_id in ipairs(shell_ammo) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {0.60, 1.70}
end
tweak_data.weapon.saiga.AMMO_PICKUP = {0.50, 1.60}

local ar_ammo = {'olympic','m16','amcar','new_m4','ak5','s552','g36','aug','famas','l85a2','vhs'}
for i, wep_id in ipairs(ar_ammo) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {1.90, 4.50}
end
tweak_data.weapon.m249.AMMO_PICKUP = {1.20, 3.00}

local ammo_ak = {'akmsu','akm','akm_gold','ak74','rpk'}
for i, wep_id in ipairs(ammo_ak) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {1.40, 3.50}
end

local ammo_762 = {'new_m14','scar','fal','galil','g3','msr'}
for i, wep_id in ipairs(ammo_762) do
	tweak_data.weapon[ wep_id ].AMMO_PICKUP = {0.90, 2.20}
end
tweak_data.weapon.hk21.AMMO_PICKUP = {0.70, 1.80}
tweak_data.weapon.mg42.AMMO_PICKUP = {0.60, 1.60}

tweak_data.weapon.mosin.AMMO_PICKUP = {0.40, 1.30}
tweak_data.weapon.r93.AMMO_PICKUP = {0.55, 0.55}


--[[ MUSCLE DECK "PANIC" PERCENT CHANCES ]]
local babby_panic = {'mp7','p90','ppk','scorpion'}
for i, wep_id in ipairs(babby_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.01
end

local low_panic = {'new_mp5','mp9','m45','glock_17','glock_18c','b92fs','uzi','g26','jowi','x_b92fs'}
for i, wep_id in ipairs(low_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.03
end

local low2_panic = {'p226','g22c'}
for i, wep_id in ipairs(low2_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.05
end

local low3_panic = {'mac10','usp','colt_1911','olympic','s552','g36','amcar','tec9','x_1911','m1928'}
for i, wep_id in ipairs(low3_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.07
end

local mid_panic = {'new_m4','ak5','aug','m16','famas','akmsu' --[[,'vhs']]}
for i, wep_id in ipairs(mid_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.09
end

local mid2_panic = {'ak74','m249'}
for i, wep_id in ipairs(mid2_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.11
end

local mid3_panic = {'akm','akm_gold'}
for i, wep_id in ipairs(mid3_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.13
end

local high_panic = {'new_m14','scar','fal','galil','g3','rpk'}
for i, wep_id in ipairs(high_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.15
end

local high2_panic = {'benelli','saiga','serbu','striker','huntsman','r870','ksg','judge','spas12','hk21','mg42'}
for i, wep_id in ipairs(high2_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.25
end

local high3_panic = {'new_raging_bull','msr'}
for i, wep_id in ipairs(high3_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.3
end

local spooky_panic = {'deagle','r93','x_deagle'}
for i, wep_id in ipairs(spooky_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 0.45
end

local its2spooky_panic = {'gre_m79','m95'}
for i, wep_id in ipairs(its2spooky_panic) do
	tweak_data.weapon[ wep_id ].panic_suppression_chance = 1.10
end

--Burst fire stuff if you're using Ozzy's burst fire script
local no_burst = {'glock_18c','mac10','m45','mp9','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','amcar','new_m4','ak5','aug','saiga','new_m14','scar','fal','galil','g3','tec9','scorpion','uzi','sterling','m1928','l85a2','vhs'}
for i, wep_id in ipairs(no_burst) do
	tweak_data.weapon[ wep_id ].FORBIDS_BURST_FIRE = true
end

RebalanceGen = true
io.stderr:write("rebalance_general.lua is working", "\n")

end