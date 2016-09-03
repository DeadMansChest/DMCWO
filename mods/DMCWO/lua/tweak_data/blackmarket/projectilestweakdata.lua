--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_proj_init = BlackMarketTweakData._init_projectiles
function BlackMarketTweakData:_init_projectiles(...)
	old_proj_init(self, ...)
	--self.projectiles.rocket_frag.physic_effect = nil
		
	self.projectiles.launcher_frag.add_trail_effect = true
	self.projectiles.launcher_incendiary.add_trail_effect = true
	
	self.projectiles.launcher_frag_m32.add_trail_effect = true
	self.projectiles.launcher_incendiary_m32.add_trail_effect = true
	
	self.projectiles.launcher_frag_china.add_trail_effect = true
	self.projectiles.launcher_incendiary_china.add_trail_effect = true
		
	for proj_id, i in pairs(self.projectiles) do
		self.projectiles[proj_id].time_cheat = nil
	end
end