--[[
v1.5
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_wftd_init =  WeaponFactoryTweakData.init
function WeaponFactoryTweakData:init()
	old_wftd_init(self)
	self:DMCWO_general()
end

function WeaponFactoryTweakData:DMCWO_general()

	--Makes override tables if they don't exist
	for wep_id, i in pairs(self) do
		if wep_id ~= "parts" then
			if not self[ wep_id ].override then
				self[ wep_id ].override = {}
			end
		end
	end
	
	--[[
	--This doesn't work in game ;(
	for wep_id, i in pairs(self.parts) do
		if (self.parts[ wep_id ].type ~= "gadget" or self.parts[ wep_id ].type ~= "barrel" or self.parts[ wep_id ].type ~= "barrel_ext" or self.parts[ wep_id ].type ~= "foregrip" or self.parts[ wep_id ].type ~= "magazine" or self.parts[ wep_id ].type ~= "slide") then
			self.parts[ wep_id ].unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_leupold/wpn_fps_upg_o_leupold"
		end
	end
	]]
		
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
	
	"wpn_fps_snp_winchester"
	
	}
	for i, factory_id in ipairs(weapon_factory_ids) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_45iron")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_leupold")
	end
	
	local beeped = {	
	"wpn_fps_ass_74","wpn_fps_ass_akm","wpn_fps_ass_akm_gold","wpn_fps_smg_akmsu","wpn_fps_ass_asval",
	
	"wpn_fps_smg_olympic","wpn_fps_ass_amcar","wpn_fps_ass_s552","wpn_fps_ass_g36","wpn_fps_ass_sub2000",
	
	"wpn_fps_ass_aug","wpn_fps_ass_famas","wpn_fps_ass_l85a2","wpn_fps_ass_vhs",
	
	"wpn_fps_ass_m4","wpn_fps_ass_m16","wpn_fps_ass_ak5",
	
	"wpn_fps_ass_m14","wpn_fps_ass_fal","wpn_fps_ass_galil","wpn_fps_ass_g3","wpn_fps_ass_scar",
	
	"wpn_fps_snp_winchester"
	
	}
	for i, factory_id in ipairs(beeped) do
		--table.insert(self[factory_id].uses_parts, "wpn_fps_upg_bp_lmg_lionbipod")
	end
	
	local lmg_sights = {
	"wpn_fps_lmg_mg42","wpn_fps_lmg_hk21","wpn_fps_lmg_m249","wpn_fps_lmg_rpk","wpn_fps_snp_winchester","wpn_fps_lmg_par" --[[,"wpn_fps_smg_baka"]]
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
	
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_lmg_rpk_fg_standard")
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_upg_ak_m_drum")
	
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_fg_standard")
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_upg_ak_m_drum")
	
	table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_lmg_rpk_s_standard")
			
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_ergo")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_sniper")					
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_mgrip")			
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_m_pmag")					
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_upper_reciever_edge")					
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_s_pts")		
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_smg_olympic_fg_railed")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_m_drum")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_ass_l85a2_m_emag")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_ballos")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_core")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_lower_reciever_core")
	
	table.insert(self.wpn_fps_smg_p90.uses_parts, "wpn_fps_upg_o_mbus_rear")
	
	table.insert(self.wpn_fps_ass_aug.uses_parts, "wpn_fps_upg_o_mbus_rear")
						
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_m4_uupg_s_fold")
	
	--table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
		
	--table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_snp_msr_ns_suppressor")			
			
	--table.insert(self.wpn_fps_ass_galil.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
			
	--table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
	table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_smg_mp5_s_adjust")
	
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
	--table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_snp_msr_ns_suppressor")
	
	--table.insert(self.wpn_fps_smg_cobray.uses_parts, "wpn_fps_upg_o_acog")
											
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
	
	table.insert(self.wpn_fps_shot_serbu.uses_parts, "wpn_fps_shot_r870_m_extended")
	
	table.insert(self.wpn_fps_sho_striker.uses_parts, "wpn_fps_upg_o_mbus_rear")
	
	table.insert(self.wpn_fps_snp_msr.uses_parts, "wpn_fps_snp_mosin_iron_sight")
	table.insert(self.wpn_fps_snp_r93.uses_parts, "wpn_fps_snp_mosin_iron_sight")
	table.insert(self.wpn_fps_snp_m95.uses_parts, "wpn_fps_snp_mosin_iron_sight")
	
	--Fuck it, if the Judge can be suppressed through magic, so can this
	--NOTE: The Bull won't sound like it's suppressed
	--NOTE 2: Disabled suppressors as you crash if you're a client and playing with a non-user host
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large_kac")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_gem")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_small")
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_slim")
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_o_leupold")
	
	table.insert(self.wpn_fps_pis_judge.uses_parts, "wpn_fps_upg_o_leupold")
	
	table.insert(self.wpn_fps_pis_deagle.uses_parts, "wpn_fps_upg_o_leupold")
	
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
	
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_upg_o_marksmansight_rear")
	
	table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_upg_o_marksmansight_rear")
	table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_fps_upg_o_rmr")
	
	table.insert(self.wpn_fps_x_b92fs.uses_parts, "wpn_fps_upg_o_rmr")
	table.insert(self.wpn_fps_x_b92fs.uses_parts, "wpn_upg_o_marksmansight_rear")
	
	table.insert(self.wpn_fps_pis_1911.uses_parts, "wpn_fps_upg_i_autofire")
		
	--Had to put these here as the game doesn't like loading without the RMR having a parent
	self.wpn_fps_jowi.override.wpn_fps_upg_o_rmr = {
			parent = "slide",
			stats = { value = 1, concealment = -1, recoil = 0, zoom = 0}
		}
		
	self.wpn_fps_x_b92fs.override.wpn_fps_upg_o_rmr = {
			parent = "upper_reciever",
			stats = { value = 1, concealment = -1, recoil = 0, zoom = 0}
		}
		
	self.wpn_fps_x_1911.override.wpn_fps_upg_o_rmr = {
			parent = "slide",
			stats = { value = 1, concealment = -1, recoil = 0, zoom = 0}
		}
	
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_rmr = {
			parent = "lower_reciever",
			stats = { value = 1, concealment = -1, recoil = 0, zoom = 0}
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
	
	self.parts.wpn_upg_saiga_m_20rnd.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/magazine"
	self.parts.wpn_upg_saiga_m_20rnd.animations = {} --Thx SC
	self.parts.wpn_fps_smg_mp5_m_drum.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/magazine"
	self.parts.wpn_fps_upg_m4_m_drum.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/magazine"
	self.parts.wpn_upg_ak_m_drum.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/magazine"
	
	------------------[[TOGGLEABLE STUFF (Don't touch the stuff below, use the toggles in DMCWO.lua if you want to change things)]]------------------
	--{
	if DMCWO.hide_pis_flash == true then
		self.parts.wpn_fps_upg_pis_ns_flash.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	else
		self.parts.wpn_fps_upg_pis_ns_flash.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
		self.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	end
	
	if DMCWO.buis_swap == true then
		self.parts.wpn_fps_upg_o_mbus_front.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_front"
		self.parts.wpn_fps_upg_o_mbus_rear.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_rear"
		self.parts.wpn_fps_upg_o_mbus_rear.name_id = "dd_rear"
		self.parts.wpn_fps_upg_o_mbus_rear.desc_id = "dd_rear_desc"
	end
	
	if DMCWO.elcan_buis == true then
		self.parts.wpn_fps_upg_o_specter.adds = { "wpn_fps_extra_zoom" }
		self.parts.wpn_fps_upg_o_specter.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight","wpn_fps_upg_o_45iron", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back","wpn_fps_m4_uupg_o_flipup","loli_butts","ring_offset"}
	else
		self.parts.wpn_fps_upg_o_specter.adds = {}
		self.parts.wpn_fps_upg_o_specter.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight","wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back","wpn_fps_m4_uupg_o_flipup","loli_butts","ring_offset"}
	end
	
	if DMCWO.judge_grip == true then
		self.parts.wpn_fps_pis_judge_g_standard.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_g_standard"
		self.parts.wpn_fps_pis_judge_g_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_g_standard"
	end
	
	if DMCWO.hide_mac_wire == true then
		self.parts.wpn_fps_smg_mac10_s_fold.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	end
	
	if DMCWO.barret_bipod == true then
		self.parts.wpn_fps_snp_m95_bipod.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_snp_m95_bipod.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	end
	
	if DMCWO.hide_sg_brakes == true then
		self.parts.wpn_fps_upg_ns_shot_shark.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_shot_ns_king.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	end
	
	if DMCWO.hide_brakes == true then
		self.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ns_ass_smg_tank.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ns_ass_smg_tank.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ass_ns_linear.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ass_ns_battle.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ass_ns_battle.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_upg_ak_b_ak105.override = {
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
		self.parts.wpn_fps_ass_l85a2_b_medium.override = {
			wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
			wpn_fps_upg_ns_ass_smg_tank = hide_ext,
			wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
			wpn_fps_upg_ass_ns_jprifles = hide_ext,
			wpn_fps_upg_ass_ns_linear = hide_ext,
			wpn_fps_upg_ass_ns_surefire = hide_ext,
			wpn_fps_upg_ass_ns_battle = hide_ext
		}
		self.parts.wpn_fps_ass_l85a2_b_long.override = deep_clone(self.parts.wpn_fps_ass_l85a2_b_medium.override)
		self.parts.wpn_fps_ass_l85a2_b_short.override = deep_clone(self.parts.wpn_fps_ass_l85a2_b_medium.override)
		
		local hide_ext = {
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
		}
		self.parts.wpn_fps_lmg_mg42_b_vg38.override = {
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
		self.parts.wpn_fps_lmg_mg42_b_mg34.override = {
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
		self.parts.wpn_fps_lmg_mg42_b_mg42.override = {		
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
		self.parts.wpn_fps_smg_thompson_barrel.override = {
			wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
			wpn_fps_upg_ns_ass_smg_tank = hide_ext,
			wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
			wpn_fps_upg_ass_ns_jprifles = hide_ext,
			wpn_fps_upg_ass_ns_linear = hide_ext,
			wpn_fps_upg_ass_ns_surefire = hide_ext,
			wpn_fps_upg_ass_ns_battle = hide_ext,
		}	
		self.parts.wpn_fps_smg_thompson_barrel_long.override = {
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
		self.parts.wpn_fps_ass_scar_b_short.override = {
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
		self.parts.wpn_fps_ass_scar_b_medium.override = {
			wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
			wpn_fps_upg_ns_ass_smg_tank = hide_ext,
			wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
			wpn_fps_upg_ass_ns_jprifles = hide_ext,
			wpn_fps_upg_ass_ns_linear = hide_ext,
			wpn_fps_upg_ass_ns_surefire = hide_ext,
		}
		self.parts.wpn_fps_ass_scar_b_long.override = deep_clone(self.parts.wpn_fps_ass_scar_b_medium.override)
		
		local hide_ext = {
			unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_ns_vhs",
			third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_ns_vhs"
		}
		self.parts.wpn_fps_ass_vhs_b_standard.override = {	
			wpn_fps_ass_vhs_ns_vhs_no = hide_ext,
			wpn_fps_upg_ns_ass_smg_firepig = hide_ext,
			wpn_fps_upg_ns_ass_smg_tank = hide_ext,
			wpn_fps_upg_ns_ass_smg_stubby = hide_ext,
			wpn_fps_upg_ass_ns_jprifles = hide_ext,
			wpn_fps_upg_ass_ns_linear = hide_ext,
			wpn_fps_upg_ass_ns_surefire = hide_ext,
			}		
		self.parts.wpn_fps_ass_vhs_b_short.override = deep_clone(self.parts.wpn_fps_ass_vhs_b_standard.override)
	end
	
	if DMCWO.scar_afg_hide == true then
		self.wpn_fps_ass_scar.override.wpn_fps_upg_vg_ass_smg_afg = { 
			unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
			third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
		}
	end
	
	if DMCWO.mp7_vfg == true then
		self.wpn_fps_smg_mp7.override.wpn_fps_upg_vg_ass_smg_stubby = { 
			unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip",
			third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
		}
	end
	
	if DMCWO.sg552_handguard == true then
		self.parts.wpn_fps_ass_s552_fg_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard_green"
		self.parts.wpn_fps_ass_s552_fg_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard_green"
		self.parts.wpn_fps_ass_s552_fg_standard_green.name_id = "bm_wp_ass_s552_fg_black"
		self.parts.wpn_fps_ass_s552_fg_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard"
		self.parts.wpn_fps_ass_s552_fg_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard"
	end
	
	if DMCWO.sg552_stock == true then
		self.parts.wpn_fps_ass_s552_s_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard_green"
		self.parts.wpn_fps_ass_s552_s_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard_green"
		self.parts.wpn_fps_ass_s552_s_standard_green.name_id = "bm_wp_ass_s552_s_black"
		self.parts.wpn_fps_ass_s552_s_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard"
		self.parts.wpn_fps_ass_s552_s_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard"
	end
	
	if DMCWO.sg552_grip == true then
		self.parts.wpn_fps_ass_s552_g_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard_green"
		self.parts.wpn_fps_ass_s552_g_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard_green"
		self.parts.wpn_fps_ass_s552_g_standard_green.name_id = "bm_wp_ass_s552_g_black"
		self.parts.wpn_fps_ass_s552_g_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard"
		self.parts.wpn_fps_ass_s552_g_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard"
	end
	
	if DMCWO.remington_cap == 1 then
		self.wpn_fps_shot_r870.override.wpn_fps_shot_r870_m_extended = {
			unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
			third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy" 
		}
	elseif DMCWO.remington_cap == 2 then
		self.wpn_fps_shot_r870.override.wpn_fps_shot_r870_m_extended = {
			unit = "units/payday2/weapons/wpn_fps_shot_shorty_pts/wpn_fps_shot_shorty_m_extended_short",
			third_unit = "units/payday2/weapons/wpn_third_shot_shorty_pts/wpn_third_shot_shorty_m_extended_short"
		}
	end
	
	if DMCWO.loco_cap == 1 then
		self.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_m_extended = {
			unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy", 
			third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
			stats = {extra_ammo = 2}
		}
	elseif DMCWO.loco_cap == 2 then
		self.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_m_extended = {
			unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_m_extended",
			third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_m_extended",
			stats = {extra_ammo = 2}
		}
	end
	
	if DMCWO.mp7_nostock == true then
		self.parts.wpn_fps_smg_mp7_s_standard.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_smg_mp7_s_standard.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	end
	
	if DMCWO.m45_nostock == true then
		self.parts.wpn_fps_smg_m45_s_folded.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_smg_m45_s_folded.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	end
	
	if DMCWO.m4_barrel == true then
		self.wpn_fps_ass_m4.override.wpn_fps_m4_uupg_b_long = {
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium",
		}
		self.parts.wpn_fps_m4_uupg_b_medium_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short"
		self.parts.wpn_fps_m4_uupg_b_medium_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short"
		self.parts.wpn_fps_m4_uupg_b_short.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_b_long"
		self.parts.wpn_fps_m4_uupg_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_b_long"
	end
	
	--[[ WIP
	if amcar_upper == true then
	self.parts.wpn_fps_amcar_uupg_body_upperreciever.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
	self.parts.wpn_fps_amcar_uupg_body_upperreciever.adds = {"wpn_fps_ass_m16_o_handle_sight", "wpn_fps_m4_uupg_draghandle"}
	self.wpn_fps_ass_amcar.override = {
	wpn_fps_m4_uupg_draghandle = { unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle"},
	wpn_fps_m4_upper_reciever_round = { unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"},
	wpn_fps_amcar_uupg_body_upperreciever = { unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
											adds = {"wpn_fps_ass_m16_o_handle_sight", "wpn_fps_m4_uupg_draghandle"},
											},
	}
	else
	self.parts.wpn_fps_amcar_uupg_body_upperreciever.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever"
	self.parts.wpn_fps_amcar_uupg_body_upperreciever.adds = {}
	end
	]]
	
	if DMCWO.a2_upper == true then
		self.parts.wpn_fps_m4_upper_reciever_round.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever"	
		self.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_body_upperreciever"	
		self.parts.wpn_fps_m4_upper_reciever_round_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever"
		self.parts.wpn_fps_m4_upper_reciever_round_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_body_upperreciever"
		self.parts.wpn_fps_m4_uupg_draghandle.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_m4_uupg_draghandle.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_m4_uupg_draghandle_vanilla.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_m4_uupg_draghandle_vanilla.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_ass_m16_o_handle_sight.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
		self.parts.wpn_fps_ass_m16_o_handle_sight.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	end
	
	if DMCWO.m249_barrel == true then
		self.parts.wpn_fps_lmg_m249_b_long.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_long"
		self.parts.wpn_fps_lmg_m249_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_long"
		self.parts.wpn_fps_lmg_m249_b_short.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_short"
		self.parts.wpn_fps_lmg_m249_b_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_short"
	end
	
	
	if DMCWO.its_fucked == true and DMCWO.ar_front_post == true then
		self.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {}
		
		self.wpn_fps_ass_amcar.adds = { 		
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
			shortdot_normal = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		}
	elseif DMCWO.its_fucked == true and DMCWO.ar_front_post == false then	
		self.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {}
		
		self.wpn_fps_ass_amcar.adds = {  		
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
			shortdot_normal = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		}		
	elseif DMCWO.its_fucked == false and DMCWO.ar_front_post == true then
		self.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {
		"wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_upper_reciever_round_vanilla"
		}
		
		self.wpn_fps_ass_amcar.adds = { 
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
			shortdot_normal = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		}
	end
	
	if DMCWO.ar_front_post == true then
		self.wpn_fps_ass_m16.adds = { 
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
			shortdot_normal = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
			--wpn_fps_m16_fg_railed = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
			--wpn_fps_m16_fg_standard = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
		}	
		self.wpn_fps_smg_olympic.adds = { 
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
	end
	
	if DMCWO.ksg_gadget == true then
		self.wpn_fps_sho_ksg.override = deep_clone(self.wpn_fps_pis_rage.override)
	end
	
	--}
	
	
	------------------[[DON'T TOUCH THE SHIZZLE BELOW, DAWG]]------------------
	
	------------------[[MUZZLE BRAKES]]------------------{
	
	--Fire Breather
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.stats = { value = 5, suppression = -1, spread = -1, recoil = 3, concealment = -2 }
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.perks = {"big_flash"}
	--Tank Compensator
	self.parts.wpn_fps_upg_ns_ass_smg_tank.stats = { value = 4, suppression = -0, recoil = 2, spread = 0, concealment = -1 } 
	self.parts.wpn_fps_upg_ns_ass_smg_tank.perks = {"side_comp"}
	--Stubby
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats = { value = 3, suppression = 1, recoil = 1, spread = 1 }
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.perks = {"flash_hider"}
	--Competitor's Compensator
	self.parts.wpn_fps_upg_ass_ns_jprifles.stats = { suppression = 0, concealment = -2, spread = 4, recoil = -2}
	--Funnel of Fun
	self.parts.wpn_fps_upg_ass_ns_linear.stats = { suppression = -2, spread = -2, concealment = -2, recoil = 4 }
	self.parts.wpn_fps_upg_ass_ns_linear.perks = {"big_flash"}
	--TACTICOOL
	self.parts.wpn_fps_upg_ass_ns_surefire.stats = { spread = 3, recoil = -1, concealment = -2 }
	--Battle Comp
	self.parts.wpn_fps_upg_ass_ns_battle.stats = { value = 4, suppression = -0, recoil = 0, spread = 2, concealment = -1 } 
	
	--Shark Teeth (Shotguns)
	self.parts.wpn_fps_upg_ns_shot_shark.stats = { value = 5, suppression = -2, spread = -3, recoil = 4, concealment = -2 }
	--King's Crown (Shotguns)
	self.parts.wpn_fps_upg_shot_ns_king.stats = { suppression = -0, spread = 4, concealment = -2, recoil = -3 }
	
	--La Femme Compensator (Deagle)
	self.parts.wpn_fps_pis_deagle_co_short.stats = { value = 6, recoil = 2, concealment = -1, suppression = -2 }
	--OGREKILL Compensator (Deagle)
	self.parts.wpn_fps_pis_deagle_co_long.stats = { value = 8, recoil = 4, concealment = -2, spread = 0, suppression = -1 }
	self.parts.wpn_fps_pis_deagle_co_long.custom_stats = { ads_speed_mult = 0.95 }
	
	--Ventilated Compensator (Glocks)
	self.parts.wpn_fps_pis_g18c_co_1.stats = { value = 4, suppression = -2, recoil = 2, concealment = -1 }
	--Velocity Compensator (Glocks)
	self.parts.wpn_fps_pis_g18c_co_comp_2.stats = { value = 5, suppression = -1, concealment = -1, spread = 2 }
	
	--Ventilated Compensator (P226)
	self.parts.wpn_fps_pis_p226_co_comp_1.stats = { value = 4, suppression = -2, recoil = 2, concealment = -1 }
	--Velocity Compensator (P226)
	self.parts.wpn_fps_pis_p226_co_comp_2.stats = { value = 5, suppression = -1, concealment = -1, spread = 2 }
	
	--Ventilated Compensator (USP)
	self.parts.wpn_fps_pis_usp_co_comp_1.stats = { value = 4, suppression = -2, recoil = 2, concealment = -1 }
	--Velocity Compensator (USP)
	self.parts.wpn_fps_pis_usp_co_comp_2.stats = { value = 5, suppression = -1, concealment = -1, spread = 2 }
	
	--Professional Compensator (92FS)
	self.parts.wpn_fps_pis_beretta_co_co1.stats = { value = 3, suppression = -5, concealment = -1, recoil = 2 }
	--Competitor Compensator (92FS)
	self.parts.wpn_fps_pis_beretta_co_co2.stats = { value = 4, spread = 2, concealment = -1 }
	
	--Flash Hider (Pistols)
	self.parts.wpn_fps_upg_pis_ns_flash.stats = { value = 5, suppression = 2,  recoil = 1}
	self.parts.wpn_fps_upg_pis_ns_flash.perks = {"flash_hider"}
	
	--Punisher Compensator (1911)
	self.parts.wpn_fps_pis_1911_co_1.stats = { value = 5, suppression = -2, recoil = 2, concealment = -1}
	--Aggressor Compensator (1911)
	self.parts.wpn_fps_pis_1911_co_2.stats = {value = 2, suppression = -1, concealment = -1, spread = 2 }
	
	--Tenderizer
	self.parts.wpn_fps_upg_ns_pis_meatgrinder.stats = {value = 7, recoil = 4, spread = -2, concealment = -2, suppression = -3}
	--IPSC Compensator
	self.parts.wpn_fps_upg_ns_pis_ipsccomp.stats = {value = 4, recoil = -3, spread = 4, concealment = -2}
	
	--Mac Barrel Extension
	self.parts.wpn_fps_smg_cobray_ns_barrelextension.stats = { value = 1, spread = 2, recoil = 2, concealment = -2 }
	self.parts.wpn_fps_smg_cobray_ns_barrelextension.custom_stats = { ads_speed_mult = 0.90 }
	--}
	
	
	------------------[[SUPPRESSORS]]------------------{
	--Low Profile
	self.parts.wpn_fps_upg_ns_ass_smg_small.stats = { value = 3, suppression = 100, alert_size = 12, damage = -2, recoil = -3, spread_moving = -1, concealment = 0 }
	self.parts.wpn_fps_upg_ns_ass_smg_small.custom_stats = {damage_near_mul = 0.50, damage_far_mul = 0.50 }
	--Medium
	self.parts.wpn_fps_upg_ns_ass_smg_medium.stats = { value = 2, suppression = 100, alert_size = 12, damage = -2, recoil = -1, spread_moving = -2, concealment = -2, spread = 0}
	self.parts.wpn_fps_upg_ns_ass_smg_medium.custom_stats = {damage_near_mul = 0.60, damage_far_mul = 0.60, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	--The Bigger the Better
	self.parts.wpn_fps_upg_ns_ass_smg_large.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 0, spread_moving = -3, concealment = -3, spread = 1}
	self.parts.wpn_fps_upg_ns_ass_smg_large.custom_stats = {damage_near_mul = 0.70, damage_far_mul = 0.70, ads_speed_mult = 0.925, hipfire_mod = 1.1 }
	
	--PBS
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats = {value = 1, suppression = 100, alert_size = 12, concealment = -5, damage = 0}
	self.parts.wpn_fps_upg_ns_ass_pbs1.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.15 }
	
	--Size Doesn't Matter
	self.parts.wpn_fps_upg_ns_pis_small.stats = { value = 3, suppression = 100, alert_size = 12, damage = -2, recoil = -3, spread_moving = -1, concealment = 0 }
	self.parts.wpn_fps_upg_ns_pis_small.custom_stats = {damage_near_mul = 0.50, damage_far_mul = 0.50 }
	--Standard Issue
	self.parts.wpn_fps_upg_ns_pis_medium.stats = { value = 1, suppression = 100, alert_size = 12, damage = -2, recoil = -1, spread_moving = -2, concealment = -2, spread = 0, hipfire_mod = 1.05  }
	self.parts.wpn_fps_upg_ns_pis_medium.custom_stats = {damage_near_mul = 0.60, damage_far_mul = 0.60, ads_speed_mult = 0.95 }
	--Monolith
	self.parts.wpn_fps_upg_ns_pis_large.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 0, spread_moving = -2, concealment = -3, spread = 1 }
	self.parts.wpn_fps_upg_ns_pis_large.custom_stats = {damage_near_mul = 0.70, damage_far_mul = 0.70, ads_speed_mult = 0.925, hipfire_mod = 1.1 }
	
	--Asepsis
	self.parts.wpn_fps_upg_ns_pis_medium_slim.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = -2, spread_moving = -2, concealment = -2 }
	self.parts.wpn_fps_upg_ns_pis_medium_slim.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.925, hipfire_mod = 1.15 }
	
	--GemTech Suppressor
	self.parts.wpn_fps_upg_ns_pis_medium_gem.stats = { value = 1, suppression = 100, alert_size = 12, spread = 1, recoil = -1, spread_moving = -2, concealment = -1, damage = -2 }
	self.parts.wpn_fps_upg_ns_pis_medium_gem.custom_stats = {damage_near_mul = 0.60, damage_far_mul = 0.60, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	--MK.23 Suppressor
	self.parts.wpn_fps_upg_ns_pis_large_kac.stats = { value = 1, suppression = 100, alert_size = 12, spread = 2, recoil = 0, spread_moving = -2, concealment = -2, damage = -2 }
	self.parts.wpn_fps_upg_ns_pis_large_kac.custom_stats = {damage_near_mul = 0.70, damage_far_mul = 0.70, ads_speed_mult = 0.925, hipfire_mod = 1.1 }
	self.parts.wpn_fps_upg_ns_pis_large_kac.perks = { "silencer" }
	
	--METAL GEAR
	self.parts.wpn_fps_upg_ns_pis_jungle.stats = { value = 5, suppression = 100, alert_size = 12, spread = 2, recoil = 1, concealment = -5, damage = -2 }
	self.parts.wpn_fps_upg_ns_pis_jungle.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	--Oil Filter
	self.parts.wpn_fps_upg_ns_ass_filter.stats = { value = 0, suppression = 100, alert_size = 12, damage = -2, recoil = 5, concealment = -3 }
	self.parts.wpn_fps_upg_ns_ass_filter.custom_stats = {damage_near_mul = 0.10, damage_far_mul = 0.10, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	
	--Shotgun Suppressor
	self.parts.wpn_fps_upg_ns_shot_thick.stats = { value = 7, suppression = 100, alert_size = 12, damage = -2, recoil = -2, spread_moving = -2, concealment = -2 }
	self.parts.wpn_fps_upg_ns_shot_thick.custom_stats = {damage_near_mul = 0.70, damage_far_mul = 0.70, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	--SALVO
	self.parts.wpn_fps_upg_ns_sho_salvo_large.stats = {
				value = 7,
				suppression = 100,
				alert_size = 12,
				damage = -2,
				spread = 1,
				recoil = 1,
				concealment = -4
			}
	self.parts.wpn_fps_upg_ns_sho_salvo_large.custom_stats = { damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	
	
	--MSR Suppressor (TITAN QD)
	self.parts.wpn_fps_snp_msr_ns_suppressor.stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = -2, spread_moving = -2, concealment = -2, damage = -2}
	self.parts.wpn_fps_snp_msr_ns_suppressor.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.15 }
	
	--MP7 Suppressor
	self.parts.wpn_fps_smg_mp7_b_suppressed.stats = { value = 4, spread = 2, suppression = 100, alert_size = 12, damage = -0, recoil = -0, spread_moving = -2, concealment = -2 }
	self.parts.wpn_fps_smg_mp7_b_suppressed.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.925, hipfire_mod = 1.15 }
	
	--Skorpion Suppressor
	self.parts.wpn_fps_smg_scorpion_b_suppressed.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = 0, spread_moving = -0, concealment = -2 }
	self.parts.wpn_fps_smg_scorpion_b_suppressed.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.925, hipfire_mod = 1.15 }
	
	--Uzi Suppressor
	self.parts.wpn_fps_smg_uzi_b_suppressed.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = 0, spread_moving = -0, concealment = -2 }
	self.parts.wpn_fps_smg_uzi_b_suppressed.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.925, hipfire_mod = 1.15 }
	--C96 DL-44 Muzzle
	self.parts.wpn_fps_pis_c96_nozzle.forbids = { 
		"wpn_fps_pis_c96_b_long",
		"wpn_fps_pis_c96_m_extended",
		"wpn_fps_pis_c96_s_solid"
	}
	for i, factory_id in ipairs(self.parts.wpn_fps_pis_c96_nozzle.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "wpn_fps_pis_c96_nozzle")
	end
	self.parts.wpn_fps_pis_c96_nozzle.custom_stats = { 
		starwars = true,
		damage_near_set = 20,
		damage_far_set = 40,
		damage_min_set = 1.9,
		rof_mult = 0.55555555555555555555555555555556,
		reload_speed_mult = 1.5,
		penetration_power_mult = 0,
		penetration_damage_mult = 0,
		can_shoot_through_enemy = false,
		can_shoot_through_wall = false,
		hipfire_mod = 0.85
	}
	self.parts.wpn_fps_pis_c96_nozzle.stats = {
		value = 1,
		recoil = 20,
		spread = -2,
		concealment = -1
	}
		
	--SIONICS Suppressor
	self.parts.wpn_fps_smg_cobray_ns_silencer.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.15 }
	self.parts.wpn_fps_smg_cobray_ns_silencer.stats = {
		value = 1,
		suppression = 100,
		alert_size = 12,
		recoil = 2,
		spread = -0,
		concealment = -1
	}
	
	--Vector Suppressor
	self.parts.wpn_fps_smg_polymer_ns_silencer.stats = {
			value = 1,
			damage = -0,
			alert_size = 12,
			concealment = -1
		}
	self.parts.wpn_fps_smg_polymer_ns_silencer.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.9, hipfire_mod = 1.15 }
	
	--Micro Uzi Small
	self.parts.wpn_fps_smg_baka_b_smallsupp.stats = { value = 3, suppression = 100, alert_size = 12, damage = -2, recoil = -4, spread_moving = -1, concealment = 0, spread = 1}
	self.parts.wpn_fps_smg_baka_b_smallsupp.custom_stats = {damage_near_mul = 0.60, damage_far_mul = 0.60, ads_speed_mult = 0.95 , hipfire_mod = 1.05}
	--Micro Uzi Med
	self.parts.wpn_fps_smg_baka_b_midsupp.stats = { value = 2, suppression = 100, alert_size = 12, damage = -2, recoil = 0, spread_moving = -2, concealment = -2, spread = 2}
	self.parts.wpn_fps_smg_baka_b_midsupp.custom_stats = {damage_near_mul = 0.70, damage_far_mul = 0.70, ads_speed_mult = 0.925, hipfire_mod = 1.1 }
	--Micro Uzi Big
	self.parts.wpn_fps_smg_baka_b_longsupp.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 1, spread_moving = -3, concealment = -4, spread = 3}
	self.parts.wpn_fps_smg_baka_b_longsupp.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.9, hipfire_mod = 1.15 }
	--}
	
	
	------------------[[BARRELS]]------------------{
	--AK Slavic Dragon (AK74, AKM)
	self.parts.wpn_fps_upg_ak_b_draco.stats = { recoil = 0, concealment = 1, spread = -0, suppression = 0}
	self.parts.wpn_fps_upg_ak_b_draco.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.10, hipfire_mod = 0.95 }
	
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats = { value = 1, spread = 8, recoil = -10, total_ammo_mod = -0, damage = 1, concealment = -4 }
	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats = {damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min_mul = 1.1, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	
	self.parts.wpn_fps_upg_ak_b_ak105.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, hipfire_mod = 0.95}
	self.parts.wpn_fps_upg_ak_b_ak105.stats = { value = 1, spread = -1, recoil = 2, concealment = 1 }
	
	--Rodina AK Barrel
	self.parts.wpn_fps_ass_74_b_legend.custom_stats = { ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	self.parts.wpn_fps_ass_74_b_legend.stats = {
		value = 1,
		recoil = 4,
		concealment = -2
	}
	self.parts.wpn_fps_ass_74_b_legend.forbids = { 
		"wpn_fps_upg_ak_b_draco",
		"wpn_fps_upg_ass_ak_b_zastava",
		"wpn_fps_upg_ak_b_ak105",
		
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_pbs1",
		
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ass_ns_battle"
	}	
	self.parts.wpn_upg_ak_fg_legend.custom_stats = { ads_speed_mult = 0.95 }
	self.parts.wpn_upg_ak_fg_legend.stats = {
		value = 1,
		recoil = 3,
		spread = -2,
		concealment = -1
	}
	self.parts.wpn_upg_ak_fg_legend.forbids = {
		"wpn_fps_lmg_rpk_fg_standard",
		
		"wpn_upg_ak_fg_standard",
		"wpn_upg_ak_fg_combo2",
		"wpn_upg_ak_fg_combo3",
		"wpn_upg_ak_fg_combo1",
		"wpn_upg_ak_fg_combo4",
		"wpn_fps_upg_ak_fg_tapco",
		"wpn_fps_upg_fg_midwest",
		"wpn_fps_upg_ak_fg_krebs",
		"wpn_fps_upg_ak_fg_trax"
	}
	self.parts.wpn_upg_ak_g_legend.stats = {
		value = 1,
		recoil = 3,
		spread = -1
	}
	self.parts.wpn_upg_ak_g_legend.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_ak_g_rk3"
	}
	self.parts.wpn_upg_ak_s_legend.stats = {
		value = 1,
		recoil = 1,
		spread = 2
	}
	self.parts.wpn_upg_ak_s_legend.forbids = {
		"wpn_fps_lmg_rpk_s_standard",
		
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_upg_ak_s_folding",
		"wpn_upg_ak_s_psl",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_ak_s_solidstock"
	}
	self.parts.wpn_upg_ak_fl_legend.stats = {
		value = 1,
		recoil = 1,
		concealment = -1
	}
	self.parts.wpn_upg_ak_fl_legend.forbids = {
		"wpn_fps_upg_o_45iron",
		
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_utg"
	}
	
	
	self.wpn_fps_pis_deagle.adds.wpn_fps_pis_deagle_b_legend = {
		"wpn_fps_pis_deagle_o_standard_rear",
		"wpn_fps_pis_deagle_o_standard_front"
	}
	self.parts.wpn_fps_pis_deagle_b_legend.override = {}
	self.parts.wpn_fps_pis_deagle_b_legend.custom_stats = { ads_speed_mult = 0.90, hipfire_mod = 1.05 }
	self.parts.wpn_fps_pis_deagle_b_legend.stats = {
			value = 1,
			recoil = 8,
			concealment = -10
		}
	self.parts.wpn_fps_pis_deagle_b_legend.forbids = {
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_upg_fl_pis_x400v",
		"wpn_fps_upg_fl_pis_m3x",
		
		"wpn_fps_pis_deagle_b_long",
		"wpn_fps_pis_deagle_co_long",
		"wpn_fps_pis_deagle_co_short"
	}
	
	self.parts.wpn_fps_fla_mk2_body_fierybeast.stats = {
		value = 1
	}
	
	
	self.parts.wpn_fps_smg_p90_b_legend.custom_stats = { ads_speed_mult = 0.90, hipfire_mod = 1.05 }
	self.parts.wpn_fps_smg_p90_b_legend.forbids = {
		"wpn_fps_smg_p90_b_long",
		"wpn_fps_smg_p90_b_civilian",
		"wpn_fps_smg_p90_b_ninja",
		
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ass_ns_battle",
	}
	self.parts.wpn_fps_smg_p90_b_legend.stats = {
		value = 1,
		recoil = 5,
		spread = -2,
		concealment = -2
	}
	
	self.parts.ring_offset = {
		type = "sight",
		name_id = "dicks",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stance_mod = {
			wpn_fps_shot_r870 = {
				translation = Vector3(0, -5, -0.7),
				rotation = Rotation(-0.02, 0.25, 0)
			}
		}
	}
	self.parts.wpn_fps_shot_r870_b_legendary.adds = { "ring_offset" }
	self.parts.wpn_fps_shot_r870_b_legendary.stance_mod = {}
	self.parts.wpn_fps_shot_r870_b_legendary.forbids = {
		"wpn_fps_shot_r870_m_extended",
		"wpn_fps_shot_shorty_m_extended_short",
		
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_utg",
		
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_ns_sho_salvo_large"
	}
	self.parts.wpn_fps_shot_r870_b_legendary.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.1 }
	self.parts.wpn_fps_shot_r870_b_legendary.stats = {
		value = 1,
		recoil = -5,
		spread = -6,
		concealment = 2
	}
	
	self.parts.wpn_fps_shot_r870_fg_legendary.forbids = {
		"wpn_fps_shot_r870_fg_big",
		"wpn_fps_shot_r870_fg_railed",
		"wpn_fps_shot_r870_fg_wood"
	}
	self.parts.wpn_fps_shot_r870_fg_legendary.custom_stats = { ads_speed_mult = 0.9, rof_mult = 1.075 }
	self.parts.wpn_fps_shot_r870_fg_legendary.stats = {
		value = 1,
		recoil = 4,
		concealment = -1
	}
	
	self.parts.wpn_fps_shot_r870_s_legendary.forbids = {
		"wpn_fps_shot_r870_s_folding",
		"wpn_fps_shot_r870_s_m4",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_shot_r870_s_nostock_big",
		"wpn_fps_shot_r870_s_nostock_single",
		"wpn_fps_shot_r870_s_nostock",
		"wpn_fps_shot_r870_s_solid_vanilla",
		"wpn_fps_shot_r870_s_solid_big",
		"wpn_fps_shot_r870_s_solid_single",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_m4_s_ubr",
		
		"wpn_fps_upg_m4_g_standard",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip"
	}
	self.parts.wpn_fps_shot_r870_s_legendary.stats = {
		value = 1,
		recoil = -12,
		concealment = 4
	}
	
	self.parts.wpn_fps_lmg_m134_body_upper_spikey.forbids = {
		"wpn_fps_lmg_m134_body_upper",
		"wpn_fps_lmg_m134_body_upper_light"
	}
	self.parts.wpn_fps_lmg_m134_body_upper_spikey.custom_stats = { reload_speed_mult = 0.9 }
	self.parts.wpn_fps_lmg_m134_body_upper_spikey.stats = {
		value = 1,
		recoil = 3,
		concealment = -4
	}
		
	self.parts.wpn_fps_lmg_m134_barrel_legendary.forbids = {
		"wpn_fps_lmg_m134_barrel",
		"wpn_fps_lmg_m134_barrel_short",
		"wpn_fps_lmg_m134_barrel_extreme"
	}
	self.parts.wpn_fps_lmg_m134_barrel_legendary.custom_stats = { movement_speed = 0.95, damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.90 }
	self.parts.wpn_fps_lmg_m134_barrel_legendary.stats = {
		value = 1,
		spread = 6,
		recoil = -5,
		concealment = -3
	}
	
	--AR Medium Barrel (Para SMG)
	self.parts.wpn_fps_m4_uupg_b_medium.stats = { value = 1, spread = 2, concealment = -1 }
	self.parts.wpn_fps_m4_uupg_b_medium.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	
	--AR Short Barrel (CAR-4)
	self.parts.wpn_fps_m4_uupg_b_short.stats = { value = 5, damage = -0, spread = -1, recoil = 0, spread_moving = -2, concealment = 2, suppression = -2 }
	self.parts.wpn_fps_m4_uupg_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	--AR Long Barrel (CAR-4, AMR-16)
	self.parts.wpn_fps_m4_uupg_b_long.stats = { value = 4, damage = 2, spread = 2, recoil = -1, concealment = -2, suppression = 0 }
	self.parts.wpn_fps_m4_uupg_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	--Beowulf
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = { value = 1, spread = 8, recoil = -10, total_ammo_mod = -0, damage = 3, concealment = -4 }
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = {damage_near_mul = 1.30, damage_far_mul = 1.30, damage_min_mul = 1.1, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	--Intergrated Suppressor (CAR-4)
	self.parts.wpn_fps_m4_uupg_b_sd.stats = { value = 6, suppression = 100, alert_size = 12, spread = 0, damage = -2, recoil = 4, spread_moving = 1, concealment = 1 }
	self.parts.wpn_fps_m4_uupg_b_sd.custom_stats = { damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	
	--AK5 Short Barrel
	self.parts.wpn_fps_ass_ak5_b_short.stats = { value = 1, damage = -1, spread = -1, concealment = 2 }
	self.parts.wpn_fps_ass_ak5_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95}
	
	
	--SG552 Long Barrel
	self.parts.wpn_fps_ass_s552_b_long.stats = { value = 6, spread = 2, damage = 0, spread_moving = -4, concealment = -4, recoil = 0 }
	self.parts.wpn_fps_ass_s552_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	
	--Road Warrior/Sawn-off (Mosconi)
	self.parts.wpn_fps_shot_huntsman_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
	self.parts.wpn_fps_shot_huntsman_b_short.stats = { value = 3, recoil = -5, spread = -18, spread_moving = 3, concealment = 10, suppression = -1 }
	self.parts.wpn_fps_shot_huntsman_b_short.stance_mod = { wpn_fps_shot_huntsman = {rotation = Rotation(0,0.5,0) } }
	
	--Sawn-off (B682)
	self.parts.wpn_fps_shot_b682_b_short.stats = { value = 3, recoil = -5, spread = -15, spread_moving = 3, concealment = 10, suppression = -1 }
	self.parts.wpn_fps_shot_b682_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
	self.parts.wpn_fps_shot_b682_b_short.stance_mod = { wpn_fps_shot_b682 = {rotation = Rotation(0,0.5,0) } }
	
	--SCAR Long Barrel
	self.parts.wpn_fps_ass_scar_b_long.stats = { value = 5, spread = 4, spread_moving = -3, concealment = -3, damage = 6, recoil = -3, suppression = 0, total_ammo_mod = -50}
	self.parts.wpn_fps_ass_scar_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	--SCAR Short Barrel
	self.parts.wpn_fps_ass_scar_b_short.stats = { value = 3, damage = -0, suppression = -3, spread = -3, spread_moving = 3, concealment = 3 , recoil = 0}
	self.parts.wpn_fps_ass_scar_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	
	--HK21 Long Barrel
	self.parts.wpn_fps_lmg_hk21_b_long.stats = { value = 4, spread = 2, recoil = -3, damage = 0, spread_moving = -2, concealment = -2, suppression = 0 }
	self.parts.wpn_fps_lmg_hk21_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	
	--M249 Long Barrel
	self.parts.wpn_fps_lmg_m249_b_long.stats = { value = 4, damage = 0, spread = 2, recoil = -2, concealment = -2, suppression = 0 }
	self.parts.wpn_fps_lmg_m249_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	
	--Deagle Long Barrel
	self.parts.wpn_fps_pis_deagle_b_long.stats = { value = 7, spread_moving = -3, spread = 4, damage = 0, concealment = -3, recoil = -3, suppression = -0  }
	self.parts.wpn_fps_pis_deagle_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	
	--Raging Bull Long Barrel
	self.parts.wpn_fps_pis_rage_b_long.stats = { value = 6, recoil = -2, spread = 7, spread_moving = -3, concealment = -3, damage = 0, suppression = -0 }
	self.parts.wpn_fps_pis_rage_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.925, hipfire_mod = 1.05 }
	--Raging Bull Short Barrel
	self.parts.wpn_fps_pis_rage_b_short.stats = { value = 3, recoil = -1, spread_moving = 3, spread = -6, concealment = 3, damage = -0, suppression = -5 }
	self.parts.wpn_fps_pis_rage_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.075, hipfire_mod = 0.95 }
	--Raging Bull Aggressor
	self.parts.wpn_fps_pis_rage_b_comp1.stats = { value = 4, recoil = 1, damage = 0, spread = 2, spread_moving = -3, concealment = -3, suppression = -2 }
	--Raging Bull Vented
	self.parts.wpn_fps_pis_rage_b_comp2.stats = { value = 4, recoil = 3, damage = 0, spread = 0, spread_moving = 1, suppression = -3, concealment = -3 }
	self.parts.wpn_fps_pis_rage_b_comp2.perks = {"side_comp"}
	
	--MP9 Suppressor
	self.parts.wpn_fps_smg_mp9_b_suppressed.custom_stats = { damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	self.parts.wpn_fps_smg_mp9_b_suppressed.stats = {
		value = 3,
		suppression = 100,
		alert_size = 12,
		recoil = 2,
		spread = 0,
		concealment = -4,
		damage = -0
	}
	
	--P90 Long Barrel
	self.parts.wpn_fps_smg_p90_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	self.parts.wpn_fps_smg_p90_b_long.stats = { value = 5, spread = 3, spread_moving = -3, damage = 0, recoil = 0, concealment = -2 }
	--P90 Ninja Barrel
	self.parts.wpn_fps_smg_p90_b_ninja.custom_stats = { damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	self.parts.wpn_fps_smg_p90_b_ninja.stats = { value = 4, suppression = 100, alert_size = 12, damage = 0, recoil = 0, spread = -2 }
	
	self.parts.wpn_fps_smg_p90_b_civilian.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.90, hipfire_mod = 1.05}
	self.parts.wpn_fps_smg_p90_b_civilian.stats = { value = 7, damage = 0, spread = 1, recoil = 2, concealment = -4}
	
	--AUG Long Barrel
	self.parts.wpn_fps_aug_b_long.stats = { value = 6, spread_moving = -2, spread = 2, recoil = -1, concealment = -3, damage = 1 }
	self.parts.wpn_fps_aug_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	--AUG Short Barrel
	self.parts.wpn_fps_aug_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	self.parts.wpn_fps_aug_b_short.stats = { value = 3, spread_moving = 3, spread = -3, recoil = 4, concealment = 2, damage = -1, suppression = -2 }
	
	--M45 Short barrel 
	self.parts.wpn_fps_smg_m45_b_small.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.075, hipfire_mod = 0.95 }
	self.parts.wpn_fps_smg_m45_b_small.stats = { value = 1, spread = -2, concealment = 3, damage = -1, suppression = -1 }
	
	--MSR Long Barrel
	self.parts.wpn_fps_snp_msr_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	self.parts.wpn_fps_snp_msr_b_long.stats = { value = 7, spread = 2, recoil = 0, concealment = -3}
	
	--R93 Short Barrel 
	self.parts.wpn_fps_snp_r93_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	self.parts.wpn_fps_snp_r93_b_short.stats = { value = 1, spread = -2, recoil = 0, spread_moving = 3, concealment = 3, damage = -4, suppression = -2 }
	--R93 Suppressed Barrel
	self.parts.wpn_fps_snp_r93_b_suppressed.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	self.parts.wpn_fps_snp_r93_b_suppressed.stats = { value = 4, suppression = 100, alert_size = 12, spread = 0, damage = -10, recoil = 3, spread_moving = 1, concealment = -1 }
			
	--M95 Long Barrel
	self.parts.wpn_fps_snp_m95_barrel_long.stats = { value = 8, spread = 1, concealment = -1, suppression = 0, recoil = -3, damage = 40, spread_moving = -2, total_ammo_mod = -66}
	self.parts.wpn_fps_snp_m95_barrel_long.custom_stats = {movement_speed = 0.95, damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.90, hipfire_mod = 1.05 }
	--M95 Short Barrel
	self.parts.wpn_fps_snp_m95_barrel_short.stats = { value = 3, spread = -3, concealment = 8, damage = 0, suppression = -5 }
	self.parts.wpn_fps_snp_m95_barrel_short.custom_stats = {movement_speed = 1.05, damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95}
	--M95 Suppressed Barrel
	self.parts.wpn_fps_snp_m95_barrel_suppressed.stats = { value = 7, recoil = 10, concealment = 2, damage = -10, suppression = 100, alert_size = 12, hipfire_mod = 1.15 }
	self.parts.wpn_fps_snp_m95_barrel_suppressed.custom_stats = {movement_speed = 0.85, ads_speed_mult = 0.90, hipfire_mod = 1.1}
	
	--M1014 Long Barrel
	self.parts.wpn_fps_sho_ben_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
	self.parts.wpn_fps_sho_ben_b_long.stats = { value = 6, recoil = 0, spread = 2, concealment = -2, extra_ammo = 2 }
	--M1014 Short Barrel
	self.parts.wpn_fps_sho_ben_b_short.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
	self.parts.wpn_fps_sho_ben_b_short.stats = { value = 5, recoil = 0, spread = -4, concealment = 6, extra_ammo = -1 }
	
	--KSG Long Barrel
	self.parts.wpn_fps_sho_ksg_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
	self.parts.wpn_fps_sho_ksg_b_long.stats = { value = 4, recoil = 0, spread = 2, concealment = -2, extra_ammo = 2 }
	self.parts.wpn_fps_sho_ksg_b_long.override = {
				wpn_fps_upg_o_dd_front = {a_obj = "a_o_f_2"},
				wpn_fps_upg_o_mbus_front = {a_obj = "a_o_f_2"}
			}
	--KSG Short Barrel
	self.parts.wpn_fps_sho_ksg_b_short.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
	self.parts.wpn_fps_sho_ksg_b_short.stats = { value = 3, recoil = 0, spread = -4, concealment = 4, damage = 0, extra_ammo = -2 }
	
	--Striker Long Barrel
	self.parts.wpn_fps_sho_striker_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
	self.parts.wpn_fps_sho_striker_b_long.stats = { value = 2, recoil = 0, spread = 2, concealment = -2 }
	--Striker Suppressed Barrel
	self.parts.wpn_fps_sho_striker_b_suppressed.custom_stats = { ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	self.parts.wpn_fps_sho_striker_b_suppressed.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 1, spread_moving = 1, concealment = -2 }
	
	--AA12 Long Barrel
	self.parts.wpn_fps_sho_aa12_barrel_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
	self.parts.wpn_fps_sho_aa12_barrel_long.stats = { value = 3, recoil = 0, spread = 2, concealment = -2 }
	--AA12 Suppressed Barrel
	self.parts.wpn_fps_sho_aa12_barrel_silenced.custom_stats = { ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	self.parts.wpn_fps_sho_aa12_barrel_silenced.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 4, spread = 1, concealment = -2 }
	
	--G3 Short Barrel
	self.parts.wpn_fps_ass_g3_b_short.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	self.parts.wpn_fps_ass_g3_b_short.stats = {value = 2, recoil = 1, spread = -2, concealment = 4, damage = -6}
	--G3 Sniper Barrel
	self.parts.wpn_fps_ass_g3_b_sniper.adds = {}
	self.parts.wpn_fps_ass_g3_b_sniper.perks = {"fire_mode_single"}
	self.parts.wpn_fps_ass_g3_b_sniper.forbids = {
		"wpn_fps_upg_i_autofire","wpn_fps_upg_i_singlefire"
	}
	for i, factory_id in ipairs(self.parts.wpn_fps_ass_g3_b_sniper.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids , "wpn_fps_ass_g3_b_sniper")
	end
	self.parts.wpn_fps_ass_g3_b_sniper.custom_stats = { damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min_mul = 1.25, ads_speed_mult = 0.90, rof_mult = 0.41666666666666666666666666666667, hipfire_mod = 2, r_recover = 0.5 }
	self.parts.wpn_fps_ass_g3_b_sniper.stats = { value = 5, recoil = -30, spread = 5, concealment = -2, damage = 8, total_ammo_mod = -33, extra_ammo = -10}
	
	--FAMAS Long
	self.parts.wpn_fps_ass_famas_b_long.custom_stats = { damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	self.parts.wpn_fps_ass_famas_b_long.stats = { value = 2, recoil = 2, spread = 1, concealment = -1, damage = 2}
	--FAMAS Short	
	self.parts.wpn_fps_ass_famas_b_short.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	self.parts.wpn_fps_ass_famas_b_short.stats = { value = 1, recoil = -0, spread = -2, concealment = 2, damage = -1}
	--FAMAS Sniper	
	self.parts.wpn_fps_ass_famas_b_sniper.custom_stats = { damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min_mul = 1.1, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	self.parts.wpn_fps_ass_famas_b_sniper.stats = { value = 4, recoil = -4, spread = 5, concealment = -2, damage = 2}
	--FAMAS Supp.	
	self.parts.wpn_fps_ass_famas_b_suppressed.custom_stats = { ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	self.parts.wpn_fps_ass_famas_b_suppressed.stats = { value = 3,recoil = 0,spread = 2,concealment = -1,damage = -0}
		
	--TEC-9 Barrel Extension
	self.parts.wpn_fps_smg_tec9_ns_ext.forbids = {
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
	self.parts.wpn_fps_smg_tec9_ns_ext.stats = { value = 4, spread = 1, recoil = 2, concealment = -3 }
	self.parts.wpn_fps_smg_tec9_ns_ext.custom_stats = { ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	--TEC-9 AB-10 Barrel
	self.parts.wpn_fps_smg_tec9_b_standard.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	self.parts.wpn_fps_smg_tec9_b_standard.stats = { value = 1, recoil = -3, concealment = 3}
	
	--MG42 MG34 Barrel
	self.parts.wpn_fps_lmg_mg42_b_mg34.stats = { value = 2, recoil = -3, spread = 5 }
	self.parts.wpn_fps_lmg_mg42_b_mg34.custom_stats = { rof_mult = 0.75, ads_speed_mult = 1.05 }
	--MG42 DLT-19 Barrel
	self.parts.wpn_fps_lmg_mg42_b_vg38.perks = {}
	self.parts.wpn_fps_lmg_mg42_b_vg38.forbids = {
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ass_ns_battle"
	}
	for i, factory_id in ipairs(self.parts.wpn_fps_lmg_mg42_b_vg38.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "wpn_fps_lmg_mg42_b_vg38")
	end
	self.parts.wpn_fps_lmg_mg42_b_vg38.custom_stats = { 
		starwars = true, 
		rof_mult = 0.5,
		damage_near_set = 15,
		damage_far_set = 50,
		damage_min_set = 1.3,
		penetration_power_mult = 0,
		penetration_damage_mult = 0,
		movement_speed = 1.35,
		reload_speed_mult = 2,
		can_shoot_through_enemy = false,
		can_shoot_through_wall = false,
		can_shoot_through_shield = false,
		hipfire_mod = 0.85
	}
	self.parts.wpn_fps_lmg_mg42_b_vg38.stats = {
		value = 8,
		total_ammo_mod = 466,
		extra_ammo = -10,
		damage = -21,
		spread = 5,
		recoil = 30
	}
	
	--C96 Carbine Barrel
	self.parts.wpn_fps_pis_c96_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }	
	self.parts.wpn_fps_pis_c96_b_long.stats = {value = 1,damage = 3,recoil = -2,spread = 4,concealment = -3,total_ammo_mod = -25}	
			
	--Mosin Short Barrel
	self.parts.wpn_fps_snp_mosin_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	self.parts.wpn_fps_snp_mosin_b_short.stats = { value = 1, spread = -1, recoil = 0, concealment = 3, suppression = -5}	
	--Mosin Long Barrel
	self.parts.wpn_fps_snp_mosin_b_standard.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	self.parts.wpn_fps_snp_mosin_b_standard.stats = {value = 1, spread = 2, recoil = 1, concealment = -2}		
	--Mosin Supp. Barrel
	self.parts.wpn_fps_snp_mosin_b_sniper.custom_stats = {damage_near_mul = 0.8, damage_far_mul = 0.8, ads_speed_mult = 0.925, hipfire_mod = 1.1 }
	self.parts.wpn_fps_snp_mosin_b_sniper.stats = {value = 6, suppression = 100, alert_size = 12, damage = -4, recoil = 4, spread = 0, spread_moving = -1, concealment = -2}
	
	--Sterling Long Barrel
	self.parts.wpn_fps_smg_sterling_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	self.parts.wpn_fps_smg_sterling_b_long.stats = {
		value = 1,
		recoil = 0,
		spread = 2,
		damage = 1,
		concealment = -2
	}
	--Sterling Short Barrel
	self.parts.wpn_fps_smg_sterling_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	self.parts.wpn_fps_smg_sterling_b_short.stats = {
		value = 1,
		spread = -2,
		damage = -1,
		concealment = 1
	}
	--Sterling Suppressed Barrel
	self.parts.wpn_fps_smg_sterling_b_suppressed.custom_stats = { ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	self.parts.wpn_fps_smg_sterling_b_suppressed.stats = {
		value = 4,
		suppression = 100,
		alert_size = 12,
		damage = 0,
		recoil = 2,
		spread_moving = 0,
		concealment = -2
	}
	--Sterling E11 Barrel
	self.parts.wpn_fps_smg_sterling_b_e11.perks = {}
	self.parts.wpn_fps_smg_sterling_b_e11.override = {
		wpn_fps_smg_sterling_m_medium = {
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_m_short",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_b_short"
		}
	}
	self.parts.wpn_fps_smg_sterling_b_e11.forbids = {
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_smg_sterling_m_long",
			"wpn_fps_smg_sterling_m_short",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_ass_ns_battle"
		}
	for i, factory_id in ipairs(self.parts.wpn_fps_smg_sterling_b_e11.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "wpn_fps_smg_sterling_b_e11")
	end
	self.parts.wpn_fps_smg_sterling_b_e11.custom_stats = { 
		starwars = true,
		damage_near_set = 10,
		damage_far_set = 60,
		damage_min_set = 1.5,
		rof_mult = 0.55045871559633027522935779816514,
		reload_speed_mult = 1.3,
		penetration_power_mult = 0,
		penetration_damage_mult = 0,
		can_shoot_through_enemy = false,
		can_shoot_through_wall = false,
		hipfire_mod = 0.85
	}
	self.parts.wpn_fps_smg_sterling_b_e11.stats = {
		value = 4,
		damage = -2,
		recoil = 15,
		concealment = -1
	}
	
	--Thompson Long
	self.parts.wpn_fps_smg_thompson_barrel_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
	self.parts.wpn_fps_smg_thompson_barrel_long.stats = {
		value = 4,
		spread = 2,
		concealment = -3
	}
	--Thompson Short
	self.parts.wpn_fps_smg_thompson_barrel_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }
	self.parts.wpn_fps_smg_thompson_barrel_short.stats = {
		value = 2,
		spread = -2,
		concealment = 3
	}
	
	--L85 Long
	self.parts.wpn_fps_ass_l85a2_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95 }
	self.parts.wpn_fps_ass_l85a2_b_long.stats = {value = 1, spread = 2, recoil = 0, concealment = -3, damage = 2}	
	--L85 Short	
	self.parts.wpn_fps_ass_l85a2_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05 }	
	self.parts.wpn_fps_ass_l85a2_b_short.stats = {value = 1, spread = -2, recoil = 3, concealment = 3, damage = -0}		
	
	--VHS Suppresssed	
	self.parts.wpn_fps_ass_vhs_b_silenced.custom_stats = { ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	--VHS Sniper		
	self.parts.wpn_fps_ass_vhs_b_sniper.custom_stats = {damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min_mul = 1.1, ads_speed_mult = 0.90, hipfire_mod = 1.05 }	
	self.parts.wpn_fps_ass_vhs_b_sniper.stats = {value = 1, spread = 4, recoil = -2, concealment = -2, damage = 0}	
	--VHS Short
	self.parts.wpn_fps_ass_vhs_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	self.parts.wpn_fps_ass_vhs_b_short.stats = {value = 1, spread = -1, recoil = 3, concealment = 3, suppression = -1}
	
	--M134 Barrels
	--Long
	self.parts.wpn_fps_lmg_m134_barrel_extreme.stats = { value = 1, spread = 4, recoil = 6, concealment = -3 }
	self.parts.wpn_fps_lmg_m134_barrel_extreme.custom_stats = {movement_speed = 0.9, damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.90 }
	--Short
	self.parts.wpn_fps_lmg_m134_barrel_short.stats = { value = 1, spread = -4, recoil = -2, concealment = 3}
	self.parts.wpn_fps_lmg_m134_barrel_short.custom_stats = {movement_speed = 1.2, damage_near_mul = 0.9, damage_far_mul = 0.8, ads_speed_mult = 1.05}
	
	--Winchester Long
	self.parts.wpn_fps_snp_winchester_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	self.parts.wpn_fps_snp_winchester_b_long.stats = { value = 1, spread = 3, recoil = 1, concealment = -2}
	--Winchester Supp
	self.parts.wpn_fps_snp_winchester_b_suppressed.custom_stats = {damage_near_mul = 0.8, damage_far_mul = 0.8, ads_speed_mult = 0.925, hipfire_mod = 1.1 }
	self.parts.wpn_fps_snp_winchester_b_suppressed.stats = { value = 1, spread = 0, recoil = 4, concealment = -2, damage = -2, alert_size = 12}
	
	--SAA Long
	self.parts.wpn_fps_pis_peacemaker_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	self.parts.wpn_fps_pis_peacemaker_b_long.stats = { value = 1, spread = 3, concealment = -2}
	--SAA Short
	self.parts.wpn_fps_pis_peacemaker_b_short.stats = { value = 1, spread = -3, concealment = 2}
	self.parts.wpn_fps_pis_peacemaker_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	
	--Mateba Long
	self.parts.wpn_fps_pis_2006m_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	self.parts.wpn_fps_pis_2006m_b_long.stats = { value = 1, spread = 3, concealment = -2}
	--Mateba Med
	self.parts.wpn_fps_pis_2006m_b_medium.stats = {value = 1, spread = -1, concealment = 2}		
	--Mateba Short
	self.parts.wpn_fps_pis_2006m_b_short.stats = { value = 1, spread = -4, recoil = -2, concealment = 4 }
	self.parts.wpn_fps_pis_2006m_b_short.custom_stats = {damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	
	--AS Val Standard
	self.parts.wpn_fps_ass_asval_b_standard.stats = { value = 1, suppression = 100, alert_size = 12 }
	self.parts.wpn_fps_ass_asval_b_standard.sound_switch = {
			suppressed = "suppressed_c"
		}
	--AS Val Short
	self.parts.wpn_fps_ass_asval_b_proto.stats = { value = 1, spread = -1, recoil = -3, concealment = 2, suppression = 0, alert_size = 0 }
	self.parts.wpn_fps_ass_asval_b_proto.custom_stats = {damage_near_mul = 1.1, damage_far_mul = 1.1, use_sound = "akm", hipfire_mod = 0.95}
	self.parts.wpn_fps_ass_asval_b_proto.sound_switch = {}
	self.parts.wpn_fps_ass_asval_b_proto.perks = {}
	self.parts.wpn_fps_ass_asval_b_proto.sub_type = nil
	
	--WA2k Long
	self.parts.wpn_fps_snp_wa2000_b_long.stats = {
			value = 6,
			spread = 4,
			recoil = -4,
			concealment = -3
		}
	self.parts.wpn_fps_snp_wa2000_b_long.custom_stats = { damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.925, hipfire_mod = 1.05 }
	
	--WA2k Supp.
	self.parts.wpn_fps_snp_wa2000_b_suppressed.stats = {
			value = 6,
			suppression = 100,
			alert_size = 12,
			damage = -2,
			recoil = 5,
			concealment = -2
		}
	self.parts.wpn_fps_snp_wa2000_b_suppressed.custom_stats = { damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.1 }
	
	--Vector CRB
	self.parts.wpn_fps_smg_polymer_barrel_precision.stats = {
			value = 1,
			spread = 4,
			concealment = -4,
			recoil = -5
		}
	self.parts.wpn_fps_smg_polymer_barrel_precision.custom_stats = {damage_near_mul = 1.20, damage_far_mul = 1.20, ads_speed_mult = 0.90, hipfire_mod = 1.05 }
		
	--Micro Uzi Comp'd Barrel
	self.parts.wpn_fps_smg_baka_b_comp.stats = {
			value = 1,
			concealment = -1,
			recoil = 3
		}
		
	--Micro Uzi Comp'd Barrel
	self.parts.wpn_fps_lmg_par_b_short.custom_stats = {damage_near_mul = 0.90, damage_far_mul = 0.90, ads_speed_mult = 1.05, hipfire_mod = 0.95 }
	--}
		
	
	------------------[[SLIDES]]------------------{
	--1911 Longslide
	self.parts.wpn_fps_pis_1911_b_long.stats = { value = 2, damage = 0, spread = 3, recoil = 0, concealment = -2, suppression = -0 }
	self.parts.wpn_fps_pis_1911_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	--1911 Vented
	self.parts.wpn_fps_pis_1911_b_vented.stats = { value = 1, recoil = 3, suppression = -2}
	
	--P226 Two Tone
	self.parts.wpn_fps_pis_p226_b_equinox.stats = { value = 4, suppression = -0, recoil = 3 }
	--P226 Long Slide
	self.parts.wpn_fps_pis_p226_b_long.stats = { value = 6, damage = 0, spread = 3, concealment = -3 }
	self.parts.wpn_fps_pis_p226_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	
	--92FS Brigadier Slide
	self.parts.wpn_fps_pis_beretta_sl_brigadier.stats = { value = 1, spread = 0, recoil = 2 }
	
	--USP Expert
	self.parts.wpn_fps_pis_usp_b_expert.stats = { value = 2, concealment = -1, recoil = 2 }
	--USP Match
	self.parts.wpn_fps_pis_usp_b_match.stats = { value = 2, spread = 2, concealment = -1, damage = 0 }
	self.parts.wpn_fps_pis_usp_b_match.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	
	--G22 Long Slide
	self.parts.wpn_fps_pis_g22c_b_long.stats = { value = 6, damage = 0, spread = 2, recoil = 1, suppression = 0, spread_moving = -3 }
	self.parts.wpn_fps_pis_g22c_b_long.custom_stats = {damage_near_mul = 1.15, damage_far_mul = 1.15, ads_speed_mult = 0.95, hipfire_mod = 1.05 }
	
	--PPKS Slide
	self.parts.wpn_fps_pis_ppk_b_long.stats = { value = 3, damage = 0, spread = 2, spread_moving = -2, concealment = -2 }
	
	self.parts.wpn_fps_pis_g26_b_custom.stats = { value = 4, recoil = 0, spread = 2, concealment = -1, damage = 0 }
	
	self.parts.wpn_fps_pis_hs2000_sl_custom.stats = { value = 4, recoil = 4, spread = 0, concealment = 0, damage = 0 }
	self.parts.wpn_fps_pis_hs2000_sl_custom.custom_stats = { ads_speed_mult = 1.05 }
	
	self.parts.wpn_fps_pis_hs2000_sl_long.stats = { value = 6, recoil = 1, spread = 2, concealment = -3, damage = 0 }
	--}
	
	
	------------------[[CUSTOM]]------------------{
	--Single
	self.parts.wpn_fps_upg_i_singlefire.stats = { value = 5, spread = 3, recoil = 1 }
	--Full-Auto
	self.parts.wpn_fps_upg_i_autofire.stats = { value = 8, spread = -2, recoil = -6 }
	self.parts.wpn_fps_upg_i_autofire.custom_stats = { rof_mult = 1.15, hipfire_mod = 1.2}
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_i_autofire = {
		desc_id = "bm_wp_upg_i_autofire_tec9",
		custom_stats = {rof_mult = 1.3333333333333333333333333333333, block_eq_aced = true, hipfire_mod = 1.2}
	}
	self.wpn_fps_pis_1911.override.wpn_fps_upg_i_autofire = {
		desc_id = "bm_wp_upg_i_autofire_1911",
		stats = { value = 8, spread = -3, recoil = -18 },
		custom_stats = {rof_mult = 2.2471910112359550561797752808989, block_eq_aced = true, hipfire_mod = 1.2}
	}
	--Bayonet
	self.parts.wpn_fps_snp_mosin_ns_bayonet.custom_stats = { ads_speed_mult = 0.90 }
	self.parts.wpn_fps_snp_mosin_ns_bayonet.stats = {
				value = 1,
				spread = -1,
				recoil = 1,
				suppression = -2,
				concealment = -2,
				min_damage = 10,
				max_damage = 10,
				min_damage_effect = 1.75,
				max_damage_effect = 1.75,
			}
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.stats = { ads_speed_mult = 0.90 }
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.custom_stats = { ads_speed_mult = 0.90 }
	--}
	
	
	------------------[[HANDGUARDS]]------------------{
	--Aftermarket (CAR-4)
	self.parts.wpn_fps_m4_uupg_fg_lr300.custom_stats = {ads_speed_mult = 1.1}
	self.parts.wpn_fps_m4_uupg_fg_lr300.stats = { value = 5, concealment = 1, recoil = 2, spread = 0 }
	--Competition (CAR-4)
	self.parts.wpn_fps_upg_fg_jp.custom_stats = {ads_speed_mult = 1.075}
	self.parts.wpn_fps_upg_fg_jp.stats = { spread = 2, recoil = -2, concealment = 2 }
	--Gazelle (CAR-4)
	self.parts.wpn_fps_upg_fg_smr.stats = { spread = 1, recoil = 2, concealment = -2 }
	--LVOA
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.custom_stats = {ads_speed_mult = 0.95}
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats = { value = 1, spread = 0, recoil = 4, }
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.forbids = { "wpn_fps_addon_ris" }
	--MOE SL
	self.parts.wpn_fps_upg_ass_m4_fg_moe.stats = { value = 1, spread = 1, recoil = 1, concealment = 2,}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.custom_stats = {ads_speed_mult = 1.05}
	
	--M16 Railed Handguard
	self.parts.wpn_fps_m16_fg_railed.custom_stats = { ads_speed_mult = 0.95 }
	self.parts.wpn_fps_m16_fg_railed.stats = { value = 7, spread_moving = -2, recoil = 2, concealment = -2, spread = 1 }
	--M16A1 Handguard
	self.parts.wpn_fps_m16_fg_vietnam.custom_stats = { ads_speed_mult = 1.05 }
	self.parts.wpn_fps_m16_fg_vietnam.stats = { value = 10, spread_moving = 1, spread = 2, concealment = 2, recoil = -1 }
	--STAG
	self.parts.wpn_fps_upg_ass_m16_fg_stag.stats = { value = 1, recoil = 3, concealment = -3}
	
	--AK Wood Rail
	self.parts.wpn_upg_ak_fg_combo2.stats = { value = 3, spread_moving = -1, spread = 0, recoil = 2 }
	--AK Rail
	self.parts.wpn_upg_ak_fg_combo3.custom_stats = {ads_speed_mult = 0.95}
	self.parts.wpn_upg_ak_fg_combo3.stats = { value = 5, spread_moving = -2, recoil = 1, spread = 1, concealment = -1 }
	--AK War Proven
	self.parts.wpn_fps_upg_ak_fg_tapco.stats = { value = 5, concealment = 3, recoil = 1}
	--AK Light Weight
	self.parts.wpn_fps_upg_fg_midwest.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_upg_fg_midwest.stats = { value = 5, concealment = -2, recoil = -2, spread = 4 }
	--AK TRAX Handguard
	self.parts.wpn_fps_upg_ak_fg_trax.custom_stats = {ads_speed_mult = 0.925}
	self.parts.wpn_fps_upg_ak_fg_trax.stats = { value = 1, spread = -1, recoil = 4, concealment = -2 }
	--AK ZenitCo Handguard
	self.parts.wpn_fps_upg_ak_fg_krebs.custom_stats = {ads_speed_mult = 1.075}
	self.parts.wpn_fps_upg_ak_fg_krebs.stats = { value = 1, spread = 1, concealment = 3 } 	
	
	--G36c Handguard and Barrel
	self.parts.wpn_fps_ass_g36_fg_c.custom_stats = {ads_speed_mult = 1.05, hipfire_mod = 0.85}
	self.parts.wpn_fps_ass_g36_fg_c.stats = { value = 4, spread_moving = 2, spread = -1, concealment = 2 }
	self.parts.wpn_fps_ass_g36_fg_c.forbids = { "wpn_fps_addon_ris", "wpn_fps_ass_g36_b_long" } 
	--G36k Railed Handguard
	self.parts.wpn_fps_ass_g36_fg_ksk.stats = { value = 5, spread_moving = -2, recoil = 2, concealment = -2 }
	self.parts.wpn_fps_ass_g36_fg_ksk.forbids = { "wpn_fps_addon_ris" }
	
	--Karbin Ceres (AK5)
	self.parts.wpn_fps_ass_ak5_fg_ak5c.custom_stats = {rof_mult = 0.96296296296296296296296296296296}
	self.parts.wpn_fps_ass_ak5_fg_ak5c.stats = { value = 7, recoil = 3, spread = 0, spread_moving = -2, concealment = -2 }
	--Belgian Heat (AK5)
	self.parts.wpn_fps_ass_ak5_fg_fnc.custom_stats = {rof_mult = 1.037037037037037037037037037037, has_burst_fire = true}
	self.parts.wpn_fps_ass_ak5_fg_fnc.stats = { value = 10, spread = 2, recoil = -2, concealment = 1}
	
	--MP5k
	self.parts.wpn_fps_smg_mp5_fg_m5k.stats = { value = 4, spread_moving = 3, recoil = -18, concealment = 3, damage = -0, spread = -2 , suppression = -0}
	self.parts.wpn_fps_smg_mp5_fg_m5k.custom_stats = { damage_near_mul = 0.85, damage_far_mul = 0.85, ads_speed_mult = 1.075, rof_mult = 1.125, hipfire_mod = 0.85}
	--MP5 Railed
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.stats = { value = 5, spread_moving = 0, recoil = 3, concealment = -3 }
	--MP5SD
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats = { value = 10, spread_moving = 0, suppression = 12, alert_size = 12, damage = -2, recoil = 4, concealment = 1 }
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.sound_switch = { suppressed = "suppressed_c" }
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.custom_stats = { rof_mult = 0.875, hipfire_mod = 1.15 }
	
	--HK21 Short Handguard
	self.parts.wpn_fps_lmg_hk21_fg_short.custom_stats = {ads_speed_mult = 1.05, damage_near_mul = 0.9, damage_far_mul = 0.9, movement_speed = 1.1, hipfire_mod = 0.85}
	self.parts.wpn_fps_lmg_hk21_fg_short.stats = { value = 6, spread = -2, damage = -0, spread_moving = 2, concealment = 3, recoil = -2, suppression = -1 }
	
	--M249 MK.46 Rail
	self.parts.wpn_fps_lmg_m249_fg_mk46.custom_stats = {ads_speed_mult = 0.95}
	self.parts.wpn_fps_lmg_m249_fg_mk46.stats = { value = 6, recoil = 2, spread_moving = 2, concealment = -1 }
	self.parts.wpn_fps_lmg_m249_fg_mk46.forbids = { "wpn_fps_addon_ris" }
	
	--RPK Black Handguard
	self.parts.wpn_fps_lmg_rpk_fg_standard.stats = { value = 5, spread = 0, recoil = 1, spread_moving = 2, concealment = 1 }
	self.parts.wpn_fps_lmg_rpk_fg_standard.adds = {}
	
	--AUG A3 Handguard
	self.parts.wpn_fps_aug_fg_a3.custom_stats = {ads_speed_mult = 0.95}
	self.parts.wpn_fps_aug_fg_a3.stats = { value = 7, recoil = 2, spread_moving = -2, concealment = -2, spread = -0 }
	
	--SG552 Green Handguard
	self.parts.wpn_fps_ass_s552_fg_standard_green.stats = { value = 1, spread = 4, concealment = -4 }
	--SG552 Railed Handguard
	self.parts.wpn_fps_ass_s552_fg_railed.stats = { value = 7, spread_moving = -2, recoil = 2, concealment = -2 }
	
	--Saiga Railed Handguard
	self.parts.wpn_upg_saiga_fg_lowerrail.custom_stats = {ads_speed_mult = 0.95}
	self.parts.wpn_upg_saiga_fg_lowerrail.stats = { value = 5, recoil = 2, spread_moving = -2, concealment = -2 }
	
	--FAL Wooden Handguard
	self.parts.wpn_fps_ass_fal_fg_wood.custom_stats = {movement_speed = 0.95, ads_speed_mult = 0.925}
	self.parts.wpn_fps_ass_fal_fg_wood.stats = { value = 3, spread = 0, recoil = 4, concealment = -2 }
	--FAL DSA SA58 Handguard
	self.parts.wpn_fps_ass_fal_fg_01.stats = { value = 3, damage = -6, spread = -0, recoil = 0, concealment = 6, suppression = -2, total_ammo_mod = 66 }
	self.parts.wpn_fps_ass_fal_fg_01.forbids = { "wpn_fps_addon_ris" }
	self.parts.wpn_fps_ass_fal_fg_01.custom_stats = {movement_speed = 1.05, damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.15, hipfire_mod = 0.85}
	--FAL Romat Handguard
	self.parts.wpn_fps_ass_fal_fg_03.stats = { value = 3, damage = 0, spread = 2, recoil = -0, concealment = -1 }
	self.parts.wpn_fps_ass_fal_fg_03.custom_stats = {ads_speed_mult = 0.95}
	--FAL DSA Freefloat Barrel Handguard
	self.parts.wpn_fps_ass_fal_fg_04.stats = { value = 3, damage = 0, spread = 4, recoil = -2, concealment = -2 }
	self.parts.wpn_fps_ass_fal_fg_04.custom_stats = {ads_speed_mult = 1.05}
	
	--R870 Wood Pump (VANITY)
	self.parts.wpn_fps_shot_r870_fg_wood.stats = { value = 2, recoil = 1}
	self.parts.wpn_fps_shot_r870_fg_wood.custom_stats = {ads_speed_mult = 0.95}
	
	--AKMSU Railed Handguard
	self.parts.wpn_fps_smg_akmsu_fg_rail.custom_stats = {ads_speed_mult = 0.95}
	self.parts.wpn_fps_smg_akmsu_fg_rail.stats = { value = 5, spread_moving = -2, recoil = 2, concealment = -2 }
	
	--G3 PSG-1 Handguard
	self.parts.wpn_fps_ass_g3_fg_psg.custom_stats = {ads_speed_mult = 0.95}
	self.parts.wpn_fps_ass_g3_fg_psg.stats = { value = 5, recoil = 1, spread = 2, concealment = -1 }
	--G3 Railed Handguard
	self.parts.wpn_fps_ass_g3_fg_railed.stats = { value = 3, recoil = 3, spread = 0, concealment = -2 }
	self.parts.wpn_fps_ass_g3_fg_railed.forbids = { "wpn_fps_addon_ris" } 
	--G3 Wood Handguard
	self.parts.wpn_fps_ass_g3_fg_retro.custom_stats = {movement_speed = 1.05, ads_speed_mult = 1.075, hipfire_mod = 0.85}
	self.parts.wpn_fps_ass_g3_fg_retro.stats = { value = 4, recoil = 4, spread = -1, concealment = 2 }
	--G3 Plastic Handguard
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.custom_stats = {ads_speed_mult = 1.05, movement_speed = 1.1, hipfire_mod = 0.85}
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.stats = { value = 2, recoil = -2, spread = 0, concealment = 4 }
	
	--Galil FAB Defence Handguard
	self.parts.wpn_fps_ass_galil_fg_fab.stats = { value = 2, recoil = 3, spread = 0, concealment = -1 }
	self.parts.wpn_fps_ass_galil_fg_fab.stance_mod = {}
	self.parts.wpn_fps_ass_galil_fg_fab.override = {}
	self.parts.wpn_fps_ass_galil_fg_fab.forbids = {}
	
	--Galil MAR Handguard
	self.parts.wpn_fps_ass_galil_fg_mar.stats = { value = 4, recoil = -0, spread = -0, concealment = 4, damage = -6, suppression = -3, total_ammo_mod = 66}
	self.parts.wpn_fps_ass_galil_fg_mar.custom_stats = {movement_speed = 1.1, damage_near_mul = 0.9, damage_far_mul = 0.9, ads_speed_mult = 1.15, rof_mult = 1.0588235294117647058823529411765, hipfire_mod = 0.85}
	self.parts.wpn_fps_ass_galil_fg_mar.override = {}
	self.parts.wpn_fps_ass_galil_fg_mar.forbids = {}
	self.parts.wpn_fps_ass_galil_fg_mar.stance_mod = {}
	--Galil SAR Handguard
	self.parts.wpn_fps_ass_galil_fg_sar.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_ass_galil_fg_sar.stats = { value = 3, recoil = 1, spread = 0, concealment = 1, damage = -0, suppression = -1 }
	--Galil Galatz Handguard
	self.parts.wpn_fps_ass_galil_fg_sniper.stats = { value = 5, recoil = -4, spread = 4, concealment = -2, damage = 0}
	self.parts.wpn_fps_ass_galil_fg_sniper.custom_stats = {damage_near_mul = 1.3, damage_far_mul = 1.3, damage_min_mul = 1.1, ads_speed_mult = 0.90, rof_mult = 0.92647058823529411764705882352941, hipfire_mod = 1.1 }
	
	--FAB Defence UZI Tri-rail
	self.parts.wpn_fps_smg_uzi_fg_rail.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_smg_uzi_fg_rail.stats = { value = 2, recoil = 2, spread = 0, concealment = -2}
	self.parts.wpn_fps_smg_uzi_fg_rail.forbids = { "wpn_fps_addon_ris", "wpn_fps_shot_r870_gadget_rail" }
	
	--DD L85 Quad Rail
	self.parts.wpn_fps_ass_l85a2_fg_short.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_ass_l85a2_fg_short.stats = { value = 1, concealment = 1 }
	
	--Thompson Black Foregrip
	self.parts.wpn_fps_smg_thompson_foregrip_discrete.custom_stats = {ads_speed_mult = 1.05}
	
	--Thompson Black Foregrip
	self.parts.wpn_fps_ass_sub2000_fg_gen2.stats = {
			value = 1,
			spread = 3,
			recoil = -4,
			concealment = 3
		}
	self.parts.wpn_fps_ass_sub2000_fg_gen2.custom_stats = {ads_speed_mult = 1.05}
	--Thompson Black Foregrip
	self.parts.wpn_fps_ass_sub2000_fg_railed.stats = {
			value = 1,
			recoil = 3,
			concealment = -2
		}
	self.parts.wpn_fps_ass_sub2000_fg_railed.custom_stats = {ads_speed_mult = 0.95}
	--Thompson Black Foregrip
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.sound_switch = {
				suppressed = "suppressed_c"
			}
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats = {
			value = 5,
			suppression = 100,
			alert_size = 12,
			spread = 1,
			damage = -2,
			recoil = 5,
			concealment = -2
		}
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.custom_stats = {damage_near_mul = 0.80, damage_far_mul = 0.80, ads_speed_mult = 0.90, hipfire_mod = 1.1}
	--}
	
		
	------------------[[RECEIVERS]]------------------{
	--AR VLTOR Upper 
	self.parts.wpn_fps_m4_upper_reciever_edge.stats = { value = 3, recoil = 0 }
	self.parts.wpn_fps_m4_upper_reciever_edge.custom_stats = { rof_mult = 1.02 }
	
	--AR CORE15 Upper
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.stats = { value = 1, spread = -1, recoil = -1 }
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.custom_stats = { rof_mult = 1.05 }
	
	--AR Balios Upper
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.stats = { value = 1, recoil = 1, spread = 1 }
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.custom_stats = { rof_mult = 0.95 }
	
	--SG552 Black Reciever
	self.parts.wpn_fps_ass_s552_body_standard_black.stats = { value = 7, recoil = 0, concealment = 4 }
	
	--Shell Rack (Loco, 870)
	self.parts.wpn_fps_shot_r870_body_rack.stats = { value = 3, concealment = -2, suppression = -0, recoil = 0, total_ammo_mod = 47 }
	self.wpn_fps_shot_r870.override.wpn_fps_shot_r870_body_rack = { stats = { value = 3, concealment = -2, suppression = -0, recoil = 0, total_ammo_mod = 27 }}
	--}
	
	
	------------------[[BODIES & EXTRA SHIT]]------------------{
	--Saw Fast Body
	self.parts.wpn_fps_saw_body_speed.stats = {value = 1, damage = 3}
	
	--Saw Durable Blade
	self.parts.wpn_fps_saw_m_blade_durable.stats = {value = 1, extra_ammo = 50, total_ammo_mod = 75}
	--Saw Sharp Blade
	self.parts.wpn_fps_saw_m_blade_sharp.stats = {value = 1, damage = 3}
	
	--Mk.14 (M308)
	self.parts.wpn_fps_ass_m14_body_ebr.custom_stats = {movement_speed = 0.95, ads_speed_mult = 0.95, rof_mult = 1.0714285714285714285714285714286 }
	self.parts.wpn_fps_ass_m14_body_ebr.stats = { value = 6, spread_moving = 3, recoil = -3, concealment = 2,	spread = 3 }
	--JAE-100 (M308)
	self.parts.wpn_fps_ass_m14_body_jae.stats = { value = 10, spread_moving = -2, recoil = 4, concealment = -2, spread = -2 }
	
	--Raging Bull Smooth Cylinder
	self.parts.wpn_fps_pis_rage_body_smooth.stats = { value = 6, recoil = 1, concealment = 1 }
	
	--SCAR Rail Extension
	self.parts.wpn_fps_ass_scar_fg_railext.custom_stats = { ads_speed_mult = 0.95 }
	self.parts.wpn_fps_ass_scar_fg_railext.stats = { value = 4, recoil = 2, spread_moving = -1, concealment = -1, spread = -0}
	
	--MSR Aluminium Body
	self.parts.wpn_fps_snp_msr_body_msr.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_snp_msr_body_msr.stats = { value = 10, spread_moving = -2, recoil = -3, concealment = 5}
	
	self.parts.wpn_fps_snp_r93_body_wood.custom_stats = {ads_speed_mult = 0.95}
	self.parts.wpn_fps_snp_r93_body_wood.stats = { value = 7, concealment = -3, recoil = 5}
	
	self.parts.wpn_fps_pis_g26_body_custom.stats = {
		value = 7,
		recoil = 2,
		concealment = -1
	}
			
	self.parts.wpn_fps_smg_mac10_body_ris.custom_stats = { ads_speed_mult = 0.95 }
	self.parts.wpn_fps_smg_mac10_body_ris.stats = {
		value = 5,
		recoil = 3,
		spread_moving = -2,
		concealment = -2
	}
	
	
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.stats = {value = 1, recoil = -1}
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.custom_stats = { reload_speed_mult = 1.05 }
	
	self.parts.wpn_fps_lmg_m134_body_upper_light.stats = { value = 1, spread = 0, recoil = -2, concealment = 3, total_ammo_mod = -100 }
	self.parts.wpn_fps_lmg_m134_body_upper_light.custom_stats = {movement_speed = 1.2, reload_speed_mult = 1.1}
	
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.stats = { value = 1, spread = 1, recoil = 2, concealment = -3 }
	
	self.parts.wpn_fps_aug_body_f90.stats = { value = 1, spread = 1, recoil = -2, concealment = -2 }
	self.parts.wpn_fps_aug_body_f90.custom_stats = { rof_mult = 1.2142857142857142857142857142857 }
	
	self.parts.wpn_fps_upg_o_ak_scopemount.stats = { value = 1, recoil = -1, concealment = -1 }
	self.parts.wpn_fps_upg_o_m14_scopemount.stats = { value = 1, recoil = -1, concealment = -1 }
	
	--WA2k bodies
	self.parts.wpn_fps_snp_wa2000_g_light.stats = { value = 1, recoil = -3, concealment = -2 }
	self.parts.wpn_fps_snp_wa2000_g_light.custom_stats = { movement_speed = 1.1 }
	
	self.parts.wpn_fps_snp_wa2000_g_stealth.stats = { value = 1, recoil = 0, concealment = 2 }
	
	self.parts.wpn_fps_snp_wa2000_g_walnut.stats = { value = 1, recoil = 3, concealment = -2 }
	self.parts.wpn_fps_snp_wa2000_g_walnut.custom_stats = { ads_speed_mult = 0.95 }
	
	self.parts.wpn_fps_bow_hunter_b_skeletal.stats = { value = 1, recoil = 2, concealment = 1 }
	self.parts.wpn_fps_bow_hunter_b_carbon.stats = { value = 1, spread = 1, concealment = 1 }
	
	
	--}
			
			
	------------------[[PISTOL GRIPS]]------------------{
	--Glock grip Sleeve
	self.parts.wpn_fps_pis_g18c_g_ergo.custom_stats = {ads_speed_mult = 1.05}
	
	--Ergo Grip (Non-AK Rifles)
	self.parts.wpn_fps_upg_m4_g_ergo.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_upg_m4_g_ergo.stats = { value = 2, spread_moving = 2, spread = 3, recoil = -1}
	--Pro Grip (Non-AK Rifles)
	self.parts.wpn_fps_upg_m4_g_sniper.stats = { value = 6, spread = 1, recoil = 2, spread_moving = -2, concealment = -1 }
	--Rubber Grip (Non-AK Rifles)
	self.parts.wpn_fps_upg_m4_g_hgrip.stats = { value = 2, spread_moving = 2, recoil = 3, spread = 0 }
	--Straight Grip
	self.parts.wpn_fps_upg_m4_g_mgrip.stats = { value = 2, spread_moving = 2, concealment = 2, spread = 1 }
	
	
	--AK Rubber Grip
	self.parts.wpn_fps_upg_ak_g_hgrip.stats = { value = 2, recoil = 1, concealment = 2 }
	--AK Plastic Grip
	self.parts.wpn_fps_upg_ak_g_pgrip.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_upg_ak_g_pgrip.stats = { value = 2, spread = 2,  recoil = -1}
	--AK Wood Grip
	self.parts.wpn_fps_upg_ak_g_wgrip.stats = { value = 2, recoil = 2, concealment = -1, spread = 0 }
	
	--SG552 Green Grip
	self.parts.wpn_fps_ass_s552_g_standard_green.stats = { value = 4, recoil = 1, concealment = -2 }
	
	--Ergo Grip (HK21)
	self.parts.wpn_fps_lmg_hk21_g_ergo.stats = { value = 3, recoil = 1, concealment = -1 }
	self.parts.wpn_fps_lmg_hk21_g_ergo.custom_stats = {ads_speed_mult = 1.05}
	
	--Ergo Grip (Deagle)
	self.parts.wpn_fps_pis_deagle_g_ergo.stats = { value = 6, spread_moving = 2, recoil = 2, concealment = -1 }
	self.parts.wpn_fps_pis_deagle_g_ergo.custom_stats = {ads_speed_mult = 1.05}
	--Bling Grip (Deagle)
	self.parts.wpn_fps_pis_deagle_g_bling.stats = { value = 10, spread_moving = -2, spread = 2, concealment = 1, recoil = -2 }
	
	--Bling Grip (1911)
	self.parts.wpn_fps_pis_1911_g_ergo.stats = { value = 10, spread = 0, recoil = 2 }
	self.parts.wpn_fps_pis_1911_g_ergo.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_pis_1911_g_bling.stats = { value = 10, spread = 2, recoil = -1 }
	
	--PPK Grip
	self.parts.wpn_fps_pis_ppk_g_laser.stats = { value = 1, spread = 2 }
	self.parts.wpn_fps_pis_ppk_g_laser.sub_type = "laser"
	
	--FAL SAW grip
	self.parts.wpn_fps_ass_fal_g_01.stats = { value = 2, recoil = 2, concealment = 2 }
	
	--G3 Retro Grip
	self.parts.wpn_fps_ass_g3_g_retro.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_ass_g3_g_retro.stats = { 
		value = 2,
		recoil = 2,
		spread = 0,
		concealment = 0
	}
	--G3 PSG-1 Grip
	self.parts.wpn_fps_ass_g3_g_sniper.stats = { 
		value = 2,
		recoil = 1,
		spread = 2,
		concealment = -1
	}
		
	--Famas G2 Grip
	self.parts.wpn_fps_ass_famas_g_retro.custom_stats = { rof_mult = 1.2 }
	self.parts.wpn_fps_ass_famas_g_retro.stats = { 
		value = 2,
		recoil = 1,
		spread = 1,
		concealment = -1
	}
		
	--Galil Galatz Grip
	self.parts.wpn_fps_ass_galil_g_sniper.stats = { 
		value = 2,
		recoil = 1,
		spread = 1,
		concealment = -1
	}
		
	--Skorpion Wood Grip	
	self.parts.wpn_fps_smg_scorpion_g_wood.stats = {
		value = 1,
		spread = 1,
		recoil = 2,
		concealment = -1
	}
	--Skorpion Ergo Grip	
	self.parts.wpn_fps_smg_scorpion_g_ergo.custom_stats = {ads_speed_mult = 1.05}
	self.parts.wpn_fps_smg_scorpion_g_ergo.stats = {
		value = 1,
		recoil = 3,
		concealment = 1
	}
	
	self.parts.wpn_fps_pis_g26_g_laser.sub_type = "laser"
	
	self.parts.wpn_fps_pis_g26_g_gripforce.stats = {
		value = 7,
		recoil = 3,
		spread = 0,
		concealment = -1
	}
	
	--Thompson pistol grip
	self.parts.wpn_fps_smg_thompson_grip_discrete.custom_stats = {ads_speed_mult = 1.05}
	
	self.parts.wpn_fps_bow_hunter_g_walnut.stats = {value = 1, concealment = -1, spread = 2}
	
	
	self.parts.wpn_fps_pis_sparrow_g_cowboy.has_description = true
	
	--}
	
	
	------------------[[STOCKS]]------------------{
	--Caesar (AK5)
	self.parts.wpn_fps_ass_ak5_s_ak5c.stats = { value = 7, recoil = 2, concealment = 2}
	--Bertil (AK5)
	self.parts.wpn_fps_ass_ak5_s_ak5b.stats = { value = 5, recoil = 0, spread = 2, concealment = -1 }
	self.parts.wpn_fps_ass_ak5_s_ak5b.stance_mod = {}
	
	--M45 Folded Stock
	self.parts.wpn_fps_smg_m45_s_folded.stats = { recoil = -6, concealment = 2 }
	
	--870 No Stock Receiver Rail
	self.parts.wpn_fps_shot_r870_s_nostock_single.stats = { value = 1 }
	--870 No Stock
	self.parts.wpn_fps_shot_r870_s_nostock.stats = { value = 4, spread_moving = 1, recoil = -10, concealment = 3 }
	--870 No Stock w/Rail
	self.parts.wpn_fps_shot_r870_s_nostock_big.stats = { value = 3, spread_moving = 1, recoil = -6, concealment = 1 }
	self.parts.wpn_fps_shot_r870_s_nostock_big.adds = {"wpn_fps_m4_uupg_o_flipup"}
	--870 Stock Rail
	self.parts.wpn_fps_shot_r870_s_solid_big.stats = { value = 4, recoil = 3, concealment = -2 }
	self.parts.wpn_fps_shot_r870_s_solid_big.adds = {"wpn_fps_m4_uupg_o_flipup"}
	--870 Top Folding Stock
	self.parts.wpn_fps_shot_r870_s_folding.stats = { value = 4, spread_moving = 1, recoil = 0, concealment = 1 }
		
	--Tactical Shorty (Loco)
	self.parts.wpn_fps_shot_shorty_s_nostock_short.stats = { value = 4, spread_moving = 2, recoil = -5, concealment = 3 }
	self.parts.wpn_fps_shot_shorty_s_nostock_short.adds = {"wpn_fps_m4_uupg_o_flipup"}
	--Standard (Loco)
	self.parts.wpn_fps_shot_r870_s_solid.stats = { value = 2, recoil = 3, concealment = -1 }
	--Solid + Rail
	self.parts.wpn_fps_shot_shorty_s_solid_short.stats = { value = 3, recoil = 4, concealment = -2 }
	self.parts.wpn_fps_shot_shorty_s_solid_short.adds = {"wpn_fps_m4_uupg_o_flipup"}
	
	self.parts.loli_butts = {
		type = "sight",
		name_id = "dicks",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stance_mod = {
			wpn_fps_shot_r870 = {
				translation = Vector3(0, -5, -4.175),
				rotation = Rotation(-0.02, -0, 0)
			},
			wpn_fps_shot_serbu = {
				translation = Vector3(0, -5, -4.175),
				rotation = Rotation(-0.02, -0, 0)
			}
		}
	}
	local m4_stocks = { "wpn_fps_upg_m4_s_standard", "wpn_fps_upg_m4_s_pts", "wpn_fps_upg_m4_s_crane", "wpn_fps_upg_m4_s_mk46", "wpn_fps_upg_m4_s_ubr" }
	for i, fact_id in ipairs(m4_stocks) do
		self.wpn_fps_shot_r870.adds[ fact_id ] = {"loli_butts"}
		self.wpn_fps_shot_serbu.adds[ fact_id ] = {"loli_butts"}
	end
	
	self.parts.wpn_fps_m4_uupg_o_flipup.stance_mod = {
		wpn_fps_shot_r870 = {
			translation = Vector3(0, -5, -4.175),
			rotation = Rotation(-0.02, -0, 0)
		},
		wpn_fps_shot_serbu = {
			translation = Vector3(0, -5, -4.175),
			rotation = Rotation(-0.02, -0, 0)
		},
		wpn_fps_ass_m4 = {
			translation = Vector3(0, 0, 0.43),
			rotation = Rotation(0, 0, 0)
		}
	}
	
	--Standard
	self.parts.wpn_fps_upg_m4_s_standard.stats = { value = 1, concealment = 0, recoil = 1, spread = 0 }
	--Tactical Stock
	self.parts.wpn_fps_upg_m4_s_pts.stats = { value = 1, spread = 1, recoil = 0, concealment = 0 }
	--Wide (AMCAR, CAR-4, AMR-16, Para SMG, M249,Pump Shotguns, AKs)
	self.parts.wpn_fps_upg_m4_s_crane.stats = { value = 3, recoil = 0, concealment = 1, spread = 0 }
	--War-Torn (AMCAR, CAR-4, AMR-16, Para SMG, M249,Pump Shotguns, AKs)
	self.parts.wpn_fps_upg_m4_s_mk46.stats = { value = 3, spread = 2, recoil = -1, concealment = -3 }
	--M4 Folding
	self.parts.wpn_fps_m4_uupg_s_fold.stats = { value = 4, spread = 0, recoil = -3, concealment = 3 }
	--UBR Stock
	self.parts.wpn_fps_upg_m4_s_ubr.stats = { value = 5, spread = 0, recoil = 3, concealment = -2 }
	
	--AK PSL stock
	self.parts.wpn_upg_ak_s_psl.stats = { value = 6, spread = 1, spread = 1, recoil = 5, concealment = -4 }
	--AK Standard Wood Stock
	self.parts.wpn_fps_upg_ak_s_solidstock.stats = { value = 1, recoil = 4, concealment = -3, spread = 0 }
	
	--M249 Solid Stock
	self.parts.wpn_fps_lmg_m249_s_solid.stats = { value = 3, recoil = 4, concealment = -3 }
	
	--RPK Synthetic Stock
	self.parts.wpn_fps_lmg_rpk_s_standard.stats = { value = 3, spread = 1, recoil = -1, concealment = 1 }
	
	--Gangster Special (Mosconi)
	self.parts.wpn_fps_shot_huntsman_s_short.stats = { value = 10, recoil = -12, spread = 0, spread_moving = 3, concealment = 10 }
	
	--Wrist Wrecker
	self.parts.wpn_fps_shot_b682_s_short.stats = { value = 1, recoil = -12, spread = 0, spread_moving = 3, concealment = 6 }
	--Ammo Pouch
	self.parts.wpn_fps_shot_b682_s_ammopouch.stats = { value = 1, total_ammo_mod = 46}
	
	--MP9 Stock
	self.parts.wpn_fps_smg_mp9_s_skel.stats = { value = 5, recoil = 3, spread_moving = -3, concealment = -3, spread = 0 }
	
	--MP5 Retractable Stock
	self.parts.wpn_fps_smg_mp5_s_adjust.stats = { value = 3, spread_moving = 1, concealment = 3, recoil = -3 }
	--MP5 No Stock
	self.parts.wpn_fps_smg_mp5_s_ring.stats = { value = 3, spread_moving = 4, recoil = -6, concealment = 4 }
		
	--SG552 Green Stock
	self.parts.wpn_fps_ass_s552_s_standard_green.stats = { value = 4, recoil = 2, concealment = -2, spread = 0 }
	
	--SCAR Sniper Stock
	self.parts.wpn_fps_ass_scar_s_sniper.stats = { value = 4, recoil = 3, spread_moving = -3, concealment = -3 }
	
	--G36 Solid Stock 
	self.parts.wpn_fps_ass_g36_s_kv.stats = { value = 4, spread_moving = 2, concealment = 2, recoil = 2 }
	--G36 SL8 Stock 
	self.parts.wpn_fps_ass_g36_s_sl8.stats = { value = 9, recoil = 1, spread_moving = -3, concealment = -3, spread = 2 }
	
	--MP7 Extended stock
	self.parts.wpn_fps_smg_mp7_s_long.stats = { recoil = 3, spread_moving = -1, concealment = -2, spread = 0 }
	
	--FAL Folding Stock
	self.parts.wpn_fps_ass_fal_s_01.stats = { value = 3, spread = 0, recoil = -3, concealment = 5 }
	--FAL Magpul Stock
	self.parts.wpn_fps_ass_fal_s_03.stats = { value = 3, spread = 2, recoil = 2, concealment = -2 }
	--FAL Wooden Stock
	self.parts.wpn_fps_ass_fal_s_wood.stats = { value = 3, spread = 0, recoil = 4, concealment = 0 }
	
	--M1014 Solid Stock
	self.parts.wpn_fps_sho_ben_s_solid.stats = { value = 5, recoil = 4, concealment = -2 }
	
	--G3 PSG-1 Stock
	self.parts.wpn_fps_ass_g3_s_sniper.stats = {value = 2,recoil = 0,spread = 2,concealment = -1}
	--G3 Wood Stock
	self.parts.wpn_fps_ass_g3_s_wood.stats = {value = 2,recoil = 2,spread = -0,concealment = -1}
		
	--Galil FAB Stock
	self.parts.wpn_fps_ass_galil_s_fab.stats = {value = 2,recoil = -1,spread = 3,concealment = 3}
	--Galil Light Stock
	self.parts.wpn_fps_ass_galil_s_light.stats = {value = 2,recoil = -2,spread = 4,concealment = 2}
	--Galil Plastic Stock
	self.parts.wpn_fps_ass_galil_s_plastic.stats = {value = 2,recoil = 2,spread = 0,concealment = 1}
	--Galil Skeletal Stock
	self.parts.wpn_fps_ass_galil_s_skeletal.stats = {value = 2,recoil = 0,spread = 1,concealment = 1}
	--Galil Sniper Stock
	self.parts.wpn_fps_ass_galil_s_sniper.stats = {value = 2,recoil = 4,spread = 0,concealment = -2}
	--Galil Wood Stock
	self.parts.wpn_fps_ass_galil_s_wood.stats = {value = 2,recoil = -0,spread = 2,concealment = -2}
		
	--Uzi Synthetic Stock 
	self.parts.wpn_fps_smg_uzi_s_leather.stats = { value = 1, spread = 2, recoil = 2, concealment = -2 }
	--Uzi Wood Stock 
	self.parts.wpn_fps_smg_uzi_s_solid.stats = { value = 1, spread = 0, recoil = 4, concealment = -2 }
	
	--Micro Uzi Stock 
	self.parts.wpn_fps_smg_baka_s_unfolded.stats = { recoil = 8, concealment = -3 }
	--Micro Uzi No Stock
	self.parts.wpn_fps_smg_baka_s_standard.stats = { value = 1, recoil = -8, concealment = 1 }
	
	--Tec-9 Stock
	self.parts.wpn_fps_smg_tec9_s_unfolded.stats = { value = 3, recoil = 5, spread = 1, concealment = -2 }
	
	--C96 Stock
	self.parts.wpn_fps_pis_c96_s_solid.stats = {value = 1, recoil = 8, concealment = -3}
	
	--Mosin Black Stock
	self.parts.wpn_fps_snp_mosin_body_black.stats = {value = 2, recoil = -8, concealment = 3}
	
	--Sterling Solid Stock
	self.parts.wpn_fps_smg_sterling_s_solid.stats = { value = 3, spread = 0, recoil = 3, concealment = -2 }
	self.parts.wpn_fps_smg_sterling_s_folded.stats = { recoil = -3, concealment = 2 }
	self.parts.wpn_fps_smg_sterling_s_nostock.stats = { value = 1, spread = -1, recoil = -5, concealment = 4 }
	
	--SPAS-12 Folded Stock
	self.parts.wpn_fps_sho_s_spas12_folded.stats = { spread = 0, recoil = -3, concealment = 2}
	--SPAS-12 No Stock
	self.parts.wpn_fps_sho_s_spas12_nostock.stats = {value = 4, spread = 0, recoil = -10, concealment = 4}
	--SPAS-12 Solid Stock
	self.parts.wpn_fps_sho_s_spas12_solid.stats = {value = 4, spread = 0, recoil = 4, concealment = -3}
	
	--G18 Stock
	self.parts.wpn_fps_pis_g18c_s_stock.stats = { value = 8, recoil = 8, concealment = -2 }
	
	--Skorpion No Stock
	self.parts.wpn_fps_smg_scorpion_s_nostock.stats = { value = 1, recoil = -3, concealment = 1 }
	
	--M1928 No Stock
	self.parts.wpn_fps_smg_thompson_stock_nostock.stats = { value = 1, recoil = -8, concealment = 4 }
	self.parts.wpn_fps_smg_thompson_stock_nostock.custom_stats = { movement_speed = 1.075}
	--Thompson Synthetic Stock
	self.parts.wpn_fps_smg_thompson_stock_discrete.custom_stats = { movement_speed = 1.025}
	
	--AS Val VSS Stock
	self.parts.wpn_fps_ass_asval_s_solid.stats = { value = 1, recoil = 8, concealment = -3 }
	self.parts.wpn_fps_ass_asval_s_solid.custom_stats = { rof_mult = 0.66666666666666666666666666666667 }
	
	--M240B Stock
	self.parts.wpn_fps_lmg_par_s_plastic.stats = { value = 0, recoil = 3, concealment = -2}
	
	--}
		
		
	------------------[[GADGETS]]------------------{
	--TLR1
	self.parts.wpn_fps_upg_fl_pis_tlr1.stats = { value = 2, recoil = 1, concealment = -1 }
	--Pistol Laser
	self.parts.wpn_fps_upg_fl_pis_laser.stats = { value = 5, recoil = 1, concealment = -1 }
	--X400V
	self.parts.wpn_fps_upg_fl_pis_x400v.stats = { value = 5, recoil = 2, spread = 0, concealment = -2 }
	
	
	--PEQ-5
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.stats = { value = 5, recoil = 1, concealment = -1 }
	--Surefire
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.stats = { value = 3, recoil = 1, concealment = -1 }
	--PEQ-15
	self.parts.wpn_fps_upg_fl_ass_peq15.stats = { value = 5, recoil = 2, concealment = -2 }
	--UTG P38
	self.parts.wpn_fps_upg_fl_ass_utg.stats = { value = 5, recoil = 2, concealment = -2 }
	
	--}
	
	
	------------------[[OPTICS]]------------------{
		
	--ELCAN BUIS
	self.parts.wpn_fps_extra_zoom.stance_mod = {}
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2, 0.05 ) + Vector3( 0, 0 ,-3.15 ) }
	
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2.4, 0.08 )  }
	
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-38.75,-4.45 ),rotation = Rotation( 0,-0.275,0)  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.0,-30.7,-4.6 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( 0.03,-31.65,-5.3 )  }
		
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0.025,-2.7,-0.1 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0.025,-2.7,-0.1 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( 0,-2.05,-3.45 ) ,rotation = Rotation( 0,-0.3,0) }
	
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -6, -1.2)  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0.03,-2.575,-2.75 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-9.4,-6.2 ) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( 0,-2.1,1.925 ) }
		
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.01,-19.8,-3.02 ) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm = { translation = Vector3( -0.01,-19.8,-3.02 ) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( -0.01,-19.8,-3.02 ) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -0.01, 2.5, 0.05 )  }
	
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0.025,-2.7,-0.1 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.3,-2.8 ), rotation = Rotation( 0,-0.3,0)    }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-7.4,-2.2 ), rotation = Rotation( 0,0.0,0)  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-16,-3.0 ) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-14.3, -0.02 )  }
		
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0.01,-7.2, 0.01 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-18.65,-3.9 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-4.8,-3.4 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0.015,-5.3,-2.725 ) ,rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.6,-3 ) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17,-5.15 )}
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.5,-5.05 )}
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0.015,-10.1,-4.75 ),rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.9,-3.59 )}
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.8,-4.15 )}
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(0.01, -10.5, -0.66)}
		
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0.01,-14.65,-2.725 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0.01,-8.675,-2.65 )  }
				
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0.025,-13,-3.35 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( 0.02,-3.7,-3.575 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( 0.02,4.9,-2.85 )  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.045,-20.36,-3 ) }
	
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.0, -12.075, 0.785) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.15, -4.23) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -13.25, -0.55) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -32, -2.325) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( 0,-28.25,-2.875 ), rotation = Rotation( 0,-0.2875,0) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_model70 = { translation = Vector3(0, -15.8, -4.0) }
	
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-18.4,-2.85 ), rotation = Rotation( 0, 0.2, 0) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0.01,-14.45,-4.75 ) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0.01,-14.45,-4.75 ) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0.02, -5.5, -3.125) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -8.2, -2.75) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0.01, -11.1, -1.35) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -16.4, -3.9) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 3.95, 0.1) }
		
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( 0.,-20.6,-3.865 ) }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-4,-0.22 ), rotation = Rotation( 0, -0.2, 0)  }
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-4.25,-3.45 )}		
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0.02,-15.55,-3.44 )}		
	self.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-9.25,-3.2 )}
			
	--EOTech (Base)--{
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2.4, 0.08 )  }
	
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-38.75,-4.45 ),rotation = Rotation( 0,-0.275,0)  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.0,-30.7,-4.6 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( 0.03,-31.65,-5.3 )  }
		
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0.025,-2.7,-0.1 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0.025,-2.7,-0.1 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( 0,-2.05,-3.45 ) ,rotation = Rotation( 0,-0.3,0) }
	
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -6, -1.2)  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0.03,-2.575,-2.75 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-9.4,-6.2 ) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( 0,-2.1,1.925 ) }
		
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.01,-25.7,-3.02 ) + Vector3(0, 8, 0) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm = { translation = Vector3( -0.01,-25.7,-3.02 ) + Vector3(0, 8, 0) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( -0.01,-25.7,-3.02 ) + Vector3(0, 8, 0) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -0.01, 2.5, 0.05 )  }
	
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0.025,-2.7,-0.1 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.3,-2.8 ), rotation = Rotation( 0,-0.3,0)    }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-7.4,-2.2 ), rotation = Rotation( 0,0.0,0)  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-21.9,-2.95 ) + Vector3(0, 8, 0) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-14.3, -0.02 )  }
		
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0.01,-7.2, 0.01 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-18.65,-3.9 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-4.8,-3.4 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0.015,-5.3,-2.725 ) ,rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.6,-3 ) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17,-5.15 )}
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.5,-5.05 )}
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0.015,-10.1,-4.75 ),rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.9,-3.59 )}
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.8,-4.15 )}
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(0.01, -10.5, -0.66)}
		
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0.01,-14.65,-2.725 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0.01,-8.675,-2.65 )  }
				
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0.025,-13,-3.35 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( 0.02,-3.7,-3.575 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( 0.02,4.9,-2.85 )  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 8, 0) }
	
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.0, -12.075, 0.785) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.15, -4.23) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -13.25, -0.55) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -32, -2.325) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( 0,-28.25,-2.875 ), rotation = Rotation( 0,-0.2875,0) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_model70 = { translation = Vector3(0, -15.8, -4.0) }
	
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-24.3,-2.85 ) + Vector3(0, 8, 0), rotation = Rotation( 0, 0.2, 0) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0.01,-14.45,-4.75 ) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0.01,-14.45,-4.75 ) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0.02, -5.5, -3.125) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -8.2, -2.75) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0.01, -11.1, -1.35) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -16.4, -3.9) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 3.95, 0.1) }
		
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( 0.,-20.6,-3.865 ) }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-4,-0.22 ), rotation = Rotation( 0, -0.2, 0)  }
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-4.25,-3.45 )}		
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0.02,-15.55,-3.44 )}		
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-9.25,-3.2 )}
	--}
		
	--Aimpoint PRO (+2)--{
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2.4, 0.08 ) + Vector3(0, 2, 0)  }
	
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-38.75,-4.45 ) + Vector3(0, 2, 0),rotation = Rotation( 0,-0.275,0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.0,-30.7,-4.6 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( 0.03,-31.65,-5.3 ) + Vector3(0, 2, 0)  }
		
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0.025,-2.7,-0.1 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0.025,-2.7,-0.1 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( 0,-2.05,-3.45 ) + Vector3(0, 2, 0) ,rotation = Rotation( 0,-0.3,0) }
	
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -6, -1.2) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0.03,-2.575,-2.75 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-9.4,-6.2 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( 0,-2.1,1.925 ) + Vector3(0, 2, 0) }
		
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.01,-25.7,-3.02 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm = { translation = Vector3( -0.01,-25.7,-3.02 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( -0.01,-25.7,-3.02 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -0.01, 2.5, 0.05 ) + Vector3(0, 2, 0)  }
	
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0.025,-2.7,-0.1 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.3,-2.8 ) + Vector3(0, 2, 0), rotation = Rotation( 0,-0.3,0)    }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-7.4,-2.2 ) + Vector3(0, 2, 0), rotation = Rotation( 0,0.0,0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-21.9,-2.95 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-14.3, -0.02 ) + Vector3(0, 2, 0)  }
		
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0.01,-7.2, 0.01 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-18.65,-3.9 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-4.8,-3.4 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0.015,-5.3,-2.725 ) + Vector3(0, 2, 0) ,rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.6,-3 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17,-5.15 ) + Vector3(0, 2, 0)}
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.5,-5.05 ) + Vector3(0, 2, 0)}
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0.015,-10.1,-4.75 ) + Vector3(0, 2, 0),rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.9,-3.59 ) + Vector3(0, 2, 0)}
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.8,-4.15 ) + Vector3(0, 2, 0)}
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(0.01, -10.5, -0.66) + Vector3(0, 2, 0)}
		
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0.01,-14.65,-2.725 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0.01,-8.675,-2.65 ) + Vector3(0, 2, 0)  }
				
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( 0.02,-3.7,-3.575 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_par = { translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 2, 0) }
	
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.0, -12.075, 0.785) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.15, -4.23) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -13.25, -0.55) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -32, -2.325) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( 0,-28.25,-2.875 ) + Vector3(0, 2, 0), rotation = Rotation( 0,-0.2875,0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_model70 = { translation = Vector3(0, -15.8, -4.0) + Vector3(0, 2, 0) }
	
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-24.3,-2.85 ) + Vector3(0, 2, 0), rotation = Rotation( 0, 0.2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0.01,-14.45,-4.75 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0.01,-14.45,-4.75 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0.02, -5.5, -3.125) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -8.2, -2.75) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0.01, -11.1, -1.35) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -16.4, -3.9) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 3.95, 0.1) + Vector3(0, 2, 0) }
		
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( 0.,-20.6,-3.865 ) + Vector3(0, 2, 0) }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-4,-0.22 ) + Vector3(0, 2, 0), rotation = Rotation( 0, -0.2, 0)  }
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-4.25,-3.45 ) + Vector3(0, 2, 0)}		
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0.02,-15.55,-3.44 ) + Vector3(0, 2, 0)}		
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-9.25,-3.2 ) + Vector3(0, 2, 0)}
	--}
	
	--Specter Sight (+4)--{	
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2.4, 0.08 ) + Vector3(0, 4, 0)  }
	
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-38.75,-4.45 ) + Vector3(0, 4, 0),rotation = Rotation( 0,-0.275,0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.0,-30.7,-4.6 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( 0.03,-31.65,-5.3 ) + Vector3(0, 4, 0)  }
		
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0.025,-2.7,-0.1 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0.025,-2.7,-0.1 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( 0,-2.05,-3.45 ) + Vector3(0, 4, 0) ,rotation = Rotation( 0,-0.3,0) }
	
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -6, -1.2) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0.03,-2.575,-2.75 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-9.4,-6.2 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( 0,-2.1,1.925 ) + Vector3(0, 4, 0) }
		
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.01,-25.7,-3.02 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm = { translation = Vector3( -0.01,-25.7,-3.02 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( -0.01,-25.7,-3.02 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -0.01, 2.5, 0.05 ) + Vector3(0, 4, 0)  }
	
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0.025,-2.7,-0.1 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.3,-2.8 ) + Vector3(0, 4, 0), rotation = Rotation( 0,-0.3,0)    }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-7.4,-2.2 ) + Vector3(0, 4, 0), rotation = Rotation( 0,0.0,0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-21.9,-2.95 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-14.3, -0.02 ) + Vector3(0, 4, 0)  }
		
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0.01,-7.2, 0.01 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-18.65,-3.9 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-4.8,-3.4 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0.015,-5.3,-2.725 ) + Vector3(0, 4, 0) ,rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.6,-3 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17,-5.15 ) + Vector3(0, 4, 0)}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.5,-5.05 ) + Vector3(0, 4, 0)}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0.015,-10.1,-4.75 ) + Vector3(0, 4, 0),rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.9,-3.59 ) + Vector3(0, 4, 0)}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.8,-4.15 ) + Vector3(0, 4, 0)}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(0.01, -10.5, -0.66) + Vector3(0, 4, 0)}
		
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0.01,-14.65,-2.725 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0.01,-8.675,-2.65 ) + Vector3(0, 4, 0)  }
				
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( 0.02,-3.7,-3.575 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 4, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_par = { translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 4, 0) }
	
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.0, -12.075, 0.785) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.15, -4.23) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -13.25, -0.55) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -32, -2.325) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( 0,-28.25,-2.875 ) + Vector3(0, 4, 0), rotation = Rotation( 0,-0.2875,0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_model70 = { translation = Vector3(0, -15.8, -4.0) + Vector3(0, 4, 0) }
	
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-24.3,-2.85 ) + Vector3(0, 4, 0), rotation = Rotation( 0, 0.2, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0.01,-14.45,-4.75 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0.01,-14.45,-4.75 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0.02, -5.5, -3.125) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -8.2, -2.75) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0.01, -11.1, -1.35) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -16.4, -3.9) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 3.95, 0.1) + Vector3(0, 4, 0) }
		
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( 0.,-20.6,-3.865 ) + Vector3(0, 4, 0) }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-4,-0.22 ) + Vector3(0, 4, 0), rotation = Rotation( 0, -0.2, 0)  }
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-4.25,-3.45 ) + Vector3(0, 4, 0)}		
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0.02,-15.55,-3.44 ) + Vector3(0, 4, 0)}		
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-9.25,-3.2 ) + Vector3(0, 4, 0)}
	--}	
		
	--ACOG (+6)--{
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2.4, 0.08 ) + Vector3(0, 6, 0)  }
	
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-38.75,-4.45 ) + Vector3(0, 6, 0),rotation = Rotation( 0,-0.275,0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.0,-30.7,-4.6 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( 0.03,-31.65,-5.3 ) + Vector3(0, 6, 0)  }
		
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0.025,-2.7,-0.1 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0.025,-2.7,-0.1 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( 0,-2.05,-3.45 ) + Vector3(0, 6, 0) ,rotation = Rotation( 0,-0.3,0) }
	
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -6, -1.2) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0.03,-2.575,-2.75 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-9.4,-6.2 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( 0,-2.1,1.925 ) + Vector3(0, 6, 0) }
		
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.01,-25.8,-3.02 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_akm = { translation = Vector3( -0.01,-25.8,-3.02 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( -0.01,-25.8,-3.02 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -0.01, 2.5, 0.05 ) + Vector3(0, 6, 0)  }
	
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0.025,-2.7,-0.1 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.3,-2.8 ) + Vector3(0, 6, 0), rotation = Rotation( 0,-0.3,0)    }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-7.4,-2.2 ) + Vector3(0, 6, 0), rotation = Rotation( 0,0.0,0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-21.9,-2.95 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -0.0,-14.3, -0.02 ) + Vector3(0, 6, 0)  }
		
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0.01,-7.2, 0.01 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-18.65,-3.9 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-4.8,-3.4 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0.015,-5.3,-2.725 ) + Vector3(0, 6, 0) ,rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.6,-3 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17,-5.15 ) + Vector3(0, 6, 0)}
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.5,-5.05 ) + Vector3(0, 6, 0)}
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0.015,-10.1,-4.75 ) + Vector3(0, 6, 0),rotation = Rotation( 0,-0.35,0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.9,-3.59 ) + Vector3(0, 6, 0)}
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.8,-4.15 ) + Vector3(0, 6, 0)}
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(0.01, -10.5, -0.66) + Vector3(0, 6, 0)}
		
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0.01,-14.65,-2.725 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0.01,-8.675,-2.65 ) + Vector3(0, 6, 0)  }
				
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( 0.02,-3.7,-3.575 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 6, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_par = { translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 6, 0) }
	
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -4.8, -0.5) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.0, -12.075, 0.785) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.15, -4.23) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -13.25, -0.55) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -32, -2.325) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( 0,-28.25,-2.875 ) + Vector3(0, 6, 0), rotation = Rotation( 0,-0.2875,0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_model70 = { translation = Vector3(0, -15.8, -4.0) + Vector3(0, 6, 0) }
	
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-24.3,-2.85 ) + Vector3(0, 6, 0), rotation = Rotation( 0, 0.2, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0.01,-14.45,-4.75 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0.01,-14.45,-4.75 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0.02, -5.5, -3.125) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -8.2, -2.75) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0.01, -11.1, -1.35) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -16.4, -3.9) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 3.95, 0.1) + Vector3(0, 6, 0) }
		
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( 0.,-20.6,-3.865 ) + Vector3(0, 6, 0) }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-4,-0.22 ) + Vector3(0, 6, 0), rotation = Rotation( 0, -0.2, 0)  }
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-4.25,-3.45 ) + Vector3(0, 6, 0)}		
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0.02,-15.55,-3.44 ) + Vector3(0, 6, 0)}		
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-9.25,-3.2 ) + Vector3(0, 6, 0)}
	--}
																			
	--45 degree irons
	--{
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m4 = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m16 = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3(-1.4, 14, -12.9),rotation = Rotation(0.9, -1, -45) }
	
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(-2, 8, -9.7),rotation = Rotation(0.4, -0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_aug = { translation = Vector3(-3.65, 5, -11.7),rotation = Rotation(0.4, -0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_famas = { translation = Vector3(2.35, 6, -17),rotation = Rotation(-0.6, 2.2, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( -4.45, 15, -8 ),rotation = Rotation(0.1 ,0.0, -45)}
		
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_74 = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -1.9,18,-3.45 ),rotation = Rotation(0, -0, -45) }
				
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_amcar = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g36 = { translation = Vector3(-0.775, 10, -12.05),rotation = Rotation( 0.45, -0.5, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_s552 = { translation = Vector3(-3.2, 8, -12.5),rotation = Rotation(0.5 ,-0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_olympic = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3(-3.15, 5, -13.4),rotation = Rotation(0.1, -0, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -4.25,-2, -9 ),rotation = Rotation(0, 0.1, -45)}
	
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_m45 = { translation = Vector3(-4.15, 8, -14.65),rotation = Rotation(0.15, -0.1, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3(-4.6, 5, -14.4),rotation = Rotation( 0.35, -0.3, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3(-2.15, 5, -12.75),rotation = Rotation(0.5, -0.5, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3(-1.4, 0, -11),rotation = Rotation( 0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3(-2.975, 5, -15.425),rotation = Rotation( 0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3(-1.4, 5, -14.6),rotation = Rotation( 0.75, -0.75, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_uzi = { translation = Vector3(-2.45, 2, -15.2),rotation = Rotation( 0.15, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_sterling = { translation = Vector3(-4.95, 1, -11.7),rotation = Rotation( 0.0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( -2.6,-2,-12.45 ),rotation = Rotation( 0.0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_polymer = { translation = Vector3(-3.25, 10, -9.81),rotation = Rotation( -0.2, 0.2, -45) }
	
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_p90 = { translation = Vector3(-0.75, 5, -12.3),rotation = Rotation( -0.7, 0.2, -45)  }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3(-3.9, 5, -13.4),rotation = Rotation( 0.5, -0.5, -45) }
	
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_hk21 = {translation = Vector3(-2.65, 0, -11.5),rotation = Rotation(0.65, -0.8, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_m249 = {translation = Vector3(0.1, 4, -12.55),rotation = Rotation(0.4, -0.5, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_rpk = {translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_mg42 = {translation = Vector3(0.66, 15, -11.625),rotation = Rotation(-0, 0, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_par = {translation = Vector3(-2.6, 2, -13),rotation = Rotation(-0, 0, -45)}
	
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_m95 = {translation = Vector3(-0.4, -15, -13.25),rotation = Rotation(-0.1, -0.1, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_msr = {translation = Vector3(-2.3, 20, -9.1),rotation = Rotation(0, 0.2, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_mosin = {translation = Vector3(-2.44, -2, -12.6),rotation = Rotation(0, 0, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_r93 = {translation = Vector3(-2.3, 10, -10.8),rotation = Rotation(0, 0.2, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_winchester = { translation = Vector3( -5.5,0,-14.1 ), rotation = Rotation( 0.6,-0.6,-45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-2.4, 3, -9), rotation = Rotation( 0.6,-0.6,-45) }
	
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_shot_saiga = { translation = Vector3(-2.2, 5, -10.25),rotation = Rotation(-0.25, 0.5, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_shot_r870 = { translation = Vector3(-2.65, 4, -15),rotation = Rotation(-0 ,0.2, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_shot_serbu = { translation = Vector3(-2.65, 4, -15),rotation = Rotation(-0 ,0.2, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_ben = { translation = Vector3(-3.45, 10, -13.5),rotation = Rotation(0.4 ,-0.5, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_striker = { translation = Vector3(-2.5, 4, -12.9),rotation = Rotation(0.5 ,-0.3, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(-2.5, 8, -8.65),rotation = Rotation(0.28 ,-0.3, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-2.475, 2, -14.3),rotation = Rotation(-0.2 ,0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(-0.0, 2, 0.1) ,rotation = Rotation(0.8 ,-0.8, -45) } --
	
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m14 = { translation = Vector3(-2.05, 0, -13.85),rotation = Rotation(0.3 ,-0.3, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_scar = { translation = Vector3(-1.65, 8, -9.9),rotation = Rotation(0.8, -0.8, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_fal = { translation = Vector3(-2.45, 10, -13.4),rotation = Rotation(0.7 ,-0.75, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( -0.7,8,-12.4 ),rotation = Rotation(0.75 ,-0.7, -45)}		
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_galil = { translation = Vector3( -2.25,5,-13.2 ),rotation = Rotation(0.275 ,-0.2, -45)}
	--}
	
	
	
	--Leupold
	--{		
self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0.0025,-54.5,-5.71 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_pis_rage = {  translation = Vector3( -0.0075,-46.3,-5.47 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( 0.045,-47.4,-6.1775 ) }
	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0.03,-18.2,-1.015 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0.03,-18.2,-1.015 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( 0.012,-17.675,-4.5325) }
	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_vhs = { translation = Vector3( -0.005,-21.7,-2.0825 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0.0425,-18.2,-3.64 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0.02,-25.125,-7.105 )}	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( -0.001,-17.8,1.025 )}
	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.0075,-41.5,-3.925 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_akm = { translation = Vector3( -0.0075,-41.5,-3.925 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( -0.0075,-41.5,-3.925 )}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -0.002,-13.1, 5.6225 ) }
	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0.03,-18.2,-1.015 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0.01,-20.8,-3.9325 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.0425,-23,-3.072 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( 0.02,-30,-0.925 ) }
	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0.03,-18.2,-1.015 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_akmsu = {  translation = Vector3( 0,-37.7,-3.855 ) }
	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( -0.005,-33.5,-4.775 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( -0.0015,-20.45,-4.325 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0.03,-21,-3.875 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( -0.01,-38.25,-3.865 )}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_scorpion= { translation = Vector3( -0.001,-32.65,-6.03 )}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0.045,-25.8,-5.88 )}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0.00,-27.2,-5.935 )}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( -0.0025,-38.6,-4.465 )}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0.03,-44.65,-5.057 )}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_polymer = { translation = Vector3( -0.0325,-21.25,-1.5325 )}
						
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0.025,-30.3,-3.63 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0.025,-24.4,-3.575 ) }
				
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0.03,-28.6,-4.2325 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( 0.0275,-19.3,-4.465 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.058,-41.9,-3.9175 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_mg42 = { translation = Vector3( 0.0075,-10.5,-3.74 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_par = { translation = Vector3( 0.075,-23.5,-4.096 ) }
	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(-0.002, -47.6, -3.225) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0.0125, -28.71, -1.46) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.00, -27.7, -0.09) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0.015, -29, -1.455) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0.0, -51.8, -5.125) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_winchester = { translation = Vector3(-0.0025, -44, -4.05) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_model70 = { translation = Vector3(0, -31.3, -4.89) }
	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0.015,-40.1,-3.5625 ) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0.035,-30.15,-5.6175) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0.035,-30.15,-5.6175) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0.025, -21.15, -4.025) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -26.75, -3.615) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0.03, -26.8, -2.27) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.155, -32, -4.79) }
	
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_m14 = { translation = Vector3(0.01, -36.3, -4.745) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_scar = { translation = Vector3(0.015, -19.6, -1.2625) }
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0.0075,-19.9,-4.345 )}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0.0275,-31.1,-4.31 )}		
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0.0325,-25,-4.13 )}
	--}
			
			
	--Schmidt & Bender 1-8x24 PM Short Dot (default sniper attachment)
	--{
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0.01, -25.75, -1.35) }
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0.015, -26, -1.355) }
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(-0.0025, -44.7, -3.12)}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0.0, -48.75, -5.025) }
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(-0.0025, -24.8, 0.01) }
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_model70 = { translation = Vector3(-0.0025, -28.5, -4.78) }
	--}
	
	--C96 Scope (same as above but shrunken)
	--{
	self.parts.wpn_fps_pis_c96_sight.stance_mod.wpn_fps_pis_c96 = { translation = Vector3(-3.405, -39.15, 0.93) }
	--}
	
	--Specter Sight (ELCAN Specter DR)
	self.parts.wpn_fps_upg_o_specter.stats = { value = 8, zoom = 6, recoil = 1, spread_moving = -3, concealment = -3 }
	self.parts.wpn_fps_upg_o_specter.custom_stats = { ads_speed_mult = 0.95 }
	
	--Military Red Dot (Aimpoint PRO)
	self.parts.wpn_fps_upg_o_aimpoint.stats = { value = 8, zoom = 4, recoil = 0, spread_moving = -3, concealment = -3 }
	self.parts.wpn_fps_upg_o_aimpoint.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back","wpn_fps_m4_uupg_o_flipup","loli_butts","ring_offset" }
	
	--EOTech
	self.parts.wpn_fps_upg_o_eotech.stats = { value = 3, zoom = 3, recoil = 0, spread_moving = -2, concealment = -2 }
	self.parts.wpn_fps_upg_o_eotech.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	self.parts.wpn_fps_upg_o_eotech.stance_mod = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.stance_mod )
	
	--ACOG
	self.parts.wpn_fps_upg_o_acog.custom_stats = { ads_speed_mult = 0.95 }
	self.parts.wpn_fps_upg_o_acog.stats = { value = 6, zoom = 6, recoil = 1, spread_moving = -1, concealment = -3 }
	self.parts.wpn_fps_upg_o_acog.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	
	--Military Red Dot CCE (Aimpoint PRO)
	self.parts.wpn_fps_upg_o_aimpoint_2.stats = { value = 1, zoom = 4, recoil = 0, spread_moving = -3, concealment = -3 }
	self.parts.wpn_fps_upg_o_aimpoint_2.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	self.parts.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.stance_mod )
	
	--EOTech XPS
	self.parts.wpn_fps_upg_o_eotech_xps.stats = { value = 5, zoom = 3, recoil = 0, spread_moving = -3, concealment = -2 }
	self.parts.wpn_fps_upg_o_eotech_xps.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	
	--Aimpoint CS
	self.parts.wpn_fps_upg_o_cs.stats = { value = 5, zoom = 4, recoil = 0, spread_moving = -3, concealment = -1 }
	self.parts.wpn_fps_upg_o_cs.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	self.parts.wpn_fps_upg_o_cs.stance_mod = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.stance_mod )
	
	--RX01
	self.parts.wpn_fps_upg_o_rx01.stats = { value = 5, zoom = 3, recoil = 0, spread_moving = -3, concealment = -1 }
	self.parts.wpn_fps_upg_o_rx01.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	self.parts.wpn_fps_upg_o_rx01.stance_mod = deep_clone( self.parts.wpn_fps_upg_o_eotech_xps.stance_mod )
	
	--Docter
	self.parts.wpn_fps_upg_o_docter.stats = { value = 5, zoom = 2, recoil = 0, spread_moving = -1, concealment = -1 }
	self.parts.wpn_fps_upg_o_docter.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	self.parts.wpn_fps_upg_o_docter.stance_mod = deep_clone( self.parts.wpn_fps_upg_o_eotech_xps.stance_mod )
	
	--Micro T1
	self.parts.wpn_fps_upg_o_t1micro.stats = { value = 3, zoom = 2, recoil = 0, spread_moving = -1, concealment = -1 }
	self.parts.wpn_fps_upg_o_t1micro.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	self.parts.wpn_fps_upg_o_t1micro.stance_mod = deep_clone( self.parts.wpn_fps_upg_o_eotech_xps.stance_mod )
	
	--CMORE
	self.parts.wpn_fps_upg_o_cmore.stats = { value = 5, zoom = 2, recoil = 0, spread_moving = -1, concealment = -1 }
	self.parts.wpn_fps_upg_o_cmore.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	self.parts.wpn_fps_upg_o_cmore.stance_mod = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.stance_mod )
	
	--RX30
	self.parts.wpn_fps_upg_o_rx30.stats = { value = 5, zoom = 3, recoil = 0, spread_moving = -3, concealment = -2 }
	self.parts.wpn_fps_upg_o_rx30.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	self.parts.wpn_fps_upg_o_rx30.stance_mod = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.stance_mod )
	
	--Reflex
	self.parts.wpn_fps_upg_o_reflex.stats = { value = 5, zoom = 2, recoil = 0, spread_moving = -3, concealment = -1 }
	self.parts.wpn_fps_upg_o_reflex.forbids = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.forbids )
	self.parts.wpn_fps_upg_o_reflex.stance_mod = deep_clone( self.parts.wpn_fps_upg_o_aimpoint.stance_mod )
	
	self.parts.wpn_fps_snp_mosin_iron_sight.custom_stats = { ads_speed_mult = 1.05 }
	self.parts.wpn_fps_snp_mosin_iron_sight.stats = { recoil = -1, concealment = 3 }
	
	self.parts.wpn_fps_snp_model70_iron_sight.custom_stats = { ads_speed_mult = 1.05 }
	self.parts.wpn_fps_snp_model70_iron_sight.stats = { recoil = -1, concealment = 3 }
	
	--Marksman Sights (Pistols)
	self.parts.wpn_upg_o_marksmansight_rear.stats = { value = 1, recoil = 0, zoom = 0}
	self.parts.wpn_upg_o_marksmansight_rear.stance_mod = {}
	self.parts.wpn_upg_o_marksmansight_rear.stance_mod.wpn_fps_pis_beretta = { rotation = Rotation(0,-0.4,0) }
	
	--RMR Red Dot (Pistols)
	self.parts.wpn_fps_upg_o_rmr.stats = { value = 1, concealment = -1, recoil = 0, zoom = 1}
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_1911 = { translation = Vector3(0.025, -17, -0.375) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_beretta = { translation = Vector3(0.025, -18.25, -0.5) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_deagle = { translation = Vector3(0, -17.5, -0.7) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g17 = { translation = Vector3(0.05, -18, -0.8) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g18c = { translation = Vector3(0.05, -18, -0.45) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_usp = { translation = Vector3(0.025, -15, -0.25) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_ppk = { translation = Vector3(0.05, -17, -0.8) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_p226 = { translation = Vector3(0.025, -19, -0.54) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g22c = { translation = Vector3(0.03, -16.75, -0.6) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g26 = { translation = Vector3(0.05, -18, -0.7) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_c96 = { translation = Vector3(0, -11.25, -1.15) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_bow_hunter = { translation = Vector3(-0.025, 15, 0.85) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_sparrow = { translation = Vector3(-0.025, -15.75, -0.8) }
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_hs2000 = { translation = Vector3(0.04, -18.5, -0.675) }
	self.parts.wpn_fps_pis_hs2000_sl_long.override = {
		wpn_fps_upg_o_rmr = { 
			stance_mod = { 
				wpn_fps_pis_hs2000 = {translation = Vector3(0.04, -18.5, -0.425)}	
			} 
		}
	}
			
	
	--Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS (Theia)
	self.parts.wpn_fps_upg_o_leupold.stats = {value = 8, zoom = 10, recoil = 2, concealment = -3}
	self.parts.wpn_fps_upg_o_leupold.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight", "wpn_fps_ass_m16_os_frontsight", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back","wpn_fps_ass_sub2000_o_front","wpn_fps_m4_uupg_o_flipup","loli_butts","ring_offset"}
	self.parts.wpn_fps_upg_o_leupold.custom_stats = { ads_speed_mult = 0.90 }
	
	--ShortDot
	self.parts.wpn_fps_upg_o_shortdot.stats = { value = 1, zoom = 8}
	self.parts.wpn_fps_upg_o_shortdot.custom_stats = { ads_speed_mult = 0.925 }
	self.parts.wpn_fps_pis_c96_sight.custom_stats = { ads_speed_mult = 0.925 }
	self.parts.wpn_fps_pis_c96_sight.stats = { value = 1, zoom = 8, recoil = 1, concealment = -3}
	self.parts.wpn_fps_pis_c96_sight.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight", "wpn_fps_ass_l85a2_o_standard","wpn_fps_ass_sub2000_o_back","wpn_fps_m4_uupg_o_flipup","loli_butts","ring_offset" }
	
		--MBUS
	self.parts.wpn_fps_upg_o_mbus_rear.forbids = {"wpn_fps_upg_o_ak_scopemount"}
	self.parts.wpn_fps_upg_o_mbus_rear.stance_mod = {
		wpn_fps_sho_striker = { translation = Vector3(0, -6.75, -2.7), rotation = Rotation(0,0.3,0)  },
		wpn_fps_sho_ksg = { translation = Vector3(0, 0, -1.45), rotation = Rotation(0,0.3,0) },		
		wpn_fps_shot_saiga = { translation = Vector3(0, 0, -2.7), rotation = Rotation(0,0.3,0) },	
		wpn_fps_smg_p90 = { translation = Vector3(0, -3.5, -2.7), rotation = Rotation(0,0.3,0) },	
		wpn_fps_ass_aug = { translation = Vector3(0.01, 0, -2.7), rotation = Rotation(-0.05,0.3,0) }		
	}
	
	for i, factory_id in ipairs(self.parts.wpn_fps_upg_o_mbus_rear.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "wpn_fps_upg_o_mbus_rear")
	end
	
	--45 deg. irons
	self.parts.wpn_fps_upg_o_45iron.stats = {value = 1, gadget_zoom = 1}
	self.parts.wpn_fps_upg_o_45iron.depends_on = "sight"
	self.parts.wpn_fps_upg_o_45iron.forbids = {
		"wpn_upg_o_marksmansight_rear_vanilla","wpn_upg_o_marksmansight_rear",
		"wpn_fps_upg_o_dd_rear","wpn_fps_upg_o_mbus_rear",
		"wpn_fps_m4_uupg_o_flipup",
		"wpn_fps_ass_vhs_o_standard",
		"wpn_fps_smg_polymer_o_iron",
		"wpn_fps_ass_sub2000_o_back",
	}
	
	for i, factory_id in ipairs(self.parts.wpn_fps_upg_o_45iron.forbids) do
		if not self.parts[factory_id].forbids then
			self.parts[factory_id].forbids = {}
		end
		table.insert(self.parts[factory_id].forbids, "wpn_fps_upg_o_45iron")
	end
			
	self.parts.wpn_fps_extra_zoom.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_45iron/wpn_fps_upg_o_45iron"
	self.parts.wpn_fps_extra_zoom.type = "gadget"
	self.parts.wpn_fps_extra_zoom.sub_type = "second_sight"
	self.parts.wpn_fps_extra_zoom.a_obj = "ayy_lmao"
	self.parts.wpn_fps_extra_zoom.stats = {value = 1, gadget_zoom = 1}
	
	--Whinchester Scope
	self.parts.wpn_fps_upg_winchester_o_classic.stance_mod.wpn_fps_snp_winchester = { translation = Vector3(-0.0025, -37, -1.625) }
	self.parts.wpn_fps_upg_winchester_o_classic.custom_stats = { ads_speed_mult = 0.90 }
	self.parts.wpn_fps_upg_winchester_o_classic.stats = {
			value = 0,
			zoom = 8,
			recoil = 1,
			concealment = -3
		}
	--}		
				
				
	------------------[[MAGAZINES]]------------------{
	--30 rounder (AMCAR, AMR-16, Para SMG)
	self.parts.wpn_fps_m4_uupg_m_std.stats = { value = 1, concealment = -1, extra_ammo = 10, total_ammo_mod = 0}
	
	--20 rounder (CAR-4, AK5)
	self.parts.wpn_fps_upg_m4_m_straight_vanilla.custom_stats = {reload_speed_mult = 1.15}
	self.parts.wpn_fps_upg_m4_m_straight.custom_stats = {reload_speed_mult = 1.15}
	self.parts.wpn_fps_upg_m4_m_straight.stats = { value = 2, concealment = 1, extra_ammo = -10, total_ammo_mod = 0 }
	
	--Beta C Mag
	self.parts.wpn_fps_upg_m4_m_drum.custom_stats = { reload_speed_mult = 0.85 }
	self.parts.wpn_fps_upg_m4_m_drum.stats = { value = 9, extra_ammo = 70, recoil = 1, concealment = -5, total_ammo_mod = 0 }
	
	--STANAG Quad Stack 
	self.parts.wpn_fps_upg_m4_m_quad.custom_stats = { reload_speed_mult = 0.9 }
	self.parts.wpn_fps_upg_m4_m_quad.stats = { value = 1, concealment = -2, recoil = 0, spread = 0, extra_ammo = 30, total_ammo_mod = 0}
	
	--AK Quad Stack 
	self.parts.wpn_fps_upg_ak_m_uspalm.custom_stats = { reload_speed_mult = 1.05 }
	self.parts.wpn_fps_upg_ak_m_uspalm.stats = { value = 1, concealment = 1, recoil = -1, spread = 0, extra_ammo = 0 }
	
	--AK Quad Stack 
	self.parts.wpn_fps_upg_ak_m_quad.custom_stats = { reload_speed_mult = 0.9 }
	self.parts.wpn_fps_upg_ak_m_quad.stats = { value = 1, concealment = -3, recoil = 0, spread = 0, extra_ammo = 30 }
	
	--PMAG
	self.parts.wpn_fps_upg_m4_m_pmag.custom_stats = { reload_speed_mult = 1.05 }
	self.parts.wpn_fps_upg_m4_m_pmag.stats = { value = 3, extra_ammo = 1, total_ammo_mod = 0}
	
	--EMAG
	self.parts.wpn_fps_ass_l85a2_m_emag.stats = { value = 3, extra_ammo = 0, concealment = -2, total_ammo_mod = 40, spread = -2}
	self.parts.wpn_fps_ass_l85a2_m_emag.custom_stats = { reload_speed_mult = 0.88 }
	
	--L5
	self.parts.wpn_fps_upg_m4_m_l5.stats = { value = 1, extra_ammo = 0, recoil = 1, total_ammo_mod = 0, spread = -0}
	
	--FAL 30 Round Mag
	self.parts.wpn_fps_ass_fal_m_01.custom_stats = { reload_speed_mult = 0.9 }
	self.parts.wpn_fps_ass_fal_m_01.stats = { value = 3, extra_ammo = 10, concealment = -2 }
	
	--R870 Tube extension
	self.parts.wpn_fps_shot_r870_m_extended.stats = { value = 6, concealment = -1, spread_moving = -1, extra_ammo = 2 }
	
	--Loco Tube extension
	self.parts.wpn_fps_shot_shorty_m_extended_short.stats = { value = 1, extra_ammo = 1 }
	self.parts.wpn_fps_shot_shorty_m_extended_short.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	self.parts.wpn_fps_shot_shorty_m_extended_short.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	
	--Saiga 20 Round Drum
	self.parts.wpn_upg_saiga_m_20rnd.stats = { value = 1, extra_ammo = 15 }
	self.parts.wpn_upg_saiga_m_20rnd.custom_stats = { reload_speed_mult = 0.85 }
	
	--MP7 40 rounder
	self.parts.wpn_fps_smg_mp7_m_extended.custom_stats = { reload_speed_mult = 0.95 }
	self.parts.wpn_fps_smg_mp7_m_extended.stats = {  value = 1, concealment = -3, extra_ammo = 20 }
	
	--MP5 GSG-5 Mag
	self.parts.wpn_fps_smg_mp5_m_drum.stats = { value = 1, extra_ammo = 80, damage = -4, recoil = 10 }
	self.parts.wpn_fps_smg_mp5_m_drum.custom_stats = { reload_speed_mult = 0.85, damage_near_mul = 0.85, damage_far_mul = 0.85 }
	--MP5 10mm Mag 
	self.parts.wpn_fps_smg_mp5_m_straight.stats = { value = 1, extra_ammo = 0, damage = 3, recoil = -15, total_ammo_mod = -40 }
	self.parts.wpn_fps_smg_mp5_m_straight.custom_stats = { reload_speed_mult = 0.95 }
	
	--MP9 30 rounder
	self.parts.wpn_fps_smg_mp9_m_extended.custom_stats = { reload_speed_mult = 0.95 }
	self.parts.wpn_fps_smg_mp9_m_extended.stats = { value = 4, concealment = -2, extra_ammo = 10 }
	
	--M10 30 rounder
	self.parts.wpn_fps_smg_mac10_m_extended.custom_stats = { reload_speed_mult = 0.95 }
	self.parts.wpn_fps_smg_mac10_m_extended.stats = { value = 2, spread_moving = -2, recoil = 0, concealment = -2, extra_ammo = 10 }
	
	--Deagle 10 rounder
	self.parts.wpn_fps_pis_deagle_m_extended.custom_stats = { reload_speed_mult = 0.95 }
	
	--1911 12 rounder
	self.parts.wpn_fps_pis_1911_m_extended.stats = { value = 3, spread_moving = -2, concealment = -1, extra_ammo = 4 }
	self.parts.wpn_fps_pis_1911_m_extended.custom_stats = { reload_speed_mult = 0.95 }
	
	--USP 20 rounder
	self.parts.wpn_fps_pis_usp_m_extended.custom_stats = { reload_speed_mult = 0.90 }
	self.parts.wpn_fps_pis_usp_m_extended.stats = { value = 2, spread_moving = -1, concealment = -2, extra_ammo = 8 }
	
	--Glock 33 rounder
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.custom_stats = { reload_speed_mult = 0.95 }
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats = { value = 6, spread_moving = -3, extra_ammo = 16, concealment = -2, recoil = 0 }
	
	--P226 22 rounder
	self.parts.wpn_fps_pis_p226_m_extended.custom_stats = { reload_speed_mult = 0.90 }
	self.parts.wpn_fps_pis_p226_m_extended.stats = { value = 1, extra_ammo = 9, spread_moving = -2, concealment = -2 }
	
	--Beretta 30 rounder 
	self.parts.wpn_fps_pis_beretta_m_extended.custom_stats = { reload_speed_mult = 0.95 }
	self.parts.wpn_fps_pis_beretta_m_extended.stats = { value = 2, spread_moving = -2, concealment = -2, extra_ammo = 15 }
	
	--M45 50 rounder
	self.parts.wpn_fps_smg_m45_m_extended.custom_stats = { reload_speed_mult = 0.95 }
	self.parts.wpn_fps_smg_m45_m_extended.stats = { value = 4, concealment = -2, extra_ammo = 14, recoil = 1 }
	
	--Skorpion Dual Mags
	self.parts.wpn_fps_smg_scorpion_m_extended.custom_stats = { reload_speed_mult = 2, dual_mags = true }
	self.parts.wpn_fps_smg_scorpion_m_extended.stats = { value = 1, concealment = -3, recoil = 1}
	
	--TEC-9 50rnd Mag
	self.parts.wpn_fps_smg_tec9_m_extended.custom_stats = { reload_speed_mult = 0.9 }
	self.parts.wpn_fps_smg_tec9_m_extended.stats = { value = 4, extra_ammo = 18, recoil = 0, concealment = -2}
	
	--G26 Stippled Mag
	self.parts.wpn_fps_pis_g26_m_contour.custom_stats = { reload_speed_mult = 1.15 }
	self.parts.wpn_fps_pis_g26_m_contour.stats = { value = 6, recoil = 2, spread = 0, concealment = -1, damage = 0	}
	
	--AK Drum Mag
	self.parts.wpn_upg_ak_m_drum.custom_stats = { reload_speed_mult = 0.85 }
	self.parts.wpn_upg_ak_m_drum.stats = { value = 5, concealment = -4, extra_ammo = 45}
	
	--Sterling 34rnd Mag
	self.parts.wpn_fps_smg_sterling_m_long.custom_stats = { reload_speed_mult = 0.95 }
	self.parts.wpn_fps_smg_sterling_m_long.stats = {
				value = 1,
				extra_ammo = 14,
				concealment = -2
			}
	--Sterling 10rnd Mag
	self.parts.wpn_fps_smg_sterling_m_short.custom_stats = { reload_speed_mult = 1.2}
	self.parts.wpn_fps_smg_sterling_m_short.stats = {
				value = 1,
				extra_ammo = -10,
				concealment = 2
			}
	--C96 20rnd Mag
	self.parts.wpn_fps_pis_c96_m_extended.stats = {
				value = 1,
				concealment = -2,
				extra_ammo = 10
			}
		
	--XD-40 Extended Mag
	self.parts.wpn_fps_pis_hs2000_m_extended.custom_stats = { reload_speed_mult = 0.95 }
	self.parts.wpn_fps_pis_hs2000_m_extended.stats = { value = 1, extra_ammo = 6}
	
	--AA-12 Drum
	self.parts.wpn_fps_sho_aa12_mag_drum.custom_stats = { reload_speed_mult = 0.85 }
	self.parts.wpn_fps_sho_aa12_mag_drum.stats = { value = 1, extra_ammo = 12, concealment = -4 }
	
	--Rare (The proper way to eat steak)
	self.parts.wpn_fps_fla_mk2_mag_rare.stats = {
		value = 1,
		total_ammo_mod = 50,
		damage = -2
	}
	--Well Done (Gross)
	self.parts.wpn_fps_fla_mk2_mag_welldone.stats = {
		value = 1,
		total_ammo_mod = -50,
		damage = 2
	}
	--}
	
	
	------------------[[AMMO]]------------------{
	
	self.parts.wpn_fps_upg_a_bow_explosion.stats = {damage = 13, spread = -5, total_ammo_mod = -100}
	self.parts.wpn_fps_upg_a_bow_poison.stats = {damage = -26, total_ammo_mod = -50}
	
	self.parts.wpn_fps_bow_long_m_explosive.stats = {damage = 8, spread = -5, total_ammo_mod = -100}
	self.parts.wpn_fps_bow_long_m_poison.stats = {damage = -9, total_ammo_mod = -50}
	
	self.parts.wpn_fps_upg_a_crossbow_explosion.stats = {damage = 20, recoil = -5, spread = -5, total_ammo_mod = -100}
	self.parts.wpn_fps_upg_a_crossbow_poison.stats = {damage = -27, total_ammo_mod = -50}
	
	self.parts.wpn_fps_bow_arblast_m_explosive.stats = {damage = 1, recoil = -12, spread = -5, total_ammo_mod = -100}
	self.parts.wpn_fps_bow_arblast_m_poison.stats = {damage = -16, total_ammo_mod = -50}
	
	self.parts.wpn_fps_bow_frankish_m_explosive.stats = {damage = 3, recoil = -7, spread = -5, total_ammo_mod = -100}
	self.parts.wpn_fps_bow_frankish_m_poison.stats = {damage = -6, total_ammo_mod = -50}
	
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats = {damage = -30}
	
	self.parts.wpn_fps_upg_a_slug.stats = { value = 5, total_ammo_mod = -50, damage = -6, spread = 50, moving_spread = -5, recoil = -15 }
	self.parts.wpn_fps_upg_a_slug.custom_stats = { damage_far_mul = 2.5, rays = 1, armor_piercing_add = 1, can_shoot_through_enemy = true, can_shoot_through_shield = true, can_shoot_through_wall = true, ammo_pickup_min_mul = 0.85, ammo_pickup_max_mul = 0.85, damage_near_mul = 1, hipfire_mod = 1.2, hs_mult = 1 }
	
	self.parts.wpn_fps_upg_a_custom.stats = { value = 5, total_ammo_mod = 0, damage = 0, spread = -5, recoil = -8 }
	self.parts.wpn_fps_upg_a_custom.custom_stats = { rays = 6, damage_near_mul = 1.20, damage_far_mul = 0.65, armor_piercing_add = 0.1}
	
	self.parts.wpn_fps_upg_a_piercing.stats = { value = 5, damage = -4, spread = 10, recoil = 3 }
	self.parts.wpn_fps_upg_a_piercing.custom_stats = { rays = 15, damage_near_mul = 1.4, armor_piercing_add = 1}
	
	self.parts.wpn_fps_upg_a_explosive.stats = { value = 5, total_ammo_mod = -100, damage = 6, spread = 30, moving_spread = 6, suppression = -110, recoil = -10 }
	self.parts.wpn_fps_upg_a_explosive.custom_stats = { ignore_statistic = true, rays = 1, damage_near_mul = 2.5, bullet_class = "InstantExplosiveBulletBase", ammo_pickup_min_mul = 0.65, ammo_pickup_max_mul = 0.65, hipfire_mod = 1.5, ignore_dmg_boosts = true }
	
	--[[ 	
	self.wpn_fps_shot_serbu.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -100, damage = 2, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}
	
	self.wpn_fps_shot_r870.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -100, damage = 0, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}
	
	self.wpn_fps_shot_b682.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -100, damage = -12, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}
	
	self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -100, damage = -12, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}
	
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -100, damage = 8, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}
	
	self.wpn_fps_sho_ben.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -100, damage = 12, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}
	
	self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -100, damage = 8, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}
	
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -100, damage = 4, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }}
	
	self.wpn_fps_sho_striker.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -100, damage = 16, spread = 4, moving_spread = 6, suppression = -110, recoil = -6 }} ]]
	
	
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_piercing = {
		desc_id = "bm_wp_upg_a_piercing_judge",
		custom_stats = { rays = 10, damage_near_mul = 1.4, armor_piercing_add = 1, ammo_pickup_min_mul = 1.0, ammo_pickup_max_mul = 1.025}
	}
	
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom = { 
		desc_id = "bm_wp_upg_a_custom_judge",
		custom_stats = { rays = 4, ammo_pickup_min_mul = 0.95, ammo_pickup_max_mul = 1, damage_far_mul = 0.65, damage_near_mul = 1.20, armor_piercing_add = 0.1}
	}
	
	self.parts.wpn_fps_upg_a_dragons_breath.stats = {
				value = 5,
				total_ammo_mod = -50,
				damage = -0,
				spread = -2,
				recoil = 4
			}
	self.parts.wpn_fps_upg_a_dragons_breath.custom_stats = {
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
	
	self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath = { desc_id = "bm_wp_upg_a_dragons_breath_auto", 
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
	self.wpn_fps_sho_ben.override.wpn_fps_upg_a_dragons_breath = deep_clone(self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath)
	self.wpn_fps_shot_saiga.override.wpn_fps_upg_a_dragons_breath = deep_clone(self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath)
	self.wpn_fps_sho_aa12.override.wpn_fps_upg_a_dragons_breath = deep_clone(self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath)
	
	
	self.parts.wpn_fps_upg_a_custom_free.stats = deep_clone(self.parts.wpn_fps_upg_a_custom.stats)
	self.parts.wpn_fps_upg_a_custom_free.name_id = "bm_wp_upg_a_custom"
	self.parts.wpn_fps_upg_a_custom_free.desc_id = "bm_wp_upg_a_custom_desc"
	self.parts.wpn_fps_upg_a_custom_free.custom_stats = deep_clone(self.parts.wpn_fps_upg_a_custom.custom_stats)
	
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom_free = { 
		desc_id = "bm_wp_upg_a_custom_judge",
		custom_stats = { rays = 4, ammo_pickup_min_mul = 0.85, ammo_pickup_max_mul = 0.95, damage_far_mul = 0.70, damage_near_mul = 1.20, armor_piercing_add = 0.1}
	}
	
	--}
	
	
	------------------[[GUN FIXES]]------------------{
	
	self.wpn_fps_ass_sub2000.override.wpn_fps_upg_o_45iron = { parent = "foregrip" }
	self.wpn_fps_ass_sub2000.override.wpn_fps_upg_o_leupold = { parent = "foregrip" }
	self.wpn_fps_ass_sub2000.override.shortdot_normal = { parent = "foregrip" }
	
	self.wpn_fps_ass_sub2000.adds = {
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
			shortdot_normal = {
				"wpn_fps_ass_sub2000_o_adapter",
				"wpn_fps_ass_sub2000_o_back_down"
			},
			wpn_fps_upg_o_leupold = {
				"wpn_fps_ass_sub2000_o_adapter",
				"wpn_fps_ass_sub2000_o_back_down"
			}
		}
		
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.adds = {"wpn_fps_ass_sub2000_o_back"}
	self.parts.wpn_fps_ass_sub2000_fg_railed.adds = {"wpn_fps_ass_sub2000_o_back"}
	self.parts.wpn_fps_ass_sub2000_fg_gen2.adds = {"wpn_fps_ass_sub2000_o_front","wpn_fps_ass_sub2000_o_back"}
	self.parts.wpn_fps_ass_sub2000_fg_gen1.adds = {"wpn_fps_ass_sub2000_o_front","wpn_fps_ass_sub2000_o_back"}
	
	self.wpn_fps_ass_asval.adds.wpn_fps_upg_o_45iron = {"wpn_fps_ass_asval_scopemount"}
	self.wpn_fps_ass_asval.adds.shortdot_normal = {"wpn_fps_ass_asval_scopemount"}
	self.wpn_fps_ass_asval.adds.wpn_fps_upg_o_leupold = {"wpn_fps_ass_asval_scopemount"}
	
	self.wpn_fps_smg_mp5.adds.wpn_fps_upg_o_45iron = {"wpn_fps_smg_mp5_body_rail"}
	self.wpn_fps_smg_mp5.adds.shortdot_normal = {"wpn_fps_smg_mp5_body_rail"}
	self.wpn_fps_smg_mp5.adds.wpn_fps_upg_o_leupold = {"wpn_fps_smg_mp5_body_rail"}
	
	self.parts.wpn_fps_sho_ksg_b_standard.override = {
		wpn_fps_upg_o_dd_front = {a_obj = "a_o_f_2"},
		wpn_fps_upg_o_mbus_front = {a_obj = "a_o_f_2"}
	}
	
	--Puts the SCAR rail extension right below the front iron sight when irons are used
	self.wpn_fps_snp_msr.override.wpn_fps_snp_mosin_iron_sight = { 
			adds = {"wpn_fps_m4_uupg_o_flipup"},
			stats = { recoil = -1,	concealment = 3 }
		}
	self.parts.wpn_fps_snp_msr_body_wood.override = {
		wpn_fps_snp_mosin_iron_sight = { 
			unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_fg_railext",
			a_obj = "a_b"}
		}
	
	--Puts the unused R870 stock/rail combo right below the front iron sight when irons are used
	self.wpn_fps_snp_r93.override.wpn_fps_snp_mosin_iron_sight = { 
			adds = {"wpn_fps_m4_uupg_o_flipup", "wpn_fps_shot_r870_s_nostock_single"},
			stats = { recoil = -1,	concealment = 3 }
		}
	self.wpn_fps_snp_r93.override.wpn_fps_shot_r870_s_nostock_single = { a_obj = "a_b" }
	
	
	--I can't be fucked to even try this on the M95. You get the Daniel Defence front post instead.
	self.wpn_fps_snp_m95.override.wpn_fps_snp_mosin_iron_sight = { 
		adds = {"wpn_fps_ass_vhs_o_standard"},
		stats = { recoil = -1,	concealment = 3 }
	}
	
		
	--sets optics to the default optic postion on a gun for some of the AK type handguard mods for consistencies sake (I cannot be fucked to reposition optic coords for such tiny changes)
	self.parts.wpn_upg_saiga_fg_standard.override = {}
	self.parts.wpn_fps_smg_akmsu_fg_standard.override = {}
	self.parts.wpn_upg_ak_fg_standard.override = {}
	self.parts.wpn_upg_ak_fg_standard_gold.override = {}
	self.parts.wpn_fps_upg_ak_fg_krebs.override = {}
	self.parts.wpn_fps_upg_ak_fg_zenit.override = {}
	self.parts.wpn_fps_upg_ak_fg_trax.override = {}
	
	self.parts.wpn_fps_upg_o_ak_scopemount.override = {}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech_xps = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-0.01, 1, -4.55)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-0.01, 1, -4.55)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-0.01, 1, -4.55)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(-0.005, -0.785, -4.4),
				rotation = Rotation(0, 0.2, 0)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -0.8, -4.3)
			}
		}
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_t1micro = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech_xps)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_rx01 = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech_xps)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_docter = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech_xps)
	
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-0.01, 1, -4.55) + Vector3(0, 2, 0)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-0.01, 1, -4.55) + Vector3(0, 2, 0)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-0.01, 1, -4.55) + Vector3(0, 2, 0)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(-0.005, -0.785, -4.4) + Vector3(0, 2, 0),
				rotation = Rotation(0, 0.2, 0)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -0.8, -4.3) + Vector3(0, 2, 0)
			}
		}
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_cmore = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint_2 = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_cs = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_reflex = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_rx30 = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint)
	
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-0.01, 1, -4.55) + Vector3(0, 4, 0)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-0.01, 1, -4.55) + Vector3(0, 4, 0)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-0.01, 1, -4.55) + Vector3(0, 4, 0)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(-0.005, -0.785, -4.4) + Vector3(0, 4, 0),
				rotation = Rotation(0, 0.2, 0)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -0.8, -4.3) + Vector3(0, 4, 0)
			}
		}
	}	
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_extra_zoom = {
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-0.01, -0.725, -4.55) + Vector3( 0, 0 ,-3.15 )
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-0.01, -0.725, -4.55) + Vector3( 0, 0 ,-3.15 )
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-0.01, -0.725, -4.55) + Vector3( 0, 0 ,-3.15 )
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(-0.005, -0.785, -4.4) + Vector3(0, 0, -3.15),
				rotation = Rotation(0, 0.2, 0)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -0.8, -4.3)+ Vector3( 0, 0 ,-3.15 )
			}
		}
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_acog = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-0.01, 1, -4.55) + Vector3(0, 6, 0)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-0.01, 1, -4.55) + Vector3(0, 6, 0)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-0.01, 1, -4.55) + Vector3(0, 6, 0)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(-0.005, -0.785, -4.4) + Vector3(0, 6, 0),
				rotation = Rotation(0, 0.2, 0)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, -0.8, -4.3) + Vector3(0, 6, 0)
			}
		}
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.shortdot_normal = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-0.025, -11.5, -5.35)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-0.025, -11.5, -5.35)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-0.025, -11.5, -5.35)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(0.01, -13.5, -5.1)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(-0.0025, -13.6, -5.085)
			}
		}
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_leupold = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_74 = {
				translation = Vector3(-0.0225, -14.6, -5.455)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-0.0225, -14.6, -5.455)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-0.0225, -14.6, -5.455)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(0.015, -16.6, -5.195)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(-0.0, -16.55, -5.19)
			}
		}
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_45iron = {
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
				translation = Vector3(-1.05, 10, -11.25),
				rotation = Rotation(0, 0.2, -45) 
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(-2.15, 10, -14.45),
				rotation = Rotation(0, 0.2, -45) 
			},
		}
	}		
	
	self.parts.wpn_fps_upg_o_m14_scopemount.override = {}
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech_xps = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0, -9.05, -5.225)
			}
		}
	}
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_docter = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech_xps)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_t1micro = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech_xps)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_rx01 = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech_xps)
	
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0, -9.05, -5.225) + Vector3(0, 2, 0)
			}
		}
	}
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_cmore = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint_2 = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_cs = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_reflex = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_rx30 = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint)
	
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0, -9.05, -5.225) + Vector3(0, 4, 0)
			}
		}
	}	
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_extra_zoom = {
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0, -9.05, -5.225) + Vector3(0, 0, -3.15)
			}
		}
	}
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_acog = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0, -9.05, -5.225) + Vector3(0, 6, 0)
			}
		}
	}
	self.parts.wpn_fps_upg_o_m14_scopemount.override.shortdot_normal = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0.0, -21.6, -6.0125)
			}
		}
	}
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_leupold = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0.0, -24.6, -6.1175)
			}
		}
	}	
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_45iron = {
		a_obj = "a_o_sm",
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(-1.1, 10, -15.1),
				rotation = Rotation(-0.1, 0.2, -45) 
			}
		}
	}
	
	
	--Fixes several instances of default attachments having stats
	self.parts.wpn_fps_ass_vhs_m.stats = {}
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.stats = {}
	self.parts.wpn_fps_upg_vg_ass_smg_stubby.stats = {}
	self.parts.wpn_fps_upg_vg_ass_smg_afg.stats = {}
	self.parts.wpn_fps_m4_uupg_fg_rail.stats = {}
	
	--Fixes Glock slides not moving while aiming
	self.parts.wpn_fps_pis_g18c_b_standard.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
	self.parts.wpn_fps_pis_g26_b_standard.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
	self.parts.wpn_fps_pis_g26_b_custom.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
	
	--Fixed the 1911 irons not moving while aiming
	self.wpn_fps_pis_1911.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
	--Fixes the Galil charging handle not moving while shooting
	self.parts.wpn_fps_ass_galil_body_standard.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
	self.wpn_fps_ass_galil.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
	self.parts.wpn_fps_smg_uzi_body_standard.animations = {reload = "reload", reload_not_empty = "reload_not_empty", fire = "recoil", fire_steelsight = "recoil"}
	
	--Adds the optic mounts to guns that need them for the "new" attachments
	self.parts.wpn_fps_pis_deagle_lock.forbids = {
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
		"shortdot_normal",
		}
	
	
	self.wpn_fps_pis_deagle.adds.wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"}
	self.wpn_fps_pis_deagle.adds.shortdot_normal = {"wpn_fps_pis_rage_o_adapter"}
		
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_specter = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_aimpoint = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_docter = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_eotech = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_t1micro = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_cmore = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_acog = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_cs = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_eotech_xps = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_reflex = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_rx01 = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_rx30 = { "wpn_fps_pis_rage_o_adapter" }
	self.wpn_fps_x_deagle.adds.wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"}
	self.wpn_fps_x_deagle.adds.shortdot_normal = {"wpn_fps_pis_rage_o_adapter"}
	
	self.parts.wpn_fps_pis_deagle_b_long.forbids = {
		"wpn_fps_pis_deagle_co_long",
		"wpn_fps_pis_deagle_co_short",
		"wpn_fps_upg_ns_pis_meatgrinder",
		"wpn_fps_upg_ns_pis_ipsccomp"
	}
		
	
	self.wpn_fps_pis_rage.adds.wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"}
	self.wpn_fps_pis_rage.adds.shortdot_normal = {"wpn_fps_pis_rage_o_adapter"}
	
			
	self.parts.wpn_fps_pis_rage_lock.forbids = {
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
		"shortdot_normal",
	}
		
	self.wpn_fps_pis_judge.adds = {
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
		shortdot_normal = {"wpn_fps_pis_rage_o_adapter"}
	}	
	
	self.wpn_fps_smg_baka.adds = {
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
		shortdot_normal = {"wpn_fps_smg_baka_o_adapter"}
	}	
		
		
			
	--Adds rails for the extra optics when needed
	self.wpn_fps_smg_akmsu.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
	self.wpn_fps_smg_akmsu.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
	self.wpn_fps_smg_akmsu.adds.shortdot_normal = { "wpn_fps_ak_extra_ris" }
	
	self.wpn_fps_ass_akm.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
	self.wpn_fps_ass_akm.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
	self.wpn_fps_ass_akm.adds.shortdot_normal = { "wpn_fps_ak_extra_ris" }
	
	self.wpn_fps_ass_akm_gold.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
	self.wpn_fps_ass_akm_gold.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
	self.wpn_fps_ass_akm_gold.adds.shortdot_normal = { "wpn_fps_ak_extra_ris" }
	
	self.wpn_fps_shot_saiga.adds = { 
		wpn_fps_smg_akmsu_body_lowerreceiver = { "wpn_upg_ak_g_standard" }
	}
	
	self.wpn_fps_ass_74.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
	self.wpn_fps_ass_74.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
	self.wpn_fps_ass_74.adds.shortdot_normal = { "wpn_fps_ak_extra_ris" }
	self.wpn_fps_ass_74.adds.wpn_fps_ass_ak_body_lowerreceiver = { "wpn_upg_ak_g_standard" }
		
	self.wpn_fps_ass_ak5.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ass_ak5_body_rail" }
	self.wpn_fps_ass_ak5.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ass_ak5_body_rail" }
	self.wpn_fps_ass_ak5.adds.shortdot_normal = { "wpn_fps_ass_ak5_body_rail" }
	
	self.wpn_fps_sho_spas12.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_sho_spas12.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_sho_spas12.adds.shortdot_normal = { "wpn_fps_shot_r870_ris_special" }
	
	self.wpn_fps_shot_r870.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_shot_r870.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_shot_r870.adds.shortdot_normal = { "wpn_fps_shot_r870_ris_special" }
		
	self.wpn_fps_shot_serbu.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_shot_serbu.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_shot_serbu.adds.shortdot_normal = { "wpn_fps_shot_r870_ris_special" }
	
	self.wpn_fps_lmg_hk21.adds = { 
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
		shortdot_normal = { "wpn_fps_ass_g3_body_rail" },
	}
	
	self.wpn_fps_lmg_mg42.adds = { 
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
		shortdot_normal = { "wpn_fps_snp_mosin_rail" },
	}
	
	self.wpn_fps_snp_winchester.adds = { 
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
		shortdot_normal = { "wpn_fps_smg_thompson_o_adapter" },
	}
		
	self.wpn_fps_ass_g3.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ass_g3_body_rail" }
	self.wpn_fps_ass_g3.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ass_g3_body_rail" }
	self.wpn_fps_ass_g3.adds.shortdot_normal = { "wpn_fps_ass_g3_body_rail" }
	
	self.wpn_fps_ass_akm.adds.wpn_fps_ass_ak_body_lowerreceiver = { "wpn_upg_ak_g_standard" }
	
	self.wpn_fps_lmg_rpk.adds = { 
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
		shortdot_normal = { "wpn_fps_ak_extra_ris" },
		wpn_fps_lmg_rpk_fg_standard = { "wpn_fps_upg_vg_ass_smg_verticalgrip"},
	}
	
	self.wpn_fps_smg_mac10.adds.wpn_fps_upg_o_45iron = { "wpn_fps_smg_mac10_body_ris_special" }
	self.wpn_fps_smg_mac10.adds.wpn_fps_upg_o_leupold = { "wpn_fps_smg_mac10_body_ris_special" }
	self.wpn_fps_smg_mac10.adds.shortdot_normal = { "wpn_fps_smg_mac10_body_ris_special" }
	
	self.wpn_fps_smg_thompson.adds.wpn_fps_upg_o_45iron = { "wpn_fps_smg_thompson_o_adapter" }
	self.wpn_fps_smg_thompson.adds.wpn_fps_upg_o_leupold = { "wpn_fps_smg_thompson_o_adapter" }
	self.wpn_fps_smg_thompson.adds.shortdot_normal = { "wpn_fps_smg_thompson_o_adapter" }
	
	self.wpn_fps_ass_famas.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ass_famas_o_adapter" }
	self.wpn_fps_ass_famas.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ass_famas_o_adapter" }
	self.wpn_fps_ass_famas.adds.shortdot_normal = { "wpn_fps_ass_famas_o_adapter" }
	
	self.wpn_fps_ass_galil.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_ass_galil.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_ass_galil.adds.shortdot_normal = { "wpn_fps_shot_r870_ris_special" }
	
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_smg_m45.adds.shortdot_normal = { "wpn_fps_shot_r870_ris_special" }
	
	
	self.wpn_fps_smg_uzi.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_smg_uzi.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_smg_uzi.adds.shortdot_normal = { "wpn_fps_shot_r870_ris_special" }
	
	self.wpn_fps_smg_tec9.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_smg_tec9.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
	self.wpn_fps_smg_tec9.adds.shortdot_normal = { "wpn_fps_shot_r870_ris_special" }
	
	self.wpn_fps_smg_scorpion.adds.wpn_fps_upg_o_45iron = {"wpn_fps_smg_scorpion_extra_rail"}
	self.wpn_fps_smg_scorpion.adds.wpn_fps_upg_o_leupold = {"wpn_fps_smg_scorpion_extra_rail"}
	self.wpn_fps_smg_scorpion.adds.shortdot_normal = {"wpn_fps_smg_scorpion_extra_rail"}
	
	self.wpn_fps_snp_mosin.adds.wpn_fps_upg_o_leupold = {"wpn_fps_snp_mosin_rail"}
	
	self.wpn_fps_smg_sterling.adds.wpn_fps_upg_o_45iron = {"wpn_fps_smg_sterling_o_adapter"}
	self.wpn_fps_smg_sterling.adds.shortdot_normal = {"wpn_fps_smg_sterling_o_adapter"}
	self.wpn_fps_smg_sterling.adds.wpn_fps_upg_o_leupold = {"wpn_fps_smg_sterling_o_adapter"}
	
	
	self.wpn_fps_x_b92fs.override.wpn_fps_pis_beretta_m_extended = {
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
	self.wpn_fps_x_b92fs.override.wpn_upg_o_marksmansight_front = {a_obj = "a_os"}
	self.wpn_fps_x_b92fs.adds.wpn_fps_upg_o_rmr = {"wpn_fps_pis_beretta_o_std"}
		
	self.wpn_fps_x_1911.override.wpn_fps_pis_1911_m_extended = {
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
	self.wpn_fps_x_1911.override.wpn_upg_o_marksmansight_rear = {
		a_obj = "a_o",
		forbids = {
			"wpn_fps_pis_1911_o_long",
			"wpn_fps_pis_1911_o_standard"
		}
	}
	self.wpn_fps_x_1911.override.wpn_upg_o_marksmansight_front = {a_obj = "a_os"}
	
	
	self.wpn_fps_x_deagle.override.wpn_fps_pis_deagle_m_extended = {
		animations = {reload = "reload_right",reload_not_empty = "reload_not_empty_right",reload_left = "reload_left",reload_not_empty_left = "reload_not_empty_left"},
		stats = {value = 7, concealment = -2, spread_moving = -2, extra_ammo = 6}
	}
	self.wpn_fps_x_deagle.override.wpn_upg_o_marksmansight_rear = {
		a_obj = "a_o",
		forbids = {
			"wpn_fps_pis_deagle_o_standard_front",
			"wpn_fps_pis_deagle_o_standard_front_long",
			"wpn_fps_pis_deagle_o_standard_rear"
		}
	}
	self.wpn_fps_x_deagle.override.wpn_upg_o_marksmansight_front = {a_obj = "a_os"}
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter = {
		a_obj = "a_quite",
		stats = { value = 8, recoil = 1, concealment = -3 }
	}
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_acog = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_aimpoint = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_aimpoint_2 = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_leupold = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
	self.wpn_fps_x_deagle.override.shortdot_normal = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_specter
	
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_docter = {
		a_obj = "a_quite",
		stats = { value = 8, concealment = -1 }
	}
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_t1micro = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_docter
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_cmore = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_docter
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_cs = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_docter
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_reflex = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_docter
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_rx01 = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_docter
	
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_eotech = {
		a_obj = "a_quite",
		stats = { value = 8, concealment = -2 }
	}
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_eotech_xps = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_eotech
	self.wpn_fps_x_deagle.override.wpn_fps_upg_o_rx30 = self.wpn_fps_x_deagle.override.wpn_fps_upg_o_eotech
	
	self.wpn_fps_pis_deagle.override.wpn_fps_upg_o_leupold = {a_obj = "a_quite"}
	self.wpn_fps_pis_deagle.override.shortdot_normal = {a_obj = "a_quite"}
	
	--Removes the gadget rail for some guns and attachments that aren't already covered above (mostly default attachments that have no stats)
	self.parts.wpn_fps_ass_g36_fg_k.forbids = { "wpn_fps_addon_ris" } 
	self.parts.wpn_fps_sho_striker_body_standard.forbids = { "wpn_fps_addon_ris" } 
	self.parts.wpn_fps_smg_mp9_body_mp9.forbids = { "wpn_fps_addon_ris" } 
	self.parts.wpn_fps_smg_mp7_body_standard.forbids = { "wpn_fps_addon_ris" } 
	self.parts.wpn_fps_ass_scar_body_standard.forbids = { "wpn_fps_addon_ris" } 
	self.parts.wpn_fps_smg_p90_body_p90.forbids = { "wpn_fps_addon_ris" }
	self.parts.wpn_fps_lmg_rpk_b_standard.forbids = { "wpn_fps_addon_ris" } 
	
	
	--AR overrides
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 11}}
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 40 }}
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_drum = {stats = { value = 9, extra_ammo = 80, recoil = 1, concealment = -5 }}
	self.wpn_fps_smg_olympic.override.wpn_fps_ass_l85a2_m_emag = {stats = { value = 3, spread = -2, extra_ammo = 10, concealment = -2, total_ammo_mod = 40}}
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 10, recoil = 1, total_ammo_mod = 0, spread = -0}}
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_s_pts = { stats = { value = 1, spread = 1, recoil = 0, concealment = -1 }}
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_s_standard = { stats = { value = 1, spread = 0, recoil = 1, concealment = -1 }}
	
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_s_pts = { stats = { value = 1, spread = 1, recoil = -1, concealment = 0 }}
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_g_sniper = {stats = { value = 6, spread = 1, recoil = 1 }}
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_g_mgrip = {stats = { value = 2, spread = 1}}
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 11}}
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 40 }}
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_drum = {stats = { value = 9, extra_ammo = 80, recoil = 1, concealment = -5 }}
	self.wpn_fps_ass_amcar.override.wpn_fps_ass_l85a2_m_emag = {stats = { value = 3, spread = -2, extra_ammo = 10, concealment = -2, total_ammo_mod = 33}}
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 10, recoil = 1, total_ammo_mod = 0, spread = -0}}
	
	self.wpn_fps_ass_amcar.override.wpn_fps_smg_olympic_fg_railed = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail",
		forbids = {},
		stats = { value = 4, recoil = 2, concealment = -1 }
	}
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_s_pts = {
		stats = { value = 0 }
	}
	
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_s_pts = { stats = { value = 1, spread = 1, recoil = -2, concealment = 1 }}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_s_standard = { stats = { value = 1, spread = 0, recoil = -1, concealment = 1 }}
	self.wpn_fps_ass_m16.override.wpn_fps_m4_uupg_m_std = {stats = { value = 1, concealment = -1, extra_ammo = 10, total_ammo_mod = -0}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 11, total_ammo_mod = -0}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 40, total_ammo_mod = -0 }}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_drum = {stats = { value = 9, extra_ammo = 80, recoil = 1, concealment = -5, total_ammo_mod = -0}}
	self.wpn_fps_ass_m16.override.wpn_fps_ass_l85a2_m_emag = {stats = { value = 3, spread = -2, extra_ammo = 10, concealment = -2, total_ammo_mod = 40}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 10, recoil = 1, total_ammo_mod = 0, spread = -0}}
	self.wpn_fps_ass_m16.override.wpn_fps_m4_uupg_b_long = {stats = { value = 4, damage = 1, spread = 2, recoil = 0, concealment = -2, suppression = 0}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf = {stats = { value = 1, spread = 8, recoil = -10, total_ammo_mod = -0, damage = 2, concealment = -4 }}
	
	self.wpn_fps_ass_m4.override.wpn_fps_upg_m4_s_pts = { 
		stats = { value = 1, spread = 1, recoil = -1, concealment = 0 }
	}
	
	
	--AK overrides
	self.wpn_fps_shot_saiga.override.wpn_fps_ass_akm_body_upperreceiver_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_body_upperreceiver" 
	}
	self.wpn_fps_shot_saiga.override.wpn_fps_upg_o_mbus_rear = { 
		a_obj = "a_or", 
		stats = { value = 3, concealment = 0 } 
	}
	self.wpn_fps_shot_saiga.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_of", }
	self.wpn_fps_shot_saiga.override.wpn_fps_upg_m4_s_standard = { stats = { value = 1, spread = 0, recoil = 1, concealment = -1 } }
	self.wpn_fps_shot_saiga.override.wpn_fps_upg_m4_s_pts = { stats = { value = 1, spread = 1, recoil = 0, concealment = -1 } }
	self.wpn_fps_shot_saiga.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, recoil = 4, concealment = -2 } }
		
	self.wpn_fps_smg_akmsu.override.wpn_fps_upg_m4_s_standard = { stats = { value = 1, spread = 0, recoil = 1, concealment = -1 } }
	self.wpn_fps_smg_akmsu.override.wpn_fps_upg_m4_s_pts = { stats = { value = 1, spread = 1, recoil = 0, concealment = -1 } }
	self.wpn_fps_smg_akmsu.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, recoil = 4, concealment = -2 } }
	
	self.wpn_fps_ass_akm.override.wpn_fps_upg_m4_s_standard = { stats = { value = 1, spread = 0, recoil = 1, concealment = -1 } }
	self.wpn_fps_ass_akm.override.wpn_fps_upg_m4_s_pts = { stats = { value = 1, spread = 1, recoil = 0, concealment = -1 } }
	self.wpn_fps_ass_akm.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, recoil = 4, concealment = -2 } }
	
	self.wpn_fps_ass_74.override.wpn_fps_upg_m4_s_standard = { stats = { value = 1, spread = 0, recoil = 1, concealment = -1 } }
	self.wpn_fps_ass_74.override.wpn_fps_upg_m4_s_pts = { stats = { value = 1, spread = 1, recoil = 0, concealment = -1 } }
	self.wpn_fps_ass_74.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, recoil = 4, concealment = -2 } }
	
	self.wpn_fps_ass_akm_gold.override.wpn_fps_upg_m4_s_standard = { stats = { value = 1, spread = 0, recoil = 1, concealment = -1 } }
	self.wpn_fps_ass_akm_gold.override.wpn_fps_upg_m4_s_pts = { stats = { value = 1, spread = 1, recoil = 0, concealment = -1 } }
	self.wpn_fps_ass_akm_gold.override.wpn_fps_lmg_rpk_s_standard = { stats = { value = 2, recoil = 4, concealment = -2 } }
	
	if DMCWO.akmsu_stock_switch == true then
		self.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
		self.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
	else
		self.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_folding_vanilla = {}
		self.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_skfoldable = {}
	end
	
	if DMCWO.akm_stock_switch == true then
		self.wpn_fps_ass_akm.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
		self.wpn_fps_ass_akm.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
	else
		self.wpn_fps_ass_akm.override.wpn_upg_ak_s_folding_vanilla = {}
		self.wpn_fps_ass_akm.override.wpn_upg_ak_s_skfoldable = {}	
	end
		
	if DMCWO.saiga_stock_switch == true then
		self.wpn_fps_shot_saiga.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
		self.wpn_fps_shot_saiga.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
	else
		self.wpn_fps_shot_saiga.override.wpn_upg_ak_s_folding_vanilla = {}
		self.wpn_fps_shot_saiga.override.wpn_upg_ak_s_skfoldable = { }
	end
		
	if DMCWO.rpk_stock_switch == true then
		self.wpn_fps_lmg_rpk.override.wpn_upg_ak_s_folding = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
	else
		self.wpn_fps_lmg_rpk.override.wpn_upg_ak_s_folding = {}
	end
	
	
	--Glock overrides
	self.wpn_fps_pis_g22c.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"},
		wpn_fps_pis_g18c_m_mag_33rnd = {stats = { value = 6, spread_moving = -3, extra_ammo = 7, concealment = -2}}
	}
	
	self.wpn_fps_pis_g26.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"},
		wpn_fps_pis_g18c_m_mag_33rnd = {stats = { value = 6, spread_moving = -3, extra_ammo = 23, concealment = -2, recoil = 0}}
	}
	
	self.wpn_fps_jowi.override.wpn_fps_pis_g26_b_standard = {
		animations = {
			reload = "reload_right",
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil"}
	}
	self.wpn_fps_jowi.override.wpn_fps_pis_g26_b_custom = {
		animations = {
			reload = "reload_right",
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil"}
	}
	self.wpn_fps_jowi.override.wpn_fps_pis_g18c_m_mag_33rnd = { stats = { value = 6, spread_moving = -3, extra_ammo = 46, concealment = -2, recoil = 0 } }
	self.wpn_fps_pis_x_g22c.override.wpn_fps_pis_g18c_m_mag_17rnd = { stats = {} }
	self.wpn_fps_pis_x_g22c.override.wpn_fps_pis_g18c_m_mag_33rnd = { stats = { value = 3, spread_moving = -2, concealment = -2, extra_ammo = 14 } }
	
	self.wpn_fps_pis_x_usp.override.wpn_fps_pis_usp_m_extended = { stats = { value = 3, spread_moving = -2, concealment = -2, extra_ammo = 16 } }
	
	self.parts.wpn_fps_upg_o_specter.override = { 
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
	self.parts.wpn_fps_upg_o_eotech.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_acog.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_aimpoint.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_aimpoint_2.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_eotech_xps.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_cs.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_rx01.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_docter.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_t1micro.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_cmore.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_rx30.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_reflex.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_leupold.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.wpn_fps_upg_o_leupold.override = self.parts.wpn_fps_upg_o_specter.override
	self.parts.shortdot_normal.override = self.parts.wpn_fps_upg_o_specter.override
	
	self.parts.wpn_fps_m4_upper_reciever_edge.forbids = { "wpn_fps_m4_upper_reciever_round" }
	self.parts.wpn_fps_m4_upper_reciever_edge.adds = { "wpn_fps_m4_uupg_draghandle" }
	self.parts.wpn_fps_m4_upper_reciever_edge.override = { 
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
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.forbids = { "wpn_fps_m4_upper_reciever_round" }
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.adds = { "wpn_fps_m4_uupg_draghandle_core" }
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override = { 
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
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.forbids = { "wpn_fps_m4_upper_reciever_round" }
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.adds = { "wpn_fps_m4_uupg_draghandle" }
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override = { 
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
	

	self.wpn_fps_ass_scar.override.wpn_fps_upg_m4_g_hgrip_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard",
		third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard",
	}
		
	self.wpn_fps_lmg_hk21.override.wpn_fps_upg_i_autofire = { 
		desc_id = "bm_wp_upg_i_autofire_hk21",
		stats = { recoil = 15, spread = 0},
		custom_stats = {rof_mult = 0.5625, hipfire_mod = 0.75}
	}
	self.wpn_fps_lmg_hk21.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = -2, damage = 0} }
	
	self.wpn_fps_ass_m14.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = -2, damage = 0} }
	
	self.wpn_fps_ass_fal.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = -2, damage = 0} }
	
	self.wpn_fps_ass_g3.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = -2, damage = 0} }
	
	self.wpn_fps_ass_galil.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = -2, damage = 0} }
	
	self.wpn_fps_ass_scar.override.wpn_fps_snp_msr_ns_suppressor = { stats = { value = 5, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = -2, damage = 0} }
		
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_mbus_rear = { a_obj = "a_o_r", stats = { value = 3, concealment = 0 }}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_o_f" }
	
	self.wpn_fps_ass_aug.override.wpn_fps_upg_o_mbus_rear = { a_obj = "a_or", stats = { value = 3, concealment = 0 }}
	self.wpn_fps_ass_aug.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_of", }
	
	self.wpn_fps_smg_p90.override.wpn_fps_upg_o_mbus_rear = { a_obj = "a_or", stats = { value = 3, concealment = 0 }}
	self.wpn_fps_smg_p90.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_of", }
	
	
	
	--}
	
		
