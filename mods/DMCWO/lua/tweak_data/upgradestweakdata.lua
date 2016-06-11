--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_init_pd2_values = UpgradesTweakData._init_pd2_values
function UpgradesTweakData:_init_pd2_values()
	old_init_pd2_values(self, tweak_data)
	
	self.explosive_bullet.curve_pow = 0.8
	self.explosive_bullet.player_dmg_mul = 0.5
	self.explosive_bullet.range = 175
	self.explosive_bullet.feedback_range = 300
	self.explosive_bullet.camera_shake_max_mul = 5
	
	self.weapon_movement_penalty = {}
	
	self.values.rep_upgrades.values = {0}
	
	--ARMOR STABILITY
	self.values.player.body_armor.damage_shake[1] = 2.000
	self.values.player.body_armor.damage_shake[2] = 1.714
	self.values.player.body_armor.damage_shake[3] = 1.429
	self.values.player.body_armor.damage_shake[4] = 1.143
	self.values.player.body_armor.damage_shake[5] = 0.857
	self.values.player.body_armor.damage_shake[6] = 0.571
	self.values.player.body_armor.damage_shake[7] = 0.286
	
	if not SC then
		log("SC's Mod is active, disabling DMCWO's perk changes")
		self.values.player.passive_health_regen = {0.015}
		self.specialization_descs[2][9].multiperk2 = "1.5%"
	end
		
	--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{
				--Quick Fix
				self.values.temporary.first_aid_damage_reduction = { {0.85, 20} }
			
				--Uppers
				self.values.first_aid_kit.quantity = {4, 10}
				
				--Inspire
				self.values.player.long_dis_revive = {0.5, 0.5}
			--}
			
			--[[   CONTROLLER SUBTREE   ]]--
			--{
			
				--Hostage Taker
				self.values.player.hostage_health_regen_addend = {0.025, 0.05}
			--}
			
			--[[   ASSAULT SUBTREE   ]]--
			--{
				--MG Handling (Rifleman)
				self.values.smg.reload_speed_multiplier = {1.35}
				self.values.smg.hip_fire_spread_multiplier = {0.5}
				--MG Specialist (Marksman)
				self.values.smg.fire_rate_multiplier = {1.20}
				self.values.smg.damage_multiplier = {1.15}
				
				--Shock and Awe
				self.values.weapon.clip_ammo_increase = {1.3, 1.5}
				--Heavy Impact
				self.values.weapon.knock_down = {0.1, 0.25}
	
				--Body Expertise
				self.values.weapon.automatic_head_shot_add = {0.25, 0.25}

			--}
		--}
		
		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{
				--Underdog
				self.values.temporary.dmg_multiplier_outnumbered = { {1.1, 7} }
				self.values.temporary.dmg_dampener_outnumbered = { {0.9, 7} }
				
				--Shotgun CQB
				self.values.shotgun.reload_speed_multiplier = {1.25, 1.25}
				self.values.shotgun.enter_steelsight_speed_multiplier = {2.25}
				--Shotgun Impact
				self.values.shotgun.recoil_index_addend = {4}
				self.values.shotgun.damage_multiplier = {1, 1.25}
				
				--Far Away
				self.values.shotgun.steelsight_accuracy_inc = {0.6}
				self.values.shotgun.steelsight_range_inc = {1.5}
				--Close By
				self.values.shotgun.hip_run_and_shoot = {true}
				self.values.shotgun.hip_rate_of_fire = {1.35}
				
				--Overkill
				self.values.shotgun.swap_speed_multiplier = {1.8}
				self.values.saw.swap_speed_multiplier = {1.8}
				self.values.temporary.overkill_damage_multiplier = {
					{1.75, 5},
					{1.75, 10}
				}
			--}
			
			--[[   ARMORER SUBTREE   ]]--
			--{
				--Stun Resistance
				self.values.player.damage_shake_multiplier = {0.75}
				self.values.player.damage_shake_addend = {1.5}
				self.values.player.flashbang_multiplier = {0.75, 0.25}
				
				--Die Hard
				self.values.player.armor_regen_timer_multiplier = {0.85}
				self.values.player.primary_weapon_when_downed = {true}
				--Transporter
				self.values.carry.movement_penalty_nullifier = {true}
				
				--More Blood To Bleed
				self.values.player.health_multiplier = {1.25, 1.5}
				--Bullseye
				self.values.player.headshot_regen_armor_bonus = {1, 3.5}
			--}
			
			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{
				--Scavenging
				self.values.player.double_drop = {10}
				self.values.player.increased_pickup_area = {1.5}
				
				--Bulletstorm
				self.values.player.no_ammo_cost = {true, true}
				--Portable Saw
				self.values.saw.extra_ammo_multiplier = {1.5}
				self.values.saw.damage_multiplier = {1.3}
				
				--Extra Lead
				self.values.ammo_bag.ammo_increase = {2}
				self.values.ammo_bag.quantity = {1}
				--Carbon Blade
				self.values.saw.enemy_slicer = {true}
				self.values.saw.ignore_shields = {true}
				self.values.saw.panic_when_kill = {
					{
						area = 1000,
						chance = 0.5,
						amount = 200
					}
				}
				
				--Fully Loaded
				self.values.player.extra_ammo_multiplier = {1.25}
				self.values.player.pick_up_ammo_multiplier = {1.35, 1.75}
			--}
		--}
		
		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{
				--Defense up
				self.values.sentry_gun.cost_reduction = {1.5, 2}
				self.values.sentry_gun.shield = {true}	
				
				--Sentry Targeting Package
				self.values.sentry_gun.spread_multiplier = {0.5}
				self.values.sentry_gun.rot_speed_multiplier = {2.5}
				self.values.sentry_gun.extra_ammo_multiplier = {1.5, 2.5}
				--Eco Sentry
				self.values.sentry_gun.armor_multiplier = {2.5}
			
				--Engineering
				self.values.sentry_gun.less_noisy = {true}
				self.values.sentry_gun.ap_bullets = {true}
				self.values.sentry_gun.fire_rate_reduction = {4}
				self.values.sentry_gun.damage_multiplier = {2.5}
				--Jack of All Trades
				self.values.player.deploy_interact_faster = {0.5}
				self.values.player.second_deployable = {true}
	
				--Tower Defence
				self.values.sentry_gun.quantity = {1, 2}
				self.skill_descs.tower_defense = { 
					[1] = 1, 
					[2] = 1, 
					multibasic = "2",
					multipro = "3"
				}
			--}
			
			--[[   BREACHER SUBTREE   ]]--
			--{
				--Hardware Expert
				self.values.player.drill_fix_interaction_speed_multiplier = {0.75}
				self.values.player.drill_alert_rad = {900}
				self.values.player.silent_drill = {true}
				
				--Danger Close
				self.values.trip_mine.explosion_size_multiplier_1 = {1.3}
				self.values.trip_mine.damage_multiplier = {1.5}
				--Drill Sawgent
				self.values.player.drill_speed_multiplier = {0.85, 0.7}
				
				--Demoman
				--Located in tweakdata.lua since their quantity is hardcoded in the exe
				--Kickstarter
				self.values.player.drill_autorepair = {0.1, 0.3}
				self.values.player.drill_melee_hit_restart_chance = {true}
				
				--Fire Trap
				self.values.trip_mine.fire_trap = {
					{0, 1},
					{10, 1.5}
				}
			--}
			
			--[[   BATTLE SAPPER SUBTREE   ]]--
			--{
				--Nerves of Steel
				self.values.player.interacting_damage_multiplier = {0.5}
				self.values.player.steelsight_when_downed = {true}
	
				--Sharpshooter
				self.values.weapon.single_spread_index_addend = {5}
				self.values.assault_rifle.recoil_index_addend = {4}
				self.values.snp.recoil_index_addend = {4}
				--Spotter
				self.values.player.marked_enemy_extra_damage = {true}
				self.values.player.marked_enemy_damage_mul = 1.15
				self.values.player.marked_inc_dmg_distance = {{2500, 1.5}}
				
				--Kilmer
				self.values.assault_rifle.reload_speed_multiplier = {1.25}
				self.values.assault_rifle.enter_steelsight_speed_multiplier = {1.25}
				self.values.snp.enter_steelsight_speed_multiplier = {1.25}
				self.values.snp.reload_speed_multiplier = {1.25}
				self.values.assault_rifle.move_spread_multiplier = {0.5}
				self.values.snp.move_spread_multiplier = {0.5}
				--Ammo Efficiency
				self.values.player.head_shot_ammo_return = {
					{ ammo = 1, time = 6, headshots = 3 },
					{ ammo = 1, time = 6, headshots = 2 }
				}
					
				--Bulletproof
				self.values.player.armor_multiplier = {1.5}
				self.values.team.armor.regen_time_multiplier = {0.75}
			--}
		--}
		
		--[[   GHOST   ]]--
		--{
			--[[   COVERT OPS SUBTREE   ]]--
			--{
				--Chameleon
				self.values.player.suspicion_multiplier = {0.75}
				self.values.player.sec_camera_highlight_mask_off = {true}
				self.values.player.special_enemy_highlight_mask_off = {true}
				self.values.player.mask_off_pickup = {true}
				self.values.player.small_loot_multiplier = {1.1, 1.3}
				
				--Cleaner
				self.values.player.corpse_dispose_amount = {1, 2}
				self.values.player.extra_corpse_dispose_amount = {1}
				self.values.bodybags_bag.quantity = {1}
				--Sixth Sense
				self.values.player.standstill_omniscience = {true}
				self.values.player.additional_assets = {true}
				self.values.player.buy_bodybags_asset = {true}
				self.values.player.buy_spotter_asset = {true}
				self.values.player.cleaner_cost_multiplier = {0.25}
				
				--Undertaker
				self.values.player.tape_loop_duration = {10, 25}	
				self.values.player.pick_lock_easy_speed_multiplier = {0.75, 0.5}
				self.values.player.pick_lock_hard = {true}
				--ECM Overdrive
				self.values.ecm_jammer.feedback_duration_boost = {1.25}
				self.values.ecm_jammer.duration_multiplier = {1.25}
				self.values.ecm_jammer.can_open_sec_doors = {true}
				
				--ECM Specialist
				self.values.ecm_jammer.quantity = {1, 3}
				self.values.ecm_jammer.duration_multiplier_2 = {1.25}
				self.values.ecm_jammer.feedback_duration_boost_2 = {1.25}
				self.values.ecm_jammer.affects_pagers = {true}
			--}
			
			--[[   COMMANDO SUBTREE   ]]--
			--{
				--Duck and Cover
				self.values.player.run_dodge_chance = {0.25}
				self.values.player.run_speed_multiplier = {1.25}
				self.values.player.crouch_dodge_chance = {0.05, 0.15}
				
				--Moving Target
				self.values.player.detection_risk_add_movement_speed = {
					{
						0.02,
						3,
						"below",
						35,
						0.2
					},
					{
						0.02,
						1,
						"below",
						35,
						0.2
					}
				}
			--}
			
			--[[   SILENT KILLER SUBTREE   ]]--
			--{
				--The Professional
				self.values.weapon.silencer_spread_index_addend = {5}
				self.values.weapon.silencer_recoil_index_addend = {8}
				self.values.weapon.silencer_enter_steelsight_speed_multiplier = {1.5}
				
				--Optical Illusions
				self.values.player.silencer_concealment_increase = {1}
				self.values.player.silencer_concealment_penalty_decrease = {2}
				--Subsonic Rounds
				self.values.weapon.supp_range_buff = {1.25, 1.50}
			--}
		--}
		
		--[[   FUGITIVE   ]]--
		--{
			--[[   GUNSLINGER SUBTREE   ]]--
			--{
				--Equilibrium
				self.values.pistol.swap_speed_multiplier = {1.8}
				self.values.team.pistol.recoil_index_addend = {4}
				self.values.team.pistol.suppression_recoil_index_addend = self.values.team.pistol.recoil_index_addend
				
				--Gun Nut
				self.values.pistol.spread_index_addend = {5}
				self.values.pistol.fire_rate_multiplier = {2}
				--Over Pressurized/Custom Ammo (Formerly Akimbo)
				self.values.pistol.reload_speed_multiplier = {1.5}
				self.values.pistol.damage_multiplier = {1.15}
				
				--Akimbo (Formerly Over Pressurized/Custom Ammo)
				self.values.akimbo.extra_ammo_multiplier = {1.25, 1.5}
				self.values.akimbo.recoil_multiplier = {
					1.5,
					1.25,
					1
				}
				--Desperado
				self.values.pistol.stacked_accuracy_bonus = {
					{accuracy_bonus = 1.1, max_stacks = 4, max_time = 10},
					{accuracy_bonus = 1.1, max_stacks = 4, max_time = 20}
				}
				
				--Trigger Happy
				self.values.pistol.stacking_hit_expire_t = {6, 20}
				self.values.pistol.stacking_hit_damage_multiplier = {0.2}
			--}
			
			--[[   RELENTLESS SUBTREE   ]]--
			--{
				--Running From Death (Formerly Nine Lives)
				self.values.temporary.swap_weapon_faster = {{1.25, 10}}
				self.values.temporary.reload_weapon_faster = {{1.25, 10}}
				self.values.temporary.increased_movement_speed = {{1.25, 10}}
				
				--Nine Lives (Formerly Running From Death)
				self.values.player.bleed_out_health_multiplier = {2}
				self.values.player.additional_lives = {1, 3}
				--Up You Go
				self.values.temporary.revived_damage_resist = {{0.7, 10}}
				self.values.player.revived_health_regain = {1.4}
				
				--Swan Song
				self.values.temporary.berserker_damage_multiplier = { {1, 5}, {1, 10} }
				--Undying
				self.values.player.cheat_death_chance = {0.25, 0.5}
				
				--Messiah
				self.values.player.messiah_revive_from_bleed_out = {1, 3}
				self.values.player.pistol_revive_from_bleed_out = {1, 3}
			--}
			
			--[[   BRAWLER SUBTREE   ]]--
			--{
				--Martial Arts
				self.values.player.melee_damage_dampener = {0.50}
				self.values.player.melee_knockdown_mul = {1.50}
				
				--Bloodthirst
				self.values.player.melee_damage_stacking = {{melee_multiplier = 0.25, max_multiplier = 1.50}}
				self.values.temporary.melee_kill_increase_reload_speed = {{1.25, 10}}
				--Pumping Iron	
				self.values.player.non_special_melee_multiplier = {1.25, 1.50}
				self.values.player.melee_damage_multiplier = {1.25, 1.50}
				
				--Counter Strike
				self.values.player.counter_strike_melee = {true}
				self.values.player.counter_strike_spooc = {true}
				--Frenzy (Berserker)
				self.values.player.max_health_reduction = {0.15}
				self.values.player.health_damage_reduction = {0.70, 0.50}
				self.values.player.healing_reduction = {0.25, 0.50}
				
				--Berserker (Frenzy)
				self.player_damage_health_ratio_threshold = 0.25
				self.values.player.damage_health_ratio_multiplier = {1}
				self.values.player.melee_damage_health_ratio_multiplier = {2.50}
			--}
		--}
