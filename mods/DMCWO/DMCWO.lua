--[[
DMC's Weapon Overhaul
v1.82
]]

if not _G.DMCWO then
	_G.DMCWO = _G.DMCWO or {}
end
DMCWO._path = ModPath
DMCWO._data_path = SavePath .. "DMCWO_opt.txt"
DMCWO._data_path_skills = SavePath .. "DMCWO_skill_opt.txt"
DMCWO._data = {}
DMCWO._data_skills = {}
DMCWO.Hooks = {
	["lib/managers/blackmarketmanager"] = "lua/managers/blackmarketmanager.lua",
	["lib/managers/hudmanagerpd2"] = "lua/managers/hudmanagerpd2.lua",
	["lib/managers/localizationmanager"] = "lua/managers/localizationmanager.lua",
	["lib/managers/moneymanager"] = "lua/managers/moneymanager.lua",
	["lib/managers/playermanager"] = "lua/managers/playermanager.lua",
	["lib/managers/skilltreemanager"] = "lua/managers/skilltreemanager.lua",
	["lib/managers/weaponfactorymanager"] = "lua/managers/weaponfactorymanager.lua",
	
	["lib/managers/hud/hudteammate"] = "lua/managers/hud/hudteammate.lua",
	
	["lib/managers/menu/blackmarketgui"] = "lua/managers/menu/blackmarketgui.lua",
	
	["lib/tweak_data/blackmarket/meleeweaponstweakdata"] = "lua/tweak_data/blackmarket/meleeweaponstweakdata.lua",	
	["lib/tweak_data/blackmarket/projectilestweakdata"] = "lua/tweak_data/blackmarket/projectilestweakdata.lua",
	["lib/tweak_data/blackmarket/weaponskinstweakdata"] = "lua/tweak_data/blackmarket/weaponskinstweakdata.lua",	
	
	["lib/tweak_data/dlctweakdata"] = "lua/tweak_data/dlctweakdata.lua",	
	["lib/tweak_data/economytweakdata"] = "lua/tweak_data/economytweakdata.lua",	
	["lib/tweak_data/equipmentstweakdata"] = "lua/tweak_data/equipmentstweakdata.lua",
	["lib/tweak_data/infamytweakdata"] = "lua/tweak_data/infamytweakdata.lua",
	["lib/tweak_data/levelstweakdata"] = "lua/tweak_data/levelstweakdata.lua",
	["lib/tweak_data/lootdroptweakdata"] = "lua/tweak_data/lootdroptweakdata.lua",
	["lib/tweak_data/playertweakdata"] = "lua/tweak_data/playertweakdata.lua",	
	["lib/tweak_data/skilltreetweakdata"] = "lua/tweak_data/skilltreetweakdata.lua",		
	["lib/tweak_data/tweakdata"] = "lua/tweak_data/tweakdata.lua",	
	["lib/tweak_data/upgradestweakdata"] = "lua/tweak_data/upgradestweakdata.lua",		
	["lib/tweak_data/weaponfactorytweakdata"] = "lua/tweak_data/weaponfactorytweakdata.lua",
	["lib/tweak_data/weapontweakdata"] = "lua/tweak_data/weapontweakdata.lua",	
	
	["lib/units/beings/player/playerdamage"] = "lua/units/beings/player/playerdamage.lua",
	
	["lib/units/beings/player/states/playerbipod"] = "lua/units/beings/player/states/playerbipod.lua",
	["lib/units/beings/player/states/playerbleedout"] = "lua/units/beings/player/states/playerbleedout.lua",
	["lib/units/beings/player/states/playercarry"] = "lua/units/beings/player/states/playercarry.lua",
	["lib/units/beings/player/states/playerstandard"] = "lua/units/beings/player/states/playerstandard.lua",
	["lib/units/beings/player/states/playertased"] = "lua/units/beings/player/states/playertased.lua",
	
	--["lib/player_actions/skills/playeractionstockholmsyndrometrade"] = "lua/player_actions/skills/playeractionstockholmsyndrometrade.lua",
	
	["lib/units/cameras/fpcameraplayerbase"] = "lua/units/cameras/fpcameraplayerbase.lua",
	
	["lib/units/enemies/cop/copdamage"] = "lua/units/enemies/cop/copbrain.lua",
	["lib/units/enemies/cop/copdamage"] = "lua/units/enemies/cop/copdamage.lua",
	
	["lib/units/pickups/ammoclip"] = "lua/units/pickups/ammoclip.lua",
	
	["lib/units/weapons/akimboweaponbase"] = "lua/units/weapons/akimboweaponbase.lua",
	["lib/units/weapons/flamethrowereffectextension"] = "lua/units/weapons/flamethrowereffectextension.lua",
	["lib/units/weapons/newflamethrowerbase"] = "lua/units/weapons/newflamethrowerbase.lua",
	["lib/units/weapons/newraycastweaponbase"] = "lua/units/weapons/newraycastweaponbase.lua",
	["lib/units/weapons/raycastweaponbase"] = "lua/units/weapons/raycastweaponbase.lua",
	["lib/units/weapons/sawweaponbase"] = "lua/units/weapons/sawweaponbase.lua",
	
	["lib/units/weapons/grenades/fraggrenade"] = "lua/units/weapons/grenades/fraggrenade.lua",
	
	["lib/units/weapons/shotgun/newshotgunbase"] = "lua/units/weapons/shotgun/newshotgunbase.lua",
			
	["lib/utils/inventorydescription"] = "lua/utils/inventorydescription.lua"
}

