-------------------------
-- Русский (Russian) --
-------------------------
if (GetLocale() =="ruRU") then
  -- Binding names
  BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
  BINDING_NAME_SHOWCONFIG	= "Показать окно опций"
  BINDING_NAME_SHOWDETAILS	= "Отображение детальной информации о репутации"

  REP_TXT	= {}
  REP_TXT.Mob = {}
  -- help
  REP_TXT.help	= "Инструментарий работы с репутацией"
  REP_TXT.command	= "Невозможно разобрать команду"
  REP_TXT.usage	= "Использование"
  REP_TXT.helphelp	= "Показывает этот текст помощи"
  REP_TXT.helpabout	= "Показывает информацию об авторе"
  REP_TXT.helpstatus	= "Показывает текущие настройки"
  -- about
  REP_TXT.by	= "durch"
  REP_TXT.version	= "Версия"
  REP_TXT.date	= "дата"
  REP_TXT.web	= "сайт"
  REP_TXT.slash	= "Слэш команды"
  -- status
  REP_TXT.status	= "Статус"
  REP_TXT.disabled	= "выключено"
  REP_TXT.enabled	= "включено"
  REP_TXT.statMobs	= "Показывать мобов [М]"
  REP_TXT.statQuests	= "Показывать квесты [К]"
  REP_TXT.statInstances	= "Показывать подземелья [П]"
  REP_TXT.statItems	= "Показывать вещи [В]"
  REP_TXT.statGeneral	= "Показать общее [G]"
  REP_TXT.statMissing	= "Показывать недостающую репутацию"
  REP_TXT.statDetails	= "Показывать окно расширенной информации"
  REP_TXT.statChat	= "Детальное сообщение чата"
  REP_TXT.statNoGuildChat	= "Не отображать репутацию с гильдией в чат"
  REP_TXT.statSuppress	= "Подавить стандартное сообщение в чате"
  REP_TXT.statPreview	= "Отображать предпросмотр в окне репутации"
  REP_TXT.statSwitch	= "Автоматическое переключение фракции в полосе репутации"
  REP_TXT.statNoGuildSwitch	= "Не переключать для репутации с гильдией"
  REP_TXT.statSilentSwitch	= "Нет сообщений при переключении полосы репутации"
  REP_TXT.statGuildCap	= "Показать лимит репутации с гильдией в чат"
  -- XML UI elements
  REP_TXT.showQuests	= "Квесты"
  REP_TXT.showPvPQuests	= "PvP Квесты"
  REP_TXT.showInstances	= "Подземелья"
  REP_TXT.showMobs	= "Мобы"
  REP_TXT.showItems	= "Вещи"
  REP_TXT.showGeneral	= "Показать общую информацию"
  REP_TXT.showAll	= "Показать все"
  REP_TXT.showNone	= "Скрыть все"
  REP_TXT.expand	= "Развернуть"
  REP_TXT.collapse	= "Свернуть"
  REP_TXT.supressNoneFaction	= "Убрать исключения фракции"
  REP_TXT.supressNoneGlobal	= "Убрать все исключения"
  REP_TXT.suppressHint	= "Кликните правой кнопкой, чтобы исключить квест из списка"
  REP_TXT.clearSessionGain	= "Очистить счетчик увеличений за сессию"
  REP_TXT.moveToInactive = "Move to inactive"
  REP_TXT.showFactionOnMainscreen = "Show faction as exp bar"
  -- options dialog
  REP_TXT.showMissing	= "Показывать недостающую репутацию во фрейме репутации"
  REP_TXT.extendDetails	= "Показывать окно детальной информации о репутации"
  REP_TXT.gainToChat	= "Replace original faction gain messages with a more detailed version"
  REP_TXT.noGuildGain	= "Не писать в чат для репутации с гильдией"
  REP_TXT.suppressOriginalGain	= "Подавлять стандартное сообщение повышения репутации"
  REP_TXT.showPreviewRep	= "Показывать репутацию, которая может быть получена, в окне репутации"
  REP_TXT.switchFactionBar	= "Переключать полосу репутации на фракцию, с которой только что приобрели репутацию"
  REP_TXT.noGuildSwitch	= "Не включать полосу репутации для репутации с гильдией"
  REP_TXT.silentSwitch	= "Не отображать сообщения в чат при переключении полосы репутации"
  REP_TXT.guildCap	= "Показывать в чат дневной максимум репутации с гильдией."
  REP_TXT.defaultChatFrame	= "Использовать окно чата по умолчанию"
  REP_TXT.chatFrame	= "Использовать окно чата: %d (%s)"
  REP_TXT.usingDefaultChatFrame	= "Используется окно чата по умолчанию"
  REP_TXT.usingChatFrame	= "Используется окно чата"
  REP_TXT.EnableParagonBar = "Display paragon reputation in bars."
  -- various LUA
  REP_TXT.options	= "Опции"
  REP_TXT.orderByStanding	= "Сортировать по репе"
  REP_TXT.lookup	= "Посмотреть фракцию"
  REP_TXT.allFactions	= "Список всех фракций"
  REP_TXT.missing	= "(до повышения)"
  REP_TXT.missing2	= "Не хватает"
  REP_TXT.heroic	= "Героик"
  REP_TXT.normal	= "Нормал"
  REP_TXT.switchBar	= "Переключаем полосу репутации на"
  -- REP_ShowFactions
  REP_TXT.faction	= "Фракция"
  REP_TXT.is	= "есть"
  REP_TXT.withStanding	= "со стоячим"
  REP_TXT.needed	= "необходимо"
  REP_TXT.mob	= "[Моб]"
  REP_TXT.limited	= "ограничивается"
  REP_TXT.limitedPl	= "ограничиваются"
  REP_TXT.quest	= "[Квест]"
  REP_TXT.instance	= "[Подземелье]"
  REP_TXT.items	= "[Вещь]"
  REP_TXT.unknown	= "Не известно этому игроку"
  -- mob Details
  REP_TXT.tmob	= "Обычные мобы (треш)"
  REP_TXT.oboss	= "другим боссом"
  REP_TXT.aboss	= "все боссы"
  REP_TXT.pboss	= "за боссом"
  REP_TXT.fclear	= "полный ясно"
  REP_TXT.AU	= "Любой Безымянный"
  REP_TXT.AN	= "Любой имени"
  REP_TXT.BB	= "Пираты Кровавого Паруса"
  REP_TXT.SSP	= "пирата Южных морей"
  REP_TXT.Wa	= "шайки Скитальцев Пустыни"
  REP_TXT.VCm	= "Любой член торговой компании"
  REP_TXT.Mob.MoshOgg_Spellcrafter = "Чаротвор Мош'Огг"
  REP_TXT.Mob.BoulderfistOgre = "Огр из клана Тяжелого Кулака"
  -- Quest Details
  REP_TXT.cdq	= "Главный город кулинарные ежедневных заданий"
  REP_TXT.coq	= "Ежедневные кулинарные квесты других городов"
  REP_TXT.fdq	= "Главный город рыболовные ежедневных заданий"
  REP_TXT.foq	= "Ежедневные рыболовные квесты других городов"
  REP_TXT.ndq	= "нет ежедневных заданий"
  REP_TXT.deleted	= "устаревший"
  REP_TXT.Championing	= "чемпиона (камзол герольда)"
  REP_TXT.bpqfg	= "По процентов поисках усиления фракции"
  -- items Details
  REP_TXT.cbadge	= "Рекомендательный значок другой город"
  -- instance Details
  REP_TXT.srfd	= "Перетекают репутация от подземелья"
  REP_TXT.tbd	= "ToBe Done"
  REP_TXT.nci	= "Нормальные случаи Cataclysm"
  REP_TXT.hci	= "Героический случаях Cataclysm"
  REP_TXT.ncit	= "Обычные инстансы Cataclysm с фракционной гербовой накидкой"
  REP_TXT.hcit	= "Инстансы Героического Катаклизма с фракционной гербовой накидкой"
  -- ToBeDone general
  REP_TXT.tfr	= "Тиллер Сельское хозяйство репутации"
  REP_TXT.nswts	= "Не знаю, когда это начинается"
  REP_TXT.mnd	= "Максимальное количество ежедневных заданий"
  REP_TXT.mnds	= "Максимальное количество ежедневных газет является"
  -- ReputationDetails
  REP_TXT.currentRep	= "Текущая репутация"
  REP_TXT.neededRep	= "Необходимо набрать"
  REP_TXT.missingRep	= "Недостающая репутация"
  REP_TXT.repInBag	= "Репутация в сумках"
  REP_TXT.repInBagBank	= "Репутация в сумках и банке"
  REP_TXT.repInQuest	= "Репутация в квестах"
  REP_TXT.factionGained	= "Увеличено за сессию"
  REP_TXT.noInfo	= "Информация по этой фракции/репутации не найдена."
  REP_TXT.toExalted	= "Нужно до превознесения"
  REP_TXT.toBestFriend = "Reputation to best friend"
  -- to chat
  REP_TXT.stats	= " (Всего: %s%d, Осталось: %d)"
  REP_TXT.statsNextStanding = " (Total: %s%d, Left to %s: %d)"
  -- config changed
  REP_TXT.configQuestion	= "Некоторые (новые) настройки были включены. Это происходит только 1 раз для каждой настройки. Рекомендуется убедиться, что новые настройки Reputations'а Вас удовлетворяют."
  REP_TXT.showConfig	= "Посмотреть настройки"
  REP_TXT.later	= "Позже"
  -- UpdateList
  REP_TXT.mobShort	= "[М]"
  REP_TXT.questShort	= "[К]"
  REP_TXT.instanceShort	= "[П]"
  REP_TXT.itemsShort	= "[В]"
  REP_TXT.generalShort	= "[G]"
  REP_TXT.mobHead	= "Рост репутации за убийство этого моба"
  REP_TXT.questHead	= "Рост репутации за выполнение этого квеста"
  REP_TXT.instanceHead	= "Рост репутации за прохождение подземелья"
  REP_TXT.itemsHead	= "Рост репутации за сдачу предмета"
  REP_TXT.generalHead	= "Общая информация о получении репутации"
  REP_TXT.mobTip	= "Каждый раз убивая этого моба, вы увеличиваете репутацию. Продолжая в том же духе, вы достигните следующего уровня."
  REP_TXT.questTip	= "Каждый раз выполняя этот повторяемый квест, вы увеличиваете репутацию. Продолжая в том же духе, вы достигните следующего уровня."
  REP_TXT.instanceTip	= "Каждый раз, проходя подземелье, вы увеличиваете репутацию. Продолжая в том же духе, вы достигнете следующего уровня."
  REP_TXT.itemsName	= "Вещей на руках"
  REP_TXT.itemsTip	= "Каждый раз сдавая перечисленные вещи, вы увеличиваете репутацию. Продолжая в том же духе, вы достигните следующего уровня."
  REP_TXT.generalTip	= "Это информация о получении репутации с фракцией, которая может не относиться к повторяемым способам."
  REP_TXT.allOfTheAbove	= "Всего %d за квесты выше"
  REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
  REP_TXT.questSummaryTip	= "Эта запись показывает краткую сводку всех квестов, перечисленных выше.\\r\\nЭто полезно, когда все квесты ежедневные и можно посчитать сколько дней необходимо до получения нужного уровня репутации."
  REP_TXT.complete	= "завершен"
  REP_TXT.active	= "Активен"
  REP_TXT.inBag	= "В сумках"
  REP_TXT.turnIns	= "Сдать:"
  REP_TXT.reputation	= "Репутация:"
  REP_TXT.reputationCap	= "Лимит репутации:"
  REP_TXT.reputationCapCurrent	= "Текущая репутация:"
  REP_TXT.inBagBank	= "В сумках и банке"
  REP_TXT.questCompleted	= "Квест выполнен"
  REP_TXT.timesToDo	= "Сделать раз:"
  REP_TXT.instance2	= "Подземелье:"
  REP_TXT.mode	= "Режим:"
  REP_TXT.timesToRun	= "Сделать ранов:"
  REP_TXT.mob2	= "Моб:"
  REP_TXT.location	= "Локация:"
  REP_TXT.toDo	= "Сделать:"
  REP_TXT.quest2	= "Квест:"
  REP_TXT.itemsRequired	= "Вещей необходимо"
  REP_TXT.general2	= "Общий:"
  REP_TXT.maxStanding	= "Дает репутацию, пока не достигнуто"
  REP_TXT.renown = "Renown"
  -- skills
  REP_TXT.skillHerb	= "Травничество"
  REP_TXT.skillMine	= "Горное дело"
  REP_TXT.skillSkin	= "Снятие шкур"
  REP_TXT.skillAlch	= "Алхимия"
  REP_TXT.skillBlack	= "Кузнечное дело"
  REP_TXT.skillEnch	= "Наложение чар"
  REP_TXT.skillEngi	= "Инженерное дело"
  REP_TXT.skillIncrip	= "Начертание"
  REP_TXT.skillJewel	= "Ювелирное дело"
  REP_TXT.skillLeath	= "Кожевничество"
  REP_TXT.skillTail	= "Портняжное дело"
  REP_TXT.skillAid	= "Первая помощь"
  REP_TXT.skillArch	= "Археология"
  REP_TXT.skillCook	= "Кулинария"
  REP_TXT.skillFish	= "Рыбная ловля"
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
  REP_TXT.STAND_LV[0]	= "Неизвестно"
  REP_TXT.STAND_LV[1]	= "Ненависть"
  REP_TXT.STAND_LV[2]	= "Враждебность"
  REP_TXT.STAND_LV[3]	= "недружественный"
  REP_TXT.STAND_LV[4]	= "Равнодушие"
  REP_TXT.STAND_LV[5]	= "Дружелюбие"
  REP_TXT.STAND_LV[6]	= "Уважение"
  REP_TXT.STAND_LV[7]	= "Почтение"
  REP_TXT.STAND_LV[8]	= "Превознесение"
  REP_TXT.STAND_LV[9] = "Парагон"
  ---- Tier standings
  REP_TXT.STAND_LV_TIER[0]	= "Неизвестно"
  REP_TXT.STAND_LV_TIER[1] = "1-й уровень"
  REP_TXT.STAND_LV_TIER[2] = "2-й уровень"
  REP_TXT.STAND_LV_TIER[3] = "3-й уровень"
  REP_TXT.STAND_LV_TIER[4] = "4-й уровень"
  REP_TXT.STAND_LV_TIER[5] = "5-й уровень"
  REP_TXT.STAND_LV_TIER[6] = "6-й уровень"
  ---- Trust standings
  REP_TXT.STAND_LV_TRUST[0] = "Неизвестно"
  REP_TXT.STAND_LV_TRUST[1] = "Сомнения"
  REP_TXT.STAND_LV_TRUST[2] = "Опасения"
  REP_TXT.STAND_LV_TRUST[3] = "Настороженность"
  REP_TXT.STAND_LV_TRUST[4] = "Безразличие"
  REP_TXT.STAND_LV_TRUST[5] = "Сердечность"
  REP_TXT.STAND_LV_TRUST[6] = "Признание"
  ---- Renown standings
  REP_TXT.STAND_LV_RENOWN[0] = "Неизвестно"
  REP_TXT.STAND_LV_RENOWN[1] = "Известность 1"
  REP_TXT.STAND_LV_RENOWN[2] = "Известность 2"
  REP_TXT.STAND_LV_RENOWN[3] = "Известность 3"
  REP_TXT.STAND_LV_RENOWN[4] = "Известность 4"
  REP_TXT.STAND_LV_RENOWN[5] = "Известность 5"
  REP_TXT.STAND_LV_RENOWN[6] = "Известность 6"
  REP_TXT.STAND_LV_RENOWN[7] = "Известность 7"
  REP_TXT.STAND_LV_RENOWN[8] = "Известность 8"
  REP_TXT.STAND_LV_RENOWN[9] = "Известность 9"
  REP_TXT.STAND_LV_RENOWN[10] = "Известность 10"
  REP_TXT.STAND_LV_RENOWN[11] = "Известность 11"
  REP_TXT.STAND_LV_RENOWN[12] = "Известность 12"
  REP_TXT.STAND_LV_RENOWN[13] = "Известность 13"
  REP_TXT.STAND_LV_RENOWN[14] = "Известность 14"
  REP_TXT.STAND_LV_RENOWN[15] = "Известность 15"
  REP_TXT.STAND_LV_RENOWN[16] = "Известность 16"
  REP_TXT.STAND_LV_RENOWN[17] = "Известность 17"
  REP_TXT.STAND_LV_RENOWN[18] = "Известность 18"
  REP_TXT.STAND_LV_RENOWN[19] = "Известность 19"
  REP_TXT.STAND_LV_RENOWN[20] = "Известность 20"
  REP_TXT.STAND_LV_RENOWN[21] = "Известность 21"
  REP_TXT.STAND_LV_RENOWN[22] = "Известность 22"
  REP_TXT.STAND_LV_RENOWN[23] = "Известность 23"
  REP_TXT.STAND_LV_RENOWN[24] = "Известность 24"
  REP_TXT.STAND_LV_RENOWN[25] = "Известность 25"
  ---- Rank standings
  REP_TXT.STAND_LV_MAX_RANK = "Макс. ранг"
  REP_TXT.STAND_LV_RANK[0] = "Неизвестно"
  REP_TXT.STAND_LV_RANK[1] = "Боец 1-го ранга"
  REP_TXT.STAND_LV_RANK[2] = "Боец 2-го ранга"
  REP_TXT.STAND_LV_RANK[3] = "Боец 3-го ранга"
  REP_TXT.STAND_LV_RANK[4] = "Боец 4-го ранга"
  REP_TXT.STAND_LV_RANK[5] = "Боец 5-го ранга"
  REP_TXT.STAND_LV_RANK[6] = "Боец 6-го ранга"
  REP_TXT.STAND_LV_RANK[7] = "Боец 7-го ранга"
  REP_TXT.STAND_LV_RANK[8] = "Боец 8-го ранга"
  REP_TXT.STAND_LV_RANK[9] = "Боец 9-го ранга"
  REP_TXT.STAND_LV_RANK[10] = "Боец 10-го ранга"
  REP_TXT.STAND_LV_RANK[11] = "Боец 11-го ранга"
  REP_TXT.STAND_LV_RANK[12] = "Боец 12-го ранга"
  REP_TXT.STAND_LV_RANK[13] = "Боец 13-го ранга"
  REP_TXT.STAND_LV_RANK[14] = "Боец 14-го ранга"
  REP_TXT.STAND_LV_RANK[15] = "Боец 15-го ранга"
  REP_TXT.STAND_LV_RANK[16] = "Боец 16-го ранга"
  REP_TXT.STAND_LV_RANK[17] = "Боец 17-го ранга"
  REP_TXT.STAND_LV_RANK[18] = "Боец 18-го ранга"
  REP_TXT.STAND_LV_RANK[19] = "Боец 19-го ранга"
  REP_TXT.STAND_LV_RANK[20] = "Боец 20-го ранга"
  REP_TXT.STAND_LV_RANK[21] = "Боец 21-го ранга"
  REP_TXT.STAND_LV_RANK[22] = "Боец 22-го ранга"
  REP_TXT.STAND_LV_RANK[23] = "Боец 23-го ранга"
  REP_TXT.STAND_LV_RANK[24] = "Боец 24-го ранга"
  REP_TXT.STAND_LV_RANK[25] = "Боец 25-го ранга"
  REP_TXT.STAND_LV_RANK[26] = "Боец 26-го ранга"
  REP_TXT.STAND_LV_RANK[27] = "Боец 27-го ранга"
  REP_TXT.STAND_LV_RANK[28] = "Боец 28-го ранга"
  REP_TXT.STAND_LV_RANK[29] = "Боец 29-го ранга"
  REP_TXT.STAND_LV_RANK[30] = "Боец 30-го ранга"
  ---- Level standings
  REP_TXT.STAND_LV_LEVEL[0] = "Неизвестно"
  REP_TXT.STAND_LV_LEVEL[1] = "1-й уровень"
  REP_TXT.STAND_LV_LEVEL[2] = "2-й уровень"
  REP_TXT.STAND_LV_LEVEL[3] = "3-й уровень"
  REP_TXT.STAND_LV_LEVEL[4] = "4-й уровень"
  REP_TXT.STAND_LV_LEVEL[5] = "5-й уровень"
  REP_TXT.STAND_LV_LEVEL[6] = "6-й уровень"
  REP_TXT.STAND_LV_LEVEL[7] = "7-й уровень"
  REP_TXT.STAND_LV_LEVEL[8] = "8-й уровень"
  REP_TXT.STAND_LV_LEVEL[9] = "9-й уровень"
  REP_TXT.STAND_LV_LEVEL[10] = "10-й уровень"
  REP_TXT.STAND_LV_LEVEL[11] = "11-й уровень"
  REP_TXT.STAND_LV_LEVEL[12] = "12-й уровень"
  REP_TXT.STAND_LV_LEVEL[13] = "13-й уровень"
  REP_TXT.STAND_LV_LEVEL[14] = "14-й уровень"
  REP_TXT.STAND_LV_LEVEL[15] = "15-й уровень"
  REP_TXT.STAND_LV_LEVEL[16] = "16-й уровень"
  REP_TXT.STAND_LV_LEVEL[17] = "17-й уровень"
  REP_TXT.STAND_LV_LEVEL[18] = "18-й уровень"
  REP_TXT.STAND_LV_LEVEL[19] = "19-й уровень"
  REP_TXT.STAND_LV_LEVEL[20] = "20-й уровень"
  REP_TXT.STAND_LV_LEVEL[21] = "21-й уровень"
  REP_TXT.STAND_LV_LEVEL[22] = "22-й уровень"
  REP_TXT.STAND_LV_LEVEL[23] = "23-й уровень"
  REP_TXT.STAND_LV_LEVEL[24] = "24-й уровень"
  REP_TXT.STAND_LV_LEVEL[25] = "25-й уровень"
  REP_TXT.STAND_LV_LEVEL[26] = "26-й уровень"
  REP_TXT.STAND_LV_LEVEL[27] = "27-й уровень"
  REP_TXT.STAND_LV_LEVEL[28] = "28-й уровень"
  REP_TXT.STAND_LV_LEVEL[29] = "29-й уровень"
  REP_TXT.STAND_LV_LEVEL[30] = "30-й уровень"
  REP_TXT.STAND_LV_LEVEL[31] = "31-й уровень"
  REP_TXT.STAND_LV_LEVEL[32] = "32-й уровень"
  REP_TXT.STAND_LV_LEVEL[33] = "33-й уровень"
  REP_TXT.STAND_LV_LEVEL[34] = "34-й уровень"
  REP_TXT.STAND_LV_LEVEL[35] = "35-й уровень"
  REP_TXT.STAND_LV_LEVEL[36] = "36-й уровень"
  REP_TXT.STAND_LV_LEVEL[37] = "37-й уровень"
  REP_TXT.STAND_LV_LEVEL[38] = "38-й уровень"
  REP_TXT.STAND_LV_LEVEL[39] = "39-й уровень"
  REP_TXT.STAND_LV_LEVEL[40] = "40-й уровень"
  REP_TXT.STAND_LV_LEVEL[41] = "41-й уровень"
  REP_TXT.STAND_LV_LEVEL[42] = "42-й уровень"
  REP_TXT.STAND_LV_LEVEL[43] = "43-й уровень"
  REP_TXT.STAND_LV_LEVEL[44] = "44-й уровень"
  REP_TXT.STAND_LV_LEVEL[45] = "45-й уровень"
  REP_TXT.STAND_LV_LEVEL[46] = "46-й уровень"
  REP_TXT.STAND_LV_LEVEL[47] = "47-й уровень"
  REP_TXT.STAND_LV_LEVEL[48] = "48-й уровень"
  REP_TXT.STAND_LV_LEVEL[49] = "49-й уровень"
  REP_TXT.STAND_LV_LEVEL[50] = "50-й уровень"
  REP_TXT.STAND_LV_LEVEL[51] = "51-й уровень"
  REP_TXT.STAND_LV_LEVEL[52] = "52-й уровень"
  REP_TXT.STAND_LV_LEVEL[53] = "53-й уровень"
  REP_TXT.STAND_LV_LEVEL[54] = "54-й уровень"
  REP_TXT.STAND_LV_LEVEL[55] = "55-й уровень"
  REP_TXT.STAND_LV_LEVEL[56] = "56-й уровень"
  REP_TXT.STAND_LV_LEVEL[57] = "57-й уровень"
  REP_TXT.STAND_LV_LEVEL[58] = "58-й уровень"
  REP_TXT.STAND_LV_LEVEL[59] = "59-й уровень"
  REP_TXT.STAND_LV_LEVEL[60] = "60-й уровень"
  REP_TXT.STAND_LV_LEVEL[61] = "61-й уровень"
  REP_TXT.STAND_LV_LEVEL[62] = "62-й уровень"
  REP_TXT.STAND_LV_LEVEL[63] = "63-й уровень"
  REP_TXT.STAND_LV_LEVEL[64] = "64-й уровень"
  REP_TXT.STAND_LV_LEVEL[65] = "65-й уровень"
  REP_TXT.STAND_LV_LEVEL[66] = "66-й уровень"
  REP_TXT.STAND_LV_LEVEL[67] = "67-й уровень"
  REP_TXT.STAND_LV_LEVEL[68] = "68-й уровень"
  REP_TXT.STAND_LV_LEVEL[69] = "69-й уровень"
  REP_TXT.STAND_LV_LEVEL[70] = "70-й уровень"
  REP_TXT.STAND_LV_LEVEL[71] = "71-й уровень"
  REP_TXT.STAND_LV_LEVEL[72] = "72-й уровень"
  REP_TXT.STAND_LV_LEVEL[73] = "73-й уровень"
  REP_TXT.STAND_LV_LEVEL[74] = "74-й уровень"
  REP_TXT.STAND_LV_LEVEL[75] = "75-й уровень"
  REP_TXT.STAND_LV_LEVEL[76] = "76-й уровень"
  REP_TXT.STAND_LV_LEVEL[77] = "77-й уровень"
  REP_TXT.STAND_LV_LEVEL[78] = "78-й уровень"
  REP_TXT.STAND_LV_LEVEL[79] = "79-й уровень"
  REP_TXT.STAND_LV_LEVEL[80] = "80-й уровень"
  REP_TXT.STAND_LV_LEVEL[81] = "81-й уровень"
  REP_TXT.STAND_LV_LEVEL[82] = "82-й уровень"
  REP_TXT.STAND_LV_LEVEL[83] = "83-й уровень"
  REP_TXT.STAND_LV_LEVEL[84] = "84-й уровень"
  REP_TXT.STAND_LV_LEVEL[85] = "85-й уровень"
  REP_TXT.STAND_LV_LEVEL[86] = "86-й уровень"
  REP_TXT.STAND_LV_LEVEL[87] = "87-й уровень"
  REP_TXT.STAND_LV_LEVEL[88] = "88-й уровень"
  REP_TXT.STAND_LV_LEVEL[89] = "89-й уровень"
  REP_TXT.STAND_LV_LEVEL[90] = "90-й уровень"
  REP_TXT.STAND_LV_LEVEL[91] = "91-й уровень"
  REP_TXT.STAND_LV_LEVEL[92] = "92-й уровень"
  REP_TXT.STAND_LV_LEVEL[93] = "93-й уровень"
  REP_TXT.STAND_LV_LEVEL[94] = "94-й уровень"
  REP_TXT.STAND_LV_LEVEL[95] = "95-й уровень"
  REP_TXT.STAND_LV_LEVEL[96] = "96-й уровень"
  REP_TXT.STAND_LV_LEVEL[97] = "97-й уровень"
  REP_TXT.STAND_LV_LEVEL[98] = "98-й уровень"
  REP_TXT.STAND_LV_LEVEL[99] = "99-й уровень"
  REP_TXT.STAND_LV_LEVEL[100] = "100-й уровень"
  ---------------------------
  -- Random Reputation stuff
  ---------------------------
  REP_TXT.syndicateMobs	= "All Syndicate members"

  -------------------------------------
  -- BFFLabels / Friendship factions --
  -------------------------------------
  -- BFF Labels placeholder
  REP_TXT.BFFLabels[0] = {} -- Незнакомец
  REP_TXT.BFFLabels[0][1] = "Знакомый"
  REP_TXT.BFFLabels[0][2] = "Приятель"
  REP_TXT.BFFLabels[0][3] = "Друг"
  REP_TXT.BFFLabels[0][4] = "Хороший друг"
  REP_TXT.BFFLabels[0][5] = "Лучший друг"
  ---- Fishing Masters placeholder
  REP_TXT.BFFFishingMastersLabels = {}
  REP_TXT.BFFFishingMastersLabels[1] = "Незнакомец"
  REP_TXT.BFFFishingMastersLabels[2] = "Знакомый"
  REP_TXT.BFFFishingMastersLabels[3] = "Приятель"
  REP_TXT.BFFFishingMastersLabels[4] = "Друг"
  REP_TXT.BFFFishingMastersLabels[5] = "Хороший друг"
  REP_TXT.BFFFishingMastersLabels[6] = "Лучший друг"
  ---- Barracks Bodyguards placeholder
  REP_TXT.BFFBarracksBodyguardsLabels = {}
  REP_TXT.BFFBarracksBodyguardsLabels[1] = "Телохранитель"
  REP_TXT.BFFBarracksBodyguardsLabels[2] = "Доверенный боец"
  REP_TXT.BFFBarracksBodyguardsLabels[3] = "Боевой товарищ"
  ---- The First Responders 1984
  REP_TXT.BFFLabels[1984] = {} -- Стажер
  REP_TXT.BFFLabels[1984][1] = "Невысокое положение"
  REP_TXT.BFFLabels[1984][2] = "Высокое положение"
  REP_TXT.BFFLabels[1984][3] = "Спасатель"
  ---- Corbyn 2100
  REP_TXT.BFFLabels[2100] = {} -- Незнакомец
  REP_TXT.BFFLabels[2100][1] = "Диковинка"
  REP_TXT.BFFLabels[2100][2] = "Нейтральные"
  REP_TXT.BFFLabels[2100][3] = REP_TXT.BFFFishingMastersLabels[4]
  REP_TXT.BFFLabels[2100][4] = "Отзывчивый друг"
  REP_TXT.BFFLabels[2100][5] = REP_TXT.BFFFishingMastersLabels[6]
  -- Chromie 2135
  REP_TXT.BFFLabels[2135] = {} -- Неофит
  REP_TXT.BFFLabels[2135][1] = "Временной ученик"
  REP_TXT.BFFLabels[2135][2] = "Путешественник во времени"
  REP_TXT.BFFLabels[2135][3] = "Хроно-друг"
  REP_TXT.BFFLabels[2135][4] = "Бронзовый союзник"
  REP_TXT.BFFLabels[2135][5] = "Исцелитель эпохи"
  REP_TXT.BFFLabels[2135][6] = "Повелитель времени"
  ---- Wrathion 2517
  REP_TXT.BFFLabels[2517] = {} -- Знакомый
  REP_TXT.BFFLabels[2517][1] = "Соратник"
  REP_TXT.BFFLabels[2517][2] = "Союзник"
  REP_TXT.BFFLabels[2517][3] = "Клык"
  REP_TXT.BFFLabels[2517][4] = "Друг"
  REP_TXT.BFFLabels[2517][5] = "Настоящий друг"
  ---- Sabellian 2518
  REP_TXT.BFFLabels[2518] = {} -- Знакомый
  REP_TXT.BFFLabels[2518][1] = "Соратник"
  REP_TXT.BFFLabels[2518][2] = "Союзник"
  REP_TXT.BFFLabels[2518][3] = "Клык"
  REP_TXT.BFFLabels[2518][4] = "Друг"
  REP_TXT.BFFLabels[2518][5] = "Настоящий друг"
  ---- Artisan's Consortium - Dragon Isles Branch 2544
  REP_TXT.BFFLabels[2544] = {} -- Равнодушие
  REP_TXT.BFFLabels[2544][1] = "Симпатия"
  REP_TXT.BFFLabels[2544][2] = "Расположение"
  REP_TXT.BFFLabels[2544][3] = "Признание"
  REP_TXT.BFFLabels[2544][4] = "Почитание"
  ---- Cobalt Assembly 2550
  REP_TXT.BFFLabels[2550] = {} -- Пусто
  REP_TXT.BFFLabels[2550][1] = "Низкий"
  REP_TXT.BFFLabels[2550][2] = "Средний"
  REP_TXT.BFFLabels[2550][3] = "Высокий"
  REP_TXT.BFFLabels[2550][4] = "Максимальный"
  ---- Soridormi 2553
  REP_TXT.BFFLabels[2553] = {} -- Аномалия
  REP_TXT.BFFLabels[2553][1] = "Будущий друг"
  REP_TXT.BFFLabels[2553][2] = "Устранитель порталов"
  REP_TXT.BFFLabels[2553][3] = "Путешественник во времени"
  REP_TXT.BFFLabels[2553][4] = "Легенда"
  ---- The Weaver 2601
  REP_TXT.BFFLabels[2601] = {} -- Незнакомец
  REP_TXT.BFFLabels[2601][1] = "Знакомый"
  REP_TXT.BFFLabels[2601][2] = "Помощник"
  REP_TXT.BFFLabels[2601][3] = "Подельник"
  REP_TXT.BFFLabels[2601][4] = "Компаньон"
  REP_TXT.BFFLabels[2601][5] = "Соратник"
  REP_TXT.BFFLabels[2601][6] = "Партнер"
  REP_TXT.BFFLabels[2601][7] = "Заговорщик"
  REP_TXT.BFFLabels[2601][8] = "Криминальный гений"
  ---- The General 2605
  REP_TXT.BFFLabels[2605] = {} -- Незнакомец
  REP_TXT.BFFLabels[2605][1] = "Знакомый"
  REP_TXT.BFFLabels[2605][2] = "Помощник"
  REP_TXT.BFFLabels[2605][3] = "Подельник"
  REP_TXT.BFFLabels[2605][4] = "Компаньон"
  REP_TXT.BFFLabels[2605][5] = "Соратник"
  REP_TXT.BFFLabels[2605][6] = "Партнер"
  REP_TXT.BFFLabels[2605][7] = "Заговорщик"
  REP_TXT.BFFLabels[2605][8] = "Криминальный гений"
  ---- The Vizier 2607
  REP_TXT.BFFLabels[2607] = {} -- Незнакомец
  REP_TXT.BFFLabels[2607][1] = "Знакомый"
  REP_TXT.BFFLabels[2607][2] = "Помощник"
  REP_TXT.BFFLabels[2607][3] = "Подельник"
  REP_TXT.BFFLabels[2607][4] = "Компаньон"
  REP_TXT.BFFLabels[2607][5] = "Соратник"
  REP_TXT.BFFLabels[2607][6] = "Партнер"
  REP_TXT.BFFLabels[2607][7] = "Заговорщик"
  REP_TXT.BFFLabels[2607][8] = "Криминальный гений"
  ---- Azerothian Archives 2615
  REP_TXT.BFFLabels[2615] = {} -- Академик
  REP_TXT.BFFLabels[2615][1] = "Ассистент"
  REP_TXT.BFFLabels[2615][2] = "Наемник"
  REP_TXT.BFFLabels[2615][3] = "Постоянный"
  REP_TXT.BFFLabels[2615][4] = "Штатный"

  ---------------------------
  -- Tooltips
  ---------------------------
  ---- Initialize
  REP_TXT.elements	= {}
  REP_TXT.elements.name	= {}
  REP_TXT.elements.tip	= {}
  ---- Names and tips
  REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
  REP_TXT.elements.tip.REP_OptionsButton	= "Открыть окно для настройки Reputations'а."
  REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
  REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "Если это поле не отмечено, то список фракций отображается в порядке по умолчанию, т.е. фракции группируются на логические группы, а внутри них по алфавиту. \\r\\nЕсли это поле отмечено, то список фракций сортируется по отношению с ними. \\r\\nЧтобы увидеть |cFFFAA0A0неактивные|r фракции, уберите отметку в этом поле и прокрутите до низа списка."
  REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
  REP_TXT.elements.tip.REP_ShowMobsButton	= "Нажмите кнопку, чтобы видеть мобов, за убийство которых растет репутация."
  REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
  REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "Нажмите кнопку, чтобы видеть квесты, за выполнение которых растет репутация."
  REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
  REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "Нажмите кнопку, чтобы видеть PvP квесты, за выполнение которых растет репутация."
  REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
  REP_TXT.elements.tip.REP_ShowItemsButton	= "Нажмите кнопку, чтобы видеть вещи, за сдачу которых растет репутация."
  REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
  REP_TXT.elements.tip.REP_ShowInstancesButton	= "Нажмите кнопку, чтобы видеть подземелья, за зачистку которых растет репутация."
  REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
  REP_TXT.elements.tip.REP_ShowGeneralButton	= "Отметьте это поле, чтобы увидеть общую информацию об увеличении репутации."
  REP_TXT.elements.name.REP_DetailShowAllButton	= REP_TXT.showAll
  REP_TXT.elements.tip.REP_DetailShowAllButton	= "Нажмите эту кнопку чтобы выбрать все 4 элемента.\r\nБудут показаны мобы, квесты, вещи и подземелья для выбранной фракции."
  REP_TXT.elements.name.REP_DetailShowNoneButton	= REP_TXT.showNone
  REP_TXT.elements.tip.REP_DetailShowNoneButton	= "Нажмите эту кнопку чтобы снять выделение с 4 элементов.\r\nВ результате ничего не будет показано. Неожиданно, да? ;-)."
  REP_TXT.elements.name.REP_DetailExpandButton	= REP_TXT.expand
  REP_TXT.elements.tip.REP_DetailExpandButton	= "Нажмите тут, чтобы развернуть все квесты. Будут показаны необходимые для квеста вещи."
  REP_TXT.elements.name.REP_DetailCollapseButton	= REP_TXT.collapse
  REP_TXT.elements.tip.REP_DetailCollapseButton	= "Нажмите тут, чтобы свернуть все квесты. Угадайте что произойдет. :-)"
  REP_TXT.elements.name.REP_DetailSupressNoneFactionButton	= REP_TXT.supressNoneFaction
  REP_TXT.elements.tip.REP_DetailSupressNoneFactionButton	= "Нажмите эту кнопку, чтобы вернуть все квесты этой фракции, которые Вы исключили из списка."
  REP_TXT.elements.name.REP_DetailSupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
  REP_TXT.elements.tip.REP_DetailSupressNoneGlobalButton	= "Нажмите эту кнопку, чтобы вернуть все квесты для всех фракций, которые Вы исключили из списка."
  REP_TXT.elements.name.REP_DetailClearSessionGainButton	= REP_TXT.clearSessionGain
  REP_TXT.elements.tip.REP_DetailClearSessionGainButton	= "Нажмите эту кнопку, чтобы сбросить счетчик полученной репутации за эту сессию."
  REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
  REP_TXT.elements.tip.REP_EnableMissingBox	= "Включение этого параметра позволит смотреть недостающую репутацию в окне репутации"
  REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
  REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Включение этого параметра позволит смотреть детальную информацию по выбранной фракции.\r\nВ окне будут показаны рекомендуемые квесты, мобы, шмотки и прочая полезная информация"
  REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
  REP_TXT.elements.tip.REP_GainToChatBox	= "Включение этого параметра будет показывать полный список фракций с которыми повысилась репутация.\r\nЭто отличается от стандартного уведомления тем, что будет показана не только основная фракция."
  REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
  REP_TXT.elements.tip.REP_NoGuildGainBox	= "Включите эту опцию, чтобы не получать сообщения о повышении репутации гильдии."
  REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
  REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "Включение этого параметра позволит не отображать стандартные сообщени о росте репутации.\r\nИмеет смысл включать, если включен предыдущий пункт."
  REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
  REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "Включите этот параметр, чтобы показать репутацию, которую можно получить путем сдачи предметов и завершения уже сделанных квестов, в качестве серой полоски поверх обычной полосы репутации в окне репутации."
  REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
  REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "Включите этот параметр для автоматического переключения фракции, за которой вы следите с помощью полосы репутации, на последнюю фракцию, с которой вы приобрели репутацию."
  REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
  REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "Включите этот параметр, чтобы не переключать полосу репутации при получении репутации с гильдией."
  REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
  REP_TXT.elements.tip.REP_SilentSwitchBox	= "Включите этот параметр, чтобы полоса репутации переключалась без сообщения в чат."
  REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
  REP_TXT.elements.name.REP_ChatFrameSlider	= "Вкладка чата"
  REP_TXT.elements.tip.REP_ChatFrameSlider	= "Выберите, в какой вкладке чата Reputations печатает свои сообщения"
  REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
  REP_TXT.elements.tip.REP_EnableParagonBarBox  = "Включите эту опцию, чтобы отображать текущий прогресс совершенства на полосах репутации."
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
  REP_TXT.settings.buffTitle = "Увеличение репутации"
  REP_TXT.settings.buffSubTitle = "Вы можете переключать эти усиления репутации, чтобы увидеть, сколько репутации вы получите от различных действий. Усиления, которые не суммируются, будут отключены при переключении их аналогов."
  ---- Buffs
  REP_TXT.settings.harvestBountyRepBuff = "Дух пиршества (Пиршество странников)"
  REP_TXT.settings.info.harvestBountyRepBuff = "Увеличивает объем получаемой репутации на 10% на 1 час."
  REP_TXT.settings.wickermanRepBuff = "Призывание Ивового человека (Тыквовин Конец)"
  REP_TXT.settings.info.wickermanRepBuff = "Ускоряет восполнение здоровья и маны на 25% и повышает выносливость на 25% на 2 hrs."
  REP_TXT.settings.wickermanRepBuffUnburdened = "Очищение (Тыквовин Конец)"
  REP_TXT.settings.info.wickermanRepBuffUnburdened = "Все ваши заботы сгорели вместе с Плетеным человеком. Количество получаемого опыта и репутации увеличено на 10%. Время действия – 2 hrs."
  REP_TXT.settings.wickermanRepBuffGrimVisage = "Маска из золы (Тыквовин Конец)"
  REP_TXT.settings.info.wickermanRepBuffGrimVisage = "Вы разрисовали лицо пеплом плетеного человека. Получаемые опыт и репутация увеличены на 10% на 2 hrs."
  REP_TXT.settings.MrPopularityRankOne = "Вы – звезда! (гильдейские бонусы, Уровень 1)"
  REP_TXT.settings.info.MrPopularityRankOne = "Репутация, получаемая за убийство монстров и выполнение заданий, повышается на 5%."
  REP_TXT.settings.MrPopularityRankTwo = "Вы – звезда! (гильдейские бонусы, Уровень 2)"
  REP_TXT.settings.info.MrPopularityRankTwo = "Репутация, получаемая за убийство монстров и выполнение заданий, повышается на 10%."
  REP_TXT.settings.DarkmoonFaireWeeRepBuff = "ВУХУУУ! (Ярмарка Новолуния)"
  REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "Вы прокатились на карусели ярмарки Новолуния или на горках. Количество получаемых очков опыта и репутации увеличено на 10%."
  REP_TXT.settings.DarkmoonFaireHatRep = "Цилиндр Новолуния (Ярмарка Новолуния)"
  REP_TXT.settings.info.DarkmoonFaireHatRep = "Количество получаемых очков опыта и репутации увеличено на 10% на 1 hour. Расходуемый предмет."
  REP_TXT.settings.ShowBonusGainsInChat = "Show bonus reputation in chat"
  REP_TXT.settings.info.ShowBonusGainsInChat = "Show bonus reputation from commendations in chat when reputation is gained."
  ---------------------------
  -- Characters tab settings
  ---------------------------
  REP_TXT.settings.characterTabSubTitle = "You can either reset or delete one of your character's addon settings from the list below."
end
