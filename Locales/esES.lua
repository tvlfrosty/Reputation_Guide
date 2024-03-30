-- Español (Spanish)
--------------------	--------------------
if (GetLocale() =="esES" or GetLocale() =="esMX") then

-- Binding names
BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
BINDING_NAME_SHOWCONFIG	= "Las opciones de Mostrar ventana"
BINDING_NAME_SHOWDETAILS	= "Mostrar ventana reputación detalle"

REP_TXT	= {}
REP_TXT.Mob = {}
-- help
REP_TXT.help	= "Una herramienta para gestionar tu reputación"
REP_TXT.command	= "No se pudo analizar comando"
REP_TXT.usage	= "Uso"
REP_TXT.helphelp	= "Mostrar este texto de ayuda"
REP_TXT.helpabout	= "Mostrar información sobre el autor"
REP_TXT.helpstatus	= "Mostrar el estado de configuración"
-- about
REP_TXT.by	= "por"
REP_TXT.version	= "Versión"
REP_TXT.date	= "fecha"
REP_TXT.web	= "sitio web"
REP_TXT.slash	= "comando slash"
-- status
REP_TXT.status	= "estado"
REP_TXT.disabled	= "deshabilitado"
REP_TXT.enabled	= "habilitado"
REP_TXT.statMobs	= "Mostrar mobs [M]"
REP_TXT.statQuests	= "Mostrar misiones [Q]"
REP_TXT.statInstances	= "Mostrar instancias [D]"
REP_TXT.statItems	= "Mostrar objetos [I]"
REP_TXT.statGeneral	= "Mostrar general [G]"
REP_TXT.statMissing	= "Mostrar reputación faltante"
REP_TXT.statDetails	= "Mostrar detalles extendidos"
REP_TXT.statChat	= "Mensajes de chat detallados"
REP_TXT.statNoGuildChat	= "Ocultar reputación de Hermandad"
REP_TXT.statSuppress	= "Ocultar mensajes de chat de Blizzard"
REP_TXT.statPreview	= "Mostrar vista previa en el marco rep reputación"
REP_TXT.statSwitch	= "Cambiar automáticamente la barra de reputación"
REP_TXT.statNoGuildSwitch	= "No cambiar la barra con la reputación de hermandad"
REP_TXT.statSilentSwitch	= "Ocultar mensaje al cambiar la barra de reputación"
REP_TXT.statGuildCap	= "Mostrar tapón gremio reputación en el chat"
-- XML UI elements
REP_TXT.showQuests	= "Mostrar misiones"
REP_TXT.showPvPQuests	= "PvP misiones"
REP_TXT.showInstances	= "Mostrar instancias"
REP_TXT.showMobs	= "Mostrar mobs"
REP_TXT.showItems	= "Mostrar objetos"
REP_TXT.showGeneral	= "Mostrar general"
REP_TXT.showAll	= "Mostrar todo"
REP_TXT.showNone	= "Ocultar todo"
REP_TXT.expand	= "Expandir"
REP_TXT.collapse	= "Colapsar"
REP_TXT.supressNoneFaction	= "Restablecer excluidos de esta facción"
REP_TXT.supressNoneGlobal	= "Restablecer todos los excluidos"
REP_TXT.suppressHint	= "Click derecho para excluir un elemento"
REP_TXT.clearSessionGain	= "Reiniciar contador de sesión"
-- options dialog
REP_TXT.showMissing	= "Mostrar reputación faltante en el marco de reputación"
REP_TXT.extendDetails	= "Mostrar reputación detallada en la ventana"
REP_TXT.gainToChat	= "Mensajes de chat detallados"
REP_TXT.noGuildGain	= "Ocultar reputación de Hermandad"
REP_TXT.suppressOriginalGain	= "Ocultar mensajes de chat de Blizzard"
REP_TXT.showPreviewRep	= "Mostrar reputación que pueden ser entregados en el marco de la reputación"
REP_TXT.switchFactionBar	= "Cambiar automáticamente la barra de reputación"
REP_TXT.noGuildSwitch	= "No cambiar la barra con la reputación de hermandad"
REP_TXT.silentSwitch	= "Ocultar mensaje al cambiar la barra de reputación"
REP_TXT.guildCap	= "Mostrar tapón gremio reputación en el chat"
REP_TXT.defaultChatFrame	= "Usar marco de chat predeterminado"
REP_TXT.chatFrame	= "Usando marco del chat %d (%s)"
REP_TXT.usingDefaultChatFrame	= "Ahora, utilizando el marco de chat predeterminado"
REP_TXT.usingChatFrame	= "Ahora, utilizando marco de chat"
REP_TXT.EnableParagonBar = "Mostrar el Paragon en barras"
-- various LUA
REP_TXT.options	= "Opciones"
REP_TXT.orderByStanding	= "Ordenar por nivel"
REP_TXT.lookup	= "Mirando facción"
REP_TXT.allFactions	= "Listado de todas las facciones"
REP_TXT.missing	= "(siguiente)"
REP_TXT.missing2	= "que falta"
REP_TXT.heroic	= "heroico"
REP_TXT.normal	= "normal"
REP_TXT.switchBar	= "Cambiar barra de reputación"
-- REP_ShowFactions
REP_TXT.faction	= "Facción"
REP_TXT.is	= "es"
REP_TXT.withStanding	= "con reputación"
REP_TXT.needed	= "necesario"
REP_TXT.mob	= "[mob]"
REP_TXT.limited	= "esta limitado a"
REP_TXT.limitedPl	= "estan limitados a"
REP_TXT.quest	= "[Misión]"
REP_TXT.instance	= "[Instancia]"
REP_TXT.items	= "[Objeto]"
REP_TXT.unknown	= "desconocido para el personaje"
-- mob Details
REP_TXT.tmob	= "Todos los jefes"
REP_TXT.oboss	= "Otros jefes"
REP_TXT.aboss	= "Todos los jefes"
REP_TXT.pboss	= "Por Fundador"
REP_TXT.fclear	= "completas"
REP_TXT.AU	= "Cualquier mob sin nombre"
REP_TXT.AN	= "Cualquier mob nombrado"
REP_TXT.BB	= "Bucaneros Velasangre"
REP_TXT.SSP	= "Pirata de los Mares del Sur"
REP_TXT.Wa	= "Vagayermo"
REP_TXT.VCm	= "Cualquier mob Ventura y Cía."
REP_TXT.Mob.MoshOgg_Spellcrafter = "Creaconjuros Mosh'Ogg"
REP_TXT.Mob.BoulderfistOgre = "Ogro Puño de Roca"
-- Quest Details
REP_TXT.cdq	= "Ciudad principal: misiones diarias de cocina"
REP_TXT.coq	= "Otra ciudad: misiones diarias de cocina"
REP_TXT.fdq	= "Ciudad principal: misiones diarias de pesca"
REP_TXT.foq	= "Otra ciudad: misiones diarias de pesca"
REP_TXT.ndq	= "Sin misiones diarias"
REP_TXT.deleted	= "anticuado"
REP_TXT.Championing	= "Defender (Tabardo)"
REP_TXT.bpqfg	= "Por ciento de ganancia facción búsqueda"

