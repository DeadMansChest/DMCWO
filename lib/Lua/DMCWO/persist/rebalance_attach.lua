--[[
v1.42.3
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if not RebalanceAtchScript and DMCWO.rebalance_wep == true then 

if not tweak_data then return end
if DMCWO.Setup_Stfu ~= true then
	if not stfu_att then
		stfu_att = true
		io.stdout:write("[DMCWO] rebalance_attach.lua...")
	end
end

local tweak_factory = tweak_data.weapon.factory

------------------[[TOGGLEABLE STUFF (Don't touch the stuff below, use the toggles in DMCWO.lua if you want to change things)]]------------------
--{
if DMCWO.hide_pis_flash == true then
	tweak_factory.parts.wpn_fps_upg_pis_ns_flash.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_factory.parts.wpn_fps_upg_pis_ns_flash.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
	tweak_factory.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
end

if DMCWO.buis_swap == true then
	tweak_factory.parts.wpn_fps_upg_o_mbus_front.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_front"
	tweak_factory.parts.wpn_fps_upg_o_mbus_rear.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_rear"
	tweak_factory.parts.wpn_fps_upg_o_mbus_rear.name_id = "dd_rear"
	tweak_factory.parts.wpn_fps_upg_o_mbus_rear.desc_id = "dd_rear_desc"
else
	tweak_factory.parts.wpn_fps_upg_o_mbus_front.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_mbus/wpn_fps_upg_o_mbus_front"
	tweak_factory.parts.wpn_fps_upg_o_mbus_rear.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_mbus/wpn_fps_upg_o_mbus_rear"
	tweak_factory.parts.wpn_fps_upg_o_mbus_rear.name_id = "bm_wp_upg_o_mbus_rear"
	tweak_factory.parts.wpn_fps_upg_o_mbus_rear.desc_id = "bm_wp_upg_o_mbus_rear_desc"
end

if DMCWO.elcan_buis == true then
	tweak_factory.parts.wpn_fps_upg_o_specter.adds = { "wpn_fps_extra_zoom" }
	tweak_factory.parts.wpn_fps_upg_o_specter.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight","wpn_fps_upg_o_45iron", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back" }
else
	tweak_factory.parts.wpn_fps_upg_o_specter.adds = { }
	tweak_factory.parts.wpn_fps_upg_o_specter.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back" }
end

if DMCWO.judge_grip == true then
	tweak_factory.parts.wpn_fps_pis_judge_g_standard.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_g_standard"
	tweak_factory.parts.wpn_fps_pis_judge_g_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_g_standard"
else 
	tweak_factory.parts.wpn_fps_pis_judge_g_standard.unit = "units/pd2_million/weapons/wpn_fps_pis_judge_pts/wpn_fps_pis_judge_g_standard"
	tweak_factory.parts.wpn_fps_pis_judge_g_standard.third_unit = "units/pd2_million/weapons/wpn_third_pis_judge_pts/wpn_third_pis_judge_g_standard"
end

if DMCWO.hide_mac_wire == true then
	tweak_factory.parts.wpn_fps_smg_mac10_s_fold.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_factory.parts.wpn_fps_smg_mac10_s_fold.unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_s_fold"
	tweak_factory.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_s_fold"
end

if DMCWO.barret_bipod == true then
	tweak_factory.parts.wpn_fps_snp_m95_bipod.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_snp_m95_bipod.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_factory.parts.wpn_fps_snp_m95_bipod.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_bipod"
	tweak_factory.parts.wpn_fps_snp_m95_bipod.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_bipod"
end

if DMCWO.hide_sg_brakes == true then
	tweak_factory.parts.wpn_fps_upg_ns_shot_shark.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_shot_ns_king.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_factory.parts.wpn_fps_upg_ns_shot_shark.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_shark/wpn_fps_upg_ns_shot_shark"
	tweak_factory.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_shark/wpn_third_upg_ns_shot_shark"
	tweak_factory.parts.wpn_fps_upg_shot_ns_king.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_shot_ns_king"
	tweak_factory.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_shot_ns_king"
end

if DMCWO.hide_brakes == true then
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_tank.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_tank.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ass_ns_battle.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ass_ns_battle.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_upg_ak_b_ak105.override = {
		wpn_fps_upg_ns_ass_smg_large = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ns_ass_smg_medium = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ns_ass_smg_small = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ns_ass_pbs1 = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		}
	}
	local hide_ext = { 
		unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_ns_standard", 
		third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_ns_standard" 
	}
	tweak_factory.parts.wpn_fps_ass_l85a2_b_medium.override = {
		wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
		wpn_fps_upg_ns_ass_smg_tank = hide_ext,
		wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
		wpn_fps_upg_ass_ns_jprifles = hide_ext,
		wpn_fps_upg_ass_ns_linear = hide_ext,
		wpn_fps_upg_ass_ns_surefire = hide_ext,
		wpn_fps_upg_ass_ns_battle = hide_ext
	}
	tweak_factory.parts.wpn_fps_ass_l85a2_b_long.override = deep_clone(tweak_factory.parts.wpn_fps_ass_l85a2_b_medium.override)
	tweak_factory.parts.wpn_fps_ass_l85a2_b_short.override = deep_clone(tweak_factory.parts.wpn_fps_ass_l85a2_b_medium.override)
	
	local hide_ext = {
		unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
		third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
	}
	tweak_factory.parts.wpn_fps_lmg_mg42_b_vg38.override = {
		wpn_fps_lmg_mg42_n42 = hide_ext,
		wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
		wpn_fps_upg_ns_ass_smg_tank = hide_ext,
		wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
		wpn_fps_upg_ass_ns_jprifles = hide_ext,
		wpn_fps_upg_ass_ns_linear = hide_ext,
		wpn_fps_upg_ass_ns_surefire = hide_ext,
		wpn_fps_upg_ass_ns_battle = hide_ext
	}

	local hide_ext = {
		unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
		third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
	}	
	tweak_factory.parts.wpn_fps_lmg_mg42_b_mg34.override = {
		wpn_fps_lmg_mg42_n42 = hide_ext,
		wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
		wpn_fps_upg_ns_ass_smg_tank = hide_ext,
		wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
		wpn_fps_upg_ass_ns_jprifles = hide_ext,
		wpn_fps_upg_ass_ns_linear = hide_ext,
		wpn_fps_upg_ass_ns_surefire = hide_ext,
		wpn_fps_upg_ass_ns_battle = hide_ext
	}	
	
	local hide_ext = { 
		unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n42",
		third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_42",
	}
	tweak_factory.parts.wpn_fps_lmg_mg42_b_mg42.override = {		
		wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
		wpn_fps_upg_ns_ass_smg_tank = hide_ext,
		wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
		wpn_fps_upg_ass_ns_jprifles = hide_ext,
		wpn_fps_upg_ass_ns_linear = hide_ext,
		wpn_fps_upg_ass_ns_surefire = hide_ext,
		wpn_fps_upg_ass_ns_battle = hide_ext
	}
	
	local hide_ext = { 
		unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
		third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
	}
	tweak_factory.parts.wpn_fps_smg_thompson_barrel.override = {
		wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
		wpn_fps_upg_ns_ass_smg_tank = hide_ext,
		wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
		wpn_fps_upg_ass_ns_jprifles = hide_ext,
		wpn_fps_upg_ass_ns_linear = hide_ext,
		wpn_fps_upg_ass_ns_surefire = hide_ext,
		wpn_fps_upg_ass_ns_battle = hide_ext,
	}	
	tweak_factory.parts.wpn_fps_smg_thompson_barrel_long.override = {
		wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
		wpn_fps_upg_ns_ass_smg_tank = hide_ext,
		wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
		wpn_fps_upg_ass_ns_jprifles = hide_ext,
		wpn_fps_upg_ass_ns_linear = hide_ext,
		wpn_fps_upg_ass_ns_surefire = hide_ext,
		wpn_fps_upg_ass_ns_battle = hide_ext
	}
	
	local hide_ext = {
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_short",
		third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_short"
	}
	tweak_factory.parts.wpn_fps_ass_scar_b_short.override = {
		wpn_fps_ass_scar_ns_standard = hide_ext,
		wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
		wpn_fps_upg_ns_ass_smg_tank = hide_ext,
		wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
		wpn_fps_upg_ass_ns_jprifles = hide_ext,
		wpn_fps_upg_ass_ns_linear = hide_ext,
		wpn_fps_upg_ass_ns_surefire = hide_ext,
	}
	
	local hide_ext = {
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard",
		third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard"
	}
	tweak_factory.parts.wpn_fps_ass_scar_b_medium.override = {
		wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
		wpn_fps_upg_ns_ass_smg_tank = hide_ext,
		wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
		wpn_fps_upg_ass_ns_jprifles = hide_ext,
		wpn_fps_upg_ass_ns_linear = hide_ext,
		wpn_fps_upg_ass_ns_surefire = hide_ext,
	}
	tweak_factory.parts.wpn_fps_ass_scar_b_long.override = deep_clone(tweak_factory.parts.wpn_fps_ass_scar_b_medium.override)
	
	local hide_ext = {
		unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_ns_vhs",
		third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_ns_vhs"
	}
	tweak_factory.parts.wpn_fps_ass_vhs_b_standard.override = {	
		wpn_fps_ass_vhs_ns_vhs_no = hide_ext,
		wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
		wpn_fps_upg_ns_ass_smg_tank = hide_ext,
		wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
		wpn_fps_upg_ass_ns_jprifles = hide_ext,
		wpn_fps_upg_ass_ns_linear = hide_ext,
		wpn_fps_upg_ass_ns_surefire = hide_ext,
		}		
	tweak_factory.parts.wpn_fps_ass_vhs_b_short.override = deep_clone(tweak_factory.parts.wpn_fps_ass_vhs_b_standard.override)
else
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_tank.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_tank.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
	tweak_factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles"
	tweak_factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	tweak_factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear"
	tweak_factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	tweak_factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire"
	tweak_factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	tweak_factory.parts.wpn_fps_upg_ak_b_ak105.override = {
		wpn_fps_upg_ns_ass_smg_large = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ns_ass_smg_medium = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ns_ass_smg_small = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ns_ass_smg_firepig = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ns_ass_smg_stubby = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ns_ass_smg_tank = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ass_ns_jprifles = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ass_ns_linear = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ass_ns_surefire = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		},
		wpn_fps_upg_ns_ass_pbs1 = {
			forbids = {
				"wpn_fps_upg_ak_ns_ak105"
			}
		}
	}
	tweak_factory.parts.wpn_fps_ass_scar_b_short.override = {
		wpn_fps_ass_scar_ns_standard = {
			unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_short",
			third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_short"
		},
	}
	tweak_factory.parts.wpn_fps_ass_scar_b_medium.override = {}
	tweak_factory.parts.wpn_fps_ass_scar_b_long.override = {}
	tweak_factory.parts.wpn_fps_ass_l85a2_b_medium.override = {}
	tweak_factory.parts.wpn_fps_ass_l85a2_b_long.override = {}
	tweak_factory.parts.wpn_fps_ass_l85a2_b_short.override = {}
	tweak_factory.parts.wpn_fps_lmg_mg42_b_mg42.override = {}
	tweak_factory.parts.wpn_fps_lmg_mg42_b_vg38.override = {
			wpn_fps_lmg_mg42_n42 = {
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
			}
		}	
	tweak_factory.parts.wpn_fps_lmg_mg42_b_mg34.override = {
		wpn_fps_lmg_mg42_n42 = {
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
			}
		}
	tweak_factory.parts.wpn_fps_smg_thompson_barrel.override = {}
	tweak_factory.parts.wpn_fps_smg_thompson_barrel_long.override = {}
	tweak_factory.wpn_fps_ass_scar.override.wpn_fps_upg_m4_g_hgrip_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard",
		third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard",
	}
	tweak_factory.parts.wpn_fps_ass_vhs_b_standard.override = {	
		wpn_fps_ass_vhs_ns_vhs_no = {
			unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_ns_vhs",
			third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_ns_vhs"
		},
	}
	tweak_factory.parts.wpn_fps_ass_vhs_b_short.override = {}
end

if DMCWO.scar_afg_hide == true then
	tweak_factory.wpn_fps_ass_scar.override.wpn_fps_upg_vg_ass_smg_afg = { 
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
		third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
	}
else
	tweak_factory.wpn_fps_ass_scar.override.wpn_fps_upg_vg_ass_smg_afg = {}
end

if DMCWO.mp7_vfg == true then
	tweak_factory.wpn_fps_smg_mp7.override.wpn_fps_upg_vg_ass_smg_stubby = { 
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip",
		third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	}
else
	tweak_factory.wpn_fps_smg_mp7.override.wpn_fps_upg_vg_ass_smg_stubby = {}
end

if DMCWO.sg552_handguard == true then
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard_green.name_id = "bm_wp_ass_s552_fg_black"
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard"
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard"
else
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard"
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard"
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard_green.name_id = "bm_wp_ass_s552_fg_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_fg_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard_green"
end

if DMCWO.sg552_stock == true then
	tweak_factory.parts.wpn_fps_ass_s552_s_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_s_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_s_standard_green.name_id = "bm_wp_ass_s552_s_black"
	tweak_factory.parts.wpn_fps_ass_s552_s_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard"
	tweak_factory.parts.wpn_fps_ass_s552_s_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard"
else
	tweak_factory.parts.wpn_fps_ass_s552_s_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard"
	tweak_factory.parts.wpn_fps_ass_s552_s_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard"
	tweak_factory.parts.wpn_fps_ass_s552_s_standard_green.name_id = "bm_wp_ass_s552_s_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_s_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_s_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard_green"
end

if DMCWO.sg552_grip == true then
	tweak_factory.parts.wpn_fps_ass_s552_g_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_g_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_g_standard_green.name_id = "bm_wp_ass_s552_g_black"
	tweak_factory.parts.wpn_fps_ass_s552_g_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard"
	tweak_factory.parts.wpn_fps_ass_s552_g_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard"
else
	tweak_factory.parts.wpn_fps_ass_s552_g_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard"
	tweak_factory.parts.wpn_fps_ass_s552_g_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard"
	tweak_factory.parts.wpn_fps_ass_s552_g_standard_green.name_id = "bm_wp_ass_s552_g_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_g_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard_green"
	tweak_factory.parts.wpn_fps_ass_s552_g_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard_green"
end

if DMCWO.remington_cap == 1 then
	tweak_factory.wpn_fps_shot_r870.override.wpn_fps_shot_r870_m_extended = {
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
		third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy" 
	}
elseif DMCWO.remington_cap == 2 then
	tweak_factory.wpn_fps_shot_r870.override.wpn_fps_shot_r870_m_extended = {
		unit = "units/payday2/weapons/wpn_fps_shot_shorty_pts/wpn_fps_shot_shorty_m_extended_short",
		third_unit = "units/payday2/weapons/wpn_third_shot_shorty_pts/wpn_third_shot_shorty_m_extended_short"
	}
else
	tweak_factory.wpn_fps_shot_r870.override.wpn_fps_shot_r870_m_extended = {}
end

if DMCWO.loco_cap == 1 then
	tweak_factory.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_m_extended = {
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy", 
		third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
		stats = {extra_ammo = 2}
	}
elseif DMCWO.loco_cap == 2 then
	tweak_factory.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_m_extended = {
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_m_extended",
		third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_m_extended",
		stats = {extra_ammo = 2}
	}
else
	tweak_factory.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_m_extended = {
		stats = {extra_ammo = 2}
	}
end

if DMCWO.mp7_nostock == true then
	tweak_factory.parts.wpn_fps_smg_mp7_s_standard.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_smg_mp7_s_standard.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_factory.parts.wpn_fps_smg_mp7_s_standard.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_s_standard"
	tweak_factory.parts.wpn_fps_smg_mp7_s_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_s_standard"
end

if DMCWO.m45_nostock == true then
	tweak_factory.parts.wpn_fps_smg_m45_s_folded.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_smg_m45_s_folded.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_factory.parts.wpn_fps_smg_m45_s_folded.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_s_folded"
	tweak_factory.parts.wpn_fps_smg_m45_s_folded.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_s_folded"
end

if DMCWO.m4_barrel == true then
	tweak_factory.wpn_fps_ass_m4.override.wpn_fps_m4_uupg_b_long = {
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium",
	}
	tweak_factory.parts.wpn_fps_m4_uupg_b_medium_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short"
	tweak_factory.parts.wpn_fps_m4_uupg_b_medium_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short"
	tweak_factory.parts.wpn_fps_m4_uupg_b_short.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_b_long"
	tweak_factory.parts.wpn_fps_m4_uupg_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_b_long"
else
	tweak_factory.wpn_fps_ass_m4.override.wpn_fps_m4_uupg_b_long = {}
	tweak_factory.parts.wpn_fps_m4_uupg_b_medium_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium"
	tweak_factory.parts.wpn_fps_m4_uupg_b_medium_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium"
	tweak_factory.parts.wpn_fps_m4_uupg_b_short.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short"
	tweak_factory.parts.wpn_fps_m4_uupg_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short"
end

--[[ WIP
if amcar_upper == true then
tweak_factory.parts.wpn_fps_amcar_uupg_body_upperreciever.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
tweak_factory.parts.wpn_fps_amcar_uupg_body_upperreciever.adds = {"wpn_fps_ass_m16_o_handle_sight", "wpn_fps_m4_uupg_draghandle"}
tweak_factory.wpn_fps_ass_amcar.override = {
wpn_fps_m4_uupg_draghandle = { unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle"},
wpn_fps_m4_upper_reciever_round = { unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"},
wpn_fps_amcar_uupg_body_upperreciever = { unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
										  adds = {"wpn_fps_ass_m16_o_handle_sight", "wpn_fps_m4_uupg_draghandle"},
										},
}
else
tweak_factory.parts.wpn_fps_amcar_uupg_body_upperreciever.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever"
tweak_factory.parts.wpn_fps_amcar_uupg_body_upperreciever.adds = {}
end
]]

if DMCWO.a2_upper == true then
	tweak_factory.parts.wpn_fps_m4_upper_reciever_round.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever"	
	tweak_factory.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_body_upperreciever"	
	tweak_factory.parts.wpn_fps_m4_upper_reciever_round_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever"
	tweak_factory.parts.wpn_fps_m4_upper_reciever_round_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_body_upperreciever"
	tweak_factory.parts.wpn_fps_m4_uupg_draghandle.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_m4_uupg_draghandle.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_m4_uupg_draghandle_vanilla.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_m4_uupg_draghandle_vanilla.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_ass_m16_o_handle_sight.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_factory.parts.wpn_fps_ass_m16_o_handle_sight.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_factory.parts.wpn_fps_m4_upper_reciever_round.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
	tweak_factory.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	tweak_factory.parts.wpn_fps_m4_upper_reciever_round_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
	tweak_factory.parts.wpn_fps_m4_upper_reciever_round_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	tweak_factory.parts.wpn_fps_m4_uupg_draghandle.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle"
	tweak_factory.parts.wpn_fps_m4_uupg_draghandle.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle"
	tweak_factory.parts.wpn_fps_m4_uupg_draghandle_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle"
	tweak_factory.parts.wpn_fps_m4_uupg_draghandle_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle"
	tweak_factory.parts.wpn_fps_ass_m16_o_handle_sight.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight"
	tweak_factory.parts.wpn_fps_ass_m16_o_handle_sight.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight"
end

if DMCWO.m249_barrel == true then
	tweak_factory.parts.wpn_fps_lmg_m249_b_long.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_long"
	tweak_factory.parts.wpn_fps_lmg_m249_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_long"
	tweak_factory.parts.wpn_fps_lmg_m249_b_short.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_short"
	tweak_factory.parts.wpn_fps_lmg_m249_b_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_short"
else
	tweak_factory.parts.wpn_fps_lmg_m249_b_long.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_b_long"
	tweak_factory.parts.wpn_fps_lmg_m249_b_long.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_b_long"
	tweak_factory.parts.wpn_fps_lmg_m249_b_short.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_b_short"
	tweak_factory.parts.wpn_fps_lmg_m249_b_short.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_b_short"
end


if DMCWO.its_fucked == true and DMCWO.ar_front_post == true then
	tweak_factory.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {}
	
	tweak_factory.wpn_fps_ass_amcar.adds = { 		
		wpn_fps_upg_ass_m4_upper_reciever_core ={"wpn_fps_m4_uupg_draghandle_core","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_upg_ass_m4_upper_reciever_ballos ={"wpn_fps_m4_uupg_draghandle_ballos","wpn_fps_ass_m16_o_handle_sight"}, 
		wpn_fps_m4_upper_reciever_edge = {},
		wpn_fps_m4_lower_reciever = {},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_pis_c96_sight = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
	}
elseif DMCWO.its_fucked == true and DMCWO.ar_front_post == false then	
	tweak_factory.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {}
	
	tweak_factory.wpn_fps_ass_amcar.adds = {  		
		wpn_fps_upg_ass_m4_upper_reciever_core ={"wpn_fps_m4_uupg_draghandle_core","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_upg_ass_m4_upper_reciever_ballos ={"wpn_fps_m4_uupg_draghandle_ballos","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_m4_upper_reciever_edge = {},
		wpn_fps_m4_lower_reciever = {},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_pis_c96_sight = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
	}		
elseif DMCWO.its_fucked == false and DMCWO.ar_front_post == true then
	tweak_factory.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {
	"wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_upper_reciever_round_vanilla"
	}
	
	tweak_factory.wpn_fps_ass_amcar.adds = { 
		wpn_fps_upg_ass_m4_upper_reciever_core ={"wpn_fps_m4_uupg_draghandle_core","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_upg_ass_m4_upper_reciever_ballos ={"wpn_fps_m4_uupg_draghandle_ballos","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_m4_upper_reciever_edge ={"wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_m4_lower_reciever ={"wpn_fps_amcar_uupg_body_upperreciever"},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_pis_c96_sight = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
	}
elseif DMCWO.its_fucked == false and DMCWO.ar_front_post == false then
	tweak_factory.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {
	"wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_upper_reciever_round_vanilla"
	}
	
	tweak_factory.wpn_fps_ass_amcar.adds = { 		
		wpn_fps_upg_ass_m4_upper_reciever_core ={"wpn_fps_m4_uupg_draghandle_core","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_upg_ass_m4_upper_reciever_ballos ={"wpn_fps_m4_uupg_draghandle_ballos","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_m4_upper_reciever_edge ={"wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_m4_lower_reciever ={"wpn_fps_amcar_uupg_body_upperreciever"},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_pis_c96_sight = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
	}
end

if DMCWO.ar_front_post == true then
	tweak_factory.wpn_fps_ass_m16.adds = { 
		wpn_fps_m4_lower_reciever ={"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_o_handle_sight","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_specter = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_docter = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_eotech = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_cmore = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_acog = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_cs = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_reflex = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_pis_c96_sight = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		--wpn_fps_m16_fg_railed = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
		--wpn_fps_m16_fg_standard = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
	}	
	tweak_factory.wpn_fps_smg_olympic.adds = { 
		wpn_fps_m4_lower_reciever ={"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle_vanilla"},
		wpn_fps_upg_o_specter = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_docter = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cmore = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_acog = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cs = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_reflex = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_leupold = {"wpn_fps_ass_m16_os_frontsight"},
	}
else
	tweak_factory.wpn_fps_ass_m16.adds = { 
		wpn_fps_m4_lower_reciever ={"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_o_handle_sight","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_pis_c96_sight = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		--wpn_fps_m16_fg_railed = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
		--wpn_fps_m16_fg_standard = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
	}		
	tweak_factory.wpn_fps_smg_olympic.adds = { 
		wpn_fps_m4_lower_reciever ={"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle_vanilla"},
		wpn_fps_upg_o_specter = {},
		wpn_fps_upg_o_aimpoint = {},
		wpn_fps_upg_o_aimpoint_2 = {},
		wpn_fps_upg_o_docter = {},
		wpn_fps_upg_o_eotech = {},
		wpn_fps_upg_o_t1micro = {},
		wpn_fps_upg_o_cmore = {},
		wpn_fps_upg_o_acog = {},
		wpn_fps_upg_o_eotech_xps = {},
		wpn_fps_upg_o_rx01 = {},
		wpn_fps_upg_o_rx30 = {},
		wpn_fps_upg_o_cs = {},
		wpn_fps_upg_o_reflex = {},
		wpn_fps_upg_o_leupold = {},
	}	
end

if DMCWO.ksg_gadget == true then
	tweak_factory.wpn_fps_sho_ksg.override = deep_clone(tweak_factory.wpn_fps_pis_rage.override)
else
	tweak_factory.wpn_fps_sho_ksg.override = {
		wpn_fps_upg_o_leupold = { stats = {zoom = 10, recoil = 2} },
		wpn_fps_pis_c96_sight = { stats = {zoom = 8, recoil = 1} },
		wpn_fps_upg_o_specter = { 
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_aimpoint = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_aimpoint_2 = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_docter = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_eotech = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_t1micro = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_cmore = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_acog = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_cs = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_eotech_xps = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_reflex = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_rx01 = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_rx30 = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_ak_extra_ris = {a_obj = "a_fl_90"},
		
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			forbids = { "wpn_fps_addon_ris" },
			adds = { "wpn_fps_ak_extra_ris" } 
		}
	}
end

--}


------------------[[DON'T TOUCH THE SHIZZLE BELOW, DAWG]]------------------

------------------[[MUZZLE BRAKES]]------------------{

--Fire Breather
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_firepig.stats = { value = 5, suppression = -1, spread = -1, recoil = 3, concealment = -2 }
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_firepig.perks = {"big_flash"}
--Tank Compensator
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_tank.stats = { value = 4, suppression = -0, recoil = 2, spread = 0, concealment = -1 } 
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_tank.perks = {"side_comp"}
--Stubby
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_stubby.stats = { value = 3, suppression = 1, recoil = 1, spread = 1 }
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_stubby.perks = {"flash_hider"}
--Competitor's Compensator
tweak_factory.parts.wpn_fps_upg_ass_ns_jprifles.stats = { suppression = 0, concealment = -2, spread = 4, recoil = -2}
--Funnel of Fun
tweak_factory.parts.wpn_fps_upg_ass_ns_linear.stats = { suppression = -2, spread = -2, concealment = -2, recoil = 4 }
tweak_factory.parts.wpn_fps_upg_ass_ns_linear.perks = {"big_flash"}
--TACTICOOL
tweak_factory.parts.wpn_fps_upg_ass_ns_surefire.stats = { spread = 3, recoil = -1, concealment = -2 }
--Battle Comp
tweak_factory.parts.wpn_fps_upg_ass_ns_battle.stats = { value = 4, suppression = -0, recoil = 0, spread = 2, concealment = -1 } 

--Shark Teeth (Shotguns)
tweak_factory.parts.wpn_fps_upg_ns_shot_shark.stats = { value = 5, suppression = -2, spread = -3, recoil = 4, concealment = -2 }
--King's Crown (Shotguns)
tweak_factory.parts.wpn_fps_upg_shot_ns_king.stats = { suppression = -0, spread = 4, concealment = -2, recoil = -3 }

--La Femme Compensator (Deagle)
tweak_factory.parts.wpn_fps_pis_deagle_co_short.stats = { value = 6, recoil = 2, concealment = -1, suppression = -2 }
--OGREKILL Compensator (Deagle)
tweak_factory.parts.wpn_fps_pis_deagle_co_long.stats = { value = 8, recoil = 4, concealment = -2, spread = 0, suppression = -1 }
tweak_factory.parts.wpn_fps_pis_deagle_co_long.custom_stats = { ads_speed_mult = 0.95 }

--Ventilated Compensator (Glocks)
tweak_factory.parts.wpn_fps_pis_g18c_co_1.stats = { value = 4, suppression = -2, recoil = 2, concealment = -1 }
--Velocity Compensator (Glocks)
tweak_factory.parts.wpn_fps_pis_g18c_co_comp_2.stats = { value = 5, suppression = -1, concealment = -1, spread = 2 }

--Ventilated Compensator (P226)
tweak_factory.parts.wpn_fps_pis_p226_co_comp_1.stats = { value = 4, suppression = -2, recoil = 2, concealment = -1 }
--Velocity Compensator (P226)
tweak_factory.parts.wpn_fps_pis_p226_co_comp_2.stats = { value = 5, suppression = -1, concealment = -1, spread = 2 }

--Ventilated Compensator (USP)
tweak_factory.parts.wpn_fps_pis_usp_co_comp_1.stats = { value = 4, suppression = -2, recoil = 2, concealment = -1 }
--Velocity Compensator (USP)
tweak_factory.parts.wpn_fps_pis_usp_co_comp_2.stats = { value = 5, suppression = -1, concealment = -1, spread = 2 }

--Professional Compensator (92FS)
tweak_factory.parts.wpn_fps_pis_beretta_co_co1.stats = { value = 3, suppression = -5, concealment = -2, recoil = 2 }
--Competitor Compensator (92FS)
tweak_factory.parts.wpn_fps_pis_beretta_co_co2.stats = { value = 4, spread = 2, concealment = -2 }

--Flash Hider (Pistols)
tweak_factory.parts.wpn_fps_upg_pis_ns_flash.stats = { value = 5, suppression = 2,  recoil = 1}
tweak_factory.parts.wpn_fps_upg_pis_ns_flash.perks = {"flash_hider"}

--Punisher Compensator (1911)
tweak_factory.parts.wpn_fps_pis_1911_co_1.stats = { value = 5, suppression = -2, recoil = 2, concealment = -1}
--Aggressor Compensator (1911)
tweak_factory.parts.wpn_fps_pis_1911_co_2.stats = {value = 2, suppression = -1, concealment = -1, spread = 2 }

--Tenderizer
tweak_factory.parts.wpn_fps_upg_ns_pis_meatgrinder.stats = {value = 7, recoil = 4, spread = -2, concealment = -1, suppression = -3}
--IPSC Compensator
tweak_factory.parts.wpn_fps_upg_ns_pis_ipsccomp.stats = {value = 4, recoil = -3, spread = 4, concealment = -1}

--Mac Barrel Extension
tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_ns_barrelextension.stats = { value = 1, spread = 2, recoil = 2, concealment = -2 }
tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_ns_barrelextension.custom_stats = { ads_speed_mult = 0.90 }
--}


------------------[[SUPPRESSORS]]------------------{
--Low Profile
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_small.stats = { value = 3, suppression = 100, alert_size = 12, damage = -2, recoil = -3, spread_moving = -1, concealment = 0 }
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_small.custom_stats = {damage_near_mul = 0.65, damage_far_mul = 0.65, damage_min = 0.825 }
--Medium
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_medium.stats = { value = 2, suppression = 100, alert_size = 12, damage = -2, recoil = -1, spread_moving = -2, concealment = -2, spread = 0}
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_medium.custom_stats = {damage_near_mul = 0.75, damage_far_mul = 0.75, damage_min = 0.875, ads_speed_mult = 0.95 }
--The Bigger the Better
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_large.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 0, spread_moving = -3, concealment = -3, spread = 1}
tweak_factory.parts.wpn_fps_upg_ns_ass_smg_large.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, damage_min = 0.90, ads_speed_mult = 0.925 }

--PBS
tweak_factory.parts.wpn_fps_upg_ns_ass_pbs1.stats = {value = 1, suppression = 100, alert_size = 12, concealment = -5, damage = 0}
tweak_factory.parts.wpn_fps_upg_ns_ass_pbs1.custom_stats = {damage_near_mul = 0.85, damage_far_mul = 0.85, damage_min = 0.925, ads_speed_mult = 0.90 }

--Size Doesn't Matter
tweak_factory.parts.wpn_fps_upg_ns_pis_small.stats = { value = 3, suppression = 100, alert_size = 12, damage = -2, recoil = -3, spread_moving = -1, concealment = 0 }
tweak_factory.parts.wpn_fps_upg_ns_pis_small.custom_stats = {damage_near_mul = 0.65, damage_far_mul = 0.65, damage_min = 0.65, damage_min = 0.825}
--Standard Issue
tweak_factory.parts.wpn_fps_upg_ns_pis_medium.stats = { value = 1, suppression = 100, alert_size = 12, damage = -2, recoil = -1, spread_moving = -2, concealment = -2, spread = 0  }
tweak_factory.parts.wpn_fps_upg_ns_pis_medium.custom_stats = {damage_near_mul = 0.75, damage_far_mul = 0.75, damage_min = 0.875, ads_speed_mult = 0.95 }
--Monolith
tweak_factory.parts.wpn_fps_upg_ns_pis_large.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 0, spread_moving = -2, concealment = -3, spread = 1 }
tweak_factory.parts.wpn_fps_upg_ns_pis_large.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, damage_min = 0.90, ads_speed_mult = 0.925 }

--Asepsis
tweak_factory.parts.wpn_fps_upg_ns_pis_medium_slim.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = -2, spread_moving = -2, concealment = -2 }
tweak_factory.parts.wpn_fps_upg_ns_pis_medium_slim.custom_stats = {damage_near_mul = 0.85, damage_far_mul = 0.85, damage_min = 0.925, ads_speed_mult = 0.925 }

--GemTech Suppressor
tweak_factory.parts.wpn_fps_upg_ns_pis_medium_gem.stats = { value = 1, suppression = 100, alert_size = 12, spread = 1, recoil = -1, spread_moving = -2, concealment = -1, damage = -2 }
tweak_factory.parts.wpn_fps_upg_ns_pis_medium_gem.custom_stats = {damage_near_mul = 0.75, damage_far_mul = 0.75, damage_min = 0.875, ads_speed_mult = 0.95 }
--MK.23 Suppressor
tweak_factory.parts.wpn_fps_upg_ns_pis_large_kac.stats = { value = 1, suppression = 100, alert_size = 12, spread = 2, recoil = 0, spread_moving = -2, concealment = -2, damage = -2 }
tweak_factory.parts.wpn_fps_upg_ns_pis_large_kac.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, damage_min = 0.90, ads_speed_mult = 0.925 }
tweak_factory.parts.wpn_fps_upg_ns_pis_large_kac.perks = { "silencer" }

--METAL GEAR
tweak_factory.parts.wpn_fps_upg_ns_pis_jungle.stats = { value = 0, suppression = 100, alert_size = 12, spread = 2, recoil = 1, concealment = -5, damage = -2 }
tweak_factory.parts.wpn_fps_upg_ns_pis_jungle.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, damage_min = 0.90, ads_speed_mult = 0.90 }
--Oil Filter
tweak_factory.parts.wpn_fps_upg_ns_ass_filter.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 2, concealment = -3 }
tweak_factory.parts.wpn_fps_upg_ns_ass_filter.custom_stats = {damage_near_mul = 0.75, damage_far_mul = 0.75, damage_min = 0.85, ads_speed_mult = 0.90 }

--Shotgun Suppressor
tweak_factory.parts.wpn_fps_upg_ns_shot_thick.stats = { value = 7, suppression = 100, alert_size = 12, damage = -2, recoil = -1, spread_moving = -2, concealment = -2 }
tweak_factory.parts.wpn_fps_upg_ns_shot_thick.custom_stats = {damage_near_mul = 0.75, damage_far_mul = 0.75, ads_speed_mult = 0.95 }
--SALVO
tweak_factory.parts.wpn_fps_upg_ns_sho_salvo_large.stats = {
			value = 7,
			suppression = 100,
			alert_size = 12,
			damage = -2,
			spread = 1,
			recoil = 1,
			concealment = -4
		}
tweak_factory.parts.wpn_fps_upg_ns_sho_salvo_large.custom_stats = { damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90 }


--MSR Suppressor (TITAN QD)
tweak_factory.parts.wpn_fps_snp_msr_ns_suppressor.stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = -2, spread_moving = -2, concealment = -2, damage = -2}
tweak_factory.parts.wpn_fps_snp_msr_ns_suppressor.custom_stats = {damage_near_mul = 0.85, damage_far_mul = 0.85, damage_min = 0.925, ads_speed_mult = 0.90 }

--MP7 Suppressor
tweak_factory.parts.wpn_fps_smg_mp7_b_suppressed.stats = { value = 4, spread = 2, suppression = 100, alert_size = 12, damage = -0, recoil = -0, spread_moving = -2, concealment = -2 }
tweak_factory.parts.wpn_fps_smg_mp7_b_suppressed.custom_stats = {damage_near_mul = 0.85, damage_far_mul = 0.85, damage_min = 0.925, ads_speed_mult = 0.925 }

--Skorpion Suppressor
tweak_factory.parts.wpn_fps_smg_scorpion_b_suppressed.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = 0, spread_moving = -0, concealment = -2 }
tweak_factory.parts.wpn_fps_smg_scorpion_b_suppressed.custom_stats = {damage_near_mul = 0.85, damage_far_mul = 0.85, damage_min = 0.925, ads_speed_mult = 0.925 }

--Uzi Suppressor
tweak_factory.parts.wpn_fps_smg_uzi_b_suppressed.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = 0, spread_moving = -0, concealment = -2 }
tweak_factory.parts.wpn_fps_smg_uzi_b_suppressed.custom_stats = {damage_near_mul = 0.85, damage_far_mul = 0.85, damage_min = 0.925, ads_speed_mult = 0.925 }
--C96 DL-44 Muzzle
tweak_factory.parts.wpn_fps_pis_c96_nozzle.custom_stats = { 
	starwars = true,
	penetration_power_mult = 0,
	penetration_damage_mult = 0,
	can_shoot_through_enemy = false,
	can_shoot_through_wall = false
}
tweak_factory.parts.wpn_fps_pis_c96_nozzle.stats = {
			value = 1,
			recoil = 3,
			spread = -2,
			concealment = -1
		}
	
--SIONICS Suppressor
tweak_factory.parts.wpn_fps_smg_cobray_ns_silencer.custom_stats = {damage_near_mul = 0.85, damage_far_mul = 0.85, damage_min = 0.925, ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_smg_cobray_ns_silencer.stats = {
	value = 1,
	suppression = 100,
	alert_size = 12,
	recoil = 2,
	spread = -0,
	concealment = -1
}

--Vector Suppressor
tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_ns_silencer.stats = {
		value = 1,
		damage = -0,
		alert_size = 12,
		concealment = -1
	}
tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_ns_silencer.custom_stats = {damage_near_mul = 0.85, damage_far_mul = 0.85, damage_min = 0.925, ads_speed_mult = 0.85 }
--}


------------------[[BARRELS]]------------------{
--AK Slavic Dragon (AK74, AKM)
tweak_factory.parts.wpn_fps_upg_ak_b_draco.stats = { recoil = 0, concealment = 1, spread = -0, suppression = 0}
tweak_factory.parts.wpn_fps_upg_ak_b_draco.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.10 }

tweak_factory.parts.wpn_fps_upg_ass_ak_b_zastava.stats = { value = 1, spread = 8, recoil = -10, total_ammo_mod = -0, damage = 0, concealment = -4 }
tweak_factory.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats = {damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min = 1.1, ads_speed_mult = 0.90 }

tweak_factory.parts.wpn_fps_upg_ak_b_ak105.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9}
tweak_factory.parts.wpn_fps_upg_ak_b_ak105.stats = { value = 1, spread = -1, recoil = 2, concealment = 1 }

--AR Medium Barrel (Para SMG)
tweak_factory.parts.wpn_fps_m4_uupg_b_medium.stats = { value = 1, spread = 2, concealment = -1 }
tweak_factory.parts.wpn_fps_m4_uupg_b_medium.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }

--AR Short Barrel (CAR-4)
tweak_factory.parts.wpn_fps_m4_uupg_b_short.stats = { value = 5, damage = -0, spread = -1, recoil = 0, spread_moving = -2, concealment = 2, suppression = -2 }
tweak_factory.parts.wpn_fps_m4_uupg_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
--AR Long Barrel (CAR-4, AMR-16)
tweak_factory.parts.wpn_fps_m4_uupg_b_long.stats = { value = 4, damage = 2, spread = 2, recoil = -1, concealment = -2, suppression = 0 }
tweak_factory.parts.wpn_fps_m4_uupg_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
--Beowulf
tweak_factory.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = { value = 1, spread = 8, recoil = -10, total_ammo_mod = -0, damage = 2, concealment = -4 }
tweak_factory.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = {damage_near_mul = 1.30, damage_far_mul = 1.30, damage_min = 1.1, ads_speed_mult = 0.90 }
--Intergrated Suppressor (CAR-4)
tweak_factory.parts.wpn_fps_m4_uupg_b_sd.stats = { value = 6, suppression = 100, alert_size = 12, spread = 0, damage = -2, recoil = 4, spread_moving = 1, concealment = 1 }
tweak_factory.parts.wpn_fps_m4_uupg_b_sd.custom_stats = { ads_speed_mult = 0.90 }

--AK5 Short Barrel
tweak_factory.parts.wpn_fps_ass_ak5_b_short.stats = { value = 1, damage = -1, spread = -1, concealment = 2 }
tweak_factory.parts.wpn_fps_ass_ak5_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }


--SG552 Long Barrel
tweak_factory.parts.wpn_fps_ass_s552_b_long.stats = { value = 6, spread = 2, damage = 0, spread_moving = -4, concealment = -4, recoil = 0 }
tweak_factory.parts.wpn_fps_ass_s552_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }

--Road Warrior/Sawn-off (Mosconi)
tweak_factory.parts.wpn_fps_shot_huntsman_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_shot_huntsman_b_short.stats = { value = 10, recoil = -1, spread = -18, spread_moving = 3, concealment = 10, suppression = -1 }
tweak_factory.parts.wpn_fps_shot_huntsman_b_short.stance_mod = { wpn_fps_shot_huntsman = {rotation = Rotation(0,0.5,0) } }

--Sawn-off (B682)
tweak_factory.parts.wpn_fps_shot_b682_b_short.stats = { value = 10, recoil = -1, spread = -15, spread_moving = 3, concealment = 10, suppression = -1 }
tweak_factory.parts.wpn_fps_shot_b682_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_shot_b682_b_short.stance_mod = { wpn_fps_shot_b682 = {rotation = Rotation(0,0.5,0) } }

--SCAR Long Barrel
tweak_factory.parts.wpn_fps_ass_scar_b_long.stats = { value = 4, spread = 4, spread_moving = -3, concealment = -3, damage = 12, recoil = -3, suppression = 0, total_ammo_mod = -50}
tweak_factory.parts.wpn_fps_ass_scar_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
--SCAR Short Barrel
tweak_factory.parts.wpn_fps_ass_scar_b_short.stats = { value = 3, damage = -0, suppression = -3, spread = -3, spread_moving = 3, concealment = 3 , recoil = 0}
tweak_factory.parts.wpn_fps_ass_scar_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }

--HK21 Long Barrel
tweak_factory.parts.wpn_fps_lmg_hk21_b_long.stats = { value = 4, spread = 2, recoil = -3, damage = 0, spread_moving = -2, concealment = -2, suppression = 0 }
tweak_factory.parts.wpn_fps_lmg_hk21_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }

--M249 Long Barrel
tweak_factory.parts.wpn_fps_lmg_m249_b_long.stats = { value = 4, damage = 1, spread = 2, recoil = -2, concealment = -2, suppression = 0 }
tweak_factory.parts.wpn_fps_lmg_m249_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }

--Deagle Long Barrel
tweak_factory.parts.wpn_fps_pis_deagle_b_long.stats = { value = 7, spread_moving = -3, spread = 4, damage = 0, concealment = -3, recoil = -3, suppression = -0  }
tweak_factory.parts.wpn_fps_pis_deagle_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }

--Raging Bull Long Barrel
tweak_factory.parts.wpn_fps_pis_rage_b_long.stats = { value = 5, recoil = -2, spread = 7, spread_moving = -3, concealment = -3, damage = 0, suppression = -0 }
tweak_factory.parts.wpn_fps_pis_rage_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.925 }
--Raging Bull Short Barrel
tweak_factory.parts.wpn_fps_pis_rage_b_short.stats = { value = 3, recoil = -1, spread_moving = 3, spread = -6, concealment = 3, damage = -0, suppression = -5 }
tweak_factory.parts.wpn_fps_pis_rage_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.075 }
--Raging Bull Aggressor
tweak_factory.parts.wpn_fps_pis_rage_b_comp1.stats = { value = 3, recoil = 1, damage = 0, spread = 2, spread_moving = -3, concealment = -3, suppression = -2 }
--Raging Bull Vented
tweak_factory.parts.wpn_fps_pis_rage_b_comp2.stats = { value = 4, recoil = 3, damage = 0, spread = 0, spread_moving = 1, suppression = -3, concealment = -3 }
tweak_factory.parts.wpn_fps_pis_rage_b_comp2.perks = {"side_comp"}

--MP9 Suppressor
tweak_factory.parts.wpn_fps_smg_mp9_b_suppressed.custom_stats = { ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_smg_mp9_b_suppressed.stats = {
	value = 1,
	suppression = 100,
	alert_size = 12,
	recoil = 2,
	spread = 0,
	concealment = -4,
	damage = -0
}

--P90 Long Barrel
tweak_factory.parts.wpn_fps_smg_p90_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_smg_p90_b_long.stats = { value = 8, spread = 3, spread_moving = -3, damage = 0, recoil = 0, concealment = -2 }
--P90 Ninja Barrel
tweak_factory.parts.wpn_fps_smg_p90_b_ninja.custom_stats = { ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_smg_p90_b_ninja.stats = { value = 2, suppression = 100, alert_size = 12, damage = 0, recoil = 0, spread = -2 }

tweak_factory.parts.wpn_fps_smg_p90_b_civilian.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.90}
tweak_factory.parts.wpn_fps_smg_p90_b_civilian.stats = { value = 1, damage = 0, spread = 1, recoil = 2, concealment = -4}

--AUG Long Barrel
tweak_factory.parts.wpn_fps_aug_b_long.stats = { value = 7, spread_moving = -2, spread = 2, recoil = -1, concealment = -3, damage = 1 }
tweak_factory.parts.wpn_fps_aug_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
--AUG Short Barrel
tweak_factory.parts.wpn_fps_aug_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_aug_b_short.stats = { value = 5, spread_moving = 3, spread = -3, recoil = 4, concealment = 2, damage = -1, suppression = -2 }

--M45 Short barrel 
tweak_factory.parts.wpn_fps_smg_m45_b_small.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.075 }
tweak_factory.parts.wpn_fps_smg_m45_b_small.stats = { value = 2, spread = -2, concealment = 3, damage = -1, suppression = -1 }

--MSR Long Barrel
tweak_factory.parts.wpn_fps_snp_msr_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_snp_msr_b_long.stats = { value = 10, spread = 2, recoil = 0, concealment = -3}

--R93 Short Barrel 
tweak_factory.parts.wpn_fps_snp_r93_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_snp_r93_b_short.stats = { value = 1, spread = -2, recoil = 0, spread_moving = 3, concealment = 3, damage = -4, suppression = -2 }
--R93 Suppressed Barrel
tweak_factory.parts.wpn_fps_snp_r93_b_suppressed.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, damage_min = 0.90, ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_snp_r93_b_suppressed.stats = { value = 4, suppression = 100, alert_size = 12, spread = 0, damage = -10, recoil = 3, spread_moving = 1, concealment = -1 }
		
--M95 Long Barrel
tweak_factory.parts.wpn_fps_snp_m95_barrel_long.stats = { value = 2, spread = 1, concealment = -1, suppression = 0, recoil = -3, damage = 40, spread_moving = -2, total_ammo_mod = -66}
tweak_factory.parts.wpn_fps_snp_m95_barrel_long.custom_stats = {movement_speed = 0.95, damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.90 }
--M95 Short Barrel
tweak_factory.parts.wpn_fps_snp_m95_barrel_short.stats = { value = 2, spread = -3, concealment = 8, damage = 0, suppression = -5 }
tweak_factory.parts.wpn_fps_snp_m95_barrel_short.custom_stats = {movement_speed = 1.05, damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05}
--M95 Suppressed Barrel
tweak_factory.parts.wpn_fps_snp_m95_barrel_suppressed.stats = { value = 2, recoil = 10, concealment = 2, damage = -10, suppression = 100, alert_size = 12 }
tweak_factory.parts.wpn_fps_snp_m95_barrel_suppressed.custom_stats = {movement_speed = 0.85, ads_speed_mult = 0.90}

--M1014 Long Barrel
tweak_factory.parts.wpn_fps_sho_ben_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_sho_ben_b_long.stats = { value = 8, recoil = 0, spread = 2, concealment = -2, extra_ammo = 2 }
--M1014 Short Barrel
tweak_factory.parts.wpn_fps_sho_ben_b_short.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_sho_ben_b_short.stats = { value = 5, recoil = 0, spread = -4, concealment = 6, extra_ammo = -1 }

--KSG Long Barrel
tweak_factory.parts.wpn_fps_sho_ksg_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_sho_ksg_b_long.stats = { value = 7, recoil = 0, spread = 2, concealment = -2, extra_ammo = 2 }
tweak_factory.parts.wpn_fps_sho_ksg_b_long.override = {
			wpn_fps_upg_o_dd_front = {a_obj = "a_o_f_2"},
			wpn_fps_upg_o_mbus_front = {a_obj = "a_o_f_2"}
		}
