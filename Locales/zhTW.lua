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
REP_TXT.showPvPQuests	= "PvP 顯示任務"
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
REP_TXT.gainToChat	= "用更詳細的版本取代原來的派系增益訊息"
REP_TXT.noGuildGain	= "不要寫聊天公會聲望"
REP_TXT.suppressOriginalGain	= "剿原派增益消息"
REP_TXT.showPreviewRep	= "顯示聲譽，可以傳世的聲譽幀"
REP_TXT.switchFactionBar	= "開關信譽欄對他們來說，只是派享有聲譽"
REP_TXT.noGuildSwitch	= "不要切換公會聲望信譽欄"
REP_TXT.silentSwitch	= "沒有消息聊天的時候切換桿。"
REP_TXT.guildCap	= "顯示在聊天的公會聲望上限。"
REP_TXT.defaultChatFrame	= "使用默認的聊天框"
REP_TXT.chatFrame	= "使用聊天框 %d (%s)"
REP_TXT.usingDefaultChatFrame	= "現在使用預設聊天框"
REP_TXT.usingChatFrame	= "現在使用聊天框"
REP_TXT.EnableParagonBar = "在酒吧中展示典範聲譽。"
-- various LUA
REP_TXT.options	= "選項"
REP_TXT.orderByStanding	= "按站立順序"
REP_TXT.lookup	= "尋找派別"
REP_TXT.allFactions	= "列出所有派別"
REP_TXT.missing	= "(到下一個)"
REP_TXT.missing2	= "不見的"
REP_TXT.heroic	= "英勇"
REP_TXT.normal	= "標準"
REP_TXT.switchBar	= "將聲望欄更改為"
-- REP_ShowFactions
REP_TXT.faction	= "派"
REP_TXT.is	= "是"
REP_TXT.withStanding	= "站在"
REP_TXT.needed	= "需"
REP_TXT.mob	= "[暴民]"
REP_TXT.limited	= "僅限於"
REP_TXT.limitedPl	= "僅限於"
REP_TXT.quest	= "[尋求]"
REP_TXT.instance	= "[比方]"
REP_TXT.items	= "[專案]"
REP_TXT.unknown	= "該玩家不知道"
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
REP_TXT.cdq	= "主城烹飪每日任務"
REP_TXT.coq	= "其他城市烹飪日常任務"
REP_TXT.fdq	= "主城釣魚每日任務"
REP_TXT.foq	= "其他城市釣魚日常任務"
REP_TXT.ndq	= "沒有每日任務"
REP_TXT.deleted	= "老"
REP_TXT.Championing	= "冠軍（戰袍）"
REP_TXT.bpqfg	= "按任務派系增益百分比"
-- items Details
REP_TXT.cbadge	= "其他城市表彰徽章"
-- instance Details
REP_TXT.srfd	= "來自地下城的溢出代表"
REP_TXT.tbd	= "ToBe Done"
REP_TXT.nci	= "Normal Cataclysm instances"
REP_TXT.hci	= "Heroic Cataclysm instances"
REP_TXT.ncit	= "有派系戰袍的普通大災變實例"
REP_TXT.hcit	= "有派系戰袍的英雄大災變實例"
-- ToBeDone general
REP_TXT.tfr	= "Tiller Farming rep"
REP_TXT.nswts	= "Not sure when this starts"
REP_TXT.mnd	= "每日最大任務數"
REP_TXT.mnds	= "最大磨合次數為 "
-- ReputationDetails
REP_TXT.currentRep	= "目前的聲譽"
REP_TXT.neededRep	= "需要聲譽"
REP_TXT.missingRep	= "聲譽缺失"
REP_TXT.repInBag	= "名譽囊中"
REP_TXT.repInBagBank	= "在袋子和銀行中的聲譽"
REP_TXT.repInQuest	= "任務中的聲望"
REP_TXT.factionGained	= "獲得本次會議"
REP_TXT.noInfo	= "沒有關於該派系/聲譽的資訊。"
REP_TXT.toExalted	= "聲望至高"
REP_TXT.toBestFriend = "對最好朋友的聲譽"
-- to chat
REP_TXT.stats	= " （總計：%s%d，左：%d）"
REP_TXT.statsNextStanding = " （總計：%s%d，剩餘 %s：%d）"
-- config changed
REP_TXT.configQuestion	= "啟用了一些（新）設定。對於一個設置，此操作僅執行一次。建議您驗證信譽選項。"
REP_TXT.showConfig	= "查看配置"
REP_TXT.later	= "之後"
-- UpdateList
REP_TXT.mobShort	= "[M]"
REP_TXT.questShort	= "[Q]"
REP_TXT.instanceShort	= "[D]"
REP_TXT.itemsShort	= "[I]"
REP_TXT.generalShort	= "[G]"
REP_TXT.mobHead	= "透過殺死這個暴民來獲得聲譽"
REP_TXT.questHead	= "透過執行此任務獲得聲望"
REP_TXT.instanceHead	= "透過執行此實例獲得聲譽"
REP_TXT.itemsHead	= "透過交出物品獲得聲望"
REP_TXT.generalHead	= "有關獲得聲譽的一般信息"
REP_TXT.mobTip	= "每次你殺死這個怪物，你都會獲得聲譽。經常這樣做，將幫助您達到新的水平。"
REP_TXT.questTip	= "每次完成這個可重複或每日的任務時，您都會獲得聲譽。經常這樣做，將幫助您達到新的水平。"
REP_TXT.instanceTip	= "每次執行此實例時，您都會獲得聲譽。經常這樣做，將幫助您達到新的水平。"
REP_TXT.itemsName	= "物品上交"
REP_TXT.itemsTip	= "每次你交出列出的物品，你都會獲得聲譽。經常這樣做，將幫助您達到新的水平。"
REP_TXT.generalTip	= "這是有關某個派系的聲譽增益的信息，不一定與可重複的增益方法相關。"
REP_TXT.allOfTheAbove	= "上面列出的 %d 個任務摘要"
REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
REP_TXT.questSummaryTip	= "該條目顯示了一個總結上面列出的所有任務。\r\n 假設所有列出的任務是日常任務，因為這會告訴你有多少天它會帶你到達下一個信譽等級，如果你做所有的日常任務每天，這是非常有用的。"
REP_TXT.complete	= "完成"
REP_TXT.active	= "活躍"
REP_TXT.inBag	= "袋裝"
REP_TXT.turnIns	= "上交："
REP_TXT.reputation	= "名聲："
REP_TXT.reputationCap	= "聲望上限："
REP_TXT.reputationCapCurrent	= "目前聲譽："
REP_TXT.inBagBank	= "放在袋子裡和銀行里"
REP_TXT.questCompleted	= "任務完成"
REP_TXT.timesToDo	= "要做的時間："
REP_TXT.instance2	= "Instance:"
REP_TXT.mode	= "Mode:"
REP_TXT.timesToRun	= "運行時間："
REP_TXT.mob2	= "Mob:"
REP_TXT.location	= "地點："
REP_TXT.toDo	= "去做："
REP_TXT.quest2	= "尋求："
REP_TXT.itemsRequired	= "所需物品"
REP_TXT.general2	= "大都："
REP_TXT.maxStanding	= "產生聲譽直到"
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
---------------------------
-- Reputation Standing
---------------------------
---- Initialize
REP_TXT.STAND_LV	= {}
REP_TXT.STAND_LV_TIER	= {}
REP_TXT.STAND_LV_TRUST = {}
REP_TXT.STAND_LV_RENOWN	= {}
---- Normal standings
REP_TXT.STAND_LV[0]	= "未知"
REP_TXT.STAND_LV[1]	= "討厭"
REP_TXT.STAND_LV[2]	= "敵對的"
REP_TXT.STAND_LV[3]	= "不友好"
REP_TXT.STAND_LV[4]	= "中性"
REP_TXT.STAND_LV[5]	= "友好"
REP_TXT.STAND_LV[6]	= "榮幸"
REP_TXT.STAND_LV[7]	= "崇敬"
REP_TXT.STAND_LV[8]	= "崇高的"
REP_TXT.STAND_LV[9] = "巅峰"
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
REP_TXT.STAND_LV_TRUST[1] = "防備"
REP_TXT.STAND_LV_TRUST[2] = "불안"
REP_TXT.STAND_LV_TRUST[3] = "猶豫"
REP_TXT.STAND_LV_TRUST[4] = "糾結"
REP_TXT.STAND_LV_TRUST[5] = "和善"
REP_TXT.STAND_LV_TRUST[6] = "欣賞"
---- Renown standings
REP_TXT.STAND_LV_RENOWN[0] = "未知"
REP_TXT.STAND_LV_RENOWN[1] = "名聲 1"
REP_TXT.STAND_LV_RENOWN[2] = "名聲 2"
REP_TXT.STAND_LV_RENOWN[3] = "名聲 3"
REP_TXT.STAND_LV_RENOWN[4] = "名聲 4"
REP_TXT.STAND_LV_RENOWN[5] = "名聲 5"
REP_TXT.STAND_LV_RENOWN[6] = "名聲 6"
REP_TXT.STAND_LV_RENOWN[7] = "名聲 7"
REP_TXT.STAND_LV_RENOWN[8] = "名聲 8"
REP_TXT.STAND_LV_RENOWN[9] = "名聲 9"
REP_TXT.STAND_LV_RENOWN[10] = "名聲 10"
REP_TXT.STAND_LV_RENOWN[11] = "名聲 11"
REP_TXT.STAND_LV_RENOWN[12] = "名聲 12"
REP_TXT.STAND_LV_RENOWN[13] = "名聲 13"
REP_TXT.STAND_LV_RENOWN[14] = "名聲 14"
REP_TXT.STAND_LV_RENOWN[15] = "名聲 15"
REP_TXT.STAND_LV_RENOWN[16] = "名聲 16"
REP_TXT.STAND_LV_RENOWN[17] = "名聲 17"
REP_TXT.STAND_LV_RENOWN[18] = "名聲 18"
REP_TXT.STAND_LV_RENOWN[19] = "名聲 19"
REP_TXT.STAND_LV_RENOWN[20] = "名聲 20"
REP_TXT.STAND_LV_RENOWN[21] = "名聲 21"
REP_TXT.STAND_LV_RENOWN[22] = "名聲 22"
REP_TXT.STAND_LV_RENOWN[23] = "名聲 23"
REP_TXT.STAND_LV_RENOWN[24] = "名聲 24"
REP_TXT.STAND_LV_RENOWN[25] = "名聲 25"
---------------------------
-- Tooltips
---------------------------
---- Initialize
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}
---- Names and tips
REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "打開窗口配置Reputations。"
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "如果不選中此框，派列表顯示默認（暴雪）排序，分組邏輯和字母順序排列。\r\n\r\n如果選中此複選框，派列表排序站在\r\n\r\n要查看| cFFFAA0A0無效|r派系，取消選中此框和列表的底部。"
REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "檢查此按鈕，看你能殺小怪來提高你的聲譽。"
REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "檢查此按鈕可看到任務可以做，以提高你的聲譽。"
REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "檢查此按鈕可看到任務可以做，以提高你的聲譽。"
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
REP_TXT.elements.tip.REP_EnableParagonBarBox  = "啟用此選項可在聲譽欄中顯示您目前的典範進度。"
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
REP_TXT.settings.buffTitle = "聲譽愛好者"
REP_TXT.settings.buffSubTitle = "您可以切換這些聲譽增益，以查看您可以從不同的活動中獲得多少聲譽。不疊加的增益效果在切換其對應增益效果時將會停用。"
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
end
