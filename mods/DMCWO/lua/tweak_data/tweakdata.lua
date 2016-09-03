--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if not tweak_data then return end
	
tweak_data.projectiles.frag.mass_look_up_modifier = 0
tweak_data.projectiles.frag.damage = 45
tweak_data.projectiles.frag.player_damage = 45
tweak_data.projectiles.frag.range = 550
tweak_data.projectiles.frag.curve_pow = 0.5
tweak_data.projectiles.frag.launch_speed = 600

tweak_data.projectiles.frag_com.mass_look_up_modifier = 0
tweak_data.projectiles.frag_com.damage = 45
tweak_data.projectiles.frag_com.player_damage = 45
tweak_data.projectiles.frag_com.range = 550
tweak_data.projectiles.frag_com.curve_pow = 0.5
tweak_data.projectiles.frag_com.launch_speed = 600

tweak_data.projectiles.dynamite.mass_look_up_modifier = 0
tweak_data.projectiles.dynamite.damage = 60
tweak_data.projectiles.dynamite.player_damage = 60
tweak_data.projectiles.dynamite.range = 900
tweak_data.projectiles.dynamite.curve_pow = 1.5
tweak_data.projectiles.dynamite.init_timer = 3
tweak_data.projectiles.dynamite.launch_speed = 250

tweak_data.projectiles.molotov.mass_look_up_modifier = 0
tweak_data.projectiles.molotov.launch_speed = 175
tweak_data.projectiles.molotov.burn_duration = 15

tweak_data.projectiles.wpn_prj_ace.mass_look_up_modifier = 0
tweak_data.projectiles.wpn_prj_ace.adjust_z = 45
tweak_data.projectiles.wpn_prj_ace.launch_speed = 1000

tweak_data.projectiles.wpn_prj_four.mass_look_up_modifier = 0
tweak_data.projectiles.wpn_prj_four.adjust_z = 45
tweak_data.projectiles.wpn_prj_four.launch_speed = 1250

tweak_data.projectiles.wpn_prj_hur.damage = 30
tweak_data.projectiles.wpn_prj_hur.mass_look_up_modifier = 0
tweak_data.projectiles.wpn_prj_hur.adjust_z = 45
tweak_data.projectiles.wpn_prj_hur.launch_speed = 1250

tweak_data.projectiles.wpn_prj_hur.damage = 50
tweak_data.projectiles.wpn_prj_jav.mass_look_up_modifier = 0
tweak_data.projectiles.wpn_prj_jav.adjust_z = 45
tweak_data.projectiles.wpn_prj_jav.launch_speed = 950


local nades = {
	'launcher_frag','launcher_frag_m32','launcher_frag_china'
}
for i, proj_id in ipairs(nades) do
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	tweak_data.projectiles[proj_id].launch_speed = 1500
	tweak_data.projectiles[proj_id].player_damage = 34
end
nades = {
	'launcher_incendiary','launcher_incendiary_m32','launcher_incendiary_china'
}
for i, proj_id in ipairs(nades) do
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	tweak_data.projectiles[proj_id].launch_speed = 1500
end
	
tweak_data.projectiles.launcher_rocket.damage = 900
tweak_data.projectiles.launcher_rocket.player_damage = 900
tweak_data.projectiles.launcher_rocket.range = 250
tweak_data.projectiles.launcher_rocket.curve_pow = 2
tweak_data.projectiles.rocket_frag.launch_speed = 3850

tweak_data.projectiles.west_arrow.mass_look_up_modifier = 0
tweak_data.projectiles.west_arrow.adjust_z = -45
tweak_data.projectiles.west_arrow.damage = 30
tweak_data.projectiles.west_arrow.launch_speed = 3250
--
tweak_data.projectiles.bow_poison_arrow.mass_look_up_modifier = tweak_data.projectiles.west_arrow.mass_look_up_modifier
tweak_data.projectiles.bow_poison_arrow.adjust_z = tweak_data.projectiles.west_arrow.adjust_z
tweak_data.projectiles.bow_poison_arrow.damage = 15
tweak_data.projectiles.bow_poison_arrow.launch_speed = 3250
--
tweak_data.projectiles.west_arrow_exp.mass_look_up_modifier = tweak_data.projectiles.west_arrow.mass_look_up_modifier
tweak_data.projectiles.west_arrow_exp.adjust_z = tweak_data.projectiles.west_arrow.adjust_z
tweak_data.projectiles.west_arrow_exp.damage = 30
tweak_data.projectiles.west_arrow_exp.launch_speed = 2750


