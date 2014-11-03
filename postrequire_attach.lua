--[[
v0.4.2.3
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

--[[
DON'T wildcard '*' this script in the .yml
i.e don't do this: 

- ['*', LUA\postrequire_attach.lua]

or else you'll end up spamming your mod list with each extra attachment by however many luac files PD2 uses on its own (a lot). Use what I provided in the installation guide
]]

if not tweak_data then return end	

table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_ass_g3_s_wood")
-- table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_ns_ass_smg_large")
-- table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")
-- table.insert(tweak_data.weapon.factory.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_ns_ass_smg_small")
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

-- table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_ns_ass_smg_large")
-- table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")
-- table.insert(tweak_data.weapon.factory.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_ns_ass_smg_small")
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
-- table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ns_ass_smg_large")
-- table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")
-- table.insert(tweak_data.weapon.factory.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ns_ass_smg_small")
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
table.insert(tweak_data.weapon.factory.wpn_fps_ass_74.uses_parts, "wpn_fps_ass_galil_s_wood")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_74.uses_parts, "wpn_fps_sho_ben_s_solid")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm.uses_parts, "wpn_fps_lmg_rpk_fg_standard")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm.uses_parts, "wpn_fps_ass_galil_s_wood")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm.uses_parts, "wpn_fps_sho_ben_s_solid")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_fg_standard")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_ass_galil_s_wood")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_sho_ben_s_solid")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_ass_galil_s_wood")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_sho_ben_s_solid")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_aug.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_aug.uses_parts, "wpn_fps_upg_o_leupold")
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

table.insert(tweak_data.weapon.factory.wpn_fps_smg_tec9.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_tec9.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_uzi.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_uzi.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_scar.uses_parts, "wpn_fps_snp_msr_ns_suppressor")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_o_leupold")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_m4.uses_parts, "wpn_fps_sho_ben_s_solid")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_m4_s_standard")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_famas.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_famas.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_ergo")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_sniper")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_mgrip")			
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_m_pmag")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_upper_reciever_edge")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_s_pts")								
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_s_standard")								
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_s_fold")					
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_sho_ben_s_solid")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_smg_olympic_fg_railed")
table.insert(tweak_data.weapon.factory.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_m_drum")

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
table.insert(tweak_data.weapon.factory.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_g_ergo")

table.insert(tweak_data.weapon.factory.wpn_fps_pis_g26.uses_parts, "wpn_fps_pis_g18c_co_1")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_g26.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_g26.uses_parts, "wpn_fps_pis_g18c_m_mag_33rnd")

table.insert(tweak_data.weapon.factory.wpn_fps_jowi.uses_parts, "wpn_fps_pis_g18c_co_1")
table.insert(tweak_data.weapon.factory.wpn_fps_jowi.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
table.insert(tweak_data.weapon.factory.wpn_fps_jowi.uses_parts, "wpn_fps_pis_g18c_m_mag_33rnd")
table.insert(tweak_data.weapon.factory.wpn_fps_jowi.uses_parts, "wpn_fps_upg_o_rmr")

table.insert(tweak_data.weapon.factory.wpn_fps_shot_r870.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_r870.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_r870.uses_parts, "wpn_fps_shot_shorty_m_extended_short")

table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_ak_fg_tapco") --the part IRL is for the Saiga anyways, why not?
table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_o_mbus_rear")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_ass_galil_s_wood")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_saiga.uses_parts, "wpn_fps_sho_ben_s_solid")

table.insert(tweak_data.weapon.factory.wpn_fps_sho_ben.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_sho_ben.uses_parts, "wpn_fps_upg_o_leupold")
	
table.insert(tweak_data.weapon.factory.wpn_fps_sho_ksg.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_sho_ksg.uses_parts, "wpn_fps_upg_o_leupold")
	
table.insert(tweak_data.weapon.factory.wpn_fps_shot_serbu.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_serbu.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_shot_serbu.uses_parts, "wpn_fps_shot_r870_m_extended")

