-- Simplified Chinese (简体中文)
--------------------	--------------------
if (GetLocale() =="zhCN") then
  -- Binding names
  BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
  BINDING_NAME_SHOWCONFIG	= "显示设置选项"
  BINDING_NAME_SHOWDETAILS	= "显示声望细节"
  
  REP_TXT	= {}
  -- help
  REP_TXT.help	= "一个管理声望的工具"
  REP_TXT.command	= "无效指令"
  REP_TXT.usage	= "使用方法"
  REP_TXT.helphelp	= "显示帮助手册"
  REP_TXT.helpabout	= "显示作者信息"
  REP_TXT.helpstatus	= "显示设置状态"
  -- about
  REP_TXT.by	= "by"
  REP_TXT.version	= "版本"
  REP_TXT.date	= "日期"
  REP_TXT.web	= "网站"
  REP_TXT.slash	= "斜扛命令"
  -- status
  REP_TXT.status	= "状态"
  REP_TXT.disabled	= "禁用"
  REP_TXT.enabled	= "启用"
  REP_TXT.statMobs	= "显示怪物 [M]"
  REP_TXT.statQuests	= "显示任务 [Q]"
  REP_TXT.statInstances	= "显示副本 [D]"
  REP_TXT.statItems	= "显示物品 [I]"
  REP_TXT.statGeneral	= "显示一般 [G]"
  REP_TXT.statMissing	= "显示缺失声望值"
  REP_TXT.statDetails	= "显示详细信息"
  REP_TXT.statChat	= "详细的聊天信息"
  REP_TXT.statNoGuildChat	= "No chat for guild rep"
  REP_TXT.statSuppress	= "Suppress original chat message"
  REP_TXT.statPreview	= "Show preview rep in reputation frame"
  REP_TXT.statSwitch	= "Automatically switch faction of rep bar"
  REP_TXT.statNoGuildSwitch	= "No switching for guild rep"
  REP_TXT.statSilentSwitch	= "No message when switching bar"
  REP_TXT.statGuildCap	= "Show guild reputation cap in chat"
  -- XML UI elements
  REP_TXT.showQuests	= "任务"
  REP_TXT.showPvPQuests	= "PvP 任务"
  REP_TXT.showInstances	= "副本"
  REP_TXT.showMobs	= "怪物"
  REP_TXT.showItems	= "物品"
  REP_TXT.showGeneral	= "其他"
  REP_TXT.showAll	= "全部显示"
  REP_TXT.showNone	= "不显示"
  REP_TXT.expand	= "展开"
  REP_TXT.darkmoonFaireBuff = "暗月"
  REP_TXT.collapse	= "折叠"
  REP_TXT.supressNoneFaction	= "清空此阵营排除项目"
  REP_TXT.supressNoneGlobal	= "清空全部排除项目"
  REP_TXT.suppressHint	= "右键点击列表中的项目，可以从列表中排除。"
  REP_TXT.clearSessionGain	= "Clear session gain counter"
  REP_TXT.moveToInactive = "隐藏"
  REP_TXT.showFactionOnMainscreen = "显示为经验条"
  -- options dialog
  REP_TXT.showMissing	= "在声望列表显示缺少的声望"
  REP_TXT.extendDetails	= "显示扩展的声望细节"
  REP_TXT.gainToChat	= "获得声望时，在聊天框显示更完整的信息，取代暴雪默认的声望信息"
  REP_TXT.noGuildGain	= "隐藏公会声望"
  REP_TXT.suppressOriginalGain	= "不显示暴雪默认的声望信息"
  REP_TXT.showPreviewRep	= "显示预估"
  REP_TXT.switchFactionBar	= "自动追踪"
  REP_TXT.noGuildSwitch	= "排除公会声望"
  REP_TXT.silentSwitch	= "静默切换"
  REP_TXT.guildCap	= "Show guild reputation cap in chat"
  REP_TXT.defaultChatFrame	= "使用默认聊天框"
  REP_TXT.chatFrame	= "使用聊天框 %d (%s)"
  REP_TXT.usingDefaultChatFrame	= "使用默认聊天框"
  REP_TXT.usingChatFrame	= "使用聊天框"
  REP_TXT.EnableParagonBar = "显示巅峰声望进度条"
  -- various LUA
  REP_TXT.options	= "选项"
  REP_TXT.orderByStanding	= "声望排序"
  REP_TXT.lookup	= "追踪阵营："
  REP_TXT.allFactions	= "列出所有阵营"
  REP_TXT.missing	= "（到下一阶段）"
  REP_TXT.missing2	= "缺少"
  REP_TXT.heroic	= "英雄"
  REP_TXT.normal	= "普通"
  REP_TXT.switchBar	= "切换追踪声望："
  -- REP_ShowFactions
  REP_TXT.faction	= "阵营"
  REP_TXT.is	= "is"
  REP_TXT.withStanding	= "with standing"
  REP_TXT.needed	= "需要"
  REP_TXT.mob	= "[怪物]"
  REP_TXT.limited	= "is limited to"
  REP_TXT.limitedPl	= "are limited to"
  REP_TXT.quest	= "[任务]"
  REP_TXT.instance	= "[副本]"
  REP_TXT.items	= "[物品]"
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
  -- Quest Details
  REP_TXT.cdq	= "主城烹饪每日任务"
  REP_TXT.coq	= "其他烹饪每日任务"
  REP_TXT.fdq	= "主城钓鱼每日任务"
  REP_TXT.foq	= "其他钓鱼每日任务"
  REP_TXT.ndq	= "没有每日任务"
  REP_TXT.deleted	= "Outdated"
  REP_TXT.Championing	= "Championing (Tabard)"
  REP_TXT.bpqfg	= "By percent of quest faction gain"
  -- items Details
  REP_TXT.cbadge	= "Other city Commendation Badge"
  -- instance Details
  REP_TXT.srfd	= "Spillover rep from dungeons"
  REP_TXT.tbd	= "ToBe Done"
  REP_TXT.nci	= "普通大灾变副本"
  REP_TXT.hci	= "英雄大灾变副本"
  REP_TXT.ncit	= "有阵营战袍的普通大灾变副本"
  REP_TXT.hcit	= "有阵营战袍的英雄大灾变副本"
  -- ToBeDone general
  REP_TXT.tfr	= "Tiller Farming rep"
  REP_TXT.nswts	= "Not sure when this starts"
  REP_TXT.mnd	= "最大每日任务数"
  REP_TXT.mnds	= "The max number of dallies is "
  -- ReputationDetails
  REP_TXT.currentRep	= "目前声望"
  REP_TXT.neededRep	= "需要声望"
  REP_TXT.missingRep	= "缺少声望"
  REP_TXT.repInBag	= "背包中的声望"
  REP_TXT.repInBagBank	= "背包和银行中的声望"
  REP_TXT.repInQuest	= "任务声望"
  REP_TXT.factionGained	= "Gained this session"
  REP_TXT.noInfo	= "没有关于该阵营声望的信息。"
  REP_TXT.toExalted	= "到崇拜"
  REP_TXT.toBestFriend = "到挚友"
  -- to chat
  REP_TXT.stats	= " （总计：%s%d，还少：%d）"
  REP_TXT.statsNextStanding = " （总计：%s%d，剩馀 %s：%d）"
  -- config changed
  REP_TXT.configQuestion	= "Reputation Guide 启用了一些新设置，是否要查看选项？这个询问是一次性的。"
  REP_TXT.showConfig	= "查看设置"
  REP_TXT.later	= "之后再说"
  -- UpdateList
  REP_TXT.mobShort	= "[M]"
  REP_TXT.questShort	= "[Q]"
  REP_TXT.instanceShort	= "[D]"
  REP_TXT.itemsShort	= "[I]"
  REP_TXT.generalShort	= "[G]"
  REP_TXT.mobHead	= "杀死怪物获得声望"
  REP_TXT.questHead	= "完成任务获得声望"
  REP_TXT.instanceHead	= "完成副本获得声望"
  REP_TXT.itemsHead	= "交付物品获得声望"
  REP_TXT.generalHead	= "有关获得声望的一般信息"
  REP_TXT.mobTip	= "每当你杀死这个怪物，都会获得声望。"
  REP_TXT.questTip	= "每当你完成可重复任务或日常任务时，都会获得声望。"
  REP_TXT.instanceTip	= "每当你完成副本，都会获得声望。"
  REP_TXT.itemsName	= "交付物品"
  REP_TXT.itemsTip	= "向 NPC 交出列出的物品，你都会获得声望。"
  REP_TXT.generalTip	= "这是关于获取某个阵营声望的信息，与重复获取声望的方法无关。"
  REP_TXT.allOfTheAbove	= "上面列出的 %d 个任务摘要"
  REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
  REP_TXT.questSummaryTip	= "此条目显示了上述所有任务的摘要。\r\n假设列出的任务都是日常任务，将计算如果每天完成所有日常任务，需要多少天才能达到下一个声望等级。"
  REP_TXT.complete	= "完成"
  REP_TXT.active	= "active"
  REP_TXT.inBag	= "背包"
  REP_TXT.turnIns	= "交付："
  REP_TXT.reputation	= "声望："
  REP_TXT.reputationCap	= "声望上限："
  REP_TXT.reputationCapCurrent	= "目前声望："
  REP_TXT.inBagBank	= "背包和银行"
  REP_TXT.questCompleted	= "任务完成"
  REP_TXT.timesToDo	= "Times to do:"
  REP_TXT.instance2	= "副本："
  REP_TXT.mode	= "Mode:"
  REP_TXT.timesToRun	= "Times to run:"
  REP_TXT.mob2	= "Mob:"
  REP_TXT.location	= "地点："
  REP_TXT.toDo	= "To do:"
  REP_TXT.quest2	= "任务："
  REP_TXT.itemsRequired	= "需要物品"
  REP_TXT.general2	= "General:"
  REP_TXT.maxStanding	= "产生声望直到"
  -- skills
  REP_TXT.skillHerb	= "草药"
  REP_TXT.skillMine	= "采矿"
  REP_TXT.skillSkin	= "剥皮"
  REP_TXT.skillAlch	= "炼金"
  REP_TXT.skillBlack	= "锻造"
  REP_TXT.skillEnch	= "附魔"
  REP_TXT.skillEngi	= "工程学"
  REP_TXT.skillIncrip	= "铭文"
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
  REP_TXT.STAND_LV[1]	= "仇恨"
  REP_TXT.STAND_LV[2]	= "敌对"
  REP_TXT.STAND_LV[3]	= "不友好"
  REP_TXT.STAND_LV[4]	= "中立"
  REP_TXT.STAND_LV[5]	= "友好"
  REP_TXT.STAND_LV[6]	= "尊敬"
  REP_TXT.STAND_LV[7]	= "崇敬"
  REP_TXT.STAND_LV[8]	= "崇拜"
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
  REP_TXT.STAND_LV_TRUST[1] = "犹豫"
  REP_TXT.STAND_LV_TRUST[2] = "猜忌"
  REP_TXT.STAND_LV_TRUST[3] = "防备"
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
  REP_TXT.elements.tip.REP_OptionsButton	= "开启 ReputationGuide 设置选项。"
  REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
  REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "停用此选项，声望列表按照暴雪默认排序，依资料片和字母顺序排列。\r\n\r\n启用此选项，声望列表按声望等级排序\r\n\r\n要查看|cFFFAA0A0移至閒置|r的阵营声望，停用此选项，然后查看列表底部。"
  REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
  REP_TXT.elements.tip.REP_ShowMobsButton	= "显示击杀可以获得声望的小怪。"
  REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
  REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "显示可以提高声望的任务。"
  REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
  REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "显示可以提高声望的 PVP 任务。"
  REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
  REP_TXT.elements.tip.REP_ShowItemsButton	= "显示可以交付给 NPC 换取声望的物品。"
  REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
  REP_TXT.elements.tip.REP_ShowInstancesButton	= "显示可以提供声望的副本。"
  REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
  REP_TXT.elements.tip.REP_ShowGeneralButton	= "显示可以获得声望的其他方法，通常指除了任务、物品、副本、特定怪物以外的方式。"
  REP_TXT.elements.name.REP_ShowAllButton	= REP_TXT.showAll
  REP_TXT.elements.tip.REP_ShowAllButton	= "显示从任务、物品、副本、特定小怪四种方式获得声望的方法。"
  REP_TXT.elements.name.REP_ShowNoneButton	= REP_TXT.showNone
  REP_TXT.elements.tip.REP_ShowNoneButton	= "隐藏从任务、物品、副本、特定小怪四种方式获得声望的方法。"
  REP_TXT.elements.name.REP_ExpandButton	= REP_TXT.expand
  REP_TXT.elements.tip.REP_ExpandButton	= "展开列表中的所有条目，显示详细资料，例如任务内容或需要的物品。"
  REP_TXT.elements.name.REP_CollapseButton	= REP_TXT.collapse
  REP_TXT.elements.tip.REP_CollapseButton	= "折叠列表中的所有条目，隐藏详细资料。"
  REP_TXT.elements.name.REP_SupressNoneFactionButton	= REP_TXT.supressNoneFaction
  REP_TXT.elements.tip.REP_SupressNoneFactionButton	= "重新启用此阵营声望列表中，被右键点击排除的项目。"
  REP_TXT.elements.name.REP_SupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
  REP_TXT.elements.tip.REP_SupressNoneGlobalButton	= "重新启用所有阵营声望列表中，被右键点击排除的项目。"
  REP_TXT.elements.name.REP_ClearSessionGainButton	= REP_TXT.clearSessionGain
  REP_TXT.elements.tip.REP_ClearSessionGainButton	= "Press this button to reset the counter for reputation gained this session."
  REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
  REP_TXT.elements.tip.REP_EnableMissingBox	= "在声望列表显示声望到达下一阶段所需要的声望值。"
  REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
  REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Enable this setting to display an extended reputation detail frame.\r\nIn addition the information shown in the original detail frame, this will display the missing reputation needed to reach the next reputation level and a list of ways to gain this reputation by listing quests, mobs, items and instances that yield reputation for the chosen faction."
  REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
  REP_TXT.elements.tip.REP_GainToChatBox	= "Enable this setting to display reputation gained for all factions whenever you gain reputation.\r\nThis differs from the standard way of reporting reputation gain, as normally, only the gain with the main faction is listed."
  REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
  REP_TXT.elements.tip.REP_NoGuildGainBox	= "不要在聊天框显示获得公会声望的信息。"
  REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
  REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "隐藏暴雪默认的声望信息。\r \n如果已经启用了详细的声望信息，勾选这个选项，可以避免聊天框输出重复的信息。"
  REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
  REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "以灰色的进度条显示即将获得的声望。\n\n根据你背包和银行中可以兑换声望的物品、已完成但尚未提交的任务，预估你可以获得的声望，并在声望条上以灰色显示。"
  REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
  REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "当你获得声望，自动将追踪的声望切换至该阵营。"
  REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
  REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "使自动切换追踪声望的功能排除公会声望；当你获得公会声望时，不会自动切换至公会声望。"
  REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
  REP_TXT.elements.tip.REP_SilentSwitchBox	= "切换追踪的声望时，不要在聊天框显示切换通知。"
  REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
  REP_TXT.elements.name.REP_ChatFrameSlider	= "聊天框"
  REP_TXT.elements.tip.REP_ChatFrameSlider	= "选择要显示声望信息的聊天框"
  REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
  REP_TXT.elements.tip.REP_EnableParagonBarBox  = "以声望进度条显示巅峰声望。"
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
  REP_TXT.settings.buffTitle = "声望增益"
  REP_TXT.settings.buffSubTitle = "您可以切换这些声望增益，以查看您可以从不同的活动中获得多少声望。无法叠加的增益效果在切换其对应增益效果时将会停用。"
  ---- Buffs
  REP_TXT.settings.harvestBountyRepBuff = "分享之魂 (感恩节)"
  REP_TXT.settings.info.harvestBountyRepBuff = "所获得的声望提高10%。持续 2 小时。"
  REP_TXT.settings.wickermanRepBuff = "稻草人的祈祷 (万圣节)"
  REP_TXT.settings.info.wickermanRepBuff = "生命值和法力值回复速度提高25%，耐力提高25%。持续 2 小时。"
  REP_TXT.settings.wickermanRepBuffUnburdened = "无忧 (万圣节)"
  REP_TXT.settings.info.wickermanRepBuffUnburdened = "你将你的烦恼投入了稻草人的火堆中。经验和声望获取速度提高10%。持续 2 小时。"
  REP_TXT.settings.wickermanRepBuffGrimVisage = "恐怖面容 (万圣节)"
  REP_TXT.settings.info.wickermanRepBuffGrimVisage = "你将稻草人的灰烬涂在脸上。经验和声望获取速度提高10%。持续 2 小时"
  REP_TXT.settings.MrPopularityRankOne = "声望阁下 (公会福利, 等级1)"
  REP_TXT.settings.info.MrPopularityRankOne = "通过杀死怪物和完成任务获得的声望值提高5%。"
  REP_TXT.settings.MrPopularityRankTwo = "声望阁下 (公会福利, 等级2)"
  REP_TXT.settings.info.MrPopularityRankTwo = "通过杀死怪物和完成任务获得的声望值提高10%。"
  REP_TXT.settings.DarkmoonFaireWeeRepBuff = "耶！ (暗月马戏团)"
  REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "乘坐暗月旋转木马或过山车。经验值和声望值获取速度提高10%。"
  REP_TXT.settings.DarkmoonFaireHatRep = "暗月大礼帽 (暗月马戏团)"
  REP_TXT.settings.info.DarkmoonFaireHatRep = "经验值和声望值获取速度提高10%，持续 1 小时。礼帽为一次性使用。"
  end