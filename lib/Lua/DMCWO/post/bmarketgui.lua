--[[
v1.34
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

tweak_data.upgrades.weapon_movement_penalty.lmg = 1 --0.8

tweak_data.weapon.m134.weapon_movement_penalty = 0.4

tweak_data.weapon.m95.weapon_movement_penalty = 0.7
tweak_data.weapon.mg42.weapon_movement_penalty = 0.7

tweak_data.weapon.hk21.weapon_movement_penalty = 0.75

tweak_data.weapon.m249.weapon_movement_penalty = 0.8
tweak_data.weapon.r93.weapon_movement_penalty = 0.8
tweak_data.weapon.rpg7.weapon_movement_penalty = 0.8

tweak_data.weapon.rpk.weapon_movement_penalty = 0.85
tweak_data.weapon.galil.weapon_movement_penalty = 0.85

tweak_data.weapon.fal.weapon_movement_penalty = 0.9
tweak_data.weapon.striker.weapon_movement_penalty = 0.9
tweak_data.weapon.g3.weapon_movement_penalty = 0.9
tweak_data.weapon.spas12.weapon_movement_penalty = 0.9
tweak_data.weapon.mosin.weapon_movement_penalty = 0.9
tweak_data.weapon.m1928.weapon_movement_penalty = 0.9
tweak_data.weapon.l85a2.weapon_movement_penalty = 0.9
tweak_data.weapon.akm_gold.weapon_movement_penalty = 0.9
tweak_data.weapon.aa12.weapon_movement_penalty = 0.9
tweak_data.weapon.m32.weapon_movement_penalty = 0.9

tweak_data.weapon.msr.weapon_movement_penalty = 0.95
tweak_data.weapon.new_m14.weapon_movement_penalty = 0.95

local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size
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
				local dlc_based = tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not tweak_data.dlc[slot_data.global_value].free and not managers.dlc:has_dlc(slot_data.global_value)
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
			elseif self._slot_data.can_afford == false then
			end
			if slot_data.last_weapon then
				updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_last_weapon_warning") .. "\n"
			end
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##" .. [[

]]
				updated_texts[4].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
				updated_texts[4].below_stats = true
			end
			if slot_data.not_moddable then
				do
					local weapon_id = slot_data.name
					local weapon_tweak = weapon_id and tweak_data.weapon[weapon_id]
					local movement_penalty = weapon_tweak.weapon_movement_penalty or 1
					if movement_penalty < 1 then
						local penalty_as_string = string.format("%d%%", math.round((1 - movement_penalty) * 100))
						updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string
					end
					--if weapon_tweak.has_description then
						updated_texts[4].text = updated_texts[4].text .. [[
]] .. managers.localization:text(tweak_data.weapon[slot_data.name].desc_id)
						updated_texts[4].below_stats = true
					--end
				end
			else
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
			local dlc_based = not slot_data.dlc_based and tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not tweak_data.dlc[slot_data.global_value].free and not managers.dlc:has_dlc(slot_data.global_value)
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
			local dlc_based = not slot_data.dlc_based and tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not tweak_data.dlc[slot_data.global_value].free and not managers.dlc:has_dlc(slot_data.global_value)
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
		local has_desc = part_id and tweak_data.weapon.factory.parts[part_id].has_description == true
		if is_gadget or is_ammo or is_bayonet or has_desc or perks then
			local crafted = managers.blackmarket:get_crafted_category_slot(prev_data.category, prev_data.slot)
			updated_texts[4].text = managers.weapon_factory:get_part_desc_by_part_id_from_weapon(part_id, crafted.factory_id, crafted.blueprint)
		end
		if slot_data.global_value and slot_data.global_value ~= "normal" then
			if is_gadget or is_ammo or is_bayonet or has_desc or perks then
				updated_texts[4].text = updated_texts[4].text .. [[

##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			else
				updated_texts[4].text = "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			end
			updated_texts[4].resource_color = {
				tweak_data.lootdrop.global_values[slot_data.global_value].color
			}
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
		if info_text:bottom() > self._info_texts_panel:h() and not updated_texts[i].less_scale then
			scale = self._info_texts_panel:h() / info_text:bottom() * .9
		elseif info_text:bottom() > self._info_texts_panel:h() and updated_texts[i].less_scale then
			scale = self._info_texts_panel:h() / info_text:bottom() * .95
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
end


function BlackMarketGui:choose_weapon_buy_callback(data)
	local blackmarket_items = managers.blackmarket:get_weapon_category(data.category) or {}
	local new_node_data = {}
	local weapon_tweak = tweak_data.weapon
	local x_id, y_id, x_level, y_level, x_unlocked, y_unlocked, x_skill, y_skill, x_gv, y_gv, x_sn, y_sn
	local item_categories = {}
	for _, item in ipairs(blackmarket_items) do
		local weapon_data = tweak_data.weapon[item.weapon_id]
		local category = tweak_data.gui.buy_weapon_category_groups[weapon_data.category] or weapon_data.sub_category or weapon_data.category
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