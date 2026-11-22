----------------------------------------------------------
-- Reputation Guide | Reputation sources: Warlords of Draenor --
-- Factions (and sources) added in Warlords of Draenor. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(1515, { -- Arakkoa Outcasts
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod" },
  Mob{ from = 1, to = 8, text = "amorepicCognitorAtLostVeilAnzu", rep = 5, zone = "Spires_of_Arak", since = "wod" },
  Mob{ from = 1, to = 8, text = "befuddledRelicSeekerAtLostVeilAnzu", rep = 5, zone = "Spires_of_Arak", since = "wod" },
  Mob{ from = 1, to = 7, text = "highmaulSkullcrusherAtLostVeilAnzu", rep = 5, zone = "Spires_of_Arak", since = "wod" },
  Mob{ from = 1, to = 8, text = "infectedPlundererAtLostVeilAnzu", rep = 5, zone = "Spires_of_Arak", since = "wod" },
  Mob{ from = 1, to = 8, text = "dartingSwiftFeatherAtSkettis", rep = 1, zone = "Spires_of_Arak", since = "wod" },
  Mob{ from = 1, to = 8, text = "flightedStormSpinnerAtSkettis", rep = 5, zone = "Spires_of_Arak", since = "wod" },
  Mob{ from = 1, to = 8, text = "skyreachDawnbreakerAtSkettis", rep = 16, zone = "Spires_of_Arak", since = "wod" },
  Mob{ from = 1, to = 8, text = "skyreachDreadtalonAtSkettis", rep = 5, zone = "Spires_of_Arak", since = "wod" },
  Mob{ from = 1, to = 8, text = "skyreachLabormasterAtSkettis", rep = 5, zone = "Spires_of_Arak", since = "wod" },
})

REP:RegisterFaction(1711, { -- Steamwheedle Preservation Society
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod" },
  Item{ from = 1, to = 8, rep = 350, items = {[118100] = 1}, since = "wod" }, -- Highmaul Relic
  Quest{ from = 1, to = 8, id = 35147, rep = 250, items = {[118099] = 20}, since = "wod" },
  Quest{ from = 1, to = 8, id = 37210, rep = 500, items = {[118654] = 1}, since = "wod" },
  Quest{ from = 1, to = 8, id = 37211, rep = 500, items = {[118655] = 1}, since = "wod" },
  Quest{ from = 1, to = 8, id = 37221, rep = 500, items = {[118656] = 1}, since = "wod" },
  Quest{ from = 1, to = 8, id = 37222, rep = 500, items = {[118657] = 1}, since = "wod" },
  Quest{ from = 1, to = 8, id = 37223, rep = 500, items = {[118658] = 1}, since = "wod" },
  Quest{ from = 1, to = 8, id = 37224, rep = 500, items = {[118659] = 1}, since = "wod" },
  Quest{ from = 1, to = 8, id = 37225, rep = 500, items = {[118660] = 1}, since = "wod" },
  Quest{ from = 1, to = 8, id = 37226, rep = 500, items = {[118661] = 1}, since = "wod" },
  Quest{ from = 1, to = 8, id = 37520, rep = 500, items = {[120172] = 1}, since = "wod" },
})

REP:RegisterFaction(1849, { -- Order of the Awakened
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod" },
  Quest{ from = 1, to = 8, id = 39433, rep = 1500, items = {[128346] = 10}, since = "wod" },
})

REP:RegisterFaction(1850, { -- The Saberstalkers
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod" },
  Mob{ from = 1, to = 8, text = "blackfangHunter", rep = 25, zone = "Tanaan_Jungle", since = "wod" },
  Mob{ from = 1, to = 8, text = "blackfangProwler", rep = 25, zone = "Tanaan_Jungle", since = "wod" },
  Mob{ from = 1, to = 8, text = "blackfangSavage", rep = 25, zone = "Tanaan_Jungle", since = "wod" },
  Mob{ from = 1, to = 8, text = "blackfangShaman", rep = 25, zone = "Tanaan_Jungle", since = "wod" },
  Mob{ from = 1, to = 8, text = "soulslicerRareElite", rep = 500, zone = "Tanaan_Jungle", since = "wod" },
  Mob{ from = 1, to = 8, text = "gloomtalonRareElite", rep = 500, zone = "Tanaan_Jungle", since = "wod" },
  Mob{ from = 1, to = 8, text = "krellTheSereneRareElite", rep = 500, zone = "Tanaan_Jungle", since = "wod" },
  Mob{ from = 1, to = 8, text = "theBlackfangRareElite", rep = 500, zone = "Tanaan_Jungle", since = "wod" },
  Quest{ from = 1, to = 8, id = 39565, rep = 3500, since = "wod" },
  Quest{ from = 1, to = 8, id = 39582, rep = 1500, items = {[124099] = 100}, since = "wod", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 39529, rep = 1500, items = {[124099] = 100}, since = "wod", side = "Horde" },
})

