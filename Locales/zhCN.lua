-- Simplified Chinese (简体中文)
--------------------	--------------------
if (GetLocale() =="zhCN") then

-- Binding names
BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
BINDING_NAME_SHOWCONFIG	= "显示选项“窗口"
BINDING_NAME_SHOWDETAILS	= "显示声誉细节窗口"

REP_TXT	= {}
-- help
REP_TXT.help	= "一个工具来管理你的声誉"
REP_TXT.command	= "无法解析命令"
REP_TXT.usage	= "用法"
REP_TXT.helphelp	= "显示此帮助文本"
REP_TXT.helpabout	= "只看该作者信息"
REP_TXT.helpstatus	= "显示配置状态"
-- about
REP_TXT.by	= "由"
REP_TXT.version	= "版本"
REP_TXT.date	= "日"
REP_TXT.web	= "网站"
REP_TXT.slash	= "斜线命令"
REP_TXT_STAND_LV	= {}
REP_TXT_STAND_LV[0]	= "未知"
REP_TXT_STAND_LV[1]	= "讨厌"
REP_TXT_STAND_LV[2]	= "敌对的"
REP_TXT_STAND_LV[3]	= "不友好"
REP_TXT_STAND_LV[4]	= "中性"
REP_TXT_STAND_LV[5]	= "友好"
REP_TXT_STAND_LV[6]	= "荣幸"
REP_TXT_STAND_LV[7]	= "崇敬"
REP_TXT_STAND_LV[8]	= "崇高的"
REP_TXT_STAND_LV[9] = "巅峰"
REP_TXT_STAND_LV_TIER	= {}
REP_TXT_STAND_LV_TIER[0]	= "未知"
REP_TXT_STAND_LV_TIER[1] = "等级1"
REP_TXT_STAND_LV_TIER[2] = "等级2"
REP_TXT_STAND_LV_TIER[3] = "等级3"
REP_TXT_STAND_LV_TIER[4] = "等级4"
REP_TXT_STAND_LV_TIER[5] = "等级5"
REP_TXT_STAND_LV_TIER[6] = "等级6"
REP_TXT_STAND_LV_TRUST	= {}
REP_TXT_STAND_LV_TRUST[0] = "未知"
REP_TXT_STAND_LV_TRUST[1] = "防备"
REP_TXT_STAND_LV_TRUST[2] = "불안"
REP_TXT_STAND_LV_TRUST[3] = "犹豫"
REP_TXT_STAND_LV_TRUST[4] = "纠结"
REP_TXT_STAND_LV_TRUST[5] = "和善"
REP_TXT_STAND_LV_TRUST[6] = "欣赏"

