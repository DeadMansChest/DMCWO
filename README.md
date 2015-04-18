# DMC's Weapon Overhaul v1.3: yee Edition

yee

by: Diddle Middle Ciddle

UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html
Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul

**Not for use in Pasta Perfection** (Not that it really could, most of this is just tweaked LUA source values, something PP already does on top of stealing actual code.)

# Disclaimer

Despite being out of pre-release, I'm still changing things left right and center, don't get too used to things

# What do?

This mod is NOT meant to make the game easier (or at least not a whole lot easier) but I'd still class this s a form of cheating.

The point of this mod is to fully overhaul and "rebalance" the weapons in PD2 so that nothing is truely useless (RPK/HK21, AK5/AMCAR, Reinfeld), horribly overpowered compared to other weapons similar to themselves like the M249 (as of the courier pack), the CAR-4 (even more so with the courier pack) or the Locomotive (the best fucking shotgun, nothing beats it) or become ugly as fuck to make a decent build.

tl;dr I got rid of the fucking dumb shir meta bullshit that made the game all of 4–5 guns and made it so you don't have to worry about making an abomination of a gun.

**NOTE:** I didn't and won't be making concealment value modifications for vanilla attachments as that number is calculated by the host who more than likely won't be using this. I don't want to bring the false impression that you have "x" concealment when you really have "y" concealment. 

That said, extra attachments don't count towards your concealment if you're a client, so keep that in mind. You'll benefit from extra attachment concealment if you host or play solo.

I HIGHLY recommend you NOT try this mod until after reaching level 85-ish (when the grind REALLY starts) for the first time, this batch of scripts changes the whole dynamic on how to build weapons, more than likely making your current builds non-optimal or flat-out obsolete.

# Credits & Thanks

* v00d00 for the LUA source code
* 90e for the LUA source code, base code for the fixed fire loop sounds
* gir489 for LUA source code, LMG ironsights 
* 420Munk for LUA source code, LMG ironsights 
* LazyOzzy for the fixed shotgun pellet mechanics, fixed drop-off code, other code advice
  * While not in this mod, the crosshair code to help me locate the center of the screen for centering optics
* B1313 for the shotgun push physics, code advice
* hejoro for the string hijack code
* Harfatus for the lua hook
* IMFDB and Payday Wikia for weapon names and attachments I couldn't ID
* /k/ anon for semi-solidifiying some of the attachment names
* DMC for tweaking and testing and tweaking and testing all the gun/attachment stats to meta levels
  * Also not me for buying a tablet and spending time on that drawing porn instead of updating this mod
* My Steam friends for being my guinea pigs for pre-release testing (0.1a)
* Not Illusion for making AA2 which has been distracting me from doing work on this mod as well
  * I'm kidding. 10/10, 10/10, 100/100, Best game, BEST GAME
  * https://www.youtube.com/watch?v=5Qx_q_TCVoE
* Any and all users of this mod as they're pretty much testing this mod
	
Did I forget to credit you or improperly do so? Sorry if I did :> Bug the shit out of me, and tell me what I forgot to credit/I miscredited  you for.

# Recommended Mods

I put in here w/e I saw fitting to go with this mod:

Scripts from based Ozzy:
* Weapon gadget remembers last state script: http://www.unknowncheats.me/forum/990407-post24.html
* Fully Loaded aced works with all shotgun ammo types: http://www.unknowncheats.me/forum/payday-2/118182-fully-loaded-all-ammo-types.html
* Underdog Aced fix: http://www.unknowncheats.me/forum/payday-2/129527-underdog-fix.html
* Burst Fire: http://www.unknowncheats.me/forum/payday-2/130566-burst-fire.html
* Has support in this mod

SquareOne's instant bullet impact fix. May cause frame drops on lower end PCs if you use shotgun rounds that have high ray counts

Required for the following: i am not a spy...'s bundle mod tool: http://steamcommunity.com/app/218620/discussions/15/540744936746354308/
* i am not a spy...'s HD 3rd Person Weapons: http://steamcommunity.com/app/218620/discussions/15/558754900072790886/
* Sandman's Enemy and Civilian Leg and Arm Hitboxes: http://steamcommunity.com/app/218620/discussions/15/35222218813407100/

