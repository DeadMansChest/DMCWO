--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_eco_init = EconomyTweakData.init
function EconomyTweakData:init()
	old_eco_init(self)
	for bonus,i in pairs(self.bonuses) do
		self.bonuses[ bonus ].stats = { value = 1 }
		self.bonuses[ bonus ].exp_multiplier = 1
		self.bonuses[ bonus ].money_multiplier = 1
		self.bonuses[ bonus ].name_id = "dmc_lolskinboosts"
	end
end
