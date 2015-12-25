--[[
v1.5
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_stats_init = WeaponTweakData._init_stats
function WeaponTweakData:_init_stats()
	old_stats_init(self)
	
	--Mag capacity changes
	self.stats.extra_ammo = {}
	for i = -100, 100, 1 do
		table.insert( self.stats.extra_ammo, i )
	end
	
	--Total ammo multiplier
	self.stats.total_ammo_mod = {}
	for i = -200, 600, 1 do
		table.insert(self.stats.total_ammo_mod, i / 200)
	end--fixes the total_ammo_mod index so I can adjust in smaller increments


	--FOV zoom changes
	self.stats.zoom = { 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15 }
	
	--alters the damage index go up by a consistent value of 0.25
	self.stats.damage = {}
	for i = 0.25, 80, 0.25 do
		table.insert( self.stats.damage, i )
	end
	--[[
	Drawn out the table would look like this:
	
	self.stats.damage = {
		0.25,
		0.5,
		0.75,
		1.0,
		1.25,
		1.5,
		...
	And so on...
	
	0.25 = 2.5 damage in game
	]]
	
	--alters the stability/recoil index to get rid of the duplicate entries and make more fine adjustments (doing a for loop left me with rounding errors)
	--The contained values are multiplied with w/e the weapon's spread/kick value is
	local kick_n_spread = {'recoil','spread'}
	for i, stat_id in ipairs(kick_n_spread) do
	
		self.stats[stat_id] = {
			10,
			9.9,9.8,9.7,9.6,9.5,9.4,9.3,9.2,9.1,9.0,
			8.9,8.8,8.7,8.6,8.5,8.4,8.3,8.2,8.1,8.0,
			7.9,7.8,7.7,7.6,7.5,7.4,7.3,7.2,7.1,7.0,
			6.9,6.8,6.7,6.6,6.5,6.4,6.3,6.2,6.1,6.0,
			5.9,5.8,5.7,5.6,5.5,5.4,5.3,5.2,5.1,5.0,
			4.9,4.8,4.7,4.6,4.5,4.4,4.3,4.2,4.1,4.0,
			3.9,3.8,3.7,3.6,3.5,3.4,3.3,3.2,3.1,3.0,
			2.9,2.8,2.7,2.6,2.5,2.4,2.3,2.2,2.1,2.0,
			1.9,1.8,1.7,1.6,1.5,1.4,1.3,1.2,1.1,1.0,
			0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.025 --:^)
		}
	end
	
	self.stats.spread_moving = {}
	for i = -0.25, 5, 1 do
		table.insert( self.stats.spread_moving, i )
	end
	
end

local old_new_wep_init = WeaponTweakData._init_new_weapons
function WeaponTweakData:_init_new_weapons(...)
	old_new_wep_init(self,...)
	
	--[[
	VARIABLES AND TABLES FOR WEAPONS AND WHAT THEY DO
	
	self.**weapon_id**.category = "pistol"
		--What category the weapon is considered
			--Affects blackmarket categorization AND skill modifiers (if the weapon category has any, things like LMGs don't have any category based skill modifiers)
	
	self.**weapon_id**.kick.standing = {1.0, -1.0, -1.0, 1.0 }
		--Kick in degrees while standing
			--Values 1 and 2 are vertical recoil, positive goes up, negative goes down
			--Values 3 and 4 are horizontal recoil, positive goes left, negative goes right
			--These get multiplied by the current "recoil" index table value
	self.**weapon_id**.kick.crouching = self.**weapon_id**.kick.standing
		--Ditto but while crouching
	self.**weapon_id**.kick.steelsight = self.**weapon_id**.kick.standing
		--Ditto but while ADS
			
	self.**weapon_id**.spread.standing = 1 
		--Spread in degrees while standing and **NOT moving**
	self.**weapon_id**.spread.crouching = 1
		--Ditto but while crouching
	self.**weapon_id**.spread.steelsight = 1
		--Ditto but while ADS
		
	self.**weapon_id**.spread.moving_standing = 2
		--Spread in degrees while standing and **MOVING**
	self.**weapon_id**.spread.moving_crouching = 2
		--Ditto but while crouching
	self.**weapon_id**.spread.moving_steelsight = 2
		--Ditto but while ADS
	
	self.**weapon_id**.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		--Default muzzle effect your gun produces
		
	self.**weapon_id**.CLIP_AMMO_MAX = 30 
		--Default magazine capacity
	self.**weapon_id**.AMMO_MAX = 150 
		--Default total ammo
	
	self.**weapon_id**.rays = 8
		*ONLY WORKS FOR SHOTGUNS
		--Default pellet count 
	
	self.**weapon_id**.damage_near = 10
		--Distance in meters for how far you keep your max damage
	self.**weapon_id**.damage_far = 100
		--Distance in meters at which you hit minimum damage
	self.**weapon_id**.damage_min = 1.0
		*ONLY WORKS FOR NON-SHOTGUNS
		--Value for the lowest possible damage output for your weapon i.e. 1.0 = 10 damage, 2.5 = 25 damage, etc.
			
	
	self.**weapon_id**.shake.fire_multiplier = 1.25
		--Screen shake while HIPFIRING
			--Positive values pull to gun towards you, negative values push away, larger values in either direction make screen shake more violently
	self.**weapon_id**.shake.fire_steelsight_multiplier = -1.25
		--Same as above but while AIMING
	
	self.**weapon_id**.fire_mode_data.fire_rate = 0.23076923076923076923076923076923
		--Default RoF
			--RoF is calculated like this: 60/*desired RoF* i.e. 60/600 = 0.1 = 600 RPM
	
	self.**weapon_id**.stats_modifiers = {damage = 2,} 
		--Multiplies w/e stat(s) is/are contained in the table with the current index value
		
	self.**weapon_id**.stats.damage = 36 
		--index value you pull from the damage table. Higher values = Greater damage
	self.**weapon_id**.stats.spread = 17 
		--ditto but for spread/accuracy. Higher values = Tighter spread
	self.**weapon_id**.stats.recoil = 6	
		--ditto but for recoil/stability. Higher values = Lower recoil
	self.**weapon_id**.stats.suppression = 4 
		--ditto but for suppression/threat. Lower values = Greater threat
	]]
	
	--[[ TOGGLES ]]--
	--{
	if DMCWO.sniper_tracers == true then
	local squids = {"msr","wa2000","mosin","r93","m95",'model70'}
		for i, wep_id in ipairs(squids) do
			self[ wep_id ].has_trail = true
		end
	end
	
	if DMCWO.light_show == true then
		local ink = {'new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','r870','huntsman','benelli','ksg','serbu','striker','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','judge','famas','galil','g3','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','spas12','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000','cobray','b682','x_usp','x_g17','x_g22c','aa12','peacemaker','winchester1874','m134','mateba','sub2000','asval','polymer','wa2000','baka','par','sparrow','model70'}
		for i, wep_id in ipairs(ink) do
			self[ wep_id ].has_trail = true
		end
	end
	
	if DMCWO.debug_damage == true then
		local debug_damage = {'new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','r870','huntsman','benelli','ksg','serbu','striker','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','judge','famas','galil','g3','gre_m79','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','spas12','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000','m134','rpg7','cobray','b682','x_usp','x_g17','x_g22c','aa12','flamethrower_mk2','m32','plainsrider','peacemaker','winchester1874','mateba','sub2000','asval','polymer','wa2000','hunter','baka','par','sparrow','model70'}
		for i, wep_id in ipairs(debug_damage) do
			self[ wep_id ].ignore_damage_upgrades = true
		end
	end
	
	if DMCWO.vanilla_ammo ~= true then
		self.m32.AMMO_MAX = 6
		self.gre_m79.AMMO_MAX = 6
		
		self.m134.AMMO_MAX = 750
		
		self.glock_18c.AMMO_MAX = 153
		self.glock_17.AMMO_MAX = 153
		self.x_g17.AMMO_MAX = 187
		self.b92fs.AMMO_MAX = 150
		self.x_b92fs.AMMO_MAX = 180
		self.sparrow.AMMO_MAX = 144
		self.g26.AMMO_MAX = 150
		self.jowi.AMMO_MAX = 170
		self.tec9.AMMO_MAX = 160
		self.ppk.AMMO_MAX = 168
		self.g22c.AMMO_MAX = 120
		self.x_g22c.AMMO_MAX = 150
		self.p226.AMMO_MAX = 120
		self.hs2000.AMMO_MAX = 128
		self.colt_1911.AMMO_MAX = 96
		self.x_1911.AMMO_MAX = 112
		self.usp.AMMO_MAX = 96
		self.x_usp.AMMO_MAX = 120
		self.c96.AMMO_MAX = 120
		
		self.mateba.AMMO_MAX = 60
		self.new_raging_bull.AMMO_MAX = 42
		self.peacemaker.AMMO_MAX = 36
		self.deagle.AMMO_MAX = 28
		self.x_deagle.AMMO_MAX = 42
		self.judge.AMMO_MAX = 25
		
		self.scorpion.AMMO_MAX = 160
		self.mp9.AMMO_MAX = 150
		self.new_mp5.AMMO_MAX = 150
		self.m45.AMMO_MAX = 144 
		self.uzi.AMMO_MAX = 160
		self.sterling.AMMO_MAX = 160
		self.cobray.AMMO_MAX = 160
		self.mac10.AMMO_MAX = 100
		self.polymer.AMMO_MAX = 100
		self.m1928.AMMO_MAX = 100
		
		self.mp7.AMMO_MAX = 160
		self.p90.AMMO_MAX = 150
		
		self.olympic.AMMO_MAX = 150
		self.akmsu.AMMO_MAX = 90
		self.amcar.AMMO_MAX = 180
		self.g36.AMMO_MAX = 180
		self.s552.AMMO_MAX = 180
		self.sub2000.AMMO_MAX = 198
		
		self.famas.AMMO_MAX = 150
		self.vhs.AMMO_MAX = 150
		self.m16.AMMO_MAX = 150
		self.aug.AMMO_MAX = 150
		self.l85a2.AMMO_MAX = 150
		self.ak74.AMMO_MAX = 150
		self.akm.AMMO_MAX = 120
		self.akm_gold.AMMO_MAX = 120
		self.asval.AMMO_MAX = 160
		
		self.saiga.AMMO_MAX = 60
		self.aa12.AMMO_MAX = 56
		self.r870.AMMO_MAX = 36
		self.ksg.AMMO_MAX = 35 --counted in 7s (a single tube on the KSG)
		self.huntsman.AMMO_MAX = 26
		self.b682.AMMO_MAX = 26
		self.spas12.AMMO_MAX = 48
		self.benelli.AMMO_MAX = 45
		
		self.serbu.AMMO_MAX = 24
		self.striker.AMMO_MAX = 48
		
		self.scar.AMMO_MAX = 80
		self.g3.AMMO_MAX = 60
		self.fal.AMMO_MAX = 60
		self.galil.AMMO_MAX = 75
		self.new_m14.AMMO_MAX = 60
		
		self.m249.AMMO_MAX = 400
		self.rpk.AMMO_MAX = 300
		self.hk21.AMMO_MAX = 200
		self.par.AMMO_MAX = 200
		self.mg42.AMMO_MAX = 150
		
		self.msr.AMMO_MAX = 50
		self.wa2000.AMMO_MAX = 42
		self.model70.AMMO_MAX = 40
		self.mosin.AMMO_MAX = 30
		self.r93.AMMO_MAX = 24
		
		self.hunter.AMMO_MAX = 45
		
		self.plainsrider.AMMO_MAX = 50
		self.long.AMMO_MAX = 30
	end
	
	--}
	
	--[[ AMMO PICKUP RATES ]]
	--{
	local pis_other = {'mateba','c96'}
	for i, wep_id in ipairs(pis_other) do
		self[ wep_id ].AMMO_PICKUP = {0.60, 2.80}
	end
	
	local pis_44 = {'new_raging_bull'}
	for i, wep_id in ipairs(pis_44) do
		self[ wep_id ].AMMO_PICKUP = {0.50, 2.50}
	end
	
	local pis_50 = {'deagle','x_deagle'}
	for i, wep_id in ipairs(pis_50) do
		self[ wep_id ].AMMO_PICKUP = {0.40, 2.10}
	end
	
	local pis_45_colt = {'peacemaker','judge'}
	for i, wep_id in ipairs(pis_45_colt) do
		self[ wep_id ].AMMO_PICKUP = {0.30, 1.80}
	end
	
	local thirty_two = {'ppk','scorpion'}
	for i, wep_id in ipairs(thirty_two) do
		self[ wep_id ].AMMO_PICKUP = {2.00, 6.50}
	end
	
	local nine_mil = {'new_mp5','mp9','m45','glock_17','glock_18c','b92fs','tec9','uzi','sterling','g26','jowi','x_b92fs','cobray','x_g17','baka','sparrow'}
	for i, wep_id in ipairs(nine_mil) do
		self[ wep_id ].AMMO_PICKUP = {1.70, 5.80}
	end
	
	local its_not_10mm_auto = {'g22c','p226','x_g22c'}
	for i, wep_id in ipairs(its_not_10mm_auto) do
		self[ wep_id ].AMMO_PICKUP = {1.50, 5.40}
	end
	
	local forty_five = {'mac10','colt_1911','usp','m1928','x_1911','x_usp','polymer'} --UMP45 never :'(
	for i, wep_id in ipairs(forty_five) do
		self[ wep_id ].AMMO_PICKUP = {1.20, 5.00}
	end
	
	local pdw_ammo = {'p90','mp7'}
	for i, wep_id in ipairs(pdw_ammo) do
		self[ wep_id ].AMMO_PICKUP = {0.30, 3.50}
	end
	
	local shell_ammo = {'r870','serbu','benelli','ksg','striker','huntsman','spas12','b682'}
	for i, wep_id in ipairs(shell_ammo) do
		self[ wep_id ].AMMO_PICKUP = {0.40, 2.30}
	end
	self.saiga.AMMO_PICKUP = {0.30, 1.90}
	self.aa12.AMMO_PICKUP = {0.30, 1.90}
	
	local ammo_ar = {'olympic','m16','amcar','new_m4','ak5','s552','g36','aug','famas','l85a2','vhs'}
	for i, wep_id in ipairs(ammo_ar) do
		self[ wep_id ].AMMO_PICKUP = {0.90, 4.70}
	end
	self.m249.AMMO_PICKUP = {0.70, 4.00}
	
	local ammo_ak = {'akmsu','akm','akm_gold','ak74','rpk'}
	for i, wep_id in ipairs(ammo_ak) do
		self[ wep_id ].AMMO_PICKUP = {0.70, 4.40}
	end
	self.asval.AMMO_PICKUP = {0.60, 4.00}
	
	local ammo_762 = {'new_m14','scar','fal','galil','g3','msr'}
	for i, wep_id in ipairs(ammo_762) do
		self[ wep_id ].AMMO_PICKUP = {0.70, 2.60}
	end
	self.m134.AMMO_PICKUP = {0.50, 2.00}
	self.par.AMMO_PICKUP = {0.50, 2.00}
	self.hk21.AMMO_PICKUP = {0.50, 2.00}
	
	
	local ammo_300_win = {'wa2000','model70'}
	for i, wep_id in ipairs(ammo_300_win) do
		self[ wep_id ].AMMO_PICKUP = {0.50, 2.40}
	end
	
	self.mg42.AMMO_PICKUP = {0.40, 1.60}
	
	self.mosin.AMMO_PICKUP = {0.50, 1.70}
	
	self.r93.AMMO_PICKUP = {0.40, 0.90}
	self.winchester1874.AMMO_PICKUP = {0.40, 1.70}
	
	--}
	
	--[[ MUSCLE DECK "PANIC" PERCENT CHANCES ]]
	--{
	
	local babby_panic = {'mp7','p90','ppk','scorpion'}
	for i, wep_id in ipairs(babby_panic) do
		self[ wep_id ].panic_suppression_chance = 0.01
	end
	
	local low_panic = {'new_mp5','mp9','m45','glock_17','glock_18c','b92fs','uzi','g26','jowi','x_b92fs','plainsrider','hunter','baka','sparrow'}
	for i, wep_id in ipairs(low_panic) do
		self[ wep_id ].panic_suppression_chance = 0.015
	end
	
	local low2_panic = {'p226','g22c'}
	for i, wep_id in ipairs(low2_panic) do
		self[ wep_id ].panic_suppression_chance = 0.02
	end
	
	local low3_panic = {'mac10','usp','colt_1911','olympic','s552','g36','amcar','tec9','x_1911','m1928','polymer'}
	for i, wep_id in ipairs(low3_panic) do
		self[ wep_id ].panic_suppression_chance = 0.025
	end
	
	local mid_panic = {'new_m4','ak5','aug','m16','famas','akmsu','vhs'}
	for i, wep_id in ipairs(mid_panic) do
		self[ wep_id ].panic_suppression_chance = 0.05
	end
	
	local mid2_panic = {'ak74','m249','akm','akm_gold'}
	for i, wep_id in ipairs(mid2_panic) do
		self[ wep_id ].panic_suppression_chance = 0.075
	end
	
	local weed_panic = {'new_m14','scar','fal','galil','g3','rpk','m134','par'}
	for i, wep_id in ipairs(weed_panic) do
		self[ wep_id ].panic_suppression_chance = 0.10
	end
	
	local weed2_panic = {'benelli','saiga','serbu','striker','huntsman','r870','ksg','judge','spas12','hk21','mg42','b682','aa12','wa2000'}
	for i, wep_id in ipairs(weed2_panic) do
		self[ wep_id ].panic_suppression_chance = 0.125
	end
	
	local weed3_panic = {'new_raging_bull','msr','peacemaker','winchester1874'}
	for i, wep_id in ipairs(weed3_panic) do
		self[ wep_id ].panic_suppression_chance = 0.15
	end
	
	local spooky_panic = {'deagle','r93','x_deagle'}
	for i, wep_id in ipairs(spooky_panic) do
		self[ wep_id ].panic_suppression_chance = 0.20
	end
	
	local its2spooky_panic = {'gre_m79','m95','rpg7','flamethrower_mk2','m32'}
	for i, wep_id in ipairs(its2spooky_panic) do
		self[ wep_id ].panic_suppression_chance = 0.30
	end
	
	--}
	
	--[[ OTHER ]]
	--{
	
	--Burst fire stuff
	local no_burst = {'glock_18c','mac10','m45','mp9','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','amcar','new_m4','m16','ak5','aug','saiga','new_m14','scar','fal','galil','g3','tec9','scorpion','uzi','sterling','m1928','l85a2','vhs','cobray','aa12','flamethrower_mk2','m32','asval','baka','c96','par','sparrow','model70','rpk'}
	for i, wep_id in ipairs(no_burst) do
		self[ wep_id ].BURST_FIRE = false
	end
	
	--Bullpup flag
	local bullpup = {'p90','ksg','l85a2','famas','vhs','aug','m95','wa2000'}
	for i, wep_id in ipairs(bullpup) do
		self[ wep_id ].is_bullpup = true
	end
	
	--Weapons that are loaded shell by shell
	local shell_loaded = {'r870','benelli','ksg','serbu','striker','spas12','peacemaker','winchester1874','huntsman','b682','gre_m79','m32'}
	for i, wep_id in ipairs(shell_loaded) do
		self[ wep_id ].rms = 0.85
	end
	
	--Bipod tweaks
	local bipod = {'rpk','m249','hk21','mg42','par'}
	for i, wep_id in ipairs(bipod) do
		self[ wep_id ].bipod_camera_spin_limit = 65
		self[ wep_id ].bipod_camera_pitch_limit = 25
		self[ wep_id ].bipod_weapon_translation = Vector3(-0, 12.5, -8)
	end
	
	--}
	
	
	--[[ GENERAL STATS ]]
	--{
	local standard_stat_shit = {'new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','r870','huntsman','benelli','ksg','serbu','striker','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','judge','famas','galil','g3','gre_m79','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','spas12','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000','m134','rpg7','cobray','b682','x_usp','x_g17','x_g22c','aa12','flamethrower_mk2','m32','plainsrider','peacemaker','winchester1874','mateba','sub2000','asval','polymer','wa2000','hunter','baka','frankish','arblast','long','par','sparrow','model70'}
	for i, wep_id in ipairs(standard_stat_shit) do
		self[ wep_id ].stats.zoom = 1
		self[ wep_id ].stats.alert_size = 7
		self[ wep_id ].stats.extra_ammo = 101
		self[ wep_id ].stats.total_ammo_mod = 201
	end
		
	local enable_cstw = {'new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','famas','galil','g3','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000','m134','cobray','x_usp','x_g17','x_g22c','peacemaker','winchester1874','mateba','sub2000','asval','polymer','baka','par','sparrow','model70'}
	for i, wep_id in ipairs(enable_cstw) do
		self[ wep_id ].can_shoot_through_wall = true
	end
	
	local enable_csts = {'mg42','hk21','new_m14','galil','fal','g3','scar','p90','mp7','x_deagle','deagle','peacemaker','new_raging_bull','m134','par','model70'}
	for i, wep_id in ipairs(enable_csts) do
		self[ wep_id ].can_shoot_through_shield = true
	end
	
	local enable_cste = {'new_raging_bull','deagle','colt_1911','usp','mac10','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','famas','galil','g3','x_deagle','x_1911','mg42','mosin','c96','m1928','l85a2','vhs','m134','x_usp','peacemaker','winchester1874','mateba','asval','polymer','par','model70'}
	for i, wep_id in ipairs(enable_cste) do
		self[ wep_id ].can_shoot_through_enemy = true
	end
	
	local ammo_32 = {'ppk','scorpion'}
	for i, wep_id in ipairs(ammo_32) do
		self[ wep_id ].penetration_power = 0.2 --percent of how much your weapon's current damage AT THE TIME OF IMPACT (drop-off will reduce penetration) translates to penetration distance (max of 55 cm)
		self[ wep_id ].penetration_damage = 0.4 --percent of how much damage is KEPT through surfaces
	end
		
	self.ppk.r_recover = 0.95
	self.ppk.r_speed = 55
	self.ppk.c_speed = 7
	self.scorpion.r_recover = 0.85
	self.scorpion.r_speed = 65
	self.scorpion.c_speed = 6.2
	
	local ammo_9mm = {'new_mp5','mp9','m45','glock_17','glock_18c','b92fs','tec9','uzi','sterling','g26','jowi','x_b92fs','cobray','x_g17','sub2000','baka','sparrow'}
	for i, wep_id in ipairs(ammo_9mm) do
		self[ wep_id ].penetration_power = 0.4
		self[ wep_id ].penetration_damage = 0.4
	end
	
	self.cobray.r_recover = 0.5
	self.cobray.r_speed = 120
	self.cobray.c_speed = 5.5
	self.mp9.r_recover = 0.9
	self.mp9.r_speed = 100
	self.mp9.c_speed = 5.8
	self.m45.r_recover = 0.8
	self.m45.r_speed = 70
	self.m45.c_speed = 5.8
	self.new_mp5.r_recover = 0.7
	self.new_mp5.r_speed = 85
	self.new_mp5.c_speed = 5.4
	self.uzi.r_recover = 0.8
	self.uzi.r_speed = 75
	self.uzi.c_speed = 5.7
	self.baka.r_recover = 0.45
	self.baka.r_speed = 85
	self.baka.c_speed = 5.4
	self.sterling.r_recover = 0.85
	self.sterling.r_speed = 65
	self.sterling.c_speed = 6
	self.glock_18c.r_recover = 0.6
	self.glock_18c.r_speed = 100
	self.glock_18c.c_speed = 5.1
	self.tec9.r_recover = 0.55
	self.tec9.r_speed = 95
	self.tec9.c_speed = 5.25
	self.sub2000.r_recover = 0.4
	self.sub2000.r_speed = 120
	self.sub2000.c_speed = 6
	self.b92fs.r_recover = 0.65
	self.b92fs.r_speed = 90
	self.b92fs.c_speed = 5.7
	self.x_b92fs.r_recover = 0.55
	self.x_b92fs.r_speed = 100
	self.x_b92fs.c_speed = 5.4
	self.sparrow.r_recover = 0.75
	self.sparrow.r_speed = 85
	self.sparrow.c_speed = 6.0
	self.g26.r_recover = 0.9
	self.g26.r_speed = 80
	self.g26.c_speed = 6.5
	self.jowi.r_recover = 0.8
	self.jowi.r_speed = 90
	self.jowi.c_speed = 6
	self.glock_17.r_recover = 0.8
	self.glock_17.r_speed = 70
	self.glock_17.c_speed = 6
	self.x_g17.r_recover = 0.7
	self.x_g17.r_speed = 80
	self.x_g17.c_speed = 5.75
	
	local ammo_40sw = {'g22c','p226','hs2000','x_g22c'}
	for i, wep_id in ipairs(ammo_40sw) do
		self[ wep_id ].penetration_power = 0.5
		self[ wep_id ].penetration_damage = 0.45
		self[ wep_id ].r_recover = 0.7
		self[ wep_id ].r_speed = 150
		self[ wep_id ].c_speed = 5.2
	end
	self.x_g22c.r_recover = 0.5
	
	local ammo_45acp = {'mac10','colt_1911','usp','m1928','x_1911','x_usp','polymer'}
	for i, wep_id in ipairs(ammo_45acp) do
		self[ wep_id ].penetration_power = 0.6
		self[ wep_id ].penetration_damage = 0.5
	end
	self.colt_1911.r_recover = 0.65
	self.colt_1911.r_speed = 110
	self.colt_1911.c_speed = 5.4
	self.x_1911.r_recover = 0.55
	self.x_1911.r_speed = 120
	self.x_1911.c_speed = 5.3
	self.usp.r_recover = 0.6
	self.usp.r_speed = 135
	self.usp.c_speed = 5.2
	self.x_usp.r_recover = 0.5
	self.x_usp.r_speed = 145
	self.x_usp.c_speed = 5.1
	self.mac10.r_recover = 0.5
	self.mac10.r_speed = 125
	self.mac10.c_speed = 5.35
	self.m1928.r_recover = 0.6
	self.m1928.r_speed = 110
	self.m1928.c_speed = 5.5
	self.polymer.r_recover = 0.45
	self.polymer.r_speed = 150
	self.polymer.c_speed = 5
	
	self.c96.penetration_power = 0.8
	self.c96.penetration_damage = 0.6
	self.c96.r_recover = 0.75
	self.c96.r_speed = 145
	self.c96.c_speed = 5.5
	
	self.mateba.penetration_power = 0.8
	self.mateba.penetration_damage = 0.7
	self.mateba.r_recover = 0.75
	self.mateba.r_speed = 155
	self.mateba.c_speed = 5.25
	
	self.new_raging_bull.penetration_power = 0.9
	self.new_raging_bull.penetration_damage = 0.8
	self.new_raging_bull.min_shield_pen_dam = 1
	self.new_raging_bull.shield_damage = 0.15
	self.new_raging_bull.r_recover = 0.6
	self.new_raging_bull.r_speed = 170
	self.new_raging_bull.c_speed = 5.2
	
	self.peacemaker.penetration_power = 0.7
	self.peacemaker.penetration_damage = 0.6
	self.peacemaker.min_shield_pen_dam = 1
	self.peacemaker.shield_damage = 0.15
	self.peacemaker.r_recover = 0.45
	self.peacemaker.r_speed = 185
	self.peacemaker.c_speed = 5.1
	
	self.deagle.penetration_power = 1
	self.deagle.penetration_damage = 0.5
	self.deagle.min_shield_pen_dam = 1
	self.deagle.shield_damage = 0.10
	self.deagle.r_recover = 0.35
	self.deagle.r_speed = 170
	self.deagle.c_speed = 5.15
	
	self.x_deagle.penetration_power = 1
	self.x_deagle.penetration_damage = 0.5
	self.x_deagle.min_shield_pen_dam = 1
	self.x_deagle.shield_damage = 0.10
	self.x_deagle.r_recover = 0.15
	self.x_deagle.r_speed = 180
	self.x_deagle.c_speed = 5
	
	self.mp7.penetration_power = 1.6
	self.mp7.penetration_damage = 0.75
	self.mp7.min_shield_pen_dam = 1
	self.mp7.shield_damage = 0.20
	self.mp7.r_recover = 0.85
	self.mp7.r_speed = 75
	self.mp7.c_speed = 6
	
	self.p90.penetration_power = 1.6
	self.p90.penetration_damage = 0.85
	self.p90.min_shield_pen_dam = 1
	self.p90.shield_damage = 0.25
	self.p90.r_recover = 0.75
	self.p90.r_speed = 80
	self.p90.c_speed = 5.5
	
	local ammo_slug = {'r870','serbu','benelli','ksg','striker','huntsman','spas12','judge','b682','saiga','aa12'}
	for i, wep_id in ipairs(ammo_slug) do
		self[ wep_id ].penetration_power = 0.5 --Only relevant if you're using slugs!!
		self[ wep_id ].penetration_damage = 0.45 --ditto
		self[ wep_id ].shield_damage = 0.30 --ditto
		--self[ wep_id ].hs_mult = 0.75
	end
	self.r870.r_recover = 0.3
	self.r870.r_speed = 190
	self.r870.c_speed = 5.3
	self.serbu.r_recover = 0.2
	self.serbu.r_speed = 200
	self.serbu.c_speed = 5.2
	self.benelli.r_recover = 0.5
	self.benelli.r_speed = 180
	self.benelli.c_speed = 5.1
	self.ksg.r_recover = 0.55
	self.ksg.r_speed = 170
	self.ksg.c_speed = 5.4
	self.striker.r_recover = 0.3
	self.striker.r_speed = 160
	self.striker.c_speed = 5.1
	self.huntsman.r_recover = 0.4
	self.huntsman.r_speed = 150
	self.huntsman.c_speed = 5.3
	self.b682.r_recover = 0.6
	self.b682.r_speed = 200
	self.b682.c_speed = 5.1
	self.spas12.r_recover = 0.5
	self.spas12.r_speed = 175
	self.spas12.c_speed = 5.2
	self.judge.r_recover = 0.7
	self.judge.r_speed = 190
	self.judge.c_speed = 5.65
	self.saiga.r_recover = 0.4
	self.saiga.r_speed = 180
	self.saiga.c_speed = 5.1
	self.aa12.r_recover = 0.7
	self.aa12.r_speed = 100
	self.aa12.c_speed = 6
	
	local ammo_556 = {'olympic','m16','amcar','new_m4','ak5','s552','g36','aug','famas','m249','l85a2','vhs'}
	for i, wep_id in ipairs(ammo_556) do
		self[ wep_id ].penetration_power = 0.65
		self[ wep_id ].penetration_damage = 0.45
		self[ wep_id ].shield_damage = 0.10
		self[ wep_id ].min_shield_pen_dam = 1
	end
	
	self.olympic.r_recover = 0.85
	self.olympic.r_speed = 80
	self.olympic.c_speed = 5.2
	self.s552.r_recover = 0.75
	self.s552.r_speed = 85
	self.s552.c_speed = 5.5
	self.g36.r_recover = 0.8
	self.g36.r_speed = 70
	self.g36.c_speed = 5.2
	self.amcar.r_recover = 0.7
	self.amcar.r_speed = 65
	self.amcar.c_speed = 5.65
	self.m249.r_recover = 0.4
	self.m249.r_speed = 100
	self.m249.c_speed = 5.2
	self.m16.r_recover = 0.65
	self.m16.r_speed = 85
	self.m16.c_speed = 5.35
	self.new_m4.r_recover = 0.75
	self.new_m4.r_speed = 80
	self.new_m4.c_speed = 5.55
	self.ak5.r_recover = 0.60
	self.ak5.r_speed = 90
	self.ak5.c_speed = 5.7
	self.aug.r_recover = 0.75
	self.aug.r_speed = 100
	self.aug.c_speed = 5.6
	self.famas.r_recover = 0.50
	self.famas.r_speed = 70
	self.famas.c_speed = 5.1
	self.l85a2.r_recover = 0.9
	self.l85a2.r_speed = 115
	self.l85a2.c_speed = 5.35
	self.vhs.r_recover = 0.8
	self.vhs.r_speed = 75
	self.vhs.c_speed = 5.8
	
	local ammo_762_ak = {'ak74','akmsu','akm','akm_gold','rpk','asval'}
	for i, wep_id in ipairs(ammo_762_ak) do
		self[ wep_id ].penetration_power = 0.7
		self[ wep_id ].penetration_damage = 0.5
		self[ wep_id ].shield_damage = 0.10
		self[ wep_id ].min_shield_pen_dam = 1
	end
	
	self.akmsu.r_recover = 0.75
	self.akmsu.r_speed = 110
	self.akmsu.c_speed = 5.4
	self.ak74.r_recover = 0.7
	self.ak74.r_speed = 90
	self.ak74.c_speed = 5.2
	self.akm.r_recover = 0.675
	self.akm.r_speed = 125
	self.akm.c_speed = 5.1
	self.akm_gold.r_recover = 0.8
	self.akm_gold.r_speed = 115
	self.akm_gold.c_speed = 5.5
	self.rpk.r_recover = 0.5
	self.rpk.r_speed = 120
	self.rpk.c_speed = 5.2
	self.asval.r_recover = 0.7
	self.asval.r_speed = 95
	self.asval.c_speed = 5.5
	
	local ammo_rifle = {'new_m14','scar','fal','galil','g3','msr','hk21','m134','wa2000','par','model70'}
	for i, wep_id in ipairs(ammo_rifle) do
		self[ wep_id ].penetration_power = 0.8
		self[ wep_id ].penetration_damage = 0.6
		self[ wep_id ].shield_damage = 0.15
		self[ wep_id ].min_shield_pen_dam = 1
	end

	self.new_m14.r_recover = 0.55
	self.new_m14.r_speed = 145
	self.new_m14.c_speed = 5.15
	self.scar.r_recover = 0.7
	self.scar.r_speed = 125
	self.scar.c_speed = 5.4
	self.fal.r_recover = 0.6
	self.fal.r_speed = 140
	self.fal.c_speed = 5.55
	self.galil.r_recover = 0.65
	self.galil.r_speed = 130
	self.galil.c_speed = 5.3
	self.g3.r_recover = 0.5
	self.g3.r_speed = 135
	self.g3.c_speed = 5.25
	self.hk21.penetration_damage = 0.7
	self.hk21.r_recover = 0.35
	self.hk21.r_speed = 150
	self.hk21.c_speed = 5.2
	self.par.penetration_damage = 0.8
	self.par.r_recover = 0.35
	self.par.r_speed = 140
	self.par.c_speed = 5.25
	
	self.m134.penetration_damage = 0.85
	self.m134.shield_damage = 0.05
	self.m134.r_recover = 0.3
	self.m134.r_speed = 120
	self.m134.c_speed = 5
	
	self.wa2000.shield_damage = 0.15
	self.wa2000.r_recover = 0.35
	self.wa2000.r_speed = 145
	self.wa2000.c_speed = 5.05
	
	self.model70.min_shield_pen_dam = nil
	self.model70.shield_damage = 0.25
	self.model70.r_recover = 0.45
	self.model70.r_speed = 135
	self.model70.c_speed = 5.2
	
	self.msr.min_shield_pen_dam = nil
	self.msr.shield_damage = 0.25
	self.msr.r_recover = 0.55
	self.msr.r_speed = 130
	self.msr.c_speed = 5.2
	
	self.mg42.penetration_power = 0.9
	self.mg42.penetration_damage = 0.85
	self.mg42.min_shield_pen_dam = 1
	self.mg42.shield_damage = 0.10
	self.mg42.r_recover = 0.45
	self.mg42.r_speed = 125
	self.mg42.c_speed = 5.2
	
	self.mosin.penetration_power = 0.85
	self.mosin.penetration_damage = 0.9
	self.mosin.shield_damage = 0.30
	self.mosin.r_recover = 0.5
	self.mosin.r_speed = 130
	self.mosin.c_speed = 5.15
	
	self.r93.penetration_power = 0.95
	self.r93.penetration_damage = 0.95
	self.r93.shield_damage = 0.35
	self.r93.r_recover = 0.45
	self.r93.r_speed = 140
	self.r93.c_speed = 5.1
	
	self.m95.penetration_power = 10 --SHOOT THROUGH ALL THE THINGS (that are 55cm thick or less)
	self.m95.penetration_damage = 1
	self.m95.shield_damage = 1
	self.m95.r_recover = 0.4
	self.m95.r_speed = 155
	self.m95.c_speed = 5
	
	self.winchester1874.penetration_power = 0.7
	self.winchester1874.penetration_damage = 0.6
	self.winchester1874.shield_damage = 0.25
	self.winchester1874.r_recover = 0.75
	self.winchester1874.r_speed = 110
	self.winchester1874.c_speed = 5
	--}
	
	--[[ MOVEMENT ]]
	--{
	
	--Movement speed
	local start_semi = {'glock_18c','new_m14','scar','fal','galil','g3','tec9'}
	for i, wep_id in ipairs(start_semi) do
		self[ wep_id ].FIRE_MODE = "single"
	end
		
	local eight_nine = {'ak74','s552','new_m4','vhs','saiga','scar','aug','famas','r870','benelli','ak5','spas12','m16','mosin','striker','b682','model70'}
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
		self[ wep_id ].weapon_movement_penalty = 0.775
	end
	
	local twenty = {'m249'}
	for i, wep_id in ipairs(twenty) do
		self[ wep_id ].weapon_movement_penalty = 0.75
	end
	
	local twentytwo = {'hk21'}
	for i, wep_id in ipairs(twentytwo) do
		self[ wep_id ].weapon_movement_penalty = 0.725
	end
	local twentyfour = {'m95'}
	for i, wep_id in ipairs(twentyfour) do
		self[ wep_id ].weapon_movement_penalty = 0.7
	end
	local twentyfive = {'mg42','par'}
	for i, wep_id in ipairs(twentyfive) do
		self[ wep_id ].weapon_movement_penalty = 0.675
	end
	local fourty = {'m134'}
	for i, wep_id in ipairs(fourty) do
		self[ wep_id ].weapon_movement_penalty = 0.65
	end
	
	--ADS movement speed
	
	local stock = {}
	stock = {
		'new_raging_bull','deagle','peacemaker','mateba','judge','x_deagle',
		'colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','x_1911','x_b92fs','jowi','g26','c96','hs2000','x_usp','x_g17','x_g22c','sparrow',	
		'hunter',
		'saw','saw_secondary'
	}
	for i, wep_id in ipairs(stock) do
		self[ wep_id ].ams = 0.95
	end
	
	
	stock = {
		'm1928','mac10','mp9','tec9','scorpion','cobray','baka','m45','new_mp5','uzi','sterling','polymer',
	}
	for i, wep_id in ipairs(stock) do
		self[ wep_id ].ams = 0.85
	end
		
	stock = {
		'mp7','p90',
		'serbu','striker','aa12','saiga','r870','huntsman','benelli','ksg','spas12','b682'
	}
	for i, wep_id in ipairs(stock) do
		self[ wep_id ].ams = 0.75
	end
	
	stock = {
		'olympic','akmsu','amcar','s552','g36','sub2000',
		'plainsrider','frankish',
		'gre_m79'
	}
	for i, wep_id in ipairs(stock) do
		self[ wep_id ].ams = 0.65
	end
		
	stock = {
		'akm','akm_gold','ak74','m16','new_m4','ak5','aug','famas','l85a2','vhs','asval',
		'rpk',
		'winchester1874','model70',
		'm32'
	}
	for i, wep_id in ipairs(stock) do
		self[ wep_id ].ams = 0.55
	end
		
	stock = {		
		'new_m14','scar','fal','galil','g3',
		'm249','hk21','mg42','par',
		'msr','r93','m95','mosin','wa2000',
		'flamethrower_mk2',
		'long','arblast',
		'm134',
		'rpg7'
	}
	for i, wep_id in ipairs(stock) do
		self[ wep_id ].ams = 0.45
	end
		
	--}
	
	
	--[[ EQUIP TIMERS ]]
	--{
		self.m1928.timers.equip = 1.1
	self.m1928.equip = 0.85
	self.m1928.unequip = 0.6
	self.flamethrower_mk2.equip = 1.25
	self.flamethrower_mk2.unequip = 0.6
	self.rpg7.equip = 1.5
	self.rpg7.unequip = 1
	
	local eq_time
	eq_time = {
	'hunter','ppk','g26','glock_17','glock_18c','b92fs','sparrow',
	'g22c','p226','hs2000',
	'colt_1911','usp',
	'c96',
	'mateba','new_raging_bull','judge','peacemaker','deagle'
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 0.35
	end 
	self.hunter.equip = 0.5
	self.hunter.unequip = 0.9
	self.ppk.equip = 0.5
	self.ppk.unequip = 0.8
	self.g26.equip = 0.5
	self.g26.unequip = 0.8
	self.glock_17.equip = 0.65
	self.glock_17.unequip = 1
	self.glock_18c.equip = 0.65
	self.glock_18c.unequip = 1
	self.b92fs.equip = 0.65
	self.b92fs.unequip = 1
	self.sparrow.equip = 0.65
	self.sparrow.unequip = 1
	self.g22c.equip = 0.75
	self.g22c.unequip = 1
	self.p226.equip = 0.75
	self.p226.unequip = 1
	self.hs2000.equip = 0.75
	self.hs2000.unequip = 1
	self.colt_1911.equip = 0.8
	self.colt_1911.unequip = 1
	self.usp.equip = 0.8
	self.usp.unequip = 1
	self.c96.equip = 0.8
	self.c96.unequip = 1
	self.mateba.equip = 0.85
	self.mateba.unequip = 1
	self.new_raging_bull.equip = 0.85
	self.new_raging_bull.unequip = 1
	self.judge.equip = 0.85
	self.judge.unequip = 1
	self.peacemaker.equip = 0.9
	self.peacemaker.unequip = 1.1
	self.deagle.equip = 0.9
	self.deagle.unequip = 1.1
	
	
	eq_time = {
	'scorpion',
	'baka','mp9','tec9',
	'mac10',
	'mp7'
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 0.4
	end 
	self.tec9.equip = 1.1
	self.tec9.unequip = 0.6
	self.scorpion.equip = 1.1
	self.scorpion.unequip = 0.6
	self.baka.equip = 1.1
	self.baka.unequip = 0.6
	self.mp9.equip = 1.1
	self.mp9.unequip = 0.6
	self.mac10.equip = 1.1
	self.mac10.unequip = 0.6
	self.mp7.equip = 1.3
	self.mp7.unequip = 0.6
	
	
	eq_time = {
	'jowi','x_g17','x_b92fs',
	'x_g22c',
	'x_1911','x_usp',
	'x_deagle',
	
	'mosin'
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 0.45
	end 
	self.jowi.equip = 0.5
	self.jowi.unequip = 0.8
	self.x_g17.equip = 0.65
	self.x_g17.unequip = 1
	self.x_b92fs.equip = 0.65
	self.x_b92fs.unequip = 1
	self.x_g22c.equip = 0.75
	self.x_g22c.unequip = 1
	self.x_1911.equip = 0.8
	self.x_1911.unequip = 1
	self.x_usp.equip = 0.8
	self.x_usp.unequip = 1
	self.x_deagle.equip = 0.9
	self.x_deagle.unequip = 1.2
	
	self.mosin.equip = 2.2
	self.mosin.unequip = 0.6

	
	
	eq_time = {
	'new_mp5','m45','uzi','sterling','cobray',
	'polymer',
	'olympic','akmsu',
	'amcar','g36','s552',
	'new_m4','m16','ak5',
	'asval','ak74','akm','akm_gold',
	'serbu',
	'saiga','aa12','huntsman','b682','benelli','spas12','r870','ksg',
	'scar',
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 0.5
	end 
	self.cobray.equip = 1.2
	self.cobray.unequip = 0.6
	self.uzi.equip = 1.2
	self.uzi.unequip = 0.6
	self.new_mp5.equip = 1.35
	self.new_mp5.unequip = 0.6
	self.m45.equip = 1.35
	self.m45.unequip = 0.6
	self.sterling.equip = 1.35
	self.sterling.unequip = 0.6
	self.polymer.equip = 1.35
	self.polymer.unequip = 0.6
	
	self.p90.equip = 1.4
	self.p90.unequip = 0.6
	
	self.olympic.equip = 1.55
	self.olympic.unequip = 0.6
	self.akmsu.equip = 1.55
	self.akmsu.unequip = 0.6
	self.amcar.equip = 1.55
	self.amcar.unequip = 0.6
	self.g36.equip = 1.55
	self.g36.unequip = 0.6
	self.s552.equip = 1.55
	self.s552.unequip = 0.6
	
	self.new_m4.equip = 1.6
	self.new_m4.unequip = 0.6
	self.m16.equip = 1.6
	self.m16.unequip = 0.6
	self.ak5.equip = 1.6
	self.ak5.unequip = 0.6
	self.asval.equip = 1.6
	self.asval.unequip = 0.6
	self.ak74.equip = 1.6
	self.ak74.unequip = 0.6
	self.akm.equip = 1.6
	self.akm.unequip = 0.6
	self.akm_gold.equip = 1.6
	self.akm_gold.unequip = 0.6	
	
	self.serbu.equip = 1.45
	self.serbu.unequip = 0.6
	self.saiga.equip = 1.6
	self.saiga.unequip = 0.6
	self.aa12.equip = 1.6
	self.aa12.unequip = 0.6
	self.huntsman.equip = 1.6
	self.huntsman.unequip = 0.6
	self.b682.equip = 1.6
	self.b682.unequip = 0.6
	self.benelli.equip = 1.6
	self.benelli.unequip = 0.6
	self.spas12.equip = 1.6
	self.spas12.unequip = 0.6
	self.r870.equip = 1.6
	self.r870.unequip = 0.6
	self.ksg.equip = 1.6
	self.ksg.unequip = 0.6
	
	self.scar.equip = 1.6
	self.scar.unequip = 0.6
	
	
	eq_time = {
	'vhs','famas','aug','l85a2',
	'plainsrider','long','frankish','arblast',
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 0.55
	end 
	self.vhs.equip = 1.7
	self.vhs.unequip = 0.6
	self.famas.equip = 1.7
	self.famas.unequip = 0.6
	self.aug.equip = 1.7
	self.aug.unequip = 0.6
	self.l85a2.equip = 1.7
	self.l85a2.unequip = 0.6
	
	self.plainsrider.equip = 1.5
	self.plainsrider.unequip = 0.6
	self.long.equip = 1.6
	self.long.unequip = 0.6
	self.frankish.equip = 1.6
	self.frankish.unequip = 0.6
	self.arblast.equip = 1.7
	self.arblast.unequip = 0.6
	
	
	eq_time = {
	'fal','galil','new_m14','g3',
	'winchester1874','msr','model70',
	'm32','gre_m79'	
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 0.6
	end 
	self.fal.equip = 1.6
	self.fal.unequip = 0.6
	self.galil.equip = 1.6
	self.galil.unequip = 0.6
	self.new_m14.equip = 1.7
	self.new_m14.unequip = 0.6
	self.g3.equip = 1.7
	self.g3.unequip = 0.6
	
	self.winchester1874.equip = 1.6
	self.winchester1874.unequip = 0.6
	self.msr.equip = 1.6
	self.msr.unequip = 0.6	
	self.model70.equip = 1.7
	self.model70.unequip = 0.6
	
	self.m32.equip = 1.7
	self.m32.unequip = 0.6
	self.gre_m79.equip = 1.6
	self.gre_m79.unequip = 0.6
	
	
	eq_time = {
	'striker',
	'r93'
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 0.65
	end
	self.striker.equip = 1.3
	self.striker.unequip = 0.6
	
	self.r93.equip = 1.7
	self.r93.unequip = 0.6
	
	
	eq_time = {
	'rpk',
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 0.75
	end
	self.rpk.equip = 1.3
	self.rpk.unequip = 0.6
		
	
	eq_time = {
	'sub2000',
	'm95','wa2000'
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 0.8
	end
	self.sub2000.equip = 1.25
	self.sub2000.unequip = 0.6
	
	self.m95.equip = 1.45
	self.m95.unequip = 0.6
	self.wa2000.equip = 1.2
	self.wa2000.unequip = 0.6
	
	eq_time = {
	'm249','hk21','par','mg42',
	'm134'
	}
	for i, wep_id in ipairs(eq_time) do
		self[ wep_id ].timers.equip = 1.2
	end
	self.m249.equip = 1.0
	self.m249.unequip = 0.6
	self.hk21.equip = 1.0
	self.hk21.unequip = 0.6
	self.par.equip = 1.0
	self.par.unequip = 0.6
	self.mg42.equip = 1.0
	self.mg42.unequip = 0.6
	
	self.m134.equip = 1.0
	self.m134.unequip = 0.6	
	--}
	
	
	-----------------------[[WEAPONS]]-----------------------
	-----------------------[[SPECIAL]]-----------------------
	--{
	--[[     SAW(S)     ]]--
	--just to fix it for the index calculations
	self.saw.stats = {
			alert_size = 9,
			suppression = 7,
			zoom = 1,
			spread = 101,
			recoil = 91,
			spread_moving = 7,
			damage = 10,
			concealment = 16,
			value = 1,
			extra_ammo = 101,
			total_ammo_mod = 201,
		}
	self.saw_secondary.stats = deep_clone(self.saw.stats)
		
		
	--[[     M32     ]]--
	self.m32.ADS_TIMER = 0.320
	self.m32.reload_speed_mult = 1.2
	self.m32.rms = 0.75
	
	self.m32.kick.standing = {0.7, 0.6, -0.35, 0.35}
	self.m32.kick.crouching = self.m32.kick.standing
	self.m32.kick.steelsight = self.m32.kick.standing
	
	self.m32.spread.standing = 1.2
	self.m32.spread.crouching = 0.8
	self.m32.spread.steelsight = 0.1
	self.m32.spread.moving_standing = self.m32.spread.standing * 1.2
	self.m32.spread.moving_crouching = self.m32.spread.crouching * 1.2
	self.m32.spread.moving_steelsight = self.m32.spread.steelsight * 1.2
	
	self.m32.shake.fire_multiplier = 0.9
	self.m32.shake.fire_steelsight_multiplier = -0.9
	
	self.m32.stats_modifiers = {
			damage = 3.4,
		}
	
	self.m32.stats.alert_size = 9
	self.m32.stats.suppression = 2
	self.m32.stats.spread = 56
	self.m32.stats.recoil = 53
	self.m32.stats.damage = 40
	
	
	--[[     M79     ]]--	
	self.gre_m79.ADS_TIMER = 0.275
	self.gre_m79.kick.standing = {0.7, 0.65, -0.075, 0.075}
	self.gre_m79.kick.crouching = self.gre_m79.kick.standing
	self.gre_m79.kick.steelsight = self.gre_m79.kick.standing
	
	self.gre_m79.spread.standing = 0.9
	self.gre_m79.spread.crouching = 0.5
	self.gre_m79.spread.steelsight = 0.1
	self.gre_m79.spread.moving_standing = self.gre_m79.spread.standing * 1.1
	self.gre_m79.spread.moving_crouching = self.gre_m79.spread.crouching * 1.1
	self.gre_m79.spread.moving_steelsight = self.gre_m79.spread.steelsight * 1.1
	
	self.gre_m79.shake.fire_multiplier = 1.0
	self.gre_m79.shake.fire_steelsight_multiplier = -1.0
	
	self.gre_m79.stats_modifiers = {
			damage = 3.4,
		}
	
	self.gre_m79.stats.alert_size = 9
	self.gre_m79.stats.suppression = 2
	self.gre_m79.stats.spread = 70
	self.gre_m79.stats.recoil = 46
	self.gre_m79.stats.damage = 40
	
	
	
	--[[     Vulcan Raven     ]]--
	self.m134.ADS_TIMER = 0.500
	self.m134.rms = 0.5
	self.m134.ads_sms = 0.25
	self.m134.sms = 0.5
	
	self.m134.kick.standing = {0.6, -0.3, -0.55, 0.55}
	self.m134.kick.crouching = self.m134.kick.standing
	self.m134.kick.steelsight = self.m134.kick.standing
	
	self.m134.spread.standing = 0.8
	self.m134.spread.crouching = 0.6
	self.m134.spread.steelsight = 0.2
	self.m134.spread.moving_standing = self.m134.spread.standing * 1.3
	self.m134.spread.moving_crouching = self.m134.spread.crouching * 1.3
	self.m134.spread.moving_steelsight = self.m134.spread.steelsight * 1.3
	
	self.m134.shake.fire_multiplier = 1.1
	self.m134.shake.fire_steelsight_multiplier = 1.1
	
	self.m134.fire_mode_data.fire_rate = 0.02
	
	self.m134.always_hipfire = true
	
	self.m134.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.m134.armor_piercing_chance = 0.25
	
	self.m134.damage_near = 5
	self.m134.damage_far = 80
	self.m134.damage_min = 3.0
	
	self.m134.stats.damage = 36
	self.m134.stats.spread = 21
	self.m134.stats.recoil = 59
	self.m134.stats.suppression = 0
	
	
	
	--[[     ENEMY RPG!!! GET DOOOOWWWWN!!!!     ]]--
	self.rpg7.ADS_TIMER = 0.450
	self.rpg7.reload_speed_mult = 1.2
	self.rpg7.rms = 0.5
	
	self.rpg7.kick.standing = {1.05, 0.3, -0.075, 0.075 }
	self.rpg7.kick.crouching = self.rpg7.kick.standing
	self.rpg7.kick.steelsight = self.rpg7.kick.standing
	
	self.rpg7.sounds.enter_steelsight = "lmg_steelsight_enter"
	self.rpg7.sounds.leave_steelsight = "lmg_steelsight_exit"
	
	self.rpg7.timers.reload_empty = 6.6
	self.rpg7.timers.reload_not_empty = 6.6
	
	self.rpg7.spread.standing = 2
	self.rpg7.spread.crouching = 2
	self.rpg7.spread.steelsight = 0.1
	self.rpg7.spread.moving_standing = self.rpg7.spread.standing
	self.rpg7.spread.moving_crouching = self.rpg7.spread.crouching
	self.rpg7.spread.moving_steelsight = self.rpg7.spread.steelsight
	
	self.rpg7.stats.damage = 40
	self.rpg7.stats.spread = 66
	self.rpg7.stats.recoil = 45
	self.rpg7.stats.suppression = 0
	
	
	
	--[[     Flammen     ]]	
	self.flamethrower_mk2.ADS_TIMER = 0.350
	self.flamethrower_mk2.ads_sms = 0.6
	self.flamethrower_mk2.sms = 0.6
	
	self.flamethrower_mk2.spread.standing = 0.6
	self.flamethrower_mk2.spread.crouching = self.flamethrower_mk2.spread.standing
	self.flamethrower_mk2.spread.steelsight = self.flamethrower_mk2.spread.standing
	self.flamethrower_mk2.spread.moving_standing = self.flamethrower_mk2.spread.standing
	self.flamethrower_mk2.spread.moving_crouching = self.flamethrower_mk2.spread.crouching
	self.flamethrower_mk2.spread.moving_steelsight = self.flamethrower_mk2.spread.steelsight
	
	self.flamethrower_mk2.rays = 20
	self.flamethrower_mk2.fire_mode_data.fire_rate = 0.03
	self.flamethrower_mk2.fire_dot_data.dot_trigger_chance = 30
	
	self.flamethrower_mk2.stats.recoil = 100
	self.flamethrower_mk2.stats.spread = 31
	self.flamethrower_mk2.stats.damage = 12
	self.flamethrower_mk2.flame_max_range = 2000
	
	
	
	--[[     IN THE KNEE     ]]		
	self.plainsrider.reload_speed_mult = 0.8
	
	self.plainsrider.kick.standing = {0.375, 0.125, 0.25, 0.25}
	self.plainsrider.kick.crouching = self.plainsrider.kick.standing
	self.plainsrider.kick.steelsight = self.plainsrider.kick.standing
	self.plainsrider.charge_data.max_t = 0.95
	
	self.plainsrider.spread.standing = 0.15
	self.plainsrider.spread.crouching = 0.15
	self.plainsrider.spread.steelsight = 0.1
	self.plainsrider.spread.moving_standing = self.plainsrider.spread.standing * 1.1
	self.plainsrider.spread.moving_crouching = self.plainsrider.spread.crouching * 1.1
	self.plainsrider.spread.moving_steelsight = self.plainsrider.spread.steelsight * 1.1
	
	self.plainsrider.shake.fire_multiplier = 1
	self.plainsrider.shake.fire_steelsight_multiplier = -1
	
	self.plainsrider.stats_modifiers = { damage = 2 }
		
	self.plainsrider.stats.damage = 36
	self.plainsrider.stats.recoil = 75
	self.plainsrider.stats.spread = 86
	
	
	
	--[[     THAT'S WHAT SHE SAID     ]]	
	self.long.reload_speed_mult = 1.2
	
	self.long.kick.standing = {0.75, 0.25, 0.5, 0.5}
	self.long.kick.crouching = self.long.kick.standing
	self.long.kick.steelsight = self.long.kick.standing
	self.long.charge_data.max_t = 1.25
	
	self.long.spread.standing = 0.15
	self.long.spread.crouching = 0.15
	self.long.spread.steelsight = 0.1
	self.long.spread.moving_standing = self.long.spread.standing * 1.25
	self.long.spread.moving_crouching = self.long.spread.crouching * 1.25
	self.long.spread.moving_steelsight = self.long.spread.steelsight * 1.25
	
	self.long.shake.fire_multiplier = 2
	self.long.shake.fire_steelsight_multiplier = -2
	
	self.long.stats_modifiers = { damage = 10 }
		
	self.long.stats.damage = 12
	self.long.stats.recoil = 79
	self.long.stats.spread = 91
	
	
	
	--[[     X BOW'N GIVE IT TO YA     ]]	
	self.hunter.ADS_TIMER = 0.085
	self.hunter.reload_speed_mult = 1.1
	
	self.hunter.kick.standing = {0.4, 0.2, 0.2, 0.2}
	self.hunter.kick.crouching = self.hunter.kick.standing
	self.hunter.kick.steelsight = self.hunter.kick.standing
	
	self.hunter.spread.standing = 0.6
	self.hunter.spread.crouching = 0.5
	self.hunter.spread.steelsight = 0.1
	self.hunter.spread.moving_standing = self.hunter.spread.standing * 1.1
	self.hunter.spread.moving_crouching = self.hunter.spread.crouching * 1.1
	self.hunter.spread.moving_steelsight = self.hunter.spread.steelsight * 1.1
	
	self.hunter.shake.fire_multiplier = 1
	self.hunter.shake.fire_steelsight_multiplier = -1
	
	self.hunter.fire_mode_data.fire_rate = 0.3
	
	self.hunter.stats_modifiers = {}
		
	self.hunter.stats.damage = 40
	self.hunter.stats.recoil = 81
	self.hunter.stats.spread = 78
	
	
	--[[     Basic Crossbow     ]]	
	self.frankish.ADS_TIMER = 0.150
	self.frankish.kick.standing = {0.4, 0.2, 0.2, 0.2}
	self.frankish.kick.crouching = self.frankish.kick.standing
	self.frankish.kick.steelsight = self.frankish.kick.standing
	
	self.frankish.spread.standing = 1.5
	self.frankish.spread.crouching = 1.2
	self.frankish.spread.steelsight = 0.1
	self.frankish.spread.moving_standing = self.frankish.spread.standing * 1.2
	self.frankish.spread.moving_crouching = self.frankish.spread.crouching * 1.2
	self.frankish.spread.moving_steelsight = self.frankish.spread.steelsight * 1.2
	
	self.frankish.shake.fire_multiplier = 1.8
	self.frankish.shake.fire_steelsight_multiplier = -1.8
	
	self.frankish.fire_mode_data.fire_rate = 0.4
	
	self.frankish.timers.reload_not_empty = 1.6
	self.frankish.timers.reload_empty = 1.6
	
	self.frankish.stats_modifiers = {damage = 10}
		
	self.frankish.stats.damage = 10
	self.frankish.stats.recoil = 69
	self.frankish.stats.spread = 78
	
	
	--[[     Arbalest Crossbow     ]]	
	self.arblast.ADS_TIMER = 0.250
	self.arblast.reload_speed_mult = 0.6
	self.arblast.rms = 0.5
	
	self.arblast.kick.standing = {0.4, 0.2, 0.2, 0.2}
	self.arblast.kick.crouching = self.arblast.kick.standing
	self.arblast.kick.steelsight = self.arblast.kick.standing
	
	self.arblast.spread.standing = 3
	self.arblast.spread.crouching = 2.6
	self.arblast.spread.steelsight = 0.1
	self.arblast.spread.moving_standing = self.arblast.spread.standing * 1.4
	self.arblast.spread.moving_crouching = self.arblast.spread.crouching * 1.4
	self.arblast.spread.moving_steelsight = self.arblast.spread.steelsight * 1.4
	
	self.arblast.shake.fire_multiplier = 2.2
	self.arblast.shake.fire_steelsight_multiplier = -2.2
	
	self.arblast.fire_mode_data.fire_rate = 0.6
	
	self.arblast.timers.reload_not_empty = 3.1
	self.arblast.timers.reload_empty = 3.1
	
	self.arblast.stats_modifiers = {damage = 10}
		
	self.arblast.stats.damage = 23
	self.arblast.stats.recoil = 51
	self.arblast.stats.spread = 81
	
	--}
	
	
	
	-----------------------[[PISTOLS]]-----------------------
	--{
	--[[     007     ]]--
	self.ppk.ADS_TIMER = 0.070
	self.ppk.reload_speed_mult = 1.25
	
	self.ppk.kick.standing = { 0.3, 0.2, -0.25, 0.25 }
	self.ppk.kick.crouching = self.ppk.kick.standing
	self.ppk.kick.steelsight = self.ppk.kick.standing
	
	self.ppk.CLIP_AMMO_MAX = 8
	
	self.ppk.spread.standing = 0.6
	self.ppk.spread.crouching = 0.4
	self.ppk.spread.steelsight = 0.1
	self.ppk.spread.moving_standing = self.ppk.spread.standing * 1.1
	self.ppk.spread.moving_crouching = self.ppk.spread.crouching * 1.1
	self.ppk.spread.moving_steelsight = self.ppk.spread.steelsight * 1.1
	
	self.ppk.fire_mode_data.fire_rate = 0.075
	
	self.ppk.shake.fire_multiplier = 0.5
	self.ppk.shake.fire_steelsight_multiplier = -0.5
	
	self.ppk.damage_near = 14
	self.ppk.damage_far = 32
	self.ppk.damage_min = 1.0
	
	self.ppk.stats.damage = 12
	self.ppk.stats.spread = 57
	self.ppk.stats.recoil = 91
	self.ppk.stats.suppression = 17
	
	
	
	--[[     Grenade 18C     ]]--
	self.glock_18c.ADS_TIMER = 0.100
	
	self.glock_18c.sub_category = "mach_pis"
	
	self.glock_18c.upgrade_blocks = {
			pistol = {
				"fire_rate_multiplier"
			}
		}
	self.glock_18c.kick.standing = {0.45, -0.05, -0.25, 0.25 }
	self.glock_18c.kick.crouching = self.glock_18c.kick.standing
	self.glock_18c.kick.steelsight = self.glock_18c.kick.standing
	
	self.glock_18c.CLIP_AMMO_MAX = 17
	
	self.glock_18c.spread.standing = 0.8
	self.glock_18c.spread.crouching = 0.75
	self.glock_18c.spread.steelsight = 0.1
	self.glock_18c.spread.moving_standing = self.glock_18c.spread.standing * 1.25
	self.glock_18c.spread.moving_crouching = self.glock_18c.spread.crouching * 1.25
	self.glock_18c.spread.moving_steelsight = self.glock_18c.spread.steelsight * 1.25
	
	self.glock_18c.fire_mode_data.fire_rate = 0.05454545454545454545454545454545
	
	self.glock_18c.shake.fire_multiplier = 1
	self.glock_18c.shake.fire_steelsight_multiplier = -1
	
	self.glock_18c.damage_near = 5
	self.glock_18c.damage_far = 36
	self.glock_18c.damage_min = 1.2
	
	self.glock_18c.stats.damage = 14
	self.glock_18c.stats.spread = 63
	self.glock_18c.stats.recoil = 56
	self.glock_18c.stats.suppression = 16
	
	
	
	--[[     Grenade 17     ]]--
	self.glock_17.ADS_TIMER = 0.100
	
	self.glock_17.kick.standing = {0.35, -0.05, -0.3, 0.3 }
	self.glock_17.kick.crouching = self.glock_17.kick.standing
	self.glock_17.kick.steelsight = self.glock_17.kick.standing
	
	self.glock_17.spread.standing = 0.55
	self.glock_17.spread.crouching = 0.45
	self.glock_17.spread.steelsight = 0.1
	self.glock_17.spread.moving_standing = self.glock_17.spread.standing * 1.2
	self.glock_17.spread.moving_crouching = self.glock_17.spread.crouching * 1.2
	self.glock_17.spread.moving_steelsight = self.glock_17.spread.steelsight * 1.2
	
	self.glock_17.CLIP_AMMO_MAX = 17
	
	self.glock_17.fire_mode_data.fire_rate = 0.09230769230769230769230769230769
	
	self.glock_17.shake.fire_multiplier = 1
	self.glock_17.shake.fire_steelsight_multiplier = -1
	
	self.glock_17.damage_near = 6
	self.glock_17.damage_far = 38
	self.glock_17.damage_min = 1.2
	
	self.glock_17.stats.damage = 14
	self.glock_17.stats.spread = 65
	self.glock_17.stats.recoil = 79
	self.glock_17.stats.suppression = 16
	
	--[[     Grenade 17     ]]--
	self.x_g17.ADS_TIMER = 0.150
	
	self.x_g17.kick.standing = {0.35, -0.05, -0.3, 0.3 }
	self.x_g17.kick.crouching = self.x_g17.kick.standing
	self.x_g17.kick.steelsight = self.x_g17.kick.standing
	
	self.x_g17.spread.standing = 0.55 * 1
	self.x_g17.spread.crouching = 0.45 * 1
	self.x_g17.spread.steelsight = 0.1 * 1
	self.x_g17.spread.moving_standing = self.x_g17.spread.standing * 1.2
	self.x_g17.spread.moving_crouching = self.x_g17.spread.crouching * 1.2
	self.x_g17.spread.moving_steelsight = self.x_g17.spread.steelsight * 1.2
	
	self.x_g17.CLIP_AMMO_MAX = 17 * 2
	
	self.x_g17.fire_mode_data.fire_rate = 0.09230769230769230769230769230769 / 1.5
	
	self.x_g17.shake.always_hipfire = true
	
	self.x_g17.shake.fire_multiplier = 1
	self.x_g17.shake.fire_steelsight_multiplier = -1
	
	self.x_g17.damage_near = 6
	self.x_g17.damage_far = 38
	self.x_g17.damage_min = 1.2
	
	self.x_g17.stats.damage = 14
	self.x_g17.stats.spread = 55
	self.x_g17.stats.recoil = 69
	self.x_g17.stats.suppression = 16
	
	
	
	--[[     Bardoda     ]]--
	self.b92fs.ADS_TIMER = 0.100
	
	self.b92fs.kick.standing = {0.45, 0.25, -0.15, 0.15}
	self.b92fs.kick.crouching = self.b92fs.kick.standing
	self.b92fs.kick.steelsight = self.b92fs.kick.standing
	
	self.b92fs.CLIP_AMMO_MAX = 15
	
	self.b92fs.spread.standing = 0.95
	self.b92fs.spread.crouching = 0.75
	self.b92fs.spread.steelsight = 0.1
	self.b92fs.spread.moving_standing = self.b92fs.spread.standing * 1.4
	self.b92fs.spread.moving_crouching = self.b92fs.spread.crouching * 1.4
	self.b92fs.spread.moving_steelsight = self.b92fs.spread.steelsight * 1.4
	
	self.b92fs.fire_mode_data.fire_rate = 0.1
	
	self.b92fs.shake.fire_multiplier = 1
	self.b92fs.shake.fire_steelsight_multiplier = -1
	
	self.b92fs.damage_near = 11
	self.b92fs.damage_far = 42
	self.b92fs.damage_min = 1.35
		
	self.b92fs.stats.damage = 14
	self.b92fs.stats.spread = 73
	self.b92fs.stats.recoil = 66
	self.b92fs.stats.suppression = 16
		
		
	
	--[[     Revy     ]]--
	self.x_b92fs.ADS_TIMER = 0.150
	
	self.x_b92fs.kick.standing = {0.45, 0.25, -0.15, 0.15}
	self.x_b92fs.kick.crouching = self.x_b92fs.kick.standing
	self.x_b92fs.kick.steelsight = self.x_b92fs.kick.standing
	
	self.x_b92fs.CLIP_AMMO_MAX = 15 * 2
	
	self.x_b92fs.spread.standing = 0.95 * 1
	self.x_b92fs.spread.crouching = 0.75 * 1
	self.x_b92fs.spread.steelsight = 0.1 * 1
	self.x_b92fs.spread.moving_standing = self.x_b92fs.spread.standing * 1.4
	self.x_b92fs.spread.moving_crouching = self.x_b92fs.spread.crouching * 1.4
	self.x_b92fs.spread.moving_steelsight = self.x_b92fs.spread.steelsight * 1.4
	
	self.x_b92fs.always_hipfire = true
	
	self.x_b92fs.fire_mode_data.fire_rate = 0.1 / 1.5
	
	self.x_b92fs.shake.fire_multiplier = 1.3
	self.x_b92fs.shake.fire_steelsight_multiplier = -1.3
	
	self.x_b92fs.damage_near = 11
	self.x_b92fs.damage_far = 42
	self.x_b92fs.damage_min = 1.35
		
	self.x_b92fs.stats.damage = 14
	self.x_b92fs.stats.spread = 61
	self.x_b92fs.stats.recoil = 56
	self.x_b92fs.stats.suppression = 16
	
	
	
	--[[     Jerry Can     ]]--
	self.sparrow.ADS_TIMER = 0.100
	self.sparrow.reload_speed_mult = 0.95
	
	self.sparrow.kick.standing = { 0.35, -0.15, -0.25, 0.25 }
	self.sparrow.kick.crouching = self.sparrow.kick.standing
	self.sparrow.kick.steelsight = self.sparrow.kick.standing
	
	self.sparrow.spread.standing = 0.75
	self.sparrow.spread.crouching = 0.6
	self.sparrow.spread.steelsight = 0.1
	self.sparrow.spread.moving_standing = self.sparrow.spread.standing * 1.25
	self.sparrow.spread.moving_crouching = self.sparrow.spread.crouching * 1.25
	self.sparrow.spread.moving_steelsight = self.sparrow.spread.steelsight * 1.25
	
	self.sparrow.CLIP_AMMO_MAX = 16
	
	self.sparrow.fire_mode_data.fire_rate = 0.0952380952380952380952380952381
	
	self.sparrow.armor_piercing_chance = 0.1
	
	self.sparrow.shake.fire_multiplier = 1.2
	self.sparrow.shake.fire_steelsight_multiplier = -1.2
	
	self.sparrow.damage_near = 8
	self.sparrow.damage_far = 40
	self.sparrow.damage_min = 1.35
	
	self.sparrow.stats.damage = 14
	self.sparrow.stats.spread = 66
	self.sparrow.stats.recoil = 74
	self.sparrow.stats.suppression = 10
	
	
	
	--[[     Grenade 26     ]]--
	self.g26.ADS_TIMER = 0.085
	self.g26.reload_speed_mult = 1.1
	
	self.g26.kick.standing = {0.4, -0.1, -0.25, 0.25}
	self.g26.kick.crouching = self.g26.kick.standing
	self.g26.kick.steelsight = self.g26.kick.standing
	
	self.g26.spread.standing = 0.4
	self.g26.spread.crouching = 0.35
	self.g26.spread.steelsight = 0.1
	self.g26.spread.moving_standing = self.g26.spread.standing * 1.1
	self.g26.spread.moving_crouching = self.g26.spread.crouching * 1.1
	self.g26.spread.moving_steelsight = self.g26.spread.steelsight * 1.1
	
	self.g26.CLIP_AMMO_MAX = 10
		
	self.g26.shake.fire_multiplier = 0.8
	self.g26.shake.fire_steelsight_multiplier = -0.8
	
	self.g26.fire_mode_data.fire_rate = 0.09009009009009009009009009009009
	
	self.g26.damage_near = 12
	self.g26.damage_far = 34
	self.g26.damage_min = 1.2
		
	self.g26.stats.damage = 14
	self.g26.stats.spread = 51
	self.g26.stats.recoil = 81
	self.g26.stats.suppression = 16
		
	
	
	--[[     Akimbo Glocknades     ]]--
	self.jowi.ADS_TIMER = 0.1275
	
	self.jowi.kick.standing = {0.4, -0.1, -0.25, 0.25}
	self.jowi.kick.crouching = self.jowi.kick.standing
	self.jowi.kick.steelsight = self.jowi.kick.standing
	
	self.jowi.spread.standing = 0.4 * 1
	self.jowi.spread.crouching = 0.35 * 1
	self.jowi.spread.steelsight = 0.1 * 1
	self.jowi.spread.moving_standing = self.jowi.spread.standing * 1.1
	self.jowi.spread.moving_crouching = self.jowi.spread.crouching * 1.1
	self.jowi.spread.moving_steelsight = self.jowi.spread.steelsight * 1.1
	
	self.jowi.CLIP_AMMO_MAX = 10 * 2
	
	self.jowi.reload_speed_mult = 1.1
	
	self.jowi.shake.fire_multiplier = 1.1
	self.jowi.shake.fire_steelsight_multiplier = 1.1
	
	self.jowi.always_hipfire = true
	
	self.jowi.fire_mode_data.fire_rate = 0.09009009009009009009009009009009 / 1.5
	
	self.jowi.damage_near = 12
	self.jowi.damage_far = 34
	self.jowi.damage_min = 1.2
		
	self.jowi.stats.damage = 14
	self.jowi.stats.spread = 41
	self.jowi.stats.recoil = 71
	self.jowi.stats.suppression = 16
	
	
	
	--[[     S-cool Shooting     ]]--
	self.tec9.ADS_TIMER = 0.130
	
	self.tec9.category = "pistol"
	
	self.tec9.kick.standing = { -0.15, 0.35, -0.3, 0.2 }
	self.tec9.kick.crouching = self.tec9.kick.standing
	self.tec9.kick.steelsight = self.tec9.kick.standing
	
	self.tec9.spread.standing = 1.1
	self.tec9.spread.crouching = 0.8
	self.tec9.spread.steelsight = 0.1
	self.tec9.spread.moving_standing = self.tec9.spread.standing * 1.3
	self.tec9.spread.moving_crouching = self.tec9.spread.crouching * 1.3
	self.tec9.spread.moving_steelsight = self.tec9.spread.steelsight * 1.3
	
	self.tec9.CLIP_AMMO_MAX = 32
	
	self.tec9.shake.fire_multiplier = 1
	self.tec9.shake.fire_steelsight_multiplier = -1
	
	self.tec9.CAN_TOGGLE_FIREMODE = false
	
	self.tec9.fire_mode_data.fire_rate = 0.1
	
	self.tec9.damage_near = 5
	self.tec9.damage_far = 40
	self.tec9.damage_min = 1.2
	
	self.tec9.stats.damage = 14
	self.tec9.stats.spread = 59
	self.tec9.stats.recoil = 67
	self.tec9.stats.suppression = 10
		
	
	
	--[[     Grenade 22C     ]]--
	self.g22c.ADS_TIMER = 0.110
	
	self.g22c.weapon_hold = "glock"
	self.g22c.reload_speed_mult = 1.1
	
	self.g22c.kick.standing = { 0.25, -0.15, -0.3, 0.3 }
	self.g22c.kick.crouching = self.g22c.kick.standing
	self.g22c.kick.steelsight = self.g22c.kick.standing
	
	self.g22c.spread.standing = 1.05
	self.g22c.spread.crouching = 0.7
	self.g22c.spread.steelsight = 0.1
	self.g22c.spread.moving_standing = self.g22c.spread.standing * 1.15
	self.g22c.spread.moving_crouching = self.g22c.spread.crouching * 1.15
	self.g22c.spread.moving_steelsight = self.g22c.spread.steelsight * 1.15
	
	self.g22c.CLIP_AMMO_MAX = 15
	
	self.g22c.fire_mode_data.fire_rate = 0.10344827586206896551724137931034
	
	self.g22c.shake.fire_multiplier = 1
	self.g22c.shake.fire_steelsight_multiplier = -1
	
	self.g22c.armor_piercing_chance = 0.05
	
	self.g22c.damage_near = 6
	self.g22c.damage_far = 44
	self.g22c.damage_min = 1.35
	
	self.g22c.stats.damage = 17
	self.g22c.stats.spread = 62
	self.g22c.stats.recoil = 69
	self.g22c.stats.suppression = 12
		
		
	
	--[[     Akimbo Grenade 22C     ]]--
	self.x_g22c.ADS_TIMER = 0.165
	
	self.x_g22c.kick.standing = { 0.25, -0.15, -0.3, 0.3 }
	self.x_g22c.kick.crouching = self.x_g22c.kick.standing
	self.x_g22c.kick.steelsight = self.x_g22c.kick.standing
	
	self.x_g22c.spread.standing = 1.05 * 1
	self.x_g22c.spread.crouching = 0.7 * 1
	self.x_g22c.spread.steelsight = 0.1 * 1
	self.x_g22c.spread.moving_standing = self.x_g22c.spread.standing * 1.15
	self.x_g22c.spread.moving_crouching = self.x_g22c.spread.crouching * 1.15
	self.x_g22c.spread.moving_steelsight = self.x_g22c.spread.steelsight * 1.15
	
	self.x_g22c.CLIP_AMMO_MAX = 15 * 2
	
	self.x_g22c.always_hipfire = true
	
	self.x_g22c.fire_mode_data.fire_rate = 0.10344827586206896551724137931034 / 1.5
	
	self.x_g22c.shake.fire_multiplier = 1
	self.x_g22c.shake.fire_steelsight_multiplier = -1
	
	self.x_g22c.armor_piercing_chance = 0.05
	
	self.x_g22c.damage_near = 6
	self.x_g22c.damage_far = 44
	self.x_g22c.damage_min = 1.35
	
	self.x_g22c.stats.damage = 17
	self.x_g22c.stats.spread = 52
	self.x_g22c.stats.recoil = 59
	self.x_g22c.stats.suppression = 12
	
	
	--[[     PEE TOOT TOOT SEX     ]]--
	self.p226.weapon_hold = "colt_1911"
	
	self.p226.ADS_TIMER = 0.110
	self.p226.reload_speed_mult = 0.95
	
	self.p226.kick.standing = { 0.4, 0.3, -0.175, 0.175 }
	self.p226.kick.crouching = self.p226.kick.standing
	self.p226.kick.steelsight = self.p226.kick.standing
	
	self.p226.spread.standing = 1.0
	self.p226.spread.crouching = 0.7
	self.p226.spread.steelsight = 0.1
	self.p226.spread.moving_standing = self.p226.spread.standing * 1.25
	self.p226.spread.moving_crouching = self.p226.spread.crouching * 1.25
	self.p226.spread.moving_steelsight = self.p226.spread.steelsight * 1.25
	
	self.p226.fire_mode_data.fire_rate = 0.11111111111111111111111111111111
	
	self.p226.CLIP_AMMO_MAX = 13
	
	self.p226.shake.fire_multiplier = 1
	self.p226.shake.fire_steelsight_multiplier = -1
	
	self.p226.armor_piercing_chance = 0.05
	
	self.p226.damage_near = 12
	self.p226.damage_far = 47
	self.p226.damage_min = 1.4
	
	self.p226.stats.damage = 17
	self.p226.stats.spread = 71
	self.p226.stats.recoil = 60
	self.p226.stats.suppression = 12
	
	
	
	--[[     Spring Feels     ]]--
	self.hs2000.weapon_hold = "glock"
	
	self.hs2000.ADS_TIMER = 0.110
	
	self.hs2000.kick.standing = { 0.25, 0.35, -0.2, 0.2 }
	self.hs2000.kick.crouching = self.hs2000.kick.standing
	self.hs2000.kick.steelsight = self.hs2000.kick.standing
	
	self.hs2000.spread.standing = 0.65
	self.hs2000.spread.crouching = 0.5
	self.hs2000.spread.steelsight = 0.1
	self.hs2000.spread.moving_standing = self.hs2000.spread.standing * 1.2
	self.hs2000.spread.moving_crouching = self.hs2000.spread.crouching * 1.2
	self.hs2000.spread.moving_steelsight = self.hs2000.spread.steelsight * 1.2
	
	self.hs2000.fire_mode_data.fire_rate = 0.12
	
	self.hs2000.CLIP_AMMO_MAX = 16
	
	self.hs2000.shake.fire_multiplier = 1.2
	self.hs2000.shake.fire_steelsight_multiplier = -1.2
	
	self.hs2000.armor_piercing_chance = 0.05
	
	self.hs2000.damage_near = 9
	self.hs2000.damage_far = 52
	self.hs2000.damage_min = 1.4
	
	self.hs2000.stats.damage = 17
	self.hs2000.stats.spread = 64
	self.hs2000.stats.recoil = 53
	self.hs2000.stats.suppression = 12
	
	
	
	--[[     STOPPAN POWAH     ]]--
	self.colt_1911.weapon_hold = "glock"
	
	self.colt_1911.ADS_TIMER = 0.120
	
	self.colt_1911.kick.standing = { 0.3, 0.15, -0.275, 0.275 }
	self.colt_1911.kick.crouching = self.colt_1911.kick.standing
	self.colt_1911.kick.steelsight = self.colt_1911.kick.standing
	
	self.colt_1911.spread.standing = 0.65
	self.colt_1911.spread.crouching = 0.5
	self.colt_1911.spread.steelsight = 0.1
	self.colt_1911.spread.moving_standing = self.colt_1911.spread.standing * 1.1
	self.colt_1911.spread.moving_crouching = self.colt_1911.spread.crouching * 1.1
	self.colt_1911.spread.moving_steelsight = self.colt_1911.spread.steelsight * 1.1
	
	self.colt_1911.CLIP_AMMO_MAX = 8
	
	self.colt_1911.fire_mode_data.fire_rate = 0.13186813186813186813186813186813
	
	self.colt_1911.armor_piercing_chance = 0.1
	
	self.colt_1911.shake.fire_multiplier = 1.5
	self.colt_1911.shake.fire_steelsight_multiplier = -1.5
	
	self.colt_1911.damage_near = 12
	self.colt_1911.damage_far = 54
	self.colt_1911.damage_min = 1.65
	
	self.colt_1911.stats.damage = 20
	self.colt_1911.stats.spread = 58
	self.colt_1911.stats.recoil = 51
	self.colt_1911.stats.suppression = 10
	
	
	
	--[[     DOUBLE THE STOPPAN POWAH     ]]--
	self.x_1911.ADS_TIMER = 0.180
	
	self.x_1911.kick.standing = { 0.3, 0.15, -0.275, 0.275 }
	self.x_1911.kick.crouching = self.x_1911.kick.standing
	self.x_1911.kick.steelsight = self.x_1911.kick.standing
	
	self.x_1911.spread.standing = 0.65 * 1
	self.x_1911.spread.crouching = 0.5 * 1
	self.x_1911.spread.steelsight = 0.1 * 1
	self.x_1911.spread.moving_standing = self.x_1911.spread.standing * 1.1
	self.x_1911.spread.moving_crouching = self.x_1911.spread.crouching * 1.1
	self.x_1911.spread.moving_steelsight = self.x_1911.spread.steelsight * 1.1
	
	self.x_1911.CLIP_AMMO_MAX = 8 * 2
	
	self.x_1911.fire_mode_data.fire_rate = 0.13186813186813186813186813186813 / 1.5
	
	self.x_1911.always_hipfire = true
	
	self.x_1911.armor_piercing_chance = 0.1
	
	self.x_1911.shake.fire_multiplier = 1.6
	self.x_1911.shake.fire_steelsight_multiplier = 1.6
	
	self.x_1911.damage_near = 12
	self.x_1911.damage_far = 54
	self.x_1911.damage_min = 1.65
	
	self.x_1911.stats.damage = 20
	self.x_1911.stats.spread = 48
	self.x_1911.stats.recoil = 41
	self.x_1911.stats.suppression = 10
	
	
	
	--[[     U SUCK PEEN -H&K     ]]--
	self.usp.weapon_hold = "colt_1911"
	
	self.usp.ADS_TIMER = 0.120
	self.usp.reload_speed_mult = 0.9
	
	self.usp.kick.standing = { 0.35, 0.2, -0.225, 0.225 }
	self.usp.kick.crouching = self.usp.kick.standing
	self.usp.kick.steelsight = self.usp.kick.standing
	
	self.usp.spread.standing = 0.85
	self.usp.spread.crouching = 0.7
	self.usp.spread.steelsight = 0.1
	self.usp.spread.moving_standing = self.usp.spread.standing * 1.3
	self.usp.spread.moving_crouching = self.usp.spread.crouching * 1.3
	self.usp.spread.moving_steelsight = self.usp.spread.steelsight * 1.3
	
	self.usp.CLIP_AMMO_MAX = 12
	
	self.usp.fire_mode_data.fire_rate = 0.14117647058823529411764705882353
	
	self.usp.armor_piercing_chance = 0.1
	
	self.usp.shake.fire_multiplier = 1.1
	self.usp.shake.fire_steelsight_multiplier = -1.1
	
	self.usp.damage_near = 7
	self.usp.damage_far = 58
	self.usp.damage_min = 1.55
	
	self.usp.stats.damage = 20
	self.usp.stats.spread = 65
	self.usp.stats.recoil = 42
	self.usp.stats.suppression = 10
	
	--[[     AKIMBO USP     ]]--
	self.x_usp.ADS_TIMER = 0.180
	self.x_usp.reload_speed_mult = 0.9
	
	self.x_usp.kick.standing = { 0.35, 0.2, -0.225, 0.225 }
	self.x_usp.kick.crouching = self.x_usp.kick.standing
	self.x_usp.kick.steelsight = self.x_usp.kick.standing
	
	self.x_usp.spread.standing = 0.85 * 1
	self.x_usp.spread.crouching = 0.7 * 1
	self.x_usp.spread.steelsight = 0.1 * 1
	self.x_usp.spread.moving_standing = self.x_usp.spread.standing * 1.3
	self.x_usp.spread.moving_crouching = self.x_usp.spread.crouching * 1.3
	self.x_usp.spread.moving_steelsight = self.x_usp.spread.steelsight * 1.3
	
	self.x_usp.CLIP_AMMO_MAX = 12 * 2
	
	self.x_usp.fire_mode_data.fire_rate = 0.14117647058823529411764705882353 / 1.5
	
	self.x_usp.always_hipfire = true
	
	self.x_usp.armor_piercing_chance = 0.1
	
	self.x_usp.shake.fire_multiplier = 1.1
	self.x_usp.shake.fire_steelsight_multiplier = -1.1
	
	self.x_usp.damage_near = 7
	self.x_usp.damage_far = 58
	self.x_usp.damage_min = 1.55
	
	self.x_usp.stats.damage = 20
	self.x_usp.stats.spread = 55
	self.x_usp.stats.recoil = 36
	self.x_usp.stats.suppression = 10
	
	
	
	--[[     C Nien-ty Six     ]]--	
	self.c96.ADS_TIMER = 0.120
	
	self.c96.kick.standing = { 0.6, 0.45, -0.225, 0.225 }
	self.c96.kick.crouching = self.c96.kick.standing
	self.c96.kick.steelsight = self.c96.kick.standing
	
	self.c96.spread.standing = 1.0
	self.c96.spread.crouching = 0.8
	self.c96.spread.steelsight = 0.1
	self.c96.spread.moving_standing = self.c96.spread.standing * 1.3
	self.c96.spread.moving_crouching = self.c96.spread.crouching * 1.3
	self.c96.spread.moving_steelsight = self.c96.spread.steelsight * 1.3
	
	self.c96.fire_mode_data.fire_rate = 0.13333333333333333333333333333333
	
	self.c96.armor_piercing_chance = 0.15
	
	self.c96.shake.fire_multiplier = 1.3
	self.c96.shake.fire_steelsight_multiplier = -1.3
	
	self.c96.damage_near = 10
	self.c96.damage_far = 60
	self.c96.damage_min = 1.8
		
	self.c96.stats.damage = 20
	self.c96.stats.spread = 71
	self.c96.stats.recoil = 45
	self.c96.stats.suppression = 11
	
	
	
	--[[     TOGUSA     ]]--
	self.mateba.sub_category = "revolvo"
	
	self.mateba.ADS_TIMER = 0.125
	
	self.mateba.kick.standing = { 0.3, 0.6, -0.55, 0.55 }
	self.mateba.kick.crouching = self.mateba.kick.standing
	self.mateba.kick.steelsight = self.mateba.kick.standing
	
	self.mateba.spread.standing = 1.0
	self.mateba.spread.crouching = 0.7
	self.mateba.spread.steelsight = 0.1
	self.mateba.spread.moving_standing = self.mateba.spread.standing * 1.1
	self.mateba.spread.moving_crouching = self.mateba.spread.crouching * 1.1
	self.mateba.spread.moving_steelsight = self.mateba.spread.steelsight * 1.1
	
	self.mateba.fire_mode_data.fire_rate = 0.2
	
	self.mateba.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.mateba.CLIP_AMMO_MAX = 6
	
	self.mateba.reload_speed_mult = 1
	
	self.mateba.armor_piercing_chance = 0.15
	
	self.mateba.damage_near = 8
	self.mateba.damage_far = 50
	self.mateba.damage_min = 2.6
	
	self.mateba.stats.damage = 36
	self.mateba.stats.spread = 68
	self.mateba.stats.recoil = 39
	self.mateba.stats.suppression = 9
	
	--[[     HUEHUEHUEHUEHUE     ]]--
	self.new_raging_bull.sub_category = "revolvo"
	
	self.new_raging_bull.ADS_TIMER = 0.135
	
	self.new_raging_bull.kick.standing = { 0.8, 1.0, -0.1, 0.1 }
	self.new_raging_bull.kick.crouching = self.new_raging_bull.kick.standing
	self.new_raging_bull.kick.steelsight = self.new_raging_bull.kick.standing
	
	self.new_raging_bull.spread.standing = 1.3
	self.new_raging_bull.spread.crouching = 0.9
	self.new_raging_bull.spread.steelsight = 0.1
	self.new_raging_bull.spread.moving_standing = self.new_raging_bull.spread.standing * 1.15
	self.new_raging_bull.spread.moving_crouching = self.new_raging_bull.spread.crouching * 1.15
	self.new_raging_bull.spread.moving_steelsight = self.new_raging_bull.spread.steelsight * 1.15
	
	self.new_raging_bull.fire_mode_data.fire_rate = 0.23076923076923076923076923076923
	
	self.new_raging_bull.CLIP_AMMO_MAX = 6
	
	self.new_raging_bull.shake.fire_multiplier = 1.75
	self.new_raging_bull.shake.fire_steelsight_multiplier = -1.75
	
	self.new_raging_bull.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.new_raging_bull.armor_piercing_chance = 0.2
	
	self.new_raging_bull.damage_near = 8
	self.new_raging_bull.damage_far = 62
	self.new_raging_bull.damage_min = 3.75
	
	self.new_raging_bull.stats.damage = 48
	self.new_raging_bull.stats.spread = 76
	self.new_raging_bull.stats.recoil = 21
	self.new_raging_bull.stats.suppression = 6
	
	
	
	--[[     REVOLVER OCELOT     ]]--
	self.peacemaker.sub_category = "revolvo" --ocelot
	
	self.peacemaker.ADS_TIMER = 0.140
	
	self.peacemaker.kick.standing = { 0.8, 0.6, -0.3, 0.3 }
	self.peacemaker.kick.crouching = self.peacemaker.kick.standing
	self.peacemaker.kick.steelsight = self.peacemaker.kick.standing
	
	self.peacemaker.spread.standing = 0.9
	self.peacemaker.spread.crouching = 0.6
	self.peacemaker.spread.steelsight = 0.1
	self.peacemaker.spread.moving_standing = self.peacemaker.spread.standing * 1.2
	self.peacemaker.spread.moving_crouching = self.peacemaker.spread.crouching * 1.2
	self.peacemaker.spread.moving_steelsight = self.peacemaker.spread.steelsight * 1.2
	
	self.peacemaker.fire_mode_data.fire_rate = 0.26086956521739130434782608695652
	
	self.peacemaker.CLIP_AMMO_MAX = 6
	
	self.peacemaker.shake.fire_multiplier = 2
	self.peacemaker.shake.fire_steelsight_multiplier = -2
	
	self.peacemaker.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.peacemaker.armor_piercing_chance = 0.2
	
	self.peacemaker.damage_near = 12
	self.peacemaker.damage_far = 48
	self.peacemaker.damage_min = 3.0
	
	self.peacemaker.stats_modifiers = {}
	
	self.peacemaker.stats.damage = 56
	self.peacemaker.stats.spread = 69
	self.peacemaker.stats.recoil = 3
	self.peacemaker.stats.suppression = 5
	
	
	
	--[[     Is that a FAMAS?     ]]--
	self.deagle.ADS_TIMER = 0.145
	
	self.deagle.kick.standing = { 0.5, 1.1, 0.1, 0.3 }
	self.deagle.kick.crouching = self.deagle.kick.standing
	self.deagle.kick.steelsight = self.deagle.kick.standing
	
	self.deagle.spread.standing = 1.4
	self.deagle.spread.crouching = 1
	self.deagle.spread.steelsight = 0.1
	self.deagle.spread.moving_standing = self.deagle.spread.standing * 1.35
	self.deagle.spread.moving_crouching = self.deagle.spread.crouching * 1.35
	self.deagle.spread.moving_steelsight = self.deagle.spread.steelsight * 1.35
	
	self.deagle.CLIP_AMMO_MAX = 7
	
	self.deagle.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.deagle.shake.fire_multiplier = 3.5
	self.deagle.shake.fire_steelsight_multiplier = -3.5
	
	self.deagle.fire_mode_data.fire_rate = 0.3
	
	self.deagle.armor_piercing_chance = 0.2
	
	self.deagle.damage_near = 6
	self.deagle.damage_far = 54
	self.deagle.damage_min = 3.2
	
	self.deagle.stats_modifiers = {
		damage = 2
	}
	
	self.deagle.stats.damage = 36
	self.deagle.stats.spread = 66
	self.deagle.stats.recoil = 15
	self.deagle.stats.suppression = 4
	
	
	
	--[[     DUAL FAMAS     ]]--
	self.x_deagle.ADS_TIMER = 0.2175
	
	self.x_deagle.kick.standing = { 0.3, 0.7, -0.5, 0.5 }
	self.x_deagle.kick.crouching = self.x_deagle.kick.standing
	self.x_deagle.kick.steelsight = self.x_deagle.kick.standing
	
	self.x_deagle.spread.standing = 1.4 * 1
	self.x_deagle.spread.crouching = 1 * 1
	self.x_deagle.spread.steelsight = 0.1 * 1
	self.x_deagle.spread.moving_standing = self.x_deagle.spread.standing * 1.35
	self.x_deagle.spread.moving_crouching = self.x_deagle.spread.crouching * 1.35
	self.x_deagle.spread.moving_steelsight = self.x_deagle.spread.steelsight * 1.35
	
	self.x_deagle.CLIP_AMMO_MAX = 7 * 2
	
	self.x_deagle.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.x_deagle.shake.fire_multiplier = 4.2
	self.x_deagle.shake.fire_steelsight_multiplier = 4.2
	
	self.x_deagle.fire_mode_data.fire_rate = 0.3 / 1.5
	
	self.x_deagle.armor_piercing_chance = 0.2
	
	self.x_deagle.always_hipfire = true
	
	self.x_deagle.animations.has_steelsight_stance = false
	
	self.x_deagle.damage_near = 6
	self.x_deagle.damage_far = 54
	self.x_deagle.damage_min = 3.2
	
	self.x_deagle.stats_modifiers = {
		damage = 2
	}
	
	self.x_deagle.stats.damage = 36
	self.x_deagle.stats.spread = 56
	self.x_deagle.stats.recoil = 5
	self.x_deagle.stats.suppression = 4
	
	
	
	--[[     JUDY     ]]--
	self.judge.ADS_TIMER = 0.135
	
	self.judge.category = "pistol"
	self.judge.sub_category = "revolvo"
	
	self.judge.kick.standing = {0.52, 0.68, -0.4, 0.4 }
	self.judge.kick.crouching = self.judge.kick.standing
	self.judge.kick.steelsight = self.judge.kick.standing
			
	self.judge.spread.standing = 1.1
	self.judge.spread.crouching = self.judge.spread.standing * 0.8
	self.judge.spread.steelsight = 0.3
	self.judge.spread.moving_standing = self.judge.spread.standing
	self.judge.spread.moving_crouching = self.judge.spread.crouching
	self.judge.spread.moving_steelsight = self.judge.spread.steelsight
	
	self.judge.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.judge.CLIP_AMMO_MAX = 5
	
	self.judge.rays = 5
	
	self.judge.armor_piercing_chance = 0.1
	
	self.judge.damage_near = 9
	self.judge.damage_far = 24
	
	self.judge.shake.fire_multiplier = 1.25
	self.judge.shake.fire_steelsight_multiplier = -1.25
	
	self.judge.fire_mode_data.fire_rate = 0.2
	
	self.judge.stats_modifiers = {
			damage = 2,
		}
		
	self.judge.stats.damage = 40
	self.judge.stats.spread = 46
	self.judge.stats.recoil = 41
	self.judge.stats.suppression = 4
	
	--}
	
	
		
	-----------------------[[SMGS]]-----------------------
	--{
	--[[     GLORIOUS CZECHNOLOGY     ]]--
	self.scorpion.ADS_TIMER = 0.150
	
	self.scorpion.kick.standing = { 0.3, -0.15, -0.275, 0.275 }
	self.scorpion.kick.crouching = self.scorpion.kick.standing
	self.scorpion.kick.steelsight = self.scorpion.kick.standing
	
	self.scorpion.spread.standing = 0.65
	self.scorpion.spread.crouching = 0.55
	self.scorpion.spread.steelsight = 0.1
	self.scorpion.spread.moving_standing = self.scorpion.spread.standing * 1.1
	self.scorpion.spread.moving_crouching = self.scorpion.spread.crouching * 1.1
	self.scorpion.spread.moving_steelsight = self.scorpion.spread.steelsight * 1.1
	
	self.scorpion.fire_mode_data.fire_rate = 0.070588235294117
	
	self.scorpion.shake.fire_multiplier = 1
	self.scorpion.shake.fire_steelsight_multiplier = -1
	
	self.scorpion.damage_near = 9
	self.scorpion.damage_far = 42
	self.scorpion.damage_min = 1.15
	
	self.scorpion.stats.damage = 14
	self.scorpion.stats.spread = 58
	self.scorpion.stats.recoil = 86
	self.scorpion.stats.suppression = 17
	
	
	
	--[[     Loli no pantsu     ]]--
	self.mp9.ADS_TIMER = 0.150
	
	self.mp9.sub_category = "mach_pis"
	
	self.mp9.kick.standing = {-0.2, 0.3, -0.25, 0.25 }
	self.mp9.kick.crouching = self.mp9.kick.standing
	self.mp9.kick.steelsight = self.mp9.kick.standing
	
	self.mp9.fire_mode_data.fire_rate = 0.0667
	
	self.mp9.spread.standing = 0.7
	self.mp9.spread.crouching = 0.6
	self.mp9.spread.steelsight = 0.1
	self.mp9.spread.moving_standing = self.mp9.spread.standing * 1.05
	self.mp9.spread.moving_crouching = self.mp9.spread.crouching * 1.05
	self.mp9.spread.moving_steelsight = self.mp9.spread.steelsight * 1.05
	
	self.mp9.CLIP_AMMO_MAX = 20
	
	self.mp9.shake.fire_multiplier = 0.65
	self.mp9.shake.fire_steelsight_multiplier = -0.65
	
	self.mp9.damage_near = 10
	self.mp9.damage_far = 48
	self.mp9.damage_min = 1.25
	
	self.mp9.stats.damage = 16
	self.mp9.stats.spread = 65
	self.mp9.stats.recoil = 83
	self.mp9.stats.suppression = 14
	
	
	
	--[[     I'd G3's little sister     ]]--
	self.new_mp5.ADS_TIMER = 0.160
	
	self.new_mp5.kick.standing = {0.35, -0.15, -0.25, 0.25 }
	self.new_mp5.kick.crouching = self.new_mp5.kick.standing
	self.new_mp5.kick.steelsight = self.new_mp5.kick.standing
	
	self.new_mp5.spread.standing = 0.9
	self.new_mp5.spread.crouching = 0.7
	self.new_mp5.spread.steelsight = 0.1
	self.new_mp5.spread.moving_standing = self.new_mp5.spread.standing * 1.2
	self.new_mp5.spread.moving_crouching = self.new_mp5.spread.crouching * 1.2
	self.new_mp5.spread.moving_steelsight = self.new_mp5.spread.steelsight * 1.2
	
	self.new_mp5.fire_mode_data.fire_rate = 0.075
	self.new_mp5.ADAPTIVE_BURST_SIZE = false
	self.new_mp5.BURST_FIRE = 3
	self.new_mp5.BURST_FIRE_RATE_MULTIPLIER = 1.1
	
	self.new_mp5.shake.fire_multiplier = 0.6
	self.new_mp5.shake.fire_steelsight_multiplier = -0.6
	
	self.new_mp5.damage_near = 7
	self.new_mp5.damage_far = 60
	self.new_mp5.damage_min = 1.25
	
	self.new_mp5.stats.damage = 16
	self.new_mp5.stats.spread = 71
	self.new_mp5.stats.recoil = 76
	self.new_mp5.stats.suppression = 14
	
	
	
	--[[     DID WE MENTION WE'RE SWEDISH -Overkill     ]]--
	self.m45.ADS_TIMER = 0.170
	
	self.m45.kick.standing = { -0.1, 0.25, -0.3, 0.3 }
	self.m45.kick.crouching = self.m45.kick.standing
	self.m45.kick.steelsight = self.m45.kick.standing
	
	self.m45.spread.standing = 0.7
	self.m45.spread.crouching = 0.5
	self.m45.spread.steelsight = 0.1
	self.m45.spread.moving_standing = self.m45.spread.standing * 1.25
	self.m45.spread.moving_crouching = self.m45.spread.crouching * 1.25
	self.m45.spread.moving_steelsight = self.m45.spread.steelsight * 1.25
	
	self.m45.CLIP_AMMO_MAX = 36
	
	self.m45.damage_near = 15
	self.m45.damage_far = 50
	self.m45.damage_min = 1.4
	
	self.m45.stats.damage = 16
	self.m45.stats.spread = 61
	self.m45.stats.recoil = 86
	self.m45.stats.suppression = 14
	
	
	
	--[[     Ooze E     ]]--
	self.uzi.ADS_TIMER = 0.160
	
	self.uzi.kick.standing = { -0.25, 0.45, -0.15, 0.15 }
	self.uzi.kick.crouching = self.uzi.kick.standing
	self.uzi.kick.steelsight = self.uzi.kick.standing
	
	self.uzi.spread.standing = 1
	self.uzi.spread.crouching = 0.8
	self.uzi.spread.steelsight = 0.1
	self.uzi.spread.moving_standing = self.uzi.spread.standing * 1.125
	self.uzi.spread.moving_crouching = self.uzi.spread.crouching * 1.125
	self.uzi.spread.moving_steelsight = self.uzi.spread.steelsight * 1.125
	
	self.uzi.fire_mode_data.fire_rate = 0.1
	
	self.uzi.CLIP_AMMO_MAX = 32
	
	self.uzi.timers.reload_not_empty = 2.2
	
	self.uzi.damage_near = 12
	self.uzi.damage_far = 56
	self.uzi.damage_min = 1.4
	
	self.uzi.stats.damage = 16
	self.uzi.stats.spread = 69
	self.uzi.stats.recoil = 80
	self.uzi.stats.suppression = 14
	
	
	
	--[[     (9) BALL     ]]--
	self.baka.ADS_TIMER = 0.150
	
	self.baka.sub_category = "mach_pis"
	
	self.baka.kick.standing = { 0.05, 0.35, -0.3, 0.3 }
	self.baka.kick.crouching = self.baka.kick.standing
	self.baka.kick.steelsight = self.baka.kick.standing
	
	self.baka.spread.standing = 0.8
	self.baka.spread.crouching = 0.65
	self.baka.spread.steelsight = 0.1
	self.baka.spread.moving_standing = self.baka.spread.standing * 1.1
	self.baka.spread.moving_crouching = self.baka.spread.crouching * 1.1
	self.baka.spread.moving_steelsight = self.baka.spread.steelsight * 1.1
	
	self.baka.damage_near = 5
	self.baka.damage_far = 45
	self.baka.damage_min = 1.25
	
	self.baka.stats.damage = 16
	self.baka.stats.spread = 60
	self.baka.stats.recoil = 41
	self.baka.stats.suppression = 10
	
	
	
	--[[     Star Wars     ]]--
	self.sterling.ADS_TIMER = 0.170
	
	self.sterling.kick.standing = { -0.25, 0.55, -0.1, 0.1 }
	self.sterling.kick.crouching = self.sterling.kick.standing
	self.sterling.kick.steelsight = self.sterling.kick.standing
	
	self.sterling.spread.standing = 0.9
	self.sterling.spread.crouching = 0.65
	self.sterling.spread.steelsight = 0.1
	self.sterling.spread.moving_standing = self.sterling.spread.standing * 1.2
	self.sterling.spread.moving_crouching = self.sterling.spread.crouching * 1.2
	self.sterling.spread.moving_steelsight = self.sterling.spread.steelsight * 1.2
	
	self.sterling.shake.fire_multiplier = 0.9
	self.sterling.shake.fire_steelsight_multiplier = -0.9
	
	self.sterling.damage_near = 13
	self.sterling.damage_far = 60
	self.sterling.damage_min = 1.4
	
	self.sterling.stats.damage = 16
	self.sterling.stats.spread = 71
	self.sterling.stats.recoil = 78
	self.sterling.stats.suppression = 12
	
	
	--[[     M10's littler sister     ]]--
	self.cobray.sub_category = "mach_pis"
	
	self.cobray.ADS_TIMER = 0.170
	self.cobray.reload_speed_mult = 1.1
	
	self.cobray.kick.standing = { -0.05, 0.45, -0.25, 0.25 }
	self.cobray.kick.crouching = self.cobray.kick.standing
	self.cobray.kick.steelsight = self.cobray.kick.standing
	
	self.cobray.spread.standing = 0.95
	self.cobray.spread.crouching = 0.55
	self.cobray.spread.steelsight = 0.1
	self.cobray.spread.moving_standing = self.cobray.spread.standing * 1.2
	self.cobray.spread.moving_crouching = self.cobray.spread.crouching * 1.2
	self.cobray.spread.moving_steelsight = self.cobray.spread.steelsight * 1.2
	
	self.cobray.shake.fire_multiplier = 0.8
	self.cobray.shake.fire_steelsight_multiplier = -0.8
	
	self.cobray.damage_near = 7
	self.cobray.damage_far = 50
	self.cobray.damage_min = 1.25
	
	self.cobray.stats.damage = 16
	self.cobray.stats.spread = 68
	self.cobray.stats.recoil = 61
	self.cobray.stats.suppression = 10
	
	
	
	--[[     ILIKESHOOTINGTHINGSREALLYREALLYFASTFASTERTHANSANICAMITOOFASTFORYOUTOOBADDEALWITHIT     ]]--
	self.mac10.sub_category = "mach_pis"
	
	self.mac10.ADS_TIMER = 0.170
	
	self.mac10.timers.reload_empty = 2.2
	self.mac10.timers.reload_not_empty = 1.5
	
	self.mac10.kick.standing = { 0.05, 0.35, -0.3, 0.3 }
	self.mac10.kick.crouching = self.mac10.kick.standing
	self.mac10.kick.steelsight = self.mac10.kick.standing
	
	self.mac10.spread.standing = 1.0
	self.mac10.spread.crouching = 0.7
	self.mac10.spread.steelsight = 0.1
	self.mac10.spread.moving_standing = self.mac10.spread.standing * 1.15
	self.mac10.spread.moving_crouching = self.mac10.spread.crouching * 1.15
	self.mac10.spread.moving_steelsight = self.mac10.spread.steelsight * 1.15
	
	self.mac10.fire_mode_data.fire_rate = 0.0521739130434
	
	self.mac10.armor_piercing_chance = 0.1
	
	self.mac10.CLIP_AMMO_MAX = 20
	
	self.mac10.shake.fire_multiplier = 0.75
	self.mac10.shake.fire_steelsight_multiplier = -0.75
	
	self.mac10.damage_near = 8
	self.mac10.damage_far = 55
	self.mac10.damage_min = 1.6
	
	self.mac10.stats.damage = 22
	self.mac10.stats.spread = 55
	self.mac10.stats.recoil = 51
	self.mac10.stats.suppression = 9
	
	
	--[[     ACCELERATOR     ]]--
	self.polymer.ADS_TIMER = 0.200
	
	self.polymer.kick.standing = { -0.15, 0.35, -0.25, 0.25 }
	self.polymer.kick.crouching = self.polymer.kick.standing
	self.polymer.kick.steelsight = self.polymer.kick.standing
	
	self.polymer.spread.standing = 1.5
	self.polymer.spread.crouching = 1.3
	self.polymer.spread.steelsight = 0.1
	self.polymer.spread.moving_standing = self.polymer.spread.standing * 1.25
	self.polymer.spread.moving_crouching = self.polymer.spread.crouching * 1.25
	self.polymer.spread.moving_steelsight = self.polymer.spread.steelsight * 1.25
	
	self.polymer.fire_mode_data.fire_rate = 0.05
	
	self.polymer.reload_speed_mult = 0.9
	
	self.polymer.armor_piercing_chance = 0.1
	
	self.polymer.ADAPTIVE_BURST_SIZE = false
	self.polymer.BURST_FIRE = 2
	
	self.polymer.CLIP_AMMO_MAX = 25
	
	self.polymer.shake.fire_multiplier = 0.35
	self.polymer.shake.fire_steelsight_multiplier = -0.35
	
	self.polymer.damage_near = 4
	self.polymer.damage_far = 64
	self.polymer.damage_min = 1.6
	
	self.polymer.stats.damage = 22
	self.polymer.stats.spread = 61
	self.polymer.stats.recoil = 78
	self.polymer.stats.suppression = 9
		
	
	
	--[[     Thompson-sensei     ]]--	
	self.m1928.ADS_TIMER = 0.210
	
	self.m1928.kick.standing = { -0.125, 0.275, -0.3, 0.3 }
	self.m1928.kick.crouching = self.m1928.kick.standing
	self.m1928.kick.steelsight = self.m1928.kick.standing
	
	self.m1928.spread.standing = 1.1
	self.m1928.spread.crouching = 0.8
	self.m1928.spread.steelsight = 0.1
	self.m1928.spread.moving_standing = self.m1928.spread.standing * 1.4
	self.m1928.spread.moving_crouching = self.m1928.spread.crouching * 1.4
	self.m1928.spread.moving_steelsight = self.m1928.spread.steelsight * 1.4
	
	self.m1928.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.m1928.sounds.leave_steelsight = "primary_steel_sight_exit"
	
	self.m1928.fire_mode_data.fire_rate = 0.08571428571428571428571428571429
	
	self.m1928.armor_piercing_chance = 0.1
	
	self.m1928.CLIP_AMMO_MAX = 50
	
	self.m1928.shake.fire_multiplier = 0.45
	self.m1928.shake.fire_steelsight_multiplier = -0.45
	
	self.m1928.damage_near = 13
	self.m1928.damage_far = 67.5
	self.m1928.damage_min = 1.7
	
	self.m1928.stats.damage = 22
	self.m1928.stats.spread = 65
	self.m1928.stats.recoil = 66
	self.m1928.stats.suppression = 9
	--}
	
	
		
	-----------------------[[PDWS]]-----------------------
	--{
	--[[     I'd this little sister too (I'd all the H&K gun girls tbh)     ]]--
	self.mp7.sub_category = "pdw"
	self.mp7.ADS_TIMER = 0.190
	self.mp7.reload_speed_mult = 1.15
	
	self.mp7.kick.standing = {0.3, -0.2, -0.15, 0.35}
	self.mp7.kick.crouching = self.mp7.kick.standing
	self.mp7.kick.steelsight = self.mp7.kick.standing
	
	self.mp7.spread.standing = 1.1
	self.mp7.spread.crouching = 0.6
	self.mp7.spread.steelsight = 0.1
	self.mp7.spread.moving_standing = self.mp7.spread.standing * 1.2
	self.mp7.spread.moving_crouching = self.mp7.spread.crouching * 1.2
	self.mp7.spread.moving_steelsight = self.mp7.spread.steelsight * 1.2
	
	self.mp7.armor_piercing_chance = 0.45
	
	self.mp7.fire_mode_data.fire_rate = 0.06315789473
	
	self.mp7.CLIP_AMMO_MAX = 20
	
	self.mp7.shake.fire_multiplier = 0.7
	self.mp7.shake.fire_steelsight_multiplier = -0.7
	
	self.mp7.damage_near = 16
	self.mp7.damage_far = 72.5
	self.mp7.damage_min = 1.95
	
	self.mp7.stats.damage = 13
	self.mp7.stats.spread = 72
	self.mp7.stats.recoil = 87
	self.mp7.stats.suppression = 15
	
	
	
	--[[     Overpriced .22LR     ]]--
	self.p90.sub_category = "pdw"
	
	self.p90.reload_speed_mult = 0.70
	self.p90.ADS_TIMER = 0.170
	
	self.p90.kick.standing = {0.35, -0.2, -0.225, 0.225 }
	self.p90.kick.crouching = self.p90.kick.standing
	self.p90.kick.steelsight = self.p90.kick.standing
	
	self.p90.spread.standing = 1.0
	self.p90.spread.crouching = 0.5
	self.p90.spread.steelsight = 0.1
	self.p90.spread.moving_standing = self.p90.spread.standing * 1.1
	self.p90.spread.moving_crouching = self.p90.spread.crouching * 1.1
	self.p90.spread.moving_steelsight = self.p90.spread.steelsight * 1.1
	
	self.p90.armor_piercing_chance = 0.5
	
	self.p90.fire_mode_data.fire_rate = 0.066666666666
	
	self.p90.shake.fire_multiplier = 0.57
	self.p90.shake.fire_steelsight_multiplier = -0.57
	
	self.p90.CLIP_AMMO_MAX = 50
	
	self.p90.damage_near = 22
	self.p90.damage_far = 80
	self.p90.damage_min = 2.0
	
	self.p90.stats.damage = 13
	self.p90.stats.spread = 79
	self.p90.stats.recoil = 81
	self.p90.stats.suppression = 13
	--}
	
		
		
	-----------------------[[CARBINES]]-----------------------
	--{
	--[[     I'm Special     ]]--
	self.olympic.category = "assault_rifle"
	self.olympic.sub_category = "carbine"
	
	self.olympic.ADS_TIMER = 0.210
	
	self.olympic.kick.standing = { -0.225, 0.525, -0.375, 0.375 }
	self.olympic.kick.crouching = self.olympic.kick.standing
	self.olympic.kick.steelsight = self.olympic.kick.standing
	
	self.olympic.spread.standing = 1.0
	self.olympic.spread.crouching = 0.6
	self.olympic.spread.steelsight = 0.1
	self.olympic.spread.moving_standing = self.olympic.spread.standing * 1.15
	self.olympic.spread.moving_crouching = self.olympic.spread.crouching * 1.15
	self.olympic.spread.moving_steelsight = self.olympic.spread.steelsight * 1.15
	
	self.olympic.armor_piercing_chance = 0.05
	
	self.olympic.CLIP_AMMO_MAX = 20
	
	self.olympic.fire_mode_data.fire_rate = 0.07317073170731707317073170731707
	
	self.olympic.damage_near = 10
	self.olympic.damage_far = 67.5
	self.olympic.damage_min = 2.15
	
	self.olympic.stats.damage = 16
	self.olympic.stats.spread = 61
	self.olympic.stats.recoil = 73
	self.olympic.stats.suppression = 10
	
	
	
	--[[     Krink     ]]--
	self.akmsu.category = "assault_rifle"
	self.akmsu.sub_category = "carbine"
	
	self.akmsu.ADS_TIMER = 0.220
	
	self.akmsu.kick.standing = { -0.3, 0.45, -0.375, 0.375}
	self.akmsu.kick.crouching = self.akmsu.kick.standing
	self.akmsu.kick.steelsight = self.akmsu.kick.standing
	
	self.akmsu.spread.standing = 1.3
	self.akmsu.spread.crouching = 0.9
	self.akmsu.spread.steelsight = 0.1
	self.akmsu.spread.moving_standing = self.akmsu.spread.standing * 1.25
	self.akmsu.spread.moving_crouching = self.akmsu.spread.crouching * 1.25
	self.akmsu.spread.moving_steelsight = self.akmsu.spread.steelsight * 1.25
	
	self.akmsu.CLIP_AMMO_MAX = 30
	
	self.akmsu.fire_mode_data.fire_rate = 0.08163265306122448979591836734694
	
	self.akmsu.armor_piercing_chance = 0.125
	
	self.akmsu.damage_near = 12
	self.akmsu.damage_far = 70
	self.akmsu.damage_min = 3.65
	
	self.akmsu.stats.damage = 24
	self.akmsu.stats.spread = 65
	self.akmsu.stats.recoil = 68
	self.akmsu.stats.suppression = 9
	
	
	
	--[[     SUBMARINE 2000     ]]--
	self.sub2000.category = "pistol"
	self.sub2000.sub_category = "carbine"
	
	self.sub2000.ADS_TIMER = 0.200
	
	self.sub2000.kick.standing = {0.75, -0.0, -0.375, 0.375}
	self.sub2000.kick.crouching = self.s552.kick.standing
	self.sub2000.kick.steelsight = self.s552.kick.standing
	
	self.sub2000.spread.standing = 0.9
	self.sub2000.spread.crouching = 0.7
	self.sub2000.spread.steelsight = 0.1
	self.sub2000.spread.moving_standing = self.sub2000.spread.standing * 1.1
	self.sub2000.spread.moving_crouching = self.sub2000.spread.crouching * 1.1
	self.sub2000.spread.moving_steelsight = self.sub2000.spread.steelsight * 1.1
	
	self.sub2000.fire_mode_data.fire_rate = 0.08571428571428571428571428571429
	
	self.sub2000.shake.fire_multiplier = 0.55
	self.sub2000.shake.fire_steelsight_multiplier = -0.55
	
	self.sub2000.damage_near = 15
	self.sub2000.damage_far = 65
	self.sub2000.damage_min = 1.45
	
	self.sub2000.stats.damage = 15
	self.sub2000.stats.spread = 71
	self.sub2000.stats.recoil = 90
	self.sub2000.stats.suppression = 16
	
	
	
	--[[     Heat     ]]--
	self.amcar.sub_category = "carbine"
	
	self.amcar.ADS_TIMER = 0.220
	
	self.amcar.spread.standing = 1.2
	self.amcar.spread.crouching = 1.0
	self.amcar.spread.steelsight = 0.1
	self.amcar.spread.moving_standing = self.amcar.spread.standing * 1.2
	self.amcar.spread.moving_crouching = self.amcar.spread.standing * 1.2
	self.amcar.spread.moving_steelsight = self.amcar.spread.steelsight * 1.2
	
	self.amcar.kick.standing = { -0.1875, 0.3375, -0.4875, 0.4875 }
	self.amcar.kick.crouching = self.amcar.kick.standing
	self.amcar.kick.steelsight = self.amcar.kick.standing
	
	self.amcar.armor_piercing_chance = 0.05
	
	self.amcar.fire_mode_data.fire_rate = 0.08275862068965517241379310344828
	
	self.amcar.shake.fire_multiplier = 0.9
	self.amcar.shake.fire_steelsight_multiplier = -0.9
	
	self.amcar.damage_near = 11
	self.amcar.damage_far = 68
	self.amcar.damage_min = 2.25
	
	self.amcar.stats.damage = 16
	self.amcar.stats.spread = 71
	self.amcar.stats.recoil = 81
	self.amcar.stats.suppression = 11
	self.amcar.stats.suppression = 17
	
	
	
	--[[     Meltgun     ]]--
	self.g36.sub_category = "carbine"
	
	self.g36.ADS_TIMER = 0.210
	
	self.g36.spread.standing = 1.0
	self.g36.spread.crouching = 0.85
	self.g36.spread.steelsight = 0.1
	self.g36.spread.moving_standing = self.g36.spread.standing * 1.15
	self.g36.spread.moving_crouching = self.g36.spread.crouching * 1.15
	self.g36.spread.moving_steelsight = self.g36.spread.steelsight * 1.15
	
	self.g36.kick.standing = { 0.45, -0.3, -0.375, 0.375 }
	self.g36.kick.crouching = self.g36.kick.standing
	self.g36.kick.steelsight = self.g36.kick.standing
	
	self.g36.armor_piercing_chance = 0.05
	
	self.g36.fire_mode_data.fire_rate = 0.08
	
	self.g36.ADAPTIVE_BURST_SIZE = false
	self.g36.BURST_FIRE = 2
	self.g36.BURST_FIRE_RATE_MULTIPLIER = 1.1
	
	self.g36.shake.fire_multiplier = 1
	self.g36.shake.fire_steelsight_multiplier = -1
	
	self.g36.damage_near = 13
	self.g36.damage_far = 72
	self.g36.damage_min = 2.4
	
	self.g36.stats.damage = 16
	self.g36.stats.spread = 74
	self.g36.stats.recoil = 79
	self.g36.stats.suppression = 9
		
	
	
	--[[     Shigu     ]]--
	self.s552.sub_category = "carbine"
	
	self.s552.ADS_TIMER = 0.225
	
	self.s552.kick.standing = {0.6, -0.225, -0.3375, 0.3375}
	self.s552.kick.crouching = self.s552.kick.standing
	self.s552.kick.steelsight = self.s552.kick.standing
	
	self.s552.spread.standing = 1.8
	self.s552.spread.crouching = 1.3
	self.s552.spread.steelsight = 0.1
	self.s552.spread.moving_standing = self.s552.spread.standing * 1.3
	self.s552.spread.moving_crouching = self.s552.spread.crouching * 1.3
	self.s552.spread.moving_steelsight = self.s552.spread.steelsight * 1.3
	
	self.s552.fire_mode_data.fire_rate = 0.07692307692307692307692307692308
	
	self.s552.ADAPTIVE_BURST_SIZE = false
	self.s552.BURST_FIRE = 3
	self.s552.BURST_FIRE_RATE_MULTIPLIER = 1.1
	
	self.s552.CLIP_AMMO_MAX = 30
	
	self.s552.armor_piercing_chance = 0.05
	
	self.s552.shake.fire_multiplier = 0.6
	self.s552.shake.fire_steelsight_multiplier = -0.6
	
	self.s552.damage_near = 16
	self.s552.damage_far = 78
	self.s552.damage_min = 2.6
	
	self.s552.stats.damage = 16
	self.s552.stats.spread = 77
	self.s552.stats.recoil = 71
	self.s552.stats.suppression = 9
		--}
	
	
	
	-----------------------[[ARs]]-----------------------
	--{
	--[[     FAM-ASS (see Rufuira! 4)     ]]--
	self.famas.ads_sms = 0.80
	self.famas.ADS_TIMER = 0.240
	
	self.famas.kick.standing = { -0.225, 0.525, -0.3375, 0.4125}
	self.famas.kick.crouching = self.famas.kick.standing
	self.famas.kick.steelsight = self.famas.kick.standing
	
	self.famas.spread.standing = 1.5
	self.famas.spread.crouching = 1.2
	self.famas.spread.steelsight = 0.1
	self.famas.spread.moving_standing = self.famas.spread.standing * 1.15
	self.famas.spread.moving_crouching = self.famas.spread.crouching * 1.15
	self.famas.spread.moving_steelsight = self.famas.spread.steelsight * 1.15
	
	self.famas.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.famas.sounds.leave_steelsight = "secondary_steel_sight_exit"
	
	self.famas.CLIP_AMMO_MAX = 25
	
	self.famas.armor_piercing_chance = 0.075
	
	self.famas.ADAPTIVE_BURST_SIZE = false
	self.famas.BURST_FIRE = 3
	self.famas.BURST_FIRE_RATE_MULTIPLIER = 1.1
	
	self.famas.shake.fire_multiplier = 0.9
	self.famas.shake.fire_steelsight_multiplier = -0.9
	
	self.famas.damage_near = 12
	self.famas.damage_far = 75
	self.famas.damage_min = 2.75
	
	self.famas.stats.damage = 17
	self.famas.stats.spread = 79
	self.famas.stats.recoil = 68
	self.famas.stats.suppression = 10
		
	
	
	--[[     Rewinding [<<]    ]]--
	self.vhs.ads_sms = 0.80
	self.vhs.ADS_TIMER = 0.230
	
	self.vhs.kick.standing = { -0.30, 0.50, -0.35, 0.35 }
	self.vhs.kick.crouching = self.vhs.kick.standing
	self.vhs.kick.steelsight = self.vhs.kick.standing
	
	self.vhs.spread.standing = 1.2
	self.vhs.spread.crouching = 0.9
	self.vhs.spread.steelsight = 0.1
	self.vhs.spread.moving_standing = self.vhs.spread.standing * 1.1
	self.vhs.spread.moving_crouching = self.vhs.spread.crouching * 1.1
	self.vhs.spread.moving_steelsight = self.vhs.spread.steelsight * 1.1
	
	self.vhs.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.vhs.sounds.leave_steelsight = "secondary_steel_sight_exit"
	
	self.vhs.CLIP_AMMO_MAX = 30
	
	self.vhs.reload_speed_mult = 1.1
	
	self.vhs.fire_mode_data.fire_rate = 0.07228915662650602409638554216867	
	
	self.vhs.armor_piercing_chance = 0.075
	
	self.vhs.shake.fire_multiplier = 0.4
	self.vhs.shake.fire_steelsight_multiplier = -0.4
	
	self.vhs.damage_near = 15
	self.vhs.damage_far = 78
	self.vhs.damage_min = 3.0
	
	self.vhs.stats.damage = 19
	self.vhs.stats.spread = 78
	self.vhs.stats.recoil = 77
	self.vhs.stats.suppression = 10
		
	
	
	--[[     Safety pins     ]]--
	self.new_m4.ads_sms = 0.80
	self.new_m4.ADS_TIMER = 0.250
	
	self.new_m4.kick.standing = { -0.125, 0.525, -0.425, 0.425}
	self.new_m4.kick.crouching = self.new_m4.kick.standing
	self.new_m4.kick.steelsight = self.new_m4.kick.standing
	
	self.new_m4.spread.standing = 2.3
	self.new_m4.spread.crouching = 2
	self.new_m4.spread.steelsight = 0.1
	self.new_m4.spread.moving_standing = self.new_m4.spread.standing * 1.25
	self.new_m4.spread.moving_crouching = self.new_m4.spread.standing * 1.25
	self.new_m4.spread.moving_steelsight = self.new_m4.spread.steelsight * 1.25
	
	self.new_m4.fire_mode_data.fire_rate = 0.08571428571428571428571428571429
	
	self.new_m4.armor_piercing_chance = 0.075
	
	self.new_m4.timers.reload_not_empty = 2.5
	
	self.new_m4.shake.fire_multiplier = 0.7
	self.new_m4.shake.fire_steelsight_multiplier = -0.7
	
	self.new_m4.damage_near = 15
	self.new_m4.damage_far = 72
	self.new_m4.damage_min = 2.75
	
	self.new_m4.stats.damage = 17
	self.new_m4.stats.spread = 73
	self.new_m4.stats.recoil = 79
	self.new_m4.stats.suppression = 11
	
	
	
	--[[     Ichiroku     ]]--
	self.m16.ads_sms = 0.80
	self.m16.ADS_TIMER = 0.255
	
	self.m16.spread.standing = 2.8
	self.m16.spread.crouching = 2.5
	self.m16.spread.steelsight = 0.1
	self.m16.spread.moving_standing = self.m16.spread.standing * 1.35
	self.m16.spread.moving_crouching = self.m16.spread.crouching * 1.35
	self.m16.spread.moving_steelsight = self.m16.spread.steelsight * 1.35
	
	self.m16.kick.standing = { 0.075, 0.525, -0.45, 0.45}
	self.m16.kick.crouching = self.m16.kick.standing
	self.m16.kick.steelsight = self.m16.kick.standing
	
	self.m16.armor_piercing_chance = 0.075
	
	self.m16.shake.fire_multiplier = 0.9
	self.m16.shake.fire_steelsight_multiplier = -0.9
	
	self.m16.CLIP_AMMO_MAX = 20
	
	self.m16.fire_mode_data.fire_rate = 0.07272727272727272727272727272727
	
	self.m16.damage_near = 16
	self.m16.damage_far = 80
	self.m16.damage_min = 3.0
	
	self.m16.stats.damage = 18
	self.m16.stats.spread = 81
	self.m16.stats.recoil = 73
	self.m16.stats.suppression = 10
	
	
	
	--[[     AUG     ]]--
	self.aug.ads_sms = 0.80
	self.aug.ADS_TIMER = 0.225
	
	self.aug.kick.standing = {0.45, 0.3, -0.3375, 0.3375}
	self.aug.kick.crouching = self.aug.kick.standing
	self.aug.kick.steelsight = self.aug.kick.standing
	
	self.aug.spread.standing = 2.15
	self.aug.spread.crouching = 1.8
	self.aug.spread.steelsight = 0.1
	self.aug.spread.moving_standing = self.aug.spread.standing * 1.1
	self.aug.spread.moving_crouching = self.aug.spread.crouching * 1.1
	self.aug.spread.moving_steelsight = self.aug.spread.steelsight * 1.1
	
	self.aug.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.aug.sounds.leave_steelsight = "secondary_steel_sight_exit"
	
	self.aug.CLIP_AMMO_MAX = 30
	
	self.aug.armor_piercing_chance = 0.075
	
	self.aug.fire_mode_data.fire_rate = 0.08571428571428571428571428571429
	
	self.aug.shake.fire_multiplier = 1
	self.aug.shake.fire_steelsight_multiplier = -1
	
	self.aug.damage_near = 18
	self.aug.damage_far = 90
	self.aug.damage_min = 3.25
	
	self.aug.stats.damage = 18
	self.aug.stats.spread = 84
	self.aug.stats.recoil = 71
	self.aug.stats.suppression = 10
		
	
	
	--[[     Close enough to being Funco     ]]--
	self.ak5.ads_sms = 0.80
	self.ak5.ADS_TIMER = 0.260
	
	self.ak5.kick.standing = { 0.4125, -0.1875, -0.45, 0.45 }
	self.ak5.kick.crouching = self.ak5.kick.standing
	self.ak5.kick.steelsight = self.ak5.kick.standing
	
	self.ak5.spread.standing = 2.6
	self.ak5.spread.crouching = 2.2
	self.ak5.spread.steelsight = 0.1
	self.ak5.spread.moving_standing = self.ak5.spread.standing * 1.35
	self.ak5.spread.moving_crouching = self.ak5.spread.crouching * 1.35
	self.ak5.spread.moving_steelsight = self.ak5.spread.steelsight * 1.35
	
	self.ak5.fire_mode_data.fire_rate = 0.08888888888888888888888888888889
	
	self.ak5.armor_piercing_chance = 0.075
	
	self.ak5.shake.fire_multiplier = 0.95
	self.ak5.shake.fire_steelsight_multiplier = -0.95
	
	self.ak5.damage_near = 18
	self.ak5.damage_far = 82.5
	self.ak5.damage_min = 3.25
	
	self.ak5.stats.damage = 19
	self.ak5.stats.spread = 76
	self.ak5.stats.recoil = 81
	self.ak5.stats.suppression = 10
	
	
	
	--[[     You expected a cute girl? Too bad! It's just me, Eru! *JAM*     ]]--
	self.l85a2.ads_sms = 0.80
	self.l85a2.ADS_TIMER = 0.245
	
	self.l85a2.kick.standing = { -0.225, 0.45, -0.4125, 0.4125}
	self.l85a2.kick.crouching = self.l85a2.kick.standing
	self.l85a2.kick.steelsight = self.l85a2.kick.standing
	
	self.l85a2.spread.standing = 3.25
	self.l85a2.spread.crouching = 2.95
	self.l85a2.spread.steelsight = 0.1
	self.l85a2.spread.moving_standing = self.l85a2.spread.standing * 1.2
	self.l85a2.spread.moving_crouching = self.l85a2.spread.crouching * 1.2
	self.l85a2.spread.moving_steelsight = self.l85a2.spread.steelsight * 1.2
	
	self.l85a2.CLIP_AMMO_MAX = 30
	
	self.l85a2.timers.reload_empty = 4.1
	self.l85a2.timers.reload_not_empty = 3.1
	
	self.l85a2.armor_piercing_chance = 0.075
	
	self.l85a2.fire_mode_data.fire_rate = 0.098360655737704
	
	self.l85a2.shake.fire_multiplier = -0.9
	self.l85a2.shake.fire_steelsight_multiplier = -0.9
	
	self.l85a2.damage_near = 20
	self.l85a2.damage_far = 100
	self.l85a2.damage_min = 3.0
	
	self.l85a2.stats.damage = 17
	self.l85a2.stats.spread = 85
	self.l85a2.stats.recoil = 88
	self.l85a2.stats.suppression = 14
	
	
	
	--[[     AKs are cats     ]]--
	self.ak74.ads_sms = 0.80
	self.ak74.ADS_TIMER = 0.255
	
	self.ak74.spread.standing = 2.1
	self.ak74.spread.crouching = 1.8
	self.ak74.spread.steelsight = 0.1
	self.ak74.spread.moving_standing = self.ak74.spread.standing * 1.4
	self.ak74.spread.moving_crouching = self.ak74.spread.crouching * 1.4
	self.ak74.spread.moving_steelsight = self.ak74.spread.steelsight * 1.4
	
	self.ak74.armor_piercing_chance = 0.1
	
	self.ak74.fire_mode_data.fire_rate = 0.09230769230769230769230769230769
	
	self.ak74.kick.standing = { -0.225, 0.6, -0.3375, 0.3375}
	self.ak74.kick.crouching = self.ak74.kick.standing
	self.ak74.kick.steelsight = self.ak74.kick.standing
	
	self.ak74.shake.fire_multiplier = 1
	self.ak74.shake.fire_steelsight_multiplier = -1
	
	self.ak74.damage_near = 15
	self.ak74.damage_far = 82.5
	self.ak74.damage_min = 3.625
	
	self.ak74.stats.damage = 19
	self.ak74.stats.spread = 73
	self.ak74.stats.recoil = 71
	self.ak74.stats.suppression = 9
	
	
	
	--[[     Sneaky Beaky     ]]--	
	self.asval.ADS_TIMER = 0.245
	
	self.asval.spread.standing = 1.5
	self.asval.spread.crouching = 1.3
	self.asval.spread.steelsight = 0.1
	self.asval.spread.moving_standing = self.asval.spread.standing * 1.3
	self.asval.spread.moving_crouching = self.asval.spread.crouching * 1.3
	self.asval.spread.moving_steelsight = self.asval.spread.steelsight * 1.3
	
	self.asval.armor_piercing_chance = 0.1
	
	self.asval.fire_mode_data.fire_rate = 0.06666666666666666666666666666667
	
	self.asval.kick.standing = { -0.075, 0.6, -0.4125, 0.4125}
	self.asval.kick.crouching = self.asval.kick.standing
	self.asval.kick.steelsight = self.asval.kick.standing
	
	self.asval.shake.fire_multiplier = 0.7
	self.asval.shake.fire_steelsight_multiplier = -0.7
	
	self.asval.damage_near = 17.5
	self.asval.damage_far = 70
	self.asval.damage_min = 3.0
	
	self.asval.stats.damage = 18
	self.asval.stats.spread = 76
	self.asval.stats.recoil = 72
	self.asval.stats.suppression = 10
	
	
	
	--[[     Slavshit     ]]--
	self.akm.ads_sms = 0.80
	self.akm.ADS_TIMER = 0.275
	
	self.akm.kick.standing = { -0.3, 0.675, -0.2625, 0.2625}
	self.akm.kick.crouching = self.akm.kick.standing
	self.akm.kick.steelsight = self.akm.kick.standing
	
	self.akm.timers.reload_not_empty = 2.2
	
	self.akm.armor_piercing_chance = 0.15
	
	self.akm.spread.standing = 1.9
	self.akm.spread.crouching = 1.4
	self.akm.spread.steelsight = 0.1
	self.akm.spread.moving_standing = self.akm.spread.standing * 1.4
	self.akm.spread.moving_crouching = self.akm.spread.crouching * 1.4
	self.akm.spread.moving_steelsight = self.akm.spread.steelsight * 1.4
	
	self.akm.CLIP_AMMO_MAX = 30
	
	self.akm.shake.fire_multiplier = 1.1
	self.akm.shake.fire_steelsight_multiplier = -1.1
	
	self.akm.fire_mode_data.fire_rate = 0.1
	
	self.akm.damage_near = 14
	self.akm.damage_far = 90
	self.akm.damage_min = 3.925
	
	self.akm.stats.damage = 24
	self.akm.stats.spread = 71
	self.akm.stats.recoil = 67
	self.akm.stats.suppression = 8
	
	
	
	--[[     GOLD Slavshit     ]]--
	self.akm_gold.ads_sms = 0.80
	self.akm_gold.ADS_TIMER = 0.300
	
	self.akm_gold.kick.standing = { -0.225, 0.45, -0.4125, 0.4125}
	self.akm_gold.kick.crouching = self.akm_gold.kick.standing
	self.akm_gold.kick.steelsight = self.akm_gold.kick.standing
	
	self.akm_gold.timers.reload_not_empty = 2.2
	
	self.akm_gold.armor_piercing_chance = 0.15
	
	self.akm_gold.spread.standing = 1.9
	self.akm_gold.spread.crouching = 1.4
	self.akm_gold.spread.steelsight = 0.1
	self.akm_gold.spread.moving_standing = self.akm_gold.spread.standing * 1.4
	self.akm_gold.spread.moving_crouching = self.akm_gold.spread.crouching * 1.4
	self.akm_gold.spread.moving_steelsight = self.akm_gold.spread.steelsight * 1.4
	
	self.akm_gold.CLIP_AMMO_MAX = 30
	
	self.akm_gold.sounds.enter_steelsight = "lmg_steelsight_enter"
	self.akm_gold.sounds.leave_steelsight = "lmg_steelsight_exit"
	
	self.akm_gold.fire_mode_data.fire_rate = 0.1142857
	
	self.akm_gold.shake.fire_multiplier = 0.6
	self.akm_gold.shake.fire_steelsight_multiplier = -0.6
	
	self.akm_gold.damage_near = 14
	self.akm_gold.damage_far = 90
	self.akm_gold.damage_min = 3.925
	
	self.akm_gold.stats.damage = 24
	self.akm_gold.stats.spread = 69
	self.akm_gold.stats.recoil = 73
	self.akm_gold.stats.suppression = 8
	
	--}
	
	
	
	-----------------------[[SHOTGUNS]]-----------------------
	--{
	--[[     Nyan Nyan     ]]--
	self.saiga.reload_speed_mult = 1.05
	self.saiga.ADS_TIMER = 0.275
	
	self.saiga.spread.standing = 1.1
	self.saiga.spread.crouching = self.saiga.spread.standing * 0.8
	self.saiga.spread.steelsight = 0.3
	self.saiga.spread.moving_standing = self.saiga.spread.standing
	self.saiga.spread.moving_crouching = self.saiga.spread.crouching
	self.saiga.spread.moving_steelsight = self.saiga.spread.steelsight
	
	self.saiga.CLIP_AMMO_MAX = 5
	
	self.saiga.kick.standing = {0.80, -0.2, -0.5, 0.5 }
	self.saiga.kick.crouching = self.saiga.kick.standing
	self.saiga.kick.steelsight = self.saiga.kick.standing
	
	self.saiga.fire_mode_data.fire_rate = 0.1
	
	self.saiga.rays = 8 --pellets per shot
	
	self.saiga.damage_near = 8
	self.saiga.damage_far = 35
	
	self.saiga.armor_piercing_chance = 0.1
	
	self.saiga.shake.fire_multiplier = 1.5
	self.saiga.shake.fire_steelsight_multiplier = -1.5
	
	self.saiga.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.saiga.stats_modifiers = {
			damage = 2,
		}
	
	self.saiga.stats.damage = 24
	self.saiga.stats.spread = 25
	self.saiga.stats.recoil = 31
	self.saiga.stats.suppression = 5
	
	
	
	--[[     Auto Ass 12     ]]--
	self.aa12.ADS_TIMER = 0.350
	
	self.aa12.spread.standing = 1.4
	self.aa12.spread.crouching = self.aa12.spread.standing * 0.8
	self.aa12.spread.steelsight = 0.3
	self.aa12.spread.moving_standing = self.aa12.spread.standing
	self.aa12.spread.moving_crouching = self.aa12.spread.crouching
	self.aa12.spread.moving_steelsight = self.aa12.spread.steelsight
	
	self.aa12.CLIP_AMMO_MAX = 8
	
	self.aa12.kick.standing = {0.6, -0.3, -0.55, 0.55 }
	self.aa12.kick.crouching = self.aa12.kick.standing
	self.aa12.kick.steelsight = self.aa12.kick.standing
	
	self.aa12.fire_mode_data.fire_rate = 0.2
	
	self.aa12.rays = 8 --pellets per shot
	
	self.aa12.damage_near = 5
	self.aa12.damage_far = 38
	
	self.aa12.armor_piercing_chance = 0.1
	
	self.aa12.CAN_TOGGLE_FIREMODE = false
	
	self.aa12.shake.fire_multiplier = 1
	self.aa12.shake.fire_steelsight_multiplier = -1
	
	self.aa12.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.aa12.stats_modifiers = {
			damage = 2,
		}
	
	self.aa12.stats.damage = 24
	self.aa12.stats.spread = 30
	self.aa12.stats.recoil = 85
	self.aa12.stats.suppression = 6
	
	
	
	--[[     I R8 70 out of 100     ]]--
	self.r870.ADS_TIMER = 0.250
	
	self.r870.spread.standing = 1.4
	self.r870.spread.crouching = self.r870.spread.standing * 0.8
	self.r870.spread.steelsight = 0.3
	self.r870.spread.moving_standing = self.r870.spread.standing
	self.r870.spread.moving_crouching = self.r870.spread.crouching
	self.r870.spread.moving_steelsight = self.r870.spread.steelsight
	
	self.r870.kick.standing = {0.9, 0.7, -0.2, 0.2 }
	self.r870.kick.crouching = self.r870.kick.standing
	self.r870.kick.steelsight = self.r870.kick.standing
	
	self.r870.rays = 8--pellets per shot
	
	self.r870.fire_mode_data.fire_rate = 0.5
	
	self.r870.armor_piercing_chance = 0.1
	
	self.r870.shake.fire_multiplier = 2.5
	self.r870.shake.fire_steelsight_multiplier = -2.5
	
	self.r870.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.r870.damage_near = 13
	self.r870.damage_far = 40
	
	self.r870.stats_modifiers = {
			damage = 2,
		}
	
	self.r870.stats.damage = 44
	self.r870.stats.spread = 57
	self.r870.stats.recoil = 26
	self.r870.stats.suppression = 5
	
	
	
	--[[     Kel La Tec     ]]--
	self.ksg.reload_speed_mult = 0.9
	self.ksg.ADS_TIMER = 0.200
	
	self.ksg.kick.standing = {0.7, 0.5, -0.4, 0.4 }
	self.ksg.kick.crouching = self.ksg.kick.standing
	self.ksg.kick.steelsight = self.ksg.kick.standing
	
	self.ksg.fire_mode_data.fire_rate = 0.63157894736842105263157894736842
	
	self.ksg.shake.fire_multiplier = 2.2
	self.ksg.shake.fire_steelsight_multiplier = -2.2
	
	self.ksg.damage_near = 9
	self.ksg.damage_far = 46
	
	self.ksg.armor_piercing_chance = 0.1
	
	self.ksg.spread.standing = 1.15
	self.ksg.spread.crouching = self.ksg.spread.standing * 0.8
	self.ksg.spread.steelsight = 0.3
	self.ksg.spread.moving_standing = self.ksg.spread.standing
	self.ksg.spread.moving_crouching = self.ksg.spread.crouching
	self.ksg.spread.moving_steelsight = self.ksg.spread.steelsight
	
	self.ksg.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.ksg.sounds.leave_steelsight = "secondary_steel_sight_exit"
	
	self.ksg.rays = 8
	
	self.ksg.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.ksg.stats_modifiers = {
			damage = 2,
		}
	
	self.ksg.stats.damage = 44
	self.ksg.stats.spread = 48
	self.ksg.stats.recoil = 21
	self.ksg.stats.suppression = 5
	
	
	
	--[[     Elmer Fudd     ]]--
	self.huntsman.ADS_TIMER = 0.220
	
	self.huntsman.spread.standing = 1.3
	self.huntsman.spread.crouching = self.huntsman.spread.standing * 0.8
	self.huntsman.spread.steelsight = 0.3
	self.huntsman.spread.moving_standing = self.huntsman.spread.standing 
	self.huntsman.spread.moving_crouching = self.huntsman.spread.crouching 
	self.huntsman.spread.moving_steelsight = self.huntsman.spread.steelsight
	
	self.huntsman.rays = 8
	
	self.huntsman.fire_mode_data.fire_rate = 0.1
	
	self.huntsman.damage_near = 20
	self.huntsman.damage_far = 40
	
	self.huntsman.kick.standing = {0.6, 0.4, -0.3, 0.7 }
	self.huntsman.kick.crouching = self.huntsman.kick.standing
	self.huntsman.kick.steelsight = self.huntsman.kick.standing
	
	self.huntsman.armor_piercing_chance = 0.1
	
	self.huntsman.shake.fire_multiplier = 1.8
	self.huntsman.shake.fire_steelsight_multiplier = 1.8
	
	self.huntsman.ADAPTIVE_BURST_SIZE = true
	self.huntsman.BURST_FIRE = 2
	self.huntsman.BURST_FIRE_RATE_MULTIPLIER = 100
	
	self.huntsman.CLIP_AMMO_MAX = 2
	
	self.huntsman.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.huntsman.stats_modifiers = {
			damage = 2,
		}
	
	self.huntsman.stats.damage = 60
	self.huntsman.stats.spread = 25
	self.huntsman.stats.recoil = 12
	self.huntsman.stats.suppression = 2
	
	
	
	--[[     BARDODA SHOTGAT     ]]
	self.b682.ADS_TIMER = 0.240
	
	self.b682.spread.standing = 1.2
	self.b682.spread.crouching = self.b682.spread.standing * 0.8
	self.b682.spread.steelsight = 0.3
	self.b682.spread.moving_standing = self.b682.spread.standing 
	self.b682.spread.moving_crouching = self.b682.spread.crouching 
	self.b682.spread.moving_steelsight = self.b682.spread.steelsight
	
	self.b682.rays = 8
	
	self.b682.damage_near = 16
	self.b682.damage_far = 50
	
	self.b682.kick.standing = {1.0, 0.8, -0.1, 0.1 }
	self.b682.kick.crouching = self.b682.kick.standing
	self.b682.kick.steelsight = self.b682.kick.standing
	
	self.b682.armor_piercing_chance = 0.1
	
	self.b682.fire_mode_data.fire_rate = 0.15
	
	self.b682.shake.fire_multiplier = 2
	self.b682.shake.fire_steelsight_multiplier = -2
	
	self.b682.CLIP_AMMO_MAX = 2
	
	self.b682.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.b682.stats_modifiers = {
			damage = 2,
		}
	
	self.b682.stats.damage = 60
	self.b682.stats.spread = 63
	self.b682.stats.recoil = 6
	self.b682.stats.suppression = 2
	
	
	
	--[[     Roberta (best girl, fuck the OVA ending)     ]]--
	self.spas12.reload_speed_mult = 0.95
	self.spas12.ADS_TIMER = 0.275
	
	self.spas12.spread.standing = 1.4
	self.spas12.spread.crouching = self.spas12.spread.standing * 0.8
	self.spas12.spread.steelsight = 0.3
	self.spas12.spread.moving_standing = self.spas12.spread.standing
	self.spas12.spread.moving_crouching = self.spas12.spread.crouching
	self.spas12.spread.moving_steelsight = self.spas12.spread.steelsight
	
	self.spas12.kick.standing = {0.5, 0.4, -0.5, 0.6 }
	self.spas12.kick.crouching = self.spas12.kick.standing
	self.spas12.kick.steelsight = self.spas12.kick.standing
	
	self.spas12.shake.fire_multiplier = 1.75
	self.spas12.shake.fire_steelsight_multiplier = -1.75
	
	self.spas12.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.spas12.fire_mode_data.fire_rate = 0.18181818181818181818181818181818
	
	self.spas12.damage_near = 8
	self.spas12.damage_far = 34
	
	self.spas12.armor_piercing_chance = 0.1
	
	self.spas12.rays = 8
	
	self.spas12.CLIP_AMMO_MAX = 6
	
	self.spas12.stats_modifiers = {
			damage = 2,
		}
	
	self.spas12.stats.damage = 32
	self.spas12.stats.spread = 37
	self.spas12.stats.recoil = 26
	self.spas12.stats.suppression = 5
	
	
	
	--[[     Benjamins M4    ]]--
	self.benelli.reload_speed_mult = 1.05
	self.benelli.ADS_TIMER = 0.260
	
	self.benelli.spread.standing = 1.325
	self.benelli.spread.crouching = self.benelli.spread.standing * 0.8
	self.benelli.spread.steelsight = 0.3
	self.benelli.spread.moving_standing = self.benelli.spread.standing
	self.benelli.spread.moving_crouching = self.benelli.spread.crouching
	self.benelli.spread.moving_steelsight = self.benelli.spread.steelsight
	
	self.benelli.kick.standing = {0.8, 0.7, -0.25, 0.25 }
	self.benelli.kick.crouching = self.benelli.kick.standing
	self.benelli.kick.steelsight = self.benelli.kick.standing
	
	self.benelli.CLIP_AMMO_MAX = 5
	
	self.benelli.damage_near = 5
	self.benelli.damage_far = 45
	
	self.benelli.shake.fire_multiplier = 2
	self.benelli.shake.fire_steelsight_multiplier = -2
	
	self.benelli.armor_piercing_chance = 0.1
	
	self.benelli.rays = 8
	
	self.benelli.fire_mode_data.fire_rate = 0.15
	
	self.benelli.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.benelli.stats_modifiers = {
			damage = 2,
		}
	
	self.benelli.stats.damage = 32
	self.benelli.stats.spread = 46
	self.benelli.stats.recoil = 20
	self.benelli.stats.suppression = 6
	
	
	
	--[[     Babby 870     ]]--
	self.serbu.reload_speed_mult = 1.15
	self.serbu.ADS_TIMER = 0.200
	
	self.serbu.spread.standing = 1.3
	self.serbu.spread.crouching = self.serbu.spread.standing * 0.8
	self.serbu.spread.steelsight = 0.3
	self.serbu.spread.moving_standing = self.serbu.spread.standing
	self.serbu.spread.moving_crouching = self.serbu.spread.crouching
	self.serbu.spread.moving_steelsight = self.serbu.spread.steelsight
	
	self.serbu.kick.standing = {0.9, 0.7, -0.2, 0.2 }
	self.serbu.kick.crouching = self.serbu.kick.standing
	self.serbu.kick.steelsight = self.serbu.kick.standing
	
	self.serbu.CLIP_AMMO_MAX = 3
	
	self.serbu.rays = 8
	
	self.serbu.damage_near = 6
	self.serbu.damage_far = 25
	
	self.serbu.fire_mode_data.fire_rate = 0.4
	
	self.serbu.shake.fire_multiplier = 3
	self.serbu.shake.fire_steelsight_multiplier = -3
	
	self.serbu.armor_piercing_chance = 0.1
	
	self.serbu.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.serbu.stats_modifiers = {
			damage = 2,
		}	
		
	self.serbu.stats.damage = 44
	self.serbu.stats.spread = 23
	self.serbu.stats.recoil = 16
	self.serbu.stats.suppression = 6
		
	
	
	--[[     Striker     ]]--
	self.striker.ADS_TIMER = 0.220
	
	self.striker.kick.standing = { 0.7, 0.5, -0.4, 0.4 }
	self.striker.kick.crouching = self.striker.kick.standing
	self.striker.kick.steelsight = self.striker.kick.standing
	
	self.striker.spread.standing = 1.25
	self.striker.spread.crouching = self.striker.spread.standing * 0.8
	self.striker.spread.steelsight = 0.3
	self.striker.spread.moving_standing = self.striker.spread.standing
	self.striker.spread.moving_crouching = self.striker.spread.crouching
	self.striker.spread.moving_steelsight = self.striker.spread.steelsight
	
	self.striker.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.striker.sounds.leave_steelsight = "secondary_steel_sight_exit"
	
	self.striker.shake.fire_multiplier = 1.2
	self.striker.shake.fire_steelsight_multiplier = -1.2
	
	self.striker.armor_piercing_chance = 0.1
	
	self.striker.rays = 8
	
	self.striker.fire_mode_data.fire_rate = 0.13333333333333333333333333333333
	
	self.striker.damage_near = 6
	self.striker.damage_far = 32
	
	self.striker.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.striker.stats_modifiers = {
			damage = 2,
		}
		
	self.striker.stats.damage = 24
	self.striker.stats.spread = 35
	self.striker.stats.recoil = 23
	self.striker.stats.suppression = 5
	--}
	
	
		
	-----------------------[[BRs]]-----------------------
	--{
	--[[     EAG H     ]]--
	self.scar.sub_category = "battle_rifle"
	self.scar.ads_sms = 0.80
	self.scar.ADS_TIMER = 0.280
	
	self.scar.spread.standing = 3.3
	self.scar.spread.crouching = 2.8
	self.scar.spread.steelsight = 0.1
	self.scar.spread.moving_standing = self.scar.spread.standing * 1.2
	self.scar.spread.moving_crouching = self.scar.spread.crouching * 1.2
	self.scar.spread.moving_steelsight = self.scar.spread.steelsight * 1.2
	
	self.scar.kick.standing = {0.8, -0.2, -0.5, 0.5}
	self.scar.kick.crouching = self.scar.kick.standing
	self.scar.kick.steelsight = self.scar.kick.standing
	
	self.scar.shake.fire_multiplier = 1.1
	self.scar.shake.fire_steelsight_multiplier = -1.1
	
	self.scar.fire_mode_data.fire_rate = 0.096
	
	self.scar.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.scar.sounds.leave_steelsight = "primary_steel_sight_exit"
	
	self.scar.armor_piercing_chance = 0.25
	
	self.scar.CLIP_AMMO_MAX = 20
	
	self.scar.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.scar.damage_near = 13
	self.scar.damage_far = 65
	self.scar.damage_min = 4.5
	
	self.scar.stats_modifiers = { 
		damage = 2,
	}
			
	self.scar.stats.damage = 18
	self.scar.stats.spread = 81
	self.scar.stats.recoil = 67
	self.scar.stats.suppression = 5
	
	
	
	--[[     Jiisuri is mai raifu~     ]]--
	self.g3.sub_category = "battle_rifle"
	self.g3.ads_sms = 0.65
	self.g3.sms = 0.85
	self.g3.ADS_TIMER = 0.310
	
	self.g3.kick.standing = { 0.9 , -0.3, -0.4, 0.4}
	self.g3.kick.crouching = self.g3.kick.standing
	self.g3.kick.steelsight = self.g3.kick.standing
	
	self.g3.spread.standing = 4.8
	self.g3.spread.crouching = 4.6
	self.g3.spread.steelsight = 0.1
	self.g3.spread.moving_standing = self.g3.spread.standing * 1.3
	self.g3.spread.moving_crouching = self.g3.spread.crouching * 1.3
	self.g3.spread.moving_steelsight = self.g3.spread.steelsight * 1.3
	
	self.g3.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.g3.armor_piercing_chance = 0.25
	
	self.g3.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.g3.sounds.enter_steelsight = "primary_steel_sight_enter"
	
	self.g3.CLIP_AMMO_MAX = 20
	
	self.g3.shake.fire_multiplier = 1.1
	self.g3.shake.fire_steelsight_multiplier = -1.1
	
	self.g3.fire_mode_data.fire_rate = 0.1
	
	self.g3.timers.reload_not_empty = 2.5
	self.g3.timers.reload_empty = 3.8
	
	self.g3.damage_near = 18
	self.g3.damage_far = 82.5
	self.g3.damage_min = 6.25
	
	self.g3.stats_modifiers = { 
		damage = 2,
	}
			
	self.g3.stats.damage = 24
	self.g3.stats.spread = 85
	self.g3.stats.recoil = 51
	self.g3.stats.suppression = 5
	
	
	
	--[[     Faru Nee-san     ]]--
	self.fal.sub_category = "battle_rifle"
	self.fal.ads_sms = 0.65
	self.fal.sms = 0.85
	self.fal.ADS_TIMER = 0.290
	
	self.fal.spread.standing = 3.7
	self.fal.spread.crouching = 3.5
	self.fal.spread.steelsight = 0.2
	self.fal.spread.moving_standing = self.fal.spread.standing * 1.15
	self.fal.spread.moving_crouching = self.fal.spread.crouching * 1.15
	self.fal.spread.moving_steelsight = self.fal.spread.steelsight * 1.15
	
	self.fal.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.fal.sounds.leave_steelsight = "primary_steel_sight_exit"
	
	self.fal.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.fal.CLIP_AMMO_MAX = 20
	
	self.fal.armor_piercing_chance = 0.25
	
	self.fal.shake.fire_multiplier = 0.75
	self.fal.shake.fire_steelsight_multiplier = -0.75
	
	self.fal.kick.standing = { 0.5, -0.3, -0.6, 0.6}
	self.fal.kick.crouching = self.fal.kick.standing
	self.fal.kick.steelsight = self.fal.kick.standing
	
	self.fal.fire_mode_data.fire_rate = 0.09230769230769230769230769230769
	
	self.fal.damage_near = 15
	self.fal.damage_far = 70
	self.fal.damage_min = 4.9
	
	self.fal.stats_modifiers = { 
		damage = 2,
	}
			
	self.fal.stats.damage = 24
	self.fal.stats.spread = 77
	self.fal.stats.recoil = 59
	self.fal.stats.suppression = 3
	
	
	
	--[[     Galil-chan     ]]--
	self.galil.sub_category = "battle_rifle"
	self.galil.ads_sms = 0.65
	self.galil.sms = 0.85
	self.galil.ADS_TIMER = 0.300
	
	self.galil.reload_speed_mult = 0.925
	
	self.galil.kick.standing = { 0.7, -0.4, -0.45, 0.45}
	self.galil.kick.crouching = self.galil.kick.standing
	self.galil.kick.steelsight = self.galil.kick.standing
	
	self.galil.spread.standing = 4.6
	self.galil.spread.crouching = 4.4
	self.galil.spread.steelsight = 0.1
	self.galil.spread.moving_standing = self.galil.spread.standing * 1.3
	self.galil.spread.moving_crouching = self.galil.spread.crouching * 1.3
	self.galil.spread.moving_steelsight = self.galil.spread.steelsight * 1.3
	
	self.galil.fire_mode_data.fire_rate = 0.08823529411764705882352941176471
	
	self.galil.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.galil.armor_piercing_chance = 0.25
	
	self.galil.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.galil.sounds.enter_steelsight = "primary_steel_sight_enter"
	
	self.galil.CLIP_AMMO_MAX = 25
	
	self.galil.shake.fire_multiplier = 0.9
	self.galil.shake.fire_steelsight_multiplier = -0.9
	
	self.galil.damage_near = 10
	self.galil.damage_far = 67.5
	self.galil.damage_min = 4.0
	
	self.galil.stats_modifiers = { 
		damage = 2,
	}
			
	self.galil.stats.damage = 24
	self.galil.stats.spread = 79
	self.galil.stats.recoil = 54
	self.galil.stats.suppression = 4
		
	
	
	--[[     Puns     ]]--
	self.new_m14.sub_category = "battle_rifle"
	self.new_m14.ads_sms = 0.65
	self.new_m14.sms = 0.85
	self.new_m14.ADS_TIMER = 0.320
	
	self.new_m14.spread.standing = 6.0
	self.new_m14.spread.crouching = 5.8
	self.new_m14.spread.steelsight = 0.1
	self.new_m14.spread.moving_standing = self.new_m14.spread.standing * 1.2
	self.new_m14.spread.moving_crouching = self.new_m14.spread.crouching * 1.2
	self.new_m14.spread.moving_steelsight = self.new_m14.spread.steelsight * 1.2
	
	self.new_m14.kick.standing = { 0.9, 0.4, -0.35, 0.35}
	self.new_m14.kick.crouching = self.new_m14.kick.standing
	self.new_m14.kick.steelsight = self.new_m14.kick.standing
	
	self.new_m14.shake.fire_multiplier = 1.25
	self.new_m14.shake.fire_steelsight_multiplier = -1.25
	
	self.new_m14.fire_mode_data.fire_rate = 0.08571428571428571428571428571429
	
	self.new_m14.CLIP_AMMO_MAX = 20
	
	self.new_m14.armor_piercing_chance = 0.25
	
	self.new_m14.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.new_m14.damage_near = 20
	self.new_m14.damage_far = 80
	self.new_m14.damage_min = 7.0
	
	self.new_m14.stats_modifiers = { 
		damage = 2,
	}
			
	self.new_m14.stats.damage = 24
	self.new_m14.stats.spread = 90
	self.new_m14.stats.recoil = 48
	self.new_m14.stats.suppression = 3
	--}	
		
		
		
	--[[LMGS]]
	--{
	--[[     M@$(     ]]--
	self.m249.ads_sms = 0.50
	self.m249.sms = 0.70
	self.m249.rms = 0.85
	self.m249.reload_speed_mult = 0.85
	self.m249.ADS_TIMER = 0.350
	
	self.m249.kick.standing = { -0.225, 0.375, -0.45, 0.45}
	self.m249.kick.crouching = self.m249.kick.standing
	self.m249.kick.steelsight = self.m249.kick.standing
	
	self.m249.spread.standing = 1.7
	self.m249.spread.crouching = 1.55
	self.m249.spread.steelsight = 0.2
	self.m249.spread.moving_standing = self.m249.spread.standing * 1.4
	self.m249.spread.moving_crouching = self.m249.spread.crouching * 1.4
	self.m249.spread.moving_steelsight = self.m249.spread.steelsight * 1.4
		
	self.m249.CLIP_AMMO_MAX = 200
	
	self.m249.fire_mode_data.fire_rate = 0.0631578
	
	self.m249.shake.fire_multiplier = 0.8
	self.m249.shake.fire_steelsight_multiplier = -0.8
	
	self.m249.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	
	self.m249.armor_piercing_chance = 0.075
	
	self.m249.damage_near = 18
	self.m249.damage_far = 75
	self.m249.damage_min = 4.0
	
	self.m249.stats.damage = 19
	self.m249.stats.spread = 47
	self.m249.stats.recoil = 78
	self.m249.stats.suppression = 2
		
	
	
	--[[     Longcat     ]]--
	self.rpk.ads_sms = 0.80
	self.rpk.ADS_TIMER = 0.285
	
	self.rpk.kick.standing = { -0.2, 0.675, -0.2925, 0.2925}
	self.rpk.kick.crouching = self.rpk.kick.standing
	self.rpk.kick.steelsight = self.rpk.kick.standing
	
	self.rpk.sounds.fire = "akm_fire_single"
	self.rpk.sounds.fire_single = "akm_fire_single"
	self.rpk.sounds.fire_auto = "akm_fire"
	self.rpk.sounds.stop_fire = "akm_stop"
	self.rpk.sounds.dryfire = "primary_dryfire"
	
	self.rpk.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.rpk.sounds.leave_steelsight = "primary_steel_sight_exit"
		
	self.rpk.CLIP_AMMO_MAX = 75
	
	self.rpk.spread.standing = 1.5
	self.rpk.spread.crouching = 1.4
	self.rpk.spread.steelsight = 0.2
	self.rpk.spread.moving_standing = self.rpk.spread.standing * 1.25
	self.rpk.spread.moving_crouching = self.rpk.spread.crouching * 1.25
	self.rpk.spread.moving_steelsight = self.rpk.spread.steelsight * 1.25
	
	self.rpk.CAN_TOGGLE_FIREMODE = true
	self.rpk.fire_mode_data.fire_rate = 0.1
	
	self.rpk.shake.fire_multiplier = 1
	self.rpk.shake.fire_steelsight_multiplier = -1
	
	self.rpk.armor_piercing_chance = 0.175
	
	self.rpk.damage_near = 18
	self.rpk.damage_far = 65
	self.rpk.damage_min = 4.25
	
	self.rpk.stats.damage = 23
	self.rpk.stats.spread = 51
	self.rpk.stats.recoil = 74
	self.rpk.stats.suppression = 5
	
	
	
	--[[     Related to mai raifu     ]]--
	self.hk21.sub_category = "gpmg"
	self.hk21.reload_speed_mult = 0.85
	self.hk21.rms = 0.75
	self.hk21.ads_sms = 0.50
	self.hk21.sms = 0.70
	self.hk21.ADS_TIMER = 0.370
	
	self.hk21.kick.standing = { 0.7, -0.3, -0.5, 0.5}
	self.hk21.kick.crouching = self.hk21.kick.standing
	self.hk21.kick.steelsight = self.hk21.kick.standing
	
	self.hk21.CAN_TOGGLE_FIREMODE = false
	self.hk21.fire_mode_data.fire_rate = 0.075
	
	self.hk21.spread.standing = 2.2
	self.hk21.spread.crouching = 2.1
	self.hk21.spread.steelsight = 0.2
	self.hk21.spread.moving_standing = self.hk21.spread.standing * 1.4
	self.hk21.spread.moving_crouching = self.hk21.spread.crouching * 1.4
	self.hk21.spread.moving_steelsight = self.hk21.spread.steelsight * 1.4
	
	self.hk21.CLIP_AMMO_MAX = 100
	
	self.hk21.shake.fire_multiplier = 1.0
	self.hk21.shake.fire_steelsight_multiplier = -1.0
	
	self.hk21.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.hk21.armor_piercing_chance = 0.25
	
	self.hk21.damage_near = 20
	self.hk21.damage_far = 95
	self.hk21.damage_min = 4.5
	
	self.hk21.stats_modifiers = { 
		damage = 2,
	}
			
	self.hk21.stats.damage = 18
	self.hk21.stats.spread = 61
	self.hk21.stats.recoil = 54
	self.hk21.stats.suppression = 4
		
	
	
	--[[     More Swede Guns     ]]--
	self.par.sub_category = "gpmg"
	self.par.reload_speed_mult = 0.85
	self.par.rms = 0.7
	self.par.ads_sms = 0.50
	self.par.sms = 0.70
	self.par.ADS_TIMER = 0.380
	
	self.par.kick.standing = { 0.5, -0.25, -0.65, 0.65 }
	self.par.kick.crouching = self.par.kick.standing 
	self.par.kick.steelsight = self.par.kick.standing 
	
	self.par.spread.standing = 2.1
	self.par.spread.crouching = 2.0
	self.par.spread.steelsight = 0.2
	self.par.spread.moving_standing = self.par.spread.standing * 1.35
	self.par.spread.moving_crouching = self.par.spread.crouching * 1.35
	self.par.spread.moving_steelsight = self.par.spread.steelsight * 1.35
	
	self.par.fire_mode_data.fire_rate = 0.08888888888888888888888888888889
	
	self.par.CLIP_AMMO_MAX = 100
	
	self.par.shake.fire_multiplier = 0.5
	self.par.shake.fire_steelsight_multiplier = -0.5
	
	self.par.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.par.armor_piercing_chance = 0.25
	
	self.par.timers.reload_not_empty = 6.3
	self.par.timers.reload_empty = 6.3
	
	self.par.damage_near = 24
	self.par.damage_far = 78.5
	self.par.damage_min = 4.75
	
	self.par.stats_modifiers = { 
		damage = 2,
	}
			
	self.par.stats.damage = 18
	self.par.stats.spread = 57
	self.par.stats.recoil = 68
	self.par.stats.suppression = 0
	
	
	
	--[[     Kerberos (kinda)     ]]--
	self.mg42.sub_category = "gpmg"
	self.mg42.rms = 0.6
	self.mg42.ads_sms = 0.50
	self.mg42.sms = 0.70
	self.mg42.ADS_TIMER = 0.400
	
	self.mg42.kick.standing = { 0.4, -0.2, -0.45, 0.45 }
	self.mg42.kick.crouching = { 0.2, -0.1, -0.225, 0.225 }
	self.mg42.kick.steelsight = { 0.8, -0.3, -0.45, 0.45}
	
	self.mg42.spread.standing = 1.45
	self.mg42.spread.crouching = 1.2
	self.mg42.spread.steelsight = 0.2
	self.mg42.spread.moving_standing = self.mg42.spread.standing * 1.5
	self.mg42.spread.moving_crouching = self.mg42.spread.crouching * 1.5
	self.mg42.spread.moving_steelsight = self.mg42.spread.steelsight * 1.5
	
	self.mg42.fire_mode_data.fire_rate = 0.05
	
	self.mg42.CLIP_AMMO_MAX = 50
	
	self.mg42.shake.fire_multiplier = 1.1
	self.mg42.shake.fire_steelsight_multiplier = -1.1
	
	self.mg42.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.mg42.armor_piercing_chance = 0.25
	
	self.mg42.damage_near = 6
	self.mg42.damage_far = 60
	self.mg42.damage_min = 4.25
	
	self.mg42.stats_modifiers = { 
		damage = 2,
	}
			
	self.mg42.stats.damage = 24
	self.mg42.stats.spread = 66
	self.mg42.stats.recoil = 51
	self.mg42.stats.suppression = 0
	
	--}
	
	
	--[[Snipers (GET NO SCOOOOOOOOPED]]	
	--{
	
	--[[     Flippity Floop     ]]--
	self.winchester1874.ADS_TIMER = 0.320
	
	self.winchester1874.kick.standing = { 1.1, 0.7, -0.1, 0.1 }
	self.winchester1874.kick.crouching = self.winchester1874.kick.standing
	self.winchester1874.kick.steelsight = self.winchester1874.kick.standing
	
	self.winchester1874.spread.standing = 1.4
	self.winchester1874.spread.crouching = 1.2
	self.winchester1874.spread.steelsight = 0.1
	self.winchester1874.spread.moving_standing = self.winchester1874.spread.standing * 1.2
	self.winchester1874.spread.moving_crouching = self.winchester1874.spread.crouching * 1.2
	self.winchester1874.spread.moving_steelsight = self.winchester1874.spread.steelsight * 1.2
	
	self.winchester1874.fire_mode_data.fire_rate = 0.75
	
	self.winchester1874.damage_near = 25
	self.winchester1874.damage_far = 70
	self.winchester1874.damage_min = 4.0
	
	self.winchester1874.stats_modifiers = { 
		damage = 2,
	}
			
	self.winchester1874.stats.damage = 30
	self.winchester1874.stats.spread = 81
	self.winchester1874.stats.recoil = 41
	self.winchester1874.stats.suppression = 7
	
	
	
	--[[     (P)MSR     ]]--
	self.msr.ADS_TIMER = 0.330
	
	self.msr.spread.standing = 10
	self.msr.spread.crouching = self.msr.spread.standing * 0.75
	self.msr.spread.steelsight = 0.1
	self.msr.spread.moving_standing = self.msr.spread.standing * 1.25
	self.msr.spread.moving_crouching = self.msr.spread.crouching * 1.25
	self.msr.spread.moving_steelsight = self.msr.spread.steelsight * 1.25
	
	self.msr.fire_mode_data.fire_rate = 0.92307692307692307692307692307692
	
	self.msr.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.msr.sounds.leave_steelsight = "primary_steel_sight_exit"
	
	self.msr.timers.reload_not_empty = 2.55
	
	self.msr.CLIP_AMMO_MAX = 10
	
	self.msr.kick.standing = { 0.8, 0.2, -0.5, 0.5 }
	self.msr.kick.crouching = self.msr.kick.standing
	self.msr.kick.steelsight = self.msr.kick.standing
	
	self.msr.shake.fire_multiplier = 4
	self.msr.shake.fire_steelsight_multiplier = -4
	
	self.msr.damage_near = 50
	self.msr.damage_far = 175
	self.msr.damage_min = 82.5
	
	self.msr.stats_modifiers = { 
		damage = 2
	}
			
	self.msr.stats.damage = 32
	self.msr.stats.spread = 96
	self.msr.stats.recoil = 28
	self.msr.stats.suppression = 5
	
	
	--[[     47     ]]--
	self.wa2000.reload_speed_mult = 1.1
	self.wa2000.ADS_TIMER = 0.335
	
	self.wa2000.spread.standing = 14
	self.wa2000.spread.crouching = self.wa2000.spread.standing * 0.825
	self.wa2000.spread.steelsight = 0.1
	self.wa2000.spread.moving_standing = self.wa2000.spread.standing * 1.15
	self.wa2000.spread.moving_crouching = self.wa2000.spread.crouching * 1.15
	self.wa2000.spread.moving_steelsight = self.wa2000.spread.steelsight * 1.15
	
	self.wa2000.fire_mode_data.fire_rate = 0.3
	
	self.wa2000.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.wa2000.sounds.leave_steelsight = "primary_steel_sight_exit"
	
	self.wa2000.CLIP_AMMO_MAX = 6
	
	self.wa2000.kick.standing = { 0.9, 0.5, -0.3, 0.3 }
	self.wa2000.kick.crouching = self.wa2000.kick.standing
	self.wa2000.kick.steelsight = self.wa2000.kick.standing
	
	self.wa2000.shake.fire_multiplier = 1.5
	self.wa2000.shake.fire_steelsight_multiplier = 1.5
	
	self.wa2000.damage_near = 40
	self.wa2000.damage_far = 150
	self.wa2000.damage_min = 6.0
	
	self.wa2000.stats_modifiers = { 
		damage = 2, 
		suppression = 3
	}
			
	self.wa2000.stats.damage = 36
	self.wa2000.stats.spread = 91
	self.wa2000.stats.recoil = 22
	self.wa2000.stats.suppression = 6
		
		
		--[[     Win M70     ]]--
	self.model70.ADS_TIMER = 0.340
	
	self.model70.spread.standing = 12
	self.model70.spread.crouching = self.model70.spread.standing * 0.75
	self.model70.spread.steelsight = 0.1
	self.model70.spread.moving_standing = self.model70.spread.standing * 1.15
	self.model70.spread.moving_crouching = self.model70.spread.crouching * 1.15
	self.model70.spread.moving_steelsight = self.model70.spread.steelsight * 1.15
	
	self.model70.fire_mode_data.fire_rate = 1
	
	self.model70.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.model70.sounds.leave_steelsight = "primary_steel_sight_exit"
		
	self.model70.CLIP_AMMO_MAX = 5
	
	self.model70.kick.standing = { 0.9, 0.5, -0.1, 0.5 }
	self.model70.kick.crouching = self.model70.kick.standing
	self.model70.kick.steelsight = self.model70.kick.standing
	
	self.model70.shake.fire_multiplier = 1.1
	self.model70.shake.fire_steelsight_multiplier = -1.1
	
	self.model70.damage_near = 60
	self.model70.damage_far = 200
	self.model70.damage_min = 9.0
	
	self.model70.stats_modifiers = { 
		damage = 2, 
		suppression = 3
	}
			
	self.model70.stats.damage = 36
	self.model70.stats.spread = 97
	self.model70.stats.recoil = 22
	self.model70.stats.suppression = 6
	
	
	
	--[[     MOIST NUGGET     ]]--
	self.mosin.ADS_TIMER = 0.350
	
	self.mosin.spread.standing = 10
	self.mosin.spread.crouching = self.mosin.spread.standing / 1.4
	self.mosin.spread.steelsight = 0.1
	self.mosin.spread.moving_standing = self.mosin.spread.standing * 1.45
	self.mosin.spread.moving_crouching = self.mosin.spread.crouching * 1.45
	self.mosin.spread.moving_steelsight = self.mosin.spread.steelsight * 1.45
	
	self.mosin.fire_mode_data.fire_rate = 1.0909090909090909090909090909091
	
	self.mosin.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.mosin.sounds.leave_steelsight = "primary_steel_sight_exit"
	
	self.mosin.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	
	self.mosin.CLIP_AMMO_MAX = 5
	
	self.mosin.kick.standing = {1.1, 0.1, -0.4, 0.4 }
	self.mosin.kick.crouching = self.mosin.kick.standing
	self.mosin.kick.steelsight = self.mosin.kick.standing
	
	self.mosin.shake.fire_multiplier = 4
	self.mosin.shake.fire_steelsight_multiplier = -4
	
	self.mosin.damage_near = 45
	self.mosin.damage_far = 185
	self.mosin.damage_min = 8.0
	
	self.mosin.stats_modifiers = { 
		damage = 4, 
		suppression = 3
	}
	
	self.mosin.stats.damage = 24
	self.mosin.stats.spread = 94
	self.mosin.stats.recoil = 19
	self.mosin.stats.suppression = 5
	
	
	
	--[[     R63     ]]--
	self.r93.ADS_TIMER = 0.375
	
	self.r93.spread.standing = 14
	self.r93.spread.crouching = self.r93.spread.standing / 1.3
	self.r93.spread.steelsight = 0.1
	self.r93.spread.moving_standing = self.r93.spread.standing * 1.5
	self.r93.spread.moving_crouching = self.r93.spread.crouching * 1.5
	self.r93.spread.moving_steelsight = self.r93.spread.steelsight * 1.5
	
	self.r93.fire_mode_data.fire_rate = 1.2
	
	self.r93.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.r93.sounds.leave_steelsight = "primary_steel_sight_exit"
	
	self.r93.kick.standing = {0.8, 0.7, -0.2, 0.3 }
	self.r93.kick.crouching = self.r93.kick.standing
	self.r93.kick.steelsight = self.r93.kick.standing
	
	self.r93.CLIP_AMMO_MAX = 6
	
	self.r93.shake.fire_multiplier = 3
	self.r93.shake.fire_steelsight_multiplier = -3
	
	self.r93.damage_near = 80
	self.r93.damage_far = 350
	self.r93.damage_min = 20.0
	
	self.r93.stats_modifiers = {
			damage = 4,
			suppression = 3,
		}
	
	self.r93.stats.damage = 70
	self.r93.stats.spread = 99
	self.r93.stats.recoil = 10
	self.r93.stats.suppression = 4
	
	
	--[[     SHITTER BAIT     ]]--
	self.m95.sub_category = "anti_mat"
	self.m95.rms = 0.75
	self.m95.ADS_TIMER = 0.400
	
	self.m95.spread.standing = 16
	self.m95.spread.crouching = self.m95.spread.standing / 1.2
	self.m95.spread.steelsight = 0.1
	self.m95.spread.moving_standing = self.m95.spread.standing * 1.7
	self.m95.spread.moving_crouching = self.m95.spread.crouching * 1.7
	self.m95.spread.moving_steelsight = self.m95.spread.steelsight * 1.7
	
	self.m95.kick.standing = {1.125, 1.625, 0.875, 1.375 }
	self.m95.kick.crouching = self.m95.kick.standing
	self.m95.kick.steelsight = self.m95.kick.standing
	
	self.m95.sounds.enter_steelsight = "lmg_steelsight_enter"
	self.m95.sounds.leave_steelsight = "lmg_steelsight_exit"
	
	self.m95.fire_mode_data.fire_rate = 1.5
	
	self.m95.shake.fire_multiplier = 4.5
	self.m95.shake.fire_steelsight_multiplier = -4.5
	
	self.m95.no_crits = true
	self.m95.ignore_damage_upgrades = true
	
	self.m95.CLIP_AMMO_MAX = 5
	
	self.m95.damage_near = 80
	self.m95.damage_far = 500
	self.m95.damage_min = 200.0
	
	self.m95.stats_modifiers = {
			damage = 12,
			suppression = 5,
		}
	
	self.m95.stats.damage = 96
	self.m95.stats.spread = 97
	self.m95.stats.recoil = 5
	self.m95.stats.suppression = 2
	--}
	
end