REP:RegisterFaction(1731, { -- Council of Exarchs
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "shadowmoonWarriorDefilerVoidtwisterAtPillarsOf", rep = 5, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "skeletalAncestorReanimatedBonesShadowmoonVoidAugur", rep = 5, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "voidFragmentAtPillarsOfFate", rep = 5, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "shadowmoonDeathcallerAtPillarsOfFate", rep = 8, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "voidHorrorAtPillarsOfFate", rep = 16, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "voidreaverUrnaeRareMobAtPillarsOf", rep = 50, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "sargereiBinderWorkerInitiateAtSocretharS", rep = 5, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "sargereiAcolyteDemonspeakerAtSocretharSRise", rep = 5, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "shadowglenThornshooterAtSocretharSRise", rep = 5, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "sargereiDarkbladeAtSocretharSRise", rep = 8, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "nightshadeConsortAtSocretharSRise", rep = 8, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "sargereiDemonlordAtSocretharSRise", rep = 16, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "masterSergeantMilgraDemidosRareMobsAt", rep = 50, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "darktideEngineerRylakinatorMatronAtDarktideRoost", rep = 5, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "darktidePilfererGuardianAtDarktideRoost", rep = 5, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "controlledDarkwingDarkwingMatronAtDarktideRoost", rep = 5, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "darktideMachinistWindstalkerAtDarktideRoost", rep = 8, zone = "Shadowmoon_Valley", since = "wod", side = "Alliance" },
})

REP:RegisterFaction(1682, { -- Wrynn's Vanguard
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod", side = "Alliance" },
  General{ from = 1, to = 8, text = "killEnemyFactionLeader", rep = 2500, headText = "killEnemyFactionLeader", tipText = "killTheEnemyFactionLeaderToGain", since = "wod", side = "Alliance" },
  General{ from = 1, to = 8, text = "winABonusObjective", rep = 500, headText = "winABonusObjective", tipText = "winABonusObjectiveToGain500", since = "wod", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 35927, notRetail = true, rep = 2500, items = {[112015] = 1}, since = "wod", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 35942, notRetail = true, rep = 2500, items = {[112113] = 1}, since = "wod", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 35941, notRetail = true, rep = 2500, items = {[112120] = 1}, since = "wod", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 35940, rep = 2500, items = {[112122] = 1}, since = "wod", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 35939, notRetail = true, rep = 2500, items = {[112123] = 1}, since = "wod", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 35938, notRetail = true, rep = 2500, items = {[112125] = 1}, since = "wod", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 35937, rep = 2500, items = {[112128] = 1}, since = "wod", side = "Alliance" },
})

REP:RegisterFaction(1710, { -- Sha'tari Defense
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "viciousFelhunterObserverVoidwalkerInShattrath", rep = 5, zone = "Talador", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "sargereiSummonerHuntsmanFelbringerSoulTwisterIn", rep = 5, zone = "Talador", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "sargereiFiendmasterInShattrath", rep = 5, zone = "Talador", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "connivingShadowbladeCouncilSoulspeakerInShattrath", rep = 5, zone = "Talador", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "sargereiDiscordantRitualistSoulspewerFiendspeakerInShattrath", rep = 8, zone = "Talador", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "sargereiDestructorInShattrath", rep = 8, zone = "Talador", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "connivingDeathbladeCouncilFelcallerInShattrath", rep = 8, zone = "Talador", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "runeRitualistInShattrath", rep = 15, zone = "Talador", since = "wod", side = "Alliance" },
  Mob{ from = 1, to = 8, text = "gromKarBlademasterBulwarkDeadeyePunisherIn", rep = 5, zone = "Talador", since = "wod", side = "Alliance" },
})