end

local old_bonus = WeaponFactoryTweakData.create_bonuses
function WeaponFactoryTweakData:create_bonuses(...)
	old_bonus(self, ...)
	self.parts.wpn_fps_upg_bonus_concealment_p1.stats = {value = 3, concealment = 1, recoil = -1, spread = -0}
	
	self.parts.wpn_fps_upg_bonus_concealment_p2.stats = {value = 4, concealment = 2, recoil = -2, spread = -1}
	self.parts.wpn_fps_upg_bonus_concealment_p3.stats = {value = 5, concealment = 3, recoil = -3, spread = -2}
	
	self.parts.wpn_fps_upg_bonus_spread_p1.stats = {value = 2, spread = 1, recoil = 0}
	self.parts.wpn_fps_upg_bonus_spread_n1.stats = {value = 2, spread = -1, recoil = 0}
	
	self.parts.wpn_fps_upg_bonus_recoil_p1.stats = {value = 2, recoil = 1}
	
	self.parts.wpn_fps_upg_bonus_damage_p1.stats = {value = 3, recoil = -1}
	self.parts.wpn_fps_upg_bonus_damage_p1.custom_stats = { damage_far_mul = 1.05, damage_near_mul = 1.05 }
	self.parts.wpn_fps_upg_bonus_damage_p1.desc_id = "bm_menu_bonus_damage_1"
	
	self.parts.wpn_fps_upg_bonus_damage_p2.stats = {value = 4, recoil = -2}
	self.parts.wpn_fps_upg_bonus_damage_p2.custom_stats = { damage_far_mul = 1.1, damage_near_mul = 1.1 }
	self.parts.wpn_fps_upg_bonus_damage_p2.desc_id = "bm_menu_bonus_damage_2"
	
	self.parts.wpn_fps_upg_bonus_total_ammo_p1.stats = {value = 3, total_ammo_mod = 10}
	self.parts.wpn_fps_upg_bonus_total_ammo_p1.desc_id = "bm_menu_bonus_total_ammo_1"
	self.parts.wpn_fps_upg_bonus_total_ammo_p3.stats = {value = 5, total_ammo_mod = 30}
	self.parts.wpn_fps_upg_bonus_total_ammo_p3.desc_id = "bm_menu_bonus_total_ammo_3"
	
	
	self.wpn_fps_fla_mk2.override.wpn_fps_upg_bonus_concealment_p1 = {
		stats = {value = 3, concealment = 1},
		custom_stats = { movement_speed = 0.95 },
		desc_id = "bm_menu_bonus_concealment_fire"
	}
	self.wpn_fps_fla_mk2.override.wpn_fps_upg_bonus_damage_p1 = {
		stats = {value = 3, damage = 1},
		desc_id = "bm_menu_bonus_damage_1_fire"
	}
end
