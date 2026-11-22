----------------------------------------------------------
-- Reputation Guide | Reputation sources: Wrath of the Lich King --
-- Factions (and sources) added in Wrath of the Lich King. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(1106, { -- Argent Crusade
  Mob{ from = 4, to = 8, text = "cryptSlayerCryptStalkerCryptWalkerCrypt", rep = 5, zone = "Eastern_Plaguelands", since = "cata" }, -- MobId: 8558, 8555, 8556, 8557
  Mob{ from = 4, to = 8, text = "vileTutorDarkSummonerGibberingGhoulHate", rep = 5, zone = "Eastern_Plaguelands", since = "cata" }, -- MobId: 8548, 8551, 8531, 8541
  Mob{ from = 4, to = 8, text = "stitchedHorrorUnseenServantScourgeWarder", rep = 5, zone = "Eastern_Plaguelands", since = "cata" }, -- MobId: 8543, 8538, 8525
  Mob{ from = 4, to = 8, text = "cursedMageCannibalGhoulScourgeSoldierOverstuffed", rep = 5, zone = "Eastern_Plaguelands", since = "cata" }, -- MobId: 8524, 8530, 8523, 45851
  Quest{ from = 4, to = 8, id = 12587, rep = 350, since = "wotlk" }, -- Troll Patrol QuestID: 12587
  Quest{ from = 4, to = 8, id = 12604, notRetail = true, name = "Congratulations!", rep = 500, since = "wotlk" }, -- Congratulations! QuestID: 12604
  Quest{ from = 4, to = 8, id = 13300, rep = 325, since = "wotlk", side = "Alliance" }, -- Slaves to Saronite QuestID: 13300
  Quest{ from = 4, to = 8, id = 13302, rep = 325, since = "wotlk", side = "Horde" }, -- Slaves to Saronite QuestID: 13302
  Quest{ from = 4, to = 8, id = 13809, rep = 325, since = "wotlk", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13809
  Quest{ from = 4, to = 8, id = 13810, rep = 325, since = "wotlk", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13810
  Quest{ from = 4, to = 8, id = 13862, rep = 325, since = "wotlk", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13862
  Quest{ from = 4, to = 8, id = 13811, rep = 325, since = "wotlk", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13811
  Item{ from = 4, to = 8, rep = 400, items = {[44711] = 1}, since = "wotlk", before = "wod" }, -- Argent Crusade Commendation Badge
  Item{ from = 1, to = 8, rep = 500, items = {[129942] = 1}, since = "wod" },
  General{ from = 5, to = 8, text = "killingMobsInInstancesWhileWearingThe3", rep = 5, headText = "killingMobsInInstancesWhileWearingThe3", tipText = "killingMobsInInstancesWhileWearingThe4", since = "wotlk" },
})

REP:RegisterFaction(1090, { -- Kirin Tor
  Quest{ from = 4, to = 8, text = "dalaranJewelcraftingDaily", rep = 25, profession = "Jewelcrafting", since = "wotlk" },
  Quest{ from = 4, to = 8, text = "dalaranCookingDaily", rep = 150, profession = "Cooking", since = "wotlk" },
  Quest{ from = 4, to = 8, text = "dalaranFishingDaily", rep = 250, profession = "Fishing", since = "wotlk" },
  Quest{ from = 4, to = 8, id = 14203, notRetail = true, name = "Waterlogged Recipe", rep = 250, items = {[49667] = 1}, since = "wotlk" }, -- Waterlogged Recipe QuestID: 14203 (Somehow doesn't give questname from API)
  Quest{ from = 4, to = 8, id = 13845, rep = 250, items = {[46005] = 1}, since = "wotlk" }, -- Sealed Vial of Poison QuestID: 13845
  Item{ from = 4, to = 8, rep = 400, items = {[43950] = 1}, since = "wotlk", before = "wod" }, -- Kirin Tor Commendation Badge
  Item{ from = 1, to = 8, rep = 500, items = {[129940] = 1}, since = "wod" },
  General{ from = 5, to = 8, text = "killingMobsInInstancesWhileWearingThe5", rep = 5, headText = "killingMobsInInstancesWhileWearingThe5", tipText = "killingMobsInInstancesWhileWearingThe6", since = "wotlk" },
})

REP:RegisterFaction(1098, { -- Knights of the Ebon Blade
  Quest{ from = 4, to = 8, id = 12813, rep = 250, since = "wotlk" }, -- From Their Corpses, Rise! QuestID: 12813
  Quest{ from = 4, to = 8, id = 12838, rep = 250, since = "wotlk" }, -- Intelligence Gathering QuestID: 12838
  Quest{ from = 4, to = 8, id = 12995, rep = 250, since = "wotlk" }, -- Leave Our Mark QuestID: 12995
  Quest{ from = 4, to = 8, id = 12815, rep = 250, since = "wotlk" }, -- No Fly Zone QuestID: 12815
  Quest{ from = 4, to = 8, id = 13071, rep = 250, since = "wotlk" }, -- Vile Like Fire! QuestID: 13071
  Quest{ from = 4, to = 8, id = 13069, rep = 250, since = "wotlk" }, -- Shoot 'Em Up QuestID: 13069
  Quest{ from = 4, to = 8, id = 13093, rep = 10, items = {[43089] = 10}, since = "wotlk" }, -- Reading the Bones QuestID: 13093
  Quest{ from = 4, to = 8, id = 13793, rep = 325, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13793
  Quest{ from = 4, to = 8, id = 13864, rep = 325, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13864
  Quest{ from = 4, to = 8, id = 13791, rep = 325, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13791
  Quest{ from = 4, to = 8, id = 13788, rep = 250, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13788
  Quest{ from = 4, to = 8, id = 13814, rep = 325, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13814
  Quest{ from = 4, to = 8, id = 13863, rep = 325, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13863
  Quest{ from = 4, to = 8, id = 13813, rep = 325, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13813
  Quest{ from = 4, to = 8, id = 13812, rep = 250, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13812
  Item{ from = 4, to = 8, rep = 400, items = {[44713] = 1}, since = "wotlk", before = "wod" }, -- Knights of the Ebon Blade Commendation Badge
  Item{ from = 1, to = 8, rep = 500, items = {[129941] = 1}, since = "wod" },
  General{ from = 5, to = 8, text = "killingMobsInInstancesWhileWearingThe7", rep = 5, headText = "killingMobsInInstancesWhileWearingThe7", tipText = "killingMobsInInstancesWhileWearingThe8", since = "wotlk" },
})

REP:RegisterFaction(1156, { -- The Ashen Verdict
  Instance{ from = 4, to = 8, instance = "Icecrown_Citadel", rep = 2070, heroic = false, since = "wotlk" },
  Instance{ from = 4, to = 8, instance = "Icecrown_Citadel", rep = 1005, heroic = false, since = "wotlk" },
})

REP:RegisterFaction(1073, { -- The Kalu'ak
  Quest{ from = 4, to = 8, id = 11945, rep = 500, items = {[35711] = 8}, since = "wotlk" }, -- Preparing for the Worst QuestID: 11945
  Quest{ from = 4, to = 8, id = 11960, rep = 500, items = {[35692] = 12}, since = "wotlk" }, -- Planning for the Future QuestID: 11960
  Quest{ from = 4, to = 8, id = 11472, rep = 500, since = "wotlk" }, -- The Way to His Heart... QuestID: 11472
})

REP:RegisterFaction(1119, { -- The Sons of Hodir
  Quest{ from = 5, to = 8, id = 13559, rep = 500, items = {[42780] = 10}, since = "wotlk" }, -- Hodir's Tribute QuestID: 13559
  Quest{ from = 5, to = 8, id = 13421, rep = 350, items = {[44724] = 1}, since = "wotlk" }, -- Remember Everfrost! QuestID: 13421
  Quest{ from = 5, to = 8, id = 13006, rep = 350, items = {[42640] = 5}, since = "wotlk" }, -- A Viscous Cleaning QuestID: 13006
  Quest{ from = 5, to = 8, id = 12981, rep = 350, items = {[42252] = 6}, since = "wotlk" }, -- Hot and Cold QuestID: 12981
  Quest{ from = 5, to = 8, id = 12977, rep = 350, since = "wotlk" }, -- Hodir's Call QuestID: 12977
  Quest{ from = 6, to = 8, id = 12994, rep = 350, since = "wotlk" }, -- Spy Hunter QuestID: 12994
  Quest{ from = 6, to = 8, id = 13003, rep = 500, since = "wotlk" }, -- How To Slay Your Dragon QuestID: 13003
  Quest{ from = 7, to = 8, id = 13046, rep = 350, since = "wotlk" }, -- Feeding Arngrim QuestID: 13046
  Item{ from = 4, to = 8, rep = 400, items = {[49702] = 1}, since = "wotlk", before = "wod" }, -- The Sons of Hodir Commendation Badge
  Item{ from = 1, to = 8, rep = 501, items = {[129943] = 1}, since = "wod" },
})

REP:RegisterFaction(1091, { -- The Wyrmrest Accord
  Quest{ from = 4, to = 8, id = 11940, rep = 250, since = "wotlk" }, -- Drake Hunt QuestID: 11940
  Quest{ from = 4, to = 8, id = 12372, rep = 250, since = "wotlk" }, -- Defending Wyrmrest Temple QuestID: 12372
  Quest{ from = 4, to = 8, id = 13414, rep = 250, since = "wotlk" }, -- Aces High! QuestID: 13414
  Item{ from = 4, to = 8, rep = 400, items = {[44710] = 1}, since = "wotlk", before = "wod" }, -- The Wyrmrest Accord Commendation Badge
  Item{ from = 1, to = 8, rep = 500, items = {[129944] = 1}, since = "wod" },
  General{ from = 5, to = 8, text = "killingMobsInInstancesWhileWearingThe9", rep = 5, headText = "killingMobsInInstancesWhileWearingThe9", tipText = "killingMobsInInstancesWhileWearingThe10", since = "wotlk" },
  Instance{ from = 5, to = 8, code = 5, rep = 800, heroic = false, expansion = "cata", since = "wotlk" },
  Instance{ from = 5, to = 8, code = 5, rep = 2000, heroic = true, expansion = "cata", since = "wotlk" },
})

REP:RegisterFaction(1104, { -- Frenzyheart Tribe
  Quest{ from = 1, to = 5, id = 12582, rep = 51000, since = "wotlk" }, -- Frenzyheart Champion QuestID: 12582
  Quest{ from = 6, to = 8, id = 12703, rep = 700, since = "wotlk" }, -- Kartak's Rampage QuestID: 12703
  Quest{ from = 6, to = 8, id = 12759, rep = 700, since = "wotlk" }, -- Tools of War QuestID: 12759
  Quest{ from = 6, to = 8, id = 12760, rep = 700, since = "wotlk" }, -- Secret Strength of the Frenzyheart QuestID: 12760
  Quest{ from = 6, to = 8, id = 12758, rep = 500, since = "wotlk" }, -- A Hero's Headgear QuestID: 12758
  Quest{ from = 6, to = 8, id = 12702, rep = 500, since = "wotlk" }, -- Chicken Party! QuestID: 12702
  Quest{ from = 6, to = 8, id = 12734, rep = 500, since = "wotlk" }, -- Rejek: First Blood QuestID: 12734
  Quest{ from = 6, to = 8, id = 12741, rep = 500, since = "wotlk" }, -- Strength of the Tempest QuestID: 12741
  Quest{ from = 6, to = 8, id = 12732, rep = 500, since = "wotlk" }, -- The Heartblood's Strength QuestID: 12732
})

REP:RegisterFaction(1105, { -- The Oracles
  Quest{ from = 1, to = 5, id = 12689, rep = 51000, since = "wotlk" }, -- Hand of the Oracles QuestID: 12689
  Quest{ from = 6, to = 8, id = 12761, rep = 700, since = "wotlk" }, -- Mastery of the Crystals QuestID: 12761
  Quest{ from = 6, to = 8, id = 12705, rep = 700, since = "wotlk" }, -- Will of the Titans QuestID: 12705
  Quest{ from = 6, to = 8, id = 12762, rep = 700, since = "wotlk" }, -- Power of the Great Ones QuestID: 12762
  Quest{ from = 6, to = 8, id = 12704, rep = 500, since = "wotlk" }, -- Appeasing the Great Rain Stone QuestID: 12704
  Quest{ from = 6, to = 8, id = 12735, rep = 500, since = "wotlk" }, -- A Cleansing Song QuestID: 12735
  Quest{ from = 6, to = 8, id = 12737, rep = 500, since = "wotlk" }, -- Song of Fecundity QuestID: 12737
  Quest{ from = 6, to = 8, id = 12736, rep = 500, since = "wotlk" }, -- Song of Reflection QuestID: 12736
  Quest{ from = 6, to = 8, id = 12726, rep = 500, since = "wotlk" }, -- Song of Wind and Water QuestID: 12726
})

REP:RegisterFaction(1037, { -- Alliance Vanguard
  Quest{ from = 4, to = 8, id = 11391, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Steel Gate Patrol QuestID: 11391
  Quest{ from = 4, to = 8, id = 12869, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Pushed Too Far QuestID: 12869
  Quest{ from = 4, to = 8, id = 13671, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Training In The Field QuestID: 13671
  Quest{ from = 4, to = 8, id = 13625, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Learning The Reins QuestID: 13625
  Quest{ from = 4, to = 8, id = 11153, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Break the Blockade QuestID: 11153
  Quest{ from = 4, to = 8, id = 13309, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Air QuestID: 13309
  Quest{ from = 4, to = 8, id = 13284, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Ground QuestID: 13284
  Quest{ from = 4, to = 8, id = 13336, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blood of the Chosen QuestID: 13336
  Quest{ from = 4, to = 8, id = 13280, rep = 62.5, since = "wotlk", side = "Alliance" }, -- King of the Mountain QuestID: 13280
  Quest{ from = 4, to = 8, id = 12444, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blackriver Skirmish QuestID: 12444
  Quest{ from = 4, to = 8, id = 12296, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Life or Death QuestID: 12296
  Quest{ from = 4, to = 8, id = 12289, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Kick 'Em While They're Down QuestID: 12289
  Quest{ from = 4, to = 8, id = 12268, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Pieces Parts QuestID: 12268
  Quest{ from = 4, to = 8, id = 12244, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Shredder Repair QuestID: 12244
  Quest{ from = 4, to = 8, id = 13666, rep = 62.5, since = "wotlk", side = "Alliance" }, -- A Blade Fit For A Champion QuestID: 13666
  Quest{ from = 4, to = 8, id = 33625, notRetail = true, rep = 62.5, since = "wotlk", side = "Alliance" }, -- The Edge Of Winter QuestID: 33625
  Quest{ from = 4, to = 8, id = 13600, rep = 62.5, since = "wotlk", side = "Alliance" }, -- A Worthy Weapon QuestID: 13600
  Quest{ from = 4, to = 8, id = 13847, rep = 62.5, since = "wotlk", side = "Alliance" }, -- At The Enemy's Gates QuestID: 13847
  Quest{ from = 4, to = 8, id = 13665, rep = 62.5, since = "wotlk", side = "Alliance" }, -- The Grand Melee QuestID: 13665
  Quest{ from = 4, to = 8, id = 13788, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13788
  Quest{ from = 4, to = 8, id = 13791, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13791
  Quest{ from = 4, to = 8, id = 13864, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13864
  Quest{ from = 4, to = 8, id = 13793, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13793
  Quest{ from = 4, to = 8, id = 13682, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13682
  Quest{ from = 4, to = 8, id = 13789, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13789
  Quest{ from = 4, to = 8, id = 13861, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13861
  Quest{ from = 4, to = 8, id = 13790, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13790
  Instance{ from = 4, to = 8, code = 1, rep = 3000, heroic = true, since = "wotlk", side = "Alliance" },
  Item{ from = 1, to = 8, rep = 500, items = {[129955] = 1}, since = "wod", side = "Alliance" },
})

REP:RegisterFaction(1068, { -- Explorer's League
  Quest{ from = 4, to = 8, id = 11391, rep = 125, since = "wotlk", side = "Alliance" }, -- Steel Gate Patrol QuestID: 11391
  Quest{ from = 4, to = 8, id = 12869, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Pushed Too Far QuestID: 12869
  Quest{ from = 4, to = 8, id = 13671, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Training In The Field QuestID: 13671
  Quest{ from = 4, to = 8, id = 13625, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Learning The Reins QuestID: 13625
  Quest{ from = 4, to = 8, id = 11153, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Break the Blockade QuestID: 11153
  Quest{ from = 4, to = 8, id = 13309, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Air QuestID: 13309
  Quest{ from = 4, to = 8, id = 13284, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Ground QuestID: 13284
  Quest{ from = 4, to = 8, id = 13336, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blood of the Chosen QuestID: 13336
  Quest{ from = 4, to = 8, id = 13280, rep = 62.5, since = "wotlk", side = "Alliance" }, -- King of the Mountain QuestID: 13280
  Quest{ from = 4, to = 8, id = 12444, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blackriver Skirmish QuestID: 12444
  Quest{ from = 4, to = 8, id = 12296, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Life or Death QuestID: 12296
  Quest{ from = 4, to = 8, id = 12289, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Kick 'Em While They're Down QuestID: 12289
  Quest{ from = 4, to = 8, id = 12268, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Pieces Parts QuestID: 12268
  Quest{ from = 4, to = 8, id = 12244, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Shredder Repair QuestID: 12244
  Quest{ from = 4, to = 8, id = 13666, rep = 125, since = "wotlk", side = "Alliance" }, -- A Blade Fit For A Champion QuestID: 13666
  Quest{ from = 4, to = 8, id = 33625, notRetail = true, rep = 125, since = "wotlk", side = "Alliance" }, -- The Edge Of Winter QuestID: 33625
  Quest{ from = 4, to = 8, id = 13600, rep = 125, since = "wotlk", side = "Alliance" }, -- A Worthy Weapon QuestID: 13600
  Quest{ from = 4, to = 8, id = 13847, rep = 125, since = "wotlk", side = "Alliance" }, -- At The Enemy's Gates QuestID: 13847
  Quest{ from = 4, to = 8, id = 13665, rep = 125, since = "wotlk", side = "Alliance" }, -- The Grand Melee QuestID: 13665
  Quest{ from = 4, to = 8, id = 13788, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13788
  Quest{ from = 4, to = 8, id = 13791, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13791
  Quest{ from = 4, to = 8, id = 13864, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13864
  Quest{ from = 4, to = 8, id = 13793, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13793
  Quest{ from = 4, to = 8, id = 13682, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13682
  Quest{ from = 4, to = 8, id = 13789, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13789
  Quest{ from = 4, to = 8, id = 13861, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13861
  Quest{ from = 4, to = 8, id = 13790, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13790
  Instance{ from = 4, to = 8, code = 1, rep = 1500, heroic = true, since = "wotlk", side = "Alliance" },
})

REP:RegisterFaction(1126, { -- The Frostborn
  Quest{ from = 4, to = 8, id = 11391, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Steel Gate Patrol QuestID: 11391
  Quest{ from = 4, to = 8, id = 12869, rep = 125, since = "wotlk", side = "Alliance" }, -- Pushed Too Far QuestID: 12869
  Quest{ from = 4, to = 8, id = 13671, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Training In The Field QuestID: 13671
  Quest{ from = 4, to = 8, id = 13625, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Learning The Reins QuestID: 13625
  Quest{ from = 4, to = 8, id = 11153, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Break the Blockade QuestID: 11153
  Quest{ from = 4, to = 8, id = 13309, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Air QuestID: 13309
  Quest{ from = 4, to = 8, id = 13284, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Ground QuestID: 13284
  Quest{ from = 4, to = 8, id = 13336, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blood of the Chosen QuestID: 13336
  Quest{ from = 4, to = 8, id = 13280, rep = 62.5, since = "wotlk", side = "Alliance" }, -- King of the Mountain QuestID: 13280
  Quest{ from = 4, to = 8, id = 12444, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blackriver Skirmish QuestID: 12444
  Quest{ from = 4, to = 8, id = 12296, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Life or Death QuestID: 12296
  Quest{ from = 4, to = 8, id = 12289, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Kick 'Em While They're Down QuestID: 12289
  Quest{ from = 4, to = 8, id = 12268, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Pieces Parts QuestID: 12268
  Quest{ from = 4, to = 8, id = 12244, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Shredder Repair QuestID: 12244
  Quest{ from = 4, to = 8, id = 13666, rep = 62.5, since = "wotlk", side = "Alliance" }, -- A Blade Fit For A Champion QuestID: 13666
  Quest{ from = 4, to = 8, id = 33625, notRetail = true, rep = 62.5, since = "wotlk", side = "Alliance" }, -- The Edge Of Winter QuestID: 33625
  Quest{ from = 4, to = 8, id = 13600, rep = 62.5, since = "wotlk", side = "Alliance" }, -- A Worthy Weapon QuestID: 13600
  Quest{ from = 4, to = 8, id = 13847, rep = 62.5, since = "wotlk", side = "Alliance" }, -- At The Enemy's Gates QuestID: 13847
  Quest{ from = 4, to = 8, id = 13665, rep = 62.5, since = "wotlk", side = "Alliance" }, -- The Grand Melee QuestID: 13665
  Quest{ from = 4, to = 8, id = 13788, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13788
  Quest{ from = 4, to = 8, id = 13791, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13791
  Quest{ from = 4, to = 8, id = 13864, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13864
  Quest{ from = 4, to = 8, id = 13793, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13793
  Quest{ from = 4, to = 8, id = 13682, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13682
  Quest{ from = 4, to = 8, id = 13789, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13789
  Quest{ from = 4, to = 8, id = 13861, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13861
  Quest{ from = 4, to = 8, id = 13790, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13790
  Instance{ from = 4, to = 8, code = 1, rep = 1500, heroic = true, since = "wotlk", side = "Alliance" },
})

REP:RegisterFaction(1094, { -- The Silver Covenant
  Quest{ from = 4, to = 8, id = 11391, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Steel Gate Patrol QuestID:
  Quest{ from = 4, to = 8, id = 12869, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Pushed Too Far QuestID: 12869
  Quest{ from = 4, to = 8, id = 13759, rep = 62.5, since = "wotlk", side = "Alliance" }, -- The Edge Of Winter QuestID: 13759
  Quest{ from = 4, to = 8, id = 13671, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Training In The Field QuestID: 13671
  Quest{ from = 4, to = 8, id = 13625, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Learning The Reins QuestID: 13625
  Quest{ from = 4, to = 8, id = 11153, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Break the Blockade QuestID: 11153
  Quest{ from = 4, to = 8, id = 13309, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Air QuestID: 13309
  Quest{ from = 4, to = 8, id = 13284, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Ground QuestID: 13284
  Quest{ from = 4, to = 8, id = 13336, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blood of the Chosen QuestID: 13336
  Quest{ from = 4, to = 8, id = 13280, rep = 62.5, since = "wotlk", side = "Alliance" }, -- King of the Mountain QuestID: 13280
  Quest{ from = 4, to = 8, id = 12444, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blackriver Skirmish QuestID: 12444
  Quest{ from = 4, to = 8, id = 12296, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Life or Death QuestID: 12296
  Quest{ from = 4, to = 8, id = 12289, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Kick 'Em While They're Down QuestID: 12289
  Quest{ from = 4, to = 8, id = 12268, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Pieces Parts QuestID: 12268
  Quest{ from = 4, to = 8, id = 12244, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Shredder Repair QuestID: 12244
  Quest{ from = 4, to = 8, id = 13666, rep = 62.5, since = "wotlk", side = "Alliance" }, -- A Blade Fit For A Champion QuestID: 13666
  Quest{ from = 4, to = 8, id = 13600, rep = 62.5, since = "wotlk", side = "Alliance" }, -- A Worthy Weapon QuestID: 13600
  Quest{ from = 4, to = 8, id = 13847, rep = 62.5, since = "wotlk", side = "Alliance" }, -- At The Enemy's Gates QuestID: 13847
  Quest{ from = 4, to = 8, id = 13665, rep = 62.5, since = "wotlk", side = "Alliance" }, -- The Grand Melee QuestID: 13665
  Quest{ from = 4, to = 8, id = 13788, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13788
  Quest{ from = 4, to = 8, id = 13791, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13791
  Quest{ from = 4, to = 8, id = 13864, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13864
  Quest{ from = 4, to = 8, id = 13793, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13793
  Quest{ from = 4, to = 8, id = 13682, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13682
  Quest{ from = 4, to = 8, id = 13789, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13789
  Quest{ from = 4, to = 8, id = 13861, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13861
  Quest{ from = 4, to = 8, id = 13790, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13790
  Instance{ from = 4, to = 8, code = 1, rep = 1500, heroic = true, since = "wotlk", side = "Alliance" },
})

REP:RegisterFaction(1050, { -- Valiance Expedition
  Quest{ from = 4, to = 8, id = 11391, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Steel Gate Patrol QuestID: 11391
  Quest{ from = 4, to = 8, id = 12869, rep = 125, since = "wotlk", side = "Alliance" }, -- Pushed Too Far QuestID: 12869
  Quest{ from = 4, to = 8, id = 13671, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Training In The Field QuestID: 13671
  Quest{ from = 4, to = 8, id = 13625, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Learning The Reins QuestID: 13625
  Quest{ from = 4, to = 8, id = 11153, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Break the Blockade QuestID: 11153
  Quest{ from = 4, to = 8, id = 13309, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Air QuestID: 13309
  Quest{ from = 4, to = 8, id = 13284, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Assault by Ground QuestID: 13284
  Quest{ from = 4, to = 8, id = 13336, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blood of the Chosen QuestID: 13336
  Quest{ from = 4, to = 8, id = 13280, rep = 62.5, since = "wotlk", side = "Alliance" }, -- King of the Mountain QuestID: 13280
  Quest{ from = 4, to = 8, id = 12444, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Blackriver Skirmish QuestID: 12444
  Quest{ from = 4, to = 8, id = 12296, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Life or Death QuestID: 12296
  Quest{ from = 4, to = 8, id = 12289, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Kick 'Em While They're Down QuestID: 12289
  Quest{ from = 4, to = 8, id = 12268, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Pieces Parts QuestID: 12268
  Quest{ from = 4, to = 8, id = 12244, rep = 62.5, since = "wotlk", side = "Alliance" }, -- Shredder Repair QuestID: 12244
  Quest{ from = 4, to = 8, id = 13666, rep = 62.5, since = "wotlk", side = "Alliance" }, -- A Blade Fit For A Champion QuestID: 13666
  Quest{ from = 4, to = 8, id = 33625, notRetail = true, rep = 62.5, since = "wotlk", side = "Alliance" }, -- The Edge Of Winter QuestID: 33625
  Quest{ from = 4, to = 8, id = 13600, rep = 62.5, since = "wotlk", side = "Alliance" }, -- A Worthy Weapon QuestID: 13600
  Quest{ from = 4, to = 8, id = 13847, rep = 62.5, since = "wotlk", side = "Alliance" }, -- At The Enemy's Gates QuestID: 13847
  Quest{ from = 4, to = 8, id = 13665, rep = 62.5, since = "wotlk", side = "Alliance" }, -- The Grand Melee QuestID: 13665
  Quest{ from = 4, to = 8, id = 13788, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13788
  Quest{ from = 4, to = 8, id = 13791, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13791
  Quest{ from = 4, to = 8, id = 13864, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13864
  Quest{ from = 4, to = 8, id = 13793, rep = 125, since = "wotlk", side = "Alliance", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13793
  Quest{ from = 4, to = 8, id = 13682, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13682
  Quest{ from = 4, to = 8, id = 13789, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13789
  Quest{ from = 4, to = 8, id = 13861, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13861
  Quest{ from = 4, to = 8, id = 13790, rep = 125, since = "wotlk", side = "Alliance", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13790
  Instance{ from = 4, to = 8, code = 1, rep = 1500, heroic = true, since = "wotlk", side = "Alliance" },
})

REP:RegisterFaction(1052, { -- Horde Expedition
  Quest{ from = 4, to = 8, id = 12170, rep = 125, since = "wotlk", side = "Horde" }, -- Blackriver Brawl QuestID: 12170
  Quest{ from = 4, to = 8, id = 13677, rep = 62.5, since = "wotlk", side = "Horde" }, -- Learning The Reins QuestID: 13677
  Quest{ from = 4, to = 8, id = 13676, rep = 62.5, since = "wotlk", side = "Horde" }, -- Training In The Field QuestID: 13676
  Quest{ from = 4, to = 8, id = 12284, rep = 62.5, since = "wotlk", side = "Horde" }, -- Keep 'Em on Their Heels QuestID: 12284
  Quest{ from = 4, to = 8, id = 12280, rep = 62.5, since = "wotlk", side = "Horde" }, -- Making Repairs QuestID: 12280
  Quest{ from = 4, to = 8, id = 12288, rep = 62.5, since = "wotlk", side = "Horde" }, -- Overwhelmed! QuestID: 12288
  Quest{ from = 4, to = 8, id = 12270, rep = 62.5, since = "wotlk", side = "Horde" }, -- Shred the Alliance QuestID: 12270
  Quest{ from = 4, to = 8, id = 13310, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Air QuestID: 13310
  Quest{ from = 4, to = 8, id = 13301, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Ground QuestID: 13301
  Quest{ from = 4, to = 8, id = 13330, rep = 62.5, since = "wotlk", side = "Horde" }, -- Blood of the Chosen QuestID: 13330
  Quest{ from = 4, to = 8, id = 13283, rep = 62.5, since = "wotlk", side = "Horde" }, -- King of the Mountain QuestID: 13283
  Quest{ from = 4, to = 8, id = 13673, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Blade Fit For A Champion QuestID: 13673
  Quest{ from = 4, to = 8, id = 13772, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Grand Melee QuestID: 13772
  Quest{ from = 4, to = 8, id = 13675, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Edge Of Winter QuestID: 13675
  Quest{ from = 4, to = 8, id = 13769, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Worthy Weapon QuestID: 13769
  Quest{ from = 4, to = 8, id = 13856, rep = 62.5, since = "wotlk", side = "Horde" }, -- At The Enemy's Gates QuestID: 13856
  Quest{ from = 4, to = 8, id = 13812, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13812
  Quest{ from = 4, to = 8, id = 13813, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13813
  Quest{ from = 4, to = 8, id = 13863, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13863
  Quest{ from = 4, to = 8, id = 13814, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13814
  Quest{ from = 4, to = 8, id = 13809, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13809
  Quest{ from = 4, to = 8, id = 13810, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13810
  Quest{ from = 4, to = 8, id = 13862, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13862
  Quest{ from = 4, to = 8, id = 13811, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13811
  Instance{ from = 4, to = 8, code = 1, rep = 3000, heroic = true, since = "wotlk", side = "Horde" },
  Item{ from = 1, to = 8, rep = 500, items = {[129954] = 1}, since = "wod", side = "Horde" },
})

REP:RegisterFaction(1067, { -- The Hand of Vengeance
  Quest{ from = 4, to = 8, id = 12170, rep = 125, since = "wotlk", side = "Horde" }, -- Blackriver Brawl QuestID: 12170
  Quest{ from = 4, to = 8, id = 13677, rep = 62.5, since = "wotlk", side = "Horde" }, -- Learning The Reins QuestID: 13677
  Quest{ from = 4, to = 8, id = 13676, rep = 62.5, since = "wotlk", side = "Horde" }, -- Training In The Field QuestID: 13676
  Quest{ from = 4, to = 8, id = 12284, rep = 62.5, since = "wotlk", side = "Horde" }, -- Keep 'Em on Their Heels QuestID: 12284
  Quest{ from = 4, to = 8, id = 12280, rep = 62.5, since = "wotlk", side = "Horde" }, -- Making Repairs QuestID: 12280
  Quest{ from = 4, to = 8, id = 12288, rep = 62.5, since = "wotlk", side = "Horde" }, -- Overwhelmed! QuestID: 12288
  Quest{ from = 4, to = 8, id = 12270, rep = 62.5, since = "wotlk", side = "Horde" }, -- Shred the Alliance QuestID: 12270
  Quest{ from = 4, to = 8, id = 13310, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Air QuestID: 13310
  Quest{ from = 4, to = 8, id = 13301, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Ground QuestID: 13301
  Quest{ from = 4, to = 8, id = 13330, rep = 62.5, since = "wotlk", side = "Horde" }, -- Blood of the Chosen QuestID: 13330
  Quest{ from = 4, to = 8, id = 13283, rep = 62.5, since = "wotlk", side = "Horde" }, -- King of the Mountain QuestID: 13283
  Quest{ from = 4, to = 8, id = 13673, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Blade Fit For A Champion QuestID: 13673
  Quest{ from = 4, to = 8, id = 13772, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Grand Melee QuestID: 13772
  Quest{ from = 4, to = 8, id = 13675, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Edge Of Winter QuestID: 13675
  Quest{ from = 4, to = 8, id = 13769, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Worthy Weapon QuestID: 13769
  Quest{ from = 4, to = 8, id = 13856, rep = 62.5, since = "wotlk", side = "Horde" }, -- At The Enemy's Gates QuestID: 13856
  Quest{ from = 4, to = 8, id = 13812, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13812
  Quest{ from = 4, to = 8, id = 13813, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13813
  Quest{ from = 4, to = 8, id = 13863, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13863
  Quest{ from = 4, to = 8, id = 13814, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13814
  Quest{ from = 4, to = 8, id = 13809, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13809
  Quest{ from = 4, to = 8, id = 13810, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13810
  Quest{ from = 4, to = 8, id = 13862, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13862
  Quest{ from = 4, to = 8, id = 13811, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13811
  Instance{ from = 4, to = 8, code = 1, rep = 1500, heroic = true, since = "wotlk", side = "Horde" },
})

REP:RegisterFaction(1124, { -- The Sunreavers
  Quest{ from = 4, to = 8, id = 12170, rep = 125, since = "wotlk", side = "Horde" }, -- Blackriver Brawl QuestID: 12170
  Quest{ from = 4, to = 8, id = 13677, rep = 62.5, since = "wotlk", side = "Horde" }, -- Learning The Reins QuestID: 13677
  Quest{ from = 4, to = 8, id = 13676, rep = 62.5, since = "wotlk", side = "Horde" }, -- Training In The Field QuestID: 13676
  Quest{ from = 4, to = 8, id = 12284, rep = 62.5, since = "wotlk", side = "Horde" }, -- Keep 'Em on Their Heels QuestID: 12284
  Quest{ from = 4, to = 8, id = 12280, rep = 62.5, since = "wotlk", side = "Horde" }, -- Making Repairs QuestID: 12280
  Quest{ from = 4, to = 8, id = 12288, rep = 62.5, since = "wotlk", side = "Horde" }, -- Overwhelmed! QuestID: 12288
  Quest{ from = 4, to = 8, id = 12270, rep = 62.5, since = "wotlk", side = "Horde" }, -- Shred the Alliance QuestID: 12270
  Quest{ from = 4, to = 8, id = 13310, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Air QuestID: 13310
  Quest{ from = 4, to = 8, id = 13301, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Ground QuestID: 13301
  Quest{ from = 4, to = 8, id = 13330, rep = 62.5, since = "wotlk", side = "Horde" }, -- Blood of the Chosen QuestID: 13330
  Quest{ from = 4, to = 8, id = 13283, rep = 62.5, since = "wotlk", side = "Horde" }, -- King of the Mountain QuestID: 13283
  Quest{ from = 4, to = 8, id = 13673, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Blade Fit For A Champion QuestID: 13673
  Quest{ from = 4, to = 8, id = 13772, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Grand Melee QuestID: 13772
  Quest{ from = 4, to = 8, id = 13675, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Edge Of Winter QuestID: 13675
  Quest{ from = 4, to = 8, id = 13769, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Worthy Weapon QuestID: 13769
  Quest{ from = 4, to = 8, id = 13856, rep = 62.5, since = "wotlk", side = "Horde" }, -- At The Enemy's Gates QuestID: 13856
  Quest{ from = 4, to = 8, id = 13812, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13812
  Quest{ from = 4, to = 8, id = 13813, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13813
  Quest{ from = 4, to = 8, id = 13863, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13863
  Quest{ from = 4, to = 8, id = 13814, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13814
  Quest{ from = 4, to = 8, id = 13809, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13809
  Quest{ from = 4, to = 8, id = 13810, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13810
  Quest{ from = 4, to = 8, id = 13862, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13862
  Quest{ from = 4, to = 8, id = 13811, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13811
  Instance{ from = 4, to = 8, code = 1, rep = 1500, heroic = true, since = "wotlk", side = "Horde" },
})

REP:RegisterFaction(1085, { -- Warsong Offensive
  Quest{ from = 4, to = 8, id = 12170, rep = 125, since = "wotlk", side = "Horde" }, -- Blackriver Brawl QuestID: 12170
  Quest{ from = 4, to = 8, id = 13677, rep = 62.5, since = "wotlk", side = "Horde" }, -- Learning The Reins QuestID: 13677
  Quest{ from = 4, to = 8, id = 13676, rep = 62.5, since = "wotlk", side = "Horde" }, -- Training In The Field QuestID: 13676
  Quest{ from = 4, to = 8, id = 12284, rep = 62.5, since = "wotlk", side = "Horde" }, -- Keep 'Em on Their Heels QuestID: 12284
  Quest{ from = 4, to = 8, id = 12280, rep = 62.5, since = "wotlk", side = "Horde" }, -- Making Repairs QuestID: 12280
  Quest{ from = 4, to = 8, id = 12288, rep = 62.5, since = "wotlk", side = "Horde" }, -- Overwhelmed! QuestID: 12288
  Quest{ from = 4, to = 8, id = 12270, rep = 62.5, since = "wotlk", side = "Horde" }, -- Shred the Alliance QuestID: 12270
  Quest{ from = 4, to = 8, id = 13310, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Air QuestID: 13310
  Quest{ from = 4, to = 8, id = 13301, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Ground QuestID: 13301
  Quest{ from = 4, to = 8, id = 13330, rep = 62.5, since = "wotlk", side = "Horde" }, -- Blood of the Chosen QuestID: 13330
  Quest{ from = 4, to = 8, id = 13283, rep = 62.5, since = "wotlk", side = "Horde" }, -- King of the Mountain QuestID: 13283
  Quest{ from = 4, to = 8, id = 13673, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Blade Fit For A Champion QuestID: 13673
  Quest{ from = 4, to = 8, id = 13772, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Grand Melee QuestID: 13772
  Quest{ from = 4, to = 8, id = 13675, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Edge Of Winter QuestID: 13675
  Quest{ from = 4, to = 8, id = 13769, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Worthy Weapon QuestID: 13769
  Quest{ from = 4, to = 8, id = 13856, rep = 62.5, since = "wotlk", side = "Horde" }, -- At The Enemy's Gates QuestID: 13856
  Quest{ from = 4, to = 8, id = 13812, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13812
  Quest{ from = 4, to = 8, id = 13813, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13813
  Quest{ from = 4, to = 8, id = 13863, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13863
  Quest{ from = 4, to = 8, id = 13814, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13814
  Quest{ from = 4, to = 8, id = 13809, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13809
  Quest{ from = 4, to = 8, id = 13810, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13810
  Quest{ from = 4, to = 8, id = 13862, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13862
  Quest{ from = 4, to = 8, id = 13811, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13811
  Instance{ from = 4, to = 8, code = 1, rep = 1500, heroic = true, since = "wotlk", side = "Horde" },
})

REP:RegisterFaction(1064, { -- The Taunka
  Quest{ from = 4, to = 8, id = 12170, rep = 125, since = "wotlk", side = "Horde" }, -- Blackriver Brawl QuestID: 12170
  Quest{ from = 4, to = 8, id = 13677, rep = 62.5, since = "wotlk", side = "Horde" }, -- Learning The Reins QuestID: 13677
  Quest{ from = 4, to = 8, id = 13676, rep = 62.5, since = "wotlk", side = "Horde" }, -- Training In The Field QuestID: 13676
  Quest{ from = 4, to = 8, id = 12284, rep = 62.5, since = "wotlk", side = "Horde" }, -- Keep 'Em on Their Heels QuestID: 12284
  Quest{ from = 4, to = 8, id = 12280, rep = 62.5, since = "wotlk", side = "Horde" }, -- Making Repairs QuestID: 12280
  Quest{ from = 4, to = 8, id = 12288, rep = 62.5, since = "wotlk", side = "Horde" }, -- Overwhelmed! QuestID: 12288
  Quest{ from = 4, to = 8, id = 12270, rep = 62.5, since = "wotlk", side = "Horde" }, -- Shred the Alliance QuestID: 12270
  Quest{ from = 4, to = 8, id = 13310, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Air QuestID: 13310
  Quest{ from = 4, to = 8, id = 13301, rep = 62.5, since = "wotlk", side = "Horde" }, -- Assault by Ground QuestID: 13301
  Quest{ from = 4, to = 8, id = 13330, rep = 62.5, since = "wotlk", side = "Horde" }, -- Blood of the Chosen QuestID: 13330
  Quest{ from = 4, to = 8, id = 13283, rep = 62.5, since = "wotlk", side = "Horde" }, -- King of the Mountain QuestID: 13283
  Quest{ from = 4, to = 8, id = 13673, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Blade Fit For A Champion QuestID: 13673
  Quest{ from = 4, to = 8, id = 13772, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Grand Melee QuestID: 13772
  Quest{ from = 4, to = 8, id = 13675, rep = 62.5, since = "wotlk", side = "Horde" }, -- The Edge Of Winter QuestID: 13675
  Quest{ from = 4, to = 8, id = 13769, rep = 62.5, since = "wotlk", side = "Horde" }, -- A Worthy Weapon QuestID: 13769
  Quest{ from = 4, to = 8, id = 13856, rep = 62.5, since = "wotlk", side = "Horde" }, -- At The Enemy's Gates QuestID: 13856
  Quest{ from = 4, to = 8, id = 13812, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13812
  Quest{ from = 4, to = 8, id = 13813, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13813
  Quest{ from = 4, to = 8, id = 13863, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13863
  Quest{ from = 4, to = 8, id = 13814, rep = 125, since = "wotlk", side = "Horde", class = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13814
  Quest{ from = 4, to = 8, id = 13809, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Threat From Above QuestID: 13809
  Quest{ from = 4, to = 8, id = 13810, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Taking Battle To The Enemy QuestID: 13810
  Quest{ from = 4, to = 8, id = 13862, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Battle Before The Citadel QuestID: 13862
  Quest{ from = 4, to = 8, id = 13811, rep = 125, since = "wotlk", side = "Horde", notClass = "DEATHKNIGHT" }, -- Among the Champions QuestID: 13811
  Instance{ from = 4, to = 8, code = 1, rep = 1500, heroic = true, since = "wotlk", side = "Horde" },
})