end

local old_player_definitions = UpgradesTweakData._player_definitions
function UpgradesTweakData:_player_definitions()
	old_player_definitions (self)
	
	self.definitions.player_long_dis_revive = {
		category = "feature",
		name_id = "menu_player_long_dis_revive",
		upgrade = {
			category = "player",
			upgrade = "long_dis_revive",
			value = 1
		}
	}
	self.definitions.player_long_dis_revive_2 = {
		category = "feature",
		name_id = "menu_player_long_dis_revive",
		upgrade = {
			category = "player",
			upgrade = "long_dis_revive",
			value = 2
		}
	}
	
	self.definitions.player_health_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "health_multiplier",
			value = 2
		}
	}
	self.definitions.player_non_special_melee_multiplier_ace = {
		category = "feature",
		name_id = "menu_player_non_special_melee_multiplier",
		upgrade = {
			category = "player",
			upgrade = "non_special_melee_multiplier",
			value = 2
		}
	}
	self.definitions.player_melee_damage_multiplier_ace = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_multiplier",
			value = 2
		}
	}
	
	self.definitions.player_detection_risk_add_movement_speed_1 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_movement_speed",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_movement_speed",
			value = 1
		}
	}     
	self.definitions.player_detection_risk_add_movement_speed_2 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_movement_speed",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_movement_speed",
			value = 2
		}
	}
	
	self.definitions.player_pistol_revive_from_bleed_out_1 = {
		category = "feature",
		name_id = "menu_player_pistol_revive_from_bleed_out",
		upgrade = {
			category = "player",
			upgrade = "pistol_revive_from_bleed_out",
			value = 1
		}
	}
	self.definitions.player_pistol_revive_from_bleed_out_2 = {
		category = "feature",
		name_id = "menu_player_pistol_revive_from_bleed_out",
		upgrade = {
			category = "player",
			upgrade = "pistol_revive_from_bleed_out",
			value = 2
		}
	}
	self.definitions.player_messiah_revive_from_bleed_out_1 = {
		category = "feature",
		name_id = "menu_player_pistol_revive_from_bleed_out",
		upgrade = {
			category = "player",
			upgrade = "messiah_revive_from_bleed_out",
			value = 1
		}
	}
	self.definitions.player_messiah_revive_from_bleed_out_2 = {
		category = "feature",
		name_id = "menu_player_pistol_revive_from_bleed_out",
		upgrade = {
			category = "player",
			upgrade = "messiah_revive_from_bleed_out",
			value = 2
		}
	}
end

local old_weapon_definitions = UpgradesTweakData._weapon_definitions
function UpgradesTweakData:_weapon_definitions()
	old_weapon_definitions (self)
	

	self.definitions.weapon_supp_range_buff_1 = {
		category = "feature",
		name_id = "menu_weapon_supp_range_buff_1",
		upgrade = {
			category = "weapon",
			upgrade = "supp_range_buff",
			value = 2
		}
	}
	self.definitions.weapon_supp_range_buff_2 = {
		category = "feature",
		name_id = "menu_weapon_supp_range_buff_2",
		upgrade = {
			category = "weapon",
			upgrade = "supp_range_buff",
			value = 2
		}
	}	
end