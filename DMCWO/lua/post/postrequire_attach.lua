--[[
v1.42.3
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/tweak_data/weaponfactorytweakdata" then

--NOTE: Any attachments added to weapons here will NOT affect concealment with a non-user host
--NOTE 2: That said I'm slowly negating the concealment changes mods made to weapons they're not normally available on i.e. optics for LMGs won't do -x to concealment and so on until either: 1. Concealment levels become client based or 2. OVK officially adds w/e mod(s) to w/e gun(s)
local old_wftd_init = WeaponFactoryTweakData.init
function WeaponFactoryTweakData:init()
	old_wftd_init(self)
	self:DMCWO_general()
	self:DMCWO_mods()
end
	
function WeaponFactoryTweakData:DMCWO_general()
	--Temporary, might reenable this unless something "else" happens --{
	--[[
	self.parts.wpn_fps_upg_o_specter.reticle_obj = "g_gfx"
	self.parts.wpn_fps_upg_o_aimpoint.reticle_obj = "g_gfx"
	self.parts.wpn_fps_upg_o_aimpoint_2.reticle_obj = "g_gfx"
	self.parts.wpn_fps_upg_o_docter.reticle_obj = "g_gfx"
	self.parts.wpn_fps_upg_o_eotech.reticle_obj = "g_reddot"
	self.parts.wpn_fps_upg_o_t1micro.reticle_obj = "g_gfx"
	self.parts.wpn_fps_upg_o_cmore.reticle_obj = "g_reddot"
	self.parts.wpn_fps_upg_o_acog.reticle_obj = "g_reddot"
	self.parts.wpn_fps_upg_o_cs.reticle_obj = "g_reddot"
	self.parts.wpn_fps_upg_o_eotech_xps.reticle_obj = "g_reddot"
	self.parts.wpn_fps_upg_o_reflex.reticle_obj = "g_reddot"
	self.parts.wpn_fps_upg_o_rx01.reticle_obj = "g_reddot"
	self.parts.wpn_fps_upg_o_rx30.reticle_obj = "g_reddot"
	self.parts.wpn_fps_upg_o_rmr.reticle_obj = "g_reddot"
	]]
	self.parts.wpn_fps_upg_o_shortdot.reticle_obj = nil
	self.parts.wpn_fps_upg_o_leupold.reticle_obj = nil
	self.parts.wpn_fps_pis_c96_sight.reticle_obj = nil
	self.parts.wpn_fps_upg_winchester_o_classic.reticle_obj = nil
	--}
	
	self.wpn_fps_pis_rage.override = {
		wpn_fps_upg_o_leupold = { stats = { value = 8, zoom = 10, recoil = 2} },
		wpn_fps_pis_c96_sight = { stats = { value = 1, zoom = 8, recoil = 1} },
	}
	self.wpn_fps_pis_deagle.override = {
		wpn_upg_o_marksmansight_rear = {
			a_obj = "a_o",
			forbids = {
				"wpn_fps_pis_deagle_o_standard_front",
				"wpn_fps_pis_deagle_o_standard_front_long",
				"wpn_fps_pis_deagle_o_standard_rear"
			}
		},
		wpn_upg_o_marksmansight_front = {a_obj = "a_os"},
		wpn_fps_upg_o_specter = {a_obj = "a_quite"},
		wpn_fps_upg_o_aimpoint = {a_obj = "a_quite"},
		wpn_fps_upg_o_aimpoint_2 = {a_obj = "a_quite"},
		wpn_fps_upg_o_docter = {a_obj = "a_quite"},
		wpn_fps_upg_o_eotech = {a_obj = "a_quite"},
		wpn_fps_upg_o_t1micro = {a_obj = "a_quite"},
		wpn_fps_upg_o_cmore = {a_obj = "a_quite"},
		wpn_fps_upg_o_acog = {a_obj = "a_quite"},
		wpn_fps_upg_o_cs = {a_obj = "a_quite"},
		wpn_fps_upg_o_eotech_xps = {a_obj = "a_quite"},
		wpn_fps_upg_o_reflex = {a_obj = "a_quite"},
		wpn_fps_upg_o_rx01 = {a_obj = "a_quite"},
		wpn_fps_upg_o_rx30 = {a_obj = "a_quite"},
		wpn_fps_upg_o_rmr = {
			parent = "lower_reciever"
		},
		wpn_fps_upg_o_leupold = { 
			a_obj = "a_quite",
			stats = {value = 8,zoom = 10, recoil = 2} 
		},
		wpn_fps_pis_c96_sight = { 
			a_obj = "a_quite",
			stats = {value = 1,zoom = 8, recoil = 1} 
		}
	
	}
	
	self.wpn_fps_pis_2006m.override = {}
	
	self.wpn_fps_snp_winchester.override = deep_clone(self.wpn_fps_pis_rage.override)
	
	self.wpn_fps_lmg_m134.override = {}
	
	self.wpn_fps_lmg_mg42.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_lmg_hk21.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_lmg_rpk.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_lmg_m249.override = deep_clone(self.wpn_fps_pis_rage.override)
	
	self.wpn_fps_ass_m14.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_scar.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_fal.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_g3.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_galil.override = deep_clone(self.wpn_fps_pis_rage.override)
	
	self.wpn_fps_smg_akmsu.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_olympic.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_amcar.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_g36.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_s552.override = deep_clone(self.wpn_fps_pis_rage.override)
	
	self.wpn_fps_ass_famas.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_vhs.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_l85a2.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_aug.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_or"},
		wpn_upg_o_marksmansight_front_vanilla = {a_obj = "a_of"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_of"},
		wpn_fps_upg_o_leupold = { stats = {value = 8,zoom = 10, recoil = 2} },
		wpn_fps_pis_c96_sight = { stats = {value = 1,zoom = 8, recoil = 1} }
	
	}
	self.wpn_fps_ass_m4.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_m16.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_ak5.override = deep_clone(self.wpn_fps_pis_rage.override)
	
	self.wpn_fps_ass_74.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_akm.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_ass_akm_gold.override = deep_clone(self.wpn_fps_pis_rage.override)
	
	self.wpn_fps_smg_mac10.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_or"},
		wpn_upg_o_marksmansight_front_vanilla = {a_obj = "a_of"},
		wpn_fps_upg_o_leupold = { stats = {value = 8,zoom = 10, recoil = 2} },
		wpn_fps_pis_c96_sight = { stats = {value = 1,zoom = 8, recoil = 1} }
	
	}
	self.wpn_fps_smg_mp5.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_mp9.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_thompson.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_sterling.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_scorpion.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_tec9.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_uzi.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_m45.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_mp7.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_smg_p90.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_or"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_of"},
		wpn_fps_upg_o_leupold = { stats = {value = 8,zoom = 10, recoil = 2} },
		wpn_fps_pis_c96_sight = { stats = {value = 1,zoom = 8, recoil = 1} }
	
	}
	
	self.wpn_fps_snp_msr.override = {}
	self.wpn_fps_snp_wa2000.override = {}
	self.wpn_fps_snp_mosin.override = {}
	self.wpn_fps_snp_r93.override = {}
	self.wpn_fps_snp_m95.override = {
		wpn_fps_upg_m4_g_mgrip = {
			stats = { value = 2, spread_moving = 2, concealment = 1 }
		}
	}
	
	self.wpn_fps_shot_r870.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_shot_huntsman.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_sho_spas12.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_sho_ben.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_shot_serbu.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_sho_aa12.override = deep_clone(self.wpn_fps_pis_rage.override)
	self.wpn_fps_pis_judge.override = {
		wpn_fps_upg_ns_shot_shark = {parent = "slide"},
		wpn_fps_upg_ns_shot_thick = {parent = "slide"},
		wpn_fps_upg_shot_ns_king = {parent = "slide"},
		wpn_fps_upg_ns_sho_salvo_large = {parent = "slide"},
		wpn_fps_upg_o_leupold = { stats = {value = 8,zoom = 10, recoil = 2} },
		wpn_fps_pis_c96_sight = { stats = {value = 1,zoom = 8, recoil = 1} }	
	}
	self.wpn_fps_shot_saiga.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_or"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_of"},
		wpn_fps_upg_o_leupold = { stats = {value = 8,zoom = 10, recoil = 2} },
		wpn_fps_pis_c96_sight = { stats = {value = 1,zoom = 8, recoil = 1} }
	}
	self.wpn_fps_sho_striker.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_o_r"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_o_f"},
		wpn_fps_upg_o_leupold = { stats = {value = 8,zoom = 10, recoil = 2} },
		wpn_fps_pis_c96_sight = { stats = {value = 1,zoom = 8, recoil = 1} }
	
	}
	
	local weapon_factory_ids = {
	"wpn_fps_lmg_mg42","wpn_fps_lmg_hk21","wpn_fps_lmg_m249","wpn_fps_lmg_rpk",
	
	"wpn_fps_ass_74","wpn_fps_ass_akm","wpn_fps_ass_akm_gold","wpn_fps_smg_akmsu","wpn_fps_ass_asval",
	
	"wpn_fps_smg_olympic","wpn_fps_ass_amcar","wpn_fps_ass_s552","wpn_fps_ass_g36","wpn_fps_ass_sub2000",
	
	"wpn_fps_ass_aug","wpn_fps_ass_famas","wpn_fps_ass_l85a2","wpn_fps_ass_vhs",
	
	"wpn_fps_ass_m4","wpn_fps_ass_m16","wpn_fps_ass_ak5",
	
	"wpn_fps_ass_m14","wpn_fps_ass_fal","wpn_fps_ass_galil","wpn_fps_ass_g3","wpn_fps_ass_scar",
	
	"wpn_fps_smg_mp9","wpn_fps_smg_mp5","wpn_fps_smg_thompson","wpn_fps_smg_mac10","wpn_fps_smg_m45","wpn_fps_smg_uzi","wpn_fps_smg_scorpion","wpn_fps_smg_tec9","wpn_fps_smg_sterling","wpn_fps_smg_polymer",
	
	"wpn_fps_smg_p90","wpn_fps_smg_mp7",
	
	"wpn_fps_shot_r870","wpn_fps_shot_saiga","wpn_fps_sho_ben","wpn_fps_sho_ksg","wpn_fps_shot_serbu","wpn_fps_sho_spas12","wpn_fps_sho_striker",
	
	"wpn_fps_snp_winchester"
	
	}
	for i, factory_id in ipairs(weapon_factory_ids) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_45iron")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_leupold")
		table.insert(self[factory_id].uses_parts, "wpn_fps_pis_c96_sight")
	end
	
	local lmg_sights = {
	"wpn_fps_lmg_mg42","wpn_fps_lmg_hk21","wpn_fps_lmg_m249","wpn_fps_lmg_rpk","wpn_fps_snp_winchester","wpn_fps_smg_baka"
	}
	for i, factory_id in ipairs(lmg_sights) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_specter")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_aimpoint")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_docter")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_eotech")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_t1micro")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_cmore")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_aimpoint_2")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_acog")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_cs")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_rx30")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_rx01")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_reflex")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_eotech_xps")
	end
	
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_ass_g3_s_wood")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_i_autofire")
	--table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
	
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_g_hgrip")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_g_pgrip")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_g_wgrip")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_s_psl")
	
	table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_lmg_rpk_fg_standard")
	table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_shot_r870_s_solid")
	
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_lmg_rpk_fg_standard")
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_shot_r870_s_solid")
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_upg_ak_m_drum")
	
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_fg_standard")
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_shot_r870_s_solid")
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_upg_ak_m_drum")
	
	table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_shot_r870_s_solid")
		
	table.insert(self.wpn_fps_smg_olympic.uses_parts, "wpn_fps_shot_r870_s_solid")
	
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_ergo")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_sniper")					
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_mgrip")			
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_m_pmag")					
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_upper_reciever_edge")					
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_s_pts")								
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_shot_r870_s_solid")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_smg_olympic_fg_railed")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_m_drum")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_ass_l85a2_m_emag")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_ballos")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_core")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_lower_reciever_core")
	
	table.insert(self.wpn_fps_smg_p90.uses_parts, "wpn_fps_upg_o_mbus_rear")
	
	table.insert(self.wpn_fps_ass_aug.uses_parts, "wpn_fps_upg_o_mbus_rear")
					
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_shot_r870_s_solid")
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_m4_s_standard")
	
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_m4_uupg_s_fold") --VANITY
	
	--table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
		
	--table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_snp_msr_ns_suppressor")			
			
	--table.insert(self.wpn_fps_ass_galil.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
			
	--table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
	table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_smg_mp5_s_adjust") --VANITY
	
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
	--table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
											
	table.insert(self.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_g_ergo")
	
	table.insert(self.wpn_fps_pis_g26.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_g26.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_g26.uses_parts, "wpn_fps_pis_g18c_m_mag_33rnd")
	
	table.insert(self.wpn_fps_pis_hs2000.uses_parts, "wpn_fps_pis_p226_co_comp_1")
	table.insert(self.wpn_fps_pis_hs2000.uses_parts, "wpn_fps_pis_p226_co_comp_2")
	
	table.insert(self.wpn_fps_jowi.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_jowi.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_jowi.uses_parts, "wpn_fps_pis_g18c_m_mag_33rnd")
	table.insert(self.wpn_fps_jowi.uses_parts, "wpn_fps_upg_o_rmr")
	
	table.insert(self.wpn_fps_shot_r870.uses_parts, "wpn_fps_shot_shorty_m_extended_short")
	
	table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_ak_fg_tapco") --the part IRL is for the Saiga anyways, why not?
	table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_o_mbus_rear")
	table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_shot_r870_s_solid")
	
	table.insert(self.wpn_fps_shot_serbu.uses_parts, "wpn_fps_shot_r870_m_extended")
	
	table.insert(self.wpn_fps_sho_striker.uses_parts, "wpn_fps_upg_o_mbus_rear")
	
	table.insert(self.wpn_fps_snp_msr.uses_parts, "wpn_fps_snp_mosin_iron_sight")
	table.insert(self.wpn_fps_snp_r93.uses_parts, "wpn_fps_snp_mosin_iron_sight")
	table.insert(self.wpn_fps_snp_m95.uses_parts, "wpn_fps_snp_mosin_iron_sight")
	
	--Fuck it, if the Judge can be suppressed somehow, so can this
	--NOTE: The Bull won't sound like it's suppressed
	--NOTE 2: Disabled suppressors as you crash if you're a client and playing with a non-user host
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large_kac")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_gem")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_small")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_slim")
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_o_leupold")
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_pis_c96_sight")
	
	table.insert(self.wpn_fps_pis_judge.uses_parts, "wpn_fps_upg_o_leupold")
	table.insert(self.wpn_fps_pis_judge.uses_parts, "wpn_fps_pis_c96_sight")
	
	table.insert(self.wpn_fps_pis_deagle.uses_parts, "wpn_fps_upg_o_leupold")
	table.insert(self.wpn_fps_pis_deagle.uses_parts, "wpn_fps_pis_c96_sight")
	
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_rmr")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_pis_deagle_extra")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_acog")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_leupold")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_pis_c96_sight")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_upg_o_marksmansight_rear")
	
	table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_upg_o_marksmansight_rear")
	table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_fps_upg_o_rmr")
	
	table.insert(self.wpn_fps_x_b92fs.uses_parts, "wpn_fps_upg_o_rmr")
	table.insert(self.wpn_fps_x_b92fs.uses_parts, "wpn_upg_o_marksmansight_rear")
	
	table.insert(self.wpn_fps_pis_c96.uses_parts, "wpn_fps_upg_i_autofire")
	
	--Had to put these here as the game doesn't like loading without the RMR having a parent
	self.wpn_fps_jowi.override.wpn_fps_upg_o_rmr = {
			parent = "slide",
			stats = { value = 1, concealment = -0, recoil = 0, zoom = 0}
		}
		
	self.wpn_fps_x_b92fs.override.wpn_fps_upg_o_rmr = {
			parent = "upper_reciever",
			stats = { value = 1, concealment = -0, recoil = 0, zoom = 0}
		}
		
	self.wpn_fps_x_1911.override.wpn_fps_upg_o_rmr = {
			parent = "slide",
			stats = { value = 1, concealment = -0, recoil = 0, zoom = 0}
		}
	
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_rmr = {
			parent = "lower_reciever",
			stats = { value = 1, concealment = -0, recoil = 0, zoom = 1}
		}
		
	self.parts.wpn_fps_ass_g3_b_sniper.override = {}
	self.parts.wpn_fps_ass_g3_b_sniper.adds = {}
	
	self.wpn_fps_smg_olympic.override.wpn_fps_shot_r870_s_solid = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid"
	}
	
	self.wpn_fps_ass_amcar.override.wpn_fps_shot_r870_s_solid = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid"
	}
	self.wpn_fps_ass_amcar.override.wpn_fps_m4_uupg_b_medium_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long"
	}
	self.wpn_fps_ass_amcar.override.wpn_fps_smg_olympic_fg_railed = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail",
		forbids = {}
	}
	
	self.wpn_fps_ass_m4.override.wpn_fps_m4_upper_reciever_round = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	}
	self.wpn_fps_ass_m4.override.wpn_fps_m4_upper_reciever_round_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	}
	self.wpn_fps_ass_m4.override.wpn_fps_m4_uupg_draghandle = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle"
	}
	self.wpn_fps_ass_m4.override.wpn_fps_m4_uupg_draghandle_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle"
	}
	self.wpn_fps_ass_m4.override.wpn_fps_shot_r870_s_solid = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid"
	}
	
	self.parts.wpn_upg_saiga_m_20rnd.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/magazine"
	self.parts.wpn_upg_saiga_m_20rnd.animations = {} --Thx SC
	self.parts.wpn_fps_smg_mp5_m_drum.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/magazine"
	self.parts.wpn_fps_upg_m4_m_drum.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/magazine"
	self.parts.wpn_upg_ak_m_drum.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/magazine"
	
