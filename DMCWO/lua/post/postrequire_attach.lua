--[[
v1.5
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/tweak_data/weaponfactorytweakdata" then

local old_wftd_init = WeaponFactoryTweakData.init
function WeaponFactoryTweakData:init()
	old_wftd_init(self)
	self:DMCWO_mods()
end

function WeaponFactoryTweakData:DMCWO_mods()

	for wep_id, i in pairs(self) do
		if wep_id ~= "parts" then
			if not self[ wep_id ].override then
				self[ wep_id ].override = {}
			end
		end
	end
	
	self.parts.hp_ammo = {
		pcs = {},
		type = "ammo",
		name_id = "bullet_hollow",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		stats = {
			value = 8,
			--damage = 4,
			recoil = -3,
			total_ammo_mod = -50
		},
		--[[
		desc_colors = {
			"skill_color",
			"stats_negative",
			"stats_negative",
			"stats_negative",
			"stats_negative"
		},
		]]
		custom_stats = {
			has_hp = true,
			penetration_power_mult = 0.5, 
			penetration_damage_mult = 0.5,
			can_shoot_through_enemy = false,
			can_shoot_through_shield = false,
			ammo_pickup_min_mul = 0.75,
			ammo_pickup_max_mul = 0.75,
			armor_piercing_mul = 0.2
		},
		internal_part = true,
		sub_type = "ammo_explosive",
		forbids = {
			"wpn_fps_smg_sterling_b_e11","wpn_fps_lmg_mg42_b_vg38","wpn_fps_pis_c96_nozzle",
		}
	}
	for i, factory_id in ipairs(self.parts.hp_ammo.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "hp_ammo")
	end
	
	self.parts.ap_ammo = {
		pcs = {},
		type = "ammo",
		name_id = "bullet_ap",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		stats = {
			value = 5,
			--damage = -2,
			total_ammo_mod = -50
		},
		custom_stats = {
			has_ap = true,
			penetration_power_mult = 1.5,
			penetration_damage_mult = 1.5,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			ammo_pickup_min_mul = 0.75,
			ammo_pickup_max_mul = 0.75,
			armor_piercing_add = 0.3
		},
		--[[ 
		desc_colors = {
			"skill_color",
			"stats_negative",
			"skill_color",
			"skill_color",
			"stats_negative"
		}, 
		]]
		internal_part = true,
		sub_type = "ammo_piercing",
		forbids = {
			"wpn_fps_smg_sterling_b_e11","wpn_fps_lmg_mg42_b_vg38","wpn_fps_pis_c96_nozzle",
			"wpn_fps_smg_mp5_m_drum","wpn_fps_smg_mp5_m_straight"
		}
	}
	for i, factory_id in ipairs(self.parts.ap_ammo.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "ap_ammo")
	end
		
	self.parts.match_ammo = {
		pcs = {},
		type = "ammo",
		name_id = "bullet_match",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		stats = {
			value = 3,
			recoil = -7,
			spread = 6
		},
		custom_stats = {
			ammo_pickup_min_mul = 0.90,
			ammo_pickup_max_mul = 0.90,
			damage_near_mul = 1.15, 
			damage_far_mul = 1.15
		},
		--[[
		desc_colors = {
			"skill_color",
			"skill_color"
		},
		]]
		internal_part = true,
		sub_type = "singlefire",
		forbids = {
			"wpn_fps_smg_sterling_b_e11","wpn_fps_lmg_mg42_b_vg38","wpn_fps_pis_c96_nozzle",
			"wpn_fps_upg_ns_ass_smg_small","wpn_fps_upg_ns_ass_smg_medium","wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_snp_msr_ns_suppressor",
			"wpn_fps_snp_wa2000_b_suppressed","wpn_fps_snp_r93_b_suppressed",
			"wpn_fps_upg_ns_ass_pbs1",
			"wpn_fps_m4_uupg_b_sd","wpn_fps_snp_m95_barrel_suppressed",
			"wpn_fps_ass_famas_b_suppressed",
			"wpn_fps_smg_sterling_b_suppressed",
			"wpn_fps_ass_vhs_b_silenced","wpn_fps_snp_winchester_b_suppressed",
			"wpn_fps_smg_polymer_ns_silencer",
			"wpn_fps_smg_scorpion_b_suppressed","wpn_fps_smg_uzi_b_suppressed","wpn_fps_smg_cobray_ns_silencer",
			"wpn_fps_ass_sub2000_fg_suppressed",
			"wpn_fps_smg_mp5_fg_mp5sd","wpn_fps_smg_mp9_b_suppressed",
			"wpn_fps_smg_mp7_b_suppressed","wpn_fps_smg_p90_b_ninja",
			"wpn_fps_upg_ns_pis_small","wpn_fps_upg_ns_pis_medium","wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_ns_pis_medium_gem","wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_jungle","wpn_fps_upg_ns_ass_filter"
		}
	}
	for i, factory_id in ipairs(self.parts.match_ammo.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "match_ammo")
	end
	
	self.parts.low_ammo = {
		pcs = {},
		type = "ammo",
		name_id = "bullet_low",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		--alt_icon = "guis/textures/pd2/blackmarket/icons/mods/magazine",
		stats = {
			value = 1,
			damage = -0,
			spread = -3,
			recoil = 5
		},
		custom_stats = {
			penetration_power_mult = 0.85,
			penetration_damage_mult = 0.85,
			damage_near_mul = 0.80, 
			damage_far_mul = 0.80
		},
		--[[
		desc_colors = {
			"stats_negative",
			"stats_negative"
		},
		]]
		internal_part = true,
		sub_type = "ammo_slug",
		forbids = {
			"wpn_fps_smg_sterling_b_e11","wpn_fps_lmg_mg42_b_vg38","wpn_fps_pis_c96_nozzle",
			"wpn_fps_upg_ass_ak_b_zastava","wpn_fps_upg_ass_m4_b_beowulf","wpn_fps_ass_g3_b_sniper",
			"wpn_fps_ass_famas_b_sniper","wpn_fps_ass_vhs_b_sniper",
			"wpn_fps_ammo_type"
		}
	}
	for i, factory_id in ipairs(self.parts.low_ammo.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "low_ammo")
	end
		
	local nato_ar_br = {
		'wpn_fps_lmg_m249',
		'wpn_fps_ass_amcar','wpn_fps_ass_g36','wpn_fps_ass_s552','wpn_fps_smg_olympic',
		'wpn_fps_ass_m4','wpn_fps_ass_m16','wpn_fps_ass_ak5',
		'wpn_fps_ass_aug','wpn_fps_ass_famas','wpn_fps_ass_l85a2','wpn_fps_ass_vhs',
		'wpn_fps_lmg_hk21','wpn_fps_lmg_m134',
		'wpn_fps_ass_m14','wpn_fps_ass_scar','wpn_fps_ass_fal','wpn_fps_ass_g3','wpn_fps_ass_galil',
		'wpn_fps_snp_msr','wpn_fps_snp_wa2000'
	}
	for i, factory_id in ipairs(nato_ar_br) do
		table.insert(self[factory_id].uses_parts, "hp_ammo")
		table.insert(self[factory_id].uses_parts, "ap_ammo")
		table.insert(self[factory_id].uses_parts, "match_ammo")
		table.insert(self[factory_id].uses_parts, "low_ammo")
	end
			
	local ru_ammo = {
		'wpn_fps_lmg_rpk',
		'wpn_fps_smg_akmsu',
		'wpn_fps_ass_74','wpn_fps_ass_akm','wpn_fps_ass_akm_gold',
		'wpn_fps_snp_mosin'
	}
	for i, factory_id in ipairs(ru_ammo) do
		table.insert(self[factory_id].uses_parts, "hp_ammo")
		table.insert(self[factory_id].uses_parts, "ap_ammo")
		table.insert(self[factory_id].uses_parts, "match_ammo")
		table.insert(self[factory_id].uses_parts, "low_ammo")
	end
	local nine_mm = {
		'wpn_fps_jowi','wpn_fps_x_b92fs','wpn_fps_pis_x_g17',
		'wpn_fps_pis_g17','wpn_fps_pis_beretta','wpn_fps_pis_g26','wpn_fps_smg_tec9',
		'wpn_fps_pis_g18c','wpn_fps_smg_mp9',
		'wpn_fps_smg_mp5','wpn_fps_smg_m45','wpn_fps_smg_uzi','wpn_fps_smg_sterling','wpn_fps_smg_cobray','wpn_fps_smg_baka',
		'wpn_fps_ass_sub2000'
	}
	for i, factory_id in ipairs(nine_mm) do
		table.insert(self[factory_id].uses_parts, "hp_ammo")
		table.insert(self[factory_id].uses_parts, "ap_ammo")
		table.insert(self[factory_id].uses_parts, "match_ammo")
		table.insert(self[factory_id].uses_parts, "low_ammo")
		self[factory_id].override.ap_ammo = {
			desc_id = "bullet_ap_desc_9mm",
			custom_stats = {
				has_ap = true,
				penetration_power_mult = 1.5,
				penetration_damage_mult = 1.5,
				can_shoot_through_enemy = true,
				ammo_pickup_min_mul = 0.75,
				ammo_pickup_max_mul = 0.75,
				armor_piercing_add = 0.3
			}
		}
	end
	
	local forty_sw = {
		'wpn_fps_pis_x_g22c',
		'wpn_fps_pis_g22c',	'wpn_fps_pis_p226'
	}
	for i, factory_id in ipairs(forty_sw) do
		table.insert(self[factory_id].uses_parts, "hp_ammo")
		table.insert(self[factory_id].uses_parts, "match_ammo")
		table.insert(self[factory_id].uses_parts, "low_ammo")
	end
	
	local thirtytwo_acp = {
		'wpn_fps_pis_ppk',
		'wpn_fps_smg_scorpion'
	}
	for i, factory_id in ipairs(thirtytwo_acp) do
		table.insert(self[factory_id].uses_parts, "hp_ammo")
		table.insert(self[factory_id].uses_parts, "match_ammo")
		table.insert(self[factory_id].uses_parts, "low_ammo")
	end
	
	local fortyfive_acp = {
		'wpn_fps_x_1911','wpn_fps_pis_x_usp',
		'wpn_fps_pis_usp','wpn_fps_pis_1911',
		'wpn_fps_smg_mac10','wpn_fps_smg_thompson','wpn_fps_smg_polymer'
	}
	for i, factory_id in ipairs(fortyfive_acp) do
		table.insert(self[factory_id].uses_parts, "hp_ammo")
		table.insert(self[factory_id].uses_parts, "match_ammo")
		table.insert(self[factory_id].uses_parts, "low_ammo")
	end
	
	local magnum = {
		'wpn_fps_x_deagle',
		'wpn_fps_pis_rage','wpn_fps_pis_deagle','wpn_fps_pis_2006m','wpn_fps_pis_peacemaker',
		'wpn_fps_snp_winchester'
	}
	for i, factory_id in ipairs(magnum) do
		table.insert(self[factory_id].uses_parts, "hp_ammo")
		table.insert(self[factory_id].uses_parts, "match_ammo")
		table.insert(self[factory_id].uses_parts, "low_ammo")
	end
	
	local ap_incen = {
		'wpn_fps_snp_r93','wpn_fps_snp_m95'
	}
	
	local pdw = {
		'wpn_fps_smg_p90',
		'wpn_fps_smg_mp7',
	}
	for i, factory_id in ipairs(pdw) do
		table.insert(self[factory_id].uses_parts, "hp_ammo")
		table.insert(self[factory_id].uses_parts, "ap_ammo")
		table.insert(self[factory_id].uses_parts, "low_ammo")
		
		self[factory_id].override.ap_ammo = {
			custom_stats = {
				has_ap = true,
				penetration_power_mult = 1.5,
				penetration_damage_mult = 1.5,
				ammo_pickup_min_mul = 0.75,
				ammo_pickup_max_mul = 0.75,
				armor_piercing_add = 0.3,
				shield_damage = 1.05
			},
			desc_id = "bullet_ap_desc_has_pen"
		}
		
	end
	
	local other_guns = {
		'wpn_fps_lmg_mg42',
		'wpn_fps_pis_c96'
	}	
	for i, factory_id in ipairs(other_guns) do
		table.insert(self[factory_id].uses_parts, "low_ammo")
	end

	local ap_only = {
		'wpn_fps_ass_asval','wpn_fps_snp_r93'
	}	
	for i, factory_id in ipairs(ap_only) do
		table.insert(self[factory_id].uses_parts, "ap_ammo")
	end
	
	local hi_cal = {
		'wpn_fps_ass_m14','wpn_fps_ass_scar','wpn_fps_ass_fal','wpn_fps_ass_g3','wpn_fps_ass_galil',
		'wpn_fps_snp_msr',
		'wpn_fps_lmg_hk21','wpn_fps_lmg_m134',
		'wpn_fps_pis_rage','wpn_fps_pis_deagle','wpn_fps_pis_2006m'
	}	
	for i, factory_id in ipairs(hi_cal) do
		self[factory_id].override.ap_ammo = {
			stats = {
				value = 5,
				--damage = -4,
				total_ammo_mod = -50
			},
			custom_stats = {
				has_ap = true,
				penetration_power_mult = 1.5,
				penetration_damage_mult = 1.5,
				ammo_pickup_min_mul = 0.75,
				ammo_pickup_max_mul = 0.75,
				armor_piercing_add = 0.3,
				shield_damage = 1.05
			},
			desc_id = "bullet_ap_desc_has_pen"
		}
		self[factory_id].override.hp_ammo = { 
			stats = {
				value = 8,
				--damage = 8,
				recoil = -3,
				total_ammo_mod = -50
			}
		}
	end
	
	self.parts.m134_slow = {
		pcs = {},
		type = "custom",
		name_id = "m134_slow",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		stats = {
			value = 0,
			spread = 6
		},
		custom_stats = { 
			rof_mult = 0.55533333333333333333333333333333
		},
		internal_part = true
	}

	self.parts.m134_slower = {
		pcs = {},
		type = "custom",
		name_id = "m134_slower",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		stats = {
			value = 0,
			spread = 14,
			recoil = 8
		},
		custom_stats = { 
			rof_mult = 0.25
		},
		internal_part = true
	}
	
	table.insert(self.wpn_fps_lmg_m134.uses_parts, "m134_slow")
	table.insert(self.wpn_fps_lmg_m134.uses_parts, "m134_slower")
	
	self.parts.corbon_ammo = {
		pcs = {},
		type = "custom",
		name_id = "bullet_corbon",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		stats = {
			value = 10,
			damage = 8,
			spread = 2,
			recoil = 3
		},
		custom_stats = {
			penetration_power_mult = 1.15, 
			penetration_damage_mult = 1.15,
			ammo_pickup_min_mul = 0,
			ammo_pickup_max_mul = 0,
			damage_near_mul = 1.10, 
			damage_far_mul = 1.10
		},
		internal_part = true,
		sub_type = "singlefire",
		forbids = {
			"hp_ammo","low_ammo","match_ammo"
		}
	}
	for i, factory_id in ipairs(self.parts.low_ammo.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "corbon_ammo")
	end
	table.insert(self.wpn_fps_pis_deagle.uses_parts, "corbon_ammo")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "corbon_ammo")
	
	self.parts.win_300_ammo = {
		pcs = {},
		type = "custom",
		name_id = "bullet_300_win",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		stats = {
			value = 7,
			damage = 0,
			spread = 1,
			recoil = 0,
			total_ammo_mod = 0,
			extra_ammo = 0
		},
		custom_stats = {
			damage_far_mul = 1.15, 
			damage_far_mul = 1.15,
			ammo_pickup_min_set = 0.50, 
			ammo_pickup_max_set = 2.40,
		},
		internal_part = true,
		sub_type = "singlefire"
	}
	
	table.insert(self.wpn_fps_snp_msr.uses_parts, "win_300_ammo")
	table.insert(self.wpn_fps_snp_r93.uses_parts, "win_300_ammo")
	
	self.wpn_fps_snp_msr.override.win_300_ammo = {
		stats = {
			value = 7,
			damage = 0,
			spread = 1,
			recoil = 0,
			total_ammo_mod = 0,
			extra_ammo = -4
		}
	}
	self.wpn_fps_snp_r93.override.win_300_ammo = {
		stats = {
			value = 7,
			damage = -28,
			spread = -1,
			recoil = 8,
			total_ammo_mod = 200,
			extra_ammo = -2
		},
		custom_stats = {
			damage_far_mul = 0.90, 
			damage_far_mul = 0.90,
			ammo_pickup_min_set = 0.50, 
			ammo_pickup_max_set = 2.40,
		},
		desc_id = "bullet_300_win_r93_desc"
	}
	--[[
	self.parts.heiap_ammo = {
		pcs = {},
		type = "ammo",
		name_id = "bullet_heiap",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		stats = {
			value = 10,
			damage = 200,
			total_ammo_mod = -66
		},
		custom_stats = {
			bullet_class = "HeiapBulletBase",
			ammo_pickup_min_mul = 0.0,
			ammo_pickup_max_mul = 0.0
		},
		internal_part = true,
		sub_type = "ammo_explosive"
	}
	
	table.insert(self.wpn_fps_snp_m95.uses_parts, "heiap_ammo")
	]]
	
	self.parts.burst_mod = {
		pcs = {},
		type = "custom",
		name_id = "burstfire",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		stats = {
			value = 10,
			spread = 0,
			recoil = 0,
		},
		custom_stats = {has_burst_fire = true},
		perks = {},
		internal_part = true,
		sub_type = "autofire",
		forbids = {
			"wpn_fps_ass_ak5_fg_ak5a", "wpn_fps_ass_ak5_fg_ak5c",
			"wpn_fps_ass_g3_b_sniper"
		}
	}
	for i, factory_id in ipairs(self.parts.burst_mod.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids , "burst_mod")
	end
	
	local swap_auto = { "wpn_fps_ass_amcar","wpn_fps_ass_m4","wpn_fps_ass_m16","wpn_fps_smg_olympic"}
	for i, factory_id in ipairs(swap_auto) do
		table.insert(self[factory_id].uses_parts, "burst_mod")
		self[factory_id].override.burst_mod = {
			custom_stats = {has_burst_fire = true, disable_selector = true, rof_mult = 1.05},
			desc_id = "burstfire_desc_m16"
		}
	end
	
	table.insert(self.wpn_fps_ass_g3.uses_parts, "burst_mod")
	
	table.insert(self.wpn_fps_ass_ak5.uses_parts, "burst_mod")
	self.wpn_fps_ass_ak5.override.burst_mod = {
		desc_id = "burstfire_desc_ak5"
	}
	table.insert(self.wpn_fps_pis_g18c.uses_parts, "burst_mod")
	self.wpn_fps_pis_g18c.override.burst_mod = {
		custom_stats = {has_burst_fire = true, disable_selector = true, rof_mult = 1.05},
		desc_id = "burstfire_desc_g18"
	}
	
	table.insert(self.wpn_fps_pis_beretta.uses_parts, "burst_mod")
	self.wpn_fps_pis_beretta.override.burst_mod = {
		stats = { value = 10, spread = 0, recoil = -4 },
		custom_stats = {has_burst_fire = true, disable_selector = true, block_eq_aced = true, hipfire_mod = 1.25, burst_rof_mult = 2},
		desc_id = "burstfire_desc_raffica"
	}
	
	self.parts.mac_slow = {
		pcs = {},
		type = "custom",
		name_id = "mac_slow",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		stats = {
			value = 5,
			recoil = 6
		},
		custom_stats = {rof_mult = 0.625 },
		internal_part = true,
		sub_type = "autofire"
	}
	
	table.insert(self.wpn_fps_smg_mac10.uses_parts, "mac_slow")
	table.insert(self.wpn_fps_smg_cobray.uses_parts, "mac_slow")
	
	self.wpn_fps_smg_mac10.override.mac_slow = {
		custom_stats = {rof_mult = 0.6521739130434782608695652173913 }
	}
	
	self.parts.sho_birdshot = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_bird",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		stats = { 
			value = 0, 
			damage = -12, 
			spread = -4, 
			recoil = 8, 
			total_ammo_mod = 50 
		},
		custom_stats = { 
			rays = 50, 
			damage_near_mul = 0.5,
			damage_far_mul = 0.9, 
			ammo_pickup_min_mul = 1.025, 
			ammo_pickup_max_mul = 1.05
		},
		internal_part = true,
		sub_type = "ammo_explosive"
	}
	
	local shotgat = {
		'wpn_fps_shot_saiga',
		'wpn_fps_shot_r870',
		'wpn_fps_shot_serbu',
		'wpn_fps_sho_ben',
		'wpn_fps_sho_striker',
		'wpn_fps_sho_ksg',
		'wpn_fps_pis_judge',
		'wpn_fps_sho_aa12'
	}	
	for i, factory_id in ipairs(shotgat) do
		table.insert(self[factory_id].uses_parts, "sho_birdshot")
	end
	
	self.wpn_fps_pis_judge.override.sho_birdshot = { 
		desc_id = "bm_wp_upg_a_bird_judge",
		custom_stats = { rays = 30, damage_near_mul = 0.5, ammo_pickup_min_mul = 1.025, ammo_pickup_max_mul = 1.05, damage_far_mul = 0.9}
	}
	
	self.parts.beowulf = {
		pcs = {},
		type = "ammo",
		name_id = "bullet_beo",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		stats = { 
			value = 10, 
			damage = 52, 
			spread = -8, 
			recoil = -50, 
			total_ammo_mod = -143,
			extra_ammo = -13
		},
		custom_stats = {
			damage_far_mul = 0.75,
			damage_min_mul = 1.15,
			r_recover = 0.5,
			ammo_pickup_min_mul = 0.15,
			ammo_pickup_max_mul = 0.15,
			penetration_power_mult = 2,
			penetration_damage_mult = 2,
			no_crits = true,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			armor_piercing_add = 1
		},
		internal_part = true,
		sub_type = "ammo_poison",
		forbids = {
			"wpn_fps_m4_uupg_b_short", "wpn_fps_m4_uupg_b_long","wpn_fps_m4_uupg_b_medium_vanilla","wpn_fps_m4_uupg_b_sd",
			"wpn_fps_upg_ns_ass_smg_large","wpn_fps_upg_ns_ass_smg_medium","wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_m4_uupg_m_std_vanilla","wpn_fps_m4_uupg_m_std","wpn_fps_upg_m4_m_pmag","wpn_fps_upg_m4_m_quad","wpn_fps_upg_m4_m_drum","wpn_fps_ass_l85a2_m_emag","wpn_fps_upg_m4_m_l5",
		},
	}
	for i, factory_id in ipairs(self.parts.beowulf.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "beowulf")
	end
	
	local nato_ar_br = {
		'wpn_fps_ass_m4','wpn_fps_ass_m16'
	}
	for i, factory_id in ipairs(nato_ar_br) do
		table.insert(self[factory_id].uses_parts, "beowulf")
	end
	
	self.parts.schnellfeuer = {
		pcs = {},
		type = "custom",
		name_id = "schnellfeuer",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		stats = {
			value = 10,
			spread = -2, 
			recoil = -6
		},
		custom_stats = {rof_mult = 2.2222222222222222222222222222222, block_eq_aced = true, hipfire_mod = 1.2, enable_selector = true},
		internal_part = true,
		sub_type = "autofire",
		forbids = {
			"wpn_fps_pis_c96_nozzle"
		}
	}
	for i, factory_id in ipairs(self.parts.schnellfeuer.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "schnellfeuer")
	end
	
	table.insert(self.wpn_fps_pis_c96.uses_parts, "schnellfeuer")
	
	self.parts.m16_stock = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_m16_s_solid",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid",
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/weapons/m16",
		stats = {value = 2, recoil = 4, concealment = -3}
	}
	
	local ar15 = {
		'wpn_fps_ass_amcar','wpn_fps_smg_olympic','wpn_fps_ass_m4'
	}
	for i, factory_id in ipairs(ar15) do
		table.insert(self[factory_id].uses_parts, "m16_stock")
	end
	
	self.parts.shortdot_normal = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_c96_sight",
		a_obj = "a_o",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_shortdot/wpn_fps_upg_o_shortdot",
		third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_shortdot/wpn_third_upg_o_shortdot",
		perks = {"scope"},
		dlc = "dmcwo",
		is_a_unlockable = true,
		alt_icon = "guis/dlcs/gage_pack_historical/textures/pd2/blackmarket/icons/mods/wpn_fps_pis_c96_sight",
		stats = { value = 1, zoom = 8, recoil = 1, concealment = -3},
		custom_stats = { ads_speed_mult = 0.925 },
		forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back","wpn_fps_m4_uupg_o_flipup","loli_butts"  },
		texture_switch = {
			material = "gfx_reddot1",
			channel = "diffuse_texture"
		},
		stance_mod = {
			--wpn_fps_pis_c96 = {translation = Vector3(-3.405, -39.15, 0.93)},
			
			wpn_fps_pis_deagle = { translation = Vector3( 0.0025,-51.7,-5.575 ) },
			wpn_fps_pis_rage = {  translation = Vector3( -0.0025,-43.45,-5.3725 ) },
			wpn_fps_pis_judge  = { translation = Vector3( 0.045,-44.55,-6.08 ) },
			
			wpn_fps_ass_m4 = { translation = Vector3( 0.025,-15.4, -0.905 ) },
			wpn_fps_ass_m16 = { translation = Vector3( 0.025,-15.4, -0.905 ) },
			wpn_fps_ass_ak5 = { translation = Vector3( 0.01,-14.5,-4.4) },
			
			wpn_fps_ass_vhs = { translation = Vector3( -0.001, -18.8, -1.98 ) },
			wpn_fps_ass_aug = { translation = Vector3( 0.035,-15.5,-3.53 ) },
			wpn_fps_ass_famas = { translation = Vector3( 0.015,-22.2,-7 )},	
			wpn_fps_ass_l85a2  = { translation = Vector3( -0.0,-15.0,1.13 ) },
			
			wpn_fps_ass_amcar = { translation = Vector3( 0.025,-15.4, -0.905 ) },
			wpn_fps_ass_g36 = { translation = Vector3( -0.0,-18,-3.81 ) },
			wpn_fps_ass_s552 = { translation = Vector3( -0.0375,-20,-3.6675),rotation = Rotation( 0,0.95,0) },
			wpn_fps_ass_sub2000 = { translation = Vector3( 0.015,-27,-0.825 )  },
			
			wpn_fps_smg_olympic = { translation = Vector3( 0.025,-15.4, -0.905 ) },
			wpn_fps_smg_akmsu = {  translation = Vector3( -0.0,-34.7,-3.755 ) },
			
			wpn_fps_ass_74 = { translation = Vector3( -0.01,-38.5,-3.82 ) },
			wpn_fps_ass_akm = { translation = Vector3( -0.01,-38.5,-3.82 ) },
			wpn_fps_ass_akm_gold = { translation = Vector3( -0.01,-38.5,-3.82 ) },
			wpn_fps_ass_asval = { translation = Vector3( -0.0005,-10.25, -0.75 )},
			
			wpn_fps_smg_m45 = { translation = Vector3( -0.005,-27.5,-4.675 ) },
			wpn_fps_smg_mp9 = { translation = Vector3( -0.003,-17.5,-4.22 ) },
			wpn_fps_smg_mp5 = { translation = Vector3( 0.025,-18,-3.745 ) },
			wpn_fps_smg_mac10 = { translation = Vector3( -0.0125,-35.55,-1.88 )},
			wpn_fps_smg_scorpion= { translation = Vector3( -0.0025,-29.85,-5.93 )},
			wpn_fps_smg_tec9 = { translation = Vector3( 0.035,-22.9,-5.74 )},
			wpn_fps_smg_uzi = { translation = Vector3( 0.00,-24.35,-5.8325 )},
			wpn_fps_smg_sterling = { translation = Vector3( -0.0025,-35.7,-4.3625 )},
			wpn_fps_smg_thompson = { translation = Vector3( 0.025,-41.85,-4.955 )},
			wpn_fps_smg_polymer = { translation = Vector3( 0.035,-23.4,-1.45 )},
					
			wpn_fps_smg_p90 = { translation = Vector3( 0.025,-27.5,-3.525 ) },
			wpn_fps_smg_mp7 = { translation = Vector3( 0.025,-21.55,-3.47 ) },
					
			wpn_fps_lmg_hk21 = { translation = Vector3( 0.0275,-25.8,-4.115 ) },
			wpn_fps_lmg_m249 = { translation = Vector3( 0.02,-16.4,-4.355 ) },
			wpn_fps_lmg_rpk = { translation = Vector3( 0.05,-38.8,-3.81 ) },
			wpn_fps_lmg_mg42 = { translation = Vector3( -0.0,-7.3,-3.6225 ) },
			wpn_fps_lmg_par = { translation = Vector3( 0.0675,-20.3,-3.99 ) },
			
			wpn_fps_shot_saiga = { translation = Vector3( 0.0125,-37.2,-3.47 ) },
			wpn_fps_shot_r870 = { translation = Vector3( 0.03,-27.2,-5.515) },
			wpn_fps_shot_serbu = { translation = Vector3( 0.03,-27.2,-5.515) },
			wpn_fps_sho_ben = { translation = Vector3(0.025, -18.2, -3.92) },
			wpn_fps_sho_striker = { translation = Vector3(0.0275, -21.1, -3.52) },
			wpn_fps_sho_ksg = { translation = Vector3(0.0275, -23.8, -2.1625) },
			wpn_fps_sho_spas12 = { translation = Vector3(-0.155, -29.2, -4.685) },
			
			wpn_fps_ass_m14 = { translation = Vector3(0.005, -33.1, -4.645) },
			wpn_fps_ass_scar = { translation = Vector3(0.015, -16.5, -1.145) },
			wpn_fps_ass_fal = { translation = Vector3( 0.0075,-17,-4.25 )},	
			wpn_fps_ass_g3 = { translation = Vector3( 0,-28.8,-4.2625 )},		
			wpn_fps_ass_galil = { translation = Vector3( 0.026,-22,-4.02 )},
			
			wpn_fps_snp_winchester = { translation = Vector3( -0.005,-41,-3.9125 )},
			
		}
	}
	
	local weapon_factory_ids = {
		"wpn_fps_lmg_mg42","wpn_fps_lmg_hk21","wpn_fps_lmg_m249","wpn_fps_lmg_rpk","wpn_fps_lmg_par",
		
		"wpn_fps_ass_74","wpn_fps_ass_akm","wpn_fps_ass_akm_gold","wpn_fps_smg_akmsu","wpn_fps_ass_asval",
		
		"wpn_fps_smg_olympic","wpn_fps_ass_amcar","wpn_fps_ass_s552","wpn_fps_ass_g36","wpn_fps_ass_sub2000",
		
		"wpn_fps_ass_aug","wpn_fps_ass_famas","wpn_fps_ass_l85a2","wpn_fps_ass_vhs",
		
		"wpn_fps_ass_m4","wpn_fps_ass_m16","wpn_fps_ass_ak5",
		
		"wpn_fps_ass_m14","wpn_fps_ass_fal","wpn_fps_ass_galil","wpn_fps_ass_g3","wpn_fps_ass_scar",
		
		"wpn_fps_smg_mp9","wpn_fps_smg_mp5","wpn_fps_smg_thompson","wpn_fps_smg_mac10","wpn_fps_smg_m45","wpn_fps_smg_uzi","wpn_fps_smg_scorpion","wpn_fps_smg_tec9","wpn_fps_smg_sterling","wpn_fps_smg_polymer",
		
		"wpn_fps_smg_p90","wpn_fps_smg_mp7",
		
		"wpn_fps_shot_r870","wpn_fps_shot_saiga","wpn_fps_sho_ben","wpn_fps_sho_ksg","wpn_fps_shot_serbu","wpn_fps_sho_spas12","wpn_fps_sho_striker",
		
		"wpn_fps_snp_winchester",
		
		"wpn_fps_x_deagle","wpn_fps_pis_deagle","wpn_fps_pis_judge","wpn_fps_pis_rage"
	}
	
	for i, factory_id in ipairs(weapon_factory_ids) do
		table.insert(self[factory_id].uses_parts, "shortdot_normal")
	end
	
