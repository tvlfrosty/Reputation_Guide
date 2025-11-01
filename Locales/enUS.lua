------------------------
-- Default (English) --
------------------------
-- Binding names
BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
BINDING_NAME_SHOWCONFIG	= "Show options window"
BINDING_NAME_SHOWDETAILS	= "Show reputation detail window"

REP_TXT	= {}
REP_TXT.Mob = {}
-- help
REP_TXT.help	= "A tool to manage your reputation"
REP_TXT.command	= "Could not parse command"
REP_TXT.usage	= "Usage"
REP_TXT.helphelp	= "Show this help text"
REP_TXT.helpabout	= "Show author information"
REP_TXT.helpstatus	= "Show configuration status"
-- about
REP_TXT.by	= "by"
REP_TXT.version	= "Version"
REP_TXT.date	= "Date"
REP_TXT.web	= "Website"
REP_TXT.slash	= "Slash command"
-- status
REP_TXT.status	= "Status"
REP_TXT.disabled	= "disabled"
REP_TXT.enabled	= "enabled"
REP_TXT.statMobs	= "Show Mobs [M]"
REP_TXT.statQuests	= "Show Quests [Q]"
REP_TXT.statInstances	= "Show Instances [D]"
REP_TXT.statItems	= "Show Items [I]"
REP_TXT.statGeneral	= "Show General [G]"
REP_TXT.statMissing	= "Show missing reputation"
REP_TXT.statDetails	= "Show extended detail frame"
REP_TXT.statChat	= "Detailed chat message"
REP_TXT.statNoGuildChat	= "No chat for guild rep"
REP_TXT.statSuppress	= "Suppress original chat message"
REP_TXT.statPreview	= "Show preview rep in reputation frame"
REP_TXT.statSwitch	= "Automatically switch faction of rep bar"
REP_TXT.statNoGuildSwitch	= "No switching for guild rep"
REP_TXT.statSilentSwitch	= "No message when switching bar"
REP_TXT.statGuildCap	= "Show guild reputation cap in chat"
-- XML UI elements
REP_TXT.showQuests	= "Show Quests"
REP_TXT.showPvPQuests	= "Show PvP Quests"
REP_TXT.showInstances	= "Show Instances"
REP_TXT.showMobs	= "Show Mobs"
REP_TXT.showItems	= "Show Items"
REP_TXT.showGeneral	= "Show General"
REP_TXT.showAll	= "Show All"
REP_TXT.showNone	= "Show None"
REP_TXT.expand	= "Expand"
REP_TXT.darkmoonFaireBuff = "DMF Buff"
REP_TXT.collapse	= "Collapse"
REP_TXT.supressNoneFaction	= "Clear exclusion for faction"
REP_TXT.supressNoneGlobal	= "Clear exclusion for all"
REP_TXT.suppressHint	= "Right-click on a quest to exclude it from the summary"
REP_TXT.clearSessionGain	= "Clear session gain counter"
REP_TXT.moveToInactive = "Move to inactive"
REP_TXT.showFactionOnMainscreen = "Show faction as exp bar"
-- options dialog
REP_TXT.showMissing	= "Show missing reputation in reputation frame"
REP_TXT.extendDetails	= "Show extended reputation detail frame"
REP_TXT.gainToChat	= "Replace original faction gain messages with a more detailed version"
REP_TXT.noGuildGain	= "Do not write to chat for guild reputation"
REP_TXT.suppressOriginalGain	= "Supress original faction gain messages"
REP_TXT.showPreviewRep	= "Show reputation that can be handed in in reputation frame"
REP_TXT.switchFactionBar	= "Switch reputation bar to faction for whom just gained reputation"
REP_TXT.noGuildSwitch	= "Do not switch reputation bar for guild reputation"
REP_TXT.silentSwitch	= "No message to chat when switching bar"
REP_TXT.guildCap	= "Show guild reputation cap in chat"
REP_TXT.defaultChatFrame	= "Using default chat frame"
REP_TXT.chatFrame	= "Using chat frame %d (%s)"
REP_TXT.usingDefaultChatFrame	= "Now using default chat frame"
REP_TXT.usingChatFrame	= "Now using chat frame"
REP_TXT.EnableParagonBar = "Display paragon reputation in bars."
-- various LUA
REP_TXT.options	= "Options"
REP_TXT.orderByStanding	= "Order by Standing"
REP_TXT.lookup	= "Looking up faction "
REP_TXT.allFactions	= "Listing all factions"
REP_TXT.missing	= "(to next)"
REP_TXT.missing2	= "Missing"
REP_TXT.heroic	= "Heroic"
REP_TXT.normal	= "Normal"
REP_TXT.switchBar	= "Changing reputation bar to"
-- REP_ShowFactions
REP_TXT.faction	= "Faction"
REP_TXT.is	= "is"
REP_TXT.withStanding	= "with standing"
REP_TXT.needed	= "needed"
REP_TXT.mob	= "[Mob]"
REP_TXT.limited	= "is limited to"
REP_TXT.limitedPl	= "are limited to"
REP_TXT.quest	= "[Quest]"
REP_TXT.instance	= "[Instance]"
REP_TXT.items	= "[Items]"
REP_TXT.unknown	= "is not known to this player"
REP_TXT.guildReputation	= "Guild reputation"
-- mob Details
REP_TXT.tmob	= "Trash mobs"
REP_TXT.oboss	= "Other Bosses"
REP_TXT.aboss	= "All Bosses"
REP_TXT.pboss	= "Per Boss"
REP_TXT.fclear	= "full clear"
REP_TXT.AU	= "Any Unnamed"
REP_TXT.AN	= "Any named"
REP_TXT.BB	= "Bloodsail Buccaneer"
REP_TXT.SSP	= "Southsea Pirate"
REP_TXT.Wa	= "Wastewander"
REP_TXT.VCm	= "Any Venture Co. mob"
REP_TXT.Mob.MoshOgg_Spellcrafter = "Mosh'Ogg Spellcrafter"
REP_TXT.Mob.BoulderfistOgre = "Boulderfist Ogre"
-- Quest Details
REP_TXT.cdq	= "Main city cooking daily quests"
REP_TXT.coq	= "Other city cooking daily quests"
REP_TXT.fdq	= "Main city fishing daily quests"
REP_TXT.foq	= "Other city fishing daily quests"
REP_TXT.ndq	= "no daily quests"
REP_TXT.deleted	= "Outdated"
REP_TXT.Championing	= "Championing (Tabard)"
REP_TXT.bpqfg	= "By percent of quest faction gain"
-- items Details
REP_TXT.cbadge	= "Other city Commendation Badge"
-- instance Details
REP_TXT.srfd	= "Spillover rep from dungeons"
REP_TXT.tbd	= "ToBe Done"
REP_TXT.nci	= "Normal Cataclysm instances"
REP_TXT.hci	= "Heroic Cataclysm instances"
REP_TXT.ncit	= "Normal Cataclysm instances with faction tabard"
REP_TXT.hcit	= "Heroic Cataclysm instances with faction tabard"
-- ToBeDone general
REP_TXT.tfr	= "Tiller Farming rep"
REP_TXT.nswts	= "Not sure when this starts"
REP_TXT.mnd	= "Max number of daily quests"
REP_TXT.mnds	= "The max number of dallies is "
-- ReputationDetails
REP_TXT.currentRep	= "Current reputation"
REP_TXT.neededRep	= "Reputation needed"
REP_TXT.missingRep	= "Reputation missing"
REP_TXT.repInBag	= "Reputation in bag"
REP_TXT.repInBagBank	= "Reputation in bag & bank"
REP_TXT.repInQuest	= "Reputation in quests"
REP_TXT.factionGained	= "Gained this session"
REP_TXT.noInfo	= "No information available for this faction/reputation."
REP_TXT.toExalted	= "Reputation to exalted"
REP_TXT.toBestFriend = "Reputation to best friend"
-- to chat
REP_TXT.stats	= " (Total: %s%d, Left: %d)"
REP_TXT.statsNextStanding = " (Total: %s%d, Left to %s: %d)"
-- config changed
REP_TXT.configQuestion	= "Some (new) settings were enabled. This is only done once for a setting. It is recommended that you verify the Reputations options."
REP_TXT.showConfig	= "View config"
REP_TXT.later	= "Later"
-- UpdateList
REP_TXT.mobShort	= "[M]"
REP_TXT.questShort	= "[Q]"
REP_TXT.instanceShort	= "[D]"
REP_TXT.itemsShort	= "[I]"
REP_TXT.generalShort	= "[G]"
REP_TXT.mobHead	= "Gain reputation by killing this mob"
REP_TXT.questHead	= "Gain reputation by doing this quest"
REP_TXT.instanceHead	= "Gain reputation by running this instance"
REP_TXT.itemsHead	= "Gain reputation by handing in items"
REP_TXT.generalHead	= "General information about gaining reputation"
REP_TXT.mobTip	= "Each time you kill this mob, you gain reputation. Doing this often enough, will help you reach the next level."
REP_TXT.questTip	= "Each time you complete this repeatable or daily quest, you gain reputation. Doing this often enough, will help you reach the next level."
REP_TXT.instanceTip	= "Each time you run this instance, you gain reputation. Doing this often enough, will help you reach the next level."
REP_TXT.itemsName	= "Item hand-in"
REP_TXT.itemsTip	= "Each time you hand in the listed items, you will gain reputation. Doing this often enough, will help you reach the next level."
REP_TXT.generalTip	= "This is information about reputation gain with a faction that does not necessarily relate to repeatable gain methods."
REP_TXT.allOfTheAbove	= "Summary of %d quests listed above"
REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
REP_TXT.questSummaryTip	= "This entry shows a summary of all the quests listed above.\r\nThis is useful assuming that all the quests listed are daily quests, as this will show you how many days it will take you to reach the next reputation level if you do all the daily quests each day."
REP_TXT.complete	= "complete"
REP_TXT.active	= "active"
REP_TXT.inBag	= "In bags"
REP_TXT.turnIns	= "Turn-ins:"
REP_TXT.reputation	= "Reputation:"
REP_TXT.reputationCap	= "Reputation cap:"
REP_TXT.reputationCapCurrent	= "Current reputation:"
REP_TXT.inBagBank	= "In bags and bank"
REP_TXT.questCompleted	= "Quest completed"
REP_TXT.timesToDo	= "Times to do:"
REP_TXT.instance2	= "Instance:"
REP_TXT.mode	= "Mode:"
REP_TXT.timesToRun	= "Times to run:"
REP_TXT.mob2	= "Mob:"
REP_TXT.location	= "Location:"
REP_TXT.toDo	= "To do:"
REP_TXT.quest2	= "Quest:"
REP_TXT.itemsRequired	= "Items required"
REP_TXT.general2	= "General:"
REP_TXT.maxStanding	= "Yields reputation until"
REP_TXT.renown = "Renown"
-- skills
REP_TXT.skillHerb	= "Herbalism"
REP_TXT.skillMine	= "Mining"
REP_TXT.skillSkin	= "Skinning"
REP_TXT.skillAlch	= "Alchemy"
REP_TXT.skillBlack	= "Blacksmithing"
REP_TXT.skillEnch	= "Enchanting"
REP_TXT.skillEngi	= "Engineering"
REP_TXT.skillIncrip	= "Inscription"
REP_TXT.skillJewel	= "Jewelcrafting"
REP_TXT.skillLeath	= "Leatherworking"
REP_TXT.skillTail	= "Tailoring"
REP_TXT.skillAid	= "First Aid"
REP_TXT.skillArch	= "Archaeology"
REP_TXT.skillCook	= "Cooking"
REP_TXT.skillFish	= "Fishing"
---------------------------
-- Random Reputation stuff
---------------------------
REP_TXT.syndicateMobs	= "All Syndicate members"