end


function WeaponFactoryTweakData:DMCWO_mods()

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
			damage = 4,
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
		sub_type = "ammo_explosive"
	}
	
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
			damage = -2,
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
			"wpn_fps_smg_sterling_b_e11","wpn_fps_smg_mp5_m_drum","wpn_fps_smg_mp5_m_straight"
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
			"wpn_fps_upg_ns_ass_smg_small","wpn_fps_upg_ns_ass_smg_medium","wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_snp_msr_ns_suppressor",
			"wpn_fps_snp_wa2000_b_suppressed","wpn_fps_snp_r93_b_suppressed",
			"wpn_fps_upg_ns_ass_pbs1",
			"wpn_fps_m4_uupg_b_sd","wpn_fps_snp_m95_barrel_suppressed",
			"wpn_fps_ass_famas_b_suppressed","wpn_fps_lmg_mg42_b_vg38",
			"wpn_fps_smg_sterling_b_suppressed","wpn_fps_smg_sterling_b_e11",
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
		if not self[factory_id].override then
			self[factory_id].override = {}
		end
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
				damage = -4,
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
				damage = 8,
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
			spread = 14
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
			value = 12,
			damage = 8,
			spread = 2,
			recoil = 3,
			total_ammo_mod = -100
		},
		custom_stats = {
			penetration_power_mult = 1.15, 
			penetration_damage_mult = 1.15,
			ammo_pickup_min_mul = 0.5,
			ammo_pickup_max_mul = 0.5,
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
			ammo_pickup_min_mul = 0.90,
			ammo_pickup_max_mul = 0.90
		},
		internal_part = true,
		sub_type = "singlefire"
	}
	
	table.insert(self.wpn_fps_snp_msr.uses_parts, "win_300_ammo")
	table.insert(self.wpn_fps_snp_wa2000.uses_parts, "win_300_ammo")
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
			ammo_pickup_min_mul = 1.1,
			ammo_pickup_max_mul = 1.1
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
			value = 20,
			damage = 200,
			total_ammo_mod = -66
		},
		custom_stats = {
			damage_far_mul = 1.15, 
			damage_far_mul = 1.15,
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
			"wpn_fps_ass_ak5_fg_ak5a", "wpn_fps_ass_ak5_fg_ak5c"
		}
	}
	for i, factory_id in ipairs(self.parts.burst_mod.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids , "burst_mod")
	end
	
	local swap_auto = { "wpn_fps_ass_amcar","wpn_fps_ass_m4","wpn_fps_ass_m16","wpn_fps_smg_olympic", "wpn_fps_pis_g18c" }
	for i, factory_id in ipairs(swap_auto) do
		table.insert(self[factory_id].uses_parts, "burst_mod")
		if not self[factory_id].override then
			self[factory_id].override = {}
		end
		self[factory_id].override.burst_mod = {
			custom_stats = {has_burst_fire = true, disable_selector = true},
			desc_id = "burstfire_desc_m16"
		}
	end
	
	table.insert(self.wpn_fps_ass_ak5.uses_parts, "burst_mod")
	
	table.insert(self.wpn_fps_pis_beretta.uses_parts, "burst_mod")
	self.wpn_fps_pis_beretta.override.burst_mod = {
		stats = { value = 10, spread = 0, recoil = -4 },
		custom_stats = {has_burst_fire = true, disable_selector = true, block_eq_aced = true, burst_rof_mult = 2, hipfire_mod = 2.5},
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
			value = 5, 
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
	
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom_free = { 
		desc_id = "bm_wp_upg_a_bird_judge",
		custom_stats = { rays = 30, damage_near_mul = 0.0, ammo_pickup_min_mul = 1.025, ammo_pickup_max_mul = 1.05, damage_far_mul = 0.9}
	}
	
	
end

elseif RequiredScript == "lib/tweak_data/dlctweakdata" then

old_dlc_td = DLCTweakData.init
function DLCTweakData:init(...)
	old_dlc_td(self, ...)
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
end

elseif RequiredScript == "lib/tweak_data/lootdroptweakdata" then

old_loot = LootDropTweakData.init
function LootDropTweakData:init(tweak_data)
	old_loot(self, tweak_data)
	self.global_values.dmcwo = {}
	self.global_values.dmcwo.name_id = "loot_dmcwo"
	self.global_values.dmcwo.desc_id = "loot_dmcwo_desc"
	self.global_values.dmcwo.color = Color('9900CC')
	self.global_values.dmcwo.dlc = false
	self.global_values.dmcwo.chance = 1
	self.global_values.dmcwo.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "normal")
	self.global_values.dmcwo.durability_multiplier = 3
	self.global_values.dmcwo.drops = false
	self.global_values.dmcwo.track = false
	self.global_values.dmcwo.sort_number = 30
	self.global_values.dmcwo.category = "dmcwo"
