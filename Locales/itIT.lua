-- Italiano (Italian)
--------------------	--------------------
if (GetLocale() == "itIT") then
-- Binding names
BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
BINDING_NAME_SHOWCONFIG	= "Visualizza finestra opzioni"
BINDING_NAME_SHOWDETAILS	= "Visualizza finestra dettagli reputazione"

REP_TXT	= {}
REP_TXT.Mob = {}
-- help
REP_TXT.help	= "Uno strumento per gestire la tua reputazione"
REP_TXT.command	= "Impossibile analizzare comando"
REP_TXT.usage	= "Utilizzo"
REP_TXT.helphelp	= "Mostra questo testo di aiuto"
REP_TXT.helpabout	= "Mostra informazioni sull'autore"
REP_TXT.helpstatus	= "Mostra lo stato della configurazione"
-- about
REP_TXT.by	= "di"
REP_TXT.version	= "Versione"
REP_TXT.date	= "Data"
REP_TXT.web	= "Sito Web"
REP_TXT.slash	= "Slash comando"
-- status
REP_TXT.status	= "Stato"
REP_TXT.disabled	= "Disabilitato"
REP_TXT.enabled	= "abilitato"
REP_TXT.statMobs	= "Mostra Mobs [M]"
REP_TXT.statQuests	= "Mostra Missioni [Q]"
REP_TXT.statInstances	= "Mostra istanze [D]"
REP_TXT.statItems	= "Mostra elementi [I]"
REP_TXT.statGeneral	= "Mostra generale [G]"
REP_TXT.statMissing	= "Mostra reputazione mancante"
REP_TXT.statDetails	= "Mostra telaio dettaglio esteso"
REP_TXT.statChat	= "Messaggio di chat dettagliate"
REP_TXT.statNoGuildChat	= "Nessun chat gilda rep"
REP_TXT.statSuppress	= "Sopprimere originale messaggio di chat"
REP_TXT.statPreview	= "Mostra anteprima rep in cornice reputazione"
REP_TXT.statSwitch	= "Passare automaticamente fazione di rep bar"
REP_TXT.statNoGuildSwitch	= "Nessuna commutazione di gilda rep"
REP_TXT.statSilentSwitch	= "Nessun messaggio nel passaggio barra"
REP_TXT.statGuildCap	= "Mostra cap reputazione gilda in chat"
-- XML UI elements
REP_TXT.showQuests	= "Mostra Missioni"
REP_TXT.showPvPQuests	= "Mostra PvP Missioni"
REP_TXT.showInstances	= "Mostra istanze"
REP_TXT.showMobs	= "Mostra mob"
REP_TXT.showItems	= "Mostra articoli"
REP_TXT.showGeneral	= "Mostra generale"
REP_TXT.showAll	= "Mostra tutti"
REP_TXT.showNone	= "Mostra Nessuno"
REP_TXT.expand	= "sviluppare"
REP_TXT.collapse	= "Riduci"
REP_TXT.supressNoneFaction	= "Esclusione chiaro per fazione"
REP_TXT.supressNoneGlobal	= "Esclusione chiaro per tutti"
REP_TXT.suppressHint	= "Fai clic destro su una ricerca per escluderla dalla sintesi"
REP_TXT.clearSessionGain	= "Azzera contatore guadagno sessione"
-- options dialog
REP_TXT.showMissing	= "Mostra reputazione mancante nella cornice reputazione"
REP_TXT.extendDetails	= "Mostra estesa reputazione telaio dettaglio"
REP_TXT.gainToChat	= "Replace original faction gain messages with a more detailed version"
REP_TXT.noGuildGain	= "Non scrivere per chattare reputazione gilda"
REP_TXT.suppressOriginalGain	= "Sopprimere originali messaggi guadagno fazione"
REP_TXT.showPreviewRep	= "Mostra reputazione che può essere consegnata in cornice reputazione"
REP_TXT.switchFactionBar	= "Passa bar reputazione di fazione per la quale solo ha guadagnato la reputazione"
REP_TXT.noGuildSwitch	= "Non accendere bar reputazione di reputazione gilda"
REP_TXT.silentSwitch	= "Nessun messaggio di chiacchierare quando si passa bar."
REP_TXT.guildCap	= "Mostra cap reputazione gilda in chat."
REP_TXT.defaultChatFrame	= "Utilizzando telaio Chat di default"
REP_TXT.chatFrame	= "Usando la finestra di chat %d (%s)"
REP_TXT.usingDefaultChatFrame	= "Ora, utilizzando chat di telaio di default"
REP_TXT.usingChatFrame	= "Ora utilizzo il frame di chat"
REP_TXT.EnableParagonBar = "Mostra la reputazione di esempio nei bar."
-- various LUA
REP_TXT.options	= "Opzioni"
REP_TXT.orderByStanding	= "Ordina per posizione"
REP_TXT.lookup	= "Ricerca della fazione "
REP_TXT.allFactions	= "Mostra tutte le fazioni"
REP_TXT.missing	= "(al prossimo)"
REP_TXT.missing2	= "Mancante"
REP_TXT.heroic	= "Eroica"
REP_TXT.normal	= "Normale"
REP_TXT.switchBar	= "Modifica della barra della reputazione in"
-- REP_ShowFactions
REP_TXT.faction	= "Fazione"
REP_TXT.is	= "è"
REP_TXT.withStanding	= "con la posizione in piedi"
REP_TXT.needed	= "necessario"
REP_TXT.mob	= "[Mob]"
REP_TXT.limited	= "è limitato a"
REP_TXT.limitedPl	= "sono limitati a"
REP_TXT.quest	= "[Missioni]"
REP_TXT.instance	= "[Istanze]"
REP_TXT.items	= "[Articoli]"
REP_TXT.unknown	= "non è noto a questo giocatore"
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
REP_TXT.Mob.MoshOgg_Spellcrafter = "Creamagie Mosh'ogg"
REP_TXT.Mob.BoulderfistOgre = "Ogre Rocciadura"
-- Quest Details
REP_TXT.cdq	= "Principali missioni giornaliere di cucina della città"
REP_TXT.coq	= "Altre missioni giornaliere di cucina cittadina"
REP_TXT.fdq	= "Missioni giornaliere di pesca nelle principali città"
REP_TXT.foq	= "Altre missioni giornaliere di pesca in città"
REP_TXT.ndq	= "nessuna missione giornaliera"
REP_TXT.deleted	= "Obsoleta"
REP_TXT.Championing	= "Championing (Tabard)"
REP_TXT.bpqfg	= "In percentuale del guadagno della fazione della missione"
-- items Details
REP_TXT.cbadge	= "Distintivo di encomio di altre città"
-- instance Details
REP_TXT.srfd	= "Rappresentazione spillover dai dungeon"
REP_TXT.tbd	= "ToBe Done"
REP_TXT.nci	= "Normal Cataclysm instances"
REP_TXT.hci	= "Heroic Cataclysm instances"
REP_TXT.ncit	= "Istanze di Cataclisma normali con tabardo di fazione"
REP_TXT.hcit	= "Istanze di Cataclisma Eroico con tabardo di fazione"
-- ToBeDone general
REP_TXT.tfr	= "Tiller Farming rep"
REP_TXT.nswts	= "Non sono sicuro di quando inizierà"
REP_TXT.mnd	= "Numero massimo di missioni giornaliere"
REP_TXT.mnds	= "Il numero massimo di dalies è "
-- ReputationDetails
REP_TXT.currentRep	= "Reputazione corrente"
REP_TXT.neededRep	= "Serve reputazione"
REP_TXT.missingRep	= "Manca la reputazione"
REP_TXT.repInBag	= "Reputazione in borsa"
REP_TXT.repInBagBank	= "Reputazione in borsa e in banca"
REP_TXT.repInQuest	= "Reputazione nelle missioni"
REP_TXT.factionGained	= "Guadagnato questa sessione"
REP_TXT.noInfo	= "Nessuna informazione disponibile per questa fazione/reputazione."
REP_TXT.toExalted	= "Reputazione elevata"
REP_TXT.toBestFriend = "Reputazione per il migliore amico"
-- to chat
REP_TXT.stats	= " (Total: %s%d, Left: %d)"
REP_TXT.statsNextStanding = " (Total: %s%d, Left to %s: %d)"
-- config changed
REP_TXT.configQuestion	= "Alcune (nuove) impostazioni sono state abilitate. Questa operazione viene eseguita solo una volta per un'impostazione. Si consiglia di verificare le opzioni Reputazione."
REP_TXT.showConfig	= "Visualizza configurazione"
REP_TXT.later	= "Dopo"
-- UpdateList
REP_TXT.mobShort	= "[M]"
REP_TXT.questShort	= "[Q]"
REP_TXT.instanceShort	= "[D]"
REP_TXT.itemsShort	= "[I]"
REP_TXT.generalShort	= "[G]"
REP_TXT.mobHead	= "Guadagna reputazione uccidendo questo mob"
REP_TXT.questHead	= "Guadagna reputazione completando questa missione"
REP_TXT.instanceHead	= "Guadagna reputazione eseguendo questa istanza"
REP_TXT.itemsHead	= "Guadagna reputazione consegnando oggetti"
REP_TXT.generalHead	= "Informazioni generali sul guadagno di reputazione"
REP_TXT.mobTip	= "Ogni volta che uccidi questo mob, guadagni reputazione. Farlo abbastanza spesso ti aiuterà a raggiungere il livello successivo."
REP_TXT.questTip	= "Ogni volta che completi questa missione ripetibile o giornaliera, guadagni reputazione. Farlo abbastanza spesso ti aiuterà a raggiungere il livello successivo."
REP_TXT.instanceTip	= "Ogni volta che esegui questa istanza, guadagni reputazione. Farlo abbastanza spesso ti aiuterà a raggiungere il livello successivo."
REP_TXT.itemsName	= "Consegna dell'articolo"
REP_TXT.itemsTip	= "Ogni volta che consegni gli oggetti elencati, guadagnerai reputazione. Farlo abbastanza spesso ti aiuterà a raggiungere il livello successivo."
REP_TXT.generalTip	= "Si tratta di informazioni sul guadagno di reputazione con una fazione che non si riferiscono necessariamente a metodi di guadagno ripetibili."
REP_TXT.allOfTheAbove	= "Sommario delle %d missioni elencate sopra"
REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
REP_TXT.questSummaryTip	= "Questa voce mostra un riepilogo di tutte le missioni di cui sopra.\r\n Questo è utile assumendo che tutte le missioni elencate sono missioni al giorno, in quanto questo vi mostrerà quanti giorni ci vorranno per raggiungere il prossimo livello di reputazione se si fa tutte le quest giornaliere ogni giorno."
REP_TXT.complete	= "completo"
REP_TXT.active	= "attivo"
REP_TXT.inBag	= "Nelle borse"
REP_TXT.turnIns	= "Riconse:"
REP_TXT.reputation	= "Reputazione:"
REP_TXT.reputationCap	= "Limite di reputazione:"
REP_TXT.reputationCapCurrent	= "Reputazione attuale:"
REP_TXT.inBagBank	= "In borse e banca"
REP_TXT.questCompleted	= "Missione completata"
REP_TXT.timesToDo	= "Tempi da fare:"
REP_TXT.instance2	= "Esempio:"
REP_TXT.mode	= "Mode:"
REP_TXT.timesToRun	= "Tempi per correre:"
REP_TXT.mob2	= "Mob:"
REP_TXT.location	= "Posizione:"
REP_TXT.toDo	= "Fare:"
REP_TXT.quest2	= "Missione:"
REP_TXT.itemsRequired	= "Articoli richiesti"
REP_TXT.general2	= "Generale:"
REP_TXT.maxStanding	= "Guadagna reputazione fino a quando"
-- skills
REP_TXT.skillHerb	= "Herbalism"
REP_TXT.skillMine	= "Minerario"
REP_TXT.skillSkin	= "Scuoiatura"
REP_TXT.skillAlch	= "alchimia"
REP_TXT.skillBlack	= "forgiatura"
REP_TXT.skillEnch	= "incantevole"
REP_TXT.skillEngi	= "Ingegneria"
REP_TXT.skillIncrip	= "Iscrizione"
REP_TXT.skillJewel	= "Lavorazione del gioiello"
REP_TXT.skillLeath	= "lavorazione della pelle"
REP_TXT.skillTail	= "Sartoria"
REP_TXT.skillAid	= "Pronto soccorso"
REP_TXT.skillArch	= "Archeologia"
REP_TXT.skillCook	= "Cottura"
REP_TXT.skillFish	= "peschereccio"
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
REP_TXT.STAND_LV[0]	= "Sconosciuto"
REP_TXT.STAND_LV[1]	= "Odiato"
REP_TXT.STAND_LV[2]	= "Scortese"
REP_TXT.STAND_LV[3]	= "Scortese"
REP_TXT.STAND_LV[4]	= "Neutro"
REP_TXT.STAND_LV[5]	= "Amichevole"
REP_TXT.STAND_LV[6]	= "Onorato"
REP_TXT.STAND_LV[7]	= "Venerato"
REP_TXT.STAND_LV[8]	= "Esaltato"
REP_TXT.STAND_LV[9] = "Eccellenza"
---- Tier standings
REP_TXT.STAND_LV_TIER[0]	= "Sconosciuto"
REP_TXT.STAND_LV_TIER[1] = "Livello 1"
REP_TXT.STAND_LV_TIER[2] = "Livello 2"
REP_TXT.STAND_LV_TIER[3] = "Livello 3"
REP_TXT.STAND_LV_TIER[4] = "Livello 4"
REP_TXT.STAND_LV_TIER[5] = "Livello 5"
REP_TXT.STAND_LV_TIER[6] = "Livello 6"
---- Trust standings
REP_TXT.STAND_LV_TRUST[0] = "Sconosciuto"
REP_TXT.STAND_LV_TRUST[1] = "Dubbiosa"
REP_TXT.STAND_LV_TRUST[2] = "Ansiosa"
REP_TXT.STAND_LV_TRUST[3] = "Incerta"
REP_TXT.STAND_LV_TRUST[4] = "Esitante"
REP_TXT.STAND_LV_TRUST[5] = "Cordiale"
REP_TXT.STAND_LV_TRUST[6] = "Riconoscente"
---- Renown standings
REP_TXT.STAND_LV_RENOWN[0] = "Sconosciuto"
REP_TXT.STAND_LV_RENOWN[1] = "Fama 1"
REP_TXT.STAND_LV_RENOWN[2] = "Fama 2"
REP_TXT.STAND_LV_RENOWN[3] = "Fama 3"
REP_TXT.STAND_LV_RENOWN[4] = "Fama 4"
REP_TXT.STAND_LV_RENOWN[5] = "Fama 5"
REP_TXT.STAND_LV_RENOWN[6] = "Fama 6"
REP_TXT.STAND_LV_RENOWN[7] = "Fama 7"
REP_TXT.STAND_LV_RENOWN[8] = "Fama 8"
REP_TXT.STAND_LV_RENOWN[9] = "Fama 9"
REP_TXT.STAND_LV_RENOWN[10] = "Fama 10"
REP_TXT.STAND_LV_RENOWN[11] = "Fama 11"
REP_TXT.STAND_LV_RENOWN[12] = "Fama 12"
REP_TXT.STAND_LV_RENOWN[13] = "Fama 13"
REP_TXT.STAND_LV_RENOWN[14] = "Fama 14"
REP_TXT.STAND_LV_RENOWN[15] = "Fama 15"
REP_TXT.STAND_LV_RENOWN[16] = "Fama 16"
REP_TXT.STAND_LV_RENOWN[17] = "Fama 17"
REP_TXT.STAND_LV_RENOWN[18] = "Fama 18"
REP_TXT.STAND_LV_RENOWN[19] = "Fama 19"
REP_TXT.STAND_LV_RENOWN[20] = "Fama 20"
REP_TXT.STAND_LV_RENOWN[21] = "Fama 21"
REP_TXT.STAND_LV_RENOWN[22] = "Fama 22"
REP_TXT.STAND_LV_RENOWN[23] = "Fama 23"
REP_TXT.STAND_LV_RENOWN[24] = "Fama 24"
REP_TXT.STAND_LV_RENOWN[25] = "Fama 25"
---- BFF Labels
REP_TXT.BFFLabels[2135] = {} -- Draghetto
REP_TXT.BFFLabels[2135][1] = "Allievo Temporale"
REP_TXT.BFFLabels[2135][2] = "Erologo"
REP_TXT.BFFLabels[2135][3] = "Cronoamico"
REP_TXT.BFFLabels[2135][4] = "Alleato di Bronzo"
REP_TXT.BFFLabels[2135][5] = "Guaritore delle Ere"
REP_TXT.BFFLabels[2135][6] = "Signore delle Ere"

