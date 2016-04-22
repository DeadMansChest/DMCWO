--[[
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

local old_player_init = PlayerTweakData._init_new_stances
function PlayerTweakData:_init_new_stances()
	old_player_init(self)
	
	
	self.TRANSITION_DURATION = 0.2
	
	--[[ Viewmodel "Drag" ]]
	--{
	
	local gun_drag = {'default','saw','new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','r870','huntsman','benelli','ksg','serbu','striker','new_m14','scar','fal','hk21','rpk','m249','msr','r93','m95','judge','famas','galil','g3','gre_m79','tec9','scorpion','uzi','x_deagle','x_1911','x_b92fs','jowi','g26','spas12','mg42','mosin','c96','sterling','m1928','l85a2','vhs','hs2000','cobray','rpg7','b682','x_usp','x_g17','x_g22c','aa12','flamethrower_mk2','m32','plainsrider','peacemaker','winchester1874','m134','mateba','sub2000','asval','polymer','wa2000','hunter','baka','frankish','arblast','long','par','sparrow','model70','m37','china','sr2','x_sr2','pl14','x_mp5','x_akmsu'}
	for i, wep_id in ipairs(gun_drag) do
		self.stances[ wep_id ].steelsight.shakers.breathing.amplitude = 0.000--75
	
		self.stances[ wep_id ].standard.vel_overshot.pivot = Vector3(10, -8, -25)
		self.stances[ wep_id ].crouched.vel_overshot.pivot = Vector3(10, -4, -12.5) 
		self.stances[ wep_id ].steelsight.vel_overshot.pivot = Vector3(10, -10, -2) 
		
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.125
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -1
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 1
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 1 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -1
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -0.5
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 0.5
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 0.5 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -0.5
		
		self.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = 0
		self.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0
		self.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0
		self.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = 0
	end
	
	local babby_pistol = {'usp','g22c','glock_17','glock_18c','ppk','judge','jowi','g26','c96','hs2000','x_usp','x_g17','x_g22c','peacemaker','plainsrider','hunter','long','sparrow'}
	for i, wep_id in ipairs(babby_pistol) do
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.125
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -2
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 2 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -2
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -1.5
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 1.5
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 1.5 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -1.5
	end 
	
	local med_pistol = {'colt_1911','p226','b92fs','x_1911','x_b92fs','mateba','baka','pl14'}
	for i, wep_id in ipairs(med_pistol) do
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.175
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -2.5
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 2.5
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 2.5 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -2.5
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 2 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -2
	end 
	
	local beeg_pistol = {'new_raging_bull','deagle','x_deagle','sub2000'}
	for i, wep_id in ipairs(beeg_pistol) do
		
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.2
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -3
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 3
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 3 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -3
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -2.5
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 2.5
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 2.5 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -2.5
	end 
	
	local lightweight = {'mp7','mp9','amcar','new_mp5','p90','olympic','tec9','scorpion','cobray','asval','frankish','m37','sr2','x_sr2','x_mp5'}
	for i, wep_id in ipairs(lightweight) do
			
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.15
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -3.5
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 3.5
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 3.5 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -3.5	
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -3
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 3
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 3 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -3
	end 
	
	local med_weight = {'mac10','akmsu','new_m4','ak74','g36','gre_m79','ksg','sterling','polymer','model70','x_akmsu'}
	for i, wep_id in ipairs(med_weight) do	
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.2
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -4
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 4
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 4 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -4
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -3.5
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 3.5
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 3.5 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -3.5
	end 
	
	local med_weight_2 = {'serbu','s552','m16','m45','saiga','akm','scar','aug','huntsman','uzi','vhs','b682','flamethrower_mk2','arblast'}
	for i, wep_id in ipairs(med_weight_2) do
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.25
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -4.5
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 4.5
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 4.5 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -4.5
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -4
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 4
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 4 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -4
	end 
	
	local heavy = {'r870','benelli','ak5','fal','galil','famas','spas12','mosin','m1928','l85a2','aa12','m32','winchester1874','china'}
	for i, wep_id in ipairs(heavy) do
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.3
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -5
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 5
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 5 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -5
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -4.5
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 4.5
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 4.5 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -4.5
		
		self.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = 0
		self.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0
		self.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0
		self.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = 0
	end 
	
	local heavy_2 = {'striker','new_m14','g3','rpk','msr','r93','wa2000'}
	for i, wep_id in ipairs(heavy_2) do	
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.4
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -5.5
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 5.5
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 5.5 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -5.5
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -5
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 5
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 5 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -5
	end 
	
	local super_heavy = {'akm_gold','m95','hk21','m249','mg42','rpg7','par'}
	for i, wep_id in ipairs(super_heavy) do
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -6
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 6
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 6 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -6
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -5.5
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 5.5
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 5.5 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -5.5
	end 
	
	local the_fuck_even = {'m134'}
		for i, wep_id in ipairs(the_fuck_even) do
		self.stances[ wep_id ].standard.shakers.breathing.amplitude = 0.5
		self.stances[ wep_id ].standard.vel_overshot.yaw_neg = -7
		self.stances[ wep_id ].standard.vel_overshot.yaw_pos = 7
		self.stances[ wep_id ].standard.vel_overshot.pitch_neg = 7 / 2
		self.stances[ wep_id ].standard.vel_overshot.pitch_pos = -7
		
		self.stances[ wep_id ].crouched.shakers.breathing.amplitude = self.stances[ wep_id ].standard.shakers.breathing.amplitude / 2
		self.stances[ wep_id ].crouched.vel_overshot.yaw_neg = -6.5
		self.stances[ wep_id ].crouched.vel_overshot.yaw_pos = 6.5
		self.stances[ wep_id ].crouched.vel_overshot.pitch_neg = 6.5 / 2
		self.stances[ wep_id ].crouched.vel_overshot.pitch_pos = -6.5
	end 
	
	--}
	
	--[[ Viewmodel Positioning ]]
	--{
	
	if DMCWO.reposed_vms == true then
		pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
		pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
		local ar_type_hold = {'amcar','m16','new_m4','olympic','new_mp5','ak5'}
		for i, wep_id in ipairs(ar_type_hold) do
			pivot_head_translation = Vector3(8,17,-6)
			pivot_head_rotation = Rotation(0,0,-1)
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
			pivot_head_translation = Vector3(6,15,-4)
			pivot_head_rotation = Rotation(0,0,-2)
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()	
		end
				
		pivot_shoulder_translation = Vector3(10.7353, 23.0139, -1.43553)
		pivot_shoulder_rotation = Rotation(0.106665, -0.0845104, 0.629231)
		local ak_type_hold = {'akm','ak74','akmsu','akm_gold'}
		for i, wep_id in ipairs(ak_type_hold) do
			pivot_head_translation = Vector3(8, 22, -3)
			pivot_head_rotation = Rotation(0.3, 0.5, -1)
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
			pivot_head_translation = Vector3(6, 20, -1)
			pivot_head_rotation = Rotation(0.3, 0.5, -2)
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		end
		pivot_shoulder_translation = Vector3(10.7353, 23.0139, -1.43553)
		pivot_shoulder_rotation = Rotation(0.106665, -0.0845104, 0.629231)
		pivot_head_translation = Vector3(9, 27, -1)
		pivot_head_rotation = Rotation(0.3, 0.5, -1)
		self.stances.asval.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.asval.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 25, 1)
		pivot_head_rotation = Rotation(0.3, 0.5, -2)
		self.stances.asval.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.asval.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_shoulder_translation = Vector3(11.391, 45.0507, -3.38766)
		pivot_shoulder_rotation = Rotation(-0.326422, 0.247368, -0.0156885)
		local akimbo_type_wep = {'jowi','x_deagle','x_1911','x_b92fs','x_usp','x_g17','x_g22c'}
		for i, wep_id in ipairs(akimbo_type_wep) do
			pivot_head_translation = Vector3(10.95, 38, -3)
			pivot_head_rotation = Rotation(-0.25, 0.5, 0)
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
			pivot_head_translation = Vector3(10.95, 32, -2)
			pivot_head_rotation = Rotation(-0.25, 0.5, 0)
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
			pivot_head_translation = Vector3(10.95, 50, 0)
			pivot_head_rotation = Rotation(-0.25, 0.5, 0)
			self.stances[wep_id].steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
			self.stances[wep_id].steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		end
		

		pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
		pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
		local pistol_type_wep = {'glock_17','glock_18c','g22c','g26','b92fs','usp','colt_1911','ppk','p226','c96','hs2000','deagle','sparrow','pl14'}
		for i, wep_id in ipairs(pistol_type_wep) do
			pivot_head_translation = Vector3(8, 30, -8)
			pivot_head_rotation = Rotation(0, 0, -1)
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
			pivot_head_translation = Vector3(6, 28, -6)
			pivot_head_rotation = Rotation(0, 0, -2)
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		end
		
		pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
		pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
		local revolvo = {'judge','new_raging_bull','mateba'}
		for i, wep_id in ipairs(revolvo) do
			pivot_head_translation = Vector3(8, 34, -9)
			pivot_head_rotation = Rotation(0, 0, -1)
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
			pivot_head_translation = Vector3(6, 32, -7)
			pivot_head_rotation = Rotation(0, 0, -2)
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		end
		
		
		pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
		pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
		local smg_type_wep = {'mp7','mp9','uzi','scorpion'}
		for i, wep_id in ipairs(smg_type_wep) do
			pivot_head_translation = Vector3(7, 42, -4)
			pivot_head_rotation = Rotation(0, 0, -1)
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
			pivot_head_translation = Vector3(5, 38, -2)
			pivot_head_rotation = Rotation(0, 0, -2)
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		end
		
		pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
		pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
		local semi_shotgun = {'benelli','spas12'}
		for i, wep_id in ipairs(semi_shotgun) do
			pivot_head_translation = Vector3(9, 31, -7 )
			pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
			self.stances[wep_id].standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
			pivot_head_translation = Vector3(7,29,-5)	
			pivot_head_rotation = Rotation( -0.2, 0.5, -2 )
			self.stances[wep_id].crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		end
		
		pivot_shoulder_translation = Vector3(10.71, 18.7035, -4.30218)
		pivot_shoulder_rotation = Rotation(0.106838, -0.0844692, 0.629273)
		local pump_shotgun = {'serbu','r870'}
		for i, wep_id in ipairs(pump_shotgun) do
			pivot_head_translation = Vector3(9,28,-6)
			pivot_head_rotation = Rotation( 0, 0, -1 )
			self.stances[wep_id].standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
			pivot_head_translation = Vector3(7,26,-4)
			pivot_head_rotation = Rotation(-0,-0,-2)
			self.stances[wep_id].crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		end
		
		--M37
		pivot_shoulder_translation = Vector3(9.27651, 19.3937, -6.03765)
		pivot_shoulder_rotation = Rotation(4.57709E-5, 5.5666E-4, -3.35693E-4)
		pivot_head_translation = Vector3(6, 22, -6)
		pivot_head_rotation = Rotation( 0, 0, -1 )
		self.stances.m37.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.m37.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(4, 20, -4)
		pivot_head_rotation = Rotation(-0,-0,-2)
		self.stances.m37.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.m37.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Thumper
		pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
		pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
		pivot_head_translation = Vector3(6, 39, -4)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.gre_m79.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.gre_m79.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(4, 37, -2)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.gre_m79.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.gre_m79.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--MEI LING
		pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
		pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
		pivot_head_translation = Vector3(6, 39, -4)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.china.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.china.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(4, 37, -2)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.china.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.china.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--M134
		pivot_shoulder_translation = Vector3(4.11438, 35.5734, -13.4323)
		pivot_shoulder_rotation = Rotation(-1.22503E-5, 0.00110689, 2.82252E-4)
		pivot_head_translation = Vector3(5, 40, -15)
		pivot_head_rotation = Rotation(0, 1, -6)
		self.stances.m134.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.m134.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(8, 35, -17)
		pivot_head_rotation = Rotation(0, 1, -14)
		self.stances.m134.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.m134.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--RPG
		pivot_shoulder_translation = Vector3(9.65215, 14.1036, 1.91009)
		pivot_shoulder_rotation = Rotation(-2.176E-4, 0.00147512, -1.03691E-4)
		pivot_head_translation = Vector3(8, 14, 2)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.rpg7.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.rpg7.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 12, 4)
		pivot_head_rotation = Rotation(0, 0, -4)	
		self.stances.rpg7.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.rpg7.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--TEC9
		pivot_shoulder_translation = Vector3(11.0476, 19.994, -4.43386)
		pivot_shoulder_rotation = Rotation(5.01575E-5, 5.80993E-4, -3.39375E-4)
		pivot_head_translation = Vector3(9, 32, -8)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.tec9.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.tec9.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 30, -6)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.tec9.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.tec9.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Ocelot
		pivot_shoulder_translation = Vector3(8.51249, 54.0571, -3.47982)
		pivot_shoulder_rotation = Rotation(0.0999728, -0.687715, 0.630303)
		pivot_head_translation = Vector3(7, 44, -6)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.peacemaker.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.peacemaker.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		pivot_head_translation = Vector3(5, 42, -4)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.peacemaker.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.peacemaker.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--M45
		pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
		pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
		pivot_head_translation = Vector3(7, 42, -3)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.m45.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.m45.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(5, 40, -1)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.m45.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.m45.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--E11
		pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
		pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
		pivot_head_translation = Vector3(11, 45, -7)
		pivot_head_rotation = Rotation(0, 0, -8)
		self.stances.sterling.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.sterling.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(9, 43, -5)
		pivot_head_rotation = Rotation(0, 0, -6)
		self.stances.sterling.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.sterling.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--M11/9
		pivot_shoulder_translation = Vector3(9.3342, 14.4687, -5.79688)
		pivot_shoulder_rotation = Rotation(-7.67834E-4, 0.00181087, 0.00114593)
		pivot_head_translation = Vector3(8, 17, -6)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.cobray.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.cobray.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(6, 15, -4)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.cobray.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.cobray.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--M10
		pivot_shoulder_translation = Vector3(8.66375, 35.7106, -2.84375)
		pivot_shoulder_rotation = Rotation(0.110006, -0.898579, 0.630296)
		pivot_head_translation = Vector3(8, 30, -5)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.mac10.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.mac10.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(6, 28, -3)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.mac10.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.mac10.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--VECTOR
		pivot_shoulder_translation = Vector3(9.00921, 13.825, -1.23709)
		pivot_shoulder_rotation = Rotation(-1.555E-4, 1.91465, 2.96338E-4)
		pivot_head_translation = Vector3(7, 18.5, -2.5)
		pivot_head_rotation = Rotation(0.5, 0.5, -1)
		self.stances.polymer.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.polymer.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(5, 16.5, -0.5)
		pivot_head_rotation = Rotation(0.5, 0.5, -2)
		self.stances.polymer.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.polymer.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Thompson
		pivot_shoulder_translation = Vector3(8.66375, 35.7106, -2.84375)
		pivot_shoulder_rotation = Rotation(0.110006, -0.898579, 0.630296)
		pivot_head_translation = Vector3(9, 38, -8)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.m1928.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.m1928.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 36, -6)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.m1928.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.m1928.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--P90
		pivot_shoulder_translation = Vector3(11.0002, 24.3293, -0.962641)
		pivot_shoulder_rotation = Rotation(0.21279, 0.970214, 0.197877)
		pivot_head_translation = Vector3(9, 29, -4)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.p90.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.p90.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 23, -1)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.p90.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.p90.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--G36
		pivot_shoulder_translation = Vector3(10.5658, 24.8768, -1.07923)
		pivot_shoulder_rotation = Rotation(-0.000313746, 0.000813967, -0.00027678)
		pivot_head_translation = Vector3(10, 26, -4)
		pivot_head_rotation = Rotation(0.0, 0.0, -1)
		self.stances.g36.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.g36.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(8, 24, -2)
		pivot_head_rotation = Rotation(0.0, 0.0, -2)
		self.stances.g36.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.g36.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--552
		pivot_shoulder_translation = Vector3(10.5658, 24.8768, -1.07923)
		pivot_shoulder_rotation = Rotation(-0.000313746, 0.000813967, -0.00027678)
		pivot_head_translation = Vector3(9, 25, -2)
		pivot_head_rotation = Rotation(0.0, 0.0, -1)
		self.stances.s552.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.s552.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 23, 0)
		pivot_head_rotation = Rotation(0.0, 0.0, -2)
		self.stances.s552.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.s552.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--SUB2k
		pivot_shoulder_translation = Vector3(10.579, 18.1015, -4.96283)
		pivot_shoulder_rotation = Rotation(6.05534E-4, 0.00148493, 6.76394E-4)
		pivot_head_translation = Vector3(8, 22, -5)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.sub2000.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.sub2000.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(6, 20, -3)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.sub2000.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.sub2000.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--FAM-ASS
		pivot_shoulder_translation = Vector3(12.4978, 36.9949, -1.6971)
		pivot_shoulder_rotation = Rotation(2.58401, -0.0831424, 0.629405)
		pivot_head_translation = Vector3(9, 39, -5)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.famas.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.famas.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 37, -3)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.famas.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.famas.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Video Player
		pivot_shoulder_translation = Vector3(9.11614, 8.59096, -0.476531)
		pivot_shoulder_rotation = Rotation(1.99016E-5, 0.00109528, 3.12054E-4)
		pivot_head_translation = Vector3(8, 19, -2)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.vhs.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.vhs.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(6, 17, -0)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.vhs.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.vhs.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--AUG
		pivot_shoulder_translation = Vector3(12.4978, 36.9949, -1.6971)
		pivot_shoulder_rotation = Rotation(2.58401, -0.0831424, 0.629405)
		pivot_head_translation = Vector3(11, 43, -2)
		pivot_head_rotation = Rotation(2.5, 0, -1)
		self.stances.aug.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.aug.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(9, 41, -0)
		pivot_head_rotation = Rotation(2.5, 0, -2)
		self.stances.aug.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.aug.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Eru
		pivot_shoulder_translation = Vector3(9.494, 25.5678, -0.986251)
		pivot_shoulder_rotation = Rotation(0.00116616, 0.00248113, 6.06522E-4)
		pivot_head_translation = Vector3(9, 31, -2)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.l85a2.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.l85a2.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 29, -0)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.l85a2.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.l85a2.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Saiga
		pivot_shoulder_translation = Vector3(10.7353, 23.0139, -1.43553)
		pivot_shoulder_rotation = Rotation(0.106665, -0.0845104, 0.629231)
		pivot_head_translation = Vector3(12, 32, -6)
		pivot_head_rotation = Rotation(0.3, 0.5, -1)
		self.stances.saiga.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.saiga.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(10, 30, -4)
		pivot_head_rotation = Rotation(0.3, 0.5, -1)
		self.stances.saiga.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.saiga.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--AA12
		pivot_shoulder_translation = Vector3(11.2307, 17.5519, -1.27527)
		pivot_shoulder_rotation = Rotation(6.51011E-6, -1.17821E-4, -8.70849E-5)
		pivot_head_translation = Vector3(9, 24, -4)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.aa12.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.aa12.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		pivot_head_translation = Vector3(7, 22, -2)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.aa12.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.aa12.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--KSG
		pivot_shoulder_translation = Vector3(10.8727, 25.2606, -2.09537)
		pivot_shoulder_rotation = Rotation(0.248115, 0.354997, 0.892959)
		pivot_head_translation = Vector3(11, 20, -5)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.ksg.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.ksg.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(9, 18, -3)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.ksg.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.ksg.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Coach gun
		pivot_shoulder_translation = Vector3(10.6562, 32.9715, -6.73279)
		pivot_shoulder_rotation = Rotation(0.106667, -0.0844876, 0.629223)
		pivot_head_translation = Vector3(6,28,-5)
		pivot_head_rotation = Rotation( 0, 0, -1 )
		self.stances.huntsman.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.huntsman.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(4,26,-3)
		pivot_head_rotation = Rotation( -0, -0, -2 )
		self.stances.huntsman.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.huntsman.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--B682
		pivot_shoulder_translation = Vector3(8.47311, 22.1434, -6.31211)
		pivot_shoulder_rotation = Rotation(-1.83462E-5, 0.00105637, 3.52956E-4)
		pivot_head_translation = Vector3(7, 26, -5)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.b682.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.b682.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(5, 24, -3)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.b682.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.b682.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Striker
		pivot_shoulder_translation = Vector3(10.761, 11.8207, -3.78517)
		pivot_shoulder_rotation = Rotation(0.106622, -0.0844409, 0.629204)
		pivot_head_translation = Vector3(8, 20, -5)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.striker.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.striker.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(6, 18, -3)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.striker.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.striker.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--SCAR
		pivot_shoulder_translation = Vector3(10.7353, 23.0139, -1.43553)
		pivot_shoulder_rotation = Rotation(0.106665, -0.0845104, 0.629231)
		pivot_head_translation = Vector3(8, 26, -4)
		pivot_head_rotation = Rotation(0.0, 0.0, -1)
		self.stances.scar.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.scar.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(6, 24, -2)
		pivot_head_rotation = Rotation(0.0, 0.0, -2)
		self.stances.scar.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.scar.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--G3
		pivot_shoulder_translation = Vector3(10.7158, 21.5452, -1.67945)
		pivot_shoulder_rotation = Rotation(0.107438, -0.0837396, 0.629882)
		pivot_head_translation = Vector3(9, 26, -6)
		pivot_head_rotation = Rotation(0.0, 0.2, -1)
		self.stances.g3.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.g3.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 24, -4)
		pivot_head_rotation = Rotation(0.0, 0.2, -2)
		self.stances.g3.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.g3.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--FAL
		pivot_shoulder_translation = Vector3(10.6889, 30.1129, -4.31372)
		pivot_shoulder_rotation = Rotation(0.106623, -0.0844514, 0.629209)
		pivot_head_translation = Vector3(9, 34, -6)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.fal.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.fal.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 32, -4)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.fal.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.fal.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Galil
		pivot_shoulder_translation = Vector3(10.7344, 22.1028, -3.71493)
		pivot_shoulder_rotation = Rotation(0.107212, -0.0843867, 0.629332)
		pivot_head_translation = Vector3(9, 23, -6)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.galil.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.galil.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(7, 21,-4)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.galil.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.galil.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--M14
		pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
		pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
		pivot_head_translation = Vector3(11,14,-4)
		pivot_head_rotation = Rotation(0,0,-1)
		self.stances.new_m14.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.new_m14.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(9,12,-2)
		pivot_head_rotation = Rotation(0,0,-2)
		self.stances.new_m14.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.new_m14.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--MAG
		pivot_shoulder_translation = Vector3( 10.7806, 4.38612, 0 )
		pivot_shoulder_rotation = Rotation( 0.106596, -0.0844502, 0.629187 )
		pivot_head_translation = Vector3( 10, 11, -4 )
		pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
		self.stances.par.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.par.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3( 8, 9, -2 )
		pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
		self.stances.par.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.par.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
				
		--M249
		pivot_shoulder_translation = Vector3(10.7056, 4.38842, -0.747177)
		pivot_shoulder_rotation = Rotation(0.106618, -0.084954, 0.62858)
		pivot_head_translation = Vector3( 10, 18, -7 )
		pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
		self.stances.m249.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.m249.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3( 8, 16, -5 )
		pivot_head_rotation = Rotation( 0.2, 0.5, -2)
		self.stances.m249.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.m249.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
				
		--RPK
		pivot_shoulder_translation = Vector3( 10.6725, 27.7166, -4.93564 )
		pivot_shoulder_rotation = Rotation( 0.1067, -0.0850111, 0.629008 )
		pivot_head_translation = Vector3( 10, 40, -6 )
		pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
		self.stances.rpk.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.rpk.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3( 8, 38, -4 )
		pivot_head_rotation = Rotation( 0.2, 0.5, -2 )
		self.stances.rpk.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.rpk.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
				
		--HK21
		pivot_shoulder_translation = Vector3( 11.3874, 18.55, -2.08902 )
		pivot_shoulder_rotation = Rotation( 3.03061, 1.08595, 1.87441 )
		pivot_head_translation = Vector3( 12, 22, -5 )
		pivot_head_rotation = Rotation( 3.5, 1.5, -1 )
		self.stances.hk21.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.hk21.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3( 10, 20, -3 )
		pivot_head_rotation = Rotation( 3.5, 1.5, -2 )
		self.stances.hk21.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.hk21.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
				
		--MG42
		pivot_shoulder_translation = Vector3( 10.7806, 4.38612, 0 )
		pivot_shoulder_rotation = Rotation( 0.106596, -0.0844502, 0.629187 )
		pivot_head_translation = Vector3( 11, 12, -8 )
		pivot_head_rotation = Rotation( 0.2, 0.5, -1 )
		self.stances.mg42.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.mg42.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3( 9, 10, -6 )
		pivot_head_rotation = Rotation( 0.2, 0.5, -2)
		self.stances.mg42.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.mg42.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			
		--Winchester
		pivot_shoulder_translation = Vector3(10.7128, 49.0468, -8.57197)
		pivot_shoulder_rotation = Rotation(0.00173532, -0.0855528, 0.630742)
		pivot_head_translation = Vector3(9, 56, -6)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.winchester1874.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.winchester1874.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		pivot_head_translation = Vector3(7, 54, -4)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.winchester1874.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.winchester1874.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--MSR
		pivot_shoulder_translation = Vector3( 10.7223, 44.8494, -2.19714 )
		pivot_shoulder_rotation = Rotation( 0.106634, -0.0844042, 0.629169 )
		pivot_head_translation = Vector3( 11, 47, -6 )
		pivot_head_rotation = Rotation( 0, 0, -1 )
		self.stances.msr.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.msr.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3( 9, 45, -4 )
		pivot_head_rotation = Rotation( 0, 0, -2 )
		self.stances.msr.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.msr.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		
		pivot_shoulder_translation = Vector3(7.96526, 39.0739, -3.92198)
		pivot_shoulder_rotation = Rotation(4.36208E-5, 6.03618E-4, -3.30838E-4)
		pivot_head_translation = Vector3(8, 50, -6)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.model70.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.model70.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(6, 48, -4)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.model70.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.model70.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--WA2000
		pivot_shoulder_translation = Vector3(10.5502, 10.5337, 0.275142)
		pivot_shoulder_rotation = Rotation(-2.25784E-4, 0.00162484, -1.92709E-4)
		pivot_head_translation = Vector3(10, 23, -1)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.wa2000.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.wa2000.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(8, 21, 1)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.wa2000.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.wa2000.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--Moist Nugget
		pivot_shoulder_translation = Vector3( 12.9429, 21.4699, -2.48515 )
		pivot_shoulder_rotation = Rotation( 0.113195, 0.518822, 0.628052 )
		pivot_head_translation = Vector3( 14, 26, -6 )
		pivot_head_rotation = Rotation( 0, 1, -1 )
		self.stances.mosin.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.mosin.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3( 12, 24, -4 )
		pivot_head_rotation = Rotation( 0, 1, -2 )
		self.stances.mosin.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.mosin.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--R93
		pivot_shoulder_translation = Vector3( 10.6978, 45.3183, -4.51382 )
		pivot_shoulder_rotation = Rotation( 0.107839, -0.0834037, 0.628987 )
		pivot_head_translation = Vector3( 9, 48, -5 )
		pivot_head_rotation = Rotation( 0, 0, -1 )
		self.stances.r93.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.r93.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3( 6, 46, -3 )
		pivot_head_rotation = Rotation( 0, 0, -2 )
		self.stances.r93.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.r93.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		--M95
		pivot_shoulder_translation = Vector3( 12.9429, 21.4699, -2.48515 )
		pivot_shoulder_rotation = Rotation( 0.113195, 0.518822, 0.628052 )
		pivot_head_translation = Vector3( 10, 28, -8 )
		pivot_head_rotation = Rotation( 0, 0, -1 )
		self.stances.m95.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.m95.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3( 8, 26, -6 )
		pivot_head_rotation = Rotation( 0, 0, -2 )
		self.stances.m95.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.m95.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		
		pivot_shoulder_translation = Vector3(9.27651, 19.3937, -6.03765)
		pivot_shoulder_rotation = Rotation(4.57709E-5, 5.5666E-4, -3.35693E-4)
		pivot_head_translation = Vector3(6, 22, -7.5)
		pivot_head_rotation = Rotation( 0, 0, -1 )
		self.stances.m37.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.m37.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(4, 20, -5.5)
		pivot_head_rotation = Rotation(-0,-0,-2)
		self.stances.m37.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.m37.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		
		
		pivot_shoulder_translation = Vector3(9.46072, 17.5362, -5.3306)
		pivot_shoulder_rotation = Rotation(4.59269E-5, 7.82065E-4, -3.35783E-4)
		pivot_head_translation = Vector3(8, 27, -5)
		pivot_head_rotation = Rotation(0, 0, -1)
		self.stances.sr2.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.sr2.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(6, 25, -3)
		pivot_head_rotation = Rotation(0, 0, -2)
		self.stances.sr2.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.sr2.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		
		
		pivot_shoulder_translation = Vector3(10.9257, 47.3309, -0.659333)
		pivot_shoulder_rotation = Rotation(-7.3371E-8, -8.32429E-6, -1.70755E-6)
		pivot_head_translation = Vector3(10.95, 34, -4)
		pivot_head_rotation = Rotation(0, 0, 0)
		self.stances.x_sr2.standard.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.x_sr2.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_head_translation = Vector3(10.95, 32, -2)
		pivot_head_rotation = Rotation(0, 0, 0)
		self.stances.x_sr2.crouched.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
		self.stances.x_sr2.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	end
		
	if DMCWO.doomguy == true then
		pivot_head_translation = Vector3(0,0,0)
		pivot_head_rotation = Rotation(0,0,0)
		
		pivot_shoulder_translation = Vector3(10.75,5,4)
		pivot_shoulder_rotation = Rotation(0,-1,0)
		local rifle = {'m45','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','new_m14','scar','fal','hk21','rpk','msr','r93','m95','galil','gre_m79','tec9','scorpion','uzi','mosin','sterling','l85a2','cobray'}
		for i, wep_id in ipairs(rifle) do
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()				
		end	
		
		pivot_shoulder_translation = Vector3(10.8,5,3)
		pivot_shoulder_rotation = Rotation(0,-1,1)
		local rifle = {'r870','huntsman','benelli','ksg','serbu','striker','spas12'}
		for i, wep_id in ipairs(rifle) do
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()				
		end
		
		pivot_shoulder_translation = Vector3(8.5,7,7)
		pivot_shoulder_rotation = Rotation(0,-1,1)
		local pistol = {'new_raging_bull','deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','g26','ppk','hs2000','judge','c96','m1928','mac10','mateba'}
		for i, wep_id in ipairs(pistol) do
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()	
		end
		
		pivot_shoulder_translation = Vector3(10.75,-10,10)
		pivot_shoulder_rotation = Rotation(0,-1,0)
		local m249_hold = {'m249','mg42'}
		for i, wep_id in ipairs(m249_hold) do
			self.stances[wep_id].standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
			self.stances[wep_id].crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
			self.stances[wep_id].crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()	
		end
		
		pivot_shoulder_translation = Vector3(10.75,-5,11)
		pivot_shoulder_rotation = Rotation(0,-1,0)
		self.stances.rpg7.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.rpg7.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		self.stances.rpg7.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.rpg7.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_shoulder_translation = Vector3(10.75,5,6)
		pivot_shoulder_rotation = Rotation(0,-1,0)
		self.stances.g3.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.g3.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		self.stances.g3.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.g3.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_shoulder_translation = Vector3(9,-10,8)
		pivot_shoulder_rotation = Rotation(0,-1,0)
		self.stances.vhs.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.vhs.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		self.stances.vhs.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.vhs.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
		pivot_shoulder_translation = Vector3(14,-5,8)
		pivot_shoulder_rotation = Rotation(2.5,-1,0)
		self.stances.famas.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.famas.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		self.stances.famas.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.famas.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()	
		
		pivot_shoulder_translation = Vector3(8.5,0,4)
		pivot_shoulder_rotation = Rotation(0,-1,0)	
		self.stances.b682.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.b682.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		self.stances.b682.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.b682.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()	
		
		pivot_shoulder_translation = Vector3(10.75,10,2)
		pivot_shoulder_rotation = Rotation(0,-1,0)	
		self.stances.m134.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.m134.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		self.stances.m134.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.m134.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
		pivot_shoulder_translation = Vector3(10.75,1,3)
		pivot_shoulder_rotation = Rotation(0,-1,0)	
		self.stances.flamethrower_mk2.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.flamethrower_mk2.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		self.stances.flamethrower_mk2.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.flamethrower_mk2.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		
	end
	
	--beepod
	pivot_shoulder_translation = Vector3(10.7056, 4.38842, -0.747177)
	pivot_shoulder_rotation = Rotation(0.106618, -0.084954, 0.62858)
	pivot_head_translation = Vector3( 10.5, 17, -9 )
	pivot_head_rotation = Rotation(0.0, 0.0, 0)
	local bipod = {'rpk','m249','hk21','mg42','par'}
	for i, wep_id in ipairs(bipod) do
		self.stances[ wep_id ].bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances[ wep_id ].bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		self.stances[ wep_id ].bipod.FOV = 65
	end
	--}
	
	--[[ ADS Positioning ]]
	--{
	--[[HANDGUNS]]--{
	--Bardoda
	pivot_shoulder_translation = Vector3(8.50075, 40.9227, -4.15328)
	pivot_shoulder_rotation = Rotation(0.0994, -0.687851, 0.630047)
	pivot_head_translation = Vector3(0, 37, 0)
	pivot_head_rotation = Rotation(0, 0.5, 0)
	self.stances.b92fs.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.b92fs.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Glocknade 17
	pivot_shoulder_translation = Vector3(8.48582, 38.7727, -5.49358)
	pivot_shoulder_rotation = Rotation(0.100007, -0.687692, 0.630291)
	pivot_head_translation = Vector3(-0.01, 35, 0.05)
	pivot_head_rotation = Rotation(0.05, 0.15, 0)
	self.stances.glock_17.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.glock_17.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Glocknade 18c
	pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
	pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
	pivot_head_translation = Vector3(-0.01, 35, 0.05)
	pivot_head_rotation = Rotation(0.1, 0.15, 0)
	self.stances.glock_18c.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.glock_18c.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Glocknade 26
	pivot_shoulder_translation = Vector3(8.48582, 38.7727, -5.49358)
	pivot_shoulder_rotation = Rotation(0.100007, -0.687692, 0.630291)
	pivot_head_translation = Vector3(-0.01, 35, 0.05)
	pivot_head_rotation = Rotation(0.05, 0.15, 0)
	self.stances.g26.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.g26.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Glocknade 22c
	pivot_shoulder_translation = Vector3(8.48582, 38.7727, -5.49358)
	pivot_shoulder_rotation = Rotation(0.100007, -0.687692, 0.630291)
	pivot_head_translation = Vector3(0.01, 35, -0.05)
	pivot_head_rotation = Rotation(0.05, 0.2, 0)
	self.stances.g22c.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.g22c.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--P226
	pivot_shoulder_translation = Vector3(8.5121, 38.8014, -3.46065)
	pivot_shoulder_rotation = Rotation(0.10024, -0.688283, 0.631346)
	pivot_head_translation = Vector3(-0, 37, 0.1)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.p226.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.p226.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--PPK
	pivot_shoulder_translation = Vector3(8.49608, 40.6427, -4.65654)
	pivot_shoulder_rotation = Rotation(0.0989007, -0.686519, 0.631465)
	pivot_head_translation = Vector3(0, 37, -0.05)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.ppk.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.ppk.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--TEC-9
	pivot_shoulder_translation = Vector3(11.0476, 19.994, -4.43386)
	pivot_shoulder_rotation = Rotation(5.01575E-5, 5.80993E-4, -3.39375E-4)
	pivot_head_translation = Vector3(-0.01, 18, -0.15)
	pivot_head_rotation = Rotation(0.1, 0.5, 0)
	self.stances.tec9.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.tec9.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--1911
	pivot_shoulder_translation = Vector3(8.51072, 41.1823, -3.19592)
	pivot_shoulder_rotation = Rotation(0.0999825, -0.688529, 0.630296)
	pivot_head_translation = Vector3(0.01, 35, 0.05)
	pivot_head_rotation = Rotation(0.05, 0.15, 0)
	self.stances.colt_1911.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.colt_1911.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--USP
	pivot_shoulder_translation = Vector3(8.51087, 41.182, -3.19589)
	pivot_shoulder_rotation = Rotation(0.0996996, -0.686868, 0.630304)
	pivot_head_translation = Vector3(0.01, 35, 0.15)
	pivot_head_rotation = Rotation(0.05, -0.05, 0)
	self.stances.usp.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.usp.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--C96
	pivot_shoulder_translation = Vector3(8.44668, 44.0211, -4.39106)
	pivot_shoulder_rotation = Rotation(0.100022, -0.68821, 0.62967)
	
	--Revolver Ocelot
	pivot_shoulder_translation = Vector3(8.43932, 54.0601, -3.55138)
	pivot_shoulder_rotation = Rotation(0.10003, -0.688227, 0.629666)
	pivot_head_translation = Vector3(-0.02, 40, 0.1)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.peacemaker.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.peacemaker.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--IS THAT A FAMAS?
	pivot_shoulder_translation = Vector3(8.47169, 40.6363, -2.73086)
	pivot_shoulder_rotation = Rotation(0.100026, -0.68821, 0.629665)
	pivot_head_translation = Vector3(-0.015, 35, 0.25)
	pivot_head_rotation = Rotation(0, 0.5, 0)
	self.stances.deagle.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.deagle.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--HUEHUEHUE
	pivot_shoulder_translation = Vector3(8.43999, 43.8644, -2.22393)
	pivot_shoulder_rotation = Rotation(0.100024, -0.688276, 0.608057)
	pivot_head_translation = Vector3(-0.025, 36, 0)
	pivot_head_rotation = Rotation(0.0, 0, 0)
	self.stances.new_raging_bull.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.new_raging_bull.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--}
	
	--[[SMGs]]--{
	--COBRAY
	pivot_shoulder_translation = Vector3(9.27773, 14.4497, -5.83427)
	pivot_shoulder_rotation = Rotation(5.61873E-5, 5.80566E-4, -3.41083E-4)
	pivot_head_translation = Vector3(-0.01, 18, 0.05)
	pivot_head_rotation = Rotation(0.025, 0, 0)
	self.stances.cobray.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.cobray.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--M10
	pivot_shoulder_translation = Vector3(8.66375, 35.7106, -2.84375)
	pivot_shoulder_rotation = Rotation(0.110006, -0.898579, 0.630296)
	pivot_head_translation = Vector3(0.05, 23, 0.1)
	pivot_head_rotation = Rotation(-0.05, 0, 0)
	self.stances.mac10.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.mac10.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--MP5
	pivot_shoulder_translation = Vector3(10.6744, 18.4385, -3.33648)
	pivot_shoulder_rotation = Rotation(0.106666, -0.220035, 0.628591)
	pivot_head_translation = Vector3(-0.01, 8.5, -0.05)
	pivot_head_rotation = Rotation(0.05, 0.2, 0)
	self.stances.new_mp5.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.new_mp5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Vector
	pivot_shoulder_translation = Vector3(8.97257, 14.5029, -1.63302)
	pivot_shoulder_rotation = Rotation(3.95253E-5, 6.47161E-4, 2.84306E-4)
	pivot_head_translation = Vector3(-0.02, 15, 0.05)
	pivot_head_rotation = Rotation(0.05, 0, 0)
	self.stances.polymer.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.polymer.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--THOMPSON
	pivot_shoulder_translation = Vector3(8.45353, 11.6248, -3.99483)
	pivot_shoulder_rotation = Rotation(4.14593E-5, 5.89104E-4, -4.00527E-4)
	pivot_head_translation = Vector3(-0.01, 12, 0)
	pivot_head_rotation = Rotation(0.025, 0, 0)
	self.stances.m1928.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.m1928.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	--}
	
	--[[ARs]]--{
	--Generic AK hold
	pivot_shoulder_translation = Vector3(10.6155, 40.3833, -4.9875)
	pivot_shoulder_rotation = Rotation(0.106684, -0.0855388, 0.628213)
	pivot_head_translation = Vector3(0.02, 28, 0)
	pivot_head_rotation = Rotation(0.03, 0.1, 0)
	local ak_sight = {'ak74','akm','akm_gold'}
	for i, wep_id in ipairs(ak_sight) do
		self.stances[wep_id].steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances[wep_id].steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	end
	
	--Generic AR hold
	pivot_shoulder_translation = Vector3(10.7332, 15.6145, -2.75549)
	pivot_shoulder_rotation = Rotation(0.106625, -0.450997, 0.629212)
	pivot_head_translation = Vector3( 0.05, 2, -1.25 )
	pivot_head_rotation = Rotation( 0.075, -0.3, 0 )
	local ar_sight = {'amcar','m16','new_m4','olympic','new_m4'}
	for i, wep_id in ipairs(ar_sight) do
		self.stances[wep_id].steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances[wep_id].steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	end
	
	--Ak5
	pivot_shoulder_translation = Vector3(10.6857, 15.6186, -2.80523)
	pivot_shoulder_rotation = Rotation(0.106673, -0.431536, 0.628573)
	pivot_head_translation = Vector3(-0.005, 8, 0.025 )
	pivot_head_rotation = Rotation(0.025, 0, 0 )
	self.stances.ak5.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.ak5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--G36
	pivot_shoulder_translation = Vector3(10.4764, 24.8875, -1.1479)
	pivot_shoulder_rotation = Rotation(0.157971, -3.91207E-4, -0.00105803)
	pivot_head_translation = Vector3(0, 12, 0.025)
	pivot_head_rotation = Rotation(0.075, 0.25, 0)
	self.stances.g36.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.g36.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--552
	pivot_shoulder_translation = Vector3(10.6163, 22.0889, -4.002)
	pivot_shoulder_rotation = Rotation(0.106688, -0.0847366, 0.628588)
	pivot_head_translation = Vector3(0.01, 11, 0.075)
	pivot_head_rotation = Rotation(0.03, 0, 0)
	self.stances.s552.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.s552.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--sub2k
	pivot_shoulder_translation = Vector3(10.5282, 18.097, -5.00149)
	pivot_shoulder_rotation = Rotation(0.00116612, 6.28372E-4, -5.28199E-4)
	pivot_head_translation = Vector3(-0.01, 18, 0.0675)
	pivot_head_rotation = Rotation(0.025, -0.05, 0)
	self.stances.sub2000.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.sub2000.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--VHS
	pivot_shoulder_translation = Vector3(9.43018, 11.2164, -1.79026)
	pivot_shoulder_rotation = Rotation(4.53633E-5, 3.16602E-4, -3.38188E-4)
	pivot_head_translation = Vector3(0, 11, 0.1)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.vhs.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.vhs.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--IS THAT AN M16?
	pivot_shoulder_translation = Vector3(12.4436, 37.0136, -1.75668)
	pivot_shoulder_rotation = Rotation(2.58365, -0.0849733, 0.628574)
	pivot_head_translation = Vector3(-0.01, 25, 0)
	pivot_head_rotation = Rotation(0.05, 0, 0)
	self.stances.famas.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.famas.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--AUG
	pivot_shoulder_translation = Vector3(8.76358, 14.9033, -4.43681)
	pivot_shoulder_rotation = Rotation(0.106171, -0.0839854, 0.627887)
	pivot_head_translation = Vector3(-0.01, 12, 0)
	pivot_head_rotation = Rotation(0.1, 0, 0)
	self.stances.aug.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.aug.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--JAMMIN
	pivot_shoulder_translation = Vector3(9.42267, 25.5584, -1.05883)
	pivot_shoulder_rotation = Rotation(4.09795E-5, 5.66906E-4, -3.22727E-4)
	pivot_head_translation = Vector3(-0.01, 22, 0)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.l85a2.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.l85a2.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	--}
	
	--[[SHOTGUNS]]--{
	--Saiga 12
	pivot_shoulder_translation = Vector3(7.41774, 29.7226, -1.95727)
	pivot_shoulder_rotation = Rotation(0.106196, -0.625882, 0.630612)
	pivot_head_translation = Vector3(0.05, 30, -0.2)
	pivot_head_rotation = Rotation(0, -0.7, 0)
	self.stances.saiga.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.saiga.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--AA12
	pivot_shoulder_translation = Vector3(11.2307, 17.5519, -1.27527)
	pivot_shoulder_rotation = Rotation(6.51011E-6, -1.17821E-4, -8.70849E-5)
	pivot_head_translation = Vector3(-0.01, 10, 0.05)
	pivot_head_rotation = Rotation(0.05, 0, 0)
	self.stances.aa12.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.aa12.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Benelli
	pivot_shoulder_translation = Vector3(10.6379, 10.7686, -5.37323)
	pivot_shoulder_rotation = Rotation(0.106579, -0.0858935, 0.628813)
	pivot_head_translation = Vector3(-0.01, 12, -0.05)
	pivot_head_rotation = Rotation(0.05, 0, 0)
	self.stances.benelli.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.benelli.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--SPAS12
	pivot_shoulder_translation = Vector3(10.6114, 29.7816, -4.5667)
	pivot_shoulder_rotation = Rotation(0.106488, -0.0856018, 0.629234)
	pivot_head_translation = Vector3(-0.01, 41, 0)
	pivot_head_rotation = Rotation(0.025, 0, 0)
	self.stances.spas12.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.spas12.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--KSG
	pivot_shoulder_translation = Vector3(7.3474, 41.4691, -0.669275)
	pivot_shoulder_rotation = Rotation(4.3342E-5, 5.7573E-5, -0.150059)
	pivot_head_translation = Vector3(-0.025, 26, 0.1)
	pivot_head_rotation = Rotation(0.05, 0, 0)
	self.stances.ksg.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.ksg.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--870 + Loco
	pivot_shoulder_translation = Vector3(10.662, 3.33648, -4.35027)
	pivot_shoulder_rotation = Rotation(0.106662, -0.0849799, 0.628576)
	pivot_head_translation = Vector3(-0.01, 10, 1.5)
	pivot_head_rotation = Rotation(0.05, 0, 0)
	self.stances.r870.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.r870.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	self.stances.serbu.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.serbu.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Mosconi
	pivot_shoulder_translation = Vector3(10.6562, 32.9715, -6.73279)
	pivot_shoulder_rotation = Rotation(0.106667, -0.0844876, 0.629223)
	pivot_head_translation = Vector3(0, 27, -0.4)
	pivot_head_rotation = Rotation(0, 1, 0)
	self.stances.huntsman.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.huntsman.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--B682
	pivot_shoulder_translation = Vector3(8.47311, 22.1434, -6.31211)
	pivot_shoulder_rotation = Rotation(-1.83462E-5, 0.00105637, 3.52956E-4)
	pivot_head_translation = Vector3(0, 30, -1.5)
	pivot_head_rotation = Rotation(0, 0.8, 0)
	self.stances.b682.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.b682.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Striker
	pivot_shoulder_translation = Vector3(10.6546, 11.9418, -3.67491)
	pivot_shoulder_rotation = Rotation(0.106666, -0.0849691, 0.628576)
	pivot_head_translation = Vector3(-0.01, 20, 0)
	pivot_head_rotation = Rotation(0.1, 0, 0)
	self.stances.striker.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.striker.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	--}
	
	--[[BATTLE RAIFUS]]--{
	--SCAR
	pivot_shoulder_translation = Vector3(10.7114, 19.4921, -0.0225505)
	pivot_shoulder_rotation = Rotation(0.106672, -0.0849742, 0.628574)
	pivot_head_translation = Vector3(-0.01, 10, 0.025)
	pivot_head_rotation = Rotation(0.02, 0.25, 0)
	self.stances.scar.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.scar.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--FARU
	pivot_shoulder_translation = Vector3(10.6398, 30.1141, -4.37184)
	pivot_shoulder_rotation = Rotation(0.106667, -0.0849355, 0.628585)
	pivot_head_translation = Vector3(-0.01, 26, -0.02)
	pivot_head_rotation = Rotation(0.01, -0.1, 0)
	self.stances.fal.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.fal.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--Galil
	pivot_shoulder_translation = Vector3(10.6632, 22.0834, -3.76603)
	pivot_shoulder_rotation = Rotation(0.106684, -0.084986, 0.628584)
	pivot_head_translation = Vector3(-0.01, 10, 0.03)
	pivot_head_rotation = Rotation(0.05, 0.075, 0)
	self.stances.galil.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.galil.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--G3
	pivot_shoulder_translation = Vector3(10.6681, 21.5458, -1.73827)
	pivot_shoulder_rotation = Rotation(0.106686, -0.0859334, 0.627737)
	pivot_head_translation = Vector3(-0.005, 16.5, 0.225)
	pivot_head_rotation = Rotation(0.05, 0, 0)
	self.stances.g3.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.g3.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--M14
	pivot_shoulder_translation = Vector3(10.9676, 22.9989, -4.06557)
	pivot_shoulder_rotation = Rotation(5.57069E-5, 5.88677E-4, -3.47486E-4)
	pivot_head_translation = Vector3(-0.01, 8, 0.05)
	pivot_head_rotation = Rotation(0.025, 0, 0)
	self.stances.new_m14.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.new_m14.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	--}
	
	--[[LMGs]]--{
	--M249
	pivot_shoulder_translation = Vector3(10.7056, 4.38842, -0.747177)
	pivot_shoulder_rotation = Rotation(0.106618, -0.084954, 0.62858)
	pivot_head_translation = Vector3(-0.01, 12, -0.1)
	pivot_head_rotation = Rotation(0.05, 0.15, 0)
	self.stances.m249.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.m249.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--RPK
	pivot_shoulder_translation = Vector3(10.6138, 27.7178, -4.97323)
	pivot_shoulder_rotation = Rotation(0.106543, -0.0842801, 0.628575)
	pivot_head_translation = Vector3(-0.02, 28.5, 0.05)
	pivot_head_rotation = Rotation(0.1, 0, 0)
	self.stances.rpk.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.rpk.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--HK21
	pivot_shoulder_translation = Vector3(8.545, 11.3934, -3.33201)
	pivot_shoulder_rotation = Rotation(4.78916E-5, 0.00548037, -0.00110991)
	pivot_head_translation = Vector3(-0.01, 15, 0.05)
	pivot_head_rotation = Rotation(0.05, 0.2, 0)
	self.stances.hk21.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.hk21.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--KSP 58
	pivot_shoulder_translation = Vector3(10.7056, 4.38842, -0.747177)
	pivot_shoulder_rotation = Rotation(0.106618, -0.084954, 0.62858)
	pivot_head_translation = Vector3( 0.645, 10.5, 3.21 )
	pivot_head_rotation = Rotation( 0.15, 0, 0 )
	self.stances.par.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.par.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--MG42
	pivot_shoulder_translation = Vector3(10.6654, 35.1711, 0.821937)
	pivot_shoulder_rotation = Rotation(0.106614, -0.0857193, 0.628153)
	pivot_head_translation = Vector3(-0.01, 25, 0.)
	pivot_head_rotation = Rotation(0.05, 0.1, 0)
	self.stances.mg42.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.mg42.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	--}
	
	--[[RIFLES]]--{
	--1873
	pivot_shoulder_translation = Vector3(10.6097, 49.1694, -8.4901)
	pivot_shoulder_rotation = Rotation(0.00124311, -0.086311, 0.630106)
	pivot_head_translation = Vector3(0, 50, -0.2)
	pivot_head_rotation = Rotation(0, 0.3, 0)
	self.stances.winchester1874.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.winchester1874.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--MSR
	pivot_shoulder_translation = Vector3(8.66059, 40.8349, -3.2711)
	pivot_shoulder_rotation = Rotation(0.106694, -0.0848914, 0.628555)
	pivot_head_translation = Vector3(-0.01, 30, -2.925)
	pivot_head_rotation = Rotation(0.025, 0, 0)
	self.stances.msr.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.msr.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	--R93
	pivot_shoulder_translation = Vector3(10.6121, 45.4383, -4.45108)
	pivot_shoulder_rotation = Rotation(0.10666, -0.0849622, 0.628577)
	pivot_head_translation = Vector3(-0.01, 29, -3.15)
	pivot_head_rotation = Rotation(0.025, 0, 0)
	self.stances.r93.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.r93.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	--M95
	pivot_shoulder_translation = Vector3(12.8734, 21.463, -2.5494)
	pivot_shoulder_rotation = Rotation(0.113234, 0.518279, 0.627416)
	pivot_head_translation = Vector3(0, 25, -1.45)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.m95.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.m95.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	--}
	
	--[[PDWs]]--{
	--P90
	pivot_shoulder_translation = Vector3(10.946, 24.3419, -1.02894)
	pivot_shoulder_rotation = Rotation(0.2128, 0.969032, 0.196812)
	pivot_head_translation = Vector3(-0.02, 20, -0.25)
	pivot_head_rotation = Rotation(0.02, 0, 0)
	self.stances.p90.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.p90.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--MP7
	pivot_shoulder_translation = Vector3(10.6576, 18.2065, -5.75727)
	pivot_shoulder_rotation = Rotation(0.106663, -0.0849503, 0.628575)
	pivot_head_translation = Vector3(-0.025, 14, -0.1)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.mp7.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.mp7.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	--}
			
	--M134
	pivot_shoulder_translation = Vector3(4.11438, 35.5734, -13.4323)
	pivot_shoulder_rotation = Rotation(-1.22503E-5, 0.00110689, 2.82252E-4)
	pivot_head_translation = Vector3(0, 24, -10)
	pivot_head_rotation = Rotation(0, 0.5, 0)
	self.stances.m134.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.m134.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_shoulder_translation = Vector3(10.9257, 47.3309, -0.659333)
	pivot_shoulder_rotation = Rotation(-7.3371E-8, -8.32429E-6, -1.70755E-6)
	pivot_head_translation = Vector3(10.95, 40, -2)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.x_sr2.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.x_sr2.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	pivot_shoulder_translation = Vector3(9.27651, 19.3937, -6.03765)
	pivot_shoulder_rotation = Rotation(4.57709E-5, 5.5666E-4, -3.35693E-4)
	pivot_head_translation = Vector3(0, 25, -0.5)	
	pivot_head_rotation = Rotation(0, 0.5, 0)
	self.stances.m37.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	self.stances.m37.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--}
end