end


elseif RequiredScript == "lib/tweak_data/weapontweakdata" then

--Gun adjustments

old_wtd = WeaponTweakData._init_new_weapons

function WeaponTweakData:_init_new_weapons(...)
	old_wtd(self,...)
	
	local start_semi = {'glock_18c','new_m14','scar','fal','galil','g3','tec9'}
	for i, wep_id in ipairs(start_semi) do
		self[ wep_id ].FIRE_MODE = "single"
	end
		
	local eight_nine = {'ak74','s552','new_m4','vhs','saiga','scar','aug','famas','r870','benelli','ak5','spas12','m16','mosin','striker','b682'}
	for i, wep_id in ipairs(eight_nine) do
		self[ wep_id ].weapon_movement_penalty = 0.95
	end
	local nine_ten = {'akm','fal','galil','winchester1874','m1928'}
	for i, wep_id in ipairs(nine_ten) do
		self[ wep_id ].weapon_movement_penalty = 0.925
	end	
	local ten_eleven = {'akm_gold','g3','rpk','new_m14','l85a2','aa12'}
	for i, wep_id in ipairs(ten_eleven) do
		self[ wep_id ].weapon_movement_penalty = 0.9
	end
	
	local eleven_twelve = {'m32'}
	for i, wep_id in ipairs(eleven_twelve) do
		self[ wep_id ].weapon_movement_penalty = 0.875
	end
	local thirteen_fourteen = {'msr'}
	for i, wep_id in ipairs(thirteen_fourteen) do
		self[ wep_id ].weapon_movement_penalty = 0.825
	end
	local fourteen_fifteen	= {'r93','rpg7','flamethrower_mk2'}
	for i, wep_id in ipairs(fourteen_fifteen) do
		self[ wep_id ].weapon_movement_penalty = 0.8
	end
	local sixteen_seventeen = {'wa2000'}
	for i, wep_id in ipairs(sixteen_seventeen) do
		self[ wep_id ].weapon_movement_penalty = 0.725
	end
	
	local twenty = {'m249'}
	for i, wep_id in ipairs(twenty) do
		self[ wep_id ].weapon_movement_penalty = 0.675
	end
	local twentytwo = {'hk21'}
	for i, wep_id in ipairs(twentytwo) do
		self[ wep_id ].weapon_movement_penalty = 0.65
	end
	local twentyfour = {'m95'}
	for i, wep_id in ipairs(twentyfour) do
		self[ wep_id ].weapon_movement_penalty = 0.625
	end
	local twentyfive = {'mg42'}
	for i, wep_id in ipairs(twentyfive) do
		self[ wep_id ].weapon_movement_penalty = 0.6
	end
	local fourty = {'m134'}
	for i, wep_id in ipairs(fourty) do
		self[ wep_id ].weapon_movement_penalty = 0.5
	end
end

end
