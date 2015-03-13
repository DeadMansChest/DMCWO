--[[
v1.2.3
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

--[[
Real Weapon Names
-code base thanks to hejoro
-imfdb (Most Weapons)
-Payday Wikia (Leupold/Theia Scope)
-/k/anon and Steam friends (Other unidentified attachments and weapons I haven't found or were not ID'd by the two above sources)
	-Comrade Sniper for the MOE SL Handguard
]]

LocalizationManager_text = LocalizationManager_text or LocalizationManager.text
function LocalizationManager:text( string_id, macros )
    local realnames = {}
	
	--[[BRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRT]]
	realnames["bm_w_m134"] = "General Electric M134"
	realnames["bm_w_m134_desc"] = ""
	realnames["bm_wp_m134_body_upper_light_desc"] = "Decreases movement penalty by 20%"
	realnames["bm_wp_m134_barrel_extreme"] = "Anti-Air Barrel"
	realnames["bm_wp_m134_barrel_extreme_desc"] = "Increases range by 15% \nDecreases ADS speed by 10% \nIncreases movement penalty by 20%"
	realnames["bm_wp_m134_barrel_short"] = "Compact Barrel"
	realnames["bm_wp_m134_barrel_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5% \nDecreases movement penalty by 20%"
	
	--[[WE TERRORIST NAO]]
	realnames["bm_w_rpg7"] = "Bazalt RPG-7"
	
	
	--[[GOLD SLAVSHIT]]
	realnames["bm_w_akm_gold"] = "Gold Plated AKMS"
	
	--[[JAM733]]
	realnames["bm_w_amcar"] = "Colt M733 Commando"
	
	--[[STEEL BALLS]]
	realnames["bm_w_ak74"] = "Concern Kalashnikov AKS-74"
	
	--[[JAM-4]]
	realnames["bm_w_m4"] = "Colt M4A1" --"Safety Pins"
	--Barrels
	realnames["bm_wp_m4_uupg_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	realnames["bm_wp_m4_uupg_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%" 
	--Suppressed Barrel
	realnames["bm_wp_m4_uupg_b_sd"] = "Suppressed Barrel" 
	realnames["bm_wp_m4_uupg_b_sd_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%" 
	--Aftermarket
	realnames["bm_wp_m4_uupg_fg_lr300"] = "LR300 Handguard"
	realnames["bm_wp_m4_uupg_fg_lr300_desc"] = "Increases ADS speed by 7.5%"
	--Competition
	realnames["bm_wp_upg_fg_jp"] = "JPE Modular Handguard"
	realnames["bm_wp_upg_fg_jp_desc"] = "Increases ADS speed by 5%"
	--Gazelle
	realnames["bm_wp_upg_fg_smr"] = "Geissele Super Modular Rail"
	
	--[[AUGLY]]
	realnames["bm_w_aug"] = "Steyr AUG A2"
	--A3 Tact. Foregrip
	realnames["bm_wp_aug_fg_a3"] = "A3 Rail"
	realnames["bm_wp_aug_fg_a3_desc"] = "Decreases ADS speed by 5%"
	
	--[[WHITE FLAG]]
	realnames["bm_w_famas"] = "Nexter FAMAS" --"IS THAT A DEAGLE?"
	
	realnames["bm_wp_famas_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	realnames["bm_wp_famas_b_sniper_desc"] = "Increases range by 30% \nDecreases ADS speed by 10%"
	realnames["bm_wp_famas_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	realnames["bm_wp_famas_b_suppressed_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	
	--Retro Grip
	realnames["bm_wp_famas_g_retro"] = "G2 Guard"
	realnames["bm_wp_famas_g_retro_desc"] = "Increases ROF to 1200 RPM"
	
	--[[JAM]]
	realnames["bm_w_l85a2"] = "BAE L85A2" --"Eru"
	realnames["bm_wp_l85a2_b_long"] = "Long Barrel"
	realnames["bm_wp_l85a2_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_l85a2_b_short"] = "Short Barrel"
	realnames["bm_wp_l85a2_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	
	realnames["bm_wp_l85a2_g_worn"] = "Taped Pistol Grip"
	realnames["bm_wp_l85a2_fg_short"] = "Daniel Defence L85 Quad Rail"
	realnames["bm_wp_l85a2_fg_short_desc"] = "Increases ADS speed by 5%"
	
	--[[CROATGAT]]
	realnames["bm_w_vhs"] = "HS Produkt VHS-2"
	realnames["bm_wp_vhs_b_short"] = "Short Barrel"
	realnames["bm_wp_vhs_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	
	realnames["bm_wp_vhs_b_sniper"] = "Sniper Barrel"
	realnames["bm_wp_vhs_b_sniper_desc"] = "Increases range by 30% \nDecreases ADS speed by 10%"
	
	realnames["bm_wp_vhs_b_silenced"] = "Suppressed Barrel"
	realnames["bm_wp_vhs_b_silenced_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	
	--[[SLAVSHIT]]
	realnames["bm_w_akm"] = "Concern Kalashnikov AKMS"
	
	--[[MELTGUN]]
	realnames["bm_w_g36"] = "Heckler & Koch G36C"
	--Compact
	realnames["bm_wp_g36_fg_c"] = "Carbine Handguard"
	realnames["bm_wp_g36_fg_c_desc"] = "Decreases range by 10% \nIncreses ADS speed by 5%"
	--Polizei
	realnames["bm_wp_g36_fg_ksk"] = "Knights Armament Co. RAS Handguard"  
	--Solid Stock
	realnames["bm_wp_g36_s_kv"] = "G36KV Stock"
	--Sniper Stock
	realnames["bm_wp_g36_s_sl8"] = "SL8 Stock"
	
	--[[PUNS]]
	realnames["bm_w_m14"] = "Springfield M14 DMR"
	--Abraham
	realnames["bm_wp_m14_body_ebr"] = "MK.14 Kit"
	realnames["bm_wp_m14_body_ebr_desc"] = "Increases ADS speed by 5% \nIncreases ROF to 750 RPM"
	--Seid ihr das Essen? Nein, wir sind der Jaeger! (watch better anime)
	realnames["bm_wp_m14_body_jae"] = "M14 JAE Kit"
	
	--[[SWED]]
	realnames["bm_w_ak5"] = "Bofors AK5" --"FNC's sexy swedish cousin"
	--Karbin Ceres
	realnames["bm_wp_ak5_fg_ak5c"] = "AK5c Handguard"
	realnames["bm_wp_ak5_fg_ak5c_desc"] = "Decreases ROF to 650 RPM"
	--Belgian Heat
	realnames["bm_wp_ak5_fg_fnc"] = "FN FNC Handguard"
	realnames["bm_wp_ak5_fg_fnc_desc"] = "Increases ROF to 700 RPM"
	--Bertil
	realnames["bm_wp_ak5_s_ak5b"] = "AK5b Stock"
	--Caesar
	realnames["bm_wp_ak5_s_ak5c"] = "AK5c Stock"
	
	--[[JAM16]]
	realnames["bm_w_m16"] = "Colt M16A3" --"Orange Slices", "IS THAT A FAMAS?"
	realnames["bm_w_m16a4"] = "Colt M16A4"
	--going against imfdb here, simply for the fact the the flat top receiver isn't limited to the A4 and that the AMR bares more resemblence to the A3 (default handguard, automatic fire)
	--Railed
	realnames["bm_wp_m16_fg_railed"] = "Daniel Defense Lite Rail" --not a carbon copy, just based off of, if only for the delta ring
	--Blast to the Past
	realnames["bm_wp_m16_fg_vietnam"] = "M16A1 Handguard"
	
	--[[553 NO PANTSU]]
	realnames["bm_w_s552"] = "SIG SG 552" --"SG550's Little Sister"
	--Enhanced Foregrip
	realnames["bm_wp_ass_s552_fg_standard_green"] = "OD Green Handguard"
	--Enhanced Grip
	realnames["bm_wp_ass_s552_g_standard_green"] = "OD Green Pistol Grip"
	--Enhanced Stock
	realnames["bm_wp_ass_s552_s_standard_green"] = "OD Green Stock"	
	--Enhanced Foregrip
	realnames["bm_wp_ass_s552_fg_black"] = "Black Handguard"
	--Enhanced Grip
	realnames["bm_wp_ass_s552_g_black"] = "Black Pistol Grip"
	--Enhanced Stock
	realnames["bm_wp_ass_s552_s_black"] = "Black Stock"
	--Railed Foregrip
	realnames["bm_wp_ass_s552_fg_railed"] = "Railed Handguard" --pretty sure Sig manufactures their own rails for the 552/3. Can't be bothered to look :/
	--Heat Treated
	realnames["bm_wp_ass_s552_body_standard_black"] = "Black Receiver" --GJ, Overkill. Heat treating metal, while it does make it harder, also makes it more brittle. Pretty sure you don't want that in a gun
	
	--[[EAG-H]]
	realnames["bm_w_scar"] = "FN MK.17"
	--Sniper Stock
	realnames["bm_wp_scar_s_sniper"] = "MK.20 Stock"	
	
	realnames["bm_wp_scar_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_scar_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	--Rail Extension
	realnames["bm_wp_scar_fg_railext"] = "PWS SCAR Rail Extension"
	realnames["bm_wp_scar_fg_railext_desc"] = "Decreases ADS speed by 5%"
	
	--[[RIGHT ARM]]
	realnames["bm_w_fal"] = "FN FAL"
	--CQB
	realnames["bm_wp_fal_body_standard"] = "DSA SA58 Handguard w/ Short Barrel" --this might conflict with something since this is also the name_id of the receiver
	realnames["bm_wp_fal_body_standard_desc"] = "Decreases range by 10% \nIncreases ADS speed by 15%" --this might conflict with something since this is also the name_id of the receiver
	--Retro
    realnames["bm_wp_fal_fg_03"] = "IMI Romat Handguard"
    realnames["bm_wp_fal_fg_03_desc"] = "Decreases ADS speed by 5%"
	--Marksman
    realnames["bm_wp_fal_fg_04"] = "DSA Freefloat Handguard"
    realnames["bm_wp_fal_fg_04_desc"] = "Increases ADS speed by 5%"
	--Wood
    realnames["bm_wp_fal_fg_wood"] = "Wooden Handguard"
    realnames["bm_wp_fal_fg_wood_desc"] = "Decreases ADS speed by 7.5%"
	--Tactical Grip
	realnames["bm_wp_fal_g_01"] = "Tapco FAL/SAW Pistol Grip"
	--Extended Mag
    realnames["bm_wp_fal_m_01"] = "FAL 30rnd Magazine"
    realnames["bm_wp_fal_m_01_desc"] = "Decreases reload speed by 10%"
	--Folding
    realnames["bm_wp_fal_s_01"] = "Sidefolding Stock"
	--Marksman
    realnames["bm_wp_fal_s_03"] = "Magpul FAL PRS Stock"
	
	--[[BOTTLE OPENER]]
	realnames["bm_w_galil"] = "IMI Galil ARM"
	--Sniper
	realnames["bm_wp_galil_fg_sniper"] = "IMI Galatz Handguard & Sniper Barrel"
	realnames["bm_wp_galil_fg_sniper_desc"] = "Increases range by 15% \nDecreases ADS speed by 10% \nDecreases ROF to 630 RPM"
	--Light
	realnames["bm_wp_galil_fg_sar"] = "IMI Galil SAR Handguard & 13\" Barrel"
	realnames["bm_wp_galil_fg_sar_desc"] = "Increases ADS speed by 5%"
	--CQB
	realnames["bm_wp_galil_fg_mar"] = "IMI Galil MAR Handguard & 7\" Barrel"
	realnames["bm_wp_galil_fg_mar_desc"] = "Decreases range by 10% \nIncreases ADS speed by 15% \nIncreases ROF to 750 RPM"
	--FAB
	realnames["bm_wp_galil_fg_fab"] = "FAB Defence Galil Handguard"
	--Sniper Grip
	realnames["bm_wp_galil_g_sniper"] = "IMI Galatz Pistol Grip"
	--Sniper Stock
	realnames["bm_wp_galil_s_sniper"] = "IMI Galatz Wooden Stock"
	--Skeletal Stock
	realnames["bm_wp_galil_s_skeletal"] = "IMI Galil MAR Stock"
	--Light Stock
	realnames["bm_wp_galil_s_light"] = "IMI Galatz Skeleton Stock"
	--FAB Stock
	realnames["bm_wp_galil_s_fab"] = "FAB Defence MG-CP Cheek Pad"
	
	--[[MAI RAIFU (SHE'S MINE I TELL YOU)]]
	realnames["bm_w_g3"] = "Heckler & Koch G3"
	--Assault Kit
	realnames["bm_wp_g3_b_short"] = "Short Barrel"
	realnames["bm_wp_g3_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	--DMR Kit
	realnames["bm_wp_g3_b_sniper"] = "PSG-1 Barrel"
	realnames["bm_wp_g3_b_sniper_desc"] = "Increases range by 30%\nDecreases ADS speed by 10%"
	--PSG Foregrip
	realnames["bm_wp_g3_fg_psg"] = "PSG-1 Handguard"
	realnames["bm_wp_g3_fg_psg_desc"] = "Decreases ADS speed by 5%"
	--Railed Foregrip
	realnames["bm_wp_g3_fg_railed"] = "FAB Defence G3-RS Handguard"
	--Retro Foregrip
	realnames["bm_wp_g3_fg_retro"] = "Wooden Slimline Handguard"
	realnames["bm_wp_g3_fg_retro_desc"] = "Decreases ADS speed by 7.5%"
	--Plastic Retro Foregrip
	realnames["bm_wp_g3_fg_retro_plastic"] = "Slimline Handguard"
	realnames["bm_wp_g3_fg_retro_plastic_desc"] = "Increases ADS speed by 5%"
	--Retro Grip
	realnames["bm_wp_g3_g_retro"] = "G3 Ergo Grip"
	realnames["bm_wp_g3_g_retro_desc"] = "Increases ADS speed by 5%"
	--Sniper Grip
	realnames["bm_wp_g3_g_sniper"] = "PSG-1 Pistol Grip"
	--Sniper Stock
	realnames["bm_wp_g3_s_sniper"] = "PSG-1 Stock"

	
	--[[Rattlesnake]]
	realnames["bm_w_msr"] = "Remington MSR"
	--Suppressor
	realnames["bm_wp_snp_msr_ns_suppressor"] = "AAC TiTAN-QD Suppressor"
	realnames["bm_wp_snp_msr_ns_suppressor_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 10%"
	realnames["bm_wp_snp_msr_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 10%"
	--Aluminum Body
	realnames["bm_wp_msr_body_msr"] = "MSR Aluminum Stock & Receiver"
	realnames["bm_wp_msr_body_msr_desc"] = "Increases ADS speed by 5%"
	
	--[[R93]]
	realnames["bm_w_r93"] =  "Blaser R93 Tactical 2"
	
	realnames["bm_wp_r93_b_short_desc"] =  "Decreases range by 10% \nIncreases ADS speed by 5%"
	realnames["bm_wp_r93_b_suppressed_desc"] =  "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 10%"
	--Wooden Body
	realnames["bm_wp_r93_body_wood"] = "Long Range Sporter 2 Stock"
	realnames["bm_wp_r93_body_wood_desc"] = "Decreases ADS speed by 5%"
	
	--[[FIDDY CAL]]
	realnames["bm_w_m95"] = "Barrett M95"
	--Tank Buster
	realnames["bm_wp_m95_b_barrel_long"] = "Long Barrel w/ AW50F Muzzle Brake"
	realnames["bm_wp_m95_b_barrel_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 10%"
	realnames["bm_wp_m95_b_barrel_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	realnames["bm_wp_m95_b_barrel_suppressed"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	
	--[[MOIST NUGGET]]
	realnames["bm_w_mosin"] = "Mosin Nagant M91/30"
	
	realnames["bm_wp_mosin_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	realnames["bm_wp_mosin_b_standard_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_mosin_b_sniper"] = "Mosin Suppressor"
	realnames["bm_wp_mosin_b_sniper_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	--Black Stock
	realnames["bm_wp_mosin_body_conceal"] = "Black Paint"
	
	
	--[[ELMER FUDD]]
	realnames["bm_wp_huntsman_b_short"] = "Sawn-Off Short Barrel"
	realnames["bm_wp_huntsman_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	realnames["bm_wp_huntsman_s_short"] = "Sawn-Off Stock"
	
	--[[870]]
	realnames["bm_w_r870"] = "Remington Model 870" --"Remafdng"
	--Extended Mag
	realnames["bm_wp_r870_m_extended"] = "R870 Extended Tube Magazine (+2 Rounds)"
	--Zombie Hunter
    realnames["bm_wp_r870_fg_wood"] = "Wooden Pump"
    realnames["bm_wp_r870_fg_wood_desc"] = "Decreases ADS speed by 5%"
	--Short Enough **don't know
	realnames["bm_wp_r870_s_nostock"] = "No Stock"
	--Short Enough Tact. **don't know
	realnames["bm_wp_r870_s_nostock_big"] = "No Stock w/ Full Length Rail"
	--Govt. Stock **don't know
	realnames["bm_wp_r870_s_solid_big"] = "Fixed Stock w/ Full Length Rail"
	
	--[[CATS]]
	realnames["bm_w_saiga"] = "Concern Kalashnikov Saiga-12K"
	--Tact. Russian
	realnames["bm_wp_saiga_fg_lowerrail"] = "Ultimak AK Modular Rail Forend System"
	realnames["bm_wp_saiga_fg_lowerrail_desc"] = "Decreases ADS speed by 5%"
	--Saiga 20 rounder
	realnames["bm_wp_saiga_m_20rnd"] = "Saiga MD Arms 20rnd Drum Magazine"
	realnames["bm_wp_saiga_m_20rnd_desc"] = "Decreases reload speed by 15%"
	
	--[[M1014]]
	realnames["bm_w_benelli"] = "Benelli M4"
	--Long Barrel
	realnames["bm_wp_ben_b_long"] = "Long Barrel w/ 7-Shot Tube"
	realnames["bm_wp_ben_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	--Short Barrel
	realnames["bm_wp_ben_b_short"] = "NFA Short Barrel w/ 4-Shot Tube"
	realnames["bm_wp_ben_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	--Collapsed Stock
	realnames["bm_wp_ben_s_collapsed"] = "M1014 Collapsed Stock"
	--Solid Stock
	realnames["bm_wp_ben_fg_standard"] = "M1014 Civilian Stock" --same deal with the FAL, possible conflict
	
	--[[KELTEC]]
	realnames["bm_w_ksg"] = "Kel-Tec KSG"
	--Long Barrel
	realnames["bm_wp_ksg_b_long"] = "Long Barrel w/ 2x 8-Shot Tubes"
	realnames["bm_wp_ksg_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	--Short Barrel
	realnames["bm_wp_ksg_b_short"] = "Patrol Barrel w/ 2x 6-Shot Tubes"
	realnames["bm_wp_ksg_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	--[[WHY DON'T YOU TAKE A SEAT OVER THERE?]]
	realnames["bm_w_spas12"] = "Franchi SPAS-12"
	realnames["bm_wp_spas12_b_long"] = "SPAS-12 8-Shot Tube Magazine"
	realnames["bm_wp_spas12_b_long_desc"] = "Decreases ADS speed by 5%"
	
	--[[STREET SWEEPER]]
	realnames["bm_w_striker"] = "Cobray Street Sweeper" --Hard to name this really, it has the drum key of the Cobray SS, the ejection system of the Protecta (although the Cobray SS can also have this) and the drum advance lever of the original Striker
	realnames["bm_wp_striker_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	realnames["bm_wp_striker_b_suppressed_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%" 
	
	--[[BABBY 870]]
	realnames["bm_w_serbu"] = "Short Barrelled Remington Model 870"
	--Extended Mag
	realnames["bm_wp_shorty_m_extended_short"] = "R870 Extended Tube Magazine (+1 Round)"
	--Standard
	realnames["bm_wp_r870_s_solid"] = "Fixed Stock"
	--Police Shorty
	realnames["bm_wp_serbu_s_solid_short"] = "Fixed Stock w/ Rail"
	--Tactical Shorty
	realnames["bm_wp_serbu_s_nostock_short"] = "No Stock w/ Rail"
	
	--[[LONGCAT]]
	realnames["bm_w_rpk"] = "Concern Kalashnikov RPK"
	--Tactical Forgrip
	realnames["bm_wp_rpk_fg_standard"] = "Polymer Handguard"
	realnames["bm_wp_rpk_fg_standard_desc"] = "Increases ADS speed by 5%"
	--Plastic Stock
	realnames["bm_wp_rpk_s_standard"] = "Polymer Stock"
	
	--[[KSP]]
	realnames["bm_w_m249"] = "FN Paratrooper M249"
	--Railed Foregrip
	realnames["bm_wp_m249_fg_mk46"] = "MK.46 Handguard"
	realnames["bm_wp_m249_fg_mk46_desc"] = "Decreases ADS speed by 5%"
	--Solid Stock
	realnames["bm_wp_m249_s_solid"] = "M249 Solid Stock"
	
	--[[RELATED TO RAIFU]]
	realnames["bm_w_hk21"] = "Heckler & Koch HK21" --"Related to mai raifu"
	--Short Foregrip
	realnames["bm_wp_hk21_fg_short"] = "HK21 Short Handguard"
	realnames["bm_wp_hk21_fg_short_desc"] = "Increases ADS speed by 5%"
	realnames["bm_wp_hk21_g_ergo"] = "HK21 Ergo Grip"
	realnames["bm_wp_hk21_g_ergo_desc"] = "Increases ADS speed by 5%"
	
	--[[KERBEROS]]
	realnames["bm_w_mg42"] = "Mauser Maschinengewehr 42"
	--Light Barrel
	realnames["bm_wp_mg42_b_mg34"] = "Maschinengewehr 34 Barrel"
	realnames["bm_wp_mg42_b_mg34_desc"] = "Increases ADS speed by 5%\nDecreases ROF to 900 RPM"
	--Heat Sink (Star Wars)
	realnames["bm_wp_mg42_b_vg38"] = "DLT-19 Barrel"
	realnames["bm_wp_mg42_b_vg38_desc"] = "Internally suppressed barrel"
	
	--[[GORDON]]
	realnames["bm_w_usp"] = "Heckler & Koch USP Tactical"
	--Ventilated .45 **don't know
	--realnames["bm_wp_usp_co_comp_1"] = "Ventilated .45 Compensator" --I question the existence of this compensator
	--Velocity .45
	realnames["bm_wp_usp_co_comp_2"] = "SJC Compensator .45" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	realnames["bm_wp_pis_usp_m_extended"] = "USP 20rnd Magazine"
	realnames["bm_wp_pis_usp_m_extended_desc"] = "Decreases reload speed by 5%"
	--Expert
	realnames["bm_wp_pis_usp_b_expert"] = "USP Expert Slide"
	--Match
	realnames["bm_wp_pis_usp_b_match"] = "USP Match Slide"
	realnames["bm_wp_pis_usp_b_match_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[GRENADE 22]]
	realnames["bm_w_g22c"] = "Glock 22c"
	--Long Slide
	realnames["bm_wp_g22c_b_long"] = "Glock 35 Compensated Slide"
	realnames["bm_wp_g22c_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[GRENADE 17]]
	realnames["bm_w_glock_17"] = "Glock 17"
	
	--[[GRENADE 26]]
	realnames["bm_wp_pis_g26"] =  "Glock 26"
	realnames["bm_w_jowi"] =  "Akimbo Glock 26s"
	realnames["bm_wp_g26_body_salient"] =  "Stipled Tan Frame"
	realnames["bm_wp_g26_b_custom"] =  "Brushed Metal Frame"
	realnames["bm_wp_g26_m_custom"] =  "G26 Stipled Tan Magazine"
	realnames["bm_wp_g26_m_custom_desc"] =  "Increases reload speed by 15%"
	
	--[[FAWHTY FAHVE]]
	realnames["bm_w_colt_1911"] = "Springfield Operator 1911" 
	realnames["bm_w_x_1911"] = "Akimbo Springfield Operator 1911s" 
	--Aggressor
	realnames["bm_wp_1911_co_2"] = "TCII Compensator" --Not 100% but seems to be based off of it
	--Punisher
	realnames["bm_wp_1911_co_1"] = "Clark Heavy Pinmaster" --Not 100% but seems to be based off of it
	--Ergo Grip
	realnames["bm_wp_1911_g_ergo_desc"] = "Increases ADS speed by 5%" 
	--Long
	realnames["bm_wp_1911_b_long"] = "Compensated Long Barrel & Slide" 
	realnames["bm_wp_1911_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	--Vented
	realnames["bm_wp_1911_b_vented"] = "Compensated Two-Tone Slide"
	realnames["bm_wp_1911_m_extended"] = "1911 12rnd Magazine"
	realnames["bm_wp_1911_m_extended_desc"] = "Decreases reload speed by 5%"
	
	--[[BARDODA]]
	realnames["bm_w_b92fs"] = "Beretta 92FS"
	realnames["bm_w_x_b92fs"] = "Akimbo Beretta 92FSs"
	--Professional
	realnames["bm_wp_beretta_co_co1"] = "SGS Compensator" --Original name was a reference to the movie "The Professional"
	--Competitor
	realnames["bm_wp_beretta_co_co2"] = "Competition Compensator" --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models were based off of airsoft counterparts
	--Extended Mag
	realnames["bm_wp_beretta_m_extended"] = "92FS 30rnd Magazine"
	realnames["bm_wp_beretta_m_extended_desc"] = "Decreases reload speed by 5%"
	--Elite Slide
	realnames["bm_wp_beretta_sl_brigadier"] = "Brigadier Elite Slide"
	
	--[[HUEHUEHUEHUE]]
	realnames["bm_w_raging_bull"] = "Taurus Raging Bull"
	--Mount
	realnames["bm_wp_pis_rage_extra"] = "Raging Bull Scope Mount"
	--Aggressor
	realnames["bm_wp_rage_b_comp1"] = "S&W V-Compensator"
	--Pocket
	realnames["bm_wp_rage_b_short"] = "Snub Nose Short Barrel"
	realnames["bm_wp_rage_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%" 
	--Ventilated
	realnames["bm_wp_rage_b_comp2"] = "S&W Muzzle Compensator"
	realnames["bm_wp_rage_b_comp2_desc"] = "Vents muzzle flash to the sides"
	--Overcompensating
	realnames["bm_wp_rage_b_long"] = "Long Barrel"
	realnames["bm_wp_rage_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[HUEHUEHUEHUE BUT IT'S A SHOTGUN]]
	realnames["bm_w_judge"] = "Taurus Judge"
	
	--[[GRENADE 18]]
	realnames["bm_w_glock_18c"] =  "Glock 18c"
	--Ventilated **don't know
	--realnames["bm_wp_g18c_co_1"] = "Ventilated Compensator" --I question the existence of this compensator
	--Velocity
	realnames["bm_wp_g18c_co_comp_2"] = "SJC Compensator 9mm"
	
	--[[DEAGLE]]
	realnames["bm_w_deagle"] = "IMI Desert Eagle Mark XIX" --"IS THAT A M16?"
	realnames["bm_w_x_deagle"] = "Akimbo IMI Desert Eagles"
	--Mount
	realnames["bm_wp_pis_deagle_extra"] = "Desert Eagle Scope Mount"
	--La Femme
	realnames["bm_wp_deagle_co_short"] = "Desert Eagle Muzzle Brake" --Original name was a reference to a 1990s film only for the gun's appearance in it, otherwise this is based on a real attachment
	--Overkill
	realnames["bm_wp_deagle_co_long"] = "Custom Barrel Weight" --Attachment is a reference to the Boondock Saints
	realnames["bm_wp_deagle_co_long_desc"] = "Decreases ADS speed by 5%" 
	--Extended Mag
	realnames["bm_wp_deagle_m_extended"] = "Deagle 10rnd Magazine" --Given the length of the mag and considering the .50 AE variant is single stack only, this is the only choice. Not that it matters that there's more ammo than what's stated *cough* 1911 12rnd Mag *cough*
	--Long Barrel
	realnames["bm_wp_deagle_b_long"] = "10\" Long Barrel"
	realnames["bm_wp_deagle_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	
	--[[JAMES BOND]]
	realnames["bm_w_ppk"] = "Walther PPK"
	--Laser Grip
	realnames["bm_wp_pis_ppk_g_laser"] = "Crimson Trace Laser Grip"
	--Long Side
	realnames["bm_wp_pis_ppk_b_long"] = "PPKS Slide"
	
	--[[40 SW IS A SHIT ROUND]]
	realnames["bm_w_p226"] = "Sig Sauer P226R"
	--Ventilated .40 **don't know
	--realnames["bm_wp_p226_co_comp_1"] = "Ventilated .40 Compensator" --I question the existence of this compensator
	--Velocity .40
	realnames["bm_wp_p226_co_comp_2"] = "SJC Compensator .40" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	realnames["bm_wp_p226_m_extended"] = "P226 22rnd Magazine" --Not too sure if this exists, just basing it off of the fact the "22" is plastered all over the damn thing
	realnames["bm_wp_p226_m_extended_desc"] = "Decreases reload speed by 5%"
	--Two-Tone
	realnames["bm_wp_p226_b_equinox"] = "Equinox Duo-Tone Slide"
	--Long Slide
	realnames["bm_wp_p226_b_long"] = "Brushed Metal Long Slide"
	realnames["bm_wp_p226_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[LEO]]
	realnames["bm_w_hs2000"] = "Springfield Armory XD(M)-40" --Fuck the texture labels, it's a XD(M)
	--Extended Mag
	realnames["bm_wp_hs2000_m_extended"] = "XD(M)-40 22rnd Magazine"
	realnames["bm_wp_hs2000_m_extended_desc"] = "Decreases reload speed by 5%"
	--Custom Slide
	realnames["bm_wp_hs2000_sl_custom"] = "Compensated Slide"
	realnames["bm_wp_hs2000_sl_custom_desc"] = "Increases ADS speed by 5%" 
	--Long Slide
	realnames["bm_wp_hs2000_sl_long"] = "Custom Slide"
	
	--[[RED 9]]
	realnames["bm_w_c96"] = "Mauser C96"
	--Long Barrel
	realnames["bm_wp_c96_b_long"] = "Carbine Barrel"
	realnames["bm_wp_c96_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	--Han Solo
	realnames["bm_wp_c96_nozzle"] = "DL-44 Muzzle"
	--Scope
	realnames["bm_wp_c96_sight"] = "Schmidt & Bender 1-8x24 PM Short Dot"
	realnames["bm_wp_c96_sight_desc"] = "High power scope \nDecreases ADS speed by 7.5%"
	--20rnd Mag
	realnames["bm_wp_c96_m_extended"] = "C96 20rnd Magazine"

	--[[EVENFASTERRUNONSENTENCES]]
	realnames["bm_w_cobray"] = "Cobray M11/9"
	realnames["bm_wp_cobray_ns_barrelext"] = "MAC Barrel Extension"
	realnames["bm_wp_cobray_ns_barrelext_desc"] = "Decreases ADS speed by 10%"
	realnames["bm_wp_cobray_ns_silencer"] = "SIONICS Suppressor"	
	realnames["bm_wp_cobray_ns_silencer_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 10%"	
	realnames["bm_wp_cobray_body_upper_jacket_desc"] = "Decreases ROF to 850 RPM"	
	
	--[[RUNONSENTENCES]]
	realnames["bm_w_mac10"] = "Ingram M10"
	--Extended Mag
	realnames["bm_wp_mac10_m_extended"] = "M10 30rnd Magazine"
	realnames["bm_wp_mac10_m_extended_desc"] = "Decreases reload speed by 5%"
	--Railed Handguard
	realnames["bm_wp_mac10_body_ris"] = "MAC Rail System" --I'm getting nothing but airsoft results so generic name
	realnames["bm_wp_mac10_body_ris_desc"] = "Decreases ADS speed by 5%"
	--Skeletal Stock
	realnames["bm_wp_mac10_s_skel"] = "Low Mount Skeleton Stock"	
	
	--[[THOMPSON SENSEI]]
	realnames["bm_w_m1928"] = "Auto-Ordnance M1928"
	--Short Barrel
	realnames["bm_wp_m1928_b_short"] = "Short Barrel"	
	realnames["bm_wp_m1928_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	
	realnames["bm_wp_m1928_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	--Dis. Foregrip
	realnames["bm_wp_m1928_fg_discrete"] = "Synthetic Foregrip"	--for once it's actually a foregrip
	realnames["bm_wp_m1928_fg_discrete_desc"] = "Increases ADS speed by 5%"	--for once it's actually a foregrip
	--Dis. Pistol Grip
	realnames["bm_wp_m1928_g_discrete"] = "Synthetic Pistol Grip"	
	realnames["bm_wp_m1928_g_discrete_desc"] = "Increases ADS speed by 5%"	
	--Dis. Stock
	realnames["bm_wp_m1928_s_discrete"] = "Synthetic Stock"
	
	
	--[[MAI RAIFU'S LITTLE SISTER AND STUDENT COUNCIL PRESIDENT OF THE ELEMETARY SCHOOL]]
	realnames["bm_w_mp5"] = "Heckler & Koch MP5A4" --"Empi"
	--Sehr Kurze
	realnames["bm_wp_mp5_fg_m5k"] = "MP5k Railed Handguard"
	realnames["bm_wp_mp5_fg_m5k_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5% \nIncreases ROF to 900 RPM"
	--Polizei Tactical
	realnames["bm_wp_mp5_fg_mp5a5"] = "MP5 Railed Handguard"
	--Ninja
	realnames["bm_wp_mp5_fg_mp5sd"] = "MP5SD Handguard"
	realnames["bm_wp_mp5_fg_mp5sd_desc"] = "Internally suppressed barrel \nDecreases ROF to 600 RPM"
	--Adjustable
	realnames["bm_wp_mp5_s_adjust"] = "Retractable Stock"
	--Bare Essentials
	realnames["bm_wp_mp5_s_ring"] = "No Stock" --"No Pantsu"
	--MP5 Drum
	realnames["bm_wp_mp5_m_drum"] = "GSG-5 110rnd .22lr Magazine"
	realnames["bm_wp_mp5_m_drum_desc"] = "Decreases reload speed by 15%"

	--[[SLING STOCKS ARE 2LEWD]]
	realnames["bm_w_mp9"] = "Brugger & Thomet TP9"
	--Extended Mag
	realnames["bm_wp_mp9_m_extended"] = "MP9 30rnd Magazine"
	realnames["bm_wp_mp9_m_extended_desc"] = "Decreases reload speed by 5%"
	--Skeletal Stock
	realnames["bm_wp_mp9_s_skel"] = "Steyr TMP Fixed Stock"
	
	--[[IT STINGS]]
	realnames["bm_w_scorpion"] = "CZ Skorpion vz. 61"
	
	realnames["bm_wp_scorpion_m_extended"] = "Skorpion Dual Magazines"
	realnames["bm_wp_scorpion_m_extended_desc"] = "Increases reload speed by 25%"
	
	realnames["bm_wp_scorpion_b_supperessed"] = "Skorpion Suppressor"
	realnames["bm_wp_scorpion_b_supperessed_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	--[[NOT THE STUDENT COUNCIL PRESIDENT (get FUCKED)]]
	realnames["bm_w_uzi"] = "IMI Uzi"
	
	realnames["bm_wp_uzi_s_solid"] = "Wooden Stock"
	
	realnames["bm_wp_uzi_fg_rail"] = "FAB Defence Uzi Tri-Rail System"
	realnames["bm_wp_uzi_fg_rail_desc"] = "Increases ADS speed by 5%"
	
	realnames["bm_wp_uzi_b_supperessed"] = "IMI Two-Stage Suppressor" --It's IMI made but it was never imported. No idea what the model name is.
	realnames["bm_wp_uzi_b_supperessed_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	--[[S-COOL SHOOTINGS]]
	realnames["bm_w_tec9"] = "Intratec TEC-9"
	
	realnames["bm_wp_tec9_b_standard"] = "AB-10 Barrel"
	realnames["bm_wp_tec9_b_standard_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	
	realnames["bm_wp_tec9_ns_ext"] = "TEC-9 Barrel Extension"
	realnames["bm_wp_tec9_ns_ext_desc"] = "Decreases ADS speed by 5%"
	
	realnames["bm_wp_tec9_s_unfolded"] = "Interdynamic MP-9 Wire Stock"
	
	realnames["bm_wp_tec9_m_extended"] = "TEC-9 50rnd Magazine"
	realnames["bm_wp_tec9_m_extended_desc"] = "Decreases reload speed by 10%"
	
	--[[NOT A STEN]]
	realnames["bm_w_sterling"] = "Sterling L2A1"
	--Supp. Barrel
	realnames["bm_wp_sterling_b_suppressed"] = "L34A1 Barrel"
	realnames["bm_wp_sterling_b_suppressed_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	--Heat Sink Barrel
	realnames["bm_wp_sterling_b_e11"] = "E-11 Barrel"
	realnames["bm_wp_sterling_b_e11_desc"] = "Internally suppressed barrel"
	
	realnames["bm_wp_sterling_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_sterling_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	--10rnd Mag
	realnames["bm_wp_sterling_m_short"] = "L2A1 10rnd Magazine"
	--34rnd Mag
	realnames["bm_wp_sterling_m_long"] = "L2A1 34rnd Magazine"

	--[[BABBY AR]]
	realnames["bm_w_olympic"] = "Olympic Arms K23B Tactical"
	--Railed Handguard
	realnames["bm_wp_olympic_fg_railed"] = "Vector Optics SCRA RAS" --a super short version at that, shares the delta ring so I'm assuming this is what it's based off of
	--Shorter Than Short
	realnames["bm_wp_olympic_s_short"] = "Buffer Tube Stock" 
	realnames["wpn_fps_m4_uupg_b_medium_desc"] = "Increases range by 15%\n Decreases ADS speed by 5%" 
	
	--[[BABBY SLAVSHIT]]
	realnames["bm_w_akmsu"] = "Soviet Union AKMSU"
	--Moscow Special
	realnames["bm_wp_akmsu_fg_rail"] = "Samson K-Rail" --Seems to be loosely based off of the Samson K-Rail, it's the only thing that looked remotely like this
	realnames["bm_wp_akmsu_fg_rail_desc"] = "Decreases ADS speed by 5%"
	
	--[[OVERPRICED 22LR]]
	realnames["bm_w_p90"] = "FN P90 TR"
	--Long Barrel
	realnames["bm_wp_p90_b_long"] = "PS90 Barrel"
	realnames["bm_wp_p90_b_long_desc"] = "Increases range by 15%\n Decreases ADS speed by 5%" 
	
	--[[LOL SWEDS]]
	realnames["bm_w_m45"] = "Carl Gustaf Kpist M/45"
	--Extended Mag
	realnames["bm_wp_smg_m45_m_extended"] = "M/45 50rnd Magazine"
	realnames["bm_wp_smg_m45_m_extended_desc"] = "Decreases reload speed by 10%" 
	
	--[[YOU SUCK AND WE HATE YOU]]
	realnames["bm_w_mp7"] = "Heckler & Koch MP7A2"
	--Airsoft Supressor
	realnames["bm_wp_mp7_b_suppressed"] = "QD \"Power-Up\" MP7 Suppressor"	
	realnames["bm_wp_mp7_b_suppressed_"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"	
	--Extended Mag
	realnames["bm_wp_mp7_m_extended"] = "MP7 40rnd Magazine"
	realnames["bm_wp_mp7_m_extended_desc"] = "Decreases reload speed by 10%"
	--Extended Stock
	realnames["bm_wp_mp7_s_long"] = "Extended Stock"
	
	--[[DEMOMAN]]
	realnames["bm_w_gre_m79"] = "Springfield Armory M79"
	
	
	--[[WEAPON MODS]]
	
	--AK Crab Rail
	realnames["bm_wp_upg_ak_fg_krebs"] = "Krebs UFM Keymod System Handguard"
	--AK Keymod Rail
	realnames["bm_wp_upg_ak_fg_trax"] = "Strike Industries TRAX Handguard"
	--AK Aluminum Grip
	realnames["bm_wp_upg_ak_g_rk3"] = "ZenitCo PK-3 Pistol Grip"
	--AK Aluminum Foregrip
	realnames["bm_wp_upg_ak_fg_zenit"] = "ZenitCo Handguard"
	--Scope Mount
	realnames["bm_wp_upg_o_ak_scopemount"] = "K-VAR KV-04S Optic Mount"
	--Low Drag Magazine
	realnames["bm_wp_upg_ak_m_uspalm"] = "30rnd US PALM AK30 Magazine"
	realnames["bm_wp_upg_ak_m_uspalm_desc"] = "Increases reload speed by 5%"
	--PBS Suppressor
	realnames["bm_wp_upg_ns_ass_pbs1"] = "PBS-1 Suppressor"
	realnames["bm_wp_upg_ns_ass_pbs1_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 10%"
	--DMR Kit
	realnames["bm_wp_upg_ass_ak_b_zastava"] = "Zastava M76 Barrel"
	realnames["bm_wp_upg_ass_ak_b_zastava_desc"] = "Increases range by 30%\nDecreases ADS speed by 10%"
	--Modern Barrel
	realnames["bm_wp_upg_ak_b_ak105"] = "AK-105 Barrel"
	realnames["bm_wp_upg_ak_b_ak105_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	--Exotique Receiver
	realnames["bm_wp_m4_upper_reciever_edge"] = "VLTOR Upper Receiver"
	realnames["bm_wp_m4_upper_reciever_edge_desc"] = "Increases ROF by 2%"
	
	realnames["bm_wp_upg_ass_m4_upper_reciever_ballos"] = "Ballos Upper Receiver" --????
	realnames["bm_wp_upg_ass_m4_upper_reciever_ballos_desc"] = "Decreases ROF by 5%"
	
	realnames["bm_wp_upg_ass_m4_upper_reciever_core"] = "CORE15 Upper Receiver"
	realnames["bm_wp_upg_ass_m4_upper_reciever_core_desc"] = "Increases ROF by 5%"
	
	realnames["bm_wp_upg_ass_m4_lower_reciever_core"] = "CORE15 Lower Receiver"
	realnames["bm_wp_upg_ass_m4_lower_reciever_core_desc"] = "Increases reload speed by 5%"
	
	realnames["bm_wp_upg_m4_s_ubr"] = "Magpul UBR Stock"
	
	realnames["bm_wp_upg_m4_m_l5"] = " 30rnd Lancer Systems L5 AW Magazine"
	
	realnames["bm_wp_upg_smg_olympic_fg_lr300"] = "Short LR300 Handguard"
	
	realnames["bm_wp_upg_ass_m16_fg_stag"] = "Stag Arms Model 8T Handguard"
	
	realnames["bm_wp_upg_ass_m4_fg_moe"] = "Magpul MOE SL Handguard"
	realnames["bm_wp_upg_ass_m4_fg_moe_desc"] = "Increases ADS speed by 5%"
	
	realnames["wpn_fps_upg_ass_m4_fg_lvoa"] = "War Sport LVOA Handguard"
	
	realnames["bm_wp_upg_ass_m4_b_beowulf"] = "Beowulf Barrel"
	realnames["bm_wp_upg_ass_m4_b_beowulf_desc"] = "Increases range by 30%\nDecreases ADS speed by 10%"
	
	--Descriptions are gone (for now) so I figured I'd change their names to reflect that they're locking the firemode
	--Single Fire
	realnames["bm_wp_upg_i_singlefire"] = "Single Fire Lock"
	realnames["bm_wp_upg_i_singlefire_desc"] = "Locks fire mode to semi-auto and reduces ROF by 10%"
	--Auto Fire
	realnames["bm_wp_upg_i_autofire"] = "Automatic Fire Lock"
	realnames["bm_wp_upg_i_autofire_desc"] = "Locks fire mode to full-auto with a 15% ROF boost. \nSets the C96's ROF to 1000 RPM. \nSets the TEC-9's ROF to 800 RPM."
	
	--Pistol Light
	realnames["bm_wp_upg_fl_pis_tlr1"] = "Streamlight TLR1"
	--Pistol Laser
	realnames["bm_wp_upg_fl_pis_laser"] = "Aim Sports LH002 Laser Sight" --it seems to be more based on the RAP4 Paintball Pistol Laser sight but it's a lot less cool calling it that since paintball so the next closest thing will suffice	
	--Pistol Laser
	realnames["bm_wp_upg_fl_x400v"] = "SureFire X400V-IRC"
	realnames["bm_wp_upg_fl_crimson"] = "Crimson Trace CMR Laser Sight"
	
	realnames["bm_wp_pis_g_laser"] = "Crimson Trace Glock Laser Grip"
	realnames["bm_wp_pis_g_beavertail"] = "Beavertail Grip Extension"
	
	--Assault Light
	realnames["bm_wp_upg_fl_ass_smg_sho_surefire"] = "Surefire Scout Light" --based off of but doesnt seem to take from a specific model
	--Compact Laser
	realnames["bm_wp_upg_fl_ass_laser"] = "Offset Laser Mount & Sight"
	--Tactical Laser
	realnames["bm_wp_upg_fl_ass_smg_sho_peqbox"] = "Insight Technology AN/PEQ-5"
	--Military Laser 
	realnames["bm_wp_upg_fl_ass_peq15"] = "Insight Technology AN/PEQ-15"

	--Shark Teeth
	realnames["bm_wp_upg_ns_shot_shark"] = "Tromix Shark Breaching Brake"
	--King's Crown
	realnames["bm_wp_upg_shot_ns_king"] = "King Armory KA-1212 Breaching Brake"
	
	--Pistol Flash Hider
	realnames["bm_wp_upg_pis_ns_flash_desc"] = "Hides muzzle flash"

	--Low Profile Suppressor
	realnames["bm_wp_upg_ns_ass_smg_small"] = "GemTech HALO Suppressor" --not 100% but I can't find any other suppressor that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
	realnames["bm_wp_upg_ns_ass_smg_small_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10%"
	--Medium Suppressor
	realnames["bm_wp_upg_ns_ass_smg_medium"] = "Small Arms Industries M80 Suppressor" --Thanks Overkill for being vauge as fuck, I'm surprised I even found this
	realnames["bm_wp_upg_ns_ass_smg_medium_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 5%"
	--Bigger the Better **Don't know
	realnames["bm_wp_upg_ns_ass_smg_large"] = "Large Suppressor"
	realnames["bm_wp_upg_ns_ass_smg_large_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	--Size Doesn't Matter 
	realnames["bm_wp_upg_ns_pis_small"] = "Thompson Machine Poseidon Suppressor"	
	realnames["bm_wp_upg_ns_pis_small_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10%"	
	--Standard Issue
	realnames["bm_wp_upg_ns_pis_medium"] = "GemTech SFN Suppressor" --Close enough... it's sectioned similarly enough for me to just name it this
	realnames["bm_wp_upg_ns_pis_medium_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 5%"
	--Monolith 
	realnames["bm_wp_upg_ns_pis_large"] = "Silencerco Osprey Suppressor"
	realnames["bm_wp_upg_ns_pis_large_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	realnames["bm_wp_upg_ns_medium_gem"] = "GemTech Blackside Suppressor"
	realnames["bm_wp_upg_ns_medium_gem_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_upg_ns_large_kac"] = "KAC MK.23 Suppressor"
	realnames["bm_wp_upg_ns_large_kac_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	realnames["bm_wp_upg_ns_pis_medium_slim_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	--Shotgun Suppressor
	realnames["bm_wp_upg_ns_shot_thick"] = "Shotgun Suppressor"
	realnames["bm_wp_upg_ns_shot_thick_desc"] = "Decreases range by 20% \nDecreases ADS speed by 10%"
	
	realnames["bm_wp_upg_ns_meatgrinder"] = "Standoff Muzzle Device"
	
	--Stubby
	realnames["bm_wp_upg_ns_ass_smg_stubby"] = "Stinger Flash Hider" --Based on the VFC Stinger's pseudo flash-hider
	realnames["bm_wp_upg_ns_ass_smg_stubby_desc"] = "Hides muzzle flash"
	--Tank **Don't know, could quite literally be based off of a tank compensator
	realnames["bm_wp_upg_ns_ass_smg_tank"] = "Tank Compensator"
	realnames["bm_wp_upg_ns_ass_smg_tank_desc"] = "Vents muzzle flash to the sides"
	--Firebreather
	realnames["bm_wp_upg_ns_ass_smg_firepig"] = "Noveske KX3 Compensator"
	realnames["bm_wp_upg_ns_ass_smg_firepig_desc"] = "Increases muzzle flash"
	
	--Competitors
	realnames["bm_wp_upg_ass_ns_jprifles"] = "JPE Bennie Cooley Muzzle Brake"
	--Funnel of Fun
	realnames["bm_wp_upg_ass_ns_linear"] = "KIES Blast Master Linear Compensator"
	realnames["bm_wp_upg_ass_ns_linear_desc"] = "Increases muzzle flash"
	--Tactical
	realnames["bm_wp_upg_ass_ns_surefire"] = "Surefire MBK Muzzle Brake"
	
	--Muldon
	realnames["bm_wp_r870_s_folding"] = "R870 Top Folding Stock"
	
	--Standard
	realnames["bm_wp_m4_s_standard"] = "Bushmaster LE Stock"
	--Tactical
	realnames["bm_wp_m4_s_pts"] = "Magpul PTS Stock"
	--Folding
	realnames["bm_wp_m4_uupg_s_fold"] = "LR300 Folding Stock"
	--Wide
	realnames["bm_wp_upg_m4_s_crane"] = "NSWC Crane Stock"
	--War-Torn
	realnames["bm_wp_upg_m4_s_mk46"] = "NSWC Crane Stock w/ Cheek Pad" --looking at it now, the rudimentary cheek pad is generally useless since you hold the gun right handed (so you make a cheekweld with the left side of the gun) and the pad is mostly on the right. GJ Overkill.
	
	--Folding Stock (underfolder)
	realnames["bm_wp_ak_s_folding"] = "Folding AK Stock"
	--Folding Stock (sidefolder)
	realnames["bm_wp_ak_s_skfoldable"] = "Folding AK Stock"
	--Wooden Sniper Stock
	realnames["bm_wp_ak_s_psl"] = "PSL Thumbhole Stock"
	
	--Ergo (Glocks)
	realnames["bm_wp_g18c_g_ergo"] = "Hogue Handall Grip Sleeve"
	realnames["bm_wp_g18c_g_ergo_desc"] = "Increases ADS speed by 5%"
	--Ergo
	realnames["bm_wp_m4_g_ergo"] = "Command Arms UPG16 Pistol Grip"
	realnames["bm_wp_m4_g_ergo_desc"] = "Increases ADS speed by 5%"
	--Pro
	realnames["bm_wp_m4_g_sniper"] = "PSG Style Pistol Grip" --there are a bunch of grips styled after the PSG-1's grip but the one in PD2 doesn't seem to take from any specific real-life model
	--Rubber
	realnames["bm_wp_upg_m4_g_hgrip"] = "Hogue OverMolded AR Pistol Grip"
	--Straight
	realnames["bm_wp_upg_m4_g_mgrip"] = "Magpul MOE-K Pistol Grip"
	
	--Rubber
	realnames["bm_wp_upg_ak_g_hgrip"] = "Hogue OverMolded AK Pistol Grip"
	--Plastic
	realnames["bm_wp_upg_ak_g_pgrip"] = "US PALM Enhanced Pistol Grip"
	realnames["bm_wp_upg_ak_g_pgrip_desc"] = "Increases ADS speed by 5%"
	
	--Wood Rail
	realnames["bm_wp_ak_fg_combo2"] = "Ultimak AK Optic Mount"
	--Tact. Russian
	realnames["bm_wp_ak_fg_combo3"] = "Ultimak AK Modular Rail Forend System"
	--Battleproven
	realnames["bm_wp_upg_ak_fg_tapco"] = "Tapco Intrafuse Handguard" --This is actually for the Saiga. lolOverkill
	--Lightweight
	realnames["bm_wp_upg_fg_midwest"] = "Midwest Industries Quad Rail"
	
	--Slav. Dragon
	realnames["bm_wp_upg_ak_b_draco"] = "Draco Pistol Barrel"
	realnames["bm_wp_upg_ak_b_draco_desc"] = "Decreases range by 10% \nIncreases ADS speed by 10%"
	
	--Extended Mag (Glocks)
	realnames["bm_wp_g18c_m_mag_33rnd"] = "Glock 33/22rnd Magazine (9mm/.40S&W)"	
	--Vintage Mag
	realnames["bm_wp_m4_m_straight"] = "20rnd STANAG Magazine" --Hesitant to call them this since they're so off-model and resemble the M4A1 mags used in MW3
	realnames["bm_wp_m4_m_straight_desc"] = "Increases reload speed by 10%"
	--Milspec Mag
	realnames["bm_wp_m4_uupg_m_std"] = "30rnd STANAG Magazine"	
	--Tactical Mag
	realnames["bm_wp_m4_m_pmag"] = "31rnd Magpul PMAG Magazine" --you can actually shove 31 rounds into one of the PMAG models and still have it load
	realnames["bm_wp_m4_m_pmag_desc"] = "Increases reload speed by 5%"
	--Expert Mag
	realnames["bm_wp_l85a2_m_emag"] = "30rnd Magpul EMAG Magazine"
	realnames["bm_wp_l85a2_m_emag_desc"] = "Decreases reload speed by 5%"
	--CAR Quad
	realnames["bm_wp_upg_m4_m_quad"] = "60rnd Surefire Magazine"
	realnames["bm_wp_upg_m4_m_quad_desc"] = "Decreases reload speed by 10%"
	--AK Quad
	realnames["bm_wp_upg_ak_m_quad"] = "60rnd Concern Kalashnikov Magazine"
	realnames["bm_wp_upg_ak_m_quad_desc"] = "Decreases reload speed by 10%"
	--Beta-C
	realnames["bm_wp_m4_m_drum"] = "100rnd Beta-C Magazine"
	realnames["bm_wp_m4_m_drum_desc"] = "Decreases reload speed by 15%"
	--AK Drum
	realnames["bm_wp_ak_m_drum"] = "75rnd Drum Magazine"
	realnames["bm_wp_ak_m_drum_desc"] = "Decreases reload speed by 15%"
	
	--Pistol Red Dot
	realnames["bm_wp_upg_o_rmr"] = "Trijicon RMR Red Dot"
	realnames["bm_wp_upg_o_rmr_desc"] = "Low power red dot sight"
	
	--Marksman
	realnames["bm_wp_upg_o_marksmansight_rear"] = "Custom iron sights"
	
	--Military Red Dot
	realnames["bm_wp_upg_o_aimpoint"] = "Aimpoint PRO Red Dot"
	realnames["bm_wp_upg_o_aimpoint_desc"] = "Encased red dot sight"
	--Holographic
	realnames["bm_wp_upg_o_eotech"] = "EOTech 553 Holographic Sight"
	realnames["bm_wp_upg_o_eotech_desc"] = "Low power holographic sight"
	--Professional
	realnames["bm_wp_upg_o_t1micro"] = "Aimpoint Micro T-1 Red Dot"
	realnames["bm_wp_upg_o_t1micro_desc"] = "Low power red dot sight"
	--Surgeon
	realnames["bm_wp_upg_o_docter"] = "IRONDOT w/ Docter Sight II Plus Red Dot"
	realnames["bm_wp_upg_o_docter_desc"] = "Low power red dot sight"
	--ACOUGH
	realnames["bm_wp_upg_o_acog"] = "Trijicon ACOG Scope"
	realnames["bm_wp_upg_o_acog_desc"] = "Medium range scope \nDecreases ADS speed by 5%"
	--Milspec
	realnames["bm_wp_upg_o_specter"] = "ELCAN Specter DR 1-4x Scope"
	realnames["bm_wp_upg_o_specter_desc"] = "Medium range scope \nDecreases ADS speed by 5%"
	--See More
	realnames["bm_wp_upg_o_cmore"] = "C-More Railway Red Dot"
	realnames["bm_wp_upg_o_cmore_desc"] = "Low power red dot sight"
	--Combat
	realnames["bm_wp_upg_o_cs"] = "Aimpoint CS Red Dot"
	realnames["bm_wp_upg_o_cs_desc"] = "Encased red dot sight"
	--Compact Holo
	realnames["bm_wp_upg_o_eotech_xps"] = "EOTech EXPS3 Holographic Sight"
	realnames["bm_wp_upg_o_eotech_xps_desc"] = "Low power holographic sight"
	--Speculator
	realnames["bm_wp_upg_o_reflex"] = "Sightmark Sureshot Red Dot" --super generic so I just went with what COD4 based it off of
	realnames["bm_wp_upg_o_reflex_desc"] = "Low power red dot sight"
	--Trigonom
	realnames["bm_wp_upg_o_rx01"] = "Trijicon RX01 Red Dot"
	realnames["bm_wp_upg_o_rx01_desc"] = "Low power red dot sight"
	--Solar
	realnames["bm_wp_upg_o_rx30"] = "Trijicon RX30 Red Dot"	
	realnames["bm_wp_upg_o_rx30_desc"] = "Low power red dot sight"	
	--Theia
	realnames["bm_wp_upg_o_leupold"] = "Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS"
	realnames["bm_wp_upg_o_leupold_desc"] = "Ballistic scope that auto marks in stealth/specials \nDecreases ADS speed by 10%"
	--45 irons
	realnames["bm_wpn_fps_upg_o_45iron"] = "XS Sights Angled Sights" --these are literally the worst things IRL, don't buy them for your gun if you have one and want angled sights to mount on it
	--Flip-Up (KSG sights)
	realnames["bm_wp_upg_o_mbus_rear"] = "Magpul MBUS Back-up Sights"
	realnames["bm_wp_upg_o_mbus_rear_desc"] = "Flip-up sights"
	realnames["dd_rear"] = "Daniel Defence Fixed Sight Combo"
	
	realnames["bm_wp_mosin_iron_sight"] = "Iron sights"
	realnames["bm_wp_mosin_iron_sight_desc"] = "Remove the scope and use iron sights"
	
	--AP Slug
	realnames["bm_wp_upg_a_slug"] = "Armor Piercing SABOT Slugs"
	realnames["bm_wp_upg_a_slug_desc"] = "A slug capable of going through most surfaces. Shoot a single, accurate slug with -50% max damage range and +300% range at a distance."
	--Birdshot (originally the free 000 Buck)
	realnames["bm_wp_upg_a_bird"] = "Birdshot"
	realnames["bm_wp_upg_a_bird_desc"] = "Shoot 50 tiny pellets (30 in the Judge) for greater pellet coverage. Not very good for killing...\nCAN CAUSE FPS DROPS ON LOW END SYSTEMS" 
	--000 Buck
	realnames["bm_wp_upg_a_custom"] = "000 Buck"
	realnames["bm_wp_upg_a_custom_desc"] = "Large pellets with greater stopping power. Shoot 6 pellets (4 in the Judge) with +20% max damage range, -30% range at a distance and greater spread." 
	--Flechette
	realnames["bm_wp_upg_a_piercing"] = "Flechette Rounds"
	realnames["bm_wp_upg_a_piercing_desc"] = "Darts capable of penetrating armour. Shoot 15 darts (10 in the Judge) with +50% range at a distance and tighter spread."
	--HE
	realnames["bm_wp_upg_a_explosive"] = "Fragmentation Rounds"
	realnames["bm_wp_upg_a_explosive_desc"] = "Fin stabilized rounds that explode on impact. Shoot explosives that can stun and/or targets in its blast radius. Deals a flat 100 damage."
	
	--URSA
	realnames["bm_melee_kabar"] = "USMC KA-BAR"
	realnames["bm_melee_kabar_desc"] = "The most famous fixed blade knife in the World, the KA-BAR. \n\nDesigned to serve US troops during World War II and is still doing its job, in the hands of robbers, years later.\n"
	--Krieger
	realnames["bm_melee_kampfmesser"] = "KM 2000"
	realnames["bm_melee_kampfmesser_desc"] = "The official combat knife of the German Bundeswehr Armed Forces. The new series KM2000 is manufactured to exacting ISO standards with substantially improved cutting edge capacity.\n"
	--Berger
	realnames["bm_melee_gerber"] = "Gerber DMF Folder"
	realnames["bm_melee_gerber_desc"] = "The manual opening DMF Folder brings the much sought after tactical innovations and technologies of the Automatic DMF to a large, ambidextrous-use knife. Textured G-10 handle gives the DMF Folder a sure grip and maintains a perfect weight balance.\n"
	
	--Tomahawk
	realnames["bm_melee_tomahawk"] = "Gerber Downrange Tomahawk"
	realnames["bm_melee_tomahawk_desc"] = "When you're in a situation where time is of the essence, you can't waste time wondering if you have the right tool for the heist. No matter what's on the other side of that door or barrier, you want a tool with the same single-minded determination as the heister wielding it.\n"
	--Machete
	realnames["bm_melee_becker"] = "KA-BAR Becker Tac Tool"
	realnames["bm_melee_becker_desc"] = "A design collaboration between Ethan Becker of BK&T and John Benner of TDI, the Tac Tool smashes, bashes, prys, hammers and cuts. It is equally powerful at lifting stubborn hinge pins, prying open doors or windows, and hammering out display cases as it is efficient at cutting 550. cord.\n\n"
	--Baton
	realnames["bm_melee_baton"] = "ASP Friction Loc Baton"
	realnames["bm_melee_baton_desc"] = "The ASP Friction Loc Baton is the most tactically sophisticated impact weapon currently available to law enforcement. Tested by the most elite federal teams, the Friction Loc has proven itself virtually indestructible. \nAnd yet you have it. Ironic, isn't it?\n"	
	--Shovel
	realnames["bm_melee_shovel"] = "KLAS Shovel"
	realnames["bm_melee_shovel_desc"] = "The KLAS shovel can be used for a variety of recreational purposes. It can also be used as a weapon - sharpen the edges and you'll be cutting through flesh and bone. If you use it correctly, that is. \nWhich you don't.                                                        \n"
	
	--EMONE Toggle
	realnames["bm_melee_emone"] = "LODS OF EMONE"
	realnames["emone"] = "L-O-D-S OF E-M-O-N-E\nWhat's that spell?\nLOADSAMONEY!\n\nProb'ly.\n\nWOP IT OUT!\n"

	--TWD Bat toggle
	realnames["bm_melee_baseballbat"] = "\"Lucille\""
	realnames["bm_melee_baseballbat_desc"] = "A baseball bat that has been given the name of \"Lucille\". It's been said that Lucille was used to bash a man's skull in, teach some unruly folks a lesson.\n\nNow that you have it, perhaps you could do the same and teach those cops a thing or two.\n"
	
	--Bayonet
	realnames["bm_melee_bayonet"] = "AKM Type II Bayonet"	
	realnames["bm_melee_bayonet_desc"] = "A rugged bayonet, meant for mounting on the end of your AK and thrusting it into the bodies of your foes. \n\nDoing that makes sense though. You'll just use it like a regular knife, won't you?\n"	
	
	--Bullseye
	realnames["bm_melee_bullseye"] = "Smith & Wesson Bullseye Hatchet"	
	
	--X46
	realnames["bm_melee_x46"] = "Robson Knives X46 Utility Survival Knife"
	
	--Gunther
	realnames["bm_melee_dingdong"] = "Gerber Ding Dong Breaching Tool"
	
	--Cleaver
	realnames["bm_melee_cleaver"] = "Cleaver"
	
	--Machete
	realnames["bm_melee_machete"] = "Machete"
	
	realnames["bm_melee_fireaxe_desc"] = "This drill is on fire! This drill is on fire! It's working on fire! This drill is on fire!\n\nThis axe won't help you with that flaming drill though.\n"
	realnames["bm_melee_briefcase_desc"] = "Call it a blessing, but maybe it was for the best you lost the lock combination.\n\nNow you have an excuse to bash people over the head with it!\n"
	
	--Tanto
	realnames["bm_melee_kabar_tanto"] = "KA-BAR Tanto"
	
	--Chef
	realnames["bm_melee_chef"] = "Chef Knife"
	
	--Trench Knife
	realnames["bm_melee_fairbair"] = "Fairbairn-Sykes Fighting Knife"
	realnames["bm_melee_fairbair_desc"] = "The Fairbairn-Sykes fighting knife is a double-edged fighting knife resembling a dagger or poignard with a foil grip "
	
	realnames["bm_melee_swagger_desc"] = "Hello, heisters. Look at your knife, now back to this, now back at your knife, now back to this. \n\nSadly, your knife isn't as swag as this, but if you stopped using that pansy knife and started using this swagger stick, you could be swagging all over those cops.                                                                             \n"

	--Erica Hartmann
	realnames["bm_melee_model24"] = "Model 24 Stielhandgranate"
	realnames["bm_melee_model24_desc"] = "Why would anyone ever use a grenade as a melee weapon? \n\nI guess those that have tried and lived are really grenade-ful it didn't go off...\n"
	
	realnames["bm_menu_custom"] = "Internal Mod"
	realnames["bm_menu_extra"] = "Rail"
	realnames["bm_menu_upper_reciever"] = "Upper Body Mod"
	realnames["bm_menu_lower_reciever"] = "Lower Body Mod"
	realnames["bm_menu_slide"] = "Barrel/Slide"
	realnames["bm_menu_grip"] = "Pistol Grip"
	realnames["bm_menu_barrel_ext"] = "Barrel Extension"
	realnames["bm_menu_foregrip"] = "Handguard"
	realnames["bm_menu_sight"] = "Optic"
	
	realnames["menu_lmg"] = "Light Machine Guns"
	realnames["menu_shotgun"] = "Shotguns"
	realnames["menu_pistol"] = "Pistols"
	realnames["menu_assault_rifle"] = "Assault Rifles & Carbines"
	realnames["menu_snp"] = "Sniper & Battle Rifles"
	realnames["menu_smg"] = "Sub-Machine Guns & PDWs"
	
	realnames["menu_jowi"] = "Wick"
	
    if realnames[string_id] then return realnames[string_id] end
    return LocalizationManager_text(self, string_id, macros)
end