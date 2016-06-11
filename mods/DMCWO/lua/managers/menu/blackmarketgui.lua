--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local is_win32 = SystemInfo:platform() == Idstring("WIN32")
local NOT_WIN_32 = not is_win32
local WIDTH_MULTIPLIER = NOT_WIN_32 and 0.68 or 0.71
local BOX_GAP = 13.5
local GRID_H_MUL = (NOT_WIN_32 and 6.9 or 6.95) / 8
local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size
local format_round = function(num, round_value)
	if not round_value or not tostring(math.round(num)) then
	end
	return (string.format("%.1f", num):gsub("%.?0+$", ""))
end

function BlackMarketGui:update_info_text()
	local slot_data = self._slot_data
	local tab_data = self._tabs[self._selected]._data
	local prev_data = tab_data.prev_node_data
	local ids_category = Idstring(slot_data.category)
	local identifier = tab_data.identifier
	local updated_texts = {
		{text = ""},
		{text = ""},
		{text = ""},
		{text = ""},
		{text = ""},
		{text = ""},
		{text = ""}
	}
	local ignore_lock = false
	self._stats_text_modslist:set_text("")
	local suspicion, max_reached = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
	self:_set_detection(suspicion, max_reached)
	self:_set_rename_info_text(nil)
	local is_renaming_this = self._renaming_item and not self._data.is_loadout and self._renaming_item.category == slot_data.category and self._renaming_item.slot == slot_data.slot
	if identifier == self.identifiers.weapon then
		local price = slot_data.price or 0
		if not slot_data.empty_slot then
			updated_texts[1].text = slot_data.name_localized
			local resource_color = {}
			updated_texts[2].resource_color = resource_color
			if price > 0 then
				updated_texts[2].text = "##" .. managers.localization:to_upper_text(slot_data.not_moddable and "st_menu_cost" or "st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##"
				table.insert(resource_color, slot_data.can_afford and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
			end
			if not slot_data.not_moddable and not self._data.is_loadout then
				self:_set_rename_info_text(1)
			end
			if not slot_data.unlocked then
				local skill_based = slot_data.skill_based
				local level_based = slot_data.level and 0 < slot_data.level
				local dlc_based = tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
				local part_dlc_locked = slot_data.part_dlc_lock
				local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
				local level_text_id = level_based and "bm_menu_level_req" or false
				local dlc_text_id = dlc_based and slot_data.dlc_locked or false
				local part_dlc_text_id = part_dlc_locked and "bm_menu_part_dlc_locked"
				local text = ""
				if skill_text_id then
					text = text .. managers.localization:to_upper_text(skill_text_id, {
						slot_data.name_localized
					}) .. "\n"
				elseif dlc_text_id then
					text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
				elseif part_dlc_text_id then
					text = text .. managers.localization:to_upper_text(part_dlc_text_id, {}) .. "\n"
				elseif level_text_id then
					text = text .. managers.localization:to_upper_text(level_text_id, {
						level = slot_data.level
					}) .. "\n"
				end
				updated_texts[3].text = text
				updated_texts[3].below_stats = true
			elseif self._slot_data.can_afford == false then
			end
			if slot_data.last_weapon then
				updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_last_weapon_warning") .. "\n"
			end
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				updated_texts[4].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
				updated_texts[4].below_stats = true
			end
			if slot_data.not_moddable then
				local weapon_id = slot_data.name
				local weapon_tweak = weapon_id and tweak_data.weapon[weapon_id].weapon_movement_penalty
				local upgrade_tweak = weapon_id and tweak_data.upgrades.weapon_movement_penalty[weapon_id.category]
				local movement_penalty = weapon_tweak or upgrade_tweak or 1
				if movement_penalty < 1 then
					local penalty_as_string = string.format("%.2f", (movement_penalty * 100))
					updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. "%" 
				end				
				
				if slot_data.global_value and slot_data.global_value == "normal" then
					updated_texts[4].text = updated_texts[4].text .. managers.localization:text(tweak_data.weapon[slot_data.name].desc_id)
				elseif slot_data.global_value and slot_data.global_value ~= "normal" then
					updated_texts[4].text = updated_texts[4].text .. "\n".. managers.localization:text(tweak_data.weapon[slot_data.name].desc_id) 
				end
				updated_texts[4].below_stats = true
			else
				local weapon_id = slot_data.name
				local weapon_tweak = weapon_id and tweak_data.weapon[weapon_id].weapon_movement_penalty
				local upgrade_tweak = weapon_id and tweak_data.upgrades.weapon_movement_penalty[weapon_id.category]
				local movement_penalty = weapon_tweak or upgrade_tweak or 1
				if movement_penalty < 1 then
					local penalty_as_string = string.format("%.2f", (movement_penalty * 100))
					updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. "%" 
				end
			end
			updated_texts[5].below_stats = true
		elseif slot_data.locked_slot then
			ignore_lock = true
			updated_texts[1].text = managers.localization:to_upper_text("bm_menu_locked_weapon_slot")
			if slot_data.cannot_buy then
				updated_texts[3].text = slot_data.dlc_locked
			else
				updated_texts[2].text = slot_data.dlc_locked
			end
			updated_texts[4].text = managers.localization:text("bm_menu_locked_weapon_slot_desc")
		elseif not slot_data.is_loadout then
			local prefix = ""
			if not managers.menu:is_pc_controller() then
				prefix = managers.localization:get_default_macro("BTN_A")
			end
			updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_weapon")
			updated_texts[4].text = managers.localization:text("bm_menu_empty_weapon_slot_buy_info")
		end
	elseif identifier == self.identifiers.melee_weapon then
		updated_texts[1].text = self._slot_data.name_localized
		if not slot_data.unlocked then
			local skill_based = slot_data.skill_based
			local level_based = slot_data.level and 0 < slot_data.level
			local dlc_based = not slot_data.dlc_based and tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
			local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
			local level_text_id = level_based and "bm_menu_level_req" or false
			local dlc_text_id = dlc_based and slot_data.dlc_locked or false
			local text = ""
			if skill_text_id then
				text = text .. managers.localization:to_upper_text(skill_text_id, {
					slot_data.name_localized
				}) .. "\n"
			elseif dlc_text_id then
				text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
			elseif level_text_id then
				text = text .. managers.localization:to_upper_text(level_text_id, {
					level = slot_data.level
				}) .. "\n"
			end
			updated_texts[3].text = text
			updated_texts[3].below_stats = true
		end
		updated_texts[4].resource_color = {}
		local desc_text = managers.localization:text(tweak_data.blackmarket.melee_weapons[slot_data.name].desc_id)
		if slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
		end
		updated_texts[4].below_stats = true
		if slot_data.global_value and slot_data.global_value == "normal" then
			updated_texts[4].text = desc_text --Gotta make descriptions for all the melee weapons first
		elseif slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[4].text = updated_texts[4].text .. "\n".. desc_text 
		end
		updated_texts[4].less_scale = true
	elseif identifier == self.identifiers.grenade then
		updated_texts[1].text = self._slot_data.name_localized
		if not slot_data.unlocked then
			local skill_based = slot_data.skill_based
			local level_based = slot_data.level and 0 < slot_data.level
			local dlc_based = not slot_data.dlc_based and tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
			local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
			local level_text_id = level_based and "bm_menu_level_req" or false
			local dlc_text_id = dlc_based and slot_data.dlc_locked or false
			local text = ""
			if skill_text_id then
				text = text .. managers.localization:to_upper_text(skill_text_id, {
					slot_data.name_localized
				}) .. "\n"
			elseif dlc_text_id then
				text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
			elseif level_text_id then
				text = text .. managers.localization:to_upper_text(level_text_id, {
					level = slot_data.level
				}) .. "\n"
			end
			updated_texts[3].text = text
		end
		updated_texts[4].resource_color = {}
		local desc_text = managers.localization:text(tweak_data.blackmarket.projectiles[slot_data.name].desc_id)
		updated_texts[4].text = desc_text .. "\n"
		if slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
		end
		updated_texts[4].below_stats = true
	elseif identifier == self.identifiers.armor then
		updated_texts[1].text = self._slot_data.name_localized
		if not self._slot_data.unlocked then
			updated_texts[3].text = utf8.to_upper(managers.localization:text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
				level = slot_data.level,
				SKILL = slot_data.name
			}))
			updated_texts[3].below_stats = true
		elseif managers.player:has_category_upgrade("player", "damage_to_hot") then
			if not table.contains(tweak_data:get_raw_value("upgrades", "damage_to_hot_data", "armors_allowed") or {}, self._slot_data.name) then
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_disables_damage_to_hot")
				updated_texts[3].below_stats = true
			end
		elseif managers.player:has_category_upgrade("player", "armor_health_store_amount") then
			local bm_armor_tweak = tweak_data.blackmarket.armors[slot_data.name]
			local upgrade_level = bm_armor_tweak.upgrade_level
			local amount = managers.player:body_armor_value("skill_max_health_store", upgrade_level, 1)
			local multiplier = managers.player:upgrade_value("player", "armor_max_health_store_multiplier", 1)
			updated_texts[2].text = managers.localization:to_upper_text("bm_menu_armor_max_health_store", {
				amount = format_round(amount * multiplier * tweak_data.gui.stats_present_multiplier)
			})
			updated_texts[2].below_stats = true
		end
	elseif identifier == self.identifiers.mask then
		local price = slot_data.price
		if not price then
			if type(slot_data.unlocked) ~= "number" then
				price = managers.money:get_mask_slot_sell_value(slot_data.slot)
			else
				price = managers.money:get_mask_sell_value(slot_data.name, slot_data.global_value)
			end
		end
		if not slot_data.empty_slot then
			updated_texts[1].text = slot_data.name_localized
			if not self._data.is_loadout and slot_data.slot ~= 1 and slot_data.unlocked == true then
				self:_set_rename_info_text(1)
			end
			local resource_colors = {}
			if price > 0 and slot_data.slot ~= 1 then
				updated_texts[2].text = "##" .. managers.localization:to_upper_text("st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##" .. "   "
				table.insert(resource_colors, slot_data.can_afford ~= false and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
			end
			if slot_data.num_backs then
				updated_texts[2].text = updated_texts[2].text .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
					amount = math.abs(slot_data.unlocked)
				}) .. "##"
				table.insert(resource_colors, tweak_data.screen_colors.text)
			end
			if #resource_colors == 1 then
				updated_texts[2].resource_color = resource_colors[1]
			else
				updated_texts[2].resource_color = resource_colors
			end
			local achievement_tracker = tweak_data.achievement.mask_tracker
			local mask_id = slot_data.name
			if slot_data.dlc_locked then
				updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
			elseif slot_data.infamy_lock then
				updated_texts[3].text = managers.localization:to_upper_text("menu_infamy_lock_info")
			elseif mask_id and achievement_tracker[mask_id] and (type(slot_data.unlocked) ~= "number" and not slot_data.unlocked or slot_data.unlocked == 0) then
				local achievement_data = achievement_tracker[mask_id]
				local max_progress = achievement_data.max_progress
				local text_id = achievement_data.text_id
				local award = achievement_data.award
				local stat = achievement_data.stat
				if stat and max_progress > 0 then
					local progress_left = max_progress - (managers.achievment:get_stat(stat) or 0)
					if progress_left > 0 then
						local progress = tostring(progress_left)
						updated_texts[3].text = "##" .. managers.localization:text(achievement_data.text_id, {progress = progress}) .. "##"
						updated_texts[3].resource_color = tweak_data.screen_colors.button_stage_2
					end
				elseif award and not managers.achievment:get_info(award).awarded then
					updated_texts[3].text = "##" .. managers.localization:text(achievement_data.text_id) .. "##"
					updated_texts[3].resource_color = tweak_data.screen_colors.button_stage_2
				end
			end
			if mask_id then
				local desc_id = tweak_data.blackmarket.masks[mask_id].desc_id
				updated_texts[4].text = desc_id and managers.localization:text(desc_id) or Application:production_build() and "Add ##desc_id## to ##" .. mask_id .. "## in tweak_data.blackmarket.masks" or ""
				if managers.dlc:is_mask_achievement_locked(mask_id) and (not tweak_data.blackmarket.masks[mask_id].pcs or not (0 < #tweak_data.blackmarket.masks[mask_id].pcs)) then
					updated_texts[4].text = updated_texts[4].text .. managers.localization:text("bm_msk_achievement_postfix")
				end
				if slot_data.global_value and slot_data.global_value ~= "normal" then
					updated_texts[4].text = updated_texts[4].text .. [[

##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
					updated_texts[4].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
				end
				if Application:production_build() and not desc_id then
					updated_texts[4].resource_color = Color.red
				end
			end
		elseif slot_data.locked_slot then
			ignore_lock = true
			updated_texts[1].text = managers.localization:to_upper_text("bm_menu_locked_mask_slot")
			if slot_data.cannot_buy then
				updated_texts[3].text = slot_data.dlc_locked
			else
				updated_texts[2].text = slot_data.dlc_locked
			end
			updated_texts[4].text = managers.localization:text("bm_menu_locked_mask_slot_desc")
		else
			if slot_data.cannot_buy then
				updated_texts[2].text = managers.localization:to_upper_text("bm_menu_empty_mask_slot")
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_no_masks_in_stash_varning")
			else
				local prefix = ""
				if not managers.menu:is_pc_controller() then
					prefix = managers.localization:get_default_macro("BTN_A")
				end
				updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_mask")
			end
			updated_texts[4].text = managers.localization:text("bm_menu_empty_mask_slot_buy_info")
		end
	elseif identifier == self.identifiers.weapon_mod then
		local price = slot_data.price or managers.money:get_weapon_modify_price(prev_data.name, slot_data.name, slot_data.global_value)
		updated_texts[1].text = slot_data.name_localized
		local resource_colors = {}
		if price > 0 then
			updated_texts[2].text = "##" .. managers.localization:to_upper_text("st_menu_cost") .. " " .. managers.experience:cash_string(price) .. "##"
			table.insert(resource_colors, slot_data.can_afford and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
		end
		local unlocked = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked or 0
		updated_texts[2].text = updated_texts[2].text .. (price > 0 and "   " or "")
		if slot_data.free_of_charge then
			if unlocked > 0 then
				updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("bm_menu_item_unlocked")
			else
				updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("bm_menu_item_locked")
			end
		else
			updated_texts[2].text = updated_texts[2].text .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
				amount = tostring(math.abs(unlocked))
			}) .. "##"
			table.insert(resource_colors, tweak_data.screen_colors.text)
		end
		if #resource_colors == 1 then
			updated_texts[2].resource_color = resource_colors[1]
		else
			updated_texts[2].resource_color = resource_colors
		end
		local can_not_afford = slot_data.can_afford == false
		local conflicted = slot_data.conflict
		local out_of_item = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked == 0
		if slot_data.dlc_locked then
			updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
		elseif conflicted then
			updated_texts[3].text = managers.localization:to_upper_text("bm_menu_conflict", {
				conflict = slot_data.conflict
			})
		end
		local part_id = slot_data.name
		local perks = part_id and tweak_data.weapon.factory.parts[part_id].perks
		local is_gadget = part_id and tweak_data.weapon.factory.parts[part_id].type == "gadget" or perks and table.contains(perks, "gadget")
		local is_ammo = part_id and tweak_data.weapon.factory.parts[part_id].type == "ammo" or perks and table.contains(perks, "ammo")
		local is_bayonet = part_id and tweak_data.weapon.factory.parts[part_id].type == "bayonet" or perks and table.contains(perks, "bayonet")
		local is_bipod = part_id and tweak_data.weapon.factory.parts[part_id].type == "bipod" or perks and table.contains(perks, "bipod")
		local has_desc = part_id and tweak_data.weapon.factory.parts[part_id].has_description == true
		
		local c_stats = part_id and tweak_data.weapon.factory.parts[part_id].custom_stats
		local colours = part_id and tweak_data.weapon.factory.parts[part_id].desc_colors
		
		if is_gadget or is_ammo or is_bayonet or is_bipod or has_desc or perks or c_stats then
			local crafted = managers.blackmarket:get_crafted_category_slot(prev_data.category, prev_data.slot)
			updated_texts[4].text = managers.weapon_factory:get_part_desc_by_part_id_from_weapon(part_id, crafted.factory_id, crafted.blueprint)
		end
		if slot_data.global_value and slot_data.global_value ~= "normal" then
			if is_gadget or is_ammo or is_bayonet or has_desc or perks or c_stats then
				updated_texts[4].text = "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##\n" .. updated_texts[4].text
			else
				updated_texts[4].text = "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			end
		end
		if colours then
			updated_texts[4].resource_color = { tweak_data.lootdrop.global_values[slot_data.global_value].color }
			for i, k in ipairs(colours) do
				--log(tostring(k))
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[k])
			end
		elseif not colours then
			--log("NO COLOURS")
			if slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[4].resource_color = {
				tweak_data.lootdrop.global_values[slot_data.global_value].color,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk
			}
			else
			updated_texts[4].resource_color = {
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk,
				tweak_data.screen_colors.risk
			}
			end
		end
		updated_texts[4].below_stats = true
	elseif identifier == self.identifiers.mask_mod then
		if not managers.blackmarket:currently_customizing_mask() then
			return
		end
		local mask_mod_info = managers.blackmarket:info_customize_mask()
		updated_texts[2].text = managers.localization:to_upper_text("bm_menu_mask_customization") .. "\n"
		local resource_color = {}
		local material_text = managers.localization:to_upper_text("bm_menu_materials")
		local pattern_text = managers.localization:to_upper_text("bm_menu_textures")
		local colors_text = managers.localization:to_upper_text("bm_menu_colors")
		if mask_mod_info[1].overwritten then
			updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
			table.insert(resource_color, tweak_data.screen_colors.risk)
		elseif mask_mod_info[1].is_good then
			updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. managers.localization:text(mask_mod_info[1].text)
			if mask_mod_info[1].price and 0 < mask_mod_info[1].price then
				updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[1].price)
			end
			updated_texts[2].text = updated_texts[2].text .. "\n"
		else
			updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
			table.insert(resource_color, tweak_data.screen_colors.important_1)
		end
		if mask_mod_info[2].overwritten then
			updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
			table.insert(resource_color, tweak_data.screen_colors.risk)
		elseif mask_mod_info[2].is_good then
			updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. managers.localization:text(mask_mod_info[2].text)
			if mask_mod_info[2].price and 0 < mask_mod_info[2].price then
				updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[2].price)
			end
			updated_texts[2].text = updated_texts[2].text .. "\n"
		else
			updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
			table.insert(resource_color, tweak_data.screen_colors.important_1)
		end
		if mask_mod_info[3].overwritten then
			updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
			table.insert(resource_color, tweak_data.screen_colors.risk)
		elseif mask_mod_info[3].is_good then
			updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. managers.localization:text(mask_mod_info[3].text)
			if mask_mod_info[3].price and 0 < mask_mod_info[3].price then
				updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[3].price)
			end
			updated_texts[2].text = updated_texts[2].text .. "\n"
		else
			updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
			table.insert(resource_color, tweak_data.screen_colors.important_1)
		end
		updated_texts[2].text = updated_texts[2].text .. "\n"
		local price, can_afford = managers.blackmarket:get_customize_mask_value()
		if slot_data.global_value then
			local mask = managers.blackmarket:get_crafted_category("masks")[slot_data.prev_slot] or {}
			updated_texts[4].text = [[
	

]] .. managers.localization:to_upper_text("menu_bm_highlighted") .. "\n" .. slot_data.name_localized
			local mod_price = managers.money:get_mask_part_price_modified(slot_data.category, slot_data.name, slot_data.global_value, mask.mask_id) or 0
			if mod_price > 0 then
				updated_texts[4].text = updated_texts[4].text .. " " .. managers.experience:cash_string(mod_price)
			else
				updated_texts[4].text = updated_texts[4].text
			end
			if slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked ~= 0 then
				updated_texts[4].text = updated_texts[4].text .. "\n" .. managers.localization:to_upper_text("bm_menu_item_amount", {
					amount = math.abs(slot_data.unlocked)
				})
			end
			updated_texts[4].resource_color = {}
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. [[

##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
			end
			if slot_data.dlc_locked then
				updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
			end
			local customize_mask_blueprint = managers.blackmarket:get_customize_mask_blueprint()
			local index = {
				materials = 1,
				textures = 2,
				colors = 3
			}
			index = index[slot_data.category]
			if index == 1 then
				customize_mask_blueprint.material = {
					global_value = slot_data.global_value,
					id = slot_data.name
				}
			elseif index == 2 then
				customize_mask_blueprint.pattern = {
					global_value = slot_data.global_value,
					id = slot_data.name
				}
			elseif index == 3 then
				customize_mask_blueprint.color = {
					global_value = slot_data.global_value,
					id = slot_data.name
				}
			end
			local part_info = managers.blackmarket:get_info_from_mask_blueprint(customize_mask_blueprint, mask.mask_id)
			part_info = part_info[index]
			if part_info.override then
				updated_texts[4].text = updated_texts[4].text .. [[

##]] .. managers.localization:to_upper_text("menu_bm_overwrite", {
					category = managers.localization:text("bm_menu_" .. part_info.override)
				}) .. "##"
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.risk)
			end
		end
		if price and price > 0 then
			updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("menu_bm_total_cost", {
				cost = (not can_afford and "##" or "") .. managers.experience:cash_string(price) .. (not can_afford and "##" or "")
			})
			if not can_afford then
				table.insert(resource_color, tweak_data.screen_colors.important_1)
			end
		end
		if #resource_color == 1 then
			updated_texts[2].resource_color = resource_color[1]
		else
			updated_texts[2].resource_color = resource_color
		end
		if not managers.blackmarket:can_finish_customize_mask() then
			local list_of_mods = ""
			local missed_mods = {}
			for _, data in ipairs(mask_mod_info) do
				if not data.is_good and not data.overwritten then
					table.insert(missed_mods, managers.localization:text(data.text))
				end
			end
			if #missed_mods > 1 then
				for i = 1, #missed_mods do
					list_of_mods = list_of_mods .. missed_mods[i]
					if i < #missed_mods - 1 then
						list_of_mods = list_of_mods .. ", "
					elseif i == #missed_mods - 1 then
						list_of_mods = list_of_mods .. ", "
					end
				end
			elseif #missed_mods == 1 then
				list_of_mods = missed_mods[1]
			end
			if slot_data.dlc_locked then
				updated_texts[3].text = updated_texts[3].text .. "\n" .. managers.localization:to_upper_text("bm_menu_missing_to_finalize_mask", {missed_mods = list_of_mods}) .. "\n"
			else
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_missing_to_finalize_mask", {missed_mods = list_of_mods}) .. "\n"
			end
		elseif price and price > managers.money:total() then
			if slot_data.dlc_locked then
				updated_texts[3].text = updated_texts[3].text .. "\n" .. managers.localization:to_upper_text("bm_menu_not_enough_cash") .. "\n"
			else
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_not_enough_cash") .. "\n"
			end
		end
	elseif identifier == self.identifiers.deployable then
		updated_texts[1].text = slot_data.name_localized
		if not self._slot_data.unlocked then
			updated_texts[3].text = managers.localization:to_upper_text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
				level = slot_data.level,
				SKILL = slot_data.name
			})
			updated_texts[3].text = updated_texts[3].text .. "\n"
		end
		updated_texts[4].text = managers.localization:text(tweak_data.blackmarket.deployables[slot_data.name].desc_id, {
			BTN_INTERACT = managers.localization:btn_macro("interact", true),
			BTN_USE_ITEM = managers.localization:btn_macro("use_item", true)
		})
	elseif identifier == self.identifiers.character then
		updated_texts[1].text = slot_data.name_localized
		if not slot_data.unlocked then
			local dlc_text_id = slot_data.dlc_locked or "ERR"
			local text = managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
			updated_texts[3].text = text
		end
		updated_texts[4].text = managers.localization:text(slot_data.name .. "_desc")
	elseif identifier == self.identifiers.weapon_cosmetic then
		updated_texts[1].text = managers.localization:to_upper_text("bm_menu_steam_item_name", {
			type = managers.localization:text("bm_menu_" .. slot_data.category),
			name = slot_data.name_localized
		})
		updated_texts[1].resource_color = tweak_data.screen_colors.text
		if slot_data.weapon_id then
			updated_texts[2].text = managers.weapon_factory:get_weapon_name_by_weapon_id(slot_data.weapon_id)
		end
		updated_texts[4].resource_color = {}
		if slot_data.cosmetic_quality and slot_data.cosmetic_rarity then
			updated_texts[4].text = managers.localization:to_upper_text("bm_menu_steam_item_quality_rarity", {
				rarity = managers.localization:text(tweak_data.economy.rarities[slot_data.cosmetic_rarity].name_id),
				quality = managers.localization:text(tweak_data.economy.qualities[slot_data.cosmetic_quality].name_id)
			})
			table.insert(updated_texts[4].resource_color, tweak_data.economy.qualities[slot_data.cosmetic_quality].color or tweak_data.screen_colors.text)
			table.insert(updated_texts[4].resource_color, tweak_data.economy.rarities[slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text)
		elseif slot_data.cosmetic_quality then
			updated_texts[4].text = managers.localization:to_upper_text("bm_menu_steam_item_quality", {
				quality = managers.localization:text(tweak_data.economy.qualities[slot_data.cosmetic_quality].name_id)
			})
			table.insert(updated_texts[4].resource_color, tweak_data.economy.qualities[slot_data.cosmetic_quality].color or tweak_data.screen_colors.text)
		elseif slot_data.cosmetic_rarity then
			updated_texts[4].text = updated_texts[4].text .. (slot_data.cosmetic_quality and "\n" or "") .. managers.localization:to_upper_text("bm_menu_steam_item_rarity", {
				rarity = managers.localization:text(tweak_data.economy.rarities[slot_data.cosmetic_rarity].name_id)
			})
			table.insert(updated_texts[4].resource_color, tweak_data.economy.rarities[slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text)
		end
		if slot_data.cosmetic_bonus then
			local bonus = tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id] and tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id].bonus
			if bonus then
				local bonus_tweak = tweak_data.economy.bonuses[bonus]
				local bonus_value = (not bonus_tweak.exp_multiplier or not (bonus_tweak.exp_multiplier * 100 - 100 .. "%")) and bonus_tweak.money_multiplier and bonus_tweak.money_multiplier * 100 - 100 .. "%"
				updated_texts[4].text = updated_texts[4].text .. ((slot_data.cosmetic_quality or slot_data.cosmetic_rarity) and "\n" or "") .. managers.localization:text("dialog_new_tradable_item_bonus", {
					bonus = managers.localization:text(bonus_tweak.name_id, {team_bonus = bonus_value})
				})
			end
		end
		if slot_data.desc_id then
			updated_texts[4].text = updated_texts[4].text .. "\n" .. managers.localization:text(slot_data.desc_id)
		end
		updated_texts[4].below_stats = true
	elseif identifier == self.identifiers.inventory_tradable then
		if slot_data.name ~= "empty" then
			updated_texts[1].text = managers.localization:to_upper_text("bm_menu_steam_item_name", {
				type = managers.localization:text("bm_menu_" .. slot_data.category),
				name = slot_data.name_localized
			})
			updated_texts[1].resource_color = tweak_data.screen_colors.text
			if slot_data.cosmetic_id then
				updated_texts[1].text = ""
				local name_string = ""
				if slot_data.weapon_id then
					name_string = utf8.to_upper(managers.weapon_factory:get_weapon_name_by_weapon_id(slot_data.weapon_id)) .. " | "
				end
				name_string = name_string .. slot_data.name_localized
				local stat_bonus, team_bonus
				if slot_data.cosmetic_quality then
					name_string = name_string .. ", " .. managers.localization:text(tweak_data.economy.qualities[slot_data.cosmetic_quality].name_id)
				end
				if slot_data.cosmetic_bonus then
					local bonus = tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id] and tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id].bonus
					if bonus then
						name_string = name_string .. ", " .. managers.localization:text("menu_bm_inventory_bonus")
					end
				end
				updated_texts[2].text = "##" .. name_string .. "##"
				if slot_data.cosmetic_rarity then
					updated_texts[2].resource_color = tweak_data.economy.rarities[slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text
				end
				updated_texts[4].text, updated_texts[4].resource_color = InventoryDescription.create_description_item({
					instance_id = 0,
					entry = slot_data.name,
					category = "weapon_skins",
					quality = slot_data.cosmetic_quality,
					bonus = slot_data.cosmetic_bonus
				}, tweak_data.blackmarket.weapon_skins[slot_data.name], {
					default = tweak_data.screen_colors.text,
					mods = tweak_data.screen_colors.text
				}, true)
				updated_texts[4].below_stats = true
			elseif slot_data.safe_entry then
				local content_text, color_ranges = InventoryDescription.create_description_safe(slot_data.safe_entry, {}, true)
				updated_texts[2].text = content_text
				updated_texts[2].resource_color = color_ranges
			elseif slot_data.desc_id then
				updated_texts[2].text = managers.localization:text(slot_data.desc_id)
			end
		end
	elseif Application:production_build() then
		updated_texts[1].text = identifier:s()
	end
	if self._desc_mini_icons then
		for _, gui_object in pairs(self._desc_mini_icons) do
			self._panel:remove(gui_object[1])
		end
	end
	self._desc_mini_icons = {}
	local desc_mini_icons = self._slot_data.desc_mini_icons
	local info_box_panel = self._panel:child("info_box_panel")
	if desc_mini_icons and 0 < table.size(desc_mini_icons) then
		for _, mini_icon in pairs(desc_mini_icons) do
			local new_icon = self._panel:bitmap({
				texture = mini_icon.texture,
				x = info_box_panel:left() + 10 + mini_icon.right,
				w = mini_icon.w or 32,
				h = mini_icon.h or 32
			})
			table.insert(self._desc_mini_icons, {new_icon, 2})
		end
		updated_texts[2].text = string.rep("     ", table.size(desc_mini_icons)) .. updated_texts[2].text
	else
	end
	if not ignore_lock and slot_data.lock_texture and slot_data.lock_texture ~= true then
		local new_icon = self._panel:bitmap({
			texture = slot_data.lock_texture,
			x = info_box_panel:left() + 10,
			w = 20,
			h = 20,
			color = self._info_texts[3]:color(),
			blend_mode = "add"
		})
		updated_texts[3].text = "     " .. updated_texts[3].text
		table.insert(self._desc_mini_icons, {new_icon, 3})
	else
	end
	if is_renaming_this and self._rename_info_text then
		local text = self._renaming_item.custom_name ~= "" and self._renaming_item.custom_name or "##" .. tostring(slot_data.raw_name_localized) .. "##"
		updated_texts[self._rename_info_text].text = text
		updated_texts[self._rename_info_text].resource_color = tweak_data.screen_colors.text:with_alpha(0.35)
	end
	for id, _ in ipairs(self._info_texts) do
		self:set_info_text(id, updated_texts[id].text, updated_texts[id].resource_color)
	end
	local _, _, _, th = self._info_texts[1]:text_rect()
	self._info_texts[1]:set_h(th)
	local y = self._info_texts[1]:bottom()
	local title_offset = y
	local bg = self._info_texts_bg[1]
	if alive(bg) then
		bg:set_shape(self._info_texts[1]:shape())
	end
	local below_y
	for i = 2, #self._info_texts do
		local info_text = self._info_texts[i]
		info_text:set_font_size(small_font_size)
		_, _, _, th = info_text:text_rect()
		info_text:set_y(y)
		info_text:set_h(th)
		if updated_texts[i].below_stats then
			if slot_data.comparision_data and alive(self._stats_text_modslist) then
				info_text:set_world_y(below_y or self._stats_text_modslist:world_top())
				below_y = (below_y or info_text:world_y()) + th
			else
				info_text:set_top((below_y or info_text:top()) + 20)
				below_y = (below_y or info_text:top()) + th
			end
		end
		local scale = 1
		if info_text:bottom() > self._info_texts_panel:h() then
			scale = self._info_texts_panel:h() / info_text:bottom() / 1.125
		end
		info_text:set_font_size(small_font_size * scale)
		_, _, _, th = info_text:text_rect()
		info_text:set_h(th)
		local bg = self._info_texts_bg[i]
		if alive(bg) then
			bg:set_shape(info_text:shape())
		end
		y = info_text:bottom()
	end
	for _, desc_mini_icon in ipairs(self._desc_mini_icons) do
		desc_mini_icon[1]:set_y(title_offset)
		desc_mini_icon[1]:set_world_top(self._info_texts[desc_mini_icon[2]]:world_top() + 1)
	end
	if is_renaming_this and self._rename_info_text and self._rename_caret then
		local info_text = self._info_texts[self._rename_info_text]
		local x, y, w, h = info_text:text_rect()
		if self._renaming_item.custom_name == "" then
			w = 0
		end
		self._rename_caret:set_w(2)
		self._rename_caret:set_h(h)
		self._rename_caret:set_world_position(x + w, y)
	end
	if GoonBase and GoonBase.SupportedVersion then
		Hooks:Call("BlackMarketGUIUpdateInfoText", self)
	end
end

function BlackMarketGui:choose_weapon_buy_callback(data)
	local blackmarket_items = managers.blackmarket:get_weapon_category(data.category) or {}
	local new_node_data = {}
	local weapon_tweak = tweak_data.weapon
	local x_id, y_id, x_level, y_level, x_unlocked, y_unlocked, x_skill, y_skill, x_gv, y_gv, x_sn, y_sn
	local item_categories = {}
	for _, item in ipairs(blackmarket_items) do
		local weapon_data = tweak_data.weapon[item.weapon_id]
		local category = weapon_data.recategorize or tweak_data.gui.buy_weapon_category_groups[weapon_data.category] or weapon_data.category
		item_categories[category] = item_categories[category] or {}
		table.insert(item_categories[category], item)
	end
	local sorted_categories = {}
	for category, items in pairs(item_categories) do
		table.insert(sorted_categories, category)
		table.sort(items, function(x, y)
			x_unlocked = x.unlocked
			y_unlocked = y.unlocked
			if x_unlocked ~= y_unlocked then
				return x_unlocked
			end
			x_id = x.weapon_id
			y_id = y.weapon_id
			x_gv = weapon_tweak[x_id].global_value
			y_gv = weapon_tweak[y_id].global_value
			x_sn = x_gv and tweak_data.lootdrop.global_values[x_gv].sort_number or 0
			y_sn = y_gv and tweak_data.lootdrop.global_values[y_gv].sort_number or 0
			if x_sn ~= y_sn then
				return x_sn < y_sn
			end
			x_skill = x.skill_based
			y_skill = y.skill_based
			if x_skill ~= y_skill then
				return y_skill
			end
			x_level = x.level or 0
			y_level = y.level or 0
			if x_level ~= y_level then
				return x_level < y_level
			end
			return x_id < y_id
		end
)
	end
	table.sort(sorted_categories, function(x, y)
		return #item_categories[x] > #item_categories[y]
	end
)
	local item_data
	for _, category in ipairs(sorted_categories) do
		local items = item_categories[category]
		item_data = {}
		for _, item in ipairs(items) do
			table.insert(item_data, item)
		end
		local name_id = managers.localization:to_upper_text("menu_" .. category)
		table.insert(new_node_data, {
			name = category,
			category = data.category,
			prev_node_data = data,
			name_localized = name_id,
			on_create_func_name = "populate_buy_weapon",
			on_create_data = item_data,
			identifier = self.identifiers.weapon
		})
	end
	new_node_data.buying_weapon = true
	new_node_data.topic_id = "bm_menu_buy_weapon_title"
	new_node_data.topic_params = {
		weapon_category = managers.localization:text("bm_menu_" .. data.category)
	}
	new_node_data.blur_fade = self._data.blur_fade
	managers.menu:open_node(self._inception_node_name, {new_node_data})
end


if GoonBase and GoonBase.SupportedVersion then
	Hooks:Add("BlackMarketGUIOnPopulateModsActionList", "DMCWO_icon_shit", function(BlackMarketGui, data)
		if data.name then
			data.use_icon = tweak_data.weapon.factory.parts[data.name] and tweak_data.weapon.factory.parts[data.name].alt_icon
			if data.use_icon then
				data.bitmap_texture = data.use_icon
			end
		end
	end)
else
	function BlackMarketGui:populate_mods(data)
		local new_data = {}
		local default_mod = data.on_create_data.default_mod
		local crafted = managers.blackmarket:get_crafted_category(data.prev_node_data.category)[data.prev_node_data.slot]
		local global_values = crafted.global_values or {}
		local ids_id = Idstring(data.name)
		local cosmetic_kit_mod
		local cosmetics_blueprint = crafted.cosmetics and crafted.cosmetics.id and tweak_data.blackmarket.weapon_skins[crafted.cosmetics.id] and tweak_data.blackmarket.weapon_skins[crafted.cosmetics.id].default_blueprint or {}
		for i, c_mod in ipairs(cosmetics_blueprint) do
			if Idstring(tweak_data.weapon.factory.parts[c_mod].type) == ids_id then
				cosmetic_kit_mod = c_mod
			end
		end
		local gvs = {}
		local mod_t = {}
		local num_steps = #data.on_create_data
		local achievement_tracker = tweak_data.achievement.weapon_part_tracker
		local part_is_from_cosmetic
		local guis_catalog = "guis/"
		for index, mod_t in ipairs(data.on_create_data) do
			local mod_name = mod_t[1]
			local mod_default = mod_t[2]
			local mod_global_value = mod_t[3] or "normal"
			part_is_from_cosmetic = cosmetic_kit_mod == mod_name
			guis_catalog = "guis/"
			local bundle_folder = tweak_data.blackmarket.weapon_mods[mod_name] and tweak_data.blackmarket.weapon_mods[mod_name].texture_bundle_folder
			if bundle_folder then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
			end
			new_data = {}
			new_data.type = tweak_data.weapon.factory.parts[mod_name] and tweak_data.weapon.factory.parts[mod_name].type
			new_data.name = mod_name or data.prev_node_data.name
			new_data.name_localized = (mod_name and managers.weapon_factory:get_part_name_by_part_id(mod_name)) or managers.localization:text( "bm_menu_no_mod" )
			new_data.category = data.category or data.prev_node_data and data.prev_node_data.category
			new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/mods/" .. new_data.name
			new_data.use_icon = tweak_data.weapon.factory.parts[mod_name] and tweak_data.weapon.factory.parts[mod_name].alt_icon
			if new_data.use_icon then
				new_data.bitmap_texture = new_data.use_icon 
			end
			new_data.slot = data.slot or data.prev_node_data and data.prev_node_data.slot
			new_data.global_value = mod_global_value
			new_data.unlocked = not crafted.customize_locked and part_is_from_cosmetic and 1 or mod_default or managers.blackmarket:get_item_amount(new_data.global_value, "weapon_mods", new_data.name, true)
			new_data.equipped = false
			new_data.stream = true
			new_data.default_mod = default_mod
			new_data.is_internal = tweak_data.weapon.factory:is_part_internal(new_data.name)
			new_data.free_of_charge = tweak_data.blackmarket.weapon_mods[mod_name] and tweak_data.blackmarket.weapon_mods[mod_name].is_a_unlockable
			new_data.unlock_tracker = achievement_tracker[new_data.name] or false
			if crafted.customize_locked then
				new_data.unlocked = type(new_data.unlocked) == "number" and -math.abs(new_data.unlocked) or new_data.unlocked
				new_data.unlocked = new_data.unlocked ~= 0 and new_data.unlocked or false
				new_data.lock_texture = "guis/textures/pd2/lock_incompatible"
				new_data.dlc_locked = "bm_menu_cosmetic_locked_weapon"
			elseif not part_is_from_cosmetic and tweak_data.lootdrop.global_values[mod_global_value] and tweak_data.lootdrop.global_values[mod_global_value].dlc and not managers.dlc:is_dlc_unlocked(mod_global_value) then
				new_data.unlocked = -math.abs(new_data.unlocked)
				new_data.unlocked = new_data.unlocked ~= 0 and new_data.unlocked or false
				new_data.lock_texture = self:get_lock_icon(new_data)
				new_data.dlc_locked = tweak_data.lootdrop.global_values[new_data.global_value].unlock_id or "bm_menu_dlc_locked"
			end
			local weapon_id = managers.blackmarket:get_crafted_category(new_data.category)[new_data.slot].weapon_id
			new_data.price = managers.money:get_weapon_modify_price(weapon_id, new_data.name, new_data.global_value)
			new_data.can_afford = part_is_from_cosmetic or managers.money:can_afford_weapon_modification(weapon_id, new_data.name, new_data.global_value)
			local font, font_size
			local no_upper = false
			if not new_data.lock_texture and (not new_data.unlocked or new_data.unlocked == 0) then
				local selected_text, noselected_text
				if not new_data.dlc_locked and new_data.unlock_tracker then
					local text_id = "bm_menu_no_items"
					local progress = ""
					local stat = new_data.unlock_tracker.stat or false
					local max_progress = new_data.unlock_tracker.max_progress or 0
					local award = new_data.unlock_tracker.award or false
					if new_data.unlock_tracker.text_id then
						if max_progress > 0 and stat then
							local progress_left = max_progress - (managers.achievment:get_stat(stat) or 0)
							if progress_left > 0 then
								progress = tostring(progress_left)
								text_id = new_data.unlock_tracker.text_id
								font = small_font
								font_size = small_font_size
								no_upper = true
							end
						elseif award then
							local achievement = managers.achievment:get_info(award)
							text_id = new_data.unlock_tracker.text_id
							font = small_font
							font_size = small_font_size
							no_upper = true
						end
						selected_text = managers.localization:text(text_id, {progress = progress})
					end
				end
				selected_text = selected_text or managers.localization:text("bm_menu_no_items")
				noselected_text = selected_text
				new_data.mid_text = {}
				new_data.mid_text.selected_text = selected_text
				new_data.mid_text.selected_color = tweak_data.screen_colors.text
				new_data.mid_text.noselected_text = noselected_text
				new_data.mid_text.noselected_color = tweak_data.screen_colors.text
				new_data.mid_text.vertical = "center"
				new_data.mid_text.font = font
				new_data.mid_text.font_size = font_size
				new_data.mid_text.no_upper = no_upper
				new_data.lock_texture = true
			end
			if mod_name then
				local forbid = managers.blackmarket:can_modify_weapon(new_data.category, new_data.slot, new_data.name)
				if forbid then
					if type(new_data.unlocked) == "number" then
						new_data.unlocked = -math.abs(new_data.unlocked)
					else
						new_data.unlocked = false
					end
					new_data.lock_texture = self:get_lock_icon(new_data, "guis/textures/pd2/lock_incompatible")
					new_data.mid_text = nil
					new_data.conflict = managers.localization:text("bm_menu_" .. tostring(tweak_data.weapon.factory.parts[forbid] and tweak_data.weapon.factory.parts[forbid].type or forbid))
				end
				local weapon = managers.blackmarket:get_crafted_category_slot(data.prev_node_data.category, data.prev_node_data.slot) or {}
				local gadget
				local mod_type = tweak_data.weapon.factory.parts[new_data.name].type
				local sub_type = tweak_data.weapon.factory.parts[new_data.name].sub_type
				local is_auto = weapon and tweak_data.weapon[weapon.weapon_id] and tweak_data.weapon[weapon.weapon_id].FIRE_MODE == "auto"
				if mod_type == "gadget" then
					gadget = sub_type
				end
				local silencer = sub_type == "silencer" and true
				local texture = managers.menu_component:get_texture_from_mod_type(mod_type, sub_type, gadget, silencer, is_auto)
				new_data.desc_mini_icons = {}
				if DB:has(Idstring("texture"), texture) then
					table.insert(new_data.desc_mini_icons, {
						texture = texture,
						right = 0,
						bottom = 0,
						w = 16,
						h = 16
					})
				end
				local is_gadget = false
				if not new_data.conflict and new_data.unlocked and not is_gadget and not new_data.dlc_locked then
					new_data.comparision_data = managers.blackmarket:get_weapon_stats_with_mod(new_data.category, new_data.slot, mod_name)
				end
				if managers.blackmarket:got_new_drop(mod_global_value, "weapon_mods", mod_name) then
					new_data.mini_icons = new_data.mini_icons or {}
					table.insert(new_data.mini_icons, {
						name = "new_drop",
						texture = "guis/textures/pd2/blackmarket/inv_newdrop",
						right = 0,
						top = 0,
						layer = 1,
						w = 16,
						h = 16,
						stream = false
					})
					new_data.new_drop_data = {
						new_data.global_value or "normal",
						"weapon_mods",
						mod_name
					}
				end
			end
			if mod_name and new_data.unlocked then
				if type(new_data.unlocked) ~= "number" or new_data.unlocked > 0 then
					if new_data.can_afford then
						table.insert(new_data, "wm_buy")
					end
					table.insert(new_data, "wm_preview")
					if not new_data.is_internal then
						table.insert(new_data, "wm_preview_mod")
					end
				else
					table.insert(new_data, "wm_preview")
				end
			end
			data[index] = new_data
		end
		for i = 1, math.max(math.ceil(num_steps / 3), 3) * 3 do
			if not data[i] then
				new_data = {}
				new_data.name = "empty"
				new_data.name_localized = ""
				new_data.category = data.category
				new_data.slot = i
				new_data.unlocked = true
				new_data.equipped = false
				data[i] = new_data
			end
		end
		local weapon_blueprint = managers.blackmarket:get_weapon_blueprint(data.prev_node_data.category, data.prev_node_data.slot) or {}
		local equipped
		for i, mod in ipairs(data) do
			for _, weapon_mod in ipairs(weapon_blueprint) do
				if mod.name == weapon_mod and (not global_values[weapon_mod] or global_values[weapon_mod] == data[i].global_value) then
					equipped = i
				else
				end
			end
		end
		if equipped then
			data[equipped].equipped = true
			data[equipped].unlocked = data[equipped].unlocked or true
			data[equipped].mid_text = nil
			data[equipped].lock_texture = nil
			for i = 1, #data[equipped] do
				table.remove(data[equipped], 1)
			end
			data[equipped].price = 0
			data[equipped].can_afford = true
			table.insert(data[equipped], "wm_remove_buy")
			if not data[equipped].is_internal then
				table.insert(data[equipped], "wm_remove_preview_mod")
				table.insert(data[equipped], "wm_remove_preview")
			else
				table.insert(data[equipped], "wm_preview")
			end
			local factory = tweak_data.weapon.factory.parts[data[equipped].name]
			if data.name == "sight" and factory and factory.texture_switch then
				table.insert(data[equipped], "wm_reticle_switch_menu")
				local reticle_texture = managers.blackmarket:get_part_texture_switch(data[equipped].category, data[equipped].slot, data[equipped].name)
				if reticle_texture and reticle_texture ~= "" then
					data[equipped].mini_icons = data[equipped].mini_icons or {}
					table.insert(data[equipped].mini_icons, {
						texture = reticle_texture,
						right = 1,
						bottom = 1,
						layer = 2,
						w = 30,
						h = 30,
						stream = true,
						blend_mode = "add"
					})
					table.insert(data[equipped].mini_icons, {
						color = Color.black,
						right = -5,
						bottom = -5,
						layer = 0,
						alpha = 0.4,
						w = 42,
						h = 42,
						borders = true
					})
				end
			end
			if not data[equipped].conflict then
				if false then
					if data[equipped].default_mod then
						data[equipped].comparision_data = managers.blackmarket:get_weapon_stats_with_mod(data[equipped].category, data[equipped].slot, data[equipped].default_mod)
					else
						data[equipped].comparision_data = managers.blackmarket:get_weapon_stats_without_mod(data[equipped].category, data[equipped].slot, data[equipped].name)
					end
				end
			end
		end
	end
	
end