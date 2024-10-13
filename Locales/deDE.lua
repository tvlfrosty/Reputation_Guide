------------------------
-- Deutsch (German) --
------------------------
if (GetLocale() == "deDE") then
  -- Binding names
  BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
  BINDING_NAME_SHOWCONFIG	= "Optionen zeigen"
  BINDING_NAME_SHOWDETAILS	= "Ruf-Detailfenster zeigen"

  REP_TXT	= {}
  REP_TXT.Mob = {}
  -- help
  REP_TXT.help	= "Ein Addon, um Deinen Ruf zu managen"
  REP_TXT.command	= "Kommando nicht erkannt"
  REP_TXT.usage	= "Benutzung"
  REP_TXT.helphelp	= "Zeigt diesen Hilfstext"
  REP_TXT.helpabout	= "zeigt Informationen zu den Autoren an"
  REP_TXT.helpstatus	= "zeigt den Konfigurationsstatus an"
  -- about
  REP_TXT.by	= "von"
  REP_TXT.version	= "Version"
  REP_TXT.date	= "Datum"
  REP_TXT.web	= "Webseite"
  REP_TXT.slash	= "Slash Kommando"

  -- status
  REP_TXT.status	= "Status"
  REP_TXT.disabled	= "inaktiv"
  REP_TXT.enabled	= "aktiv"
  REP_TXT.statMobs	= "Mobs zeigen [M]"
  REP_TXT.statQuests	= "Quests zeigen [Q]"
  REP_TXT.statInstances	= "Instanzen zeigen [D]"
  REP_TXT.statItems	= "Gegenstände zeigen [I]"
  REP_TXT.statGeneral	= "Allgemein zeigen [G]"
  REP_TXT.statMissing	= "Fehlenden Ruf zeigen"
  REP_TXT.statDetails	= "Erweiteres Detailfenster zeigen"
  REP_TXT.statChat	= "Detaillierte Chatmeldungen"
  REP_TXT.statNoGuildChat	= "Kein Chat für Gildenruf"
  REP_TXT.statSuppress	= "Originalmeldungen im Chat unterdrücken"
  REP_TXT.statPreview	= "Voransicht für Ruf im Ruffenster anzeigen"
  REP_TXT.statSwitch	= "Automatisch Rufbalken umschalten"
  REP_TXT.statNoGuildSwitch	= "Für Gildenruf nicht umschalten"
  REP_TXT.statSilentSwitch	= "Keine Meldungen bei Balkenwechsel"
  REP_TXT.statGuildCap	= "Gildenruflimit im Chat anzeigen"
  -- XML UI elements
  REP_TXT.showQuests	= "Quests"
  REP_TXT.showPvPQuests	= "PvP Quests"
  REP_TXT.showInstances	= "Instanzen"
  REP_TXT.showMobs	= "Mobs"
  REP_TXT.showItems	= "Gegenstände"
  REP_TXT.showGeneral	= "Allgemeines"
  REP_TXT.showAll	= "Alles zeigen"
  REP_TXT.showNone	= "Nichts zeigen"
  REP_TXT.expand	= "Aufklappen"
  REP_TXT.collapse	= "Zuklappen"
  REP_TXT.supressNoneFaction	= "Ausschluss löschen: Fraktion"
  REP_TXT.supressNoneGlobal	= "Ausschluss löschen: Alle"
  REP_TXT.suppressHint	= "Rechtsklick auf eine Quest, um sie von der Summe auszuschliessen."
  REP_TXT.clearSessionGain	= "Zähler für diesmal zurücksetzen"
  REP_TXT.moveToInactive = "Move to inactive"
  REP_TXT.showFactionOnMainscreen = "Show faction as exp bar"
  -- options dialog
  REP_TXT.showMissing	= "Fehlenden Ruf im Ruffenster anzeigen"
  REP_TXT.extendDetails	= "Erweitertes Detailfenster anzeigen"
  REP_TXT.gainToChat	= "Replace original faction gain messages with a more detailed version"
  REP_TXT.noGuildGain	= "Keinen Chat für Gildenruf"
  REP_TXT.suppressOriginalGain	= "Originalmeldungen zu Rufsteigerung unterdrücken"
  REP_TXT.showPreviewRep	= "Rufvorschau im Ruffenster zeigen"
  REP_TXT.switchFactionBar	= "Fraktionsbalken automatisch anpassen, wenn der Ruf steigt"
  REP_TXT.noGuildSwitch	= "Fraktionsbalken für Gildenruf nicht umschalten"
  REP_TXT.silentSwitch	= "Keine Chatmeldung wenn Balken umgeschaltet wird"
  REP_TXT.guildCap	= "Gildenruflimit im Chat anzeigen"
  REP_TXT.defaultChatFrame	= "Standard-Chatfenster verwenden"
  REP_TXT.chatFrame	= "Verwende Chatfenster %d (%s)"
  REP_TXT.usingDefaultChatFrame	= "Verwende Standard-Chatfenster"
  REP_TXT.usingChatFrame	= "Verwende Chatfenster"
  REP_TXT.EnableParagonBar = "Display paragon reputation in bars."
  -- various LUA
  REP_TXT.options	= "Optionen"
  REP_TXT.orderByStanding	= "Nach Ruf sortieren"
  REP_TXT.lookup	= "Schlage Fraktion "
  REP_TXT.allFactions	= "Zeige alle Fraktionen"
  REP_TXT.missing	= "(zur nächsten)"
  REP_TXT.missing2	= "Fehlend"
  REP_TXT.heroic	= "Heroisch"
  REP_TXT.normal	= "Normal"
  REP_TXT.switchBar	= "Rufbalken umgeschaltet auf"
  -- REP_ShowFactions
  REP_TXT.faction	= "Fraktion"
  REP_TXT.is	= "ist"
  REP_TXT.withStanding	= "mit Ruf"
  REP_TXT.needed	= "notwendig"
  REP_TXT.mob	= "[Mob]"
  REP_TXT.limited	= "ist limitiert auf"
  REP_TXT.limitedPl	= "sind limitiert auf"
  REP_TXT.quest	= "[Quest]"
  REP_TXT.instance	= "[Instanz]"
  REP_TXT.items	= "[Gegenstand]"
  REP_TXT.unknown	= "ist diesem Spieler nicht bekannt."
  -- mob Details
  REP_TXT.tmob	= "Trash Mobs"
  REP_TXT.oboss	= "andere Chef"
  REP_TXT.aboss	= "Alle Bosse"
  REP_TXT.pboss	= "Per Boss"
  REP_TXT.fclear	= "voll klar"
  REP_TXT.AU	= "Gewöhnliche"
  REP_TXT.AN	= "Benannte"
  REP_TXT.BB	= "Bloodsail Bukanier"
  REP_TXT.SSP	= "Southsea Piraten"
  REP_TXT.Wa	= "Wastewander"
  REP_TXT.VCm	= "Venture Co. mob"
  REP_TXT.Mob.MoshOgg_Spellcrafter = "Zauberkundiger der Mosh'Ogg"
  REP_TXT.Mob.BoulderfistOgre = "Oger der Felsfäuste"
  -- Quest Details
  REP_TXT.cdq	= "Andere Stadt tägliche Koch-Quests"
  REP_TXT.coq	= "Andere Stadt tägliche Koch-Quests"
  REP_TXT.fdq	= "Andere Stadt tägliche Angel-Quests"
  REP_TXT.foq	= "Andere Stadt tägliche Angel-Quests"
  REP_TXT.ndq	= "keine tägliche Quests"
  REP_TXT.deleted	= "überholt"
  REP_TXT.Championing	= "Championing (Wappenrock)"
  REP_TXT.bpqfg	= "Durch Prozent der Quest Fraktion Verstärkung"

  -- items Details
  REP_TXT.cbadge	= "Belobigungsabzeichen Andere Stadt"
  -- instance Details
  REP_TXT.srfd	= "Übergreifen von kerker"
  REP_TXT.tbd	= "ToBe Done"
  REP_TXT.nci	= "Cataclysm Instanzen (Normale)"
  REP_TXT.hci	= "Cataclysm Instanzen (Heroische)"
  REP_TXT.ncit	= "Normale Cataclysm-Instanzen mit Fraktionswappenrock"
  REP_TXT.hcit	= "Heroische Cataclysm-Instanzen mit Fraktionswappenrock"
  -- ToBeDone general
  REP_TXT.tfr	= "Tiller Farming rep"
  REP_TXT.nswts	= "Nicht sicher, wenn diese beginnt"
  REP_TXT.mnd	= "Max. Anzahl von tägliche Quests"
  REP_TXT.mnds	= "Die maximale Anzahl von Tageszeitungen ist"

  -- ReputationDetails
  REP_TXT.currentRep	= "Aktueller Ruf"
  REP_TXT.neededRep	= "Benötigter Ruf"
  REP_TXT.missingRep	= "Fehlender Ruf"
  REP_TXT.repInBag	= "Ruf in Taschen"
  REP_TXT.repInBagBank	= "Ruf in Taschen und Bank"
  REP_TXT.repInQuest	= "Ruf durch Quests"
  REP_TXT.factionGained	= "Diesmal erhalten"
  REP_TXT.noInfo	= "Keine Informationen für diese Fraktion/Rufstufe verfügbar."
  REP_TXT.toExalted	= "Ruf bis Ehrfürchtig"
  REP_TXT.toBestFriend = "Reputation to best friend"
  -- to chat
  REP_TXT.stats	= " (Gesamt: %s%d, übrig: %d)"
  REP_TXT.statsNextStanding = " (Total: %s%d, Left to %s: %d)"
  -- config changed
  REP_TXT.configQuestion	= "Einige (neue) Einstellungen wurden gesetzt. Dies wird pro Einstellung nur einmal gemacht. Es ist empfohlen, die Reputations-Optionen zu prüfen."
  REP_TXT.showConfig	= "Zeige Optionen"
  REP_TXT.later	= "Später"
  -- UpdateList
  REP_TXT.mobShort	= "[M]"
  REP_TXT.questShort	= "[Q]"
  REP_TXT.instanceShort	= "[D]"
  REP_TXT.itemsShort	= "[I]"
  REP_TXT.generalShort	= "[G]"
  REP_TXT.mobHead	= "Ruf steigern durch Töten dieses Mobs"
  REP_TXT.questHead	= "Ruf steigern durch Erfüllen dieser Quest"
  REP_TXT.instanceHead	= "Ruf steigern durch Bewältigen dieser Instanz"
  REP_TXT.itemsHead	= "Ruf steigern durch Abgeben dieser Gegenstände"
  REP_TXT.generalHead	= "Allgemeine Information, wie Du Ruf steigern kannst"
  REP_TXT.mobTip	= "Jedesmal, wenn Du diesen Mob tötest, steigert das Deinen Ruf. Wenn Du das oft genug machst, hilft Dir das, die nächste Rufstufe zu erreichen."
  REP_TXT.questTip	= "Jedesmal, wenn Du diese wiederholbare oder Tagesquest erfüllst, steigert das Deinen Ruf. Wenn Du das oft genug machst, hilft Dir das, die nächste Rufstufe zu erreichen."
  REP_TXT.instanceTip	= "Jedesmal, wenn Du diese Instanz bewältigst, steigert das Deinen Ruf. Wenn Du das oft genug machst, hilft Dir das, die nächste Rufstufe zu erreichen."
  REP_TXT.itemsName	= "Gegenstände abgeben"
  REP_TXT.itemsTip	= "Jedesmal, wenn Du die aufgeführten Gegenstände abgibst, steigert das Deinen Ruf. Wenn Du das oft genug machst, hilft Dir das, die nächste Rufstufe zu erreichen."
  REP_TXT.generalTip	= "Diese Information, wie man den Ruf steigern kann, bezieht sich nicht notwendigerweise auf wiederholbare Methoden."
  REP_TXT.allOfTheAbove	= "Summe der %d aufgeführten Quests"
  REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
  REP_TXT.questSummaryTip	= "Dieser Eintrag zeigt eine Zusammenfassung aller oben aufgeführten Quests.\r\nWenn alle aufgeführten Quests Tagesquests sind, kannst Du aus der Summe abschätzen, wie lange es dauern wird, um die nächste Rufstufe zu erreichen, wenn Du sie täglich machst."
  REP_TXT.complete	= "Erfüllt"
  REP_TXT.active	= "Aktiv"
  REP_TXT.inBag	= "In Taschen"
  REP_TXT.turnIns	= "Abgeben:"
  REP_TXT.reputation	= "Ruf:"
  REP_TXT.reputationCap	= "Ruflimit:"
  REP_TXT.reputationCapCurrent	= "Aktueller Ruf:"
  REP_TXT.inBagBank	= "In Taschen und Bank"
  REP_TXT.questCompleted	= "Quest erfüllt"
  REP_TXT.timesToDo	= "Zu erfüllen:"
  REP_TXT.instance2	= "Instanz:"
  REP_TXT.mode	= "Modus:"
  REP_TXT.timesToRun	= "Zu bewältigen:"
  REP_TXT.mob2	= "Mob:"
  REP_TXT.location	= "Ort:"
  REP_TXT.toDo	= "Zu erledigen:"
  REP_TXT.quest2	= "Suche:"
  REP_TXT.itemsRequired	= "Benötigte Gegenstände"
  REP_TXT.general2	= "Allgemein:"
  REP_TXT.maxStanding	= "Gibt ruf bis"
  -- skills
  REP_TXT.skillHerb	= "Kräuterkunde"
  REP_TXT.skillMine	= "Bergbau"
  REP_TXT.skillSkin	= "Kürschnerei"
  REP_TXT.skillAlch	= "Alchemie"
  REP_TXT.skillBlack	= "Schmieden"
  REP_TXT.skillEnch	= "Verzauberkunst"
  REP_TXT.skillEngi	= "Ingenieurskunst"
  REP_TXT.skillIncrip	= "Inschriftenkunde"
  REP_TXT.skillJewel	= "Juwelenschleifen"
  REP_TXT.skillLeath	= "Lederverarbeitung"
  REP_TXT.skillTail	= "Schneiderei"
  REP_TXT.skillAid	= "Erste Hilfe"
  REP_TXT.skillArch	= "Archäologie"
  REP_TXT.skillCook	= "Kochkunst"
  REP_TXT.skillFish	= "Angeln"
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
  REP_TXT.STAND_LV[0]	= "Unbekannt"
  REP_TXT.STAND_LV[1]	= "Hasserfüllt"
  REP_TXT.STAND_LV[2]	= "Feindselig"
  REP_TXT.STAND_LV[3]	= "Unfreundlich"
  REP_TXT.STAND_LV[4]	= "Neutral"
  REP_TXT.STAND_LV[5]	= "Freundlich"
  REP_TXT.STAND_LV[6]	= "Wohlwollend"
  REP_TXT.STAND_LV[7]	= "Respektvoll"
  REP_TXT.STAND_LV[8]	= "Ehrfürchtig"
  REP_TXT.STAND_LV[9] = "Paragon"
  ---- Tier standings
  REP_TXT.STAND_LV_TIER[0] = "Unbekannt"
  REP_TXT.STAND_LV_TIER[1] = "Stufe 1"
  REP_TXT.STAND_LV_TIER[2] = "Stufe 2"
  REP_TXT.STAND_LV_TIER[3] = "Stufe 3"
  REP_TXT.STAND_LV_TIER[4] = "Stufe 4"
  REP_TXT.STAND_LV_TIER[5] = "Stufe 5"
  REP_TXT.STAND_LV_TIER[6] = "Stufe 6"
  ---- Trust standings
  REP_TXT.STAND_LV_TRUST[0] = "Unbekannt"
  REP_TXT.STAND_LV_TRUST[1] = "Unsicher"
  REP_TXT.STAND_LV_TRUST[2] = "Besorgt"
  REP_TXT.STAND_LV_TRUST[3] = "Unverbindlich"
  REP_TXT.STAND_LV_TRUST[4] = "Zwiespältig"
  REP_TXT.STAND_LV_TRUST[5] = "Herzlich"
  REP_TXT.STAND_LV_TRUST[6] = "Wertschätzend"
  ---- Renown standings
  REP_TXT.STAND_LV_RENOWN[0] = "Unbekannt"
  REP_TXT.STAND_LV_RENOWN[1] = "Ruhm 1"
  REP_TXT.STAND_LV_RENOWN[2] = "Ruhm 2"
  REP_TXT.STAND_LV_RENOWN[3] = "Ruhm 3"
  REP_TXT.STAND_LV_RENOWN[4] = "Ruhm 4"
  REP_TXT.STAND_LV_RENOWN[5] = "Ruhm 5"
  REP_TXT.STAND_LV_RENOWN[6] = "Ruhm 6"
  REP_TXT.STAND_LV_RENOWN[7] = "Ruhm 7"
  REP_TXT.STAND_LV_RENOWN[8] = "Ruhm 8"
  REP_TXT.STAND_LV_RENOWN[9] = "Ruhm 9"
  REP_TXT.STAND_LV_RENOWN[10] = "Ruhm 10"
  REP_TXT.STAND_LV_RENOWN[11] = "Ruhm 11"
  REP_TXT.STAND_LV_RENOWN[12] = "Ruhm 12"
  REP_TXT.STAND_LV_RENOWN[13] = "Ruhm 13"
  REP_TXT.STAND_LV_RENOWN[14] = "Ruhm 14"
  REP_TXT.STAND_LV_RENOWN[15] = "Ruhm 15"
  REP_TXT.STAND_LV_RENOWN[16] = "Ruhm 16"
  REP_TXT.STAND_LV_RENOWN[17] = "Ruhm 17"
  REP_TXT.STAND_LV_RENOWN[18] = "Ruhm 18"
  REP_TXT.STAND_LV_RENOWN[19] = "Ruhm 19"
  REP_TXT.STAND_LV_RENOWN[20] = "Ruhm 20"
  REP_TXT.STAND_LV_RENOWN[21] = "Ruhm 21"
  REP_TXT.STAND_LV_RENOWN[22] = "Ruhm 22"
  REP_TXT.STAND_LV_RENOWN[23] = "Ruhm 23"
  REP_TXT.STAND_LV_RENOWN[24] = "Ruhm 24"
  REP_TXT.STAND_LV_RENOWN[25] = "Ruhm 25"
  ---- Rank standings
  REP_TXT.STAND_LV_MAX_RANK = "Maximalrang"
  REP_TXT.STAND_LV_RANK[0] = "Unknown"
  REP_TXT.STAND_LV_RANK[1] = "Rang 1"
  REP_TXT.STAND_LV_RANK[2] = "Rang 2"
  REP_TXT.STAND_LV_RANK[3] = "Rang 3"
  REP_TXT.STAND_LV_RANK[4] = "Rang 4"
  REP_TXT.STAND_LV_RANK[5] = "Rang 5"
  REP_TXT.STAND_LV_RANK[6] = "Rang 6"
  REP_TXT.STAND_LV_RANK[7] = "Rang 7"
  REP_TXT.STAND_LV_RANK[8] = "Rang 8"
  REP_TXT.STAND_LV_RANK[9] = "Rang 9"
  REP_TXT.STAND_LV_RANK[10] = "Rang 10"
  REP_TXT.STAND_LV_RANK[11] = "Rang 11"
  REP_TXT.STAND_LV_RANK[12] = "Rang 12"
  REP_TXT.STAND_LV_RANK[13] = "Rang 13"
  REP_TXT.STAND_LV_RANK[14] = "Rang 14"
  REP_TXT.STAND_LV_RANK[15] = "Rang 15"
  REP_TXT.STAND_LV_RANK[16] = "Rang 16"
  REP_TXT.STAND_LV_RANK[17] = "Rang 17"
  REP_TXT.STAND_LV_RANK[18] = "Rang 18"
  REP_TXT.STAND_LV_RANK[19] = "Rang 19"
  REP_TXT.STAND_LV_RANK[20] = "Rang 20"
  REP_TXT.STAND_LV_RANK[21] = "Rang 21"
  REP_TXT.STAND_LV_RANK[22] = "Rang 22"
  REP_TXT.STAND_LV_RANK[23] = "Rang 23"
  REP_TXT.STAND_LV_RANK[24] = "Rang 24"
  REP_TXT.STAND_LV_RANK[25] = "Rang 25"
  REP_TXT.STAND_LV_RANK[26] = "Rang 26"
  REP_TXT.STAND_LV_RANK[27] = "Rang 27"
  REP_TXT.STAND_LV_RANK[28] = "Rang 28"
  REP_TXT.STAND_LV_RANK[29] = "Rang 29"
  REP_TXT.STAND_LV_RANK[30] = "Rang 30"
  ---- Level standings
  REP_TXT.STAND_LV_LEVEL[0] = "Unknown"
  REP_TXT.STAND_LV_LEVEL[1] = "Stufe 1"
  REP_TXT.STAND_LV_LEVEL[2] = "Stufe 2"
  REP_TXT.STAND_LV_LEVEL[3] = "Stufe 3"
  REP_TXT.STAND_LV_LEVEL[4] = "Stufe 4"
  REP_TXT.STAND_LV_LEVEL[5] = "Stufe 5"
  REP_TXT.STAND_LV_LEVEL[6] = "Stufe 6"
  REP_TXT.STAND_LV_LEVEL[7] = "Stufe 7"
  REP_TXT.STAND_LV_LEVEL[8] = "Stufe 8"
  REP_TXT.STAND_LV_LEVEL[9] = "Stufe 9"
  REP_TXT.STAND_LV_LEVEL[10] = "Stufe 10"
  REP_TXT.STAND_LV_LEVEL[11] = "Stufe 11"
  REP_TXT.STAND_LV_LEVEL[12] = "Stufe 12"
  REP_TXT.STAND_LV_LEVEL[13] = "Stufe 13"
  REP_TXT.STAND_LV_LEVEL[14] = "Stufe 14"
  REP_TXT.STAND_LV_LEVEL[15] = "Stufe 15"
  REP_TXT.STAND_LV_LEVEL[16] = "Stufe 16"
  REP_TXT.STAND_LV_LEVEL[17] = "Stufe 17"
  REP_TXT.STAND_LV_LEVEL[18] = "Stufe 18"
  REP_TXT.STAND_LV_LEVEL[19] = "Stufe 19"
  REP_TXT.STAND_LV_LEVEL[20] = "Stufe 20"
  REP_TXT.STAND_LV_LEVEL[21] = "Stufe 21"
  REP_TXT.STAND_LV_LEVEL[22] = "Stufe 22"
  REP_TXT.STAND_LV_LEVEL[23] = "Stufe 23"
  REP_TXT.STAND_LV_LEVEL[24] = "Stufe 24"
  REP_TXT.STAND_LV_LEVEL[25] = "Stufe 25"
  REP_TXT.STAND_LV_LEVEL[26] = "Stufe 26"
  REP_TXT.STAND_LV_LEVEL[27] = "Stufe 27"
  REP_TXT.STAND_LV_LEVEL[28] = "Stufe 28"
  REP_TXT.STAND_LV_LEVEL[29] = "Stufe 29"
  REP_TXT.STAND_LV_LEVEL[30] = "Stufe 30"
  REP_TXT.STAND_LV_LEVEL[31] = "Stufe 31"
  REP_TXT.STAND_LV_LEVEL[32] = "Stufe 32"
  REP_TXT.STAND_LV_LEVEL[33] = "Stufe 33"
  REP_TXT.STAND_LV_LEVEL[34] = "Stufe 34"
  REP_TXT.STAND_LV_LEVEL[35] = "Stufe 35"
  REP_TXT.STAND_LV_LEVEL[36] = "Stufe 36"
  REP_TXT.STAND_LV_LEVEL[37] = "Stufe 37"
  REP_TXT.STAND_LV_LEVEL[38] = "Stufe 38"
  REP_TXT.STAND_LV_LEVEL[39] = "Stufe 39"
  REP_TXT.STAND_LV_LEVEL[40] = "Stufe 40"
  REP_TXT.STAND_LV_LEVEL[41] = "Stufe 41"
  REP_TXT.STAND_LV_LEVEL[42] = "Stufe 42"
  REP_TXT.STAND_LV_LEVEL[43] = "Stufe 43"
  REP_TXT.STAND_LV_LEVEL[44] = "Stufe 44"
  REP_TXT.STAND_LV_LEVEL[45] = "Stufe 45"
  REP_TXT.STAND_LV_LEVEL[46] = "Stufe 46"
  REP_TXT.STAND_LV_LEVEL[47] = "Stufe 47"
  REP_TXT.STAND_LV_LEVEL[48] = "Stufe 48"
  REP_TXT.STAND_LV_LEVEL[49] = "Stufe 49"
  REP_TXT.STAND_LV_LEVEL[50] = "Stufe 50"
  REP_TXT.STAND_LV_LEVEL[51] = "Stufe 51"
  REP_TXT.STAND_LV_LEVEL[52] = "Stufe 52"
  REP_TXT.STAND_LV_LEVEL[53] = "Stufe 53"
  REP_TXT.STAND_LV_LEVEL[54] = "Stufe 54"
  REP_TXT.STAND_LV_LEVEL[55] = "Stufe 55"
  REP_TXT.STAND_LV_LEVEL[56] = "Stufe 56"
  REP_TXT.STAND_LV_LEVEL[57] = "Stufe 57"
  REP_TXT.STAND_LV_LEVEL[58] = "Stufe 58"
  REP_TXT.STAND_LV_LEVEL[59] = "Stufe 59"
  REP_TXT.STAND_LV_LEVEL[60] = "Stufe 60"
  -------------------------------------
  -- BFFLabels / Friendship factions --
  -------------------------------------
  -- BFF Labels placeholder
  REP_TXT.BFFLabels[0] = {} -- Fremder
  REP_TXT.BFFLabels[0][1] = "Bekannter"
  REP_TXT.BFFLabels[0][2] = "Kumpel"
  REP_TXT.BFFLabels[0][3] = "Freund"
  REP_TXT.BFFLabels[0][4] = "Guter Freund"
  REP_TXT.BFFLabels[0][5] = "Bester Freund"
  ---- Fishing Masters placeholder
  REP_TXT.BFFFishingMastersLabels = {}
  REP_TXT.BFFFishingMastersLabels[1] = "Fremder"
  REP_TXT.BFFFishingMastersLabels[2] = "Kumpan"
  REP_TXT.BFFFishingMastersLabels[3] = "Kumpel"
  REP_TXT.BFFFishingMastersLabels[4] = "Freund"
  REP_TXT.BFFFishingMastersLabels[5] = "Guter Freund"
  REP_TXT.BFFFishingMastersLabels[6] = "Bester Freund"
  ---- Barracks Bodyguards placeholder
  REP_TXT.BFFBarracksBodyguardsLabels = {}
  REP_TXT.BFFBarracksBodyguardsLabels[1] = "Leibwächter"
  REP_TXT.BFFBarracksBodyguardsLabels[2] = "Treuer Leibwächter"
  REP_TXT.BFFBarracksBodyguardsLabels[3] = "Flügelmann"
  ---- The First Responders 1984
  REP_TXT.BFFLabels[1984] = {} -- Praktikant
  REP_TXT.BFFLabels[1984][1] = "Juniorassistent"
  REP_TXT.BFFLabels[1984][2] = "Assistent"
  REP_TXT.BFFLabels[1984][3] = "Ersthelfer"
  ---- Corbyn 2100
  REP_TXT.BFFLabels[2100] = {} -- Fremder
  REP_TXT.BFFLabels[2100][1] = "Kurioses Wesen"
  REP_TXT.BFFLabels[2100][2] = "unbedrohlicher Kontakt"
  REP_TXT.BFFLabels[2100][3] = REP_TXT.BFFFishingMastersLabels[4]
  REP_TXT.BFFLabels[2100][4] = "hilfreicher Freund"
  REP_TXT.BFFLabels[2100][5] = REP_TXT.BFFFishingMastersLabels[6]
  -- Chromie 2135
  REP_TXT.BFFLabels[2135] = {} -- Welpling
  REP_TXT.BFFLabels[2135][1] = "Temporaler Lehrling"
  REP_TXT.BFFLabels[2135][2] = "Zeitspringer"
  REP_TXT.BFFLabels[2135][3] = "Chronofreund"
  REP_TXT.BFFLabels[2135][4] = "Bronzener Verbündeter"
  REP_TXT.BFFLabels[2135][5] = "Epochenheiler"
  REP_TXT.BFFLabels[2135][6] = "Zeitlord"
  ---- Wrathion 2517
  REP_TXT.BFFLabels[2517] = {} -- Bekannter
  REP_TXT.BFFLabels[2517][1] = "Vasall"
  REP_TXT.BFFLabels[2517][2] = "Verbündeter"
  REP_TXT.BFFLabels[2517][3] = "Reißzahn"
  REP_TXT.BFFLabels[2517][4] = "Freund"
  REP_TXT.BFFLabels[2517][5] = "Wahrer Freund"
  ---- Sabellian 2518
  REP_TXT.BFFLabels[2518] = {} -- Bekannter
  REP_TXT.BFFLabels[2518][1] = "Vasall"
  REP_TXT.BFFLabels[2518][2] = "Verbündeter"
  REP_TXT.BFFLabels[2518][3] = "Reißzahn"
  REP_TXT.BFFLabels[2518][4] = "Freund"
  REP_TXT.BFFLabels[2518][5] = "Wahrer Freund"
  ---- Artisan's Consortium - Dragon Isles Branch 2544
  REP_TXT.BFFLabels[2544] = {} -- Neutral
  REP_TXT.BFFLabels[2544][1] = "Bevorzugt"
  REP_TXT.BFFLabels[2544][2] = "Respektiert"
  REP_TXT.BFFLabels[2544][3] = "Geschätzt"
  REP_TXT.BFFLabels[2544][4] = "Hochverehrt"
  ---- Cobalt Assembly 2550
  REP_TXT.BFFLabels[2550] = {} -- Leer
  REP_TXT.BFFLabels[2550][1] = "Niedrig"
  REP_TXT.BFFLabels[2550][2] = "Mittel"
  REP_TXT.BFFLabels[2550][3] = "Hoch"
  REP_TXT.BFFLabels[2550][4] = "Maximum"
  ---- Soridormi 2553
  REP_TXT.BFFLabels[2553] = {} -- Anomalie
  REP_TXT.BFFLabels[2553][1] = "Zukunftsfreund"
  REP_TXT.BFFLabels[2553][2] = "Rissheiler"
  REP_TXT.BFFLabels[2553][3] = "Zeitwanderer"
  REP_TXT.BFFLabels[2553][4] = "Legende"
  ---- The Weaver 2601
  REP_TXT.BFFLabels[2601] = {} -- Fremder
  REP_TXT.BFFLabels[2601][1] = "Bekannter"
  REP_TXT.BFFLabels[2601][2] = "Kumpane"
  REP_TXT.BFFLabels[2601][3] = "Komplize"
  REP_TXT.BFFLabels[2601][4] = "Kollaborateur"
  REP_TXT.BFFLabels[2601][5] = "Mittäter"
  REP_TXT.BFFLabels[2601][6] = "Helfershelfer"
  REP_TXT.BFFLabels[2601][7] = "Verschwörer"
  REP_TXT.BFFLabels[2601][8] = "Strippenzieher"
  ---- The General 2605
  REP_TXT.BFFLabels[2605] = {} -- Fremder
  REP_TXT.BFFLabels[2605][1] = "Bekannter"
  REP_TXT.BFFLabels[2605][2] = "Kumpane"
  REP_TXT.BFFLabels[2605][3] = "Komplize"
  REP_TXT.BFFLabels[2605][4] = "Kollaborateur"
  REP_TXT.BFFLabels[2605][5] = "Mittäter"
  REP_TXT.BFFLabels[2605][6] = "Helfershelfer"
  REP_TXT.BFFLabels[2605][7] = "Verschwörer"
  REP_TXT.BFFLabels[2605][8] = "Strippenzieher"
  ---- The Vizier 2607
  REP_TXT.BFFLabels[2607] = {} -- Fremder
  REP_TXT.BFFLabels[2607][1] = "Bekannter"
  REP_TXT.BFFLabels[2607][2] = "Kumpane"
  REP_TXT.BFFLabels[2607][3] = "Komplize"
  REP_TXT.BFFLabels[2607][4] = "Kollaborateur"
  REP_TXT.BFFLabels[2607][5] = "Mittäter"
  REP_TXT.BFFLabels[2607][6] = "Helfershelfer"
  REP_TXT.BFFLabels[2607][7] = "Verschwörer"
  REP_TXT.BFFLabels[2607][8] = "Strippenzieher"
  ---- Azerothian Archives 2615
  REP_TXT.BFFLabels[2615] = {} -- Absolvent
  REP_TXT.BFFLabels[2615][1] = "Assistent"
  REP_TXT.BFFLabels[2615][2] = "Kontraktor"
  REP_TXT.BFFLabels[2615][3] = "Respektierter"
  REP_TXT.BFFLabels[2615][4] = "Etablierter"

  ---------------------------
  -- Tooltips
  ---------------------------
  ---- Initialize
  REP_TXT.elements	= {}
  REP_TXT.elements.name	= {}
  REP_TXT.elements.tip	= {}
  ---- Names and tips
  REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
  REP_TXT.elements.tip.REP_OptionsButton	= "Öffnet ein Fenster, in welchem Reputations konfiguriert werden kann."
  REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
  REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "Wenn diese Option nicht aktiviert ist, wird die Fraktionsliste wie im Original (Blizzard) sortiert, d.h. logisch und alphabetisch gruppiert.\r\n\r\nWenn diese Option aktiviert ist, wird die Fraktionsliste nach Ruf sortiert.\r\n\r\nUm |cFFFAA0A0inaktive"
  REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
  REP_TXT.elements.tip.REP_ShowMobsButton	= "Diese Option aktivieren, um Mobs anzuzeigen, mit denen Du Deinen Ruf steigern kannst."
  REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
  REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "Diese Option aktivieren, um Quests anzuzeigen, mit denen Du Deinen Ruf steigern kannst."
  REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
  REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "Diese Option aktivieren, um PvP Quests anzuzeigen, mit denen Du Deinen Ruf steigern kannst."
  REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
  REP_TXT.elements.tip.REP_ShowItemsButton	= "Diese Option aktivieren, um Gegenstände anzuzeigen, mit denen Du Deinen Ruf steigern kannst."
  REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
  REP_TXT.elements.tip.REP_ShowInstancesButton	= "Diese Option aktivieren, um Instanzen anzuzeigen, mit denen Du Deinen Ruf steigern kannst."
  REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
  REP_TXT.elements.tip.REP_ShowGeneralButton	= "Diese Option aktivieren, um allgemeine Informationen zur Rufsteigerung anzuzeigen."
  REP_TXT.elements.name.REP_DetailShowAllButton	= REP_TXT.showAll
  REP_TXT.elements.tip.REP_DetailShowAllButton	= "Auf diesen Knopf klicken, um alle vier links stehenden Optionen zu aktivieren. Es werden Mobs, Quests, Gegenstände und Instanzen angezeigt, die Deinen Ruf der ausgewählten Fraktion verbessern."
  REP_TXT.elements.name.REP_DetailShowNoneButton	= REP_TXT.showNone
  REP_TXT.elements.tip.REP_DetailShowNoneButton	= "Auf diesen Knopf klicken, um alle vier links stehenden Optionen zu deaktivieren. \r\nEs werden dadurch keine Methoden mehr angezeigt, die Ruf mit der ausgewählten Fraktion verbessern."
  REP_TXT.elements.name.REP_DetailExpandButton	= REP_TXT.expand
  REP_TXT.elements.tip.REP_DetailExpandButton	= "Auf diesen Knopf klicken, um alle Einträge aufzuklappen. Dies zeigt die Gegenstände an, die für die jeweiligen Sammelquests benötigt werden."
  REP_TXT.elements.name.REP_DetailCollapseButton	= REP_TXT.collapse
  REP_TXT.elements.tip.REP_DetailCollapseButton	= "Auf diesen Knopf klicken, um alle Einträge zuzuklappen. Dies zeigt keine Gegenstände mehr an, die für die jeweiligen Sammelquests benötigt werden."
  REP_TXT.elements.name.REP_DetailSupressNoneFactionButton	= REP_TXT.supressNoneFaction
  REP_TXT.elements.tip.REP_DetailSupressNoneFactionButton	= "Auf diesen Knopf klicken, um die Quests für diese Fraktion wieder zu aktivieren, die durch Rechtsklicken deaktiviert wurden."
  REP_TXT.elements.name.REP_DetailSupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
  REP_TXT.elements.tip.REP_DetailSupressNoneGlobalButton	= "Auf diesen Knopf klicken, um die Quests für alle Fraktionen wieder zu aktivieren, die durch Rechtsklicken deaktiviert wurden."
  REP_TXT.elements.name.REP_DetailClearSessionGainButton	= REP_TXT.clearSessionGain
  REP_TXT.elements.tip.REP_DetailClearSessionGainButton	= "Auf diesen Knopf klicken, um den Zähler für die Rufsteigerung seit Spielstart zurückzusetzen."
  REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
  REP_TXT.elements.tip.REP_EnableMissingBox	= "Diese Option aktivieren, um im Ruffenster hinter der Rufstufe die fehlenden Rufpunkte anzuzeigen, die nötig sind, um die nächste Stufe zu erreichen."
  REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
  REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Diese Option aktivieren, um eine erweiterte Version anzuzeigen.\r\nZusätzlich zum normalen Fenster, werden dann die fehlenden Rufpunkte angezeigt und eine Liste von Mobs, Quests, Gegenständen und Instanzen, mit denen sich der Ruf der ausgewählten Frakt"
  REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
  REP_TXT.elements.tip.REP_GainToChatBox	= "Diese Option aktivieren, um im Chat den Ruf mit aller Fraktionen anzuzeigen.\r\nDies weicht von der Standardeinstellung ab, welche nur den gestiegenen Ruf der Hauptfraktion anzeigt."
  REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
  REP_TXT.elements.tip.REP_NoGuildGainBox	= "Diese Option aktivieren, um für Gildenruf keine Meldungen in den Chat zu schreiben."
  REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
  REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "Diese Option aktivieren, um die Standard-Rufmeldungen im Chat zu unterdrücken.\r\nDies ist sinnvoll, wenn die erweiterten Meldungen aktiviert wurden, damit die Rufmeldungen nicht zweimal angezeigt werden."
  REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
  REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "Diese Option aktivieren, um den Ruf, der durch Abgeben von erfüllten Quests und gesammelten Gegenständen gesteigert werden kann, als grauen Balken über dem normalen Rufbalken im Ruffenster anzuzeigen."
  REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
  REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "Diese Option aktivieren, um den Rufbalken automatisch auf die Fraktion umzuschalten, für die zuletzt Ruf gesteigert wurde."
  REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
  REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "Diese Option aktivieren, um den Rufbalken nicht umzuschalten, wenn Gildenruf gesteigert wird."
  REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
  REP_TXT.elements.tip.REP_SilentSwitchBox	= "Diese Option aktivieren, um den Rufbalken still (ohne Hinweise im Chat) umzuschalten."
  REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
  REP_TXT.elements.name.REP_ChatFrameSlider	= "Chatfenster"
  REP_TXT.elements.tip.REP_ChatFrameSlider	= "Wähle aus, in welchem Chatfenster Reputations seine Meldungen anzeigt."
  REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
  REP_TXT.elements.tip.REP_EnableParagonBarBox  = "Aktivieren Sie diese Option, um Ihren aktuellen Paragon-Fortschritt in den Reputationsleisten anzuzeigen."
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
  REP_TXT.settings.buffTitle = "Rufstärkungen"
  REP_TXT.settings.buffSubTitle = "Sie können diese Rufstärkungen umschalten, um zu sehen, wie viel Ruf Sie durch verschiedene Aktivitäten erhalten würden. Buffs, die nicht stapelbar sind, werden beim Umschalten ihrer Gegenstücke deaktiviert."
  ---- Buffs
  REP_TXT.settings.harvestBountyRepBuff = "Teilen macht Freude (Pilgerfreudenfest)"
  REP_TXT.settings.info.harvestBountyRepBuff = "Erhöht den gewonnenen Ruf um 10%. Hält 1 hour lang an."
  REP_TXT.settings.wickermanRepBuff = "Anrufung des Weidenmanns (Die Schlotternächte)"
  REP_TXT.settings.info.wickermanRepBuff = "Erhöht die Regeneration Eurer Gesundheit und Eures Manas um 25%, und Eure Ausdauer um 25. Hält 2 hrs lang an."
  REP_TXT.settings.wickermanRepBuffUnburdened = "Erleichtert (Die Schlotternächte)"
  REP_TXT.settings.info.wickermanRepBuffUnburdened = "Ihr habt Eure Sorgen in das Feuer des Weidenmanns geworfen. Erhöht die erhaltene Erfahrung und gewährte Rufpunkte um 10%. Hält 2 hrs lang an."
  REP_TXT.settings.wickermanRepBuffGrimVisage = "Finsteres Gesicht (Die Schlotternächte)"
  REP_TXT.settings.info.wickermanRepBuffGrimVisage = "Ihr habt Euer Gesicht mit der Asche des Weidenmanns bemalt. Erhöht die erhaltene Erfahrung und gewährte Rufpunkte um 10%. Hält 2 hrs lang an."
  REP_TXT.settings.MrPopularityRankOne = "Allseits beliebt (Gildenboni, Rang 1)"
  REP_TXT.settings.info.MrPopularityRankOne = "Für das Töten von Monstern und das Abschließen von Quests erhaltener Ruf um 5% erhöht."
  REP_TXT.settings.MrPopularityRankTwo = "Allseits beliebt (Gildenboni, Rang 2)"
  REP_TXT.settings.info.MrPopularityRankTwo = "Für das Töten von Monstern und das Abschließen von Quests erhaltener Ruf um 10% erhöht."
  REP_TXT.settings.DarkmoonFaireWeeRepBuff = "Jippie! (Dunkelmond-Jahrmarkt)"
  REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "Ist mit dem Dunkelmond-Karussel oder der Achterbahn gefahren. Erfahrungs- und Rufzuwachs um 10% erhöht."
  REP_TXT.settings.DarkmoonFaireHatRep = "Dunkelmond-Zylinder (Dunkelmond-Jahrmarkt)"
  REP_TXT.settings.info.DarkmoonFaireHatRep = "Erhöht gewonnene Erfahrung und Ruf 1 hour lang um 10%. Der Hut wird dabei verbraucht."
  ---------------------------
  -- Characters tab settings
  ---------------------------
  REP_TXT.settings.characterTabSubTitle = "You can either reset or delete one of your character's addon settings from the list below."
end
