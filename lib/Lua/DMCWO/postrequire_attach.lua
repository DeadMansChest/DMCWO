--[[
v1.2.2
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

if RequiredScript == "lib/tweak_data/weaponfactorytweakdata" then

--NOTE: Any attachments added to weapons here will NOT affect concealment with a non-user host
--NOTE 2: That said I'm slowly negating the concealment changes mods made to weapons they're not normally available on i.e. optics for LMGs won't do -x to concealment and so on until either: 1. Concealment levels become client based or 2. OVK officially adds w/e mod(s) to w/e gun(s)
local old_wftd_init = WeaponFactoryTweakData.init
function WeaponFactoryTweakData:init()
	old_wftd_init(self)
	self:DMCWO_general()
end
	
function WeaponFactoryTweakData:DMCWO_general()

	local weapon_factory_ids = {
	"wpn_fps_lmg_mg42","wpn_fps_lmg_hk21","wpn_fps_lmg_m249","wpn_fps_lmg_rpk",
	
	"wpn_fps_ass_74","wpn_fps_ass_akm","wpn_fps_ass_akm_gold","wpn_fps_smg_akmsu",
	
	"wpn_fps_smg_olympic","wpn_fps_ass_amcar","wpn_fps_ass_s552","wpn_fps_ass_g36",
	
	"wpn_fps_ass_aug","wpn_fps_ass_famas","wpn_fps_ass_l85a2","wpn_fps_ass_vhs",
	
	"wpn_fps_ass_m4","wpn_fps_ass_m16","wpn_fps_ass_ak5",
	
	"wpn_fps_ass_m14","wpn_fps_ass_fal","wpn_fps_ass_galil","wpn_fps_ass_g3","wpn_fps_ass_scar",
	
	"wpn_fps_smg_mp9","wpn_fps_smg_mp5","wpn_fps_smg_thompson","wpn_fps_smg_mac10","wpn_fps_smg_m45","wpn_fps_smg_uzi","wpn_fps_smg_scorpion","wpn_fps_smg_tec9","wpn_fps_smg_sterling",
	
	"wpn_fps_smg_p90","wpn_fps_smg_mp7",
	
	"wpn_fps_shot_r870","wpn_fps_shot_saiga","wpn_fps_sho_ben","wpn_fps_sho_ksg","wpn_fps_shot_serbu","wpn_fps_sho_spas12","wpn_fps_sho_striker",
	}
	for i, factory_id in ipairs(weapon_factory_ids) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_45iron")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_leupold")
		table.insert(self[factory_id].uses_parts, "wpn_fps_pis_c96_sight")
	end
	
	local lmg_sights = {
	"wpn_fps_lmg_mg42","wpn_fps_lmg_hk21","wpn_fps_lmg_m249","wpn_fps_lmg_rpk",
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
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
	
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
	
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_fg_standard")
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_shot_r870_s_solid")
	
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
	
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
		
	table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_snp_msr_ns_suppressor")			
			
	table.insert(self.wpn_fps_ass_galil.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
			
	table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
	
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
											
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
	table.insert(self.wpn_fps_shot_serbu.uses_parts, "wpn_fps_shot_r870_fg_wood")
	
	table.insert(self.wpn_fps_sho_striker.uses_parts, "wpn_fps_upg_o_mbus_rear")
	
	table.insert(self.wpn_fps_snp_msr.uses_parts, "wpn_fps_snp_mosin_iron_sight")
	table.insert(self.wpn_fps_snp_r93.uses_parts, "wpn_fps_snp_mosin_iron_sight")
	table.insert(self.wpn_fps_snp_m95.uses_parts, "wpn_fps_snp_mosin_iron_sight")
	
	--Fuck it, if the Judge can be suppressed somehow, so can this
	--NOTE: The Bull won't sound like it's suppressed
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large_kac")
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_gem")
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large")
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium")
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_small")
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_slim")
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
end

elseif RequiredScript == "lib/tweak_data/weapontweakdata" then

--Gun adjustments

old_wtd = WeaponTweakData._init_new_weapons

function WeaponTweakData:_init_new_weapons(...)
	old_wtd(self,...)
	
	self.scar.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle
	self.fal.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle
	self.galil.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle
	self.g3.FIRE_MODE = "single" --starts off on semi-auto like the M14 since it's a battle rifle
	self.glock_18c.FIRE_MODE = "single" --starts off on semi-auto to avoid accidental mag dumping, especially if you have Equlibrium
	self.tec9.FIRE_MODE = "single" --Sets the gun to semi-auto by default
	self.m16.FIRE_MODE = "single" --starts off on semi-auto to stop weirdness if you have Ozzy's burst fire script enabled
end

end
