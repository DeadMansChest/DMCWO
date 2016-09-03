--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_skill_init = SkillTreeTweakData.init
function SkillTreeTweakData:init()
	old_skill_init(self)
	
	local digest = function(value)
		return Application:digest_value(value, true)
	end
	
	if DMCWO._data_skills.havel_mum ~= true then
	
	self.tier_unlocks = {
		digest(0),
		digest(1),
		digest(9),
		digest(18)
	}
	
	--[[   SKILLTREES   ]]--
	--{
			
		--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{
				--Combat Medic
				self.skills.combat_medic = {
					["name_id"] = "menu_combat_medic_dmc",
					["desc_id"] = "menu_combat_medic_desc_dmc",
					["icon_xy"] = {5, 7},
					[1] = {
						upgrades = {
							"temporary_combat_medic_damage_multiplier1"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_revive_health_boost"
						},
						cost = self.costs.pro
					}
				}
	
				--Quick Fix
				self.skills.tea_time = {
					["name_id"] = "menu_tea_time_dmc",
					["desc_id"] = "menu_tea_time_desc_dmc",
					["icon_xy"] = {1, 11},
					[1] = {
						upgrades = {
							"first_aid_kit_deploy_time_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"first_aid_kit_damage_reduction_upgrade"
						},
						cost = self.costs.pro
					}
				}
				--Pain Killers
				self.skills.fast_learner = {
					["name_id"] = "menu_fast_learner_dmc",
					["desc_id"] = "menu_fast_learner_desc_dmc",
					["icon_xy"] = {0, 10},
					[1] = {
						upgrades = {
							"player_revive_damage_reduction_level_1"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_revive_damage_reduction_level_2"
						},
						cost = self.costs.pro
					}
				}
	
				--Uppers
				self.skills.tea_cookies = {
					["name_id"] = "menu_tea_cookies_dmc",
					["desc_id"] = "menu_tea_cookies_desc_dmc",
					["icon_xy"] = {2, 11},
					[1] = {
						upgrades = {
							"first_aid_kit_quantity_increase_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"first_aid_kit_quantity_increase_2"
						},
						cost = self.costs.hightierpro
					}
				}
				--Combat Doctor
				self.skills.medic_2x = {
					["name_id"] = "menu_medic_2x_dmc",
					["desc_id"] = "menu_medic_2x_desc_dmc",
					["icon_xy"] = {5, 8},
					[1] = {
						upgrades = {
							"doctor_bag_amount_increase1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"doctor_bag_quantity"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--Inspire
				self.skills.inspire = {
					["name_id"] = "menu_inspire_dmc",
					["desc_id"] = "menu_inspire_desc_dmc",
					["icon_xy"] = {4, 9},
					[1] = {
						upgrades = {
							"player_revive_interaction_speed_multiplier",
							"player_morale_boost"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"cooldown_long_dis_revive"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
			
			--[[   CONTROLLER SUBTREE   ]]--
			--{
				--Cable Guy (Endurance)
				self.skills.triathlete = {
					["name_id"] = "menu_triathlete_dmc",
					["desc_id"] = "menu_triathlete_desc_dmc",
					["icon_xy"] = {4, 7},
					[1] = {
						upgrades = {
							"cable_tie_quantity",
							"cable_tie_interact_speed_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_stamina_multiplier",
							"team_stamina_multiplier"
						},
						cost = self.costs.pro
					}
				}
	
				--Clowns are Scary (Cable Guy)
				self.skills.cable_guy = {
					["name_id"] = "menu_cable_guy_dmc",
					["desc_id"] = "menu_cable_guy_desc_dmc",
					["icon_xy"] = {2, 8},
					[1] = {
						upgrades = {
							"player_intimidate_range_mul",
							"player_intimidate_aura"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_convert_enemies_max_minions_2"
						},
						cost = self.costs.pro
					}
				}
				--Joker
				self.skills.joker = {
					["name_id"] = "menu_joker_dmc",
					["desc_id"] = "menu_joker_desc_dmc",
					["icon_xy"] = {6, 8},
					[1] = {
						upgrades = {
							"player_convert_enemies",
							"player_convert_enemies_max_minions_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_convert_enemies_health_multiplier",
							"player_convert_enemies_damage_multiplier",
							"player_convert_enemies_interaction_speed_multiplier"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--Stockholm Syndrome
				self.skills.stockholm_syndrome = {
					["name_id"] = "menu_stockholm_syndrome_dmc",
					["desc_id"] = "menu_stockholm_syndrome_desc_dmc",
					["icon_xy"] = {3, 8},
					[1] = {
						upgrades = {
							"player_civ_calming_alerts",
							"player_civ_intimidation_mul"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_civilian_reviver",
							"player_civilian_gives_ammo"
						},
						cost = self.costs.hightierpro
					}
				}
				--Partners in Crime
				self.skills.control_freak = {
					["name_id"] = "menu_control_freak_dmc",
					["desc_id"] = "menu_control_freak_desc_dmc",
					["icon_xy"] = {1, 10},
					[1] = {
						upgrades = {
							"player_minion_master_speed_multiplier",
							"player_passive_convert_enemies_health_multiplier_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_minion_master_health_multiplier",
							"player_passive_convert_enemies_health_multiplier_2"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--Hostage Taker
				self.skills.black_marketeer = {
					["name_id"] = "menu_black_marketeer_dmc",
					["desc_id"] = "menu_black_marketeer_desc_dmc",
					["icon_xy"] = {2, 10},
					[1] = {
						upgrades = {
							"player_hostage_health_regen_addend_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_hostage_health_regen_addend_2"
						},
						cost = self.costs.hightierpro
					}
				}			
			--}
			
			--[[   ASSAULT SUBTREE, FORMERLY SHARPSHOOTER   ]]--
			--{
				--Leadership (Stable Shot)
				self.skills.stable_shot = {
					["name_id"] = "menu_stable_shot_dmc",
					["desc_id"] = "menu_stable_shot_desc_dmc",
					["icon_xy"] = {7, 7},
					[1] = {
						upgrades = {
							"smg_recoil_index_addend"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"team_weapon_recoil_index_addend",
							"team_weapon_suppression_recoil_index_addend"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--MG Handling (Rifleman)
				self.skills.rifleman = {
					["name_id"] = "menu_rifleman_dmc",
					["desc_id"] = "menu_rifleman_desc_dmc",
					["icon_xy"] = {10, 0},
					[1] = {
						upgrades = {
							"smg_hip_fire_spread_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"smg_reload_speed_multiplier"
						},
						cost = self.costs.pro
					}
				}
				--MG Specialist (Marksman)
				self.skills.sharpshooter = {
					["name_id"] = "menu_sharpshooter_dmc",
					["desc_id"] = "menu_sharpshooter_desc_dmc",
					["icon_xy"] = {3, 3},
					[1] = {
						upgrades = {
							"smg_fire_rate_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"smg_damage_multiplier"
						},
						cost = self.costs.pro
					}
				}
	
				--Shock and Awe (Spotter)
				self.skills.spotter_teamwork = {
					["name_id"] = "menu_spotter_teamwork_dmc",
					["desc_id"] = "menu_spotter_teamwork_desc_dmc",
					["icon_xy"] = {2, 0},
					[1] = {
						upgrades = {
							"weapon_clip_ammo_increase_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_run_and_shoot_1",
							"weapon_clip_ammo_increase_2"
						},
						cost = self.costs.hightierpro
					}
				}
				--Heavy Impact
				self.skills.speedy_reload = {
					["name_id"] = "menu_speedy_reload_dmc",
					["desc_id"] = "menu_speedy_reload_desc_dmc",
					["icon_xy"] = {10, 1},
					[1] = {
						upgrades = {
							"weapon_knock_down_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"weapon_knock_down_2"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--Body Expertise
				self.skills.single_shot_ammo_return = {
					["name_id"] = "menu_single_shot_ammo_return_dmc",
					["desc_id"] = "menu_single_shot_ammo_return_desc_dmc",
					["icon_xy"] = {10, 3},
					[1] = {
						upgrades = {
							"player_ap_bullets_1",
							"weapon_automatic_head_shot_add_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"weapon_automatic_head_shot_add_2"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
		--}
	
		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{
				--Underdog
				self.skills.underdog = {
					["name_id"] = "menu_underdog_dmc",
					["desc_id"] = "menu_underdog_desc_dmc",
					["icon_xy"] = {2, 1},
					[1] = {
						upgrades = {
							"player_damage_multiplier_outnumbered"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_damage_dampener_outnumbered"
						},
						cost = self.costs.pro
					}
				}
				
				--Shotgun CQB
				self.skills.shotgun_cqb = {
					["name_id"] = "menu_shotgun_cqb_dmc",
					["desc_id"] = "menu_shotgun_cqb_desc_dmc",
					["icon_xy"] = {5, 1},
					[1] = {
						upgrades = {
							"shotgun_enter_steelsight_speed_multiplier",
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"shotgun_reload_speed_multiplier_1"
						},
						cost = self.costs.hightierpro
					}
				}
				--Shotgun Impact
				self.skills.shotgun_impact = {
					["name_id"] = "menu_shotgun_impact_dmc",
					["desc_id"] = "menu_shotgun_impact_desc_dmc",
					["icon_xy"] = {5, 0},
					[1] = {
						upgrades = {
							"shotgun_recoil_index_addend"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"shotgun_damage_multiplier_2"
						},
						cost = self.costs.pro
					}
				}
				
				--Pigeon Shooter (Far Away)
				self.skills.far_away = {
					["name_id"] = "menu_far_away_dmc",
					["desc_id"] = "menu_far_away_desc_dmc",
					["icon_xy"] = {8, 5},
					[1] = {
						upgrades = {
							"shotgun_steelsight_accuracy_inc_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"shotgun_steelsight_range_inc_1"
						},
						cost = self.costs.hightierpro
					}
				}				
				--Gung-Ho (Close By)
				self.skills.close_by = {
					["name_id"] = "menu_close_by_dmc",
					["desc_id"] = "menu_close_by_desc_dmc",
					["icon_xy"] = {8, 6},
					[1] = {
						upgrades = {
							"shotgun_hip_run_and_shoot_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"shotgun_hip_rate_of_fire_1"
						},
						cost = self.costs.hightierpro
					}
				}
				
				--Overkill
				self.skills.overkill = {
					["name_id"] = "menu_overkill_dmc",
					["desc_id"] = "menu_overkill_desc_dmc",
					["icon_xy"] = {3, 2},
					[1] = {
						upgrades = {
							"player_overkill_damage_multiplier"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_overkill_all_weapons",
							"player_overkill_damage_multiplier_2",
							"saw_swap_speed_multiplier",
							"shotgun_swap_speed_multiplier"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
			
			--[[   JUGGERNAUT SUBTREE (FORMERLLY ARMORER)   ]]--
			--{
				--Stun Resistance (Oppressor)
				self.skills.oppressor = {
					["name_id"] = "menu_oppressor_dmc",
					["desc_id"] = "menu_oppressor_desc_dmc",
					["icon_xy"] = {6, 1},
					[1] = {
						upgrades = {
							"player_damage_shake_addend"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_flashbang_multiplier_1",
							"player_flashbang_multiplier_2"
						},
						cost = self.costs.pro
					}
				}
				
				--Die Hard
				self.skills.show_of_force = {
					["name_id"] = "menu_show_of_force_dmc",
					["desc_id"] = "menu_show_of_force_desc_dmc",
					["icon_xy"] = {1, 2},
					[1] = {
						upgrades = {
							"player_armor_regen_timer_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_primary_weapon_when_downed"
						},
						cost = self.costs.pro
					}
				}
				--Transporter
				self.skills.pack_mule = {
					["name_id"] = "menu_pack_mule_dmc",
					["desc_id"] = "menu_pack_mule_desc_dmc",
					["icon_xy"] = {6, 0},
					[1] = {
						upgrades = {
							"carry_throw_distance_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"carry_movement_penalty_nullifier"
						},
						cost = self.costs.pro
					}
				}
				
				--More Blood To Bleed (Bulletproof)
				self.skills.iron_man = {
					["name_id"] = "menu_iron_man_dmc",
					["desc_id"] = "menu_iron_man_desc_dmc",
					["icon_xy"] = {1, 1},
					[1] = {
						upgrades = {
							"player_health_multiplier"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_health_multiplier_2"
						},
						cost = self.costs.hightierpro
					}
				}
				--Bullseye
				self.skills.prison_wife = {
					["name_id"] = "menu_prison_wife_dmc",
					["desc_id"] = "menu_prison_wife_desc_dmc",
					["icon_xy"] = {6, 11},
					[1] = {
						upgrades = {
							"player_headshot_regen_armor_bonus_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_headshot_regen_armor_bonus_2"
						},
						cost = self.costs.hightierpro
					}
				}
			
				--Iron Man
				self.skills.juggernaut = {
					["name_id"] = "menu_juggernaut_dmc",
					["desc_id"] = "menu_juggernaut_desc_dmc",
					["icon_xy"] = {3, 1},
					[1] = {
						upgrades = {
							"body_armor6"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_shield_knock"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
			
			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{
				--Scavenger (Scavenging)
				self.skills.scavenging = {
					["name_id"] = "menu_scavenging_dmc",
					["desc_id"] = "menu_scavenging_desc_dmc",
					["icon_xy"] = {8, 11},
					[1] = {
						upgrades = {
							"player_increased_pickup_area_1"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_double_drop_1"
						},
						cost = self.costs.pro
					}
				}
				
				--Bullet Storm
				self.skills.ammo_reservoir = {
					["name_id"] = "menu_ammo_reservoir_dmc",
					["desc_id"] = "menu_ammo_reservoir_desc_dmc",
					["icon_xy"] = {4, 5},
					[1] = {
						upgrades = {
							"temporary_no_ammo_cost_1"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"temporary_no_ammo_cost_2"
						},
						cost = self.costs.pro
					}
				}
				--Portable Saw
				self.skills.portable_saw = {
					["name_id"] = "menu_portable_saw_dmc",
					["desc_id"] = "menu_portable_saw_desc_dmc",
					["icon_xy"] = {0, 1},
					[1] = {
						upgrades = {
							"saw_secondary"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"saw_extra_ammo_multiplier",
							"saw_damage_multiplier"

						},
						cost = self.costs.hightierpro
					}
				}
				
				--Extra Lead
				self.skills.ammo_2x = {
					["name_id"] = "menu_ammo_2x_dmc",
					["desc_id"] = "menu_ammo_2x_desc_dmc",
					["icon_xy"] = {7, 1},
					[1] = {
						upgrades = {
							"ammo_bag_ammo_increase1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"ammo_bag_quantity"
						},
						cost = self.costs.hightierpro
					}
				}
				--Carbon Blade
				self.skills.carbon_blade = {
					["name_id"] = "menu_carbon_blade_dmc",
					["desc_id"] = "menu_carbon_blade_desc_dmc",
					["icon_xy"] = {0, 2},
					[1] = {
						upgrades = {
							"saw_enemy_slicer"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"saw_ignore_shields_1",
							"saw_panic_when_kill_1"
						},
						cost = self.costs.hightierpro
					}
				}

				--Fully Loaded
				self.skills.bandoliers = {
					["name_id"] = "menu_bandoliers_dmc",
					["desc_id"] = "menu_bandoliers_desc_dmc",
					["icon_xy"] = {3, 0},
					[1] = {
						upgrades = {
							"extra_ammo_multiplier1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_pick_up_ammo_multiplier",
							"player_pick_up_ammo_multiplier_2"
						},
						cost = self.costs.hightierpro
					}
				}
				
			--}
		--}
		
		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{
				--Third Law
				self.skills.defense_up = {
					["name_id"] = "menu_defense_up_dmc",
					["desc_id"] = "menu_defense_up_desc_dmc",
					["icon_xy"] = {9, 0},
					[1] = {
						upgrades = {
							"sentry_gun_cost_reduction_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"sentry_gun_shield"
						},
						cost = self.costs.hightierpro
					}
				}
				--Sentry Targeting Package
				self.skills.sentry_targeting_package = {
					["name_id"] = "menu_sentry_targeting_package_dmc",
					["desc_id"] = "menu_sentry_targeting_package_desc_dmc",
					["icon_xy"] = {9, 1},
					[1] = {
						upgrades = {
							"sentry_gun_spread_multiplier"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"sentry_gun_rot_speed_multiplier",
							"sentry_gun_extra_ammo_multiplier_1"
						},
						cost = self.costs.hightierpro
					}
				}
				--Eco Sentry
				self.skills.eco_sentry = {
					["name_id"] = "menu_eco_sentry_dmc",
					["desc_id"] = "menu_eco_sentry_desc_dmc",
					["icon_xy"] = {9, 2},
					[1] = {
						upgrades = {
							"sentry_gun_cost_reduction_2"
						},		
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"sentry_gun_armor_multiplier"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--Engineering
				self.skills.engineering = {
					["name_id"] = "menu_engineering_dmc",
					["desc_id"] = "menu_engineering_desc_dmc",
					["icon_xy"] = {9, 3},
					[1] = {
						upgrades = {
							"sentry_gun_silent"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"sentry_gun_ap_bullets",
							"sentry_gun_damage_multiplier",
							"sentry_gun_fire_rate_reduction_1"
						},
						cost = self.costs.hightierpro
					}
				}
				--Jack of All Trades
				self.skills.jack_of_all_trades = {
					["name_id"] = "menu_jack_of_all_trades_dmc",
					["desc_id"] = "menu_jack_of_all_trades_desc_dmc",
					["icon_xy"] = {9, 4},
					[1] = {
						upgrades = {
							"deploy_interact_faster_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"second_deployable_1"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--Tower Defense
				self.skills.tower_defense = {
					["name_id"] = "menu_tower_defense_dmc",
					["desc_id"] = "menu_tower_defense_desc_dmc",
					["icon_xy"] = {9, 5},
					[1] = {
						upgrades = {
							"sentry_gun_quantity_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"sentry_gun_quantity_2"
						},
						cost = self.costs.hightierpro
					}
				}

			--}
			
			--[[   BREACHER SUBTREE   ]]--
			--{
				--Hardware Expert
				self.skills.hardware_expert = {
					["name_id"] = "menu_hardware_expert_dmc",
					["desc_id"] = "menu_hardware_expert_desc_dmc",
					["icon_xy"] = {9, 6},
					[1] = {
						upgrades = {
							"player_drill_fix_interaction_speed_multiplier",
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_drill_alert",
							"player_silent_drill"
						},
						cost = self.costs.pro
					}
				}
	
				--Danger Close (Combat Engineering)
				self.skills.combat_engineering = {
					["name_id"] = "menu_combat_engineering_dmc",
					["desc_id"] = "menu_combat_engineering_desc_dmc",
					["icon_xy"] = {4, 6},
					[1] = {
						upgrades = {
							"trip_mine_explosion_size_multiplier_1"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"trip_mine_damage_multiplier_1"
						},
						cost = self.costs.pro
					}
				}
				--Drill Sawgeant
				self.skills.drill_expert = {
					["name_id"] = "menu_drill_expert_dmc",
					["desc_id"] = "menu_drill_expert_desc_dmc",
					["icon_xy"] = {3, 6},
					[1] = {
						upgrades = {
							"player_drill_speed_multiplier1"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_drill_speed_multiplier2"
						},
						cost = self.costs.pro
					}
				}
	
				--Demoman (More Firepower)
				self.skills.more_fire_power = {
					["name_id"] = "menu_more_fire_power_dmc",
					["desc_id"] = "menu_more_fire_power_desc_dmc",
					["icon_xy"] = {9, 7},
					[1] = {
						upgrades = {
							"shape_charge_quantity_increase_1",
							"trip_mine_quantity_increase_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"shape_charge_quantity_increase_2",
							"trip_mine_quantity_increase_2"
						},
						cost = self.costs.hightierpro
					}
				}
				--Kick Starter
				self.skills.kick_starter = {
					["name_id"] = "menu_kick_starter_dmc",
					["desc_id"] = "menu_kick_starter_desc_dmc",
					["icon_xy"] = {9, 8},
					[1] = {
						upgrades = {
							"player_drill_autorepair_1",
							"player_drill_autorepair_2"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_drill_melee_hit_restart_chance_1"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--Fire Trap
				self.skills.fire_trap = {
					["name_id"] = "menu_fire_trap_dmc",
					["desc_id"] = "menu_fire_trap_desc_dmc",
					["icon_xy"] = {9, 9},
					[1] = {
						upgrades = {
							"trip_mine_fire_trap_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"trip_mine_fire_trap_2"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
			
			--[[   BATTLE SAPPER SUBTREE (OPPRESSOR)   ]]--
			--{
				--Sharpshooter (Steady Grip)	
				self.skills.steady_grip = {
					["name_id"] = "menu_steady_grip_dmc",
					["desc_id"] = "menu_steady_grip_desc_dmc",
					["icon_xy"] = {0, 5},
					[1] = {
						upgrades = {
							"weapon_single_spread_index_addend"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"assault_rifle_recoil_index_addend",
							"snp_recoil_index_addend"
						},
						cost = self.costs.pro
					}
				}
	
				--Kilmer (Heavy Impact)
				self.skills.heavy_impact = {
					["name_id"] = "menu_heavy_impact_dmc",
					["desc_id"] = "menu_heavy_impact_desc_dmc",
					["icon_xy"] = {1, 9},
					[1] = {
						upgrades = {
							"assault_rifle_enter_steelsight_speed_multiplier",
							"snp_enter_steelsight_speed_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"assault_rifle_reload_speed_multiplier",
							"snp_reload_speed_multiplier",
							"weapon_exit_run_speed_multiplier"
						},
						cost = self.costs.pro
					}
				}
				--Spotter (Fire Control)
				self.skills.fire_control = {
					["name_id"] = "menu_fire_control_dmc",
					["desc_id"] = "menu_fire_control_desc_dmc",
					["icon_xy"] = {8, 2},
					[1] = {
						upgrades = {
							"player_marked_enemy_extra_damage"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_marked_inc_dmg_distance_1"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--Nerves of Steel (Shock and Awe)
				self.skills.shock_and_awe = {
					["name_id"] = "menu_shock_and_awe_dmc",
					["desc_id"] = "menu_shock_and_awe_desc_dmc",
					["icon_xy"] = {6, 6},
					[1] = {
						upgrades = {
							"player_interacting_damage_multiplier",
							"player_steelsight_when_downed"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"assault_rifle_move_spread_multiplier",
							"player_run_and_reload",
							"snp_move_spread_multiplier"
						},
						cost = self.costs.hightierpro
					}
				}
				--Ammo Efficiency (Fast Fire)
				self.skills.fast_fire = {
					["name_id"] = "menu_fast_fire_dmc",
					["desc_id"] = "menu_fast_fire_desc_dmc",
					["icon_xy"] = {8, 4},
					[1] = {
						upgrades = {
							"head_shot_ammo_return_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"head_shot_ammo_return_2"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--Bulletproof (Body Expertise)
				self.skills.body_expertise = {
					["name_id"] = "menu_body_expertise_dmc",
					["desc_id"] = "menu_body_expertise_desc_dmc",
					["icon_xy"] = {6, 4},
					[1] = {
						upgrades = {
							"player_armor_multiplier"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"team_armor_regen_time_multiplier"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
		--}
		
		--[[   GHOST   ]]--
		--{
			--[[   COVERT OPS SUBTREE   ]]--
			--{
				--Chameleon
				self.skills.jail_workout = {
					["name_id"] = "menu_jail_workout_dmc",
					["desc_id"] = "menu_jail_workout_desc_dmc",
					["icon_xy"] = {5, 3},
					[1] = {
						upgrades = {
							"player_suspicion_bonus",
							"player_sec_camera_highlight_mask_off",
							"player_special_enemy_highlight_mask_off"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_mask_off_pickup",
							"player_small_loot_multiplier1",
							"player_small_loot_multiplier2"
						},
						cost = self.costs.pro
					}
				}
	
				--Undertaker (Cleaner)
				self.skills.cleaner = {
					["name_id"] = "menu_cleaner_dmc",
					["desc_id"] = "menu_cleaner_desc_dmc",
					["icon_xy"] = {7, 2},
					[1] = {
						upgrades = {
							"player_corpse_dispose_amount_2",
							"player_extra_corpse_dispose_amount"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"bodybags_bag_quantity"
						},
						cost = self.costs.pro
					}
				}
				--Sixth Sense
				self.skills.chameleon = {
					["name_id"] = "menu_chameleon_dmc",
					["desc_id"] = "menu_chameleon_desc_dmc",
					["icon_xy"] = {6, 10},
					[1] = {
						upgrades = {
							"player_standstill_omniscience"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_buy_bodybags_asset",
							"player_additional_assets",
							"player_cleaner_cost_multiplier",
							"player_buy_spotter_asset"
						},
						cost = self.costs.pro
					}
				}
	
				--Espionage (Undertaker)
				self.skills.second_chances = {
					["name_id"] = "menu_second_chances_dmc",
					["desc_id"] = "menu_second_chances_desc_dmc",
					["icon_xy"] = {5, 11},
					[1] = {
						upgrades = {
							"player_tape_loop_duration_1",
							"player_tape_loop_duration_2"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_pick_lock_hard",
							"player_pick_lock_easy_speed_multiplier_2"
						},
						cost = self.costs.hightierpro
					}
				}
				--ECM Overdrive
				self.skills.ecm_booster = {
					["name_id"] = "menu_ecm_booster_dmc",
					["desc_id"] = "menu_ecm_booster_desc_dmc",
					["icon_xy"] = {6, 3},
					[1] = {
						upgrades = {
							"ecm_jammer_duration_multiplier",
							"ecm_jammer_feedback_duration_boost"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"ecm_jammer_can_open_sec_doors"
						},
						cost = self.costs.hightierpro
					}
				}
	
				--ECM Specialist
				self.skills.ecm_2x = {
					["name_id"] = "menu_ecm_2x_dmc",
					["desc_id"] = "menu_ecm_2x_desc_dmc",
					["icon_xy"] = {3, 4},
					[1] = {
						upgrades = {
							"ecm_jammer_quantity_increase_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"ecm_jammer_duration_multiplier_2",
							"ecm_jammer_feedback_duration_boost_2",
							"ecm_jammer_affects_pagers"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
			
			--[[   COMMANDO SUBTREE   ]]--
			--{
				--Duck and Cover
				self.skills.sprinter = {
					["name_id"] = "menu_sprinter_dmc",
					["desc_id"] = "menu_sprinter_desc_dmc",
					["icon_xy"] = {7, 3},
					[1] = {
						upgrades = {
							"player_stamina_regen_timer_multiplier",
							"player_stamina_regen_multiplier",
							"player_run_speed_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_run_dodge_chance",
							"player_crouch_dodge_chance_2"
						},
						cost = self.costs.pro
					}
				}
	
				--Evasion
				self.skills.awareness = {
					["name_id"] = "menu_awareness_dmc",
					["desc_id"] = "menu_awareness_desc_dmc",
					["icon_xy"] = {7, 10},
					[1] = {
						upgrades = {
							"player_movement_speed_multiplier",
							"player_climb_speed_multiplier_1"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_steelsight_normal_movement_speed",
							"player_fall_damage_multiplier",
							"player_fall_health_damage_multiplier"
						},
						cost = self.costs.pro
					}
				}
				--Deep Pockets (Thick Skin)
				self.skills.thick_skin = {
					["name_id"] = "menu_thick_skin_dmc",
					["desc_id"] = "menu_thick_skin_desc_dmc",
					["icon_xy"] = {10, 7},
					[1] = {
						upgrades = {
							"player_melee_concealment_modifier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_level_2_armor_addend",
							"player_level_3_armor_addend",
							"player_level_4_armor_addend",
							"player_ballistic_vest_concealment_1"
						},
						cost = self.costs.pro
					}	
				}
	
				--Moving Target (Dire Need)
				self.skills.dire_need = {
					["name_id"] = "menu_dire_need_dmc",
					["desc_id"] = "menu_dire_need_desc_dmc",
					["icon_xy"] = {2, 4},
					[1] = {
						upgrades = {
							"player_detection_risk_add_movement_speed_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_detection_risk_add_movement_speed_2"
						},
						cost = self.costs.hightierpro
					}
				}
				--Shockproof
				self.skills.insulation = {
					["name_id"] = "menu_insulation_dmc",
					["desc_id"] = "menu_insulation_desc_dmc",
					["icon_xy"] = {3, 5},
					[1] = {
						upgrades = {
							"player_taser_malfunction"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_taser_self_shock",
							"player_escape_taser_1"
						},
						cost = self.costs.hightierpro
					}	
				}
	
				--Sneaky Bastard
				self.skills.jail_diet = {
					["name_id"] = "menu_jail_diet_dmc",
					["desc_id"] = "menu_jail_diet_desc_dmc",
					["icon_xy"] = {1, 12},
					[1] = {
						upgrades = {
							"player_detection_risk_add_dodge_chance_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_detection_risk_add_dodge_chance_2"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
			
			--[[   SILENT KILLER SUBTREE   ]]--
			--{
				--Second Wind
				self.skills.scavenger = {
					["name_id"] = "menu_scavenger_dmc",
					["desc_id"] = "menu_scavenger_desc_dmc",
					["icon_xy"] = {10, 9},
					[1] = {
						upgrades = {
							"temporary_damage_speed_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"temporary_damage_speed_multiplier_2"
						},
						cost = self.costs.pro
					}
				}
				
				--Optical Illusions
				self.skills.optic_illusions = {
					["name_id"] = "menu_optic_illusions_dmc",
					["desc_id"] = "menu_optic_illusions_desc_dmc",
					["icon_xy"] = {10, 10},
					[1] = {
						upgrades = {
							"player_silencer_concealment_increase_1"
						},	
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_silencer_concealment_penalty_decrease_1"
						},
						cost = self.costs.hightierpro
					}
				}
				--The Professional
				self.skills.silence_expert = {
					["name_id"] = "menu_silence_expert_dmc",
					["desc_id"] = "menu_silence_expert_desc_dmc",
					["icon_xy"] = {4, 4},
					[1] = {
						upgrades = {
							"weapon_silencer_recoil_index_addend"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"weapon_silencer_spread_index_addend",
							"weapon_silencer_enter_steelsight_speed_multiplier"
						},
						cost = self.costs.hightierpro
					}
				}
				
				--Dire Need (Low Blow)
				self.skills.backstab = {
					["name_id"] = "menu_backstab_dmc",
					["desc_id"] = "menu_backstab_desc_dmc",
					["icon_xy"] = {10, 8},
					[1] = {
						upgrades = {
							"player_armor_depleted_stagger_shot_1"
						},	
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_armor_depleted_stagger_shot_2"
						},
						cost = self.costs.hightierpro
					}
				}
				--Subsonic Rounds
				self.skills.hitman = {
					["name_id"] = "menu_hitman_dmc",
					["desc_id"] = "menu_hitman_desc_dmc",
					["icon_xy"] = {5, 9},
					[1] = {
						upgrades = {
							"weapon_supp_range_buff_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"weapon_supp_range_buff_2"
						},
						cost = self.costs.hightierpro
					}
				}
				
				--Low Blow (Unseen Strike)
				self.skills.unseen_strike = {
					["name_id"] = "menu_unseen_strike_dmc",
					["desc_id"] = "menu_unseen_strike_desc_dmc",
					["icon_xy"] = {0, 12},
					[1] = {
						upgrades = {
							"player_detection_risk_add_crit_chance_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_detection_risk_add_crit_chance_2"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
		--}
		
		--[[   FUGITIVE   ]]--
		--{
			--[[   GUNSLINGER SUBTREE   ]]--
			--{
				--Equilibrium
				self.skills.equilibrium = {
					["name_id"] = "menu_equilibrium_dmc",
					["desc_id"] = "menu_equilibrium_desc_dmc",
					["icon_xy"] = {3, 9},
					[1] = {
						upgrades = {
							"pistol_swap_speed_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"team_pistol_recoil_index_addend",
							"team_pistol_suppression_recoil_index_addend"
						},
						cost = self.costs.pro
					}
				}

				--Gun Nut
				self.skills.dance_instructor = {
					["name_id"] = "menu_dance_instructor_dmc",
					["desc_id"] = "menu_dance_instructor_desc_dmc",
					["icon_xy"] = {11, 0},
					[1] = {
						upgrades = {
							"pistol_spread_index_addend"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"pistol_fire_rate_multiplier"
						},
						cost = self.costs.pro
					}
				}
				--Over Pressurized/Custom Ammo (Akimbo)
				self.skills.akimbo = {
					["name_id"] = "menu_akimbo_skill_dmc",
					["desc_id"] = "menu_akimbo_skill_desc_dmc",
					["icon_xy"] = {7, 11},
					[1] = {
						upgrades = {
							"pistol_reload_speed_multiplier"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"pistol_damage_multiplier"
						},
						cost = self.costs.hightierpro
					}
				}
				
				--Akimbo (Over Pressurized/Custom Ammo)
				self.skills.gun_fighter = {
					["name_id"] = "menu_gun_fighter_dmc",
					["desc_id"] = "menu_gun_fighter_desc_dmc",
					["icon_xy"] = {3, 11},
					[1] = {
						upgrades = {
							"akimbo_recoil_multiplier_2",
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"akimbo_recoil_multiplier_3",
							"akimbo_extra_ammo_multiplier_1",
							"akimbo_extra_ammo_multiplier_2"
						},
						cost = self.costs.hightierpro
					}
				}
				--Desperado
				self.skills.expert_handling = {
					["name_id"] = "menu_expert_handling_dmc",
					["desc_id"] = "menu_expert_handling_desc_dmc",
					["icon_xy"] = {11, 1},
					[1] = {
						upgrades = {
							"pistol_stacked_accuracy_bonus_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"pistol_stacked_accuracy_bonus_2"
						},
						cost = self.costs.hightierpro
					}
				}
				
				--Trigger Happy
				self.skills.trigger_happy = {
					["name_id"] = "menu_trigger_happy_dmc",
					["desc_id"] = "menu_trigger_happy_desc_dmc",
					["icon_xy"] = {11, 2},
					[1] = {
						upgrades = {
							"pistol_stacking_hit_expire_t_1",
							"pistol_stacking_hit_damage_multiplier"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"pistol_stacking_hit_expire_t_2"
						},
						cost = self.costs.hightierpro
					}
				}			
				
			--}
			
			--[[   RELENTLESS SUBTREE   ]]--
			--{
				--Running From Death (Nine Lives)
				self.skills.nine_lives = {
					["name_id"] = "menu_nine_lives_dmc",
					["desc_id"] = "menu_nine_lives_desc_dmc",
					["icon_xy"] = {11, 3},
					[1] = {
						upgrades = {
							"player_temp_swap_weapon_faster_1",
							"player_temp_reload_weapon_faster_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_temp_increased_movement_speed_1"
						},
						cost = self.costs.hightierpro
					}
				}
									
				--Nine Lives (Running From Death)
				self.skills.running_from_death = {
					["name_id"] = "menu_running_from_death_dmc",
					["desc_id"] = "menu_running_from_death_desc_dmc",
					["icon_xy"] = {5, 2},
					[1] = {
						upgrades = {
							"player_bleed_out_health_multiplier"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_additional_lives_1"
						},
						cost = self.costs.hightierpro
					}
				}
				--Up You Go
				self.skills.up_you_go = {
					["name_id"] = "menu_up_you_go_dmc",
					["desc_id"] = "menu_up_you_go_desc_dmc",
					["icon_xy"] = {11, 4},
					[1] = {
						upgrades = {
							"player_revived_damage_resist_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_revived_health_regain_1"
						},
						cost = self.costs.hightierpro
					}
				}
				
				--Swan Song
				self.skills.perseverance = {
					["name_id"] = "menu_perseverance_dmc",
					["desc_id"] = "menu_perseverance_desc_dmc",
					["icon_xy"] = {5, 12},
					[1] = {
						upgrades = {
							"temporary_berserker_damage_multiplier_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"temporary_berserker_damage_multiplier_2"
						},
						cost = self.costs.hightierpro
					}
				}
				--Undying (Feign Death)
				self.skills.feign_death = {
					["name_id"] = "menu_feign_death_dmc",
					["desc_id"] = "menu_feign_death_desc_dmc",
					["icon_xy"] = {11, 5},
					[1] = {
						upgrades = {
							"player_cheat_death_chance_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_cheat_death_chance_2"
						},
						cost = self.costs.hightierpro
					}
				}
				
				--Messiah
				self.skills.messiah = {
					["name_id"] = "menu_pistol_messiah_dmc",
					["desc_id"] = "menu_pistol_messiah_desc_dmc",
					["icon_xy"] = {2, 9},
					[1] = {
						upgrades = {
							"player_messiah_revive_from_bleed_out_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_messiah_revive_from_bleed_out_2"
						},
						cost = self.costs.hightierpro
					}
				}
				
			--}
			
			--[[   BRAWLER SUBTREE   ]]--
			--{
				--Martial Arts
				self.skills.martial_arts = {
					["name_id"] = "menu_martial_arts_dmc",
					["desc_id"] = "menu_martial_arts_desc_dmc",
					["icon_xy"] = {1, 3},
					[1] = {
						upgrades = {
							"player_melee_damage_dampener"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_melee_knockdown_mul_1"
						},
						cost = self.costs.pro
					}
				}
				
				--Bloodthirst
				self.skills.bloodthirst = {
					["name_id"] = "menu_bloodthirst_dmc",
					["desc_id"] = "menu_bloodthirst_desc_dmc",
					["icon_xy"] = {11, 6},
					[1] = {
						upgrades = {
							"player_melee_damage_stacking_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_temp_melee_kill_increase_reload_speed_1"
						},
						cost = self.costs.hightierpro
					}
				}
				--Pumping Iron
				self.skills.steroids = {
					["name_id"] = "menu_steroids_dmc",
					["desc_id"] = "menu_steroids_desc_dmc",
					["icon_xy"] = {4, 0},
					[1] = {
						upgrades = {
							"player_non_special_melee_multiplier",
							"player_melee_damage_multiplier"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"player_non_special_melee_multiplier_ace",
							"player_melee_damage_multiplier_ace"
						},
						cost = self.costs.pro
					}
				}
				
				--Counter Strike
				self.skills.drop_soap = {
					["name_id"] = "menu_drop_soap_dmc",
					["desc_id"] = "menu_drop_soap_desc_dmc",
					["icon_xy"] = {4, 12},
					[1] = {
						upgrades = {
							"player_counter_strike_melee"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_counter_strike_spooc"
						},
						cost = self.costs.hightierpro
					}
				}
				--Frenzy (Formerly Berserker)
				self.skills.wolverine = {
					["name_id"] = "menu_wolverine_dmc",
					["desc_id"] = "menu_wolverine_desc_dmc",
					["icon_xy"] = {11, 8},
					[1] = {
						upgrades = {
							"player_healing_reduction_1",
							"player_real_health_damage_reduction_1",
							"player_max_health_reduction_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_healing_reduction_2",
							"player_real_health_damage_reduction_2"
						},
						cost = self.costs.hightierpro
					}
				}
				
				--Berserker (Formerly Frenzy)
				self.skills.frenzy = {
					["name_id"] = "menu_frenzy_dmc",
					["desc_id"] = "menu_frenzy_desc_dmc",
					["icon_xy"] = {2, 2},
					[1] = {
						upgrades = {
							"player_melee_damage_health_ratio_multiplier"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_damage_health_ratio_multiplier"
						},
						cost = self.costs.hightierpro
					}
				}
			--}
		--}
	--}
		
	--Default Upgrades
	self.default_upgrades = {
		"carry_interact_speed_multiplier_1",
		"carry_interact_speed_multiplier_2",
		"carry_movement_speed_multiplier",
		"trip_mine_sensor_toggle",
		"trip_mine_sensor_highlight",
		"trip_mine_can_switch_on_off",
		"player_fall_damage_multiplier",
		"player_fall_health_damage_multiplier",
		"player_silent_kill",
		"player_can_free_run",
		--"player_primary_weapon_when_downed",
		"jowi",
		"x_1911",
		"x_b92fs",
		"x_deagle",
		"x_g22c",
		"x_g17",
		"x_usp",
		"x_sr2",
		"x_mp5",
		"x_akmsu",
		--"akimbo_recoil_index_addend_1",
		"akimbo_recoil_multiplier_1",
		"ecm_jammer_can_activate_feedback",
		"ecm_jammer_interaction_speed_multiplier",
		"ecm_jammer_can_retrigger",
		"saw",
		"cable_tie",
		"player_special_enemy_highlight",
		"player_hostage_trade",
		"player_sec_camera_highlight",
		"player_corpse_dispose",
		"player_corpse_dispose_amount_1",
		"player_civ_harmless_melee",
		"temporary_first_aid_damage_reduction",
		"temporary_passive_revive_damage_reduction_2",
		"default_upgrades",
		"doctor_bag",
		"ammo_bag",
		"trip_mine",
		"ecm_jammer",
		"ecm_jammer_affects_cameras",
		"first_aid_kit",
		"sentry_gun",
		"bodybags_bag",
		"player_intimidate_enemies"
	}
	
	else
	
		--Fully Loaded
		self.skills.bandoliers = {
			["name_id"] = "menu_bandoliers_dmc",
			["desc_id"] = "menu_bandoliers_desc_dmc",
			["icon_xy"] = {3, 0},
			[1] = {
				upgrades = {
					"extra_ammo_multiplier1"
				},
				cost = self.costs.hightier
			},
			[2] = {
				upgrades = {
					"player_pick_up_ammo_multiplier",
					"player_pick_up_ammo_multiplier_2"
				},
				cost = self.costs.hightierpro
			}
		}
		--Bullet Storm
		self.skills.ammo_reservoir = {
			["name_id"] = "menu_ammo_reservoir_dmc",
			["desc_id"] = "menu_ammo_reservoir_desc_dmc",
			["icon_xy"] = {4, 5},
			[1] = {
				upgrades = {
					"temporary_no_ammo_cost_1"
				},
				cost = self.costs.default
			},
			[2] = {
				upgrades = {
					"temporary_no_ammo_cost_2"
				},
				cost = self.costs.pro
			}
		}
		--Akimbo
		self.skills.akimbo = {
			["name_id"] = "menu_akimbo_skill",
			["desc_id"] = "menu_gun_fighter_desc_dmc",
			["icon_xy"] = {7, 11},
			[1] = {
				upgrades = {
					"akimbo_recoil_multiplier_2"
				},
				cost = self.costs.hightier
			},
			[2] = {
				upgrades = {
					"akimbo_recoil_multiplier_3",
					"akimbo_extra_ammo_multiplier_1",
					"akimbo_extra_ammo_multiplier_2"
				},
				cost = self.costs.hightierpro
			}
		}
		--Tower Defense
		self.skills.tower_defense = {
			["name_id"] = "menu_tower_defense_dmc",
			["desc_id"] = "menu_tower_defense_desc_dmc",
			["icon_xy"] = {9, 5},
			[1] = {
				upgrades = {
					"sentry_gun_quantity_1"
				},
				cost = self.costs.hightier
			},
			[2] = {
				upgrades = {
					"sentry_gun_quantity_2"
				},
				cost = self.costs.hightierpro
			}
		}
		--Uppers
		self.skills.tea_cookies = {
			["name_id"] = "menu_tea_cookies_dmc",
			["desc_id"] = "menu_tea_cookies_desc_dmc",
			["icon_xy"] = {2, 11},
			[1] = {
				upgrades = {
					"first_aid_kit_quantity_increase_1"
				},
				cost = self.costs.hightier
			},
			[2] = {
				upgrades = {
					"first_aid_kit_quantity_increase_2"
				},
				cost = self.costs.hightierpro
			}
		}
		--Subsonic Rounds
		self.skills.hitman = {
			["name_id"] = "menu_hitman_dmc",
			["desc_id"] = "menu_hitman_desc_dmc",
			["icon_xy"] = {5, 9},
			[1] = {
				upgrades = {
					"weapon_supp_range_buff_1"
				},
				cost = self.costs.hightier
			},
			[2] = {
				upgrades = {
					"weapon_supp_range_buff_2"
				},
				cost = self.costs.hightierpro
			}
		}
		--Swan Song
		self.skills.perseverance = {
			["name_id"] = "menu_perseverance_dmc",
			["desc_id"] = "menu_perseverance_desc_dmc",
			["icon_xy"] = {5, 12},
			[1] = {
				upgrades = {
					"temporary_berserker_damage_multiplier_1"
				},
				cost = self.costs.hightier
			},
			[2] = {
				upgrades = {
					"temporary_berserker_damage_multiplier_2"
				},
				cost = self.costs.hightierpro
			}
		}
		--Frenzy
		self.skills.frenzy = {
			["name_id"] = "menu_frenzy",
			["desc_id"] = "menu_frenzy_desc",
			["icon_xy"] = {11, 8},
			[1] = {
				upgrades = {
					"player_healing_reduction_1",
					"player_real_health_damage_reduction_1",
					"player_max_health_reduction_1"
				},
				cost = self.costs.hightier
			},
			[2] = {
				upgrades = {
					"player_healing_reduction_2",
					"player_real_health_damage_reduction_2"
				},
				cost = self.costs.hightierpro
			}
		}
	
		self.default_upgrades = {
			"player_fall_damage_multiplier",
			"player_fall_health_damage_multiplier",
			"player_silent_kill",
			"player_primary_weapon_when_downed",
			"player_intimidate_enemies",
			"player_stamina_multiplier",
			"team_stamina_multiplier",
			"player_special_enemy_highlight",
			"player_hostage_trade",
			"player_sec_camera_highlight",
			"player_corpse_dispose",
			"player_corpse_dispose_amount_1",
			"player_civ_harmless_melee",
			"player_walk_speed_multiplier",
			"player_steelsight_when_downed",
			"player_crouch_speed_multiplier",
			"carry_interact_speed_multiplier_1",
			"carry_interact_speed_multiplier_2",
			"carry_movement_speed_multiplier",
			"trip_mine_sensor_toggle",
			"trip_mine_sensor_highlight",
			"trip_mine_can_switch_on_off",
			"ecm_jammer_can_activate_feedback",
			"ecm_jammer_interaction_speed_multiplier",
			"ecm_jammer_can_retrigger",
			"ecm_jammer_affects_cameras",
			"temporary_first_aid_damage_reduction",
			"temporary_passive_revive_damage_reduction_2",
			--"akimbo_recoil_index_addend_1",
			"akimbo_recoil_multiplier_1",
			"doctor_bag",
			"ammo_bag",
			"trip_mine",
			"ecm_jammer",
			"first_aid_kit",
			"sentry_gun",
			"bodybags_bag",
			"saw",
			"cable_tie",
			"jowi",
			"x_1911",
			"x_b92fs",
			"x_deagle",
			"x_g22c",
			"x_g17",
			"x_usp",
			"x_sr2",
			"x_mp5",
			"x_akmsu"
		}

	end
	
	if not SC then
		--DECKS
		local deck2 = {
			upgrades = {
				"weapon_passive_headshot_damage_multiplier"
			},
			cost = 300,
			icon_xy = {1, 0},
			name_id = "menu_deckall_2",
			desc_id = "menu_deckall_2_desc"
		}
		local deck4 = {
			upgrades = {
				"passive_player_xp_multiplier",
				"player_passive_suspicion_bonus",
				"player_passive_armor_movement_penalty_multiplier"
			},
			cost = 600,
			icon_xy = {3, 0},
			name_id = "menu_deckall_4",
			desc_id = "menu_deckall_4_desc"
		}
		local deck6 = {
			upgrades = {
				"armor_kit",
				"player_pick_up_ammo_multiplier"
			},
			cost = 1600,
			icon_xy = {5, 0},
			name_id = "menu_deckall_6",
			desc_id = "menu_deckall_6_desc"
		}
		local deck8 = {
			upgrades = {
				"weapon_passive_damage_multiplier",
				"passive_doctor_bag_interaction_speed_multiplier"
			},
			cost = 3200,
			icon_xy = {7, 0},
			name_id = "menu_deckall_8",
			desc_id = "menu_deckall_8_desc"
		}
		
		self.specializations[5] = {
			name_id = "menu_st_spec_5",
			desc_id = "menu_st_spec_5_desc",
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_1"
				},
				cost = 200,
				icon_xy = {6, 2},
				name_id = "menu_deck5_1",
				desc_id = "menu_deck5_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_2",
					"akimbo_recoil_multiplier_2"
				},
				cost = 400,
				icon_xy = {7, 2},
				name_id = "menu_deck5_3",
				desc_id = "menu_deck5_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_3"
				},
				cost = 1000,
				icon_xy = {0, 3},
				name_id = "menu_deck5_5",
				desc_id = "menu_deck5_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_4"
				},
				cost = 2400,
				icon_xy = {1, 3},
				name_id = "menu_deck5_7",
				desc_id = "menu_deck5_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_5",
					"player_passive_loot_drop_multiplier",
					"akimbo_recoil_multiplier_3",
					"akimbo_extra_ammo_multiplier_1"
				},
				cost = 4000,
				icon_xy = {3, 3},
				name_id = "menu_deck5_9",
				desc_id = "menu_deck5_9_desc"
			}
		}
		
		self.specializations[10] = {
			name_id = "menu_st_spec_10",
			desc_id = "menu_st_spec_10_desc",
			{
				upgrades = {
					"temporary_loose_ammo_restore_health_1"
				},
				cost = 200,
				icon_xy = {4, 5},
				name_id = "menu_deck10_1",
				desc_id = "menu_deck10_1_desc"
			},
			deck2,
			{
				upgrades = {
					"temporary_loose_ammo_give_team"
				},
				cost = 400,
				icon_xy = {5, 5},
				name_id = "menu_deck10_3",
				desc_id = "menu_deck10_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_loose_ammo_restore_health_give_team"
				},
				cost = 1000,
				icon_xy = {6, 5},
				name_id = "menu_deck10_5",
				desc_id = "menu_deck10_5_desc"
			},
			deck6,
			{
				upgrades = {
					"temporary_loose_ammo_restore_health_2"
				},
				cost = 2400,
				icon_xy = {7, 5},
				name_id = "menu_deck10_7",
				desc_id = "menu_deck10_7_desc"
			},
			deck8,
			{
				upgrades = {
					"temporary_loose_ammo_restore_health_3",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 6},
				name_id = "menu_deck10_9",
				desc_id = "menu_deck10_9_desc"
			}
		}
	end
	
end