---------------------------
-- Tooltips
---------------------------
---- Initialize
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}
---- Names and tips
REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "Aprire una finestra per configurare Reputations."
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "Se questa casella non è selezionata, l'elenco fazione viene visualizzata per impostazione predefinita (Blizzard) ordinamento, raggruppate per ordine logico e alfabetico. \r \n \r \nSe questa casella è selezionata, l'elenco fazione è ordinato per data. \r \n\r \nPer vista i | cFFFAA0A0inactive | r fazioni , deselezionare questa casella e andare in fondo alla lista."
REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "Selezionare questo pulsante per vedere mob si può uccidere per migliorare la vostra reputazione."
REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "Controllare questo pulsante per visualizzare le quest si possono fare per migliorare la vostra reputazione."
REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "Controllare questo pulsante per visualizzare le PvP quest si possono fare per migliorare la vostra reputazione."
REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
REP_TXT.elements.tip.REP_ShowItemsButton	= "Selezionare questo pulsante per visualizzare gli elementi possono essere consegnati in per migliorare la vostra reputazione."
REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
REP_TXT.elements.tip.REP_ShowInstancesButton	= "Controllare questo pulsante per visualizzare le istanze è possibile eseguire per migliorare la vostra reputazione."
REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
REP_TXT.elements.tip.REP_ShowGeneralButton	= "Selezionare questo pulsante per visualizzare le informazioni generali su come migliorare la vostra reputazione."
REP_TXT.elements.name.REP_ShowAllButton	= REP_TXT.showAll
REP_TXT.elements.tip.REP_ShowAllButton	= "Premere questo pulsante per controllare tutti e quattro le caselle di controllo a sinistra. \r\nQuesto mostrerà mob, quest, oggetti e istanze che ti danno reputazione per la fazione attualmente selezionato."
REP_TXT.elements.name.REP_ShowNoneButton	= REP_TXT.showNone
REP_TXT.elements.tip.REP_ShowNoneButton	= "Premere questo pulsante per deselezionare tutte e quattro le caselle di controllo a sinistra. \r\nQuesto ti mostrerà nessuno dei modi per guadagnare reputazione per la fazione attualmente selezionato."
REP_TXT.elements.name.REP_ExpandButton	= REP_TXT.expand
REP_TXT.elements.tip.REP_ExpandButton	= "Premere questo pulsante per espandere tutte le voci della lista. Questo ti mostrerà i materiali necessari a portata di mano in qualsiasi elemento in grado di raccogliere quest."
REP_TXT.elements.name.REP_CollapseButton	= REP_TXT.collapse
REP_TXT.elements.tip.REP_CollapseButton	= "Premere questo pulsante per comprimere tutte le voci della lista. In questo modo nascondere i materiali necessari a portata di mano nella raccolta di missioni."
REP_TXT.elements.name.REP_SupressNoneFactionButton	= REP_TXT.supressNoneFaction
REP_TXT.elements.tip.REP_SupressNoneFactionButton	= "Premere questo tasto per riattivare tutte le missioni per questa fazione che è stata esclusa da righ-clic su di esso."
REP_TXT.elements.name.REP_SupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
REP_TXT.elements.tip.REP_SupressNoneGlobalButton	= "Premere questo tasto per riattivare tutte le missioni per tutte le fazioni che hai escluso facendo clic destro su di esso."
REP_TXT.elements.name.REP_ClearSessionGainButton	= REP_TXT.clearSessionGain
REP_TXT.elements.tip.REP_ClearSessionGainButton	= "Premere questo pulsante per cancellare azzerare il contatore per la reputazione acquisita questa sessione."
REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
REP_TXT.elements.tip.REP_EnableMissingBox	= "Abilitare questa opzione per aggiungere i punti reputazione mancanti necessari per il prossimo livello di reputazione alle spalle l'attuale posizione di ogni fazione nella cornice reputazione."
REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Attivare questa impostazione per visualizzare una reputazione telaio dettaglio esteso. \r\nInoltre le informazioni mostrate nella cornice dettaglio originale, questa verrà visualizzata la reputazione mancante necessario per raggiungere il prossimo livello di reputazione e di una lista di modi per guadagnare questa reputazione elencando quest, mob, oggetti e istanze che producono reputazione per la fazione scelta."
REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
REP_TXT.elements.tip.REP_GainToChatBox	= "Attivare questa impostazione per visualizzare la reputazione acquisita per tutte le fazioni ogni volta che si guadagna la reputazione. \r\nQuesto differisce dal modo standard di segnalazione guadagno di reputazione, come di norma, solo il guadagno con la fazione principale è elencato."
REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
REP_TXT.elements.tip.REP_NoGuildGainBox	= "Abilitare questa impostazione per non stampare i messaggi di chattare reputazione gilda."
REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "Attivare questa impostazione per sopprimere i messaggi standard guadagnare reputazione. \r\nQuesto ha senso se hai attivato i dettagliati messaggi guadagno fazione, in modo da non avere annunci identici alle versioni standard ed estesa."
REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "Attivare questa impostazione per mostrare la reputazione si può guadagnare consegnando oggetti e Incarichi come una barra grigia sovrapposto sopra la normale barra reputazione nella cornice reputazione."
REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "Abilitare questa opzione per passare automaticamente alla fazione di essere guardato per l'ultima fazione che tu hai guadagnato reputazione per."
REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "Attivare questa impostazione per non cambiare la fazione guardato per gilda guadagni reputazione."
REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
REP_TXT.elements.tip.REP_SilentSwitchBox	= "Attivare questa impostazione per attivare la barra di reputazione in silenzio (senza un messaggio di chat)."
REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
REP_TXT.elements.name.REP_ChatFrameSlider	= "Chatta telaio"
REP_TXT.elements.tip.REP_ChatFrameSlider	= "Selezionare quale chiacchierata cornice Reputations stampa i suoi messaggi."
REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
REP_TXT.elements.tip.REP_EnableParagonBarBox  = "Abilita questa opzione per visualizzare i tuoi attuali progressi d'eccellenza nelle barre della reputazione."
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
REP_TXT.settings.buffTitle = "Appassionati di reputazione"
REP_TXT.settings.buffSubTitle = "Puoi attivare questi potenziamenti della reputazione per vedere quanta reputazione otterresti da diverse attività. I buff che non si accumulano verranno disabilitati quando si alternano le loro controparti."
---- Buffs
REP_TXT.settings.harvestBountyRepBuff = "Spirito della Condivisione (Ringraziamento del Pellegrino)"
REP_TXT.settings.info.harvestBountyRepBuff = "Aumenta la reputazione ottenuta del 10%. Dura 1 ora."
REP_TXT.settings.wickermanRepBuff = "Invocazione dell'Uomo di Vimini (Fine delle Ombre)"
REP_TXT.settings.info.wickermanRepBuff = "Aumenta l'esperienza guadagnata e la reputazione acquisita del 10%. Dura 2 ore."
REP_TXT.settings.wickermanRepBuffUnburdened = "Alleggerito (Fine delle Ombre)"
REP_TXT.settings.info.wickermanRepBuffUnburdened = "Hai gettato le tue preoccupazioni nel fuoco dell'Uomo di Vimini. Aumenta l'esperienza guadagnata e la reputazione acquisita del 10%. Dura 2 ore."
REP_TXT.settings.wickermanRepBuffGrimVisage = "Volto cupo (Fine delle Ombre)"
REP_TXT.settings.info.wickermanRepBuffGrimVisage = "Ti sei dipinto il viso con le ceneri del Wickerman. Aumenta l'esperienza guadagnata e la reputazione acquisita del 10%. Dura 2 ore."
REP_TXT.settings.MrPopularityRankOne = "Signor popolarità (Vantaggio della gilda, grado 1)"
REP_TXT.settings.info.MrPopularityRankOne = "La reputazione guadagnata uccidendo mostri e completando missioni è aumentata del 5%."
REP_TXT.settings.MrPopularityRankTwo = "Signor popolarità (Vantaggio della gilda, grado 2)"
REP_TXT.settings.info.MrPopularityRankTwo = "La reputazione ottenuta uccidendo mostri e completando missioni è aumentata del 10%."
REP_TXT.settings.DarkmoonFaireWeeRepBuff = "WHEE! (Fiera di Lunacupa)"
REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "Giro sulla Giostra di Lunacupa o sull'ottovolante completato. Esperienza e reputazione guadagnate aumentate del 10%."
REP_TXT.settings.DarkmoonFaireHatRep = "Cilindro di Lunacupa (Fiera di Lunacupa)"
REP_TXT.settings.info.DarkmoonFaireHatRep = "Aumenta l'esperienza e la reputazione guadagnate del 10% per 1 hour. Con l'utilizzo si consuma."
end