REP:RegisterFaction(1847, { -- Hand of the Prophet
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod", side = "Alliance" },
  General{ from = 1, to = 8, text = "lionSWatchCommandTableRandomDaily", rep = 500, headText = "lionSWatchCommandTableRandomDaily", tipText = "randomDailyThatAwards500Reputation", since = "wod", side = "Alliance" },
  General{ from = 1, to = 8, text = "vindicatorKrethosRandomDailyQuest", rep = 250, headText = "vindicatorKrethosRandomDailyQuest", tipText = "randomDailyThatAwards250Reputation", since = "wod", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 39574, rep = 250, since = "wod", side = "Alliance" },
})

REP:RegisterFaction(1445, { -- Frostwolf Orcs
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "bloodmaulBruteDireBoarFrostbenderInStonefury", rep = 5, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "bloodmaulGladiatorInStonefuryCliffs", rep = 5, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "bloodmaulGeomancerMagmaShaperTaskmasterInStonefury", rep = 8, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "bloodmaulBonecrusherInStonefuryCliffs", rep = 16, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "frostfireCragstomperInMagnarok", rep = 8, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "viciousAcidmawInMagnarok", rep = 8, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "icecragMountainbreakerInMagnarok", rep = 16, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "gromKarDeadeyeEnforcerFootsoldierInIron", rep = 5, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "gromKarShocktrooperWarforgerInIronSiegeworks", rep = 5, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "gromKarCripplerPulverizerInIronSiegeworks", rep = 16, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "ironBerserkerCragLeaperGladiatorTalonIn", rep = 5, zone = "Frostfire_Ridge", since = "wod", side = "Horde" },
})

REP:RegisterFaction(1681, { -- Vol'jin's Spear
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod", side = "Horde" },
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod", side = "Horde" },
  General{ from = 1, to = 8, text = "killEnemyFactionLeader", rep = 2500, headText = "killEnemyFactionLeader", tipText = "killTheEnemyFactionLeaderToGain", since = "wod", side = "Horde" },
  General{ from = 1, to = 8, text = "winABonusObjective", rep = 500, headText = "winABonusObjective", tipText = "winABonusObjectiveToGain500", since = "wod", side = "Horde" },
  Quest{ from = 1, to = 8, id = 36884, rep = 2500, items = {[112119] = 1}, since = "wod", side = "Horde" },
  Quest{ from = 1, to = 8, id = 36041, rep = 2500, items = {[112121] = 1}, since = "wod", side = "Horde" },
  Quest{ from = 1, to = 8, id = 36033, rep = 2500, items = {[112124] = 1}, since = "wod", side = "Horde" },
  Quest{ from = 1, to = 8, id = 36034, rep = 2500, items = {[112126] = 1}, since = "wod", side = "Horde" },
  Quest{ from = 1, to = 8, id = 36040, rep = 2500, items = {[112127] = 1}, since = "wod", side = "Horde" },
  Quest{ from = 1, to = 8, id = 36042, rep = 2500, items = {[112131] = 1}, since = "wod", side = "Horde" },
  Quest{ from = 1, to = 8, id = 36038, rep = 2500, items = {[112113] = 1}, since = "wod", side = "Horde" },
})

REP:RegisterFaction(1708, { -- Laughing Skull Orcs
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "ironLaborerInThePit", rep = 5, zone = "Gorgrond", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "ironEnforcerDeadshotCauterizerInThePit", rep = 15, zone = "Gorgrond", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "ironBloodburnerBulwarkWardenReinforcementInThe", rep = 15, zone = "Gorgrond", since = "wod", side = "Horde" },
  Mob{ from = 1, to = 8, text = "everbloomShaperWaspWaterspeakerInEverbloomWilds", rep = 5, zone = "Gorgrond", since = "wod", side = "Horde" },
})

REP:RegisterFaction(1848, { -- Vol'jin's Headhunters
  Item{ from = 1, to = 8, rep = 1000, items = {[128315] = 1}, since = "wod", side = "Horde" },
  General{ from = 1, to = 8, text = "volMarCommandTableRandomDailyQuest", rep = 500, headText = "volMarCommandTableRandomDailyQuest", tipText = "randomDailyThatAwards500Reputation", since = "wod", side = "Horde" },
  General{ from = 1, to = 8, text = "shadowHunterDenjaiRandomDailyQuest", rep = 250, headText = "shadowHunterDenjaiRandomDailyQuest", tipText = "randomDailyThatAwards250Reputation", since = "wod", side = "Horde" },
  Quest{ from = 1, to = 8, id = 39526, rep = 250, since = "wod", side = "Horde" },
})
