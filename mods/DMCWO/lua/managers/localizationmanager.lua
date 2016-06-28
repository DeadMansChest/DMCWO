--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

--[[
Real Weapon Names
-old string hijack code thanks to hejoro
-newer string hijack code thanks to Wobin Ralker and Melting Terminal
-imfdb (Most Weapons)
-Payday Wikia (Leupold/Theia Scope)
-/k/anon and Steam friends (Other unidentified attachments and weapons I haven't found or were not ID'd by the two above sources)
	-Comrade Sniper for the MOE SL Handguard
]]

--Wobin Ralker's string override doesn't seem to like showing the alterable skill values (like skill costs and what not) so I gotta use Wilko's localization stuff
Hooks:Add("LocalizationManagerPostInit", "localization_dmc", function(loc)

	loc:add_localized_strings( {
		["menu_backstab_desc"] = "BASIC: ##$basic##\nYou gain a ##3%## critical hit chance for every ##3## points of concealment under ##35## up to ##30%##.\n\nACE: ##$pro##\nYou gain a ##3%## critical hit chance for every ##1## point of concealment under ##35## up to ##30%##.\n\nNote: Critical hits will not work against a Bulldozer's body, with explosives or with weapons that deal ##80 or more## damage (per pellet for shotguns).\n\nSkills that increase damage to ##80 or more## (per pellet for shotguns) do not remove the ability for that weapon to land a critical hit.",
		
		--Hitman
		["menu_deck5_3_desc"] = "Akimbo weapons now instead have a have a ##25%## stability penalty.\n\n\Your armor recovery rate is increased by an additional ##10%##.",
		["menu_deck5_9_desc"] = "You no longer have a stability penalty with Akimbo weapons and increases the ammo capacity of your Akimbo weapons to ##125%##.\n\n\Your armor recovery rate is increased by an additional ##10%##.\n\n\Deck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%##.",
		--Gambler
		["menu_deck10_1_desc"] = "Ammo supplies you pick up also yield medical supplies and heal you for ##8## to ##12## health.\n\n\This cannot occur more than once every ##4## seconds.",
		
		--Bipod Description
		["bm_wp_upg_lmg_lionbipod_desc_pc"] = "A bipod that can be deployed by pressing $BTN_BIPOD.\n\n##75% less## vertical recoil ##when deployed.\n50% less## horizontal recoil ##when deployed.\n7.5% slower## ADS speeds.",
		
		["bm_wp_upg_fl_pis_tlr1_desc"] = "Flashlight that can be toggled on and off by pressing $BTN_GADGET.",
		["bm_wp_upg_fl_pis_m3x_desc"] = "Flashlight that can be toggled on and off by pressing $BTN_GADGET.",
		["bm_wp_upg_fl_ass_smg_sho_surefire_desc"] = "Flashlight that can be toggled on and off by pressing $BTN_GADGET.",
		
		["bm_wp_upg_fl_ass_laser_desc"] = "Laser that can be toggled on and off by pressing $BTN_GADGET.\n\n##15% tighter## hipfire while the ##laser is on.##",
		["bm_wp_pis_g_laser_desc"] = "Laser that can be toggled on and off by pressing $BTN_GADGET.\n\n##15% tighter## hipfire while the ##laser is on.##",
		["bm_wp_pis_ppk_g_laser_desc"] = "Laser that can be toggled on and off by pressing $BTN_GADGET.\n\n##15% tighter## hipfire while the ##laser is on.##",
		["bm_wp_upg_fl_crimson_desc"] = "Laser that can be toggled on and off by pressing $BTN_GADGET.\n\n##15% tighter## hipfire while the ##laser is on.##",
		["bm_wp_upg_fl_ass_smg_sho_peqbox_desc"] = "Laser that can be toggled on and off by pressing $BTN_GADGET.\n\n##15% tighter## hipfire while the ##laser is on.##",
		
		["bm_wp_upg_fl_x400v_desc"] = "Laser/flashlight that can be toggled on and off by pressing $BTN_GADGET.\n\n##15% tighter## hipfire while the ##laser is on.##",
		["bm_wp_upg_fl_pis_laser_desc"] = "Laser/flashlight that can be toggled on and off by pressing $BTN_GADGET.\n\n##15% tighter## hipfire while the ##laser is on.##",
		["bm_wp_upg_fl_ass_utg_desc"] = "Laser/flashlight that can be toggled on and off by pressing $BTN_GADGET.\n\n##15% tighter## hipfire while the ##laser is on.##",
		["bm_wp_upg_fl_ass_peq15_desc"] = "Laser/flashlight that can be toggled on and off by pressing $BTN_GADGET.\n\n##15% tighter## hipfire while the ##laser is on.##",
		
		["bm_wpn_fps_upg_o_45iron_desc"] = "Allows for switching beteen your main sight and angled iron sights by pressing $BTN_GADGET.",
		
		["menu_infamy_desc_ghost_dmc"] = "Modern assassin that carries out death sentences - for the right price.\n\nBONUSES:\nExperience gained is increased by ##5%##.",
		["menu_infamy_desc_enforcer_dmc"] = "Used in crimes that requires the Enforcer to get his hands dirty.\n\nBONUSES:\nExperience gained is increased by ##5%##.",
		["menu_infamy_desc_technician_dmc"] = "Cold, calculating and a master of forced disappearances, dead or alive.\n\nBONUSES:\nExperience gained is increased by ##5%##.",
		["menu_infamy_desc_mastermind_dmc"] = "Known to cause moral chaos and sway even the most devoted lawman.\n\nBONUSES:\nExperience gained is increased by ##5%##.",
		
		--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{			
				--Combat Medic
				["menu_combat_medic_dmc"] = "Combat Medic",
				["menu_combat_medic_desc_dmc"] = "BASIC: ##$basic##\nAfter you have revived a crew member, you receive a ##25%## damage bonus for ##10## seconds.\n\nACE: ##$pro##\nReviving a crew member gives them ##30%## more health.",
				
				--Quick Fix
				["menu_tea_time_dmc"] = "Quick Fix",
				["menu_tea_time_desc_dmc"] = "BASIC: ##$basic##\nDecreases your First Aid Kit and Doctor Bag deploy time by ##50%##.\n\nACE: ##$pro##\nCrew members that use your First Aid Kits or Doctor Bags take ##15%## less damage for ##20## seconds.",
				--Painkillers
				["menu_fast_learner_dmc"] = "Painkillers",
				["menu_fast_learner_desc_dmc"] = "BASIC: ##$basic##\nCrew members you revive take ##30%## less damage for ##5## seconds.\n\nACE: ##$pro##\nThe damage reduction is increased by an additional ##50%##.",
				
				--Uppers
				["menu_tea_cookies_dmc"] = "Uppers",
				["menu_tea_cookies_desc_dmc"] = "BASIC: ##$basic##\nAdds ##4## more First Aid Kits to your inventory.\n\nACE: ##$pro##\nAdds ##6## more First Aid Kits to your inventory.",
				--Combat Doctor
				["menu_medic_2x_dmc"] = "Combat Doctor",
				["menu_medic_2x_desc_dmc"] = "BASIC: ##$basic##\nYour Doctor Bag has ##2## more charges.\n\nACE: ##$pro##\nYou can now deploy ##2## Doctor Bags instead of just one.",
				
				--Inspire
				["menu_inspire_dmc"] = "Inspire",
				["menu_inspire_desc_dmc"] = "BASIC: ##$basic##\nYou revive crew members ##50%## faster.\n\nShouting at your teammates will increase their movement speed by ##20%## for ##10## seconds.\n\nACE: ##$pro##\nYou can ##revive crew members at a distance by shouting at them##. You can only do this every ##20## seconds.",
			--}
			
			--[[   CONTROLLER SUBTREE   ]]--
			--{
				--Cable Guy (Endurance)
				["menu_triathlete_dmc"] = "Cable Guy",
				["menu_triathlete_desc_dmc"] = "BASIC: ##$basic##\nIncreases your supply of cable ties by ##4##. You can cable tie hostages ##75%## faster.\n\nACE: ##$pro##\nIncreases your stamina by ##150%## and your crew's stamina by ##50%##.",
				
				--Clowns are Scary (Cable Guy)
				["menu_cable_guy_dmc"] = "Clowns are Scary",
				["menu_cable_guy_desc_dmc"] = "BASIC: ##$basic##\nThe power and range of your intimidation is increased by ##50%##.\n\nACE: ##$pro##\nYou can now have ##2## converted enemies at the same time.",
				--Joker
				["menu_joker_dmc"] = "Joker",
				["menu_joker_desc_dmc"] = "BASIC: ##$basic##\nYou can convert a non-special enemy to fight on your side. This can not be done during stealth and enemies must surrender before you can convert them. You can only convert one enemy at a time.\n\nACE: ##$pro##\nConverted enemies gain ##55%## more health and deal ##45%## more damage. The time to convert an enemy is reduced by ##65%##.",
				
				--Stockholm Syndrome
				["menu_stockholm_syndrome_dmc"] = "Stockholm Syndrome",
				["menu_stockholm_syndrome_desc_dmc"] = "BASIC: ##$basic##\nCivilians are intimidated by the noise you make and remain intimidated ##50%## longer.\n\nACE: ##$pro##\nYour hostages will not flee when they have been rescued by law enforcers.\n\nNearby civilians and jokers have a chance of reviving you if you interact with them, and have a chance of giving you ammo.",
				--Partners in Crime
				["menu_control_freak_dmc"] = "Partners in Crime",
				["menu_control_freak_desc_dmc"] = "BASIC: ##$basic##\nHaving a converted enemy increases your movement speed by ##10%##. Your converted enemy takes an additional ##45%## less damage.\n\nACE: ##$pro##\nHaving a converted enemy increases your health by ##30%##. Your converted enemy takes an additional ##45%## less damage.\n\nNote: This skill stacks with Joker multiplicatively",
				
				--Hostage Taker
				["menu_black_marketeer_dmc"] = "Hostage Taker",
				["menu_black_marketeer_desc_dmc"] = "BASIC: ##$basic##\nHaving at least one hostage or converted law enforcer makes you regenerate ##2.5%## health every ##5## seconds.\n\nACE: ##$pro##\nHaving at least one hostage or converted law enforcer makes you regenerate ##5%## health every ##5## seconds.",
			--}
			
			--[[   ASSAULT SUBTREE   ]]--
			--{
				--Subtree Name
				["st_menu_mastermind_single_shot"] = "Assault",
				
				--Leadership (Stable Shot)
				["menu_stable_shot_dmc"] = "Leadership",
				["menu_stable_shot_desc_dmc"] = "BASIC: ##$basic##\nYour stability rating for all SMGs and MGs is increased by ##4##.\n\nACE: ##$pro##\nYou and your crew's stability rating for all weapons is increased by ##4##.",
				
				--MG Handling (Rifleman)
				["menu_rifleman_dmc"] = "MG Handling",
				["menu_rifleman_desc_dmc"] = "BASIC: ##$basic##\nYou reload SMGs and MGs ##35%## faster.\n\nACE: ##$pro##\nTightens the hipfire accuracy of SMGs and MGs by ##50%##",
				--MG Specialist (Marksman)
				["menu_sharpshooter_dmc"] = "MG Specialist",
				["menu_sharpshooter_desc_dmc"] = "BASIC: ##$basic##\nIncreases the rate of fire of SMGs and MGs by ##20%##.\n\nACE: ##$pro##\nYour SMGs and MGs do ##15%## more damage.",
				
				--Shock and Awe (Rifleman)
				["menu_spotter_teamwork_dmc"] = "Shock and Awe",
				["menu_spotter_teamwork_desc_dmc"] = "BASIC: ##$basic##\nYour weapons' magazine capacities are increased by ##30%##.\n\nACE: ##$pro##\nYour weapons' magazine capacities are increased by an additional ##20%##.\n\nYou can now hip-fire with your weapons while sprinting.",
				--Heavy Impact (Aggressive Reload)
				["menu_speedy_reload_dmc"] = "Heavy Impact",
				["menu_speedy_reload_desc_dmc"] = "BASIC: ##$basic##\nSMGs, MGs or rifles fired automatically have a ##10%## chance to knock down enemies.\n\nACE: ##$pro##\nYour shots now have a ##25%## chance to knock down enemies.\n\nNote: Does not apply to Bulldozers",
				
				--Body Expertise
				["menu_single_shot_ammo_return_dmc"] = "Body Expertise",
				["menu_single_shot_ammo_return_desc_dmc"] = "BASIC: ##$basic##\nYou can now pierce body armor.\n\n##25%## of the enemy's headshot multiplier is applied to the enemy's body.\n\nThis skill is only activated by SMGs, MGs or rifles fired automatically.\n\nACE: ##$pro##\n##50%## of an enemy's headshot multiplier is now applied to the enemy's body.",				
			--}
		--}
		
		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{
				--Underdog
				["menu_underdog_dmc"] = "Underdog",
				["menu_underdog_desc_dmc"] = "BASIC: ##$basic##\nWhen you are surrounded by three enemies or more, you receive a ##10%## damage bonus.\n\nACE: ##$pro##\nWhen you are surrounded by three enemies or more you take ##10%## less damage from enemies.",
				
				--Shotgun CQB
				["menu_shotgun_cqb_dmc"] = "Shotgun CQB",
				["menu_shotgun_cqb_desc_dmc"] = "BASIC: ##$basic##\nYou now reload shotguns ##25%## faster.\n\nACE: ##$pro##\nYou now reload shotguns ##50%## faster.\n\nYou ADS ##50%## faster with shotguns.",
				--Shotgun Impact
				["menu_shotgun_impact_dmc"] = "Shotgun Impact",
				["menu_shotgun_impact_desc_dmc"] = "BASIC: ##$basic##\nYour weapon stability with all shotguns is increased by ##4##.\n\nACE: ##$pro##\nYou deal ##25%## more damage with shotguns.",
				
				--Pigeon Shooter (Far Away)
				["menu_far_away_dmc"] = "Pigeon Shooter",
				["menu_far_away_desc_dmc"] = "BASIC: ##$basic##\nYour shotgun's accuracy is increased by ##40%## when aiming down your sights.\n\nACE: ##$pro##\nYour shotgun's range increased by ##50%## when aiming down your sights.",
				--Gung-Ho (Close By)
				["menu_close_by_dmc"] = "Gung-Ho",
				["menu_close_by_desc_dmc"] = "BASIC: ##$basic##\nYou can now hip-fire with shotguns while sprinting.\n\nACE: ##$pro##\nYour rate of fire is increased by ##35%## while hip-firing with shotguns.",
				
				--OVERKILL
				["menu_overkill_dmc"] = "OVERKILL",
				["menu_overkill_desc_dmc"] = "BASIC: ##$basic##\nWhen you kill an enemy with a shotgun or the OVE9000 portable saw, you receive a ##75%## increase in damage for those weapons for ##5## seconds.\n\nACE: ##$pro##\nThe damage bonus now applies to all weapons and lasts ##10## seconds instead. Skill must still be activated using a shotgun or the OVE9000 portable saw.\n\nDecreases the time it takes to pull and put away shotguns and the saw by ##80%##.",
			--}
			
			--[[   JUGGERNAUT SUBTREE   ]]--
			--{
				--Subtree Name
				["st_menu_enforcer_armor"] = "Juggernaut",
				
				--Stun Resistance
				["menu_oppressor_dmc"] = "Stun Resistance",
				["menu_oppressor_desc_dmc"] = "BASIC: ##$basic##\nThe steadiness of your armor is increased by ##10##.\n\nACE: ##$pro##\nReduces the visual effect duration of flashbangs by ##75%##.",
				
				--Die Hard
				["menu_show_of_force_dmc"] = "Die Hard",
				["menu_show_of_force_desc_dmc"] = "BASIC: ##$basic##\nYour armor recovers ##15%## faster.\n\nACE: ##$pro##\nYou can use your primary weapon in bleedout.",
				--Transporter
				["menu_pack_mule_dmc"] = "Transporter",
				["menu_pack_mule_desc_dmc"] = "BASIC: ##$basic##\nYou can throw bags ##50%## further.\n\nACE: ##$pro##\nYou can now sprint with any bag.\n\nNote: The movement penalty incited by the bag still applies.",
				
				--More Blood To Bleed
				["menu_iron_man_dmc"] = "More Blood to Bleed",
				["menu_iron_man_desc_dmc"] = "BASIC: ##$basic##\nYou gain ##25%## extra health.\n\nACE: ##$pro##\nYou gain an additional ##25%## extra health.",
				--Bullseye
				["menu_prison_wife_dmc"] = "Bullseye",
				["menu_prison_wife_desc_dmc"] = "BASIC: ##$basic##\nYou regenerate ##5## armor for each successful headshot. This effect cannot occur more than once every ##2## seconds.\n\nACE: ##$pro##\nYou now regenerate ##35## armor for each successful headshot.",
				
				--Iron Man
				["menu_juggernaut_dmc"] = "Iron Man",
				["menu_juggernaut_desc_dmc"] = "BASIC: ##$basic##\nUnlocks the ability to wear the Improved Combined Tactical Vest.\n\nACE: ##$pro##\nWhen you melee shield enemies there's a chance that they get knocked over by the sheer force.",
			--}
			
			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{
				--Subtree Name
				["st_menu_enforcer_ammo"] = "Support",
				
				--Scavenging
				["menu_scavenging_dmc"] = "Scavenger",
				["menu_scavenging_desc_dmc"] = "BASIC: ##$basic##\nYou gain a ##50%## increased ammo box pick up range.\n\nACE: ##$pro##\nEvery ##10th## enemy you kill will drop an extra ammo box.",
				
				--Bullet Storm
				["menu_ammo_reservoir_dmc"] = "Bullet Storm",
				["menu_ammo_reservoir_desc_dmc"] = "BASIC: ##$basic##\nAmmo bags placed by you grant players the ability to shoot without depleting their ammunition for up to ##5## seconds after interacting with it. The more ammo players replenish, the longer the duration of the effect.\n\nACE: ##$pro##\nIncreases the base duration of the effect by up to ##15## seconds.\n\nNote: Explosive firing weapons will not be affected by this skill",
				["menu_ammo_reservoir_desc_jam"] = "BASIC: ##$basic##\nAmmo bags placed by you grant players the ability to shoot without depleting their ammunition, jamming or increasing their weapon's jam chance for up to ##5## seconds after interacting with it. The more ammo players replenish, the longer the duration of the effect.\n\nACE: ##$pro##\nIncreases the base duration of the effect by up to ##15## seconds\n\nNote: Explosive firing weapons will not be affected by this skill",
				--[[
				["menu_ammo_reservoir_desc_dmc"] = "BASIC: ##$basic##\nDirectly after you deploy an ammo bag, you can fire your weapon for ##5## seconds without depleting your ammo.\n\nACE: ##$pro##\nYou can fire ##15## seconds longer without depleting your ammo.\n\nNote: Does not apply to grenade launchers, rockets, explosive shells and explosive arrows/bolts.",
				["menu_ammo_reservoir_desc_jam"] = "BASIC: ##$basic##\nDirectly after you deploy an ammo bag, you can fire your weapon for ##5## seconds without depleting your ammo, jamming or increasing your weapon's jam chance.\n\nACE: ##$pro##\nYou can fire ##15## seconds longer without depleting your ammo, jamming or increasing your weapon's jam chance.\n\nNote: Does not apply to grenade launchers, rockets, explosive shells and explosive arrows/bolts.",
				]]
				--Portable Saw
				["menu_portable_saw_dmc"] = "Portable Saw",
				["menu_portable_saw_desc_dmc"] = "BASIC: ##$basic##\nUnlocks the OVE9000 portable saw for you to use as a secondary weapon.\n\nACE: ##$pro##\nYou gain ##50%## more total ammo for the Saw.\n\nYou deal ##30%## more damage with the Saw.",
				
				--Extra Lead
				["menu_ammo_2x_dmc"] = "Extra Lead",
				["menu_ammo_2x_desc_dmc"] = "BASIC: ##$basic##\nYour ammo bag contains an additional ##200%## ammunition.\n\nACE: ##$pro##\nYou can now place ##2## ammo bags.",
				--Carbon Blade
				["menu_carbon_blade_dmc"] = "Carbon Blade",
				["menu_carbon_blade_desc_dmc"] = "BASIC: ##$basic##\nReduces the wear down of the blades on enemies by ##50%##.\n\nACE: ##$pro##\nYou can now saw through shield enemies with your OVE9000 portable saw.\n\nWhen killing an enemy with the saw, you have a ##50%## chance to cause nearby enemies in a ##10## meter radius to panic.\n\nPanic will make enemies go into short bursts of uncontrollable fear.",
				
				--Fully Loaded
				["menu_bandoliers_dmc"] = "Fully Loaded",
				["menu_bandoliers_desc_dmc"] = "BASIC: ##$basic##\nYour total ammo capacity is increased by ##25%##.\n\nACE: ##$pro##\nIncreases the amount of ammo you gain from ammo boxes by ##75%##.",
			--}
		--}
		
		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{
				--Third Law
				["menu_defense_up_dmc"] = "Third Law",
				["menu_defense_up_desc_dmc"] = "BASIC: ##$basic##\nYour sentry guns cost ##25%## less ammo to deploy.\n\nACE: ##$pro##\nYour sentry guns gain a protective shield.",
			
				--Sentry Targeting Package
				["menu_sentry_targeting_package_dmc"] = "Sentry Targeting Package",
				["menu_sentry_targeting_package_desc_dmc"] = "BASIC: ##$basic##\nYour sentry guns gain a ##100%## increase in accuracy.\n\nACE: ##$pro##\nYour sentry guns rotation speed is increased by ##150%##.\n\nYour sentry guns also have ##50%## more ammunition.",
				--Eco Sentry
				["menu_eco_sentry_dmc"] = "Eco Sentry",
				["menu_eco_sentry_desc_dmc"] = "BASIC: ##$basic##\nYour sentry guns cost ##25%## less ammunition to deploy.\n\nACE: ##$pro##\nYour sentry guns gain ##150%## increased health.",
			
				--Engineering
				["menu_engineering_dmc"] = "Engineering",
				["menu_engineering_desc_dmc"] = "BASIC: ##$basic##\nYou can now select a less noisy version of the sentry guns, making them much less likely to be targeted by enemies.\n\nACE: ##$pro##\nYou can now toggle AP rounds on your sentry guns, lowering the rate of fire by ##75%##, but increasing damage by ##250%## and allowing it to pierce through enemies and shields.",
				--Jack of All Trades
				["menu_jack_of_all_trades_dmc"] = "Jack of All Trades",
				["menu_jack_of_all_trades_desc_dmc"] = "BASIC: ##$basic##\nYou deploy and interact with all deployables ##50%## faster.\n\nACE: ##$pro##\nYou can now equip a second deployable.\n\nYou will carry only ##50%## the amount of this deployable than you normally would.\n\nPressing [X] will allow you to toggle between deployables.",
				
				--Tower Defense
				["menu_tower_defense_dmc"] = "Tower Defense",
				["menu_tower_defense_desc_dmc"] = "BASIC: ##$basic##\nYou can now carry a maximum of ##2## sentry guns.\n\nACE: ##$pro##\nYou can now carry a maximum of ##3## sentry guns.",
			--}
			
			--[[   BREACHER SUBTREE   ]]--
			--{
				--Hardware Expert
				["menu_hardware_expert_dmc"] = "Hardware Expert",
				["menu_hardware_expert_desc_dmc"] = "BASIC: ##$basic##\nYou fix drills and saws ##25%## faster.\n\nACE: ##$pro##\nYour drills are now silent, civilians and guards have to see the drills in order to get alerted.",
				
				--Danger Close (Combat Engineering)
				["menu_combat_engineering_dmc"] = "Danger Close",
				["menu_combat_engineering_desc_dmc"] = "BASIC: ##$basic##\nThe radius of trip mine explosion is increased by ##30%##.\n\nACE: ##$pro##\nYour trip mine deals ##50%## more damage.",
				--Drill Sawgeant
				["menu_drill_expert_dmc"] = "Drill Sawgeant",
				["menu_drill_expert_desc_dmc"] = "BASIC: ##$basic##\nYour drill and saw efficiency is increased by ##15%##.\n\nACE: ##$pro##\nFurther increases your drill and saw efficency by ##15%##.",
				
				--Demoman (More Firepower)
				["menu_more_fire_power_dmc"] = "Demoman",
				["menu_more_fire_power_desc_dmc"] = "BASIC: ##$basic##\nYou can now carry ##4## shaped charges and ##6## trip mines.\n\nACE: ##$pro##\nYou can now carry ##6## shaped charges and ##10## trip mines.",
				--Kick Starter
				["menu_kick_starter_dmc"] = "Kick Starter",
				["menu_kick_starter_desc_dmc"] = "BASIC: ##$basic##\nYour drills and saws gain a ##30%## chance to automatically restart after breaking.\n\nACE: ##$pro##\nYou gain the ability to restart a drill by hitting it with a melee attack. You get ##1## chance for each time it breaks with a ##50%## success rate.",
				
				--Fire Trap
				["menu_fire_trap_dmc"] = "Fire Trap",
				["menu_fire_trap_desc_dmc"] = "BASIC: ##$basic##\nYour trip mines now spread fire around the area of detonation for ##20## seconds in a ##7.5## meter radius.\n\nACE: ##$pro##\nThe duration of the trip mine fire effect is increased to ##30## seconds and the radius of the fire effect is increased to ##11.25## meters.",
			--}
			
			--[[   BATTLE SAPPER SUBTREE   ]]--
			--{
				--Subtree Name
				["st_menu_technician_auto"] = "Combat Engineer",
				
				--Nerves of Steel (Steady Grip)	
				["menu_steady_grip_dmc"] = "Nerves of Steel",
				["menu_steady_grip_desc_dmc"] = "BASIC: ##$basic##\nYou take ##50%## less damage while interacting with things.\n\nACE: ##$pro##\nYou can now aim down your sights while bleeding out.",
				
				--Sharpshooter (Heavy Impact)
				["menu_heavy_impact_dmc"] = "Sharpshooter",
				["menu_heavy_impact_desc_dmc"] = "BASIC: ##$basic##\nYour accuracy with semi-automatic weapons is increased by ##4##.\n\nACE: ##$pro##\nYour stability for all rifles is increased by ##4##.\n\nYou retain full movement speed while aiming down your sights.",
				--Spotter (Fire Control)
				["menu_fire_control_dmc"] = "Spotter",
				["menu_fire_control_desc_dmc"] = "BASIC: ##$basic##\nSpecial enemies marked by you take ##15%## more damage.\n\nACE: ##$pro##\nEnemies you mark take an additional ##25%## damage when further away than ##25## meters.",
				
				--Kilmer (Shock And Awe)
				["menu_shock_and_awe_dmc"] = "Kilmer",
				["menu_shock_and_awe_desc_dmc"] = "BASIC: ##$basic##\nYou reload rifles ##25%## faster.\n\nYour ADS speed with rifles is ##25%## faster.\n\nACE: ##$pro##\nYou can now reload your weapons while sprinting.\n\nYour weapon accuracy while moving with rifles are increased by ##50%##",
				--Ammo Efficiency (Fast Fire)
				["menu_fast_fire_dmc"] = "Ammo Efficiency",
				["menu_fast_fire_desc_dmc"] = "BASIC: ##$basic##\nGetting ##3## headshots in less than ##6## seconds will refund ##1## ammo pickup to your used weapon. Can only be triggered by SMGs and rifles fired in single shot mode.\n\nACE: ##$pro##\nGetting ##2## headshots in less than ##6## seconds will refund ##1## ammo pickup to your used weapon. Can only be triggered by SMGs and rifles fired in single shot mode.",
				
				--Bulletproof (Body Expertise)
				["menu_body_expertise_dmc"] = "Bulletproof",
				["menu_body_expertise_desc_dmc"] = "BASIC: ##$basic##\nImproves your armor so it can absorb ##50%## more damage. \n\nACE: ##$pro##\nThe armor recovery rate of you and your crew is increased by ##25%##.",
			--}
		--}
		
		--[[   GHOST   ]]--
		--{
			--[[   COVERT OPS SUBTREE   ]]--
			--{
				--Chameleon
				["menu_jail_workout_dmc"] = "Chameleon",
				["menu_jail_workout_desc_dmc"] = "BASIC: ##$basic##\nIncreases the time until you start getting detected while in casing mode by ##25%##.\n\nYou can mark enemies and cameras while in casing mode.\n\nACE: ##$pro##\nYou can pick up items while in casing mode.\n\nYou also gain ##30%## more value to items and cash that you pick up.",
				
				--Undertaker (Cleaner)
				["menu_cleaner_dmc"] = "Undertaker",
				["menu_cleaner_desc_dmc"] = "BASIC: ##$basic##\nYou start with ##2## body bags in your inventory and you gain the ability to carry a maximum of ##3## body bags.\n\nACE: ##$pro##\nYou gain the ability to place ##2## body bag cases.",
				--Sixth Sense
				["menu_chameleon_dmc"] = "Sixth Sense",
				["menu_chameleon_desc_dmc"] = "BASIC: ##$basic##\nYou gain the ability to automatically mark enemies within a ##10## meter radius around you after standing still for ##3.5## seconds while in stealth.\n\nACE: ##$pro##\nYou gain access to all insider assets. Cleaning costs after killing a civilian is reduced by ##75%##.",
				
				--Espionage (Undertaker)
				["menu_second_chances_dmc"] = "Espionage",
				["menu_second_chances_desc_dmc"] = "BASIC: ##$basic##\nYou gain the ability to loop ##1## camera for ##25## seconds, temporarily disabling it from detecting you and your crew.\n\nACE: ##$pro##\nYou lockpick ##50%## faster. You also gain the ability to lockpick safes.",
				--ECM Overdrive
				["menu_ecm_booster_dmc"] = "ECM Overdrive",
				["menu_ecm_booster_desc_dmc"] = "BASIC: ##$basic##\nYour ECM jammer and feedback duration is increased by an additional ##25%##.\n\nACE: ##$pro##\nYour ECM jammer can now also be used to open certain electronic door locks.",
				
				--ECM Specialist
				["menu_ecm_2x_dmc"] = "ECM Specialist",
				["menu_ecm_2x_desc_dmc"] = "BASIC: ##$basic##\nYou can now place ##2## ECM jammers instead of just one.\n\nACE: ##$pro##\nYour ECM jammer and feedback duration is increased by an additional ##25%##.\n\nPagers are delayed by the ECM jammer.",
			--}
			
			--[[   COMMANDO SUBTREE   ]]--
			--{
				--Duck and Cover
				["menu_sprinter_dmc"] = "Duck and Cover",
				["menu_sprinter_desc_dmc"] = "BASIC: ##$basic##\nYour stamina starts regenerating ##25%## earlier and ##25%## faster. You also sprint ##25%## faster.\n\nACE: ##$pro##\nYou have a ##25%## increased chance to dodge while sprinting.\n\nYou gain ##15%## chance to dodge while crouching or ziplining.",
				
				--Evasion
				["menu_awareness_dmc"] = "Evasion",
				["menu_awareness_desc_dmc"] = "BASIC: ##$basic##\nYou gain ##10%## additional movement speed and ##20%## ladder climbing speed. \n\nACE: ##$pro##\nYou gain the ability to sprint in any direction.\n\nYour fall damage is reduced by ##75%## and you only take armor damage from falling from non-fatal heights.",
				--Deep Pockets (Thick Skin)
				["menu_thick_skin_dmc"] = "Deep Pockets",
				["menu_thick_skin_desc_dmc"] = "BASIC: ##$basic##\nIncreases the concealment of melee weapons by ##2##.\n\nACE: ##$pro##\nIncreases the armor of all ballistic vests by ##20##.\n\nIncreases the concealment of all ballistic vests by ##4##.",
				
				--Moving Target (Dire Need)
				["menu_dire_need_dmc"] = "Moving Target",
				["menu_dire_need_desc_dmc"] = "BASIC: ##$basic##\nYou gain ##2%## extra movement speed for every ##3## points of concealment under ##35##, up to ##20%##.\n\nACE: ##$pro##\nYou gain ##2%## extra movement speed for every ##1## point of concealment under ##35##, up to ##20%##.",
				--Shockproof
				["menu_insulation_dmc"] = "Shockproof",
				["menu_insulation_desc_dmc"] = "BASIC: ##$basic##\nThe Taser's shock attack has a ##30%## chance to backfire when you get tased, causing the Taser to be knocked back.\n\nACE: ##$pro##\nPressing interact within ##2## seconds of getting tased will free yourself from the Taser.",
				
				--Sneaky Bastard
				["menu_jail_diet_dmc"] = "Sneaky Bastard",
				["menu_jail_diet_desc_dmc"] = "BASIC: ##$basic##\nYou gain a ##1%## dodge chance for every ##3## points of concealment under ##35## up to a maximum of ##10%##.\n\nACE: ##$pro##\nYou gain a ##1%## dodge chance for every ##1## point of concealment under ##35## up to a maximum of ##10%##.",
			--}
			
			--[[   SILENT KILLER SUBTREE   ]]--
			--{
				--Second Wind
				["menu_scavenger_dmc"] = "Second Wind",
				["menu_scavenger_desc_dmc"] = "BASIC: ##$basic##\nWhen your armor breaks you gain ##15%## speed for ##5## seconds.\n\nACE: ##$pro##\nWhen your armor breaks you gain ##30%## speed for ##8## seconds.",
				
				--Optical Illusions
				["menu_optic_illusions_dmc"] = "Optical Illusions",
				["menu_optic_illusions_desc_dmc"] = "BASIC: ##$basic##\nYou gain ##1## concealment for each suppressed weapon you equip.\n\nACE: ##$pro##\nSuppressors with a concealment penalty have their concealment penalty reduced by a maximum ##2##.",
				--The Professional
				["menu_silence_expert_dmc"] = "The Professional",
				["menu_silence_expert_desc_dmc"] = "BASIC: ##$basic##\nYou gain ##8## weapon stability with suppressed weapons.\n\nACE: ##$pro##\nYou gain ##5## weapon accuracy and a ##50%## ADS speed increase with suppressed weapons.",
				
				--Dire Need
				["menu_backstab_dmc"] = "Dire Need",
				["menu_backstab_desc_dmc"] = "BASIC: ##$basic##\nWhen your armor is fully depleted, the first shot on every enemy will cause that enemy to stagger.\n\nThis effect ends when your armor regenerates.\n\nACE: ##$pro##\nThe effect persists for ##5## seconds after your armor has regenerated.",
				--Subsonic Rounds
				["menu_hitman_dmc"] = "Subsonic Rounds",
				["menu_hitman_desc_dmc"] = "BASIC: ##$basic##\nReduces the range penalty of non-internally suppressed weapons by ##25%##.\n\nACE: ##$pro##\nReduces the range penalty of non-internally suppressed weapons by ##50%##.\n\nNote: Suppressor range penalties will only be negated and ##will not add bonus range##.",
				
				--Low Blow (Unseen Strike)
				["menu_unseen_strike_dmc"] = "Low Blow",
				["menu_unseen_strike_desc_dmc"] = "BASIC: ##$basic##\nYou gain a ##3%## critical hit chance for every ##3## points of concealment under ##35## up to a maximum of ##30%##.\n\nACE: ##$pro##\nYou gain a ##3%## critical hit chance for every ##1## point of concealment under ##35## up to a maximum of ##30%##.\n\nNote: Crits will not work on a Bulldozer's body, with explosives or with weapons that deal ##80+## damage (per pellet for shotguns).\n\nSkills that increase damage to ##80 or more## (per pellet for shotguns) do not disable crits.",
			
			--}
		--}
		
		--[[   FUGITIVE   ]]--
		--{
			--[[   GUNSLINGER SUBTREE   ]]--
			--{
				--Equilibrium
				["menu_equilibrium_dmc"] = "Equilibrium",
				["menu_equilibrium_desc_dmc"] = "BASIC: ##$basic##\nDecreases the time it takes to draw and holster pistols by ##80%##.\n\nACE: ##$pro##\nYou and your crew's weapon stability with pistols is increased by ##4##.",
			
				--Gun Nut
				["menu_dance_instructor_dmc"] = "Gun Nut",
				["menu_dance_instructor_desc_dmc"] = "BASIC: ##$basic##\nYou gain ##5## weapon accuracy with pistols.\n\nACE: ##$pro##\nYou gain a ##100%## increased rate of fire with pistols.",
				--Over Pressurized/Custom Ammo (Akimbo)
				["menu_akimbo_skill_dmc"] = "Over Pressurized",
				["menu_akimbo_skill_desc_dmc"] = "BASIC: ##$basic##\nYou reload pistols ##50%## faster.\n\nACE: ##$pro##\nYou deal ##15%## more damage with pistols.",
			
				--Akimbo (Over Pressurized/Custom Ammo)
				["menu_gun_fighter_dmc"] = "Akimbo",
				["menu_gun_fighter_desc_dmc"] = "BASIC: ##$basic##\nYour akimbo weapons' stability penalty is set to ##25%##.\n\nACE: ##$pro##\nYou no longer have a stability penalty with akimbo weapons and you also carry ##50%## more total ammo for them.",
				--Desperado	
				["menu_expert_handling_dmc"] = "Desperado",
				["menu_expert_handling_desc_dmc"] = "BASIC: ##$basic##\nEach successful pistol hit gives you a ##10%## increased accuracy bonus for ##10## seconds and can stack ##4## times.\n\nACE: ##$pro##\nIncreases the accuracy boost duration to ##20## seconds.",
				
				--Trigger Happy	
				["menu_trigger_happy_dmc"] = "Trigger Happy",
				["menu_trigger_happy_desc_dmc"] = "BASIC: ##$basic##\nEach successful pistol hit grants a ##20%## damage boost for ##2## seconds and can stack ##4## times.\n\nACE: ##$pro##\nIncreases the damage boost duration to ##10## seconds.",
			--}
			
			--[[   RELENTLESS SUBTREE   ]]--
			--{
				--Running From Death (Nine Lives)
				["menu_nine_lives_dmc"] = "Running From Death",
				["menu_nine_lives_desc_dmc"] = "BASIC: ##$basic##\nYou reload and swap weapons ##25%## faster for ##10## seconds after getting up.\n\nACE: ##$pro##\nYou move ##25%## faster for ##10## seconds after getting up.",
				
				--Nine Lives (Running From Death)
				["menu_running_from_death_dmc"] = "Nine Lives",
				["menu_running_from_death_desc_dmc"] = "BASIC: ##$basic##\nYou gain a ##100%## increase to bleedout health.\n\nACE: ##$pro##\nYou gain the ability to get downed ##1## more time before going into custody.",
				--Up You Go
				["menu_up_you_go_dmc"] = "Up You Go",
				["menu_up_you_go_desc_dmc"] = "BASIC: ##$basic##\nYou take ##30%## less damage for ##10## seconds after getting up.\n\nACE: ##$pro##\nYou gain ##15%## of your maximum health when getting up.",
				
				--Swan Song
				["menu_perseverance_dmc"] = "Swan Song",
				["menu_perseverance_desc_dmc"] = "BASIC: ##$basic##\nWhen your health reaches ##0##, instead of instantly going down, you gain the ability to keep on fighting for ##5## seconds with a ##60%## movement penalty before going down.\n\nACE: ##$pro##\nYou can fight for an additional ##5## seconds when Swan Song activates.",
				--Undying
				["menu_feign_death_dmc"] = "Undying",
				["menu_feign_death_desc_dmc"] = "BASIC: ##$basic##\nWhen you go down, you have a ##25%## chance to instantly get revived.\n\nACE: ##$pro##\nThe chance to get instantly revived is increased to ##50%##.",
				
				--Messiah
				["menu_pistol_messiah_dmc"] = "Messiah",
				["menu_pistol_messiah_desc_dmc"] = "BASIC: ##$basic##\nWhile in bleedout, killing an enemy will allow you to revive yourself. Press jump to use a messiah charge.\n\nYou only have ##1## charge which is replenished when leaving custody.\n\nACE: ##$pro##\nYou now have a total of ##3## charges which are replenished when leaving custody.",
			--}
			
			--[[   BRAWLER SUBTREE   ]]--
			--{
				--Martial Arts
				["menu_martial_arts_dmc"] = "Martial Arts",
				["menu_martial_arts_desc_dmc"] = "BASIC: ##$basic##\nYou take ##50%## less damage from all melee attacks.\n\nACE: ##$pro##\nYou are ##50%## more likely to knock down enemies with a melee strike.",
				
				--Bloodthirst
				["menu_bloodthirst_dmc"] = "Bloodthirst",
				["menu_bloodthirst_desc_dmc"] = "BASIC: ##$basic##\nEvery kill you get will increase your next melee attack damage by ##25%##, up to a maximum of ##50%##. This effect gets reset when striking an enemy with a melee attack.\n\nACE: ##$pro##\nWhenever you kill an enemy with a melee attack, you will gain a ##25%## increase in reload speed for ##10## seconds.",
				--Pumping Iron
				["menu_steroids_dmc"] = "Pumping Iron",
				["menu_steroids_desc_dmc"] = "BASIC: ##$basic##\nYour melee attacks do ##25%## more damage.\n\nACE: ##$pro##\nYour melee attacks do an additional ##25%## more damage.",
				
				--Counter Strike
				["menu_drop_soap_dmc"] = "Counter Strike",
				["menu_drop_soap_desc_dmc"] = "BASIC: ##$basic##\nWhen charging your melee weapon you will counter attack enemies that try to melee you, knocking them down. The knockdown does not deal any damage.\n\nACE: ##$pro##\nYou gain the ability to counter attack Cloakers and their kicks.",
				--Frenzy (Formerly Berserker)
				["menu_wolverine_dmc"] = "Frenzy",
				["menu_wolverine_desc_dmc"] = "BASIC: ##$basic##\nYou start with and cannot heal above ##15%## of your maximum health.\n\nYou take ##30%## less health damage and healing is reduced by ##75%##.\n\nACE: ##$pro##\nHealth damage taken is now reduced by ##50%## and healing is instead reduced by ##50%##.",
			
				--Berserker (Formerly Frenzy)
				["menu_frenzy_dmc"] = "Berserker",
				["menu_frenzy_desc_dmc"] = "BASIC: ##$basic##\nThe lower your health, the more damage you do.\n\nWhen your health is below ##25%##, you will do up to ##250%## more melee and saw damage.\n\nACE: ##$pro##\nWhen your health is below ##25%##, you will also do up to ##100%## more damage with firearms.",
			--}
		--}
		
	} )