--KSG Short Barrel
tweak_factory.parts.wpn_fps_sho_ksg_b_short.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_sho_ksg_b_short.stats = { value = 5, recoil = 0, spread = -4, concealment = 4, damage = 0, extra_ammo = -2 }

--Striker Long Barrel
tweak_factory.parts.wpn_fps_sho_striker_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_sho_striker_b_long.stats = { value = 3, recoil = 0, spread = 2, concealment = -2 }
--Striker Suppressed Barrel
tweak_factory.parts.wpn_fps_sho_striker_b_suppressed.custom_stats = { ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_sho_striker_b_suppressed.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 1, spread_moving = 1, concealment = -2 }

--AA12 Long Barrel
tweak_factory.parts.wpn_fps_sho_aa12_barrel_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_sho_aa12_barrel_long.stats = { value = 1, recoil = 0, spread = 2, concealment = -2 }
--AA12 Suppressed Barrel
tweak_factory.parts.wpn_fps_sho_aa12_barrel_silenced.custom_stats = { ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_sho_aa12_barrel_silenced.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 4, spread = 1, concealment = -2 }

--G3 Short Barrel
tweak_factory.parts.wpn_fps_ass_g3_b_short.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_ass_g3_b_short.stats = {value = 2, recoil = 1, spread = -2, concealment = 4, damage = -0}
--G3 Sniper Barrel
tweak_factory.parts.wpn_fps_ass_g3_b_sniper.override = {}
tweak_factory.parts.wpn_fps_ass_g3_b_sniper.adds = {}
tweak_factory.parts.wpn_fps_ass_g3_b_sniper.custom_stats = { damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min = 1.1, ads_speed_mult = 0.90, rof_mult = 0.83333333333333333333333333333333 }
tweak_factory.parts.wpn_fps_ass_g3_b_sniper.stats = { value = 2, recoil = -8, spread = 3,concealment = -2,damage = 12,total_ammo_mod = -50}

--FAMAS Long
tweak_factory.parts.wpn_fps_ass_famas_b_long.custom_stats = { damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_ass_famas_b_long.stats = { value = 2, recoil = 2, spread = 1, concealment = -1, damage = 2}
--FAMAS Short	
tweak_factory.parts.wpn_fps_ass_famas_b_short.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_ass_famas_b_short.stats = { value = 2, recoil = -0, spread = -2, concealment = 2, damage = -1}
--FAMAS Sniper	
tweak_factory.parts.wpn_fps_ass_famas_b_sniper.custom_stats = { damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min = 1.1, ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_ass_famas_b_sniper.stats = { value = 2, recoil = -4, spread = 5, concealment = -2, damage = 2}
--FAMAS Supp.	
tweak_factory.parts.wpn_fps_ass_famas_b_suppressed.custom_stats = { ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_ass_famas_b_suppressed.stats = { value = 2,recoil = 0,spread = 2,concealment = -1,damage = -2}
	
--TEC-9 Barrel Extension
tweak_factory.parts.wpn_fps_smg_tec9_ns_ext.forbids = {
	"wpn_fps_upg_ns_ass_smg_large",
	"wpn_fps_upg_ns_ass_smg_medium",
	"wpn_fps_upg_ns_ass_smg_small",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_linear",
	"wpn_fps_upg_ass_ns_surefire",
	}
tweak_factory.parts.wpn_fps_smg_tec9_ns_ext.stats = { value = 5, spread = 1, recoil = 2, concealment = -3 }
tweak_factory.parts.wpn_fps_smg_tec9_ns_ext.custom_stats = { ads_speed_mult = 0.95 }
--TEC-9 AB-10 Barrel
tweak_factory.parts.wpn_fps_smg_tec9_b_standard.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_smg_tec9_b_standard.stats = { value = 3, recoil = -3, concealment = 3}

--MG42 MG34 Barrel
tweak_factory.parts.wpn_fps_lmg_mg42_b_mg34.stats = { value = 1, recoil = -2, spread = 4 }
tweak_factory.parts.wpn_fps_lmg_mg42_b_mg34.custom_stats = { rof_mult = 0.75, ads_speed_mult = 1.05 }
--MG42 DLT-19 Barrel
tweak_factory.parts.wpn_fps_lmg_mg42_b_vg38.custom_stats = { 
	starwars = true, 
	rof_mult = 0.33333333333333333333333333333333,
	penetration_power_mult = 0,
	penetration_damage_mult = 0,
	can_shoot_through_enemy = false,
	can_shoot_through_wall = false,
	can_shoot_through_shield = false
}
tweak_factory.parts.wpn_fps_lmg_mg42_b_vg38.stats = {
	value = 4,
	spread = 5,
	recoil = 15,
	suppression = 0,
	alert_size = 12
}

--C96 Carbine Barrel
tweak_factory.parts.wpn_fps_pis_c96_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }	
tweak_factory.parts.wpn_fps_pis_c96_b_long.stats = {value = 1,damage = 3,recoil = -2,spread = 4,concealment = -3,total_ammo_mod = -25}	
		
--Mosin Short Barrel
tweak_factory.parts.wpn_fps_snp_mosin_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_snp_mosin_b_short.stats = { value = 1, spread = -1, recoil = 0, concealment = 3, suppression = -5}	
--Mosin Long Barrel
tweak_factory.parts.wpn_fps_snp_mosin_b_standard.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_snp_mosin_b_standard.stats = {value = 1, spread = 2, recoil = 1, concealment = -2}		
--Mosin Supp. Barrel
tweak_factory.parts.wpn_fps_snp_mosin_b_sniper.custom_stats = {damage_near_mul = 0.8, damage_far_mul = 0.8, damage_min = 0.9, ads_speed_mult = 0.925 }
tweak_factory.parts.wpn_fps_snp_mosin_b_sniper.stats = {value = 6, suppression = 100, alert_size = 12, damage = -4, recoil = 4, spread = 0, spread_moving = -1, concealment = -2}

--Sterling Long Barrel
tweak_factory.parts.wpn_fps_smg_sterling_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_smg_sterling_b_long.stats = {
	value = 1,
	recoil = 0,
	spread = 2,
	damage = 1,
	concealment = -2
}
--Sterling Short Barrel
tweak_factory.parts.wpn_fps_smg_sterling_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, damage_min = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_smg_sterling_b_short.stats = {
	value = 1,
	spread = -2,
	damage = -1,
	concealment = 1
}
--Sterling Suppressed Barrel
tweak_factory.parts.wpn_fps_smg_sterling_b_suppressed.custom_stats = { ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_smg_sterling_b_suppressed.stats = {
	value = 4,
	suppression = 100,
	alert_size = 12,
	damage = 0,
	recoil = 2,
	spread_moving = 0,
	concealment = -2
}
--Sterling E11 Barrel
tweak_factory.parts.wpn_fps_smg_sterling_b_e11.custom_stats = { 
	starwars = true,
	penetration_power_mult = 0,
	penetration_damage_mult = 0,
	can_shoot_through_enemy = false,
	can_shoot_through_wall = false
}
tweak_factory.parts.wpn_fps_smg_sterling_b_e11.stats = {
	value = 4,
	spread = -2,
	suppression = 100,
	alert_size = 12,
	damage = 0,
	recoil = 4,
	spread_moving = 0,
	concealment = -1
}

--Thompson Long
tweak_factory.parts.wpn_fps_smg_thompson_barrel_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_smg_thompson_barrel_long.stats = {
	value = 4,
	spread = 2,
	concealment = -3
}
--Thompson Short
tweak_factory.parts.wpn_fps_smg_thompson_barrel_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_smg_thompson_barrel_short.stats = {
	value = 2,
	spread = -2,
	concealment = 3
}

--L85 Long
tweak_factory.parts.wpn_fps_ass_l85a2_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_ass_l85a2_b_long.stats = {value = 1, spread = 2, recoil = 0, concealment = -3, damage = 2}	
--L85 Short	
tweak_factory.parts.wpn_fps_ass_l85a2_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }	
tweak_factory.parts.wpn_fps_ass_l85a2_b_short.stats = {value = 1, spread = -2, recoil = 3, concealment = 3, damage = -0}		

--VHS Suppresssed	
tweak_factory.parts.wpn_fps_ass_vhs_b_silenced.custom_stats = { ads_speed_mult = 0.90 }
--VHS Sniper		
tweak_factory.parts.wpn_fps_ass_vhs_b_sniper.custom_stats = {damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min = 1.1, ads_speed_mult = 0.90 }	
tweak_factory.parts.wpn_fps_ass_vhs_b_sniper.stats = {value = 1, spread = 4, recoil = -2, concealment = -2, damage = 0}	
--VHS Short
tweak_factory.parts.wpn_fps_ass_vhs_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_ass_vhs_b_short.stats = {value = 1, spread = -1, recoil = 3, concealment = 3, suppression = -1}

--M134 Barrels
--Long
tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_extreme.stats = { value = 1, spread = 4, recoil = 6, concealment = -3 }
tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_extreme.custom_stats = {movement_speed = 0.9, damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.90 }
--Short
tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_short.stats = { value = 1, spread = -4, recoil = -2, concealment = 3}
tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_short.custom_stats = {movement_speed = 1.2, damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05}

--Winchester Long
tweak_data.weapon.factory.parts.wpn_fps_snp_winchester_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_data.weapon.factory.parts.wpn_fps_snp_winchester_b_long.stats = { value = 1, spread = 3, recoil = 1, concealment = -2}
--Winchester Supp
tweak_data.weapon.factory.parts.wpn_fps_snp_winchester_b_suppressed.custom_stats = {damage_near_mul = 0.8, damage_far_mul = 0.8, damage_min = 0.9, ads_speed_mult = 0.925 }
tweak_data.weapon.factory.parts.wpn_fps_snp_winchester_b_suppressed.stats = { value = 1, spread = 0, recoil = 4, concealment = -2, damage = -2, alert_size = 12}

--SAA Long
tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_b_long.stats = { value = 1, spread = 3, concealment = -2}
--SAA Short
tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_b_short.stats = { value = 1, spread = -3, concealment = 2}
tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }

--Mateba Long
tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_long.stats = { value = 1, spread = 3, concealment = -2}
--Mateba Med
tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_medium.stats = {value = 1, spread = -1, concealment = 2}		
--Mateba Short
tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_short.stats = { value = 1, spread = -4, recoil = -2, concealment = 4 }
tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }

--AS Val Standard
tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_standard.stats = { value = 1, suppression = 100, alert_size = 12 }
tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_standard.sound_switch = {
		suppressed = "suppressed_c"
	}
--AS Val Short
tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_proto.stats = { value = 1, spread = -1, recoil = -3, concealment = 2, suppression = 0, alert_size = 0 }
tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_proto.custom_stats = {damage_near_mul = 1.1, damage_far_mul = 1.1, use_sound = "akm"}
tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_proto.sound_switch = {}
tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_proto.perks = {}
tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_proto.sub_type = nil

--WA2k Long
tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_b_long.stats = {
		value = 6,
		spread = 4,
		recoil = -4,
		concealment = -3
	}
tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_b_long.custom_stats = { damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.925 }

--WA2k Supp.
tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_b_suppressed.stats = {
		value = 6,
		suppression = 100,
		alert_size = 12,
		damage = -2,
		recoil = 5,
		concealment = -2
	}
tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_b_suppressed.custom_stats = { damage_near_mul = 0.85, damage_far_mul = 0.85, damage_min = 0.925, ads_speed_mult = 0.90 }

--Vector CRB
tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.stats = {
		value = 1,
		spread = 4,
		concealment = -4,
		recoil = -5
	}
tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.custom_stats = {damage_near_mul = 1.20, damage_far_mul = 1.20, ads_speed_mult = 0.90 }
	

--}
	

------------------[[SLIDES]]------------------{
--1911 Longslide
tweak_factory.parts.wpn_fps_pis_1911_b_long.stats = { value = 2, damage = 0, spread = 3, recoil = 0, concealment = -2, suppression = -0 }
tweak_factory.parts.wpn_fps_pis_1911_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
--1911 Vented
tweak_factory.parts.wpn_fps_pis_1911_b_vented.stats = { value = 1, recoil = 3, suppression = -2}

--P226 Two Tone
tweak_factory.parts.wpn_fps_pis_p226_b_equinox.stats = { value = 4, suppression = -0, recoil = 3 }
--P226 Long Slide
tweak_factory.parts.wpn_fps_pis_p226_b_long.stats = { value = 6, damage = 0, spread = 3, concealment = -3 }
tweak_factory.parts.wpn_fps_pis_p226_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }

--92FS Brigadier Slide
tweak_factory.parts.wpn_fps_pis_beretta_sl_brigadier.stats = { value = 1, spread = 0, recoil = 2 }

--USP Expert
tweak_factory.parts.wpn_fps_pis_usp_b_expert.stats = { value = 2, concealment = -1, recoil = 2 }
--USP Match
tweak_factory.parts.wpn_fps_pis_usp_b_match.stats = { value = 2, spread = 2, concealment = -1, damage = 0 }
tweak_factory.parts.wpn_fps_pis_usp_b_match.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }

--G22 Long Slide
tweak_factory.parts.wpn_fps_pis_g22c_b_long.stats = { value = 6, damage = 0, spread = 2, recoil = 1, suppression = 0, spread_moving = -3 }
tweak_factory.parts.wpn_fps_pis_g22c_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }

--PPKS Slide
tweak_factory.parts.wpn_fps_pis_ppk_b_long.stats = { value = 3, damage = 0, spread = 2, spread_moving = -2, concealment = -2 }

tweak_factory.parts.wpn_fps_pis_g26_b_custom.stats = { value = 4, recoil = 0, spread = 2, concealment = -1, damage = 0 }

tweak_factory.parts.wpn_fps_pis_hs2000_sl_custom.stats = { value = 4, recoil = 4, spread = 0, concealment = 0, damage = 0 }
tweak_factory.parts.wpn_fps_pis_hs2000_sl_custom.custom_stats = { ads_speed_mult = 1.05 }

tweak_factory.parts.wpn_fps_pis_hs2000_sl_long.stats = { value = 6, recoil = 1, spread = 2, concealment = -3, damage = 0 }
--}


