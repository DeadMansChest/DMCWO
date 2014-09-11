--[[
DON'T do this in the .yml:

    v That right there
- ['*', LUA\postrequire_attach.lua]) 
    ^ That right there
	
or else you'll end up spamming your mod list with each extra attachment by however many lua files PD2 uses on its own (a lot).
]]

if not tweak_data then return end	

table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_ass_g3_s_wood")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_ns_ass_smg_large")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_ns_ass_smg_small")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_specter")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_docter")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_acog")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cs")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_snp_msr_ns_suppressor")

table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_ns_ass_smg_large")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_ns_ass_smg_small")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_specter")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_docter")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_acog")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cs")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_leupold")				

table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_g_hgrip")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_g_pgrip")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_g_wgrip")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ns_ass_smg_large")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ns_ass_smg_small")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_s_psl")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_s_skfoldable")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_specter")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_docter")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_acog")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cs")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_74.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_74.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_74.uses_parts, "wpn_fps_lmg_rpk_fg_standard")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm.uses_parts, "wpn_fps_lmg_rpk_fg_standard")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_fg_standard")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_akmsu.uses_parts, "wpn_upg_ak_s_folding_vanilla_gold")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_ak5.uses_parts, "wpn_fps_m4_uupg_b_short")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_aug.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_aug.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_aug.uses_parts, "wpn_fps_upg_m4_m_quad")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_aug.uses_parts, "wpn_fps_upg_o_mbus_rear")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_p90.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_p90.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_p90.uses_parts, "wpn_fps_upg_o_mbus_rear")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_m14.uses_parts, "wpn_fps_snp_msr_ns_suppressor")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_mp9.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_mp9.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_mp5.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_mp5.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_mac10.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_mac10.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_m45.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_m45.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_s552.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_s552.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_mp7.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_mp7.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_scar.uses_parts, "wpn_fps_snp_msr_ns_suppressor")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_o_leupold")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_m4.uses_parts, "wpn_fps_sho_ben_s_solid")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_famas.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_famas.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_ergo")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_sniper")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_mgrip")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_b_long")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_m_pmag")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_upper_reciever_edge")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_s_pts")								
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_s_fold")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_sho_ben_s_solid")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_smg_olympic_fg_railed")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_m16.uses_parts, "wpn_fps_m4_uupg_s_fold")		

table.insert(tweak_data.weapon.factory.wpn_fps_smg_olympic.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_olympic.uses_parts, "wpn_fps_upg_o_leupold")		
table.insert(tweak_data.weapon.factory.wpn_fps_smg_olympic.uses_parts, "wpn_fps_sho_ben_s_solid")		

table.insert(tweak_data.weapon.factory.wpn_fps_ass_fal.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_fal.uses_parts, "wpn_fps_upg_o_leupold")			
table.insert(tweak_data.weapon.factory.wpn_fps_ass_fal.uses_parts, "wpn_fps_snp_msr_ns_suppressor")			

table.insert(tweak_data.weapon.factory.wpn_fps_ass_galil.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_galil.uses_parts, "wpn_fps_upg_o_leupold")			
table.insert(tweak_data.weapon.factory.wpn_fps_ass_galil.uses_parts, "wpn_fps_snp_msr_ns_suppressor")	

table.insert(tweak_data.weapon.factory.wpn_fps_ass_g3.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_g3.uses_parts, "wpn_fps_upg_o_leupold")			
table.insert(tweak_data.weapon.factory.wpn_fps_ass_g3.uses_parts, "wpn_fps_smg_mp5_s_adjust")			
table.insert(tweak_data.weapon.factory.wpn_fps_ass_g3.uses_parts, "wpn_fps_snp_msr_ns_suppressor")	
										
table.insert(tweak_data.weapon.factory.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_co_1")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_co_comp_2")

table.insert(tweak_data.weapon.factory.wpn_fps_shot_r870.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_r870.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_r870.uses_parts, "wpn_fps_shot_shorty_m_extended_short")

table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_ak_fg_tapco") --the part IRL is for the Saiga anyways, why not?
table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_o_mbus_rear")

table.insert(tweak_data.weapon.factory.wpn_fps_sho_ben.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_sho_ben.uses_parts, "wpn_fps_upg_o_leupold")
	
table.insert(tweak_data.weapon.factory.wpn_fps_sho_ksg.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_sho_ksg.uses_parts, "wpn_fps_upg_o_leupold")
	
table.insert(tweak_data.weapon.factory.wpn_fps_shot_serbu.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_serbu.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_serbu.uses_parts, "wpn_fps_shot_r870_m_extended")

table.insert(tweak_data.weapon.factory.wpn_fps_sho_striker.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_sho_striker.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_sho_striker.uses_parts, "wpn_fps_upg_o_mbus_rear")

--Fuck it, if the Judge can be suppressed somehow, so can this
--NOTE: The Bull won't sound like it's suppressed
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_small")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_slim")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_pis_judge.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_pis_deagle.uses_parts, "wpn_fps_upg_o_leupold")

--Gun adjustments	
tweak_data.weapon.scar.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle

tweak_data.weapon.fal.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle

tweak_data.weapon.galil.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle

tweak_data.weapon.g3.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle

tweak_data.weapon.glock_18c.FIRE_MODE = "single" --starts off on semi-auto to avoid accidental mag dumping, especially if you have Equlibrium

--This WOULD fix the FAL "barrels" to be properly categorized as handguards, however, this breaks **ANY AND ALL** FAL's you own (freezes the game as it's looking for an attached barrel that no longer exsists)
--Buying a new FAL fixes the above crash (as the gun won't have an attached "barrel") but such a dirty and tedious fix won't do. I also don't know the adverse effects of this in MP since, again, the FAL won't have a "barrel".
--[[ tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_standard.type = "foregrip"  
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.type = "foregrip"  
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.type = "foregrip"  
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_03.type = "foregrip"  
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.type = "foregrip" ]]