function DMCWO:SaveSkills()
	local file = io.open( self._data_path_skills, "w" )
	if file then
		file:write( json.encode( self._data_skills ) )
		file:close()
	end
end
function DMCWO:LoadSkills()
	local file = io.open( self._data_path_skills, "r" )
	if file then
		self._data_skills = json.decode( file:read("*all") )
		file:close()
	end
end

function DMCWO:Save()
	local file = io.open( self._data_path, "w" )
	if file then
		file:write( json.encode( self._data ) )
		file:close()
	end
end
function DMCWO:Load()
	local file = io.open( self._data_path, "r" )
	if file then
		self._data = json.decode( file:read("*all") )
		file:close()
	end
end

DMCWO:Load()
DMCWO:LoadSkills()
Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_DMC", function( menu_manager )
	MenuCallbackHandler.DMCWOLogSpam = function(self, item)
		DMCWO._data.stfu = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
		

	MenuCallbackHandler.DMCWOPlayerSkills = function(self, item)
		DMCWO._data_skills.havel_mum = (item:value() == "on" and true or false)
		DMCWO:SaveSkills()
	end
	
	
	MenuCallbackHandler.DMCWOWeaponsTracers = function(self, item)
		DMCWO._data.sniper_tracers = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOWeaponsLightShow = function(self, item)
		DMCWO._data.light_show = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	--
	MenuCallbackHandler.DMCWOWeaponsBipodSwivel = function(self, item)
		DMCWO._data.no_bipod_swivel = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOWeaponsBipodAutodeploy = function(self, item)
		DMCWO._data.bipod_ads_autodeploy = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOWeaponsBipodUndeploy = function(self, item)
		DMCWO._data.bipod_wasd_undeploy = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	
	
	MenuCallbackHandler.DMCWOStringsRealNames = function(self, item)
		DMCWO._data.reelnames = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOStringsUpotte = function(self, item)
		DMCWO._data.upotte = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOStringsOcelot = function(self, item)
		DMCWO._data.ocelot = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	
	
	MenuCallbackHandler.DMCWOAttachHideBrakes = function(self, item)
		DMCWO._data.hide_brakes = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOAttachHideSGBrakes = function(self, item)
		DMCWO._data.hide_sg_brakes = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOAttachHidePisFlash = function(self, item)
		DMCWO._data.hide_pis_flash = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	--
	MenuCallbackHandler.DMCWOAttachBUISSwap = function(self, item)
		DMCWO._data.buis_swap = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	--
	MenuCallbackHandler.DMCWOAttachS552Rear = function(self, item)
		DMCWO._data.sg552_rear = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOAttachS552Handguard = function(self, item)
		DMCWO._data.sg552_handguard = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOAttachS552Stock = function(self, item)
		DMCWO._data.sg552_stock = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	MenuCallbackHandler.DMCWOAttachS552Grip = function(self, item)
		DMCWO._data.sg552_grip = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	--
	MenuCallbackHandler.DMCWOAttachM95Bipod = function(self, item)
		DMCWO._data.m95_bipod = (item:value() == "on" and true or false)
		DMCWO:Save()
	end
	
	DMCWO:Load()
	DMCWO:LoadSkills()
	MenuHelper:LoadFromJsonFile( DMCWO._path .. "options/m_menu.txt", DMCWO, DMCWO._data )
	MenuHelper:LoadFromJsonFile( DMCWO._path .. "options/strings.txt", DMCWO, DMCWO._data )
	MenuHelper:LoadFromJsonFile( DMCWO._path .. "options/skills.txt", DMCWO, DMCWO._data_skills )
	MenuHelper:LoadFromJsonFile( DMCWO._path .. "options/weapons.txt", DMCWO, DMCWO._data )
	MenuHelper:LoadFromJsonFile( DMCWO._path .. "options/attachments.txt", DMCWO, DMCWO._data )
	MenuHelper:LoadFromJsonFile( DMCWO._path .. "options/attachments_s552.txt", DMCWO, DMCWO._data )
	MenuHelper:LoadFromJsonFile( DMCWO._path .. "options/attachments_m95.txt", DMCWO, DMCWO._data )
