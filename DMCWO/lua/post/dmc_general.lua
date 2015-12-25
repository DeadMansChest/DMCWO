--[[
v1.5
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/tweak_data/upgradestweakdata" then

local old_upgrades_init = UpgradesTweakData.init
function UpgradesTweakData:init()
	old_upgrades_init(self)
	
	self.explosive_bullet.curve_pow = 0.25
	self.explosive_bullet.player_dmg_mul = 0.25
	self.explosive_bullet.camera_shake_max_mul = 5
	
	self.values.striker.reload_speed_multiplier = {1}
		
	--Armor flinch adjustments
	self.values.player.body_armor.damage_shake[1] = 3
	self.values.player.body_armor.damage_shake[2] = 2
	self.values.player.body_armor.damage_shake[3] = 1
	self.values.player.body_armor.damage_shake[4] = 0.95
			
	---Gunslinger adjustments
	self.values.akimbo.damage_addend = {1.5}
	
	--"Silent Killer" adjustments
	self.values.weapon.silencer_damage_multiplier = { 1.125, 1.25}	--BASIC, ACE
	--self.skill_descs.hitman.multibasic = "12.5%"
	--self.skill_descs.hitman.multipro = "25%"
	
	--"The Professional" adjustments
	self.values.weapon.silencer_recoil_multiplier = {0.90}
	self.values.weapon.silencer_spread_multiplier = {0.85}
	self.values.weapon.silencer_enter_steelsight_speed_multiplier = {1.25}
	--self.skill_descs.silence_expert.multibasic = "10%"
	--self.skill_descs.silence_expert.multipro = "15%"
	--self.skill_descs.silence_expert.multipro2 = "25%"
	
	--"Mag Plus" adjustments
	self.values.weapon.clip_ammo_increase = { 10, 20 }
	self.skill_descs.mag_plus.multibasic = "10"
	self.skill_descs.mag_plus.multipro = "10"
	
	--"Shotgun Impact" adjustments
	self.values.shotgun.recoil_multiplier = { 0.90  }
	self.values.shotgun.damage_multiplier = { 1.25 }
	self.skill_descs.shotgun_impact.multibasic = "10%"
	self.skill_descs.shotgun_impact.multipro = "25%"
	
	self.values.team.pistol.recoil_multiplier = {0.90}
	self.values.team.weapon.recoil_multiplier = {0.90}
	--self.skill_descs.leadership.multibasic = "10%"
	--self.skill_descs.leadership.multipro = "10%"
	
	self.values.snp.recoil_multiplier = {0.90}
	self.values.assault_rifle.recoil_multiplier = {0.90}
	--self.skill_descs.sharpshooter.multipro = "10%"
	
end

elseif RequiredScript == "lib/tweak_data/economytweakdata" then

local old_eco_init = EconomyTweakData.init
function EconomyTweakData:init()
	old_eco_init(self)
	for bonus,i in pairs(self.bonuses) do
		self.bonuses[ bonus ].stats = {}
		self.bonuses[ bonus ].exp_multiplier = 1
		self.bonuses[ bonus ].money_multiplier = 1
		self.bonuses[ bonus ].name_id = "dmc_lolskinboosts"
	end
end

elseif RequiredScript == "lib/tweak_data/tweakdata" then


	if not tweak_data then return end
	
	tweak_data.projectiles.wpn_prj_ace.launch_speed = 1000
	tweak_data.projectiles.wpn_prj_ace.adjust_z = 45
	
	tweak_data.projectiles.wpn_prj_four.launch_speed = 1200
	tweak_data.projectiles.wpn_prj_four.adjust_z = 45

	tweak_data.projectiles.rocket_frag.launch_speed = 3750
	
	tweak_data.projectiles.west_arrow.launch_speed = 2750
	tweak_data.projectiles.west_arrow.adjust_z = -45
	tweak_data.projectiles.bow_poison_arrow.launch_speed = 2500
	tweak_data.projectiles.bow_poison_arrow.adjust_z = -45
	tweak_data.projectiles.west_arrow_exp.launch_speed = 2250
	tweak_data.projectiles.west_arrow_exp.adjust_z = -45
	
	tweak_data.projectiles.long_arrow.launch_speed = 3250
	tweak_data.projectiles.long_arrow.adjust_z = -45
	tweak_data.projectiles.long_arrow.damage = 30
	tweak_data.projectiles.long_poison_arrow.launch_speed = 3000
	tweak_data.projectiles.long_poison_arrow.adjust_z = -45
	tweak_data.projectiles.long_poison_arrow.damage = 7.5
	tweak_data.projectiles.long_arrow_exp.launch_speed = 2750
	tweak_data.projectiles.long_arrow_exp.adjust_z = -45
	tweak_data.projectiles.long_arrow_exp.damage = 50
	
	tweak_data.projectiles.crossbow_arrow.launch_speed = 2250
	tweak_data.projectiles.crossbow_arrow.adjust_z = 45
	tweak_data.projectiles.crossbow_poison_arrow.launch_speed = 2000
	tweak_data.projectiles.crossbow_poison_arrow.adjust_z = 45
	tweak_data.projectiles.crossbow_poison_arrow.damage = 3.25
	tweak_data.projectiles.crossbow_arrow_exp.launch_speed = 1750
	tweak_data.projectiles.crossbow_arrow_exp.adjust_z = 45
	
	tweak_data.projectiles.frankish_arrow.launch_speed = 3000
	tweak_data.projectiles.frankish_arrow.adjust_z = 45
	tweak_data.projectiles.frankish_arrow.damage = 25
	tweak_data.projectiles.frankish_poison_arrow.launch_speed = 2750
	tweak_data.projectiles.frankish_poison_arrow.adjust_z = 45
	tweak_data.projectiles.frankish_poison_arrow.damage = 10
	tweak_data.projectiles.frankish_arrow_exp.launch_speed = 2500
	tweak_data.projectiles.frankish_arrow_exp.adjust_z = 45
	tweak_data.projectiles.frankish_arrow_exp.damage = 32.5
	
	tweak_data.projectiles.arblast_arrow.launch_speed = 3500
	tweak_data.projectiles.arblast_arrow.adjust_z = 45
	tweak_data.projectiles.arblast_arrow.damage = 57.5
	tweak_data.projectiles.arblast_poison_arrow.launch_speed = 3250
	tweak_data.projectiles.arblast_poison_arrow.adjust_z = 45
	tweak_data.projectiles.arblast_poison_arrow.damage = 20
	tweak_data.projectiles.arblast_arrow_exp.launch_speed = 3000
	tweak_data.projectiles.arblast_arrow_exp.adjust_z = 45
	tweak_data.projectiles.arblast_arrow_exp.damage = 60


elseif RequiredScript == "lib/tweak_data/blackmarket/weaponskinstweakdata" then

local old_skins_init = BlackMarketTweakData._init_weapon_skins
function BlackMarketTweakData:_init_weapon_skins()
	old_skins_init(self)
	for skin,i in pairs(self.weapon_skins) do
		self.weapon_skins[ skin ].locked = nil
		if self.weapon_skins[ skin ].rarity ~= "legendary" then	
			self.weapon_skins[ skin ].desc_id = nil
			self.weapon_skins[ skin ].default_blueprint = nil
		end
	end
end

end