---------------------------
-- Reputation Standing
---------------------------
---- Initialize
REP_TXT.STAND_LV	= {}
REP_TXT.STAND_LV_TIER	= {}
REP_TXT.STAND_LV_TRUST = {}
REP_TXT.STAND_LV_RENOWN	= {}
REP_TXT.STAND_LV_RANK = {}
REP_TXT.STAND_LV_LEVEL = {}
REP_TXT.BFFLabels = {}
---- Normal standings
REP_TXT.STAND_LV[0]	= "Unknown"
REP_TXT.STAND_LV[1]	= "Hated"
REP_TXT.STAND_LV[2]	= "Hostile"
REP_TXT.STAND_LV[3]	= "Unfriendly"
REP_TXT.STAND_LV[4]	= "Neutral"
REP_TXT.STAND_LV[5]	= "Friendly"
REP_TXT.STAND_LV[6]	= "Honored"
REP_TXT.STAND_LV[7]	= "Revered"
REP_TXT.STAND_LV[8]	= "Exalted"
REP_TXT.STAND_LV[9] = "Paragon"
---- Tier standings
REP_TXT.STAND_LV_TIER[0] = "Unknown"
REP_TXT.STAND_LV_TIER[1] = "Tier 1"
REP_TXT.STAND_LV_TIER[2] = "Tier 2"
REP_TXT.STAND_LV_TIER[3] = "Tier 3"
REP_TXT.STAND_LV_TIER[4] = "Tier 4"
REP_TXT.STAND_LV_TIER[5] = "Tier 5"
REP_TXT.STAND_LV_TIER[6] = "Tier 6"
---- Trust standings
REP_TXT.STAND_LV_TRUST[0] = "Unknown"
REP_TXT.STAND_LV_TRUST[1] = "Dubious"
REP_TXT.STAND_LV_TRUST[2] = "Apprehensive"
REP_TXT.STAND_LV_TRUST[3] = "fail"
REP_TXT.STAND_LV_TRUST[4] = "Ambivalent"
REP_TXT.STAND_LV_TRUST[5] = "Cordial"
REP_TXT.STAND_LV_TRUST[6] = "Appreciative"
---- Renown standings
REP_TXT.STAND_LV_RENOWN[0] = "Unknown"
REP_TXT.STAND_LV_RENOWN[1] = "Renown 1"
REP_TXT.STAND_LV_RENOWN[2] = "Renown 2"
REP_TXT.STAND_LV_RENOWN[3] = "Renown 3"
REP_TXT.STAND_LV_RENOWN[4] = "Renown 4"
REP_TXT.STAND_LV_RENOWN[5] = "Renown 5"
REP_TXT.STAND_LV_RENOWN[6] = "Renown 6"
REP_TXT.STAND_LV_RENOWN[7] = "Renown 7"
REP_TXT.STAND_LV_RENOWN[8] = "Renown 8"
REP_TXT.STAND_LV_RENOWN[9] = "Renown 9"
REP_TXT.STAND_LV_RENOWN[10] = "Renown 10"
REP_TXT.STAND_LV_RENOWN[11] = "Renown 11"
REP_TXT.STAND_LV_RENOWN[12] = "Renown 12"
REP_TXT.STAND_LV_RENOWN[13] = "Renown 13"
REP_TXT.STAND_LV_RENOWN[14] = "Renown 14"
REP_TXT.STAND_LV_RENOWN[15] = "Renown 15"
REP_TXT.STAND_LV_RENOWN[16] = "Renown 16"
REP_TXT.STAND_LV_RENOWN[17] = "Renown 17"
REP_TXT.STAND_LV_RENOWN[18] = "Renown 18"
REP_TXT.STAND_LV_RENOWN[19] = "Renown 19"
REP_TXT.STAND_LV_RENOWN[20] = "Renown 20"
REP_TXT.STAND_LV_RENOWN[21] = "Renown 21"
REP_TXT.STAND_LV_RENOWN[22] = "Renown 22"
REP_TXT.STAND_LV_RENOWN[23] = "Renown 23"
REP_TXT.STAND_LV_RENOWN[24] = "Renown 24"
REP_TXT.STAND_LV_RENOWN[25] = "Renown 25"
---- Rank standings
REP_TXT.STAND_LV_MAX_RANK = "Max Rank"
REP_TXT.STAND_LV_RANK[0] = "Unknown"
REP_TXT.STAND_LV_RANK[1] = "Rank 1"
REP_TXT.STAND_LV_RANK[2] = "Rank 2"
REP_TXT.STAND_LV_RANK[3] = "Rank 3"
REP_TXT.STAND_LV_RANK[4] = "Rank 4"
REP_TXT.STAND_LV_RANK[5] = "Rank 5"
REP_TXT.STAND_LV_RANK[6] = "Rank 6"
REP_TXT.STAND_LV_RANK[7] = "Rank 7"
REP_TXT.STAND_LV_RANK[8] = "Rank 8"
REP_TXT.STAND_LV_RANK[9] = "Rank 9"
REP_TXT.STAND_LV_RANK[10] = "Rank 10"
REP_TXT.STAND_LV_RANK[11] = "Rank 11"
REP_TXT.STAND_LV_RANK[12] = "Rank 12"
REP_TXT.STAND_LV_RANK[13] = "Rank 13"
REP_TXT.STAND_LV_RANK[14] = "Rank 14"
REP_TXT.STAND_LV_RANK[15] = "Rank 15"
REP_TXT.STAND_LV_RANK[16] = "Rank 16"
REP_TXT.STAND_LV_RANK[17] = "Rank 17"
REP_TXT.STAND_LV_RANK[18] = "Rank 18"
REP_TXT.STAND_LV_RANK[19] = "Rank 19"
REP_TXT.STAND_LV_RANK[20] = "Rank 20"
REP_TXT.STAND_LV_RANK[21] = "Rank 21"
REP_TXT.STAND_LV_RANK[22] = "Rank 22"
REP_TXT.STAND_LV_RANK[23] = "Rank 23"
REP_TXT.STAND_LV_RANK[24] = "Rank 24"
REP_TXT.STAND_LV_RANK[25] = "Rank 25"
REP_TXT.STAND_LV_RANK[26] = "Rank 26"
REP_TXT.STAND_LV_RANK[27] = "Rank 27"
REP_TXT.STAND_LV_RANK[28] = "Rank 28"
REP_TXT.STAND_LV_RANK[29] = "Rank 29"
REP_TXT.STAND_LV_RANK[30] = "Rank 30"
---- Level standings
REP_TXT.STAND_LV_LEVEL[0] = "Unknown"
REP_TXT.STAND_LV_LEVEL[1] = "Level 1"
REP_TXT.STAND_LV_LEVEL[2] = "Level 2"
REP_TXT.STAND_LV_LEVEL[3] = "Level 3"
REP_TXT.STAND_LV_LEVEL[4] = "Level 4"
REP_TXT.STAND_LV_LEVEL[5] = "Level 5"
REP_TXT.STAND_LV_LEVEL[6] = "Level 6"
REP_TXT.STAND_LV_LEVEL[7] = "Level 7"
REP_TXT.STAND_LV_LEVEL[8] = "Level 8"
REP_TXT.STAND_LV_LEVEL[9] = "Level 9"
REP_TXT.STAND_LV_LEVEL[10] = "Level 10"
REP_TXT.STAND_LV_LEVEL[11] = "Level 11"
REP_TXT.STAND_LV_LEVEL[12] = "Level 12"
REP_TXT.STAND_LV_LEVEL[13] = "Level 13"
REP_TXT.STAND_LV_LEVEL[14] = "Level 14"
REP_TXT.STAND_LV_LEVEL[15] = "Level 15"
REP_TXT.STAND_LV_LEVEL[16] = "Level 16"
REP_TXT.STAND_LV_LEVEL[17] = "Level 17"
REP_TXT.STAND_LV_LEVEL[18] = "Level 18"
REP_TXT.STAND_LV_LEVEL[19] = "Level 19"
REP_TXT.STAND_LV_LEVEL[20] = "Level 20"
REP_TXT.STAND_LV_LEVEL[21] = "Level 21"
REP_TXT.STAND_LV_LEVEL[22] = "Level 22"
REP_TXT.STAND_LV_LEVEL[23] = "Level 23"
REP_TXT.STAND_LV_LEVEL[24] = "Level 24"
REP_TXT.STAND_LV_LEVEL[25] = "Level 25"
REP_TXT.STAND_LV_LEVEL[26] = "Level 26"
REP_TXT.STAND_LV_LEVEL[27] = "Level 27"
REP_TXT.STAND_LV_LEVEL[28] = "Level 28"
REP_TXT.STAND_LV_LEVEL[29] = "Level 29"
REP_TXT.STAND_LV_LEVEL[30] = "Level 30"
REP_TXT.STAND_LV_LEVEL[31] = "Level 31"
REP_TXT.STAND_LV_LEVEL[32] = "Level 32"
REP_TXT.STAND_LV_LEVEL[33] = "Level 33"
REP_TXT.STAND_LV_LEVEL[34] = "Level 34"
REP_TXT.STAND_LV_LEVEL[35] = "Level 35"
REP_TXT.STAND_LV_LEVEL[36] = "Level 36"
REP_TXT.STAND_LV_LEVEL[37] = "Level 37"
REP_TXT.STAND_LV_LEVEL[38] = "Level 38"
REP_TXT.STAND_LV_LEVEL[39] = "Level 39"
REP_TXT.STAND_LV_LEVEL[40] = "Level 40"
REP_TXT.STAND_LV_LEVEL[41] = "Level 41"
REP_TXT.STAND_LV_LEVEL[42] = "Level 42"
REP_TXT.STAND_LV_LEVEL[43] = "Level 43"
REP_TXT.STAND_LV_LEVEL[44] = "Level 44"
REP_TXT.STAND_LV_LEVEL[45] = "Level 45"
REP_TXT.STAND_LV_LEVEL[46] = "Level 46"
REP_TXT.STAND_LV_LEVEL[47] = "Level 47"
REP_TXT.STAND_LV_LEVEL[48] = "Level 48"
REP_TXT.STAND_LV_LEVEL[49] = "Level 49"
REP_TXT.STAND_LV_LEVEL[50] = "Level 50"
REP_TXT.STAND_LV_LEVEL[51] = "Level 51"
REP_TXT.STAND_LV_LEVEL[52] = "Level 52"
REP_TXT.STAND_LV_LEVEL[53] = "Level 53"
REP_TXT.STAND_LV_LEVEL[54] = "Level 54"
REP_TXT.STAND_LV_LEVEL[55] = "Level 55"
REP_TXT.STAND_LV_LEVEL[56] = "Level 56"
REP_TXT.STAND_LV_LEVEL[57] = "Level 57"
REP_TXT.STAND_LV_LEVEL[58] = "Level 58"
REP_TXT.STAND_LV_LEVEL[59] = "Level 59"
REP_TXT.STAND_LV_LEVEL[60] = "Level 60"
REP_TXT.STAND_LV_LEVEL[61] = "Level 61"
REP_TXT.STAND_LV_LEVEL[62] = "Level 62"
REP_TXT.STAND_LV_LEVEL[63] = "Level 63"
REP_TXT.STAND_LV_LEVEL[64] = "Level 64"
REP_TXT.STAND_LV_LEVEL[65] = "Level 65"
REP_TXT.STAND_LV_LEVEL[66] = "Level 66"
REP_TXT.STAND_LV_LEVEL[67] = "Level 67"
REP_TXT.STAND_LV_LEVEL[68] = "Level 68"
REP_TXT.STAND_LV_LEVEL[69] = "Level 69"
REP_TXT.STAND_LV_LEVEL[70] = "Level 70"
REP_TXT.STAND_LV_LEVEL[71] = "Level 71"
REP_TXT.STAND_LV_LEVEL[72] = "Level 72"
REP_TXT.STAND_LV_LEVEL[73] = "Level 73"
REP_TXT.STAND_LV_LEVEL[74] = "Level 74"
REP_TXT.STAND_LV_LEVEL[75] = "Level 75"
REP_TXT.STAND_LV_LEVEL[76] = "Level 76"
REP_TXT.STAND_LV_LEVEL[77] = "Level 77"
REP_TXT.STAND_LV_LEVEL[78] = "Level 78"
REP_TXT.STAND_LV_LEVEL[79] = "Level 79"
REP_TXT.STAND_LV_LEVEL[80] = "Level 80"
REP_TXT.STAND_LV_LEVEL[81] = "Level 81"
REP_TXT.STAND_LV_LEVEL[82] = "Level 82"
REP_TXT.STAND_LV_LEVEL[83] = "Level 83"
REP_TXT.STAND_LV_LEVEL[84] = "Level 84"
REP_TXT.STAND_LV_LEVEL[85] = "Level 85"
REP_TXT.STAND_LV_LEVEL[86] = "Level 86"
REP_TXT.STAND_LV_LEVEL[87] = "Level 87"
REP_TXT.STAND_LV_LEVEL[88] = "Level 88"
REP_TXT.STAND_LV_LEVEL[89] = "Level 89"
REP_TXT.STAND_LV_LEVEL[90] = "Level 90"
REP_TXT.STAND_LV_LEVEL[91] = "Level 91"
REP_TXT.STAND_LV_LEVEL[92] = "Level 92"
REP_TXT.STAND_LV_LEVEL[93] = "Level 93"
REP_TXT.STAND_LV_LEVEL[94] = "Level 94"
REP_TXT.STAND_LV_LEVEL[95] = "Level 95"
REP_TXT.STAND_LV_LEVEL[96] = "Level 96"
REP_TXT.STAND_LV_LEVEL[97] = "Level 97"
REP_TXT.STAND_LV_LEVEL[98] = "Level 98"
REP_TXT.STAND_LV_LEVEL[99] = "Level 99"
REP_TXT.STAND_LV_LEVEL[100] = "Level 100"
-------------------------------------
-- BFFLabels / Friendship factions --
-------------------------------------
-- BFF Labels placeholder
REP_TXT.BFFLabels[0] = {} -- Stranger
REP_TXT.BFFLabels[0][1] = "Acquaintance"
REP_TXT.BFFLabels[0][2] = "Buddy"
REP_TXT.BFFLabels[0][3] = "Friend"
REP_TXT.BFFLabels[0][4] = "Good Friend"
REP_TXT.BFFLabels[0][5] = "Best Friend"
---- Fishing Masters placeholder
REP_TXT.BFFFishingMastersLabels = {}
REP_TXT.BFFFishingMastersLabels[1] = "Stranger"
REP_TXT.BFFFishingMastersLabels[2] = "Pal"
REP_TXT.BFFFishingMastersLabels[3] = "Buddy"
REP_TXT.BFFFishingMastersLabels[4] = "Friend"
REP_TXT.BFFFishingMastersLabels[5] = "Good Friend"
REP_TXT.BFFFishingMastersLabels[6] = "Best Friend"
---- Barracks Bodyguards placeholder
REP_TXT.BFFBarracksBodyguardsLabels = {}
REP_TXT.BFFBarracksBodyguardsLabels[1] = "Bodyguard"
REP_TXT.BFFBarracksBodyguardsLabels[2] = "Trusted Bodyguard"
REP_TXT.BFFBarracksBodyguardsLabels[3] = "Personal Wingman"
---- The First Responders 1984
REP_TXT.BFFLabels[1984] = {} -- Intern
REP_TXT.BFFLabels[1984][1] = "Junior Resident"
REP_TXT.BFFLabels[1984][2] = "Senior Resident"
REP_TXT.BFFLabels[1984][3] = "First Responder"
---- Corbyn 2100
REP_TXT.BFFLabels[2100] = {} -- Stranger
REP_TXT.BFFLabels[2100][1] = "Curiosity"
REP_TXT.BFFLabels[2100][2] = "Non-Threat"
REP_TXT.BFFLabels[2100][3] = REP_TXT.BFFFishingMastersLabels[4]
REP_TXT.BFFLabels[2100][4] = "Helpful Friend"
REP_TXT.BFFLabels[2100][5] = REP_TXT.BFFFishingMastersLabels[6]
-- Chromie 2135
REP_TXT.BFFLabels[2135] = {} -- Whelpling
REP_TXT.BFFLabels[2135][1] = "Temporal Trainee"
REP_TXT.BFFLabels[2135][2] = "Timehopper"
REP_TXT.BFFLabels[2135][3] = "Chrono-Friend"
REP_TXT.BFFLabels[2135][4] = "Bronze Ally"
REP_TXT.BFFLabels[2135][5] = "Epoch-Mender"
REP_TXT.BFFLabels[2135][6] = "Timelord"
---- Wrathion 2517
REP_TXT.BFFLabels[2517] = {} -- Acquaintance
REP_TXT.BFFLabels[2517][1] = "Cohort"
REP_TXT.BFFLabels[2517][2] = "Ally"
REP_TXT.BFFLabels[2517][3] = "Fang"
REP_TXT.BFFLabels[2517][4] = "Friend"
REP_TXT.BFFLabels[2517][5] = "True Friend"
---- Sabellian 2518
REP_TXT.BFFLabels[2518] = {} -- Acquaintance
REP_TXT.BFFLabels[2518][1] = "Cohort"
REP_TXT.BFFLabels[2518][2] = "Ally"
REP_TXT.BFFLabels[2518][3] = "Fang"
REP_TXT.BFFLabels[2518][4] = "Friend"
REP_TXT.BFFLabels[2518][5] = "True Friend"
---- Artisan's Consortium - Dragon Isles Branch 2544
REP_TXT.BFFLabels[2544] = {} -- Neutral
REP_TXT.BFFLabels[2544][1] = "Preferred"
REP_TXT.BFFLabels[2544][2] = "Respected"
REP_TXT.BFFLabels[2544][3] = "Valued"
REP_TXT.BFFLabels[2544][4] = "Esteemed"
---- Cobalt Assembly 2550
REP_TXT.BFFLabels[2550] = {} -- Empty
REP_TXT.BFFLabels[2550][1] = "Low"
REP_TXT.BFFLabels[2550][2] = "Medium"
REP_TXT.BFFLabels[2550][3] = "High"
REP_TXT.BFFLabels[2550][4] = "Maximum"
---- Soridormi 2553
REP_TXT.BFFLabels[2553] = {} -- Anomaly
REP_TXT.BFFLabels[2553][1] = "Future Friend"
REP_TXT.BFFLabels[2553][2] = "Rift-Mender"
REP_TXT.BFFLabels[2553][3] = "Timewalker"
REP_TXT.BFFLabels[2553][4] = "Legend"
---- The Weaver 2601
REP_TXT.BFFLabels[2601] = {} -- Stranger
REP_TXT.BFFLabels[2601][1] = "Acquaintance"
REP_TXT.BFFLabels[2601][2] = "Crony"
REP_TXT.BFFLabels[2601][3] = "Accomplice"
REP_TXT.BFFLabels[2601][4] = "Collaborator"
REP_TXT.BFFLabels[2601][5] = "Accessory"
REP_TXT.BFFLabels[2601][6] = "Abettor"
REP_TXT.BFFLabels[2601][7] = "Conspirator"
REP_TXT.BFFLabels[2601][8] = "Mastermind"
---- The General 2605
REP_TXT.BFFLabels[2605] = {} -- Stranger
REP_TXT.BFFLabels[2605][1] = "Acquaintance"
REP_TXT.BFFLabels[2605][2] = "Crony"
REP_TXT.BFFLabels[2605][3] = "Accomplice"
REP_TXT.BFFLabels[2605][4] = "Collaborator"
REP_TXT.BFFLabels[2605][5] = "Accessory"
REP_TXT.BFFLabels[2605][6] = "Abettor"
REP_TXT.BFFLabels[2605][7] = "Conspirator"
REP_TXT.BFFLabels[2605][8] = "Mastermind"
---- The Vizier 2607
REP_TXT.BFFLabels[2607] = {} -- Stranger
REP_TXT.BFFLabels[2607][1] = "Acquaintance"
REP_TXT.BFFLabels[2607][2] = "Crony"
REP_TXT.BFFLabels[2607][3] = "Accomplice"
REP_TXT.BFFLabels[2607][4] = "Collaborator"
REP_TXT.BFFLabels[2607][5] = "Accessory"
REP_TXT.BFFLabels[2607][6] = "Abettor"
REP_TXT.BFFLabels[2607][7] = "Conspirator"
REP_TXT.BFFLabels[2607][8] = "Mastermind"
---- Azerothian Archives 2615
REP_TXT.BFFLabels[2615] = {} -- Graduate
REP_TXT.BFFLabels[2615][1] = "Assistant"
REP_TXT.BFFLabels[2615][2] = "Contract"
REP_TXT.BFFLabels[2615][3] = "Resident"
REP_TXT.BFFLabels[2615][4] = "Tenured"

