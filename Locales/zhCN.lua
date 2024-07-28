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
REP_TXT.showPvPQuests	= "PvP 显示任务"
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
REP_TXT.gainToChat	= "用更详细的版本替换原来的派系增益消息"
REP_TXT.noGuildGain	= "不要写聊天公会声望"
REP_TXT.suppressOriginalGain	= "剿原派增益消息"
REP_TXT.showPreviewRep	= "显示声誉，可以传世的声誉帧"
REP_TXT.switchFactionBar	= "开关信誉栏对他们来说，只是派享有声誉"
REP_TXT.noGuildSwitch	= "不要切换公会声望信誉栏"
REP_TXT.silentSwitch	= "没有消息聊天的时候切换杆。"
REP_TXT.guildCap	= "显示在聊天的公会声望上限。"
REP_TXT.defaultChatFrame	= "使用默认的聊天框"
REP_TXT.chatFrame	= "使用聊天框 %d (%s)"
REP_TXT.usingDefaultChatFrame	= "现在使用默认聊天框"
REP_TXT.usingChatFrame	= "现在使用聊天框"
REP_TXT.EnableParagonBar = "在酒吧中展示典范声誉。"
-- various LUA
REP_TXT.options	= "选项"
REP_TXT.orderByStanding	= "按站立顺序"
REP_TXT.lookup	= "查找派别 "
REP_TXT.allFactions	= "列出所有派别"
REP_TXT.missing	= "(到下一个)"
REP_TXT.missing2	= "丢失的"
REP_TXT.heroic	= "英勇"
REP_TXT.normal	= "正常"
REP_TXT.switchBar	= "将声望栏更改为"
-- REP_ShowFactions
REP_TXT.faction	= "派"
REP_TXT.is	= "是"
REP_TXT.withStanding	= "站立时"
REP_TXT.needed	= "需"
REP_TXT.mob	= "[暴民]"
REP_TXT.limited	= "仅限于"
REP_TXT.limitedPl	= "仅限于"
REP_TXT.quest	= "[寻求]"
REP_TXT.instance	= "[实例]"
REP_TXT.items	= "[品目]"
REP_TXT.unknown	= "该玩家不知道"
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
REP_TXT.cdq	= "主城烹饪每日任务"
REP_TXT.coq	= "其他城市烹饪日常任务"
REP_TXT.fdq	= "主城钓鱼每日任务"
REP_TXT.foq	= "其他城市钓鱼日常任务"
REP_TXT.ndq	= "没有每日任务"
REP_TXT.deleted	= "过时的"
REP_TXT.Championing	= "冠军（战袍）"
REP_TXT.bpqfg	= "按任务派系增益百分比"
-- items Details
REP_TXT.cbadge	= "其他城市表彰徽章"
-- instance Details
REP_TXT.srfd	= "来自地下城的溢出代表"
REP_TXT.tbd	= "ToBe Done"
REP_TXT.nci	= "Normal Cataclysm instances"
REP_TXT.hci	= "Heroic Cataclysm instances"
REP_TXT.ncit	= "带有派系战袍的普通大灾变实例"
REP_TXT.hcit	= "带有派系战袍的英雄大灾变实例"
-- ToBeDone general
REP_TXT.tfr	= "Tiller Farming rep"
REP_TXT.nswts	= "Not sure when this starts"
REP_TXT.mnd	= "每日最大任务数"
REP_TXT.mnds	= "最大磨合次数为 "
-- ReputationDetails
REP_TXT.currentRep	= "目前的声誉"
REP_TXT.neededRep	= "需要声誉"
REP_TXT.missingRep	= "声誉缺失"
REP_TXT.repInBag	= "名誉囊中"
REP_TXT.repInBagBank	= "在袋子和银行中的声誉"
REP_TXT.repInQuest	= "任务中的声望"
REP_TXT.factionGained	= "获得本次会议"
REP_TXT.noInfo	= "没有关于该派系/声誉的信息。"
REP_TXT.toExalted	= "声望至高"
REP_TXT.toBestFriend = "对最好朋友的声誉"
-- to chat
REP_TXT.stats	= " (全部的: %s%d, 左边: %d)"
REP_TXT.statsNextStanding = " (全部的: %s%d, 左边 %s: %d)"
-- config changed
REP_TXT.configQuestion	= "启用了一些（新）设置。对于一个设置，此操作仅执行一次。建议您验证信誉选项。"
REP_TXT.showConfig	= "查看配置"
REP_TXT.later	= "之后"
-- UpdateList
REP_TXT.mobShort	= "[M]"
REP_TXT.questShort	= "[Q]"
REP_TXT.instanceShort	= "[D]"
REP_TXT.itemsShort	= "[I]"
REP_TXT.generalShort	= "[G]"
REP_TXT.mobHead	= "通过杀死这个暴民来获得声誉"
REP_TXT.questHead	= "通过执行此任务获得声望"
REP_TXT.instanceHead	= "通过运行此实例获得声誉"
REP_TXT.itemsHead	= "通过交出物品获得声望"
REP_TXT.generalHead	= "有关获得声誉的一般信息"
REP_TXT.mobTip	= "每次你杀死这个怪物，你都会获得声誉。经常这样做，将帮助您达到新的水平。"
REP_TXT.questTip	= "每次完成这个可重复或每日的任务时，您都会获得声誉。经常这样做，将帮助您达到新的水平。"
REP_TXT.instanceTip	= "每次运行此实例时，您都会获得声誉。经常这样做，将帮助您达到新的水平。"
REP_TXT.itemsName	= "物品上交"
REP_TXT.itemsTip	= "每次你交出列出的物品，你都会获得声誉。经常这样做，将帮助您达到新的水平。"
REP_TXT.generalTip	= "这是有关某个派系的声誉增益的信息，不一定与可重复的增益方法相关。"
REP_TXT.allOfTheAbove	= "上面列出的 %d 个任务摘要"
REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
REP_TXT.questSummaryTip	= "该条目显示了一个总结上面列出的所有任务。\r\n 假设所有列出的任务是日常任务，因为这会告诉你有多少天它会带你到达下一个信誉等级，如果你做所有的日常任务每天，这是非常有用的。"
REP_TXT.complete	= "完成"
REP_TXT.active	= "活跃"
REP_TXT.inBag	= "袋装"
REP_TXT.turnIns	= "上交："
REP_TXT.reputation	= "名声："
REP_TXT.reputationCap	= "声望上限："
REP_TXT.reputationCapCurrent	= "目前声誉："
REP_TXT.inBagBank	= "放在袋子里和银行里"
REP_TXT.questCompleted	= "任务完成"
REP_TXT.timesToDo	= "要做的时间："
REP_TXT.instance2	= "Instance:"
REP_TXT.mode	= "Mode:"
REP_TXT.timesToRun	= "运行时间："
REP_TXT.mob2	= "Mob:"
REP_TXT.location	= "地点："
REP_TXT.toDo	= "去做"
REP_TXT.quest2	= "寻求："
REP_TXT.itemsRequired	= "所需物品"
REP_TXT.general2	= "一般："
REP_TXT.maxStanding	= "产生声誉直到"
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
---------------------------
-- Reputation Standing
---------------------------
---- Initialize
REP_TXT.STAND_LV	= {}
REP_TXT.STAND_LV_TIER	= {}
REP_TXT.STAND_LV_TRUST = {}
REP_TXT.STAND_LV_RENOWN	= {}
REP_TXT.BFFLabels = {}
---- Normal standings
REP_TXT.STAND_LV[0]	= "未知"
REP_TXT.STAND_LV[1]	= "讨厌"
REP_TXT.STAND_LV[2]	= "敌对的"
REP_TXT.STAND_LV[3]	= "不友好"
REP_TXT.STAND_LV[4]	= "中性"
REP_TXT.STAND_LV[5]	= "友好"
REP_TXT.STAND_LV[6]	= "荣幸"
REP_TXT.STAND_LV[7]	= "崇敬"
REP_TXT.STAND_LV[8]	= "崇高的"
REP_TXT.STAND_LV[9] = "巅峰"
---- Tier standings
REP_TXT.STAND_LV_TIER[0]	= "未知"
REP_TXT.STAND_LV_TIER[1] = "等级1"
REP_TXT.STAND_LV_TIER[2] = "等级2"
REP_TXT.STAND_LV_TIER[3] = "等级3"
REP_TXT.STAND_LV_TIER[4] = "等级4"
REP_TXT.STAND_LV_TIER[5] = "等级5"
REP_TXT.STAND_LV_TIER[6] = "等级6"
---- Trust standings
REP_TXT.STAND_LV_TRUST[0] = "未知"
REP_TXT.STAND_LV_TRUST[1] = "防备"
REP_TXT.STAND_LV_TRUST[2] = "불안"
REP_TXT.STAND_LV_TRUST[3] = "犹豫"
REP_TXT.STAND_LV_TRUST[4] = "纠结"
REP_TXT.STAND_LV_TRUST[5] = "和善"
REP_TXT.STAND_LV_TRUST[6] = "欣赏"
---- Renown standings
REP_TXT.STAND_LV_RENOWN[0] = "未知"
REP_TXT.STAND_LV_RENOWN[1] = "名望 1"
REP_TXT.STAND_LV_RENOWN[2] = "名望 2"
REP_TXT.STAND_LV_RENOWN[3] = "名望 3"
REP_TXT.STAND_LV_RENOWN[4] = "名望 4"
REP_TXT.STAND_LV_RENOWN[5] = "名望 5"
REP_TXT.STAND_LV_RENOWN[6] = "名望 6"
REP_TXT.STAND_LV_RENOWN[7] = "名望 7"
REP_TXT.STAND_LV_RENOWN[8] = "名望 8"
REP_TXT.STAND_LV_RENOWN[9] = "名望 9"
REP_TXT.STAND_LV_RENOWN[10] = "名望 10"
REP_TXT.STAND_LV_RENOWN[11] = "名望 11"
REP_TXT.STAND_LV_RENOWN[12] = "名望 12"
REP_TXT.STAND_LV_RENOWN[13] = "名望 13"
REP_TXT.STAND_LV_RENOWN[14] = "名望 14"
REP_TXT.STAND_LV_RENOWN[15] = "名望 15"
REP_TXT.STAND_LV_RENOWN[16] = "名望 16"
REP_TXT.STAND_LV_RENOWN[17] = "名望 17"
REP_TXT.STAND_LV_RENOWN[18] = "名望 18"
REP_TXT.STAND_LV_RENOWN[19] = "名望 19"
REP_TXT.STAND_LV_RENOWN[20] = "名望 20"
REP_TXT.STAND_LV_RENOWN[21] = "名望 21"
REP_TXT.STAND_LV_RENOWN[22] = "名望 22"
REP_TXT.STAND_LV_RENOWN[23] = "名望 23"
REP_TXT.STAND_LV_RENOWN[24] = "名望 24"
REP_TXT.STAND_LV_RENOWN[25] = "名望 25"
---- BFF Labels
REP_TXT.BFFLabels[2135] = {} -- 雏龙
REP_TXT.BFFLabels[2135][1] = "时空新兵"
REP_TXT.BFFLabels[2135][2] = "时空跃迁者"
REP_TXT.BFFLabels[2135][3] = "时光之友"
REP_TXT.BFFLabels[2135][4] = "青铜盟友"
REP_TXT.BFFLabels[2135][5] = "纪元修复者"
REP_TXT.BFFLabels[2135][6] = "时光领主"

