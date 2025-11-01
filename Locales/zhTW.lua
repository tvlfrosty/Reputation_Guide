------------------------------------
-- 正體中文 (Traditional Chinese) --
------------------------------------
if (GetLocale() =="zhTW") then
  -- Binding names
  BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
  BINDING_NAME_SHOWCONFIG	= "顯示設定選項"
  BINDING_NAME_SHOWDETAILS	= "顯示聲望細節"
  
  REP_TXT	= {}
  -- help
  REP_TXT.help	= "一個管理聲望的工具"
  REP_TXT.command	= "無效指令"
  REP_TXT.usage	= "使用方法"
  REP_TXT.helphelp	= "顯示幫助手冊"
  REP_TXT.helpabout	= "顯示作者訊息"
  REP_TXT.helpstatus	= "顯示設定狀態"
  -- about
  REP_TXT.by	= "作者"
  REP_TXT.version	= "版本"
  REP_TXT.date	= "日期"
  REP_TXT.web	= "網站"
  REP_TXT.slash	= "斜槓指令"
  -- status
  REP_TXT.status	= "狀態"
  REP_TXT.disabled	= "禁用"
  REP_TXT.enabled	= "啟用"
  REP_TXT.statMobs	= "顯示怪物 [M]"
  REP_TXT.statQuests	= "顯示任務 [Q]"
  REP_TXT.statInstances	= "顯示副本 [D]"
  REP_TXT.statItems	= "顯示物品 [I]"
  REP_TXT.statGeneral	= "顯示其他 [G]"
  REP_TXT.statMissing	= "顯示缺失聲望值"
  REP_TXT.statDetails	= "顯示擴展的詳細資訊"
  REP_TXT.statChat	= "詳細的聊天資訊"
  REP_TXT.statNoGuildChat	= "No chat for guild rep"
  REP_TXT.statSuppress	= "Suppress original chat message"
  REP_TXT.statPreview	= "Show preview rep in reputation frame"
  REP_TXT.statSwitch	= "Automatically switch faction of rep bar"
  REP_TXT.statNoGuildSwitch	= "No switching for guild rep"
  REP_TXT.statSilentSwitch	= "No message when switching bar"
  REP_TXT.statGuildCap	= "Show guild reputation cap in chat"
  -- XML UI elements
  REP_TXT.showQuests	= "任務"
  REP_TXT.showPvPQuests	= "PvP 任務"
  REP_TXT.showInstances	= "副本"
  REP_TXT.showMobs	= "怪物"
  REP_TXT.showItems	= "物品"
  REP_TXT.showGeneral	= "其他"
  REP_TXT.showAll	= "全部顯示"
  REP_TXT.showNone	= "不顯示"
  REP_TXT.expand	= "展開"
  REP_TXT.darkmoonFaireBuff = "暗月增益"
  REP_TXT.collapse	= "折疊"
  REP_TXT.supressNoneFaction	= "清空此陣營排除項目"
  REP_TXT.supressNoneGlobal	= "清空全部排除項目"
  REP_TXT.suppressHint	= "右鍵點擊列表中的項目，可以從列表中排除。"
  REP_TXT.clearSessionGain	= "Clear session gain counter"
  REP_TXT.moveToInactive = "移至閒置"
  REP_TXT.showFactionOnMainscreen = "Show faction as exp bar"
  -- options dialog
  REP_TXT.showMissing	= "在聲望列表顯示缺少的聲望"
  REP_TXT.extendDetails	= "顯示擴展的聲望細節"
  REP_TXT.gainToChat	= "獲得聲望時，在聊天框顯示更完整的資訊，取代暴雪預設的聲望訊息"
  REP_TXT.noGuildGain	= "隱藏公會聲望"
  REP_TXT.suppressOriginalGain	= "不顯示暴雪預設的聲望訊息"
  REP_TXT.showPreviewRep	= "顯示預估"
  REP_TXT.switchFactionBar	= "自動追蹤"
  REP_TXT.noGuildSwitch	= "排除公會聲望"
  REP_TXT.silentSwitch	= "靜默切換"
  REP_TXT.guildCap	= "Show guild reputation cap in chat"
  REP_TXT.defaultChatFrame	= "使用預設聊天框"
  REP_TXT.chatFrame	= "使用聊天框 %d (%s)"
  REP_TXT.usingDefaultChatFrame	= "使用預設聊天框"
  REP_TXT.usingChatFrame	= "使用聊天框"
  REP_TXT.EnableParagonBar = "顯示巔峰聲望進度條"
  -- various LUA
  REP_TXT.options	= "選項"
  REP_TXT.orderByStanding	= "聲望排序"
  REP_TXT.lookup	= "追蹤陣營："
  REP_TXT.allFactions	= "列出所有陣營"
  REP_TXT.missing	= "（到下一階段）"
  REP_TXT.missing2	= "缺少"
  REP_TXT.heroic	= "英雄"
  REP_TXT.normal	= "普通"
  REP_TXT.switchBar	= "切換追蹤聲望："
  -- REP_ShowFactions
  REP_TXT.faction	= "陣營"
  REP_TXT.is	= "is"
  REP_TXT.withStanding	= "with standing"
  REP_TXT.needed	= "需要"
  REP_TXT.mob	= "[怪物]"
  REP_TXT.limited	= "is limited to"
  REP_TXT.limitedPl	= "are limited to"
  REP_TXT.quest	= "[任務]"
  REP_TXT.instance	= "[副本]"
  REP_TXT.items	= "[物品]"
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
  -- Quest Details
  REP_TXT.cdq	= "主城烹飪每日任務"
  REP_TXT.coq	= "其他烹飪每日任務"
  REP_TXT.fdq	= "主城釣魚每日任務"
  REP_TXT.foq	= "其他釣魚每日任務"
  REP_TXT.ndq	= "沒有每日任務"
  REP_TXT.deleted	= "Outdated"
  REP_TXT.Championing	= "Championing (Tabard)"
  REP_TXT.bpqfg	= "By percent of quest faction gain"
  -- items Details
  REP_TXT.cbadge	= "Other city Commendation Badge"
  -- instance Details
  REP_TXT.srfd	= "Spillover rep from dungeons"
  REP_TXT.tbd	= "ToBe Done"
  REP_TXT.nci	= "普通 Cata 副本"
  REP_TXT.hci	= "英雄 Cata 副本"
  REP_TXT.ncit	= "有陣營戰袍的普通 Cata 副本"
  REP_TXT.hcit	= "有陣營戰袍的英雄 Cata 副本"
  -- ToBeDone general
  REP_TXT.tfr	= "Tiller Farming rep"
  REP_TXT.nswts	= "Not sure when this starts"
  REP_TXT.mnd	= "最大每日任務數"
  REP_TXT.mnds	= "The max number of dallies is "
  -- ReputationDetails
  REP_TXT.currentRep	= "目前聲望"
  REP_TXT.neededRep	= "需要聲望"
  REP_TXT.missingRep	= "缺少聲望"
  REP_TXT.repInBag	= "背包中的聲望"
  REP_TXT.repInBagBank	= "背包和銀行中的聲望"
  REP_TXT.repInQuest	= "任務聲望"
  REP_TXT.factionGained	= "Gained this session"
  REP_TXT.noInfo	= "沒有關於該陣營聲望的資訊。"
  REP_TXT.toExalted	= "到崇拜"
  REP_TXT.toBestFriend = "到最好的朋友"
  -- to chat
  REP_TXT.stats	= " （總計：%s%d，還差：%d）"
  REP_TXT.statsNextStanding = " （總計：%s%d，剩餘 %s：%d）"
  -- config changed
  REP_TXT.configQuestion	= "Reputation Guide 啟用了一些新設定，是否要查看選項？這個詢問是一次性的。"
  REP_TXT.showConfig	= "查看設定"
  REP_TXT.later	= "之後再說"
  -- UpdateList
  REP_TXT.mobShort	= "[M]"
  REP_TXT.questShort	= "[Q]"
  REP_TXT.instanceShort	= "[D]"
  REP_TXT.itemsShort	= "[I]"
  REP_TXT.generalShort	= "[G]"
  REP_TXT.mobHead	= "殺死怪物獲得聲望"
  REP_TXT.questHead	= "完成任務獲得聲望"
  REP_TXT.instanceHead	= "完成副本獲得聲望"
  REP_TXT.itemsHead	= "交付物品獲得聲望"
  REP_TXT.generalHead	= "有關獲得聲望的一般資訊"
  REP_TXT.mobTip	= "每當你殺死這個怪物，都會獲得聲望。"
  REP_TXT.questTip	= "每當你完成可重複任務或每日任務時，都會獲得聲望。"
  REP_TXT.instanceTip	= "每當你完成副本，都會獲得聲望。"
  REP_TXT.itemsName	= "交付物品"
  REP_TXT.itemsTip	= "向 NPC 交出列出的物品，你都會獲得聲望。"
  REP_TXT.generalTip	= "這是關於獲取某個陣營聲望的資訊，與重複獲取聲望的方法無關。"
  REP_TXT.allOfTheAbove	= "上面列出的 %d 個任務摘要"
  REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
  REP_TXT.questSummaryTip	= "此條目顯示了上述所有任務的摘要。\r\n假設列出的任務都是每日任務，將計算如果每天全部完成，需要多少天才能達到下一個聲望等級。"
  REP_TXT.complete	= "完成"
  REP_TXT.active	= "active"
  REP_TXT.inBag	= "背包"
  REP_TXT.turnIns	= "交付："
  REP_TXT.reputation	= "聲望："
  REP_TXT.reputationCap	= "聲望上限："
  REP_TXT.reputationCapCurrent	= "目前聲望："
  REP_TXT.inBagBank	= "背包和銀行"
  REP_TXT.questCompleted	= "任務完成"
  REP_TXT.timesToDo	= "Times to do:"
  REP_TXT.instance2	= "副本："
  REP_TXT.mode	= "Mode:"
  REP_TXT.timesToRun	= "Times to run:"
  REP_TXT.mob2	= "Mob:"
  REP_TXT.location	= "地點："
  REP_TXT.toDo	= "To do:"
  REP_TXT.quest2	= "任務："
  REP_TXT.itemsRequired	= "需要物品"
  REP_TXT.general2	= "General:"
  REP_TXT.maxStanding	= "產生聲望直到"
  REP_TXT.renown = "Renown"
  -- skills
  REP_TXT.skillHerb	= "草藥"
  REP_TXT.skillMine	= "採礦"
  REP_TXT.skillSkin	= "剝皮"
  REP_TXT.skillAlch	= "煉金"
  REP_TXT.skillBlack	= "鍛造"
  REP_TXT.skillEnch	= "附魔"
  REP_TXT.skillEngi	= "工程學"
  REP_TXT.skillIncrip	= "銘文學"
  REP_TXT.skillJewel	= "珠寶加工"
  REP_TXT.skillLeath	= "製皮"
  REP_TXT.skillTail	= "裁縫"
  REP_TXT.skillAid	= "急救"
  REP_TXT.skillArch	= "考古"
  REP_TXT.skillCook	= "烹飪"
  REP_TXT.skillFish	= "釣魚"
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
  REP_TXT.STAND_LV[0]	= "未知"
  REP_TXT.STAND_LV[1]	= "仇恨"
  REP_TXT.STAND_LV[2]	= "敵對"
  REP_TXT.STAND_LV[3]	= "不友好"
  REP_TXT.STAND_LV[4]	= "中立"
  REP_TXT.STAND_LV[5]	= "友好"
  REP_TXT.STAND_LV[6]	= "尊敬"
  REP_TXT.STAND_LV[7]	= "崇敬"
  REP_TXT.STAND_LV[8]	= "崇拜"
  REP_TXT.STAND_LV[9] = "巔峰"
  ---- Tier standings
  REP_TXT.STAND_LV_TIER[0]	= "未知"
  REP_TXT.STAND_LV_TIER[1] = "等級1"
  REP_TXT.STAND_LV_TIER[2] = "等級2"
  REP_TXT.STAND_LV_TIER[3] = "等級3"
  REP_TXT.STAND_LV_TIER[4] = "等級4"
  REP_TXT.STAND_LV_TIER[5] = "等級5"
  REP_TXT.STAND_LV_TIER[6] = "等級6"
  ---- Trust standings
  REP_TXT.STAND_LV_TRUST[0] = "未知"
  REP_TXT.STAND_LV_TRUST[1] = "猶豫"
  REP_TXT.STAND_LV_TRUST[2] = "懷疑"
  REP_TXT.STAND_LV_TRUST[3] = "不安"
  REP_TXT.STAND_LV_TRUST[4] = "籠統"
  REP_TXT.STAND_LV_TRUST[5] = "友善"
  REP_TXT.STAND_LV_TRUST[6] = "感謝"
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
  REP_TXT.BFFLabels[0] = {} -- Unknown
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
  REP_TXT.elements.tip.REP_OptionsButton	= "開啟 ReputationGuide 設定選項。"
  REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
  REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "停用此選項，聲望列表按照暴雪預設排序，依資料片和字母順序排列。\r\n\r\n啟用此選項，聲望列表按聲望等級排序\r\n\r\n要查看|cFFFAA0A0移至閒置|r的陣營聲望，停用此選項，然後查看列表底部。"
  REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
  REP_TXT.elements.tip.REP_ShowMobsButton	= "顯示擊殺可以獲得聲望的小怪。"
  REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
  REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "顯示可以提高聲望的任務。"
  REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
  REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "顯示可以提高聲望的 PVP 任務。"
  REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
  REP_TXT.elements.tip.REP_ShowItemsButton	= "顯示可以交付給 NPC 換取聲望的物品。"
  REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
  REP_TXT.elements.tip.REP_ShowInstancesButton	= "顯示可以提供聲望的副本。"
  REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
  REP_TXT.elements.tip.REP_ShowGeneralButton	= "顯示可以獲得聲望的其他方法，通常指除了任務、物品、副本、特定怪物以外的方式。"
  REP_TXT.elements.name.REP_DetailShowAllButton	= REP_TXT.showAll
  REP_TXT.elements.tip.REP_DetailShowAllButton	= "顯示從任務、物品、副本、特定小怪四種方式獲得聲望的方法。"
  REP_TXT.elements.name.REP_DetailShowNoneButton	= REP_TXT.showNone
  REP_TXT.elements.tip.REP_DetailShowNoneButton	= "隱藏從任務、物品、副本、特定小怪四種方式獲得聲望的方法。"
  REP_TXT.elements.name.REP_DetailExpandButton	= REP_TXT.expand
  REP_TXT.elements.tip.REP_DetailExpandButton	= "展開列表中的所有條目，顯示詳細資料，例如任務內容或需要的物品。"
  REP_TXT.elements.name.REP_DetailCollapseButton	= REP_TXT.collapse
  REP_TXT.elements.tip.REP_DetailCollapseButton	= "折疊列表中的所有條目，隱藏詳細資料。"
  REP_TXT.elements.name.REP_DetailSupressNoneFactionButton	= REP_TXT.supressNoneFaction
  REP_TXT.elements.tip.REP_DetailSupressNoneFactionButton	= "重新啟用此陣營聲望列表中，被右鍵點擊排除的項目。"
  REP_TXT.elements.name.REP_DetailSupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
  REP_TXT.elements.tip.REP_DetailSupressNoneGlobalButton	= "重新啟用所有陣營聲望列表中，被右鍵點擊排除的項目。"
  REP_TXT.elements.name.REP_DetailClearSessionGainButton	= REP_TXT.clearSessionGain
  REP_TXT.elements.tip.REP_DetailClearSessionGainButton	= "Press this button to reset the counter for reputation gained this session."
  REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
  REP_TXT.elements.tip.REP_EnableMissingBox	= "在聲望列表顯示聲望到達下一階段所需要的聲望值。"
  REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
  REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Enable this setting to display an extended reputation detail frame.\r\nIn addition the information shown in the original detail frame, this will display the missing reputation needed to reach the next reputation level and a list of ways to gain this reputation by listing quests, mobs, items and instances that yield reputation for the chosen faction."
  REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
  REP_TXT.elements.tip.REP_GainToChatBox	= "Enable this setting to display reputation gained for all factions whenever you gain reputation.\r\nThis differs from the standard way of reporting reputation gain, as normally, only the gain with the main faction is listed."
  REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
  REP_TXT.elements.tip.REP_NoGuildGainBox	= "不要在聊天框顯示獲得公會聲望的訊息。"
  REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
  REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "隱藏暴雪預設的聲望訊息。\r \n如果已經啟用了詳細的聲望訊息，勾選這個選項，可以避免聊天框輸出重覆的資訊。"
  REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
  REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "以灰色的進度條顯示即將獲得的聲望。\n\n根據你背包和銀行中可以兌換聲望的物品、已完成但尚未提交的任務，預估你可以獲得的聲望，並在聲望條上以灰色顯示。"
  REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
  REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "當你獲得聲望，自動將追蹤的聲望切換至該陣營。"
  REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
  REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "使自動切換追蹤聲望的功能排除公會聲望；當你獲得公會聲望時，不會自動切換至公會聲望。"
  REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
  REP_TXT.elements.tip.REP_SilentSwitchBox	= "切換追蹤的聲望時，不要在聊天框顯示切換通知。"
  REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
  REP_TXT.elements.name.REP_ChatFrameSlider	= "聊天框"
  REP_TXT.elements.tip.REP_ChatFrameSlider	= "選擇要顯示聲望資訊的聊天框"
  REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
  REP_TXT.elements.tip.REP_EnableParagonBarBox  = "以聲望進度條顯示巔峰聲望。"
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
  REP_TXT.settings.buffTitle = "聲望增益"
  REP_TXT.settings.buffSubTitle = "您可以切換這些聲望增益，以查看您可以從不同的活動中獲得多少聲望。不疊加的增益效果在切換其對應增益效果時將會停用。"
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
end