-- status
REP_TXT.status	= "状态"
REP_TXT.disabled	= "禁用"
REP_TXT.enabled	= "启用"
REP_TXT.statMobs	= "显示暴民 [M]"
REP_TXT.statQuests	= "显示任务 [Q]"
REP_TXT.statInstances	= "显示实例 [D]"
REP_TXT.statItems	= "显示项目 [I]"
REP_TXT.statGeneral	= "显示一般 [G]"
REP_TXT.statMissing	= "显示缺少信誉"
REP_TXT.statDetails	= "显示延长详细框架"
REP_TXT.statChat	= "详细的聊天消息"
REP_TXT.statNoGuildChat	= "没有公会声望聊天"
REP_TXT.statSuppress	= "抑制原始的聊天信息"
REP_TXT.statPreview	= "显示预览信誉在声誉帧"
REP_TXT.statSwitch	= "自动切换派系信誉栏"
REP_TXT.statNoGuildSwitch	= "公会声望没有切换"
REP_TXT.statSilentSwitch	= "没有消息的时候切换杆"
REP_TXT.statGuildCap	= "显示在聊天的公会声望上限"
-- XML UI elements
REP_TXT.showQuests	= "显示任务"
REP_TXT.showInstances	= "显示实例"
REP_TXT.showMobs	= "显示暴民"
REP_TXT.showItems	= "显示项目"
REP_TXT.showGeneral	= "显示一般"
REP_TXT.showAll	= "显示全部"
REP_TXT.showNone	= "显示“无”"
REP_TXT.expand	= "扩大"
REP_TXT.collapse	= "崩溃"
REP_TXT.supressNoneFaction	= "清除排除派"
REP_TXT.supressNoneGlobal	= "清除排除"
REP_TXT.suppressHint	= "右键单击一个任务，排除它从汇总"
REP_TXT.clearSessionGain	= "清除会话增益计数器"
-- options dialog
REP_TXT.showMissing	= "显示缺少的声誉，声誉框架"
REP_TXT.extendDetails	= "显示延长声誉细节框架"
REP_TXT.gainToChat	= "Replace original faction gain messages with a more detailed version"
REP_TXT.noGuildGain	= "不要写聊天公会声望"
REP_TXT.suppressOriginalGain	= "剿原派增益消息"
REP_TXT.showPreviewRep	= "显示声誉，可以传世的声誉帧"
REP_TXT.switchFactionBar	= "开关信誉栏对他们来说，只是派享有声誉"
REP_TXT.noGuildSwitch	= "不要切换公会声望信誉栏"
REP_TXT.silentSwitch	= "没有消息聊天的时候切换杆。"
REP_TXT.guildCap	= "显示在聊天的公会声望上限。"
REP_TXT.defaultChatFrame	= "使用默认的聊天框"
REP_TXT.chatFrame	= "使用聊天框 %d (%s)"
REP_TXT.usingDefaultChatFrame	= "Now using default chat frame"
REP_TXT.usingChatFrame	= "Now using chat frame"
REP_TXT.EnableParagonBar = "Display paragon reputation in bars."
-- various LUA
REP_TXT.options	= "Options"
REP_TXT.orderByStanding	= "Order by Standing"
REP_TXT.lookup	= "Looking up faction "
REP_TXT.allFactions	= "列出所有派别"
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
REP_TXT.AU	= "任何无名"
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
REP_TXT.questSummaryTip	= "该条目显示了一个总结上面列出的所有任务。\r\n 假设所有列出的任务是日常任务，因为这会告诉你有多少天它会带你到达下一个信誉等级，如果你做所有的日常任务每天，这是非常有用的。"
REP_TXT.complete	= "完成"
REP_TXT.active	= "活跃"
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
REP_TXT.skillHerb	= "草药"
REP_TXT.skillMine	= "采矿"
REP_TXT.skillSkin	= "剥皮"
REP_TXT.skillAlch	= "炼金"
REP_TXT.skillBlack	= "锻造"
REP_TXT.skillEnch	= "附魔"
REP_TXT.skillEngi	= "工程学"
REP_TXT.skillIncrip	= "题词"
REP_TXT.skillJewel	= "珠宝加工"
REP_TXT.skillLeath	= "制皮"
REP_TXT.skillTail	= "裁缝"
REP_TXT.skillAid	= "急救"
REP_TXT.skillArch	= "考古"
REP_TXT.skillCook	= "烹饪"
REP_TXT.skillFish	= "钓鱼"
-- Tooltip
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}

REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "打开窗口配置Reputations。"
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "如果不选中此框，派列表显示默认（暴雪）排序，分组逻辑和字母顺序排列。\r\n\r\n如果选中此复选框，派列表排序站在\r\n\r \n要查看| cFFFAA0A0无效|r派系，取消选中此框和列表的底部。"

REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "检查此按钮，看看你能杀的小怪来提高你的声誉。"
REP_TXT.elements.name.REP_ShowQuestButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowQuestButton	= "检查此按钮可看到任务可以做，以提高你的声誉。"
REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
REP_TXT.elements.tip.REP_ShowItemsButton	= "检查此按钮，看到手的项目，你可以提高你的声誉。"
REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
REP_TXT.elements.tip.REP_ShowInstancesButton	= "检查此按钮可看到运行的情况下，你可以提高你的声誉。"
REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
REP_TXT.elements.tip.REP_ShowGeneralButton	= "检查此按钮可看到一般信息，提高你的声誉。"

