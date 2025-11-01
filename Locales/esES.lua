-------------------------
-- Español (Spanish) --
-------------------------
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
  REP_TXT.moveToInactive = "Move to inactive"
  REP_TXT.showFactionOnMainscreen = "Show faction as exp bar"
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
  REP_TXT.guildReputation	= "Guild reputation"
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
  REP_TXT.ncit	= "Instancias normales de Cataclysm con tabardo de facción"
  REP_TXT.hcit	= "Instancias de Cataclysm heroico con tabardo de facción"
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
  REP_TXT.renown = "Renown"
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
  -- Random Reputation stuff
  ---------------------------
  REP_TXT.syndicateMobs	= "All Syndicate members"

  ---------------------------
  -- Reputation Standing
  ---------------------------
  ---- Initialize
  REP_TXT.STAND_LV	= {}
  REP_TXT.STAND_LV_TIER	= {}
  REP_TXT.STAND_LV_TRUST	= {}
  REP_TXT.STAND_LV_RENOWN	= {}
  REP_TXT.STAND_LV_RANK = {}
  REP_TXT.STAND_LV_LEVEL = {}
  REP_TXT.BFFLabels = {}
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
  ---- Rank standings
  REP_TXT.STAND_LV_MAX_RANK = "Rango máximo"
  REP_TXT.STAND_LV_RANK[0] = "Desconocido"
  REP_TXT.STAND_LV_RANK[1] = "Rango 1"
  REP_TXT.STAND_LV_RANK[2] = "Rango 2"
  REP_TXT.STAND_LV_RANK[3] = "Rango 3"
  REP_TXT.STAND_LV_RANK[4] = "Rango 4"
  REP_TXT.STAND_LV_RANK[5] = "Rango 5"
  REP_TXT.STAND_LV_RANK[6] = "Rango 6"
  REP_TXT.STAND_LV_RANK[7] = "Rango 7"
  REP_TXT.STAND_LV_RANK[8] = "Rango 8"
  REP_TXT.STAND_LV_RANK[9] = "Rango 9"
  REP_TXT.STAND_LV_RANK[10] = "Rango 10"
  REP_TXT.STAND_LV_RANK[11] = "Rango 11"
  REP_TXT.STAND_LV_RANK[12] = "Rango 12"
  REP_TXT.STAND_LV_RANK[13] = "Rango 13"
  REP_TXT.STAND_LV_RANK[14] = "Rango 14"
  REP_TXT.STAND_LV_RANK[15] = "Rango 15"
  REP_TXT.STAND_LV_RANK[16] = "Rango 16"
  REP_TXT.STAND_LV_RANK[17] = "Rango 17"
  REP_TXT.STAND_LV_RANK[18] = "Rango 18"
  REP_TXT.STAND_LV_RANK[19] = "Rango 19"
  REP_TXT.STAND_LV_RANK[20] = "Rango 20"
  REP_TXT.STAND_LV_RANK[21] = "Rango 21"
  REP_TXT.STAND_LV_RANK[22] = "Rango 22"
  REP_TXT.STAND_LV_RANK[23] = "Rango 23"
  REP_TXT.STAND_LV_RANK[24] = "Rango 24"
  REP_TXT.STAND_LV_RANK[25] = "Rango 25"
  REP_TXT.STAND_LV_RANK[26] = "Rango 26"
  REP_TXT.STAND_LV_RANK[27] = "Rango 27"
  REP_TXT.STAND_LV_RANK[28] = "Rango 28"
  REP_TXT.STAND_LV_RANK[29] = "Rango 29"
  REP_TXT.STAND_LV_RANK[30] = "Rango 30"
  ---- Level standings
  REP_TXT.STAND_LV_LEVEL[0] = "Desconocido"
  REP_TXT.STAND_LV_LEVEL[1] = "Nivel 1"
  REP_TXT.STAND_LV_LEVEL[2] = "Nivel 2"
  REP_TXT.STAND_LV_LEVEL[3] = "Nivel 3"
  REP_TXT.STAND_LV_LEVEL[4] = "Nivel 4"
  REP_TXT.STAND_LV_LEVEL[5] = "Nivel 5"
  REP_TXT.STAND_LV_LEVEL[6] = "Nivel 6"
  REP_TXT.STAND_LV_LEVEL[7] = "Nivel 7"
  REP_TXT.STAND_LV_LEVEL[8] = "Nivel 8"
  REP_TXT.STAND_LV_LEVEL[9] = "Nivel 9"
  REP_TXT.STAND_LV_LEVEL[10] = "Nivel 10"
  REP_TXT.STAND_LV_LEVEL[11] = "Nivel 11"
  REP_TXT.STAND_LV_LEVEL[12] = "Nivel 12"
  REP_TXT.STAND_LV_LEVEL[13] = "Nivel 13"
  REP_TXT.STAND_LV_LEVEL[14] = "Nivel 14"
  REP_TXT.STAND_LV_LEVEL[15] = "Nivel 15"
  REP_TXT.STAND_LV_LEVEL[16] = "Nivel 16"
  REP_TXT.STAND_LV_LEVEL[17] = "Nivel 17"
  REP_TXT.STAND_LV_LEVEL[18] = "Nivel 18"
  REP_TXT.STAND_LV_LEVEL[19] = "Nivel 19"
  REP_TXT.STAND_LV_LEVEL[20] = "Nivel 20"
  REP_TXT.STAND_LV_LEVEL[21] = "Nivel 21"
  REP_TXT.STAND_LV_LEVEL[22] = "Nivel 22"
  REP_TXT.STAND_LV_LEVEL[23] = "Nivel 23"
  REP_TXT.STAND_LV_LEVEL[24] = "Nivel 24"
  REP_TXT.STAND_LV_LEVEL[25] = "Nivel 25"
  REP_TXT.STAND_LV_LEVEL[26] = "Nivel 26"
  REP_TXT.STAND_LV_LEVEL[27] = "Nivel 27"
  REP_TXT.STAND_LV_LEVEL[28] = "Nivel 28"
  REP_TXT.STAND_LV_LEVEL[29] = "Nivel 29"
  REP_TXT.STAND_LV_LEVEL[30] = "Nivel 30"
  REP_TXT.STAND_LV_LEVEL[31] = "Nivel 31"
  REP_TXT.STAND_LV_LEVEL[32] = "Nivel 32"
  REP_TXT.STAND_LV_LEVEL[33] = "Nivel 33"
  REP_TXT.STAND_LV_LEVEL[34] = "Nivel 34"
  REP_TXT.STAND_LV_LEVEL[35] = "Nivel 35"
  REP_TXT.STAND_LV_LEVEL[36] = "Nivel 36"
  REP_TXT.STAND_LV_LEVEL[37] = "Nivel 37"
  REP_TXT.STAND_LV_LEVEL[38] = "Nivel 38"
  REP_TXT.STAND_LV_LEVEL[39] = "Nivel 39"
  REP_TXT.STAND_LV_LEVEL[40] = "Nivel 40"
  REP_TXT.STAND_LV_LEVEL[41] = "Nivel 41"
  REP_TXT.STAND_LV_LEVEL[42] = "Nivel 42"
  REP_TXT.STAND_LV_LEVEL[43] = "Nivel 43"
  REP_TXT.STAND_LV_LEVEL[44] = "Nivel 44"
  REP_TXT.STAND_LV_LEVEL[45] = "Nivel 45"
  REP_TXT.STAND_LV_LEVEL[46] = "Nivel 46"
  REP_TXT.STAND_LV_LEVEL[47] = "Nivel 47"
  REP_TXT.STAND_LV_LEVEL[48] = "Nivel 48"
  REP_TXT.STAND_LV_LEVEL[49] = "Nivel 49"
  REP_TXT.STAND_LV_LEVEL[50] = "Nivel 50"
  REP_TXT.STAND_LV_LEVEL[51] = "Nivel 51"
  REP_TXT.STAND_LV_LEVEL[52] = "Nivel 52"
  REP_TXT.STAND_LV_LEVEL[53] = "Nivel 53"
  REP_TXT.STAND_LV_LEVEL[54] = "Nivel 54"
  REP_TXT.STAND_LV_LEVEL[55] = "Nivel 55"
  REP_TXT.STAND_LV_LEVEL[56] = "Nivel 56"
  REP_TXT.STAND_LV_LEVEL[57] = "Nivel 57"
  REP_TXT.STAND_LV_LEVEL[58] = "Nivel 58"
  REP_TXT.STAND_LV_LEVEL[59] = "Nivel 59"
  REP_TXT.STAND_LV_LEVEL[60] = "Nivel 60"
  REP_TXT.STAND_LV_LEVEL[61] = "Nivel 61"
  REP_TXT.STAND_LV_LEVEL[62] = "Nivel 62"
  REP_TXT.STAND_LV_LEVEL[63] = "Nivel 63"
  REP_TXT.STAND_LV_LEVEL[64] = "Nivel 64"
  REP_TXT.STAND_LV_LEVEL[65] = "Nivel 65"
  REP_TXT.STAND_LV_LEVEL[66] = "Nivel 66"
  REP_TXT.STAND_LV_LEVEL[67] = "Nivel 67"
  REP_TXT.STAND_LV_LEVEL[68] = "Nivel 68"
  REP_TXT.STAND_LV_LEVEL[69] = "Nivel 69"
  REP_TXT.STAND_LV_LEVEL[70] = "Nivel 70"
  REP_TXT.STAND_LV_LEVEL[71] = "Nivel 71"
  REP_TXT.STAND_LV_LEVEL[72] = "Nivel 72"
  REP_TXT.STAND_LV_LEVEL[73] = "Nivel 73"
  REP_TXT.STAND_LV_LEVEL[74] = "Nivel 74"
  REP_TXT.STAND_LV_LEVEL[75] = "Nivel 75"
  REP_TXT.STAND_LV_LEVEL[76] = "Nivel 76"
  REP_TXT.STAND_LV_LEVEL[77] = "Nivel 77"
  REP_TXT.STAND_LV_LEVEL[78] = "Nivel 78"
  REP_TXT.STAND_LV_LEVEL[79] = "Nivel 79"
  REP_TXT.STAND_LV_LEVEL[80] = "Nivel 80"
  REP_TXT.STAND_LV_LEVEL[81] = "Nivel 81"
  REP_TXT.STAND_LV_LEVEL[82] = "Nivel 82"
  REP_TXT.STAND_LV_LEVEL[83] = "Nivel 83"
  REP_TXT.STAND_LV_LEVEL[84] = "Nivel 84"
  REP_TXT.STAND_LV_LEVEL[85] = "Nivel 85"
  REP_TXT.STAND_LV_LEVEL[86] = "Nivel 86"
  REP_TXT.STAND_LV_LEVEL[87] = "Nivel 87"
  REP_TXT.STAND_LV_LEVEL[88] = "Nivel 88"
  REP_TXT.STAND_LV_LEVEL[89] = "Nivel 89"
  REP_TXT.STAND_LV_LEVEL[90] = "Nivel 90"
  REP_TXT.STAND_LV_LEVEL[91] = "Nivel 91"
  REP_TXT.STAND_LV_LEVEL[92] = "Nivel 92"
  REP_TXT.STAND_LV_LEVEL[93] = "Nivel 93"
  REP_TXT.STAND_LV_LEVEL[94] = "Nivel 94"
  REP_TXT.STAND_LV_LEVEL[95] = "Nivel 95"
  REP_TXT.STAND_LV_LEVEL[96] = "Nivel 96"
  REP_TXT.STAND_LV_LEVEL[97] = "Nivel 97"
  REP_TXT.STAND_LV_LEVEL[98] = "Nivel 98"
  REP_TXT.STAND_LV_LEVEL[99] = "Nivel 99"
  REP_TXT.STAND_LV_LEVEL[100] = "Nivel 100"
  -------------------------------------
  -- BFFLabels / Friendship factions --
  -------------------------------------
  -- BFF Labels placeholder
  REP_TXT.BFFLabels[0] = {} -- Extraño
  REP_TXT.BFFLabels[0][1] = "Conocido"
  REP_TXT.BFFLabels[0][2] = "Colega"
  REP_TXT.BFFLabels[0][3] = "Amigo"
  REP_TXT.BFFLabels[0][4] = "Buen amigo"
  REP_TXT.BFFLabels[0][5] = "Mejor amigo"
  ---- Fishing Masters placeholder
  REP_TXT.BFFFishingMastersLabels = {}
  REP_TXT.BFFFishingMastersLabels[1] = "Extraño"
  REP_TXT.BFFFishingMastersLabels[2] = "Compañero"
  REP_TXT.BFFFishingMastersLabels[3] = "Colega"
  REP_TXT.BFFFishingMastersLabels[4] = "Amigo"
  REP_TXT.BFFFishingMastersLabels[5] = "Buen amigo"
  REP_TXT.BFFFishingMastersLabels[6] = "Mejor amigo"
  ---- Barracks Bodyguards placeholder
  REP_TXT.BFFBarracksBodyguardsLabels = {}
  REP_TXT.BFFBarracksBodyguardsLabels[1] = "Guardaespaldas"
  REP_TXT.BFFBarracksBodyguardsLabels[2] = "Escolta leal"
  REP_TXT.BFFBarracksBodyguardsLabels[3] = "Compañero del alma"
  ---- The First Responders 1984
  REP_TXT.BFFLabels[1984] = {} -- Becario
  REP_TXT.BFFLabels[1984][1] = "Habitante joven"
  REP_TXT.BFFLabels[1984][2] = "Habitante veterano"
  REP_TXT.BFFLabels[1984][3] = "Primer interviniente"
  ---- Corbyn 2100
  REP_TXT.BFFLabels[2100] = {} -- Extraño
  REP_TXT.BFFLabels[2100][1] = "Ser curioso"
  REP_TXT.BFFLabels[2100][2] = "Sin amenaza"
  REP_TXT.BFFLabels[2100][3] = REP_TXT.BFFFishingMastersLabels[4]
  REP_TXT.BFFLabels[2100][4] = "Amigo servicial"
  REP_TXT.BFFLabels[2100][5] = REP_TXT.BFFFishingMastersLabels[6]
  -- Chromie 2135
  REP_TXT.BFFLabels[2135] = {} -- Vástago
  REP_TXT.BFFLabels[2135][1] = "Alumno temporal"
  REP_TXT.BFFLabels[2135][2] = "Trotatiempos"
  REP_TXT.BFFLabels[2135][3] = "Cronoamigo"
  REP_TXT.BFFLabels[2135][4] = "Aliado Bronce"
  REP_TXT.BFFLabels[2135][5] = "Reparador de eras"
  REP_TXT.BFFLabels[2135][6] = "Señor del tiempo"
  ---- Wrathion 2517
  REP_TXT.BFFLabels[2517] = {} -- Conocido
  REP_TXT.BFFLabels[2517][1] = "Cómplice"
  REP_TXT.BFFLabels[2517][2] = "Aliado"
  REP_TXT.BFFLabels[2517][3] = "Colmillo"
  REP_TXT.BFFLabels[2517][4] = "Amigo"
  REP_TXT.BFFLabels[2517][5] = "Amigo verdadero"
  ---- Sabellian 2518
  REP_TXT.BFFLabels[2518] = {} -- Conocido
  REP_TXT.BFFLabels[2518][1] = "Cómplice"
  REP_TXT.BFFLabels[2518][2] = "Aliado"
  REP_TXT.BFFLabels[2518][3] = "Colmillo"
  REP_TXT.BFFLabels[2518][4] = "Amigo"
  REP_TXT.BFFLabels[2518][5] = "Amigo verdadero"
  ---- Artisan's Consortium - Dragon Isles Branch 2544
  REP_TXT.BFFLabels[2544] = {} -- Neutral
  REP_TXT.BFFLabels[2544][1] = "Preferido"
  REP_TXT.BFFLabels[2544][2] = "Respetado"
  REP_TXT.BFFLabels[2544][3] = "Valorado"
  REP_TXT.BFFLabels[2544][4] = "Estimado"
  ---- Cobalt Assembly 2550
  REP_TXT.BFFLabels[2550] = {} -- Vacío
  REP_TXT.BFFLabels[2550][1] = "Bajo"
  REP_TXT.BFFLabels[2550][2] = "Medio"
  REP_TXT.BFFLabels[2550][3] = "Alto"
  REP_TXT.BFFLabels[2550][4] = "Máximo"
  ---- Soridormi 2553
  REP_TXT.BFFLabels[2553] = {} -- Anomalía
  REP_TXT.BFFLabels[2553][1] = "Futuro amigo"
  REP_TXT.BFFLabels[2553][2] = "Reparador de fallas"
  REP_TXT.BFFLabels[2553][3] = "Caminante del tiempo"
  REP_TXT.BFFLabels[2553][4] = "Leyenda"
  ---- The Weaver 2601
  REP_TXT.BFFLabels[2601] = {} -- Extraño
  REP_TXT.BFFLabels[2601][1] = "Conocido"
  REP_TXT.BFFLabels[2601][2] = "Compinche"
  REP_TXT.BFFLabels[2601][3] = "Cómplice"
  REP_TXT.BFFLabels[2601][4] = "Colaborador"
  REP_TXT.BFFLabels[2601][5] = "Accesorio"
  REP_TXT.BFFLabels[2601][6] = "Encubridor"
  REP_TXT.BFFLabels[2601][7] = "Conspirador"
  REP_TXT.BFFLabels[2601][8] = "Eminencia"
  ---- The General 2605
  REP_TXT.BFFLabels[2605] = {} -- Extraño
  REP_TXT.BFFLabels[2605][1] = "Conocido"
  REP_TXT.BFFLabels[2605][2] = "Compinche"
  REP_TXT.BFFLabels[2605][3] = "Cómplice"
  REP_TXT.BFFLabels[2605][4] = "Colaborador"
  REP_TXT.BFFLabels[2605][5] = "Accesorio"
  REP_TXT.BFFLabels[2605][6] = "Encubridor"
  REP_TXT.BFFLabels[2605][7] = "Conspirador"
  REP_TXT.BFFLabels[2605][8] = "Eminencia"
  ---- The Vizier 2607
  REP_TXT.BFFLabels[2607] = {} -- Extraño
  REP_TXT.BFFLabels[2607][1] = "Conocido"
  REP_TXT.BFFLabels[2607][2] = "Compinche"
  REP_TXT.BFFLabels[2607][3] = "Cómplice"
  REP_TXT.BFFLabels[2607][4] = "Colaborador"
  REP_TXT.BFFLabels[2607][5] = "Accesorio"
  REP_TXT.BFFLabels[2607][6] = "Encubridor"
  REP_TXT.BFFLabels[2607][7] = "Conspirador"
  REP_TXT.BFFLabels[2607][8] = "Eminencia"
  ---- Azerothian Archives 2615
  REP_TXT.BFFLabels[2615] = {} -- Graduado
  REP_TXT.BFFLabels[2615][1] = "Ayudante"
  REP_TXT.BFFLabels[2615][2] = "Contratado"
  REP_TXT.BFFLabels[2615][3] = "residente"
  REP_TXT.BFFLabels[2615][4] = "titular"

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
  REP_TXT.elements.name.REP_DetailShowAllButton	= REP_TXT.showAll
  REP_TXT.elements.tip.REP_DetailShowAllButton	= "Pulse este botón para restablecer las cuatro casillas de la izquierda. \r\nEsto mostrará mobs, misiones, objetos e instancias que le den reputación de la facción seleccionada."
  REP_TXT.elements.name.REP_DetailShowNoneButton	= REP_TXT.showNone
  REP_TXT.elements.tip.REP_DetailShowNoneButton	= "Pulse este botón para desmarcar la selección de las cuatro casillas de la izquierda. \r\nEsto ocultara mobs, misiones, objetos e instancias que le den reputación de la facción seleccionada."
  REP_TXT.elements.name.REP_DetailExpandButton	= REP_TXT.expand
  REP_TXT.elements.tip.REP_DetailExpandButton	= "Pulse este botón para expandir todas las entradas de la lista."
  REP_TXT.elements.name.REP_DetailCollapseButton	= REP_TXT.collapse
  REP_TXT.elements.tip.REP_DetailCollapseButton	= "Pulse este botón para colapsar todas las entradas de la lista."
  REP_TXT.elements.name.REP_DetailSupressNoneFactionButton	= REP_TXT.supressNoneFaction
  REP_TXT.elements.tip.REP_DetailSupressNoneFactionButton	= "Pulse este botón para restablecer todos los elementos excluidos de esta facción."
  REP_TXT.elements.name.REP_DetailSupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
  REP_TXT.elements.tip.REP_DetailSupressNoneGlobalButton	= "Pulse este botón para restablecer todos los elementos excluidos de todas las facciones."
  REP_TXT.elements.name.REP_DetailClearSessionGainButton	= REP_TXT.clearSessionGain
  REP_TXT.elements.tip.REP_DetailClearSessionGainButton	= "Pulse este botón para reiniciar el contador de reputación de esta sesión."
  REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
  REP_TXT.elements.tip.REP_EnableMissingBox	= "Esta opción añade entre parentesis la reputación faltante para el siguiente nivel en la ventana de reputación.u"
  REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
  REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Active esta opción para mostrar un cuadro detalle reputación extendida. \r\nEn Además, la información que se muestra en el cuadro detalle original, esto mostrará la reputación faltante necesaria para alcanzar el siguiente nivel de reputación y una lista de maneras de ganar esta reputación mediante anuncio quests , las multitudes, los elementos e instancias que producen reputación de la facción elegida."
  REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
  REP_TXT.elements.tip.REP_GainToChatBox	= "Enable this setting to display reputation gained for all factions whenever you gain reputation.\r\nThis differs from the standard way of reporting reputation gain, as normally, only the gain with the main faction is listed."
  REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
  REP_TXT.elements.tip.REP_NoGuildGainBox	= "Al marcar esta casilla se desactivara los mensajes de chat de la reputación de hermandad."
  REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
  REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "Habilite esta configuración para suprimir los mensajes estándar de ganancia de reputación.\r\nEsto tiene sentido si ha habilitado los mensajes detallados de ganancia de facción, para que no obtenga listados idénticos de las versiones estándar y extendida."
  REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
  REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "Habilite esta configuración para mostrar la reputación que puede obtener entregando objetos y misiones completadas como una barra gris superpuesta a la barra de reputación normal en el marco de reputación."
  REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
  REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "Habilita esta configuración para cambiar automáticamente la facción que estás vigilando a la última facción por la que has ganado reputación."
  REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
  REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "Active esta opción para no cambiar la facción observó por ganancias de reputación del clan."
  REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
  REP_TXT.elements.tip.REP_SilentSwitchBox	= "Active esta opción para cambiar la barra de reputación silenciosamente (sin mensaje de chat)."
  REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
  REP_TXT.elements.name.REP_ChatFrameSlider	= "Marco de chat"
  REP_TXT.elements.tip.REP_ChatFrameSlider	= "Seleccione qué marco de chat Reputaciones imprime sus mensajes."
  REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
  REP_TXT.elements.tip.REP_EnableParagonBarBox  = "Habilite esta opción para mostrar su progreso actual de modelo en las barras de reputación."
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
  REP_TXT.settings.buffTitle = "Mejoras de reputación"
  REP_TXT.settings.buffSubTitle = "Puedes alternar estas mejoras de reputación para ver cuánta reputación obtendrías de diferentes actividades. Las ventajas que no se acumulan se desactivarán al alternar entre sus contrapartes."
  ---- Buffs
  REP_TXT.settings.harvestBountyRepBuff = "El espíritu de compartir (Generosidad del Peregrino)"
  REP_TXT.settings.info.harvestBountyRepBuff = "Aumenta la reputación ganada un 10%. Dura 1 hora."
  REP_TXT.settings.wickermanRepBuff = "Invocación del Hombre de Mimbre (De Halloween)"
  REP_TXT.settings.info.wickermanRepBuff = "Aumenta la regeneración de maná y de salud en un 25% y el aguante en un 25%. Dura 2 hrs."
  REP_TXT.settings.wickermanRepBuffUnburdened = "Desahogado (De Halloween)"
  REP_TXT.settings.info.wickermanRepBuffUnburdened = "Has purgado tus preocupaciones en la hoguera del Hombre de Mimbre. Aumenta la experiencia y la reputación ganadas un 10%. Dura 2 hrs."
  REP_TXT.settings.wickermanRepBuffGrimVisage = "Cara siniestra (De Halloween)"
  REP_TXT.settings.info.wickermanRepBuffGrimVisage = "Te has pintado la cara con las cenizas del Hombre de Mimbre. Aumenta la experiencia y la reputación ganadas un 10%. Dura 2 hrs."
  REP_TXT.settings.MrPopularityRankOne = "Don de gentes (ventajas, Rango 1)"
  REP_TXT.settings.info.MrPopularityRankOne = "Aumenta la reputación que se gana al matar monstruos y completar misiones un 5%."
  REP_TXT.settings.MrPopularityRankTwo = "Don de gentes (ventajas, Rango 2)"
  REP_TXT.settings.info.MrPopularityRankTwo = "Aumenta la reputación que se gana al matar monstruos y completar misiones un 10%."
  REP_TXT.settings.DarkmoonFaireWeeRepBuff = "¡WIII! (Feria de la Luna Negra)"
  REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "Has montado en el carrusel o en la montaña rusa de la Luna Negra. La ganancia de experiencia y reputación aumenta un 10%."
  REP_TXT.settings.DarkmoonFaireHatRep = "Chistera de la Luna Negra (Feria de la Luna Negra)"
  REP_TXT.settings.info.DarkmoonFaireHatRep = "Aumenta las ganancias de experiencia y reputación un 10% durante 1 hour. El sombrero se consume con el uso."
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