------------------[[CUSTOM]]------------------{
--Single
tweak_factory.parts.wpn_fps_upg_i_singlefire.stats = { value = 5, spread = 3, recoil = 1 }
--Full-Auto
tweak_factory.parts.wpn_fps_upg_i_autofire.stats = { value = 8, spread = -2, recoil = -6 }
tweak_factory.parts.wpn_fps_upg_i_autofire.custom_stats = { rof_mult = 1.15, hipfire_mod = 1.25}
tweak_factory.wpn_fps_pis_c96.override.wpn_fps_upg_i_autofire = {
	desc_id = "bm_wp_upg_i_autofire_c96",
	custom_stats = {rof_mult = 2.2222222222222222222222222222222, block_eq_aced = true, hipfire_mod = 1.25}
}
tweak_factory.wpn_fps_smg_tec9.override.wpn_fps_upg_i_autofire = {
	desc_id = "bm_wp_upg_i_autofire_tec9",
	custom_stats = {rof_mult = 1.3333333333333333333333333333333, block_eq_aced = true, hipfire_mod = 1.25}
}
--Bayonet
tweak_factory.parts.wpn_fps_snp_mosin_ns_bayonet.custom_stats = { ads_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_snp_mosin_ns_bayonet.stats = {
			value = 1,
			spread = -2,
			recoil = 2,
			suppression = -2,
			concealment = -2,
			min_damage = 10,
			max_damage = 10,
			min_damage_effect = 1.75,
			max_damage_effect = 1.75,
		}
--}


------------------[[HANDGUARDS]]------------------{
--Aftermarket (CAR-4)
tweak_factory.parts.wpn_fps_m4_uupg_fg_lr300.custom_stats = {ads_speed_mult = 1.1}
tweak_factory.parts.wpn_fps_m4_uupg_fg_lr300.stats = { value = 5, concealment = 1, recoil = 2, spread = 0 }
--Competition (CAR-4)
tweak_factory.parts.wpn_fps_upg_fg_jp.custom_stats = {ads_speed_mult = 1.075}
tweak_factory.parts.wpn_fps_upg_fg_jp.stats = { spread = 2, recoil = -2, concealment = 2 }
--Gazelle (CAR-4)
tweak_factory.parts.wpn_fps_upg_fg_smr.stats = { spread = 1, recoil = 2, concealment = -2 }
--LOVA
tweak_factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.custom_stats = {ads_speed_mult = 0.95}
tweak_factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats = { value = 1, spread = 0, recoil = 4, }
tweak_factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.forbids = { "wpn_fps_addon_ris" }
--MOE SL
tweak_factory.parts.wpn_fps_upg_ass_m4_fg_moe.stats = { value = 1, spread = 1, recoil = 1, concealment = 2,}
tweak_factory.parts.wpn_fps_upg_ass_m4_fg_moe.custom_stats = {ads_speed_mult = 1.05}

--M16 Railed Handguard
tweak_factory.parts.wpn_fps_m16_fg_railed.custom_stats = { ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_m16_fg_railed.stats = { value = 7, spread_moving = -2, recoil = 2, concealment = -2, spread = 1 }
--M16A1 Handguard
tweak_factory.parts.wpn_fps_m16_fg_vietnam.custom_stats = { ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_m16_fg_vietnam.stats = { value = 10, spread_moving = 1, spread = 2, concealment = 2, recoil = -1 }
--STAG
tweak_factory.parts.wpn_fps_upg_ass_m16_fg_stag.stats = { value = 1, recoil = 3, concealment = -3}

--AK Wood Rail
tweak_factory.parts.wpn_upg_ak_fg_combo2.stats = { value = 3, spread_moving = -1, spread = 0, recoil = 2 }
--AK Rail
tweak_factory.parts.wpn_upg_ak_fg_combo3.custom_stats = {ads_speed_mult = 0.95}
tweak_factory.parts.wpn_upg_ak_fg_combo3.stats = { value = 5, spread_moving = -2, recoil = 1, spread = 1, concealment = -1 }
--AK War Proven
tweak_factory.parts.wpn_fps_upg_ak_fg_tapco.stats = { value = 5, concealment = 3, recoil = 1}
--AK Light Weight
tweak_factory.parts.wpn_fps_upg_fg_midwest.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_upg_fg_midwest.stats = { value = 5, concealment = -2, recoil = -2, spread = 4 }
--AK TRAX Handguard
tweak_factory.parts.wpn_fps_upg_ak_fg_trax.custom_stats = {ads_speed_mult = 0.925}
tweak_factory.parts.wpn_fps_upg_ak_fg_trax.stats = { value = 1, spread = -1, recoil = 4, concealment = -2 }
--AK ZenitCo Handguard
tweak_factory.parts.wpn_fps_upg_ak_fg_krebs.custom_stats = {ads_speed_mult = 1.075}
tweak_factory.parts.wpn_fps_upg_ak_fg_krebs.stats = { value = 1, spread = 1, concealment = 3 } 	

--G36c Handguard and Barrel
tweak_factory.parts.wpn_fps_ass_g36_fg_c.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_ass_g36_fg_c.stats = { value = 4, spread_moving = 2, spread = -1, damage = -1, concealment = 2 }
tweak_factory.parts.wpn_fps_ass_g36_fg_c.forbids = { "wpn_fps_addon_ris", "wpn_fps_ass_g36_b_long" } 
--G36k Railed Handguard
tweak_factory.parts.wpn_fps_ass_g36_fg_ksk.stats = { value = 5, spread_moving = -2, recoil = 2, concealment = -2 }
tweak_factory.parts.wpn_fps_ass_g36_fg_ksk.forbids = { "wpn_fps_addon_ris" }

--Karbin Ceres (AK5)
tweak_factory.parts.wpn_fps_ass_ak5_fg_ak5c.custom_stats = {rof_mult = 0.96296296296296296296296296296296}
tweak_factory.parts.wpn_fps_ass_ak5_fg_ak5c.stats = { value = 7, recoil = 3, spread = 0, spread_moving = -2, concealment = -2 }
--Belgian Heat (AK5)
tweak_factory.parts.wpn_fps_ass_ak5_fg_fnc.custom_stats = {rof_mult = 1.037037037037037037037037037037, has_burst_fire = true}
tweak_factory.parts.wpn_fps_ass_ak5_fg_fnc.stats = { value = 10, spread = 2, recoil = -2, concealment = 1}

--MP5k
tweak_factory.parts.wpn_fps_smg_mp5_fg_m5k.stats = { value = 4, spread_moving = 3, recoil = -12, concealment = 3, damage = -0, spread = -2 , suppression = -0}
tweak_factory.parts.wpn_fps_smg_mp5_fg_m5k.custom_stats = { damage_near_mul = 0.85, damage_far_mul = 0.85, ads_speed_mult = 1.075, rof_mult = 1.125, hipfire_mod = 0.9}
--MP5 Railed
tweak_factory.parts.wpn_fps_smg_mp5_fg_mp5a5.stats = { value = 5, spread_moving = 0, recoil = 3, concealment = -3 }
--MP5SD
tweak_factory.parts.wpn_fps_smg_mp5_fg_mp5sd.stats = { value = 10, spread_moving = 0, suppression = 12, alert_size = 12, damage = -2, recoil = 4, concealment = 1 }
tweak_factory.parts.wpn_fps_smg_mp5_fg_mp5sd.sound_switch = { suppressed = "suppressed_c" }
tweak_factory.parts.wpn_fps_smg_mp5_fg_mp5sd.custom_stats = { rof_mult = 0.75 }

--HK21 Short Handguard
tweak_factory.parts.wpn_fps_lmg_hk21_fg_short.custom_stats = {ads_speed_mult = 1.05, damage_near_mul = 0.9, damage_far_mul = 0.9, movement_speed = 1.1, hipfire_mod = 0.9}
tweak_factory.parts.wpn_fps_lmg_hk21_fg_short.stats = { value = 6, spread = -2, damage = -0, spread_moving = 2, concealment = 3, recoil = -2, suppression = -1 }

--M249 MK.46 Rail
tweak_factory.parts.wpn_fps_lmg_m249_fg_mk46.custom_stats = {ads_speed_mult = 0.95}
tweak_factory.parts.wpn_fps_lmg_m249_fg_mk46.stats = { value = 6, recoil = 2, spread_moving = 2, concealment = -1 }
tweak_factory.parts.wpn_fps_lmg_m249_fg_mk46.forbids = { "wpn_fps_addon_ris" }

--RPK Black Handguard
tweak_factory.parts.wpn_fps_lmg_rpk_fg_standard.stats = { value = 5, spread = 0, recoil = 1, spread_moving = 2, concealment = 1 }
tweak_factory.parts.wpn_fps_lmg_rpk_fg_standard.adds = {}

--AUG A3 Handguard
tweak_factory.parts.wpn_fps_aug_fg_a3.custom_stats = {ads_speed_mult = 0.95}
tweak_factory.parts.wpn_fps_aug_fg_a3.stats = { value = 7, recoil = 2, spread_moving = -2, concealment = -2, spread = -0 }

--SG552 Green Handguard
tweak_factory.parts.wpn_fps_ass_s552_fg_standard_green.stats = { value = 1, spread = 4, concealment = -4 }
--SG552 Railed Handguard
tweak_factory.parts.wpn_fps_ass_s552_fg_railed.stats = { value = 7, spread_moving = -2, recoil = 2, concealment = -2 }

--Saiga Railed Handguard
tweak_factory.parts.wpn_upg_saiga_fg_lowerrail.custom_stats = {ads_speed_mult = 0.95}
tweak_factory.parts.wpn_upg_saiga_fg_lowerrail.stats = { value = 5, recoil = 2, spread_moving = -2, concealment = -2 }

--FAL Wooden Handguard
tweak_factory.parts.wpn_fps_ass_fal_fg_wood.custom_stats = {movement_speed = 0.95, ads_speed_mult = 0.925}
tweak_factory.parts.wpn_fps_ass_fal_fg_wood.stats = { value = 3, spread = 0, recoil = 4, concealment = -2 }
--FAL DSA SA58 Handguard
tweak_factory.parts.wpn_fps_ass_fal_fg_01.stats = { value = 3, damage = -12, spread = -0, recoil = 0, concealment = 6, suppression = -2, total_ammo_mod = 50 }
tweak_factory.parts.wpn_fps_ass_fal_fg_01.forbids = { "wpn_fps_addon_ris" }
tweak_factory.parts.wpn_fps_ass_fal_fg_01.custom_stats = {movement_speed = 1.05, damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.15, hipfire_mod = 0.9}
--FAL Romat Handguard
tweak_factory.parts.wpn_fps_ass_fal_fg_03.stats = { value = 3, damage = 0, spread = 2, recoil = -0, concealment = -1 }
tweak_factory.parts.wpn_fps_ass_fal_fg_03.custom_stats = {ads_speed_mult = 0.95}
--FAL DSA Freefloat Barrel Handguard
tweak_factory.parts.wpn_fps_ass_fal_fg_04.stats = { value = 3, damage = 0, spread = 4, recoil = -2, concealment = -2 }
tweak_factory.parts.wpn_fps_ass_fal_fg_04.custom_stats = {ads_speed_mult = 1.05}

--R870 Wood Pump (VANITY)
tweak_factory.parts.wpn_fps_shot_r870_fg_wood.stats = { value = 2, recoil = 1}
tweak_factory.parts.wpn_fps_shot_r870_fg_wood.custom_stats = {ads_speed_mult = 0.95}

--AKMSU Railed Handguard
tweak_factory.parts.wpn_fps_smg_akmsu_fg_rail.custom_stats = {ads_speed_mult = 0.95}
tweak_factory.parts.wpn_fps_smg_akmsu_fg_rail.stats = { value = 5, spread_moving = -2, recoil = 2, concealment = -2 }

--G3 PSG-1 Handguard
tweak_factory.parts.wpn_fps_ass_g3_fg_psg.custom_stats = {ads_speed_mult = 0.95}
tweak_factory.parts.wpn_fps_ass_g3_fg_psg.stats = { value = 2, recoil = 1, spread = 1, concealment = -1 }
--G3 Railed Handguard
tweak_factory.parts.wpn_fps_ass_g3_fg_railed.stats = { value = 2, recoil = 3, spread = 0, concealment = -2 }
tweak_factory.parts.wpn_fps_ass_g3_fg_railed.forbids = { "wpn_fps_addon_ris" } 
--G3 Wood Handguard
tweak_factory.parts.wpn_fps_ass_g3_fg_retro.custom_stats = {movement_speed = 1.05, ads_speed_mult = 1.075, hipfire_mod = 0.9}
tweak_factory.parts.wpn_fps_ass_g3_fg_retro.stats = { value = 2, recoil = 4, spread = -1, concealment = 2 }
--G3 Plastic Handguard
tweak_factory.parts.wpn_fps_ass_g3_fg_retro_plastic.custom_stats = {ads_speed_mult = 1.05, movement_speed = 1.1, hipfire_mod = 0.9}
tweak_factory.parts.wpn_fps_ass_g3_fg_retro_plastic.stats = { value = 2, recoil = -2, spread = 0, concealment = 4 }

--Galil FAB Defence Handguard
tweak_factory.parts.wpn_fps_ass_galil_fg_fab.stats = { value = 2, recoil = 3, spread = 0, concealment = -1 }
tweak_factory.parts.wpn_fps_ass_galil_fg_fab.stance_mod = {}
tweak_factory.parts.wpn_fps_ass_galil_fg_fab.override = {}
tweak_factory.parts.wpn_fps_ass_galil_fg_fab.forbids = {}

--Galil MAR Handguard
tweak_factory.parts.wpn_fps_ass_galil_fg_mar.stats = { value = 2, recoil = -0, spread = -0, concealment = 4, damage = -12, suppression = -3, total_ammo_mod = 50}
tweak_factory.parts.wpn_fps_ass_galil_fg_mar.custom_stats = {movement_speed = 1.1, damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.15, rof_mult = 1.0714285714285714285714285714286, hipfire_mod = 0.9}
tweak_factory.parts.wpn_fps_ass_galil_fg_mar.override = {}
tweak_factory.parts.wpn_fps_ass_galil_fg_mar.forbids = {}
tweak_factory.parts.wpn_fps_ass_galil_fg_mar.stance_mod = {}
--Galil SAR Handguard
tweak_factory.parts.wpn_fps_ass_galil_fg_sar.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_ass_galil_fg_sar.stats = { value = 2, recoil = 1, spread = 0, concealment = 1, damage = -0, suppression = -1 }
--Galil Galatz Handguard
tweak_factory.parts.wpn_fps_ass_galil_fg_sniper.stats = { value = 2, recoil = -1, spread = 3, concealment = -2, damage = 0}
tweak_factory.parts.wpn_fps_ass_galil_fg_sniper.custom_stats = {damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min = 1.1, ads_speed_mult = 0.90, rof_mult = 0.9 }

--FAB Defence UZI Tri-rail
tweak_factory.parts.wpn_fps_smg_uzi_fg_rail.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_smg_uzi_fg_rail.stats = { value = 2, recoil = 2, spread = 0, concealment = -2}
tweak_factory.parts.wpn_fps_smg_uzi_fg_rail.forbids = { "wpn_fps_addon_ris", "wpn_fps_shot_r870_gadget_rail" }

--DD L85 Quad Rail
tweak_factory.parts.wpn_fps_ass_l85a2_fg_short.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_ass_l85a2_fg_short.stats = { value = 1, concealment = 1 }

--Thompson Black Foregrip
tweak_factory.parts.wpn_fps_smg_thompson_foregrip_discrete.custom_stats = {ads_speed_mult = 1.05}

--Thompson Black Foregrip
tweak_factory.parts.wpn_fps_ass_sub2000_fg_gen2.stats = {
		value = 1,
		spread = 3,
		recoil = -4,
		concealment = 3
	}
tweak_factory.parts.wpn_fps_ass_sub2000_fg_gen2.custom_stats = {ads_speed_mult = 1.05}
--Thompson Black Foregrip
tweak_factory.parts.wpn_fps_ass_sub2000_fg_railed.stats = {
		value = 1,
		recoil = 3,
		concealment = -2
	}
tweak_factory.parts.wpn_fps_ass_sub2000_fg_railed.custom_stats = {ads_speed_mult = 0.95}
--Thompson Black Foregrip
tweak_factory.parts.wpn_fps_ass_sub2000_fg_suppressed.sound_switch = {
			suppressed = "suppressed_c"
		}
tweak_factory.parts.wpn_fps_ass_sub2000_fg_suppressed.stats = {
		value = 5,
		suppression = 100,
		alert_size = 12,
		spread = 1,
		damage = -2,
		recoil = 5,
		concealment = -2
	}
tweak_factory.parts.wpn_fps_ass_sub2000_fg_suppressed.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, damage_min = 0.90, ads_speed_mult = 0.90}
--}

	
------------------[[RECEIVERS]]------------------{
--AR VLTOR Upper 
tweak_factory.parts.wpn_fps_m4_upper_reciever_edge.stats = { value = 3, recoil = 0 }
tweak_factory.parts.wpn_fps_m4_upper_reciever_edge.custom_stats = { rof_mult = 1.02 }

--AR CORE15 Upper
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.stats = { value = 1, spread = -1, recoil = -1 }
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.custom_stats = { rof_mult = 1.05 }

--AR Balios Upper
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.stats = { value = 1, recoil = 1, spread = 1 }
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.custom_stats = { rof_mult = 0.95 }

--SG552 Black Reciever
tweak_factory.parts.wpn_fps_ass_s552_body_standard_black.stats = { value = 7, recoil = 0, concealment = 4 }

--Shell Rack (Loco, 870)
tweak_factory.parts.wpn_fps_shot_r870_body_rack.stats ={ value = 3, spread_moving = -1, concealment = -2, suppression = -0, recoil = 0, total_ammo_mod = 25 }
tweak_factory.wpn_fps_shot_r870.override.wpn_fps_shot_r870_body_rack = { stats ={ value = 3, spread_moving = -1, concealment = -2, suppression = -0, recoil = 0, total_ammo_mod = 25 }}
--}


------------------[[BODIES & EXTRA SHIT]]------------------{
--Saw Fast Body
tweak_factory.parts.wpn_fps_saw_body_speed.stats = {value = 1, damage = 3}

--Saw Durable Blade
tweak_factory.parts.wpn_fps_saw_m_blade_durable.stats = {value = 1, extra_ammo = 50, total_ammo_mod = 75}
--Saw Sharp Blade
tweak_factory.parts.wpn_fps_saw_m_blade_sharp.stats = {value = 1, damage = 3}

--Mk.14 (M308)
tweak_factory.parts.wpn_fps_ass_m14_body_ebr.custom_stats = {movement_speed = 0.95, ads_speed_mult = 0.95, rof_mult = 1.0714285714285714285714285714286 }
tweak_factory.parts.wpn_fps_ass_m14_body_ebr.stats = { value = 6, spread_moving = 3, recoil = -3, concealment = 2,	spread = 3 }
--JAE-100 (M308)
tweak_factory.parts.wpn_fps_ass_m14_body_jae.stats = { value = 10, spread_moving = -2, recoil = 4, concealment = -2, spread = -2 }

--Raging Bull Smooth Cylinder
tweak_factory.parts.wpn_fps_pis_rage_body_smooth.stats = { value = 6, recoil = 1, concealment = 1 }

--SCAR Rail Extension
tweak_factory.parts.wpn_fps_ass_scar_fg_railext.custom_stats = { ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_ass_scar_fg_railext.stats = { value = 4, recoil = 2, spread_moving = -1, concealment = -1, spread = -0}

--MSR Aluminium Body
tweak_factory.parts.wpn_fps_snp_msr_body_msr.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_snp_msr_body_msr.stats = { value = 10, spread_moving = -2, recoil = -3, concealment = 5}

tweak_factory.parts.wpn_fps_snp_r93_body_wood.custom_stats = {ads_speed_mult = 0.95}
tweak_factory.parts.wpn_fps_snp_r93_body_wood.stats = { value = 7, concealment = -3, recoil = 5}

tweak_factory.parts.wpn_fps_pis_g26_body_custom.stats = {
	value = 7,
	recoil = 2,
	concealment = -1
}
		
tweak_factory.parts.wpn_fps_smg_mac10_body_ris.custom_stats = { ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_smg_mac10_body_ris.stats = {
	value = 5,
	recoil = 3,
	spread_moving = -2,
	concealment = -2
}


tweak_factory.parts.wpn_fps_upg_ass_m4_lower_reciever_core.stats = {value = 1, recoil = -1}
tweak_factory.parts.wpn_fps_upg_ass_m4_lower_reciever_core.custom_stats = { reload_speed_mult = 1.05 }

tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_body_upper_light.stats = { value = 1, spread = 0, recoil = -2, concealment = 3, total_ammo_mod = -60 }
tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_body_upper_light.custom_stats = {movement_speed = 1.2, reload_speed_mult = 1.1}

tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_body_upper_jacket.stats = { value = 1, spread = 1, recoil = 2, concealment = -3 }

tweak_data.weapon.factory.parts.wpn_fps_aug_body_f90.stats = { value = 1, spread = 1, recoil = -2, concealment = -2 }
tweak_data.weapon.factory.parts.wpn_fps_aug_body_f90.custom_stats = { rof_mult = 1.2142857142857142857142857142857 }

tweak_data.weapon.factory.parts.wpn_fps_upg_o_ak_scopemount.stats = { value = 1, recoil = -1, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_m14_scopemount.stats = { value = 1, recoil = -1, concealment = -1 }

--WA2k bodies
tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_light.stats = { value = 1, recoil = -3, concealment = -2 }
tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_light.custom_stats = { movement_speed = 1.1 }

tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_stealth.stats = { value = 1, recoil = 0, concealment = 2 }

tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_walnut.stats = { value = 1, recoil = 3, concealment = -2 }
tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_walnut.custom_stats = { ads_speed_mult = 0.95 }

tweak_data.weapon.factory.parts.wpn_fps_bow_hunter_b_skeletal.stats = { value = 1, recoil = 2, concealment = 1 }
tweak_data.weapon.factory.parts.wpn_fps_bow_hunter_b_carbon.stats = { value = 1, spread = 1, concealment = 1 }


--}
		
		
------------------[[PISTOL GRIPS]]------------------{
--Glock grip Sleeve
tweak_factory.parts.wpn_fps_pis_g18c_g_ergo.custom_stats = {ads_speed_mult = 1.05}

--Ergo Grip (Non-AK Rifles)
tweak_factory.parts.wpn_fps_upg_m4_g_ergo.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_upg_m4_g_ergo.stats = { value = 2, spread_moving = 2, spread = 3, recoil = -1}
--Pro Grip (Non-AK Rifles)
tweak_factory.parts.wpn_fps_upg_m4_g_sniper.stats = { value = 6, spread = 1, recoil = 2, spread_moving = -2, concealment = -1 }
--Rubber Grip (Non-AK Rifles)
tweak_factory.parts.wpn_fps_upg_m4_g_hgrip.stats = { value = 2, spread_moving = 2, recoil = 3, spread = 0 }
--Straight Grip
tweak_factory.parts.wpn_fps_upg_m4_g_mgrip.stats = { value = 2, spread_moving = 2, concealment = 2, spread = 1 }


--AK Rubber Grip
tweak_factory.parts.wpn_fps_upg_ak_g_hgrip.stats = { value = 2, recoil = 1, concealment = 2 }
--AK Plastic Grip
tweak_factory.parts.wpn_fps_upg_ak_g_pgrip.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_upg_ak_g_pgrip.stats = { value = 2, spread = 2,  recoil = -1}
--AK Wood Grip
tweak_factory.parts.wpn_fps_upg_ak_g_wgrip.stats = { value = 2, recoil = 2, concealment = -1, spread = 0 }

--SG552 Green Grip
tweak_factory.parts.wpn_fps_ass_s552_g_standard_green.stats = { value = 4, recoil = 1, concealment = -2 }

--Ergo Grip (HK21)
tweak_factory.parts.wpn_fps_lmg_hk21_g_ergo.stats = { value = 3, recoil = 1, concealment = -1 }
tweak_factory.parts.wpn_fps_lmg_hk21_g_ergo.custom_stats = {ads_speed_mult = 1.05}

--Ergo Grip (Deagle)
tweak_factory.parts.wpn_fps_pis_deagle_g_ergo.stats = { value = 6, spread_moving = 2, recoil = 2, concealment = -1 }
tweak_factory.parts.wpn_fps_pis_deagle_g_ergo.custom_stats = {ads_speed_mult = 1.05}
--Bling Grip (Deagle)
tweak_factory.parts.wpn_fps_pis_deagle_g_bling.stats = { value = 10, spread_moving = -2, spread = 2, concealment = 1, recoil = -2 }

--Bling Grip (1911)
tweak_factory.parts.wpn_fps_pis_1911_g_ergo.stats = { value = 10, spread = 0, recoil = 2 }
tweak_factory.parts.wpn_fps_pis_1911_g_ergo.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_pis_1911_g_bling.stats = { value = 10, spread = 2, recoil = -1 }

--PPK Grip
tweak_factory.parts.wpn_fps_pis_ppk_g_laser.stats = { value = 1, spread = 2 }
tweak_factory.parts.wpn_fps_pis_ppk_g_laser.sub_type = "laser"

--FAL SAW grip
tweak_factory.parts.wpn_fps_ass_fal_g_01.stats = { value = 2, recoil = 2, concealment = 2 }

--G3 Retro Grip
tweak_factory.parts.wpn_fps_ass_g3_g_retro.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_ass_g3_g_retro.stats = { 
	value = 2,
	recoil = 2,
	spread = 0,
	concealment = 0
}
--G3 PSG-1 Grip
tweak_factory.parts.wpn_fps_ass_g3_g_sniper.stats = { 
	value = 2,
	recoil = 1,
	spread = 2,
	concealment = -1
}
	
--Famas G2 Grip
tweak_factory.parts.wpn_fps_ass_famas_g_retro.custom_stats = { rof_mult = 1.2 }
tweak_factory.parts.wpn_fps_ass_famas_g_retro.stats = { 
	value = 2,
	recoil = 1,
	spread = 1,
	concealment = -1
}
	
--Galil Galatz Grip
tweak_factory.parts.wpn_fps_ass_galil_g_sniper.stats = { 
	value = 2,
	recoil = 1,
	spread = 1,
	concealment = -1
}
	
--Skorpion Wood Grip	
tweak_factory.parts.wpn_fps_smg_scorpion_g_wood.stats = {
	value = 1,
	spread = 1,
	recoil = 2,
	concealment = -1
}
--Skorpion Ergo Grip	
tweak_factory.parts.wpn_fps_smg_scorpion_g_ergo.custom_stats = {ads_speed_mult = 1.05}
tweak_factory.parts.wpn_fps_smg_scorpion_g_ergo.stats = {
	value = 1,
	recoil = 3,
	concealment = 1
}

tweak_factory.parts.wpn_fps_pis_g26_g_laser.sub_type = "laser"

tweak_factory.parts.wpn_fps_pis_g26_g_gripforce.stats = {
	value = 7,
	recoil = 3,
	spread = 0,
	concealment = -1
}

tweak_factory.parts.wpn_fps_smg_thompson_grip_discrete.custom_stats = {ads_speed_mult = 1.05}

tweak_factory.parts.wpn_fps_bow_hunter_g_walnut.stats = {value = 1, concealment = -1, spread = 2}

--}


------------------[[STOCKS]]------------------{
--Caesar (AK5)
tweak_factory.parts.wpn_fps_ass_ak5_s_ak5c.stats = { value = 7, recoil = 2, concealment = 2}
--Bertil (AK5)
tweak_factory.parts.wpn_fps_ass_ak5_s_ak5b.stats = { value = 5, recoil = 0, spread = 2, concealment = -1 }
tweak_factory.parts.wpn_fps_ass_ak5_s_ak5b.stance_mod = {}

--M45 Folded Stock
tweak_factory.parts.wpn_fps_smg_m45_s_folded.stats = { value = 2, recoil = -6, concealment = 2 }

--870 No Stock
tweak_factory.parts.wpn_fps_shot_r870_s_nostock_big.stats = { value = 4, spread_moving = 1, recoil = -6, concealment = 1 }

--Standard
tweak_factory.parts.wpn_fps_upg_m4_s_standard.stats = { value = 1, concealment = -1, recoil = 1, spread = 1 }
--Tactical Stock
tweak_factory.parts.wpn_fps_upg_m4_s_pts.stats = { value = 3, spread = 1, recoil = 1, concealment = -1 }

--Wide (AMCAR, CAR-4, AMR-16, Para SMG, M249,Pump Shotguns, AKs)
tweak_factory.parts.wpn_fps_upg_m4_s_crane.stats = { value = 5, recoil = 0, concealment = 1, spread_moving = 2, spread = 0 }
--War-Torn (AMCAR, CAR-4, AMR-16, Para SMG, M249,Pump Shotguns, AKs)
tweak_factory.parts.wpn_fps_upg_m4_s_mk46.stats = { value = 5, spread = 2, recoil = -2, concealment = -3 }
--M4 Folding
tweak_factory.parts.wpn_fps_m4_uupg_s_fold.stats = { value = 5, spread = 0, recoil = -3, concealment = 3 }
--UBR Stock
tweak_factory.parts.wpn_fps_upg_m4_s_ubr.stats = { value = 1, spread = 0, recoil = 2, concealment = -2 }

--AK PSL stock
tweak_factory.parts.wpn_upg_ak_s_psl.stats = { value = 6, spread = 1, spread_moving = -3, recoil = 3, concealment = -3 }
--AK Standard Wood Stock
tweak_factory.parts.wpn_fps_upg_ak_s_solidstock.stats = { value = 1, recoil = 4, concealment = -4, spread = 0 }

--M249 Solid Stock
tweak_factory.parts.wpn_fps_lmg_m249_s_solid.stats = { value = 3, recoil = 2, concealment = -2 }

--RPK Synthetic Stock
tweak_factory.parts.wpn_fps_lmg_rpk_s_standard.stats = { value = 3, recoil = 1, concealment = 1 }

--Gangster Special (Mosconi)
tweak_factory.parts.wpn_fps_shot_huntsman_s_short.stats = { value = 10, recoil = -12, spread = 0, spread_moving = 3, concealment = 10 }

--Wrist Wrecker
tweak_factory.parts.wpn_fps_shot_b682_s_short.stats = { value = 1, recoil = -12, spread = 0, spread_moving = 3, concealment = 6 }
--Ammo Pouch
tweak_factory.parts.wpn_fps_shot_b682_s_ammopouch.stats = { value = 1, total_ammo_mod = 33}

--Tactical Shorty (Loco)
tweak_factory.parts.wpn_fps_shot_shorty_s_nostock_short.stats = { value = 4, spread_moving = 2, recoil = -5, concealment = 3 }
--Standard (Loco)
tweak_factory.parts.wpn_fps_shot_r870_s_solid.stats = { value = 2, spread_moving = -2, recoil = 3, concealment = -1 }

--MP9 Stock
tweak_factory.parts.wpn_fps_smg_mp9_s_skel.stats = { value = 5, recoil = 3, spread_moving = -3, concealment = -3, spread = 0 }

--MP5 Retractable Stock
tweak_factory.parts.wpn_fps_smg_mp5_s_adjust.stats = { value = 3, spread_moving = 1, concealment = 3, recoil = -3 }
--MP5 No Stock
tweak_factory.parts.wpn_fps_smg_mp5_s_ring.stats = { value = 3, spread_moving = 4, recoil = -6, concealment = 4 }

--R870 Top Folding Stock
tweak_factory.parts.wpn_fps_shot_r870_s_folding.stats = { value = 9, spread_moving = 1, recoil = -1, concealment = 1 }

--SG552 Green Stock
tweak_factory.parts.wpn_fps_ass_s552_s_standard_green.stats = { value = 4, recoil = 2, concealment = -2, spread = 0 }

--SCAR Sniper Stock
tweak_factory.parts.wpn_fps_ass_scar_s_sniper.stats = { value = 4, recoil = 3, spread_moving = -3, concealment = -3 }

--G36 Solid Stock 
tweak_factory.parts.wpn_fps_ass_g36_s_kv.stats = { value = 4, spread_moving = 2, concealment = 2, recoil = 2 }
--G36 SL8 Stock 
tweak_factory.parts.wpn_fps_ass_g36_s_sl8.stats = { value = 9, recoil = 1, spread_moving = -3, concealment = -3, spread = 2 }

--MP7 Extended stock
tweak_factory.parts.wpn_fps_smg_mp7_s_long.stats = { value = 1, recoil = 3, spread_moving = -1, concealment = -2, spread = 0 }

--FAL Folding Stock
tweak_factory.parts.wpn_fps_ass_fal_s_01.stats = { value = 3, spread = 0, recoil = -3, concealment = 5 }
--FAL Magpul Stock
tweak_factory.parts.wpn_fps_ass_fal_s_03.stats = { value = 3, spread = 2, recoil = 2, concealment = -2 }
--FAL Wooden Stock
tweak_factory.parts.wpn_fps_ass_fal_s_wood.stats = { value = 3, spread = 0, recoil = 4, concealment = 0 }

--M1014 Solid Stock
tweak_factory.parts.wpn_fps_sho_ben_s_solid.stats = { value = 5, recoil = 4, concealment = -2 }

--G3 PSG-1 Stock
tweak_factory.parts.wpn_fps_ass_g3_s_sniper.stats = {value = 2,recoil = 0,spread = 2,concealment = -1}
--G3 Wood Stock
tweak_factory.parts.wpn_fps_ass_g3_s_wood.stats = {value = 2,recoil = 2,spread = -0,concealment = -1}
	
--Galil FAB Stock
tweak_factory.parts.wpn_fps_ass_galil_s_fab.stats = {value = 2,recoil = -1,spread = 3,concealment = 3}
--Galil Light Stock
tweak_factory.parts.wpn_fps_ass_galil_s_light.stats = {value = 2,recoil = -2,spread = 4,concealment = 2}
--Galil Plastic Stock
tweak_factory.parts.wpn_fps_ass_galil_s_plastic.stats = {value = 2,recoil = 2,spread = 0,concealment = 1}
--Galil Skeletal Stock
tweak_factory.parts.wpn_fps_ass_galil_s_skeletal.stats = {value = 2,recoil = 0,spread = 1,concealment = 1}
--Galil Sniper Stock
tweak_factory.parts.wpn_fps_ass_galil_s_sniper.stats = {value = 2,recoil = 4,spread = 0,concealment = -2}
--Galil Wood Stock
tweak_factory.parts.wpn_fps_ass_galil_s_wood.stats = {value = 2,recoil = -0,spread = 2,concealment = -2}
	
--Uzi Synthetic Stock 
tweak_factory.parts.wpn_fps_smg_uzi_s_leather.stats = {value = 1,spread = 2,recoil = 2,concealment = -2}		
--Uzi Wood Stock 
tweak_factory.parts.wpn_fps_smg_uzi_s_solid.stats = {value = 1,spread = 0,recoil = 4,concealment = -2}

--Micro Uzi Stock 
tweak_factory.parts.wpn_fps_smg_uzi_s_solid.stats = {value = 1, recoil = 8, concealment = -2}
--Micro Uzi No Stock
tweak_factory.parts.wpn_fps_smg_baka_s_unfolded.stats = {value = 1, recoil = -4, concealment = 1}

--Tec-9 Stock
tweak_factory.parts.wpn_fps_smg_tec9_s_unfolded.stats = {value = 3,recoil = 3,spread = 2,concealment = -2}

--C96 Stock
tweak_factory.parts.wpn_fps_pis_c96_s_solid.stats = {value = 1,recoil = 4,concealment = -3}

--Mosin Black Stock
tweak_factory.parts.wpn_fps_snp_mosin_body_black.stats = {value = 1, recoil = 0, concealment = 3, suppression = -2}

--Sterling Solid Stock
tweak_factory.parts.wpn_fps_smg_sterling_s_solid.stats = {value = 1,spread = 0,recoil = 2,concealment = -2}

--SPAS-12 Folded Stock
tweak_factory.parts.wpn_fps_sho_s_spas12_folded.stats = {value = 1, spread = 0, recoil = -3, concealment = 2}

--SPAS-12 No Stock
tweak_factory.parts.wpn_fps_sho_s_spas12_nostock.stats = {value = 4, spread = 0, recoil = -10, concealment = 4}

--SPAS-12 Solid Stock
tweak_factory.parts.wpn_fps_sho_s_spas12_solid.stats = {value = 4, spread = 0, recoil = 4, concealment = -3}

--G18 Stock
tweak_factory.parts.wpn_fps_pis_g18c_s_stock.stats = { value = 8, recoil = 8, concealment = -2 }

--Skorpion No Stock
tweak_factory.parts.wpn_fps_smg_scorpion_s_nostock.stats = { value = 1, recoil = -3, concealment = 1 }

--M1928 No Stock
tweak_factory.parts.wpn_fps_smg_thompson_stock_nostock.stats = { value = 1, recoil = -8, concealment = 4 }

--AS Val VSS Stock
tweak_factory.parts.wpn_fps_ass_asval_s_solid.stats = { value = 1, recoil = 8, concealment = -3 }
tweak_factory.parts.wpn_fps_ass_asval_s_solid.custom_stats = { rof_mult = 0.66666666666666666666666666666667 }

--}
	
	
------------------[[GADGETS]]------------------{
--TLR1
tweak_factory.parts.wpn_fps_upg_fl_pis_tlr1.stats = { value = 2, recoil = 1, concealment = -1 }
--Pistol Laser
tweak_factory.parts.wpn_fps_upg_fl_pis_laser.stats = { value = 5, recoil = 1, concealment = -1 }
--X400V
tweak_factory.parts.wpn_fps_upg_fl_pis_x400v.stats = { value = 5, recoil = 2, spread = 0, concealment = -2 }


--PEQ-5
tweak_factory.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.stats = { value = 5, recoil = 1, concealment = -1 }
--Surefire
tweak_factory.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.stats = { value = 3, recoil = 1, concealment = -1 }
--PEQ-15
tweak_factory.parts.wpn_fps_upg_fl_ass_peq15.stats = { value = 5, recoil = 2, concealment = -2 }
--UTG P38
tweak_factory.parts.wpn_fps_upg_fl_ass_utg.stats = { value = 5, recoil = 2, concealment = -2 }

--}


------------------[[OPTICS]]------------------{

tweak_factory.parts.wpn_fps_ass_s552_o_flipup.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_o_flipup"
	
local pivot_shoulder_translation = Vector3(10.6642, 22.0789, -3.95194)
local pivot_shoulder_rotation = Rotation(0.106285, 0.18453, 0.630167)
local pivot_head_translation = Vector3(0, 19, 0)
local pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.s552.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.s552.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

--ELCAN BUIS
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod = {}
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2, 0.05 ) + Vector3( 0, 0 ,-3.15 ) }

tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-28,-4.6 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-27,-5.3 )+ Vector3( 0, 0 ,-3.15 ) }
	
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.3,-0.45 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-0.05 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-3.45 )+ Vector3( 0, 0 ,-3.15 ),rotation = Rotation( 0,-0.2,0) }

tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -7, -1.1) + Vector3(0, 0, -3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-2.7 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-6.25 )+ Vector3( 0, 0 ,-3.15 )}
	
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-6,-3 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-6,-3 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-6,-3 )+ Vector3( 0, 0 ,-3.15 ) }
	
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-0.1 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-2.9 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 )+ Vector3( 0, 0 ,-3.15 ),rotation = Rotation( 0,0.5,0)  }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-0.25,-3.0 )+ Vector3( 0, 0 ,-3.15 ) }
	
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-17.75,-4 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-9.25,-3.4 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-2.7 )+ Vector3( 0, 0 ,-3.15 ),rotation = Rotation( 0,-0.35,0) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-3 )+ Vector3( 0, 0 ,-3.15 )}
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-5.15 )+ Vector3( 0, 0 ,-3.15 )}
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-5.05 )+ Vector3( 0, 0 ,-3.15 )}
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-5 )+ Vector3( 0, 0 ,-3.15 )}
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-3.59 )+ Vector3( 0, 0 ,-3.15 )}
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-4.15 )+ Vector3( 0, 0 ,-3.15 )}
	
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-14.7,-2.97 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-2.77 )+ Vector3( 0, 0 ,-3.15 ) }
			
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-13.5,-3.25 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,-2.4,-3.55 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-2,-3.1 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( -0.05,-1.6,-2.9 ) + Vector3( 0, 0 ,-3.15 )}

tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5)+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -4.2)+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -9.2, -0.5)+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -7, -3.8)+ Vector3( 0, 0 ,-3.15 ) }

tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-3,-3 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-3.3 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-3.3 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -3.2)+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -2.7)+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -11.1, -1.3)+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -3.9)+ Vector3( 0, 0 ,-3.15 ) }
	
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-22.4,-3.8 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-0.25 )+ Vector3( 0, 0 ,-3.15 ) }
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-3.5 )+ Vector3( 0, 0 ,-3.15 )}		
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-20,-3.48 )+ Vector3( 0, 0 ,-3.15 )}		
tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-14.3,-3.2 )+ Vector3( 0, 0 ,-3.15 )}	
		
--EOTech (Base)
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2, 0.05 ) }

tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-28,-4.6 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-27,-5.3 ) }
	
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.3,-0.45 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-0.05 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-3.45 ),rotation = Rotation( 0,-0.2,0) }

tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -7, -1.1) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-2.7 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-6.25 )}
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( 0,1.6,1.9 )}
	
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-6,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-6,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-6,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_asval = { translation = Vector3( 0,-3.6,-0.01 ) }
	
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-0.1 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-2.9 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ),rotation = Rotation( 0,0.5,0)  }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-0.25,-3.0 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-18.5, -0.01 ) }
	
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0,-8.4, 0 )}
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-17.75,-4 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-9.25,-3.4 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-2.7 ),rotation = Rotation( 0,-0.35,0) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-3 )}
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-5.15 )}
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-5.05 )}
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-5 )}
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-3.59 )}
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-4.15 )}
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(-0.04, -6, -0.66)}
	
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-14.7,-2.97 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-2.77 ) }
			
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-13.5,-3.25 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,-2.4,-3.55 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-2,-3.1 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( -0.05,-1.6,-2.9 ) }

tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.05, -12, 0.75) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -4.2) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -9.2, -0.5) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -32, -2.3) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( -0.02,-23.3,-2.5 ), rotation = Rotation( 0,-0.5,0) }

tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-3,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-3.3 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-3.3 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -3.2) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -2.7) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -11.1, -1.3) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -3.9) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 2, 0.1) }
	
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-22.4,-3.8 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-0.25 ) }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-3.5 )}		
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-17,-3.48 )}		
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-14.3,-3.2 )}	

	
--Aimpoint PRO (+2)
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2, 0.05 ) }

tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 ) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-26,-4.6 ) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-27,-5.3 ) }
	
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.3,-0.45 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-0.05 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-3.45 ) + Vector3(0, 2, 0),rotation = Rotation( 0,-0.2,0) }

tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -7, -1.1) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-2.7 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-6.25 ) + Vector3(0, 2, 0)}
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( 0,1.6,1.9 ) + Vector3(0, 2, 0)}
	
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-6,-3 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-6,-3 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-6,-3 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_asval = { translation = Vector3( 0,-3.6,-0.01 ) + Vector3(0, 2, 0) }
	
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-0.1 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-2.9 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ) + Vector3(0, 2, 0),rotation = Rotation( 0,0.5,0)  }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-0.25,-3.0 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-18.5, -0.01 ) + Vector3(0, 2, 0) }
	
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0,-8.4, 0 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-17.75,-4 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-9.25,-3.4 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-2.7 ) + Vector3(0, 2, 0),rotation = Rotation( 0,-0.35,0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-3 ) + Vector3(0, 2, 0)}
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-5.15 ) + Vector3(0, 2, 0)}
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-5.05 ) + Vector3(0, 2, 0)}
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-5 ) + Vector3(0, 2, 0)}
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-3.59 ) + Vector3(0, 2, 0)}
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-4.15 ) + Vector3(0, 2, 0)}
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(-0.04, -6, -0.66) + Vector3(0, 2, 0)}
	
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-14.7,-2.97 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-2.77 ) + Vector3(0, 2, 0) }
			
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-13.5,-3.25 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,-2.4,-3.55 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-2,-3.1 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( -0.05,-1.6,-2.9 ) + Vector3(0, 2, 0) }

tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.05, -12, 0.75) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -4.2) + Vector3(0, 2, 0)  }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -9.2, -0.5) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -32, -2.3) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( -0.02,-23.3,-2.5 ) + Vector3(0, 2, 0), rotation = Rotation( 0,-0.5,0) }

tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-3,-3 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-3.3 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-3.3 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -3.2) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -2.7) + Vector3(0, 2, 0)}
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -11.1, -1.3) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -3.9) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 2, 0.1) + Vector3(0, 2, 0) }
	
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-22.4,-3.8 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-0.25 ) + Vector3(0, 2, 0) }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-3.5 ) + Vector3(0, 2, 0)}		
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-17,-3.48 ) + Vector3(0, 2, 0)}		
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-14.3,-3.2 ) + Vector3(0, 2, 0)}	


--Specter Sight (+4)
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2, 0.05 ) + Vector3(0, 4, 0) }

tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-26,-4.6 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-27,-5.3 ) + Vector3(0, 4, 0) }
	
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.3,-0.45 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-0.05 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-3.45 ) + Vector3(0, 4, 0),rotation = Rotation( 0,-0.2,0) }

tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -7, -1.1) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-2.7 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-6.25 ) + Vector3(0, 4, 0)}
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( 0,1.6,1.9 ) + Vector3(0, 4, 0)}
	
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-23.85,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-23.85,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-23.85,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_asval = { translation = Vector3( 0,-3.6,-0.01 ) + Vector3(0, 4, 0) }

tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-0.1 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-2.9 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ) + Vector3(0, 4, 0),rotation = Rotation( 0,0.5,0)  }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-18,-3.0 )}
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-18.5, -0.01 ) + Vector3(0, 4, 0) }
	
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0,-8.4, 0 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-17.75,-4 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-9.25,-3.4 ) + Vector3(0, 4, 0)}
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-2.7 ) + Vector3(0, 4, 0),rotation = Rotation( 0,-0.35,0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-3 ) + Vector3(0, 4, 0)}
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-5.15 ) + Vector3(0, 4, 0)}
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-5.05 ) + Vector3(0, 4, 0)}
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-5 ) + Vector3(0, 4, 0)}
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-3.59 ) + Vector3(0, 4, 0)}
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-4.15 ) + Vector3(0, 4, 0)}
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(-0.04, -6, -0.66) + Vector3(0, 4, 0)}
	
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-14.7,-2.97 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-2.77 ) + Vector3(0, 4, 0) }
			
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-13.5,-3.25 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,-2.4,-3.55 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( -0.05,-1.6,-2.9 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-2,-3.1 ) }

tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.05, -12, 0.75) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -4.2)  + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -9.2, -0.5) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -32, -2.3) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( -0.02,-23.3,-2.5 ) + Vector3(0, 4, 0), rotation = Rotation( 0,-0.5,0) }

tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-20.5,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-3.3 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-3.3 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -3.2) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -2.7) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -11.1, -1.3) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -3.9) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 2, 0.1) + Vector3(0, 4, 0) }
	
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-22.4,-3.8 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-0.25 ) + Vector3(0, 4, 0) }
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-3.5 ) + Vector3(0, 4, 0)}		
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-17,-3.48 ) + Vector3(0, 4, 0)}		
tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-14.3,-3.2 ) + Vector3(0, 4, 0)}	
	
	
--ACOG (+6)
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2, 0.05 ) + Vector3(0, 1, 0)  }

tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 ) + Vector3(0, 1, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-26,-4.6 ) + Vector3(0, 1.1, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-27,-5.3 ) + Vector3(0, 1.1, 0)  }
	
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.3,-0.45 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-0.05 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-3.45 ) + Vector3(0, 6, 0) ,rotation = Rotation( 0,-0.2,0) }

tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -7, -1.1) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-2.7 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-6.25 ) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( 0,1.6,1.9 ) + Vector3(0, 6, 0) }
	
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-22,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-22,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-22,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_asval = { translation = Vector3( 0,-3.6,-0.01 ) + Vector3(0, 6, 0)  }

tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-0.1 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-2.9 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ) + Vector3(0, 6, 0) ,rotation = Rotation( 0,0.5,0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-16,-3.0 ) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-18.5, -0.01 ) + Vector3(0, 6, 0)  }
	
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0,-8.4, 0 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-17.75,-4 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-9.25,-3.4 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-2.7 ) + Vector3(0, 6, 0) ,rotation = Rotation( 0,-0.35,0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-3 ) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-5.15 ) + Vector3(0, 6, 0)}
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-5.05 ) + Vector3(0, 6, 0)}
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-5 ) + Vector3(0, 6, 0)}
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-3.59 ) + Vector3(0, 6, 0)}
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-4.15 ) + Vector3(0, 6, 0)}
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(-0.04, -6, -0.66) + Vector3(0, 6, 0)}
	
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-14.7,-2.97 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-2.77 ) + Vector3(0, 6, 0)  }
			
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-13.5,-3.25 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,-2.4,-3.55 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( -0.05,-1.6,-2.9 ) + Vector3(0, 6, 0)  }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-18,-3.1 ) }

tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.05, -12, 0.75) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -4.2) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -9.2, -0.5) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -32, -2.3) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( -0.02,-23.3,-2.5 ) + Vector3(0, 6, 0), rotation = Rotation( 0,-0.5,0) }

tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-18.7,-3 ) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-3.3 ) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-3.3 ) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -3.2) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -2.7) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -11.1, -1.3) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -3.9) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 2, 0.1) + Vector3(0, 6, 0) }
	
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-22.4,-3.8 ) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-0.25 ) + Vector3(0, 6, 0) }
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-3.5 ) + Vector3(0, 6, 0)}		
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-17,-3.48 ) + Vector3(0, 6, 0)}		
tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-14.3,-3.2 ) + Vector3(0, 6, 0)}	

																		
--45 degree irons
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m4 = { translation = Vector3(-2.8, 10, -10.4),rotation = Rotation(0.85, -1, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m16 = { translation = Vector3(-2.8, 5, -10.4),rotation = Rotation(0.2, 0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3(-1.4, 8, -12.9),rotation = Rotation(0.9, -1, -45) }

tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(-2, 8, -9.7),rotation = Rotation(0.4, -0.4, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_aug = { translation = Vector3(-3.65, 5, -11.7),rotation = Rotation(0.4, -0.4, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_famas = { translation = Vector3(2.4, 2, -17),rotation = Rotation(-0.625, 2.2, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( -4.4, 16, -8 ),rotation = Rotation(0.1 ,0.0, -45)}
	
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_74 = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -1.82,10,-3.45 ),rotation = Rotation(0, -0, -45) }
			
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_amcar = { translation = Vector3(-2.8, 5, -10.4),rotation = Rotation(0.2, 0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g36 = { translation = Vector3(-0.7, 5, -12),rotation = Rotation( 0.45, -0.5, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_s552 = { translation = Vector3(-3.2, 0, -12.6),rotation = Rotation(-0.05 ,0.35, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_olympic = { translation = Vector3(-2.8, 5, -10.4),rotation = Rotation(0.2, 0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45)}
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -4.25,-2, -9 ),rotation = Rotation(0, 0.1, -45)}

tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_m45 = { translation = Vector3(-4.1, 0, -14.65),rotation = Rotation(0.15, -0.1, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3(-4.6, 5, -14.4),rotation = Rotation( 0.35, -0.3, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3(-2.15, 5, -12.75),rotation = Rotation(0.5, -0.5, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3(-1.4, 0, -11),rotation = Rotation( 0, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3(-2.9, 5, -15.4),rotation = Rotation( 0, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3(-2.625, 5, -13.5),rotation = Rotation( 0.125, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_uzi = { translation = Vector3(-2.4, 5, -15.2),rotation = Rotation( 0.15, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_sterling = { translation = Vector3(-4.9, 5, -11.6),rotation = Rotation( 0.0, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( -2.5,-2,-12.5 ),rotation = Rotation( 0.0, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(-3.2, 10, -9.85),rotation = Rotation( -1.85, 1, -45) }

tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_p90 = { translation = Vector3(-0.6, 5, -12.5),rotation = Rotation( -0.7, 0.2, -45)  }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3(-3.9, 5, -13.4),rotation = Rotation( 0.5, -0.5, -45) }

tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_hk21 = {translation = Vector3(-0.625, 0, -13.75),rotation = Rotation(-2, 3, -45)}
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_m249 = {translation = Vector3(-0.65, 0, -13.25),rotation = Rotation(-1.3, 2, -45)}
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_rpk = {translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45)}
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_mg42 = {translation = Vector3(0.6, 15, -11.7),rotation = Rotation(-0, 0, -45)}

tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_m95 = {translation = Vector3(-0.4, -15, -13.25),rotation = Rotation(-0.3, 0, -45)}
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_msr = {translation = Vector3(-2.3, 20, -9.1),rotation = Rotation(0, 0.2, -45)}
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_mosin = {translation = Vector3(-2.44, -2, -12.6),rotation = Rotation(0, 0, -45)}
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_r93 = {translation = Vector3(-2.3, 10, -10.8),rotation = Rotation(0, 0.2, -45)}
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( -5.5,0,-14 ), rotation = Rotation( 0.6,-0.6,-45) }

tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_shot_saiga = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_shot_r870 = { translation = Vector3(-2.55, 10, -13.5),rotation = Rotation(0.5 ,-0.25, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_shot_serbu = { translation = Vector3(-2.55, 10, -13.5),rotation = Rotation(0.5 ,-0.25, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_ben = { translation = Vector3(-3.3, 10, -13.5),rotation = Rotation(0.75 ,-0.75, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_striker = { translation = Vector3(-2.6, 10, -12.9),rotation = Rotation(0.5 ,-0.3, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(-2.4, 6, -8.6),rotation = Rotation(0.28 ,-0.3, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-2.35, 10, -14),rotation = Rotation(0.8 ,-0.8, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 2, 0.1) ,rotation = Rotation(0.8 ,-0.8, -45) } --

tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m14 = { translation = Vector3(-2.15, 0, -13.95),rotation = Rotation(0.3 ,0, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_scar = { translation = Vector3(-1.65, 8, -9.9),rotation = Rotation(0.5, -0.5, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_fal = { translation = Vector3(-2.45, 10, -13.4),rotation = Rotation(0.7 ,-0.75, -45) }
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( -0.7,8,-12.4 ),rotation = Rotation(0.75 ,-0.7, -45)}		
tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_galil = { translation = Vector3( -2.1,5,-13.2 ),rotation = Rotation(0.275 ,-0., -45)}


--Leupold
--{		
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-54.4,-5.59 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_pis_rage = {  translation = Vector3( -0.05,-47.4,-5.48 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.03,-47.4,-6.23 ) }

tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-19,-1.4) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-23,-0.95 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.005,-19,-4.515) }

tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_vhs = { translation = Vector3( 0,-22.5,-2.04 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-22.5,-3.61 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-28.4,-7.1 )}	
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( -0.001,-13.7,1.025 )}

tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.02,-43,-3.87 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_akm = { translation = Vector3( -0.015,-43,-3.88 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( -0.015,-43,-3.88 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -0.0005,-19.2, 5.635 ) }

tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-23.1,-0.95 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( -0.01,-20.5,-3.81 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.0525,-31.25,-3.65 ),rotation = Rotation( 0,0.95,0) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-34,-0.875 ) }

tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-23,-0.95 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_akmsu = {  translation = Vector3( -0.022,-38,-3.85 ) }

tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( -0.005,-33.5,-4.775 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( -0.005,-25,-4.325 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( -0.005,-23,-3.63 ),rotation = Rotation( 0,-0.35,0) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( -0.01,-38.25,-3.865 )}
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_scorpion= { translation = Vector3( 0.001,-32.7,-6.04 )}
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0.005,-27.9,-5.852 )}
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0.003,-27.2,-5.94 )}
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0.001,-38.8,-4.46 )}
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0.001,-44,-5.057 )}
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_polymer = { translation = Vector3( -0.0325,-21.25,-1.5325 )}
					
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0.03,-30.75,-3.87 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-24.75,-3.67 ) }
			
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0.02,-30,-4.16 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.04,-18,-4.45 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.03,-40,-3.99 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( -0.0525,-17,-3.805 ) }

tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0.005, -48, -3.174) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -20.75, -1.385) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.0325, -27.5, -0.125) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0.01, -25, -1.41) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0.0, -51.8, -5.125) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_winchester = { translation = Vector3(0.0, -39, -3.868) }

tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( -0.022,-41,-3.875 ) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-27,-4.125) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-26.5,-4.115) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0.025, -22.55, -4.065) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -26.75, -3.615) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -27.5, -2.175) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.155, -20.5, -4.79) }

tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_m14 = { translation = Vector3(0.055, -39, -4.65) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_scar = { translation = Vector3(0.025, -22, -1.15) }
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_fal = { translation = Vector3( -0.02,-16,-4.36 )}
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-32.1,-4.375 )}		
tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-30,-4.06 )}

--}
		
		
--Schmidt & Bender 1-8x24 PM Short Dot (default sniper attachment)
--{
tweak_factory.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -17.75, -1.28) }
tweak_factory.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0.01, -22.1, -1.3) }
tweak_factory.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -45.25, -3.07)}
tweak_factory.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0.0, -49.25, -5.025) }
tweak_factory.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.035, -23, -0.0175) }
--}

