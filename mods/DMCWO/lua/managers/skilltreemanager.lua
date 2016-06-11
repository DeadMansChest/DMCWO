--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]
SkillTreeManager.VERSION = 69

function SkillTreeManager:unlock(skill_id)
	if self._global.skills[skill_id].unlocked >= self._global.skills[skill_id].total then
		Application:error("No more steps to unlock in skill", skill_id)
		return false
	end
	local talent = tweak_data.skilltree.skills[skill_id]
	
	local prerequisites = talent.prerequisites or {}
	for _, prerequisite in ipairs(prerequisites) do
		local unlocked = managers.skilltree:skill_step(prerequisite)
		if unlocked and unlocked == 0 then
			return
		end
	end
	
	local to_unlock = self:next_skill_step(skill_id)
	local skill = talent[to_unlock]
	self._global.skills[skill_id].unlocked = to_unlock
	local skill = tweak_data.skilltree.skills[skill_id][to_unlock]
	self:_aquire_skill(skill, skill_id, false)
	if SystemInfo:distribution() == Idstring("STEAM") then
		managers.statistics:publish_skills_to_steam()
	end
	return true
end