end )

function DMCWO:ResetOptions()
	self._data.stfu = false
		
	self._data.sniper_tracers = false
	self._data.light_show = false
	--
	self._data.no_bipod_swivel = false
	self._data.bipod_ads_autodeploy = false
	self._data.bipod_wasd_undeploy = false
		
	self._data.reelnames = true
	self._data.upotte = false
	self._data.ocelot = false
	
	self._data.hide_brakes = false
	self._data.hide_sg_brakes = false
	self._data.hide_pis_flash = false
	--
	self._data.buis_swap = false
	--
	self._data.sg552_rear = false
	self._data.sg552_handguard = false
	self._data.sg552_stock = false
	self._data.sg552_grip = false
	--
	self._data.m95_bipod = false
	
	DMCWO:Save()
end

function DMCWO:ResetOptionsSkills()
	self._data_skills.havel_mum = false
	DMCWO:SaveSkills()
end

if DMCWO._data.stfu == nil
or DMCWO._data.sniper_tracers == nil
or DMCWO._data.light_show == nil
or DMCWO._data.no_bipod_swivel == nil
or DMCWO._data.bipod_ads_autodeploy == nil
or DMCWO._data.bipod_wasd_undeploy == nil
or DMCWO._data.reelnames == nil
or DMCWO._data.upotte == nil
or DMCWO._data.ocelot  == nil
or DMCWO._data.hide_brakes == nil
or DMCWO._data.hide_sg_brakes == nil
or DMCWO._data.hide_pis_flash == nil
or DMCWO._data.buis_swap == nil 
or DMCWO._data.sg552_rear == nil 
or DMCWO._data.sg552_handguard == nil 
or DMCWO._data.sg552_stock == nil 
or DMCWO._data.sg552_grip == nil 
or DMCWO._data.m95_bipod == nil 
then 
	DMCWO:ResetOptions() 
end

if DMCWO._data_skills.havel_mum == nil then
	DMCWO:ResetOptionsSkills() 
end

if RequiredScript then
    local script = RequiredScript:lower()
    if DMCWO.Hooks[script] then
        dofile(DMCWO._path .. DMCWO.Hooks[script])
    end
end