tweak_data.projectiles.frankish_arrow.mass_look_up_modifier = 0
tweak_data.projectiles.frankish_arrow.adjust_z = 90
tweak_data.projectiles.frankish_arrow.damage = tweak_data.projectiles.west_arrow.damage
tweak_data.projectiles.frankish_arrow.launch_speed = 3250
--
tweak_data.projectiles.frankish_poison_arrow.mass_look_up_modifier = tweak_data.projectiles.frankish_arrow.mass_look_up_modifier
tweak_data.projectiles.frankish_poison_arrow.adjust_z = tweak_data.projectiles.frankish_arrow.adjust_z
tweak_data.projectiles.frankish_poison_arrow.damage = tweak_data.projectiles.bow_poison_arrow.damage
tweak_data.projectiles.frankish_poison_arrow.launch_speed = 3250
--
tweak_data.projectiles.frankish_arrow_exp.mass_look_up_modifier = tweak_data.projectiles.frankish_arrow.mass_look_up_modifier
tweak_data.projectiles.frankish_arrow_exp.adjust_z = tweak_data.projectiles.frankish_arrow.adjust_z
tweak_data.projectiles.frankish_arrow_exp.damage = tweak_data.projectiles.west_arrow_exp.damage
tweak_data.projectiles.frankish_arrow_exp.launch_speed = 2750


tweak_data.projectiles.long_arrow.mass_look_up_modifier = 0
tweak_data.projectiles.long_arrow.adjust_z = -45
tweak_data.projectiles.long_arrow.damage = 40
tweak_data.projectiles.long_arrow.launch_speed = 3750
--
tweak_data.projectiles.long_poison_arrow.mass_look_up_modifier = tweak_data.projectiles.long_poison_arrow.mass_look_up_modifier
tweak_data.projectiles.long_poison_arrow.adjust_z = tweak_data.projectiles.long_arrow.adjust_z
tweak_data.projectiles.long_poison_arrow.damage = 20
tweak_data.projectiles.long_poison_arrow.launch_speed = 3750
--
tweak_data.projectiles.long_arrow_exp.mass_look_up_modifier = tweak_data.projectiles.long_arrow_exp.mass_look_up_modifier
tweak_data.projectiles.long_arrow_exp.adjust_z = tweak_data.projectiles.long_arrow.adjust_z
tweak_data.projectiles.long_arrow_exp.damage = 40
tweak_data.projectiles.long_arrow_exp.launch_speed = 3250


tweak_data.projectiles.arblast_arrow.mass_look_up_modifier = 0
tweak_data.projectiles.arblast_arrow.adjust_z = 90
tweak_data.projectiles.arblast_arrow.damage = tweak_data.projectiles.long_arrow.damage
tweak_data.projectiles.arblast_arrow.launch_speed = 3750
--
tweak_data.projectiles.arblast_poison_arrow.mass_look_up_modifier = tweak_data.projectiles.arblast_arrow.mass_look_up_modifier
tweak_data.projectiles.arblast_poison_arrow.adjust_z = tweak_data.projectiles.arblast_arrow.adjust_z
tweak_data.projectiles.arblast_poison_arrow.damage = tweak_data.projectiles.long_poison_arrow.damage
tweak_data.projectiles.arblast_poison_arrow.launch_speed = 3750
--
tweak_data.projectiles.arblast_arrow_exp.mass_look_up_modifier = tweak_data.projectiles.arblast_arrow.mass_look_up_modifier
tweak_data.projectiles.arblast_arrow_exp.adjust_z = tweak_data.projectiles.arblast_arrow.adjust_z
tweak_data.projectiles.arblast_arrow_exp.damage = tweak_data.projectiles.long_arrow_exp.damage
tweak_data.projectiles.arblast_arrow_exp.launch_speed = 3250


tweak_data.projectiles.crossbow_arrow.mass_look_up_modifier = 0
tweak_data.projectiles.crossbow_arrow.adjust_z = 45
tweak_data.projectiles.crossbow_arrow.damage = 20
tweak_data.projectiles.crossbow_arrow.launch_speed = 2750
--
tweak_data.projectiles.crossbow_poison_arrow.mass_look_up_modifier = tweak_data.projectiles.crossbow_arrow.mass_look_up_modifier
tweak_data.projectiles.crossbow_poison_arrow.adjust_z = tweak_data.projectiles.crossbow_arrow.adjust_z
tweak_data.projectiles.crossbow_poison_arrow.damage = 10
tweak_data.projectiles.crossbow_poison_arrow.launch_speed = 2750
--
tweak_data.projectiles.crossbow_arrow_exp.mass_look_up_modifier = tweak_data.projectiles.crossbow_arrow.mass_look_up_modifier
tweak_data.projectiles.crossbow_arrow_exp.adjust_z = tweak_data.projectiles.crossbow_arrow.adjust_z
tweak_data.projectiles.crossbow_arrow_exp.damage = 20
tweak_data.projectiles.crossbow_arrow_exp.launch_speed = 2250


--I love hardcoded values that can only be changed in tweak_data /s
--More Blood to Bleed
tweak_data.upgrades.values.player.health_multiplier = {1.25, 1.5}
--Demoman
tweak_data.upgrades.values.trip_mine.quantity = {3, 7}

tweak_data.money_manager.weapon_cost = {}
local cost = 23000
for i = 1, 100, 1 do
	table.insert( tweak_data.money_manager.weapon_cost, tostring(cost) )
	cost = cost + 23000
end