table.insert(tweak_data.weapon.factory.wpn_fps_sho_spas12.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_sho_spas12.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_sho_striker.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(tweak_data.weapon.factory.wpn_fps_sho_striker.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_sho_striker.uses_parts, "wpn_fps_upg_o_mbus_rear")



--Fuck it, if the Judge can be suppressed somehow, so can this
--NOTE: The Bull won't sound like it's suppressed
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large_kac")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_gem")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_small")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_slim")
table.insert(tweak_data.weapon.factory.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_pis_judge.uses_parts, "wpn_fps_upg_o_leupold")

table.insert(tweak_data.weapon.factory.wpn_fps_pis_deagle.uses_parts, "wpn_fps_upg_o_leupold")

--Still working on this
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_rmr")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_pis_deagle_extra")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_specter")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_docter")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_acog")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_cs")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(tweak_data.weapon.factory.wpn_fps_x_deagle.uses_parts, "wpn_upg_o_marksmansight_rear")

table.insert(tweak_data.weapon.factory.wpn_fps_x_1911.uses_parts, "wpn_upg_o_marksmansight_rear")
table.insert(tweak_data.weapon.factory.wpn_fps_x_1911.uses_parts, "wpn_fps_upg_o_rmr")

table.insert(tweak_data.weapon.factory.wpn_fps_x_b92fs.uses_parts, "wpn_fps_upg_o_rmr")
table.insert(tweak_data.weapon.factory.wpn_fps_x_b92fs.uses_parts, "wpn_upg_o_marksmansight_rear")

--Had to put these here as the game doesn't like loading the game without the RMR having a parent
tweak_data.weapon.factory.wpn_fps_jowi.override = {
	wpn_fps_pis_g26_m_standard = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		}
	},
	wpn_fps_pis_g26_m_contour = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		}
	},
	wpn_fps_pis_g26_b_standard = {
		animations = {
			reload = "reload_right",
			reload_left = "reload_left",
			fire = "recoil"
		}
	},
	wpn_fps_pis_g26_b_custom = {
		animations = {
			reload = "reload_right",
			reload_left = "reload_left",
			fire = "recoil"
		}
	},
	wpn_fps_pis_g18c_m_mag_33rnd = {
			stats = { value = 6, spread_moving = -3, extra_ammo = 46, concealment = -2 },
	},
	wpn_fps_upg_o_rmr = {parent = "slide"}
}

