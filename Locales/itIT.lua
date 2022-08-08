-- Italiano (Italian)	
--------------------	--------------------
if (GetLocale() =="itIT") then	
	
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
REP_TXT_STAND_LV	= {}
REP_TXT_STAND_LV[0]	= "Sconosciuto"
REP_TXT_STAND_LV[1]	= "Odiato"
REP_TXT_STAND_LV[2]	= "Scortese"
REP_TXT_STAND_LV[3]	= "Scortese"
REP_TXT_STAND_LV[4]	= "Neutro"
REP_TXT_STAND_LV[5]	= "Amichevole"
REP_TXT_STAND_LV[6]	= "Onorato"
REP_TXT_STAND_LV[7]	= "Venerato"
REP_TXT_STAND_LV[8]	= "Esaltato"
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
REP_TXT.usingChatFrame	= "Now using chat frame"
REP_TXT.EnableParagonBar = "Display paragon reputation in bars."
-- various LUA	
REP_TXT.options	= "Options"
REP_TXT.orderByStanding	= "Order by Standing"
REP_TXT.lookup	= "Looking up faction "
REP_TXT.allFactions	= "Mostra tutte le fazioni"
REP_TXT.missing	= "(to next)"
REP_TXT.missing2	= "Missing"
REP_TXT.heroic	= "Heroic"
REP_TXT.normal	= "Normal"
REP_TXT.switchBar	= "Changing reputation bar to"
-- REP_ShowFactions	
REP_TXT.faction	= "Fazione"
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
REP_TXT.AU	= "Any Unnamed"
REP_TXT.AN	= "Any named"
REP_TXT.BB	= "Bloodsail Buccaneer"
REP_TXT.SSP	= "Southsea Pirate"
REP_TXT.Wa	= "Wastewander"
REP_TXT.VCm	= "Any Venture Co. mob"
REP_TXT.Mob.MoshOgg_Spellcrafter = "Creamagie Mosh'ogg"
REP_TXT.Mob.BoulderfistOgre = "Ogre Rocciadura"
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
REP_TXT.currentRep	= "Reputazione corrente"
REP_TXT.neededRep	= "Reputation needed"
REP_TXT.missingRep	= "Reputation missing"
REP_TXT.repInBag	= "Reputation in bag"
REP_TXT.repInBagBank	= "Reputation in bag & bank"
REP_TXT.repInQuest	= "Reputation in quests"
REP_TXT.factionGained	= "Guadagnato questa sessione"
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
REP_TXT.generalHead	= "Informazioni generali sul guadagno di reputazione"
REP_TXT.mobTip	= "Each time you kill this mob, you gain reputation. Doing this often enough, will help you reach the next level."
REP_TXT.questTip	= "Each time you complete this repeatable or daily quest, you gain reputation. Doing this often enough, will help you reach the next level."
REP_TXT.instanceTip	= "Each time you run this instance, you gain reputation. Doing this often enough, will help you reach the next level."
REP_TXT.itemsName	= "Item hand-in"
REP_TXT.itemsTip	= "Each time you hand in the listed items, you will gain reputation. Doing this often enough, will help you reach the next level."
REP_TXT.generalTip	= "This is information about reputation gain with a faction that does not necessarily relate to repeatable gain methods."
REP_TXT.allOfTheAbove	= "Sommario delle %d missioni elencate sopra"
REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
REP_TXT.questSummaryTip	= "Questa voce mostra un riepilogo di tutte le missioni di cui sopra.\r\n Questo è utile assumendo che tutte le missioni elencate sono missioni al giorno, in quanto questo vi mostrerà quanti giorni ci vorranno per raggiungere il prossimo livello di reputazione se si fa tutte le quest giornaliere ogni giorno."
REP_TXT.complete	= "completo"
REP_TXT.active	= "attivo"
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
REP_TXT.general2	= "Generale:"
REP_TXT.maxStanding	= "Yields reputation until"
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
-- Tooltip	
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}
	
REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "Aprire una finestra per configurare Reputations."
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "Se questa casella non è selezionata, l'elenco fazione viene visualizzata per impostazione predefinita (Blizzard) ordinamento, raggruppate per ordine logico e alfabetico. \r \n \r \nSe questa casella è selezionata, l'elenco fazione è ordinato per data. \r \n\r \nPer vista i | cFFFAA0A0inactive | r fazioni , deselezionare questa casella e andare in fondo alla lista."
	
REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "Selezionare questo pulsante per vedere mob si può uccidere per migliorare la vostra reputazione."
REP_TXT.elements.name.REP_ShowQuestButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowQuestButton	= "Controllare questo pulsante per visualizzare le quest si possono fare per migliorare la vostra reputazione."
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