REP_TXT.elements.name.REP_ShowAllButton	= REP_TXT.showAll
REP_TXT.elements.tip.REP_ShowAllButton	= "按下此按钮可检查所有四个复选框的左侧。\r\n这将显示小怪，任务，物品和实例，让你的声誉目前选定的派系。"
REP_TXT.elements.name.REP_ShowNoneButton	= REP_TXT.showNone
REP_TXT.elements.tip.REP_ShowNoneButton	= "按下此按钮，取消所有的四个复选框的左侧。\r\n这会告诉你的方法没有赢得口碑，目前选择的派系。"

REP_TXT.elements.name.REP_ExpandButton	= REP_TXT.expand
REP_TXT.elements.tip.REP_ExpandButton	= "按下此按钮可展开列表中的所有条目。这将显示您在任何项目的收集任务所需的材料手。"
REP_TXT.elements.name.REP_CollapseButton	= REP_TXT.collapse
REP_TXT.elements.tip.REP_CollapseButton	= "按下此按钮折叠所有列表中的条目。这将隐藏在收集任务所需的材料手。"
REP_TXT.elements.name.REP_SupressNoneFactionButton	= REP_TXT.supressNoneFaction
REP_TXT.elements.tip.REP_SupressNoneFactionButton	= "按下此按钮可重新启用所有权利点击它可以排除这个派别的任务。"
REP_TXT.elements.name.REP_SupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
REP_TXT.elements.tip.REP_SupressNoneGlobalButton	= "按下此按钮可重新启用通过右键点击它可以排除所有派别​​的所有任务。"
REP_TXT.elements.name.REP_ClearSessionGainButton	= REP_TXT.clearSessionGain
REP_TXT.elements.tip.REP_ClearSessionGainButton	= "按下此按钮来清除重置计数器声誉，获得了本次会议。"

REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
REP_TXT.elements.tip.REP_EnableMissingBox	= "启用此设置，添加丢失的声誉点需要在未来的声誉站在每个派别的声誉框架背后的当前水平。"
REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
REP_TXT.elements.tip.REP_ExtendDetailsBox	= "启用此设置以显示扩展声誉细节帧 \r\n除了在原来的详细框架显示的信息，这会显示丢失的声誉需要到达下一个信誉等级，并以列表的方式来获得这种声誉由上市的任务，怪物，物品和实例产生选择派的声誉。"
REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
REP_TXT.elements.tip.REP_GainToChatBox	= "启用此设置来显示的声誉获得了所有派别​​，每当你获得的声誉。\r \n这不同于报告声誉增益的标准的方式，通常情况下，只有上市收益的主要派别。"
REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
REP_TXT.elements.tip.REP_NoGuildGainBox	= "启用此设置不打印消息聊天公会声望。"
REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "启用此设置来抑制标准声誉增益消息。\r \n这是有道理的，如果已经启用了详细的派系增益消息，所以你无法得到相同的上市标准和扩展版本。"
REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "启用此设置，你可以获得交付项目和已完成的任务，作为一个灰色条覆盖在正常的声誉酒吧的声誉帧显示的声誉。"
REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "启用此设置可自动切换的派系正在观看的最后一个派别就是你所获得的声誉。"
REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "启用此设置不切换观看派公会声望收益。"
REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
REP_TXT.elements.tip.REP_SilentSwitchBox	= "启用此设置静默信誉栏切换（没有消息聊天）。"
REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
REP_TXT.elements.name.REP_ChatFrameSlider	= "聊天帧"
REP_TXT.elements.tip.REP_ChatFrameSlider	= "选择聊天框架Reputations打印其消息。"
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
