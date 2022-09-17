-- Korean(한국어)
--------------------	--------------------
if (GetLocale() =="koKR") then

-- Binding names
BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
BINDING_NAME_SHOWCONFIG	= "옵션 창에서보기"
BINDING_NAME_SHOWDETAILS	= "명성 세부 정보 창 표시"

REP_TXT	= {}
-- help
REP_TXT.help	= "당신의 평판을 관리하는 도구"
REP_TXT.command	= "명령을 구문 분석 할 수 없습니다"
REP_TXT.usage	= "용법"
REP_TXT.helphelp	= "이 도움말 텍스트를 표시"
REP_TXT.helpabout	= "저자 정보보기"
REP_TXT.helpstatus	= "구성 상태를 표시"
-- about
REP_TXT.by	= "로"
REP_TXT.version	= "버전"
REP_TXT.date	= "당일"
REP_TXT.web	= "웹 사이트"
REP_TXT.slash	= "명령을 슬래시"
REP_TXT_STAND_LV	= {}
REP_TXT_STAND_LV[0]	= "알 수없는"
REP_TXT_STAND_LV[1]	= "미워하는"
REP_TXT_STAND_LV[2]	= "적의"
REP_TXT_STAND_LV[3]	= "해로운"
REP_TXT_STAND_LV[4]	= "중립국"
REP_TXT_STAND_LV[5]	= "친한"
REP_TXT_STAND_LV[6]	= "영광"
REP_TXT_STAND_LV[7]	= "존경"
REP_TXT_STAND_LV[8]	= "고귀한"
REP_TXT_STAND_LV[9] = "불멸의 동맹"
REP_TXT_STAND_LV_TIER	= {}
REP_TXT_STAND_LV_TIER[0]	= "알 수없는"
REP_TXT_STAND_LV_TIER[1] = "1 단계"
REP_TXT_STAND_LV_TIER[2] = "2 단계"
REP_TXT_STAND_LV_TIER[3] = "3 단계"
REP_TXT_STAND_LV_TIER[4] = "4 단계"
REP_TXT_STAND_LV_TIER[5] = "5 단계"
REP_TXT_STAND_LV_TIER[6] = "6 단계"
REP_TXT_STAND_LV_TRUST	= {}
REP_TXT_STAND_LV_TRUST[0] = "알 수없는"
REP_TXT_STAND_LV_TRUST[1] = "의심"
REP_TXT_STAND_LV_TRUST[2] = "불안"
REP_TXT_STAND_LV_TRUST[3] = "불확신"
REP_TXT_STAND_LV_TRUST[4] = "애증"
REP_TXT_STAND_LV_TRUST[5] = "호감"
REP_TXT_STAND_LV_TRUST[6] = "경의"

