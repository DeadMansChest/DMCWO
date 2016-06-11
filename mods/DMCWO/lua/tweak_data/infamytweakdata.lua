--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]
local old_infamy_init = InfamyTweakData.init
function InfamyTweakData:init()
	old_infamy_init(self)
	self.items.infamy_mastermind.upgrades.skilltree.multiplier = 1
	self.items.infamy_enforcer.upgrades.skilltree.multiplier = 1
	self.items.infamy_technician.upgrades.skilltree.multiplier = 1
	self.items.infamy_ghost.upgrades.skilltree.multiplier = 1
end