--C96 Scope (same as above but shrunken)
--{
tweak_factory.parts.wpn_fps_pis_c96_sight.stance_mod = {
	wpn_fps_pis_c96 = {translation = Vector3(-3.41, -37.75, 0.93)},
	--wpn_fps_pis_c96 = {translation = Vector3(-3.41, -18.75, 0.93)},
	
	wpn_fps_pis_deagle = { translation = Vector3( 0,-49.4,-5.47 ) },
	wpn_fps_pis_rage = {  translation = Vector3( -0.055,-41.4,-5.387 ) },
	wpn_fps_pis_judge  = { translation = Vector3( -0.03,-42.4,-6.13 ) },
	
	wpn_fps_ass_m4 = { translation = Vector3( 0,-14,-1.305) },
	wpn_fps_ass_m16 = { translation = Vector3( 0.0025,-18, -0.85 ) },
	wpn_fps_ass_ak5 = { translation = Vector3( -0.005,-14,-4.375) },
	
	wpn_fps_ass_vhs = { translation = Vector3( -0.001, -19.8, -1.925 ) },
	wpn_fps_ass_aug = { translation = Vector3( 0,-17.5,-3.51 ) },
	wpn_fps_ass_famas = { translation = Vector3( 0,-23.6,-7 )},	
	wpn_fps_ass_l85a2  = { translation = Vector3( -0.0,-9.0,1.13 ) },
	
	wpn_fps_ass_amcar = { translation = Vector3( 0.0025,-18.1, -0.85 ) },
	wpn_fps_ass_g36 = { translation = Vector3( -0.01,-16,-3.71 ) },
	wpn_fps_ass_s552 = { translation = Vector3( -0.0525,-26,-3.49),rotation = Rotation( 0,0.95,0) },
	wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-30,1.035 )  },
	
	wpn_fps_smg_olympic = { translation = Vector3( 0.0025,-18, -0.85 ) },
	wpn_fps_smg_akmsu = {  translation = Vector3( -0.022,-32,-3.75 ) },
	
	wpn_fps_ass_74 = { translation = Vector3( -0.02,-38,-3.77 ) },
	wpn_fps_ass_akm = { translation = Vector3( -0.015,-38,-3.78 ) },
	wpn_fps_ass_akm_gold = { translation = Vector3( -0.015,-38,-3.78 ) },
	wpn_fps_ass_asval = { translation = Vector3( -0.0005,-15, -0.755 )},
	
	wpn_fps_smg_m45 = { translation = Vector3( -0.005,-27.5,-4.675 ) },
	wpn_fps_smg_mp9 = { translation = Vector3( -0.005,-20,-4.225 ) },
	wpn_fps_smg_mp5 = { translation = Vector3( -0.005,-17,-3.53 ),rotation = Rotation( 0,-0.35,0) },
	wpn_fps_smg_mac10 = { translation = Vector3( -0.01,-32.25,-3.765 )},
	wpn_fps_smg_scorpion= { translation = Vector3( 0.001,-27.5,-5.94 )},
	wpn_fps_smg_tec9 = { translation = Vector3( 0.001,-22.9,-5.745 )},
	wpn_fps_smg_uzi = { translation = Vector3( 0.001,-22.2,-5.835 )},
	wpn_fps_smg_sterling = { translation = Vector3( 0.001,-34.9,-4.35 )},
	wpn_fps_smg_thompson = { translation = Vector3( 0.001,-39,-4.95 )},
	wpn_fps_smg_polymer = { translation = Vector3( -0.0325,-17,-1.435 )},
			
	wpn_fps_smg_p90 = { translation = Vector3( 0.03,-24.75,-3.77 ) },
	wpn_fps_smg_mp7 = { translation = Vector3( 0,-18.75,-3.57 ) },
			
	wpn_fps_lmg_hk21 = { translation = Vector3( 0.02,-24.5,-4.05 ) },
	wpn_fps_lmg_m249 = { translation = Vector3( -0.04,-13,-4.33 ) },
	wpn_fps_lmg_rpk = { translation = Vector3( 0.03,-35,-3.87 ) },
	wpn_fps_lmg_mg42 = { translation = Vector3( -0.05,-10,-3.69 ) },
	
	wpn_fps_shot_saiga = { translation = Vector3( -0.022,-35,-3.775 ) },
	wpn_fps_shot_r870 = { translation = Vector3( 0,-22,-4.015) },
	wpn_fps_shot_serbu = { translation = Vector3( 0,-21.5,-4.015) },
	wpn_fps_sho_ben = { translation = Vector3(0.025, -16.55, -3.965) },
	wpn_fps_sho_striker = { translation = Vector3(0, -20.75, -3.515) },
	wpn_fps_sho_ksg = { translation = Vector3(0, -21.5, -2.075) },
	wpn_fps_sho_spas12 = { translation = Vector3(-0.1575, -16.75, -4.685) },
	
	wpn_fps_ass_m14 = { translation = Vector3(0.055, -33, -4.55) },
	wpn_fps_ass_scar = { translation = Vector3(0.025, -17, -1.05) },
	wpn_fps_ass_fal = { translation = Vector3( -0.02,-11,-4.26 )},	
	wpn_fps_ass_g3 = { translation = Vector3( 0,-28.8,-4.2625 )},		
	wpn_fps_ass_galil = { translation = Vector3( 0,-25.,-3.962 )},
	
	wpn_fps_snp_winchester = { translation = Vector3( 0,-36,-3.72 )},
	
	}
--}
	
if DMCWO.sig_rear_iron == true then
	tweak_factory.parts.wpn_fps_ass_s552_o_flipup.unit = "units/payday2/weapons/wpn_fps_upg_o_marksmansight/wpn_upg_o_marksmansight_rear"

	pivot_shoulder_translation = Vector3(10.6642, 22.0789, -3.95194)
	pivot_shoulder_rotation = Rotation(0.106285, 0.18453, 0.630167)
	pivot_head_translation = Vector3(-0.085, 19, 0.6)
	pivot_head_rotation = Rotation(-0.1, -0.65, 0)
	tweak_data.player.stances.s552.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances.s552.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	
	--Leupold
	tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.02,-31.25,-3.975 ),rotation = Rotation( 0,0.95,0) }
	--EOTech
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-15.4,-3.1 ), rotation = Rotation( 0,0.95,0) }
	--Aimpoint
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-15.4,-3.1 ) + Vector3(0, 2, 0), rotation = Rotation( 0,0.95,0) }
	--Specter Sight (ELCAN Specter DR) (+4)
	tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-15.4,-3.1 ) + Vector3(0, 4, 0), rotation = Rotation( 0,0.5,0) }
	--ACOG 
	tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-15.25,-3.1 ) + Vector3(0, 6, 0), rotation = Rotation( 0,0.95,0) }
	--45 degree irons
	tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_s552 = { translation = Vector3(-3.1, 0, -13.4),rotation = Rotation(-0.5, 1, -45) }
	--Extra Zoom
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-15.4,-3.1 ) + Vector3( 0,0,-3.15), rotation = Rotation( 0,0.95,0) }
	--Shortdot
	tweak_factory.parts.wpn_fps_pis_c96_sight.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( 0.0,-26,-3.87 ),rotation = Rotation( 0,0.95,0) }
else
	tweak_factory.parts.wpn_fps_ass_s552_o_flipup.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_o_flipup"

	pivot_shoulder_translation = Vector3(10.6642, 22.0789, -3.95194)
	pivot_shoulder_rotation = Rotation(0.106285, 0.18453, 0.630167)
	pivot_head_translation = Vector3(0, 19, 0)
	pivot_head_rotation = Rotation(0, 0, 0)
	tweak_data.player.stances.s552.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances.s552.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Leupold
	tweak_factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.0525,-31.25,-3.65 ),rotation = Rotation( 0,0.95,0) }
	--EOTech
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-15.4,-2.4 ), rotation = Rotation( 0,0.5,0) }
	--Aimpoint
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-15.4,-2.4 ) + Vector3(0, 2, 0), rotation = Rotation( 0,0.5,0) }
	--Specter Sight (ELCAN Specter DR) (+4)
	tweak_factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-15.4,-2.4 ) + Vector3(0, 4, 0), rotation = Rotation( 0,0.95,0) }
	--ACOG 
	tweak_factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ) + Vector3(0, 6, 0), rotation = Rotation( 0,0.5,0) }
	--45 degree irons
	tweak_factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_s552 = { translation = Vector3(-3.2, 0, -12.6),rotation = Rotation(-0.05 ,0.35, -45) }
	--Extra Zoom
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-15.4,-2.4 ) + Vector3( 0,0,-3.15),rotation = Rotation( 0,0.5,0) }
	--Shortdot
	tweak_factory.parts.wpn_fps_pis_c96_sight.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.0525,-26,-3.49),rotation = Rotation( 0,0.95,0) }
	
end
	
if DMCWO.ak_optics == true then
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.025,-23,-3 ) + Vector3( 0,0,-3.15) }
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-23,-3 ) + Vector3( 0,0,-3.15) }
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-20,-3 ) + Vector3( 0,0,-3.15) }
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-15.25,-3.0 ) + Vector3( 0,0,-3.15) }	
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-20,-3.1 ) + Vector3( -0.06,0,-3.15) }
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-23,-3 ) + Vector3( 0,0,-3.15) }
	
	--Aimpoint PRO (+4)
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.025,-27.75,-2.95 ) + Vector3( 0, 2, 0 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-27.85,-3 ) + Vector3( 0, 2, 0 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-24.6,-3 ) + Vector3( 0, 2, 0 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-22.2,-3.0 ) + Vector3( 0, 2, 0 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-23.8,-3.1 ) + Vector3( 0, 2, 0 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-27.85,-3 ) + Vector3( 0, 2, 0 )}

	--EOTech (base)
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.025,-27.75,-2.95 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-27.85,-3 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-24.6,-3 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-22.2,-3.0 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-23.8,-3.1 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-27.85,-3 ) }
else
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-1,-3 ) + Vector3( 0,-10,-3.15)  }
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-1,-3 ) + Vector3( 0,-10,-3.15)  }
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,1,-3 ) + Vector3( 0,-10,-3.15)  }
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,7.25,-3.0 ) + Vector3( 0,-10,-3.15)  }
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,2,-3.1 ) + Vector3( -0.06,-10,-3.15)  }
	tweak_factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-1,-3 ) + Vector3( 0,-10,-3.15)  }
	
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-1,-3 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-1,-3 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,1,-3 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,7.25,-3.0 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,2,-3.1 ) }
	tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-1,-3 ) }

	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-6,-3 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-6,-3 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-3,-3 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-0.25,-3.0 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-2,-3.1 ) }
	tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-6,-3 ) }
end

--Specter Sight (ELCAN Specter DR)
tweak_factory.parts.wpn_fps_upg_o_specter.stats = { value = 8, zoom = 6, recoil = 1, spread_moving = -3, concealment = -3 }
tweak_factory.parts.wpn_fps_upg_o_specter.custom_stats = { ads_speed_mult = 0.95 }

--Military Red Dot (Aimpoint PRO)
tweak_factory.parts.wpn_fps_upg_o_aimpoint.stats = { value = 8, zoom = 4, recoil = 0, spread_moving = -3, concealment = -3 }
tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back" }

--EOTech
tweak_factory.parts.wpn_fps_upg_o_eotech.stats = { value = 3, zoom = 3, recoil = 0, spread_moving = -2, concealment = -2 }
tweak_factory.parts.wpn_fps_upg_o_eotech.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )
tweak_factory.parts.wpn_fps_upg_o_eotech.stance_mod = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--ACOG
tweak_factory.parts.wpn_fps_upg_o_acog.custom_stats = { ads_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_upg_o_acog.stats = { value = 6, zoom = 6, recoil = 1, spread_moving = -1, concealment = -3 }
tweak_factory.parts.wpn_fps_upg_o_acog.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )

--Military Red Dot CCE (Aimpoint PRO)
tweak_factory.parts.wpn_fps_upg_o_aimpoint_2.stats = { value = 1, zoom = 4, recoil = 0, spread_moving = -3, concealment = -3 }
tweak_factory.parts.wpn_fps_upg_o_aimpoint_2.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )
tweak_factory.parts.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--EOTech XPS
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stats = { value = 5, zoom = 3, recoil = 0, spread_moving = -3, concealment = -2 }
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )

--Aimpoint CS
tweak_factory.parts.wpn_fps_upg_o_cs.stats = { value = 5, zoom = 4, recoil = 0, spread_moving = -3, concealment = -1 }
tweak_factory.parts.wpn_fps_upg_o_cs.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )
tweak_factory.parts.wpn_fps_upg_o_cs.stance_mod = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--RX01
tweak_factory.parts.wpn_fps_upg_o_rx01.stats = { value = 5, zoom = 3, recoil = 0, spread_moving = -3, concealment = -1 }
tweak_factory.parts.wpn_fps_upg_o_rx01.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )
tweak_factory.parts.wpn_fps_upg_o_rx01.stance_mod = deep_clone( tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod )

--Docter
tweak_factory.parts.wpn_fps_upg_o_docter.stats = { value = 5, zoom = 2, recoil = 0, spread_moving = -1, concealment = -1 }
tweak_factory.parts.wpn_fps_upg_o_docter.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )
tweak_factory.parts.wpn_fps_upg_o_docter.stance_mod = deep_clone( tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod )

--Micro T1
tweak_factory.parts.wpn_fps_upg_o_t1micro.stats = { value = 3, zoom = 2, recoil = 0, spread_moving = -1, concealment = -1 }
tweak_factory.parts.wpn_fps_upg_o_t1micro.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )
tweak_factory.parts.wpn_fps_upg_o_t1micro.stance_mod = deep_clone( tweak_factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod )

