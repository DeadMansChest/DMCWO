--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_levels_init = LevelsTweakData.init
function LevelsTweakData:init()
	old_levels_init(self)
	self.short1_stage1.force_equipment = {
		character = "russian",
		primary = "wpn_fps_ass_amcar",
		primary_mods = {
			"wpn_fps_upg_ns_ass_smg_large"
		},
		secondary = "wpn_fps_pis_g17",
		secondary_mods = {
			"wpn_fps_upg_ns_pis_large"
		},
		armor = "level_1",
		deployable = "none",
		throwable = "none",
		melee = "none"
	}
	self.short1_stage2.force_equipment = {
		character = "russian",
		primary = "wpn_fps_ass_amcar",
		primary_mods = {
			"wpn_fps_upg_ns_ass_smg_large"
		},
		secondary = "wpn_fps_pis_g17",
		secondary_mods = {
			"wpn_fps_upg_ns_pis_large"
		},
		armor = "level_1",
		deployable = "ecm_jammer",
		throwable = "none",
		melee = "none"
	}
end