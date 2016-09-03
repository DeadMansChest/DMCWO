--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

old_dlc_td = DLCTweakData.init
function DLCTweakData:init(...)
	old_dlc_td(self, ...)
	self.dmcwo = {}
	self.dmcwo.free = true
	self.dmcwo.content = {}
	self.dmcwo.content.loot_global_value = "dmcwo"
	
	--[[
	self.dmcwo_heiap_ammo = {}
	self.dmcwo_heiap_ammo.free = true
	self.dmcwo_heiap_ammo.content = {}
	self.dmcwo_heiap_ammo.content.loot_global_value = "dmcwo"
	self.dmcwo_heiap_ammo.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "heiap_ammo",
			amount = 1
		}
	}
	]]
	self.dmcwo_wire = {}
	self.dmcwo_wire.free = true
	self.dmcwo_wire.content = {}
	self.dmcwo_wire.content.loot_global_value = "opera"
	self.dmcwo_wire.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "hk_wire_stock",
			amount = 1
		}
	}
	self.dmcwo_rpk_wood = {}
	self.dmcwo_rpk_wood.free = true
	self.dmcwo_rpk_wood.content = {}
	self.dmcwo_rpk_wood.content.loot_global_value = "gage_pack_lmg"
	self.dmcwo_rpk_wood.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "rpk_wood_stock",
			amount = 1
		}
	}
	self.drums_ayy = {}
	self.drums_ayy.free = true
	self.drums_ayy.content = {}
	self.drums_ayy.content.loot_global_value = "normal"
	self.drums_ayy.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_vg_ass_smg_afg",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_vg_ass_smg_stubby",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_vg_ass_smg_verticalgrip",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_m4_m_drum",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_mp5_m_drum",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_upg_ak_m_drum",
			amount = 1
		}
	}
	self.dmcwo_1_82 = {}
	self.dmcwo_1_82.free = true
	self.dmcwo_1_82.content = {}
	self.dmcwo_1_82.content.loot_global_value = "dmcwo"
	self.dmcwo_1_82.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "hp_ammo",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "ak_45_mag",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "ap_ammo",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "match_ammo",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "low_ammo",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "m134_slow",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "m134_slower",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "burst_mod",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "mac_slow",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "sho_birdshot",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "schnellfeuer",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "m16_stock",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "shortdot_normal",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "sniper_irons",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "an94_burst",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "asm1",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "speakeasy",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "casanave",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "dredge",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "cs_clarion",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "general_no_stock",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_upg_saiga_m_20rnd",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "corbon_ammo_conv",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "win_300_ammo_conv",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "beowulf_conv",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "sw40_ammo_conv",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "rowland",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "pl14_auto",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "deagle_50",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "deagle_357",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "m249_para",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "hk21_brenner",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "judge_45lc",
			amount = 1
		}
	}
end