-- status
REP_TXT.status	= "지위"
REP_TXT.disabled	= "비활성화"
REP_TXT.enabled	= "사용"
REP_TXT.statMobs	= "몬스터보기 [M]"
REP_TXT.statQuests	= "顯示任務 [Q]"
REP_TXT.statInstances	= "인스턴스보기 [D]"
REP_TXT.statItems	= "항목 표시 [I]"
REP_TXT.statGeneral	= "일반 표시 [G]"
REP_TXT.statMissing	= "누락 된 평판 표시"
REP_TXT.statDetails	= "확장 세부 프레임을 보여줍니다"
REP_TXT.statChat	= "자세한 채팅 메시지"
REP_TXT.statNoGuildChat	= "길드 평판에 대한 채팅"
REP_TXT.statSuppress	= "원래의 채팅 메시지를 표시"
REP_TXT.statPreview	= "평판 프레임에 미리 평판 표시"
REP_TXT.statSwitch	= "자동 평판 바의 파벌을 전환"
REP_TXT.statNoGuildSwitch	= "길드 평판에 대한 전환 없음"
REP_TXT.statSilentSwitch	= "줄을 전환 아무런 메시지도 없습니다"
REP_TXT.statGuildCap	= "채팅 길드 평판 모자보기"
-- XML UI elements
REP_TXT.showQuests	= "쇼 퀘스트"
REP_TXT.showInstances	= "인스턴스보기"
REP_TXT.showMobs	= "몬스터보기"
REP_TXT.showItems	= "항목 표시"
REP_TXT.showGeneral	= "일반 표시"
REP_TXT.showAll	= "모두 표시"
REP_TXT.showNone	= "없음을 보여"
REP_TXT.expand	= "확대"
REP_TXT.collapse	= "축소"
REP_TXT.supressNoneFaction	= "파벌에 대한 명확한 제외"
REP_TXT.supressNoneGlobal	= "모두 지우기 제외"
REP_TXT.suppressHint	= "요약에서 제외 할 수있는 퀘스트를 마우스 오른쪽 단추로 클릭"
REP_TXT.clearSessionGain	= "분명 세션 이득 카운터"
-- options dialog
REP_TXT.showMissing	= "평판 구조에서 누락 명성을 보여"
REP_TXT.extendDetails	= "확장 명성 세부 프레임을 보여줍니다"
REP_TXT.gainToChat	= "Replace original faction gain messages with a more detailed version"
REP_TXT.noGuildGain	= "길드 평판 채팅 쓰지 않는다"
REP_TXT.suppressOriginalGain	= "원래 진영 이득 메시지를 억제합니다"
REP_TXT.showPreviewRep	= "평판 프레임에서 손으로 할 수있는 평판 표시"
REP_TXT.switchFactionBar	= "에 대한 파벌로 전환 명성 줄은 명성을 얻고"
REP_TXT.noGuildSwitch	= "길드 평판 평판 표시 줄을 변경하지 마십시오"
REP_TXT.silentSwitch	= "줄을 전환 할 때 채팅하는 메시지가 없습니다."
REP_TXT.guildCap	= "채팅 길드 평판 캡을 보여줍니다."
REP_TXT.defaultChatFrame	= "기본적으로 채팅 프레임을 사용하여"
REP_TXT.chatFrame	= "채팅 프레임 %d 개 (%s) 을 (를) 사용"
REP_TXT.usingDefaultChatFrame	= "Now using default chat frame"
REP_TXT.usingChatFrame	= "Now using chat frame"
REP_TXT.EnableParagonBar = "Display paragon reputation in bars."
-- various LUA
REP_TXT.options	= "Options"
REP_TXT.orderByStanding	= "Order by Standing"
REP_TXT.lookup	= "Looking up faction "
REP_TXT.allFactions	= "모든 파벌 목록"
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
REP_TXT.AU	= "모든 이름없는"
REP_TXT.AN	= "모든 이름"
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
REP_TXT.questSummaryTip	= "이 항목은 위에 나열된 모든 퀘스트의 요약을 보여줍니다.\r\n  이것은이 당신이 매일 모든 일일 퀘스트를 수행하면 다음 신뢰도 수준에 도달하는 당신을 데려 갈 것이다 얼마나 많은 일을 보여줍니다로 나열된 모든 퀘스트는 일일 퀘스트 있다는 가정에 유용합니다."
REP_TXT.complete	= "완전한"
REP_TXT.active	= "활동적인"
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
REP_TXT.skillHerb	= "약초 채집"
REP_TXT.skillMine	= "채광"
REP_TXT.skillSkin	= "무두질"
REP_TXT.skillAlch	= "연금술"
REP_TXT.skillBlack	= "대장장이"
REP_TXT.skillEnch	= "마법부여"
REP_TXT.skillEngi	= "기계공학"
REP_TXT.skillIncrip	= "비문"
REP_TXT.skillJewel	= "보석세공"
REP_TXT.skillLeath	= "가죽세공"
REP_TXT.skillTail	= "재봉술"
REP_TXT.skillAid	= "응급 치료"
REP_TXT.skillArch	= "고고학"
REP_TXT.skillCook	= "요리"
REP_TXT.skillFish	= "낚시"
-- Tooltip
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}

REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "Reputations를 구성하는 창을 엽니 다."
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "이 확인란을 선택하지 않으면 파벌 목록은 논리적 알파벳 순서로 그룹화 기본 블리자드 정렬로 표시됩니다. 이 상자를 선택하면, 파벌 목록 서에 의해 정렬됩니다. |cFFFAA0A0 비활성 r 파벌이 상자를 선택 취소하고 목록의 맨 아래로 이동을 볼 수 있습니다."

REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "당신의 평판을 개선하기 위해 죽일 수있는 몹을 보려면이 단추를 선택하십시오."
REP_TXT.elements.name.REP_ShowQuestButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowQuestButton	= "당신의 평판을 개선하기 위해 할 수있는 퀘스트를 보려면이 단추를 선택하십시오."
REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
REP_TXT.elements.tip.REP_ShowItemsButton	= "당신의 평판을 개선하기 위해 손 수있는 항목을 보려면이 단추를 선택하십시오."
REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
REP_TXT.elements.tip.REP_ShowInstancesButton	= "당신의 평판을 개선하기 위해 실행할 수있는 인스턴스를 참조하려면이 단추를 선택하십시오."
REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
REP_TXT.elements.tip.REP_ShowGeneralButton	= "명성 향상에 대한 일반적인 정보를 보려면이 단추를 선택하십시오."