end

elseif RequiredScript == "lib/tweak_data/dlctweakdata" then

old_dlc_td = DLCTweakData.init
function DLCTweakData:init(...)
	old_dlc_td(self, ...)
	self.dmcwo = {}
	self.dmcwo.free = true
	self.dmcwo.content = {}
	self.dmcwo.content.loot_global_value = "dmcwo"
	
	self.dmcwo_hp = {}
	self.dmcwo_hp.free = true
	self.dmcwo_hp.content = {}
	self.dmcwo_hp.content.loot_global_value = "dmcwo"
	self.dmcwo_hp.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "hp_ammo",
			amount = 1
		}
	}
	self.dmcwo_ap = {}
	self.dmcwo_ap.free = true
	self.dmcwo_ap.content = {}
	self.dmcwo_ap.content.loot_global_value = "dmcwo"
	self.dmcwo_ap.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "ap_ammo",
			amount = 1
		}
	}
	self.dmcwo_match = {}
	self.dmcwo_match.free = true
	self.dmcwo_match.content = {}
	self.dmcwo_match.content.loot_global_value = "dmcwo"
	self.dmcwo_match.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "match_ammo",
			amount = 1
		}
	}
	self.dmcwo_low = {}
	self.dmcwo_low.free = true
	self.dmcwo_low.content = {}
	self.dmcwo_low.content.loot_global_value = "dmcwo"
	self.dmcwo_low.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "low_ammo",
			amount = 1
		}
	}
	self.dmcwo_m134_slow = {}
	self.dmcwo_m134_slow.free = true
	self.dmcwo_m134_slow.content = {}
	self.dmcwo_m134_slow.content.loot_global_value = "dmcwo"
	self.dmcwo_m134_slow.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "m134_slow",
			amount = 1
		}
	}
	self.dmcwo_m134_slower = {}
	self.dmcwo_m134_slower.free = true
	self.dmcwo_m134_slower.content = {}
	self.dmcwo_m134_slower.content.loot_global_value = "dmcwo"
	self.dmcwo_m134_slower.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "m134_slower",
			amount = 1
		}
	}
	self.dmcwo_corbon_ammo = {}
	self.dmcwo_corbon_ammo.free = true
	self.dmcwo_corbon_ammo.content = {}
	self.dmcwo_corbon_ammo.content.loot_global_value = "dmcwo"
	self.dmcwo_corbon_ammo.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "corbon_ammo",
			amount = 1
		}
	}
	self.dmcwo_win_300_ammo = {}
	self.dmcwo_win_300_ammo.free = true
	self.dmcwo_win_300_ammo.content = {}
	self.dmcwo_win_300_ammo.content.loot_global_value = "dmcwo"
	self.dmcwo_win_300_ammo.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "win_300_ammo",
			amount = 1
		}
	}
	--[[
	self.dmcwo_heiap_ammo = {}
	self.dmcwo_heiap_ammo.free = true
	self.dmcwo_heiap_ammo.content = {}
	self.dmcwo_heiap_ammo.content.loot_global_value = "dmcwo"
	self.dmcwo_heiap_ammo.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "heiap_ammo",
			amount = 1
		}
	}
	]]
	self.dmcwo_burst_mod = {}
	self.dmcwo_burst_mod.free = true
	self.dmcwo_burst_mod.content = {}
	self.dmcwo_burst_mod.content.loot_global_value = "dmcwo"
	self.dmcwo_burst_mod.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "burst_mod",
			amount = 1
		}
	}
	self.dmcwo_mac_slow = {}
	self.dmcwo_mac_slow.free = true
	self.dmcwo_mac_slow.content = {}
	self.dmcwo_mac_slow.content.loot_global_value = "dmcwo"
	self.dmcwo_mac_slow.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "mac_slow",
			amount = 1
		}
	}
	self.dmcwo_birdshot = {}
	self.dmcwo_birdshot.free = true
	self.dmcwo_birdshot.content = {}
	self.dmcwo_birdshot.content.loot_global_value = "dmcwo"
	self.dmcwo_birdshot.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "sho_birdshot",
			amount = 1
		}
	}
	self.dmcwo_beowulf = {}
	self.dmcwo_beowulf.free = true
	self.dmcwo_beowulf.content = {}
	self.dmcwo_beowulf.content.loot_global_value = "dmcwo"
	self.dmcwo_beowulf.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "beowulf",
			amount = 1
		}
	}
	self.dmcwo_schnellfeuer = {}
	self.dmcwo_schnellfeuer.free = true
	self.dmcwo_schnellfeuer.content = {}
	self.dmcwo_schnellfeuer.content.loot_global_value = "dmcwo"
	self.dmcwo_schnellfeuer.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "schnellfeuer",
			amount = 1
		}
	}
	self.dmcwo_m16_stock = {}
	self.dmcwo_m16_stock.free = true
	self.dmcwo_m16_stock.content = {}
	self.dmcwo_m16_stock.content.loot_global_value = "dmcwo"
	self.dmcwo_m16_stock.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "m16_stock",
			amount = 1
		}
	}
end

elseif RequiredScript == "lib/tweak_data/lootdroptweakdata" then

old_loot = LootDropTweakData.init
function LootDropTweakData:init(tweak_data)
	old_loot(self, tweak_data)
	self.global_values.dmcwo = {}
	self.global_values.dmcwo.name_id = "loot_dmcwo"
	self.global_values.dmcwo.desc_id = "loot_dmcwo_desc"
	self.global_values.dmcwo.color = Color('FF0080')
	self.global_values.dmcwo.dlc = false
	self.global_values.dmcwo.chance = 1
	self.global_values.dmcwo.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "infamous")
	self.global_values.dmcwo.durability_multiplier = 3
	self.global_values.dmcwo.drops = false
	self.global_values.dmcwo.track = false
	self.global_values.dmcwo.sort_number = 200
	self.global_values.dmcwo.category = "dmcwo"
end

end
