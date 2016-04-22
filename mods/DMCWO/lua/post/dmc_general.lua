--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

if RequiredScript == "lib/tweak_data/upgradestweakdata" then

local old_upgrades_init = UpgradesTweakData.init
function UpgradesTweakData:init()
	old_upgrades_init(self)
	
	self.explosive_bullet.curve_pow = 0.1
	self.explosive_bullet.player_dmg_mul = 0.5
	self.explosive_bullet.camera_shake_max_mul = 5
	
	self.values.striker.reload_speed_multiplier = {1}
	self.values.player.body_armor.damage_shake[1] = 2.000
	self.values.player.body_armor.damage_shake[2] = 1.714
	self.values.player.body_armor.damage_shake[3] = 1.429
	self.values.player.body_armor.damage_shake[4] = 1.143
	self.values.player.body_armor.damage_shake[5] = 0.857
	self.values.player.body_armor.damage_shake[6] = 0.571
	self.values.player.body_armor.damage_shake[7] = 0.286
	self.values.weapon.silencer_recoil_multiplier = {0.90}
	self.values.weapon.silencer_spread_multiplier = {0.90}
	self.values.weapon.silencer_enter_steelsight_speed_multiplier = {1.50}
	self.skill_descs.silence_expert.multibasic = "10%"
	self.skill_descs.silence_expert.multibasic2 = "50%"
	self.skill_descs.silence_expert.multipro = "10%"
	self.values.player.passive_health_regen = {0.015}
	self.specialization_descs[2][9].multiperk2 = "1.5%"
	self.values.assault_rifle.enter_steelsight_speed_multiplier = {1.40}
	self.values.snp.enter_steelsight_speed_multiplier = {1.20}
	self.skill_descs.rifleman = { 
		[1] = 2, 
		[2] = 1, 
		multibasic = "fuck", multibasic2 = "my", 
		multipro = "ass"
	}
	self.damage_to_hot_data.stacking_cooldown = 3
	self.specialization_descs[11][1].multiperk4 = "3"
	self.values.shotgun.recoil_multiplier = {0.90}
	self.values.shotgun.damage_multiplier = {1.25}
	self.skill_descs.shotgun_impact.multibasic = "10%"
	self.skill_descs.shotgun_impact.multipro = "25%"
	self.values.team.pistol.recoil_multiplier = {0.90}
	self.values.team.weapon.recoil_multiplier = {0.90}	
end

elseif RequiredScript == "lib/tweak_data/skilltreetweakdata" then

local old_skill_init = SkillTreeTweakData.init
function SkillTreeTweakData:init()
	old_skill_init(self)
	if DMCWO.GEDDAN == true then
		self.skills.ammo_reservoir["desc_id"] = "menu_ammo_reservoir_desc_jam"
		self.skills.ammo_reservoir["desc_id"] = "menu_perseverance_desc_jam"
	end
	self.specializations[10][1].upgrades = {"temporary_loose_ammo_restore_health_1"}
end

elseif RequiredScript == "lib/tweak_data/economytweakdata" then

local old_eco_init = EconomyTweakData.init
function EconomyTweakData:init()
	old_eco_init(self)
	for bonus,i in pairs(self.bonuses) do
		self.bonuses[ bonus ].stats = { value = 1}
		self.bonuses[ bonus ].exp_multiplier = 1
		self.bonuses[ bonus ].money_multiplier = 1
		self.bonuses[ bonus ].name_id = "dmc_lolskinboosts"
	end
end

elseif RequiredScript == "lib/tweak_data/blackmarket/projectilestweakdata" then

	local old_proj_init = BlackMarketTweakData._init_projectiles
	function BlackMarketTweakData:_init_projectiles()
		old_proj_init(self)
		for proj_id, i in pairs(self.projectiles) do
			self.projectiles[proj_id].time_cheat = nil
		end
	end
	
	
