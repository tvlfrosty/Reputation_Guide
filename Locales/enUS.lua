-- Default (English)
--------------------	--------------------


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
REP_TXT_STAND_LV	= {}
REP_TXT_STAND_LV[0]	= "Unknown"
REP_TXT_STAND_LV[1]	= "Hated"
REP_TXT_STAND_LV[2]	= "Hostile"
REP_TXT_STAND_LV[3]	= "Unfriendly"
REP_TXT_STAND_LV[4]	= "Neutral"
REP_TXT_STAND_LV[5]	= "Friendly"
REP_TXT_STAND_LV[6]	= "Honored"
REP_TXT_STAND_LV[7]	= "Revered"
REP_TXT_STAND_LV[8]	= "Exalted"
REP_TXT_STAND_LV[9] = "Paragon"
REP_TXT_STAND_LV_TIER	= {}
REP_TXT_STAND_LV_TIER[0] = "Unknown"
REP_TXT_STAND_LV_TIER[1] = "Tier 1"
REP_TXT_STAND_LV_TIER[2] = "Tier 2"
REP_TXT_STAND_LV_TIER[3] = "Tier 3"
REP_TXT_STAND_LV_TIER[4] = "Tier 4"
REP_TXT_STAND_LV_TIER[5] = "Tier 5"
REP_TXT_STAND_LV_TIER[6] = "Tier 6"
REP_TXT_STAND_LV_TRUST	= {}
REP_TXT_STAND_LV_TRUST[0] = "Unknown"
REP_TXT_STAND_LV_TRUST[1] = "Dubious"
REP_TXT_STAND_LV_TRUST[2] = "Apprehensive"
REP_TXT_STAND_LV_TRUST[3] = "Tentative"
REP_TXT_STAND_LV_TRUST[4] = "Ambivalent"
REP_TXT_STAND_LV_TRUST[5] = "Cordial"
REP_TXT_STAND_LV_TRUST[6] = "Appreciative"

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
-- Tooltip
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}

REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "Open a window to configure Reputations."
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "If this box is unchecked, the faction list is displayed by default (Blizzard) sorting, grouped by logical and alphabetical order.\r\n\r\nIf this box is checked, the faction list is sorted by standing.\r\n\r\nTo view the |cFFFAA0A0inactive|r factions, uncheck this box and go to the bottom of the list."

REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "Check this button to see mobs you can kill to improve your reputation."
REP_TXT.elements.name.REP_ShowQuestButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowQuestButton	= "Check this button to see quests you can do to improve your reputation."
REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
REP_TXT.elements.tip.REP_ShowItemsButton	= "Check this button to see items you can hand in to improve your reputation."
REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
REP_TXT.elements.tip.REP_ShowInstancesButton	= "Check this button to see instances you can run to improve your reputation."
REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
REP_TXT.elements.tip.REP_ShowGeneralButton	= "Check this button to see general information about improving your reputation."

REP_TXT.elements.name.REP_ShowAllButton	= REP_TXT.showAll
REP_TXT.elements.tip.REP_ShowAllButton	= "Press this button to check all four of the checkboxes to the left.\r\nThis will show mobs, quests, items and instances that give you reputation for the currently selected faction."
REP_TXT.elements.name.REP_ShowNoneButton	= REP_TXT.showNone
REP_TXT.elements.tip.REP_ShowNoneButton	= "Press this button to deselect all four of the checkboxes to the left.\r\nThis will show you none of the ways to gain reputation for the currently selected faction."

REP_TXT.elements.name.REP_ExpandButton	= REP_TXT.expand
REP_TXT.elements.tip.REP_ExpandButton	= "Press this button to expand all entries in the list. This will show you the materials needed to hand in any item gathering quests."
REP_TXT.elements.name.REP_CollapseButton	= REP_TXT.collapse
REP_TXT.elements.tip.REP_CollapseButton	= "Press this button to collapse all entries in the list. This will hide the materials needed to hand in gathering quests."
REP_TXT.elements.name.REP_SupressNoneFactionButton	= REP_TXT.supressNoneFaction
REP_TXT.elements.tip.REP_SupressNoneFactionButton	= "Press this button to re-enable all quests for this faction that you have excluded by righ-clicking on it."
REP_TXT.elements.name.REP_SupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
REP_TXT.elements.tip.REP_SupressNoneGlobalButton	= "Press this button to re-enable all quests for all factions that you have excluded by right-clicking on it."
REP_TXT.elements.name.REP_ClearSessionGainButton	= REP_TXT.clearSessionGain
REP_TXT.elements.tip.REP_ClearSessionGainButton	= "Press this button to clear reset the counter for reputation gained this session."
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