tweak_data.weapon.factory.wpn_fps_x_b92fs.override = {
	wpn_fps_upg_pis_ns_flash = {
		parent = "lower_reciever"
	},
	wpn_fps_upg_ns_pis_medium_slim = {
		parent = "lower_reciever"
	},
	wpn_fps_pis_beretta_m_std = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		}
	},
	wpn_fps_pis_beretta_m_extended = {
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
	},
	wpn_fps_pis_beretta_sl_std = {
		animations = {
			reload = "reload_right",
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	},
	wpn_fps_pis_beretta_sl_brigadier = {
		animations = {
			reload = "reload_right",
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	},
	wpn_upg_o_marksmansight_front = {a_obj = "a_os"},
	wpn_fps_upg_o_rmr = {parent = "upper_reciever"}
}
	
tweak_data.weapon.factory.wpn_fps_x_1911.override = {
	wpn_fps_pis_1911_m_standard = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		}
	},
	wpn_fps_pis_1911_m_extended = {
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
	},
	wpn_fps_pis_1911_b_standard = {
		animations = {
			reload = "reload_right",
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	},
	wpn_fps_pis_1911_b_long = {
		animations = {
			reload = "reload_right",
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	},
	wpn_fps_pis_1911_b_vented = {
		animations = {
			reload = "reload_right",
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	},
	wpn_upg_o_marksmansight_rear = {
		a_obj = "a_o",
		forbids = {
			"wpn_fps_pis_1911_o_long",
			"wpn_fps_pis_1911_o_standard"
		}
	},
	wpn_upg_o_marksmansight_front = {a_obj = "a_os"},
	wpn_fps_upg_o_rmr = {parent = "slide"}
}

tweak_data.weapon.factory.wpn_fps_x_deagle.override = {
	wpn_fps_pis_deagle_m_standard = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		}
	},
	wpn_fps_pis_deagle_m_extended = {
		animations = {reload = "reload_right",reload_not_empty = "reload_not_empty_right",reload_left = "reload_left",reload_not_empty_left = "reload_not_empty_left"},
		stats = {value = 7, concealment = -2, spread_moving = -2, extra_ammo = 6}
	},
	wpn_fps_pis_deagle_body_standard = {
		animations = {reload = "reload_right",reload_left = "reload_left",fire = "recoil",fire_steelsight = "recoil"}
	},
	wpn_upg_o_marksmansight_rear = {
	a_obj = "a_o",
	forbids = {
		"wpn_fps_pis_deagle_o_standard_front",
		"wpn_fps_pis_deagle_o_standard_front_long",
		"wpn_fps_pis_deagle_o_standard_rear"
	}
	},
	wpn_upg_o_marksmansight_front = {a_obj = "a_os",	
	},
	wpn_fps_upg_o_specter = {a_obj = "a_quite",
	stats = { value = 8, zoom = 0, recoil = 1, spread_moving = -3, concealment = -3 }
	},
	wpn_fps_upg_o_aimpoint = {a_obj = "a_quite",
	stats = { value = 8, zoom = 0, recoil = 0, spread_moving = -3, concealment = -3 }
	},
	wpn_fps_upg_o_aimpoint_2 = {a_obj = "a_quite",
	stats = { value = 8, zoom = 0, recoil = 0, spread_moving = -3, concealment = -3 }
	},
	wpn_fps_upg_o_docter = {a_obj = "a_quite",
	stats = { value = 5, zoom = 0, recoil = 0, spread_moving = -1, concealment = -1 }
	},
	wpn_fps_upg_o_eotech = {a_obj = "a_quite",
	stats = { value = 3, zoom = 0, recoil = 0, spread_moving = -2, concealment = -2 }
	},
	wpn_fps_upg_o_t1micro = {a_obj = "a_quite",
	stats = { value = 3, zoom = 0, recoil = 0, spread_moving = -1, concealment = -1 }
	},
	wpn_fps_upg_o_cmore = {a_obj = "a_quite",
	stats = { value = 5, zoom = 0, recoil = 0, spread_moving = -1, concealment = -1 }
	},
	wpn_fps_upg_o_acog = {a_obj = "a_quite",
	stats = { value = 6, zoom = 0, recoil = 1, spread_moving = -1, concealment = -3 }
	},
	wpn_fps_upg_o_cs = {a_obj = "a_quite",
	stats = { value = 5, zoom = 0, recoil = 0, spread_moving = -3, concealment = -1 }
	},
	wpn_fps_upg_o_eotech_xps = {a_obj = "a_quite",
	stats = { value = 5, zoom = 0, recoil = 0, spread_moving = -3, concealment = -2 }
	},
	wpn_fps_upg_o_reflex = {a_obj = "a_quite",
	stats = { value = 5, zoom = 0, recoil = 0, spread_moving = -3, concealment = -1 }
	},
	wpn_fps_upg_o_rx01 = {a_obj = "a_quite",
	stats = { value = 5, zoom = 0, recoil = 0, spread_moving = -3, concealment = -1 }
	},
	wpn_fps_upg_o_rx30 = {a_obj = "a_quite",
	stats = { value = 5, zoom = 0, recoil = 0, spread_moving = -3, concealment = -2 }
	},
	wpn_fps_upg_o_leupold = {a_obj = "a_quite",
	stats = {value = 8, zoom = 0, recoil = 2, spread_moving = -3, concealment = -3}
	},
	wpn_fps_upg_o_rmr = {
		parent = "lower_reciever"
	}
}

--Gun adjustments	
tweak_data.weapon.gre_m79.crosshair.standing.hidden = false
tweak_data.weapon.scar.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle

tweak_data.weapon.fal.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle

tweak_data.weapon.galil.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle

tweak_data.weapon.g3.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle

tweak_data.weapon.glock_18c.FIRE_MODE = "single" --starts off on semi-auto to avoid accidental mag dumping, especially if you have Equlibrium

tweak_data.weapon.tec9.FIRE_MODE = "single" --Sets the gun to semi-auto ONLY
tweak_data.weapon.tec9.CAN_TOGGLE_FIREMODE = false