---------------------------
-- Tooltips
---------------------------
---- Initialize
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}
---- Names and tips
REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "打开窗口配置Reputations。"
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "如果不选中此框，派列表显示默认（暴雪）排序，分组逻辑和字母顺序排列。\r\n\r\n如果选中此复选框，派列表排序站在\r\n\r \n要查看| cFFFAA0A0无效|r派系，取消选中此框和列表的底部。"
REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "检查此按钮，看看你能杀的小怪来提高你的声誉。"
REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "检查此按钮可看到任务可以做，以提高你的声誉。"
REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "检查此按钮可看到任务可以做，以提高你的声誉。"
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
REP_TXT.elements.tip.REP_EnableParagonBarBox  = "启用此选项可在声誉栏中显示您当前的典范进度。"
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
---- Titles
REP_TXT.settings.buffTitle = "声誉爱好者"
REP_TXT.settings.buffSubTitle = "您可以切换这些声誉增益，以查看您可以从不同的活动中获得多少声誉。不叠加的增益效果在切换其对应增益效果时将被禁用。"
---- Buffs
REP_TXT.settings.harvestBountyRepBuff = "分享之魂 (感恩节)"
REP_TXT.settings.info.harvestBountyRepBuff = "所获得的声望提高10%。持续 1小时。"
REP_TXT.settings.wickermanRepBuff = "稻草人的祈祷 (万圣)"
REP_TXT.settings.info.wickermanRepBuff = "生命值和法力值回复速度提高25%，耐力提高25%。持续2 hrs。"
REP_TXT.settings.wickermanRepBuffUnburdened = "无忧 (万圣)"
REP_TXT.settings.info.wickermanRepBuffUnburdened = "你将你的烦恼投入了稻草人的火堆中。经验和声望获取速度提高10%。持续2 hrs。"
REP_TXT.settings.wickermanRepBuffGrimVisage = "恐怖面容 (万圣)"
REP_TXT.settings.info.wickermanRepBuffGrimVisage = "你将稻草人的灰烬涂在脸上。经验和声望获取速度提高10%。持续2 hrs"
REP_TXT.settings.MrPopularityRankOne = "声望阁下 (公会福利, 等级1)"
REP_TXT.settings.info.MrPopularityRankOne = "通过杀死怪物和完成任务获得的声望值提高5%。"
REP_TXT.settings.MrPopularityRankTwo = "声望阁下 (公会福利, 等级2)"
REP_TXT.settings.info.MrPopularityRankTwo = "通过杀死怪物和完成任务获得的声望值提高10%。"
REP_TXT.settings.DarkmoonFaireWeeRepBuff = "耶！ (暗月马戏团)"
REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "乘坐暗月旋转木马或过山车。经验值和声望值获取速度提高10%。"
REP_TXT.settings.DarkmoonFaireHatRep = "暗月大礼帽 (暗月马戏团)"
REP_TXT.settings.info.DarkmoonFaireHatRep = "经验值和声望值获取速度提高10%，持续1 hour。礼帽为一次性使用。"
end
