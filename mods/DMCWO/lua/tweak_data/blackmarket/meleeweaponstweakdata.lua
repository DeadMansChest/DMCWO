--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_melee_init = BlackMarketTweakData._init_melee_weapons
function BlackMarketTweakData:_init_melee_weapons(...)
	old_melee_init(self, ...)
	
	local melee_anim = {}
	
	--melee_nin
	melee_anim = {
		'nin'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_nin"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
		self.melee_weapons[melee_id].expire_t = 1.1
		self.melee_weapons[melee_id].repeat_expire_t = 0.9
		self.melee_weapons[melee_id].melee_damage_delay = 0.15
	end
	--melee_wing
	melee_anim = {
		'wing'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_wing"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
		self.melee_weapons[melee_id].expire_t = 0.75
		self.melee_weapons[melee_id].repeat_expire_t = 0.75
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
	end
	--melee_knife2
	melee_anim = {
		'model24','microphone'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_knife2"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
		self.melee_weapons[melee_id].expire_t = 0.825
		self.melee_weapons[melee_id].repeat_expire_t = 0.6
		self.melee_weapons[melee_id].melee_damage_delay = 0.175
	end
	--melee_pitchfork
	melee_anim = {
		'pitchfork'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_pitchfork"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
		self.melee_weapons[melee_id].expire_t = 0.8
		self.melee_weapons[melee_id].repeat_expire_t = 0.7
		self.melee_weapons[melee_id].melee_damage_delay = 0.325
	end
	--melee_twins
	melee_anim = {
		'twins'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_twins"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right","a_weapon_left"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
		self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2"}
		self.melee_weapons[melee_id].expire_t = 0.9
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
	end
	--melee_road
	melee_anim = {
		'road'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_road"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = { "var1","var2","var3","var4"}
		self.melee_weapons[melee_id].expire_t = 0.8
		self.melee_weapons[melee_id].repeat_expire_t = 0.8
		self.melee_weapons[melee_id].melee_damage_delay = 0.375
	end
	--melee_psycho
	melee_anim = {
		'chef','shawn'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_psycho"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = { "var1","var2","var4"}
		self.melee_weapons[melee_id].expire_t = 0.8
		self.melee_weapons[melee_id].repeat_expire_t = 0.4 
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
	end
	--melee_beardy
	melee_anim = {
		'beardy'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_beardy"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
		self.melee_weapons[melee_id].expire_t = 1.45
		self.melee_weapons[melee_id].repeat_expire_t = 1.2
		self.melee_weapons[melee_id].melee_damage_delay = 0.65
	end
	--melee_stab
	melee_anim = {
		'toothbrush','cqc','fork','pugio','fairbair','bayonet'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_stab"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].expire_t = 0.825
		self.melee_weapons[melee_id].repeat_expire_t = 0.5
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
	end
	--melee_pickaxe
	melee_anim = {
		'micstand','mining_pick'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_pickaxe"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
		self.melee_weapons[melee_id].expire_t = 1.1
		self.melee_weapons[melee_id].repeat_expire_t = 0.85
		self.melee_weapons[melee_id].melee_damage_delay = 0.175
	end
	--melee_freedom
	melee_anim = {}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_freedom"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1"}
		self.melee_weapons[melee_id].expire_t = 1.25
		self.melee_weapons[melee_id].melee_damage_delay = 0.215
	end
	--melee_taser
	melee_anim = {
		'taser'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_taser"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2",}
		self.melee_weapons[melee_id].expire_t = 0.7
		self.melee_weapons[melee_id].repeat_expire_t = 0.6
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
	end
	--melee_briefcase
	melee_anim = {
		'briefcase'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_briefcase"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
		self.melee_weapons[melee_id].expire_t = 1.2
		self.melee_weapons[melee_id].repeat_expire_t = 1
		self.melee_weapons[melee_id].melee_damage_delay = 0.3
	end
	--melee_baseballbat
	melee_anim = {
		'barbedwire','dingdong','baseballbat','alien_maul','fireaxe','freedom'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_baseballbat"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
		self.melee_weapons[melee_id].expire_t = 1.1
		self.melee_weapons[melee_id].repeat_expire_t = 0.9
		self.melee_weapons[melee_id].melee_damage_delay = 0.275
	end
	--melee_axe
	melee_anim = {
		'becker','machete','gator','moneybundle','tomahawk','scalper','bullseye','poker','selfie','swagger','hammer','tenderizer','croupier_rake'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_axe"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var3","var4"}
		self.melee_weapons[melee_id].expire_t = 0.9
		self.melee_weapons[melee_id].repeat_expire_t = 0.6
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
	end
	--melee_cutters
	melee_anim = {
		'cutters'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_cutters"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
		self.melee_weapons[melee_id].anim_attack_charged_vars = {"var4"}
		self.melee_weapons[melee_id].expire_t = 1.15
		self.melee_weapons[melee_id].repeat_expire_t = 0.8
		self.melee_weapons[melee_id].melee_damage_delay = 0.3
	end
	--melee_boxcutter
	melee_anim = {
		'boxcutter','switchblade'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_boxcutter"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}	
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var3"}
		self.melee_weapons[melee_id].expire_t = 0.45
		self.melee_weapons[melee_id].repeat_expire_t = 0.325
		self.melee_weapons[melee_id].melee_damage_delay = 0.15
	end
	--melee_knife
	melee_anim = {
		'gerber','x46','kabartanto','kabar','kampfmesser','rambo','bowie','scoutknife'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_knife"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1", "var3", "var4"}
		self.melee_weapons[melee_id].expire_t = 1.2
		self.melee_weapons[melee_id].repeat_expire_t = 0.75
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
	end
	--melee_boxing
	melee_anim = {
		'boxing_gloves'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_boxing"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var3"}
		self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2","var4"}
		self.melee_weapons[melee_id].expire_t = 0.75
		self.melee_weapons[melee_id].repeat_expire_t = 0.5
		self.melee_weapons[melee_id].melee_damage_delay = 0.15
	end
	--melee_blunt
	melee_anim = {
		'baton','oldbaton','detector','shovel','shillelagh','whiskey','iceaxe','morning','branding_iron',"slot_lever"
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_blunt"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
		self.melee_weapons[melee_id].expire_t = 1.1
		self.melee_weapons[melee_id].repeat_expire_t = 0.8
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
	end
	--melee_tiger
	melee_anim = {
		'tiger'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_tiger"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
		self.melee_weapons[melee_id].expire_t = 0.85
		self.melee_weapons[melee_id].repeat_expire_t = 0.6
		self.melee_weapons[melee_id].melee_damage_delay = 0.15
	end
	--melee_fist
	melee_anim = {
		'fists','brass_knuckles','zeus'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_fist"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
		self.melee_weapons[melee_id].expire_t = 0.85
		self.melee_weapons[melee_id].repeat_expire_t = 0.5
		self.melee_weapons[melee_id].melee_damage_delay = 0.2
	end
	--melee_fight
	melee_anim = {
		'fight'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_fight"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
		self.melee_weapons[melee_id].expire_t = 0.9
		self.melee_weapons[melee_id].repeat_expire_t = 0.5
		self.melee_weapons[melee_id].melee_damage_delay = 0.125
	end
	
	--melee_cleaver
	melee_anim = {
		'cleaver','meat_cleaver','spatula'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_cleaver"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
		self.melee_weapons[melee_id].anim_attack_vars = { "var1","var4"}
		self.melee_weapons[melee_id].expire_t = 0.9
		self.melee_weapons[melee_id].repeat_expire_t = 0.65
		self.melee_weapons[melee_id].melee_damage_delay = 0.15
	end
	--melee_sandsteel
	melee_anim = {
		'sandsteel','hockey'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_sandsteel"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].timing_fix = {"var3"}
		self.melee_weapons[melee_id].timing_fix_speed_mult = 0.8
		self.melee_weapons[melee_id].anim_attack_vars = {"var3"}
		self.melee_weapons[melee_id].anim_attack_left_vars = {"var2"}
		self.melee_weapons[melee_id].anim_attack_right_vars = {"var1"}
		self.melee_weapons[melee_id].expire_t = 1
		self.melee_weapons[melee_id].repeat_expire_t = 0.75
		self.melee_weapons[melee_id].melee_damage_delay = 0.215
	end
	--melee_ballistic
	melee_anim = {
		'ballistic',
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_ballistic"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right","a_weapon_left"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
		self.melee_weapons[melee_id].expire_t = 1		
		self.melee_weapons[melee_id].expire_t = 0.9
		self.melee_weapons[melee_id].melee_damage_delay = 0.125
	end
	--melee_hockey
	melee_anim = {
		'stick'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_hockey"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
		self.melee_weapons[melee_id].timing_fix = {"var4"}
		self.melee_weapons[melee_id].timing_fix_speed_mult = 0.58
		self.melee_weapons[melee_id].expire_t = 0.8
		self.melee_weapons[melee_id].repeat_expire_t = 0.7
		self.melee_weapons[melee_id].melee_damage_delay = 0.175
	end
	--melee_great
	melee_anim = {
		'great'
	}
	for i, melee_id in ipairs(melee_anim) do
		self.melee_weapons[melee_id].anim_global_param = "melee_great"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var4"}
		self.melee_weapons[melee_id].anim_attack_left_vars = {"var1"}
		self.melee_weapons[melee_id].anim_attack_right_vars = {"var2"}
		self.melee_weapons[melee_id].anim_attack_charged_vars = {"var3"}
		self.melee_weapons[melee_id].expire_t = 1.45
		self.melee_weapons[melee_id].repeat_expire_t = 1.25
		self.melee_weapons[melee_id].melee_damage_delay = 0.6
	end
	
	
	--Buttstock Melee
	self.melee_weapons.weapon.expire_t = 0.6
	self.melee_weapons.weapon.repeat_expire_t = 0.55
	self.melee_weapons.weapon.stats.min_damage = 3.0
	self.melee_weapons.weapon.stats.max_damage = 3.0
	self.melee_weapons.weapon.stats.min_damage_effect = 2
	self.melee_weapons.weapon.stats.max_damage_effect = 2
	self.melee_weapons.weapon.stats.range = 145
	
	
	
	--ORAORAORAORAORAORAORAORAORAORAORA
	self.melee_weapons.fists.type = "axe"
	self.melee_weapons.fists.speed_mult = 1.6
	self.melee_weapons.fists.sounds.charge = nil
	self.melee_weapons.fists.stats.charge_time = 0.5
	self.melee_weapons.fists.stats.min_damage = 1.5
	self.melee_weapons.fists.stats.max_damage = 3.5
	self.melee_weapons.fists.stats.min_damage_effect = 3
	self.melee_weapons.fists.stats.max_damage_effect = 4
	self.melee_weapons.fists.stats.range = 110
	if DMCWO.kenshiroraoraora == true then
		self.melee_weapons.fists.type = "knife"
		self.melee_weapons.fists.speed_mult = 8
		self.melee_weapons.fists.anim_attack_vars = {"var1","var4"}
		self.melee_weapons.fists.stats.min_damage_effect = 100
		self.melee_weapons.fists.stats.max_damage_effect = 100
	end
	--Open Palm Kata
	self.melee_weapons.fight.speed_mult = 2.15
	self.melee_weapons.fight.sounds.charge = nil
	self.melee_weapons.fight.stats.charge_time = 1.80
	self.melee_weapons.fight.stats.min_damage = 1
	self.melee_weapons.fight.stats.max_damage = 5
	self.melee_weapons.fight.stats.min_damage_effect = 0.5
	self.melee_weapons.fight.stats.max_damage_effect = 4
	self.melee_weapons.fight.stats.range = 110
	--Brass
	self.melee_weapons.brass_knuckles.type = "axe"
	self.melee_weapons.brass_knuckles.speed_mult = 1.4
	self.melee_weapons.brass_knuckles.sounds.charge = nil
	self.melee_weapons.brass_knuckles.stats.charge_time = 0.6
	self.melee_weapons.brass_knuckles.stats.min_damage = 2.5
	self.melee_weapons.brass_knuckles.stats.max_damage = 5
	self.melee_weapons.brass_knuckles.stats.min_damage_effect = 3
	self.melee_weapons.brass_knuckles.stats.max_damage_effect = 5
	self.melee_weapons.brass_knuckles.stats.range = 110
	--Gloves
	self.melee_weapons.boxing_gloves.speed_mult = 1
	self.melee_weapons.boxing_gloves.stats.charge_time = 2.5
	self.melee_weapons.boxing_gloves.stats.min_damage = 1.5
	self.melee_weapons.boxing_gloves.stats.max_damage = 4
	self.melee_weapons.boxing_gloves.stats.min_damage_effect = 4
	self.melee_weapons.boxing_gloves.stats.max_damage_effect = 8
	self.melee_weapons.boxing_gloves.stats.range = 120
	--Tekko-Kagi
	self.melee_weapons.tiger.speed_mult = 0.9
	self.melee_weapons.tiger.stats.charge_time = 1.35
	self.melee_weapons.tiger.stats.min_damage = 3
	self.melee_weapons.tiger.stats.max_damage = 6
	self.melee_weapons.tiger.stats.min_damage_effect = 2
	self.melee_weapons.tiger.stats.max_damage_effect = 3
	self.melee_weapons.tiger.stats.range = 120
	
	
	
	--Boltcutters
	self.melee_weapons.cutters.speed_mult = 1.1
	self.melee_weapons.cutters.stats.min_damage = 2
	self.melee_weapons.cutters.stats.max_damage = 6.5
	self.melee_weapons.cutters.stats.min_damage_effect = 2
	self.melee_weapons.cutters.stats.max_damage_effect = 4
	self.melee_weapons.cutters.stats.charge_time = 1.45
	self.melee_weapons.cutters.stats.range = 150
	
	
	
	--Stay in school
	self.melee_weapons.boxcutter.type = "axe"
	self.melee_weapons.boxcutter.speed_mult = 1
	self.melee_weapons.boxcutter.stats.charge_time = 1.1
	self.melee_weapons.boxcutter.stats.min_damage = 1.5
	self.melee_weapons.boxcutter.stats.max_damage = 5
	self.melee_weapons.boxcutter.stats.min_damage_effect = 0.1
	self.melee_weapons.boxcutter.stats.max_damage_effect = 0.2
	self.melee_weapons.boxcutter.stats.range = 120
	--Switacharooni
	self.melee_weapons.switchblade.type = "axe"
	self.melee_weapons.switchblade.speed_mult = 0.875
	self.melee_weapons.switchblade.stats.charge_time = 1.3
	self.melee_weapons.switchblade.stats.min_damage = 2
	self.melee_weapons.switchblade.stats.max_damage = 6
	self.melee_weapons.switchblade.stats.min_damage_effect = 0.2
	self.melee_weapons.switchblade.stats.max_damage_effect = 0.4
	self.melee_weapons.switchblade.stats.range = 125
	self.melee_weapons.switchblade.stats.concealment = 30
	--Becker Machete
	self.melee_weapons.becker.type = "knife"
	self.melee_weapons.becker.make_effect = true
	self.melee_weapons.becker.speed_mult = 0.9
	self.melee_weapons.becker.stats.charge_time = 1.8
	self.melee_weapons.becker.stats.min_damage = 5
	self.melee_weapons.becker.stats.max_damage = 9
	self.melee_weapons.becker.stats.min_damage_effect = 0.6
	self.melee_weapons.becker.stats.max_damage_effect = 0.8
	self.melee_weapons.becker.stats.range = 170
	self.melee_weapons.becker.stats.concealment = 28
	--Machete
	self.melee_weapons.machete.type = "knife"
	self.melee_weapons.machete.make_effect = true
	self.melee_weapons.machete.speed_mult = 0.85
	self.melee_weapons.machete.stats.charge_time = 2.0
	self.melee_weapons.machete.stats.min_damage = 5
	self.melee_weapons.machete.stats.max_damage = 11
	self.melee_weapons.machete.stats.min_damage_effect = 0.6
	self.melee_weapons.machete.stats.max_damage_effect = 0.8
	self.melee_weapons.machete.stats.range = 190
	self.melee_weapons.machete.stats.concealment = 27
	--Gerber Gator
	self.melee_weapons.gator.type = "knife"
	self.melee_weapons.gator.make_effect = true
	self.melee_weapons.gator.speed_mult = 0.8
	self.melee_weapons.gator.stats.charge_time = 2.3
	self.melee_weapons.gator.stats.min_damage = 6
	self.melee_weapons.gator.stats.max_damage = 13
	self.melee_weapons.gator.stats.min_damage_effect = 0.6
	self.melee_weapons.gator.stats.max_damage_effect = 0.8
	self.melee_weapons.gator.stats.range = 210
	self.melee_weapons.gator.stats.concealment = 27
	--NEED A DISPENSER HERE
	self.melee_weapons.scoutknife.type = "knife"
	self.melee_weapons.scoutknife.make_effect = true
	self.melee_weapons.scoutknife.speed_mult = 1.35
	self.melee_weapons.scoutknife.stats.charge_time = 0.6
	self.melee_weapons.scoutknife.stats.min_damage = 3
	self.melee_weapons.scoutknife.stats.max_damage = 4
	self.melee_weapons.scoutknife.stats.min_damage_effect = 0.4
	self.melee_weapons.scoutknife.stats.max_damage_effect = 0.6
	self.melee_weapons.scoutknife.stats.range = 125
	self.melee_weapons.scoutknife.stats.concealment = 30
	--Gerber Knife
	self.melee_weapons.gerber.type = "knife"
	self.melee_weapons.gerber.make_effect = true
	self.melee_weapons.gerber.speed_mult = 1.3
	self.melee_weapons.gerber.stats.charge_time = 0.75
	self.melee_weapons.gerber.stats.min_damage = 4
	self.melee_weapons.gerber.stats.max_damage = 5
	self.melee_weapons.gerber.stats.min_damage_effect = 0.4
	self.melee_weapons.gerber.stats.max_damage_effect = 0.6
	self.melee_weapons.gerber.stats.range = 125
	self.melee_weapons.gerber.stats.concealment = 30
	--X46
	self.melee_weapons.x46.type = "knife"
	self.melee_weapons.x46.make_effect = true
	self.melee_weapons.x46.speed_mult = 1.2
	self.melee_weapons.x46.stats.charge_time = 0.9
	self.melee_weapons.x46.stats.min_damage = 5
	self.melee_weapons.x46.stats.max_damage = 6
	self.melee_weapons.x46.stats.min_damage_effect = 0.4
	self.melee_weapons.x46.stats.max_damage_effect = 0.6
	self.melee_weapons.x46.stats.range = 135
	self.melee_weapons.x46.stats.concealment = 30
	--Krieger
	self.melee_weapons.kampfmesser.type = "knife"
	self.melee_weapons.kampfmesser.make_effect = true
	self.melee_weapons.kampfmesser.speed_mult = 1.1
	self.melee_weapons.kampfmesser.stats.charge_time = 1.2
	self.melee_weapons.kampfmesser.stats.min_damage = 6
	self.melee_weapons.kampfmesser.stats.max_damage = 7
	self.melee_weapons.kampfmesser.stats.min_damage_effect = 0.4
	self.melee_weapons.kampfmesser.stats.max_damage_effect = 0.6
	self.melee_weapons.kampfmesser.stats.range = 145
	self.melee_weapons.kampfmesser.stats.concealment = 29
	--Tanto
	self.melee_weapons.kabartanto.type = "knife"
	self.melee_weapons.kabartanto.make_effect = true
	self.melee_weapons.kabartanto.speed_mult = 1.1
	self.melee_weapons.kabartanto.stats.charge_time = 1.3
	self.melee_weapons.kabartanto.stats.min_damage = 5
	self.melee_weapons.kabartanto.stats.max_damage = 6
	self.melee_weapons.kabartanto.stats.min_damage_effect = 0.3
	self.melee_weapons.kabartanto.stats.max_damage_effect = 0.5
	self.melee_weapons.kabartanto.stats.range = 150
	self.melee_weapons.kabartanto.stats.concealment = 29
	--Kabar (URSA)
	self.melee_weapons.kabar.type = "knife"
	self.melee_weapons.kabar.make_effect = true
	self.melee_weapons.kabar.speed_mult = 1
	self.melee_weapons.kabar.stats.charge_time = 1.4
	self.melee_weapons.kabar.stats.min_damage = 4.5
	self.melee_weapons.kabar.stats.max_damage = 9
	self.melee_weapons.kabar.stats.min_damage_effect = 0.3
	self.melee_weapons.kabar.stats.max_damage_effect = 0.5
	self.melee_weapons.kabar.stats.range = 150
	self.melee_weapons.kabar.stats.concealment = 29
	--Ball-tastic
	self.melee_weapons.ballistic.sounds.equip = "knife_equip"
	self.melee_weapons.ballistic.sounds.hit_air = "knife_hit_air"
	self.melee_weapons.ballistic.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.ballistic.sounds.hit_body = "knife_hit_body"
	self.melee_weapons.ballistic.sounds.charge = "knife_charge"
	self.melee_weapons.ballistic.type = "knife"
	self.melee_weapons.ballistic.make_effect = true
	self.melee_weapons.ballistic.speed_mult = 1.2
	self.melee_weapons.ballistic.stats.charge_time = 1.2
	self.melee_weapons.ballistic.stats.min_damage = 5
	self.melee_weapons.ballistic.stats.max_damage = 8
	self.melee_weapons.ballistic.stats.min_damage_effect = 0.3
	self.melee_weapons.ballistic.stats.max_damage_effect = 0.5
	self.melee_weapons.ballistic.stats.range = 140
	self.melee_weapons.ballistic.stats.concealment = 29
	--Rambo
	self.melee_weapons.rambo.type = "knife"
	self.melee_weapons.rambo.make_effect = true
	self.melee_weapons.rambo.speed_mult = 0.9
	self.melee_weapons.rambo.stats.charge_time = 1.55
	self.melee_weapons.rambo.stats.min_damage = 5
	self.melee_weapons.rambo.stats.max_damage = 10
	self.melee_weapons.rambo.stats.min_damage_effect = 0.3
	self.melee_weapons.rambo.stats.max_damage_effect = 0.5
	self.melee_weapons.rambo.stats.range = 160
	self.melee_weapons.rambo.stats.concealment = 28
	--Bowie
	self.melee_weapons.bowie.type = "knife"
	self.melee_weapons.bowie.make_effect = true
	self.melee_weapons.bowie.anim_attack_vars = {"var1", "var2", "var3", "var4"}
	self.melee_weapons.bowie.speed_mult = 0.85
	self.melee_weapons.bowie.stats.charge_time = 1.65
	self.melee_weapons.bowie.stats.min_damage = 6
	self.melee_weapons.bowie.stats.max_damage = 12
	self.melee_weapons.bowie.stats.min_damage_effect = 0.3
	self.melee_weapons.bowie.stats.max_damage_effect = 0.5
	self.melee_weapons.bowie.stats.range = 170
	self.melee_weapons.bowie.stats.concealment = 28
	--SPOOPY KNIFE
	self.melee_weapons.chef.type = "knife"
	self.melee_weapons.chef.speed_mult = 0.9
	self.melee_weapons.chef.stats.charge_time = 13
	self.melee_weapons.chef.stats.min_damage = 0.6
	self.melee_weapons.chef.stats.max_damage = 66.6
	self.melee_weapons.chef.stats.min_damage_effect = 0.6
	self.melee_weapons.chef.stats.max_damage_effect = 0.6
	self.melee_weapons.chef.stats.range = 135
	--Shears
	self.melee_weapons.shawn.type = "knife"
	self.melee_weapons.shawn.speed_mult = 1.2
	self.melee_weapons.shawn.stats.charge_time = 0.85
	self.melee_weapons.shawn.stats.min_damage = 2.5
	self.melee_weapons.shawn.stats.max_damage = 4.0
	self.melee_weapons.shawn.stats.min_damage_effect = 0.5
	self.melee_weapons.shawn.stats.max_damage_effect = 1
	self.melee_weapons.shawn.stats.range = 125
	--Toothbrush
	self.melee_weapons.toothbrush.type = "axe"
	self.melee_weapons.toothbrush.speed_mult = 1.7
	self.melee_weapons.toothbrush.stats.charge_time = 1.5
	self.melee_weapons.toothbrush.stats.min_damage = 1
	self.melee_weapons.toothbrush.stats.max_damage = 8
	self.melee_weapons.toothbrush.stats.min_damage_effect = 0.1
	self.melee_weapons.toothbrush.stats.max_damage_effect = 0.1
	self.melee_weapons.toothbrush.stats.range = 125
	--Fork her
	self.melee_weapons.fork.type = "axe"
	self.melee_weapons.fork.speed_mult = 1.45
	self.melee_weapons.fork.stats.charge_time = 1
	self.melee_weapons.fork.stats.min_damage = 2
	self.melee_weapons.fork.stats.max_damage = 5
	self.melee_weapons.fork.stats.min_damage_effect = 0.1
	self.melee_weapons.fork.stats.max_damage_effect = 0.2
	self.melee_weapons.fork.stats.range = 135
	--Pugio
	self.melee_weapons.pugio.speed_mult = 1.25
	self.melee_weapons.pugio.make_effect = true
	self.melee_weapons.pugio.stats.charge_time = 0.45
	self.melee_weapons.pugio.stats.min_damage = 3
	self.melee_weapons.pugio.stats.max_damage = 7
	self.melee_weapons.pugio.stats.min_damage_effect = 0.4
	self.melee_weapons.pugio.stats.max_damage_effect = 0.4
	self.melee_weapons.pugio.stats.range = 150
	self.melee_weapons.pugio.stats.concealment = 30
	--Bayonet
	self.melee_weapons.bayonet.speed_mult = 1.1
	self.melee_weapons.bayonet.make_effect = true
	self.melee_weapons.bayonet.stats.charge_time = 0.6
	self.melee_weapons.bayonet.stats.min_damage = 4.5
	self.melee_weapons.bayonet.stats.max_damage = 6
	self.melee_weapons.bayonet.stats.min_damage_effect = 0.5
	self.melee_weapons.bayonet.stats.max_damage_effect = 0.5
	self.melee_weapons.bayonet.stats.range = 140
	self.melee_weapons.bayonet.stats.concealment = 30
	--REMEMBER THE BASICS OF
	self.melee_weapons.cqc.dot_data = {
		type = "poison",
		custom_data = {dot_length = 1, hurt_animation_chance = 0.75}
	}
	self.melee_weapons.cqc.speed_mult = 1
	self.melee_weapons.cqc.make_effect = true
	self.melee_weapons.cqc.stats.charge_time = 1.6
	self.melee_weapons.cqc.stats.min_damage = 2
	self.melee_weapons.cqc.stats.max_damage = 8
	self.melee_weapons.cqc.stats.min_damage_effect = 0.3
	self.melee_weapons.cqc.stats.max_damage_effect = 0.3
	self.melee_weapons.cqc.stats.range = 125
	--Trench
	self.melee_weapons.fairbair.speed_mult = 0.85
	self.melee_weapons.fairbair.make_effect = true
	self.melee_weapons.fairbair.stats.charge_time = 0.75
	self.melee_weapons.fairbair.stats.min_damage = 4.5
	self.melee_weapons.fairbair.stats.max_damage = 6
	self.melee_weapons.fairbair.stats.min_damage_effect = 0.75
	self.melee_weapons.fairbair.stats.max_damage_effect = 0.75
	self.melee_weapons.fairbair.stats.range = 150
	self.melee_weapons.fairbair.stats.concealment = 29
	--FUCK YEAH
	self.melee_weapons.freedom.type = "knife"
	self.melee_weapons.freedom.make_effect = true
	self.melee_weapons.freedom.speed_mult = 0.85
	self.melee_weapons.freedom.anim_attack_vars = {"var3"}
	self.melee_weapons.freedom.stats.charge_time = 2
	self.melee_weapons.freedom.stats.min_damage = 3
	self.melee_weapons.freedom.stats.max_damage = 8
	self.melee_weapons.freedom.stats.min_damage_effect = 0.8
	self.melee_weapons.freedom.stats.max_damage_effect = 1.2
	self.melee_weapons.freedom.stats.range = 290
	self.melee_weapons.freedom.stats.concealment = 27
	--New we just need a giant spoon
	self.melee_weapons.pitchfork.type = "axe"
	self.melee_weapons.pitchfork.make_effect = true
	self.melee_weapons.pitchfork.speed_mult = 0.9
	self.melee_weapons.pitchfork.stats.charge_time = 1.7
	self.melee_weapons.pitchfork.stats.min_damage = 3.5
	self.melee_weapons.pitchfork.stats.max_damage = 9.0
	self.melee_weapons.pitchfork.stats.min_damage_effect = 0.5
	self.melee_weapons.pitchfork.stats.max_damage_effect = 1
	self.melee_weapons.pitchfork.stats.range = 240
	--THIS IS ACTUALLY MY FIRST KATANA
	self.melee_weapons.sandsteel.type = "sword"
	self.melee_weapons.sandsteel.make_effect = true
	self.melee_weapons.sandsteel.speed_mult = 1.05
	self.melee_weapons.sandsteel.stats.charge_time = 2.5
	self.melee_weapons.sandsteel.stats.min_damage = 7.5
	self.melee_weapons.sandsteel.stats.max_damage = 20
	self.melee_weapons.sandsteel.stats.min_damage_effect = 0.5
	self.melee_weapons.sandsteel.stats.max_damage_effect = 0.65
	self.melee_weapons.sandsteel.stats.range = 240
	self.melee_weapons.sandsteel.stats.concealment = 23
	if DMCWO.RULESOFNATURE then	
		self.melee_weapons.sandsteel.speed_mult = 2.1
		self.melee_weapons.sandsteel.stats.charge_time = 1.25
		self.melee_weapons.sandsteel.stats.min_damage = 3.75
		self.melee_weapons.sandsteel.stats.max_damage = 10
	end
	--FREEEEEDOOOOOOOM
	self.melee_weapons.great.speed_mult = 0.95
	self.melee_weapons.great.make_effect = true
	self.melee_weapons.great.stats.charge_time = 2.9
	self.melee_weapons.great.stats.min_damage = 10
	self.melee_weapons.great.stats.max_damage = 25
	self.melee_weapons.great.stats.min_damage_effect = 0.6
	self.melee_weapons.great.stats.max_damage_effect = 0.8
	self.melee_weapons.great.stats.range = 265
	self.melee_weapons.great.stats.concealment = 21
	
	
	
	--Lara Croft
	self.melee_weapons.iceaxe.type = "axe"
	self.melee_weapons.iceaxe.make_decal = true
	self.melee_weapons.iceaxe.make_effect = true
	self.melee_weapons.iceaxe.speed_mult = 0.85
	self.melee_weapons.iceaxe.anim_attack_vars = {"var1"}
	self.melee_weapons.iceaxe.stats.charge_time = 1.7
	self.melee_weapons.iceaxe.stats.min_damage = 7
	self.melee_weapons.iceaxe.stats.max_damage = 9
	self.melee_weapons.iceaxe.stats.min_damage_effect = .9
	self.melee_weapons.iceaxe.stats.max_damage_effect = 1.1
	self.melee_weapons.iceaxe.stats.range = 165
	self.melee_weapons.iceaxe.stats.concealment = 28
	--Minecraft
	self.melee_weapons.mining_pick.type = "axe"
	self.melee_weapons.mining_pick.make_decal = true
	self.melee_weapons.mining_pick.make_effect = true
	self.melee_weapons.mining_pick.speed_mult = 0.95
	self.melee_weapons.mining_pick.stats.charge_time = 2
	self.melee_weapons.mining_pick.stats.min_damage = 6
	self.melee_weapons.mining_pick.stats.max_damage = 14
	self.melee_weapons.mining_pick.stats.min_damage_effect = 1
	self.melee_weapons.mining_pick.stats.max_damage_effect = 1.2
	self.melee_weapons.mining_pick.stats.range = 240
	--Rerr's Cleaver
	self.melee_weapons.meat_cleaver.type = "knife"
	self.melee_weapons.meat_cleaver.make_effect = true
	self.melee_weapons.meat_cleaver.speed_mult = 1
	self.melee_weapons.meat_cleaver.stats.charge_time = 1
	self.melee_weapons.meat_cleaver.stats.min_damage = 5
	self.melee_weapons.meat_cleaver.stats.max_damage = 7
	self.melee_weapons.meat_cleaver.stats.min_damage_effect = 0.7
	self.melee_weapons.meat_cleaver.stats.max_damage_effect = 0.9
	self.melee_weapons.meat_cleaver.stats.range = 140
	--Cleaver
	self.melee_weapons.cleaver.type = "knife"
	self.melee_weapons.cleaver.make_effect = true
	self.melee_weapons.cleaver.speed_mult = 1.075
	self.melee_weapons.cleaver.stats.charge_time = 1.15
	self.melee_weapons.cleaver.stats.min_damage = 4
	self.melee_weapons.cleaver.stats.max_damage = 6
	self.melee_weapons.cleaver.stats.min_damage_effect = 0.7
	self.melee_weapons.cleaver.stats.max_damage_effect = 0.9
	self.melee_weapons.cleaver.stats.range = 140
	--AND MY AXE!!!
	self.melee_weapons.beardy.type = "knife"
	self.melee_weapons.beardy.make_effect = true
	self.melee_weapons.beardy.speed_mult = 0.95
	self.melee_weapons.beardy.stats.charge_time = 3.2
	self.melee_weapons.beardy.stats.min_damage = 12
	self.melee_weapons.beardy.stats.max_damage = 20
	self.melee_weapons.beardy.stats.min_damage_effect = 1.0
	self.melee_weapons.beardy.stats.max_damage_effect = 1.2
	self.melee_weapons.beardy.stats.range = 240
	self.melee_weapons.beardy.stats.concealment = 21
	--Fireaxe
	self.melee_weapons.fireaxe.type = "knife"
	self.melee_weapons.fireaxe.make_effect = true
	self.melee_weapons.fireaxe.speed_mult = 0.85
	self.melee_weapons.fireaxe.stats.charge_time = 2.5
	self.melee_weapons.fireaxe.stats.min_damage = 10
	self.melee_weapons.fireaxe.stats.max_damage = 18
	self.melee_weapons.fireaxe.stats.min_damage_effect = 1.1
	self.melee_weapons.fireaxe.stats.max_damage_effect = 1.3
	self.melee_weapons.fireaxe.stats.range = 255
	self.melee_weapons.fireaxe.stats.concealment = 23
	--Scalper
	self.melee_weapons.scalper.type = "knife"
	self.melee_weapons.scalper.make_effect = true
	self.melee_weapons.scalper.speed_mult = 1
	self.melee_weapons.scalper.stats.charge_time = 1.15
	self.melee_weapons.scalper.stats.min_damage = 5
	self.melee_weapons.scalper.stats.max_damage = 7.5
	self.melee_weapons.scalper.stats.min_damage_effect = 0.8
	self.melee_weapons.scalper.stats.max_damage_effect = 1.2
	self.melee_weapons.scalper.stats.range = 165
	--Tomahawk
	self.melee_weapons.tomahawk.type = "knife"
	self.melee_weapons.tomahawk.make_effect = true
	self.melee_weapons.tomahawk.speed_mult = 0.8
	self.melee_weapons.tomahawk.stats.charge_time = 2.1
	self.melee_weapons.tomahawk.stats.min_damage = 8
	self.melee_weapons.tomahawk.stats.max_damage = 10
	self.melee_weapons.tomahawk.stats.min_damage_effect = 0.8
	self.melee_weapons.tomahawk.stats.max_damage_effect = 1.2
	self.melee_weapons.tomahawk.stats.range = 175
	self.melee_weapons.tomahawk.stats.concealment = 27
	--SW Hatchet
	self.melee_weapons.bullseye.type = "knife"
	self.melee_weapons.bullseye.make_effect = true
	self.melee_weapons.bullseye.speed_mult = 0.95
	self.melee_weapons.bullseye.stats.charge_time = 1.4
	self.melee_weapons.bullseye.stats.min_damage = 4
	self.melee_weapons.bullseye.stats.max_damage = 9
	self.melee_weapons.bullseye.stats.min_damage_effect = 0.8
	self.melee_weapons.bullseye.stats.max_damage_effect = 1.2
	self.melee_weapons.bullseye.stats.range = 150
	
	
	
	--Poke her
	self.melee_weapons.poker.type = "axe"
	self.melee_weapons.poker.speed_mult = 0.85
	self.melee_weapons.poker.stats.charge_time = 2
	self.melee_weapons.poker.stats.min_damage = 3.5
	self.melee_weapons.poker.stats.max_damage = 7
	self.melee_weapons.poker.stats.min_damage_effect = 0.8
	self.melee_weapons.poker.stats.max_damage_effect = 1.2
	self.melee_weapons.poker.stats.range = 175
	--LODS OF EMONE
	self.melee_weapons.moneybundle.type = "axe"
	self.melee_weapons.moneybundle.speed_mult = 1.65
	self.melee_weapons.moneybundle.stats.charge_time = 0.8
	self.melee_weapons.moneybundle.stats.min_damage = 0.4
	self.melee_weapons.moneybundle.stats.max_damage = 0.8
	self.melee_weapons.moneybundle.stats.min_damage_effect = 5
	self.melee_weapons.moneybundle.stats.max_damage_effect = 20
	self.melee_weapons.moneybundle.stats.range = 125
	--YOLO SWAG
	self.melee_weapons.swagger.type = "axe"
	self.melee_weapons.swagger.speed_mult = 1.1
	self.melee_weapons.swagger.stats.charge_time = 1.3
	self.melee_weapons.swagger.stats.min_damage = 2.5
	self.melee_weapons.swagger.stats.max_damage = 5
	self.melee_weapons.swagger.stats.min_damage_effect = 1.2
	self.melee_weapons.swagger.stats.max_damage_effect = 2.4
	--WHY THIS
	self.melee_weapons.selfie.type = "axe"
	self.melee_weapons.selfie.speed_mult = 1.2
	self.melee_weapons.selfie.stats.charge_time = 0.9
	self.melee_weapons.selfie.stats.min_damage = 1
	self.melee_weapons.selfie.stats.max_damage = 3.5
	self.melee_weapons.selfie.stats.min_damage_effect = 0.5
	self.melee_weapons.selfie.stats.max_damage_effect = 1
	--Mike's Stand
	self.melee_weapons.micstand.type = "axe"
	self.melee_weapons.micstand.speed_mult = 1.3
	self.melee_weapons.micstand.anim_attack_vars = {"var2"}
	self.melee_weapons.micstand.stats.charge_time = 1.55
	self.melee_weapons.micstand.stats.min_damage = 1.0
	self.melee_weapons.micstand.stats.max_damage = 3.0
	self.melee_weapons.micstand.stats.min_damage_effect = 4
	self.melee_weapons.micstand.stats.max_damage_effect = 6
	self.melee_weapons.micstand.stats.range = 275
	--Hockey
	self.melee_weapons.hockey.type = "axe"
	self.melee_weapons.hockey.speed_mult = 1.25
	self.melee_weapons.hockey.stats.charge_time = 1.7
	self.melee_weapons.hockey.stats.min_damage = 3.5
	self.melee_weapons.hockey.stats.max_damage = 8
	self.melee_weapons.hockey.stats.min_damage_effect = 1
	self.melee_weapons.hockey.stats.max_damage_effect = 3
	self.melee_weapons.hockey.stats.range = 250
	--Spanglebeb
	self.melee_weapons.spatula.type = "axe"
	self.melee_weapons.spatula.speed_mult = 1.2
	self.melee_weapons.spatula.stats.charge_time = 0.2
	self.melee_weapons.spatula.stats.min_damage = 0.5
	self.melee_weapons.spatula.stats.max_damage = 1.5
	self.melee_weapons.spatula.stats.min_damage_effect = 3
	self.melee_weapons.spatula.stats.max_damage_effect = 5
	self.melee_weapons.spatula.stats.range = 125
	--Stoklasa
	self.melee_weapons.microphone.type = "axe"
	self.melee_weapons.microphone.speed_mult = 1.075
	self.melee_weapons.microphone.stats.charge_time = 0.4
	self.melee_weapons.microphone.stats.min_damage = 1
	self.melee_weapons.microphone.stats.max_damage = 3
	self.melee_weapons.microphone.stats.min_damage_effect = 2
	self.melee_weapons.microphone.stats.max_damage_effect = 6
	self.melee_weapons.microphone.stats.range = 125
	--Erica Hartmann
	self.melee_weapons.model24.type = "axe"
	self.melee_weapons.model24.speed_mult = 1.025
	self.melee_weapons.model24.stats.charge_time = 0.65
	self.melee_weapons.model24.stats.min_damage = 2
	self.melee_weapons.model24.stats.max_damage = 3.5
	self.melee_weapons.model24.stats.min_damage_effect = 1.5
	self.melee_weapons.model24.stats.max_damage_effect = 2
	self.melee_weapons.model24.stats.range = 140
	--Normal Bat
	self.melee_weapons.baseballbat.type = "axe"
	self.melee_weapons.baseballbat.speed_mult = 1.1
	self.melee_weapons.baseballbat.stats.charge_time = 1.8
	self.melee_weapons.baseballbat.stats.min_damage = 5
	self.melee_weapons.baseballbat.stats.max_damage = 10
	self.melee_weapons.baseballbat.stats.min_damage_effect = 2
	self.melee_weapons.baseballbat.stats.max_damage_effect = 3
	self.melee_weapons.baseballbat.stats.range = 210
	self.melee_weapons.baseballbat.stats.concealment = 27
	--Wrex
	self.melee_weapons.stick.type = "axe"
	self.melee_weapons.stick.speed_mult = 1.175
	self.melee_weapons.stick.stats.charge_time = 1.55
	self.melee_weapons.stick.stats.min_damage = 3.0
	self.melee_weapons.stick.stats.max_damage = 5.0
	self.melee_weapons.stick.stats.min_damage_effect = 1
	self.melee_weapons.stick.stats.max_damage_effect = 1.5
	self.melee_weapons.stick.stats.range = 260
	--Lucille
	self.melee_weapons.barbedwire.type = "axe"
	self.melee_weapons.barbedwire.speed_mult = 1
	self.melee_weapons.barbedwire.stats.charge_time = 2
	self.melee_weapons.barbedwire.stats.min_damage = 6
	self.melee_weapons.barbedwire.stats.max_damage = 12
	self.melee_weapons.barbedwire.stats.min_damage_effect = 2
	self.melee_weapons.barbedwire.stats.max_damage_effect = 3
	self.melee_weapons.barbedwire.stats.range = 210
	self.melee_weapons.barbedwire.stats.concealment = 26
	--You touch my Tralala Hammer
	self.melee_weapons.dingdong.type = "axe"
	self.melee_weapons.dingdong.make_effect = true
	self.melee_weapons.dingdong.speed_mult = 0.95
	self.melee_weapons.dingdong.stats.charge_time = 2.4
	self.melee_weapons.dingdong.stats.min_damage = 7
	self.melee_weapons.dingdong.stats.max_damage = 14
	self.melee_weapons.dingdong.stats.min_damage_effect = 3
	self.melee_weapons.dingdong.stats.max_damage_effect = 3
	self.melee_weapons.dingdong.stats.range = 230
	self.melee_weapons.dingdong.stats.concealment = 26
	--Ayy Lmao
	self.melee_weapons.alien_maul.type = "axe"
	self.melee_weapons.alien_maul.make_effect = true
	self.melee_weapons.alien_maul.speed_mult = 0.9
	self.melee_weapons.alien_maul.stats.charge_time = 2.8
	self.melee_weapons.alien_maul.stats.min_damage = 8
	self.melee_weapons.alien_maul.stats.max_damage = 16
	self.melee_weapons.alien_maul.stats.min_damage_effect = 2
	self.melee_weapons.alien_maul.stats.max_damage_effect = 3
	self.melee_weapons.alien_maul.stats.range = 240
	self.melee_weapons.alien_maul.stats.concealment = 24
	--Demoman (kinda)
	self.melee_weapons.whiskey.type = "axe"
	self.melee_weapons.whiskey.speed_mult = 1.05
	self.melee_weapons.whiskey.stats.min_damage = 2
	self.melee_weapons.whiskey.stats.max_damage = 3.5
	self.melee_weapons.whiskey.stats.min_damage_effect = 2
	self.melee_weapons.whiskey.stats.max_damage_effect = 3
	self.melee_weapons.whiskey.stats.range = 140
	--HAMMER TIEM
	self.melee_weapons.hammer.type = "axe"
	self.melee_weapons.hammer.make_effect = true
	self.melee_weapons.hammer.speed_mult = 1.1
	self.melee_weapons.hammer.stats.charge_time = 1.1
	self.melee_weapons.hammer.stats.min_damage = 2.5
	self.melee_weapons.hammer.stats.max_damage = 8
	self.melee_weapons.hammer.stats.min_damage_effect = 1.5
	self.melee_weapons.hammer.stats.max_damage_effect = 2
	self.melee_weapons.hammer.stats.range = 130
	--TENDER LOVIN
	self.melee_weapons.tenderizer.type = "axe"
	self.melee_weapons.tenderizer.speed_mult = 1.25
	self.melee_weapons.tenderizer.stats.charge_time = 0.8
	self.melee_weapons.tenderizer.stats.min_damage = 2
	self.melee_weapons.tenderizer.stats.max_damage = 6
	self.melee_weapons.tenderizer.stats.min_damage_effect = 1
	self.melee_weapons.tenderizer.stats.max_damage_effect = 1.5
	self.melee_weapons.tenderizer.stats.range = 130
	--Phillipe Loren
	self.melee_weapons.morning.type = "axe"
	self.melee_weapons.morning.make_effect = true
	self.melee_weapons.morning.speed_mult = 0.725
	self.melee_weapons.morning.stats.charge_time = 3
	self.melee_weapons.morning.stats.min_damage = 6.5
	self.melee_weapons.morning.stats.max_damage = 13
	self.melee_weapons.morning.stats.min_damage_effect = 2.0
	self.melee_weapons.morning.stats.max_damage_effect = 3.0
	self.melee_weapons.morning.stats.range = 195
	--WATCHDOGES
	self.melee_weapons.baton.type = "axe"
	self.melee_weapons.baton.speed_mult = 1.15
	self.melee_weapons.baton.stats.charge_time = 1.1
	self.melee_weapons.baton.stats.min_damage = 1.5
	self.melee_weapons.baton.stats.max_damage = 4
	self.melee_weapons.baton.stats.min_damage_effect = 2.5
	self.melee_weapons.baton.stats.max_damage_effect = 4
	self.melee_weapons.baton.stats.range = 155
	--CLO-ACKER
	self.melee_weapons.oldbaton.type = "axe"
	self.melee_weapons.oldbaton.speed_mult = 1.05
	self.melee_weapons.oldbaton.stats.min_damage = 2.5
	self.melee_weapons.oldbaton.stats.max_damage = 5
	self.melee_weapons.oldbaton.stats.min_damage_effect = 3
	self.melee_weapons.oldbaton.stats.max_damage_effect = 4.5
	self.melee_weapons.oldbaton.stats.charge_time = 1.45
	self.melee_weapons.oldbaton.stats.range = 165
	--DETECTED
	self.melee_weapons.detector.type = "axe"
	self.melee_weapons.detector.speed_mult = 1.25
	self.melee_weapons.detector.stats.charge_time = 0.95
	self.melee_weapons.detector.stats.min_damage = 1
	self.melee_weapons.detector.stats.max_damage = 2
	self.melee_weapons.detector.stats.min_damage_effect = 1.4
	self.melee_weapons.detector.stats.max_damage_effect = 2.8
	self.melee_weapons.detector.stats.range = 140
	--Clover's club thing
	self.melee_weapons.shillelagh.type = "axe"
	self.melee_weapons.shillelagh.speed_mult = 1.1
	self.melee_weapons.shillelagh.stats.charge_time = 1.2
	self.melee_weapons.shillelagh.stats.min_damage = 2
	self.melee_weapons.shillelagh.stats.max_damage = 4
	self.melee_weapons.shillelagh.stats.min_damage_effect = 1.2
	self.melee_weapons.shillelagh.stats.max_damage_effect = 2.4
	self.melee_weapons.shillelagh.stats.range = 145
	--Rusty chain thing
	self.melee_weapons.road.type = "axe"
	self.melee_weapons.road.speed_mult = 0.8
	self.melee_weapons.road.stats.charge_time = 3
	self.melee_weapons.road.stats.min_damage = 9
	self.melee_weapons.road.stats.max_damage = 16
	self.melee_weapons.road.stats.min_damage_effect = 0.8
	self.melee_weapons.road.stats.max_damage_effect = 2
	self.melee_weapons.road.stats.range = 190
	--Shovel
	self.melee_weapons.shovel.type = "axe"
	self.melee_weapons.shovel.speed_mult = 0.875
	self.melee_weapons.shovel.stats.charge_time = 1.85
	self.melee_weapons.shovel.stats.min_damage = 2.5
	self.melee_weapons.shovel.stats.max_damage = 5
	self.melee_weapons.shovel.stats.min_damage_effect = 2
	self.melee_weapons.shovel.stats.max_damage_effect = 5
	self.melee_weapons.shovel.stats.range = 170
	--PULL THE LEVER
	self.melee_weapons.slot_lever.type = "axe"
	self.melee_weapons.slot_lever.speed_mult = 1.05
	self.melee_weapons.slot_lever.anim_attack_vars = {"var1"}
	self.melee_weapons.slot_lever.stats.charge_time = 1.6
	self.melee_weapons.slot_lever.stats.min_damage = 3
	self.melee_weapons.slot_lever.stats.max_damage = 5
	self.melee_weapons.slot_lever.stats.min_damage_effect = 2
	self.melee_weapons.slot_lever.stats.max_damage_effect = 4
	self.melee_weapons.slot_lever.stats.range = 175
	--Rake it in
	self.melee_weapons.croupier_rake.type = "axe"
	self.melee_weapons.croupier_rake.speed_mult = 0.9
	self.melee_weapons.croupier_rake.stats.charge_time = 1.4
	self.melee_weapons.croupier_rake.stats.min_damage = 2.5
	self.melee_weapons.croupier_rake.stats.max_damage = 5
	self.melee_weapons.croupier_rake.stats.min_damage_effect = 1.5
	self.melee_weapons.croupier_rake.stats.max_damage_effect = 3
	self.melee_weapons.croupier_rake.stats.range = 160
	--MY BRAND
	self.melee_weapons.branding_iron.type = "axe"
	self.melee_weapons.branding_iron.speed_mult = 0.8
	self.melee_weapons.branding_iron.stats.charge_time = 1.9
	self.melee_weapons.branding_iron.stats.min_damage = 3.5
	self.melee_weapons.branding_iron.stats.max_damage = 7.5
	self.melee_weapons.branding_iron.stats.min_damage_effect = 2
	self.melee_weapons.branding_iron.stats.max_damage_effect = 4
	self.melee_weapons.branding_iron.stats.range = 190
	
	
	--Nathan Fillion
	self.melee_weapons.buck.stats.make_effect = true
	self.melee_weapons.buck.stats.charge_time = 2.4
	self.melee_weapons.buck.stats.min_damage = 3.0
	self.melee_weapons.buck.stats.max_damage = 8.0
	self.melee_weapons.buck.stats.min_damage_effect = 4
	self.melee_weapons.buck.stats.max_damage_effect = 6
	
	
	--Balisong
	self.melee_weapons.wing.speed_mult = 1.25
	self.melee_weapons.wing.stats.charge_time = 1.7
	self.melee_weapons.wing.stats.min_damage = 3.0
	self.melee_weapons.wing.stats.max_damage = 8.0
	self.melee_weapons.wing.stats.min_damage_effect = 0.1
	self.melee_weapons.wing.stats.max_damage_effect = 0.4
	self.melee_weapons.wing.stats.concealment = 30
	self.melee_weapons.wing.stats.range = 130
	
	
	--ZAP ZAP MOTHERFUCKER
	self.melee_weapons.taser.type = "axe"
	self.melee_weapons.taser.speed_mult = 0.8
	self.melee_weapons.taser.stats.charge_time = 1.6
	self.melee_weapons.taser.stats.min_damage = 0.5
	self.melee_weapons.taser.stats.max_damage = 3.0
	self.melee_weapons.taser.stats.min_damage_effect = 0.6
	self.melee_weapons.taser.stats.max_damage_effect = 0.8
	self.melee_weapons.taser.stats.range = 140
	--Zoose
	self.melee_weapons.zeus.type = "axe"
	self.melee_weapons.zeus.speed_mult = 1.15
	self.melee_weapons.zeus.stats.charge_time = 2.2
	self.melee_weapons.zeus.stats.min_damage = 2.0
	self.melee_weapons.zeus.stats.max_damage = 4.0
	self.melee_weapons.zeus.stats.min_damage_effect = 0.8
	self.melee_weapons.zeus.stats.max_damage_effect = 2.0
	self.melee_weapons.zeus.stats.range = 130
	
	
	--NINE INCHES
	self.melee_weapons.nin.type = "knife"
	self.melee_weapons.nin.make_effect = true
	self.melee_weapons.nin.make_decal = true
	self.melee_weapons.nin.speed_mult = 1.1
	self.melee_weapons.nin.stats.charge_time = 1
	self.melee_weapons.nin.stats.min_damage = 6.5
	self.melee_weapons.nin.stats.max_damage = 6.5
	self.melee_weapons.nin.stats.min_damage_effect = 0.8
	self.melee_weapons.nin.stats.max_damage_effect = 1.2
	self.melee_weapons.nin.stats.range = 155
	
	
	
	--50 Blessings
	self.melee_weapons.briefcase.type = "axe"
	self.melee_weapons.briefcase.speed_mult = 1.1
	self.melee_weapons.briefcase.stats.charge_time = 1.6
	self.melee_weapons.briefcase.stats.min_damage = 1.25
	self.melee_weapons.briefcase.stats.max_damage = 3.5
	self.melee_weapons.briefcase.stats.min_damage_effect = 2
	self.melee_weapons.briefcase.stats.max_damage_effect = 5
	self.melee_weapons.briefcase.stats.range = 130
		
	for melee_id, i in pairs(self.melee_weapons) do
		if self.melee_weapons[melee_id].speed_mult then
			self.melee_weapons[melee_id].expire_t = self.melee_weapons[melee_id].expire_t / self.melee_weapons[melee_id].speed_mult
			self.melee_weapons[melee_id].repeat_expire_t = self.melee_weapons[melee_id].repeat_expire_t / self.melee_weapons[melee_id].speed_mult
			self.melee_weapons[melee_id].melee_damage_delay = self.melee_weapons[melee_id].melee_damage_delay / self.melee_weapons[melee_id].speed_mult
		end
	end
	
end	