REP_TXT.elements.name.REP_ShowAllButton	= REP_TXT.showAll
REP_TXT.elements.tip.REP_ShowAllButton	= "왼쪽에있는 체크 박스의 모든 네 가지를 확인하려면이 버튼을 누릅니다. \r\n이가 몹, 퀘스트, 아이템과 현재 선택된 파 당신에게 명성을주고 인스턴스를 표시합니다."
REP_TXT.elements.name.REP_ShowNoneButton	= REP_TXT.showNone
REP_TXT.elements.tip.REP_ShowNoneButton	= "왼쪽에있는 체크 박스의 모든 네 가지의 선택을 해제하려면이 버튼을 누릅니다. \r\n이 당신에게 현재 선택한 진영에 대한 평판을 얻을 수있는 방법을 전혀 표시되지 않습니다."

REP_TXT.elements.name.REP_ExpandButton	= REP_TXT.expand
REP_TXT.elements.tip.REP_ExpandButton	= "목록에있는 모든 항목을 확장하려면이 버튼을 누릅니다. 이것은 당신에게 어떤 아이템 수집 퀘스트의 손에 필요한 자료를 표시합니다."
REP_TXT.elements.name.REP_CollapseButton	= REP_TXT.collapse
REP_TXT.elements.tip.REP_CollapseButton	= "목록에서 모든 항목을 축소하려면이 버튼을 누릅니다. 이 퀘스트 수집을 손에 필요한 자료를 숨 깁니다."
REP_TXT.elements.name.REP_SupressNoneFactionButton	= REP_TXT.supressNoneFaction
REP_TXT.elements.tip.REP_SupressNoneFactionButton	= "당신이 그것에 맞 클릭하여 제외 한이 파벌의 모든 퀘스트를 다시 사용하려면이 버튼을 누릅니다."
REP_TXT.elements.name.REP_SupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
REP_TXT.elements.tip.REP_SupressNoneGlobalButton	= "당신이 그것을 마우스 오른쪽 버튼으로 클릭하여 제외 한 모든 세력에 대한 모든 퀘스트를 다시 사용하려면이 버튼을 누릅니다."
REP_TXT.elements.name.REP_ClearSessionGainButton	= REP_TXT.clearSessionGain
REP_TXT.elements.tip.REP_ClearSessionGainButton	= "재설정이 세션을 얻은 평판 카운터를 지우려면이 버튼을 누르십시오."

REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
REP_TXT.elements.tip.REP_EnableMissingBox	= "평판 프레임에있는 각 파벌의 현재 서 뒤에 다음 신뢰도 수준에 필요한 누락 명성 포인트를 추가하려면이 설정을 사용합니다."
REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
REP_TXT.elements.tip.REP_ExtendDetailsBox	= "또한 원래의 상세 프레임에 표시된 정보의 확장 명성 세부 구조. \r\n을 표시하려면이 설정을 사용하도록 설정이 다음 신뢰도 수준에 도달하는 데 필요한 누락 된 명성이 명성을 얻을 수있는 방법의 목록을 표시합니다 리스팅 퀘스트, 몬스터, 항목 및 선택한 진영에 대한 평판을 얻을 수있는 인스턴스가 있습니다."
REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
REP_TXT.elements.tip.REP_GainToChatBox	= "명성을 표시하려면이 설정을 사용하면 평판을 얻을 때마다 모든 세력에 대해 얻을 수 있습니다. \r \n이 일반적으로, 기본 파 만의 이득이 나열되는, 평판 이득을보고하는 표준 방법이 다릅니다."
REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
REP_TXT.elements.tip.REP_NoGuildGainBox	= "이 설정은 길드 평판 채팅 메시지를 인쇄 할 수 있습니다."
REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "표준 평판 이득 메시지를 표시하지 않으려면이 설정을 사용합니다. \r \n이 당신이 상세한 진영 이득 메시지를 활성화 한 경우, 그래서 당신은 표준 및 확장 버전에서 동일한 목록을하지 않는 것이 좋습니다."
REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "당신은 명성 프레임에 일반 평판 표시 줄에 겹쳐 회색 막대 등의 항목 및 완료 퀘스트에 건네 얻을 수있는 명성을 표시하려면이 설정을 사용합니다."
REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "자동으로 당신이 명성을 얻고있다 마지막 도당에 감시 당하고 파를 전환하려면이 설정을 사용합니다."
REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "길드 평판 이익에 대한 감시 세력을 전환 할 때이 설정을 사용합니다."
REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
REP_TXT.elements.tip.REP_SilentSwitchBox	= "(채팅하는 메시지없이) 자동 평판 줄을 전환하려면이 설정을 사용합니다."
REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
REP_TXT.elements.name.REP_ChatFrameSlider	= "프레임 채팅"
REP_TXT.elements.tip.REP_ChatFrameSlider	= "프레임 Reputations는 메시지를 출력하는 대화를 선택합니다."
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