end)

local text_original = LocalizationManager.text
local testAllStrings = false  --Set to true to show all string ID's, false to return to normal.
function LocalizationManager:text(string_id, ...)

	--Movement penalty string
	return string_id == "bm_menu_weapon_movement_penalty_info" and "Base move speed when drawn: "
	
	--Oy Vey Shill stuff
	or string_id == "steam_inventory_boost_xp_cash" and ""
	or string_id == "steam_inventory_boost_xp" and ""
	or string_id == "steam_inventory_boost_cash" and ""
	or string_id == "steam_inventory_team_boost" and ""
	or string_id == "dialog_new_tradable_item_bonus" and ""
	or string_id == "dmc_lolskinboosts" and ""
	
	--armor
	--or string_id == "bm_armor_level_5" and "Flak Jacket A Bigger Shit"
	--or string_id == "bm_armor_level_6" and "Combined Tactical Vest A Shit"
	
	--attachments
	or string_id == "bm_menu_custom" and "Internal Mod"
	or string_id == "bm_menu_extra" and "Rail"
	or string_id == "bm_menu_upper_reciever" and "Upper Body Mod"
	or string_id == "bm_menu_lower_reciever" and "Lower Body Mod"
	or string_id == "bm_menu_slide" and "Barrel/Slide"
	or string_id == "bm_menu_grip" and "Pistol Grip"
	or string_id == "bm_menu_barrel_ext" and "Barrel Extension"
	or string_id == "bm_menu_foregrip" and "Handguard"
	or string_id == "bm_menu_sight" and "Optic"
	or string_id == "bm_menu_bonus" and "Modifier"
	or string_id == "bm_menu_conversion" and "Conversion"
	
	--pseudo-categories
	or string_id == "menu_anti_mat" and "Anti Materiel Rifles"
	or string_id == "menu_pdw" and "PDWs"
	or string_id == "menu_mach_pis" and "Machine Pistols"
	or string_id == "menu_battle_rifle" and "Battle Rifles"
	or string_id == "menu_carbine" and "Carbines"
	or string_id == "menu_gpmg" and "General Purpose Machine Guns"
	or string_id == "menu_revolvo" and "Revolvers"
	or string_id == "menu_nadeshot" and "Launchers"
	or string_id == "menu_robinhood" and "Bows"
	or string_id == "menu_xbow" and "Crossbows"
	or string_id == "menu_flammenwaffer" and "Flamethrowers"
	or string_id == "menu_gatgat" and "Gatling Guns"
	
	--real categories
	or string_id == "menu_pistol" and "Pistols"
	or string_id == "menu_lmg" and "Light Machine Guns"
	or string_id == "menu_shotgun" and "Shotguns"
	or string_id == "menu_assault_rifle" and "Assault Rifles"
	or string_id == "menu_snp" and "Rifles"
	or string_id == "menu_smg" and "Sub-Machine Guns"
	
	--HUD
	or string_id == "menu_hud_cheater" and ""
	or string_id == "hud_hint_bipod_nomount" and "Cannot deploy here"
	
	--characters
	or string_id == "menu_jowi" and "Wick"
	--or string_id == "menu_sydney" and "Le Blue Chiken Hair Lady"
	
	--[[ WE UPOTTE NAO ]]--{
	--[ Faculty ]
	or DMCWO.upotte == true and string_id == "bm_w_m1928" and "Thompson-sensei"
	or DMCWO.upotte == true and string_id == "bm_w_m1928_desc" and "An American elementary school teacher working at Seishou Academy. She's chambered in .45 ACP.\nCheerful but airheaded.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--[ Elementary Schoolers ]
	--MP5
	or DMCWO.upotte == true and string_id == "bm_w_mp5" and "Empi"
	or DMCWO.upotte == true and string_id == "bm_w_mp5_desc" and "A German elementary schooler attending Seishou Academy. She's chambered in 9x19mm.\nPresident of the elementary school student council.\nCan pierce thin walls.\n\nCan switch between full-auto, 3-rnd burst and semi-auto."
	--M10
	or DMCWO.upotte == true and string_id == "bm_w_mac10" and "Emten"
	or DMCWO.upotte == true and string_id == "bm_w_mac10_desc" and "An American elementary schooler attending Seishou Academy. She's chambered in .45 ACP.\nMotor-mouthed and quite \"stacked\".\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--[ Middleschoolers ]
	--AUG
	or DMCWO.upotte == true and string_id == "bm_w_aug" and "AUG"
	or DMCWO.upotte == true and string_id == "bm_w_aug_desc" and "An Austrian middleschooler attending Seishou Academy. She's chambered in 5.56 NATO.\nStrict but reserved.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--M16
	or DMCWO.upotte == true and string_id == "bm_w_m16" and "Ichiroku"
	or DMCWO.upotte == true and string_id == "bm_w_m16_desc" and "An American middleschooler attending Seishou Academy. She's chambered in 5.56 NATO.\nEnergetic and foul-mouthed.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--L85
	or DMCWO.upotte == true and string_id == "bm_w_l85a2" and "Eru"
	or DMCWO.upotte == true and string_id == "bm_w_l85a2_desc" and "A British middleschooler attending Seishou Academy. She's chambered in 5.56 NATO.\nShy and clumsy.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--M4A1
	or DMCWO.upotte == true and string_id == "bm_w_m4" and "Em-Four"
	or DMCWO.upotte == true and string_id == "bm_w_m4_desc" and "An American middleschooler attending Seishou Academy. She's chambered in 5.56 NATO.\nVice-president of the middleschool student council.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--AK74
	or DMCWO.upotte == true and string_id == "bm_w_ak74" and "AK74"
	or DMCWO.upotte == true and string_id == "bm_w_ak74_desc" and "A Russian middleschooler attending Red Steel Academy. She's chambered in 5.45x39.\nSerious and cunning.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--AKM
	or DMCWO.upotte == true and string_id == "bm_w_akm" and "AKM"
	or DMCWO.upotte == true and string_id == "bm_w_akm_desc" and "A Russian middleschooler attending Red Steel Academy. She's chambered in 7.62x39.\nMenacing and a bully.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--RPK
	or DMCWO.upotte == true and string_id == "bm_w_rpk" and "RPK"
	or DMCWO.upotte == true and string_id == "bm_w_rpk_desc" and "A Russian middleschooler attending Red Steel Academy. She's chambered in 7.62x39.\nAgressive but rather simple minded.\nCan pierce enemies and walls."
	--[ Highschoolers ]
	--G3
	or DMCWO.upotte == true and string_id == "bm_w_g3" and "Jiisuri"
	or DMCWO.upotte == true and string_id == "bm_w_g3_desc" and "A German highschooler attending Seishou Academy. She's chambered in 7.62 NATO.\nElegant but a bit of a klutz.\nCan pierce enemies, walls and shields.\nDMC's raifu, treat her well.\n\nCan switch between full-auto and semi-auto."
	--M14
	or DMCWO.upotte == true and string_id == "bm_w_m14" and "Ichiyon"
	or DMCWO.upotte == true and string_id == "bm_w_m14_desc" and "An American highschooler attending Seishou Academy. She's chambered in 7.62 NATO.\nCarefree and filled with puns.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto and semi-auto."
	--FAL
	or DMCWO.upotte == true and string_id == "bm_w_fal" and "Faaru"
	or DMCWO.upotte == true and string_id == "bm_w_fal_desc" and "A Belgian highschooler attending Seishou Academy. She's chambered in 7.62 NATO.\nResponsible and lax.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto and semi-auto."
	--}
	
	--[[ REVOLVER OCELOT ]]--{
	--[[REVOLVER OCELOT]]
	or DMCWO.ocelot == true and string_id == "bm_w_peacemaker" and "Revolver Ocelot"
	or string_id == "bm_w_peacemaker_desc" and "An American single-action Revolver Ocelot with well greased chambers.\nCan torture enemies, and snakes.\nBenefits from Revolver Ocelot skills.\n\n(Revolver Ocelot)"
	--Long
	or DMCWO.reelnaems == true and string_id == "bm_wp_peacemaker_barrel_long" and "12\" Revolver Ocelot"
	or string_id == "bm_wp_peacemaker_barrel_long_desc" and "##20% longer## Revolver Ocelot.\n##5% slower## Revolver Ocelot."
	--Short
	or DMCWO.reelnaems == true and string_id == "bm_wp_peacemaker_barrel_short" and "5.5\" Revolver Ocelot"
	or string_id == "bm_wp_peacemaker_barrel_short_desc" and "##10% shorter## Revolver Ocelot.\n##5% faster## Revolver Ocelot." 
	--Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_peacemaker_handle_bling" and "Engraved Revolver Ocelot Grips"
	--Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_peacemaker_rifle_stock" and "Revolver Ocelot Stock"
	--}
	
	--[[BRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRT]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m134" and "General Electric M134"
	or string_id == "bm_w_m134_desc" and "A 7.62 NATO, electrically powered gatling gun with high suppressive capabilities.\nCan pierce enemies, walls and shields."
	or string_id == "bm_wp_m134_body_upper_light_desc" and "##20% faster## movement.\n##10% faster## reload speeds."
	or DMCWO.reelnaems == true and string_id == "bm_wp_m134_barrel_extreme" and "Anti-Air Barrel"
	or string_id == "bm_wp_m134_barrel_extreme_desc" and "##15% longer## overall range.\n##10% slower## ADS speeds.\n##15% slower## movement."
	or DMCWO.reelnaems == true and string_id == "bm_wp_m134_barrel_short" and "Compact Barrel"
	or string_id == "bm_wp_m134_barrel_short_desc" and "##25% shorter## overall range.\n##10% faster## ADS speeds.\n##20% faster## movement."
	
	--[[WE TERRORIST NAO]]
	or DMCWO.reelnaems == true and string_id == "bm_w_rpg7" and "Bazalt RPG-7"
	or string_id == "bm_w_rpg7_desc" and "A Russian rocket-propelled grenade launcher.\nNo police ammobox pickups.\nDamage boosts from skills do not affect this weapon."
	
	--[[GOLD SLAVSHIT]]
	or DMCWO.reelnaems == true and string_id == "bm_w_akm_gold" and "Gold Plated AKMS"
	or string_id == "bm_w_akm_gold_desc" and "A Russian gold-plated assault rifle chambered in 7.62x39mm.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	
	--[[JAM733]]
	or DMCWO.reelnaems == true and string_id == "bm_w_amcar" and "Colt M733 Commando"
	or string_id == "bm_w_amcar_desc" and "An American carbine chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto.\nBenefits from rifle skills."
	
	--[[STEEL BALLS]]
	or DMCWO.reelnaems == true and string_id == "bm_w_ak74" and "Concern Kalashnikov AKS-74"
	or string_id == "bm_w_ak74_desc" and "A Russian assault rifle chambered in 5.45x39mm.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	
	--[[JAM-4]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m4" and "Colt M4A1" --"Safety Pins"
	or string_id == "bm_w_m4_desc" and "An American assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--Barrels
	or string_id == "bm_wp_m4_uupg_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	or string_id == "bm_wp_m4_uupg_b_short_desc" and "##15% shorter## overall range.\n##5% faster## ADS speeds." 
	--Suppressed Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_uupg_b_sd" and "Suppressed Barrel" 
	or string_id == "bm_wp_m4_uupg_b_sd_desc" and "##Internally suppressed## barrel.\nReduces the weapon's sound radius to ##2 meters.\n10% slower## ADS speeds." 
	--Aftermarket
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_uupg_fg_lr300" and "LR300 Handguard"
	or string_id == "bm_wp_m4_uupg_fg_lr300_desc" and "##7.5% faster## ADS speeds."
	--Competition
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fg_jp" and "JPE Modular Handguard"
	or string_id == "bm_wp_upg_fg_jp_desc" and "##5% faster## ADS speeds." 
	--Gazelle
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fg_smr" and "Geissele Super Modular Rail"
	
	--[[AUGLY]]
	or DMCWO.reelnaems == true and string_id == "bm_w_aug" and "Steyr AUG A2"
	or string_id == "bm_w_aug_desc" and "An Austrian bullpup assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--A3 Tact. Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_aug_fg_a3" and "A3 Rail"
	or string_id == "bm_wp_aug_fg_a3_desc" and "##5% slower## ADS speeds."
	or string_id == "bm_wp_aug_b_short_desc" and "##20% shorter## overall range.\n##5% faster## ADS speeds." 
	or string_id == "bm_wp_aug_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	
	--[[WHITE FLAG]] -- :^)
	or DMCWO.reelnaems == true and string_id == "bm_w_famas" and "Nexter FAMAS F1" --"IS THAT A DEAGLE?"
	or string_id == "bm_w_famas_desc" and "A French bullpup assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto, 3-rnd burst and semi-auto."
	or string_id == "bm_wp_famas_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	or DMCWO.reelnaems == true and string_id == "bm_wp_famas_b_sniper" and "G2 Sniper Barrel"
	or string_id == "bm_wp_famas_b_sniper_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds."
	or DMCWO.reelnaems == true and string_id == "bm_wp_famas_b_short" and "G2 Commando Barrel" 
	or string_id == "bm_wp_famas_b_short_desc" and "##20% shorter## overall range.\n##5% faster## ADS speeds." 
	or string_id == "bm_wp_famas_b_suppressed_desc" and "##Internally suppressed## barrel.\nReduces the weapon's sound radius to ##2 meters.\n##10% slower## ADS speeds."
	--Retro Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_famas_g_retro" and "G1 Kit"
	or string_id == "bm_wp_famas_g_retro_desc" and "ROF ##raised## to ##1200 RPM##"
	
	--[[JAM]]
	or DMCWO.reelnaems == true and string_id == "bm_w_l85a2" and "BAE L85A2" --"Eru"
	or string_id == "bm_w_l85a2_desc" and "A British-German bullpup assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	or DMCWO.reelnaems == true and string_id == "bm_wp_l85a2_b_long" and "Long Barrel"
	or string_id == "bm_wp_l85a2_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_l85a2_b_short" and "Short Barrel"
	or string_id == "bm_wp_l85a2_b_short_desc" and "##15% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_l85a2_g_worn" and "Taped Pistol Grip"
	or DMCWO.reelnaems == true and string_id == "bm_wp_l85a2_fg_short" and "Daniel Defense L85 Quad Rail"
	or string_id == "bm_wp_l85a2_fg_short_desc" and "##5% faster## ADS speeds." 
	
	--[[CROATGAT]]
	or DMCWO.reelnaems == true and string_id == "bm_w_vhs" and "HS Produkt VHS-2"
	or string_id == "bm_w_vhs_desc" and "A Croatian bullpup assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	or DMCWO.reelnaems == true and string_id == "bm_wp_vhs_b_short" and "Short Barrel"
	or string_id == "bm_wp_vhs_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_vhs_b_sniper" and "Sniper Barrel"
	or string_id == "bm_wp_vhs_b_sniper_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_vhs_b_silenced" and "Suppressed Barrel"
	or string_id == "bm_wp_vhs_b_silenced_desc" and "##Internally suppressed## barrel.\nReduces the weapon's sound radius to ##2 meters.\n##10% slower## ADS speeds."
	
	--[[SLAVSHIT]]
	or DMCWO.reelnaems == true and string_id == "bm_w_akm" and "Concern Kalashnikov AKMS"
	or string_id == "bm_w_akm_desc" and "A Russian assault rifle chambered in 7.62x39mm.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	
	--[[MELTGUN]]
	or DMCWO.reelnaems == true and string_id == "bm_w_g36" and "Heckler & Koch G36KV"
	or string_id == "bm_w_g36_desc" and "A German carbine chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto, 2-rnd burst and semi-auto.\nBenefits from rifle skills."
	--Compact
	or DMCWO.reelnaems == true and string_id == "bm_wp_g36_fg_c" and "G36c Kit"
	or string_id == "bm_wp_g36_fg_c_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds."
	--Polizei
	or DMCWO.reelnaems == true and string_id == "bm_wp_g36_fg_ksk" and "Knights Armament Co. RAS Handguard"  
	--Solid Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_g36_s_kv" and "G36KV Stock"
	--Sniper Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_g36_s_sl8" and "SL8 Stock"
	
	--[[PUNS]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m14" and "Springfield M14 DMR"
	or string_id == "bm_w_m14_desc" and "A special DMR version of the American M14 battle rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto and semi-auto."
	--Abraham
	or DMCWO.reelnaems == true and string_id == "bm_wp_m14_body_ebr" and "MK.14 Kit"
	or string_id == "bm_wp_m14_body_ebr_desc" and "##5% slower## ADS speeds\n##5% slower## movement.\nROF ##raised## to ##750 RPM##"
	--Seid ihr das Essen? Nein, wir sind der Jaeger! (watch better anime)
	or DMCWO.reelnaems == true and string_id == "bm_wp_m14_body_jae" and "M14 JAE Kit"
	
	--[[SWED]]
	or DMCWO.reelnaems == true and string_id == "bm_w_ak5" and "Bofors Ak 5" --"FNC's sexy swedish cousin"
	or string_id == "bm_w_ak5_desc" and "A licensed Swedish copy of the Belgian FN FNC assault rifle, chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--Karbin Ceres
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak5_fg_ak5c" and "Ak 5c Kit"
	or string_id == "bm_wp_ak5_fg_ak5c_desc" and "ROF ##lowered## to ##650 RPM.##"
	--Belgian Heat
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak5_fg_fnc" and "FN FNC Kit"
	or string_id == "bm_wp_ak5_fg_fnc_desc" and "Allows for firing in ##3-rounds bursts.##\nROF ##raised## to ##725 RPM.##"
	--Bertil
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak5_s_ak5b" and "Ak 5b Stock"
	--Caesar
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak5_s_ak5c" and "Ak 5c Stock"
	
	--[[JAM16]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m16" and "Colt M16A4" --"Orange Slices", "IS THAT A FAMAS?"
	or string_id == "bm_w_m16_desc" and "An American 5.56 NATO assault rifle.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--Railed
	or DMCWO.reelnaems == true and string_id == "bm_wp_m16_fg_railed" and "Daniel Defense Lite Rail" --not a carbon copy, just based off of, if only for the delta ring dongle thing
	or string_id == "bm_wp_m16_fg_railed_desc" and "##5% slower## ADS speeds."
	--Blast to the Past
	or DMCWO.reelnaems == true and string_id == "bm_wp_m16_fg_vietnam" and "M16A1 Handguard"
	or string_id == "bm_wp_m16_fg_vietnam_desc" and "##5% faster## ADS speeds." 
	or DMCWO.reelnaems == true and string_id == "bm_wp_m16_s_solid" and "M16 Stock"
	or string_id == "bm_wp_m16_s_solid" and "Solid Stock"
	
	--[[553 NO PANTSU]]
	or DMCWO.reelnaems == true and string_id == "bm_w_s552" and "SIG SG 552-2" --"SG550's Little Sister"
	or string_id == "bm_w_s552_desc" and "A Swiss-made carbine chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto, 3-rnd burst and semi-auto.\nBenefits from rifle skills."
	--Enhanced Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_ass_s552_fg_standard_green" and "OD Green Handguard"
	--Enhanced Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_ass_s552_g_standard_green" and "OD Green Pistol Grip"
	--Enhanced Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_ass_s552_s_standard_green" and "OD Green Stock"	
	--Enhanced Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_ass_s552_fg_black" and "Black Handguard"
	--Enhanced Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_ass_s552_g_black" and "Black Pistol Grip"
	--Enhanced Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_ass_s552_s_black" and "Black Stock"
	--Railed Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_ass_s552_fg_railed" and "SIG Railed Handguard" --pretty sure Sig manufactures their own rails for the 552/3. Can't be bothered to look :/
	--Heat Treated
	or DMCWO.reelnaems == true and string_id == "bm_wp_ass_s552_body_standard_black" and "Black Receiver" --GJ, Overkill. Heat treating metal, while it does make it harder, also makes it more brittle. Pretty sure you don't want that in a gun
	--Long Barrel
	or string_id == "bm_wp_ass_s552_b_long_desc" and "##15% longer## overall range.\n5##% slower## ADS speeds."
	
	--[[EAG-H]]
	or DMCWO.reelnaems == true and string_id == "bm_w_scar" and "FN MK.17"
	or string_id == "bm_w_scar_desc" and "A Belgian-American battle rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto and semi-auto."
	--Sniper Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_scar_s_sniper" and "MK.20 Stock"	
	
	or string_id == "bm_wp_scar_b_long_desc" and "##20% longer## overall range.\n##5% slower## ADS speeds."
	
	or string_id == "bm_wp_scar_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--Rail Extension
	or DMCWO.reelnaems == true and string_id == "bm_wp_scar_fg_railext" and "PWS SCAR Rail Extension"
	or string_id == "bm_wp_scar_fg_railext_desc" and "##2.5% slower## ADS speeds."
	
	--[[RIGHT ARM]]
	or DMCWO.reelnaems == true and string_id == "bm_w_fal" and "FN FAL"
	or string_id == "bm_w_fal_desc" and "A Belgian battle rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields.\n\"Right arm of the free world.\"\n\nCan switch between full-auto and semi-auto."
	--CQB
	or DMCWO.reelnaems == true and string_id == "bm_wp_fal_body_standard" and "DSA SA58 Handguard w/Short Barrel" --this might conflict with something since this is also the name_id of the receiver
	or string_id == "bm_wp_fal_body_standard_desc" and "##15% shorter## overall range.\n##5% faster## ADS speeds.\n##5% faster## movement."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_fal_fg_03" and "IMI Romat Handguard"
	or string_id == "bm_wp_fal_fg_03_desc" and "##5% slower## ADS speeds."
	--Marksman
	or DMCWO.reelnaems == true and string_id == "bm_wp_fal_fg_04" and "DSA Freefloat Handguard"
	--or string_id == "bm_wp_fal_fg_04_desc" and "##5% faster## ADS speeds." 
	--Wood
	or DMCWO.reelnaems == true and string_id == "bm_wp_fal_fg_wood" and "Wooden Handguard"
	or string_id == "bm_wp_fal_fg_wood_desc" and "##7.5% slower## ADS speeds.\n##5% slower## movement."
	--Tactical Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_fal_g_01" and "Tapco FAL/SAW Pistol Grip"
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_fal_m_01" and "30rnd FAL Magazine"
	or string_id == "bm_wp_fal_m_01_desc" and "##10% slower## reload speeds."
	--Folding
	or DMCWO.reelnaems == true and string_id == "bm_wp_fal_s_01" and "Sidefolding Stock"
	--Marksman
	or DMCWO.reelnaems == true and string_id == "bm_wp_fal_s_03" and "Magpul FAL PRS Stock"
	
	--[[BOTTLE OPENER]]
	or DMCWO.reelnaems == true and string_id == "bm_w_galil" and "IMI Galil ARM"
	or string_id == "bm_w_galil_desc" and "An Israeli battle rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto and semi-auto."
	--Sniper
	or DMCWO.reelnaems == true and string_id == "bm_wp_galil_fg_sniper" and "IMI Galatz Handguard & Sniper Barrel"
	or string_id == "bm_wp_galil_fg_sniper_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds.\nROF ##lowered## to ##630 RPM.##"
	--Light
	or DMCWO.reelnaems == true and string_id == "bm_wp_galil_fg_sar" and "IMI Galil SAR Handguard & 13\" Barrel"
	or string_id == "bm_wp_galil_fg_sar_desc" and "##5% faster ADS## speeds." 
	--CQB
	or DMCWO.reelnaems == true and string_id == "bm_wp_galil_fg_mar" and "IMI Galil MAR Handguard & 7\" Barrel"
	or string_id == "bm_wp_galil_fg_mar_desc" and "##10% shorter## overall range.\n##15% faster## ADS speeds.\n##10% faster## movement.\nROF ##raised## to ##720 RPM.##"
	--FAB
	or DMCWO.reelnaems == true and string_id == "bm_wp_galil_fg_fab" and "FAB Defense VFR GA Handguard"
	--Sniper Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_galil_g_sniper" and "IMI Galatz Pistol Grip"
	--Sniper Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_galil_s_sniper" and "IMI Galatz Wooden Stock"
	--Skeletal Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_galil_s_skeletal" and "IMI Galil MAR Stock"
	--Light Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_galil_s_light" and "IMI Galatz Skeleton Stock"
	--FAB Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_galil_s_fab" and "FAB Defense MG-CP Cheek Pad"
	
	--[[MAI RAIFU (SHE'S MINE I TELL YOU)]]
	or DMCWO.reelnaems == true and string_id == "bm_w_g3" and "Heckler & Koch G3"
	or string_id == "bm_w_g3_desc" and "A German battle rifle based off the Spanish CETME, chambered in 7.62 NATO.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto and semi-auto."
	--Assault Kit
	or DMCWO.reelnaems == true and string_id == "bm_wp_g3_b_short" and "Short Barrel"
	or string_id == "bm_wp_g3_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--DMR Kit
	or DMCWO.reelnaems == true and string_id == "bm_wp_g3_b_sniper" and "PSG-1 Barrel"
	or string_id == "bm_wp_g3_b_sniper_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##25% greater## minimum damage.\n##10% slower## ADS speeds."
	--PSG Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_g3_fg_psg" and "PSG-1 Handguard"
	or string_id == "bm_wp_g3_fg_psg_desc" and "##5% slower## ADS speeds."
	--Railed Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_g3_fg_railed" and "FAB Defense G3-RS Handguard"
	--Retro Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_g3_fg_retro" and "Wooden Slimline Handguard"
	or string_id == "bm_wp_g3_fg_retro_desc" and "##7.5% slower## ADS speeds.\n##5% faster## movement."
	--Plastic Retro Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_g3_fg_retro_plastic" and "Slimline Handguard"
	or string_id == "bm_wp_g3_fg_retro_plastic_desc" and "##5% faster## ADS speeds.\n##10% faster## movement."
	--Retro Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_g3_g_retro" and "G3 Ergo Grip"
	or string_id == "bm_wp_g3_g_retro_desc" and "##5% faster## ADS speeds." 
	--Sniper Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_g3_g_sniper" and "PSG-1 Wooden Pistol Grip"
	--Sniper Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_g3_s_sniper" and "PSG-1 Stock"

	
	--[[Rattlesnake]]
	or DMCWO.reelnaems == true and string_id == "bm_w_msr" and "Remington MSR"
	or string_id == "bm_w_msr_desc" and "An American bolt-action rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields."
	--Suppressor
	or DMCWO.reelnaems == true and string_id == "bm_wp_snp_msr_ns_suppressor" and "AAC TiTAN-QD Suppressor"
	or string_id == "bm_wp_snp_msr_ns_suppressor_desc" and "A ##large## suppressor.\nReduces the weapon's sound radius to ##2 meters.\n20% shorter## overall range.\n##10% slower## ADS speeds."
	or string_id == "bm_wp_snp_msr_b_long_desc" and "##15% longer## overall range.\n##10% slower## ADS speeds."
	--Aluminum Body
	or DMCWO.reelnaems == true and string_id == "bm_wp_msr_body_msr" and "MSR Aluminum Stock & Receiver"
	or string_id == "bm_wp_msr_body_msr_desc" and "##5% faster## ADS speeds." 
	
	--[[R93]]
	or DMCWO.reelnaems == true and string_id == "bm_w_r93" and  "Blaser R93 Tactical 2"
	or string_id == "bm_w_r93_desc" and "A German bolt-action rifle chambered in .338 Lapua Magnum.\nCan pierce enemies, walls and shields."
	
	or string_id == "bm_wp_r93_b_short_desc" and  "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	or DMCWO.reelnaems == true and string_id == "bm_wp_r93_b_suppressed" and  "Harvester Big Bore 338 Suppressor"
	or string_id == "bm_wp_r93_b_suppressed_desc" and  "A ##large## suppressor.\n##20% shorter## overall range.\nReduces the weapon's sound radius to ##2 meters.\n##10% slower## ADS speeds."
	--Wooden Body
	or DMCWO.reelnaems == true and string_id == "bm_wp_r93_body_wood" and "Long Range Sporter 2 Stock"
	or string_id == "bm_wp_r93_body_wood_desc" and "##2.5% slower## ADS speeds."
	
	--[[FIDDY CAL]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m95" and "Barrett M95"
	or string_id == "bm_w_m95_desc" and "An American .50 BMG, bolt-action, bullpup anti-materiel rifle.\nCan pierce enemies, walls and shields.\nThis weapon does not benefit from damage boosts from skills and cannot deal critical hits."
	--Tank Buster
	or DMCWO.reelnaems == true and string_id == "bm_wp_m95_b_barrel_long" and "Long Barrel w/AW50F Muzzle Brake"
	or string_id == "bm_wp_m95_b_barrel_long_desc" and "##15% longer## overall range.\n##10% slower## ADS speeds.\n##5% slower## movement."
	or string_id == "bm_wp_m95_b_barrel_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds.\n##5% faster## movement."
	or string_id == "bm_wp_m95_b_barrel_suppressed_desc" and "##Internally suppressed## barrel.\nReduces the weapon's sound radius to ##2 meters.\n15% slower## ADS speeds.\n##15% slower## movement."
	
	--[[MOIST NUGGET]]
	or DMCWO.reelnaems == true and string_id == "bm_w_mosin" and "Mosin Nagant M91/30"
	or string_id == "bm_w_mosin_desc" and "A Russian bolt-action rifle chambered in 7.62x54R.\nCan pierce enemies, walls and shields.\nCan mount a bayonet."
	
	or string_id == "bm_wp_mosin_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or string_id == "bm_wp_mosin_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_mosin_b_sniper" and "Nagant Suppressor"--"\"Bramit\" Device"
	or string_id == "bm_wp_mosin_b_sniper_desc" and "A ##large## 7.62x54R suppressor.\n##20% shorter## overall range.\nReduces the weapon's sound radius to ##2 meters.\n7.5% slower## ADS speeds."
	--Black Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_mosin_body_conceal" and "Black Synthetic Stock"
	
	
	--[[ELMER FUDD]]
	or DMCWO.reelnaems == true and string_id == "bm_w_huntsman" and "Mosconi Coach Gun"
	or string_id == "bm_w_huntsman_desc" and "A side-by-side, break-action shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types.\n\nCan switch between single-trigger and dual-trigger."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_huntsman_b_short" and "Sawn-Off Short Barrel"
	or string_id == "bm_wp_huntsman_b_short_desc" and "##20% shorter## overall range.\n##5% faster## ADS speeds." 
	or DMCWO.reelnaems == true and string_id == "bm_wp_huntsman_s_short" and "Sawn-Off Stock"
	
	--[[BARDODA SHOTGAT]]
	or DMCWO.reelnaems == true and string_id == "bm_w_b682" and "Beretta 682"
	or string_id == "bm_w_b682_desc" and "An Italian, over-under, break-action shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	or DMCWO.reelnaems == true and string_id == "bm_wp_b682_b_short" and "Sawn-Off Short Barrel"
	or string_id == "bm_wp_b682_b_short_desc" and "##20% shorter## overall range.\n##5% faster## ADS speeds." 
	or DMCWO.reelnaems == true and string_id == "bm_wp_b682_s_short" and "Sawn-Off Stock"
	or DMCWO.reelnaems == true and string_id == "bm_wp_b682_s_ammopouch" and "Ammo Pouch"
	
	--[[870]]
	or DMCWO.reelnaems == true and string_id == "bm_w_r870" and "Remington Model 870" --"Remafdng"
	or string_id == "bm_w_r870_desc" and "An American, tube fed, pump-action shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_r870_m_extended" and "R870 Lighter Magazine Spring"
	or string_id == "bm_wp_r870_m_extended_desc" and "##5% faster## reload speeds."
	--Zombie Hunter
	or DMCWO.reelnaems == true and string_id == "bm_wp_r870_fg_wood" and "Wooden Pump"
	or string_id == "bm_wp_r870_fg_wood_desc" and "##5% slower## ADS speeds."
	--Short Enough **don't know
	or DMCWO.reelnaems == true and string_id == "bm_wp_r870_s_nostock" and "No Stock"
	--Short Enough Tact. **don't know
	or DMCWO.reelnaems == true and string_id == "bm_wp_r870_s_nostock_big" and "No Stock w/Full Length Rail"
	--Govt. Stock **don't know
	or DMCWO.reelnaems == true and string_id == "bm_wp_r870_s_solid_big" and "Fixed Stock w/Full Length Rail"
	
	--[[CATS]]
	or DMCWO.reelnaems == true and string_id == "bm_w_saiga" and "Concern Kalashnikov Saiga-12K"
	or string_id == "bm_w_saiga_desc" and "A Russian, magazine fed, fully automatic shotgun based off the AK platform, loaded with 12-gauge shells.\nCan be loaded with special ammo types.\n\nCan switch between full-auto and semi-auto."
	--Tact. Russian
	or DMCWO.reelnaems == true and string_id == "bm_wp_saiga_fg_lowerrail" and "Ultimak AK Modular Rail Forend System"
	or string_id == "bm_wp_saiga_fg_lowerrail_desc" and "##5% slower## ADS speeds."
	--Saiga 20 rounder
	or DMCWO.reelnaems == true and string_id == "bm_wp_saiga_m_20rnd" and "20rnd MD Arms Saiga Drum"
	or string_id == "bm_wp_saiga_m_20rnd_desc" and "##15% slower## reload speeds."
	
	--[[AA12]]
	or DMCWO.reelnaems == true and string_id == "bm_w_aa12" and "MPS Auto Assault-12 CQB"
	or string_id == "bm_w_aa12_desc" and "An American, magazine fed, fully automatic shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	or DMCWO.reelnaems == true and string_id == "bm_wp_aa12_mag_drum" and "20rnd AA-12 Drum"
	or string_id == "bm_wp_aa12_mag_drum_desc" and "##15% slower## reload speeds."
	or string_id == "bm_wp_aa12_barrel_long" and "Standard Barrel"
	or string_id == "bm_wp_aa12_barrel_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	or string_id == "bm_wp_aa12_barrel_silenced_desc" and "##Internally suppressed## barrel.\nReduces the weapon's sound radius to ##2 meters.\n10% slower## ADS speeds."
	
	--[[M1014]]
	or DMCWO.reelnaems == true and string_id == "bm_w_benelli" and "Benelli M4"
	or string_id == "bm_w_benelli_desc" and "An Italian, tube fed, semi-automatic shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	--Long Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_ben_b_long" and "Long Barrel w/7-Shot Tube"
	or string_id == "bm_wp_ben_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	--Short Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_ben_b_short" and "NFA Barrel w/4-Shot Tube"
	or string_id == "bm_wp_ben_b_short_desc" and "##20% shorter## overall range.\n##5% faster## ADS speeds." 
	--Collapsed Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_ben_s_collapsed" and "M1014 Collapsed Stock"
	--Solid Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_ben_fg_standard" and "M1014 Solid Stock" --same deal with the FAL, possible conflict
	
	--[[KELTEC]]
	or DMCWO.reelnaems == true and string_id == "bm_w_ksg" and "Kel-Tec KSG"
	or string_id == "bm_w_ksg_desc" and "An American, dual tube fed, pump-action bullpup shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	--Long Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_ksg_b_long" and "Long Barrel w/2x 8-Shot Tubes"
	or string_id == "bm_wp_ksg_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	--Short Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_ksg_b_short" and "Patrol Barrel w/2x 6-Shot Tubes"
	or string_id == "bm_wp_ksg_b_short_desc" and "##15% shorter## overall range.\n##5% faster## ADS speeds." 
	
	--[[WHY DON'T YOU TAKE A SEAT OVER THERE?]]
	or DMCWO.reelnaems == true and string_id == "bm_w_spas12" and "Franchi SPAS-12"
	or string_id == "bm_w_spas12_desc" and "An Italian, tube fed shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types.\n\nCan switch between pump-action and semi-automatic fire.\n\n\"I have no need for filthy language and idle threats...\""
	or DMCWO.reelnaems == true and string_id == "bm_wp_spas12_b_long" and "SPAS-12 8-Shot Tube Magazine"
	or string_id == "bm_wp_spas12_b_long_desc" and "##5% slower## ADS speeds."
	
	--[[STREET SWEEPER]]
	or DMCWO.reelnaems == true and string_id == "bm_w_striker" and "Armsel Striker"
	or string_id == "bm_w_striker_desc" and "A South-African, cylinder fed, semi-automatic shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	or DMCWO.reelnaems == true and string_id == "bm_wp_striker_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	or string_id == "bm_wp_striker_b_suppressed_desc" and "##Internally suppressed## barrel.\nReduces the weapon's sound radius to ##2 meters.\n10% slower## ADS speeds." 
	
	--[[BABBY 870]]
	or DMCWO.reelnaems == true and string_id == "bm_w_serbu" and "Short Remington Model 870"
	or string_id == "bm_w_serbu_desc" and "An American, tube fed, pump-action shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_shorty_m_extended_short" and "R870 Light Magazine Spring"
	or string_id == "bm_wp_shorty_m_extended_short_desc" and "##2.5% faster## reload speeds."
	--Standard
	or DMCWO.reelnaems == true and string_id == "bm_wp_r870_s_solid" and "Fixed Stock"
	--Police Shorty
	or DMCWO.reelnaems == true and string_id == "bm_wp_serbu_s_solid_short" and "Fixed Stock w/Rail"
	--Tactical Shorty
	or DMCWO.reelnaems == true and string_id == "bm_wp_serbu_s_nostock_short" and "No Stock w/Rail"
	
	--[[LONGCAT]]
	or DMCWO.reelnaems == true and string_id == "bm_w_rpk" and "Concern Kalashnikov RPK"
	or string_id == "bm_w_rpk_desc" and "A Russian LMG chambered in 7.62x39mm.\nCan pierce enemies and walls."
	--Tactical Forgrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_rpk_fg_standard" and "Polymer Handguard"
	or string_id == "bm_wp_rpk_fg_standard_desc" and "##5% faster## ADS speeds." 
	--Plastic Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_rpk_s_standard" and "Polymer Stock"
	
	--[[KSP]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m249" and "FN Paratrooper M249"
	or string_id == "bm_w_m249_desc" and "A Belgian-American LMG chambered in 5.56 NATO.\nCan pierce enemies and walls."
	--Railed Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_m249_fg_mk46" and "MK.46 Handguard"
	or string_id == "bm_wp_m249_fg_mk46_desc" and "##5% slower## ADS speeds."
	--Solid Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_m249_s_solid" and "M249 Solid Stock"
	--LB
	or string_id == "bm_wp_m249_b_long_desc" and "##10% longer## overall range.\n##5% slower## ADS speeds."
	
	--[[RELATED TO RAIFU]]
	or DMCWO.reelnaems == true and string_id == "bm_w_hk21" and "Heckler & Koch HK21E" --"Related to mai raifu"
	or string_id == "bm_w_hk21_desc" and "A German GPMG chambered in 7.62 NATO.\nCan pierce enemies, walls and shields."
	--Short Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_hk21_fg_short" and "HK21 Short Handguard"
	or string_id == "bm_wp_hk21_fg_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds.\n##10% faster## movement."
	or DMCWO.reelnaems == true and string_id == "bm_wp_hk21_g_ergo" and "HK21 Ergo Grip"
	or string_id == "bm_wp_hk21_g_ergo_desc" and "##5% faster## ADS speeds." 
	--LB
	or string_id == "bm_wp_hk21_b_long_desc" and "##10% longer## overall range.\n##5% slower## ADS speeds."
	
	--[[KERBEROS]]
	or DMCWO.reelnaems == true and string_id == "bm_w_mg42" and "Mauser Maschinengewehr 42"
	or string_id == "bm_w_mg42_desc" and "A German GPMG chambered in 7.92x57mm.\nCan pierce enemies, walls and shields.\n\n\"And then the wolf... ate up Little Red Riding Hood\""
	--Light Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_mg42_b_mg34" and "Maschinengewehr 34 Barrel"
	or string_id == "bm_wp_mg42_b_mg34_desc" and "##5% faster## ADS speeds.\nROF ##lowered## to ##900 RPM.##"
	--Heat Sink (Star Wars)
	or DMCWO.reelnaems == true and string_id == "bm_wp_mg42_b_vg38" and "BlasTech DLT-19 Barrel"
	or string_id == "bm_wp_mg42_b_vg38_desc" and "Fire \"special\" rounds.\n##Can only penetrate body armor.##\nROF ##lowered## to ##600 RPM.##"
	
	--[[M240]]
	--See: actually a KSP58 trying to look like an M240
	or DMCWO.reelnaems == true and string_id == "bm_w_par" and "FN M240B"
	or string_id == "bm_w_par_desc" and "A Belgian GPMG chambered in 7.62 NATO.\nCan pierce enemies, walls and shields."
	--Plastic Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_par_s_plastic" and "M240B Stock"
	--SB
	or DMCWO.reelnaems == true and string_id == "bm_wp_par_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds."
	
	--[[GORDON]]
	or DMCWO.reelnaems == true and string_id == "bm_w_usp" and "Heckler & Koch USP Tactical"
	or DMCWO.reelnaems == true and string_id == "bm_w_x_usp" and "Akimbo H&K USP Tacticals"
	or string_id == "bm_w_usp_desc" and "A German handgun chambered in .45 ACP.\nCan pierce enemies and walls."
	or string_id == "bm_w_x_usp_desc" and "A pair of German handguns chambered in .45 ACP.\nCan pierce enemies and walls.\n\nCan switch between single-fire, dual-fire and auto-fire.\n\nWhile auto-firing, ROF is lowered by 50% and the effects of Gun Nut Aced are not accounted for."
	--Ventilated .45 **don't know
	--or string_id == "bm_wp_usp_co_comp_1" and "Ventilated .45 Compensator" --I question the existence of this compensator
	--Velocity .45
	or DMCWO.reelnaems == true and string_id == "bm_wp_usp_co_comp_2" and "SJC Compensator .45" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_usp_m_extended" and "20rnd USP Magazine"
	or string_id == "bm_wp_pis_usp_m_extended_desc" and "##10% slower## reload speeds."
	--Expert
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_usp_b_expert" and "USP Expert Slide"
	--Match
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_usp_b_match" and "USP Match Slide"
	or string_id == "bm_wp_pis_usp_b_match_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[GRENADE 22]]
	or DMCWO.reelnaems == true and string_id == "bm_w_g22c" and "Glock 22C"
	or DMCWO.reelnaems == true and string_id == "bm_w_x_g22c" and "Akimbo Glock 22Cs"
	or string_id == "bm_w_g22c_desc" and "An Austrian handgun chambered in .40 S&W.\nCan pierce walls."
	or string_id == "bm_w_x_g22c_desc" and "A pair of Austrian handguns chambered in .40 S&W.\nCan pierce walls.\n\nCan switch between single-fire, dual-fire and auto-fire.\n\nWhile auto-firing, ROF is lowered by 50% and the effects of Gun Nut Aced are not accounted for."
	--Long Slide
	or DMCWO.reelnaems == true and string_id == "bm_wp_g22c_b_long" and "Glock 35 Compensated Slide"
	or string_id == "bm_wp_g22c_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[GRENADE 17]]
	or DMCWO.reelnaems == true and string_id == "bm_w_glock_17" and "Glock 17"
	or DMCWO.reelnaems == true and string_id == "bm_w_x_g17" and "Akimbo Glock 17s"
	or string_id == "bm_w_glock_17_desc" and "An Austrian handgun chambered in 9x19mm.\nCan pierce thin walls."
	or string_id == "bm_w_x_g17_desc" and "A pair of Austrian handguns chambered in 9x19mm.\nCan pierce thin walls.\n\nCan switch between single-fire, dual-fire and auto-fire.\n\nWhile auto-firing, ROF is lowered by 50% and the effects of Gun Nut Aced are not accounted for."
	
	--[[GRENADE 26]]
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_g26" and  "Glock 26"
	or DMCWO.reelnaems == true and string_id == "bm_w_jowi" and  "Akimbo Glock 26s"
	or string_id == "bm_wp_pis_g26_desc" and "An Austrian handgun chambered in 9x19mm.\nCan pierce thin walls."
	or string_id == "bm_w_jowi_desc" and "A pair of Austrian handguns chambered in 9x19mm.\nCan pierce thin walls.\n\nCan switch between single-fire, dual-fire and auto-fire.\n\nWhile auto-firing, ROF is lowered by 50% and the effects of Gun Nut Aced are not accounted for."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_g26_body_salient" and  "Stipled Tan Frame"
	or DMCWO.reelnaems == true and string_id == "bm_wp_g26_b_custom" and  "Brushed Metal Frame"
	or DMCWO.reelnaems == true and string_id == "bm_wp_g26_m_custom" and  "G26 Stipled Tan Magazine"
	or string_id == "bm_wp_g26_m_custom_desc" and  "##15% faster## reload speeds."
	
	--[[FAWHTY FAHVE]]
	or DMCWO.reelnaems == true and string_id == "bm_w_colt_1911" and "Springfield Operator 1911" 
	or DMCWO.reelnaems == true and string_id == "bm_w_x_1911" and "Akimbo Springfield Operator 1911s" 
	or string_id == "bm_w_colt_1911_desc" and "An American handgun chambered in .45 ACP.\nCan pierce enemies and walls."
	or string_id == "bm_w_x_1911_desc" and "A pair of American handguns chambered in .45 ACP.\nCan pierce enemies and walls.\n\nCan switch between single-fire, dual-fire and auto-fire.\n\nWhile auto-firing, ROF is lowered by 50% and the effects of Gun Nut Aced are not accounted for."
	--Aggressor
	or DMCWO.reelnaems == true and string_id == "bm_wp_1911_co_2" and "TCII Compensator" --Not 100% but seems to be based off of it
	--Punisher
	or DMCWO.reelnaems == true and string_id == "bm_wp_1911_co_1" and "Clark Heavy Pinmaster" --Not 100% but seems to be based off of it
	--Ergo Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_1911_g_ergo" and "Pachmayr 1911 Grip" 
	or string_id == "bm_wp_1911_g_ergo_desc" and "##5% faster## ADS speeds." 
	--Wood Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_1911_g_bling" and "Walnut Grips." 
	--Engraved Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_1911_g_engraved" and "Custom Engraved 1911 Grips" 
	--Long
	or DMCWO.reelnaems == true and string_id == "bm_wp_1911_b_long" and "Compensated Long Barrel & Slide" 
	or string_id == "bm_wp_1911_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	--Vented
	or DMCWO.reelnaems == true and string_id == "bm_wp_1911_b_vented" and "Compensated Two-Tone Slide"
	or DMCWO.reelnaems == true and string_id == "bm_wp_1911_m_extended" and "10rnd 1911 Magazine"
	or string_id == "bm_wp_1911_m_extended_desc" and "##2.5% slower## reload speeds."
	
	--[[BARDODA]]
	or DMCWO.reelnaems == true and string_id == "bm_w_b92fs" and "Beretta 92FS"
	or DMCWO.reelnaems == true and string_id == "bm_w_x_b92fs" and "Akimbo Beretta 92FSs"	
	or string_id == "bm_w_b92fs_desc" and "An Italian handgun chambered in 9x19mm.\nCan pierce thin walls."
	or string_id == "bm_w_x_b92fs_desc" and "A pair of Italian handguns chambered in 9x19mm.\nCan pierce thin walls.\n\nCan switch between single-fire, dual-fire and auto-fire.\n\nWhile auto-firing, ROF is lowered by 50% and the effects of Gun Nut Aced are not accounted for.\n\n\"Don't be stupid! This is more entertaining than Hollywood is ever gonna be! \""
	--Professional
	or DMCWO.reelnaems == true and string_id == "bm_wp_beretta_co_co1" and "SGS Compensator" --Original name was a reference to the movie "The Professional"
	--Competitor
	or DMCWO.reelnaems == true and string_id == "bm_wp_beretta_co_co2" and "Competition Compensator" --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models were based off of airsoft counterparts
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_beretta_m_extended" and "30rnd 92FS Magazine"
	or string_id == "bm_wp_beretta_m_extended_desc" and "##5% slower## reload speeds."
	--Elite Slide
	or DMCWO.reelnaems == true and string_id == "bm_wp_beretta_sl_brigadier" and "Brigadier Elite Slide"
	--Ergo
	or DMCWO.reelnaems == true and string_id == "bm_wp_beretta_g_ergo" and "Walnut Ergo Grips"
	--Engraved
	or DMCWO.reelnaems == true and string_id == "bm_wp_beretta_g_engraved" and "Custom Engraved 92FS Grips"
		
	--[[HUEHUEHUEHUE]]
	or DMCWO.reelnaems == true and string_id == "bm_w_raging_bull" and "Taurus Raging Bull"
	or string_id == "bm_w_raging_bull_desc" and "A Brazilian revolver chambered in .44 Magnum.\nCan pierce enemies, walls and shields\nBenefits from pistol skills."
	--Mount
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_rage_extra" and "Raging Bull Scope Mount"
	--Aggressor
	or DMCWO.reelnaems == true and string_id == "bm_wp_rage_b_comp1" and "S&W V-Compensator"
	--Pocket
	or DMCWO.reelnaems == true and string_id == "bm_wp_rage_b_short" and "Snub Nose Barrel"
	or string_id == "bm_wp_rage_b_short_desc" and "##25% shorter## overall range.\n##5% faster## ADS speeds." 
	--Ventilated
	or DMCWO.reelnaems == true and string_id == "bm_wp_rage_b_comp2" and "S&W Muzzle Compensator"
	or string_id == "bm_wp_rage_b_comp2_desc" and "Vents muzzle flash to the sides."
	--Overcompensating
	or DMCWO.reelnaems == true and string_id == "bm_wp_rage_b_long" and "Long Barrel"
	or string_id == "bm_wp_rage_b_long_desc" and "##10% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[HUEHUEHUEHUE BUT IT'S A SHOTGUN]]
	or DMCWO.reelnaems == true and string_id == "bm_w_judge" and "Taurus 4510PLYFS"
	or DMCWO.judge_pistol == true and string_id == "bm_w_judge_desc" and "Also known as \"The Judge\".\nA Brazilian revolver loaded with .410 bore shells.\nCan be loaded with special ammo types.\nBenefits from pistol skills."
	or string_id == "bm_w_judge_desc" and "Also known as \"The Judge\".\nA Brazilian revolver loaded with .410 bore shells.\nCan be loaded with special ammo types.\nBenefits from shotgun skills."
	
	--[[GRENADE 18]]
	or DMCWO.reelnaems == true and string_id == "bm_w_glock_18c" and "Glock 18C"
	or string_id == "bm_w_glock_18c_desc" and "An Austrian machine pistol chambered in 9x19mm.\nCan pierce thin walls.\nBenefits from pistol skills.\nIs not affected by Gun Nut Aced.\n\nCan switch between full-auto and semi-auto."
	--Ventilated **don't know
	--or string_id == "bm_wp_g18c_co_1" and "Ventilated Compensator" --I question the existence of this compensator
	--Velocity
	or DMCWO.reelnaems == true and string_id == "bm_wp_g18c_co_comp_2" and "SJC Compensator 9mm"
	
	--[[DEAGLE]]
	or DMCWO.reelnaems == true and string_id == "bm_w_deagle" and "IMI Desert Eagle Mark XIX" --"IS THAT A M16?"
	or DMCWO.reelnaems == true and string_id == "bm_w_x_deagle" and "Akimbo IMI Desert Eagles"
	or string_id == "bm_w_deagle_desc" and "An Israeli-American handgun chambered in .50 AE.\nCan pierce enemies, walls and shields.\n\n\"I won't rely on anyone anymore!\""
	or string_id == "bm_w_x_deagle_desc" and "A pair of Israeli-American handguns chambered in .50 AE.\nCan pierce enemies, walls and shields.\n\nCan switch between single-fire, dual-fire and auto-fire.\n\nWhile auto-firing, ROF is lowered by 50% and the effects of Gun Nut Aced are not accounted for."
	--Mount
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_deagle_extra" and "Desert Eagle Scope Mount"
	--La Femme
	or DMCWO.reelnaems == true and string_id == "bm_wp_deagle_co_short" and "Desert Eagle Muzzle Brake" --Original name was a reference to a 1990s film only for the gun's appearance in it, otherwise this is based on a real attachment
	--Overkill
	or DMCWO.reelnaems == true and string_id == "bm_wp_deagle_co_long" and "Custom Barrel Weight" --Attachment is a reference to the Boondock Saints
	or string_id == "bm_wp_deagle_co_long_desc" and "##5% slower## ADS speeds." 
	--Ergo
	or DMCWO.reelnaems == true and string_id == "bm_wp_deagle_g_ergo" and "Pachmayr Desert Eagle Grip" --These don't exist but it's the same model from the 1911 but enlarged so w/e
	or string_id == "bm_wp_deagle_g_ergo_desc" and "##5% faster## ADS speeds." 
	--Bling
	or DMCWO.reelnaems == true and string_id == "bm_wp_deagle_g_bling" and "Desert Eagle Pearl Grips"
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_deagle_m_extended" and "10rnd Desert Eagle Magazine" --Given the length of the mag and considering the .50 AE variant is single stack only, this is the only choice. Not that it matters that there's more ammo than what's stated *cough* 1911 12rnd Mag *cough*
	or string_id == "bm_wp_deagle_m_extended_desc" and "##5% slower## reload speeds." 
	--Long Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_deagle_b_long" and "10\" Long Barrel"
	or string_id == "bm_wp_deagle_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	
	--[[JAMES BOND]]
	or DMCWO.reelnaems == true and string_id == "bm_w_ppk" and "Walther PPK"
	or string_id == "bm_w_ppk_desc" and "A German handgun chambered in .32 ACP.\nCan pierce thin walls."
	--Laser Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_ppk_g_laser" and "Crimson Trace Laser Grip"
	--Long Side
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_ppk_b_long" and "PPKS Slide"
	
	--[[40 SW IS A SHIT ROUND]]
	or DMCWO.reelnaems == true and string_id == "bm_w_p226" and "Sig Sauer P226R"
	or string_id == "bm_w_p226_desc" and "A Swiss-made handgun chambered in .40 S&W.\nCan pierce walls."
	--Ventilated .40 **don't know
	--or string_id == "bm_wp_p226_co_comp_1" and "Ventilated .40 Compensator" --I question the existence of this compensator
	--Velocity .40
	or DMCWO.reelnaems == true and string_id == "bm_wp_p226_co_comp_2" and "SJC Compensator .40" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_p226_m_extended" and "22rnd P226 Magazine" --Not too sure if this exists, just basing it off of the fact the "22" is plastered all over the damn thing
	or string_id == "bm_wp_p226_m_extended_desc" and "##10% slower## reload speeds."
	--Two-Tone
	or DMCWO.reelnaems == true and string_id == "bm_wp_p226_b_equinox" and "Equinox Duo-Tone Slide"
	--Long Slide
	or DMCWO.reelnaems == true and string_id == "bm_wp_p226_b_long" and "Brushed Long Slide"
	or string_id == "bm_wp_p226_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[LEO]]
	or DMCWO.reelnaems == true and string_id == "bm_w_hs2000" and "Springfield Armory XD(M)-40" --Fuck the texture labels, it's a XD(M)
	or string_id == "bm_w_hs2000_desc" and "A Croatian-American handgun chambered in .40 S&W.\nCan pierce walls."
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_hs2000_m_extended" and "22rnd XD(M)-40 Magazine"
	or string_id == "bm_wp_hs2000_m_extended_desc" and "##5% slower## reload speeds."
	--Custom Slide
	or DMCWO.reelnaems == true and string_id == "bm_wp_hs2000_sl_custom" and "Compensated Slide"
	or string_id == "bm_wp_hs2000_sl_custom_desc" and "##5% faster## ADS speeds." 
	--Long Slide
	or DMCWO.reelnaems == true and string_id == "bm_wp_hs2000_sl_long" and "Custom Slide"
	
	--[[RED 9]]
	or DMCWO.reelnaems == true and string_id == "bm_w_c96" and "Mauser C96"
	or string_id == "bm_w_c96_desc" and "A German handgun chambered in 7.63x25mm that can be converted to full-auto.\nCan pierce enemies and walls."
	--Long Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_c96_b_long" and "Carbine Barrel"
	or string_id == "bm_wp_c96_b_long_desc" and "##20% longer## overall range.\n##10% slower## ADS speeds."
	--Han Solo
	or DMCWO.reelnaems == true and string_id == "bm_wp_c96_nozzle" and "DL-44 Muzzle"
	or string_id == "bm_wp_c96_nozzle_desc" and "Fire \"special\" rounds.\n##Can only penetrate body armor.##\nROF ##lowered## to ##250 RPM.##"
	--Scope
	or DMCWO.reelnaems == true and string_id == "bm_wp_c96_sight" and "Schmidt & Bender 1-8x24 PM Short Dot"
	or string_id == "bm_wp_c96_sight_desc" and "High power scope.\n##40% slower## ADS speeds."
	--20rnd Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_c96_m_extended" and "20rnd C96 Magazine"

	--[[EVENFASTERRUNONSENTENCES]]
	or DMCWO.reelnaems == true and string_id == "bm_w_cobray" and "Cobray M11/9"
	or string_id == "bm_w_cobray_desc" and "An American machine pistol chambered in 9x19mm.\nCan pierce thin walls.\nBenefits from SMG skills.\n\nCan switch between full-auto and semi-auto."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_cobray_ns_barrelext" and "MAC Barrel Extension"
	or string_id == "bm_wp_cobray_ns_barrelext_desc" and "##10% slower## ADS speeds."
	or DMCWO.reelnaems == true and string_id == "bm_wp_cobray_ns_silencer" and "SIONICS Suppressor"	
	or string_id == "bm_wp_cobray_ns_silencer_desc" and "A ##specialized## suppressor.\nReduces the weapon's sound radius to ##2 meters.\n10% shorter## overall range.\n##10% slower## ADS speeds."	
	
	--[[RUNONSENTENCES]]
	or DMCWO.reelnaems == true and string_id == "bm_w_mac10" and "Ingram M10"
	or string_id == "bm_w_mac10_desc" and "An American machine pistol chambered in .45 ACP.\nCan pierce enemies and walls\nBenefits from SMG skills.\n\nCan switch between full-auto and semi-auto."
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_mac10_m_extended" and "30rnd M10 Magazine"
	or string_id == "bm_wp_mac10_m_extended_desc" and "##5% slower## reload speeds."
	--Railed Handguard
	or DMCWO.reelnaems == true and string_id == "bm_wp_mac10_body_ris" and "MAC Rail System" --I'm getting nothing but airsoft results so generic name
	or string_id == "bm_wp_mac10_body_ris_desc" and "##5% slower## ADS speeds."
	--Skeletal Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_mac10_s_skel" and "Low Mount Skeleton Stock"	
	
	--[[THOMPSON SENSEI]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m1928" and "Auto-Ordnance M1928"
	or string_id == "bm_w_m1928_desc" and "An American sub-machine gun chambered in .45 ACP.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--Short Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_m1928_b_short" and "Short Barrel"	
	or string_id == "bm_wp_m1928_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or string_id == "bm_wp_m1928_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	--Dis. Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_m1928_fg_discrete" and "Synthetic Foregrip"	--for once it's actually a foregrip
	or string_id == "bm_wp_m1928_fg_discrete_desc" and "##5% faster## ADS speeds." 	--for once it's actually a foregrip
	--Dis. Pistol Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_m1928_g_discrete" and "Synthetic Pistol Grip"	
	or string_id == "bm_wp_m1928_g_discrete_desc" and "##5% faster## ADS speeds." 	
	--Dis. Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_m1928_s_discrete" and "Synthetic Stock"
	or string_id == "bm_wp_m1928_s_discrete_desc" and "##2.5% faster## movement."
	or string_id == "bm_wp_m1928_s_nostock_desc" and "##5% faster## movement."
	
	
	--[[MAI RAIFU'S LITTLE SISTER AND STUDENT COUNCIL PRESIDENT OF THE ELEMETARY SCHOOL]]
	or DMCWO.reelnaems == true and string_id == "bm_w_mp5" and "Heckler & Koch MP5A4" --"Empi"
	or DMCWO.reelnaems == true and string_id == "bm_w_x_mp5" and "Akimbo MP5A4s" --"Empi"
	or string_id == "bm_w_mp5_desc" and "A German sub-machine gun chambered in 9x19mm.\nCan pierce thin walls.\n\nCan switch between full-auto, 3-rnd burst and semi-auto."
	or string_id == "bm_w_x_mp5_desc" and "A pair of German sub-machine guns chambered in 9x19mm.\nCan pierce thin walls.\n\nCan switch between full-auto, semi-auto (dual-fired) and semi-auto (alternating)."
	--Sehr Kurze
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp5_fg_m5k" and "MP5k Tri-Rail Kit"
	or string_id == "bm_wp_mp5_fg_m5k_desc" and "##15% shorter## overall range.\n##5% faster## ADS speeds.\nROF ##raised## to ##900 RPM.##"
	--Polizei Tactical
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp5_fg_mp5a5" and "MP5 Railed Handguard"
	--Ninja
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp5_fg_mp5sd" and "MP5SD Kit"
	or string_id == "bm_wp_mp5_fg_mp5sd_desc" and "##Internally suppressed## barrel.\nReduces the weapon's sound radius to ##2 meters.##\nROF ##lowered## to ##700 RPM.##"
	--Adjustable
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp5_s_adjust" and "Retractable Stock"
	--Bare Essentials
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp5_s_ring" and "No Stock" --"No Pantsu"
	--MP5 Drum
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp5_m_drum" and "110rnd GSG-5 .22lr Drum"
	or string_id == "bm_wp_mp5_m_drum_desc" and ".22lr conversion for the MP5.\n##15% shorter## overall range.\n##15% slower## reload speeds."

	--[[SLING STOCKS ARE 2LEWD]]
	or DMCWO.reelnaems == true and string_id == "bm_w_mp9" and "Brugger & Thomet TP9SF"
	or string_id == "bm_w_mp9_desc" and "A Swiss-made machine pistol chambered in 9x19mm.\nBenefits from SMG skills.\n\nCan switch between full-auto and semi-auto."
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp9_m_extended" and "30rnd MP9 Magazine"
	or string_id == "bm_wp_mp9_m_extended_desc" and "##5% slower## reload speeds."
	--Skeletal Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp9_s_skel" and "Steyr TMP Fixed Stock"
	
	--[[IT STINGS]]
	or DMCWO.reelnaems == true and string_id == "bm_w_scorpion" and "CZ Skorpion vz. 61"
	or string_id == "bm_w_scorpion_desc" and "A Czechoslovakian sub-machine gun chambered in .32 ACP.\nCan pierce thin walls.\n\nCan switch between full-auto and semi-auto."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_scorpion_m_extended" and "Dual Magazines"
	or string_id == "bm_wp_scorpion_m_extended_desc" and "##20% faster## reload speeds."
	
	or string_id == "bm_wp_scorpion_g_ergo_desc" and "##5% faster## ADS speeds."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_scorpion_b_suppressed" and "Skorpion Suppressor"
	or string_id == "bm_wp_scorpion_b_suppressed_desc" and "A ##specialized## suppressor for the Skorpion.\nReduces the weapon's sound radius to ##2 meters.\n10% shorter## overall range.\n##7.5% slower## ADS speeds."
	
	--[[NOT THE STUDENT COUNCIL PRESIDENT (get FUCKED)]]
	or DMCWO.reelnaems == true and string_id == "bm_w_uzi" and "IMI Uzi"
	or string_id == "bm_w_uzi_desc" and "An Israeli sub-machine gun chambered in 9x19mm.\nCan pierce thin walls.\n\nCan switch between full-auto and semi-auto."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_uzi_s_solid" and "Wooden Stock"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_uzi_fg_rail" and "FAB Defense Uzi Tri-Rail System"
	or string_id == "bm_wp_uzi_fg_rail_desc" and "##5% faster## ADS speeds." 
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_uzi_b_suppressed" and "IMI Two-Stage Suppressor" --It's IMI made but it was never imported. No idea what the model name is.
	or string_id == "bm_wp_uzi_b_suppressed_desc" and "A ##specialized## suppressor for the Uzi.\nReduces the weapon's sound radius to ##2 meters.\n10% shorter## overall range.\n##7.5% slower## ADS speeds."
	
	--[[B-BAKA]]
	or DMCWO.reelnaems == true and string_id == "bm_w_baka" and "IMI Micro Uzi"
	or string_id == "bm_w_baka_desc" and "An Israeli machine pistol chambered in 9x19mm.\nCan pierce thin walls.\nBenefits from SMG skills.\n\nCan switch between full-auto and semi-auto."
	
	or string_id == "bm_wp_baka_b_smallsupp_desc" and "A ##small## suppressor for the Micro Uzi.\nReduces the weapon's sound radius to ##10 meters.\n10% shorter## overall range.\n##5% slower## ADS speeds."
	or string_id == "bm_wp_baka_b_midsupp_desc" and "A ##medium## suppressor for the Micro Uzi.\nReduces the weapon's sound radius to ##6 meters.\n20% shorter## overall range.\n##7.5% slower## ADS speeds."
	or string_id == "bm_wp_baka_b_longsupp_desc" and "A ##large## suppressor for the Micro Uzi.\nReduces the weapon's sound radius to ##2 meters.\n30% shorter## overall range.\n##10% slower## ADS speeds."
	
	--[[S-COOL SHOOTINGS]]
	or DMCWO.reelnaems == true and string_id == "bm_w_tec9" and "Intratec TEC-9"
	or string_id == "bm_w_tec9_desc" and "A Swedish-American handgun chambered in 9x19mm that can be converted to full-auto.\nCan pierce thin walls."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_tec9_b_standard" and "AB-10 Barrel"
	or string_id == "bm_wp_tec9_b_standard_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_tec9_ns_ext" and "TEC-9 Pseudo Barrel Extension"
	or string_id == "bm_wp_tec9_ns_ext_desc" and "##5% slower## ADS speeds."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_tec9_s_unfolded" and "Interdynamic MP-9 Wire Stock"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_tec9_m_extended" and "50rnd TEC-9 Magazine"
	or string_id == "bm_wp_tec9_m_extended_desc" and "##10% slower## reload speeds."
	
	--[[I PLAE SAINTS ROW]]
	or DMCWO.reelnaems == true and string_id == "bm_w_sr2" and "TsNIITochMash SR-2M \"Veresk\""
	or string_id == "bm_w_sr2_desc" and "A Russian PDW chambered in 9x21mm.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto and semi-auto."
	or DMCWO.reelnaems == true and string_id == "bm_w_x_sr2" and "Akimbo SR-2Ms"
	or string_id == "bm_w_x_sr2_desc" and "A pair of Russian PDWs chambered in 9x21mm.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto, semi-auto (dual-fired) and semi-auto (alternating)."
	--Suppressor
	or string_id == "bm_wp_sr2_ns_silencer_desc" and "A ##specialized## suppressor for the SR-2M.\nReduces the weapon's sound radius to ##2 meters.\n10% shorter## overall range.\n##7.5% slower## ADS speeds."
	
	--[[NOT A STEN]]
	or DMCWO.reelnaems == true and string_id == "bm_w_sterling" and "Sterling L2A1"
	or string_id == "bm_w_sterling_desc" and "A British sub-machine gun chambered in 9x19mm.\nCan pierce thin walls.\n\nCan switch between full-auto and semi-auto."
	--Supp. Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_sterling_b_suppressed" and "L34A1 Barrel"
	or string_id == "bm_wp_sterling_b_suppressed_desc" and "##Internally suppressed## barrel.\nReduces the weapon's sound radius to ##2 meters.\n10% slower## ADS speeds."
	--Heat Sink Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_sterling_b_e11" and "BlasTech E-11 Barrel"
	or string_id == "bm_wp_sterling_b_e11_desc" and "Fire \"special\" rounds.\n##Can only penetrate body armor.##\nLocks fire mode to ##semi-auto.##\nROF ##lowered## to ##300 RPM.##"
	
	or string_id == "bm_wp_sterling_b_long_desc" and "##10% longer## overall range.\n##5% slower## ADS speeds."
	
	or string_id == "bm_wp_sterling_b_short_desc" and "##25% shorter## overall range.\n##5% faster## ADS speeds." 
	--10rnd Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_sterling_m_short" and "10rnd L2A1 Magazine"
	or string_id == "bm_wp_sterling_m_short_desc" and "##20% faster## reload speeds."
	--34rnd Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_sterling_m_long" and "34rnd L2A1 Magazine"
	or string_id == "bm_wp_sterling_m_long_desc" and "##10% slower## reload speeds."

	--[[BABBY AR]]
	or DMCWO.reelnaems == true and string_id == "bm_w_olympic" and "Olympic Arms K23B Tactical"
	or string_id == "bm_w_olympic_desc" and "An American carbine chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto.\nBenefits from rifle skills."
	
	--Railed Handguard
	or DMCWO.reelnaems == true and string_id == "bm_wp_olympic_fg_railed" and "KAC Free Float Handguard" --a super short version at that, shares the delta ring so I'm assuming this is what it's based off of
	--Shorter Than Short
	or DMCWO.reelnaems == true and string_id == "bm_wp_olympic_s_short" and "Buffer Tube Stock" 
	or string_id == "bm_wp_m4_uupg_b_medium_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[BABBY SLAVSHIT]]
	or DMCWO.reelnaems == true and string_id == "bm_w_akmsu" and "Soviet Union AKMSU"
	or DMCWO.reelnaems == true and string_id == "bm_w_x_akmsu" and "Akimbo AKMSUs"
	or string_id == "bm_w_akmsu_desc" and "A Russian carbine chambered in 7.62x39mm.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto.\nBenefits from rifle skills."
	or string_id == "bm_w_x_akmsu_desc" and "A pair of Russian carbines chambered in 7.62x39mm.\nCan pierce enemies and walls.\n\nCan switch between full-auto, semi-auto (dual-fired) and semi-auto (alternating).\nBenefits from rifle skills."
	--Moscow Special
	or DMCWO.reelnaems == true and string_id == "bm_wp_akmsu_fg_rail" and "Samson K-Rail" --Seems to be loosely based off of the Samson K-Rail, it's the only thing that looked remotely like this
	or string_id == "bm_wp_akmsu_fg_rail_desc" and "##5% slower## ADS speeds."
	
	--[[OVERPRICED 22LR]]
	or DMCWO.reelnaems == true and string_id == "bm_w_p90" and "FN P90 TR"
	or string_id == "bm_w_p90_desc" and "A Belgian bullpup personal defence weapon chambered in 5.7x28mm.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto and semi-auto.\n\n\"Is a girl with a mechanical body ordinary?\""
	--Long Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_p90_b_long" and "PS90 Barrel"
	or string_id == "bm_wp_p90_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[LOL SWEDS]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m45" and "Carl Gustaf Kpist M/45"
	or string_id == "bm_w_m45_desc" and "A Swedish sub-machine gun chambered in 9x19mm.\nCan pierce thin walls."
	--Short Barrel
	or string_id == "bm_wp_smg_m45_b_small_desc" and "##20% shorter## overall range.\n##7.5% faster## ADS speeds." 
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_smg_m45_m_extended" and "50rnd M/45 Magazine"
	or string_id == "bm_wp_smg_m45_m_extended_desc" and "##10% slower## reload speeds." 
	
	--[[YOU SUCK AND WE HATE YOU]]
	or DMCWO.reelnaems == true and string_id == "bm_w_mp7" and "Heckler & Koch MP7A2"
	or string_id == "bm_w_mp7_desc" and "A German personal defence weapon chambered in 4.6x30mm.\nCan pierce enemies, walls and shields.\n\nCan switch between full-auto and semi-auto."
	--B&T Suppressor
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp7_b_suppressed" and "B&T MP7 Rotex-II Suppressor"	
	or string_id == "bm_wp_mp7_b_suppressed_desc" and "A ##specialized## suppressor for the MP7.\nReduces the weapon's sound radius to ##2 meters.\n10% shorter## overall range.\n##7.5% slower## ADS speeds."	
	--Extended Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp7_m_extended" and "MP7 40rnd Magazine"
	or string_id == "bm_wp_mp7_m_extended_desc" and "##5% slower## reload speeds."
	--Extended Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp7_s_long" and "Extended Stock"
	
	--[[DEMOMAN]]
	or DMCWO.reelnaems == true and string_id == "bm_w_gre_m79" and "Springfield Armory M79 Grenade Launcher"
	or string_id == "bm_w_gre_m79_desc" and "An American, single-shot, break-action grenade launcher loaded with 40mm grenades.\nCan fire incendiary rounds.\nDamage boosts from skills do not affect this weapon."
	
	--[[NADE SPAM]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m32" and "Milkor Grenade Launcher"
	or string_id == "bm_w_m32_desc" and "A South-African cylinder-fed grenade launcher loaded with 40mm grenades.\nCan fire incendiary rounds.\nDamage boosts from skills do not affect this weapon."
	
	--[[HONG MEI LING]]
	or DMCWO.reelnaems == true and string_id == "bm_w_china" and "\"China Lake\" Grenade Launcher"
	or string_id == "bm_w_china_desc" and "An American pump-action grenade launcher loaded with 40mm grenades.\nCan fire incendiary rounds.\nDamage boosts from skills do not affect this weapon."
	
	--[[REVOLVER OCELOT]]
	or DMCWO.reelnaems == true and string_id == "bm_w_peacemaker" and "Colt Single Action Army" --"Revolver Ocelot"
	or string_id == "bm_w_peacemaker_desc" and "An American single-action revolver chambered in .45 Colt.\nCan pierce enemies, walls and shields.\nBenefits from pistol skills.\n\n\"This is the best handgun ever made\""
	--Long
	or DMCWO.reelnaems == true and string_id == "bm_wp_peacemaker_barrel_long" and "12\" Barrel"
	or string_id == "bm_wp_peacemaker_barrel_long_desc" and "##20% longer## overall range.\n##5% slower## ADS speeds."
	--Short
	or DMCWO.reelnaems == true and string_id == "bm_wp_peacemaker_barrel_short" and "5.5\" Barrel"
	or string_id == "bm_wp_peacemaker_barrel_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_peacemaker_handle_bling" and "Engraved SAA Grips"
	--Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_peacemaker_rifle_stock" and "Skeletal Stock"
		
	--[[Winchester]]--
	or DMCWO.reelnaems == true and string_id == "bm_w_winchester1874" and "Winchester Model 1873"
	or string_id == "bm_w_winchester1874_desc" and "An American, tube fed, lever-action rifle chambered in .44-40 Winchester.\nHas high damage drop-off compared to other rifles.\nCan pierce enemies, walls and shields."
	--Long
	or DMCWO.reelnaems == true and string_id == "bm_wp_winchester_b_long" and "Long Barrel"
	or string_id == "bm_wp_winchester_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	--Supp
	or DMCWO.reelnaems == true and string_id == "bm_wp_winchester_b_suppressed" and "Suppressor"
	or string_id == "bm_wp_winchester_b_suppressed_desc" and "A ##medium## suppressor.\n##20% shorter## overall range.\nReduces the weapon's sound radius to ##2 meters.\n7.5% slower## ADS speeds."
	
	or string_id == "bm_wp_winchester_sniper_scope_desc" and "High power scope\n##10% slower## ADS speeds."
	
	--[[HANG YOUR GAMES]]
	or string_id == "bm_w_plainsrider_desc" and "A wooden bow and arrow.\nCan fire explosive tipped arrows.\nNon-exploded arrows can be retrieved and fired again.\nNo police ammobox pickups."
	
	--[[TOASTY]]
	or string_id == "bm_w_flamethrower_mk2_desc" and "A gasoline flamethrower capable of shooting out to 20 meters.\nCan also use propane and napalm.\n50% chance to set targets aflame within 15 meters.\nThis weapon cannot deal critical hits."
	or string_id == "bm_wp_fla_mk2_mag_rare" and "Propane"
	or string_id == "bm_wp_fla_mk2_mag_rare_desc" and "Use propane as fuel instead of gasoline.\nEffective range ##decreased to 10 meters.\n25% chance## to set targets aflame within ##7.5 meters.##"
	or string_id == "bm_wp_fla_mk2_mag_welldone" and "Napalm"
	or string_id == "bm_wp_fla_mk2_mag_welldone_desc" and "Use napalm as fuel instead of gasoline.\nEffective range ##increased to 30 meters.\n75% chance## to set targets aflame within ##22.5 meters.##"
	
	--[[TOGUSA]] --GiTS references abound!
	or DMCWO.reelnaems == true and string_id == "bm_w_mateba" and "Mateba 2006M"
	or string_id == "bm_w_mateba_desc" and "An Italian revolver chambered in .357 Magnum.\nCan pierce enemies and walls\nBenefits from pistol skills.\n\n\"Ангелы и демоны кружили надо мной,\nРазбивали тернии и звёздные пути,\nНе знает счастья только тот,\nКто его зова понять не смог\""
	--Long
	or DMCWO.reelnaems == true and string_id == "bm_wp_2006m_b_long" and "8\" Barrel"
	or string_id == "bm_wp_2006m_b_long_desc" and "##10% longer## overall range.\n##5% slower## ADS speeds."
	--Med
	or DMCWO.reelnaems == true and string_id == "bm_wp_2006m_b_medium" and "5\" Barrel"
	--Short
	or DMCWO.reelnaems == true and string_id == "bm_wp_2006m_b_short" and "2\" Barrel"
	or string_id == "bm_wp_2006m_b_short_desc" and "##15% shorter## overall range.\n##5% faster## ADS speeds." 
	
	--[[AS Val]]
	or DMCWO.reelnaems == true and string_id == "bm_w_asval" and "Tula Arms AS \"Val\""
	or string_id == "bm_w_asval_desc" and "An internally suppressed Russian assault rifle, chambered in 9x39mm.\nHas a sound radius of 2 meters.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto."
	--Short
	or DMCWO.reelnaems == true and string_id == "bm_wp_asval_b_proto" and "Prototype Barrel"
	or string_id == "bm_wp_asval_b_proto_desc" and "##Removes the suppressor.##\n##10% longer## overall range.\nIncreases the weapon's sound radius to ##150 meters.\n5% faster## ADS speeds."
	--VSS
	or DMCWO.reelnaems == true and string_id == "bm_wp_asval_s_solid" and "VSS Kit"
	or string_id == "bm_wp_asval_s_solid_desc" and "ROF ##lowered## to ##600 RPM.##"
		
	--[[SUB 2000]]
	or DMCWO.reelnaems == true and string_id == "bm_w_sub2000" and "Kel-Tec SUB-2000"
	or string_id == "bm_w_sub2000_desc" and "An American carbine chambered in 9x19mm.\nCan pierce thin walls.\nBenefits from pistol skills." 
	--Handguards
	or DMCWO.reelnaems == true and string_id == "bm_wp_sub2000_fg_gen2" and "Gen2 Handguard"
	or string_id == "bm_wp_sub2000_fg_gen2_desc" and "##5% faster## ADS speeds."
	or DMCWO.reelnaems == true and string_id == "bm_wp_sub2000_fg_railed" and "Red Lion R6 Handguard"
	or string_id == "bm_wp_sub2000_fg_railed_desc" and "##5% slower## ADS speeds."
	or DMCWO.reelnaems == true and string_id == "bm_wp_sub2000_fg_suppressed" and "Quad Rail Handguard w/Suppressor"
	or string_id == "bm_wp_sub2000_fg_suppressed_desc" and "A ##large## suppressor.\nReduces the weapon's sound radius to ##2 meters.\n10% shorter## overall range.\n##10% slower## ADS speeds."
	
	--XXX Boner
	or DMCWO.reelnaems == true and string_id == "bm_w_hunter" and "Avalanche CB1-50 Pistol Grip Crossbow"
	or string_id == "bm_w_hunter_desc" and "A handheld crossbow.\nNo police ammobox pickups.\nNon-exploded bolts can be retrieved and fired again.\nDamage boosts from skills do not affect this weapon."
	
	or DMCWO.reelnaems == true and string_id == "bm_w_frankish" and "Basic Crossbow"
	or string_id == "bm_w_frankish_desc" and "A basic wooden crossbow.\nNo police ammobox pickups.\nNon-exploded bolts can be retrieved and fired again.\nDamage boosts from skills do not affect this weapon."
	
	or DMCWO.reelnaems == true and string_id == "bm_w_arblast" and "Arbalest Crossbow"
	or string_id == "bm_w_arblast_desc" and "A heavy crossbow used during the 12th century.\nNo police ammobox pickups.\nNon-exploded bolts can be retrieved and fired again.\nDamage boosts from skills do not affect this weapon."
	
	--[[2000 crying babies]]
	or DMCWO.reelnaems == true and string_id == "bm_w_wa2000" and "Walther WA2000"
	or string_id == "bm_w_wa2000_desc" and "A German semi-automatic bullpup rifle chambered in .300 Winchester Magnum.\nCan pierce enemies, walls and shields."
	--Long
	or DMCWO.reelnaems == true and string_id == "bm_wp_wa2000_b_long" and "Long Barrel"
	or string_id == "bm_wp_wa2000_b_long_desc" and "##15% longer## overall range.\n##7.5% slower## ADS speeds."
	--Supp.
	or DMCWO.reelnaems == true and string_id == "bm_wp_wa2000_b_suppressed" and "Suppressor"
	or string_id == "bm_wp_wa2000_b_suppressed_desc" and "A ##large## suppressor.\n##10% shorter## overall range.\n##10% slower## ADS speeds."
	--Light
	or DMCWO.reelnaems == true and string_id == "bm_wp_wa2000_g_light" and "Lightweight Furniture"
	or string_id == "bm_wp_wa2000_g_light_desc" and "##5% faster## ADS speeds.\n##10% faster## movement."
	--Black
	or DMCWO.reelnaems == true and string_id == "bm_wp_wa2000_g_stealth" and "Black Furniture"
	--Walnut
	or DMCWO.reelnaems == true and string_id == "bm_wp_wa2000_g_walnut" and "Walnut Furniture"
	or string_id == "bm_wp_wa2000_g_walnut_desc" and "##5% slower## ADS speeds."
	
	--[[Vector]]
	or DMCWO.reelnaems == true and string_id == "bm_w_polymer" and "KRISS Vector SMG"
	or string_id == "bm_w_polymer_desc" and "A recoil mitigating American sub-machine gun chambered in .45 ACP.\nCan pierce enemies and walls.\n\nCan switch between full-auto, 2-rnd burst and semi-auto."
	--CRB
	or DMCWO.reelnaems == true and string_id == "bm_wp_polymer_barrel_precision" and "CRB Barrel w/Shroud"
	or string_id == "bm_wp_polymer_barrel_precision_desc" and "##20% longer## overall range.\n##10% slower## ADS speeds."
	--Supp
	or DMCWO.reelnaems == true and string_id == "bm_wp_polymer_ns_silencer" and "Defiance HPS 4GSK Suppressor"
	or string_id == "bm_wp_polymer_ns_silencer_desc" and "A ##specialized## suppressor.\nReduces the weapon's sound radius to ##2 meters.\n10% shorter## overall range.\n##10% slower## ADS speeds."
	
	--[[JERRY CAN]]
	or DMCWO.reelnaems == true and string_id == "bm_w_sparrow" and "IMI JERICHO 941 RPL"
	or string_id == "bm_w_sparrow_desc" and "An Israeli handgun based off the Czechoslovakian CZ-75, chambered in 9x19mm.\nCan pierce thin walls.\n\n\"Bang...\""
	or DMCWO.reelnaems == true and string_id == "bm_wp_sparrow_body_941" and "IMI JERICHO 941 F Kit"
	or string_id == "bm_wp_sparrow_g_cowboy" and "Weighted Grip"
	or string_id == "bm_wp_sparrow_g_cowboy_desc" and "YOU'RE GONNA CARRY THAT WEIGHT."
	
	--[[Model 70]]
	or DMCWO.reelnaems == true and string_id == "bm_w_model70" and "Winchester Model 70"
	or string_id == "bm_w_model70_desc" and "An American bolt-action rifle chambered in .300 Winchester Magnum.\nCan pierce enemies, walls and shields."
	--Suppressor
	or string_id == "bm_wp_model70_ns_suppressor_desc" and "A ##large## suppressor.\nReduces the weapon's sound radius to ##2 meters.\n20% shorter## overall range.\n##10% slower## ADS speeds."
	
	--[[Model 37]]
	or DMCWO.reelnaems == true and string_id == "bm_w_m37" and "Ithaca Model 37 Homeland Security"
	or string_id == "bm_w_m37_desc" and "An American, tube fed, pump-action shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types.\n\nCan be slam-fired for an increase in rate of fire at the cost of reduced accuracy and stability."
	or string_id == "bm_wp_m37_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds."
	
	--[[PL-14]]
	or DMCWO.reelnaems == true and string_id == "bm_w_pl14" and "Concern Kalashnikov PL-14 \"Lebedev\""
	or string_id == "bm_w_pl14_desc" and "A Russian prototype handgun chambered in 9x19mm.\nCan pierce thin walls."
	--Barrel Ext.
	or DMCWO.reelnaems == true and string_id == "bm_wp_pl14_m_extended" and "PL-14 Magazine Extension"
	or string_id == "bm_wp_pl14_m_extended_desc" and "##2.5% slower## reload speeds."
	--Barrel Ext.
	or DMCWO.reelnaems == true and string_id == "bm_wp_pl14_b_comp" and "Ported Compensator"
	or string_id == "bm_wp_pl14_b_comp_desc" and "Vents muzzle flash to the sides"

	--[[LOL DRUMS]]
	or DMCWO.reelnaems == true and string_id == "bm_w_tecci" and "Heckler & Koch HK416-C"
	or string_id == "bm_w_tecci_desc" and "A German carbine chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto and semi-auto.\nBenefits from rifle skills."
	or DMCWO.reelnaems == true and string_id == "bm_wp_tecci_b_long" and "Long Barrel"
	or string_id == "bm_wp_tecci_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	or DMCWO.reelnaems == true and string_id == "bm_wp_tecci_ns_special" and "JPE Recoil Eliminator Muzzle Brake"
	or string_id == "bm_wp_tecci_ns_special_desc" and "Vents muzzle flash to the sides." 
	
	--[[Muh Range]]
	or DMCWO.reelnaems == true and string_id == "bm_w_boot" and "Winchester Model 1887"
	or string_id == "bm_w_boot_desc" and "An American lever-action shotgun loaded with 10-gauge shells.\nCan be loaded with special ammo types."
	--Long Barrel
	or string_id == "bm_wp_boot_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	--Short Barrel
	or string_id == "bm_wp_boot_b_short_desc" and "##20% shorter## overall range.\n##5% faster## ADS speeds." 
	--Body
	or DMCWO.reelnaems == true and string_id == "bm_wp_boot_body_exotic" and "Case Hardened Reciever"
	
	--[[Not the same Bren]]
	or DMCWO.reelnaems == true and string_id == "bm_w_hajk" and "CZ 805 BREN"
	or string_id == "bm_w_hajk_desc" and "A Czechoslovakian assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls.\n\nCan switch between full-auto, 2-rnd burst and semi-auto.\nBenefits from rifle skills."
	--Short Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_hajk_b_short" and "A2 Barrel"
	or string_id == "bm_wp_hajk_b_short_desc" and "##15% shorter## overall range.\n##5% faster## ADS speeds." 
	
	--[[WEAPON MODS]]
	--Ported
	or DMCWO.reelnaems == true and string_id == "bm_wp_ns_battle" and "Battlecomp 2.0 Compensator"
	--MP5 10mm Magazine
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp5_m_straight" and "30rnd MP5/10 10mm Magazine"
	or string_id == "bm_wp_mp5_m_straight_desc" and "10mm Auto conversion for the MP5.\n##5% slower## reload speeds."
	--AK5 CQB
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak5_b_short" and "Short Barrel" 
	or string_id == "bm_wp_ak5_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--AUG Raptor
	or DMCWO.reelnaems == true and string_id == "bm_wp_aug_body_f90" and "Thales F90 Body Kit"
	or string_id == "bm_wp_aug_body_f90_desc" and "ROF ##raised## to ##850 RPM.##"
	--SALVO
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_sho_salvo_large" and "SilencerCo Salvo 12 Suppressor"
	or string_id == "bm_wp_upg_ns_sho_salvo_large_desc" and "A ##large## shotgun suppressor.\nReduces the weapon's sound radius to ##2 meters.\n30% shorter## overall range.\n##10% slower## ADS speeds."
	--MP9 Suppressor
	or DMCWO.reelnaems == true and string_id == "bm_wp_mp9_b_suppressed" and "B&T MP9 QD Suppressor"
	or string_id == "bm_wp_mp9_b_suppressed_desc" and "A ##specialized## suppressor for the MP9.\n##10% shorter## overall range.\nReduces the weapon's sound radius to ##2 meters.\n10% slower## ADS speeds."
	--BIG BOSS
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_pis_jungle" and "Boss Suppressor"
	or string_id == "bm_wp_upg_ns_pis_jungle_desc" and "A ##large## suppressor.\n##10% shorter## overall range.\nReduces the weapon's sound radius to ##2 meters.\n10% slower## ADS speeds."
	--Filter
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_ass_filter" and "Oil Filter"
	or string_id == "bm_wp_upg_ns_ass_filter_desc" and "An ##improvised## suppressor.\n##10% shorter## overall range.\nReduces the weapon's sound radius to ##10 meters.\n10% slower## ADS speeds."
	--M14 Scope Mount
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_m14_scopemount" and "Sun Optics USA M14/M1A Scope Mount"
	--LED Combo
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_ass_utg" and "UTG P38 LED Laser Combo"
	--M3X
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_pis_m3x" and "Insight Technology M3X"
	--P90 Mall
	or string_id == "bm_wp_p90_b_ninja_desc" and "##Internally suppressed## barrel.\nReduces the weapon's sound radius to ##2 meters.\n##15% slower## ADS speeds."
	--P90 Civ
	or DMCWO.reelnaems == true and string_id == "bm_wp_p90_b_civilian" and "Moerse Lekker Barrel Shroud"
	or string_id == "bm_wp_p90_b_civilian_desc" and "##15% longer## overall range.\n##10% slower## ADS speeds."
	
	
	
	--AK Crab Rail
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_fg_krebs" and "Krebs UFM Keymod System Handguard"
	or string_id == "bm_wp_upg_ak_fg_krebs_desc" and "##7.5% faster## ADS speeds."
	--AK Keymod Rail
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_fg_trax" and "Strike Industries TRAX Handguard"
	or string_id == "bm_wp_upg_ak_fg_trax_desc" and "##7.5% slower## ADS speeds."
	--AK Aluminum Grip
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_g_rk3" and "ZenitCo PK-3 Pistol Grip"
	--AK Aluminum Foregrip
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_fg_zenit" and "ZenitCo Handguard"
	--Scope Mount
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_ak_scopemount" and "K-VAR KV-04S Optic Mount"
	--Low Drag Magazine
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_m_uspalm" and "30rnd US PALM AK30 Magazine"
	or string_id == "bm_wp_upg_ak_m_uspalm_desc" and "##5% faster## reload speeds."
	--PBS Suppressor
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_ass_pbs1" and "PBS-1 Suppressor"
	or string_id == "bm_wp_upg_ns_ass_pbs1_desc" and "##10% shorter## overall range.\nReduces the weapon's sound radius to ##2 meters.\n##20% slower## ADS speeds."
	--DMR Kit
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_ak_b_zastava" and "Zastava M76 Barrel"
	or string_id == "bm_wp_upg_ass_ak_b_zastava_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds."
	--Modern Barrel
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_b_ak105" and "AK-105 Barrel"
	or string_id == "bm_wp_upg_ak_b_ak105_desc" and "##10% shorter## overall range."
	
	--Exotique Receiver
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_upper_reciever_edge" and "VLTOR Upper Receiver"
	or string_id == "bm_wp_m4_upper_reciever_edge_desc" and "ROF ##raised## by ##2%.##"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_m4_upper_reciever_ballos" and "2A-Arm BALIOS Upper Receiver" --????
	or string_id == "bm_wp_upg_ass_m4_upper_reciever_ballos_desc" and "ROF ##lowered## by ##5%.##"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_m4_upper_reciever_core" and "CORE15 Upper Receiver"
	or string_id == "bm_wp_upg_ass_m4_upper_reciever_core_desc" and "ROF ##raised## by ##5%.##"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_m4_lower_reciever_core" and "CORE15 Lower Receiver"
	or string_id == "bm_wp_upg_ass_m4_lower_reciever_core_desc" and "##5% faster## reload speeds."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_m4_s_ubr" and "Magpul UBR Stock"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_m4_m_l5" and "30rnd Lancer Systems L5 AW Magazine"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_smg_olympic_fg_lr300" and "Short LR300 Handguard"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_m16_fg_stag" and "Stag Arms Model 8T Handguard"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_m4_fg_moe" and "Magpul MOE SL Handguard"
	or string_id == "bm_wp_upg_ass_m4_fg_moe_desc" and "##5% faster## ADS speeds." 
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_m4_fg_lvoa" and "War Sport LVOA Handguard"
	or string_id == "bm_wp_upg_ass_m4_fg_lvoa_desc" and "##5% slower## ADS speeds."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_m4_b_beowulf" and "Beowulf Barrel"
	or string_id == "bm_wp_upg_ass_m4_b_beowulf_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds."
	
	--Bipod
	or string_id == "bm_wp_upg_lmg_lionbipod" and "Bipod"
	
	--Single Fire
	or string_id == "bm_wp_upg_i_singlefire" and "Single Fire Mod"
	or string_id == "bm_wp_upg_i_singlefire_desc" and "Locks fire mode to ##semi-auto.##\nROF ##lowered## by ##10%.##"
	--Auto Fire
	or string_id == "bm_wp_upg_i_autofire" and "Auto Fire Mod"
	or string_id == "bm_wp_upg_i_autofire_desc" and "Locks fire mode to ##full-auto.##\nROF ##raised## by ##15%.##"
	or string_id == "bm_wp_upg_i_autofire_tec9" and "Locks fire mode to ##full-auto.##\nROF ##raised## to ##800 RPM.##\n##Disables the effects of Gun Nut Aced.##"
	or string_id == "bm_wp_upg_i_autofire_1911" and "Locks fire mode to ##full-auto.##\nROF ##raised## to ##1000 RPM.##\n##Disables the effects of Gun Nut Aced.##"
	or string_id == "bm_wp_upg_i_autofire_hk21" and "ROF ##lowered## to ##450 RPM.##"
	
	--Pistol Light
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_pis_tlr1" and "Streamlight TLR1"
	--Pistol Laser
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_pis_laser" and "Aim Sports LH002 Laser Sight" 
	--Pistol Laser
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_x400v" and "SureFire X400V-IRC"
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_crimson" and "Crimson Trace CMR-201"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_g_laser" and "Crimson Trace Glock Laser Grip"
	or DMCWO.reelnaems == true and string_id == "bm_wp_pis_g_beavertail" and "Beavertail Grip Extension"
	
	--Assault Light
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_ass_smg_sho_surefire" and "Surefire Scout Light" 
	--Compact Laser
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_ass_laser" and "Offset Laser Mount & Sight"
	--Tactical Laser
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_ass_smg_sho_peqbox" and "Insight Technology AN/PEQ-5"
	--Military Laser 
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fl_ass_peq15" and "Insight Technology AN/PEQ-15"

	--Shark Teeth
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_shot_shark" and "Tromix Shark Breaching Brake"
	--King's Crown
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_shot_ns_king" and "King Armory KA-1212 Breaching Brake"
	
	--Pistol Flash Hider
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_pis_ns_flash" and "CCF Titanium Flash Suppressor"
	or string_id == "bm_wp_upg_pis_ns_flash_desc" and "Hides muzzle flash"

	--Low Profile Suppressor
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_ass_smg_small" and "GemTech HALO Suppressor" --not 100% but I can't find any other suppressor that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
	or string_id == "bm_wp_upg_ns_ass_smg_small_desc" and "A ##small## suppressor.\nReduces the weapon's sound radius to ##10 meters.\n20% shorter## overall range."
	--Medium Suppressor
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_ass_smg_medium" and "Small Arms Industries M80 Suppressor" --Thanks Overkill for being vauge as fuck, I'm surprised I even found this
	or string_id == "bm_wp_upg_ns_ass_smg_medium_desc" and "A ##medium## suppressor.\nReduces the weapon's sound radius to ##6 meters.\n30% shorter## overall range.\n##5% slower## ADS speeds."
	--Bigger the Better **Don't know
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_ass_smg_large" and "Large Suppressor"
	or string_id == "bm_wp_upg_ns_ass_smg_large_desc" and "A ##large## suppressor.\nReduces the weapon's sound radius to ##2 meters.\n40% shorter## overall range.\n##7.5% slower## ADS speeds."
	
	--Size Doesn't Matter 
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_pis_small" and "Thompson Machine Poseidon Suppressor"	
	or string_id == "bm_wp_upg_ns_pis_small_desc" and "A ##small## suppressor.\nReduces the weapon's sound radius to ##10 meters.\n20% shorter## overall range."	
	--Standard Issue
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_pis_medium" and "GemTech SFN Suppressor" --Close enough... it's sectioned similarly enough for me to just name it this
	or string_id == "bm_wp_upg_ns_pis_medium_desc" and "A ##medium## suppressor.\n##30% shorter## overall range.\nReduces the weapon's sound radius to ##6 meters.\n5% slower## ADS speeds."
	--Monolith 
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_pis_large" and "SilencerCo Osprey Suppressor"
	or string_id == "bm_wp_upg_ns_pis_large_desc" and "A ##large## suppressor.\n##40% shorter## overall range.\nReduces the weapon's sound radius to ##2 meters.\n7.5% slower## ADS speeds."
	
	or string_id == "bm_wp_upg_ns_pis_medium_slim_desc" and "A ##medium## suppressor.\nReduces the weapon's sound radius to ##6 meters.\n30% shorter## overall range.\n##5% slower## ADS speeds."
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_medium_gem" and "GemTech Blackside Suppressor"
	or string_id == "bm_wp_upg_ns_medium_gem_desc" and "A ##medium## suppressor.\nReduces the weapon's sound radius to ##6 meters.\n30% shorter## overall range.\n##5% slower## ADS speeds."
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_large_kac" and "KAC MK.23 Suppressor"
	or string_id == "bm_wp_upg_ns_large_kac_desc" and "A ##large## suppressor.\nReduces the weapon's sound radius to ##2 meters.\n40% shorter## overall range.\n##7.5% slower## ADS speeds."
	
	
	--Shotgun Suppressor
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_shot_thick" and "Shotgun Suppressor"
	or string_id == "bm_wp_upg_ns_shot_thick_desc" and "A ##medium## suppressor.\nReduces the weapon's sound radius to ##6 meters.\n20% shorter## overall range.\n##5% slower## ADS speeds."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_meatgrinder" and "Standoff Muzzle Device"
	
	--Stubby
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_ass_smg_stubby" and "Stinger Flash Hider" --Based on the VFC Stinger's pseudo flash-hider
	or string_id == "bm_wp_upg_ns_ass_smg_stubby_desc" and "Hides muzzle flash"
	--Tank **Don't know, could quite literally be based off of a tank compensator
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_ass_smg_tank" and "Tank Compensator"
	or string_id == "bm_wp_upg_ns_ass_smg_tank_desc" and "Vents muzzle flash to the sides"
	--Firebreather
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ns_ass_smg_firepig" and "Noveske KX3 Compensator"
	or string_id == "bm_wp_upg_ns_ass_smg_firepig_desc" and "Increases muzzle flash"
	
	--Competitors
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_ns_jprifles" and "JPE Bennie Cooley Muzzle Brake"
	--Funnel of Fun
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_ns_linear" and "KIES Blast Master Linear Compensator"
	or string_id == "bm_wp_upg_ass_ns_linear_desc" and "Increases muzzle flash"
	--Tactical
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ass_ns_surefire" and "Surefire MBK Muzzle Brake"
	
	--Muldon
	or DMCWO.reelnaems == true and string_id == "bm_wp_r870_s_folding" and "R870 Top Folding Stock"
	or string_id == "bm_wp_r870_s_folding_desc" and ""
	
	--Standard
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_s_standard" and "Bushmaster LE Stock"
	or string_id == "bm_wp_m4_s_standard_desc" and ""
	--Tactical
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_s_pts" and "Magpul PTS Stock"
	or string_id == "bm_wp_m4_s_pts_desc" and ""
	--Folding
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_uupg_s_fold" and "LR300 Folding Stock"
	or string_id == "bm_wp_m4_uupg_s_fold_desc" and ""
	--Wide
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_m4_s_crane" and "NSWC Crane Stock"
	or string_id == "bm_wp_upg_m4_s_crane_desc" and ""
	--War-Torn
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_m4_s_mk46" and "NSWC Crane Stock w/Cheek Pad" --looking at it now, the rudimentary cheek pad is generally useless since you hold the gun right handed (so you make a cheekweld with the left side of the gun) and the pad is mostly on the right. GJ Overkill.
	or string_id == "bm_wp_upg_m4_s_mk46_desc" and ""
	
	--Folding Stock (underfolder)
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak_s_folding" and "Underfolding AK Stock"
	or string_id == "bm_wp_ak_s_folding_desc" and "Underfolding AK Stock"
	--Folding Stock (sidefolder)
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak_s_skfoldable" and "Sidefolding AK Stock"
	or string_id == "bm_wp_ak_s_skfoldable_desc" and "Sidefolding AK Stock"
	--Wooden Sniper Stock
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak_s_psl" and "PSL Thumbhole Stock"
	or string_id == "bm_wp_ak_s_psl_desc" and ""
	
	--Ergo (Glocks)
	or DMCWO.reelnaems == true and string_id == "bm_wp_g18c_g_ergo" and "Hogue Handall Grip Sleeve"
	or string_id == "bm_wp_g18c_g_ergo_desc" and "##5% faster## ADS speeds." 
	--Ergo
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_g_ergo" and "Command Arms UPG16 Pistol Grip"
	or string_id == "bm_wp_m4_g_ergo_desc" and "##5% faster## ADS speeds." 
	--Pro
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_g_sniper" and "PSG Style Pistol Grip" --there are a bunch of grips styled after the PSG-1's grip but the one in PD2 doesn't seem to take from any specific real-life model
	--Rubber
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_m4_g_hgrip" and "Hogue OverMolded AR Pistol Grip"
	--Straight
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_m4_g_mgrip" and "Magpul MOE-K Pistol Grip"
	
	--Rubber
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_g_hgrip" and "Hogue OverMolded AK Pistol Grip"
	--Plastic
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_g_pgrip" and "US PALM Enhanced Pistol Grip"
	or string_id == "bm_wp_upg_ak_g_pgrip_desc" and "##5% faster## ADS speeds." 
	
	--Wood Rail
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak_fg_combo2" and "Ultimak AK Optic Mount"
	--Tact. Russian
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak_fg_combo3" and "Ultimak AK Modular Rail Forend System"
	or string_id == "bm_wp_ak_fg_combo3_desc" and "##5% slower## ADS speeds."
	--Battleproven
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_fg_tapco" and "Tapco Intrafuse Handguard" --This is actually for the Saiga. lolOverkill
	--Lightweight
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_fg_midwest" and "Midwest Industries Quad Rail"
	or string_id == "bm_wp_upg_fg_midwest_desc" and "##5% faster## ADS speeds."
	
	--Slav. Dragon
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_b_draco" and "Draco Pistol Barrel"
	or string_id == "bm_wp_upg_ak_b_draco_desc" and "##10% shorter## overall range.\n##10% faster## ADS speeds."
	
	--Extended Mag (Glocks)
	or DMCWO.reelnaems == true and string_id == "bm_wp_g18c_m_mag_33rnd" and "33/22rnd Glock Magazine (9mm/.40S&W)"	
	or string_id == "bm_wp_g18c_m_mag_33rnd_desc" and "##5% slower## reload speeds."	
	--Vintage Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_m_straight" and "20rnd STANAG Magazine" --Hesitant to call them this since they're so off-model and resemble the M4A1 mags used in MW3
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_m_straight_vanilla" and "20rnd STANAG Magazine"
	or string_id == "bm_wp_m4_m_straight_desc" and "##10% faster## reload speeds."
	--Milspec Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_uupg_m_std" and "30rnd STANAG Magazine"
	--Tactical Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_m_pmag" and "30rnd Magpul PMAG Magazine"
	or string_id == "bm_wp_m4_m_pmag_desc" and "##5% faster## reload speeds."
	--Expert Mag
	or DMCWO.reelnaems == true and string_id == "bm_wp_l85a2_m_emag" and "30rnd Magpul EMAG Magazine"
	or string_id == "bm_wp_l85a2_m_emag_desc" and "Carry an extra magazine.\n##12% slower## reload speeds."
	--CAR Quad
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_m4_m_quad" and "60rnd Surefire Magazine"
	or string_id == "bm_wp_upg_m4_m_quad_desc" and "##10% slower## reload speeds."
	--AK Quad
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_ak_m_quad" and "60rnd Concern Kalashnikov Magazine"
	or string_id == "bm_wp_upg_ak_m_quad_desc" and "##10% slower## reload speeds."
	--Beta-C
	or DMCWO.reelnaems == true and string_id == "bm_wp_m4_m_drum" and "100rnd Beta-C Dual Drum"
	or string_id == "bm_wp_m4_m_drum_desc" and "##20% slower## reload speeds."
	--AK Drum
	or DMCWO.reelnaems == true and string_id == "bm_wp_ak_m_drum" and "75rnd AK Drum"
	or string_id == "bm_wp_ak_m_drum_desc" and "##15% slower## reload speeds."
	
	--Pistol Red Dot
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_rmr" and "Trijicon RMR Red Dot"
	or string_id == "bm_wp_upg_o_rmr_desc" and "Low power red dot sight"
	--Marksman Irons
	or string_id == "bm_wp_upg_o_marksmansight_rear_desc" and "Meprolight Tru-Dot Adjustable Sight Set"
	
	--Military Red Dot
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_aimpoint" and "Aimpoint PRO Red Dot"
	or string_id == "bm_wp_upg_o_aimpoint_desc" and "Encased red dot sight."
	--Holographic
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_eotech" and "EOTech 553 Holographic Sight"
	or string_id == "bm_wp_upg_o_eotech_desc" and "Low power holographic sight."
	--Professional
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_t1micro" and "Aimpoint Micro T-1 Red Dot"
	or string_id == "bm_wp_upg_o_t1micro_desc" and "Low power red dot sight."
	--Surgeon
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_docter" and "IRONDOT w/Docter Sight II Plus Red Dot"
	or string_id == "bm_wp_upg_o_docter_desc" and "Low power red dot sight."
	--ACOUGH
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_acog" and "Trijicon ACOG Scope"
	or string_id == "bm_wp_upg_o_acog_desc" and "Medium range scope.\n##5% slower## ADS."
	--Milspec
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_specter" and "ELCAN Specter DR 1-4x Scope"
	or string_id == "bm_wp_upg_o_specter_desc" and "Medium range scope.\n##5% slower## ADS."
	--See More
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_cmore" and "C-More Railway Red Dot"
	or string_id == "bm_wp_upg_o_cmore_desc" and "Low power red dot sight."
	--Combat
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_cs" and "Aimpoint CS Red Dot"
	or string_id == "bm_wp_upg_o_cs_desc" and "Encased red dot sight."
	--Compact Holo
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_eotech_xps" and "EOTech EXPS3 Holographic Sight"
	or string_id == "bm_wp_upg_o_eotech_xps_desc" and "Low power holographic sight."
	--Speculator
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_reflex" and "Sightmark Sureshot Red Dot" --super generic so I just went with what COD4 based it off of
	or string_id == "bm_wp_upg_o_reflex_desc" and "Low power red dot sight."
	--Trigonom
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_rx01" and "Trijicon RX01 Red Dot"
	or string_id == "bm_wp_upg_o_rx01_desc" and "Low power red dot sight."
	--Solar
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_rx30" and "Trijicon RX30 Red Dot"	
	or string_id == "bm_wp_upg_o_rx30_desc" and "Low power red dot sight."	
	--Theia
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_leupold" and "Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS"
	or string_id == "bm_wp_upg_o_leupold_desc" and "Ballistic scope that ##auto-marks## enemies ##in stealth## or ##specials.##\n##10% slower## ADS."
	--45 irons
	or DMCWO.reelnaems == true and string_id == "bm_wpn_fps_upg_o_45iron" and "XS Sights Angled Sights"
	--Flip-Up (KSG sights)
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_o_mbus_rear" and "Magpul MBUS Back-up Sights"
	or string_id == "bm_wp_upg_o_mbus_rear_desc" and "Flip-up sights."
	or DMCWO.reelnaems == true and string_id == "dd_rear" and "Daniel Defense Fixed Sight Combo"
	or string_id == "dd_rear_desc" and "Fixed sights"
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_mosin_iron_sight" and "Iron Sights"
	or string_id == "bm_wp_mosin_iron_sight_desc" and "Remove the scope and use iron sights."
	
	or DMCWO.reelnaems == true and string_id == "bm_wp_model_70_iron_sight" and "Iron Sights"
	or string_id == "bm_wp_model_70_iron_sight_desc" and "Remove the scope and use iron sights."
	
	--[[FOREGRIPS]]
	--VFG
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_vg_ass_smg_verticalgrip" and "Knights Armament Co. VFG"
	or string_id == "bm_wp_upg_vg_ass_smg_verticalgrip_desc" and "##20% less## recoil recovery."
	--STUBBY
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_vg_ass_smg_stubby" and "Tango Down QD Stubby VFG"
	or string_id == "bm_wp_upg_vg_ass_smg_stubby_desc" and "##10% less## recoil recovery."
	--AFG
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_vg_ass_smg_afg" and "Magpul AFG 2"
	or string_id == "bm_wp_upg_vg_ass_smg_afg_desc" and "##20% more## recoil recovery."
	
	or string_id == "vfg_akimbo" and "Uhh..."
	
	
	--Dragons Breath
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_a_dragons_breath" and "Dragon's Breath Rounds"
	or string_id == "bm_wp_upg_a_dragons_breath_desc" and "Pellets capable of ##setting targets on fire.##\nFire ##8 pellets.##\n##50% chance## to set targets aflame within ##30m.##"
	or string_id == "bm_wp_upg_a_dragons_breath_auto" and "Pellets capable of ##setting targets on fire.##\nFire ##8 pellets.##\n##50% chance## to set targets aflame within ##30m.##\nROF ##lowered## by ##10%.##"
	--AP Slug
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_a_slug" and "Armor Piercing SABOT Slugs"
	or string_id == "bm_wp_upg_a_slug_desc" and "A slug capable of ##piercing through enemies, walls and shields.\n150% longer## drop-off range."
	--Birdshot (originally the free 000 Buck)
	or string_id == "bm_wp_upg_a_bird" and "Birdshot"
	or string_id == "bm_wp_upg_a_bird_desc" and "Shoot tiny pellets for ##greater pellet coverage.##\nShoot ##50 pellets.##\n##CAN CAUSE FPS DROPS ON LOW END SYSTEMS##"
	or string_id == "bm_wp_upg_a_bird_judge" and "Shoot tiny pellets for ##greater pellet coverage.##\nShoot ##30 pellets.##\n##CAN CAUSE FPS DROPS ON LOW END SYSTEMS##" 
	--000 Buck
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_a_custom" and "000 Buck"
	or string_id == "bm_wp_upg_a_custom_desc" and "Large pellets with ##greater power per pellet.##\nFire ##6 pellets.##\n##20% longer## max damage range.\n##35% shorter## drop-off range."
	or string_id == "bm_wp_upg_a_custom_judge" and "Large pellets with ##greater power per pellet.##\nFire ##4 pellets.##\n##20% longer## max damage range.\n##35% shorter## drop-off range." 
	--Flechette
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_a_piercing" and "Flechette Rounds"
	or string_id == "bm_wp_upg_a_piercing_desc" and "Darts capable of ##penetrating MFR armor.##\nFire ##15 darts.##\n##40% longer## drop-off range."
	or string_id == "bm_wp_upg_a_piercing_judge" and "Darts capable of ##penetrating MFR armor.##\nFire ##10 darts.##\n##40% longer## drop-off range."
	--HE
	or DMCWO.reelnaems == true and string_id == "bm_wp_upg_a_explosive" and "Fragmentation Rounds"
	or string_id == "bm_wp_upg_a_explosive_desc" and "Fin stabilized rounds that ##explode on impact.\nInfinite ammo effects and critical hits are disabled.##\nShoot ##1 explosive## projectile.\n##3.5 meter## blast diameter."
	
	--Hollow Points
	or string_id == "bullet_hollow" and "Hollow Point Ammunition"
	or string_id == "bullet_hollow_desc" and "##No shield, enemy or armor penetration.\nNo critical hits.##\n##-40%## damage to Dozer armor, MFR heads, Gensec and the Phalanx.\n##+20%## damage to the Dozer's face, Cpt. Winters head and other units."
	--AP
	or string_id == "bullet_ap" and "Armor Piercing Ammunition"
	or string_id == "bullet_ap_desc" and "##Pierce shields in max damage range.\nNo critical hits.##\n##+20%## damage to Dozer armor, MFR heads, Gensec and the Phalanx.\n##-40%## damage to the body of other units."
	or string_id == "bullet_ap_desc_has_pen" and "##+5%## damage through shields.\n##No critical hits.##\n##+20%## damage to Dozer armor, MFR heads, Gensec and the Phalanx.\n##-40%## damage to the body of other units."
	or string_id == "bullet_ap_desc_9mm" and "##Shoot through multiple enemies.\nNo critical hits.##\n##+20%## damage to Dozer armor, MFR heads, Gensec and the Phalanx.\n##-40%## damage to the body of other units."
	--Match
	or string_id == "bullet_match" and "Match Grade Ammunition"
	or string_id == "bullet_match_desc" and "High grade rounds for ##greater range and accuracy.\nNo suppressors.##\n##15% longer## overall range."
	--Low Power
	or string_id == "bullet_low" and "Low Powered Ammunition"
	or string_id == "bullet_low_desc" and "Rounds with reduced loads for ##less recoil.##\n##No sniper class barrels.##\n##20% shorter## overall range.\n##15% less## penetration through walls."
	--Incendiary
	or string_id == "bullet_fire" and "Incendiary Ammunition"
	or string_id == "bullet_fire_desc" and "Rounds with a ##5% chance## to set your target ##on fire.##\n##No ammo pickups.##"
	--HEIAP
	or string_id == "bullet_heiap" and "Raufoss Mk 211 Ammunition"
	or string_id == "bullet_heiap_desc" and "...##No ammo pickups.##"
	--BeoWulf
	or string_id == "bullet_beo" and ".50 Beowulf Ammunition"
	or string_id == "bullet_beo_desc" and "##Requires the Beowulf Barrel.\nNo suppressors.##\n##25% longer## max damage range.\n##25% shorter## drop-off range."
	
	--Deagle Corbon
	or string_id == "bullet_corbon" and ".440 Cor-bon Conversion"
	or string_id == "bullet_corbon_desc" and "Rechambers this weapon in .440 Cor-bon.\n##15% more## penetration through walls.\n##10% longer## overall range.\n##No police ammobox pickups.##"
	--300 Winchester
	or string_id == "bullet_300_win" and ".300 Winchester Magnum Conversion"
	or string_id == "bullet_300_win_desc" and "Rechambers this weapon in .300 Winchester Magnum.\n##15% longer## overall range."
	or string_id == "bullet_300_win_r93_desc" and "Rechambers this weapon in .300 Winchester Magnum.\n##10% shorter## overall range."
	--.40 S&W
	or string_id == "bullet_40sw" and ".40 S&W Conversion"
	or string_id == "bullet_40sw_desc" and "Rechambers this weapon in .40 S&W."
	
	--Taser
	or string_id == "shell_taser" and "Taser Rounds"
	or string_id == "shell_taser_desc" and "Less than lethal shells that can stun a target for a short time.\n##No ammo pickups.##"
	
	--M134 Slow
	or string_id == "m134_slow" and "Death Machine Motor"
	or string_id == "m134_slow_desc" and "ROF ##lowered## to ##1666 RPM.##"
	--M134 Slower
	or string_id == "m134_slower" and "Ghosts Motor"
	or string_id == "m134_slower_desc" and "ROF ##lowered## to ##750 RPM.##"
	--Burst Fire
	or string_id == "burstfire" and "Burst Fire Kit"
	or string_id == "burstfire_desc" and "Allows this weapon switch to ##3-round bursts.##"
	or string_id == "burstfire_desc_ak5" and "Allows this weapon switch to ##3-round bursts.## \n##Requires the FN FNC Kit to be attached.##"
	or string_id == "burstfire_desc_m16" and "Swaps out full-auto capabilities for ##3-round bursts.##\nROF ##raised## by ##10%.##"
	or string_id == "burstfire_desc_g18" and "Swaps out full-auto capabilities for ##3-round bursts.##\nROF ##raised## by ##5%.##"
	or string_id == "burstfire_desc_raffica" and "##Disables the effects of Gun Nut Aced.##\nAllows this weapon to fire in ##3-round bursts## at ##1200 RPM.##\n##Semi-auto fire rate is unchanged.##"
	or string_id == "burstfire_desc_g36" and "Switches out 2-round bursts for ##3-round bursts.##"
	--MAC slow kit
	or string_id == "mac_slow" and "MAC Slow Fire Kit"
	or string_id == "mac_slow_desc" and "ROF ##lowered## to ##750 RPM.##"
	--C96 kit
	or string_id == "schnellfeuer" and "M712 Schnellfeuer Kit"
	or string_id == "schnellfeuer_desc" and "Allows for switching to ##full-auto.##\nROF ##raised## to ##1000 RPM.##\n##Disables the effects of Gun Nut Aced.##"
	
	--Scope
	or DMCWO.reelnaems == true and string_id == "shortdot_normal" and "Schmidt & Bender 1-8x24 PM Short Dot"
	or string_id == "shortdot_normal_desc" and "High power scope.\n##7.5% slower## ADS speeds."
	
	--AK Molot
	or string_id == "ak_45_mag" and "45rnd Molot Polymer Magazine"
	or string_id == "ak_45_mag_desc" and "##5% faster## reload speeds."
	or string_id == "ak_45_mag_akm_desc" and "##5% slower## reload speeds."
	
	--Sniper Irons
	or string_id == "jonathan" and "Iron Sights"
	or string_id == "jonathan_desc" and "Remove the scope and use iron sights."
	--Speakeasy
	or string_id == "speakeasy" and "Speakeasy Kit"
	or string_id == "speakeasy_desc" and "Locks fire mode to ##full-auto.##\nBase ROF ##raised## to ##1000 RPM.##\nThe first ##8## shots in a burst start at ##850 RPM.##"
	--ASM1
	or string_id == "asm1" and "ASM1 Kit"
	or string_id == "asm1_desc" and "Locks fire mode to ##full-auto.##\nBase ROF ##raised## to ##750 RPM.##\nThe first ##8## shots in a burst start at ##1000 RPM.##"
	--AN94
	or string_id == "an94_burst" and "94 Kit"
	or string_id == "an94_burst_desc" and "Allows this weapon switch to ##2-round bursts.##\nBase ROF ##lowered## to ##600 RPM.##\nThe first ##2## shots in a burst start at ##1800 RPM.##"
	--SC2010
	or string_id == "casanave" and "HMWS Kit"
	or string_id == "casanave_desc" and "ROF ##lowered## to ##550 RPM.##"
	--No Stock
	or string_id == "general_no_stock" and "No Stock"
	--RPK Stock
	or string_id == "rpk_wood_stock" and "RPK Wood Stock"
	--Wire Stock
	or string_id == "hk_wire_stock" and "Heckler & Koch Wire Stock"
	--48 Dredge
	or string_id == "dredge" and "Dredge Kit"
	or string_id == "dredge_desc" and "Swaps out full-auto capabilities for ##6-round bursts.##\nBurst ROF of ##1100 RPM.##\nHolding down the trigger allows for ##auto-bursting.##"
	--Clarion
	or string_id == "cs_clarion" and "Clarion Kit"
	or string_id == "cs_clarion_desc" and "Base ROF ##lowered## to ##666 RPM.##\nBurst ROF of ##800 RPM.##\nHolding down the trigger allows for ##auto-bursting.##"
	--Avelyn
	or string_id == "avelyn" and "Avelyn Kit"
	or string_id == "avelyn_desc" and "A ##repeating crossbow## conversion kit.\nAllows for firing a volley of ##3## bolts with a single trigger pull.\n##25% slower## reload speeds."
	
	--boosts
	or string_id == "bm_menu_bonus_concealment" and "Concealment Modifier"
	or string_id == "bm_menu_bonus_concealment_desc" and ""
	or string_id == "bm_menu_bonus_concealment_1_fire" and "##5% slower## movement."
	
	or string_id == "bm_menu_bonus_spread" and "Accuracy Modifier"
	or string_id == "bm_menu_bonus_spread_desc" and ""
	
	or string_id == "bm_menu_bonus_recoil" and "Stability Modifier"
	or string_id == "bm_menu_bonus_recoil_desc" and ""
	
	or string_id == "bm_menu_bonus_damage" and "Firerate Modifier"
	or string_id == "bm_menu_bonus_damage_desc" and ""
	or string_id == "bm_menu_bonus_damage_1" and "ROF ##raised## by ##15%.##"
	or string_id == "bm_menu_bonus_damage_1_fire" and "ROF ##raised## by ##50%.\n10% slower## movement."
	or string_id == "bm_menu_bonus_damage_2" and "ROF ##raised## by ##30%.##"
	
	or string_id == "bm_menu_bonus_total_ammo" and "Total Ammo Modifier"
	or string_id == "bm_menu_bonus_total_ammo_desc" and ""
	or string_id == "bm_menu_bonus_total_ammo_1" and "##5% more## total ammo."
	or string_id == "bm_menu_bonus_total_ammo_2" and "##10% more## total ammo."
	or string_id == "bm_menu_bonus_total_ammo_3" and "##15% more## total ammo."
	
	or string_id == "bm_wp_upg_bonus_team_exp_money_p3_desc" and "##3% more## experience & money earned from contracts for you and your crew."
	
	--DMCWO loot shit
	or string_id == "loot_dmcwo" and "DeadMansChest's Weapon Overhaul"
	or string_id == "loot_dmcwo_desc" and "This is a DMCWO item!"
	
	--URSA
	or DMCWO.reelnaems == true and string_id == "bm_melee_kabar" and "USMC KA-BAR"
	or string_id == "bm_melee_kabar_desc" and "The most famous fixed blade knife in the World, the KA-BAR.\n\nDesigned to serve US troops during World War II and is still doing its job, in the hands of robbers, years later."
	--Krieger
	or DMCWO.reelnaems == true and string_id == "bm_melee_kampfmesser" and "KM 2000"
	or string_id == "bm_melee_kampfmesser_desc" and "The official combat knife of the German Bundeswehr Armed Forces. The new series KM2000 is manufactured to exacting ISO standards with substantially improved cutting edge capacity. Good choice for CQC."
	--Berger
	or DMCWO.reelnaems == true and string_id == "bm_melee_gerber" and "Gerber DMF Folder"
	or string_id == "bm_melee_gerber_desc" and "The manual opening DMF Folder brings the much sought after tactical innovations and technologies of the Automatic DMF to a large, ambidextrous use knife. Textured G-10 handle gives the DMF Folder a sure grip in gloved hands and maintains a perfect weight balance."
	--Lambo
	or DMCWO.reelnaems == true and string_id == "bm_melee_rambo_desc" and "A survival knife with a heavy bowie blade. The length, sawtooth spine and centered tip works just as well in the wilderness as it does in close combat."
	
	--Tomahawk
	or DMCWO.reelnaems == true and string_id == "bm_melee_tomahawk" and "Gerber Downrange Tomahawk"
	or string_id == "bm_melee_tomahawk_desc" and "When you're in a situation where time is of the essence, you can't waste time wondering if you have the right tool for the heist. No matter what's on the other side of that door or vault, you want a tool with the same single-minded determination as the robber wielding it."
	--Becker Machete
	or DMCWO.reelnaems == true and string_id == "bm_melee_becker" and "KA-BAR Becker Tac Tool"
	or string_id == "bm_melee_becker_desc" and "A design collaboration between Ethan Becker of BK&T and John Benner of TDI, the Tac Tool smashes, bashes, prys, hammers and cuts.\n\nIt is equally powerful at lifting stubborn hinge pins, prying open doors or windows, and hammering out display cases as it is efficient at cutting police cable ties."
	--Baton
	or DMCWO.reelnaems == true and string_id == "bm_melee_baton" and "ASP Friction Loc Baton"
	or string_id == "bm_melee_baton_desc" and "The ASP Friction Loc Baton is the most tactically sophisticated impact weapon currently available to law enforcement. Tested by the most elite federal teams, it has proven itself virtually indestructible.\n\nIt's rather ironic that you're using it against them now."	
	--Shovel
	or DMCWO.reelnaems == true and string_id == "bm_melee_shovel" and "K.L.A.S."
	or string_id == "bm_melee_shovel_desc" and "The K.L.A.S. can be used for a variety of recreational purposes. It can also be used as a weapon - sharpen the edges and you'll be cutting through flesh and bone.\n\nIf you use it correctly, that is.\n\nWhich you don't."
	
	--EMONE
	or DMCWO.reelnaems == true and string_id == "bm_melee_moneybundle" and "LODS OF EMONE"
	or string_id == "bm_melee_moneybundle_desc" and "L-O-D-S OF E-M-O-N-E\nWhat's that spell?\nLOADSAMONEY!\n\nProb'ly.\n\nWOP IT OUT!"
	
	--AAAA-TATATATATATATA
	or string_id == "bm_melee_fists_desc" and "You're no boxer, but you can still throw a pretty good punch. All it takes is some strength, speed and timing and you'll land a striking blow in no time."
	
	--KA-NUCKLES
	or string_id == "bm_melee_brass_knuckles_desc" and "Knuckle style weapons have been used all over the world for hundreds of years. Brass knuckles concentrate the punch's force by directing it towards a harder and smaller area, increasing the chanecs of tissue disruption. Hit hard enough and you'll even fracture some bones."

	--TWD Bat
	or DMCWO.reelnaems == true and string_id == "bm_melee_baseballbat" and "\"Lucille\""
	or string_id == "bm_melee_baseballbat_desc" and "A baseball bat that has been given the name of \"Lucille\". It's been said that Lucille was used to bash a man's skull in, teach some unruly folks a lesson.\n\nNow that you have it, perhaps you could do the same and teach those cops a thing or two.\n"
	
	--Bayonet
	or DMCWO.reelnaems == true and string_id == "bm_melee_bayonet" and "AKM Type II Bayonet"	
	or string_id == "bm_melee_bayonet_desc" and "A rugged bayonet, meant for mounting on the end of your AK and thrusting it into the bodies of your foes.\n\nDoing that makes sense though. You'll just use it like a regular knife, won't you?\n"	
	
	--Bullseye
	or DMCWO.reelnaems == true and string_id == "bm_melee_bullseye" and "Smith & Wesson Bullseye Hatchet"
	or string_id == "bm_melee_bullseye_desc" and "I don't even know what to say to be honest - this is not something you would bring to a fight unless you were some kind of psycho, right?\nI mean, this is intended for chopping logs and going camping, not robbing banks.\n\nRight?"
	
	--X46
	or DMCWO.reelnaems == true and string_id == "bm_melee_x46" and "Robson Knives X46 Utility Survival Knife"
	or string_id == "bm_melee_x46_desc" and "The X46 is a single 6\" piece of coated A2 steel in a partially serrated bowie blade configuration with a false top edge.\nIntergrated guard and glass breaker pommel tip.\nThe multi-purpose field design of this knife makes it as useful on the battlefield as it is in an emergency."
	
	--Gunther
	or DMCWO.reelnaems == true and string_id == "bm_melee_dingdong" and "Gerber Ding Dong Breaching Tool"
	or string_id == "bm_melee_dingdong_desc" and "A sledgehammer.\nA battering ram.\nA pry bar.\nAll three are essential breaching tools for heisters who need to get through doors quickly. The Ding Dong combines these three tools into one package as tight as the crew."
	
	--Cleaver girl
	or DMCWO.reelnaems == true and string_id == "bm_melee_cleaver" and "Cleaver"
	or string_id == "bm_melee_cleaver_desc" and "Your run of the mill cleaver.\n\nThe grip of this cleaver is rather slippery in your gloved hands so I'm telling you this now, you gotta get a grip on it unless you feel like tossing it."
	
	--Batshit insane
	or string_id == "bm_melee_bat_desc" and "A baseball bat, no more, no less.\n\nMeant for use in sport, you'll be using it for something much more sinister.\n\nLike smashing the skull of an officer of the law."
	
	--Machete
	or DMCWO.reelnaems == true and string_id == "bm_melee_machete" and "Machete"
	or string_id == "bm_melee_machete_desc" and "You like hurting people. That's why you use this dull, worn to shit machete, allowing you to revel in the horrific aftermath of your work.\n\nGaping wounds, crudely chopped off body parts and the blood curdling screams of agony from that cop you failed to kill quickly.\n\nTruly the weapon of a cruel, cruel heister."
	
	--Fireaxe
	or string_id == "bm_melee_fireaxe_desc" and "Can I axe you a question?\n\nDo you like hurting other people?\n\nIf you do, what better way to do it than with something intended to save lives! Show your victims the fire in your eyes as you save them from yourself in one quick swing."
	
	--Briefcase
	or DMCWO.reelnaems == true and string_id == "menu_l_global_value_hlm_game" and "This is a Hotline Miami Ownership item!"
	or string_id == "bm_melee_briefcase_desc" and "Call it a blessing, but maybe it was for the best you lost the lock combination.\n\nNow you have an excuse to hit people over the head with this!\n"
	
	--Tanto
	or DMCWO.reelnaems == true and string_id == "bm_melee_kabar_tanto" and "KA-BAR Tanto"
	or string_id == "bm_melee_kabar_tanto_desc" and "The Tanto blade shape, of Asian influence, has a thick pointed blade that's good for penetration. Coupled with a glass-filled nylon sheath this knife is designed for the toughest of tasks."
	
	--UberHaxorNova
	or string_id == "bm_melee_toothbrush_desc" and "A small plastic toothbrush, sharpened and hardened, ready to be driven into the side of your next victim.\n\nNova-ne will see it coming."
	
	--Chef
	or DMCWO.reelnaems == true and string_id == "bm_melee_chef" and "Chef Knife"
	or string_id == "bm_melee_chef_desc" and "Take this!\n\nWhether you're an angry heister or a psycho bank robber, this hot-forged, laser sharpened chef knife in fine, stainless molybdenum steel will serve you for years.\n\nDid you know that the traditional chef's knife was originally intended to slice and disjoint large cuts of flesh?"
	
	--Trench Knife
	or DMCWO.reelnaems == true and string_id == "bm_melee_fairbair" and "Fairbairn-Sykes Fighting Knife"
	or string_id == "bm_melee_fairbair_desc" and "The Fairbairn-Sykes fighting knife is a double-edged fighting knife resembling a dagger or poignard with a foil grip. Good for those rough-n-tumble moments you can find yourself in while on a job."
	
	or string_id == "bm_melee_swagger_desc" and "Hello heisters. Look at your knife, now back to this, now back at your knife, now back to this.\n\nSadly, your knife isn't as swag as this, but if you stopped using that pansy ass knife and started using this swagger stick, you could be ballin' all over those cops."

	--Amerigan flag :DDD
	or string_id == "bm_melee_freedom_desc" and "Thirteen stripes of red alternating with white, a blue rectangle in the canton, fifty small, white, five pointed stars, a pinch of partriotism, two cups of freedom and a broken flag pole.\n\nVoila - you have yourself a deadly weapon."

	--Erica Hartmann
	or DMCWO.reelnaems == true and string_id == "bm_melee_model24" and "Model 24 Stielhandgranate"
	or string_id == "bm_melee_model24_desc" and "Why would anyone ever use a grenade as a melee weapon?\n\nStrike to the head?\nWitch-ful thinking?\n\nI guess those that have tried and lived are really grenade-ful it didn't go off."
	
	--Hammer time
	or DMCWO.reelnaems == true and string_id == "bm_melee_hammer" and "Jacket's Hammer"
	or string_id == "bm_melee_hammer_desc" and "The Jacket says, \"Do you know what time it is?\"\n\nWhy it's time to hammer some skulls in of course!\n\nCops won't be touching you, that's for sure."
	
	--Mayweather a boring
	or string_id == "bm_melee_boxing_gloves_desc" and "Time to come out swinging!\nSlip these beauties on and unleash 1000 pounds of peak punching power!\n\nThat is if you actually FIGHT and not just run around avoiding conflict..."
	
	--A stick of lies
	or string_id == "bm_melee_shillelagh_desc" and "It's hard to determine the true origins of the shillelagh. How can you pinpoint the first time someone picked up a stout stick and brained someone else with it? And the shillelagh really hasn't evolved too much beyond that. Some prize blackthorn wood, while some might fill the head with molten lead.\n\nAt the end of the day, it really is just a bloody heavy stick that cracks skulls."
	
	--SJW Whiskey
	or string_id == "bm_melee_whiskey_desc" and "Know what makes you a good heister?\n\nReading this message obviously. Clear indication you haven't been caught."
	
	--Another Cleaver
	or DMCWO.reelnaems == true and string_id == "bm_melee_meat_cleaver" and "Dragan's Cleaver"
	or string_id == "bm_melee_meat_cleaver_desc" and "The cleaver is a kind of knife primarily used for cutting through meat and bone, but rather than using precise cuts the cleaver delivers powerful hammer-like blows that rend even the most durable flesh. Cleavers have a long history of butchering human beings as well as livestock.\n\nYou'll be doing the former."
	
	--Tender lovin'
	or DMCWO.reelnaems == true and string_id == "bm_melee_poker" and "Firewood Poker"
	or string_id == "bm_melee_poker_desc" and "A long piece of iron with a pointy end is a fine implement for tending to smoldering embers, but it is also the perfect implement for causing havoc and extreme discomfort.\n\nTell'em to poker up!"
	
	--Tender lovin'
	or DMCWO.reelnaems == true and string_id == "bm_melee_tenderizer" and "Meat Tenderizer"
	or string_id == "bm_melee_tenderizer_desc" and "While it was mainly designed for softening and flattening tough strips of steak, it has also proven useful for softening and flattening tough strips of cop.\n\nShow'em some tender lovin'!"
	
	--Fork her
	or DMCWO.reelnaems == true and string_id == "bm_melee_fork" and "BBQ Fork"
	or string_id == "bm_melee_fork_desc" and "What's the difference between a truckload of bowling balls and a truckload of dead dozers? You can't unload a truckload of bowling balls with a fork.\n\nGive'em a good forkin'!"
	
	--Spangle Beb
	or string_id == "bm_melee_spatula_desc" and "A melee weapon with a dual purpose - use it to smear a cop all across the road, and then let others use it to scoop up their remains.\n\nGet'em faces sizzlin'!"
	
	--Autism
	or DMCWO.reelnaems == true and string_id == "bm_melee_mining_pick" and "Pickaxe"
	or string_id == "bm_melee_mining_pick_desc" and "There's gold in 'dem 'der hills! And by hills we mean teeth. But, hills or teeth, nothing digs the gold out faster than a swinging spike of pig iron."
	
	--Ebay sellers
	or string_id == "bm_melee_scalper_desc" and "For the victor, it is the symbol of war, of power and of dominance. For the loser, it is the symbol of a really bad haircut."
	
	--NAOW THIS IS A KNOIFE
	or DMCWO.reelnaems == true and string_id == "bm_melee_bowie" and "Bowie Knife"
	or string_id == "bm_melee_bowie_desc" and "Nine inches of clip-point fighting steel. It's origins lie in the age of the classic pirate, but it was the famous Brawl of Carroll County (and a dozen bloodied men) that brought it wide-spread fame"
	
	--MY BRAND
	or DMCWO.reelnaems == true and string_id == "bm_melee_branding_iron" and "Branding Iron"
	or string_id == "bm_melee_branding_iron_desc" and "It may have been designed to mark the thick hides of cattle for identification, but fire-heated iron is even more effective against the soft flesh of a deputy or marshall."
	
	--*drops*
	or string_id == "bm_melee_microphone_desc" and "A microphone you ask?\n\nIndeed it is. A dinky little microphone at that.\n\nNot much else to say,"

	--Mike Standklasa
	or string_id == "bm_melee_micstand_desc" and "Can't quite underSTAND why you'd use this.\n\nMaybe you just can't STAND the presence of cops.\n\n...Sorry."
	
	--WOLOLOLO
	or DMCWO.reelnaems == true and string_id == "bm_melee_oldbaton" and "Nightstick"
	or string_id == "bm_melee_oldbaton_desc" and "Be one of the night and stick it to the man!\n\nShow them irony, show them pain!\nShow them in the end that this is (not) a game!"
	
	--WHOOP WHOOP PULL OVAH THAT BRASS TOO FAT
	or DMCWO.reelnaems == true and string_id == "bm_melee_detector" and "Garrett Handheld Metal Detector"
	or string_id == "bm_melee_detector_desc" and "You should probably leave this thing off if you plan on taking it with you on your next job.\n\nUnless you plan on wreaking havoc from the get go, then by all means go ahead and have fun."
	
	--ZAP ZAP MOTHERFUCKER
	or DMCWO.reelnaems == true and string_id == "bm_melee_taser" and "ZAP Stun Baton"
	or string_id == "bm_melee_taser_desc" and "This is the one you've been waiting for. Exact sweet, electifiying revenge againsts those smug Tasers. Eat it, lightning bolt!\n\nThis weapon is capable of stunning enemies only when fully charged."
	
	--Kunai
	or DMCWO.reelnaems == true and string_id == "bm_melee_cqc" and "Kunai"
	--MMM Whatcha Sai~
	or DMCWO.reelnaems == true and string_id == "bm_melee_twins" and "Sais"
	--Tekko-Kagi
	or DMCWO.reelnaems == true and string_id == "bm_melee_tiger" and "Tekko-Kagi"
	
	--This is actually my first katana
	or string_id == "bm_melee_sandsteel_desc" and "The Shinsakuto-Katana is a masterpiece, but also freshly forged.\n\nIt has not tasted blood, and has no real heritage or history. It is simply waiting for a wielder with which to create that."
	
	--Ayy L-Maul
	or string_id == "bm_melee_alien_maul_desc" and "Ayy L-Maul.\n\nA hammer made to commemorate the launch of the Alienware Alpha."
	
	--Bearded Axe
	or string_id == "bm_melee_beardy_desc" and "The Vikings emerged from the dark forests of the pagan North, and left a bloody trail of destruction from Iceland to Istanbul.\n\nTheir weapon was the two-handed bearded axe."
		
	--Morningstar
	or string_id == "bm_melee_morning_desc" and "If the deep punctures from the spikes don't kill you, the catastrophic trauma from the blunt head certainly will.\n\nThis weapon left a swathe of mangled bodies on the medieval battlefield."
		
	--Great Sword
	or string_id == "bm_melee_great_desc" and "The sword made famous by William Wallace.\nSix feet of razor-sharp steel, it was carried in a scabbard made from the skin of a tax-man.\n\nHow's that for sticking it to the authorities?"
		
	--Buckler Shield
	or string_id == "bm_melee_buck_desc" and "In the right hands, the Buckler Shield was as much a weapon as a means of defense.\nWorn on the forearm, it could be slammed into an enemy with enough force to knock them out of their breeches."
	
	--Bolt cutters
	or string_id == "bm_melee_boltcutter_desc" and "Your favorite serial killers need more than just an axe, a knife or a glove with razor fingers.\nThey need Bolt Cutters to quietly get into those places you thought were locked.\n\nWhere you thought you were safe..."
	
	--Boxcutter
	or string_id == "bm_melee_boxcutter_desc" and "It may seem like a utilitarian tool but if this blade can cut through the tough-bastard vacuum-sealed plastic of packaging crates, it can deal with anything the cops might wrap themselves in."
	
	--Selfie
	or string_id == "bm_melee_selfie_desc" and "As Hoxton said, \"look at that fucking berk with the selfie-stick. What a bellend. I bet it's strong, though. Y'know, I should take it off him and twat him with it. Back in a mo...\""
	--Lara Crotch
	or string_id == "bm_melee_topaz_desc" and "When you're scaling the slick cliffs beneath Angel Falls, you need something that can gouge into the hard rock. When you're robbing banks in D.C., you need something that can gouge into the helmets of cops."
	--Dive
	or DMCWO.reelnaems == true and string_id == "bm_melee_pugio" and "Extrema Ratio Pugio SE"
	or string_id == "bm_melee_pugio_desc" and "Simple and strong. Whether you're cutting throats, or cutting dolphins free of tangling fishing nets, it gets the job done. And it looks badass on your hip when you come swaggering out of the surf."
	--Gatorade
	or DMCWO.reelnaems == true and string_id == "bm_melee_gator" and "Gerber Gator Machete Pro"
	or string_id == "bm_melee_gator_desc" and "They say you can last three weeks without food, and three days without water, but in a hostile environment you won't last three hours without a good blade at your side."
	
	--H'yuk
	or string_id == "bm_melee_pitchfork_desc" and "Bidents, tridents, who cares? They're basically pitch forks. If Poseidon and Lucifer can use them, so can we. When the cops show up to interrupt your heisting, show them that villager spirit and chase them away like they are Frankenstein's Monster."
	--BONK
	or DMCWO.reelnaems == true and string_id == "bm_melee_scoutknife" and "Morakniv Classic Scout 39"
	or string_id == "bm_melee_scoutknife_desc" and "Don't let the rusty and worn appearance turn you off. A knife is always a knife - and some say an old knife ages just like a good wine (no one has probably ever said that). Try it out and you'll see things will bleed."
	--Shears
	or DMCWO.reelnaems == true and string_id == "bm_melee_shawn" and "Antique Sheep Shears"
	or string_id == "bm_melee_shawn_desc" and "Did you know that Sheep shearing is considered a sport? Maybe we should invent a new sport: cop shearing? No? Why not? Whatever... use them however you see fit, I guess..."
	--WREX
	or DMCWO.reelnaems == true and string_id == "bm_melee_stick" and "Shepherd's Crook"
	or string_id == "bm_melee_stick_desc" and "Tired after a long heist? Want to look old and wise? Maybe smash a cop's face in? The Shepherd's cane can do it all."
	
	--NINE INCHES
	or DMCWO.reelnaems == true and string_id == "bm_melee_nin" and "Paslode IM90i Nailgun"
	or string_id == "bm_melee_nin_desc" and "The Pounder, Wolf's favorite nailgun. \n\nWhen people ask about the name, Wolf is quick to correct it to \"The Punder\" and as they say that he screams: \"Nailed it!\""
	
	--BUALS
	or DMCWO.reelnaems == true and string_id == "bm_melee_ballistic" and "Ballistic Knives"
	or string_id == "bm_melee_ballistic_desc" and "A pair of American-made ballistic knives that should be capable of firing their blades out of their hilts via spring-power. Keyword being should.\n\nUnfortunately, Jimmy kept the blades loaded for who knows how long and the springs got compressed to hell leaving them unable to be fired..."
	
	--ALSO ZAP ZAP MOTHERFUCKER
	or string_id == "bm_melee_zeus_desc" and "A pair of homebrew knuckle dusters capable of stunning your enemies."
	
	--flippity floop
	or DMCWO.reelnaems == true and string_id == "bm_melee_wing" and "Benchmade Model 42 Balisong"
	or string_id == "bm_melee_wing_desc" and "Wing is the name of Sydney's melee knife.\n\nIt's a butterfly knife made by Benchmade, which she never leaves home without as it has saved her life more times than she can count. Those who know her also know the story of how she got it from another gang leader. Got it from his throat. So people seldom mess with her when she whips it out. Wing is a nifty little thing and Sydney loves showing off her skills. And everybody knows that when Wing starts flapping - chaos will come."--flippity floop
	
	--PICKLES
	or string_id == "bm_melee_road_desc" and "The Chain Whip is Rust’s melee weapon of choice. Rust is a fan of old school pain-inducing instruments. The actual Chain Whip itself was bought, not stolen, by Rust at a hardware store. He felt that a tool this important was worth paying for. It provides a certain classy touch to the whooshing sound it makes as it’s whipping across yet another face."
		
	or testAllStrings == true and string_id
	or text_original(self, string_id, ...)
			
end