--CMORE
tweak_factory.parts.wpn_fps_upg_o_cmore.stats = { value = 5, zoom = 2, recoil = 0, spread_moving = -1, concealment = -1 }
tweak_factory.parts.wpn_fps_upg_o_cmore.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )
tweak_factory.parts.wpn_fps_upg_o_cmore.stance_mod = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--RX30
tweak_factory.parts.wpn_fps_upg_o_rx30.stats = { value = 5, zoom = 3, recoil = 0, spread_moving = -3, concealment = -2 }
tweak_factory.parts.wpn_fps_upg_o_rx30.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )
tweak_factory.parts.wpn_fps_upg_o_rx30.stance_mod = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--Reflex
tweak_factory.parts.wpn_fps_upg_o_reflex.stats = { value = 5, zoom = 2, recoil = 0, spread_moving = -3, concealment = -1 }
tweak_factory.parts.wpn_fps_upg_o_reflex.forbids = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.forbids )
tweak_factory.parts.wpn_fps_upg_o_reflex.stance_mod = deep_clone( tweak_factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

tweak_factory.parts.wpn_fps_snp_mosin_iron_sight.custom_stats = { ads_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_snp_mosin_iron_sight.stats = { recoil = -1,	concealment = 2 }

--Marksman Sights (Pistols)
tweak_factory.parts.wpn_upg_o_marksmansight_rear.stats = { value = 1, recoil = 0, zoom = 0}
tweak_factory.parts.wpn_upg_o_marksmansight_rear.stance_mod = {}
tweak_factory.parts.wpn_upg_o_marksmansight_rear.stance_mod.wpn_fps_pis_beretta = { rotation = Rotation(0,-0.4,0) }

--RMR Red Dot (Pistols)
tweak_factory.parts.wpn_fps_upg_o_rmr.stats = { value = 1, concealment = -1, recoil = 0, zoom = 1}
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_1911 = { translation = Vector3(0, -22, -0.375) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_beretta = { translation = Vector3(0, -17, -0.5) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_deagle = { translation = Vector3(0, -17, -0.6) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g17 = { translation = Vector3(0, -18, -0.75) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g18c = { translation = Vector3(0, -18, -0.45) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_usp = { translation = Vector3(0, -20, -0.1) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_ppk = { translation = Vector3(0, -17, -0.95) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_p226 = { translation = Vector3(0, -18, -0.525) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g22c = { translation = Vector3(0, -18, -0.70) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g26 = { translation = Vector3(0, -18, -0.55) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_c96 = { translation = Vector3(0, -11, -1.1) }
tweak_factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_hs2000 = { translation = Vector3(0, -18, -0.75) }
tweak_factory.parts.wpn_fps_pis_hs2000_sl_long.override = {
	wpn_fps_upg_o_rmr = { stance_mod = { wpn_fps_pis_hs2000 = {translation = Vector3(0, -18, -0.5)}	}
	}
}
		

--Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS (Theia)
tweak_factory.parts.wpn_fps_upg_o_leupold.stats = {value = 8, zoom = 10, recoil = 2, concealment = -3}
tweak_factory.parts.wpn_fps_upg_o_leupold.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight", "wpn_fps_ass_m16_os_frontsight", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back","wpn_fps_ass_sub2000_o_front" }
tweak_factory.parts.wpn_fps_upg_o_leupold.custom_stats = { ads_speed_mult = 0.90 }

--ShortDot
tweak_factory.parts.wpn_fps_upg_o_shortdot.stats = { value = 1, zoom = 8}
tweak_factory.parts.wpn_fps_upg_o_shortdot.custom_stats = { ads_speed_mult = 0.925 }
tweak_factory.parts.wpn_fps_pis_c96_sight.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_shortdot/wpn_fps_upg_o_shortdot"
tweak_factory.parts.wpn_fps_pis_c96_sight.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_shortdot/wpn_third_upg_o_shortdot"
tweak_factory.parts.wpn_fps_pis_c96_sight.custom_stats = { ads_speed_mult = 0.925 }
tweak_factory.parts.wpn_fps_pis_c96_sight.stats = { value = 1, zoom = 8, recoil = 1, concealment = -2}
tweak_factory.parts.wpn_fps_pis_c96_sight.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back" }

--45 deg. irons
tweak_factory.parts.wpn_fps_upg_o_45iron.stats = {value = 1, gadget_zoom = 1}

--MBUS
tweak_factory.parts.wpn_fps_upg_o_mbus_rear.forbids = {"wpn_fps_upg_o_ak_scopemount"}
tweak_factory.parts.wpn_fps_upg_o_mbus_rear.stance_mod = {
	wpn_fps_sho_striker = { translation = Vector3(0, -6.75, -2.7), rotation = Rotation(0,0.3,0)  },
	wpn_fps_sho_ksg = { translation = Vector3(0, -3.5, -1.3), rotation = Rotation(0,0.3,0) },		
	wpn_fps_shot_saiga = { translation = Vector3(0, -3.5, -3), rotation = Rotation(0,0.3,0) },	
	wpn_fps_smg_p90 = { translation = Vector3(0, -3.5, -3), rotation = Rotation(0,0.3,0) },	
	wpn_fps_ass_aug = { translation = Vector3(0, -3.5, -2.7), rotation = Rotation(0,0.3,0) }		
	}
		
tweak_factory.parts.wpn_fps_extra_zoom.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_45iron/wpn_fps_upg_o_45iron"
tweak_factory.parts.wpn_fps_extra_zoom.type = "gadget"
tweak_factory.parts.wpn_fps_extra_zoom.sub_type = "second_sight"
tweak_factory.parts.wpn_fps_extra_zoom.a_obj = "ayy_lmao"
tweak_factory.parts.wpn_fps_extra_zoom.stats = {value = 1, gadget_zoom = 1}

--Whinchester Scope
tweak_factory.parts.wpn_fps_upg_winchester_o_classic.stance_mod.wpn_fps_snp_winchester = { translation = Vector3(-0.0, -33, -1.412) }
tweak_factory.parts.wpn_fps_upg_winchester_o_classic.custom_stats = { ads_speed_mult = 0.90 }
--}		
			
			
------------------[[MAGAZINES]]------------------{
--30 rounder (AMCAR, AMR-16, Para SMG)
tweak_factory.parts.wpn_fps_m4_uupg_m_std.stats = { value = 1, concealment = -1, extra_ammo = 10, total_ammo_mod = 0}

--20 rounder (CAR-4, AK5)
tweak_factory.parts.wpn_fps_upg_m4_m_straight_vanilla.custom_stats = {reload_speed_mult = 1.15}
tweak_factory.parts.wpn_fps_upg_m4_m_straight.custom_stats = {reload_speed_mult = 1.15}
tweak_factory.parts.wpn_fps_upg_m4_m_straight.stats = { value = 2, concealment = 1, extra_ammo = -10, total_ammo_mod = 0 }

--Beta C Mag
tweak_factory.parts.wpn_fps_upg_m4_m_drum.custom_stats = { reload_speed_mult = 0.85 }
tweak_factory.parts.wpn_fps_upg_m4_m_drum.stats = { value = 9, extra_ammo = 70, recoil = 1, concealment = -5, total_ammo_mod = 0 }

--STANAG Quad Stack 
tweak_factory.parts.wpn_fps_upg_m4_m_quad.custom_stats = { reload_speed_mult = 0.9 }
tweak_factory.parts.wpn_fps_upg_m4_m_quad.stats = { value = 1, concealment = -2, recoil = 0, spread = 0, extra_ammo = 30, total_ammo_mod = 0}

--AK Quad Stack 
tweak_factory.parts.wpn_fps_upg_ak_m_uspalm.custom_stats = { reload_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_upg_ak_m_uspalm.stats = { value = 1, concealment = 1, recoil = -1, spread = 0, extra_ammo = 0 }

--AK Quad Stack 
tweak_factory.parts.wpn_fps_upg_ak_m_quad.custom_stats = { reload_speed_mult = 0.9 }
tweak_factory.parts.wpn_fps_upg_ak_m_quad.stats = { value = 1, concealment = -3, recoil = 0, spread = 0, extra_ammo = 30 }

--PMAG
tweak_factory.parts.wpn_fps_upg_m4_m_pmag.custom_stats = { reload_speed_mult = 1.05 }
tweak_factory.parts.wpn_fps_upg_m4_m_pmag.stats = { value = 3, extra_ammo = 1, total_ammo_mod = 0}

--EMAG
tweak_factory.parts.wpn_fps_ass_l85a2_m_emag.stats = { value = 1, extra_ammo = 0, recoil = 0, total_ammo_mod = 40, spread = -2}
tweak_factory.parts.wpn_fps_ass_l85a2_m_emag.custom_stats = { reload_speed_mult = 0.88 }

--L5
tweak_factory.parts.wpn_fps_upg_m4_m_l5.stats = { value = 1, extra_ammo = 0, recoil = 1, total_ammo_mod = 0, spread = -0}

--FAL 30 Round Mag
tweak_factory.parts.wpn_fps_ass_fal_m_01.custom_stats = { reload_speed_mult = 0.9 }
tweak_factory.parts.wpn_fps_ass_fal_m_01.stats = { value = 3, extra_ammo = 10, concealment = -2 }

--R870 Tube extension
tweak_factory.parts.wpn_fps_shot_r870_m_extended.stats = { value = 6, concealment = -1, spread_moving = -1, extra_ammo = 2 }

--Loco Tube extension
tweak_factory.parts.wpn_fps_shot_shorty_m_extended_short.stats = { value = 1, extra_ammo = 1 }
tweak_factory.parts.wpn_fps_shot_shorty_m_extended_short.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
tweak_factory.parts.wpn_fps_shot_shorty_m_extended_short.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"

--Saiga 20 Round Drum
tweak_factory.parts.wpn_upg_saiga_m_20rnd.stats = { value = 1, extra_ammo = 15 }
tweak_factory.parts.wpn_upg_saiga_m_20rnd.custom_stats = { reload_speed_mult = 0.85 }

--MP7 40 rounder
tweak_factory.parts.wpn_fps_smg_mp7_m_extended.custom_stats = { reload_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_smg_mp7_m_extended.stats = {  value = 1, concealment = -3, extra_ammo = 20 }

--MP5 GSG-5 Mag
tweak_factory.parts.wpn_fps_smg_mp5_m_drum.stats = { value = 1, extra_ammo = 80, damage = -4, recoil = 8 }
tweak_factory.parts.wpn_fps_smg_mp5_m_drum.custom_stats = { reload_speed_mult = 0.85, damage_near_mul = 0.85, damage_far_mul = 0.85 }
--MP5 10mm Mag 
tweak_factory.parts.wpn_fps_smg_mp5_m_straight.stats = { value = 1, extra_ammo = 0, damage = 3, recoil = -6, total_ammo_mod = -40 }
tweak_factory.parts.wpn_fps_smg_mp5_m_straight.custom_stats = { reload_speed_mult = 0.95 }

--MP9 30 rounder
tweak_factory.parts.wpn_fps_smg_mp9_m_extended.custom_stats = { reload_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_smg_mp9_m_extended.stats = { value = 4, concealment = -2, extra_ammo = 10 }

--M10 30 rounder
tweak_factory.parts.wpn_fps_smg_mac10_m_extended.custom_stats = { reload_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_smg_mac10_m_extended.stats = { value = 2, spread_moving = -2, recoil = 0, concealment = -2, extra_ammo = 10 }

--1911 12 rounder
tweak_factory.parts.wpn_fps_pis_1911_m_extended.stats = { value = 3, spread_moving = -2, concealment = -1, extra_ammo = 4 }

--USP 20 rounder
tweak_factory.parts.wpn_fps_pis_usp_m_extended.custom_stats = { reload_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_pis_usp_m_extended.stats = { value = 2, spread_moving = -1, concealment = -1, extra_ammo = 8 }

--Glock 33 rounder
tweak_factory.parts.wpn_fps_pis_g18c_m_mag_33rnd.custom_stats = { reload_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats = { value = 6, spread_moving = -3, extra_ammo = 16, concealment = -2, recoil = 0 }

--P226 22 rounder
tweak_factory.parts.wpn_fps_pis_p226_m_extended.custom_stats = { reload_speed_mult = 0.90 }
tweak_factory.parts.wpn_fps_pis_p226_m_extended.stats = { value = 1, extra_ammo = 6, spread_moving = -2 }

--Beretta 30 rounder 
tweak_factory.parts.wpn_fps_pis_beretta_m_extended.custom_stats = { reload_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_pis_beretta_m_extended.stats = { value = 2, spread_moving = -2, concealment = -2, extra_ammo = 15 }

--M45 50 rounder
tweak_factory.parts.wpn_fps_smg_m45_m_extended.custom_stats = { reload_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_smg_m45_m_extended.stats = { value = 4, concealment = -2, extra_ammo = 14, recoil = 2 }

--Skorpion Dual Mags
tweak_factory.parts.wpn_fps_smg_scorpion_m_extended.custom_stats = { reload_speed_mult = 1.2 }
tweak_factory.parts.wpn_fps_smg_scorpion_m_extended.stats = { value = 1, concealment = -3, recoil = 1, total_ammo_mod = 57}

--TEC-9 50rnd Mag
tweak_factory.parts.wpn_fps_smg_tec9_m_extended.custom_stats = { reload_speed_mult = 0.9 }
tweak_factory.parts.wpn_fps_smg_tec9_m_extended.stats = { value = 4, extra_ammo = 18, recoil = 0, concealment = -2}

--G26 Stippled Mag
tweak_factory.parts.wpn_fps_pis_g26_m_contour.custom_stats = { reload_speed_mult = 1.15 }
tweak_factory.parts.wpn_fps_pis_g26_m_contour.stats = { value = 6, recoil = 2, spread = 0, concealment = -1, damage = 0	}

--AK Drum Mag
tweak_factory.parts.wpn_upg_ak_m_drum.custom_stats = { reload_speed_mult = 0.85 }
tweak_factory.parts.wpn_upg_ak_m_drum.stats = { value = 5, concealment = -4, extra_ammo = 45}

--Sterling 34rnd Mag
tweak_factory.parts.wpn_fps_smg_sterling_m_long.custom_stats = { reload_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_smg_sterling_m_long.stats = {
			value = 1,
			extra_ammo = 14,
			concealment = -2
		}
--Sterling 10rnd Mag
tweak_factory.parts.wpn_fps_smg_sterling_m_short.custom_stats = { reload_speed_mult = 1.2}
tweak_factory.parts.wpn_fps_smg_sterling_m_short.stats = {
			value = 1,
			extra_ammo = -10,
			concealment = 2
		}
--C96 20rnd Mag
tweak_factory.parts.wpn_fps_pis_c96_m_extended.stats = {
			value = 1,
			concealment = -2,
			extra_ammo = 10
		}
	
--XD-40 Extended Mag
tweak_factory.parts.wpn_fps_pis_hs2000_m_extended.custom_stats = { reload_speed_mult = 0.95 }
tweak_factory.parts.wpn_fps_pis_hs2000_m_extended.stats = { value = 1, extra_ammo = 6}

--AA-12 Drum
tweak_factory.parts.wpn_fps_sho_aa12_mag_drum.custom_stats = { reload_speed_mult = 0.85 }
tweak_factory.parts.wpn_fps_sho_aa12_mag_drum.stats = { value = 1, extra_ammo = 12, concealment = -4 }

--Rare (The proper way to eat steak)
tweak_factory.parts.wpn_fps_fla_mk2_mag_rare.stats = {
	value = 1,
	total_ammo_mod = 25,
	damage = -2
}
--Well Done (Gross)
tweak_factory.parts.wpn_fps_fla_mk2_mag_welldone.stats = {
	value = 1,
	total_ammo_mod = -25,
	damage = 2
}
--}


------------------[[AMMO]]------------------{

tweak_factory.parts.wpn_fps_upg_a_bow_explosion.stats = {damage = 13, spread = -5, total_ammo_mod = -50}
tweak_factory.parts.wpn_fps_upg_a_bow_poison.stats = {damage = -26, total_ammo_mod = -50}

tweak_factory.parts.wpn_fps_bow_long_m_explosive.stats = {damage = 4, spread = -4, total_ammo_mod = -50}
tweak_factory.parts.wpn_fps_bow_long_m_poison.stats = {damage = -8, total_ammo_mod = -50}

tweak_factory.parts.wpn_fps_upg_a_crossbow_explosion.stats = {damage = 20, recoil = -5, spread = -2, total_ammo_mod = -50}
tweak_factory.parts.wpn_fps_upg_a_crossbow_poison.stats = {damage = -27, total_ammo_mod = -50}

tweak_factory.parts.wpn_fps_bow_arblast_m_explosive.stats = {damage = 1, recoil = -12, spread = -2, total_ammo_mod = -50}
tweak_factory.parts.wpn_fps_bow_arblast_m_poison.stats = {damage = -16, total_ammo_mod = -50}

tweak_factory.parts.wpn_fps_bow_frankish_m_explosive.stats = {damage = 3, recoil = -7, spread = -2, total_ammo_mod = -50}
tweak_factory.parts.wpn_fps_bow_frankish_m_poison.stats = {damage = -6, total_ammo_mod = -50}

tweak_factory.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats = {damage = -30}

tweak_factory.parts.wpn_fps_upg_a_slug.stats = { value = 5, total_ammo_mod = -50, damage = -2, spread = 50, moving_spread = -5, recoil = -12 }
tweak_factory.parts.wpn_fps_upg_a_slug.custom_stats = { damage_far_mul = 2.5, rays = 1, armor_piercing_add = 1, can_shoot_through_enemy = true, can_shoot_through_shield = true, can_shoot_through_wall = true, ammo_pickup_min_mul = 0.75, ammo_pickup_max_mul = 0.75, damage_near_mul = 1, hipfire_mod = 5 }

tweak_factory.parts.wpn_fps_upg_a_custom.stats = { value = 5, total_ammo_mod = 0, damage = 10, spread = -4, recoil = -3 }
tweak_factory.parts.wpn_fps_upg_a_custom.custom_stats = { rays = 6, ammo_pickup_min_mul = 0.85, ammo_pickup_max_mul = 0.85, damage_near_mul = 1.20, damage_far_mul = 0.65, armor_piercing_add = 0.1}

tweak_factory.parts.wpn_fps_upg_a_explosive.stats = { value = 5, total_ammo_mod = -50, damage = 4, spread = 40, moving_spread = 6, suppression = -110, recoil = -6 }
tweak_factory.parts.wpn_fps_upg_a_explosive.custom_stats = { ignore_statistic = true, rays = 1, damage_far_mul = 2.5, bullet_class = "InstantExplosiveBulletBase", ammo_pickup_min_mul = 0.6, ammo_pickup_max_mul = 0.6, hipfire_mod = 4 }

tweak_factory.parts.wpn_fps_upg_a_piercing.stats = { value = 5, damage = -4, spread = 10, recoil = 2 }
tweak_factory.parts.wpn_fps_upg_a_piercing.custom_stats = { rays = 15, damage_near_mul = 1.4, armor_piercing_add = 1, ammo_pickup_min_mul = 0.95, ammo_pickup_max_mul = 0.95 }

tweak_factory.wpn_fps_shot_serbu.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -50, damage = -14, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}

tweak_factory.wpn_fps_shot_r870.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -50, damage = -20, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}

tweak_factory.wpn_fps_shot_b682.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -50, damage = -24, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}

tweak_factory.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -50, damage = -24, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}

tweak_factory.wpn_fps_sho_ksg.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -50, damage = -14, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}

tweak_factory.wpn_fps_sho_ben.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -50, damage = -8, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}

tweak_factory.wpn_fps_sho_spas12.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -50, damage = -14, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}

tweak_factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_piercing = {
	desc_id = "bm_wp_upg_a_piercing_judge",
	custom_stats = { rays = 10, damage_near_mul = 1.4, armor_piercing_add = 1, ammo_pickup_min_mul = 1.0, ammo_pickup_max_mul = 1.025}
}

tweak_factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom = { 
	desc_id = "bm_wp_upg_a_custom_judge",
	custom_stats = { rays = 4, ammo_pickup_min_mul = 0.95, ammo_pickup_max_mul = 1, damage_far_mul = 0.65, damage_near_mul = 1.20, armor_piercing_add = 0.1}
}
tweak_factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -50, damage = -24, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}

tweak_factory.parts.wpn_fps_upg_a_dragons_breath.stats = {
			value = 5,
			total_ammo_mod = -50,
			damage = -0,
			spread = -2,
			recoil = 4
		}
tweak_factory.parts.wpn_fps_upg_a_dragons_breath.custom_stats = {
			ignore_statistic = true,
			rays = 8,
			ammo_pickup_min_mul = 0.65,
			ammo_pickup_max_mul = 0.7,
			bullet_class = "FlameBulletBase",
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
			fire_dot_data = {
				dot_damage = 2,
				dot_trigger_max_distance = 3000,
				dot_trigger_chance = 50,
				dot_length = 3,
				dot_tick_period = 0.5
			},
			is_tracer = true
		}

tweak_factory.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath = { desc_id = "bm_wp_upg_a_dragons_breath_auto", 
	custom_stats = {
		ignore_statistic = true,
		rays = 8,
		ammo_pickup_min_mul = 0.65,
		ammo_pickup_max_mul = 0.7,
		bullet_class = "FlameBulletBase",
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
		fire_dot_data = {
			dot_damage = 2,
			dot_trigger_max_distance = 3000,
			dot_trigger_chance = 50,
			dot_length = 3,
			dot_tick_period = 0.5
		},
		is_tracer = true,
		rof_mult = 0.9
	}
}
tweak_factory.wpn_fps_sho_ben.override.wpn_fps_upg_a_dragons_breath = deep_clone(tweak_factory.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath)
tweak_factory.wpn_fps_shot_saiga.override.wpn_fps_upg_a_dragons_breath = deep_clone(tweak_factory.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath)
tweak_factory.wpn_fps_sho_aa12.override.wpn_fps_upg_a_dragons_breath = deep_clone(tweak_factory.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath)


tweak_factory.parts.wpn_fps_upg_a_custom_free.stats = deep_clone(tweak_factory.parts.wpn_fps_upg_a_custom.stats)
tweak_factory.parts.wpn_fps_upg_a_custom_free.name_id = "bm_wp_upg_a_custom"
tweak_factory.parts.wpn_fps_upg_a_custom_free.desc_id = "bm_wp_upg_a_custom_desc"
tweak_factory.parts.wpn_fps_upg_a_custom_free.custom_stats = deep_clone(tweak_factory.parts.wpn_fps_upg_a_custom.custom_stats)

tweak_factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom_free = { 
	desc_id = "bm_wp_upg_a_custom_judge",
	custom_stats = { rays = 4, ammo_pickup_min_mul = 0.85, ammo_pickup_max_mul = 0.95, damage_far_mul = 0.70, damage_near_mul = 1.20, armor_piercing_add = 0.1}
}

--}
		

------------------[[GUN FIXES]]------------------{

tweak_factory.wpn_fps_ass_sub2000.override.wpn_fps_upg_o_45iron = { parent = "foregrip" }
tweak_factory.wpn_fps_ass_sub2000.override.wpn_fps_upg_o_leupold = { parent = "foregrip" }
tweak_factory.wpn_fps_ass_sub2000.override.wpn_fps_pis_c96_sight = { parent = "foregrip" }

tweak_factory.wpn_fps_ass_sub2000.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_45iron = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_pis_c96_sight = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		},
		wpn_fps_upg_o_leupold = {
			"wpn_fps_ass_sub2000_o_adapter",
			"wpn_fps_ass_sub2000_o_back_down"
		}
	}
	
tweak_factory.parts.wpn_fps_ass_sub2000_fg_suppressed.adds = {"wpn_fps_ass_sub2000_o_back"}
tweak_factory.parts.wpn_fps_ass_sub2000_fg_railed.adds = {"wpn_fps_ass_sub2000_o_back"}
tweak_factory.parts.wpn_fps_ass_sub2000_fg_gen2.adds = {"wpn_fps_ass_sub2000_o_front","wpn_fps_ass_sub2000_o_back"}
tweak_factory.parts.wpn_fps_ass_sub2000_fg_gen1.adds = {"wpn_fps_ass_sub2000_o_front","wpn_fps_ass_sub2000_o_back"}

tweak_factory.wpn_fps_ass_asval.adds.wpn_fps_upg_o_45iron = {"wpn_fps_ass_asval_scopemount"}
tweak_factory.wpn_fps_ass_asval.adds.wpn_fps_pis_c96_sight = {"wpn_fps_ass_asval_scopemount"}
tweak_factory.wpn_fps_ass_asval.adds.wpn_fps_upg_o_leupold = {"wpn_fps_ass_asval_scopemount"}

tweak_factory.wpn_fps_pis_c96.override.wpn_fps_pis_c96_sight = {
	unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_pis_c96_pts/wpn_fps_pis_c96_sight",
	third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_pis_c96_pts/wpn_third_pis_c96_sight",
}

tweak_factory.parts.wpn_fps_sho_ksg_b_standard.override = {
	wpn_fps_upg_o_dd_front = {a_obj = "a_o_f_2"},
	wpn_fps_upg_o_mbus_front = {a_obj = "a_o_f_2"}
}

--Puts the SCAR rail extension right below the front iron sight when irons are used
tweak_factory.wpn_fps_snp_msr.override.wpn_fps_snp_mosin_iron_sight = { 
		adds = {"wpn_fps_m4_uupg_o_flipup"},
		stats = { recoil = -1,	concealment = 0 }
	}
tweak_factory.parts.wpn_fps_snp_msr_body_wood.override = {
	wpn_fps_snp_mosin_iron_sight = { 
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_fg_railext",
		a_obj = "a_b"}
	}

--Puts the unused R870 stock/rail combo right below the front iron sight when irons are used
tweak_factory.wpn_fps_snp_r93.override.wpn_fps_snp_mosin_iron_sight = { 
		adds = {"wpn_fps_m4_uupg_o_flipup", "wpn_fps_shot_r870_s_nostock_single"},
		stats = { recoil = -1,	concealment = 0 }
	}
tweak_factory.wpn_fps_snp_r93.override.wpn_fps_shot_r870_s_nostock_single = { a_obj = "a_b" }


--I can't be fucked to even try this on the M95. You get the Daniel Defence front post instead.
tweak_factory.wpn_fps_snp_m95.override.wpn_fps_snp_mosin_iron_sight = { 
	adds = {"wpn_fps_ass_vhs_o_standard"},
	stats = { recoil = -1,	concealment = 0 }
}

	
--sets optics to the default optic postion on a gun for some of the AK type handguard mods for consistencies sake (I cannot be fucked to reposition optic coords for such tiny changes)
tweak_factory.parts.wpn_upg_saiga_fg_standard.override = {}
tweak_factory.parts.wpn_fps_smg_akmsu_fg_standard.override = {}
tweak_factory.parts.wpn_upg_ak_fg_standard.override = {}
tweak_factory.parts.wpn_upg_ak_fg_standard_gold.override = {}
tweak_factory.parts.wpn_fps_upg_ak_fg_krebs.override = {}
tweak_factory.parts.wpn_fps_upg_ak_fg_zenit.override = {}
tweak_factory.parts.wpn_fps_upg_ak_fg_trax.override = {}
tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override = {
	wpn_fps_upg_o_eotech_xps = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(0, -1, -4.6)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(0, -1, -4.6)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(0, -1, -4.6)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(0, -1, -4.6)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -1, -4.3)
			}
		}
	},
	wpn_fps_upg_o_aimpoint = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 2, 0)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 2, 0)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 2, 0)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 2, 0)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -1, -4.3) + Vector3(0, 2, 0)
			}
		}
	},
	wpn_fps_upg_o_specter = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 4, 0)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 4, 0)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 4, 0)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 4, 0)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -1, -4.3) + Vector3(0, 4, 0)
			}
		}
	},		
	wpn_fps_extra_zoom = {
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(0, -1, -4.6)+ Vector3( 0, 0 ,-3.15 )
			},
			wpn_fps_ass_akm = {
				translation = Vector3(0, -1, -4.6)+ Vector3( 0, 0 ,-3.15 )
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(0, -1, -4.6)+ Vector3( 0, 0 ,-3.15 )
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(0, -1, -4.6)+ Vector3( 0, 0 ,-3.15 )
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -1, -4.3)+ Vector3( 0, 0 ,-3.15 )
			}
		}
	},
	wpn_fps_upg_o_acog = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 6, 0)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 6, 0)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 6, 0)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(0, -1, -4.6) + Vector3(0, 6, 0)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -1, -4.3) + Vector3(0, 6, 0)
			}
		}
	},
	wpn_fps_pis_c96_sight = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-0.02, -11.5, -5.35)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-0.02, -11.5, -5.35)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-0.02, -11.5, -5.35)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(-0.02, -11.5, -5.35)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(-0.03, -11.5, -5.1)
			}
		}
	},
	wpn_fps_upg_o_leupold = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-0.02, -16.5, -5.45)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-0.02, -16.5, -5.45)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-0.02, -16.5, -5.45)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(-0.02, -16.5, -5.45)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(-0.03, -16.5, -5.2)
			}
		}
	},		
	wpn_fps_upg_o_45iron = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-2.1, 10, -14.6),
				rotation = Rotation(0, 0.2, -45) 
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-2.1, 10, -14.6),
				rotation = Rotation(0, 0.2, -45) 
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-2.1, 10, -14.6),
				rotation = Rotation(0, 0.2, -45) 
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(-2.1, 10, -14.6),
				rotation = Rotation(0, 0.2, -45) 
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(-2.1, 10, -14.6),
				rotation = Rotation(0, 0.2, -45) 
			},
		}
	},
	wpn_fps_upg_o_docter = deep_clone(tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech_xps),
	
	wpn_fps_upg_o_eotech = deep_clone(tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_t1micro = deep_clone(tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech_xps),
	
	wpn_fps_upg_o_cmore = deep_clone(tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_aimpoint_2 = deep_clone(tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_cs = deep_clone(tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_reflex = deep_clone(tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_rx01 = deep_clone(tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech_xps),

	wpn_fps_upg_o_rx30 = deep_clone(tweak_factory.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint),
}

tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override = {
	wpn_fps_upg_o_eotech_xps = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0.05, -11, -5.15)
			}
		}
	},
	wpn_fps_upg_o_aimpoint = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0.05, -11, -5.15) + Vector3(0, 2, 0)
			}
		}
	},
	wpn_fps_upg_o_specter = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0.05, -11, -5.15) + Vector3(0, 4, 0)
			}
		}
	},		
	wpn_fps_extra_zoom = {
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0.05, -11, -5.15) + Vector3(0, 0, -3.15)
			}
		}
	},
	wpn_fps_upg_o_acog = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0.05, -11, -5.15) + Vector3(0, 6, 0)
			}
		}
	},
	wpn_fps_pis_c96_sight = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0.0525, -21.5, -5.915)
			}
		}
	},
	wpn_fps_upg_o_leupold = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0.05, -26.5, -6.02)
			}
		}
	},		
	wpn_fps_upg_o_45iron = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(-1.35, 10, -15),
				rotation = Rotation(0, 0.2, -45) 
			}
		}
	},
	wpn_fps_upg_o_docter = deep_clone(tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech_xps),
	
	wpn_fps_upg_o_eotech = deep_clone(tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_t1micro = deep_clone(tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech_xps),
	
	wpn_fps_upg_o_cmore = deep_clone(tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_aimpoint_2 = deep_clone(tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_cs = deep_clone(tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_reflex = deep_clone(tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint),
	
	wpn_fps_upg_o_rx01 = deep_clone(tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech_xps),

	wpn_fps_upg_o_rx30 = deep_clone(tweak_factory.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint),
}

--Fixes several instances of default attachments having stats
tweak_factory.parts.wpn_fps_ass_vhs_m.stats = {}
tweak_factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.stats = {}
tweak_factory.parts.wpn_fps_upg_vg_ass_smg_stubby.stats = {}
tweak_factory.parts.wpn_fps_upg_vg_ass_smg_afg.stats = {}
tweak_factory.parts.wpn_fps_m4_uupg_fg_rail.stats = {}

--Fixes Glock slides not moving while aiming
tweak_factory.parts.wpn_fps_pis_g18c_b_standard.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
tweak_factory.parts.wpn_fps_pis_g26_b_standard.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
tweak_factory.parts.wpn_fps_pis_g26_b_custom.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}

--Fixed the 1911 irons not moving while aiming
tweak_factory.wpn_fps_pis_1911.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
--Fixes the Galil charging handle not moving while shooting
tweak_factory.parts.wpn_fps_ass_galil_body_standard.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
tweak_factory.wpn_fps_ass_galil.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
tweak_factory.parts.wpn_fps_smg_uzi_body_standard.animations = {reload = "reload", reload_not_empty = "reload_not_empty", fire = "recoil", fire_steelsight = "recoil"}

--Adds the optic mounts to guns that need them for the "new" attachments
tweak_factory.parts.wpn_fps_pis_deagle_lock.forbids = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_leupold",
	"wpn_fps_pis_c96_sight",
	}


tweak_factory.wpn_fps_pis_deagle.adds.wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"}
tweak_factory.wpn_fps_pis_deagle.adds.wpn_fps_pis_c96_sight = {"wpn_fps_pis_rage_o_adapter"}
	
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_specter = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_aimpoint = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_docter = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_eotech = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_t1micro = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_cmore = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_acog = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_cs = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_eotech_xps = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_reflex = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_rx01 = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_rx30 = { "wpn_fps_pis_rage_o_adapter" }
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"}
tweak_factory.wpn_fps_x_deagle.adds.wpn_fps_pis_c96_sight = {"wpn_fps_pis_rage_o_adapter"}

tweak_factory.parts.wpn_fps_pis_deagle_b_long.forbids = {
	"wpn_fps_pis_deagle_co_long",
	"wpn_fps_pis_deagle_co_short",
	"wpn_fps_upg_ns_pis_meatgrinder",
	"wpn_fps_upg_ns_pis_ipsccomp"
}
	

tweak_factory.wpn_fps_pis_rage.adds.wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"}
tweak_factory.wpn_fps_pis_rage.adds.wpn_fps_pis_c96_sight = {"wpn_fps_pis_rage_o_adapter"}

		
tweak_factory.parts.wpn_fps_pis_rage_lock.forbids = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_leupold",
	"wpn_fps_pis_c96_sight",
}
	
tweak_factory.wpn_fps_pis_judge.adds = {
	wpn_fps_upg_fl_ass_laser = {"wpn_fps_pis_judge_fl_adapter"},
	wpn_fps_upg_fl_ass_peq15 = {"wpn_fps_pis_judge_fl_adapter"},
	wpn_fps_upg_fl_ass_utg = {"wpn_fps_pis_judge_fl_adapter"},
	wpn_fps_upg_fl_ass_smg_sho_peqbox = {"wpn_fps_pis_judge_fl_adapter"},
	wpn_fps_upg_fl_ass_smg_sho_surefire = {"wpn_fps_pis_judge_fl_adapter"},
	wpn_fps_upg_o_specter = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_aimpoint = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_docter = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_eotech = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_t1micro = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_cmore = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_acog = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_cs = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_eotech_xps = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_reflex = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_rx01 = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_rx30 = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_pis_c96_sight = {"wpn_fps_pis_rage_o_adapter"}
}	

tweak_factory.wpn_fps_smg_baka.adds = {
	wpn_fps_upg_fl_pis_laser = {"wpn_fps_smg_baka_fl_adapter"},
	wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_smg_baka_fl_adapter"},
	wpn_fps_upg_fl_pis_crimson = {"wpn_fps_smg_baka_fl_adapter"},
	wpn_fps_upg_fl_pis_x400v = {"wpn_fps_smg_baka_fl_adapter"},
	wpn_fps_upg_fl_pis_m3x = {"wpn_fps_smg_baka_fl_adapter"},
	wpn_fps_upg_o_specter = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_aimpoint = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_docter = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_eotech = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_t1micro = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_cmore = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_acog = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_cs = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_eotech_xps = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_reflex = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_rx01 = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_rx30 = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_upg_o_leupold = {"wpn_fps_smg_baka_o_adapter"},
	wpn_fps_pis_c96_sight = {"wpn_fps_smg_baka_o_adapter"}
}	
	
	
		
--Adds rails for the extra optics when needed
tweak_factory.wpn_fps_smg_akmsu.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
tweak_factory.wpn_fps_smg_akmsu.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
tweak_factory.wpn_fps_smg_akmsu.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" }

tweak_factory.wpn_fps_ass_akm.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
tweak_factory.wpn_fps_ass_akm.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
tweak_factory.wpn_fps_ass_akm.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" }

tweak_factory.wpn_fps_ass_akm_gold.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
tweak_factory.wpn_fps_ass_akm_gold.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
tweak_factory.wpn_fps_ass_akm_gold.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" }

tweak_factory.wpn_fps_shot_saiga.adds = { 
	wpn_fps_smg_akmsu_body_lowerreceiver = { "wpn_upg_ak_g_standard" }
}

tweak_factory.wpn_fps_ass_74.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
tweak_factory.wpn_fps_ass_74.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
tweak_factory.wpn_fps_ass_74.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" }
tweak_factory.wpn_fps_ass_74.adds.wpn_fps_ass_ak_body_lowerreceiver = { "wpn_upg_ak_g_standard" }
	
tweak_factory.wpn_fps_ass_ak5.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ass_ak5_body_rail" }
tweak_factory.wpn_fps_ass_ak5.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ass_ak5_body_rail" }
tweak_factory.wpn_fps_ass_ak5.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ass_ak5_body_rail" }

tweak_factory.wpn_fps_sho_spas12.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_sho_spas12.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_sho_spas12.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_factory.wpn_fps_shot_r870.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_shot_r870.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_shot_r870.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }
	
