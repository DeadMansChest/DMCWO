--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_equip_init = EquipmentsTweakData.init
function EquipmentsTweakData:init()
	old_equip_init(self)
	
	--I'd sooner un-nerf the RPG-7
	self.sentry_gun.quantity = {1}
	
end