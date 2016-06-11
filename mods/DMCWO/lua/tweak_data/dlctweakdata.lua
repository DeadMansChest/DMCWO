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
	
	self.dmcwo_hp = {}
	self.dmcwo_hp.free = true
	self.dmcwo_hp.content = {}
	self.dmcwo_hp.content.loot_global_value = "dmcwo"
	self.dmcwo_hp.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "hp_ammo",
			amount = 1
		}
	}
	self.dmcwo_ak_45 = {}
	self.dmcwo_ak_45.free = true
	self.dmcwo_ak_45.content = {}
	self.dmcwo_ak_45.content.loot_global_value = "dmcwo"
	self.dmcwo_ak_45.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "ak_45_mag",
			amount = 1
		}
	}
	self.dmcwo_ap = {}
	self.dmcwo_ap.free = true
	self.dmcwo_ap.content = {}
	self.dmcwo_ap.content.loot_global_value = "dmcwo"
	self.dmcwo_ap.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "ap_ammo",
			amount = 1
		}
	}
	self.dmcwo_match = {}
	self.dmcwo_match.free = true
	self.dmcwo_match.content = {}
	self.dmcwo_match.content.loot_global_value = "dmcwo"
	self.dmcwo_match.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "match_ammo",
			amount = 1
		}
	}
	self.dmcwo_low = {}
	self.dmcwo_low.free = true
	self.dmcwo_low.content = {}
	self.dmcwo_low.content.loot_global_value = "dmcwo"
	self.dmcwo_low.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "low_ammo",
			amount = 1
		}
	}
	self.dmcwo_m134_slow = {}
	self.dmcwo_m134_slow.free = true
	self.dmcwo_m134_slow.content = {}
	self.dmcwo_m134_slow.content.loot_global_value = "dmcwo"
	self.dmcwo_m134_slow.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "m134_slow",
			amount = 1
		}
	}
	self.dmcwo_m134_slower = {}
	self.dmcwo_m134_slower.free = true
	self.dmcwo_m134_slower.content = {}
	self.dmcwo_m134_slower.content.loot_global_value = "dmcwo"
	self.dmcwo_m134_slower.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "m134_slower",
			amount = 1
		}
	}
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
	self.dmcwo_burst_mod = {}
	self.dmcwo_burst_mod.free = true
	self.dmcwo_burst_mod.content = {}
	self.dmcwo_burst_mod.content.loot_global_value = "dmcwo"
	self.dmcwo_burst_mod.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "burst_mod",
			amount = 1
		}
	}
	self.dmcwo_mac_slow = {}
	self.dmcwo_mac_slow.free = true
	self.dmcwo_mac_slow.content = {}
	self.dmcwo_mac_slow.content.loot_global_value = "dmcwo"
	self.dmcwo_mac_slow.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "mac_slow",
			amount = 1
		}
	}
	self.dmcwo_birdshot = {}
	self.dmcwo_birdshot.free = true
	self.dmcwo_birdshot.content = {}
	self.dmcwo_birdshot.content.loot_global_value = "dmcwo"
	self.dmcwo_birdshot.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "sho_birdshot",
			amount = 1
		}
	}
	self.dmcwo_schnellfeuer = {}
	self.dmcwo_schnellfeuer.free = true
	self.dmcwo_schnellfeuer.content = {}
	self.dmcwo_schnellfeuer.content.loot_global_value = "dmcwo"
	self.dmcwo_schnellfeuer.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "schnellfeuer",
			amount = 1
		}
	}
	self.dmcwo_m16_stock = {}
	self.dmcwo_m16_stock.free = true
	self.dmcwo_m16_stock.content = {}
	self.dmcwo_m16_stock.content.loot_global_value = "dmcwo"
	self.dmcwo_m16_stock.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "m16_stock",
			amount = 1
		}
	}
	self.dmcwo_shortdot = {}
	self.dmcwo_shortdot.free = true
	self.dmcwo_shortdot.content = {}
	self.dmcwo_shortdot.content.loot_global_value = "dmcwo"
	self.dmcwo_shortdot.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "shortdot_normal",
			amount = 1
		}
	}
	self.dmcwo_irons = {}
	self.dmcwo_irons.free = true
	self.dmcwo_irons.content = {}
	self.dmcwo_irons.content.loot_global_value = "dmcwo"
	self.dmcwo_irons.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "sniper_irons",
			amount = 1
		}
	}
	self.dmcwo_an94_b = {}
	self.dmcwo_an94_b.free = true
	self.dmcwo_an94_b.content = {}
	self.dmcwo_an94_b.content.loot_global_value = "dmcwo"
	self.dmcwo_an94_b.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "an94_burst",
			amount = 1
		}
	}
	self.dmcwo_aw = {}
	self.dmcwo_aw.free = true
	self.dmcwo_aw.content = {}
	self.dmcwo_aw.content.loot_global_value = "dmcwo"
	self.dmcwo_aw.content.loot_drops = {
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
	}
	self.dmcwo_sc2010 = {}
	self.dmcwo_sc2010.free = true
	self.dmcwo_sc2010.content = {}
	self.dmcwo_sc2010.content.loot_global_value = "dmcwo"
	self.dmcwo_sc2010.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "casanave",
			amount = 1
		}
	}
	self.dmcwo_vonderhaar  = {}
	self.dmcwo_vonderhaar.free = true
	self.dmcwo_vonderhaar.content = {}
	self.dmcwo_vonderhaar.content.loot_global_value = "dmcwo"
	self.dmcwo_vonderhaar.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "dredge",
			amount = 1
		}
	}
	self.dmcwo_gaben = {}
	self.dmcwo_gaben.free = true
	self.dmcwo_gaben.content = {}
	self.dmcwo_gaben.content.loot_global_value = "dmcwo"
	self.dmcwo_gaben.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "cs_clarion",
			amount = 1
		}
	}
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
	self.dmcwo_remove_stockab = {}
	self.dmcwo_remove_stockab.free = true
	self.dmcwo_remove_stockab.content = {}
	self.dmcwo_remove_stockab.content.loot_global_value = "dmcwo"
	self.dmcwo_remove_stockab.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "general_no_stock",
			amount = 1
		}
	}
	self.readd_drum = {}
	self.readd_drum.free = true
	self.readd_drum.content = {}
	self.readd_drum.content.loot_global_value = "dmcwo"
	self.readd_drum.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_upg_saiga_m_20rnd",
			amount = 1
		}
	}
	self.dmcwo_conversions = {}
	self.dmcwo_conversions.free = true
	self.dmcwo_conversions.content = {}
	self.dmcwo_conversions.content.loot_global_value = "dmcwo"
	self.dmcwo_conversions.content.loot_drops = {
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
		}
	}
end
