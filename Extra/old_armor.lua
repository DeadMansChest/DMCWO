if not old_dodge then

if not tweak_data then return end

--Brings back the original dodge values for ARMOR, however, the new suit dodge value (10) was kept
tweak_data.upgrades.values.player.body_armor.dodge = {
		0.10, --original was 0.09 (9)
		0.05,
		0.03,
		-0.03,
		-0.1,
		-0.3,
		-0.5
	}
	
old_dodge = true

end