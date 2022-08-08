local addonName, vars = ...
local L = vars.L
REP = vars

local bijous = { faction = 270, rep = 75, reward = {19858} }
local zgcoin = { faction = 270, rep = 25, reward = {19858}, level = 58, stack = "set of 3" }
local adwrit = { faction = 529, rep = 150, reward = {22523,22524} }

REP.RepItems = {
--[[ TBC ]] --
	[32386] = { faction = 947,  rep = 1000,  quest = 11003, reward = { 28792,28793,28790,28791 }, Alliance = 32385 },				-- Magtheridon's Head (Horde)
	[32385] = { faction = 946,  rep = 1000,  quest = 11002, reward = { 28792,28793,28790,28791 }, Horde = 32386 },					-- Magtheridon's Head (Alliance)
	[32405] = { faction = 935,  rep = 1000,  quest = 11007, reward = { 30015,30007,30018,30017 } },									-- Verdant Sphere
-- T4
	[29755] = { quest = { WARLOCK = { reward = {28964}}, 			 MAGE    = { reward = {29077}}, 			HUNTER  = { reward = {29082}}		}}, -- Chestguard of the Fallen Hero
	[29754] = { quest = { SHAMAN  = { reward = {29038,29033,29029}}, PALADIN = { reward = {29071,29066,29062}}, ROGUE   = { reward = {29045}}		}}, -- Chestguard of the Fallen Champion
	[29753] = { quest = { DRUID   = { reward = {29096,29087,29091}}, PRIEST  = { reward = {29050,29056}}, 	    WARRIOR = { reward = {29019,29012}}	}}, -- Chestguard of the Fallen Defender
	[29759] = { quest = { WARLOCK = { reward = {28963}}, 			 MAGE    = { reward = {29076}}, 			HUNTER  = { reward = {29081}}		}}, -- Helm of the Fallen Hero
	[29760] = { quest = { SHAMAN  = { reward = {29035,29028,29040}}, PALADIN = { reward = {29073,29061,29068}}, ROGUE   = { reward = {29044}}		}}, -- Helm of the Fallen Champion
	[29761] = { quest = { DRUID   = { reward = {29093,29086,29098}}, PRIEST  = { reward = {29049,29058}}, 	    WARRIOR = { reward = {29021,29011}}	}}, -- Helm of the Fallen Defender
	[29756] = { quest = { WARLOCK = { reward = {28968}}, 			 MAGE    = { reward = {29080}}, 			HUNTER  = { reward = {29085}}		}}, -- Gloves of the Fallen Hero
	[29757] = { quest = { SHAMAN  = { reward = {29039,29032,29034}}, PALADIN = { reward = {29072,29065,29067}}, ROGUE   = { reward = {29048}}		}}, -- Gloves of the Fallen Champion
	[29758] = { quest = { DRUID   = { reward = {29097,29092,29090}}, PRIEST  = { reward = {29057,29055}}, 	    WARRIOR = { reward = {29020,29017}}	}}, -- Gloves of the Fallen Defender
	[29762] = { quest = { WARLOCK = { reward = {28967}}, 			 MAGE    = { reward = {29079}}, 			HUNTER  = { reward = {29084}}		}}, -- Pauldrons of the Fallen Hero
	[29763] = { quest = { SHAMAN  = { reward = {29037,29031,29043}}, PALADIN = { reward = {29064,29070,29075}}, ROGUE   = { reward = {29047}}		}}, -- Pauldrons of the Fallen Champion
	[29764] = { quest = { DRUID   = { reward = {29100,29095,29089}}, PRIEST  = { reward = {29054,29060}}, 	    WARRIOR = { reward = {29016,29023}}	}}, -- Pauldrons of the Fallen Defender
	[29765] = { quest = { WARLOCK = { reward = {28966}}, 			 MAGE    = { reward = {29078}}, 			HUNTER  = { reward = {29083}}		}}, -- Leggings of the Fallen Hero
	[29766] = { quest = { SHAMAN  = { reward = {29030,29036,29042}}, PALADIN = { reward = {29074,29063,29069}}, ROGUE   = { reward = {29046}}		}}, -- Leggings of the Fallen Champion
	[29767] = { quest = { DRUID   = { reward = {29094,29099,29088}}, PRIEST  = { reward = {29059,29053}}, 	    WARRIOR = { reward = {29022,29015}}	}}, -- Leggings of the Fallen Defender
-- T5
	[30238] = { quest = { WARLOCK = { reward = {30214}}, 			 MAGE    = { reward = {30196}}, 			HUNTER  = { reward = {30139}}		}}, -- Chestguard of the Vanquished Hero
	[30236] = { quest = { SHAMAN  = { reward = {30164,30169,30185}}, PALADIN = { reward = {30129,30123,30134}}, ROGUE   = { reward = {30144}}		}}, -- Chestguard of the Vanquished Champion
	[30237] = { quest = { DRUID   = { reward = {30216,30231,30222}}, PRIEST  = { reward = {30159,30150}}, 	    WARRIOR = { reward = {30118,30113}}	}}, -- Chestguard of the Vanquished Defender
	[30244] = { quest = { WARLOCK = { reward = {30212}}, 			 MAGE    = { reward = {30206}}, 			HUNTER  = { reward = {30141}}		}}, -- Helm of the Vanquished Hero
	[30242] = { quest = { SHAMAN  = { reward = {30166,30171,30190}}, PALADIN = { reward = {30125,30136,30131}}, ROGUE   = { reward = {30146}}		}}, -- Helm of the Vanquished Champion
	[30243] = { quest = { DRUID   = { reward = {30228,30219,30233}}, PRIEST  = { reward = {30152,30161}}, 	    WARRIOR = { reward = {30120,30115}}	}}, -- Helm of the Vanquished Defender
	[30241] = { quest = { WARLOCK = { reward = {30211}}, 			 MAGE    = { reward = {30205}}, 			HUNTER  = { reward = {31961}}		}}, -- Gloves of the Vanquished Hero
	[30239] = { quest = { SHAMAN  = { reward = {30189,30165,30170}}, PALADIN = { reward = {30130,30135,30124}}, ROGUE   = { reward = {30145}}		}}, -- Gloves of the Vanquished Champion
	[30240] = { quest = { DRUID   = { reward = {30232,30217,30223}}, PRIEST  = { reward = {30151,30160}}, 	    WARRIOR = { reward = {30119,30114}}	}}, -- Gloves of the Vanquished Defender
	[30250] = { quest = { WARLOCK = { reward = {30215}}, 			 MAGE    = { reward = {30210}}, 			HUNTER  = { reward = {30143}}		}}, -- Pauldrons of the Vanquished Hero
	[30248] = { quest = { SHAMAN  = { reward = {30168,30173,30194}}, PALADIN = { reward = {30138,30133,30127}}, ROGUE   = { reward = {30149}}		}}, -- Pauldrons of the Vanquished Champion
	[30249] = { quest = { DRUID   = { reward = {30230,30221,30235}}, PRIEST  = { reward = {30154,30163}}, 	    WARRIOR = { reward = {30122,30117}}	}}, -- Pauldrons of the Vanquished Defender
	[30247] = { quest = { WARLOCK = { reward = {30213}}, 			 MAGE    = { reward = {30207}}, 			HUNTER  = { reward = {30142}}		}}, -- Leggings of the Vanquished Hero
	[30245] = { quest = { SHAMAN  = { reward = {30172,30167,30192}}, PALADIN = { reward = {30132,30137,30126}}, ROGUE   = { reward = {30148}}		}}, -- Leggings of the Vanquished Champion
	[30246] = { quest = { DRUID   = { reward = {30229,30220,30234}}, PRIEST  = { reward = {30153,30162}}, 	    WARRIOR = { reward = {30121,30116}}	}}, -- Leggings of the Vanquished Defender
-- T6
	[31089] = { quest = { PALADIN = { reward = {30990,30991,30992}}, PRIEST  = { reward = {31065,31066}},		WARLOCK = { reward = {31052}}		}}, -- Chestguard of the Forgotten Conqueror
	[31091] = { quest = { WARRIOR = { reward = {30975,30976}},		 SHAMAN  = { reward = {31016,31017,31018}},	HUNTER  = { reward = {31004}}		}}, -- Chestguard of the Forgotten Protector
	[31090] = { quest = { ROGUE	  = { reward = {31028}},			 DRUID   = { reward = {31041,31042,31043}},	MAGE    = { reward = {31057}}		}}, -- Chestguard of the Forgotten Vanquisher
	[31097] = { quest = { PALADIN = { reward = {30987,30988,30989}}, PRIEST  = { reward = {31063,31064}},		WARLOCK = { reward = {31051}}		}}, -- Helm of the Forgotten Conqueror
	[31095] = { quest = { WARRIOR = { reward = {30972,30974}},		 SHAMAN  = { reward = {31012,31014,31015}},	HUNTER  = { reward = {31003}}		}}, -- Helm of the Forgotten Protector
	[31096] = { quest = { ROGUE	  = { reward = {31027}},			 DRUID   = { reward = {31037,31039,31040}},	MAGE    = { reward = {31056}}		}}, -- Helm of the Forgotten Vanquisher
	[31092] = { quest = { PALADIN = { reward = {30982,30983,30985}}, PRIEST  = { reward = {31060,31061}},		WARLOCK = { reward = {31050}}		}}, -- Gloves of the Forgotten Conqueror
	[31094] = { quest = { WARRIOR = { reward = {30969,30970}},		 SHAMAN  = { reward = {31007,31008,31011}},	HUNTER  = { reward = {31001}}		}}, -- Gloves of the Forgotten Protector
	[31093] = { quest = { ROGUE	  = { reward = {31026}},			 DRUID   = { reward = {31032,31034,31035}},	MAGE    = { reward = {31055}}		}}, -- Gloves of the Forgotten Vanquisher
	[31101] = { quest = { PALADIN = { reward = {30996,30997,30998}}, PRIEST  = { reward = {31069,31070}},		WARLOCK = { reward = {31054}}		}}, -- Pauldrons of the Forgotten Conqueror
	[31103] = { quest = { WARRIOR = { reward = {30979,30980}},		 SHAMAN  = { reward = {31022,31023,31024}},	HUNTER  = { reward = {31006}}		}}, -- Pauldrons of the Forgotten Protector
	[31102] = { quest = { ROGUE	  = { reward = {31030}},			 DRUID   = { reward = {31047,31048,31049}},	MAGE    = { reward = {31059}}		}}, -- Pauldrons of the Forgotten Vanquisher
	[31098] = { quest = { PALADIN = { reward = {30993,30994,30995}}, PRIEST  = { reward = {31067,31068}},		WARLOCK = { reward = {31053}}		}}, -- Leggings of the Forgotten Conqueror
	[31100] = { quest = { WARRIOR = { reward = {30977,30978}},		 SHAMAN  = { reward = {31019,31020,31021}},	HUNTER  = { reward = {31005}}		}}, -- Leggings of the Forgotten Protector
	[31099] = { quest = { ROGUE	  = { reward = {31029}},			 DRUID   = { reward = {31044,31045,31046}},	MAGE    = { reward = {31058}}		}}, -- Leggings of the Forgotten Vanquisher
	[34853] = { quest = { PALADIN = { reward = {34485,34487,34488}}, PRIEST  = { reward = {34527,34528}},		WARLOCK = { reward = {34541}}		}}, -- Belt of the Forgotten Conqueror
	[34854] = { quest = { WARRIOR = { reward = {34546,34547}},		 SHAMAN  = { reward = {34542,34543,34545}},	HUNTER  = { reward = {34549}}		}}, -- Belt of the Forgotten Protector
	[34855] = { quest = { ROGUE	  = { reward = {34558}},			 DRUID   = { reward = {34554,34555,34556}},	MAGE    = { reward = {34557}}		}}, -- Belt of the Forgotten Vanquisher
	[34848] = { quest = { PALADIN = { reward = {34431,34432,34433}}, PRIEST  = { reward = {34434,34435}},		WARLOCK = { reward = {34436}}		}}, -- Bracers of the Forgotten Conqueror
	[34851] = { quest = { WARRIOR = { reward = {34441,34442}},		 SHAMAN  = { reward = {34437,34438,34439}},	HUNTER  = { reward = {34443}}		}}, -- Bracers of the Forgotten Protector
	[34852] = { quest = { ROGUE	  = { reward = {34448}},			 DRUID   = { reward = {34444,34445,34446}},	MAGE    = { reward = {34447}}		}}, -- Bracers of the Forgotten Vanquisher
	[34856] = { quest = { PALADIN = { reward = {34559,34560,34561}}, PRIEST  = { reward = {34562,34563}},		WARLOCK = { reward = {34564}}		}}, -- Boots of the Forgotten Conqueror
	[34857] = { quest = { WARRIOR = { reward = {34568,34569}},		 SHAMAN  = { reward = {34565,34566,34567}},	HUNTER  = { reward = {34570}}		}}, -- Boots of the Forgotten Protector
	[34858] = { quest = { ROGUE	  = { reward = {34575}},			 DRUID   = { reward = {34571,34572,34573}},	MAGE    = { reward = {34574}}		}}, -- Boots of the Forgotten Vanquisher
-- Keys
	[30622] = { faction = 946,  level = 58 }, -- Flamewrought Key (Hellfire Citadel) Alliance
	[30637] = { faction = 947,  level = 58 },	-- Flamewrought Key (Hellfire Citadel) Horde
	[30623] = { faction = 942,  level = 58 },	-- Reservoir Key	(Coilfang Reservoir)
	[30633] = { faction = 1011, level = 58 },	-- Auchenai Key		(Auchindoun)
	[30635] = { faction = 989,  level = 58 },	-- Key of Time		(Caverns of Time)
	[30634] = { faction = 935,  level = 58 },	-- Warpforged Key	(Tempest Keep)
-- Cenarion Expedition
	[24401] = { faction = 942, rep = 250, max = 8999, reward = {24402}, level = 58, stack = 10 },						-- Unidentified Plant Parts
	[24407] = { faction = 942, rep = 500, max = 20999, level = 58 },													-- Uncatalogued Species
	[24368] = { faction = 942, rep = 75, level = 58 },																	-- Coilfang Armaments
-- Lower City
	[25719] = { faction = 1011, rep = 250, level = 58, max = 8999, stack = 30 }, 										-- Arakkoa Feather
-- The Consortium
	[25463] = { faction = 933, rep = 250, level = 58, max = 2999, stack = 3 },											-- Pair of Ivory Tusks
	[25416] = { faction = 933, rep = 250, level = 58, max = 2999, stack = 10 },											-- Oshu'gun Crystal Fragment
	[25433] = { faction = 933, rep = 250, level = 58, min = 3000, stack = 10, note= "Can aslo be used for Kurenai/Mag'har\nreputation (500 per 10)" },											-- Obsidian Warbeads
	[29209] = { faction = 933, rep = 250, level = 58, min = 3000, stack = 10 },											-- Zaxxis Insignia
	[31957] = { faction = 933, rep = 250, level = 58, min = 9000 },														-- Ethereum Prisoner I.D. Tag
	[31941] = { faction = 933, rep = 500, level = 58, min = 21000 },													-- Mark of the Nexus-King
-- Sporeggar
	[24290] = { faction = 970, rep = 750, level = 58, stack = 10, max = 2999 },											-- Mature Spore Sac
	[24291] = { faction = 970, rep = 750, level = 58, stack = 6, max = 2999 },											-- Bog Lord Tendril
	[24245] = { faction = 970, rep = 750, level = 58, stack = 10, max = 2999 },											-- Glowcap
	[24449] = { faction = 970, rep = 750, level = 58, stack = 6, reward = {24245} },									-- Fertile Spores
	[24246] = { faction = 970, rep = 750, level = 58, stack = 5, min = 3000 },											-- Sanguine Hibiscus
-- The Scryers
	[29426] = { faction = 934, rep = 25, level = 58, min = 0, max = 8999 },												-- Firewing Signet
	[30810] = { faction = 934, rep = 25, level = 58, min = 0 },															-- Sunfury Signet
	[29739] = { faction = 934, rep = 350, level = 58, min = 0, reward = {29736} },										-- Arcane Tome
	[25744] = { faction = 934, rep = 250, level = 58, max = 1, stack = 8},												-- Dampscale Basilisk Eye
-- The Aldor
	[25802] = { faction = 932, rep = 250, level = 58, max = 1, stack = 8},												-- Dreadfang Venom Sac
	[29425] = { faction = 932, rep = 25, level = 58, min = 0, max = 8999},												-- Mark of Kil'jaeden
	[30809] = { faction = 932, rep = 25, level = 58, min = 0},															-- Mark of Sargeras
	[29740] = { faction = 932, rep = 350, level = 58, min = 0, reward={29735}},											-- Fel Armament

--[[ Original ]]--
--[[ Raid ]]--
-- Ony
	[18422] = { faction = 76,  rep = 500,  quest = 7490, reward = { 18406,18403,18404 }, Alliance = 18423 },			-- Head of Onyxia (Horde)
	[18423] = { faction = 72,  rep = 500,  quest = 7495, reward = { 18406,18403,18404 }, Horde = 18422 },				-- Head of Onyxia (Alliance)
-- BWL
	[19002] = { faction = 76,  rep = 500,  quest = 7783, reward = { 19383,19366,19384 }, Alliance = 19003 },			-- Head of Nefarian (Horde)
	[19003] = { faction = 72,  rep = 500,  quest = 7781, reward = { 19383,19366,19384 }, Horde = 19002 },				-- Head of Nefarian (Alliance)
-- ZG
	[19802] = { faction = 270, rep = 500,  quest = 8183, reward = { 19948,19950,19949 } },								-- Heart of Hakkar
	[19716] = { faction = 270, level = 58, quest = { PALADIN = { questID = 8053, reward = {19827} }, MAGE    = { questID = 8060, reward = {19846} }, HUNTER  = { questID = 8062, reward = {19833} } }, min = 3000 },	-- Bindings
	[19717] = { faction = 270, level = 58, quest = { SHAMAN  = { questID = 8056, reward = {19830} }, ROGUE   = { questID = 8063, reward = {19836} }, WARRIOR = { questID = 8058, reward = {19824} } }, min = 3000 },	-- Armsplint
	[19718] = { faction = 270, level = 58, quest = { PRIEST  = { questID = 8061, reward = {19843} }, WARLOCK = { questID = 8059, reward = {19848} }, DRUID   = { questID = 8057, reward = {19840} } }, min = 3000 },	-- Stanchion
	[19719] = { faction = 270, level = 58, quest = { SHAMAN  = { questID = 8074, reward = {19829} }, ROGUE   = { questID = 8072, reward = {19835} }, WARRIOR = { questID = 8078, reward = {19823} } }, min = 9000 },	-- Girdle
	[19720] = { faction = 270, level = 58, quest = { PRIEST  = { questID = 8070, reward = {19842} }, WARLOCK = { questID = 8076, reward = {19849} }, DRUID   = { questID = 8064, reward = {19839} } }, min = 9000 },	-- Sash
	[19721] = { faction = 270, level = 58, quest = { PALADIN = { questID = 8054, reward = {19826} }, MAGE    = { questID = 8068, reward = {19845} }, HUNTER  = { questID = 8066, reward = {19832} } }, min = 9000 },	-- Shawl
	[19722] = { faction = 270, level = 58, quest = { SHAMAN  = { questID = 8075, reward = {19828} }, PALADIN = { questID = 8055, reward = {19825} }, DRUID   = { questID = 8065, reward = {19838} } }, min = 21000 },	-- Tabard
	[19723] = { faction = 270, level = 58, quest = { WARLOCK = { questID = 8077, reward = {20033} }, MAGE    = { questID = 8069, reward = {20034} }, WARRIOR = { questID = 8079, reward = {19822} } }, min = 21000 },	-- Kossack
	[19724] = { faction = 270, level = 58, quest = { PRIEST  = { questID = 8071, reward = {19841} }, ROGUE   = { questID = 8073, reward = {19834} }, HUNTER  = { questID = 8067, reward = {19831} } }, min = 21000 },	-- Aegis
-- AQ20
	[21220] = { faction = 609, rep = 350,  quest = 8791, reward = { 21504,21507,21505,21506 } },						-- Head of Ossirian the Unscarred
	[20888] = { faction = 609, level = 60, quest = { ROGUE   = { questID = 8701, reward = {21405} }, PRIEST  = { questID = 8697, reward = {21411} }, WARLOCK = { questID = 8702, reward = {21417} }, HUNTER  = { questID = 8704, reward = {21402} } },												  min = 9000 },	-- Ceremonial Ring
	[20884] = { faction = 609, level = 60, quest = { PALADIN = { questID = 8703, reward = {21396} }, SHAMAN  = { questID = 8698, reward = {21399} }, MAGE    = { questID = 8699, reward = {21414} }, DRUID   = { questID = 8700, reward = {21408} }, WARRIOR = { questID = 8556, reward = {21393} } }, min = 9000 },	-- Magisterial Ring
	[20885] = { faction = 609, level = 60, quest = { ROGUE   = { questID = 8693, reward = {21406} }, WARRIOR = { questID = 8557, reward = {21394} }, MAGE    = { questID = 8691, reward = {21415} }, PRIEST  = { questID = 8689, reward = {21412} } },												  min = 21000 },	-- Martial Drape
	[20889] = { faction = 609, level = 60, quest = { PALADIN = { questID = 8695, reward = {21397} }, SHAMAN  = { questID = 8690, reward = {21400} }, HUNTER  = { questID = 8696, reward = {21403} }, DRUID   = { questID = 8692, reward = {21409} }, WARLOCK = { questID = 8694, reward = {21418} } }, min = 21000 },	-- Regal Drape
	[20890] = { faction = 609, level = 60, quest = { MAGE    = { questID = 8707, reward = {21413} }, PRIEST  = { questID = 8705, reward = {21410} }, WARLOCK = { questID = 8710, reward = {21416} }, DRUID   = { questID = 8708, reward = {21407} } },												  min = 42000 },	-- Ornate Hilt
	[20886] = { faction = 609, level = 60, quest = { PALADIN = { questID = 8711, reward = {21395} }, SHAMAN  = { questID = 8706, reward = {21398} }, ROGUE   = { questID = 8709, reward = {21404} }, HUNTER  = { questID = 8712, reward = {21401} }, WARRIOR = { questID = 8558, reward = {21392} } }, min = 42000 },	-- Spiked Hilt
-- AQ40
	[20932] = { faction = 910, rep = 250, level = 60, quest = { PALADIN = { reward = {21388,21391} }, SHAMAN  = { reward = {21373,21376} }, WARLOCK = { reward = {21338,21335} }, MAGE    = { reward = {21344,21345} }, DRUID = { reward = {21355,21354} } }, min = 0 },	-- Bindings of Dominance
	[20928] = { faction = 910, rep = 250, level = 60, quest = { WARRIOR = { reward = {21333,21330} }, ROGUE   = { reward = {21359,21361} }, PRIEST  = { reward = {21349,21350} }, HUNTER  = { reward = {21365,21367} } },									  min = 0 },	-- Bindings of Command
	[20930] = { faction = 910, rep = 250, level = 60, quest = { PALADIN = { questID = 8628, reward = {21387} }, ROGUE   = { questID = 8639, reward = {21360} }, DRUID   = { questID = 8667, reward = {21353} }, SHAMAN  = { questID = 8623, reward = {21372} }, HUNTER  = { questID = 8657, reward = {21366} } }, min = 3000 },	-- Vek'lor's Diadem
	[20926] = { faction = 910, rep = 250, level = 60, quest = { WARRIOR = { questID = 8561, reward = {21329} }, WARLOCK = { questID = 8662, reward = {21337} }, MAGE    = { questID = 8632, reward = {21347} }, PRIEST  = { questID = 8592, reward = {21348} } },												  min = 3000 },	-- Vek'nilash's Circlet
	[20927] = { faction = 910, rep = 250, level = 60, quest = { WARRIOR = { questID = 8560, reward = {21332} }, ROGUE   = { questID = 8640, reward = {21362} }, MAGE    = { questID = 8631, reward = {21346} }, PRIEST  = { questID = 8593, reward = {21352} } },												  min = 3000 },	-- Ouro's Intact Hide
	[20931] = { faction = 910, rep = 250, level = 60, quest = { PALADIN = { questID = 8629, reward = {21390} }, WARLOCK = { questID = 8663, reward = {21336} }, DRUID   = { questID = 8668, reward = {21356} }, SHAMAN  = { questID = 8624, reward = {21375} }, HUNTER  = { questID = 8658, reward = {21368} } }, min = 3000 },	-- Skin of the Great Sandworm
	[20929] = { faction = 910, rep = 250, level = 60, quest = { PALADIN = { questID = 8627, reward = {21389} }, WARRIOR = { questID = 8562, reward = {21331} }, ROGUE   = { questID = 8638, reward = {21364} }, SHAMAN  = { questID = 8622, reward = {21374} }, HUNTER  = { questID = 8656, reward = {21370} } }, min = 9000 },	-- Carapace of the Old God
	[20933] = { faction = 910, rep = 250, level = 60, quest = { WARLOCK = { questID = 8661, reward = {21334} }, MAGE    = { questID = 8633, reward = {21343} }, DRUID   = { questID = 8666, reward = {21357} }, PRIEST  = { questID = 8603, reward = {21351} } },												  min = 9000 },	-- Husk of the Old God
	[21232] = { faction = 910, quest = 8789, reward = { 21242,21272,21244,21269 } },							-- Imperial Qiraji Armaments
	[21237] = { faction = 910, quest = 8790, reward = { 21273,21275,21268 } },								-- Imperial Qiraji Regalia
	[21230] = { faction = 910, rep = 1000, quest = 8784, repeatable = true },											-- Ancient Qiraji Artifact
	[21229] = { faction = 910, rep = 500,  level = 60 },																-- Qiraji Lord's Insignia
	[21221] = { faction = 910, rep = 500, quest = 8801, reward = { 21712,21710,21709 } },								-- Eye of C'Thun
-- Naxx
	[22520] = { quest = 9120, reward = { 23206,23207 } },										-- The Phylactery of Kel'Thuzad
	[22351] = { faction = 529, level = 60, quest = { PRIEST  = { questID = 9111, reward = {22512} }, MAGE   = { questID = 9095, reward = {22496} }, WARLOCK  = { questID = 9103, reward = {22504} } } },	-- Robe
	[22366] = { faction = 529, level = 60, quest = { PRIEST  = { questID = 9112, reward = {22513} }, MAGE   = { questID = 9096, reward = {22497} }, WARLOCK  = { questID = 9104, reward = {22505} } } },	-- Leggings
	[22367] = { faction = 529, level = 60, quest = { PRIEST  = { questID = 9113, reward = {22514} }, MAGE   = { questID = 9097, reward = {22498} }, WARLOCK  = { questID = 9105, reward = {22506} } } },	-- Circlet
	[22368] = { faction = 529, level = 60, quest = { PRIEST  = { questID = 9114, reward = {22515} }, MAGE   = { questID = 9098, reward = {22499} }, WARLOCK  = { questID = 9106, reward = {22507} } } },	-- Shoulderpads
	[22372] = { faction = 529, level = 60, quest = { PRIEST  = { questID = 9115, reward = {22516} }, MAGE   = { questID = 9099, reward = {22500} }, WARLOCK  = { questID = 9107, reward = {22508} } } },	-- Sandals
	[22371] = { faction = 529, level = 60, quest = { PRIEST  = { questID = 9116, reward = {22517} }, MAGE   = { questID = 9100, reward = {22501} }, WARLOCK  = { questID = 9108, reward = {22509} } } },	-- Gloves
	[22370] = { faction = 529, level = 60, quest = { PRIEST  = { questID = 9117, reward = {22518} }, MAGE   = { questID = 9101, reward = {22502} }, WARLOCK  = { questID = 9109, reward = {22510} } } },	-- Belt
	[22369] = { faction = 529, level = 60, quest = { PRIEST  = { questID = 9118, reward = {22519} }, MAGE   = { questID = 9102, reward = {22503} }, WARLOCK  = { questID = 9110, reward = {22511} } } },	-- Bindings
	[22349] = { faction = 529, level = 60, quest = { WARRIOR = { questID = 9034, reward = {22416} }, ROGUE  = { questID = 9077, reward = {22476} } } },	-- Breastplate
	[22352] = { faction = 529, level = 60, quest = { WARRIOR = { questID = 9036, reward = {22417} }, ROGUE  = { questID = 9078, reward = {22477} } } },	-- Legplates
	[22353] = { faction = 529, level = 60, quest = { WARRIOR = { questID = 9037, reward = {22418} }, ROGUE  = { questID = 9079, reward = {22478} } } },	-- Helmet
	[22354] = { faction = 529, level = 60, quest = { WARRIOR = { questID = 9038, reward = {22419} }, ROGUE  = { questID = 9080, reward = {22479} } } },	-- Pauldrons
	[22358] = { faction = 529, level = 60, quest = { WARRIOR = { questID = 9039, reward = {22420} }, ROGUE  = { questID = 9081, reward = {22480} } } },	-- Sabatons
	[22357] = { faction = 529, level = 60, quest = { WARRIOR = { questID = 9040, reward = {22421} }, ROGUE  = { questID = 9082, reward = {22481} } } },	-- Gauntlets
	[22356] = { faction = 529, level = 60, quest = { WARRIOR = { questID = 9041, reward = {22422} }, ROGUE  = { questID = 9083, reward = {22482} } } },	-- Waistguard
	[22355] = { faction = 529, level = 60, quest = { WARRIOR = { questID = 9042, reward = {22423} }, ROGUE  = { questID = 9084, reward = {22483} } } },	-- Bracers
	[22350] = { faction = 529, level = 60, quest = { HUNTER  = { questID = 9054, reward = {22436} }, DRUID  = { questID = 9086, reward = {22488} }, SHAMAN  = { questID = 9068, reward = {22464} }, PALADIN = { questID = 9043, reward = {22425} } } },	-- Tunic
	[22359] = { faction = 529, level = 60, quest = { HUNTER  = { questID = 9055, reward = {22437} }, DRUID  = { questID = 9087, reward = {22489} }, SHAMAN  = { questID = 9069, reward = {22465} }, PALADIN = { questID = 9044, reward = {22427} } } },	-- Legguards
	[22360] = { faction = 529, level = 60, quest = { HUNTER  = { questID = 9056, reward = {22438} }, DRUID  = { questID = 9088, reward = {22490} }, SHAMAN  = { questID = 9070, reward = {22466} }, PALADIN = { questID = 9045, reward = {22428} } } },	-- Headpiece
	[22361] = { faction = 529, level = 60, quest = { HUNTER  = { questID = 9057, reward = {22439} }, DRUID  = { questID = 9089, reward = {22491} }, SHAMAN  = { questID = 9071, reward = {22467} }, PALADIN = { questID = 9046, reward = {22429} } } },	-- Spaulders
	[22365] = { faction = 529, level = 60, quest = { HUNTER  = { questID = 9058, reward = {22440} }, DRUID  = { questID = 9090, reward = {22492} }, SHAMAN  = { questID = 9072, reward = {22468} }, PALADIN = { questID = 9047, reward = {22430} } } },	-- Boots
	[22364] = { faction = 529, level = 60, quest = { HUNTER  = { questID = 9059, reward = {22441} }, DRUID  = { questID = 9091, reward = {22493} }, SHAMAN  = { questID = 9073, reward = {22469} }, PALADIN = { questID = 9048, reward = {22426} } } },	-- Handguards
	[22363] = { faction = 529, level = 60, quest = { HUNTER  = { questID = 9060, reward = {22442} }, DRUID  = { questID = 9092, reward = {22494} }, SHAMAN  = { questID = 9074, reward = {22470} }, PALADIN = { questID = 9049, reward = {22431} } } },	-- Girdle
	[22362] = { faction = 529, level = 60, quest = { HUNTER  = { questID = 9061, reward = {22443} }, DRUID  = { questID = 9093, reward = {22495} }, SHAMAN  = { questID = 9075, reward = {22471} }, PALADIN = { questID = 9050, reward = {22424} } } },	-- Wristguards
--[[ Faction Items ]]--
--	Zandalari
	[19858] = { faction = 270, rep = 50 },																-- Zandalar Honor Token
	[19707] = bijous, [19708] = bijous, [19709] = bijous, [19710] = bijous, [19711] = bijous, [19712] = bijous, [19713] = bijous, [19714] = bijous, [19715] = bijous,
	[19698] = zgcoin, [19699] = zgcoin, [19700] = zgcoin, [19701] = zgcoin, [19702] = zgcoin, [19703] = zgcoin, [19704] = zgcoin, [19705] = zgcoin, [19706] = zgcoin,
--	Argent Dawn
	[22600] = adwrit, [22601] = adwrit, [22602] = adwrit, [22603] = adwrit, [22604] = adwrit, [22605] = adwrit, [22606] = adwrit, [22607] = adwrit,
	[22608] = adwrit, [22609] = adwrit, [22610] = adwrit, [22611] = adwrit, [22612] = adwrit, [22613] = adwrit, [22614] = adwrit, [22615] = adwrit,
	[22616] = adwrit, [22617] = adwrit, [22618] = adwrit, [22620] = adwrit, [22621] = adwrit, [22622] = adwrit, [22623] = adwrit, [22624] = adwrit,
	[12844] = { faction = 529, rep = 100 },																-- Argent Dawn Valor Token
	[12840] = { faction = 529, rep = 50, reward = {12844}, level = 50, stack = 20 },		-- Minion's Scourgestone
	[12841] = { faction = 529, rep = 50, reward = {12844}, level = 50, stack = 10 },		-- Invader's Scourgestone
	[12843] = { faction = 529, rep = 50, reward = {12844}, level = 50 },					-- Corruptor's Scourgestone
	[13920] = { faction = 529, rep = 150, quest = 5582, repeatable = true },								-- Healthy Dragon Scale
	[22526] = { faction = 529, rep = 1000, level = 55, stack = 30, min = 3000, quest = 9126, note = "After this quest is complete,\nit is repeatable for 20 reputaion", reward = {22524} },		-- Bone Fragments
	[22525] = { faction = 529, rep = 1000, level = 55, stack = 30, min = 3000, quest = 9124, note = "After this quest is complete,\nit is repeatable for 20 reputaion", reward = {22524} },		-- Crypt Fiend Parts
	[22527] = { faction = 529, rep = 1000, level = 55, stack = 30, min = 3000, quest = 9128, note = "After this quest is complete,\nit is repeatable for 20 reputaion", reward = {22523} },		-- Core of Elements
	[22528] = { faction = 529, rep = 1000, level = 55, stack = 30, min = 3000, quest = 9131, note = "After this quest is complete,\nit is repeatable for 20 reputaion", reward = {22523} },		-- Dark Iron Scraps
	[22529] = { faction = 529, rep = 1000, level = 55, stack = 30, min = 3000, quest = 9136, note = "After this quest is complete,\nit is repeatable for 20 reputaion", reward = {22523,22524} },  -- Savage Fronds
-- Timbermaw Hold
	[20741] = { faction = 576, rep = 700, quest = 8470, min = 0 },									-- Deadwood Ritual Totem
	[20742] = { faction = 576, rep = 700, quest = 8471, min = 0 },									-- Winterfall Ritual Totem
	[21377] = { faction = 576, rep = 150, stack = 5 },													-- Deadwood Headdress Feather
	[21383] = { faction = 576, rep = 150, stack = 5 },													-- Winterfall Spirit Beads
-- Thorium Brotherhood
	[18944] = { faction = 59, rep = 25, stack = 2, min = 0, max = 2999, level = 45 },				-- Incendosaur Scale
	[18945] = { faction = 59, rep = 25, stack = 4, min = 3000, max = 8999, level = 45 },				-- Dark Iron Residue
	[11370] = { faction = 59, rep = 75, stack = 10, min = 9000, level = 60 },							-- Dark Iron Ore
	[17010] = { faction = 59, rep = 500, min = 9000, level = 60 },									-- Fiery Core
	[17011] = { faction = 59, rep = 500, min = 9000, level = 60 },									-- Lava Core
	[17012] = { faction = 59, rep = 300, min = 9000, level = 60, stack = 2 },							-- Core Leather
	[11382] = { faction = 59, rep = 500, min = 9000, level = 60 },									-- Blood of the Mountain
-- Shen'dralar
	[18401] = { faction = 809, rep = 200, reward = {18348}, questID = 7507, quest = { WARRIOR = true, PALADIN = true } },	-- Foror's Compendium of Dragon Slaying
	[18364] = { faction = 809, rep = 200, reward = {18470}, questID = 7506, quest = { DRUID   = true } },					-- The Emerald Dream
	[18361] = { faction = 809, rep = 200, reward = {18473}, questID = 7503, quest = { HUNTER  = true } },					-- The Greatest Race of Hunters
	[18358] = { faction = 809, rep = 200, reward = {18468}, questID = 7500, quest = { MAGE    = true } },					-- The Arcanist's Cookbook
	[18359] = { faction = 809, rep = 200, reward = {18472}, questID = 7501, quest = { PALADIN = true } },					-- The Light and How to Swing It
	[18362] = { faction = 809, rep = 200, reward = {18469}, questID = 7504, quest = { PRIEST  = true } },					-- Holy Bologna: What the Light Won't Tell You
	[18356] = { faction = 809, rep = 200, reward = {18465}, questID = 7498, quest = { ROGUE   = true } },					-- Garona: A Study on Stealth and Treachery
	[18363] = { faction = 809, rep = 200, reward = {18471}, questID = 7505, quest = { SHAMAN  = true } },					-- Frost Shock and You
	[18360] = { faction = 809, rep = 200, reward = {18467}, questID = 7502, quest = { WARLOCK = true } },					-- Harnessing Shadows
	[18357] = { faction = 809, rep = 200, reward = {18466}, questID = 7499, quest = { WARRIOR = true } },					-- Codex of Defense

-- PvP
	[20558] = { faction = { Alliance = 890, Horde = 889 }, level = 15 },								-- Warsong Gulch Mark of Honor
	[20559] = { faction = { Alliance = 509, Horde = 510 }, level = 20 },								-- Arathi Basin Mark of Honor
	[20560] = { faction = { Alliance = 730, Horde = 729 }, level = 51 },								-- Alterac Valley Mark of Honor

-- Other
	[11040] = { faction = { Alliance = 69, Horde = 81 }, rep = 75, level = 47, stack = 10 },			-- Morrowgrain
	[20404] = { faction = 609, rep = 500, level = 57, stack = 10 },										-- Encrypted Twilight Texts
	[11737] = { quest = 4484, repeatable = true, reward = {11647,11648,11649,11645,11646} },			-- Libram of Voracity
	[11733] = { quest = 4481, repeatable = true, reward = {11642} },									-- Libram of Constitution
	[11736] = { quest = 4483, repeatable = true, reward = {11644} },									-- Libram of Resilience
	[11732] = { quest = 4463, repeatable = true, reward = {11622} },									-- Libram of Rumination
	[11734] = { quest = 4482, repeatable = true, reward = {11643} },									-- Libram of Tenacity
	[18332] = { faction = 809, rep = 200, quest = 7483, repeatable = true, reward = {18329} },			-- Libram of Rapidity
	[18333] = { faction = 809, rep = 200, quest = 7484, repeatable = true, reward = {18330} },			-- Libram of Focus
	[18334] = { faction = 809, rep = 200, quest = 7485, repeatable = true, reward = {18331} },			-- Libram of Protection
	[ 9250] = { faction = 369, rep = 350, quest = 2876 },												-- Ship Schedules
	[18969] = { faction = 69,  rep = 250, quest = 7735 },												-- Pristine Yeti Hide
}
