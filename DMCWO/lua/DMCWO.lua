--[[
DMC's Weapon Overhaul
v1.34
BLT Hook Version
]]
if not DMCWO_Setup then
	
	DMCWO = {}
	DMCWO.Setup_Stfu = false --set to true if you don't want the "rebalance" setup messages to print to the console/log
	DMCWO.stfu = false --set to true if you don't want the random message printing to the console/log after the persist scripts setup
	--Regardless of either setting, you will still be warned if you leave the TestVar for w/e script commented out/nil
		
	--Random messages
	--Which line can you get in your log/console? ;)
	DMCWO.Strings = {
	"Jiisuri is is mai raifu~", 
	"Don't get yourself in a pickle!", 
	"Kawaii heister when?",
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
	"ONE",
	"\"MOOOOM! GET THE CAMERAAAA!\"",
	"Butts",
	"My Uncle survived going through mustard gas and pepper spray. He's quite the seasoned veteran.",
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
	"\"What is love? Baby don't hurt me, don't hurt me, no more!v",
	"Pre-B CZ75 when?",
	"My friend in the army lost his left arm to an explosion. Thankfully he's all right now.",
	"AA2 HGOTY, all year, every year",
	"\"Lightning bolt, lightning bolt, lightning bolt!!\"",
	"\"topkek\"",
	"*Insert bad pun here*",
	"\"ayy lmao\"",
	"\"420 BLAZE IT\"",
	"Would you Nep a Nep Nep? \nBecause I would...",
	"\"2spooky4me\"",
	";)",
	":3c",
	">tfw I can't have mai raifu in Canada",
	"What're you doing reading this?",
	"\"SILENCIO?\"",
	"\"ECH\"",
	"fugg da bolis :DDD",
	"That cop was one swood guy!",
	"\"It's all ogre for you\"",
	"DMCWO.stfu = true",
	"MUH STOPPAN POWAH",
	"RIP IN PIECE",
	"\"GO! GO! GO! GO! GO! GO! GALO SENGEN!\"",
	"<3",
	"\"Ka ka~\"",
	"DMC's todo list for 20xx:\n-draw more\n-draw more porn\n-lrn2code\n-get a real PC",
	"\"Baka baka, baka baka\"",
	"Kek la Kek",
	"\"NUUUDIST BEECHOO\"",
	"\"Now its personel!\"",
	"Get your \"First Aid Kit\" here ~<3",
	"I'd Nonon's nonos",
	"Based LazyOzzy",
	"Based Seven",
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
	"\"Funco-chan!\"",
	"[x]Touch fluffy tail",
	"\"You expected a cute girl? Too bad! It's just me, text!\"",
	"\"SNAAAAAKE EEAAATERRRR!!!\"",
	"The BUALLS",
	"SAKO RK95 when?", --https://www.youtube.com/watch?v=Q-rEJys-Vnc
	"\"git gud\"",
	"\"Gimme da chocolate, Hisao\"",
	"\"DOZER INCOMING\"",
	"More lood Kawaii pictures when?",
	"Why are fryfaced characters so good?",
	"shekelfest 2015",
	":^)",
	"\n   ^\n  ^^^\n:^^^^^)",
	"Why make lua scripts when you can draw porn?",
	"What the fuck did you just fucking say about me, you little bitch?\nI'll have you know I graduated top of my class in the Navy Seals, and I've been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills.\nI am trained in gorilla warfare and I'm the top sniper in the entire US armed forces.\nYou are nothing to me but just another target.\nI will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words.\nYou think you can get away with saying that shit to me over the Internet?\nThink again, fucker.\nAs we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot.\nThe storm that wipes out the pathetic little thing you call your life.\nYou're fucking dead, kid.\nI can be anywhere, anytime, and I can kill you in over seven hundred ways, and that's just with my bare hands.\nNot only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit.\nIf only you could have known what unholy retribution your little “clever” comment was about to bring down upon you, maybe you would have held your fucking tongue.\nBut you couldn't, you didn't, and now you're paying the price, you goddamn idiot.\nI will shit fury all over you and you will drown in it.\nYou're fucking dead, kiddo.\n",
	}
	
	DMCWO.Startup = true --Don't touch this
	DMCWO_Setup = true
	
end