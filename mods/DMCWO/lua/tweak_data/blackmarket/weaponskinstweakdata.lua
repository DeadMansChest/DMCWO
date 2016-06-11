--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

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