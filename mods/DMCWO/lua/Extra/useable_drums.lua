if not WeaponFactoryTweakData then return end

local old_m4_init = WeaponFactoryTweakData._init_m4
	
function WeaponFactoryTweakData:_init_m4()
	old_m4_init(self)
	self.parts.wpn_fps_upg_m4_m_drum.pcs = {
			20,
			30,
			40
		}
end

local old_mp5_init = WeaponFactoryTweakData._init_mp5
	
function WeaponFactoryTweakData:_init_mp5()
	old_mp5_init(self)
	self.parts.wpn_fps_smg_mp5_m_drum.pcs = {
			20,
			30,
			40
		}
end

local old_saiga_init = WeaponFactoryTweakData._init_saiga
	
function WeaponFactoryTweakData:_init_saiga()
	old_saiga_init(self)
	self.parts.wpn_upg_saiga_m_20rnd = {
		pcs = {
				20,
				30,
				40
			},
		type = "magazine",
		name_id = "bm_wp_saiga_m_20rnd",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_m_20rnd",
		stats = {value = 1, extra_ammo = 6},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	
	self.parts.wpn_upg_saiga_m_20rnd.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_saiga_m_20rnd"
	table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_upg_saiga_m_20rnd")
end

local old_ak_init = WeaponFactoryTweakData._init_ak_parts
	
function WeaponFactoryTweakData:_init_ak_parts()
	old_ak_init(self)
	self.parts.wpn_upg_ak_m_drum.pcs = {
			20,
			30,
			40
		}
end