--[[ DEBUG/WIP SETTINGS ]]--{
--Really these are just for me for development and testing purposes but I figure why not? The default setting for all of these are "false"

--I RECOMMEND THAT YOU ENABLE THE ENGINE CONSOLE (unless you feel like reading the log)
--YOU MAY GET PERFORMANCE DROPS WHILE USING THIS WITH AUTOMATIC FIRE
--If set to true, outputs various statistics from each shot taken from a "newraycastweaponbase" gun into the console/log
--Shots into the open skybox are not tracked
--"newshotgunbase" guns are only tracked on impact with enemy units
DMCWO.debug_range = false

--If set to true, disables ALL damage boosts from skills (or at least tries to)
DMCWO.debug_damage = false

--If set to true, viewmodel positioning while UNAIMED is changed to emulate DOOM
--Attached optics have a pretty good chance of getting in the way so you should remove them before hand
--Overrides hipfire/crouched stance changes from "reposed_vms" if that is active
--WIP
DMCWO.doomguy = false

--If set to true, gets rid of the ammo purse reload system for box magazine/belt fed weapons. Reloading before emptying your current magazine will discard any rounds left in that magazine.
--The chambered round is taken into consideration (if the weapon is closed bolt) and will not be lost if doing a non-empty reload
--The Beretta 682/Joceline is excluded from this despite using the "magazine" reload system as you keep your second shell loaded when you perform a non-empty reload.
--NOTE: This does NOT play well with Tasers. When you get tased, it runs the reload code to top up your mag before a Taser makes you dump it all. Guess what happens...
--WIP
DMCWO.no_ammo_purse = false


--If set to true, enables the ELCAN Specter to use the BUIS on the top of the optic. 
--Default = false
--NOTE: Enabling this will remove the 45 degree irons if they're attached, disallow it from being attached along with the ELCAN scope and will take the place as the first gadget you switch to with the laser and/or flashlight gadget becoming the second and/or third gadget you switch to
--NOTE 2: You'll also get a floating 45 degree angle gadget in the main menu and mod screen, it's a side effect of having the BUIS actually work
--WIP
DMCWO.elcan_buis = false

--[[
If GEDDAN is set to true, weapons will now have a chance to jam
	-No, it's not like having Goonmod's "Crappy Weapons" mutator
		-But it's still a pain in the ass :^)
	-To explain, after shooting your weapon a certain amount of times (this varies per weapon), it will become susceptible to jamming, forcing you to perform an "empty" reload
	-Shooting while under the effects of Bulletstorm Basic/Aced will disable the chance for jamming for the length of its duration nor will it cause your jam chance to rise
		-However, Swan Song will NOT disable the chance for jamming and shots fired in this state will still cause your jam chance to rise
	-Your weapon's jam chance will eventually cap off at a certain percent (again, this varies per weapon)
If both GEDDAN and l85a1_sim are both set to true, the L85A2 will perform more akin to the L85A1
	-i.e. just use your secondary and/or melee instead
	-Seriously though, how do you fuck up a rifle so bad that the GERMANS (H&K) can't fix it.
WIP
]]
DMCWO.GEDDAN = false
DMCWO.l85a1_sim = false
--}

--[[ WEAPON SETTINGS ]]--{

--Repositions the viewmodels of most weapons so they're in a more realistic position and not to the far-far right of your body. Also reduces clipping in some instances
--Intended for use with a maximized FOV slider (using the default slider ranges) although it'll still work with any FOV setting
--If false, you'll probably encounter floating arms and/or camera clipping
--Default = true
DMCWO.reposed_vms = true

--If set to true, allows attachments that modify ammo pickup to be affected by Walk-in-Closet or Fully Loaded Aced
--Default = false
DMCWO.fix_pickup = false

--If set to true, switches the Taurus Judge to act as a pistol and use pistol skills
--NOTE: Damage and RoF are adjusted depending on the setting
--Default = true
DMCWO.judge_pistol = true

--If set to true, enables burst memory for AR-15 rifles
--Default = true
DMCWO.ar15_burst_suckage = false
--}

--[[ MELEE SETTINGS ]]--{

--If set to true, allows for melee weapons to benefit from headshot multipliers 
--Thanks go to SC
--Do not use this in conjunction with M.O.RE's melee headshot multipliers
--Default = true
DMCWO.melee_hs = true

--If set to true, all characters can dice up cloakers with the katana
--Default = false
DMCWO.all_dismember_cloaker = false

--If set to true, using the fists allows you to turn into Kenshiro from Hokuto No Ken (Fist of the North Star)
--"AAAH-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA"
--Alternatively, become Star Platinum
--"ORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORA"
--Default = false
DMCWO.kenshiroraoraora = false

--If set to true, become Raiden
--To be more descriptive, doubles the swing speed of the katana but you deal half the damage/knockdown
--Default = false
DMCWO.RULESOFNATURE = false
--AND THEY RUN WHEN THE SUN COMES UP
--WITH THEIR LIVES ON THE LINE
--}

--[AK type weapons]--{
--If set to true, when low power optics are attached to an AK type weapon, the gun is pulled up closer for optics to be in-line with the other guns. 
--NOTE: Higher powered optics like the Specter, ACOG, Short Dot and Leupold will always be held close to the player camera while ADS, regardless of this being true or false
--Default = false
DMCWO.ak_optics = false

--If set to true, all occurences of the underfolding stock being default on AK type weapons is changed to the sidefolding stock and the sidefolding stock attachment is changed to the Underfolder. Makes more sense from a stability standpoint too
--Default = false
DMCWO.akmsu_stock_switch = false
DMCWO.akm_stock_switch = false
DMCWO.saiga_stock_switch = false
DMCWO.rpk_stock_switch = false
--}

