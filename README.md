#DMC's Weapon Overhaul v1.42: AND MY NAME IS JOHN CENA edition
####[DO DOO DOO DOOOOOOOO](https://www.youtube.com/watch?v=4QCm__n5oko)
######[Hoxhud Hook Branch](https://github.com/DeadMansChest/DMCWO)
######[BLT Hook Branch](https://github.com/DeadMansChest/DMCWO/tree/BLT-Version)
by: Don't Care Mister

[UC Thread](http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html) 

[Steam group](http://steamcommunity.com/groups/DMCWpnOverhaul)

**_Not for use in Pasta Perfection_** 
(Not that it really could, most of this is just tweaked LUA source values, something PP already does on top of stealing actual code)

##DISCLAIMER
Despite being out of pre-release, I'm still changing things left right and center, don't get too used to things
Also don't blame me if OVK or other players get on your case, use this mod in pubs at your own risk.


##What do?
This mod is **NOT** meant to make the game easier (or at least not a whole lot easier) but _I'd still class this as a form of cheating_.

The point of this mod is to fully overhaul and "rebalance" the weapons in PD2 so that nothing is truely useless (RPK/HK21, AK5/AMCAR, Reinfeld), horribly overpowered compared to other weapons similar to themselves like the M249 (as of the courier pack), the CAR-4 (even more so with the courier pack) or the Locomotive (the best fucking shotgun, nothing beats it) or become some ugly as fuck thing to make a decent build.

tl;dr I got rid of the fucking dumb shitass meta bullshit that made the game all of 4-5 guns and made it so you don't have to worry too much about making an eldritch abomination of a gun. You should be perfectly capable running the base gun.

It also puts weapon classes in their place as all bullet weapons now have damage drop-off. For example something like a 9mm pistol will perform extremly poorly against a sniper perched way on the other side of the map because even if you do manage to hit them, you`ll be dealing only around 30% of your normal damage.

NOTE: I didn't and won't be making concealment value modifications for vanilla attachments as that number is calculated by the host who more than likely won't be using this. I don't want to bring the false impression that you have "x" concealment when you really have "y" concealment.

I **HIGHLY** recommend you **NOT** try this mod until after reaching level 85-ish (when the grind _really_ starts) for the first time, this batch of scripts changes the whole dynamic on how to build weapons, more than likely making your current builds non-optimal or flat-out obsolete.


##CREDITS & THANKS
* v00d00 for the LUA source code
* 90e for the LUA source code, base code for the fixed fire loop sounds
* gir489 for LUA source code, LMG ironsights 
* 420Munk for LUA source code
* YaPh1l for LUA source code
* LazyOzzy for the fixed shotgun pellet mechanics, fixed drop-off code, other code advice
  * Also for allowing me to include the burst-fire script
  * While not in this mod, the crosshair code to help me locate the center of the screen for centering optics
* B1313 for the shotgun push physics, code advice
* old string hijack code thanks to hejoro
* newer string hijack code thanks to Wobin Ralker and Melting Terminal
* Lizard Foe for fixes made in gat_physics.lua
* Harfatus/Olipro for the OG lua hook
* Wilko for the BLT lua hook
* IMFDB and Payday Wikia for weapon names and attachments I couldn't ID
* /k/ anon for semi-solidifiying some of the attachment names
  Anon: Low Profile Suppressor might be a gemtec halo with a different attachment system but idk im getting buttflustered with you lol
  Me: tfw we've been pretty much on the same page as to what the IRL counterparts are
  Me: I'm in pain (from laughing)
  Anon: I hate you, anon wants recognition for his internet fu ;_;
* DMC for tweaking and testing and tweaking and testing all the gun/attachment stats to meta levels
  * Also not me for buying a tablet and spending time on that drawing porn instead of updating this mod
* My Steam friends for being my guinea pigs for pre-release testing (0.1a)
* Not Illusion for making AA2 which has been distracting me from doing work on this mod as well
  * I'm kidding. 10/10, 10/10, 100/100, Best game, BEST GAME
  * https://www.youtube.com/watch?v=5Qx_q_TCVoE
  * Illusion's newly announced game, Sexy Beach Premium Resort, will probably take the title as my big time-waster like AA2 was
    * :^)
* Any and all users of this mod as they're pretty much telling OVK to consider rebalancing their weapons

	
Did I forget to credit you or improperly do so? Sorry if I did :> Bug the shit out of me, and tell me what I forgot to credit/I miscredited you for.


##Recommended Mods
I put in here w/e I saw fitting to go with this mod:

Scripts from based Ozzy:
  * [Ozzy's Generalized Ammo Fix](http://www.unknowncheats.me/forum/payday-2/122695-ammo-pickup-changes.html)
  * [Weapon gadget remembers last state script](http://www.unknowncheats.me/forum/990407-post24.html)
  * [Underdog Aced fix](http://www.unknowncheats.me/forum/payday-2/129527-underdog-fix.html)
  * [Burst Fire](http://www.unknowncheats.me/forum/payday-2/130566-burst-fire.html)
    * It's now intergrated into this mod but if you don't want DMCWO then you can still have Ozzy's original script
	
Other LUA mods:
  * [Karate F22's Better Weapon Stats GUI](http://steamcommunity.com/groups/PD2-BWS-GUI)
    * This is actually more or less of a requirement if you don't want the stats wigging out when you have skills affecting them too
  * [Kail's PROJECT: Canary](http://steamcommunity.com/groups/projectcanary)
  * [Undeadsewer's Melee Overhaul REvamped (M.O.RE)](http://steamcommunity.com/groups/PD2_MORE)
  * [lekousin's Armor Overhaul](http://steamcommunity.com/groups/lekousinAO)
  * [SquareOne's instant bullet impact fix](http://www.unknowncheats.me/forum/payday-2/118472-fixing-bullet-delayed-hit-effects.html) 
    * May cause frame drops on lower end PCs if you use shotgun rounds that have high ray counts

Required for the following: [i am not a spy...'s bundle mod tool](http://steamcommunity.com/app/218620/discussions/15/540744936746354308/)
  * [i am not a spy...'s HD 3rd Person Weapons](http://steamcommunity.com/app/218620/discussions/15/558754900072790886/)
  * [Sandman's Enemy and Civilian Leg and Arm Hitboxes](http://steamcommunity.com/app/218620/discussions/15/35222218813407100/)

mod_override things:
  * [Bob_760's Gun Skins](http://steamcommunity.com/app/218620/discussions/15/558755529942726277/)
  * [Dude_47's FN FAL Wooden Foregrip and Wooden Stock remake](http://steamcommunity.com/app/218620/discussions/15/35221031752086261/)
	
	
##Standalone Parts
There are standalone versions of some parts of DMCWO available on [my Github repo](https://github.com/DeadMansChest) if you don't want (or like) the whole shebang DMCWO offers.
	* Excuse the lewd avatar if it is a lewd one at the time
	

##Scripts
**REQUIRED PERSIST SCRIPTS**:
  * rebalance_general.lua:
    * Required for rebalance.lua to run
    * Changes the index tables to be more consistent rather than randomly go up to higher values halfway through the index
    * Some skill adjustments
		
  * rebalance.lua:
    * Needs rebalance_general.lua to make a successful run first before it runs itself
    * Required for rebalance_attach.lua to run
    * Gage Pack #2 LMG ironsight codes by gir489
    * Changes the base weapon stats for most weapons
    * Properly aligns ironsights for some weapons (AK5, Deagle and a few others)
		
  * rebalance_attach.lua*:
    * Needs rebalance.lua to make a successful run first before it runs itself
    * Contains a bunch of toggles that affect the appearances of some guns and attachments
    * Changes the stats for most weapon mods as well as fixing a few bugs in the base game
	
	
**REQUIRED POSTREQUIRE SCRIPTS**:
  * postrequire_attach.lua
    * Adds the additional attachments for some weapons
	* Adds the specialized ammo for bullet weapons 
	
  * soundsfix.lua
    * Original fix by 90e
    * Makes all guns use their single fire sound on a per shot basis in place of the constantly desyncing full auto loop sound
	
  * shotgat_physics.lua
    * Fixed shotgun mechanics from LazyOzzy
    * Shotgun physics from B1313
    * Makes shotguns deal damage on a per pellet basis	
		
  * gat_physics.lua
    * Damage drop-off for bullet weapons, fixed by LazyOzzy
    * Wall penetraton for all bullet weapons, based on damage and a few other variables
		
  * recoil_fix.lua:
    * This file can also be set up as a persistent script if you want to test different values without restarting each time you change it
    * Reduces the floaty/ghost recoil you experience for some weapons, mainly high recoil weapons that have a high ROF
    * Contains a multiplier value you can adjust which changes how much recoil you recover from. 
			1 = 100% recoil recovery, your gun will settle down back to its original postion from where you initially fired from provided you didnt try to compensate
			0 = 0% recoil recovery, your gun will stay wherever recoil brings you
			
  * realnames.lua:
    * Changes most weapons, weapon mods and melee weapons to use their IRL name
    * Also adds in rather vital descriptions to some attachments that modify guns beyond their stat charts
	
**OPTIONAL POSTREQUIRE SCRIPTS**:			
  * tact_reload.lua:
    * Made with the help of B1313
    * Allows for round chambering on closed bolt weapons
	
  * useable_drums.lua (Contained inside the "Extra" folder):
    * Makes drum mags attachable through the mod menu
      * They don't have icons and when dropped through a card they look weird as hell
			
			
##INSTALLING
1. Nab Harfatus' LUA Hook if you haven't already (you can get it from HoxHud I think)
-OR-
Nab Wilko's "BLT" LUA Hook if you haven't from here: http://paydaymods.com/download/

2. Download the Repo contents as a zip and extract into your Payday 2 directory
  * Be sure to dl the correct branch! Links you your hook's version are at the top of this readme!

3. Run game, check log for errors. Report errors to me (steam_id/qt_314) if there are any


##General Changes

Redone Accuracy and Stabilty stats!
  * These stats now scale from 0 to 99
    * 90 accuracy is akin to 18 accuracy in the vanilla game for most weapons
	* 80-ish stability is akin to 25 stability in the vanllia game
	
Additional attachments!!!
  * LMGs:
    * HK21:
      * Optics for ARs
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * Wood Stock from the G3
    * M249:
      * Optics for ARs
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
    * RPK:
      * Optics for ARs
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * AK-type pistol grips
      * PSL Stock
      * Side-Folding AK stock
    * etc...
	
  * Assault Rifles:
    * K23B (secondary):
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * Solid Stock from the Loco (appears as the M16's solid stock)
      * Folding Stock from the M4A1
    * M733:
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * Vector Optics RIS Handguard from the K23B (takes the appearance of the default M4A1 railed handguard)
      * VLTOR Upper Reciever
      * AR-type pistol grips
      * Solid Stock from the Loco (appears as the M16's solid stock)
      * Folding Stock from the M4A1
    * M4A1
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * Solid Stock from the Loco (appears as the M16's solid stock)
    * AKS-74:
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * Solid Stock from the Loco (appears as the RPK's wood stock)
      * Polymer handguard from the RPK
    * AKMS (& Gold variant)
      * 75-round Drum Magazine (if you use useable_drums.lua)
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * Solid Stock from the Loco (appears as the RPK's wood stock)
      * Polymer handguard from the RPK
    * AKMSU (secondary):
      * 75-round Drum Magazine (if you use useable_drums.lua)
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * Solid Stock from the Loco (appears as the RPK's wood stock)
    * etc...
	
  * Battle Rifles:
    * M14 DMR:
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
    * FN FAL:
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
    * H&K G3:
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * Retractable Stock from the MP5A4
    * Galil ARM:
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
    * etc...
		
  * Shotguns:
    * R870:
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * Loco Tube extension (+1 round)
    * Short R870 (Loco):
      * Leupold Scope
      * 45 degree sights
      * Shortdot Scope from the C96
      * R870 Tube extension (+2 rounds)

  * And more... a word of warning though

#WARNING BELOW
I **CANNOT** stress this enough, 

**BACK UP YOUR SAVE** (more so because this is modding 101, this is unlikely to break your save, even if you don't heed my warning below)

and 

**DO NOT REMOVE OR DISABLE "postrequire_attach.lua"**

If you have ANY of the extra attachments attached to your current gun(s), there is a chance you'll crash if you try to play using it or equip another gun with extra attachments attached.

With that said, UNINSTALL or DISABLE this mod if a major game update is planned to be released soon and you want to play it immediately.
This mod *WILL* break new weapons as the mod *WILL NOT* have the new entries for any new weapons/attachments and as a result make then very buggy to use if not completely unuseable, if any (which in that case you should be safe to keep this installed. Wouldn't take the risk, IMO).

I'm not gonna take heat if your game crashes because of this, I'll have warned you several times by the time you read this whole readme.

There is an uninstall guide further down
#WARNING ABOVE

Got that? Okay...

All bullet weapons now have damage drop-off
  * They will never hit 0 damage like shotguns do
  * Pistols are less effective at range than say, an SMG
  * SMGS are less effective at range than ARs, etc...

Muzzle brakes, handguards and everything else no longer magically alter damage (because stupid). Damage adjustments are now only changed via things that change the actual length of the barrel (HK21 handguard, actual barrel mods, etc.)
  * Made damage reduction for all suppressors the same, instead, the larger suppressors will have added benefits like lower recoil and accuracy boosts at the cost of concealment
    * Tweaked the "Silent Killer" skill to make suppressors not the best barrel extension to use
      * This generally will make it so basic will nullify the damage reduction, give or take, while ace WILL boost damage (albeit slight, nothing big to push you past a damage breakpoint)
    * Asepsis Suppressor has no benefits as a trade off for no damage reduction and lower concealment
  * All suppressors completely nullify threat and hurt your damage profile at range
    *The exception is frag rounds for shotguns which will max out any shotgun's threat regardless of suppressors

Longer barrels increase stats for concealment, shorter ones vice versa
	
Corrected magazine capacities:
  * The Olympic AR and M16 use proper 20 round magazines (from 25 and 30)
  * The FAMAS uses a proper 25 round magazine (from 30)
  * The HK21 uses a proper 100 round box magazine (from 150)
  * The MG42 uses a proper 50 round drum magazine (from 150)

Mag capacities were made consistent so mags like the AR Quadstack Mag will set ammo to 60 for all guns that can accept it

Shotguns now do damage per pellet instead of dealing full damage as long as one pellet hits (Thanks to LazyOzzy). As a result, shotgun pellet damage has been nerfed down to the 20s since dealing 65 damage for all 8 pellets is far too much but overall does more damage if all land on target.
  * Shotgun pellet count was changed to 8 for all shotguns
    * Excluding the Judge which shoots 5 pellets
    * Pellet count will vary depending on the special ammo used
  * Shotgun pellet range was increased, around 20-40m in game, drop off was made to start much, much earlier to compensate
  * More realistic spread patterns for shotguns. Git gud at aiming!
  * Damage stat was changed to show damage if all pellets hit within optimal range
			
Better melee weapons
  * Higher swing/stab speeds
  * Higher damage for some (i.e. the Machete)
  * Bladed weapons under the "axe" category are changed to the "knife" category, allowing you to hurt dozers with them
  * Can actually help you conserve ammo

Bullet penetration for most non-snipers!!
  * Surface penetration
    * All bullet weapons (penetration power varies)
    * Shotguns using slugs
  * Enemy penetration
    * All (Sniper) rifles
    * All Assault rifles
    * All LMGs
    * All Battle Rifles
    * Mac 10
    * P90
    * MP7
    * AKMSU
    * Olympic AR
    * USP Tactical
    * 1911
    * Raging Bull
    * Colt SAA
    * Desert Eagle
    * C96
    * 2006M
    * Shotguns using slugs
  * Tan armor penetration (penetration chance varies by weapon)
  * Shield penetration
    * All (Sniper) rifles
    * All Battle Rifles
    * HK21
    * MG42
    * Raging Bull
    * Colt SAA
    * 2006M
    * Desert Eagle
    * P90
    * MP7
    * Shotguns using slugs

Greatly reduced ADS sway for all weapons since it does nothing to the actual PoI

True/false toggles for some asethetic mods (you can change them at the top of the rebalance_attach.lua)

Random fixes:
  * Tried my best at realigning all the optics and iron sights
  * G18 slide now moves while aiming and shooting
  * 1911 irons now move while aiming and shooting
  * Removed the gadget rail attachment on some guns that would otherwise be pointless and clip through some attachments/guns
  * Changed the Saiga reciever cover to the AK74 receiver to better ressemble an actual Saiga
  * All battle rifles start on semi-auto, not just the M14
  * The G18 starts on semi-auto to prevent accidental mag dumping upon starting
  * Mosin now has a mount for the Theia/Leupold Scope
  * And a bunch of other things
	
Renamed almost everything with their IRL counterparts (or the closest thing)

Fleshed out weapon categories

Renamed mod categories
		
Reclassed several weapons
  * The Para AR and AKMSU are now classed as "assault_rifles"
    * They're still secondaries, only now they benefit from AR skills instead of the two SMG skills and appear under the renamed category "Assault Rifles & Carbines"
  * The Judge is now classed as a "pistol"
    * Now benefits from pistol based skills
      * No longer benefits from shotgun skills, bumped the damage up to compensate
  * The Tec-9 is also a pistol now
	
	
##UNINSTALLING
Don't like the mod for w/e reason? You're following my advice about uninstalling/disabling this mod if an update is known to come out soon? Penis? Read below:

1. REMOVE ANY OF THE EXTRA ATTACHMENTS NOT NORMALLY AVAILABLE ON GUNS IN THE VANILLA GAME

2. REMOVE ANY OF THE EXTRA ATTACHMENTS NOT NORMALLY AVAILABLE ON GUNS IN THE VANILLA GAME

3. REMOVE ANY OF THE EXTRA ATTACHMENTS NOT NORMALLY AVAILABLE ON GUNS IN THE VANILLA GAME, SERIOUSLY

4. Close the game

5. Remove "DMCWO.lua" and the "DMCWO" folder inside lib/lua/
-OR-
Remove the "DMCWO" folder inside mods/ (or disable the mod though the "Lua Mods" menu provided by the BLT hook

6. If you dun dang diddly did everything right, next time you boot up your game everything should be back to normal (or at least not make the game crash)

Keep in mind, parts of some guns may be missing after an uninstall. You can easily fix this by selling and repurchasing the gun


##KNOWN ISSUES
Any issues I know of but can't personally fix because I can't code will be listed here

* Optics attached to the M249 and MG42 don't follow the feed cover when reloading.

* In rebalance_attach.lua, if "elcan_buis" is set to true, you'll see the 45 degree irons floating in the main menu. A side effect on how I got the BUIS toggle working.
    * I also don't update this as often as I should so some guns may not work with it


##BUG REPORTING
Please notify me of any bugs/issues not listed above. I will say now, bugs are most likely to happen with some optics as they have a lot of toggles associated with them on top of me having to manually adjust them to the center of the screen.

If it is a bug with sight positioning, please give me:

  * Any other toggle that changes sights and/or their positioning (if the weapon in question is associated with any of them)
  * The gun with the bugged optic
  * The bugged optic
	
If it's something else, tell me if:

[DMCWO] All "rebalance" scripts are running!!

is appearing in your log
	
Thanks ;)


###EXTRA
* Want the SILENCIO??/STEALT (ghost) symbol in your name? Here: 
