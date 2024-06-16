---------------------------
-- Initialize Addon vars --
---------------------------
local _, vars = ...
local REP = vars
--------------------------------------------------
-- /run local mapID = <mapID>; print(C_Map.GetMapInfo(mapID).name)
--------------------------------------------------
--------------------------------------------------
-- Set Zone IDs
--------------------------------------------------
function REP:SetZoneIdsBasedOnExpansion()
  local zone = {}
  if (not REP.AfterWotlk) then
    --------------------------------------------------
    -- Zone ID's till after Wrath of the Lich King
    --------------------------------------------------
    ---------------------------
    -- Kalimdor --
    ---------------------------
    zone.Ashenvale = 1440
    zone.Azshara = 1447
    zone.Darkshore = 1439
    zone.Darnassus = 1457
    zone.Desolace = 1443
    zone.Durotar = 1411
    zone.Dustwallow_Marsh = 1445
    zone.Felwood = 1448
    zone.Feralas = 1444
    zone.Moonglade = 1450
    zone.Mulgore = 1412
    zone.Orgrimmar = 1454
    zone.Silithus = 1451
    zone.Stonetalon_Mountains = 1442
    zone.Tanaris = 1446
    zone.Teldrassil = 1438
    zone.The_Barrens = 1413
    zone.Thousand_Needles = 1441
    zone.Thunder_Bluff = 1456
    zone.UnGoro_Crater = 1449
    zone.Winterspring = 1452
    zone.Bloodmyst_Isle = 1450
    zone.Azuremyst_Isle = 1443

    ---------------------------
    -- Eastern Kingdoms --
    ---------------------------
    zone.Alterac_Mountains = 1416
    zone.Arathi_Highlands = 1417
    zone.Badlands = 1418
    zone.Blasted_Lands = 1419
    zone.Burning_Steppes = 1428
    zone.Deadwind_Pass = 1430
    zone.Dun_Morogh = 1426
    zone.Duskwood = 1431
    zone.Eastern_Plaguelands = 1423
    zone.Elwynn_Forest = 1429
    zone.Hillsbrad_Foothills = 1424
    zone.Ironforge = 1455
    zone.Loch_Modan = 1432
    zone.Redridge_Mountains = 1433
    zone.Searing_Gorge = 1427
    zone.Silverpine_Forest = 1421
    zone.Stormwind_City = 1453
    zone.Stranglethorn_Vale = 1434
    zone.Swamp_Of_Sorrows = 1435
    zone.The_Hinterlands = 1425
    zone.Tirisfal_Glades = 1420
    zone.Undercity = 1458
    zone.Western_Plaguelands = 1422
    zone.Westfall = 1436
    zone.Wetlands = 1437

    zone.Eversong_Woods = 1941
    zone.Isle_Of_Quel_Danas = 1957
    zone.Silvermoon_City = 110
    zone.Ghostlands = 1942
    zone.The_Scarlet_Enclave = 124

    ---------------------------
    -- Outlands --
    ---------------------------
    zone.Zangarmarsh = 102
    zone.Netherstorm = 109
    zone.Shattrath_City = 111
    zone.Hellfire_Peninsula = 100
    zone.Terokkar_Forest = 108
    zone.Shadowmoon_Valley = 104
    zone.Outland = 101
    zone.Nagrand = 107
    zone.Blades_Edge_Mountains = 105

    ---------------------------
    -- Northrend --
    ---------------------------
    zone.Icecrown = 118
    zone.Wintergrasp = 123
    zone.The_Storm_Peaks = 120
    zone.Dalaran = 125
    zone.Hrothgars_Landing = 170
    zone.Howling_Fjord = 117
    zone.Sholazar_Basin = 119
    zone.Grizzly_Hills = 116
    zone.Northrend = 113
    zone.Crystalsong_Forest = 127
    zone.Dragonblight = 115
    zone.ZulDrak = 121
    zone.Borean_Tundra = 114

    ---------------------------
    -- Battlegrounds --
    ---------------------------
    zone.Temple_of_Kotmogu = 417
    zone.Alterac_Valley = 91
    zone.Eye_of_the_Storm = 112
    zone.The_Battle_for_Gilneas = 275
    zone.Warsong_Gulch = 92
    zone.Twin_Peaks = 206
    zone.Silvershard_Mines = 423
    zone.Strand_of_the_Ancients = 128
    zone.Isle_of_Conquest = 169
    zone.Arathi_Basin = 93
    zone.Deepwind_Gorge = 519

    ---------------------------
    -- Scenarios --
    ---------------------------
    zone.Battle_on_the_High_Seas = 524
    zone.Greenstone_Village = 448
    zone.Domination_Point_H = 498
    zone.Arena_of_Annihilation = 480
    zone.Blood_in_the_Snow = 523
    zone.Assault_on_Zanvess = 451
    zone.A_Little_Patience = 487
    zone.Theramores_Fall_A = 483
    zone.The_Secrets_of_Ragefire = 522
    zone.Crypt_of_Forgotten_Kings = 481
    zone.Brewmoon_Festival = 452
    zone.A_Brewing_Storm = 447
    zone.Celestial_Tournament = 571
    zone.Theramores_Fall_H = 416
    zone.Unga_Ingoo = 450
    zone.Lions_Landing_A = 486
    zone.Dark_Heart_of_Pandaria = 520
    zone.Dagger_in_the_Dark = 488

    ---------------------------
    -- Classic Dungeons --
    ---------------------------
    zone.Blackrock_Spire = 250
    zone.The_Deadmines = 291
    zone.Stratholme = 317
    zone.Maraudon = 280
    zone.Wailing_Caverns = 279
    zone.Razorfen_Downs = 300
    zone.Ragefire_Chasm = 213
    zone.The_Temple_of_AtalHakkar = 220
    zone.Razorfen_Kraul = 301
    zone.ZulFarrak = 219
    zone.Blackfathom_Deeps = 221
    zone.Dire_Maul = 234
    zone.The_Stockade = 225
    zone.Uldaman = 230
    zone.Blackrock_Depths = 242
    zone.Shadowfang_Keep = 310
    zone.Gnomeregan = 226

    ---------------------------
    -- Classic Raids --
    ---------------------------
    zone.Molten_Core = 232
    zone.Blackwing_Lair = 287
    zone.Ruins_of_AhnQiraj = 247
    zone.Temple_of_AhnQiraj = 319

    ---------------------------
    -- Burning Crusade Dungeons --
    ---------------------------
    zone.The_Underbog = 262
    zone.The_Steamvault = 263
    zone.Sethekk_Halls = 258
    zone.The_Botanica = 266
    zone.Mana_Tombs = 272
    zone.Hellfire_Ramparts = 347
    zone.The_Black_Morass = 273
    zone.The_Shattered_Halls = 246
    zone.Magisters_Terrace = 348
    zone.The_Mechanar = 267
    zone.The_Blood_Furnace = 261
    zone.The_Slave_Pens = 265
    zone.Shadow_Labyrinth = 260
    zone.Auchenai_Crypts = 256
    zone.Old_Hillsbrad_Foothills = 274
    zone.The_Arcatraz = 269

    ---------------------------
    -- Burning Crusade Raids --
    ---------------------------
    zone.Black_Temple = 339
    zone.Serpentshrine_Cavern = 332
    zone.Magtheridons_Lair = 331
    zone.Karazhan = 350
    zone.Gruuls_Lair = 330
    zone.The_Eye = 334
    zone.Hyjal_Summit = 329
    zone.Sunwell_Plateau = 335

    ---------------------------
    -- Wrath Dungeons --
    ---------------------------
    zone.Utgarde_Pinnacle = 136
    zone.Gundrak = 153
    zone.The_Oculus = 142
    zone.DrakTharon_Keep = 160
    zone.Azjol_Nerub = 157
    zone.The_Forge_of_Souls = 183
    zone.Ahnkahet_The_Old_Kingdom = 132
    zone.The_Violet_Hold = 168
    zone.The_Nexus = 129
    zone.Trial_of_the_Champion = 171
    zone.Pit_of_Saron = 184
    zone.Halls_o_Lightning = 138
    zone.The_Culling_of_Stratholme = 130
    zone.Utgarde_Keep = 133
    zone.Halls_of_Stone = 140
    zone.Halls_of_Reflection = 185

    ---------------------------
    -- Wrath Raids --
    ---------------------------
    zone.The_Eye_of_Eternity = 141
    zone.The_Ruby_Sanctum = 200
    zone.Icecrown_Citadel = 186
    zone.Naxxramas = 162
    zone.Ulduar = 147
    zone.Onyxias_Lair = 248
    zone.Trial_of_the_Crusader = 172
    zone.Vault_of_Archavon = 156
    zone.The_Obsidian_Sanctum = 155
  else
    --------------------------------------------------
    -- Zone ID's after Wrath of the Lich King
    --------------------------------------------------
    ---------------------------
    -- Kalimdor --
    ---------------------------
    zone.Ashenvale = 63
    zone.Azshara = 76
    zone.Darkshore = 62
    zone.Darnassus = 89
    zone.Desolace = 66
    zone.Durotar = 1
    zone.Dustwallow_Marsh = 70
    zone.Felwood = 77
    zone.Feralas = 69
    zone.Moonglade = 80
    zone.Mulgore = 7
    zone.Orgrimmar = 85
    zone.Silithus = 81
    zone.Stonetalon_Mountains = 65
    zone.Tanaris = 71
    zone.Teldrassil = 57
    zone.Northern_Barrens = 10
    zone.Southern_Barrens = 199
    zone.The_Barrens = 1413
    zone.Thousand_Needles = 64
    zone.Thunder_Bluff = 88
    zone.UnGoro_Crater = 78
    zone.Winterspring = 83
    zone.Bloodmyst_Isle = 106
    zone.Azuremyst_Isle = 97
    zone.The_Exodar = 103
    zone.Echo_Isles = 463
    zone.Camp_Narache = 462
    zone.Mount_Hyjal = 198
    zone.Uldum = 249
    zone.Kalimdor = 12
    zone.Valley_of_Trials = 461
    zone.Ammen_Vale = 468
    zone.AhnQiraj_The_Fallen_Kingdom = 327
    zone.Molten_Front = 338
    zone.Shadowglen = 460

    ---------------------------
    -- Eastern Kingdoms --
    ---------------------------
    zone.Wetlands = 56
    zone.Blasted_Lands = 17
    zone.Deathknell = 465
    zone.Dun_Morogh = 27
    zone.Tol_Barad_Peninsula = 245
    zone.Silvermoon_City = 110
    zone.Duskwood = 47
    zone.Loch_Modan = 48
    zone.Shimmering_Expanse = 205
    zone.Arathi_Highlands = 14
    zone.New_Tinkertown = 469
    zone.Hillsbrad_Foothills = 25
    zone.Undercity = 90
    zone.Ghostlands = 95
    zone.Eastern_Plaguelands = 23
    zone.Gilneas = 179
    zone.Burning_Steppes = 36
    zone.The_Scarlet_Enclave = 124
    zone.Eversong_Woods = 94
    zone.Searing_Gorge = 32
    zone.Tirisfal_Glades = 18
    zone.Western_Plaguelands = 22
    zone.Westfall = 52
    zone.Coldridge_Valley = 427
    zone.The_Cape_of_Stranglethorn = 210
    zone.Vashjir = 203
    zone.Kelpthar_Forest = 201
    zone.Northshire = 425
    zone.Gilneas_City = 202
    zone.Eastern_Kingdoms = 13
    zone.Twilight_Highlands = 241
    zone.Redridge_Mountains = 49
    zone.The_Hinterlands = 26
    zone.Swamp_of_Sorrows = 51
    zone.Silverpine_Forest = 21
    zone.Abyssal_Depths = 204
    zone.Sunstrider_Isle = 467
    zone.Badlands = 15
    zone.Ruins_of_Gilneas = 217
    zone.Stormwind_City = 84
    zone.Northern_Stranglethorn = 37
    zone.Elwynn_Forest = 37
    zone.Ruins_of_Gilneas_City = 218
    zone.Stranglethorn_Vale = 224
    zone.Isle_of_QuelDanas = 122
    zone.Ironforge = 87
    zone.Deadwind_Pass = 42
    zone.Tol_Barad = 244

    ---------------------------
    -- Outlands --
    ---------------------------
    zone.Zangarmarsh = 102
    zone.Netherstorm = 109
    zone.Shattrath_City = 111
    zone.Hellfire_Peninsula = 100
    zone.Terokkar_Forest = 108
    zone.Shadowmoon_Valley = 104
    zone.Outland = 101
    zone.Nagrand = 107
    zone.Blades_Edge_Mountains = 105

    ---------------------------
    -- Northrend --
    ---------------------------
    zone.Icecrown = 118
    zone.Wintergrasp = 123
    zone.The_Storm_Peaks = 120
    zone.Dalaran = 125
    zone.Hrothgars_Landing = 170
    zone.Howling_Fjord = 117
    zone.Sholazar_Basin = 119
    zone.Grizzly_Hills = 116
    zone.Northrend = 113
    zone.Crystalsong_Forest = 127
    zone.Dragonblight = 115
    zone.ZulDrak = 121
    zone.Borean_Tundra = 114

    ---------------------------
    -- The Broken Isles --
    ---------------------------
    zone.Broken_Isles = 619
    zone.Broken_Shore = 646
    zone.Highmountain = 650
    zone.Dalaran = 625
    zone.Valsharah = 641
    zone.Stormheim = 634
    zone.Suramar = 680
    zone.Azuna = 630
    zone.Eye_of_Azshara = 790

    ---------------------------
    -- The Maelstrom --
    ---------------------------
    zone.Kezan = 194
    zone.Deepholm = 207
    zone.The_Lost_Isles = 174
    zone.The_Maelstrom = 276

    ---------------------------
    -- Pandaria --
    ---------------------------
    zone.Pandaria = 424
    zone.Kun_Lai_Summit = 379
    zone.Valley_of_the_FourvWind = 376
    zone.Krasarang_Wilds = 418
    zone.Vale_of_Eternal_Blossoms = 390
    zone.The_Veiled_Stair = 433
    zone.Isle_of_Giants = 507
    zone.Townlong_Steppes = 388
    zone.The_Jade_Forest = 371
    zone.Dread_Wastes = 422
    zone.Timeless_Isle = 554
    zone.The_Wandering_Isle = 378
    zone.Isle_of_Thunder = 504

    ---------------------------
    -- Draenor --
    ---------------------------
    zone.Ashran = 588
    zone.Lunarfall = 579
    zone.Gorgrond = 543
    zone.Draenor = 572
    zone.Spires_of_Arak = 542
    zone.Warspear = 624
    zone.Shadowmoon_Valley = 539
    zone.Tanaan_Jungle_Assault_on_the_Dark_Portal = 577
    zone.Tanaan_Jungle = 534
    zone.Talador = 535
    zone.Stormshield = 622
    zone.Frostwall = 585
    zone.Frostfire_Ridge = 525
    zone.Nagrand_WoD = 550

    ---------------------------
    -- Shadowlands --
    ---------------------------
    zone.The_Maw = 1543
    zone.Maldraxxus = 1536
    zone.Bastion = 1533
    zone.Ardenweald = 1565
    zone.Revendreth = 1525
    zone.Korthia = 1961
    zone.ZerethMortis = 13536

    ---------------------------
    -- Battlegrounds --
    ---------------------------
    zone.Temple_of_Kotmogu = 417
    zone.Alterac_Valley = 91
    zone.Eye_of_the_Storm = 112
    zone.The_Battle_for_Gilneas = 275
    zone.Warsong_Gulch = 92
    zone.Twin_Peaks = 206
    zone.Silvershard_Mines = 423
    zone.Strand_of_the_Ancients = 128
    zone.Isle_of_Conquest = 169
    zone.Arathi_Basin = 93
    zone.Deepwind_Gorge = 519

    ---------------------------
    -- Scenarios --
    ---------------------------
    zone.Battle_on_the_High_Seas = 524
    zone.Greenstone_Village = 448
    zone.Domination_Point_H = 498
    zone.Arena_of_Annihilation = 480
    zone.Blood_in_the_Snow = 523
    zone.Assault_on_Zanvess = 451
    zone.A_Little_Patience = 487
    zone.Theramores_Fall_A = 483
    zone.The_Secrets_of_Ragefire = 522
    zone.Crypt_of_Forgotten_Kings = 481
    zone.Brewmoon_Festival = 452
    zone.A_Brewing_Storm = 447
    zone.Celestial_Tournament = 571
    zone.Theramores_Fall_H = 416
    zone.Unga_Ingoo = 450
    zone.Lions_Landing_A = 486
    zone.Dark_Heart_of_Pandaria = 520
    zone.Dagger_in_the_Dark = 488

    ---------------------------
    -- Classic Dungeons --
    ---------------------------
    zone.Blackrock_Spire = 250
    zone.The_Deadmines = 291
    zone.Stratholme = 317
    zone.Maraudon = 280
    zone.Wailing_Caverns = 279
    zone.Razorfen_Downs = 300
    zone.Ragefire_Chasm = 213
    zone.The_Temple_of_AtalHakkar = 220
    zone.Razorfen_Kraul = 301
    zone.ZulFarrak = 219
    zone.Blackfathom_Deeps = 221
    zone.Dire_Maul = 234
    zone.The_Stockade = 225
    zone.Uldaman = 230
    zone.Blackrock_Depths = 242
    zone.Shadowfang_Keep = 310
    zone.Gnomeregan = 226

    ---------------------------
    -- Classic Raids --
    ---------------------------
    zone.Molten_Core = 232
    zone.Blackwing_Lair = 287
    zone.Ruins_of_AhnQiraj = 247
    zone.Temple_of_AhnQiraj = 319

    ---------------------------
    -- Burning Crusade Dungeons --
    ---------------------------
    zone.The_Underbog = 262
    zone.The_Steamvault = 263
    zone.Sethekk_Halls = 258
    zone.The_Botanica = 266
    zone.Mana_Tombs = 272
    zone.Hellfire_Ramparts = 347
    zone.The_Black_Morass = 273
    zone.The_Shattered_Halls = 246
    zone.Magisters_Terrace = 348
    zone.The_Mechanar = 267
    zone.The_Blood_Furnace = 261
    zone.The_Slave_Pens = 265
    zone.Shadow_Labyrinth = 260
    zone.Auchenai_Crypts = 256
    zone.Old_Hillsbrad_Foothills = 274
    zone.The_Arcatraz = 269

    ---------------------------
    -- Burning Crusade Raids --
    ---------------------------
    zone.Black_Temple = 339
    zone.Serpentshrine_Cavern = 332
    zone.Magtheridons_Lair = 331
    zone.Karazhan = 350
    zone.Gruuls_Lair = 330
    zone.The_Eye = 334
    zone.Hyjal_Summit = 329
    zone.Sunwell_Plateau = 335

    ---------------------------
    -- Wrath Dungeons --
    ---------------------------
    zone.Utgarde_Pinnacle = 136
    zone.Gundrak = 153
    zone.The_Oculus = 142
    zone.DrakTharon_Keep = 160
    zone.Azjol_Nerub = 157
    zone.The_Forge_of_Souls = 183
    zone.Ahnkahet_The_Old_Kingdom = 132
    zone.The_Violet_Hold = 168
    zone.The_Nexus = 129
    zone.Trial_of_the_Champion = 171
    zone.Pit_of_Saron = 184
    zone.Halls_o_Lightning = 138
    zone.The_Culling_of_Stratholme = 130
    zone.Utgarde_Keep = 133
    zone.Halls_of_Stone = 140
    zone.Halls_of_Reflection = 185

    ---------------------------
    -- Wrath Raids --
    ---------------------------
    zone.The_Eye_of_Eternity = 141
    zone.The_Ruby_Sanctum = 200
    zone.Icecrown_Citadel = 186
    zone.Naxxramas = 162
    zone.Ulduar = 147
    zone.Onyxias_Lair = 248
    zone.Trial_of_the_Crusader = 172
    zone.Vault_of_Archavon = 156
    zone.The_Obsidian_Sanctum = 155

    ---------------------------
    -- Cataclysm Dungeons --
    ---------------------------
    zone.Lost_City_of_thevTolvir = 277
    zone.End_Time = 401
    zone.The_Vortex_Pinnacle = 325
    zone.Halls_of_Origination = 297
    zone.Throne_of_the_Tides = 322
    zone.ZulGurub = 337
    zone.Grim_Batol = 293
    zone.ZulAman = 333
    zone.The_Stonecore = 324
    zone.Well_of_Eternity = 398
    zone.Blackrock_Caverns = 283
    zone.Hour_of_Twilight = 399

    ---------------------------
    -- Cataclysm Raids --
    ---------------------------
    zone.Firelands = 367
    zone.Dragon_Soul = 409
    zone.Blackwing_Descent = 285
    zone.Throne_of_the_Four_Winds = 328
    zone.The_Bastion_of_Twilight = 294
    zone.Baradin_Hold = 282

    ---------------------------
    -- Pandaria Dungeons --
    ---------------------------
    zone.Gate_of_the_Setting_Sun = 437
    zone.Shado_pan_Monastery = 443
    zone.Scholomance = 476
    zone.Stormstout_Brewery = 439
    zone.Temple_of_the_Jade_Serpen = 429
    zone.MoguShan_Palace = 453
    zone.Scarlet_Monastery = 435
    zone.Scarlet_Halls = 431
    zone.Siege_of_Niuzao_Temple = 457

    ---------------------------
    -- Pandaria Raids --
    ---------------------------
    zone.Siege_of_Orgrimmar = 556
    zone.Throne_of_Thunder = 508
    zone.Terrace_of_Endless_Spring = 456
    zone.Mogushan_Vaults = 471
    zone.Heart_of_Fear = 474

    ---------------------------
    -- Draenor Dungeons --
    ---------------------------
    zone.Upper_Blackrock_Spire = 616
    zone.Skyreach = 601
    zone.The_Everbloom = 620
    zone.Bloodmaul_Slag_Mines = 573
    zone.Shadowmoon_Burial_Grounds = 574
    zone.Auchindoun = 593
    zone.Grimrail_Depot = 606
    zone.Iron_Docks = 595

    ---------------------------
    -- Draenor Raids --
    ---------------------------
    zone.Blackrock_Foundry = 596
    zone.Highmaul = 610
    zone.Hellfire_Citadel = 661

    ---------------------------
    -- Legion Dungeons --
    ---------------------------
    zone.Vault_of_the_Wardens = 710
    zone.The_Arcway = 749
    zone.Cathedral_of_Eternal_Night = 845
    zone.Darkheart_Thicket = 733
    zone.Halls_of_Valor = 703
    zone.Eye_of_Azshara = 713
    zone.Maw_of_Souls = 706
    zone.Violet_Hold = 732
    zone.Return_to_Karazhan = 809
    zone.Seat_of_The_Triumvirate = 903
    zone.Neltharions_Lair = 731
    zone.Black_Rook_Hold = 751
    zone.Court_of_Stars = 761

    ---------------------------
    -- Legion Raids --
    ---------------------------
    zone.The_Emerald_Nightmare = 777
    zone.Tomb_of_Sargeras = 850
    zone.Trial_of_Valor = 806
    zone.Antorus_the_Burning_Throne = 909
    zone.The_Nighthold = 764

    ---------------------------
    -- Shadowlands Dungeons --
    ---------------------------
    zone.Halls_of_Atonement = 1663

    ---------------------------
    -- Dragonflight zones --
    ---------------------------
    zone.Emerald_dream = 2200
    zone.The_Waking_Shores = 2022
    zone.Dawn_Of_The_Infinite = 2198
  end

  REP.zone = zone
end
