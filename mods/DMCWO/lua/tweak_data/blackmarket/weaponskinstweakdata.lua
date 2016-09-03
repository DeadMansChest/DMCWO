--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_skins_init = BlackMarketTweakData._init_weapon_skins
function BlackMarketTweakData:_init_weapon_skins()
	old_skins_init(self)
	
	--Fix for the SPAS-12 "Anti-Life" skin when used with Gunsmith Noob's Animated Pump
	self.weapon_skins.spas12_burn.types.foregrip = {
			base_gradient = Idstring("units/payday2_cash/safes/burn/base_gradient/base_burn_010_b_df"),
			pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_017_df"),
			pattern_tweak = Vector3(1.05, 1.7, 1),
			pattern_pos = Vector3(0.955, 2.252, 0),
			uv_scale = Vector3(1, 1, 0.720964),
			cubemap_pattern_control = Vector3(0, 0.436157, 0),
			pattern_gradient = Idstring("units/payday2_cash/safes/burn/pattern_gradient/gradient_burn_003_df")
		}
	
	for skin,i in pairs(self.weapon_skins) do
		self.weapon_skins[ skin ].locked = nil
		if self.weapon_skins[ skin ].rarity ~= "legendary" then	
			self.weapon_skins[ skin ].desc_id = nil
			self.weapon_skins[ skin ].default_blueprint = nil
		end
	end
end