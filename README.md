#DMC's Weapon Overhaul v1.81: "Me, Me, Pump-a-rum" Edition
####[I'd pump her rum if you know what I mean ;)](https://www.youtube.com/watch?v=1wTndUgskZQ)
[Steam group](http://steamcommunity.com/groups/DMCWO)


##DISCLAIMER
Despite being out of pre-release, I'm still changing things left right and center, don't get too used to things
Also don't blame me if OVK or other players get on your case, use this mod in pubs at your own risk. Which brings me to...

#WARNING BELOW
I **CANNOT** stress this enough, 

**BACK UP YOUR SAVE** 

More so because this is modding 101. This mod is unlikely to break your save but better safe than sorry now, huh?
#WARNING ABOVE



Got that? Okay...



##What do?
This mod is **NOT** meant to make the game easier (or at least not a whole lot easier) but if you're against any form of gameplay changing mods then you'll probably want to avoid this.

The point of this mod is to fully overhaul the weapons in PD2 in a semi-realistic approach and made it so you don't have to worry too much about making an eldritch abomination of a gun. You should be perfectly capable running the base gun.

It also puts weapon classes in their place as all bullet weapons now have damage drop-off. For example something like a 9mm pistol will perform extremely poorly against a sniper perched way on the other side of the map because even if you do manage to hit them, you`ll be dealing only around 20-30% of your normal damage.

I **HIGHLY** recommend you **NOT** try this mod until after reaching level 85-ish (when the grind _really_ starts) for the first time, this batch of scripts changes the whole dynamic on how to build weapons, more than likely making your current builds non-optimal or flat-out obsolete.


##CREDITS & THANKS
* UnknownCheats as a whole <3
* v00d00 for the LUA source code
* 90e for the LUA source code, base code for the fixed fire loop sounds
* gir489 for LUA source code, LMG ironsights 
* 420Munk for LUA source code
* YaPh1l for LUA source code
* Great Big Bushy Beard for LUA source code
* LazyOzzy for the fixed shotgun pellet mechanics, fixed drop-off code, advice
  * Also for allowing me to include the burst-fire script
  * While not in this mod, the crosshair code to help me locate the center of the screen for centering optics
* B1313 for the shotgun push physics, advice
* old string hijack code thanks to hejoro
* newer string hijack code thanks to Wobin Ralker and Melting Terminal
* Lizard Foe for fixes made in gat_physics.lua
* Harfatus/Olipro for the OG lua hook
* Wilko for the BLT lua hook
* SC for melee HS and fire HS code, mod_override stuffs, advice
* Zdann for mod_override stuffs
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
    * Nvm, it was pretty shite. Probably the most in-depth grill creator from them yet though...
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
  * [Karate F22's Better Weapon Stats GUI](http://steamcommunity.com/groups/PD2-BWS-GUI) (NO LONGER BEING UPDATED)
    * This is actually more or less of a requirement if you don't want the stats wigging out when you have skills affecting them too
  * [Kail's PROJECT: Canary](http://steamcommunity.com/groups/projectcanary)
  * [Undeadsewer's Melee Overhaul REvamped (M.O.RE)](http://steamcommunity.com/groups/PD2_MORE)
  * [lekousin's Armor Overhaul](http://steamcommunity.com/groups/lekousinAO)
  * [SC's Mod](http://steamcommunity.com/groups/sc_mod)
  * [SquareOne's instant bullet impact fix](http://www.unknowncheats.me/forum/payday-2/118472-fixing-bullet-delayed-hit-effects.html) 
    * May cause frame drops on lower end PCs if you use shotgun rounds that have high pellet counts

Required for the following: [i am not a spy...'s bundle mod tool](http://steamcommunity.com/app/218620/discussions/15/540744936746354308/)
  * [i am not a spy...'s HD 3rd Person Weapons](http://steamcommunity.com/app/218620/discussions/15/558754900072790886/)
  * [Sandman's Enemy and Civilian Leg and Arm Hitboxes](http://steamcommunity.com/app/218620/discussions/15/35222218813407100/)

mod_override things:
  * [Bob_760's Gun Skins](http://steamcommunity.com/app/218620/discussions/15/558755529942726277/)
  * [Dude_47's FN FAL Wooden Foregrip and Wooden Stock remake](http://steamcommunity.com/app/218620/discussions/15/35221031752086261/)
	
	
##Standalone Parts
There are standalone versions of some parts of DMCWO available on [my Github repo](https://github.com/DeadMansChest) if you don't want (or like) the whole shebang DMCWO offers.
	* Excuse the lewd avatar if it is a lewd one at the time
				
			
##INSTALLING
1. Nab Wilko's "BLT" LUA Hook if you haven't from here: http://paydaymods.com/download/
2. Download the contents as a zip and extract into your Payday 2 directory
3. Run game, check log for errors. Report errors to me (steam_id/qt_314) if there are any


##General Changes
* Redone Accuracy and Stabilty stats
* Additional attachments
* All bullet weapons now have damage drop-off
* Muzzle brakes, handguards and everything else no longer magically alter damage (because that's just stupid). Damage adjustments are now only changed via things that change the actual length of the barrel (HK21 handguard, actual barrel mods, etc.)
* Corrected magazine capacities
* Mag capacities were made consistent so mags like the AR Quadstack Mag will set ammo to 60 for all guns that can accept it
* Shotguns now do damage per pellet instead of dealing full damage as long as one pellet hits (Thanks to LazyOzzy). As a result, shotgun pellet damage has been nerfed down to the 20s since dealing 65 damage for all 8 pellets is far too much but overall does more damage if all land on target.		
* Slightly more believable melee weapons
* Bullet penetration for most non-snipers!!
* Greatly reduced ADS sway for all weapons since it does nothing to the actual PoI (well now it does in vanilla but only when using an optic)
* True/false toggles for some aesthetic mods (you can change them in DMCWO.lua)
* Random fixes
* Renamed almost everything with their IRL counterparts (or the closest thing)
* Fleshed out weapon categories
* Renamed mod categories
* Reclassed several weapons
	
	
##UNINSTALLING
Don't like the mod for w/e reason? You're following my advice about uninstalling/disabling this mod if an update is known to come out soon? Penis? Read below:

1. Close the game
2. Remove the "DMCWO" folder inside mods/ (or disable the mod though the "Lua Mods" menu provided by the BLT hook
3. If you dun dang diddly did everything right, next time you boot up your game everything should be back to normal (or at least not make the game crash)

Keep in mind, parts of some guns and sometimes the gun itself may be missing after an uninstall. This is because OVK inserted code in a recent update to delete weapons with invalid attachments attached to them, to avoid crashes.


##KNOWN ISSUES
Any issues I know of but can't personally fix because I can't code will be listed here

* Optics attached to the M249, M240 and MG42 don't follow the feed cover when reloading.
* In DMCWO.lua, if "elcan_buis" is set to true, you'll see the 45 degree irons floating in the main menu. A side effect on how I got the BUIS toggle working.


##BUG REPORTING
Please notify me of any bugs/issues not listed above. I will say now, bugs are most likely to happen with some optics as they have a lot of toggles associated with them on top of me having to manually adjust them to the center of the screen.

If it is a bug with sight positioning, please give me:

* Any other toggle that changes sights and/or their positioning (if the weapon in question is associated with any of them)
* The gun with the bugged optic
* The bugged optic
	
If it's something else, just tell me how it do the do (or rather how it don't do the do)
	
Thanks ;)


###EXTRA
* Want the SILENCIO??/STEALT (ghost) symbol in your name? Here: 
