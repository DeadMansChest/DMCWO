--[[
v1.34
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
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
	
	--Movement penalty string
	realnames["bm_menu_weapon_movement_penalty_info"] = "while drawn, movement speed is reduced by "
	
	--[[BRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRT]]
	realnames["bm_w_m134"] = "General Electric M134"
	realnames["bm_w_m134_desc"] = "A 7.62x51mm NATO, six-barreled machine gun with high suppressive capabilities\nCan pierce enemies, walls and shields"
	realnames["bm_wp_m134_body_upper_light_desc"] = "Decreases movement penalty by 20%"
	realnames["bm_wp_m134_barrel_extreme"] = "Anti-Air Barrel"
	realnames["bm_wp_m134_barrel_extreme_desc"] = "Increases range by 15%\nDecreases ADS speed by 10%\nIncreases movement penalty by 20%"
	realnames["bm_wp_m134_barrel_short"] = "Compact Barrel"
	realnames["bm_wp_m134_barrel_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%\nDecreases movement penalty by 20%"
	
	--[[WE TERRORIST NAO]]
	realnames["bm_w_rpg7"] = "Bazalt RPG-7"
	realnames["bm_w_rpg7_desc"] = "A Russian rocket-propelled grenade launcher\nNo police ammobox pickups\nDamage boosts from skills do not affect this weapon"
	
	--[[GOLD SLAVSHIT]]
	realnames["bm_w_akm_gold"] = "Gold Plated AKMS"
	realnames["bm_w_akm_gold_desc"] = "A Russian gold-plated assault rifle chambered in 7.62x39mm\nCan pierce enemies and walls"
	
	--[[JAM733]]
	realnames["bm_w_amcar"] = "Colt M733 Commando"
	realnames["bm_w_amcar_desc"] = "An American carbine chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
	
	--[[STEEL BALLS]]
	realnames["bm_w_ak74"] = "Concern Kalashnikov AKS-74"
	realnames["bm_w_ak74_desc"] = "A Russian assault rifle chambered in 5.45x39mm\nCan pierce enemies and walls"
	
	--[[JAM-4]]
	realnames["bm_w_m4"] = "Colt M4A1" --"Safety Pins"
	realnames["bm_w_m4_desc"] = "An American assault rifle chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
	--Barrels
	realnames["bm_wp_m4_uupg_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	realnames["bm_wp_m4_uupg_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%" 
	--Suppressed Barrel
	realnames["bm_wp_m4_uupg_b_sd"] = "Suppressed Barrel" 
	realnames["bm_wp_m4_uupg_b_sd_desc"] = "Internally suppressed barrel\nDecreases ADS speed by 10%" 
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
	realnames["bm_w_aug_desc"] = "An Austrian bullpup assault rifle chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
	--A3 Tact. Foregrip
	realnames["bm_wp_aug_fg_a3"] = "A3 Rail"
	realnames["bm_wp_aug_fg_a3_desc"] = "Decreases ADS speed by 5%"
	realnames["bm_wp_aug_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	realnames["bm_wp_aug_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	
	--[[WHITE FLAG]]
	realnames["bm_w_famas"] = "Nexter FAMAS" --"IS THAT A DEAGLE?"
	realnames["bm_w_famas_desc"] = "A French bullpup assault rifle chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
	
	realnames["bm_wp_famas_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	realnames["bm_wp_famas_b_sniper_desc"] = "Increases range by 30%\nIncreases minimum damage by 10%\nDecreases ADS speed by 10%"
	realnames["bm_wp_famas_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	realnames["bm_wp_famas_b_suppressed_desc"] = "Internally suppressed barrel\nDecreases ADS speed by 10%"
	
	--Retro Grip
	realnames["bm_wp_famas_g_retro"] = "G2 Guard"
	realnames["bm_wp_famas_g_retro_desc"] = "Increases ROF to 1200 RPM"
	
	--[[JAM]]
	realnames["bm_w_l85a2"] = "BAE L85A2" --"Eru"
	realnames["bm_w_l85a2_desc"] = "A British-German bullpup assault rifle chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
	realnames["bm_wp_l85a2_b_long"] = "Long Barrel"
	realnames["bm_wp_l85a2_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	
	realnames["bm_wp_l85a2_b_short"] = "Short Barrel"
	realnames["bm_wp_l85a2_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	realnames["bm_wp_l85a2_g_worn"] = "Taped Pistol Grip"
	realnames["bm_wp_l85a2_fg_short"] = "Daniel Defence L85 Quad Rail"
	realnames["bm_wp_l85a2_fg_short_desc"] = "Increases ADS speed by 5%"
	
	--[[CROATGAT]]
	realnames["bm_w_vhs"] = "HS Produkt VHS-2"
	realnames["bm_w_vhs_desc"] = "A Croatian bullpup assault rifle chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
	realnames["bm_wp_vhs_b_short"] = "Short Barrel"
	realnames["bm_wp_vhs_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	realnames["bm_wp_vhs_b_sniper"] = "Sniper Barrel"
	realnames["bm_wp_vhs_b_sniper_desc"] = "Increases range by 30%\nIncreases minimum damage by 10%\nDecreases ADS speed by 10%"
	
	realnames["bm_wp_vhs_b_silenced"] = "Suppressed Barrel"
	realnames["bm_wp_vhs_b_silenced_desc"] = "Internally suppressed barrel\nDecreases ADS speed by 10%"
	
	--[[SLAVSHIT]]
	realnames["bm_w_akm"] = "Concern Kalashnikov AKMS"
	realnames["bm_w_akm_desc"] = "A Russian assault rifle chambered in 7.62x39mm\nCan pierce enemies and walls"
	
	--[[MELTGUN]]
	realnames["bm_w_g36"] = "Heckler & Koch G36C"
	realnames["bm_w_g36_desc"] = "A German carbine chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
	--Compact
	realnames["bm_wp_g36_fg_c"] = "Carbine Handguard"
	realnames["bm_wp_g36_fg_c_desc"] = "Decreases range by 10%\nIncreses ADS speed by 5%"
	--Polizei
	realnames["bm_wp_g36_fg_ksk"] = "Knights Armament Co. RAS Handguard"  
	--Solid Stock
	realnames["bm_wp_g36_s_kv"] = "G36KV Stock"
	--Sniper Stock
	realnames["bm_wp_g36_s_sl8"] = "SL8 Stock"
	
	--[[PUNS]]
	realnames["bm_w_m14"] = "Springfield M14 DMR"
	realnames["bm_w_m14_desc"] = "A special DMR version of the American M14 battle rifle chambered in 7.62x51mm NATO\nCan pierce enemies, walls and shields\nBenefits from assault rifle skills"
	--Abraham
	realnames["bm_wp_m14_body_ebr"] = "MK.14 Kit"
	realnames["bm_wp_m14_body_ebr_desc"] = "Decreases ADS speed by 5%\nIncreases movement penalty by 5%\nIncreases ROF to 750 RPM"
	--Seid ihr das Essen? Nein, wir sind der Jaeger! (watch better anime)
	realnames["bm_wp_m14_body_jae"] = "M14 JAE Kit"
	
	--[[SWED]]
	realnames["bm_w_ak5"] = "Bofors AK5" --"FNC's sexy swedish cousin"
	realnames["bm_w_ak5_desc"] = "A licensed Swedish clone of the Belgian FN FNC assault rifle chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
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
	realnames["bm_w_m16_desc"] = "An American 5.56x45mm NATO assault rifle\nCan pierce enemies and walls"
	--going against imfdb here, simply for the fact the the flat top receiver isn't limited to the A4 and that the AMR bares more resemblence to the A3 (default handguard, automatic fire)
	--Railed
	realnames["bm_wp_m16_fg_railed"] = "Daniel Defense Lite Rail" --not a carbon copy, just based off of, if only for the delta ring
	realnames["bm_wp_m16_fg_railed_desc"] = "Decreases ADS speed by 5%"
	--Blast to the Past
	realnames["bm_wp_m16_fg_vietnam"] = "M16A1 Handguard"
	realnames["bm_wp_m16_fg_vietnam_desc"] = "Increases ADS speed by 5%"
	
	--[[553 NO PANTSU]]
	realnames["bm_w_s552"] = "SIG SG 552" --"SG550's Little Sister"
	realnames["bm_w_s552_desc"] = "A Swiss-made carbine chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
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
	realnames["bm_w_scar_desc"] = "A Belgian-American battle rifle chambered in 7.62x51mm NATO\nCan pierce enemies, walls and shields\nBenefits from assault rifle skills"
	--Sniper Stock
	realnames["bm_wp_scar_s_sniper"] = "MK.20 Stock"	
	
	realnames["bm_wp_scar_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	
	realnames["bm_wp_scar_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	--Rail Extension
	realnames["bm_wp_scar_fg_railext"] = "PWS SCAR Rail Extension"
	realnames["bm_wp_scar_fg_railext_desc"] = "Decreases ADS speed by 5%"
	
	--[[RIGHT ARM]]
	realnames["bm_w_fal"] = "FN FAL"
	realnames["bm_w_fal_desc"] = "A Belgian battle rifle chambered in 7.62x51mm NATO\nCan pierce enemies, walls and shields\nBenefits from assault rifle skills"
	--CQB
	realnames["bm_wp_fal_body_standard"] = "DSA SA58 Handguard w/Short Barrel" --this might conflict with something since this is also the name_id of the receiver
	realnames["bm_wp_fal_body_standard_desc"] = "Decreases range by 10%\nIncreases ADS speed by 15%\nDecreases movement penalty by 5%"
	
    realnames["bm_wp_fal_fg_03"] = "IMI Romat Handguard"
    realnames["bm_wp_fal_fg_03_desc"] = "Decreases ADS speed by 5%"
	--Marksman
    realnames["bm_wp_fal_fg_04"] = "DSA Freefloat Handguard"
    realnames["bm_wp_fal_fg_04_desc"] = "Increases ADS speed by 5%"
	--Wood
    realnames["bm_wp_fal_fg_wood"] = "Wooden Handguard"
    realnames["bm_wp_fal_fg_wood_desc"] = "Decreases ADS speed by 7.5%\nIncreases movement penalty by 5%"
	--Tactical Grip
	realnames["bm_wp_fal_g_01"] = "Tapco FAL/SAW Pistol Grip"
	--Extended Mag
    realnames["bm_wp_fal_m_01"] = "30rnd FAL Magazine"
    realnames["bm_wp_fal_m_01_desc"] = "Decreases reload speed by 10%"
	--Folding
    realnames["bm_wp_fal_s_01"] = "Sidefolding Stock"
	--Marksman
    realnames["bm_wp_fal_s_03"] = "Magpul FAL PRS Stock"
	
	--[[BOTTLE OPENER]]
	realnames["bm_w_galil"] = "IMI Galil ARM"
	realnames["bm_w_galil_desc"] = "An Israeli battle rifle chambered in 7.62x51mm NATO\nCan pierce enemies, walls and shields\nBenefits from assault rifle skills"
	--Sniper
	realnames["bm_wp_galil_fg_sniper"] = "IMI Galatz Handguard & Sniper Barrel"
	realnames["bm_wp_galil_fg_sniper_desc"] = "Increases range by 15%\nDecreases ADS speed by 10%\nDecreases ROF to 630 RPM"
	--Light
	realnames["bm_wp_galil_fg_sar"] = "IMI Galil SAR Handguard & 13\" Barrel"
	realnames["bm_wp_galil_fg_sar_desc"] = "Increases ADS speed by 5%"
	--CQB
	realnames["bm_wp_galil_fg_mar"] = "IMI Galil MAR Handguard & 7\" Barrel"
	realnames["bm_wp_galil_fg_mar_desc"] = "Decreases range by 10%\nIncreases ADS speed by 15%\nDecreases movement penalty by 10%\nIncreases ROF to 750 RPM"
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
	realnames["bm_w_g3_desc"] = "A German battle rifle based off the Spanish CETME, chambered in 7.62x51mm NATO\nCan pierce enemies, walls and shields\nBenefits from assault rifle skills\nDMC's raifu, please treat her well"
	--Assault Kit
	realnames["bm_wp_g3_b_short"] = "Short Barrel"
	realnames["bm_wp_g3_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	--DMR Kit
	realnames["bm_wp_g3_b_sniper"] = "PSG-1 Barrel"
	realnames["bm_wp_g3_b_sniper_desc"] = "Increases range by 30%\nIncreases minimum damage by 10%\nDecreases ADS speed by 10%"
	--PSG Foregrip
	realnames["bm_wp_g3_fg_psg"] = "PSG-1 Handguard"
	realnames["bm_wp_g3_fg_psg_desc"] = "Decreases ADS speed by 5%"
	--Railed Foregrip
	realnames["bm_wp_g3_fg_railed"] = "FAB Defence G3-RS Handguard"
	--Retro Foregrip
	realnames["bm_wp_g3_fg_retro"] = "Wooden Slimline Handguard"
	realnames["bm_wp_g3_fg_retro_desc"] = "Decreases ADS speed by 7.5%\nDecreases movement penalty by 5%"
	--Plastic Retro Foregrip
	realnames["bm_wp_g3_fg_retro_plastic"] = "Slimline Handguard"
	realnames["bm_wp_g3_fg_retro_plastic_desc"] = "Increases ADS speed by 5%\nDecreases movement penalty by 10%"
	--Retro Grip
	realnames["bm_wp_g3_g_retro"] = "G3 Ergo Grip"
	realnames["bm_wp_g3_g_retro_desc"] = "Increases ADS speed by 5%"
	--Sniper Grip
	realnames["bm_wp_g3_g_sniper"] = "PSG-1 Wooden Pistol Grip"
	--Sniper Stock
	realnames["bm_wp_g3_s_sniper"] = "PSG-1 Stock"

	
	--[[Rattlesnake]]
	realnames["bm_w_msr"] = "Remington MSR"
	realnames["bm_w_msr_desc"] = "An American bolt-action rifle chambered in 7.62x51mm NATO\nCan pierce enemies, walls and shields\nBenefits from assault rifle skills"
	--Suppressor
	realnames["bm_wp_snp_msr_ns_suppressor"] = "AAC TiTAN-QD Suppressor"
	realnames["bm_wp_snp_msr_ns_suppressor_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 10%"
	realnames["bm_wp_snp_msr_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 10%"
	--Aluminum Body
	realnames["bm_wp_msr_body_msr"] = "MSR Aluminum Stock & Receiver"
	realnames["bm_wp_msr_body_msr_desc"] = "Increases ADS speed by 5%"
	
	--[[R93]]
	realnames["bm_w_r93"] =  "Blaser R93 Tactical 2"
	realnames["bm_w_r93_desc"] = "A German bolt-action rifle chambered in .338 Lapua Magnum\nCan pierce enemies, walls and shields\nBenefits from assault rifle skills"
	
	realnames["bm_wp_r93_b_short_desc"] =  "Decreases range by 10%\nIncreases ADS speed by 5%"
	realnames["bm_wp_r93_b_suppressed_desc"] =  "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 10%"
	--Wooden Body
	realnames["bm_wp_r93_body_wood"] = "Long Range Sporter 2 Stock"
	realnames["bm_wp_r93_body_wood_desc"] = "Decreases ADS speed by 5%"
	
	--[[FIDDY CAL]]
	realnames["bm_w_m95"] = "Barrett M95"
	realnames["bm_w_m95_desc"] = "An American 12.7x99mm NATO, bolt-action, bullpup anti-materiel rifle\nCan pierce enemies, walls and shields\nBenefits from assault rifle skills\nPassive damage boosts do not effect this weapon"
	--Tank Buster
	realnames["bm_wp_m95_b_barrel_long"] = "Long Barrel w/AW50F Muzzle Brake"
	realnames["bm_wp_m95_b_barrel_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 10%\nIncreases movement penalty by 5%"
	realnames["bm_wp_m95_b_barrel_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%\nDecreases movement penalty by 5%"
	realnames["bm_wp_m95_b_barrel_suppressed_desc"] = "Internally suppressed barrel\nDecreases ADS speed by 10%\nIncreases movement penalty by 10%"
	
	--[[MOIST NUGGET]]
	realnames["bm_w_mosin"] = "Mosin Nagant M91/30"
	realnames["bm_w_mosin_desc"] = "A Russian bolt-action rifle chambered in 7.62x54R\nCan pierce enemies, walls and shields\nCan mount a bayonet\nBenefits from assault rifle skills"
	
	realnames["bm_wp_mosin_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	realnames["bm_wp_mosin_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	
	realnames["bm_wp_mosin_b_sniper"] = "Mosin Suppressor"
	realnames["bm_wp_mosin_b_sniper_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 7.5%"
	--Black Stock
	realnames["bm_wp_mosin_body_conceal"] = "Black Paint"
	
	
	--[[ELMER FUDD]]
	realnames["bm_w_huntsman"] = "Mosconi Coach Gun"
	realnames["bm_w_huntsman_desc"] = "A side-by-side, break-action shotgun loaded with 12-gauge shells\nCan be loaded with special ammo types"
	
	realnames["bm_wp_huntsman_b_short"] = "Sawn-Off Short Barrel"
	realnames["bm_wp_huntsman_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	realnames["bm_wp_huntsman_s_short"] = "Sawn-Off Stock"
	
	--[[BARDODA SHOTGAT]]
	realnames["bm_w_b682"] = "Beretta 682"
	realnames["bm_w_b682_desc"] = "An Italian, over-under, break-action shotgun loaded with 12-gauge shells\nCan be loaded with special ammo types"
	realnames["bm_wp_b682_b_short"] = "Sawn-Off Short Barrel"
	realnames["bm_wp_b682_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	realnames["bm_wp_b682_s_short"] = "Sawn-Off Stock"
	realnames["bm_wp_b682_s_ammopouch"] = "Ammo Pouch"
	
	--[[870]]
	realnames["bm_w_r870"] = "Remington Model 870" --"Remafdng"
	realnames["bm_w_r870_desc"] = "An American, tube fed, pump-action shotgun loaded with 12-gauge shells\nCan be loaded with special ammo types"
	--Extended Mag
	realnames["bm_wp_r870_m_extended"] = "R870 Extended Tube Magazine (+2 Rounds)"
	--Zombie Hunter
    realnames["bm_wp_r870_fg_wood"] = "Wooden Pump"
    realnames["bm_wp_r870_fg_wood_desc"] = "Decreases ADS speed by 5%"
	--Short Enough **don't know
	realnames["bm_wp_r870_s_nostock"] = "No Stock"
	--Short Enough Tact. **don't know
	realnames["bm_wp_r870_s_nostock_big"] = "No Stock w/Full Length Rail"
	--Govt. Stock **don't know
	realnames["bm_wp_r870_s_solid_big"] = "Fixed Stock w/Full Length Rail"
	
	--[[CATS]]
	realnames["bm_w_saiga"] = "Concern Kalashnikov Saiga-12K"
	realnames["bm_w_saiga_desc"] = "A Russian, magazine fed, fully automatic shotgun based off the AK platform, loaded with 12-gauge shells\nCan be loaded with special ammo types"
	--Tact. Russian
	realnames["bm_wp_saiga_fg_lowerrail"] = "Ultimak AK Modular Rail Forend System"
	realnames["bm_wp_saiga_fg_lowerrail_desc"] = "Decreases ADS speed by 5%"
	--Saiga 20 rounder
	realnames["bm_wp_saiga_m_20rnd"] = "20rnd MD Arms Saiga Drum"
	realnames["bm_wp_saiga_m_20rnd_desc"] = "Decreases reload speed by 15%"
	
	--[[AA12]]
	realnames["bm_w_aa12"] = "MPS Auto Assault-12"
	realnames["bm_w_aa12_desc"] = "An American, magazine fed, fully automatic shotgun loaded with 12-gauge shells\nCan be loaded with special ammo types"
	realnames["bm_wp_aa12_mag_drum"] = "20rnd AA-12 Drum"
	realnames["bm_wp_aa12_mag_drum_desc"] = "Decreases reload speed by 15%"
	realnames["bm_wp_aa12_barrel_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	realnames["bm_wp_aa12_barrel_silenced_desc"] = "Internally suppressed barrel\nDecreases ADS speed by 10%"
	
	--[[M1014]]
	realnames["bm_w_benelli"] = "Benelli M4"
	realnames["bm_w_benelli_desc"] = "An Italian, tube fed, semi automatic shotgun loaded with 12-gauge shells\nCan be loaded with special ammo types"
	--Long Barrel
	realnames["bm_wp_ben_b_long"] = "Long Barrel w/7-Shot Tube"
	realnames["bm_wp_ben_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	--Short Barrel
	realnames["bm_wp_ben_b_short"] = "NFA Short Barrel w/4-Shot Tube"
	realnames["bm_wp_ben_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	--Collapsed Stock
	realnames["bm_wp_ben_s_collapsed"] = "M1014 Collapsed Stock"
	--Solid Stock
	realnames["bm_wp_ben_fg_standard"] = "M1014 Civilian Stock" --same deal with the FAL, possible conflict
	
	--[[KELTEC]]
	realnames["bm_w_ksg"] = "Kel-Tec KSG"
	realnames["bm_w_ksg_desc"] = "An American, dual tube fed, pump-action bullpup shotgun loaded with 12-gauge shells\nCan be loaded with special ammo types"
	--Long Barrel
	realnames["bm_wp_ksg_b_long"] = "Long Barrel w/2x 8-Shot Tubes"
	realnames["bm_wp_ksg_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	--Short Barrel
	realnames["bm_wp_ksg_b_short"] = "Patrol Barrel w/2x 6-Shot Tubes"
	realnames["bm_wp_ksg_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	--[[WHY DON'T YOU TAKE A SEAT OVER THERE?]]
	realnames["bm_w_spas12"] = "Franchi SPAS-12"
	realnames["bm_w_spas12_desc"] = "An Italian, tube fed, semi automatic shotgun loaded with 12-gauge shells\nCan be loaded with special ammo types"
	realnames["bm_wp_spas12_b_long"] = "SPAS-12 8-Shot Tube Magazine"
	realnames["bm_wp_spas12_b_long_desc"] = "Decreases ADS speed by 5%"
	
	--[[STREET SWEEPER]]
	realnames["bm_w_striker"] = "Armsel Striker"
	realnames["bm_w_striker_desc"] = "A South-African, cylinder fed, semi automatic shotgun loaded with 12-gauge shells\nCan be loaded with special ammo types"
	realnames["bm_wp_striker_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	realnames["bm_wp_striker_b_suppressed_desc"] = "Internally suppressed barrel\nDecreases ADS speed by 10%" 
	
	--[[BABBY 870]]
	realnames["bm_w_serbu"] = "Short Barrelled Remington Model 870"
	realnames["bm_w_serbu_desc"] = "An American, tube fed, pump-action shotgun loaded with 12-gauge shells\nCan be loaded with special ammo types"
	--Extended Mag
	realnames["bm_wp_shorty_m_extended_short"] = "R870 Extended Tube Magazine (+1 Round)"
	--Standard
	realnames["bm_wp_r870_s_solid"] = "Fixed Stock"
	--Police Shorty
	realnames["bm_wp_serbu_s_solid_short"] = "Fixed Stock w/Rail"
	--Tactical Shorty
	realnames["bm_wp_serbu_s_nostock_short"] = "No Stock w/Rail"
	
	--[[LONGCAT]]
	realnames["bm_w_rpk"] = "Concern Kalashnikov RPK"
	realnames["bm_w_rpk_desc"] = "A Russian LMG chambered in 7.62x39mm\nCan pierce enemies and walls"
	--Tactical Forgrip
	realnames["bm_wp_rpk_fg_standard"] = "Polymer Handguard"
	realnames["bm_wp_rpk_fg_standard_desc"] = "Increases ADS speed by 5%"
	--Plastic Stock
	realnames["bm_wp_rpk_s_standard"] = "Polymer Stock"
	
	--[[KSP]]
	realnames["bm_w_m249"] = "FN Paratrooper M249"
	realnames["bm_w_m249_desc"] = "A Belgian-American LMG chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
	--Railed Foregrip
	realnames["bm_wp_m249_fg_mk46"] = "MK.46 Handguard"
	realnames["bm_wp_m249_fg_mk46_desc"] = "Decreases ADS speed by 5%"
	--Solid Stock
	realnames["bm_wp_m249_s_solid"] = "M249 Solid Stock"
	--LB
	realnames["bm_wp_m249_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	
	--[[RELATED TO RAIFU]]
	realnames["bm_w_hk21"] = "Heckler & Koch HK21" --"Related to mai raifu"
	realnames["bm_w_hk21_desc"] = "A German GPMG chambered in 7.62x51mm NATO\nCan pierce enemies, walls and shields"
	--Short Foregrip
	realnames["bm_wp_hk21_fg_short"] = "HK21 Short Handguard"
	realnames["bm_wp_hk21_fg_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%\nDecreases movement penalty by 10%"
	realnames["bm_wp_hk21_g_ergo"] = "HK21 Ergo Grip"
	realnames["bm_wp_hk21_g_ergo_desc"] = "Increases ADS speed by 5%"
	--LB
	realnames["bm_wp_hk21_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	
	--[[KERBEROS]]
	realnames["bm_w_mg42"] = "Mauser Maschinengewehr 42"
	realnames["bm_w_mg42_desc"] = "A German GPMG chambered in 7.92x57mm\nCan pierce enemies, walls and shields\n\n\"And then the wolf... ate up Little Red Riding Hood\""
	--Light Barrel
	realnames["bm_wp_mg42_b_mg34"] = "Maschinengewehr 34 Barrel"
	realnames["bm_wp_mg42_b_mg34_desc"] = "Increases ADS speed by 5%\nDecreases ROF to 900 RPM"
	--Heat Sink (Star Wars)
	realnames["bm_wp_mg42_b_vg38"] = "DLT-19 Barrel"
	realnames["bm_wp_mg42_b_vg38_desc"] = "Internally suppressed barrel"
	
	--[[GORDON]]
	realnames["bm_w_usp"] = "Heckler & Koch USP Tactical"
	realnames["bm_w_x_usp"] = "Akimbo H&K USP Tacticals"
	realnames["bm_w_usp_desc"] = "A German handgun chambered in .45 ACP\nCan pierce enemies and walls"
	realnames["bm_w_x_usp_desc"] = "A pair of German handguns chambered in .45 ACP\nCan pierce enemies and walls"
	--Ventilated .45 **don't know
	--realnames["bm_wp_usp_co_comp_1"] = "Ventilated .45 Compensator" --I question the existence of this compensator
	--Velocity .45
	realnames["bm_wp_usp_co_comp_2"] = "SJC Compensator .45" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	realnames["bm_wp_pis_usp_m_extended"] = "20rnd USP Magazine"
	realnames["bm_wp_pis_usp_m_extended_desc"] = "Decreases reload speed by 5%"
	--Expert
	realnames["bm_wp_pis_usp_b_expert"] = "USP Expert Slide"
	--Match
	realnames["bm_wp_pis_usp_b_match"] = "USP Match Slide"
	realnames["bm_wp_pis_usp_b_match_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	
	--[[GRENADE 22]]
	realnames["bm_w_g22c"] = "Glock 22C"
	realnames["bm_w_x_g22c"] = "Akimbo Glock 22Cs"
	realnames["bm_w_g22c_desc"] = "An Austrian handgun chambered in .40 S&W\nCan pierce walls"
	realnames["bm_w_x_g22c_desc"] = "A pair of Austrian handguns chambered in .40 S&W\nCan pierce walls"
	--Long Slide
	realnames["bm_wp_g22c_b_long"] = "Glock 35 Compensated Slide"
	realnames["bm_wp_g22c_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	
	--[[GRENADE 17]]
	realnames["bm_w_glock_17"] = "Glock 17"
	realnames["bm_w_x_g17"] = "Akimbo Glock 17s"
	realnames["bm_w_glock_17_desc"] = "An Austrian handgun chambered in 9mm\nCan pierce thin walls"
	realnames["bm_w_x_g17_desc"] = "A pair of Austrian handguns chambered in 9mm\nCan pierce thin walls"
	
	--[[GRENADE 26]]
	realnames["bm_wp_pis_g26"] =  "Glock 26"
	realnames["bm_w_jowi"] =  "Akimbo Glock 26s"
	realnames["bm_wp_pis_g26_desc"] = "An Austrian handgun chambered in 9mm\nCan pierce thin walls"
	realnames["bm_w_jowi_desc"] = "A pair of Austrian handguns chambered in 9mm\nCan pierce thin walls"
	
	realnames["bm_wp_g26_body_salient"] =  "Stipled Tan Frame"
	realnames["bm_wp_g26_b_custom"] =  "Brushed Metal Frame"
	realnames["bm_wp_g26_m_custom"] =  "G26 Stipled Tan Magazine"
	realnames["bm_wp_g26_m_custom_desc"] =  "Increases reload speed by 15%"
	
	--[[FAWHTY FAHVE]]
	realnames["bm_w_colt_1911"] = "Springfield Operator 1911" 
	realnames["bm_w_x_1911"] = "Akimbo Springfield Operator 1911s" 
	realnames["bm_w_colt_1911_desc"] = "An American handgun chambered in .45 ACP\nCan pierce enemies and walls"
	realnames["bm_w_x_1911_desc"] = "A pair of American handguns chambered in .45 ACP\nCan pierce enemies and walls"
	
	--Aggressor
	realnames["bm_wp_1911_co_2"] = "TCII Compensator" --Not 100% but seems to be based off of it
	--Punisher
	realnames["bm_wp_1911_co_1"] = "Clark Heavy Pinmaster" --Not 100% but seems to be based off of it
	--Ergo Grip
	realnames["bm_wp_1911_g_ergo_desc"] = "Increases ADS speed by 5%" 
	--Long
	realnames["bm_wp_1911_b_long"] = "Compensated Long Barrel & Slide" 
	realnames["bm_wp_1911_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	--Vented
	realnames["bm_wp_1911_b_vented"] = "Compensated Two-Tone Slide"
	realnames["bm_wp_1911_m_extended"] = "12rnd 1911 Magazine"
	realnames["bm_wp_1911_m_extended_desc"] = "Decreases reload speed by 5%"
	
	--[[BARDODA]]
	realnames["bm_w_b92fs"] = "Beretta 92FS"
	realnames["bm_w_x_b92fs"] = "Akimbo Beretta 92s"	
	realnames["bm_w_b92fs_desc"] = "An Italian handgun chambered in 9mm\nCan pierce thin walls"
	realnames["bm_w_x_b92fs_desc"] = "A pair of Italian handguns chambered in 9mm\nCan pierce thin walls"
	--Professional
	realnames["bm_wp_beretta_co_co1"] = "SGS Compensator" --Original name was a reference to the movie "The Professional"
	--Competitor
	realnames["bm_wp_beretta_co_co2"] = "Competition Compensator" --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models were based off of airsoft counterparts
	--Extended Mag
	realnames["bm_wp_beretta_m_extended"] = "30rnd 92FS Magazine"
	realnames["bm_wp_beretta_m_extended_desc"] = "Decreases reload speed by 5%"
	--Elite Slide
	realnames["bm_wp_beretta_sl_brigadier"] = "Brigadier Elite Slide"
		
	--[[HUEHUEHUEHUE]]
	realnames["bm_w_raging_bull"] = "Taurus Raging Bull"
	realnames["bm_w_raging_bull_desc"] = "A Brazilian revolver chambered in .44 Magnum\nCan pierce enemies, walls and shields\nBenefits from pistol skills"
	--Mount
	realnames["bm_wp_pis_rage_extra"] = "Raging Bull Scope Mount"
	--Aggressor
	realnames["bm_wp_rage_b_comp1"] = "S&W V-Compensator"
	--Pocket
	realnames["bm_wp_rage_b_short"] = "Snub Nose Short Barrel"
	realnames["bm_wp_rage_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%" 
	--Ventilated
	realnames["bm_wp_rage_b_comp2"] = "S&W Muzzle Compensator"
	realnames["bm_wp_rage_b_comp2_desc"] = "Vents muzzle flash to the sides"
	--Overcompensating
	realnames["bm_wp_rage_b_long"] = "Long Barrel"
	realnames["bm_wp_rage_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	
	--[[HUEHUEHUEHUE BUT IT'S A SHOTGUN]]
	realnames["bm_w_judge"] = "Taurus Judge"
	realnames["bm_w_judge_desc"] = "A Brazilian revolver loaded with .410 bore shells\nCan be loaded with special ammo types\nBenefits from pistol skills"
	
	--[[GRENADE 18]]
	realnames["bm_w_glock_18c"] = "Glock 18C"
	realnames["bm_w_glock_18c_desc"] = "An Austrian machine pistol chambered in 9mm\nCan pierce thin walls\nBenefits from pistol skills\nIs not affected by Equilibrium Aced"
	--Ventilated **don't know
	--realnames["bm_wp_g18c_co_1"] = "Ventilated Compensator" --I question the existence of this compensator
	--Velocity
	realnames["bm_wp_g18c_co_comp_2"] = "SJC Compensator 9mm"
	
	--[[DEAGLE]]
	realnames["bm_w_deagle"] = "IMI Desert Eagle Mark XIX" --"IS THAT A M16?"
	realnames["bm_w_x_deagle"] = "Akimbo IMI Desert Eagles"
	realnames["bm_w_deagle_desc"] = "An Israeli-American handgun chambered in .50 AE\nCan pierce enemies, walls and shields"
	realnames["bm_w_x_deagle_desc"] = "A pair of Israeli-American handguns chambered in .50 AE \nCan pierce enemies, walls and shields"
	--Mount
	realnames["bm_wp_pis_deagle_extra"] = "Desert Eagle Scope Mount"
	--La Femme
	realnames["bm_wp_deagle_co_short"] = "Desert Eagle Muzzle Brake" --Original name was a reference to a 1990s film only for the gun's appearance in it, otherwise this is based on a real attachment
	--Overkill
	realnames["bm_wp_deagle_co_long"] = "Custom Barrel Weight" --Attachment is a reference to the Boondock Saints
	realnames["bm_wp_deagle_co_long_desc"] = "Decreases ADS speed by 5%" 
	--Extended Mag
	realnames["bm_wp_deagle_m_extended"] = "10rnd Desert Eagle Magazine" --Given the length of the mag and considering the .50 AE variant is single stack only, this is the only choice. Not that it matters that there's more ammo than what's stated *cough* 1911 12rnd Mag *cough*
	--Long Barrel
	realnames["bm_wp_deagle_b_long"] = "10\" Long Barrel"
	realnames["bm_wp_deagle_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	
	
	--[[JAMES BOND]]
	realnames["bm_w_ppk"] = "Walther PPK"
	realnames["bm_w_ppk_desc"] = "A German handgun chambered in .32 ACP\nCan pierce thin walls"
	--Laser Grip
	realnames["bm_wp_pis_ppk_g_laser"] = "Crimson Trace Laser Grip"
	--Long Side
	realnames["bm_wp_pis_ppk_b_long"] = "PPKS Slide"
	
	--[[40 SW IS A SHIT ROUND]]
	realnames["bm_w_p226"] = "Sig Sauer P226R"
	realnames["bm_w_p226_desc"] = "A Swiss-made handgun chambered in .40 S&W\nCan pierce walls"
	--Ventilated .40 **don't know
	--realnames["bm_wp_p226_co_comp_1"] = "Ventilated .40 Compensator" --I question the existence of this compensator
	--Velocity .40
	realnames["bm_wp_p226_co_comp_2"] = "SJC Compensator .40" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	realnames["bm_wp_p226_m_extended"] = "22rnd P226 Magazine" --Not too sure if this exists, just basing it off of the fact the "22" is plastered all over the damn thing
	realnames["bm_wp_p226_m_extended_desc"] = "Decreases reload speed by 5%"
	--Two-Tone
	realnames["bm_wp_p226_b_equinox"] = "Equinox Duo-Tone Slide"
	--Long Slide
	realnames["bm_wp_p226_b_long"] = "Brushed Long Slide"
	realnames["bm_wp_p226_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	
	--[[LEO]]
	realnames["bm_w_hs2000"] = "Springfield Armory XD(M)-40" --Fuck the texture labels, it's a XD(M)
	realnames["bm_w_hs2000_desc"] = "A Croatian-American handgun chambered in .40 S&W\nCan pierce walls"
	--Extended Mag
	realnames["bm_wp_hs2000_m_extended"] = "22rnd XD(M)-40 Magazine"
	realnames["bm_wp_hs2000_m_extended_desc"] = "Decreases reload speed by 5%"
	--Custom Slide
	realnames["bm_wp_hs2000_sl_custom"] = "Compensated Slide"
	realnames["bm_wp_hs2000_sl_custom_desc"] = "Increases ADS speed by 5%" 
	--Long Slide
	realnames["bm_wp_hs2000_sl_long"] = "Custom Slide"
	
	--[[RED 9]]
	realnames["bm_w_c96"] = "Mauser C96"
	realnames["bm_w_c96_desc"] = "A German handgun chambered in 7.63x25mm that can be converted to full-auto\nCan shoot through enemies and walls"
	--Long Barrel
	realnames["bm_wp_c96_b_long"] = "Carbine Barrel"
	realnames["bm_wp_c96_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 10%"
	--Han Solo
	realnames["bm_wp_c96_nozzle"] = "DL-44 Muzzle"
	--Scope
	realnames["bm_wp_c96_sight"] = "Schmidt & Bender 1-8x24 PM Short Dot"
	realnames["bm_wp_c96_sight_desc"] = "High power scope\nDecreases ADS speed by 7.5%"
	--20rnd Mag
	realnames["bm_wp_c96_m_extended"] = "20rnd C96 Magazine"

	--[[EVENFASTERRUNONSENTENCES]]
	realnames["bm_w_cobray"] = "Cobray M11/9"
	realnames["bm_w_cobray_desc"] = "An American machine pistol chambered in 9mm\nCan pierce enemies and walls\nBenefits from SMG skills"
	
	realnames["bm_wp_cobray_ns_barrelext"] = "MAC Barrel Extension"
	realnames["bm_wp_cobray_ns_barrelext_desc"] = "Decreases ADS speed by 10%"
	realnames["bm_wp_cobray_ns_silencer"] = "SIONICS Suppressor"	
	realnames["bm_wp_cobray_ns_silencer_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 10%"	
	realnames["bm_wp_cobray_body_upper_jacket_desc"] = "Decreases ROF to 850 RPM"	
	
	--[[RUNONSENTENCES]]
	realnames["bm_w_mac10"] = "Ingram M10"
	realnames["bm_w_mac10_desc"] = "An American machine pistol chambered in .45 ACP\nCan pierce enemies and walls\nBenefits from SMG skills"
	--Extended Mag
	realnames["bm_wp_mac10_m_extended"] = "30rnd M10 Magazine"
	realnames["bm_wp_mac10_m_extended_desc"] = "Decreases reload speed by 5%"
	--Railed Handguard
	realnames["bm_wp_mac10_body_ris"] = "MAC Rail System" --I'm getting nothing but airsoft results so generic name
	realnames["bm_wp_mac10_body_ris_desc"] = "Decreases ADS speed by 5%"
	--Skeletal Stock
	realnames["bm_wp_mac10_s_skel"] = "Low Mount Skeleton Stock"	
	
	--[[THOMPSON SENSEI]]
	realnames["bm_w_m1928"] = "Auto-Ordnance M1928"
	realnames["bm_w_m1928_desc"] = "An American sub-machine gun chambered in .45 ACP\nCan pierce enemies and walls"
	--Short Barrel
	realnames["bm_wp_m1928_b_short"] = "Short Barrel"	
	realnames["bm_wp_m1928_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	realnames["bm_wp_m1928_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
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
	realnames["bm_w_mp5_desc"] = "A German sub-machine gun chambered in 9mm\nCan shoot through thin walls"
	--Sehr Kurze
	realnames["bm_wp_mp5_fg_m5k"] = "MP5k Railed Handguard"
	realnames["bm_wp_mp5_fg_m5k_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%\nIncreases ROF to 900 RPM"
	--Polizei Tactical
	realnames["bm_wp_mp5_fg_mp5a5"] = "MP5 Railed Handguard"
	--Ninja
	realnames["bm_wp_mp5_fg_mp5sd"] = "MP5SD Handguard"
	realnames["bm_wp_mp5_fg_mp5sd_desc"] = "Internally suppressed barrel\nDecreases ROF to 600 RPM"
	--Adjustable
	realnames["bm_wp_mp5_s_adjust"] = "Retractable Stock"
	--Bare Essentials
	realnames["bm_wp_mp5_s_ring"] = "No Stock" --"No Pantsu"
	--MP5 Drum
	realnames["bm_wp_mp5_m_drum"] = "110rnd GSG-5 .22lr Drum"
	realnames["bm_wp_mp5_m_drum_desc"] = ".22lr conversion for the MP5\nDecreases reload speed by 15%"

	--[[SLING STOCKS ARE 2LEWD]]
	realnames["bm_w_mp9"] = "Brugger & Thomet TP9SF"
	realnames["bm_w_mp9_desc"] = "A Swiss-made machine pistol chambered in 9mm\nBenefits from SMG skills"
	--Extended Mag
	realnames["bm_wp_mp9_m_extended"] = "30rnd MP9 Magazine"
	realnames["bm_wp_mp9_m_extended_desc"] = "Decreases reload speed by 5%"
	--Skeletal Stock
	realnames["bm_wp_mp9_s_skel"] = "Steyr TMP Fixed Stock"
	
	--[[IT STINGS]]
	realnames["bm_w_scorpion"] = "CZ Skorpion vz. 61"
	realnames["bm_w_scorpion_desc"] = "A Czechoslovakian sub-machine gun chambered in .32 ACP\nCan shoot through thin walls"
	
	realnames["bm_wp_scorpion_m_extended"] = "Dual Magazines"
	realnames["bm_wp_scorpion_m_extended_desc"] = "Increases reload speed by 25%"
	
	realnames["bm_wp_scorpion_b_suppressed"] = "Skorpion Suppressor"
	realnames["bm_wp_scorpion_b_suppressed_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 7.5%"
	
	--[[NOT THE STUDENT COUNCIL PRESIDENT (get FUCKED)]]
	realnames["bm_w_uzi"] = "IMI Uzi"
	realnames["bm_w_uzi_desc"] = "An Israeli sub-machine gun chambered in 9mm\nCan shoot through thin walls"
	
	realnames["bm_wp_uzi_s_solid"] = "Wooden Stock"
	
	realnames["bm_wp_uzi_fg_rail"] = "FAB Defence Uzi Tri-Rail System"
	realnames["bm_wp_uzi_fg_rail_desc"] = "Increases ADS speed by 5%"
	
	realnames["bm_wp_uzi_b_supperessed"] = "IMI Two-Stage Suppressor" --It's IMI made but it was never imported. No idea what the model name is.
	realnames["bm_wp_uzi_b_supperessed_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 7.5%"
	
	--[[S-COOL SHOOTINGS]]
	realnames["bm_w_tec9"] = "Intratec TEC-9"
	realnames["bm_w_tec9_desc"] = "A Swedish-American handgun chambered in 9mm that can be converted to full-auto\nCan shoot through thin walls"
	
	realnames["bm_wp_tec9_b_standard"] = "AB-10 Barrel"
	realnames["bm_wp_tec9_b_standard_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	realnames["bm_wp_tec9_ns_ext"] = "TEC-9 Barrel Extension"
	realnames["bm_wp_tec9_ns_ext_desc"] = "Decreases ADS speed by 5%"
	
	realnames["bm_wp_tec9_s_unfolded"] = "Interdynamic MP-9 Wire Stock"
	
	realnames["bm_wp_tec9_m_extended"] = "50rnd TEC-9 Magazine"
	realnames["bm_wp_tec9_m_extended_desc"] = "Decreases reload speed by 10%"
	
	--[[NOT A STEN]]
	realnames["bm_w_sterling"] = "Sterling L2A1"
	realnames["bm_w_sterling_desc"] = "A British sub-machine gun chambered in 9mm\nCan shoot through thin walls"
	--Supp. Barrel
	realnames["bm_wp_sterling_b_suppressed"] = "L34A1 Barrel"
	realnames["bm_wp_sterling_b_suppressed_desc"] = "Internally suppressed barrel\nDecreases ADS speed by 10%"
	--Heat Sink Barrel
	realnames["bm_wp_sterling_b_e11"] = "E-11 Barrel"
	realnames["bm_wp_sterling_b_e11_desc"] = "Internally suppressed barrel"
	
	realnames["bm_wp_sterling_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	
	realnames["bm_wp_sterling_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	--10rnd Mag
	realnames["bm_wp_sterling_m_short"] = "10rnd L2A1 Magazine"
	realnames["bm_wp_sterling_m_short_desc"] = "Increases reload speed by 15%"
	--34rnd Mag
	realnames["bm_wp_sterling_m_long"] = "34rnd L2A1 Magazine"
	realnames["bm_wp_sterling_m_long_desc"] = "Decreases reload speed by 10%"

	--[[BABBY AR]]
	realnames["bm_w_olympic"] = "Olympic Arms K23B Tactical"
	realnames["bm_w_olympic_desc"] = "An American carbine chambered in 5.56x45mm NATO\nCan pierce enemies and walls"
	
	--Railed Handguard
	realnames["bm_wp_olympic_fg_railed"] = "KAC Free Float Handguard" --a super short version at that, shares the delta ring so I'm assuming this is what it's based off of
	--Shorter Than Short
	realnames["bm_wp_olympic_s_short"] = "Buffer Tube Stock" 
	realnames["bm_wp_m4_uupg_b_medium_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	
	--[[BABBY SLAVSHIT]]
	realnames["bm_w_akmsu"] = "Soviet Union AKMSU"
	realnames["bm_w_akmsu_desc"] = "A Russian carbine chambered in 7.62x39mm\nCan pierce enemies and walls"
	--Moscow Special
	realnames["bm_wp_akmsu_fg_rail"] = "Samson K-Rail" --Seems to be loosely based off of the Samson K-Rail, it's the only thing that looked remotely like this
	realnames["bm_wp_akmsu_fg_rail_desc"] = "Decreases ADS speed by 5%"
	
	--[[OVERPRICED 22LR]]
	realnames["bm_w_p90"] = "FN P90 TR"
	realnames["bm_w_p90_desc"] = "A Belgian bullpup personal defence weapon chambered in 5.7x28mm\nCan shoot through enemies, walls and shields"
	--Long Barrel
	realnames["bm_wp_p90_b_long"] = "PS90 Barrel"
	realnames["bm_wp_p90_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	
	--[[LOL SWEDS]]
	realnames["bm_w_m45"] = "Carl Gustaf Kpist M/45"
	realnames["bm_w_m45_desc"] = "A Swedish sub-machine gun chambered in 9mm\nCan shoot through thin walls"
	--Extended Mag
	realnames["bm_wp_smg_m45_m_extended"] = "50rnd M/45 Magazine"
	realnames["bm_wp_smg_m45_m_extended_desc"] = "Decreases reload speed by 10%" 
	
	--[[YOU SUCK AND WE HATE YOU]]
	realnames["bm_w_mp7"] = "Heckler & Koch MP7A2"
	realnames["bm_w_mp7_desc"] = "A German personal defence weapon chambered in 4.6x30mm\nCan shoot through enemies, walls and shields"
	--Airsoft Supressor
	realnames["bm_wp_mp7_b_suppressed"] = "B&T MP7 Rotex-II Suppressor"	
	realnames["bm_wp_mp7_b_suppressed_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 7.5%"	
	--Extended Mag
	realnames["bm_wp_mp7_m_extended"] = "MP7 40rnd Magazine"
	realnames["bm_wp_mp7_m_extended_desc"] = "Decreases reload speed by 10%"
	--Extended Stock
	realnames["bm_wp_mp7_s_long"] = "Extended Stock"
	
	--[[DEMOMAN]]
	realnames["bm_w_gre_m79"] = "Springfield Armory M79"
	realnames["bm_w_gre_m79_desc"] = "An American, single-shot, break-action grenade launcher loaded with 40mm grenades\nCan fire incendiary rounds\nDamage boosts from skills do not affect this weapon"
	
	--[[NADE SPAM]]
	realnames["bm_w_m32"] = "Milkor Grenade Launcher"
	realnames["bm_w_m32_desc"] = "A South-African, cylinder-fed grenade launcher loaded with 40mm grenades\nCan fire incendiary rounds\nDamage boosts from skills do not affect this weapon"
	
	--[[REVOLVER OCELOT]]
	realnames["bm_w_peacemaker"] = "Colt Single Action Army" --"Revolver Ocelot"
	realnames["bm_w_peacemaker_desc"] = "An American single-action revolver chambered in .45 Colt\nCan shoot through enemies, walls and shields\nBenefits from pistol skills\n\n\"This is the best handgun ever made\""
	--Long
	realnames["bm_wp_peacemaker_barrel_long"] = "12\" Barrel"
	realnames["bm_wp_peacemaker_barrel_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	--Short
	realnames["bm_wp_peacemaker_barrel_short"] = "5.5\" Barrel"
	realnames["bm_wp_peacemaker_barrel_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	--Grip
	realnames["bm_wp_peacemaker_handle_bling"] = "Engraved Grip"
	--Stock
	realnames["bm_wp_peacemaker_rifle_stock"] = "Skeletal Stock"
	
	--[[Winchester]]--
	realnames["bm_w_winchester1874"] = "Winchester Model 1873"
	realnames["bm_w_winchester1874_desc"] = "An American, tube fed, lever-action rifle chambered in .44-40 Winchester\nSuffers high damage drop-off compared to other rifles due to firing a pistol round\nCan shoot through enemies, walls and shields\nBenefits from assault rifle skills"
	--Long
	realnames["bm_wp_winchester_b_long"] = "Long Barrel"
	realnames["bm_wp_winchester_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%" 
	--Supp
	realnames["bm_wp_winchester_b_suppressed"] = "Suppressor"
	realnames["bm_wp_winchester_b_suppressed_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 7.5%"
	
	realnames["bm_wp_winchester_sniper_scope_desc"] = "High power scope\nDecreases ADS speed by 10%"
	
	--[[HANG YOUR GAMES]]
	realnames["bm_w_plainsrider_desc"] = "A wooden bow and arrow\nCan fire explosive tipped arrows\nNon-exploded arrows can be recovered and fired again\nNo police ammobox pickups"
	
	--[[TOASTY]]
	realnames["bm_w_flamethrower_mk2_desc"] = "A flamethrower capable of shooting out to 20 meters\n30% chance to set your target aflame\nNo police ammobox pickups"

	--[[TAGUSO]]
	realnames["bm_w_mateba"] = "Mateba 2006M"
	realnames["bm_w_mateba_desc"] = "An Italian revolver chambered in .357 Magnum\nCan pierce enemies, walls and shields\nBenefits from pistol skills\n\n\"Ангелы и демоны кружили надо мной,\nРазбивали тернии и звёздные пути,\nНе знает счастья только тот,\nКто его зова понять не смог\""
	--Long
	realnames["bm_wp_2006m_b_long"] = "Stampede Barrel"
	realnames["bm_wp_2006m_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	--Med
	realnames["bm_wp_2006m_b_medium"] = "Medium Barrel"
	--Short
	realnames["bm_wp_2006m_b_short"] = "Ghost Barrel"
	realnames["bm_wp_2006m_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	
	
	--[[WEAPON MODS]]
	--Ported
	realnames["bm_wp_ns_battle"] = "Battlecomp 2.0 Compensator"
	--MP5 10mm Magazine
	realnames["bm_wp_mp5_m_straight"] = "30rnd MP5/10 10mm Magazine"
	realnames["bm_wp_mp5_m_straight_desc"] = "10mm Auto conversion for the MP5\nDecreases reload speed by 5%"
	--AK5 CQB
	realnames["bm_wp_ak5_b_short"] = "Short Barrel" 
	realnames["bm_wp_ak5_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%" 
	--AUG Raptor
	realnames["bm_wp_aug_body_f90"] = "Thales F90 Body Kit"
	realnames["bm_wp_aug_body_f90_desc"] = "Increases ROF to 850 RPM"
	--SALVO
	realnames["bm_wp_upg_ns_sho_salvo_large"] = "Silencerco Salvo 12 Suppressor"
	realnames["bm_wp_upg_ns_sho_salvo_large_desc"] = "Decreases range by 25%\nDecreases ADS speed by 10%"
	--MP9 Suppressor
	realnames["bm_wp_mp9_b_suppressed"] = "B&T MP9 QD Suppressor"
	realnames["bm_wp_mp9_b_suppressed_desc"] = "Internally suppressed barrel\nDecreases ADS speed by 10%"
	--Filter
	realnames["bm_wp_upg_ns_ass_filter"] = "Filter Suppressor"
	realnames["bm_wp_upg_ns_ass_filter_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 10%"
	--M14 Scope Mount
	realnames["bm_wp_upg_o_m14_scopemount"] = "Sun Optics USA M14/M1A Scope Mount"
	--LED Combo
	realnames["bm_wp_upg_fl_ass_utg"] = "UTG P38 LED Laser Combo"
	--M3X
	realnames["bm_wp_upg_fl_pis_m3x"] = "Insight Technology M3X"
	--P90 Mall
	realnames["bm_wp_p90_b_ninja_desc"] = "Internally suppressed barrel\nDecreases ADS speed by 10%"
	--P90 Civ
	realnames["bm_wp_p90_b_civilian"] = "Moerse Lekker Barrel Shroud"
	realnames["bm_wp_p90_b_civilian_desc"] = "Increases range by 15%\nDecreases ADS speed by 7.5%"
	
	
	
	--AK Crab Rail
	realnames["bm_wp_upg_ak_fg_krebs"] = "Krebs UFM Keymod System Handguard"
	realnames["bm_wp_upg_ak_fg_krebs_desc"] = "Increases ADS speed by 7.5%"
	--AK Keymod Rail
	realnames["bm_wp_upg_ak_fg_trax"] = "Strike Industries TRAX Handguard"
	realnames["bm_wp_upg_ak_fg_trax_desc"] = "Decreases ADS speed by 7.5%"
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
	realnames["bm_wp_upg_ns_ass_pbs1_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 10%"
	--DMR Kit
	realnames["bm_wp_upg_ass_ak_b_zastava"] = "Zastava M76 Barrel"
	realnames["bm_wp_upg_ass_ak_b_zastava_desc"] = "Increases range by 30%\nIncreases minimum damage by 10%\nDecreases ADS speed by 10%"
	--Modern Barrel
	realnames["bm_wp_upg_ak_b_ak105"] = "AK-105 Barrel"
	realnames["bm_wp_upg_ak_b_ak105_desc"] = "Decreases range by 10%"
	
	--Exotique Receiver
	realnames["bm_wp_m4_upper_reciever_edge"] = "VLTOR Upper Receiver"
	realnames["bm_wp_m4_upper_reciever_edge_desc"] = "Increases ROF by 2%"
	
	realnames["bm_wp_upg_ass_m4_upper_reciever_ballos"] = "2A-Arm BALIOS Upper Receiver" --????
	realnames["bm_wp_upg_ass_m4_upper_reciever_ballos_desc"] = "Decreases ROF by 5%"
	
	realnames["bm_wp_upg_ass_m4_upper_reciever_core"] = "CORE15 Upper Receiver"
	realnames["bm_wp_upg_ass_m4_upper_reciever_core_desc"] = "Increases ROF by 5%"
	
	realnames["bm_wp_upg_ass_m4_lower_reciever_core"] = "CORE15 Lower Receiver"
	realnames["bm_wp_upg_ass_m4_lower_reciever_core_desc"] = "Increases reload speed by 5%"
	
	realnames["bm_wp_upg_m4_s_ubr"] = "Magpul UBR Stock"
	
	realnames["bm_wp_upg_m4_m_l5"] = "30rnd Lancer Systems L5 AW Magazine"
	
	realnames["bm_wp_upg_smg_olympic_fg_lr300"] = "Short LR300 Handguard"
	
	realnames["bm_wp_upg_ass_m16_fg_stag"] = "Stag Arms Model 8T Handguard"
	
	realnames["bm_wp_upg_ass_m4_fg_moe"] = "Magpul MOE SL Handguard"
	realnames["bm_wp_upg_ass_m4_fg_moe_desc"] = "Increases ADS speed by 5%"
	
	realnames["wpn_fps_upg_ass_m4_fg_lvoa"] = "War Sport LVOA Handguard"
	
	realnames["bm_wp_upg_ass_m4_b_beowulf"] = "Beowulf Barrel"
	realnames["bm_wp_upg_ass_m4_b_beowulf_desc"] = "Increases range by 30%\nIncreases minimum damage by 10%\nDecreases ADS speed by 10%"
	
	--Descriptions are gone (for now) so I figured I'd change their names to reflect that they're locking the firemode
	--Single Fire
	realnames["bm_wp_upg_i_singlefire"] = "Single Fire Lock"
	realnames["bm_wp_upg_i_singlefire_desc"] = "Locks fire mode to semi-auto and reduces ROF by 10%"
	--Auto Fire
	realnames["bm_wp_upg_i_autofire"] = "Automatic Fire Lock"
	realnames["bm_wp_upg_i_autofire_desc"] = "Locks fire mode to full-auto with a 15% ROF boost"
	realnames["bm_wp_upg_i_autofire_tec9"] = "Converts the TEC-9 to full auto with a ROF of 800 RPM\nDisables the effects of Equilibrium Aced"
	realnames["bm_wp_upg_i_autofire_c96"] = "Converts the C96 to full auto with a ROF of 1000 RPM\nDisables the effects of Equilibrium Aced"
	
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
	realnames["bm_wp_upg_ns_ass_smg_small_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%"
	--Medium Suppressor
	realnames["bm_wp_upg_ns_ass_smg_medium"] = "Small Arms Industries M80 Suppressor" --Thanks Overkill for being vauge as fuck, I'm surprised I even found this
	realnames["bm_wp_upg_ns_ass_smg_medium_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 5%"
	--Bigger the Better **Don't know
	realnames["bm_wp_upg_ns_ass_smg_large"] = "Large Suppressor"
	realnames["bm_wp_upg_ns_ass_smg_large_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 7.5%"
	
	--Size Doesn't Matter 
	realnames["bm_wp_upg_ns_pis_small"] = "Thompson Machine Poseidon Suppressor"	
	realnames["bm_wp_upg_ns_pis_small_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%"	
	--Standard Issue
	realnames["bm_wp_upg_ns_pis_medium"] = "GemTech SFN Suppressor" --Close enough... it's sectioned similarly enough for me to just name it this
	realnames["bm_wp_upg_ns_pis_medium_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 5%"
	--Monolith 
	realnames["bm_wp_upg_ns_pis_large"] = "Silencerco Osprey Suppressor"
	realnames["bm_wp_upg_ns_pis_large_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 7.5%"
	
	realnames["bm_wp_upg_ns_medium_gem"] = "GemTech Blackside Suppressor"
	realnames["bm_wp_upg_ns_medium_gem_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 5%"
	
	realnames["bm_wp_upg_ns_large_kac"] = "KAC MK.23 Suppressor"
	realnames["bm_wp_upg_ns_large_kac_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 7.5%"
	
	realnames["bm_wp_upg_ns_pis_medium_slim_desc"] = "Decreases range by 25%\nDecreases minimum damage by 15%\nDecreases ADS speed by 7.5%"
	
	--Shotgun Suppressor
	realnames["bm_wp_upg_ns_shot_thick"] = "Shotgun Suppressor"
	realnames["bm_wp_upg_ns_shot_thick_desc"] = "Decreases range by 25%\nDecreases ADS speed by 10%"
	
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
	realnames["bm_wp_upg_m4_s_mk46"] = "NSWC Crane Stock w/Cheek Pad" --looking at it now, the rudimentary cheek pad is generally useless since you hold the gun right handed (so you make a cheekweld with the left side of the gun) and the pad is mostly on the right. GJ Overkill.
	
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
	realnames["bm_wp_upg_ak_b_draco_desc"] = "Decreases range by 10%\nIncreases ADS speed by 10%"
	
	--Extended Mag (Glocks)
	realnames["bm_wp_g18c_m_mag_33rnd"] = "33/22rnd Glock Magazine (9mm/.40S&W)"	
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
	realnames["bm_wp_l85a2_m_emag_desc"] = "Carry an extra magazine\nDecreases reload speed by 15%"
	--CAR Quad
	realnames["bm_wp_upg_m4_m_quad"] = "60rnd Surefire Magazine"
	realnames["bm_wp_upg_m4_m_quad_desc"] = "Decreases reload speed by 10%"
	--AK Quad
	realnames["bm_wp_upg_ak_m_quad"] = "60rnd Concern Kalashnikov Magazine"
	realnames["bm_wp_upg_ak_m_quad_desc"] = "Decreases reload speed by 10%"
	--Beta-C
	realnames["bm_wp_m4_m_drum"] = "100rnd Beta-C Dual Drum"
	realnames["bm_wp_m4_m_drum_desc"] = "Decreases reload speed by 15%"
	--AK Drum
	realnames["bm_wp_ak_m_drum"] = "75rnd AK Drum"
	realnames["bm_wp_ak_m_drum_desc"] = "Decreases reload speed by 15%"
	
	--Pistol Red Dot
	realnames["bm_wp_upg_o_rmr"] = "Trijicon RMR Red Dot"
	realnames["bm_wp_upg_o_rmr_desc"] = "Low power red dot sight"
	--Marksman Irons
	realnames["bm_wp_upg_o_marksmansight_rear_desc"] = "Custom iron sights"
	
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
	realnames["bm_wp_upg_o_docter"] = "IRONDOT w/Docter Sight II Plus Red Dot"
	realnames["bm_wp_upg_o_docter_desc"] = "Low power red dot sight"
	--ACOUGH
	realnames["bm_wp_upg_o_acog"] = "Trijicon ACOG Scope"
	realnames["bm_wp_upg_o_acog_desc"] = "Medium range scope\nDecreases ADS speed by 5%"
	--Milspec
	realnames["bm_wp_upg_o_specter"] = "ELCAN Specter DR 1-4x Scope"
	realnames["bm_wp_upg_o_specter_desc"] = "Medium range scope\nDecreases ADS speed by 5%"
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
	realnames["bm_wp_upg_o_leupold_desc"] = "Ballistic scope that auto marks in stealth/specials\nDecreases ADS speed by 10%"
	--45 irons
	realnames["bm_wpn_fps_upg_o_45iron"] = "XS Sights Angled Sights" --these are literally the worst things IRL, don't buy them for your gun if you have one and want angled sights to mount on it
	--Flip-Up (KSG sights)
	realnames["bm_wp_upg_o_mbus_rear"] = "Magpul MBUS Back-up Sights"
	realnames["bm_wp_upg_o_mbus_rear_desc"] = "Flip-up sights"
	realnames["dd_rear"] = "Daniel Defence Fixed Sight Combo"
	realnames["dd_rear_desc"] = "Fixed sights"
	
	realnames["bm_wp_mosin_iron_sight"] = "Iron sights"
	realnames["bm_wp_mosin_iron_sight_desc"] = "Remove the scope and use iron sights"
	
	--Dragons Breath
	realnames["bm_wp_upg_a_dragons_breath"] = "Dragon's Breath Rounds"
	realnames["bm_wp_upg_a_dragons_breath_desc"] = "Magnesium pellets capable of setting targets on fire. Shoot a blast of 8 pellets with a 50% chance to set your target aflame within 30m"
	realnames["bm_wp_upg_a_dragons_breath_auto"] = "Magnesium pellets capable of setting targets on fire. Shoot a blast of 8 pellets with a 50% chance to set your target aflame within 30m\nThe reduced charge lowers the ROF of this shotgun by 10%"
	--AP Slug
	realnames["bm_wp_upg_a_slug"] = "Armor Piercing SABOT Slugs"
	realnames["bm_wp_upg_a_slug_desc"] = "A slug capable of going through most surfaces. Shoot a single, accurate slug with a 50% shorter max damage range and a 300% longer drop-off distance."
	--Birdshot (originally the free 000 Buck)
	realnames["bm_wp_upg_a_bird"] = "Birdshot"
	realnames["bm_wp_upg_a_bird_desc"] = "Shoot 50 tiny pellets for greater pellet coverage. Not very good for killing...\nCAN CAUSE FPS DROPS ON LOW END SYSTEMS"
 	realnames["bm_wp_upg_a_bird_judge"] = "Shoot 30 tiny pellets for greater pellet coverage. Not very good for killing...\nCAN CAUSE FPS DROPS ON LOW END SYSTEMS" 
	--000 Buck
	realnames["bm_wp_upg_a_custom"] = "000 Buck"
	realnames["bm_wp_upg_a_custom_desc"] = "Large pellets with greater stopping power. Shoot 6 pellets with a 20% longer max damage range, 30% shorter drop-off distance and greater spread." 
	realnames["bm_wp_upg_a_custom_judge"] = "Large pellets with greater stopping power. Shoot 4 pellets with a 20% longer max damage range, 30% shorter drop-off distance and greater spread." 
	--Flechette
	realnames["bm_wp_upg_a_piercing"] = "Flechette Rounds"
	realnames["bm_wp_upg_a_piercing_desc"] = "Darts capable of penetrating armour. Shoot 15 darts with a 50% longer drop-off distance and tighter spread."
	realnames["bm_wp_upg_a_piercing_judge"] = "Darts capable of penetrating armour. Shoot 10 darts with a 50% longer drop-off distance and tighter spread."
	--HE
	realnames["bm_wp_upg_a_explosive"] = "Fragmentation Rounds"
	realnames["bm_wp_upg_a_explosive_desc"] = "Fin stabilized rounds that explode on impact. Shoot explosives that can stun and/or kill targets in its blast radius. Deals a flat 100 damage."
	
	--URSA
	realnames["bm_melee_kabar"] = "USMC KA-BAR"
	realnames["bm_melee_kabar_desc"] = "The most famous fixed blade knife in the World, the KA-BAR.\n\nDesigned to serve US troops during World War II and is still doing its job, in the hands of robbers, years later."
	--Krieger
	realnames["bm_melee_kampfmesser"] = "KM 2000"
	realnames["bm_melee_kampfmesser_desc"] = "The official combat knife of the German Bundeswehr Armed Forces. The new series KM2000 is manufactured to exacting ISO standards with substantially improved cutting edge capacity. Good choice for CQC."
	--Berger
	realnames["bm_melee_gerber"] = "Gerber DMF Folder"
	realnames["bm_melee_gerber_desc"] = "The manual opening DMF Folder brings the much sought after tactical innovations and technologies of the Automatic DMF to a large, ambidextrous use knife. Textured G-10 handle gives the DMF Folder a sure grip in gloved hands and maintains a perfect weight balance."
	--Lambo
	realnames["bm_melee_rambo_desc"] = "A survival knife with a heavy bowie blade. The length, sawtooth spine and centered tip works just as well in the wilderness as it does in close combat."
	
	--Tomahawk
	realnames["bm_melee_tomahawk"] = "Gerber Downrange Tomahawk"
	realnames["bm_melee_tomahawk_desc"] = "When you're in a situation where time is of the essence, you can't waste time wondering if you have the right tool for the heist. No matter what's on the other side of that door or vault, you want a tool with the same single-minded determination as the robber wielding it."
	--Machete
	realnames["bm_melee_becker"] = "KA-BAR Becker Tac Tool"
	realnames["bm_melee_becker_desc"] = "A design collaboration between Ethan Becker of BK&T and John Benner of TDI, the Tac Tool smashes, bashes, prys, hammers and cuts.\n\nIt is equally powerful at lifting stubborn hinge pins, prying open doors or windows, and hammering out display cases as it is efficient at cutting police cable ties."
	--Baton
	realnames["bm_melee_baton"] = "ASP Friction Loc Baton"
	realnames["bm_melee_baton_desc"] = "The ASP Friction Loc Baton is the most tactically sophisticated impact weapon currently available to law enforcement. Tested by the most elite federal teams, it has proven itself virtually indestructible.\n\nIt's rather ironic that you're using it against them now."	
	--Shovel
	realnames["bm_melee_shovel"] = "KLAS Shovel"
	realnames["bm_melee_shovel_desc"] = "The KLAS shovel can be used for a variety of recreational purposes. It can also be used as a weapon - sharpen the edges and you'll be cutting through flesh and bone.\n\nIf you use it correctly, that is.\n\nWhich you don't."
	
	--EMONE
	realnames["bm_melee_moneybundle"] = "LODS OF EMONE"
	realnames["bm_melee_moneybundle_desc"] = "L-O-D-S OF E-M-O-N-E\nWhat's that spell?\nLOADSAMONEY!\n\nProb'ly.\n\nWOP IT OUT!"
	
	--AAAA-TATATATATATATA
	realnames["bm_melee_fists_desc"] = "You're no boxer, but you can still throw a pretty good punch. All it takes is some strength, speed and timing and you'll land a striking blow in no time."
	
	--KA-NUCKLES
	realnames["bm_melee_brass_knuckles_desc"] = "Knuckle style weapons have been used all over the world for hundreds of years. Brass knuckles concentrate the punch's force by directing it towards a harder and smaller area, increasing the chanecs of tissue disruption. Hit hard enough and you'll even fracture some bones."

	--TWD Bat
	realnames["bm_melee_baseballbat"] = "\"Lucille\""
	realnames["bm_melee_baseballbat_desc"] = "A baseball bat that has been given the name of \"Lucille\". It's been said that Lucille was used to bash a man's skull in, teach some unruly folks a lesson.\n\nNow that you have it, perhaps you could do the same and teach those cops a thing or two.\n"
	
	--Bayonet
	realnames["bm_melee_bayonet"] = "AKM Type II Bayonet"	
	realnames["bm_melee_bayonet_desc"] = "A rugged bayonet, meant for mounting on the end of your AK and thrusting it into the bodies of your foes.\n\nDoing that makes sense though. You'll just use it like a regular knife, won't you?\n"	
	
	--Bullseye
	realnames["bm_melee_bullseye"] = "Smith & Wesson Bullseye Hatchet"
	realnames["bm_melee_bullseye_desc"] = "I don't even know what to say to be honest - this is not something you would bring to a fight unless you were some kind of psycho, right?\nI mean, this is intended for chopping logs and going camping, not robbing banks.\n\nRight?"
	
	--X46
	realnames["bm_melee_x46"] = "Robson Knives X46 Utility Survival Knife"
	realnames["bm_melee_x46_desc"] = "The X46 is a single 6\" piece of coated A2 steel in a partially serrated bowie blade configuration with a false top edge.\nIntergrated guard and glass breaker pommel tip.\nThe multi-purpose field design of this knife makes it as useful on the battlefield as it is in an emergency."
	
	--Gunther
	realnames["bm_melee_dingdong"] = "Gerber Ding Dong Breaching Tool"
	realnames["bm_melee_dingdong_desc"] = "A sledgehammer.\nA battering ram.\nA pry bar.\nAll three are essential breaching tools for heisters who need to get through doors quickly. The Ding Dong combines these three tools into one package as tight as the crew."
	
	--Cleaver
	realnames["bm_melee_cleaver"] = "Cleaver"
	realnames["bm_melee_cleaver_desc"] = "Your run of the mill cleaver.\n\nThe grip of this cleaver is rather slippery in your gloved hands so I'm telling you this now, you gotta get a grip on it unless you feel like tossing it."
	
	--Batshit insane
	realnames["bm_melee_bat_desc"] = "A baseball bat, no more, no less.\n\nMeant for use in sport, you'll be using it fo something much more sinister.\n\nLike bashing in the head of an officer of the law."
	
	--Machete
	realnames["bm_melee_machete"] = "Machete"
	realnames["bm_melee_machete_desc"] = "You like hurting people. That's why you use this dull, worn to shit machete, allowing you to revel in the horrific aftermath of your work.\n\nGaping wounds, crudely chopped off body parts and the blood curdling screams of agony from that cop you failed to kill quickly.\n\nTruly the weapon of a cruel, cruel heister."
	
	--Fireaxe
	realnames["bm_melee_fireaxe_desc"] = "Can I axe you a question?\n\nDo you like hurting other people?\n\nIf you do, what better way to do it than with something intended to save lives! Show your victims the fire in your eyes as you save them from yourself in one quick swing."
	
	--Briefcase
	realnames["menu_l_global_value_hlm_game"] = "This is a Hotline Miami Ownership item!"
	realnames["bm_melee_briefcase_desc"] = "Call it a blessing, but maybe it was for the best you lost the lock combination.\n\nNow you have an excuse to hit people over the head with this!\n"
	
	--Tanto
	realnames["bm_melee_kabar_tanto"] = "KA-BAR Tanto"
	realnames["bm_melee_kabar_tanto_desc"] = "The Tanto blade shape, of Asian influence, has a thick pointed blade that's good for penetration. Coupled with a glass-filled nylon sheath this knife is designed for the toughest of tasks."
	
	--UberHaxorNova
	realnames["bm_melee_toothbrush_desc"] = "A small plastic toothbrush, sharpened and hardened, ready to be driven into the side of your next victim.\n\nNova-ne will see it coming."
	
	--Chef
	realnames["bm_melee_chef"] = "Chef Knife"
	realnames["bm_melee_chef_desc"] = "Take this!\n\nWhether you're an angry heister or a psycho bank robber, this hot-forged, laser sharpened chef knife in fine, stainless molybdenum steel will serve you for years.\n\nDid you know that the traditional chef's knife was originally intended to slice and disjoint large cuts of flesh?"
	
	--Trench Knife
	realnames["bm_melee_fairbair"] = "Fairbairn-Sykes Fighting Knife"
	realnames["bm_melee_fairbair_desc"] = "The Fairbairn-Sykes fighting knife is a double-edged fighting knife resembling a dagger or poignard with a foil grip. Good for those rough-n-tumble moments you can find yourself in while on a job."
	
	realnames["bm_melee_swagger_desc"] = "Hello heisters. Look at your knife, now back to this, now back at your knife, now back to this.\n\nSadly, your knife isn't as swag as this, but if you stopped using that pansy ass knife and started using this swagger stick, you could be ballin' all over those cops."

	--Amerigan flag :DDD
	realnames["bm_melee_freedom_desc"] = "Thirteen stripes of red alternating with white, a blue rectangle in the canton, fifty small, white, five pointed stars, a pinch of partriotism, two cups of freedom and a broken flag pole.\n\nVoila - you have yourself a deadly weapon."

	--Erica Hartmann
	realnames["bm_melee_model24"] = "Model 24 Stielhandgranate"
	realnames["bm_melee_model24_desc"] = "Why would anyone ever use a grenade as a melee weapon?\n\nStrike to the head?\nWitch-ful thinking?\n\nI guess those that have tried and lived are really grenade-ful it didn't go off."
	
	--Hammer time
	realnames["bm_melee_hammer"] = "Jacket's Hammer"
	realnames["bm_melee_hammer_desc"] = "The Jacket says, \"Do you know what time it is?\"\n\nWhy it's time to hammer some skulls in of course!\n\nCops won't be touching you, that's for sure."
	
	--Mayweather a boring
	realnames["bm_melee_boxing_gloves_desc"] = "Time to come out swinging!\nSlip these beauties on and unleash 1000 pounds of peak punching power!\n\nThat is if you actually fight and not just run around avoiding conflict..."
	
	--A stick of lies
	realnames["bm_melee_shillelagh_desc"] = "It's hard to determine the true origins of the shillelagh. How can you pinpoint the first time someone picked up a stout stick and brained someone else with it? And the shillelagh really hasn't evolved too much beyond that. Some prize blackthorn wood, while some might fill the head with molten lead.\n\nAt the end of the day, it really is just a bloody heavy stick that cracks skulls."
	
	--SJW Whiskey
	realnames["bm_melee_whiskey_desc"] = "Know what makes you a good heister?\n\nReading this message obviously. Clear indication you haven't been caught."
	
	--Another Cleaver
	realnames["bm_melee_meat_cleaver"] = "Dragan's Cleaver"
	realnames["bm_melee_meat_cleaver_desc"] = "The cleaver is a kind of knife primarily used for cutting through meat and bone, but rather than using precise cuts the cleaver delivers powerful hammer-like blows that rend even the most durable flesh. Cleavers have a long history of butchering human beings as well as livestock.\n\nYou'll be doing the former."
	 
	--Tender lovin'
	realnames["bm_melee_poker"] = "Firewood Poker"
	realnames["bm_melee_poker_desc"] = "A long piece of iron with a pointy end is a fine implement for tending to smoldering embers, but it is also the perfect implement for causing havoc and extreme discomfort.\n\nTell'em to poker up!"
	
	--Tender lovin'
	realnames["bm_melee_tenderizer"] = "Meat Tenderizer"
	realnames["bm_melee_tenderizer_desc"] = "While it was mainly designed for softening and flattening tough strips of steak, it has also proven useful for softening and flattening tough strips of cop.\n\nShow'em some tender lovin'!"
	
	--Fork her
	realnames["bm_melee_fork"] = "BBQ Fork"
	realnames["bm_melee_fork_desc"] = "What's the difference between a truckload of bowling balls and a truckload of dead dozers? You can't unload a truckload of bowling balls with a fork.\n\nGive'em a good forkin'!"
	
	--Spangle Beb
	realnames["bm_melee_spatula_desc"] = "A melee weapon with a dual purpose - use it to smear a cop all across the road, and then let others use it to scoop up their remains.\n\nGet'em faces sizzlin'!"
	
	--Autism
	realnames["bm_melee_mining_pick"] = "Pickaxe"
	realnames["bm_melee_mining_pick_desc"] = "There's gold in 'dem 'der hills! And by hills we mean teeth. But, hills or teeth, nothing digs the gold out faster than a swinging spike of pig iron."
	
	--Ebay sellers
	realnames["bm_melee_scalper_desc"] = "For the victor, it is the symbol of war, of power and of dominance. For the loser, it is the symbol of a really bad haircut."
	
	--NAOW THIS IS A KNOIFE
	realnames["bm_melee_bowie"] = "Bowie Knife"
	realnames["bm_melee_bowie_desc"] = "Nine inches of clip-point fighting steel. It's origins lie in the age of the classic pirate, but it was the famous Brawl of Carroll County (and a dozen bloodied men) that brought it wide-spread fame"
	
	--MY BRAND
	realnames["bm_melee_branding_iron"] = "Branding Iron"
	realnames["bm_melee_branding_iron_desc"] = "It may have been designed to mark the thick hides of cattle for identification, but fire-heated iron is even more effective against the soft flesh of a deputy or marshall."
	
	--Mike
	realnames["bm_melee_microphone_desc"] = "A microphone you ask?\n\nIndeed it is. A dinky little microphone at that.\n\nNot much else to say,"

	--Mike Stands
	realnames["bm_melee_micstand_desc"] = "Can't quite understand why you'd use this.\n\nMaybe like how a singer can keep rabid folk away and off the stage, you can do the same with cops rushing you and off your loot."
	
	--WOLOLOLO
	realnames["bm_melee_oldbaton"] = "Nightstick"
	realnames["bm_melee_oldbaton_desc"] = "Be one of the night and stick it to the man!\n\nShow them irony, show them pain!\nShow them in the end that this is (not) a game!"
	
	--WHOOP WHOOP PULL OVAH THAT BRASS TOO FAT
	realnames["bm_melee_detector"] = "Garrett Handheld Metal Detector"
	realnames["bm_melee_detector_desc"] = "You should probably leave this thing off if you plan on taking it with you on your next job.\n\nUnless you plan on wreaking havoc from the get go, then by all means go ahead and have fun."
	
	realnames["bm_armor_level_5"] = "Flak Jacket A Bigger Shit"
	realnames["bm_armor_level_6"] = "Combined Tactical Vest A Shit"
	
	realnames["bm_menu_custom"] = "Internal Mod"
	realnames["bm_menu_extra"] = "Rail"
	realnames["bm_menu_upper_reciever"] = "Upper Body Mod"
	realnames["bm_menu_lower_reciever"] = "Lower Body Mod"
	realnames["bm_menu_slide"] = "Barrel/Slide"
	realnames["bm_menu_grip"] = "Pistol Grip"
	realnames["bm_menu_barrel_ext"] = "Barrel Extension"
	realnames["bm_menu_foregrip"] = "Handguard"
	realnames["bm_menu_sight"] = "Optic"
	
	--pseudo-catagories
	realnames["menu_anti_mat"] = "Anti Materiel Rifles"
	realnames["menu_pdw"] = "PDWs"
	realnames["menu_mach_pis"] = "Machine Pistols"
	realnames["menu_battle_rifle"] = "Battle Rifles"
	realnames["menu_carbine"] = "Carbines"
	realnames["menu_gpmg"] = "General Purpose Machine Guns"
	realnames["menu_revolvo"] = "Revolvers"
	
	realnames["menu_lmg"] = "Light Machine Guns"
	realnames["menu_shotgun"] = "Shotguns"
	realnames["menu_assault_rifle"] = "Assault Rifles"
	realnames["menu_snp"] = "Rifles"
	realnames["menu_smg"] = "Sub-Machine Guns"
	
	realnames["menu_jowi"] = "Wick"
	
	--Compatibility with SC's mod(s)
	realnames["menu_smg_master_desc_sc"] = "BASIC: ##1 point / $56,500##\nIncreases your reload speed of SMG weapons by ##35%##.\n\nACE: ##3 points / $168,500##\nYou deal ##15%## more damage with SMG weapons.\n\n\Increases your rate of fire with SMGs by ##20%.##"

	--Compatibility with lekousin's ArmorOverhaul
	realnames["bm_menu_regen"] = "Regen per second"
	realnames["bm_menu_deflect_min_dmg"] = "Dmg max deflect"
	realnames["bm_menu_deflect_min_procent"] = "Max deflect chance"
	realnames["bm_menu_deflect_max_dmg"] = "Dmg min deflect"
	realnames["bm_menu_deflect_max_procent"] = "Min deflect chance"
	realnames["bm_menu_hdr_min_dmg"] = "Min HDR dmg"
	realnames["bm_menu_hdr_min_procent"] = "Min HDR value"
	realnames["bm_menu_hdr_max_dmg"] = "Max HDR dmg"
	realnames["bm_menu_hdr_max_procent"] = "Max HDR value"
	realnames["bm_menu_explosion_damage_reduction"] = "Explosion damage reduction"
	realnames["bm_menu_ammo_mul"] = "Ammo multiplier"
	
    if realnames[string_id] then return realnames[string_id] end
    return LocalizationManager_text(self, string_id, macros)
end