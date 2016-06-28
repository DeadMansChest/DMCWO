--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]
local old_infamy_init = InfamyTweakData.init
function InfamyTweakData:init()
	old_infamy_init(self)
	if DMCWO.mozzarella ~= true then
		self.items.infamy_mastermind.upgrades.skilltree.multiplier = 1
		self.items.infamy_mastermind.desc_id = "menu_infamy_desc_mastermind_dmc"
		self.items.infamy_enforcer.upgrades.skilltree.multiplier = 1
		self.items.infamy_enforcer.desc_id = "menu_infamy_desc_enforcer_dmc"
		self.items.infamy_technician.upgrades.skilltree.multiplier = 1
		self.items.infamy_technician.desc_id = "menu_infamy_desc_technician_dmc"
		self.items.infamy_ghost.upgrades.skilltree.multiplier = 1
		self.items.infamy_ghost.desc_id = "menu_infamy_desc_ghost_dmc"
	end
end
