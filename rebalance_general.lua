--GENERAL FIXES & TWEAKS--
if not RebalanceGen then
 
if not tweak_data then return end
 
--fixes the extra_ammo index so rounds can be added one by one instead of the default increments of two
tweak_data.weapon.stats.extra_ammo				= {}
for i = -10, 100, 1 do
	table.insert( tweak_data.weapon.stats.extra_ammo, i )
end

--fixes the total_ammo_mod index so I can adjust in smaller increments
tweak_data.weapon.stats.total_ammo_mod = {}
for i = -100, 100, 1 do
	table.insert(tweak_data.weapon.stats.total_ammo_mod, i / 100)
end

--alters the first level of zoom to not zoom at all (if at lowest FOV slider setting)
tweak_data.weapon.stats.zoom	= { 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 18 }

--alters the damage index to be more fucking consistent in the higher levels (and lets me better balance Silent Killer)
tweak_data.weapon.stats.damage = {}
for i = 0, 40, 0.25 do
	table.insert( tweak_data.weapon.stats.damage, i )
end

--alters the stability/recoil index to get rid of the duplicate entry
--[[ tweak_data.weapon.stats.recoil = {
		3,
		2.7,
		2.4,
		2.2,
		1.75,
		1.55, -- 1.5
		1.4, -- 1.25
		1.25, -- 1.1
		1.1, -- 1
		1,
		0.9,
		0.8,
		0.7,
		0.6,
		0.5
	} ]]
	
tweak_data.weapon.stats.recoil = {}
for i = 3, 0.5, -0.1 do
	table.insert( tweak_data.weapon.stats.recoil, i )
end

--"Silent Killer" adjustments
--Basic will generally negate a suppressor's damage de-buff, higher damage weapons will still see a slight damage increase
tweak_data.upgrades.values.weapon.silencer_damage_multiplier = { 1.1, 1.2 }	-- BASIC, ACE
tweak_data.upgrades.skill_descs.hitman.multibasic = "10%"
tweak_data.upgrades.skill_descs.hitman.multipro = "10%"

--"Mag Plus" adjustments
tweak_data.upgrades.values.weapon.clip_ammo_increase = { 10, 20 }
tweak_data.upgrades.skill_descs.mag_plus.multibasic = "10"
tweak_data.upgrades.skill_descs.mag_plus.multipro = "10"

--"Shotgun Impact" adjustments
tweak_data.upgrades.values.shotgun.recoil_multiplier = { 0.85 }
tweak_data.upgrades.values.shotgun.damage_multiplier = { 1.25 }
tweak_data.upgrades.skill_descs.shotgun_impact.multibasic = "15%"
tweak_data.upgrades.skill_descs.shotgun_impact.multipro = "25%"

--WEAPON FIXES--


--Default transition_duration is 0.23 seconds

local heavy_pistol = {'new_raging_bull','deagle',}
for i, wep_id in ipairs(heavy_pistol) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.095
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.3
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -7.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 7.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 7.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -7.5
	
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -6.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 6.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 6.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -6.5
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.3
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.3
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.3
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.3
end 

local med_pistol = {'colt_1911','p226','b92fs',}
for i, wep_id in ipairs(med_pistol) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.1
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.25
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.175
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -6
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 6
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 6
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -6	
	
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -5
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.275
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.275
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.275
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.275
end 

local light_pistol = {'usp','g22c','glock_17','glock_18c','ppk','judge',}
for i, wep_id in ipairs(light_pistol) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.125
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.2
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.125
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -5.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 5.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 5.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -5.5
	
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -4.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 4.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 4.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -4.5
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.25
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.25
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.25
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.25
end 

local lightweight = {'mp7','mp9','ksg','amcar','new_mp5','p90','olympic',}
for i, wep_id in ipairs(lightweight) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.085
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.45
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.15
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -6.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 6.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 6.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -6.5	
	
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -5.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 5.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 5.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -5.5
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.35
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.35
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.35
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.35
end 

local med_weight = {'mac10','akmsu','new_m4','ak74','g36','gre_m79'}
for i, wep_id in ipairs(med_weight) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.07
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.5
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.2
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -7
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 7
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 7
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -7
	
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -6
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 6
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 6
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -6
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

local med_weight_2 = {'serbu','s552','m16','m45','saiga','akm','scar','aug','huntsman',}
for i, wep_id in ipairs(med_weight_2) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.06
	tweak_data.weapon.aug.transition_duration = -0.08
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.55
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.25
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -8
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 8
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 8
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -8
	
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -7
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 7
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 7
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -7
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.5
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.5
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

local heavy = {'r870','benelli','ak5','new_m14','famas','g3'}
for i, wep_id in ipairs(heavy) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.04
	--tweak_data.weapon.famas.transition_duration = -0.06
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.6
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.3
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -8.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 8.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 8.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -8.5
	
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -7.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 7.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 7.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -7.5
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.55
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.55
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

local heavy_2 = {'striker','fal','rpk','msr','r93'}
for i, wep_id in ipairs(heavy_2) do
	tweak_data.weapon[ wep_id ].transition_duration = -0.03
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.65
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.4
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -9
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 9
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 9
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -9
	
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -8
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 8
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 8
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -8
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.6
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.6
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

local super_heavy = {'akm_gold','m95','hk21','m249','galil'}
for i, wep_id in ipairs(super_heavy) do
	tweak_data.weapon[ wep_id ].transition_duration = 0.02
	
	tweak_data.weapon[ wep_id ].timers.equip = 0.7
	
	tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.45
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_neg = -9.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.yaw_pos = 9.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_neg = 9.5
	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pitch_pos = -9.5
	
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -8.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 8.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 8.5
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -8.5
	
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = -0.65
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0.65
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0.45
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = -0.45
end 

--ADS sway and pivot point for all weapons
local gun_drag = {'new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','r870','huntsman','benelli','ksg','serbu','striker','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','judge','famas','galil','g3','gre_m79'}
for i, wep_id in ipairs(gun_drag) do
	tweak_data.player.stances[ wep_id ].steelsight.shakers.breathing.amplitude = 0.00075
	tweak_data.player.stances[ wep_id ].crouched.shakers.breathing.amplitude = tweak_data.player.stances[ wep_id ].standard.shakers.breathing.amplitude / 2

	tweak_data.player.stances[ wep_id ].standard.vel_overshot.pivot = Vector3(10, -8, -25)--:rotate_with( Rotation(0,-110,110) ):rotate_with( Rotation(-110,10,110) )
	tweak_data.player.stances[ wep_id ].crouched.vel_overshot.pivot = Vector3(10, -4, -12.5) 
	tweak_data.player.stances[ wep_id ].steelsight.vel_overshot.pivot = Vector3(10, -10, -2) 
end 

--tweak_data.player.stances.default.crouched.head.translation = Vector3( 0, 0, 82 )

RebalanceGen = true

end