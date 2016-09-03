--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

--Thanks to Rokk
if not SC then
	Hooks:PostHook(CopBrain, "convert_to_criminal", "DMCCopBrainDoConvert", function(self)
		self._unit:unit_data().is_convert = true
		--Ugly hack to be able to call converts
		--Kill me now
		if not DMC._converts then
			DMC._converts = {}
		end   
		table.insert(DMC._converts, self._unit)
	end)
end
