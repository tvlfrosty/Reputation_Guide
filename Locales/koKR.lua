-----------------------
-- 한국어 (Korean) --
-----------------------
if (GetLocale() =="koKR") then
  -- Binding names
  BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
  BINDING_NAME_SHOWCONFIG	= "옵션 창에서 보기"
  BINDING_NAME_SHOWDETAILS	= "평판 세부 정보 창 보기"

  REP_TXT	= {}
  -- help
  REP_TXT.help	= "당신의 평판을 관리하는 도구"
  REP_TXT.command	= "알 수 없는 명령입니다"
  REP_TXT.usage	= "사용법"
  REP_TXT.helphelp	= "이 도움말 보기"
  REP_TXT.helpabout	= "만든이 정보 보기"
  REP_TXT.helpstatus	= "설정 상태를 보기"
  -- about
  REP_TXT.by	= "만든이"
  REP_TXT.version	= "버전"
  REP_TXT.date	= "날짜"
  REP_TXT.web	= "웹 사이트"
  REP_TXT.slash	= "명령어"
  -- status
  REP_TXT.status	= "상태"
  REP_TXT.disabled	= "비활성화"
  REP_TXT.enabled	= "활성화"
  REP_TXT.statMobs	= "몬스터 표시 [몹]"
  REP_TXT.statQuests	= "퀘스트 표시 [퀘]"
  REP_TXT.statInstances	= "인스턴스 표시 [인]"
  REP_TXT.statItems	= "아이템 표시 [템]"
  REP_TXT.statGeneral	= "일반 표시 [G]"
  REP_TXT.statMissing	= "누락된 평판 표시"
  REP_TXT.statDetails	= "확장 세부 프레임을 표시"
  REP_TXT.statChat	= "자세한 채팅 메시지"
  REP_TXT.statNoGuildChat	= "길드 평판에 대한 채팅"
  REP_TXT.statSuppress	= "원래의 채팅 메시지를 표시"
  REP_TXT.statPreview	= "평판 프레임에 미리 평판 표시"
  REP_TXT.statSwitch	= "평판 바에 표시될 진영 자동전환"
  REP_TXT.statNoGuildSwitch	= "길드 평판은 전환하지 않기"
  REP_TXT.statSilentSwitch	= "평판 바 전환할 때 메시지 표시하지 않기"
  REP_TXT.statGuildCap	= "길드 평판 획득 제한치(Cap) 표시"
  -- XML UI elements
  REP_TXT.showQuests	= "퀘스트 표시"
  REP_TXT.showPvPQuests	= "PvP 퀘스트 표시"
  REP_TXT.showInstances	= "인스턴스 표시"
  REP_TXT.showMobs	= "몬스터 표시"
  REP_TXT.showItems	= "아이템 표시"
  REP_TXT.showGeneral	= "일반 표시"
  REP_TXT.showAll	= "모두 표시"
  REP_TXT.showNone	= "모두 끄기"
  REP_TXT.expand	= "펼치기"
  REP_TXT.collapse	= "줄이기"
  REP_TXT.supressNoneFaction	= "이 진영 제외 초기화"
  REP_TXT.supressNoneGlobal	= "모든 진영 제외 초기화"
  REP_TXT.suppressHint	= "퀘스트를 우클릭하면 요약에서 제외할 수 있습니다."
  REP_TXT.clearSessionGain	= "이번 세션에 획득한 카운터 초기화"
  REP_TXT.moveToInactive = "Move to inactive"
  REP_TXT.showFactionOnMainscreen = "Show faction as exp bar"
  -- options dialog
  REP_TXT.showMissing	= "평판 탭에서 다음 평판까지 남은 수치 표시"
  REP_TXT.extendDetails	= "확장 명성 세부 프레임을 표시"
  REP_TXT.gainToChat	= "기존 평판획득 메세지를 더 자세한 메세지로 바꾸기"
  REP_TXT.noGuildGain	= "길드 평판 채팅메세지 쓰지 않기"
  REP_TXT.suppressOriginalGain	= "원래 평판 획득 메시지 억제합니다"
  REP_TXT.showPreviewRep	= "평판 프레임에 얻을 수 있는 평판 보기"
  REP_TXT.switchFactionBar	= "방금 획득한 평판 진영으로 바 자동 전환하기"
  REP_TXT.noGuildSwitch	= "평판 바를 길드 평판으로 변경하지 않기"
  REP_TXT.silentSwitch	= "평판 바 전환 할 때 채팅 메시지 표시하지 않기"
  REP_TXT.guildCap	= "채팅 길드 평판 캡을 보여주기"
  REP_TXT.defaultChatFrame	= "기본 채팅 프레임을 사용하기"
  REP_TXT.chatFrame	= "채팅 프레임 %d 개 (%s) 을(를) 사용"
  REP_TXT.usingDefaultChatFrame	= "이제 기본 채팅 프레임을 사용하기"
  REP_TXT.usingChatFrame	= "Now using chat frame"
  REP_TXT.EnableParagonBar = "불멸의 동맹 평판을 평판 바에 보기"
  -- various LUA
  REP_TXT.options	= "설정"
  REP_TXT.orderByStanding	= "평판 순 정렬하기"
  REP_TXT.lookup	= "Looking up faction "
  REP_TXT.allFactions	= "모든 진영 목록"
  REP_TXT.missing	= "(다음 평판까지)"
  REP_TXT.missing2	= "Missing"
  REP_TXT.heroic	= "영웅"
  REP_TXT.normal	= "일반"
  REP_TXT.switchBar	= "평판 바를 다음 진영으로 바꿉니다 :"
  -- REP_ShowFactions
  REP_TXT.faction	= "평판"
  REP_TXT.is	= "is"
  REP_TXT.withStanding	= "with standing"
  REP_TXT.needed	= "needed"
  REP_TXT.mob	= "[몹]"
  REP_TXT.limited	= "is limited to"
  REP_TXT.limitedPl	= "are limited to"
  REP_TXT.quest	= "[퀘스트]"
  REP_TXT.instance	= "[인던]"
  REP_TXT.items	= "[아이템]"
  REP_TXT.unknown	= "is not known to this player"
  REP_TXT.guildReputation	= "Guild reputation"
  -- mob Details
  REP_TXT.tmob	= "일반 몹"
  REP_TXT.oboss	= "다른 보스들"
  REP_TXT.aboss	= "모든 보스"
  REP_TXT.pboss	= "보스 당"
  REP_TXT.fclear	= "전부 완료"
  REP_TXT.AU	= "모든 이름없는"
  REP_TXT.AN	= "모든 이름"
  REP_TXT.BB	= "붉은해적단"
  REP_TXT.SSP	= "남쪽바다 해적단"
  REP_TXT.Wa	= "사막유랑단"
  REP_TXT.VCm	= "투자개발회사"
  -- Quest Details
  REP_TXT.cdq	= "주요 도시 요리 일퀘들"
  REP_TXT.coq	= "다른 도시 요리 일퀘들"
  REP_TXT.fdq	= "주요 도시 낚시 일퀘들"
  REP_TXT.foq	= "다른 도시 낚시 일퀘들"
  REP_TXT.ndq	= "no daily quests"
  REP_TXT.deleted	= "Outdated"
  REP_TXT.Championing	= "Championing (Tabard)"
  REP_TXT.bpqfg	= "By percent of quest faction gain"
  -- items Details
  REP_TXT.cbadge	= "Other city Commendation Badge"
  -- instance Details
  REP_TXT.srfd	= "Spillover rep from dungeons"
  REP_TXT.tbd	= "ToBe Done"
  REP_TXT.nci	= "대격변 일반 던전"
  REP_TXT.hci	= "대격변 영웅 던전"
  REP_TXT.ncit	= "세력 휘장이 포함된 일반 대격변 인스턴스"
  REP_TXT.hcit	= "세력 휘장이 포함된 영웅 대격변 인스턴스"
  -- ToBeDone general
  REP_TXT.tfr	= "Tiller Farming rep"
  REP_TXT.nswts	= "Not sure when this starts"
  REP_TXT.mnd	= "Max number of daily quests"
  REP_TXT.mnds	= "The max number of dallies is "
  -- ReputationDetails
  REP_TXT.currentRep	= "현재 평판"
  REP_TXT.neededRep	= "필요한 평판"
  REP_TXT.missingRep	= "부족한 평판"
  REP_TXT.repInBag	= "Reputation in bag"
  REP_TXT.repInBagBank	= "Reputation in bag & bank"
  REP_TXT.repInQuest	= "퀘스트로 얻는 평판"
  REP_TXT.factionGained	= "이번 세션에 얻은 평판"
  REP_TXT.noInfo	= "No information available for this faction/reputation."
  REP_TXT.toExalted	= "확고까지 필요한 평판"
  REP_TXT.toBestFriend = "Reputation to best friend"
  -- to chat
  REP_TXT.stats	= " (Total: %s%d, Left: %d)"
  REP_TXT.statsNextStanding = " (총 획득: %s%d, %s까지: %d)"
  -- config changed
  REP_TXT.configQuestion	= "Some (new) settings were enabled. This is only done once for a setting. It is recommended that you verify the Reputations options."
  REP_TXT.showConfig	= "View config"
  REP_TXT.later	= "Later"
  -- UpdateList
  REP_TXT.mobShort	= "[몹]"
  REP_TXT.questShort	= "[퀘]"
  REP_TXT.instanceShort	= "[인]"
  REP_TXT.itemsShort	= "[템]"
  REP_TXT.generalShort	= "[G]"
  REP_TXT.mobHead	= "몹을 잡아 얻게되는 평판"
  REP_TXT.questHead	= "퀘스트를 완료하여 얻게되는 평판"
  REP_TXT.instanceHead	= "인던을 완료하여 얻게되는 평판"
  REP_TXT.itemsHead	= "아이템을 반납으로 얻게되는 평판"
  REP_TXT.generalHead	= "General information about gaining reputation"
  REP_TXT.mobTip	= "매번 몹을 잡을 때마다 평판을 얻게 됩니다. 이 작업을 자주 수행하면 다음 단계에 도달하는 데 도움이 됩니다."
  REP_TXT.questTip	= "반복가능퀴스트나 일퀘를 반복 수행하면 평판을 얻게 됩니다. 이 작업을 자주 수행하면 다음 단계에 도달하는 데 도움이 됩니다."
  REP_TXT.instanceTip	= "인던을 완주하면, 이 평판을 얻게 됩니다. 이 작업을 자주 수행하면 다음 단계에 도달하는 데 도움이 됩니다."
  REP_TXT.itemsName	= "Item hand-in"
  REP_TXT.itemsTip	= "아이템을 반납해 평판을 획득합니다. 이 작업을 자주 수행하면 다음 단계에 도달하는 데 도움이 됩니다."
  REP_TXT.generalTip	= "This is information about reputation gain with a faction that does not necessarily relate to repeatable gain methods."
  REP_TXT.allOfTheAbove	= "위에 있는 %d 퀘스트를 모두 완료하면"
  REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
  REP_TXT.questSummaryTip	= "이 항목은 위에 나열된 모든 퀘스트의 요약을 보여줍니다.\r\n  이것은이 당신이 매일 모든 일일 퀘스트를 수행하면 다음 신뢰도 수준에 도달하는 당신을 데려 갈 것이다 얼마나 많은 일을 보여줍니다로 나열된 모든 퀘스트는 일일 퀘스트 있다는 가정에 유용합니다."
  REP_TXT.complete	= "완전한"
  REP_TXT.active	= "활동적인"
  REP_TXT.inBag	= "In bags"
  REP_TXT.turnIns	= "Turn-ins:"
  REP_TXT.reputation	= "평판:"
  REP_TXT.reputationCap	= "평판 상한선:"
  REP_TXT.reputationCapCurrent	= "현재 평판:"
  REP_TXT.inBagBank	= "In bags and bank"
  REP_TXT.questCompleted	= "퀘스트 완료할 시"
  REP_TXT.timesToDo	= "필요한 횟수:"
  REP_TXT.instance2	= "Instance:"
  REP_TXT.mode	= "Mode:"
  REP_TXT.timesToRun	= "필요한 횟수:"
  REP_TXT.mob2	= "몹:"
  REP_TXT.location	= "위치:"
  REP_TXT.toDo	= "To do:"
  REP_TXT.quest2	= "퀘스트:"
  REP_TXT.itemsRequired	= "필요한 아이템"
  REP_TXT.general2	= "General:"
  REP_TXT.maxStanding	= "어느 평판단계까지 가능한지"
  REP_TXT.renown = "Renown"
  -- skills
  REP_TXT.skillHerb	= "약초 채집"
  REP_TXT.skillMine	= "채광"
  REP_TXT.skillSkin	= "무두질"
  REP_TXT.skillAlch	= "연금술"
  REP_TXT.skillBlack	= "대장장이"
  REP_TXT.skillEnch	= "마법부여"
  REP_TXT.skillEngi	= "기계공학"
  REP_TXT.skillIncrip	= "주문각인"
  REP_TXT.skillJewel	= "보석세공"
  REP_TXT.skillLeath	= "가죽세공"
  REP_TXT.skillTail	= "재봉술"
  REP_TXT.skillAid	= "응급치료"
  REP_TXT.skillArch	= "고고학"
  REP_TXT.skillCook	= "요리"
  REP_TXT.skillFish	= "낚시"
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
  REP_TXT.STAND_LV[0]	= "알 수 없는"
  REP_TXT.STAND_LV[1]	= "매우 적대적"
  REP_TXT.STAND_LV[2]	= "적대적"
  REP_TXT.STAND_LV[3]	= "약간 적대적"
  REP_TXT.STAND_LV[4]	= "중립"
  REP_TXT.STAND_LV[5]	= "약간 우호적"
  REP_TXT.STAND_LV[6]	= "우호적"
  REP_TXT.STAND_LV[7]	= "매우 우호적"
  REP_TXT.STAND_LV[8]	= "확고한"
  REP_TXT.STAND_LV[9] = "불멸의 동맹"
  ---- Tier standings
  REP_TXT.STAND_LV_TIER[0]	= "알 수 없는"
  REP_TXT.STAND_LV_TIER[1] = "1 단계"
  REP_TXT.STAND_LV_TIER[2] = "2 단계"
  REP_TXT.STAND_LV_TIER[3] = "3 단계"
  REP_TXT.STAND_LV_TIER[4] = "4 단계"
  REP_TXT.STAND_LV_TIER[5] = "5 단계"
  REP_TXT.STAND_LV_TIER[6] = "6 단계"
  ---- Trust standings
  REP_TXT.STAND_LV_TRUST[0] = "알 수 없는"
  REP_TXT.STAND_LV_TRUST[1] = "의심"
  REP_TXT.STAND_LV_TRUST[2] = "불안"
  REP_TXT.STAND_LV_TRUST[3] = "불확신"
  REP_TXT.STAND_LV_TRUST[4] = "애증"
  REP_TXT.STAND_LV_TRUST[5] = "호감"
  REP_TXT.STAND_LV_TRUST[6] = "경의"
  ---- Renown standings
  REP_TXT.STAND_LV_RENOWN[0] = "알 수 없는"
  REP_TXT.STAND_LV_RENOWN[1] = "영예 1"
  REP_TXT.STAND_LV_RENOWN[2] = "영예 2"
  REP_TXT.STAND_LV_RENOWN[3] = "영예 3"
  REP_TXT.STAND_LV_RENOWN[4] = "영예 4"
  REP_TXT.STAND_LV_RENOWN[5] = "영예 5"
  REP_TXT.STAND_LV_RENOWN[6] = "영예 6"
  REP_TXT.STAND_LV_RENOWN[7] = "영예 7"
  REP_TXT.STAND_LV_RENOWN[8] = "영예 8"
  REP_TXT.STAND_LV_RENOWN[9] = "영예 9"
  REP_TXT.STAND_LV_RENOWN[10] = "영예 10"
  REP_TXT.STAND_LV_RENOWN[11] = "영예 11"
  REP_TXT.STAND_LV_RENOWN[12] = "영예 12"
  REP_TXT.STAND_LV_RENOWN[13] = "영예 13"
  REP_TXT.STAND_LV_RENOWN[14] = "영예 14"
  REP_TXT.STAND_LV_RENOWN[15] = "영예 15"
  REP_TXT.STAND_LV_RENOWN[16] = "영예 16"
  REP_TXT.STAND_LV_RENOWN[17] = "영예 17"
  REP_TXT.STAND_LV_RENOWN[18] = "영예 18"
  REP_TXT.STAND_LV_RENOWN[19] = "영예 19"
  REP_TXT.STAND_LV_RENOWN[20] = "영예 20"
  REP_TXT.STAND_LV_RENOWN[21] = "영예 21"
  REP_TXT.STAND_LV_RENOWN[22] = "영예 22"
  REP_TXT.STAND_LV_RENOWN[23] = "영예 23"
  REP_TXT.STAND_LV_RENOWN[24] = "영예 24"
  REP_TXT.STAND_LV_RENOWN[25] = "영예 25"
  ---- Rank standings
  REP_TXT.STAND_LV_MAX_RANK = "최고 계급"
  REP_TXT.STAND_LV_RANK[0] = "알 수 없는"
  REP_TXT.STAND_LV_RANK[1] = "1계급"
  REP_TXT.STAND_LV_RANK[2] = "2계급"
  REP_TXT.STAND_LV_RANK[3] = "3계급"
  REP_TXT.STAND_LV_RANK[4] = "4계급"
  REP_TXT.STAND_LV_RANK[5] = "5계급"
  REP_TXT.STAND_LV_RANK[6] = "6계급"
  REP_TXT.STAND_LV_RANK[7] = "7계급"
  REP_TXT.STAND_LV_RANK[8] = "8계급"
  REP_TXT.STAND_LV_RANK[9] = "9계급"
  REP_TXT.STAND_LV_RANK[10] = "10계급"
  REP_TXT.STAND_LV_RANK[11] = "11계급"
  REP_TXT.STAND_LV_RANK[12] = "12계급"
  REP_TXT.STAND_LV_RANK[13] = "13계급"
  REP_TXT.STAND_LV_RANK[14] = "14계급"
  REP_TXT.STAND_LV_RANK[15] = "15계급"
  REP_TXT.STAND_LV_RANK[16] = "16계급"
  REP_TXT.STAND_LV_RANK[17] = "17계급"
  REP_TXT.STAND_LV_RANK[18] = "18계급"
  REP_TXT.STAND_LV_RANK[19] = "19계급"
  REP_TXT.STAND_LV_RANK[20] = "20계급"
  REP_TXT.STAND_LV_RANK[21] = "21계급"
  REP_TXT.STAND_LV_RANK[22] = "22계급"
  REP_TXT.STAND_LV_RANK[23] = "23계급"
  REP_TXT.STAND_LV_RANK[24] = "24계급"
  REP_TXT.STAND_LV_RANK[25] = "25계급"
  REP_TXT.STAND_LV_RANK[26] = "26계급"
  REP_TXT.STAND_LV_RANK[27] = "27계급"
  REP_TXT.STAND_LV_RANK[28] = "28계급"
  REP_TXT.STAND_LV_RANK[29] = "29계급"
  REP_TXT.STAND_LV_RANK[30] = "30계급"
  ---- Level standings
  REP_TXT.STAND_LV_LEVEL[0] = "알 수 없는"
  REP_TXT.STAND_LV_LEVEL[1] = "1 레벨"
  REP_TXT.STAND_LV_LEVEL[2] = "2 레벨"
  REP_TXT.STAND_LV_LEVEL[3] = "3 레벨"
  REP_TXT.STAND_LV_LEVEL[4] = "4 레벨"
  REP_TXT.STAND_LV_LEVEL[5] = "5 레벨"
  REP_TXT.STAND_LV_LEVEL[6] = "6 레벨"
  REP_TXT.STAND_LV_LEVEL[7] = "7 레벨"
  REP_TXT.STAND_LV_LEVEL[8] = "8 레벨"
  REP_TXT.STAND_LV_LEVEL[9] = "9 레벨"
  REP_TXT.STAND_LV_LEVEL[10] = "10 레벨"
  REP_TXT.STAND_LV_LEVEL[11] = "11 레벨"
  REP_TXT.STAND_LV_LEVEL[12] = "12 레벨"
  REP_TXT.STAND_LV_LEVEL[13] = "13 레벨"
  REP_TXT.STAND_LV_LEVEL[14] = "14 레벨"
  REP_TXT.STAND_LV_LEVEL[15] = "15 레벨"
  REP_TXT.STAND_LV_LEVEL[16] = "16 레벨"
  REP_TXT.STAND_LV_LEVEL[17] = "17 레벨"
  REP_TXT.STAND_LV_LEVEL[18] = "18 레벨"
  REP_TXT.STAND_LV_LEVEL[19] = "19 레벨"
  REP_TXT.STAND_LV_LEVEL[20] = "20 레벨"
  REP_TXT.STAND_LV_LEVEL[21] = "21 레벨"
  REP_TXT.STAND_LV_LEVEL[22] = "22 레벨"
  REP_TXT.STAND_LV_LEVEL[23] = "23 레벨"
  REP_TXT.STAND_LV_LEVEL[24] = "24 레벨"
  REP_TXT.STAND_LV_LEVEL[25] = "25 레벨"
  REP_TXT.STAND_LV_LEVEL[26] = "26 레벨"
  REP_TXT.STAND_LV_LEVEL[27] = "27 레벨"
  REP_TXT.STAND_LV_LEVEL[28] = "28 레벨"
  REP_TXT.STAND_LV_LEVEL[29] = "29 레벨"
  REP_TXT.STAND_LV_LEVEL[30] = "30 레벨"
  REP_TXT.STAND_LV_LEVEL[31] = "31 레벨"
  REP_TXT.STAND_LV_LEVEL[32] = "32 레벨"
  REP_TXT.STAND_LV_LEVEL[33] = "33 레벨"
  REP_TXT.STAND_LV_LEVEL[34] = "34 레벨"
  REP_TXT.STAND_LV_LEVEL[35] = "35 레벨"
  REP_TXT.STAND_LV_LEVEL[36] = "36 레벨"
  REP_TXT.STAND_LV_LEVEL[37] = "37 레벨"
  REP_TXT.STAND_LV_LEVEL[38] = "38 레벨"
  REP_TXT.STAND_LV_LEVEL[39] = "39 레벨"
  REP_TXT.STAND_LV_LEVEL[40] = "40 레벨"
  REP_TXT.STAND_LV_LEVEL[41] = "41 레벨"
  REP_TXT.STAND_LV_LEVEL[42] = "42 레벨"
  REP_TXT.STAND_LV_LEVEL[43] = "43 레벨"
  REP_TXT.STAND_LV_LEVEL[44] = "44 레벨"
  REP_TXT.STAND_LV_LEVEL[45] = "45 레벨"
  REP_TXT.STAND_LV_LEVEL[46] = "46 레벨"
  REP_TXT.STAND_LV_LEVEL[47] = "47 레벨"
  REP_TXT.STAND_LV_LEVEL[48] = "48 레벨"
  REP_TXT.STAND_LV_LEVEL[49] = "49 레벨"
  REP_TXT.STAND_LV_LEVEL[50] = "50 레벨"
  REP_TXT.STAND_LV_LEVEL[51] = "51 레벨"
  REP_TXT.STAND_LV_LEVEL[52] = "52 레벨"
  REP_TXT.STAND_LV_LEVEL[53] = "53 레벨"
  REP_TXT.STAND_LV_LEVEL[54] = "54 레벨"
  REP_TXT.STAND_LV_LEVEL[55] = "55 레벨"
  REP_TXT.STAND_LV_LEVEL[56] = "56 레벨"
  REP_TXT.STAND_LV_LEVEL[57] = "57 레벨"
  REP_TXT.STAND_LV_LEVEL[58] = "58 레벨"
  REP_TXT.STAND_LV_LEVEL[59] = "59 레벨"
  REP_TXT.STAND_LV_LEVEL[60] = "60 레벨"
  REP_TXT.STAND_LV_LEVEL[61] = "61 레벨"
  REP_TXT.STAND_LV_LEVEL[62] = "62 레벨"
  REP_TXT.STAND_LV_LEVEL[63] = "63 레벨"
  REP_TXT.STAND_LV_LEVEL[64] = "64 레벨"
  REP_TXT.STAND_LV_LEVEL[65] = "65 레벨"
  REP_TXT.STAND_LV_LEVEL[66] = "66 레벨"
  REP_TXT.STAND_LV_LEVEL[67] = "67 레벨"
  REP_TXT.STAND_LV_LEVEL[68] = "68 레벨"
  REP_TXT.STAND_LV_LEVEL[69] = "69 레벨"
  REP_TXT.STAND_LV_LEVEL[70] = "70 레벨"
  REP_TXT.STAND_LV_LEVEL[71] = "71 레벨"
  REP_TXT.STAND_LV_LEVEL[72] = "72 레벨"
  REP_TXT.STAND_LV_LEVEL[73] = "73 레벨"
  REP_TXT.STAND_LV_LEVEL[74] = "74 레벨"
  REP_TXT.STAND_LV_LEVEL[75] = "75 레벨"
  REP_TXT.STAND_LV_LEVEL[76] = "76 레벨"
  REP_TXT.STAND_LV_LEVEL[77] = "77 레벨"
  REP_TXT.STAND_LV_LEVEL[78] = "78 레벨"
  REP_TXT.STAND_LV_LEVEL[79] = "79 레벨"
  REP_TXT.STAND_LV_LEVEL[80] = "80 레벨"
  REP_TXT.STAND_LV_LEVEL[81] = "81 레벨"
  REP_TXT.STAND_LV_LEVEL[82] = "82 레벨"
  REP_TXT.STAND_LV_LEVEL[83] = "83 레벨"
  REP_TXT.STAND_LV_LEVEL[84] = "84 레벨"
  REP_TXT.STAND_LV_LEVEL[85] = "85 레벨"
  REP_TXT.STAND_LV_LEVEL[86] = "86 레벨"
  REP_TXT.STAND_LV_LEVEL[87] = "87 레벨"
  REP_TXT.STAND_LV_LEVEL[88] = "88 레벨"
  REP_TXT.STAND_LV_LEVEL[89] = "89 레벨"
  REP_TXT.STAND_LV_LEVEL[90] = "90 레벨"
  REP_TXT.STAND_LV_LEVEL[91] = "91 레벨"
  REP_TXT.STAND_LV_LEVEL[92] = "92 레벨"
  REP_TXT.STAND_LV_LEVEL[93] = "93 레벨"
  REP_TXT.STAND_LV_LEVEL[94] = "94 레벨"
  REP_TXT.STAND_LV_LEVEL[95] = "95 레벨"
  REP_TXT.STAND_LV_LEVEL[96] = "96 레벨"
  REP_TXT.STAND_LV_LEVEL[97] = "97 레벨"
  REP_TXT.STAND_LV_LEVEL[98] = "98 레벨"
  REP_TXT.STAND_LV_LEVEL[99] = "99 레벨"
  REP_TXT.STAND_LV_LEVEL[100] = "100 레벨"
  -------------------------------------
  -- BFFLabels / Friendship factions --
  -------------------------------------
  -- BFF Labels placeholder
  REP_TXT.BFFLabels[0] = {} -- 이방인
  REP_TXT.BFFLabels[0][1] = "지인"
  REP_TXT.BFFLabels[0][2] = "동료"
  REP_TXT.BFFLabels[0][3] = "친구"
  REP_TXT.BFFLabels[0][4] = "좋은 친구"
  REP_TXT.BFFLabels[0][5] = "가장 친한 친구"
  ---- Fishing Masters placeholder
  REP_TXT.BFFFishingMastersLabels = {}
  REP_TXT.BFFFishingMastersLabels[1] = "이방인"
  REP_TXT.BFFFishingMastersLabels[2] = "아는 사람"
  REP_TXT.BFFFishingMastersLabels[3] = "동료"
  REP_TXT.BFFFishingMastersLabels[4] = "친구"
  REP_TXT.BFFFishingMastersLabels[5] = "좋은 친구"
  REP_TXT.BFFFishingMastersLabels[6] = "가장 친한 친구"
  ---- Barracks Bodyguards placeholder
  REP_TXT.BFFBarracksBodyguardsLabels = {}
  REP_TXT.BFFBarracksBodyguardsLabels[1] = "경호원"
  REP_TXT.BFFBarracksBodyguardsLabels[2] = "믿음직스러운 경호원"
  REP_TXT.BFFBarracksBodyguardsLabels[3] = "개인 호위무사"
  ---- The First Responders 1984
  REP_TXT.BFFLabels[1984] = {} -- 수습생
  REP_TXT.BFFLabels[1984][1] = "하급 수련의"
  REP_TXT.BFFLabels[1984][2] = "상급 수련의"
  REP_TXT.BFFLabels[1984][3] = "긴급구조원"
  ---- Corbyn 2100
  REP_TXT.BFFLabels[2100] = {} -- 이방인
  REP_TXT.BFFLabels[2100][1] = "호기심의 대상"
  REP_TXT.BFFLabels[2100][2] = "적대적이지 않은 사람"
  REP_TXT.BFFLabels[2100][3] = REP_TXT.BFFFishingMastersLabels[4]
  REP_TXT.BFFLabels[2100][4] = "도움을 주는 친구"
  REP_TXT.BFFLabels[2100][5] = REP_TXT.BFFFishingMastersLabels[6]
  -- Chromie 2135
  REP_TXT.BFFLabels[2135] = {} -- 새끼용
  REP_TXT.BFFLabels[2135][1] = "시간의 훈련생"
  REP_TXT.BFFLabels[2135][2] = "시간여행자"
  REP_TXT.BFFLabels[2135][3] = "시간의 친구"
  REP_TXT.BFFLabels[2135][4] = "청동 동맹"
  REP_TXT.BFFLabels[2135][5] = "시대의 해결사	"
  REP_TXT.BFFLabels[2135][6] = "시간군주"
  ---- Wrathion 2517
  REP_TXT.BFFLabels[2517] = {} -- 지인
  REP_TXT.BFFLabels[2517][1] = "일원"
  REP_TXT.BFFLabels[2517][2] = "동맹"
  REP_TXT.BFFLabels[2517][3] = "송곳니"
  REP_TXT.BFFLabels[2517][4] = "친구"
  REP_TXT.BFFLabels[2517][5] = "진정한 친구"
  ---- Sabellian 2518
  REP_TXT.BFFLabels[2518] = {} -- 지인
  REP_TXT.BFFLabels[2518][1] = "일원"
  REP_TXT.BFFLabels[2518][2] = "동맹"
  REP_TXT.BFFLabels[2518][3] = "송곳니"
  REP_TXT.BFFLabels[2518][4] = "친구"
  REP_TXT.BFFLabels[2518][5] = "진정한 친구"
  ---- Artisan's Consortium - Dragon Isles Branch 2544
  REP_TXT.BFFLabels[2544] = {} -- 중립
  REP_TXT.BFFLabels[2544][1] = "선호함"
  REP_TXT.BFFLabels[2544][2] = "존중"
  REP_TXT.BFFLabels[2544][3] = "소중함"
  REP_TXT.BFFLabels[2544][4] = "존경함"
  ---- Cobalt Assembly 2550
  REP_TXT.BFFLabels[2550] = {} -- 없음
  REP_TXT.BFFLabels[2550][1] = "낮음"
  REP_TXT.BFFLabels[2550][2] = "보통"
  REP_TXT.BFFLabels[2550][3] = "높음"
  REP_TXT.BFFLabels[2550][4] = "최대"
  ---- Soridormi 2553
  REP_TXT.BFFLabels[2553] = {} -- 변형물
  REP_TXT.BFFLabels[2553][1] = "미래의 친구"
  REP_TXT.BFFLabels[2553][2] = "균열 봉합사"
  REP_TXT.BFFLabels[2553][3] = "시간나그네"
  REP_TXT.BFFLabels[2553][4] = "전설"
  ---- The Weaver 2601
  REP_TXT.BFFLabels[2601] = {} -- 이방인
  REP_TXT.BFFLabels[2601][1] = "지인"
  REP_TXT.BFFLabels[2601][2] = "친우"
  REP_TXT.BFFLabels[2601][3] = "공모자"
  REP_TXT.BFFLabels[2601][4] = "협조자"
  REP_TXT.BFFLabels[2601][5] = "군식구"
  REP_TXT.BFFLabels[2601][6] = "사주자"
  REP_TXT.BFFLabels[2601][7] = "모략가"
  REP_TXT.BFFLabels[2601][8] = "주모자"
  ---- The General 2605
  REP_TXT.BFFLabels[2605] = {} -- 이방인
  REP_TXT.BFFLabels[2605][1] = "지인"
  REP_TXT.BFFLabels[2605][2] = "친우"
  REP_TXT.BFFLabels[2605][3] = "공모자"
  REP_TXT.BFFLabels[2605][4] = "협조자"
  REP_TXT.BFFLabels[2605][5] = "군식구"
  REP_TXT.BFFLabels[2605][6] = "사주자"
  REP_TXT.BFFLabels[2605][7] = "모략가"
  REP_TXT.BFFLabels[2605][8] = "주모자"
  ---- The Vizier 2607
  REP_TXT.BFFLabels[2607] = {} -- 이방인
  REP_TXT.BFFLabels[2607][1] = "지인"
  REP_TXT.BFFLabels[2607][2] = "친우"
  REP_TXT.BFFLabels[2607][3] = "공모자"
  REP_TXT.BFFLabels[2607][4] = "협조자"
  REP_TXT.BFFLabels[2607][5] = "군식구"
  REP_TXT.BFFLabels[2607][6] = "사주자"
  REP_TXT.BFFLabels[2607][7] = "모략가"
  REP_TXT.BFFLabels[2607][8] = "주모자"
  ---- Azerothian Archives 2615
  REP_TXT.BFFLabels[2615] = {} -- 졸업생
  REP_TXT.BFFLabels[2615][1] = "조수"
  REP_TXT.BFFLabels[2615][2] = "계약자"
  REP_TXT.BFFLabels[2615][3] = "대학원생"
  REP_TXT.BFFLabels[2615][4] = "종신 교수"

  ---------------------------
  -- Tooltips
  ---------------------------
  ---- Initialize
  REP_TXT.elements	= {}
  REP_TXT.elements.name	= {}
  REP_TXT.elements.tip	= {}
  ---- Names and tips
  REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
  REP_TXT.elements.tip.REP_OptionsButton	= "Reputations 설정창을 엽니다."
  REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
  REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "이 항목을 선택하면, 진영 목록을 평판순으로 정렬합니다.\r\n\r\n이 항목을 선택하지 않으면 진영 목록은 블리자드 기본 그룹에 가나다 순으로 표시합니다.\r\n\r\n|cFFFAA0A0비활성|r 진영을 표시하려면, 이 항목을 해제한 뒤 목록의 맨 아래로 이동하면 볼 수 있습니다."
  REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
  REP_TXT.elements.tip.REP_ShowMobsButton	= "평판을 얻기 위해 잡을 수 있는 몹을 보려면 이 단추를 선택하십시오."
  REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
  REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "평판을 얻기 위해 할 수 있는 퀘스트를 보려면\r\n이 단추를 선택하십시오."
  REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
  REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "평판을 얻기 위해 할 수 있는 PvP 퀘스트를 보려면\r\n이 단추를 선택하십시오."
  REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
  REP_TXT.elements.tip.REP_ShowItemsButton	= "평판을 얻기 위해 반납 가능한 아이템을 보려면\r\n이 단추를 선택하십시오."
  REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
  REP_TXT.elements.tip.REP_ShowInstancesButton	= "평판을 얻기 위해 실행할 수있는 인스턴스를 참조하려면\r\n이 단추를 선택하십시오."
  REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
  REP_TXT.elements.tip.REP_ShowGeneralButton	= "평판 획득에 대한 일반적인 정보를 보려면\r\n이 단추를 선택하십시오."
  REP_TXT.elements.name.REP_DetailShowAllButton	= REP_TXT.showAll
  REP_TXT.elements.tip.REP_DetailShowAllButton	= "왼쪽에 있는 모든 체크 박스를 선택하려면 이 버튼을 누릅니다.\r\n현재 선택한 진영 평판을 얻을 수 있는 몹, 퀘스트, 아이템과 인스턴스를 표시합니다."
  REP_TXT.elements.name.REP_DetailShowNoneButton	= REP_TXT.showNone
  REP_TXT.elements.tip.REP_DetailShowNoneButton	= "왼쪽에 있는 모든 체크 박스 선택을 해제하려면 이 버튼을 누릅니다. \r\n현재 선택한 진영 평판을 얻을 수 있는 방법을 모두 표시하지 않습니다."
  REP_TXT.elements.name.REP_DetailExpandButton	= REP_TXT.expand
  REP_TXT.elements.tip.REP_DetailExpandButton	= "목록에 있는 모든 항목을 펼치려면 이 버튼을 누릅니다. 이것은 어떤 아이템 수집 퀘스트의 완료에 필요한 항목을 표시합니다."
  REP_TXT.elements.name.REP_DetailCollapseButton	= REP_TXT.collapse
  REP_TXT.elements.tip.REP_DetailCollapseButton	= "목록에서 모든 항목을 줄이려면 이 버튼을 누릅니다. 퀘스트 세부항목 또는 반납하는 아이템 상세 항목을 숨깁니다."
  REP_TXT.elements.name.REP_DetailSupressNoneFactionButton	= REP_TXT.supressNoneFaction
  REP_TXT.elements.tip.REP_DetailSupressNoneFactionButton	= "맞 클릭하여 제외한 이 진영의 모든 퀘스트를 다시 사용하려면 이 버튼을 누릅니다."
  REP_TXT.elements.name.REP_DetailSupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
  REP_TXT.elements.tip.REP_DetailSupressNoneGlobalButton	= "마우스 우클릭으로 제외한 모든 세력에 대한 모든 퀘스트를 다시 사용하려면 이 버튼을 누릅니다."
  REP_TXT.elements.name.REP_DetailClearSessionGainButton	= REP_TXT.clearSessionGain
  REP_TXT.elements.tip.REP_DetailClearSessionGainButton	= "이 세션에서 얻은 평판 카운터를 초기화하려면 이 버튼을 누르십시오."
  REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
  REP_TXT.elements.tip.REP_EnableMissingBox	= "평판 프레임에 있는 각 진영의 현재 서 뒤에 다음 신뢰도 수준에 필요한 누락 명성 포인트를 추가하려면이 설정을 사용합니다."
  REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
  REP_TXT.elements.tip.REP_ExtendDetailsBox	= "이 설정을 활성화하면, 평판 상세 프레임을 확장하여 표시합니다.\r\n을 표시하려면이 설정을 사용하도록 설정이 다음 신뢰도 수준에 도달하는 데 필요한 누락 된 명성이 명성을 얻을 수있는 방법의 목록을 표시합니다 리스팅 퀘스트, 몬스터, 항목 및 선택한 진영에 대한 평판을 얻을 수있는 인스턴스가 있습니다."
  REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
  REP_TXT.elements.tip.REP_GainToChatBox	= "명성을 표시하려면이 설정을 사용하면 평판을 얻을 때마다 모든 세력에 대해 얻을 수 있습니다. \r\n이 일반적으로, 기본 파 만의 이득이 나열되는, 평판 이득을 보고하는 표준 방법이 다릅니다."
  REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
  REP_TXT.elements.tip.REP_NoGuildGainBox	= "길드 평판 채팅 메시지를 출력하지 않으려면 이 설정을 사용합니다."
  REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
  REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "기본 평판 획득 메시지를 표시하지 않으려면 이 설정을 사용합니다.\r\n이 당신이 상세한 진영 이득 메시지를 활성화 한 경우, 그래서 당신은 표준 및 확장 버전에서 동일한 목록을하지 않는 것이 좋습니다."
  REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
  REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "명성 프레임 일반 평판 표시 막대에, 아이템 반납 또는 퀘스트 완료로 얻을 수 있는 평판을 회색 막대로 미리 표시하려면 이 설정을 사용합니다."
  REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
  REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "자동으로 당신이 명성을 얻고있다 마지막 도당에 감시 당하고 파를 전환하려면 이 설정을 사용합니다."
  REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
  REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "길드 평판 이익에 대한 감시 세력을 전환 할 때 이 설정을 사용합니다."
  REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
  REP_TXT.elements.tip.REP_SilentSwitchBox	= "(채팅하는 메시지없이) 자동 평판 줄을 전환하려면 이 설정을 사용합니다."
  REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
  REP_TXT.elements.name.REP_ChatFrameSlider	= "프레임 채팅"
  REP_TXT.elements.tip.REP_ChatFrameSlider	= "어느 대화 프레임에 평판 메시지를 출력할 지 선택합니다."
  REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
  REP_TXT.elements.tip.REP_EnableParagonBarBox  = "이 옵션을 사용하면, 현재 불멸의 동맹 평판을 경험치 바에 표시합니다."
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
  REP_TXT.settings.buffTitle = "평판 버프"
  REP_TXT.settings.buffSubTitle = "이러한 평판 버프를 전환하여 다양한 활동을 통해 얼마나 많은 평판을 얻을 수 있는지 확인할 수 있습니다. 중첩되지 않는 버프는 전환 시 비활성화됩니다."
  ---- Buffs
  REP_TXT.settings.harvestBountyRepBuff = "나눔의 정신 (순례자의 감사절)"
  REP_TXT.settings.info.harvestBountyRepBuff = "평판의 획득량이 10%만큼 증가합니다. 1시간 동안 지속됩니다."
  REP_TXT.settings.wickermanRepBuff = "밀짚인형의 기원 (할로윈)"
  REP_TXT.settings.info.wickermanRepBuff = "생명력과 마나 회복 속도가 25%만큼 증가하며 체력이 25%만큼 증가합니다. 2 hrs 동안 지속됩니다."
  REP_TXT.settings.wickermanRepBuffUnburdened = "해방감 (할로윈)"
  REP_TXT.settings.info.wickermanRepBuffUnburdened = "밀짚인형의 불 속으로 모든 걱정을 날려보냈습니다. 경험치와 평판의 획득량이 10%만큼 증가합니다. 2 hrs 동안 지속됩니다."
  REP_TXT.settings.wickermanRepBuffGrimVisage = "음산한 얼굴 (할로윈)"
  REP_TXT.settings.info.wickermanRepBuffGrimVisage = "밀짚인형의 재로 얼굴을 칠했습니다. 경험치와 평판의 획득량이 10%만큼 증가합니다. 2 hrs 동안 지속됩니다."
  REP_TXT.settings.MrPopularityRankOne = "인기인 (길드 혜택, 1 레벨)"
  REP_TXT.settings.info.MrPopularityRankOne = "몬스터 처치와 퀘스트 완료로 얻는 평판이 5%만큼 증가합니다."
  REP_TXT.settings.MrPopularityRankTwo = "인기인 (길드 혜택, 2 레벨)"
  REP_TXT.settings.info.MrPopularityRankTwo = "몬스터 처치와 퀘스트 완료로 얻는 평판이 10%만큼 증가합니다."
  REP_TXT.settings.DarkmoonFaireWeeRepBuff = "활활! (다크문 유랑단)"
  REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "다크문 흔들 기구 또는 롤러코스터를 탐 획득하는 경험치와 평판 10%만큼 증가"
  REP_TXT.settings.DarkmoonFaireHatRep = "다크문 중산모 (다크문 유랑단)"
  REP_TXT.settings.info.DarkmoonFaireHatRep = "획득하는 경험치와 평판이 1 hour 동안 10%만큼 증가합니다. 사용하면 모자가 사라집니다."
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