---------------------------
-- Tooltips
---------------------------
---- Initialize
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}
---- Names and tips
REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "Open a window to configure Reputations."
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "If this box is unchecked, the faction list is displayed by default (Blizzard) sorting, grouped by logical and alphabetical order.\r\n\r\nIf this box is checked, the faction list is sorted by standing.\r\n\r\nTo view the |cFFFAA0A0inactive|r factions, uncheck this box and go to the bottom of the list."
REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "Check this button to see mobs you can kill to improve your reputation."
REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "Check this button to see quests you can do to improve your reputation."
REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "Check this button to see PvP quests you can do to improve your reputation."
REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
REP_TXT.elements.tip.REP_ShowItemsButton	= "Check this button to see items you can hand in to improve your reputation."
REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
REP_TXT.elements.tip.REP_ShowInstancesButton	= "Check this button to see instances you can run to improve your reputation."
REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
REP_TXT.elements.tip.REP_ShowGeneralButton	= "Check this button to see general information about improving your reputation."
REP_TXT.elements.name.REP_DetailShowAllButton	= REP_TXT.showAll
REP_TXT.elements.tip.REP_DetailShowAllButton	= "Press this button to check all four of the checkboxes to the left.\r\nThis will show mobs, quests, items and instances that give you reputation for the currently selected faction."
REP_TXT.elements.name.REP_DetailShowNoneButton	= REP_TXT.showNone
REP_TXT.elements.tip.REP_DetailShowNoneButton	= "Press this button to deselect all four of the checkboxes to the left.\r\nThis will show you none of the ways to gain reputation for the currently selected faction."
REP_TXT.elements.name.REP_DetailExpandButton	= REP_TXT.expand
REP_TXT.elements.tip.REP_DetailExpandButton	= "Press this button to expand all entries in the list. This will show you the materials needed to hand in any item gathering quests."
REP_TXT.elements.name.REP_DetailCollapseButton	= REP_TXT.collapse
REP_TXT.elements.tip.REP_DetailCollapseButton	= "Press this button to collapse all entries in the list. This will hide the materials needed to hand in gathering quests."
REP_TXT.elements.name.REP_DetailSupressNoneFactionButton	= REP_TXT.supressNoneFaction
REP_TXT.elements.tip.REP_DetailSupressNoneFactionButton	= "Press this button to re-enable all quests for this faction that you have excluded by right-clicking on it."
REP_TXT.elements.name.REP_DetailSupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
REP_TXT.elements.tip.REP_DetailSupressNoneGlobalButton	= "Press this button to re-enable all quests for all factions that you have excluded by right-clicking on it."
REP_TXT.elements.name.REP_DetailClearSessionGainButton	= REP_TXT.clearSessionGain
REP_TXT.elements.tip.REP_DetailClearSessionGainButton	= "Press this button to reset the counter for reputation gained this session."
REP_TXT.elements.name.REP_ShowDarkmoonFaireButton = "Darkmoon Faire Buff"
REP_TXT.elements.tip.REP_ShowDarkmoonFaireButton = "Toggle this option to show how much reputation you would earn with the Darkmoon Faire buff active."
REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
REP_TXT.elements.tip.REP_EnableMissingBox	= "Enable this setting to add the missing reputation points needed for the next reputation level behind the current standing of each faction in the reputation frame."
REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Enable this setting to display an extended reputation detail frame.\r\nIn addition the information shown in the original detail frame, this will display the missing reputation needed to reach the next reputation level and a list of ways to gain this reputation by listing quests, mobs, items and instances that yield reputation for the chosen faction."
REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
REP_TXT.elements.tip.REP_GainToChatBox	= "Enable this setting to display reputation gained for all factions whenever you gain reputation.\r\nThis differs from the standard way of reporting reputation gain, as normally, only the gain with the main faction is listed."
REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
REP_TXT.elements.tip.REP_NoGuildGainBox	= "Enable this setting to not print messages to chat for guild reputation."
REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "Enable this setting to suppress the standard reputation gain messages.\r\nThis makes sense if you have enabled the detailed faction gain messages, so you don't get identical listings from the standard and extended versions."
REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "Enable this setting to show the reputation you can gain by handing in items and completed quests as a grey bar overlaid over the normal reputation bar in the reputation frame."
REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "Enable this setting to automatically switch the faction being watched to the last faction whom you have gained reputation for."
REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "Enable this setting to not switch the watched faction for guild reputation gains."
REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
REP_TXT.elements.tip.REP_SilentSwitchBox	= "Enable this setting to switch the reputation bar silently (without a message to chat)."
REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
REP_TXT.elements.name.REP_ChatFrameSlider	= "Chat frame"
REP_TXT.elements.tip.REP_ChatFrameSlider	= "Select which chat frame Reputations prints its messages."
REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
REP_TXT.elements.tip.REP_EnableParagonBarBox  = "Enable this option to display your current paragon progress in the reputation bars."
REP_TXT.elements.name.REP_OptionEnableMissing	= REP_TXT.elements.name.REP_EnableMissingBox
REP_TXT.elements.tip.REP_OptionEnableMissing	= REP_TXT.elements.tip.REP_EnableMissingBox
REP_TXT.elements.name.REP_OptionEnableMissingCB	= REP_TXT.elements.name.REP_EnableMissingBox
REP_TXT.elements.tip.REP_OptionEnableMissingCB	= REP_TXT.elements.tip.REP_EnableMissingBox
REP_TXT.elements.name.REP_OptionExtendDetails	= REP_TXT.elements.name.REP_ExtendDetailsBox
REP_TXT.elements.tip.REP_OptionExtendDetails	= REP_TXT.elements.tip.REP_ExtendDetailsBox
REP_TXT.elements.name.REP_OptionExtendDetailsCB	= REP_TXT.elements.name.REP_ExtendDetailsBox
REP_TXT.elements.tip.REP_OptionExtendDetailsCB	= REP_TXT.elements.tip.REP_ExtendDetailsBox
REP_TXT.elements.name.REP_OptionGainToChat	= REP_TXT.elements.name.REP_GainToChatBox
REP_TXT.elements.tip.REP_OptionGainToChat	= REP_TXT.elements.tip.REP_GainToChatBox
REP_TXT.elements.name.REP_OptionGainToChatCB	= REP_TXT.elements.name.REP_GainToChatBox
REP_TXT.elements.tip.REP_OptionGainToChatCB	= REP_TXT.elements.tip.REP_GainToChatBox
REP_TXT.elements.name.REP_OptionNoGuildGain	= REP_TXT.elements.name.REP_NoGuildGainBox
REP_TXT.elements.tip.REP_OptionNoGuildGain	= REP_TXT.elements.tip.REP_NoGuildGainBox
REP_TXT.elements.name.REP_OptionNoGuildGainCB	= REP_TXT.elements.name.REP_NoGuildGainBox
REP_TXT.elements.tip.REP_OptionNoGuildGainCB	= REP_TXT.elements.tip.REP_NoGuildGainBox
REP_TXT.elements.name.REP_OptionSupressOriginalGain	= REP_TXT.elements.name.REP_SupressOriginalGainBox
REP_TXT.elements.tip.REP_OptionSupressOriginalGain	= REP_TXT.elements.tip.REP_SupressOriginalGainBox
REP_TXT.elements.name.REP_OptionSupressOriginalGainCB	= REP_TXT.elements.name.REP_SupressOriginalGainBox
REP_TXT.elements.tip.REP_OptionSupressOriginalGainCB	= REP_TXT.elements.tip.REP_SupressOriginalGainBox
REP_TXT.elements.name.REP_OptionShowPreviewRep	= REP_TXT.elements.name.REP_ShowPreviewRepBox
REP_TXT.elements.tip.REP_OptionShowPreviewRep	= REP_TXT.elements.tip.REP_ShowPreviewRepBox
REP_TXT.elements.name.REP_OptionShowPreviewRepCB	= REP_TXT.elements.name.REP_ShowPreviewRepBox
REP_TXT.elements.tip.REP_OptionShowPreviewRepCB	= REP_TXT.elements.tip.REP_ShowPreviewRepBox
REP_TXT.elements.name.REP_OptionSwitchFactionBar	= REP_TXT.elements.name.REP_SwitchFactionBarBox
REP_TXT.elements.tip.REP_OptionSwitchFactionBar	= REP_TXT.elements.tip.REP_SwitchFactionBarBox
REP_TXT.elements.name.REP_OptionSwitchFactionBarCB	= REP_TXT.elements.name.REP_SwitchFactionBarBox
REP_TXT.elements.tip.REP_OptionSwitchFactionBarCB	= REP_TXT.elements.tip.REP_SwitchFactionBarBox
REP_TXT.elements.name.REP_OptionNoGuildSwitch	= REP_TXT.elements.name.REP_NoGuildSwitchBox
REP_TXT.elements.tip.REP_OptionNoGuildSwitch	= REP_TXT.elements.tip.REP_NoGuildSwitchBox
REP_TXT.elements.name.REP_OptionNoGuildSwitchCB	= REP_TXT.elements.name.REP_NoGuildSwitchBox
REP_TXT.elements.tip.REP_OptionNoGuildSwitchCB	= REP_TXT.elements.tip.REP_NoGuildSwitchBox
REP_TXT.elements.name.REP_OptionSilentSwitch	= REP_TXT.elements.name.REP_SilentSwitchBox
REP_TXT.elements.tip.REP_OptionSilentSwitch	= REP_TXT.elements.tip.REP_SilentSwitchBox
REP_TXT.elements.name.REP_OptionSilentSwitchCB	= REP_TXT.elements.name.REP_SilentSwitchBox
REP_TXT.elements.tip.REP_OptionSilentSwitchCB	= REP_TXT.elements.tip.REP_SilentSwitchBox
REP_TXT.elements.name.REP_OptionGuildCap	= REP_TXT.elements.name.REP_GuildCapBox
REP_TXT.elements.tip.REP_OptionGuildCap	= REP_TXT.elements.tip.REP_GuildCapBox
REP_TXT.elements.name.REP_OptionGuildCapCB	= REP_TXT.elements.name.REP_GuildCapBox
REP_TXT.elements.tip.REP_OptionGuildCapCB	= REP_TXT.elements.tip.REP_GuildCapBox
REP_TXT.elements.name.REP_OptionChatFrameSlider	= REP_TXT.elements.name.REP_ChatFrameSlider
REP_TXT.elements.tip.REP_OptionChatFrameSlider	= REP_TXT.elements.tip.REP_ChatFrameSlider
REP_TXT.elements.name.REP_OptionEnableParagonBar = REP_TXT.elements.name.REP_EnableParagonBarBox
REP_TXT.elements.tip.REP_OptionEnableParagonBar = REP_TXT.elements.tip.REP_EnableParagonBarBox
REP_TXT.elements.name.REP_OptionEnableParagonBarCB = REP_TXT.elements.name.REP_EnableParagonBarBox
REP_TXT.elements.tip.REP_OptionEnableParagonBarCB = REP_TXT.elements.tip.REP_EnableParagonBarBox
---------------------------
-- New options settings
---------------------------
---- General
REP_TXT.settings = {}
REP_TXT.settings.info = {}
REP_TXT.settings.tooltips = {}
---- Titles
REP_TXT.settings.buffTitle = "Reputation Buffs"
REP_TXT.settings.buffSubTitle = "You can toggle these reputation buffs to see how much reputation you would get from different activities. Buffs that don't stack will be disabled when toggling their counterparts."
---- Buffs
REP_TXT.settings.harvestBountyRepBuff = "The Spirit of Sharing (Pilgrim's Bounty)"
REP_TXT.settings.info.harvestBountyRepBuff = "Increases reputation gained by 10%.  Lasts 1 hour."
REP_TXT.settings.wickermanRepBuff = "Invocation of the Wickerman (Hallow's End)"
REP_TXT.settings.info.wickermanRepBuff = "Increases experience earned and reputation gained by 10%.  Lasts 2 hrs."
REP_TXT.settings.wickermanRepBuffUnburdened = "Unburdened (Hallow's End)"
REP_TXT.settings.info.wickermanRepBuffUnburdened = "You have cast your worries into the Wickerman's fire. Increases experience earned and reputation gained by 10%.  Lasts 2 hrs."
REP_TXT.settings.wickermanRepBuffGrimVisage = "Grim Visage (Hallow's End)"
REP_TXT.settings.info.wickermanRepBuffGrimVisage = "You have painted your face with the Wickerman's ashes. Increases experience earned and reputation gained by 10%.  Lasts 2 hrs."
REP_TXT.settings.MrPopularityRankOne = "Mr. Popularity (Guild Perk, Rank 1)"
REP_TXT.settings.info.MrPopularityRankOne = "Reputation gained from killing monsters and completing quests increased by 5%."
REP_TXT.settings.MrPopularityRankTwo = "Mr. Popularity (Guild Perk, Rank 2)"
REP_TXT.settings.info.MrPopularityRankTwo = "Reputation gained from killing monsters and completing quests increased by 10%."
REP_TXT.settings.DarkmoonFaireWeeRepBuff = "WHEE! (Darkmoon Faire)"
REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "Rode the Darkmoon carousel or roller coaster. Experience and Reputation gains increased by 10%."
REP_TXT.settings.DarkmoonFaireHatRep = "Darkmoon Top Hat (Darkmoon Faire)"
REP_TXT.settings.info.DarkmoonFaireHatRep = "Increase experience and reputation gains by 10% for 1 hour. Hat is consumed on use."
REP_TXT.settings.ShowBonusGainsInChat = "Show bonus reputation in chat"
REP_TXT.settings.info.ShowBonusGainsInChat = "Show bonus reputation from commendations in chat when reputation is gained."
---------------------------
-- Characters tab settings
---------------------------
REP_TXT.settings.characterTabSubTitle = "You can either reset or delete one of your character's addon settings from the list below."
REP_TXT.settings.tooltips.removeCharacter = "Remove this character from tooltips."
REP_TXT.settings.tooltips.addCharacter = "Add this character to tooltips."
REP_TXT.settings.delete = "Delete"
REP_TXT.settings.reset = "Reset"
REP_TXT.settings.characterUpdated = "The saved variables for %s have been updated."
REP_TXT.settings.characterReset = "The saved variables for %s have been reset."
REP_TXT.settings.characterDeleted = "The saved variables for %s have been deleted."