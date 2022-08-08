-- Traditional Chinese (正體中文)	
--------------------	--------------------
if (GetLocale() =="zhTW") then	
	
-- Binding names	
BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
BINDING_NAME_SHOWCONFIG	= "顯示選項“窗口"
BINDING_NAME_SHOWDETAILS	= "顯示聲譽細節窗口"
	
REP_TXT	= {}
-- help	
REP_TXT.help	= "一個工具來管理你的聲譽"
REP_TXT.command	= "無法解析命令"
REP_TXT.usage	= "用法"
REP_TXT.helphelp	= "顯示此幫助文本"
REP_TXT.helpabout	= "只看該作者信息"
REP_TXT.helpstatus	= "顯示配置狀態"
-- about	
REP_TXT.by	= "由"
REP_TXT.version	= "版本"
REP_TXT.date	= "日"
REP_TXT.web	= "網站"
REP_TXT.slash	= "斜線命令"
REP_TXT_STAND_LV	= {}
REP_TXT_STAND_LV[0]	= "未知"
REP_TXT_STAND_LV[1]	= "討厭"
REP_TXT_STAND_LV[2]	= "敵對的"
REP_TXT_STAND_LV[3]	= "不友好"
REP_TXT_STAND_LV[4]	= "中性"
REP_TXT_STAND_LV[5]	= "友好"
REP_TXT_STAND_LV[6]	= "榮幸"
REP_TXT_STAND_LV[7]	= "崇敬"
REP_TXT_STAND_LV[8]	= "崇高的"
-- status	
REP_TXT.status	= "狀態"
REP_TXT.disabled	= "禁用"
REP_TXT.enabled	= "啟用"
REP_TXT.statMobs	= "顯示暴民 [M]"
REP_TXT.statQuests	= "顯示任務 [Q]"
REP_TXT.statInstances	= "顯示實例 [D]"
REP_TXT.statItems	= "顯示項目 [I]"
REP_TXT.statGeneral	= "顯示一般 [G]"
REP_TXT.statMissing	= "顯示缺少信譽"
REP_TXT.statDetails	= "顯示延長詳細框架"
REP_TXT.statChat	= "詳細的聊天消息"
REP_TXT.statNoGuildChat	= "沒有公會聲望聊天"
REP_TXT.statSuppress	= "抑制原始的聊天信息"
REP_TXT.statPreview	= "顯示預覽信譽在聲譽幀"
REP_TXT.statSwitch	= "自動切換派系信譽欄"
REP_TXT.statNoGuildSwitch	= "公會聲望沒有切換"
REP_TXT.statSilentSwitch	= "沒有消息的時候切換桿"
REP_TXT.statGuildCap	= "顯示在聊天的公會聲望上限"
-- XML UI elements	
REP_TXT.showQuests	= "顯示任務"
REP_TXT.showInstances	= "顯示實例"
REP_TXT.showMobs	= "顯示暴民"
REP_TXT.showItems	= "顯示項目"
REP_TXT.showGeneral	= "顯示一般"
REP_TXT.showAll	= "顯示全部"
REP_TXT.showNone	= "顯示“無”"
REP_TXT.expand	= "擴大"
REP_TXT.collapse	= "崩潰"
REP_TXT.supressNoneFaction	= "清除排除派"
REP_TXT.supressNoneGlobal	= "清除排除"
REP_TXT.suppressHint	= "右鍵單擊一個任務，排除它從匯總"
REP_TXT.clearSessionGain	= "清除會話增益計數器"
-- options dialog	
REP_TXT.showMissing	= "顯示缺少的聲譽，聲譽框架"
REP_TXT.extendDetails	= "顯示延長聲譽細節框架"
REP_TXT.gainToChat	= "Replace original faction gain messages with a more detailed version"
REP_TXT.noGuildGain	= "不要寫聊天公會聲望"
REP_TXT.suppressOriginalGain	= "剿原派增益消息"
REP_TXT.showPreviewRep	= "顯示聲譽，可以傳世的聲譽幀"
REP_TXT.switchFactionBar	= "開關信譽欄對他們來說，只是派享有聲譽"
REP_TXT.noGuildSwitch	= "不要切換公會聲望信譽欄"
REP_TXT.silentSwitch	= "沒有消息聊天的時候切換桿。"
REP_TXT.guildCap	= "顯示在聊天的公會聲望上限。"
REP_TXT.defaultChatFrame	= "使用默認的聊天框"
REP_TXT.chatFrame	= "使用聊天框 %d (%s)"
REP_TXT.usingDefaultChatFrame	= "Now using default chat frame"
REP_TXT.usingChatFrame	= "Now using chat frame"
REP_TXT.EnableParagonBar = "Display paragon reputation in bars."
-- various LUA	
REP_TXT.options	= "Options"
REP_TXT.orderByStanding	= "Order by Standing"
REP_TXT.lookup	= "Looking up faction "
REP_TXT.allFactions	= "列出所有派別"
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
REP_TXT.AU	= "任何無名"
REP_TXT.AN	= "任何命名"
REP_TXT.BB	= "Bloodsail Buccaneer"
REP_TXT.SSP	= "Southsea Pirate"
REP_TXT.Wa	= "Wastewander"
REP_TXT.VCm	= "Any Venture Co. mob"
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
REP_TXT.questSummaryTip	= "該條目顯示了一個總結上面列出的所有任務。\r\n 假設所有列出的任務是日常任務，因為這會告訴你有多少天它會帶你到達下一個信譽等級，如果你做所有的日常任務每天，這是非常有用的。"
REP_TXT.complete	= "完成"
REP_TXT.active	= "活躍"
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
REP_TXT.skillHerb	= "草藥"
REP_TXT.skillMine	= "採礦"
REP_TXT.skillSkin	= "剝皮"
REP_TXT.skillAlch	= "煉金"
REP_TXT.skillBlack	= "鍛造"
REP_TXT.skillEnch	= "附魔"
REP_TXT.skillEngi	= "工程學"
REP_TXT.skillIncrip	= "題詞"
REP_TXT.skillJewel	= "珠寶加工"
REP_TXT.skillLeath	= "製皮"
REP_TXT.skillTail	= "裁縫"
REP_TXT.skillAid	= "急救"
REP_TXT.skillArch	= "考古"
REP_TXT.skillCook	= "烹飪"
REP_TXT.skillFish	= "釣魚"
-- Tooltip	
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}
	
REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "打開窗口配置Reputations。"
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "如果不選中此框，派列表顯示默認（暴雪）排序，分組邏輯和字母順序排列。\r\n\r\n如果選中此複選框，派列表排序站在\r\n\r\n要查看| cFFFAA0A0無效|r派系，取消選中此框和列表的底部。"
	
REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "檢查此按鈕，看你能殺小怪來提高你的聲譽。"
REP_TXT.elements.name.REP_ShowQuestButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowQuestButton	= "檢查此按鈕可看到任務可以做，以提高你的聲譽。"
REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
REP_TXT.elements.tip.REP_ShowItemsButton	= "檢查此按鈕，看到手的項目，你可以提高你的聲譽。"
REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
REP_TXT.elements.tip.REP_ShowInstancesButton	= "檢查此按鈕可看到運行的情況下，你可以提高你的聲譽。"
REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
REP_TXT.elements.tip.REP_ShowGeneralButton	= "檢查此按鈕可看到一般信息，提高你的聲譽。"
	
REP_TXT.elements.name.REP_ShowAllButton	= REP_TXT.showAll
REP_TXT.elements.tip.REP_ShowAllButton	= "按下此按鈕可檢查所有四個複選框的左側。\r\n這將顯示小怪，任務，物品和實例，讓你的聲譽目前選定的派系。"
REP_TXT.elements.name.REP_ShowNoneButton	= REP_TXT.showNone
REP_TXT.elements.tip.REP_ShowNoneButton	= "按下此按鈕，取消所有的四個複選框的左側。\r\n這會告訴你的方法沒有贏得口碑，目前選擇的派系。"
	
REP_TXT.elements.name.REP_ExpandButton	= REP_TXT.expand
REP_TXT.elements.tip.REP_ExpandButton	= "按下此按鈕可展開列表中的所有條目。這將顯示您在任何項目的收集任務所需的材料手。"
REP_TXT.elements.name.REP_CollapseButton	= REP_TXT.collapse
REP_TXT.elements.tip.REP_CollapseButton	= "按下此按鈕折疊所有列表中的條目。這將隱藏在收集任務所需的材料手。"
REP_TXT.elements.name.REP_SupressNoneFactionButton	= REP_TXT.supressNoneFaction
REP_TXT.elements.tip.REP_SupressNoneFactionButton	= "按下此按鈕可重新啟用所有權利點擊它可以排除這個派別的任務。"
REP_TXT.elements.name.REP_SupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
REP_TXT.elements.tip.REP_SupressNoneGlobalButton	= "按下此按鈕可重新啟用通過右鍵點擊它可以排除所有派別的所有任務。"
REP_TXT.elements.name.REP_ClearSessionGainButton	= REP_TXT.clearSessionGain
REP_TXT.elements.tip.REP_ClearSessionGainButton	= "按下此按鈕來清除重置計數器聲譽，獲得了本次會議。"
	
REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
REP_TXT.elements.tip.REP_EnableMissingBox	= "啟用此設置，添加丟失的聲譽點需要在未來的聲譽站在每個派別的聲譽框架背後的當前水平。"
REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
REP_TXT.elements.tip.REP_ExtendDetailsBox	= "啟用此設置以顯示擴展聲譽細節幀\r\n除了在原來的詳細框架顯示的信息，這會顯示丟失的聲譽需要到達下一個信譽等級，並以列表的方式來獲得這種聲譽由上市的任務，怪物，物品和實例產生選擇派的聲譽。"
REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
REP_TXT.elements.tip.REP_GainToChatBox	= "啟用此設置來顯示的聲譽獲得了所有派別，每當你獲得的聲譽。\r \n這不同於報告聲譽增益的標準的方式，通常情況下，只有上市收益的主要派別。"
REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
REP_TXT.elements.tip.REP_NoGuildGainBox	= "啟用此設置不打印消息聊天公會聲望。"
REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "啟用此設置來抑制標準聲譽增益消息。\r \n這是有道理的，如果已經啟用了詳細的派系增益消息，所以你無法得到相同的上市標準和擴展版本。"
REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "啟用此設置，你可以獲得交付項目和已完成的任務，作為一個灰色條覆蓋在正常的聲譽酒吧的聲譽幀顯示的聲譽。"
REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "啟用此設置可自動切換的派系正在觀看的最後一個派別就是你所獲得的聲譽。"
REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "啟用此設置不切換觀看派公會聲望收益。"
REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
REP_TXT.elements.tip.REP_SilentSwitchBox	= "啟用此設置靜默信譽欄切換（沒有消息聊天）。"
REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
REP_TXT.elements.name.REP_ChatFrameSlider	= "聊天幀"
REP_TXT.elements.tip.REP_ChatFrameSlider	= "選擇聊天框架Reputations打印其消息。"
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
end