-- items Details
REP_TXT.cbadge	= "Distintivo de mención de Otra ciudad"
-- instance Details
REP_TXT.srfd	= "Spillover representante de mazmorras"
REP_TXT.tbd	= "ToBe Done"
REP_TXT.nci	= "Cualquier mob basura (normal)"
REP_TXT.hci	= "Cualquier mob basura (heroico)"
-- ToBeDone general
REP_TXT.tfr	= "Recolectar cualquier cultivo de la granja"
REP_TXT.nswts	= ""
REP_TXT.mnd	= "Número máximo de misiones diarias"
REP_TXT.mnds	= "El número máximo de diarias es"





-- ReputationDetails
REP_TXT.currentRep	= "Reputación actual"
REP_TXT.neededRep	= "Reputación necesaria"
REP_TXT.missingRep	= "Reputación faltante"
REP_TXT.repInBag	= "Reputación en bolsa"
REP_TXT.repInBagBank	= "Reputación en bolsa y banco"
REP_TXT.repInQuest	= "Reputación en misiones"
REP_TXT.factionGained	= "Ganado esta sesión"
REP_TXT.noInfo	= "No hay información sobre esta reputación y/o facción"
REP_TXT.toExalted	= "Reputación para exaltado"
REP_TXT.toBestFriend = "Reputación para Mejor amigo"
-- to chat
REP_TXT.stats	= " (Total: %s%d, Falta: %d)"
REP_TXT.statsNextStanding = " (Total: %s%d, Left to %s: %d)"

