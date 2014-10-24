--[[
v0.4.2.2
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

if not ReelNames then

if not LocalizationManager then return end

--Real weapon names, code base thanks to hejoro, IDing by imfdb (Weapons), Payday Wikia (Leupold/Theia Scope) and DMC, /k/-anon, and Steam friends (Other unidentified attachments)
LocalizationManager_text = LocalizationManager_text or LocalizationManager.text
function LocalizationManager:text( string_id, macros )
    local realnames = {}
	
	--[[Gold AK.762]]
	realnames["bm_w_akm_gold"] = "Golden AKMS"
	
	--[[AMCAR]]
	realnames["bm_w_amcar"] = "Colt M733 Commando"
	
	--[[AK Rifle]]
	realnames["bm_w_ak74"] = "Concern Kalashnikov AKS-74"
	
	--[[CAR-4]]
	realnames["bm_w_m4"] = "Colt M4A1" --"Safety Pins"
	--Suppressed Barrel
	realnames["bm_wp_m4_uupg_b_sd"] = "Internal Suppressor" 
	--Aftermarket
	realnames["bm_wp_m4_uupg_fg_lr300"] = "LR300 Handguard"
	--Competition
	realnames["bm_wp_upg_fg_jp"] = "JPE Modular Handguard"
	--Gazelle
	realnames["bm_wp_upg_fg_smr"] = "Geissele Super Modular Rail"
	
	--[[UAR]]
	realnames["bm_w_aug"] = "Steyr AUG A2"
	--A3 Tact. Foregrip
	realnames["bm_wp_aug_fg_a3"] = "A3 Rail"
	
	--[[CLARION]]
	realnames["bm_w_famas"] = "M16" --"Nexter FAMAS" --"IS THAT A DEAGLE?"
	--Retro Grip
	realnames["bm_wp_famas_g_retro"] = "G2 Guard"
	
	--[[AK.762]]
	realnames["bm_w_akm"] = "Concern Kalashnikov AKMS"
	
	--[[JP36]]
	realnames["bm_w_g36"] = "Heckler & Koch G36C" --"Meltgun"
	--Compact
	realnames["bm_wp_g36_fg_c"] = "Carbine Handguard"
	--Polizei
	realnames["bm_wp_g36_fg_ksk"] = "Knights Armament Co. RAS Handguard"  
	--Solid Stock
	realnames["bm_wp_g36_s_kv"] = "G36KV Stock"
	--Sniper Stock
	realnames["bm_wp_g36_s_sl8"] = "SL8 Stock"
	
	--[[M308]]
	realnames["bm_w_m14"] = "Springfield M14 DMR" --"Pun Master"
	--Abraham
	realnames["bm_wp_m14_body_ebr"] = "MK.14 Kit"
	--Seid ihr das Essen? Nein, wir sind der Jaeger! (watch better anime)
	realnames["bm_wp_m14_body_jae"] = "M14 JAE Stock"
	
	--[[AK5]]
	realnames["bm_w_ak5"] = "Bofors AK5" --"FNC's sexy swedish cousin"
	--Karbin Ceres
	realnames["bm_wp_ak5_fg_ak5c"] = "AK5c Handguard"
	--Belgian Heat
	realnames["bm_wp_ak5_fg_fnc"] = "FN FNC Handguard"
	--Bertil
	realnames["bm_wp_ak5_s_ak5b"] = "AK5b Stock"
	--Caesar
	realnames["bm_wp_ak5_s_ak5c"] = "AK5c Stock"
	
	--[[AMR-16]]
	realnames["bm_w_m16"] = "Colt M16A3" --"Orange Slices", "IS THAT A FAMAS?"
	--going against imfdb here, simply for the fact the the flat top receiver isn't limited to the A4 and that the AMR bares more resemblence to the A3 (default handguard, automatic fire)
	--Railed
	realnames["bm_wp_m16_fg_railed"] = "Daniel Defense Lite Rail" --not a carbon copy, just based off of, if only for the delta ring
	--Blast to the Past
	realnames["bm_wp_m16_fg_vietnam"] = "M16A1 Handguard"
	
	--[[553 Commando]]
	realnames["bm_w_s552"] = "SIG SG 552" --"SG550's Little Sister"
	--Enhanced Foregrip
	realnames["bm_wp_ass_s552_fg_standard_green"] = "Enhanced Handguard"
	--Enhanced Grip
	realnames["bm_wp_ass_s552_g_standard_green"] = "Enhanced Pistol Grip"
	--Enhanced Stock
	realnames["bm_wp_ass_s552_s_standard_green"] = "Enhanced Stock"
	--Railed Foregrip
	realnames["bm_wp_ass_s552_fg_railed"] = "Railed Handguard" --pretty sure Sig manufactures their own rails for the 552/3. Can't be bothered to look :/
	--Heat Treated
	realnames["bm_wp_ass_s552_body_standard_black"] = "Black Receiver" --GJ, Overkill. Heat treating metal, while it does make it harder, also makes it more brittle. Pretty sure you don't want that in a gun
	
	--[[Eagle Heavy]]
	realnames["bm_w_scar"] = "FN MK.17"
	--Sniper Stock
	realnames["bm_wp_scar_s_sniper"] = "MK.20 Stock"
	--Rail Extension
	realnames["bm_wp_scar_fg_railext"] = "PWS SCAR Rail Extension"
	
	--[[Falcon]]
	realnames["bm_w_fal"] = "Faru Nee-san"--"FN FAL"
	--CQB
	realnames["bm_wp_fal_body_standard"] = "DSA SA58 Handguard w/ Short Barrel" --this might conflict with something since this is also the name_id of the receiver
	--Retro
    realnames["bm_wp_fal_fg_03"] = "IMI Romat Handguard"
	--Marksman
    realnames["bm_wp_fal_fg_04"] = "DSA Freefloat Handguard"
	--Wood
    realnames["bm_wp_fal_fg_wood"] = "Wooden Handguard"
	--Tactical Grip
	realnames["bm_wp_fal_g_01"] = "Tapco FAL/SAW Pistol Grip"
	--Extended Mag
    realnames["bm_wp_fal_m_01"] = "30rnd Magazine"
	--Folding
    realnames["bm_wp_fal_s_01"] = "Sidefolding Stock"
	--Marksman
    realnames["bm_wp_fal_s_03"] = "Magpul FAL PRS Stock"
	
	--[[Gecko]]
	realnames["bm_w_galil"] = "Galil-chan" --"IMI Galil ARM"
	--Sniper
	realnames["bm_wp_galil_fg_sniper"] = "IMI Galatz Handguard & Heavy Barrel"
	--Light
	realnames["bm_wp_galil_fg_sar"] = "IMI Galil SAR Handguard & 13\" Barrel"
	--CQB
	realnames["bm_wp_galil_fg_mar"] = "IMI Galil MAR Handguard & 7\" Barrel"
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
	
	--[[Gewehr]]
	realnames["bm_w_g3"] = "Jiisuri <3"--"Heckler & Koch G3" --"Mai Raifu"
	--Assault Kit
	realnames["bm_wp_g3_b_short"] = "Short Barrel"
	--DMR Kit
	realnames["bm_wp_g3_b_sniper"] = "PSG-1 Barrel"
	--PSG Foregrip
	realnames["bm_wp_g3_fg_psg"] = "PSG-1 Handguard"
	--Railed Foregrip
	realnames["bm_wp_g3_fg_railed"] = "FAB Defence G3-RS Handguard"
	--Retro Foregrip
	realnames["bm_wp_g3_fg_retro"] = "Wooden Slimline Handguard"
	--Plastic Retro Foregrip
	realnames["bm_wp_g3_fg_retro_plastic"] = "Slimline Handguard"
	--Retro Grip
	realnames["bm_wp_g3_g_retro"] = "Ergo Grip"
	--Sniper Grip
	realnames["bm_wp_g3_g_sniper"] = "PSG-1 Pistol Grip"
	--Sniper Stock
	realnames["bm_wp_g3_s_sniper"] = "PSG-1 Stock"

	
	--[[Rattlesnake]]
	realnames["bm_w_msr"] = "Remington MSR"
	--Suppressor
	realnames["bm_wp_snp_msr_ns_suppressor"] = "AAC TiTAN-QD Suppressor"
	--Aluminum Body
	realnames["bm_wp_msr_body_msr"] = "MSR Aluminum Stock & Receiver"
	
	--[[R93]]
	realnames["bm_w_r93"] =  "BLAZE IT R420" --"Blaser R93 Tactical 2"
	--Wooden Body
	realnames["bm_wp_r93_body_wood"] = "Long Range Sporter 2 Stock"
	
	--[[Thanatos]]
	realnames["bm_w_m95"] = "Barrett M95"
	--Tank Buster
	realnames["bm_wp_m95_b_barrel_long"] = "Long Barrel w/ AW50F Muzzle Brake"
	
	--[[Reinfeld 880]]
	realnames["bm_w_r870"] = "Remington Model 870"
	--Extended Mag
	realnames["bm_wp_r870_m_extended"] = "Extended Tube Magazine (+2 Rounds)"
	--Zombie Hunter
    realnames["bm_wp_r870_fg_wood"] = "Wooden Pump"
	--Short Enough **don't know
	realnames["bm_wp_r870_s_nostock"] = "Stockless Pistol Grip"
	--Short Enough Tact. **don't know
	realnames["bm_wp_r870_s_nostock_big"] = "Stockless Pistol Grip w/ Full Length Rail"
	--Govt. Stock **don't know
	realnames["bm_wp_r870_s_solid_big"] = "Solid Stock w/ Full Length Rail"
	
	--[[IZHMA 12G]]
	realnames["bm_w_saiga"] = "Concern Kalashnikov Saiga-12K" --"Nyaa! I'm a Cat!"
	--Tact. Russian
	realnames["bm_wp_saiga_fg_lowerrail"] = "Ultimak AK Modular Rail Forend System"
	--Saiga 20 rounder
	realnames["bm_wp_saiga_m_20rnd"] = "20rnd Drum"
	
	--[[M1014]]
	realnames["bm_w_benelli"] = "Benelli M4"
	--Long Barrel
	realnames["bm_wp_ben_b_long"] = "Long Barrel w/ 7-Shot Tube"
	--Short Barrel
	realnames["bm_wp_ben_b_short"] = "NFA Barrel w/ 4-Shot Tube"
	--Collapsed Stock
	realnames["bm_wp_ben_s_collapsed"] = "Collapsed M1014 Stock"
	--Solid Stock
	realnames["bm_wp_ben_fg_standard"] = "Solid Stock" --same deal with the FAL, possible conflict
	
	--[[RAVEN]]
	realnames["bm_w_ksg"] = "Kel-Tec KSG" --"Kel-Tec Crap"
	--Long Barrel
	realnames["bm_wp_ksg_b_long"] = "Long Barrel w/ 2x 8-Shot Tubes"
	--Short Barrel
	realnames["bm_wp_ksg_b_short"] = "Patrol Barrel w/ 2x 6-Shot Tubes"
	
	--[[STREET SWEEPER]]
	realnames["bm_w_striker"] = "Cobray Street Sweeper" --Hard to name this really, it has the drum key of the Cobray SS, the ejection system of the Protecta (although the Cobray SS can also have this) and the drum advance lever of the original Striker
	
	--[[LOCOMOTIVE]]
	realnames["bm_w_serbu"] = "Short Barrelled Remington Model 870"
	--Extended Mag
	realnames["bm_wp_shorty_m_extended_short"] = "Extended Tube Magazine (+1 Round)"
	--Standard
	realnames["bm_wp_r870_s_solid"] = "Solid Stock"
	--Police Shorty
	realnames["bm_wp_serbu_s_solid_short"] = "Solid Stock w/ Rail"
	--Tactical Shorty
	realnames["bm_wp_serbu_s_nostock_short"] = "Stockless Pistol Grip w/ Rail"
	
	--[[RPK]]
	realnames["bm_w_rpk"] = "Concern Kalashnikov RPK"
	--Tactical Forgrip
	realnames["bm_wp_rpk_fg_standard"] = "Polymer Handguard"
	--Plastic Stock
	realnames["bm_wp_rpk_s_standard"] = "Polymer Stock"
	
	--[[KSP]]
	realnames["bm_w_m249"] = "FN Paratrooper M249"
	--Railed Foregrip
	realnames["bm_wp_m249_fg_mk46"] = "MK.46 Handguard"
	--Solid Stock
	realnames["bm_wp_m249_s_solid"] = "M249 Stock"
	
	--[[Brenner]]
	realnames["bm_w_hk21"] = "Heckler & Koch HK21E" --"Related to mai raifu"
	--Short Foregrip
	realnames["bm_wp_hk21_fg_short"] = "Short Handguard"
	
	--[[Interceptor .45]]
	realnames["bm_w_usp"] = "Heckler & Koch USP Tactical"
	--Ventilated .45 **don't know
	--realnames["bm_wp_usp_co_comp_1"] = "Ventilated .45 Compensator" --I question the existence of this compensator
	--Velocity .45
	realnames["bm_wp_usp_co_comp_2"] = "SJC Compensator .45" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	realnames["bm_wp_pis_usp_m_extended"] = "20rnd Magazine"
	--Expert
	realnames["bm_wp_pis_usp_b_expert"] = "USP Expert Slide"
	--Match
	realnames["bm_wp_pis_usp_b_match"] = "USP Match Slide"
	
	--[[Chimano Custom]]
	realnames["bm_w_g22c"] = "Grenade 22c" --"Glock 22c"
	--Long Slide
	realnames["bm_wp_g22c_b_long"] = "Grenade 35 Compensated Slide" --"Glock 35 Compensated Slide"
	
	--[[Chimano 88]]
	realnames["bm_w_glock_17"] = "Grenade 17" --"Glock 17"
	
	realnames["bm_wp_pis_g26"] =  "Grenade 26" --"Glock 26"
	realnames["bm_w_jowi"] =  "Akimbo Grenade 26s" --"Akimbo Glock 26s"
	
	realnames["bm_wp_g26_body_salient"] =  "Stipled Tan Frame"
	realnames["bm_wp_g26_b_custom"] =  "Brushed Metal Frame"
	realnames["bm_wp_g26_m_custom"] =  "Stipled Tan Magazine"
	
	--[[Crosskill]]
	realnames["bm_w_colt_1911"] = "Springfield Operator 1911" 
	realnames["bm_w_x_1911"] = "Akimbo Springfield Operator 1911s" 
	--Aggressor
	realnames["bm_wp_1911_co_2"] = "TCII Compensator" --Not 100% but seems to be based off of it
	--Punisher
	realnames["bm_wp_1911_co_1"] = "Clark Heavy Pinmaster" --Not 100% but seems to be based off of it
	--Long
	realnames["bm_wp_1911_b_long"] = "Compensated Long Barrel & Slide" 
	--Vented
	realnames["bm_wp_1911_b_vented"] = "Compensated Two-Tone Slide"
	realnames["bm_wp_1911_m_extended"] = "12rnd Extendo Clip" --"12rnd Magazine"
	
	--[[Bernetti 9]]
	realnames["bm_w_b92fs"] = "Beretta 92FS"
	realnames["bm_w_x_b92fs"] = "Akimbo Beretta 92FSs"
	--Professional
	realnames["bm_wp_beretta_co_co1"] = "SGS Compensator" --Original name was a reference to the movie "The Professional"
	--Competitor
	realnames["bm_wp_beretta_co_co2"] = "Competition Compensator" --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models were based off of airsoft counterparts
	--Extended Mag
	realnames["bm_wp_beretta_m_extended"] = "30rnd Clipanzine" --"30rnd Magazine"
	--Elite Slide
	realnames["bm_wp_beretta_sl_brigadier"] = "Brigadier Elite Slide"
	
	--[[Bronco]]
	realnames["bm_w_raging_bull"] = "Taurus Raging Bull"
	--Mount
	realnames["bm_wp_pis_rage_extra"] = "Raging Bull Scope Mount"
	--Aggressor
	realnames["bm_wp_rage_b_comp1"] = "S&W V-Compensator"
	--Pocket
	realnames["bm_wp_rage_b_short"] = "Snub Nose Barrel"
	--Ventilated
	realnames["bm_wp_rage_b_comp2"] = "S&W Muzzle Compensator"
	--Overcompensating
	realnames["bm_wp_rage_b_long"] = "Long Barrel"
	
	--[[Judge]]
	realnames["bm_w_judge"] = "Taurus Judge"
	
	--[[Stryk 18]]
	realnames["bm_w_glock_18c"] =  "Grenade 18c" --"Glock 18c"
	--Ventilated **don't know
	--realnames["bm_wp_g18c_co_1"] = "Ventilated Compensator" --I question the existence of this compensator
	--Velocity
	realnames["bm_wp_g18c_co_comp_2"] = "SJC Compensator 9mm"
	
	--[[Deagle]]
	realnames["bm_w_deagle"] = "FAMAS" --"IMI Desert Eagle Mark XIX" --"IS THAT A M16?"
	realnames["bm_w_x_deagle"] = "Akimbo FAMASs" --"Akimbo IMI Desert Eagles"
	--Mount
	realnames["bm_wp_pis_deagle_extra"] = "Desert Eagle Scope Mount"
	--La Femme
	realnames["bm_wp_deagle_co_short"] = "Desert Eagle Muzzle Brake" --Original name was a reference to a 1990s film only for the gun's appearance in it, otherwise this is based on a real attachment
	--Overkill
	realnames["bm_wp_deagle_co_long"] = "Custom Barrel Weight" --Attachment is a reference to the Boondock Saints
	--Extended Mag
	realnames["bm_wp_deagle_m_extended"] = "10rnd Clip" --"10rnd Magazine" --Given the length of the mag and considering the .50 AE variant is single stack only, this is the only choice. Not that it matters that there's more ammo than what's stated *cough* 1911 12rnd Mag *cough*
	--Long Barrel
	realnames["bm_wp_deagle_b_long"] = "10\" Long Barrel"
	
	
	--[[Gruber Kurz]]
	realnames["bm_w_ppk"] = "Walther PPK"
	--Laser Grip
	realnames["bm_wp_pis_ppk_g_laser"] = "Crimson Trace Laser Grip"
	--Long Side
	realnames["bm_wp_pis_ppk_b_long"] = "PPKS Slide"
	
	--[[Signature .40]]
	realnames["bm_w_p226"] = "Sig Sauer P226R"
	--Ventilated .40 **don't know
	--realnames["bm_wp_p226_co_comp_1"] = "Ventilated .40 Compensator" --I question the existence of this compensator
	--Velocity .40
	realnames["bm_wp_p226_co_comp_2"] = "SJC Compensator .40" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	realnames["bm_wp_p226_m_extended"] = "22rnd Ammobox"--"22rnd Magazine" --Not too sure if this exists, just basing it off of the fact the "22" is plastered all over the damn thing
	--Two-Tone
	realnames["bm_wp_p226_b_equinox"] = "Equinox Duo-Tone Slide"
	--Long Slide
	realnames["bm_wp_p226_b_long"] = "Brushed Metal Long Slide"

	--[[Mark-10]]
	realnames["bm_w_mac10"] = "Ingram M10" --"Emten"
	--Extended Mag
	realnames["bm_wp_mac10_m_extended"] = "30rnd Clip"--"30rnd Magazine"
	--Railed Handguard
	realnames["bm_wp_mac10_body_ris"] = "MAC Rail System" --I'm getting nothing but airsoft results so generic name
	--Skeletal Stock
	realnames["bm_wp_mac10_s_skel"] = "Low Mount Skeleton Stock"
	
	--[[Compact-5]]
	realnames["bm_w_mp5"] = "Heckler & Koch MP5A4" --"Empi"
	--Sehr Kurze
	realnames["bm_wp_mp5_fg_m5k"] = "MP5k Railed Handguard"
	--Polizei Tactical
	realnames["bm_wp_mp5_fg_mp5a5"] = "MP5 Railed Handguard"
	--Ninja
	realnames["bm_wp_mp5_fg_mp5sd"] = "MP5SD Handguard & Suppressor"
	--Adjustable
	realnames["bm_wp_mp5_s_adjust"] = "Retractable Stock"
	--Bare Essentials
	realnames["bm_wp_mp5_s_ring"] = "No Stock"
	--MP5 Drum
	realnames["bm_wp_mp5_m_drum"] = "110rnd GSG-5 .22lr Magazine"

	--[[CMP]]
	realnames["bm_w_mp9"] = "Brugger & Thomet TP9" --"Tama-chan"
	--Extended Mag
	realnames["bm_wp_mp9_m_extended"] = "30rnd Extended Clip" --"30rnd Magazine"
	--Skeletal Stock
	realnames["bm_wp_mp9_s_skel"] = "Steyr TMP Solid Stock"
	
	--[[Skorpion]]
	realnames["bm_w_scorpion"] = "Klobb" --"Skorpion vz. 61"
	realnames["bm_wp_scorpion_m_extended"] = "Dual Magazines"
	
	--[[Uzi]]
	realnames["bm_w_uzi"] = "IMI Uzi"
	realnames["bm_wp_uzi_s_solid"] = "Wooden Stcok"
	realnames["bm_wp_uzi_fg_rail"] = "FAB Defence Uzi Tri-Rail System"
	
	--[[TEC-9]]
	realnames["bm_w_tec9"] = "Intratec TEC-9"
	realnames["bm_wp_tec9_b_standard"] = "AB-10 Barrel"
	realnames["bm_wp_tec9_ns_ext"] = "The shoulder thing that goes up" --"TEC-9 Barrel Extension"
	realnames["bm_wp_tec9_s_unfolded"] = "Interdynamic MP-9 Wire Stock"
	realnames["bm_wp_tec9_m_extended"] = "50rnd Magazine"
	
	--[[Para SMG]]
	realnames["bm_w_olympic"] = "Olympic Arms K23B Tactical"
	--Railed Handguard
	realnames["bm_wp_olympic_fg_railed"] = "Vector Optics SCRA RAS" --a super short version at that, shares the delta ring so I'm assuming this is what it's based off of
	--Shorter Than Short
	realnames["bm_wp_olympic_s_short"] = "Buffer Tube" 
	
	--[[Krinkov]]
	realnames["bm_w_akmsu"] = "Concern Kalashnikov AKMSU"
	--Moscow Special
	realnames["bm_wp_akmsu_fg_rail"] = "Samson K-Rail" --Seems to be loosely based off of the Samson K-Rail, it's the only thing that looked remotely like this
	
	--[[Kobus 90]]
	realnames["bm_w_p90"] = "FN P90 TR"
	--Long Barrel
	realnames["bm_wp_p90_b_long"] = "PS90 Barrel"
	
	--[[Swedish K]]
	realnames["bm_w_m45"] = "Carl Gustav M/45"
	--Extended Mag
	realnames["bm_wp_smg_m45_m_extended"] = "50rnd Magazine"
	
	--[[SpecOps]]
	realnames["bm_w_mp7"] = "Heckler & Koch MP7A2"
	--Airsoft Supressor
	realnames["bm_wp_mp7_b_suppressed"] = "QD \"Power-Up\" MP7 Suppressor"	
	--Extended Mag
	realnames["bm_wp_mp7_m_extended"] = "40rnd Clips" --"40rnd Magazine"
	--Extended Stock
	realnames["bm_wp_mp7_s_long"] = "Extended Stock"
	
	--[[GL40]]
	realnames["bm_w_gre_m79"] = "Springfield Armory M79"
	
	--Exotique Receiver
	realnames["bm_wp_m4_upper_reciever_edge"] = "VLTOR Upper Receiver"
	
	--Descriptions are gone (for now) so I figured I'd change their names to reflect that they're locking the firemode
	--Single Fire
	realnames["bm_wp_upg_i_singlefire"] = "Single Fire Lock"
	realnames["bm_wp_upg_i_singlefire_desc"] = "Locks the fire mode for this gun to semi-auto"
	--Auto Fire
	realnames["bm_wp_upg_i_autofire"] = "Automatic Fire Lock"
	realnames["bm_wp_upg_i_autofire_desc"] = "Locks the fire mode for this gun to full-auto"
	
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

	--Low Profile Suppressor
	realnames["bm_wp_upg_ns_ass_smg_small"] = "GemTech HALO Suppressor" --not 100% but I can't find any other suppressor that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
	realnames["bm_wp_upg_ns_ass_smg_small_desc"] = "A small, concealable suppressor. Nothing else."
	--Medium Suppressor
	realnames["bm_wp_upg_ns_ass_smg_medium"] = "Small Arms Industries M80 Suppressor" --Thanks Overkill for being vauge as fuck, I'm surprised I even found this
	realnames["bm_wp_upg_ns_ass_smg_medium_desc"] = "A slightly more visible suppressor that's large enough to reduce recoil."
	--Bigger the Better **Don't know
	--realnames["bm_wp_upg_ns_ass_smg_large"] = "The Bigger the Better Suppressor"
	realnames["bm_wp_upg_ns_ass_smg_large_desc"] = "A large suppressor, you can't hide that fact. Long and heavy enough to reduce spread and recoil."
	
	--Size Doesn't Matter 
	realnames["bm_wp_upg_ns_pis_small"] = "Thompson Machine Poseidon Suppressor"	
	--Standard Issue
	realnames["bm_wp_upg_ns_pis_medium"] = "GemTech SFN Suppressor" --Close enough... it's sectioned similarly enough for me to just name it this
	--Monolith 
	realnames["bm_wp_upg_ns_pis_large"] = "Silencerco Osprey Suppressor"
	realnames["bm_wp_upg_ns_medium_gem"] = "GemTech Blackside Suppressor"
	realnames["bm_wp_upg_ns_large_kac"] = "KAC MK.23 Suppressor"
	
	realnames["bm_wp_upg_ns_meatgrinder"] = "Tenderizer Muzzle Device"
	
	--Stubby **Don't know
	--realnames["bm_wp_upg_ns_ass_smg_stubby"] = "Stubby Compensator"
	--Tank **Don't know, could quite literally be a tank compensator
	realnames["bm_wp_upg_ns_ass_smg_tank"] = "Tank Compensator"
	--Firebreather
	realnames["bm_wp_upg_ns_ass_smg_firepig"] = "Noveske KX3 Compensator"
	
	--Competitors
	realnames["bm_wp_upg_ass_ns_jprifles"] = "JPE Bennie Cooley Muzzle Brake"
	--Funnel of Fun
	realnames["bm_wp_upg_ass_ns_linear"] = "KIES Blast Master Linear Compensator"
	--Tactical
	realnames["bm_wp_upg_ass_ns_surefire"] = "Surefire MBK Muzzle Brake"
	
	--Muldon
	realnames["bm_wp_r870_s_folding"] = "R870 Top Folding Stock"
	
	--Standard
	realnames["bm_wp_m4_s_standard"] = "Bushmaster LE Stock"
	--Tactical
	realnames["bm_wp_m4_s_pts"] = "Magpul PTS Stock"
	--Folding
	realnames["bm_wp_m4_uupg_s_fold"] = "LR300 Stock"
	--Wide
	realnames["bm_wp_upg_m4_s_crane"] = "NSWC Crane Stock"
	--War-Torn
	realnames["bm_wp_upg_m4_s_mk46"] = "NSWC Crane Stock w/ Cheek Pad" --looking at it now, the rudimentary cheek pad is generally useless since you hold the gun right handed (so you make a cheekweld with the left side of the gun) and the pad is mostly on the right. GJ Overkill.
	
	--Folding Stock (underfolder)
	realnames["bm_wp_ak_s_folding"] = "Folding AK Stock"
	--Folding Stock (sidefolder)
	realnames["bm_wp_ak_s_skfoldable"] = "Folding AK Stock"
	--Wooden Sniper Stock
	realnames["bm_wp_ak_s_psl"] = "PSL Stock"
	
	--Ergo (Glocks)
	realnames["bm_wp_g18c_g_ergo"] = "Hogue Handall Grip Sleeve"
	--Ergo
	realnames["bm_wp_m4_g_ergo"] = "Command Arms UPG16 Pistol Grip"
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
	
	--Extended Mag (Glocks)
	realnames["bm_wp_g18c_m_mag_33rnd"] = "33/22rnd Magazine (9mm/.40S&W)"	
	--Vintage Mag
	realnames["bm_wp_m4_m_straight"] = "20rnd STANAG Clipazine" --"20rnd STANAG Magazine" --Hesitant to call them this since they're so off-model and resemble the M4A1 mags used in MW3
	--Milspec Mag
	realnames["bm_wp_m4_uupg_m_std"] = "30rnd Clip Magazine" --"30rnd STANAG Magazine"	
	--Tactical Mag
	realnames["bm_wp_m4_m_pmag"] = "31rnd Magpul PMAG Magazine" --you can actually shove 31 rounds into one of the PMAG models and still have it load
	--CAR Quad
	realnames["bm_wp_upg_m4_m_quad"] = "60rnd DAKKA Magazine" --"60rnd Surefire Magazine"
	--AK Quad
	realnames["bm_wp_upg_ak_m_quad"] = "60rnd Concern Kalashnikov Magazine"
	--Beta-C
	realnames["bm_wp_m4_m_drum"] = "100rnd Beta-C Magazine"
	--AK Drum
	realnames["bm_wp_ak_m_drum"] = "75rnd Drum Magazine"
	
	--Pistol Red Dot
	realnames["bm_wp_upg_o_rmr"] = "Trijicon RMR Red Dot"
	
	--Military Red Dot
	realnames["bm_wp_upg_o_aimpoint"] = "Aimpoint PRO Red Dot"
	realnames["bm_wp_upg_o_aimpoint_desc"] = "Aimpoint PRO Red Dot"
	--Holographic
	realnames["bm_wp_upg_o_eotech"] = "EOTech 553 Holographic Sight"
	realnames["bm_wp_upg_o_eotech_desc"] = "EOTech 553 Holographic Sight"
	--Professional
	realnames["bm_wp_upg_o_t1micro"] = "Aimpoint Micro T-1 Red Dot"
	realnames["bm_wp_upg_o_t1micro_desc"] = "Aimpoint Micro T-1 Red Dot"
	--Surgeon
	realnames["bm_wp_upg_o_docter"] = "IRONDOT w/ Docter Sight II Plus Red Dot"
	realnames["bm_wp_upg_o_docter_desc"] = "IRONDOT w/ Docter Sight II Plus Red Dot"
	--ACOUGH
	realnames["bm_wp_upg_o_acog"] = "Trijicon ACOG Scope"
	realnames["bm_wp_upg_o_acog_desc"] = "Trijicon ACOG Scope"
	--Milspec
	realnames["bm_wp_upg_o_specter"] = "ELCAN Specter DR 1-4x Scope"
	realnames["bm_wp_upg_o_specter_desc"] = "ELCAN Specter DR 1-4x Scope"
	--See More
	realnames["bm_wp_upg_o_cmore"] = "C-More Railway Red Dot"
	realnames["bm_wp_upg_o_cmore_desc"] = "C-More Railway Red Dot"
	--Combat
	realnames["bm_wp_upg_o_cs"] = "Aimpoint CS Red Dot"
	realnames["bm_wp_upg_o_cs_desc"] = "Aimpoint CS Red Dot"
	--Compact Holo
	realnames["bm_wp_upg_o_eotech_xps"] = "EOTech XPS3 Holographic Sight"
	realnames["bm_wp_upg_o_eotech_xps_desc"] = "EOTech XPS3 Holographic Sight"
	--Speculator
	realnames["bm_wp_upg_o_reflex"] = "Sightmark Sureshot Red Dot" --super generic so I just went with what COD4 based it off of
	realnames["bm_wp_upg_o_reflex_desc"] = "Sightmark Sureshot Red Dot"
	--Trigonom
	realnames["bm_wp_upg_o_rx01"] = "Trijicon RX01 Red Dot"
	realnames["bm_wp_upg_o_rx01_desc"] = "Trijicon RX01 Red Dot"
	--Solar
	realnames["bm_wp_upg_o_rx30"] = "Trijicon RX30 Red Dot"	
	realnames["bm_wp_upg_o_rx30_desc"] = "Trijicon RX30 Red Dot"	
	--Theia
	realnames["bm_wp_upg_o_leupold"] = "Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS"
	realnames["bm_wp_upg_o_leupold_desc"] = "Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS"
	--45 irons
	realnames["bm_wpn_fps_upg_o_45iron"] = "XS Sights Angled Sights" --these are literally the worst things IRL, don't buy them for your gun if you have one and want angled sights to mount on it
	--Flip-Up (KSG sights)
	realnames["bm_wp_upg_o_mbus_rear"] = "Magpul MBUS Back-up Sights"
	realnames["dd_rear"] = "Daniel Defence Fixed Sight Combo"
	
	--AP Slug
	realnames["bm_wp_upg_a_slug"] = "Armor Piercing SABOT Slugs"
	realnames["bm_wp_upg_a_slug_desc"] = "A large slug capable of shooting through enemies, shields and thin surfaces. Shoot a single slug with increased damage, range and accuracy."
	--Birdshot (originally the free 000 Buck)
	realnames["bm_wp_upg_a_bird"] = "Birdshot"
	realnames["bm_wp_upg_a_bird_desc"] = "Tiny pellets that spread over a large area. Shoot 50 pellets (30 for the Judge) for greater pellet saturation. You find and carry more of this ammo.\nCAN CAUSE FPS DROPS ON LOW END SYSTEMS" 
	--000 Buck
	realnames["bm_wp_upg_a_custom"] = "000 Buck"
	realnames["bm_wp_upg_a_custom_desc"] = "Large diameter pellets with greater stopping power. Shoot 6 pellets (4 for the Judge) with 25% less range for increased damage in close range." 
	--Flechette
	realnames["bm_wp_upg_a_piercing"] = "Flechette Rounds"
	realnames["bm_wp_upg_a_piercing_desc"] = "Dart ammunition capable of penetrating armour. Shoot 15 darts (10 for the Judge) with 60% increased range and accuracy."
	--HE
	realnames["bm_wp_upg_a_explosive"] = "Fragmentation Rounds"
	realnames["bm_wp_upg_a_explosive_desc"] = "Fin stabilized rounds that explode on impact. Shoot explosives that can stun targets in its blast radius. You find and carry less of this ammo."
	
	--URSA
	realnames["bm_melee_kabar"] = "USMC KA-BAR"
	realnames["bm_melee_kabar_desc"] = "The most famous fixed blade knife in the World, the KA-BAR, was designed to serve US troops during World War II and is still doing its job, with honors, 70 years later.\n\nThis weapon can be charged to do more damage by holding the melee button."
	--Krieger
	realnames["bm_melee_kampfmesser"] = "KM 2000"
	realnames["bm_melee_kampfmesser_desc"] = "The official combat knife of the German Bundeswehr Armed Forces. The new series KM2000 is manufactured to exacting ISO standards with substantially improved cutting edge capacity.\n\nThis weapon can be charged to do more damage by holding the melee button."
	--Berger
	realnames["bm_melee_gerber"] = "Gerber DMF Folder"
	realnames["bm_melee_gerber_desc"] = "The manual opening DMF Folder brings the much sought after tactical innovations and technologies of the Automatic DMF to a large, ambidextrous-use knife. Textured G-10 handle gives the DMF Folder a sure grip and maintains a perfect weight balance.\n\nThis weapon can be charged to do more damage by holding the melee button."
	
	--Tomahawk
	realnames["bm_melee_tomahawk"] = "Gerber Downrange Tomahawk"
	realnames["bm_melee_tomahawk_desc"] = "When you're in a situation where time is of the essence, you can't waste time wondering if you have the right tool for the job. No matter what's on the other side of that door or barrier, you want a tool with the same single-minded determination as the man wielding it.\n\nThis weapon can be charged to do more damage by holding the melee button."
	--Machete
	realnames["bm_melee_becker"] = "KA-BAR Becker Tac Tool"
	realnames["bm_melee_becker_desc"] = "A design collaboration between Ethan Becker of BK&T and John Benner of TDI, the Tac Tool smashes, bashes, prys, hammers and cuts. It is equally powerful at lifting stubborn hinge pins, prying open doors or windows, and hammering out glass as it is efficient at cutting 550. cord.\n\nThis weapon can be charged to do more damage by holding the melee button."
	--Baton
	realnames["bm_melee_baton"] = "ASP Friction Loc Baton"
	realnames["bm_melee_baton_desc"] = "The ASP Friction Loc Baton is the most tactically sophisticated impact weapon currently available to law enforcement personnel. Tested by the most elite federal teams, the Friction Loc has proven itself virtually indestructible. \n\nAnd now you have it.\n\nThis weapon can be charged to do more damage by holding the melee button."
	
	--EMONE Toggle
	realnames["bm_melee_emone"] = "LODS OF EMONE"
	realnames["emone"] = "L-O-D-S OF E-M-O-N-E\nWhat's that spell?\nLOADSAMONEY!\n\nProb'ly.\n\nWOP IT OUT!\n\nThis wad of dosh can be charged to do more damage by holding the melee button."

	--TWD Bat toggle
	realnames["bm_melee_twd"] = "\"Lucille\""
	realnames["glenn"] = "A baseball bat that has been wrapped in barbed wire and given the name \"Lucille\". It's been said that Lucille was used to bash a man's skull in to teach some folks a lesson.\n\nPerhaps you could do the same and teach those cops a thing or two.\n\nThis weapon can be charged to do more damage by holding the melee button."
	
	--Bayonet
	realnames["bm_melee_bayonet"] = "AKM Type II Bayonet"	
	
	--Bullseye
	realnames["bm_melee_bullseye"] = "Smith & Wesson Bullseye Hatchet"	
	
	--X46
	realnames["bm_melee_x46"] = "Robson Knives X46 Utility Survival Knife"
	
	--Ding Dong
	realnames["bm_melee_dingdong"] = "Ooooh, you touch my tralala"--"Gerber Ding Dong Breaching Tool"
	
	--Cleaver
	realnames["bm_melee_cleaver"] = "Cleaver"
	
	--Machete
	realnames["bm_melee_machete"] = "Machete"
	
	--Tanto
	realnames["bm_melee_kabar_tanto"] = "KA-BAR Tanto"
	
	realnames["bm_menu_custom"] = "Internal Mod"
	realnames["bm_menu_extra"] = "Rail"
	realnames["bm_menu_upper_reciever"] = "Body Mod"
	realnames["bm_menu_lower_reciever"] = "Body Mod"
	realnames["bm_menu_slide"] = "Barrel/Slide"
	realnames["bm_menu_grip"] = "Pistol Grip"
	realnames["bm_menu_barrel_ext"] = "Barrel Extension"
	realnames["bm_menu_foregrip"] = "Handguard"
	realnames["bm_menu_sight"] = "Optic"
	realnames["bm_menu_magazine"] = "Clip"
	
	realnames["menu_lmg"] = "Light Machine Guns"
	realnames["menu_shotgun"] = "Shotguns"
	realnames["menu_pistol"] = "Pistols"
	realnames["menu_assault_rifle"] = "Assault Rifles & Carbines"
	realnames["menu_snp"] = "Sniper & Battle Rifles"
	realnames["menu_smg"] = "Sub-Machine Guns & PDWs"
	
    if realnames[string_id] then return realnames[string_id] end
    return LocalizationManager_text(self, string_id, macros)
end

ReelNames = true

end

