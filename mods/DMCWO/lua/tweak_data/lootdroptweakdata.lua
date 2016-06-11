--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

old_loot = LootDropTweakData.init
function LootDropTweakData:init(tweak_data)
	old_loot(self, tweak_data)
	for loot_value, i in pairs(self.global_values) do
		if self.global_values[ loot_value ].value_multiplier then	
			self.global_values[ loot_value ].value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "superior")
		end
	end
	self.global_values.dmcwo = {}
	self.global_values.dmcwo.name_id = "loot_dmcwo"
	self.global_values.dmcwo.desc_id = "loot_dmcwo_desc"
	self.global_values.dmcwo.color = Color('FF0080')
	self.global_values.dmcwo.dlc = false
	self.global_values.dmcwo.chance = 1
	self.global_values.dmcwo.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "superior")
	self.global_values.dmcwo.durability_multiplier = 1
	self.global_values.dmcwo.drops = false
	self.global_values.dmcwo.track = false
	self.global_values.dmcwo.sort_number = 200
	self.global_values.dmcwo.category = "dmcwo"
end