tweak_factory.wpn_fps_shot_serbu.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_shot_serbu.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_shot_serbu.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_factory.wpn_fps_lmg_hk21.adds = { 
	wpn_fps_upg_o_specter = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_aimpoint = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_docter = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_eotech = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_t1micro = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_cmore = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_acog = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_cs = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_eotech_xps = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_reflex = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_rx01 = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_rx30 = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_45iron = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_leupold = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_pis_c96_sight = { "wpn_fps_ass_g3_body_rail" },
}

tweak_factory.wpn_fps_lmg_mg42.adds = { 
	wpn_fps_upg_o_specter = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_aimpoint = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_docter = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_eotech = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_t1micro = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_cmore = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_acog = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_cs = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_eotech_xps = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_reflex = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_rx01 = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_rx30 = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_45iron = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_upg_o_leupold = { "wpn_fps_snp_mosin_rail" },
	wpn_fps_pis_c96_sight = { "wpn_fps_snp_mosin_rail" },
}

tweak_factory.wpn_fps_snp_winchester.adds = { 
	wpn_fps_upg_o_specter = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_aimpoint = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_docter = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_eotech = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_t1micro = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_cmore = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_acog = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_cs = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_eotech_xps = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_reflex = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_rx01 = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_rx30 = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_45iron = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_upg_o_leupold = { "wpn_fps_smg_thompson_o_adapter" },
	wpn_fps_pis_c96_sight = { "wpn_fps_smg_thompson_o_adapter" },
}
	
tweak_factory.wpn_fps_ass_g3.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ass_g3_body_rail" }
tweak_factory.wpn_fps_ass_g3.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ass_g3_body_rail" }
tweak_factory.wpn_fps_ass_g3.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ass_g3_body_rail" }

tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_ak_g_hgrip = { stats = { value = 2, spread = 0, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_ak_g_pgrip = { stats = { value = 2, spread_moving = 2, spread = 2,  recoil = -1} }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_ak_g_wgrip = { stats = { value = 2, spread = -1, recoil = 2, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_upg_ak_s_psl = { stats = { value = 6, spread = 1, spread_moving = -3, recoil = 2, concealment = 0 } }
tweak_factory.wpn_fps_ass_akm.adds.wpn_fps_ass_ak_body_lowerreceiver = { "wpn_upg_ak_g_standard" }

tweak_factory.wpn_fps_lmg_rpk.adds = { 
	wpn_fps_upg_o_specter = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_aimpoint = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_docter = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_eotech = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_t1micro = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_cmore = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_acog = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_cs = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_eotech_xps = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_reflex = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_rx01 = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_rx30 = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" },
	wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" },
	wpn_fps_lmg_rpk_fg_standard = { "wpn_fps_upg_vg_ass_smg_verticalgrip"},
}

tweak_factory.wpn_fps_smg_mac10.adds.wpn_fps_upg_o_45iron = { "wpn_fps_smg_mac10_body_ris_special" }
tweak_factory.wpn_fps_smg_mac10.adds.wpn_fps_upg_o_leupold = { "wpn_fps_smg_mac10_body_ris_special" }
tweak_factory.wpn_fps_smg_mac10.adds.wpn_fps_pis_c96_sight = { "wpn_fps_smg_mac10_body_ris_special" }

tweak_factory.wpn_fps_smg_thompson.adds.wpn_fps_upg_o_45iron = { "wpn_fps_smg_thompson_o_adapter" }
tweak_factory.wpn_fps_smg_thompson.adds.wpn_fps_upg_o_leupold = { "wpn_fps_smg_thompson_o_adapter" }
tweak_factory.wpn_fps_smg_thompson.adds.wpn_fps_pis_c96_sight = { "wpn_fps_smg_thompson_o_adapter" }

tweak_factory.wpn_fps_ass_famas.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ass_famas_o_adapter" }
tweak_factory.wpn_fps_ass_famas.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ass_famas_o_adapter" }
tweak_factory.wpn_fps_ass_famas.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ass_famas_o_adapter" }

tweak_factory.wpn_fps_ass_galil.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_ass_galil.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_ass_galil.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_factory.wpn_fps_smg_m45.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_smg_m45.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_smg_m45.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }


tweak_factory.wpn_fps_smg_uzi.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_smg_uzi.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_smg_uzi.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_factory.wpn_fps_smg_tec9.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_smg_tec9.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_factory.wpn_fps_smg_tec9.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_factory.wpn_fps_smg_scorpion.adds.wpn_fps_upg_o_45iron = {"wpn_fps_smg_scorpion_extra_rail"}
tweak_factory.wpn_fps_smg_scorpion.adds.wpn_fps_upg_o_leupold = {"wpn_fps_smg_scorpion_extra_rail"}
tweak_factory.wpn_fps_smg_scorpion.adds.wpn_fps_pis_c96_sight = {"wpn_fps_smg_scorpion_extra_rail"}

tweak_factory.wpn_fps_snp_mosin.adds.wpn_fps_upg_o_leupold = {"wpn_fps_snp_mosin_rail"}

tweak_factory.wpn_fps_smg_sterling.adds.wpn_fps_upg_o_45iron = {"wpn_fps_smg_sterling_o_adapter"}
tweak_factory.wpn_fps_smg_sterling.adds.wpn_fps_pis_c96_sight = {"wpn_fps_smg_sterling_o_adapter"}
tweak_factory.wpn_fps_smg_sterling.adds.wpn_fps_upg_o_leupold = {"wpn_fps_smg_sterling_o_adapter"}


tweak_factory.wpn_fps_x_b92fs.override.wpn_fps_pis_beretta_m_extended = {
	animations = {
		reload = "reload_right",
		reload_not_empty = "reload_not_empty_right",
		reload_left = "reload_left",
		reload_not_empty_left = "reload_not_empty_left"
	},
	stats = {
		value = 2,
		spread_moving = -2,
		concealment = -2,
		extra_ammo = 30
	}
}
tweak_factory.wpn_fps_x_b92fs.override.wpn_upg_o_marksmansight_front = {a_obj = "a_os"}
tweak_factory.wpn_fps_x_b92fs.adds.wpn_fps_upg_o_rmr = {"wpn_fps_pis_beretta_o_std"}
	
tweak_factory.wpn_fps_x_1911.override.wpn_fps_pis_1911_m_extended = {
	animations = {
		reload = "reload_right",
		reload_not_empty = "reload_not_empty_right",
		reload_left = "reload_left",
		reload_not_empty_left = "reload_not_empty_left"
	},
	stats = {
		value = 3,
		spread_moving = -2,
		concealment = -1,
		extra_ammo = 8
	}
}
tweak_factory.wpn_fps_x_1911.override.wpn_upg_o_marksmansight_rear = {
	a_obj = "a_o",
	forbids = {
		"wpn_fps_pis_1911_o_long",
		"wpn_fps_pis_1911_o_standard"
	}
}
tweak_factory.wpn_fps_x_1911.override.wpn_upg_o_marksmansight_front = {a_obj = "a_os"}


tweak_factory.wpn_fps_x_deagle.override.wpn_fps_pis_deagle_m_extended = {
	animations = {reload = "reload_right",reload_not_empty = "reload_not_empty_right",reload_left = "reload_left",reload_not_empty_left = "reload_not_empty_left"},
	stats = {value = 7, concealment = -2, spread_moving = -2, extra_ammo = 6}
}
tweak_factory.wpn_fps_x_deagle.override.wpn_upg_o_marksmansight_rear = {
	a_obj = "a_o",
	forbids = {
		"wpn_fps_pis_deagle_o_standard_front",
		"wpn_fps_pis_deagle_o_standard_front_long",
		"wpn_fps_pis_deagle_o_standard_rear"
	}
}
tweak_factory.wpn_fps_x_deagle.override.wpn_upg_o_marksmansight_front = {a_obj = "a_os"}
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter = {a_obj = "a_quite", stats = {} }
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_aimpoint = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_aimpoint_2 = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_docter = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_eotech = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_t1micro = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_cmore = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_acog = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_cs = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_eotech_xps = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_reflex = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_rx01 = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_rx30 = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_leupold = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
tweak_factory.wpn_fps_x_deagle.override.wpn_fps_pis_c96_sight = tweak_factory.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter

--Removes the gadget rail for some guns and attachments that aren't already covered above (mostly default attachments that have no stats)
tweak_factory.parts.wpn_fps_ass_g36_fg_k.forbids = { "wpn_fps_addon_ris" } 
tweak_factory.parts.wpn_fps_sho_striker_body_standard.forbids = { "wpn_fps_addon_ris" } 
tweak_factory.parts.wpn_fps_smg_mp9_body_mp9.forbids = { "wpn_fps_addon_ris" } 
tweak_factory.parts.wpn_fps_smg_mp7_body_standard.forbids = { "wpn_fps_addon_ris" } 
tweak_factory.parts.wpn_fps_ass_scar_body_standard.forbids = { "wpn_fps_addon_ris" } 
tweak_factory.parts.wpn_fps_smg_p90_body_p90.forbids = { "wpn_fps_addon_ris" }
tweak_factory.parts.wpn_fps_lmg_rpk_b_standard.forbids = { "wpn_fps_addon_ris" } 

--AR overrides
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 11}}
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 40 }}
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_drum = {stats = { value = 9, extra_ammo = 80, recoil = 1, concealment = -5 }}
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_ass_l85a2_m_emag = {stats = { value = 1, spread = -2, extra_ammo = 10, recoil = 0, total_ammo_mod = 40}}
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 10, recoil = 1, total_ammo_mod = 0, spread = -0}}
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_shot_r870_s_solid = { 
	unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
	third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid",
	stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 }
}

tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_g_sniper = {stats = { value = 6, spread = 1, recoil = 1 }}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_g_mgrip = {stats = { value = 2, spread = 1}}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 11}}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 40 }}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_drum = {stats = { value = 9, extra_ammo = 80, recoil = 1, concealment = -0 }}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_ass_l85a2_m_emag = {stats = { value = 1, spread = -2, extra_ammo = 10, recoil = 0, total_ammo_mod = 33}}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 10, recoil = 1, total_ammo_mod = 0, spread = -0}}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_shot_r870_s_solid = { 
	unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
	third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid",
	stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 }
}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_smg_olympic_fg_railed = { 
	unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail",
	third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail",
	forbids = {},
	stats = { value = 4, spread_moving = -1, recoil = 1, concealment = 0 }
}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_s_pts = {
	stats = { value = 1, spread_moving = -1, concealment = 0, spread = 1 }
}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_s_standard = {
	stats = { value = 1, spread_moving = -1, concealment = 0, recoil = 1 }
}

tweak_factory.wpn_fps_ass_m4.override.wpn_fps_shot_r870_s_solid = { 
	unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
	third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid",
	stats = { value = 2, recoil = 1, concealment = 0 }
}
tweak_factory.wpn_fps_ass_m4.override.wpn_fps_m16_fg_railed = {
	stats = { value = 7, spread_moving = -2, recoil = 2, concealment = 0, spread = -0 }
}
tweak_factory.wpn_fps_ass_m4.override.wpn_fps_upg_m4_s_standard = {
	stats = { value = 1, concealment = 0, spread = 1 }
}
	


tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_m4_s_pts = { stats = { value = 3, spread = 1, recoil = 0, concealment = 0 }}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_m4_s_standard = { stats = { value = 3, spread = 0, recoil = 1, concealment = 0 }}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_m4_uupg_s_fold = {stats = {}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_m4_uupg_m_std = {stats = { value = 1, concealment = -1, extra_ammo = 10, total_ammo_mod = -0}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 11, total_ammo_mod = -0}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 40, total_ammo_mod = -0 }}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_drum = {stats = { value = 9, extra_ammo = 80, recoil = 1, concealment = -5, total_ammo_mod = -0}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_ass_l85a2_m_emag = {stats = { value = 1, spread = -2, extra_ammo = 10, recoil = 0, total_ammo_mod = 40}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 10, recoil = 1, total_ammo_mod = 0, spread = -0}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_m4_uupg_b_long = {stats = { value = 4, damage = 1, spread = 2, recoil = 0, concealment = -2, suppression = 0}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf = {stats = { value = 1, spread = 8, recoil = -10, total_ammo_mod = -0, damage = 1, concealment = -4 }}


--AK overrides
tweak_factory.wpn_fps_shot_saiga.override.wpn_fps_ass_akm_body_upperreceiver_vanilla = { 
	unit = "units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_body_upperreceiver" 
}
tweak_factory.wpn_fps_shot_saiga.override.wpn_fps_upg_o_mbus_rear = { 
	a_obj = "a_or", 
	stats = { value = 3, concealment = 0 } 
}
tweak_factory.wpn_fps_shot_saiga.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_of", }
tweak_factory.wpn_fps_shot_saiga.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_shot_saiga.override.wpn_fps_shot_r870_s_solid = { 
	unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
	third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
	stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 }
}
tweak_factory.wpn_fps_shot_saiga.override.wpn_fps_upg_ak_fg_tapco = { stats = { value = 5, recoil = 1, concealment = 0}}

tweak_factory.wpn_fps_smg_akmsu.override.wpn_fps_shot_r870_s_solid = { 
	unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
	third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
	stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 }
}
tweak_factory.wpn_fps_smg_akmsu.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 } }

tweak_factory.wpn_fps_ass_akm.override.wpn_fps_shot_r870_s_solid = { 
	unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
	third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
	stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 }
}
tweak_factory.wpn_fps_ass_akm.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_ass_akm.override.wpn_fps_lmg_rpk_fg_standard = { stats = { value = 5, spread = 2, recoil = 0, spread_moving = 2, concealment = 0} }


tweak_factory.wpn_fps_ass_74.override.wpn_fps_shot_r870_s_solid = { 
	unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
	third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
	stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 }
}
tweak_factory.wpn_fps_ass_74.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_ass_74.override.wpn_fps_lmg_rpk_fg_standard = { stats = { value = 5, spread = 2, recoil = 0, spread_moving = 2, concealment = 0} }

tweak_factory.wpn_fps_ass_akm_gold.override.wpn_fps_shot_r870_s_solid = { 
	unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
	third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
	stats = { value = 2, spread_moving = -2, recoil = 1, concealment = -0 }
}
tweak_factory.wpn_fps_ass_akm_gold.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, spread_moving = -2, recoil = 1, concealment = -0 } }
tweak_factory.wpn_fps_ass_akm_gold.override.wpn_fps_lmg_rpk_fg_standard = { stats = { value = 5, spread = 2, recoil = 0, spread_moving = 2, concealment = 0} }

if DMCWO.akmsu_stock_switch == true then
	tweak_factory.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
	tweak_factory.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
else
	tweak_factory.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_folding_vanilla = {}
	tweak_factory.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_skfoldable = {}
end

if DMCWO.akm_stock_switch == true then
	tweak_factory.wpn_fps_ass_akm.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
	tweak_factory.wpn_fps_ass_akm.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
else
	tweak_factory.wpn_fps_ass_akm.override.wpn_upg_ak_s_folding_vanilla = {}
	tweak_factory.wpn_fps_ass_akm.override.wpn_upg_ak_s_skfoldable = {}	
end
	
if DMCWO.saiga_stock_switch == true then
	tweak_factory.wpn_fps_shot_saiga.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
	tweak_factory.wpn_fps_shot_saiga.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
else
	tweak_factory.wpn_fps_shot_saiga.override.wpn_upg_ak_s_folding_vanilla = {}
	tweak_factory.wpn_fps_shot_saiga.override.wpn_upg_ak_s_skfoldable = { }
end
	
if DMCWO.rpk_stock_switch == true then
	tweak_factory.wpn_fps_lmg_rpk.override.wpn_upg_ak_s_folding = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
else
	tweak_factory.wpn_fps_lmg_rpk.override.wpn_upg_ak_s_folding = {}
end


--Glock overrides
tweak_factory.wpn_fps_pis_g22c.override = {
	wpn_fps_upg_o_rmr = {parent = "slide"},
	wpn_fps_pis_g18c_m_mag_33rnd = {stats = { value = 6, spread_moving = -3, extra_ammo = 7, concealment = -2}}
}

tweak_factory.wpn_fps_pis_g26.override = {
	wpn_fps_upg_o_rmr = {parent = "slide"},
	wpn_fps_pis_g18c_m_mag_33rnd = {stats = { value = 6, spread_moving = -3, extra_ammo = 23, concealment = 0, recoil = 0}}
}

tweak_factory.wpn_fps_jowi.override.wpn_fps_pis_g26_b_standard = {
	animations = {
		reload = "reload_right",
		reload_left = "reload_left",
		fire = "recoil",
		fire_steelsight = "recoil"}
}
tweak_factory.wpn_fps_jowi.override.wpn_fps_pis_g26_b_custom = {
	animations = {
		reload = "reload_right",
		reload_left = "reload_left",
		fire = "recoil",
		fire_steelsight = "recoil"}
}
tweak_factory.wpn_fps_jowi.override.wpn_fps_pis_g18c_m_mag_33rnd = { stats = { value = 6, spread_moving = -3, extra_ammo = 46, concealment = 0, recoil = 0 } }
tweak_factory.wpn_fps_pis_x_g22c.override.wpn_fps_pis_g18c_m_mag_17rnd = { stats = {} }
tweak_factory.wpn_fps_pis_x_g22c.override.wpn_fps_pis_g18c_m_mag_33rnd = { stats = { value = 3, spread_moving = -2, concealment = -1, extra_ammo = 14 } }

tweak_factory.wpn_fps_pis_x_usp.override.wpn_fps_pis_usp_m_extended = { stats = { value = 3, spread_moving = -2, concealment = -1, extra_ammo = 16 } }

tweak_factory.parts.wpn_fps_upg_o_specter.override = { 
	wpn_fps_m4_upper_reciever_round = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round",
	},
	wpn_fps_m4_upper_reciever_round_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round",
	},
	wpn_fps_m4_uupg_draghandle = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_m4_uupg_draghandle_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_ass_m16_o_handle_sight = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
	},
}
tweak_factory.parts.wpn_fps_upg_o_eotech.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_acog.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_aimpoint.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_aimpoint_2.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_eotech_xps.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_cs.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_rx01.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_docter.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_t1micro.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_cmore.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_rx30.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_reflex.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_leupold.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_upg_o_leupold.override = tweak_factory.parts.wpn_fps_upg_o_specter.override
tweak_factory.parts.wpn_fps_pis_c96_sight.override = tweak_factory.parts.wpn_fps_upg_o_specter.override

tweak_factory.parts.wpn_fps_m4_upper_reciever_edge.forbids = { "wpn_fps_m4_upper_reciever_round" }
tweak_factory.parts.wpn_fps_m4_upper_reciever_edge.adds = { "wpn_fps_m4_uupg_draghandle" }
tweak_factory.parts.wpn_fps_m4_upper_reciever_edge.override = { 
	wpn_fps_amcar_uupg_body_upperreciever = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_upper_reciever_round = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_upper_reciever_round_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_uupg_draghandle = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_m4_uupg_draghandle_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_ass_m16_o_handle_sight = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
	},
}
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.forbids = { "wpn_fps_m4_upper_reciever_round" }
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.adds = { "wpn_fps_m4_uupg_draghandle_core" }
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override = { 
	wpn_fps_amcar_uupg_body_upperreciever = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_core/wpn_fps_upg_ass_m4_upper_reciever_core",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_upper_reciever_round = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_core/wpn_fps_upg_ass_m4_upper_reciever_core",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_upper_reciever_round_vanilla = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_core/wpn_fps_upg_ass_m4_upper_reciever_core",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_uupg_draghandle = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_core/wpn_fps_m4_uupg_draghandle_core",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_m4_uupg_draghandle_vanilla = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_core/wpn_fps_m4_uupg_draghandle_core",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_ass_m16_o_handle_sight = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
	},
}
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.forbids = { "wpn_fps_m4_upper_reciever_round" }
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.adds = { "wpn_fps_m4_uupg_draghandle" }
tweak_factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override = { 
	wpn_fps_amcar_uupg_body_upperreciever = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_ballos/wpn_fps_upg_ass_m4_upper_reciever_ballos",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_upper_reciever_round = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_ballos/wpn_fps_upg_ass_m4_upper_reciever_ballos",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_upper_reciever_round_vanilla = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_ballos/wpn_fps_upg_ass_m4_upper_reciever_ballos",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_uupg_draghandle = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_ballos/wpn_fps_m4_uupg_draghandle_ballos",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_m4_uupg_draghandle_vanilla = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_ballos/wpn_fps_m4_uupg_draghandle_ballos",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_ass_m16_o_handle_sight = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
	},
}

tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_specter = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_aimpoint = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_aimpoint_2 = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_docter = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_eotech = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_eotech_xps = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_acog = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_t1micro = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_cs = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_rx01 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_rx30 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_rpk.override.wpn_fps_upg_o_reflex = { stats = { zoom = 2, recoil = 0, concealment = 0  } }

tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_specter = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_aimpoint = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_aimpoint_2 = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_docter = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_eotech = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_eotech_xps = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_acog = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_t1micro = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_cs = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_rx01 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_rx30 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_o_reflex = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_upg_i_autofire = { 
	desc_id = "bm_wp_upg_i_autofire_hk21",
	stats = { recoil = 15, spread = 0},
	custom_stats = {rof_mult = 0.5625, hipfire_mod = 0.6}
}

tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_specter = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_aimpoint = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_aimpoint_2 = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_docter = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_eotech = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_eotech_xps = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_acog = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_t1micro = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_cs = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_rx01 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_rx30 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_reflex = { stats = { zoom = 2, recoil = 0, concealment = 0  } }

tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_specter = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_aimpoint = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_aimpoint_2 = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_docter = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_eotech = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_eotech_xps = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_acog = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_t1micro = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_cs = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_rx01 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_rx30 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_lmg_m249.override.wpn_fps_upg_o_reflex = { stats = { zoom = 2, recoil = 0, concealment = 0  } }

tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_specter = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_aimpoint = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_aimpoint_2 = { stats = { zoom = 4, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_docter = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_eotech = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_eotech_xps = { stats = { zoom = 3, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_acog = { stats = { zoom = 6, recoil = 1, concealment = 0 } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_t1micro = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_cs = { stats = { zoom = 2, recoil = 0, concealment = 0 } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_rx01 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_rx30 = { stats = { zoom = 2, recoil = 0, concealment = 0  } }
tweak_factory.wpn_fps_snp_winchester.override.wpn_fps_upg_o_reflex = { stats = { zoom = 2, recoil = 0, concealment = 0  } }

tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_ass_g3_s_wood = { stats = { value = 2, recoil = 2, spread = -0, concealment = 0 } }
tweak_factory.wpn_fps_lmg_hk21.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = 0, damage = -1} }

tweak_factory.wpn_fps_ass_m14.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = 0, damage = -1} }

tweak_factory.wpn_fps_ass_fal.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = 0, damage = -1} }

tweak_factory.wpn_fps_ass_g3.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = 0, damage = -1} }
tweak_factory.wpn_fps_ass_g3.override.wpn_fps_smg_mp5_s_adjust = { stats = {} }

tweak_factory.wpn_fps_ass_galil.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = 0, damage = -1} }

tweak_factory.wpn_fps_ass_scar.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = 0, damage = -1} }

tweak_factory.wpn_fps_pis_hs2000.override.wpn_fps_pis_p226_co_comp_1 = { stats = { value = 4, suppression = -2, recoil = 2, concealment = -0 } }
tweak_factory.wpn_fps_pis_hs2000.override.wpn_fps_pis_p226_co_comp_2 = { stats = { value = 5, suppression = -1, concealment = -0, spread = 2 } }

tweak_factory.wpn_fps_sho_striker.override.wpn_fps_upg_o_mbus_rear = { a_obj = "a_o_r", stats = { value = 3, concealment = 0 }}
tweak_factory.wpn_fps_sho_striker.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_o_f" }

tweak_factory.wpn_fps_ass_aug.override.wpn_fps_upg_o_mbus_rear = { a_obj = "a_or", stats = { value = 3, concealment = 0 }}
tweak_factory.wpn_fps_ass_aug.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_of", }

tweak_factory.wpn_fps_smg_p90.override.wpn_fps_upg_o_mbus_rear = { a_obj = "a_or", stats = { value = 3, concealment = 0 }}
tweak_factory.wpn_fps_smg_p90.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_of", }

--}

RebalanceAtchScript = true
if not DMCWO.rebalance_att then
	DMCWO.rebalance_att = true
	if DMCWO.Setup_Stfu ~= true then
		io.stdout:write("is working!\n")
	end
	if not RebalanceAtchScript then
		io.stdout:write("[!] You left RebalanceAtchScript commented out (or nil), you may experience FPS drops\n")
	end
	if DMCWO.stfu == false then
		local rand_num = math.random(#DMCWO.Strings)
		io.stdout:write( tostring(DMCWO.Strings[rand_num]), "\n" )
	end
end


end