--[AR15 type weapons]--{
--If set to true, changes the upper receiver on the M16 and Para SMG/AR to the A2 upper receiver.
--Default = false
--NOTE: The empty reload for the Para SMG/AR are kinda broken when you use this (charging handle does not move). If I set it to move it looks even worse due to the timing being really off
DMCWO.a2_upper = false

--Makes it so the front post gas block for the AMCAR/M733, AMR/M16 and Para/Olympic stay even when an optic is attached (with the exception of the two sniper scopes) and IRL, actually be able to function (removing the gas block prevents the bolt from cycling and would pretty much turn the gun into a bolt action rifle). 
--Default = true
DMCWO.ar_front_post = true

--If set to true, sets the Long Barrel for the CAR-4/M4A1 to use the Beowulf barrel connection point, making it appear slightly shorter. 
--Default = false
DMCWO.m4_barrel = false

--If set to true, visually breaks the AMCAR upon attaching the Exotique/VLTOR upper reciever, even more so if you dettach it. A bug I'm keeping in as a toggle at the request of friends during pre-release. If you toggled while it's broken/not broken, just reattach the Exotique/VLTOR upper. 
--Default = false
DMCWO.its_fucked = false
--}

--[M249]--{
--If set to true, sets the M249 short and long barrels to use the G3 barrel models to match the rest of the black barrel. 
--Default = false
DMCWO.m249_barrel = false
--}

--[KSG]--{
--If set the true, changes the gadget location on the KSG to only ever be on the side of the pump and not in front of your optic if one is attached. 
--Default = true
DMCWO.ksg_gadget = true
--}

--[Judge]--{
--If set to true, set the pistol grip on the judge to that of the one on the Raging Bull. 
--Default = false
DMCWO.judge_grip = false
--}

--[Model 870]--{
--If set to 1, hides the R870 tube cap extension on the R870. 
--If set to 2, sets the R870 tube cap extension to the one used on the Loco. 
--Any other value uses the default R870 tube cap. 
--Default = "0"
DMCWO.remington_cap = 0

--If set to 1, hides the Loco tube cap extension on the Loco. 
--If set to 2, sets the Loco tube cap extension to the one used on the R870. 
--Any other value uses the default Loco tube cap. 
--Default = "0"
DMCWO.loco_cap = 0
--}