-- config changed
REP_TXT.configQuestion	= "Por favor compruebe los ajustes de Reputations."
REP_TXT.showConfig	= "Ir a Ajustes"
REP_TXT.later	= "Más tarde"
-- UpdateList
REP_TXT.mobShort	= "[M]"
REP_TXT.questShort	= "[Q]"
REP_TXT.instanceShort	= "[D]"
REP_TXT.itemsShort	= "[I]"
REP_TXT.generalShort	= "[G]"
REP_TXT.mobHead	= "Gana reputación matando este mob"
REP_TXT.questHead	= "Gana reputación finalizando esta misión"
REP_TXT.instanceHead	= "Gana reputación haciendo esta instancia"
REP_TXT.itemsHead	= "Gana reputación entregando este objeto"
REP_TXT.generalHead	= "Información para ganar reputación"
REP_TXT.mobTip	= "Cada vez que mata este mob, gana reputación. Matarlo las veces suficientes le ayudara a alcanzar el siguiente nivel."
REP_TXT.questTip	= "Cada vez que completa esta misión diaria o repetible, gana reputación. Completarla las veces suficientes le ayudara a alcanzar el siguiente nivel."
REP_TXT.instanceTip	= "Cada vez que completa esta instancia, gana reputación. Completarla las veces suficientes le ayudara a alcanzar el siguiente nivel."
REP_TXT.itemsName	= "Entregar objetos"
REP_TXT.itemsTip	= "Cada vez que entrega este objeto, gana reputación. Entregarlo las veces suficientes le ayudara a alcanzar el siguiente nivel."
REP_TXT.generalTip	= "Esta facción no necesariamente sube reputación con metodos repetibles."
REP_TXT.allOfTheAbove	= "Resumen de las %d misiones listadas"
REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
REP_TXT.questSummaryTip	= "Este es un resumen de todas las misiones listadas.\r\nThis is useful assuming that all the quests listed are daily quests, as this will show you how many days it will take you to reach the next reputation level if you do all the daily quests each day."
REP_TXT.complete	= "completo"
REP_TXT.active	= "activo"
REP_TXT.inBag	= "En bolsa:"
REP_TXT.turnIns	= "Entregas:"
REP_TXT.reputation	= "Reputación:"
REP_TXT.reputationCap	= "Limite de reputación:"
REP_TXT.reputationCapCurrent	= "Reputación actual:"
REP_TXT.inBagBank	= "En bolsa y banco"
REP_TXT.questCompleted	= "Misión completada"
REP_TXT.timesToDo	= "Veces por hacer:"
REP_TXT.instance2	= "Instancia:"
REP_TXT.mode	= "Modo:"
REP_TXT.timesToRun	= "Veces por hacer:"
REP_TXT.mob2	= "Mob:"
REP_TXT.location	= "Localización:"
REP_TXT.toDo	= "Por hacer:"
REP_TXT.quest2	= "Misión:"
REP_TXT.itemsRequired	= "Objetos necesarios"
REP_TXT.general2	= "General:"
REP_TXT.maxStanding	= "Da reputación hasta"
-- skills
REP_TXT.skillHerb	= "Herboristería"
REP_TXT.skillMine	= "Minería"
REP_TXT.skillSkin	= "Desuello"
REP_TXT.skillAlch	= "Alquimia"
REP_TXT.skillBlack	= "Herrería"
REP_TXT.skillEnch	= "Encantamiento"
REP_TXT.skillEngi	= "Ingeniería"
REP_TXT.skillIncrip	= "Inscripción"
REP_TXT.skillJewel	= "Joyería"
REP_TXT.skillLeath	= "Peletería"
REP_TXT.skillTail	= "Sastrería"
REP_TXT.skillAid	= "Primeros auxilios"
REP_TXT.skillArch	= "Arqueología"
REP_TXT.skillCook	= "Cocina"
REP_TXT.skillFish	= "Pesca"
---------------------------
-- Reputation Standing
---------------------------
---- Initialize
REP_TXT.STAND_LV	= {}
REP_TXT.STAND_LV_TIER	= {}
REP_TXT.STAND_LV_TRUST	= {}
REP_TXT.STAND_LV_RENOWN	= {}
---- Normal standings
REP_TXT.STAND_LV[0]	= "Desconocido"
REP_TXT.STAND_LV[1]	= "Odiado"
REP_TXT.STAND_LV[2]	= "Hostil"
REP_TXT.STAND_LV[3]	= "Antipático"
REP_TXT.STAND_LV[4]	= "Neutral"
REP_TXT.STAND_LV[5]	= "Amistoso"
REP_TXT.STAND_LV[6]	= "Honorable"
REP_TXT.STAND_LV[7]	= "Venerado"
REP_TXT.STAND_LV[8]	= "Exaltado"
REP_TXT.STAND_LV[9] = "Paragón"
---- Tier standings
REP_TXT.STAND_LV_TIER[0] = "Desconocido"
REP_TXT.STAND_LV_TIER[1] = "Nivel 1"
REP_TXT.STAND_LV_TIER[2] = "Nivel 2"
REP_TXT.STAND_LV_TIER[3] = "Nivel 3"
REP_TXT.STAND_LV_TIER[4] = "Nivel 4"
REP_TXT.STAND_LV_TIER[5] = "Nivel 5"
REP_TXT.STAND_LV_TIER[6] = "Nivel 6"
---- Trust standings
REP_TXT.STAND_LV_TRUST[0] = "Desconocido"
REP_TXT.STAND_LV_TRUST[1] = "Dubitativa"
REP_TXT.STAND_LV_TRUST[2] = "Aprensiva"
REP_TXT.STAND_LV_TRUST[3] = "Indecisa"
REP_TXT.STAND_LV_TRUST[4] = "Ambivalente"
REP_TXT.STAND_LV_TRUST[5] = "Cordial"
REP_TXT.STAND_LV_TRUST[6] = "Agradecida"
---- Renown standings
REP_TXT.STAND_LV_RENOWN[0] = "Desconocido"
REP_TXT.STAND_LV_RENOWN[1] = "Renombre 1"
REP_TXT.STAND_LV_RENOWN[2] = "Renombre 2"
REP_TXT.STAND_LV_RENOWN[3] = "Renombre 3"
REP_TXT.STAND_LV_RENOWN[4] = "Renombre 4"
REP_TXT.STAND_LV_RENOWN[5] = "Renombre 5"
REP_TXT.STAND_LV_RENOWN[6] = "Renombre 6"
REP_TXT.STAND_LV_RENOWN[7] = "Renombre 7"
REP_TXT.STAND_LV_RENOWN[8] = "Renombre 8"
REP_TXT.STAND_LV_RENOWN[9] = "Renombre 9"
REP_TXT.STAND_LV_RENOWN[10] = "Renombre 10"
REP_TXT.STAND_LV_RENOWN[11] = "Renombre 11"
REP_TXT.STAND_LV_RENOWN[12] = "Renombre 12"
REP_TXT.STAND_LV_RENOWN[13] = "Renombre 13"
REP_TXT.STAND_LV_RENOWN[14] = "Renombre 14"
REP_TXT.STAND_LV_RENOWN[15] = "Renombre 15"
REP_TXT.STAND_LV_RENOWN[16] = "Renombre 16"
REP_TXT.STAND_LV_RENOWN[17] = "Renombre 17"
REP_TXT.STAND_LV_RENOWN[18] = "Renombre 18"
REP_TXT.STAND_LV_RENOWN[19] = "Renombre 19"
REP_TXT.STAND_LV_RENOWN[20] = "Renombre 20"
REP_TXT.STAND_LV_RENOWN[21] = "Renombre 21"
REP_TXT.STAND_LV_RENOWN[22] = "Renombre 22"
REP_TXT.STAND_LV_RENOWN[23] = "Renombre 23"
REP_TXT.STAND_LV_RENOWN[24] = "Renombre 24"
REP_TXT.STAND_LV_RENOWN[25] = "Renombre 25"
---------------------------
-- Tooltips
---------------------------
---- Initialize
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}
---- Names and tips
REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "Abrir la ventana de configuración."
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "Si esta casilla no está marcada, la lista facción se muestra mediante la clasificación por defecto de Blizzard, agrupados por orden lógico y alfabético. \r\n\r\n Si se marca esta casilla, la lista se ordena las reputaciones por nivel. \r\n\r\n Para ver las reputaciones inactivas, desactive esta casilla y vaya a la parte inferior de la lista."
REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "Marque este botón para ver los mobs que se pueden matar para mejorar su reputación."
REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "Marque este botón para ver las misiones que se pueden hacer para mejorar su reputación."
REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "Marque este botón para ver las PvP misiones que se pueden hacer para mejorar su reputación."
REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
REP_TXT.elements.tip.REP_ShowItemsButton	= "Marque este botón para ver los objetos que se pueden entregar para mejorar su reputación."
REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
REP_TXT.elements.tip.REP_ShowInstancesButton	= "Marque este botón para ver las instancias que puede ejecutar para mejorar su reputación."
REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
REP_TXT.elements.tip.REP_ShowGeneralButton	= "Marque este botón para ver la información general sobre la mejora de su reputación."
REP_TXT.elements.name.REP_ShowAllButton	= REP_TXT.showAll
REP_TXT.elements.tip.REP_ShowAllButton	= "Pulse este botón para restablecer las cuatro casillas de la izquierda. \r\nEsto mostrará mobs, misiones, objetos e instancias que le den reputación de la facción seleccionada."
REP_TXT.elements.name.REP_ShowNoneButton	= REP_TXT.showNone
REP_TXT.elements.tip.REP_ShowNoneButton	= "Pulse este botón para desmarcar la selección de las cuatro casillas de la izquierda. \r\nEsto ocultara mobs, misiones, objetos e instancias que le den reputación de la facción seleccionada."
REP_TXT.elements.name.REP_ExpandButton	= REP_TXT.expand
REP_TXT.elements.tip.REP_ExpandButton	= "Pulse este botón para expandir todas las entradas de la lista."
REP_TXT.elements.name.REP_CollapseButton	= REP_TXT.collapse
REP_TXT.elements.tip.REP_CollapseButton	= "Pulse este botón para colapsar todas las entradas de la lista."
REP_TXT.elements.name.REP_SupressNoneFactionButton	= REP_TXT.supressNoneFaction
REP_TXT.elements.tip.REP_SupressNoneFactionButton	= "Pulse este botón para restablecer todos los elementos excluidos de esta facción."
REP_TXT.elements.name.REP_SupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
REP_TXT.elements.tip.REP_SupressNoneGlobalButton	= "Pulse este botón para restablecer todos los elementos excluidos de todas las facciones."
REP_TXT.elements.name.REP_ClearSessionGainButton	= REP_TXT.clearSessionGain
REP_TXT.elements.tip.REP_ClearSessionGainButton	= "Pulse este botón para reiniciar el contador de reputación de esta sesión."
REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
REP_TXT.elements.tip.REP_EnableMissingBox	= "Esta opción añade entre parentesis la reputación faltante para el siguiente nivel en la ventana de reputación.u"
REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Active esta opción para mostrar un cuadro detalle reputación extendida. \r\nEn Además, la información que se muestra en el cuadro detalle original, esto mostrará la reputación faltante necesaria para alcanzar el siguiente nivel de reputación y una lista de maneras de ganar esta reputación mediante anuncio quests , las multitudes, los elementos e instancias que producen reputación de la facción elegida."
REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
REP_TXT.elements.tip.REP_GainToChatBox	= "Enable this setting to display reputation gained for all factions whenever you gain reputation.\r\nThis differs from the standard way of reporting reputation gain, as normally, only the gain with the main faction is listed."
REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
REP_TXT.elements.tip.REP_NoGuildGainBox	= "Al marcar esta casilla se desactivara los mensajes de chat de la reputación de hermandad."
REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "Enable this setting to suppress the standard reputation gain messages.\r\nThis makes sense if you have enabled the detailed faction gain messages, so you don't get identical listings from the standard and extended versions."
REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "Enable this setting to show the reputation you can gain by handing in items and completed quests as a grey bar overlaid over the normal reputation bar in the reputation frame."
REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "Enable this setting to automatically switch the faction being watched to the last faction whom you have gained reputation for."
REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "Active esta opción para no cambiar la facción observó por ganancias de reputación del clan."
REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
REP_TXT.elements.tip.REP_SilentSwitchBox	= "Active esta opción para cambiar la barra de reputación silenciosamente (sin mensaje de chat)."
REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
REP_TXT.elements.name.REP_ChatFrameSlider	= "Chat frame"
REP_TXT.elements.tip.REP_ChatFrameSlider	= "Select which chat frame Reputations prints its messages."
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