elseif RequiredScript == "lib/managers/moneymanager" then

	function MoneyManager:get_weapon_price(weapon_id)
		local pc = self:_get_weapon_pc(weapon_id)
		if not tweak_data.money_manager.weapon_cost[pc] then
			if pc and pc > #tweak_data.money_manager.weapon_cost then
				pc = #tweak_data.money_manager.weapon_cost
			else
				pc = 1
			end
		end
		if tweak_data.weapon[weapon_id] and tweak_data.weapon[weapon_id].bmp then
			pc = tweak_data.weapon[weapon_id].bmp 
		end
		local cost = self:get_tweak_value("money_manager", "weapon_cost", pc)
		local cost_multiplier = 1
		do
			local weapon_tweak_data = tweak_data.weapon[weapon_id]
			local category = weapon_tweak_data and weapon_tweak_data.category
			cost_multiplier = cost_multiplier * (category and tweak_data.upgrades.weapon_cost_multiplier[category] or 1)
		end
		return math.round(cost * cost_multiplier)
	end
	
	function MoneyManager:get_weapon_price_modified(weapon_id)
		local pc = self:_get_weapon_pc(weapon_id)
		if not tweak_data.money_manager.weapon_cost[pc] then
			if pc and pc > #tweak_data.money_manager.weapon_cost then
				pc = #tweak_data.money_manager.weapon_cost
			else
				pc = 1
			end
		end
		if tweak_data.weapon[weapon_id] and tweak_data.weapon[weapon_id].bmp then
			pc = tweak_data.weapon[weapon_id].bmp 
		end
		local cost = self:get_tweak_value("money_manager", "weapon_cost", pc)
		local cost_multiplier = 1
		cost_multiplier = cost_multiplier * managers.player:upgrade_value("player", "buy_cost_multiplier", 1)
		cost_multiplier = cost_multiplier * managers.player:upgrade_value("player", "crime_net_deal", 1)
		do
			local weapon_tweak_data = tweak_data.weapon[weapon_id]
			local category = weapon_tweak_data and weapon_tweak_data.category
			cost_multiplier = cost_multiplier * (category and tweak_data.upgrades.weapon_cost_multiplier[category] or 1)
		end
		return math.round(cost * cost_multiplier)
	end

elseif RequiredScript == "lib/tweak_data/tweakdata" then


	if not tweak_data then return end
	
	tweak_data.projectiles.wpn_prj_ace.launch_speed = 1500
	tweak_data.projectiles.wpn_prj_ace.adjust_z = 45
	
	tweak_data.projectiles.wpn_prj_four.launch_speed = 1200
	tweak_data.projectiles.wpn_prj_four.adjust_z = 45

	tweak_data.projectiles.rocket_frag.launch_speed = 3750
	tweak_data.projectiles.launcher_rocket.damage = 900
	tweak_data.projectiles.launcher_rocket.range = 500
	
	tweak_data.projectiles.west_arrow.launch_speed = 2750
	tweak_data.projectiles.west_arrow.adjust_z = -45
	tweak_data.projectiles.bow_poison_arrow.launch_speed = 2500
	tweak_data.projectiles.bow_poison_arrow.adjust_z = -45
	tweak_data.projectiles.west_arrow_exp.launch_speed = 2500
	tweak_data.projectiles.west_arrow_exp.adjust_z = -45
	
	tweak_data.projectiles.long_arrow.launch_speed = 3250
	tweak_data.projectiles.long_arrow.adjust_z = -45
	tweak_data.projectiles.long_arrow.damage = 30
	tweak_data.projectiles.long_poison_arrow.launch_speed = 3000
	tweak_data.projectiles.long_poison_arrow.adjust_z = -45
	tweak_data.projectiles.long_poison_arrow.damage = 7.5
	tweak_data.projectiles.long_arrow_exp.launch_speed = 2000
	tweak_data.projectiles.long_arrow_exp.adjust_z = -45
	tweak_data.projectiles.long_arrow_exp.damage = 50
	
	tweak_data.projectiles.crossbow_arrow.launch_speed = 2250
	tweak_data.projectiles.crossbow_arrow.adjust_z = 45
	tweak_data.projectiles.crossbow_poison_arrow.launch_speed = 2000
	tweak_data.projectiles.crossbow_poison_arrow.adjust_z = 45
	tweak_data.projectiles.crossbow_poison_arrow.damage = 3.25
	tweak_data.projectiles.crossbow_arrow_exp.launch_speed = 1000
	tweak_data.projectiles.crossbow_arrow_exp.adjust_z = 45
	
	tweak_data.projectiles.frankish_arrow.launch_speed = 3000
	tweak_data.projectiles.frankish_arrow.adjust_z = 45
	tweak_data.projectiles.frankish_arrow.damage = 25
	tweak_data.projectiles.frankish_poison_arrow.launch_speed = 2750
	tweak_data.projectiles.frankish_poison_arrow.adjust_z = 45
	tweak_data.projectiles.frankish_poison_arrow.damage = 10
	tweak_data.projectiles.frankish_arrow_exp.launch_speed = 2000
	tweak_data.projectiles.frankish_arrow_exp.adjust_z = 45
	tweak_data.projectiles.frankish_arrow_exp.damage = 32.5
	
	tweak_data.projectiles.arblast_arrow.launch_speed = 3500
	tweak_data.projectiles.arblast_arrow.adjust_z = 45
	tweak_data.projectiles.arblast_arrow.damage = 57.5
	tweak_data.projectiles.arblast_poison_arrow.launch_speed = 3250
	tweak_data.projectiles.arblast_poison_arrow.adjust_z = 45
	tweak_data.projectiles.arblast_poison_arrow.damage = 20
	tweak_data.projectiles.arblast_arrow_exp.launch_speed = 2500
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