mod_override things:
* Bob_760's Black Gun Skins: http://steamcommunity.com/app/218620/discussions/15/558755529942726277/
* Dude_47's FN FAL Wooden Foregrip and Wooden Stock remake: http://steamcommunity.com/app/218620/discussions/15/35221031752086261/
	
# Standalone Parts

These are stand alone versions of some parts of DMCWO:

* Hide Brakes (ARs/SMGs/LMGs and Shotguns): http://steamcommunity.com/app/218620/discussions/15/624076027584693197/
  * Hides the muzzle brakes for ARs/SMGs/LMGs and Shotguns
* Keep AR-15 Front Post: http://steamcommunity.com/app/218620/discussions/15/616187203893400313/
  * Keeps the AR-15 front post on weapons that have them (M16, M733, Olympic AR) when an optic is attached
* Real Weapon & Mod Names: http://steamcommunity.com/app/218620/discussions/15/624076751559360274/
  * Pretty much renames most weapons and weapon mods to their real life counter parts (or the closest damn thing)
  * Not for use alongside DMCWO. This version doesn't have support for the name toggles or the changed descriptions and names that better represent the changes made in DMCWO (redone shotgun ammo descriptions, magazine capacity counts in the names)
* Properly Aligned Irons Sights & Optics: WIP
  * Realigns optics to the actual PoI for some weapons
	
# Scripts

**REQUIRED PERSIST SCRIPTS**
* `rebalance_general.lua`
  * Required for rebalance.lua to run
  * Changes the index tables to be more consistent rather than randomly go up to higher values halfway through the index
  * Some skill adjustments
* `rebalance.lua`
  * Needs rebalance_general.lua to make a successful run first before it runs itself
  * Required for rebalance_attach.lua to run
  * Gage Pack #2 LMG ironsight codes by gir489
  * Changes the base weapon stats for most weapons
  * Properly aligns ironsights for some weapons (AK5, Deagle and a few others)
* `rebalance_attach.lua`
  * Needs rebalance.lua to make a successful run first before it runs itself
  * Contains a bunch of toggles that affect the appearances of some guns and attachments
  * Changes the stats for most weapon mods as well as fixing a few bugs in the base game
	
**REQUIRED POSTREQUIRE SCRIPTS**
* `postrequire_attach.lua`
  * Adds the additional attachments for some weapons
* `soundsfix.lua`
  * Original fix by 90e
  * Makes all guns use their single fire sound on a per shot basis in place of the constantly desyncing full auto loop sound
* `shotgat_physics.lua`
  * Fixed shotgun mechanics from LazyOzzy
  * Shotgun physics from B1313
  * Makes shotguns deal damage on a per pellet basis	
* `gat_physics.lua`
  * Damage drop-off for bullet weapons, fixed by LazyOzzy
  * Wall penetraton for all bullet weapons, based on damage and a few other variables
	
**OPTIONAL POSTREQUIRE SCRIPTS**
* `real_names.lua`
  * Changes most weapons, weapon mods and melee weapons to use their IRL name
* `recoil_fix.lua`
  * This file can also be set up as a persistent script if you want to test different values without restarting each time you change it
  * Reduces the floaty/ghost recoil you experience for some weapons, mainly high recoil weapons that have a high ROF
  * Contains a multiplier value you can adjust which changes how much recoil you recover from. 
    * 1 = 100% recoil recovery, your gun will settle down back to its original postion from where you fired from
    * 0 = 0% recoil recovery, your gun will stay wherever recoil brings you
* `tact_reload.lua`
  * Made with the help of B1313
  * Allows for round chambering on closed bolt weapons
* `useable_drums.lua` (Contained inside the "Extra" folder):
  * Makes drum mags attachable through the mod menu
  * They don't have icons and when dropped through a card they look weird as hell

# Installing

1. Nab Harfatus' LUA Hook (IPHLPAPI.dll) if you haven't already (you can get it from HoxHud or PDTHHud)
2. Download the Repo contents as a zip and extract into your Payday 2 directory
3. Run game, check log for errors. Report errors to me if there are any

