-- Русский (Russian)
--------------------	--------------------
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
REP_TXT_STAND_LV	= {}
REP_TXT_STAND_LV[0]	= "Неизвестно"
REP_TXT_STAND_LV[1]	= "Ненависть"
REP_TXT_STAND_LV[2]	= "Враждебность"
REP_TXT_STAND_LV[3]	= "недружественный"
REP_TXT_STAND_LV[4]	= "Равнодушие"
REP_TXT_STAND_LV[5]	= "Дружелюбие"
REP_TXT_STAND_LV[6]	= "Уважение"
REP_TXT_STAND_LV[7]	= "Почтение"
REP_TXT_STAND_LV[8]	= "Превознесение"
REP_TXT_STAND_LV[9] = "Парагон"
REP_TXT_STAND_LV_TIER	= {}
REP_TXT_STAND_LV_TIER[0]	= "Неизвестно"
REP_TXT_STAND_LV_TIER[1] = "1-й уровень"
REP_TXT_STAND_LV_TIER[2] = "2-й уровень"
REP_TXT_STAND_LV_TIER[3] = "3-й уровень"
REP_TXT_STAND_LV_TIER[4] = "4-й уровень"
REP_TXT_STAND_LV_TIER[5] = "5-й уровень"
REP_TXT_STAND_LV_TIER[6] = "6-й уровень"
REP_TXT_STAND_LV_TRUST	= {}
REP_TXT_STAND_LV_TRUST[0] = "Неизвестно"
REP_TXT_STAND_LV_TRUST[1] = "Сомнения"
REP_TXT_STAND_LV_TRUST[2] = "Опасения"
REP_TXT_STAND_LV_TRUST[3] = "Настороженность"
REP_TXT_STAND_LV_TRUST[4] = "Безразличие"
REP_TXT_STAND_LV_TRUST[5] = "Сердечность"
REP_TXT_STAND_LV_TRUST[6] = "Признание"

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
-- Tooltip
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}

REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "Открыть окно для настройки Reputations'а."
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "Если это поле не отмечено, то список фракций отображается в порядке по умолчанию, т.е. фракции группируются на логические группы, а внутри них по алфавиту. \\r\\nЕсли это поле отмечено, то список фракций сортируется по отношению с ними. \\r\\nЧтобы увидеть |cFFFAA0A0неактивные|r фракции, уберите отметку в этом поле и прокрутите до низа списка."

REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "Нажмите кнопку, чтобы видеть мобов, за убийство которых растет репутация."
REP_TXT.elements.name.REP_ShowQuestButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowQuestButton	= "Нажмите кнопку, чтобы видеть квесты, за выполнение которых растет репутация."
REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
REP_TXT.elements.tip.REP_ShowItemsButton	= "Нажмите кнопку, чтобы видеть вещи, за сдачу которых растет репутация."
REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
REP_TXT.elements.tip.REP_ShowInstancesButton	= "Нажмите кнопку, чтобы видеть подземелья, за зачистку которых растет репутация."
REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
REP_TXT.elements.tip.REP_ShowGeneralButton	= "Отметьте это поле, чтобы увидеть общую информацию об увеличении репутации."

REP_TXT.elements.name.REP_ShowAllButton	= REP_TXT.showAll
REP_TXT.elements.tip.REP_ShowAllButton	= "Нажмите эту кнопку чтобы выбрать все 4 элемента.\r\nБудут показаны мобы, квесты, вещи и подземелья для выбранной фракции."
REP_TXT.elements.name.REP_ShowNoneButton	= REP_TXT.showNone
REP_TXT.elements.tip.REP_ShowNoneButton	= "Нажмите эту кнопку чтобы снять выделение с 4 элементов.\r\nВ результате ничего не будет показано. Неожиданно, да? ;-)."

REP_TXT.elements.name.REP_ExpandButton	= REP_TXT.expand
REP_TXT.elements.tip.REP_ExpandButton	= "Нажмите тут, чтобы развернуть все квесты. Будут показаны необходимые для квеста вещи."
REP_TXT.elements.name.REP_CollapseButton	= REP_TXT.collapse
REP_TXT.elements.tip.REP_CollapseButton	= "Нажмите тут, чтобы свернуть все квесты. Угадайте что произойдет. :-)"
REP_TXT.elements.name.REP_SupressNoneFactionButton	= REP_TXT.supressNoneFaction
REP_TXT.elements.tip.REP_SupressNoneFactionButton	= "Нажмите эту кнопку, чтобы вернуть все квесты этой фракции, которые Вы исключили из списка."
REP_TXT.elements.name.REP_SupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
REP_TXT.elements.tip.REP_SupressNoneGlobalButton	= "Нажмите эту кнопку, чтобы вернуть все квесты для всех фракций, которые Вы исключили из списка."
REP_TXT.elements.name.REP_ClearSessionGainButton	= REP_TXT.clearSessionGain
REP_TXT.elements.tip.REP_ClearSessionGainButton	= "Нажмите эту кнопку, чтобы сбросить счетчик полученной репутации за эту сессию."

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
