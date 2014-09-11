[[Weapon Overhaul v0.4.1: We Upotte!! now Edition]]
"G3 is mai raifu~"
by: DMC

****Not for use in Pasta Perfection (Not that it really could, most of this is just tweaked LUA source values,something PP already does on top of stealing code)****

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%[[[DISCLAIMER]]]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

This mod is in its alpha stages, possibly lower. Sadly, I can't guarantee the stability of your game while running this as I'm still changing things left, right and center and I know jack shit about coding in LUA (works so far though and I haven't gotten the game to crash from an unknown result)

================================[[Wat do?]]================================
This mod is NOT meant to make the game easier (or at least not a whole lot easier)

The point of this mod is to fully overhaul and "rebalance" the weapons in PD2 so that nothing is truely useless (RPK/HK21, AK5/AMCAR, Reinfeld), horribly overpowered compared to other weapons similar to themselves (M249 (as of the courier pack), CAR-4 (even more so with the courier pack), Locomotive (the best fucking shotgun, nothing beats it) or become ugly as fuck to make a decent build.

NOTE: I didn't and won't be making concealment value modifications as that number is calculated by the host who more than likely won't be using this. I don't want to bring the false impression that you have "x" concealment when you really have "y" concealment. 
That said, I don't know what happens with the extra attachments and their concleament values on guns they're not normally available on so I'd be careful playing pub matches using guns with extra attachments

****I HIGHLY recommend you NOT try this mod until after reaching level 85-ish (when the grind REALLY starts) for the first time, this batch of scripts changes the whole dynamic on how to build weapons, more than likely making your current builds non-optimal or flat-out obsolete

================================[[Credits & Thanks]]================================
>>v00d00 for the LUA source code
>>90e for the LUA source code, base code for the fixed fire loop sounds
>>gir489 for LUA source code, LMG ironsights 
>>LazyOzzy for the fixed shotgun pellet mechanics, code advice
	-While not in this mod, the crosshair code to help me locate the center of the screen for centering optics
>>B1313 for the shotgun push physics, code advice
>>hejoro for the string hijack code
>>HoxHud devs for the enemy health and damage indicators to guide me with weapon damage
>>IMFDB and Payday Wikia for weapon names and attachments I couldn't ID
>>/k/ anon for semi-solidifiying some of the attachment names
	Anon: Low Profile Suppressor might be a gemtec halo with a different attachment system but idk im getting buttflustered with you lol
	Me: tfw we've been pretty much on the same page as to what the IRL counterparts are
	Me: I'm in pain (from laughing)
	Anon: I hate you, anon wants recognition for his internet fu ;_;
>>DMC (Me) for tweaking and testing and tweaking and testing all the gun/attachment stats for optimal use on the Overkill difficulty
	-Also not me for buying a tablet and spending time on that drawing smut instead of updating this mod
>>My Steam friends for being my guinea pigs for pre-release testing (0.1a)
>>Not Illusion for making AA2 which has been distracting me from doing work on this mod as well
	-I'm kidding. 10/10, 10/10, 100/100, Best game, BEST GAME
	-https://www.youtube.com/watch?v=5Qx_q_TCVoE
>>You for what is pretty much testing this mod
	
-Did I forget to credit you? Sorry if I did :> Bug the shit out of me, and tell me what I forgot to credit you for.

================================[[Recommended Mods]]================================
I put in here w/e I saw fitting to go with this mod:

***90e's Improving firing loop sounds: http://www.unknowncheats.me/forum/payday-2/116619-improving-looped-fire-sounds.html
	***HIGHLY reccomend you use this or the version I posted otherwise the ROF for some guns will desync heavily from the firing sounds

-i am not a spy...'s bundle mod tool: http://steamcommunity.com/app/218620/discussions/15/540744936746354308/
	-i am not a spy...'s HD 3rd Person Weapons: http://steamcommunity.com/app/218620/discussions/15/558754900072790886/
	-Bob_760's Black Gun Skins: http://steamcommunity.com/app/218620/discussions/15/558755529942726277/
	-  's FN FAL Wooden Foregrip and Wooden Stock remake :http://steamcommunity.com/app/218620/discussions/15/35221031752086261/
	-"Sandman"'s Enemy and Civilian Leg and Arm Hitboxes: http://steamcommunity.com/app/218620/discussions/15/35222218813407100/

-LazyOzzy's weapon gadget remembers last state script: http://www.unknowncheats.me/forum/990407-post24.html
-LazyOzzy's Fully Loaded aced works with all shotgun ammo types: http://www.unknowncheats.me/forum/payday-2/118182-fully-loaded-all-ammo-types.html

-SquareOne's instant bullet impact fix. May cause frame drops on lower end PCs if you shoot a surface near you, especially with high ROF guns or with the new flechette rounds: http://www.unknowncheats.me/forum/1002847-post1.html

-My own "script" that removes the auto-restting recoil (among other things you can tweak): http://www.unknowncheats.me/forum/payday-2/121404-remove-auto-resetting-recoil-and-other-stuff.html

================================[[INSTALLING]]================================

1. Nab Harfatus' LUA Hook .dll if you haven't already (Just take IPHLPAPI.dll from Hoxhud or something)

2a. Make a new folder, we'll call it "WpnOverhaul" for this example

OR

2b. Open your already existing script folder

3. Drop the following into your "WpnOverhaul"/your already existing script folder:

	-rebalance_general *new file, TestVar is "RebalanceGen"
		-Just has several 'for' loops that were originally in rebalance.lua to lighten the load if I (or you) made rebalance.lua constantly run to make in-game adjustments
	
	-rebalance.lua
		-Gun fixes
	
	-rebalance_attach.lua
		-Attachment stuffs
			*There are toggles in here which you can change to your liking at the top of the file. More on this futher down.
	
	-postrequire_attach.lua
		-attachments and other additions
		
	-shotgat_physics.lua 
		-Fixes the shotgun mechanics and prevents cops from flying when #shrekt with a face full of buckshot (or makes them fly even more, there's a value within that you're free to change, don't set it too high though as you'll make the physics engine flipout and drastically reduce your FPS, possibly even crash the game)
	
	-realnames.lua 
		-Changes gun and attachment names to their real life counterparts (or the closest thing I could ID them to)
	
	
	==OPTIONAL FILE==
	
	-soundsfix.lua
		-Code from 90e, fixed by moi
		-Fixes the firing sound by making the single fire sound play with each shot instead of using the full auto loop that always desyncs

4. Open up your .yml file (located in the same folder as the .exe of PD2 if you installed the hook correctly) and add these lines under their respective sections:

PersistScripts:
 - [RebalanceGen, <folder name>\rebalance_general.lua]  
 - [RebalanceScript, <folder name>\rebalance.lua]  
 - [RebalanceAtchScript, <folder name>\rebalance_attach.lua]
 - [Shotty, <folder name>\shotgat_physics.lua]
 - [ReelNames, <folder name>\realnames.lua]
 
PostRequireScripts:
 - ['lib/managers/weaponfactorymanager', <folder name>\postrequire_attach.lua]
 - ['lib/units/weapons/RaycastWeaponBase', <folder name>\soundsfix.lua]
 
***If you don't know how to write up your YML, read the stickies on UC***

5. Run game, check log for errors (report errors to me if there are any)


================================[[General Changes]]================================

-Additional attachments!!!
	-Optics for LMGs
		NOTE: Optics on the M249 will not follow the feed cover while reloading, don't know if I can fix this as this is an animation thing
	-All ARs, LMGs, Shotguns and SMGs can now accept the 45 degree iron sights and the Theia scope
	-LMGs can now accept suppressors
	-The SCAR can now accept the Rubber Grip
	-The AMCAR can now accept most of the CAR-4/AMR attachments
	-The Chimano 88 can now use the 2 extra Stryk compensators
	-The Street Sweeper, AUG and P90 can accept the MBUS sights from the KSG
	-And more...

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%[[[WARNING BELOW]]]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I CANNOT stress this enough, ****BACK UP YOUR SAVE**** and ****DO NOT REMOVE**** this mod (or at least NOT disable the postrequire script) if you have ANY of the extra attachments attached to your gun, you MIGHT crash if you try to play using it or equip another gun with the extra attachments attached

With that said, UNINSTALL this mod if a major game update is planned to be released soon and you want to play it immediately as this mod has a chance to break it as it will not have the new entries for any new weapons/attachments, if any (which in that case you should be safe to keep this installed. Wouldn't take the risk, IMO).

I'm not gonna take heat if your game crashes because of this, I'll have warned you several times by the time you read this whole readme

UPDATE: I've noticed that after one of the updates, either for the game itself or when I changed the postrequire to add things via "table.insert", if you disable the postrequire script, any attachments on your gun that were added by that script are removed. Not 100% sure if that is the case and I'd still advise you remove this mod before an update hits.

There is an uninstall guide further down

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%[[[WARNING ABOVE]]]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Got that? Okay...

-Muzzle brakes, handguards and everything else no longer magically alter damage (because stupid). Damage adjustments are now only changed via alternate the HK21 short handguard, G36 carbine handguard, alternate barrel lengths and suppressors
	-Made damage reduction for all suppressors the same, instead, the larger suppressors will have added benefits like lower recoil and accuracy boosts at the cost of concealment
		-Tweaked the "Silent Killer" skill to make suppressors not the best barrel extension to use (10% Basic, 20% Aced)
			-This generally will make it so basic will nullify the damage reduction or give a small damage boost while ace WILL boost damage
		-Asepsis Suppressor has no benefits as a trade off for no damage reduction and lower concealment
	-Adjusted weapon damage to be optimal for the Overkill difficulty or more (within reason)
		-Partial support for the Deathwish difficulty
			-Still, not everything is viable but you have more freedom to choose what you want compared to the vanilla game which has all of 3-4 gun that are even useable on DW

-The Para SMG and AMR-16 use proper 20 round magazines

-Mag capacities were made consistent so mags like the AR Quadstack Mag will set ammo to 60 for all guns that can accept it
	NOTE: Guns with a default mag capacity less than 30 will read as only adding x + 30 (i.e. 20 round default will appear as 50 if you add the Quadstack mag to it)
		-The name of the magazine has the most accurate reading of how much ammo the gun will hold in-game

-Shotguns now do damage per pellet instead of dealing full damage as long as one pellet hits (Thanks to LazyOzzy). As a result, shotgun pellet damage has been nerfed down to the 20s since dealing 65 damage for all 8 pellets is far too much but overall does more damge if all land on target.
	-Shotgun pellet count was changed to 8 for all shotguns
		-Excluding the Judge which shoots 5 pellets
	-Shotgun pellet range was increased, around 20-40m in game, drop off was made to start much, much earlier to compensate
	-More realistic spread patterns for shotguns. Git gud at aiming!
	-Damage stat was changed to show damage if all pellets hit within optimal range (1 meter for all shotguns)
	#GAGE SHOTGUN PACK AMMO CHANGES
		-000 Buck
			-Reduced the negative ammo pickup multiplier (0.95 low, 1 high)
			-Removed total ammo count reduction
			-+40 damage
			-Shoots 6 pellets instead of 8
				-4 for the Judge
			-Drop-off starts practically immediately instead of 1m
			-Long range capabilities reduced by 15%
			-Slightly decreased accuracy/increased spread
		-Flechette 
			-Higher ammo pickup rate (1.0 low, 1.025 high)
			--20 damage
			-Shoots 12 pellets (darts) instead of 8
				-8 for the Judge
			-Drop-off starts at 2.5m instead of 1m
			-Long range capabilities increased by 50%
			-Increased accuracy
			-Tan armor penetration
		-Slugs
			-Reduced the negative ammo pickup multiplier (0.9 low, 0.95 high)
			-Small total ammo count reduction
			-+20 damage
			-Greatly increased accuracy
			-Long range capabilities increased by 250%
			-Wall, shield, enemy and tan armor penetration
		-Frag
			-Reduced the negative ammo pickup multiplier (0.85 low, 0.9 high)
			-Large total ammo count reduction (still less than the vanilla ammo reduction)
			-Slightly increased accuracy
			-Max threat level
			-Long range capabilities increased by 250%
			
-Better melee weapons
	-Higher swing/stab speeds
	-Higher damage
	-The Tomahawk and Machete can hurt Dozers
	-Can actually help you conserve ammo

-Bullet penetration for most non-snipers!!
	-Surface penetration
		-All Assault rifles
		-All LMGs
		-All Battle Rifles
		-Mac 10
		-P90
		-MP7
		-AKMSU
		-Olympic AR
		-Pistols in .40S&W or greater
			-Glock 22c
			-P226
			-USP Tactical
			-1911
			-Raging Bull
			-Desert Eagle
		-Shotguns using slugs
	-Enemy penetration
		-Same as wall penetration excluding the Glock 22c and the P226
		-Shotguns using slugs
	-Tan armor penetration (penetration chance varies by weapon)
		-Shotguns using flechette
	-Shield penetration
		-HK21
		-FAL
		-SCAR
		-M14
		-G3
		-Galil
		-Raging Bull
		-P90
		-MP7
		-Shotguns using slugs

-Greatly reduced ADS sway for all weapons since it does nothing to the actual PoI

-Toggles for some asethetic mods (you can change them at the top of the attach_rebalance.lua)

-Random fixes:
	-Tried my best at realigning all the optics and iron sights
	-G18 slide now moves while aiming and shooting
	-1911 irons now move while aiming and shooting
	-Removed the gadget rail attachment that would otherwise be pointless and clip through some attachments/guns
	-Changed the Saiga reciever cover to the AK74 receiver to better ressemble an actual Saiga
	-All battle rifles start on semi-auto, not just the M14
	-The G18 starts on semi-auto to prevent accidental mag dumping upon starting
	
-Renamed everything with their IRL counterparts (or the closest thing)

-Renamed weapon categories
		-"Assault Rifle" is now called "Assault Rifles & Carbines"
		-"Sniper Rifle" is now called "Sniper Rifles & Battle Rifles"
		-"Light Machine Gun" is now called "Light Machine Guns"
		-"Pistol" is now called "Pistols"
		-"Submachine Gun" is now called "Submachine Guns & PDWs"
		-"Shotgun" is now called "Shotguns"

-Renamed mod categories
		-"Custom" is now called "Internal Mods"
		-"Foregrip" is now called "Handguards"
		-"Slide" is now called "Pistol Barrels & Slides"
		-"Extra" is now called "Rails"
		-The rest have just been made plural, excluding "Magazine" as that also changes the string in the stat chart
		
-Reclassed several weapons
	-The Para AR and AKMSU are now classed as "assault_rifles"
		-They're still secondaries, only now they benefit from AR skills instead of the two SMG skills and appear under the renamed category "Assault Rifles & Carbines"
	-The Judge is now classed as a "pistol"
		-Now benefits from pistol based skills
			-No longer benefits fron shotgun skills, bumped the damage up to compensate
	-The M14, SCAR, FAL, G3 and Galil are now classed as "snipers"
		-They still benefit from AR skills as Overkill programmed snipers to benefit from AR skills, they're just grouped with snipers under the renamed category "Sniper Rifles & Battle Rifles"
	
================================[[UNINSTALLING]]================================
Don't like the mod for w/e reason? You're following my advice about uninstalling this mod if an update is known to come out soon? Penis? Read below:

1. REMOVE ANY OF THE EXTRA ATTACHMENTS NOT NORMALLY AVAILABLE ON GUNS IN THE VANILLA GAME

2a. Remove the "WpnOverhaul" folder (assuming this is where you put it based on the install guide at the top of this readme)

OR

2b. Remove:
	-rebalance_general
 	-rebalance.lua
	-rebalance_attach.lua
	-postrequire_attach.lua
	-shotgat_physics.lua 
	-realnames.lua 
	-soundsfix.lua (you can keep this one though, this is more or less what Overkill should have done in the first place)

	from w/e folder you shoved them in if you decided to put them alongside other scripts
	
3. Remove the following lines from your .yml file (assuming you entered them in as they are in the install guide at the top):

 - [RebalanceGen, <folder name>\rebalance_general.lua]  
 - [RebalanceScript, <folder name>\rebalance.lua]  
 - [RebalanceAtchScript, <folder name>\rebalance_attach.lua]
 - [Shotty, <folder name>\shotgat_physics.lua]
 - [ReelNames, <folder name>\realnames.lua]
 - ['lib/managers/weaponfactorymanager', <folder name>\postrequire_attach.lua]
 - ['lib/units/weapons/RaycastWeaponBase', <folder name>\soundsfix.lua] (again, you can keep this one as this is more or less what Overkill should have done in the first place)
 
4. If you dun dang diddly did everything right, next time you boot up your game everything should be back to normal (or at least not make the game crash)
	Keep in mind, parts of some guns may be missing after an uninstall (notably the M16 upper receiver if you left nam_upper to "true"). You can easily fix this by selling and repurchasing the gun

================================[[KNOWN ISSUES]]================================
Any issues I know of but can't personally fix because I can't code will be listed here

-Killing cops with low health with a shotgun will send them flying, especially with flechette rounds. Any help with this would be appreciated


================================[[BUG REPORTING]]================================
Please notify me of any bugs/issues not listed above. I will say now, bugs are most likely to happen with some optics as they have a lot of toggles associated with them on top of me having to manually adjust them to the center of the screen.

If it is a bug with sight positioning, please give me:

	-Your sig_rear_iron state (T/F) and your ak_optics state (again, T/F)
	-The gun with the bugged optic
	-The bugged optic
	
Thanks ;)

================================[[EXTRA]]================================

-Want the stealth symbol in your name? Here: 

-If you use HoxHud for w/e reason, paste this over your sniper angled sight coordinates inside HoxHudTweakData.lua:

	self.sniper_angled_sight_rotation    = { msr =  Rotation( 0, 0, -10 ),
											m95 = Rotation( 0, 0, -10 ), 
											r93 = Rotation( 0, 0, -10 ), 
											hk21 = Rotation( 0, 0, -10 ), 
											m249 = Rotation( 0, 0, -10 ), 
											rpk = Rotation( 0, 0, -10 ), 
											akm = Rotation( 0, 0, -10 ),
											akmsu = Rotation( 0, 0, -10 ),
											ak74 = Rotation( 0, 0, -10 ),
											akm_gold = Rotation( 0, 0, -10 ),
											saiga = Rotation( 0, 0, -10 ),
											amcar = Rotation( 0, 0, -10 ),
											new_m4 = Rotation( 0, 0, -10 ),
											m16 = Rotation( 0, 0, -10 ),
											aug = Rotation( 0, 0, -10 ),
											new_m14 = Rotation( 0, 0, -10 ),
											scar = Rotation( 0, 0, -10 ),
											fal = Rotation( 0, 0, -10 ),
											new_mp5 = Rotation( 0, 0, -10 ),
											mp9 = Rotation( 0, 0, -10 ),
											mp7 = Rotation( 0, 0, -10 ),
											m45 = Rotation( 0, 0, -10 ),
											olympic = Rotation( 0, 0, -10 ),
											p90 = Rotation( 0, 0, -10 ),
											serbu = Rotation( 0, 0, -10 ),
											r870 = Rotation( 0, 0, -10 ),
											mac10 = Rotation( 0, 0, -10 ),
											g36 = Rotation( 0, 0, -10 ),
											ak5 = Rotation( 0, 0, -10 ),
											s552 = Rotation( 0, 0, -10 ),
											ksg = Rotation( 0, 0, -10 ),
											benelli = Rotation( 0, 0, -10 ),
											striker = Rotation( 0, 0, -10 ),
											}
																					
	self.sniper_angled_sight_translation = { msr = Vector3(-2, 0, -2), 
											m95 = Vector3(-2, 0, -5), 
											r93 = Vector3(-2, 0, -2), 
											hk21 = Vector3(-2, 0, -2), 
											m249 = Vector3(-2, 0, -2), 
											rpk = Vector3(-2, 0, -2),
											akm = Vector3(-2, 0, -2),
											akmsu = Vector3(-2, 0, -2),
											ak74 = Vector3(-2, 0, -2),
											akm_gold = Vector3(-2, 0, -2),
											saiga = Vector3(-2, 0, -2),
											amcar = Vector3(-2, 0, -2),
											new_m4 = Vector3(-2, 0, -2),
											m16 = Vector3(-2, 0, -2),
											aug = Vector3(-2, 0, -2),
											new_m14 = Vector3(-2, 0, -2),
											scar = Vector3(-2, 0, -2),
											fal = Vector3(-2, 0, -2),
											new_mp5 = Vector3(-2, 0, -2),
											mp9 = Vector3(-2, 0, -2),
											mp7 = Vector3(-2, 0, -2),
											m45 = Vector3(-2, 0, -2),
											olympic = Vector3(-2, 0, -2),
											p90 = Vector3(-2, 0, -2),
											serbu = Vector3(-2, 0, -2),
											r870 = Vector3(-2, 0, -2),
											mac10 = Vector3(-2, 0, -2),
											g36 = Vector3(-2, 0, -2),
											ak5 = Vector3(-2, 0, -2),
											s552 = Vector3(-2, 0, -2),
											ksg = Vector3(-2, 0, -2),
											benelli = Vector3(-2, 0, -2),
											striker = Vector3(-2, 0, -2),
											}
											
This will make the visual indication for the angled sight compatible with all guns that are able to use the angled sights and it will only tilt the gun slightly instead of bringing the gun up like you were aiming (because stupid)