--}

	
--Random messages
--Which line can you get in your log/console? :^)
DMCWO.Strings = {
"List of awful things to do to Kawaii:\n[x]Cloaker choking Kawaii\n[ ]Shields bashing into Kawaii\n[ ]Taser tasing Kawaii\n[ ]Dozer beating up Kawaii", 
"Jiisuri is is mai raifu~", 
"Don't get yourself in a pickle!", 
"Kawaii heister when?", --never ;_;
"I'd a Kawaii",
"\"My love for you is like a truck, Berserker\" \n\"Would you like some making fuck, Berserker\" \n\"My love for you is like a rock, Berserker\" \n\"Berserker\"",
"\"I WILL GIVE YOU MY ALL\"",
"Noep-roblems here!",
"\"Kono lolicon domome!\"",
"\"Filthy lolicon scum!\"",
"\"There are no buses in Gensokyo!\"", --https://www.youtube.com/watch?v=GNeyqFfXf7k
"Cirno must taste good...", --https://www.youtube.com/watch?v=JUBbigtfCWs
"\"PETTAN PETTAN TSURUPETTAN\"", --https://www.youtube.com/watch?v=hfUe2eckPFQ
"*tips fedora*",
"\"At this moment I am euphoric...\"",
"Guys, the thermal drill, go get it...",
"Guys, the thermal drill, go get it...",
"Guys, the thermal drill, go get it...",
"Guys, the thermal drill, go get it...",
"Guys, the thermal drill, go get it...",
"\"I put sode\"",
"ONE",
"\"MOOOOM! GET THE CAMERAAAA!\"",
"\"GRAND DAD?!\"",
"Butts",
"\"But I poop from there!\"\n\"Not right now you don't!\"",
"My Uncle survived a mustard gas attack and pepper spray. He's quite the seasoned veteran.",
"DONUT STEEL",
">implying",
"pls",
"\"Do you like hurting other people?\"",
"\"Do you know what time it is?\"",
"\"IT'S TIME TO D-D-D-D\"\n\"DU-DU-DU-DUEL\"",
"Why is this here?",
"Is that a FAMAS?",
"Is that a Deagle?",
"Is that a M16?",
"\"WOMBO COMBO\"",
"\"STUPID FAGGOT LITTLE COCKSUCKER\"", --https://www.youtube.com/watch?v=nLmsVBgZiak
"\"Have you ever tried to fuck a box?\"", --https://www.youtube.com/watch?v=VXiavai0ZLU
"\"SUMONE JUMPDE FRUM DEE BEELDEENG!\"", --https://www.youtube.com/watch?v=GU3Gg696yrM
"ebin :DDD",
"\"Nice meme\"",
"\"CARLOS!!!\"",
"kys",
"\"That ain't Falco!\"",
"\"What is a man?\"\n\"A miserable little pile of secrets...\"",
"\"The cake is a lie\"",
"You suck and we hate you \nLove, H&K",
"I'll Heckle your Koch",
"What a Koch sucker",
"\"Hot meme\" \n\"is cold\"",
"\"This one time at band camp...\"",
">tfw I'm stuck with a toaster laptop",
"\"I'm 12 and what is this?\"",
"\"AH NU, CHEEKI BREEKI IV DAMKE!!\"",
"\"What is love? Baby don't hurt me, don't hurt me, no more!",
"Pre-B CZ75 NOW",
"My friend in the army lost his left arm to an explosion. Thankfully he's all right now.",
"AA2 HGOTY, all year, every year",
"\"Lightning bolt, lightning bolt, lightning bolt!!\"",
"\"topkek\"",
"*Insert bad pun here*",
"\"ayy lmao\"",
"\"IMPREGNATE MY ASS!!!\"", --https://www.youtube.com/watch?v=XpeyDCsLarg
"\"GAY DICK SEX\"", 
"\"420 BLAZE IT\"", --http://420.moe/
"Would you Nep a Nep Nep? \nBecause I would...",
"\"2spooky4me\"",
";)",
":3c",
">tfw I can't have mai raifu in Canada",
"What're you doing reading this?",
"\"SILENCIO?\"",
"\"ECH\"",
"DumbMoronicCunt",
"DerangedMasochistCuck",
"DudeMyCar",
"DeanMannChester",
"DefinitelyMakesClocks",
"DemonMightCry",
"DastardlyManiacalCorpse",
"DeliciousMuffinCakes",
"Don'tMindCarl",
"\"LOLI HAET PIZZA\"",
"\"ORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORA\"",
"\"MUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDA\"",
"\"RERORERORERORERORERORERORERORERORERORERORERORERORERORERORERORERORERORERORERORERORERORERORERORERO\"",
"\"AAAATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATATA\"",
"fugg da bolis :DDD",
"That cop was one swood guy!",
"\"YOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO!\"", --https://www.youtube.com/watch?v=0T6go6EOuG4
"I'll Boku your Pico",
"\"It's all ogre for you\"",
"DMCWO.stfu = true",
"MUH STOPPAN POWAH",
"RIP IN PIECE",
"\"GO! GO! GO! GO! GO! GO! GALO SENGEN!\"", --https://www.youtube.com/watch?v=1EKTw50Uf8M
"<3",
"\"Ka ka~\"", --https://www.youtube.com/watch?v=nCnd2tmhnuw
"DMC's todo list for 20xx:\n[x]draw more\n[x]draw more porn\n[ ]lrn2code\n[ ]get a real PC",
"wich 2hu wud u fuk?",
"\"Baka baka, baka baka\"",
"Kek la Kek",
"merde",
"\"NUUUDIST BEECHOO\"",
"\"Now its personel!\"",
"Callie is better",
"Aori is better",
"Marie is better",
"Hotaru is better",
"Why not both squid sisters?",
"\"Are you a kid?\"\n\"Or a squid?\"",
"\"YOU'RE A KID NOW, YOU'RE A SQUID NOW, YOU'RE A KID, YOU'RE A SQUID, YOU'RE A KID NOW\"",
"\"SPLATATATATATATATATATATATATATATATA SPLATOON\"",
"I'd an Inkling...",
"Get your \"First Aid Kit\" here ~<3", -->tfw drawing lewd Kawaii pictures
"\"THE SAFEWORD IS \'POLICE BRUTALITY!\'\"", --curiosity killed the cat, okay?
"R.I.P. Yandere Snake 2015-2016",
"I'd Nonon's nonos",
"COMPLETELY OVERKILL DISSAPOINTMENT",
";)",
";)",
"\"Your opinion, my choice\"",
";)",
";)",
"\"Shame on you if you thought otherwise\"",
";)",
";)",
"\"You don't get to decide balance\"",
";)",
";)",
"$2.49",
"Based LazyOzzy",
"Based Seven",
"Based Zdann",
"\"Dickbutt\"",
"\"What what, in the butt\"",
"\"Her name is Koko, she is loco, I said oh no!\"", --https://www.youtube.com/watch?v=IIn63BNIncE
"\"I have no need for filthy language and idle threats...\"",
"Anime is for losers!", -- ;)
"How long until this gets old?", -- Once
"\"Jonaaaah!\"",
"\"Weapon, I have it all!\"",
"I need to draw more often...",
"ISHYGDDT",
"28 DOWNS",
"\"Funco-chan!\"",
"[x]Touch fluffy tail",
"PUFFY VULVA",
":B1:",
"Kail: can you update dmcwo\nKail: thx\nRaifuism: no\nRaifuism: :^)\nKail: ill pay you\nRaifuism: pay me in :B1:s\nKail: ill pay you in sex\nRaifuism: again?", -- :^)
"\"You expected a cute girl? Too bad! It's just me, text!\"",
"\"SNAAAAAKE EEAAATERRRR!!!\"",
"The BUALLS",
"SAKO RK95 when?", --https://www.youtube.com/watch?v=Q-rEJys-Vnc
"\"git gud\"",
"\"Gimme da chocolate, Hisao\"",
"\"DOZER INCOMING\"",
"dat floor tho", --le Rustle faec
"Rustle is a damn good artist",
"\"fuck being superman, I have the power of /k/ in my hands\" - /pdg/ Anon No.148191216",
"\"CRAAAAAWLING IIIIN MY CRAAAAAAAAWL!!!\"",
"More lood Kawaii pictures when?",
"hOI!",
"DETERMINATION",
"NYEH HEH HEH!",
"\"is this the flowey map?\"",
"I'd a Frisk",
"ANIME IS REAL",
"ANIME IS NOT REAL",
"Where are the knives?",
"Why are fryfaced characters so good?",
"shekelfest 2015",
"You shit talking mai raifu, Slowpork?",
":^)",
"\n   ^\n  ^^^\n:^^^^^)",
"Why make lua scripts when you can draw porn?",
"What the fuck did you just fucking say about me, you little bitch?\nI'll have you know I graduated top of my class in the Navy Seals, and I've been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills.\nI am trained in gorilla warfare and I'm the top sniper in the entire US armed forces.\nYou are nothing to me but just another target.\nI will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words.\nYou think you can get away with saying that shit to me over the Internet?\nThink again, fucker.\nAs we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot.\nThe storm that wipes out the pathetic little thing you call your life.\nYou're fucking dead, kid.\nI can be anywhere, anytime, and I can kill you in over seven hundred ways, and that's just with my bare hands.\nNot only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit.\nIf only you could have known what unholy retribution your little \"clever\" comment was about to bring down upon you, maybe you would have held your fucking tongue.\nBut you couldn't, you didn't, and now you're paying the price, you goddamn idiot.\nI will shit fury all over you and you will drown in it.\nYou're fucking dead, kiddo.\n", --https://www.youtube.com/watch?v=jnp3AgXP0dU
"\"ITTY BITTY BABBY\"",
"\"ITTY BITTY BOAT\"",
"\"I DON'T BELIEVE IT\"",
"\"HABEEB IT\"",
}

if not DMCWO._data.stfu then
	if not DMCWO.dongs then
		log( "\n" .. tostring(DMCWO.Strings[math.random(#DMCWO.Strings)]) .. "\n" )
		DMCWO.dongs = true
	end
end

--[[
local notif_id = "dmcwo_notif"
local title = "DMCWO v1.80"
local upd_message = upd_message or function()
	NotificationsManager:UpdateNotification( notif_id, nil, tostring(DMCWO.Strings[math.random(#DMCWO.Strings)]) )
end
NotificationsManager:AddNotification( notif_id, title, tostring(DMCWO.Strings[math.random(#DMCWO.Strings)]), 1, upd_message )
]]