# Additional attachments
* LMGs:
  * HK21:
    * Optics for ARs
    * Leupold Scope
    * 45 degree sights
    * Shortdot Scope from the C96
    * Wood Stock from the G3
    * Titan QD Suppressor from the MSR
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
    * 75-round Drum Magazine (if you use `useable_drums.lua`)
    * Leupold Scope
    * 45 degree sights
    * Shortdot Scope from the C96
    * Solid Stock from the Loco (appears as the RPK's wood stock)
    * Polymer handguard from the RPK
  * AKMSU (secondary):
    * 75-round Drum Magazine (if you use `useable_drums.lua`)
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
    * Titan QD Suppressor from the MSR
  * FN FAL:
    * Leupold Scope
    * 45 degree sights
    * Shortdot Scope from the C96
    * Titan QD Suppressor from the MSR
  * H&K G3:
    * Leupold Scope
    * 45 degree sights
    * Shortdot Scope from the C96
    * Titan QD Suppressor from the MSR
    * Retractable Stock from the MP5A4
  * Galil ARM:
    * Leupold Scope
    * 45 degree sights
    * Shortdot Scope from the C96
    * Titan QD Suppressor from the MSR
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

## Warning

I **cannot** stress this enough, 

**BACK UP YOUR SAVE** (more so because this is modding 101, this is highly unlikely to break your save, even if you don't heed my warning below)

and 

**DO NOT REMOVE OR DISABLE `postrequire_attach.lua`**

if you have ANY of the extra attachments attached to your gun.
You WILL crash if you try to play using it or equip another gun with extra attachments attached

With that said, **uninstall** this mod if a major game update is planned to be released soon and you want to play it immediately.
This mod *will* break new weapons as the mod will not have the new entries for any new weapons/attachments and as a result make then very buggy to use if not completely unuseable, if any (which in that case you should be safe to keep this installed. Wouldn't take the risk, IMO).

I'm not gonna take heat if your game crashes because of this, I'll have warned you several times by the time you read this whole readme

There is an uninstall guide further down

# General changes
* All bullet weapons now have damage drop-off
  * They will never hit 0 damage like shotguns do
  * Pistols are less effective at range than say, an AR
* Muzzle brakes, handguards and everything else no longer magically alter damage (because stupid). Damage adjustments are now only changed via things that change the actual length of the barrel (HK21 handguard, actual barrel mods, etc.)
  * Made damage reduction for all suppressors the same, instead, the larger suppressors will have added benefits like lower recoil and accuracy boosts at the cost of concealment
  * Tweaked the "Silent Killer" skill to make suppressors not the best barrel extension to use (12.5% Basic, 25% Aced)
    * This generally will make it so basic will nullify the damage reduction, give or take, while ace WILL boost damage (albeit slight, nothing big to push you past a damage breakpoint)
  * Asepsis Suppressor has no benefits as a trade off for no damage reduction and lower concealment
  * All suppressors completely nullify threat
    * The exception is frag rounds for shotguns which will max out any shotgun's threat regardless of suppressors
* Corrected magazine capacities:
  * The Olympic AR and M16 use proper 20 round magazines (from 25 and 30)
  * The FAMAS uses a proper 25 round magazine (from 30)
  * The HK21 uses a proper 100 round box magazine (from 150)
  * The MG42 uses a proper 50 round drum magazine (from 150)
* Mag capacities were made consistent so mags like the AR Quadstack Mag will set ammo to 60 for all guns that can accept it
* Shotguns now do damage per pellet instead of dealing full damage as long as one pellet hits (Thanks to LazyOzzy). As a result, shotgun pellet damage has been nerfed down to the 20s since dealing 65 damage for all 8 pellets is far too much but overall does more damge if all land on target.
  * Shotgun pellet count was changed to 8 for all shotguns
    * Excluding the Judge which shoots 5 pellets
  * Shotgun pellet range was increased, around 20-40m in game, drop off was made to start much, much earlier to compensate
  * More realistic spread patterns for shotguns. Git gud at aiming!
  * Damage stat was changed to show damage if all pellets hit within optimal range (1 meter for all shotguns)
* Better melee weapons
  * Higher swing/stab speeds
  * Higher damage
  * The Tomahawk and Machete can hurt Dozers
  * Can actually help you conserve ammo
* Bullet penetration for most non-snipers!!
  * Surface penetration
    * All bullet weapons (penetration varies)
    * Shotguns using slugs
  * Enemy penetration
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
    * Desert Eagle
    * C96
    * Shotguns using slugs
  * Tan armor penetration (penetration chance varies by weapon)
  * Shield penetration
    * HK21
    * MG42
    * FAL
    * SCAR
    * M14
    * G3
    * Galil
    * Raging Bull
    * P90
    * MP7
    * Shotguns using slugs
* Greatly reduced ADS sway for all weapons since it does nothing to the actual PoI
* Toggles for some asethetic mods (you can change them at the top of the `rebalance_attach.lua`)
* Random fixes:
  * Tried my best at realigning all the optics and iron sights
  * G18 slide now moves while aiming and shooting
  * 1911 irons now move while aiming and shooting
  * Removed the gadget rail attachment that would otherwise be pointless and clip through some attachments/guns
  * Changed the Saiga reciever cover to the AK74 receiver to better ressemble an actual Saiga
  * All battle rifles start on semi-auto, not just the M14
  * The G18 starts on semi-auto to prevent accidental mag dumping upon starting
  * Mosin now has a mount for the Theia/Leupold Scope
  * Bunch of other things
* Renamed almost everything with their IRL counterparts (or the closest thing)
* Renamed weapon categories
  * "Assault Rifle" is now called "Assault Rifles & Carbines"
  * "Sniper Rifle" is now called "Sniper Rifles & Battle Rifles"
  * "Light Machine Gun" is now called "Light Machine Guns"
  * "Pistol" is now called "Pistols"
  * "Submachine Gun" is now called "Submachine Guns & PDWs"
  * "Shotgun" is now called "Shotguns"
* Renamed mod categories
  * "Custom" is now called "Internal Mod"
  * "Foregrip" is now called "Handguard"
  * "Slide" is now called "Pistol Barrel & Slide"
  * "Extra" is now called "Rail"
* Reclassed several weapons
  * The Para AR and AKMSU are now classed as "assault_rifles"
    * They're still secondaries, only now they benefit from AR skills instead of the two SMG skills and appear under the renamed category "Assault Rifles & Carbines"
  * The Judge is now classed as a "pistol"
    * Now benefits from pistol based skills
      * No longer benefits from shotgun skills, bumped the damage up to compensate
  * The Tec-9 is also a pistol now
  * The M14, SCAR, FAL, G3 and Galil are now classed as "snipers"
    * They still benefit from AR skills as Overkill programmed snipers to benefit from AR skills, they're just grouped with snipers under the renamed category "Sniper Rifles & Battle Rifles"

# Uninstalling

Don't like the mod for w/e reason? You're following my advice about uninstalling this mod if an update is known to come out soon? Penis? Read below:

1. REMOVE ANY OF THE EXTRA ATTACHMENTS NOT NORMALLY AVAILABLE ON GUNS IN THE VANILLA GAME
2. REMOVE ANY OF THE EXTRA ATTACHMENTS NOT NORMALLY AVAILABLE ON GUNS IN THE VANILLA GAME
3. REMOVE ANY OF THE EXTRA ATTACHMENTS NOT NORMALLY AVAILABLE ON GUNS IN THE VANILLA GAME, SERIOUSLY
4. Close the game
5. Remove `DMCWO.lua` and the DMCWO folder inside lib/Lua
6. If you dun dang diddly did everything right, next time you boot up your game everything should be back to normal (or at least not make the game crash)

Keep in mind, parts of some guns may be missing after an uninstall. You can easily fix this by selling and repurchasing the gun

# Known Issues

Any issues I know of but can't personally fix because I can't code will be listed here

* Optics attached to the M249 and MG42 don't follow the feed cover when reloading.
* Killing cops with low health with a shotgun will send them flying, especially with flechette rounds and ESPECIALLY with birdshot. Any help with this would be appreciated
* In `rebalance_attach.lua`, if "elcan_buis" is set to true, you'll see the 45 degree irons floating in the main menu. A side effect on how I got the BUIS toggle working.

# Bug Reporting

Please notify me of any bugs/issues not listed above. I will say now, bugs are most likely to happen with some optics as they have a lot of toggles associated with them on top of me having to manually adjust them to the center of the screen.

If it is a bug with sight positioning, please give me:
* Any other toggle that changes sights and/or their positioning (if the weapon in question is associated with any of them)
* The gun with the bugged optic
* The bugged optic
	
If it's something else, tell me if:

[DMCWO] All "rebalance" scripts are running!!

is appearing in your log
	
Thanks ;)

# Extra
Want the stealth symbol in your name? Here: 
