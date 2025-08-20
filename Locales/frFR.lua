-------------------------
-- Français (French) --
-------------------------
if (GetLocale() =="frFR") then
  -- Binding names
  BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
  BINDING_NAME_SHOWCONFIG	= "Afficher les options fenêtre"
  BINDING_NAME_SHOWDETAILS	= "Fenêtre Montrer détail réputation"

  REP_TXT	= {}
  REP_TXT.Mob = {}
  -- help
  REP_TXT.help	= "Un outil pour gérer votre réputation"
  REP_TXT.command	= "Impossible d'analyser la commande"
  REP_TXT.usage	= "Usage"
  REP_TXT.helphelp	= "Voir cette aide"
  REP_TXT.helpabout	= "Voir les informations sur l'auteur"
  REP_TXT.helpstatus	= "Afficher l'état de configuration"
  -- about
  REP_TXT.by	= "par"
  REP_TXT.version	= "Version"
  REP_TXT.date	= "date"
  REP_TXT.web	= "site Web"
  REP_TXT.slash	= "slash commande"
  -- status
  REP_TXT.status	= "statut"
  REP_TXT.disabled	= "désactivé"
  REP_TXT.enabled	= "activé"
  REP_TXT.statMobs	= "Afficher Mobs [M]"
  REP_TXT.statQuests	= "Afficher Quêtes[Q]"
  REP_TXT.statInstances	= "Afficher Donjons [D]"
  REP_TXT.statItems	= "Afficher Objets [I]"
  REP_TXT.statGeneral	= "Afficher Général [G]"
  REP_TXT.statMissing	= "Voir réputation manquante"
  REP_TXT.statDetails	= "Afficher le cadre détaillé"
  REP_TXT.statChat	= "Message de discussion détaillé"
  REP_TXT.statNoGuildChat	= "Pas de chat pour la réputation de guilde"
  REP_TXT.statSuppress	= "Suppression du message de chat original"
  REP_TXT.statPreview	= "Afficher l'aperçu dans le cadre réputation"
  REP_TXT.statSwitch	= "Basculer automatiquement la barre de réputation de faction"
  REP_TXT.statNoGuildSwitch	= "Pas de commutation pour réputation de guilde "
  REP_TXT.statSilentSwitch	= "Aucun message lors du changement de barre"
  REP_TXT.statGuildCap	= "Afficher le CAP de réputation de guilde dans le chat"
  -- XML UI elements
  REP_TXT.showQuests	= "Quêtes"
  REP_TXT.showPvPQuests	= "PvP Quêtes"
  REP_TXT.showInstances	= "Donjons"
  REP_TXT.showMobs	= "Mobs"
  REP_TXT.showItems	= "Objets"
  REP_TXT.showGeneral	= "Général"
  REP_TXT.showAll	= "Tout afficher"
  REP_TXT.showNone	= "Tout Cacher"
  REP_TXT.expand	= "Etendre"
  REP_TXT.collapse	= "Réduire"
  REP_TXT.supressNoneFaction	= "Annuler exclusions faction"
  REP_TXT.supressNoneGlobal	= "Annuler toutes exclusions"
  REP_TXT.suppressHint	= "Faites un clic droit sur une quête pour l'exclure du résumé"
  REP_TXT.clearSessionGain	= "Zéro du compteur de gain séance"
  REP_TXT.moveToInactive = "Déplacer vers inactif"
  REP_TXT.showFactionOnMainscreen = "Afficher la faction à côté \nde la barre d'xp"
  -- options dialog
  REP_TXT.showMissing	= "Afficher la réputation manquante dans le cadre réputation"
  REP_TXT.extendDetails	= "Afficher la fenêtree de réputation détaillée"
  REP_TXT.gainToChat	= "Remplacer le message original de gain de réputation de faction par un message plus détaillé"
  REP_TXT.noGuildGain	= "Pas de message de réputation de guilde dans la fenêtre de chat"
  REP_TXT.suppressOriginalGain	= "Supprimer le message original de gain de réputation de faction"
  REP_TXT.showPreviewRep	= "Afficher la réputation qui peut être obtenue dans le cadre réputation"
  REP_TXT.switchFactionBar	= "Basculer la barre de réputation vèrs la faction lors d'un gain de réputation"
  REP_TXT.noGuildSwitch	= "Pas de barre de réputation pour la réputation de guilde"
  REP_TXT.silentSwitch	= "Aucun message de chat lors de la commutation de barre"
  REP_TXT.guildCap	= "Afficher le CAP de réputation de guilde dans le chat"
  REP_TXT.defaultChatFrame	= "Utilisation de la fenêtre de discussion par défaut"
  REP_TXT.chatFrame	= "Utilisation de la fenêtre de discussion %d (%s)"
  REP_TXT.usingDefaultChatFrame	= "Fenêtre de discussion par défaut activée"
  REP_TXT.usingChatFrame	= "Fenêtre de discussion personnalisée acivée"
  REP_TXT.EnableParagonBar = "Afficher la reputation paragon dans les barres."
  -- various LUA
  REP_TXT.options	= "options d'"
  REP_TXT.orderByStanding	= "Trier par niveau de réputation"
  REP_TXT.lookup	= "Suivre la faction"
  REP_TXT.allFactions	= "Liste de toutes les factions"
  REP_TXT.missing	= "(suivant)"
  REP_TXT.missing2	= "manquant"
  REP_TXT.heroic	= "héroïque"
  REP_TXT.normal	= "normale"
  REP_TXT.switchBar	= "Modification de la barre de réputation vèrs"
  -- REP_ShowFactions
  REP_TXT.faction	= "Faction"
  REP_TXT.is	= "est"
  REP_TXT.withStanding	= "Avec le niveau"
  REP_TXT.needed	= "obligatoire"
  REP_TXT.mob	= "[Mob]"
  REP_TXT.limited	= "est limité à"
  REP_TXT.limitedPl	= "sont limités à"
  REP_TXT.quest	= "[Quête]"
  REP_TXT.instance	= "[Instance]"
  REP_TXT.items	= "[Objets]"
  REP_TXT.unknown	= "n'est pas connu de ce personnage"
  REP_TXT.guildReputation	= "Guild reputation"
  -- mob Details
  REP_TXT.tmob	= "trash mob"
  REP_TXT.oboss	= "autres boss"
  REP_TXT.aboss	= "Tous les boss"
  REP_TXT.pboss	= "par boss"
  REP_TXT.fclear	= "Effacement complet"
  REP_TXT.AU	= "Tous les inconnus"
  REP_TXT.AN	= "Tous les connus"
  REP_TXT.BB	= "Boucanier de la Voile Sanglante"
  REP_TXT.SSP	= "Pirate des Mers du Sud"
  REP_TXT.Wa	= "Bat-le-Désert"
  REP_TXT.VCm	= "Tout mob de la KapitalRisk "
  REP_TXT.Mob.MoshOgg_Spellcrafter = "Magicien mosh'Ogg"
  REP_TXT.Mob.BoulderfistOgre = "Ogre Rochepoing"
  -- Quest Details
  REP_TXT.cdq	= "quêtes journalières cuisine ville principale"
  REP_TXT.coq	= "quêtes journalières cuisine autre ville "
  REP_TXT.fdq	= "quêtes journalières pêche ville principale"
  REP_TXT.foq	= "quêtes journalières pêche autre ville"
  REP_TXT.ndq	= "aucune quête journalière"
  REP_TXT.deleted	= "dépassé"
  REP_TXT.Championing	= "Défendre (Tabard)"
  REP_TXT.bpqfg	= "En pourcentage du gain de faction de la quête"
  -- items Details
  REP_TXT.cbadge	= "Ecusson de mérite d'une autre ville"
  -- instance Details
  REP_TXT.srfd	= "Retombées de donjons"
  REP_TXT.tbd	= "A faire"
  REP_TXT.nci	= "Instances Cataclysm normales"
  REP_TXT.hci	= "Instances Cataclysm Heroïques"
  REP_TXT.ncit	= "Instances normales de Cataclysm avec tabard de faction"
  REP_TXT.hcit	= "Instances de Cataclysme héroïque avec tabard de faction"
  -- ToBeDone general
  REP_TXT.tfr	= "Tiller agriculture représentant"
  REP_TXT.nswts	= "Ne sais pas quand cela commence"
  REP_TXT.mnd	= "Nombre maximum de quêtes journalières"
  REP_TXT.mnds	= "Le nombre quotidien maximum est de "
  -- ReputationDetails
  REP_TXT.currentRep	= "Réputation actuelle"
  REP_TXT.neededRep	= "Réputation nécessaire"
  REP_TXT.missingRep	= "Réputation manquante"
  REP_TXT.repInBag	= "Réputation dans les sacs"
  REP_TXT.repInBagBank	= "Réputation dans les sacs et à la banque"
  REP_TXT.repInQuest	= "Réputation en quêtes"
  REP_TXT.factionGained	= "Acquis cette session"
  REP_TXT.noInfo	= "Aucune information disponible pour cette faction / réputation."
  REP_TXT.toExalted	= "Réputation à Exalté"
  REP_TXT.toBestFriend = "Reputation à Amical"
  -- to chat
  REP_TXT.stats	= " (Totale: %s%d, Reste: %d)"
  REP_TXT.statsNextStanding = " (Total: %s%d, Left to %s: %d)"
  -- config changed
  REP_TXT.configQuestion	= "Une (nouvelle) configuration a été activée. Ceci n'a lieu qu'une fois par configuration. Il est recommandé de vérifier les options de Reputations."
  REP_TXT.showConfig	= "Afficher Config"
  REP_TXT.later	= "Plus tard"
  -- UpdateList
  REP_TXT.mobShort	= "[M]"
  REP_TXT.questShort	= "[Q]"
  REP_TXT.instanceShort	= "[D]"
  REP_TXT.itemsShort	= "[I]"
  REP_TXT.generalShort	= "[G]"
  REP_TXT.mobHead	= "Gain de réputation en tuant ce mob"
  REP_TXT.questHead	= "Gain de réputation en validant cette quête"
  REP_TXT.instanceHead	= "Gain de réputation en faisant ce donjon"
  REP_TXT.itemsHead	= "Gain de réputation en remettant cet objet"
  REP_TXT.generalHead	= "Informations générales sur les gains de réputation"
  REP_TXT.mobTip	= "Chaque fois que vous tuez ce mob, vous gagnez de la réputation. Le faire souvent vous aidera à atteindre le niveau suivant."
  REP_TXT.questTip	= "Chaque fois que vous effectuez cette quête journalière ou répétable, vous gagnez de la réputation. Le faire souvent vous aidera à atteindre le niveau suivant.."
  REP_TXT.instanceTip	= "Chaque fois que vous faites ce donjon, vous gagnez de la réputation. Le faire souvent vous aidera à atteindre le niveau suivant.."
  REP_TXT.itemsName	= "Remise d'objet"
  REP_TXT.itemsTip	= "Chaque fois que vous remettez cet objet, vous gagnez de la réputation. Le faire souvent vous aidera à atteindre le niveau suivant.."
  REP_TXT.generalTip	= "Informatiopns à propos du gain de réputation avec une faction non forcément rattaché à une mission répétable."
  REP_TXT.allOfTheAbove	= "Résumé des %d quêtes citées ci-dessus"
  REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
  REP_TXT.questSummaryTip	= "Cette entrée montre un résumé des quêtes citées ci-dessus.\r\nceci n'a du sens que si toutes les quêtes mentionnées sont journalières, puisque ceci indique combien de jours seront nécessaires pour atteindre le niveau de réputation suivant si vous réalisez toutes les quêtes chaque jour."
  REP_TXT.complete	= "complète"
  REP_TXT.active	= "active"
  REP_TXT.inBag	= "Dans les sacs"
  REP_TXT.turnIns	= "Remis:"
  REP_TXT.reputation	= "Réputation:"
  REP_TXT.reputationCap	= "CAP de Réputation :"
  REP_TXT.reputationCapCurrent	= "Réputation actuelle:"
  REP_TXT.inBagBank	= "Dans les sacs et à la banque"
  REP_TXT.questCompleted	= "Quête complétée"
  REP_TXT.timesToDo	= "Nombre de fois à répéter:"
  REP_TXT.instance2	= "Instance:"
  REP_TXT.mode	= "Mode:"
  REP_TXT.timesToRun	= "Nombre de fois à répéter:"
  REP_TXT.mob2	= "Mob:"
  REP_TXT.location	= "Localisation:"
  REP_TXT.toDo	= "à faire:"
  REP_TXT.quest2	= "Quête:"
  REP_TXT.itemsRequired	= "Objets nécessaires"
  REP_TXT.general2	= "Géneral:"
  REP_TXT.maxStanding	= "Donne de la réputation jusqu'à "
  REP_TXT.renown = "Renown"
  -- skills
  REP_TXT.skillHerb	= "Herborisme"
  REP_TXT.skillMine	= "Minage"
  REP_TXT.skillSkin	= "Dépecage"
  REP_TXT.skillAlch	= "Alchimie"
  REP_TXT.skillBlack	= "Forge"
  REP_TXT.skillEnch	= "Enchantement"
  REP_TXT.skillEngi	= "Ingénierie"
  REP_TXT.skillIncrip	= "Calligraphie"
  REP_TXT.skillJewel	= "Joaillerie"
  REP_TXT.skillLeath	= "Travail du cuir"
  REP_TXT.skillTail	= "Couture"
  REP_TXT.skillAid	= "Premiers soins"
  REP_TXT.skillArch	= "Archéologie"
  REP_TXT.skillCook	= "Cuisine"
  REP_TXT.skillFish	= "Pêche"
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
  REP_TXT.STAND_LV[0]	= "Inconnue"
  REP_TXT.STAND_LV[1]	= "Détesté"
  REP_TXT.STAND_LV[2]	= "Hostile"
  REP_TXT.STAND_LV[3]	= "Défavorable"
  REP_TXT.STAND_LV[4]	= "Neutre"
  REP_TXT.STAND_LV[5]	= "Amical"
  REP_TXT.STAND_LV[6]	= "Honoré"
  REP_TXT.STAND_LV[7]	= "Révéré"
  REP_TXT.STAND_LV[8]	= "Exalté"
  REP_TXT.STAND_LV[9] = "Parangon"
  ---- Tier standings
  REP_TXT.STAND_LV_TIER[0] = "Inconnue"
  REP_TXT.STAND_LV_TIER[1] = "Palier 1"
  REP_TXT.STAND_LV_TIER[2] = "Palier 2"
  REP_TXT.STAND_LV_TIER[3] = "Palier 3"
  REP_TXT.STAND_LV_TIER[4] = "Palier 4"
  REP_TXT.STAND_LV_TIER[5] = "Palier 5"
  REP_TXT.STAND_LV_TIER[6] = "Palier 6"
  ---- Trust standings
  REP_TXT.STAND_LV_TRUST[0] = "Inconnue"
  REP_TXT.STAND_LV_TRUST[1] = "Méfiance"
  REP_TXT.STAND_LV_TRUST[2] = "Crainte"
  REP_TXT.STAND_LV_TRUST[3] = "Hésitation"
  REP_TXT.STAND_LV_TRUST[4] = "Incertitude"
  REP_TXT.STAND_LV_TRUST[5] = "Bienveillance"
  REP_TXT.STAND_LV_TRUST[6] = "Reconnaissance"
  ---- Renown standings
  REP_TXT.STAND_LV_RENOWN[0] = "Inconnue"
  REP_TXT.STAND_LV_RENOWN[1] = "Renom 1"
  REP_TXT.STAND_LV_RENOWN[2] = "Renom 2"
  REP_TXT.STAND_LV_RENOWN[3] = "Renom 3"
  REP_TXT.STAND_LV_RENOWN[4] = "Renom 4"
  REP_TXT.STAND_LV_RENOWN[5] = "Renom 5"
  REP_TXT.STAND_LV_RENOWN[6] = "Renom 6"
  REP_TXT.STAND_LV_RENOWN[7] = "Renom 7"
  REP_TXT.STAND_LV_RENOWN[8] = "Renom 8"
  REP_TXT.STAND_LV_RENOWN[9] = "Renom 9"
  REP_TXT.STAND_LV_RENOWN[10] = "Renom 10"
  REP_TXT.STAND_LV_RENOWN[11] = "Renom 11"
  REP_TXT.STAND_LV_RENOWN[12] = "Renom 12"
  REP_TXT.STAND_LV_RENOWN[13] = "Renom 13"
  REP_TXT.STAND_LV_RENOWN[14] = "Renom 14"
  REP_TXT.STAND_LV_RENOWN[15] = "Renom 15"
  REP_TXT.STAND_LV_RENOWN[16] = "Renom 16"
  REP_TXT.STAND_LV_RENOWN[17] = "Renom 17"
  REP_TXT.STAND_LV_RENOWN[18] = "Renom 18"
  REP_TXT.STAND_LV_RENOWN[19] = "Renom 19"
  REP_TXT.STAND_LV_RENOWN[20] = "Renom 20"
  REP_TXT.STAND_LV_RENOWN[21] = "Renom 21"
  REP_TXT.STAND_LV_RENOWN[22] = "Renom 22"
  REP_TXT.STAND_LV_RENOWN[23] = "Renom 23"
  REP_TXT.STAND_LV_RENOWN[24] = "Renom 24"
  REP_TXT.STAND_LV_RENOWN[25] = "Renom 25"
  ---- Rank standings
  REP_TXT.STAND_LV_MAX_RANK = "Rang max."
  REP_TXT.STAND_LV_RANK[0] = "Inconnue"
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
  REP_TXT.STAND_LV_LEVEL[0] = "Inconnue"
  REP_TXT.STAND_LV_LEVEL[1] = "Niveau 1"
  REP_TXT.STAND_LV_LEVEL[2] = "Niveau 2"
  REP_TXT.STAND_LV_LEVEL[3] = "Niveau 3"
  REP_TXT.STAND_LV_LEVEL[4] = "Niveau 4"
  REP_TXT.STAND_LV_LEVEL[5] = "Niveau 5"
  REP_TXT.STAND_LV_LEVEL[6] = "Niveau 6"
  REP_TXT.STAND_LV_LEVEL[7] = "Niveau 7"
  REP_TXT.STAND_LV_LEVEL[8] = "Niveau 8"
  REP_TXT.STAND_LV_LEVEL[9] = "Niveau 9"
  REP_TXT.STAND_LV_LEVEL[10] = "Niveau 10"
  REP_TXT.STAND_LV_LEVEL[11] = "Niveau 11"
  REP_TXT.STAND_LV_LEVEL[12] = "Niveau 12"
  REP_TXT.STAND_LV_LEVEL[13] = "Niveau 13"
  REP_TXT.STAND_LV_LEVEL[14] = "Niveau 14"
  REP_TXT.STAND_LV_LEVEL[15] = "Niveau 15"
  REP_TXT.STAND_LV_LEVEL[16] = "Niveau 16"
  REP_TXT.STAND_LV_LEVEL[17] = "Niveau 17"
  REP_TXT.STAND_LV_LEVEL[18] = "Niveau 18"
  REP_TXT.STAND_LV_LEVEL[19] = "Niveau 19"
  REP_TXT.STAND_LV_LEVEL[20] = "Niveau 20"
  REP_TXT.STAND_LV_LEVEL[21] = "Niveau 21"
  REP_TXT.STAND_LV_LEVEL[22] = "Niveau 22"
  REP_TXT.STAND_LV_LEVEL[23] = "Niveau 23"
  REP_TXT.STAND_LV_LEVEL[24] = "Niveau 24"
  REP_TXT.STAND_LV_LEVEL[25] = "Niveau 25"
  REP_TXT.STAND_LV_LEVEL[26] = "Niveau 26"
  REP_TXT.STAND_LV_LEVEL[27] = "Niveau 27"
  REP_TXT.STAND_LV_LEVEL[28] = "Niveau 28"
  REP_TXT.STAND_LV_LEVEL[29] = "Niveau 29"
  REP_TXT.STAND_LV_LEVEL[30] = "Niveau 30"
  REP_TXT.STAND_LV_LEVEL[31] = "Niveau 31"
  REP_TXT.STAND_LV_LEVEL[32] = "Niveau 32"
  REP_TXT.STAND_LV_LEVEL[33] = "Niveau 33"
  REP_TXT.STAND_LV_LEVEL[34] = "Niveau 34"
  REP_TXT.STAND_LV_LEVEL[35] = "Niveau 35"
  REP_TXT.STAND_LV_LEVEL[36] = "Niveau 36"
  REP_TXT.STAND_LV_LEVEL[37] = "Niveau 37"
  REP_TXT.STAND_LV_LEVEL[38] = "Niveau 38"
  REP_TXT.STAND_LV_LEVEL[39] = "Niveau 39"
  REP_TXT.STAND_LV_LEVEL[40] = "Niveau 40"
  REP_TXT.STAND_LV_LEVEL[41] = "Niveau 41"
  REP_TXT.STAND_LV_LEVEL[42] = "Niveau 42"
  REP_TXT.STAND_LV_LEVEL[43] = "Niveau 43"
  REP_TXT.STAND_LV_LEVEL[44] = "Niveau 44"
  REP_TXT.STAND_LV_LEVEL[45] = "Niveau 45"
  REP_TXT.STAND_LV_LEVEL[46] = "Niveau 46"
  REP_TXT.STAND_LV_LEVEL[47] = "Niveau 47"
  REP_TXT.STAND_LV_LEVEL[48] = "Niveau 48"
  REP_TXT.STAND_LV_LEVEL[49] = "Niveau 49"
  REP_TXT.STAND_LV_LEVEL[50] = "Niveau 50"
  REP_TXT.STAND_LV_LEVEL[51] = "Niveau 51"
  REP_TXT.STAND_LV_LEVEL[52] = "Niveau 52"
  REP_TXT.STAND_LV_LEVEL[53] = "Niveau 53"
  REP_TXT.STAND_LV_LEVEL[54] = "Niveau 54"
  REP_TXT.STAND_LV_LEVEL[55] = "Niveau 55"
  REP_TXT.STAND_LV_LEVEL[56] = "Niveau 56"
  REP_TXT.STAND_LV_LEVEL[57] = "Niveau 57"
  REP_TXT.STAND_LV_LEVEL[58] = "Niveau 58"
  REP_TXT.STAND_LV_LEVEL[59] = "Niveau 59"
  REP_TXT.STAND_LV_LEVEL[60] = "Niveau 60"
  REP_TXT.STAND_LV_LEVEL[61] = "Niveau 61"
  REP_TXT.STAND_LV_LEVEL[62] = "Niveau 62"
  REP_TXT.STAND_LV_LEVEL[63] = "Niveau 63"
  REP_TXT.STAND_LV_LEVEL[64] = "Niveau 64"
  REP_TXT.STAND_LV_LEVEL[65] = "Niveau 65"
  REP_TXT.STAND_LV_LEVEL[66] = "Niveau 66"
  REP_TXT.STAND_LV_LEVEL[67] = "Niveau 67"
  REP_TXT.STAND_LV_LEVEL[68] = "Niveau 68"
  REP_TXT.STAND_LV_LEVEL[69] = "Niveau 69"
  REP_TXT.STAND_LV_LEVEL[70] = "Niveau 70"
  REP_TXT.STAND_LV_LEVEL[71] = "Niveau 71"
  REP_TXT.STAND_LV_LEVEL[72] = "Niveau 72"
  REP_TXT.STAND_LV_LEVEL[73] = "Niveau 73"
  REP_TXT.STAND_LV_LEVEL[74] = "Niveau 74"
  REP_TXT.STAND_LV_LEVEL[75] = "Niveau 75"
  REP_TXT.STAND_LV_LEVEL[76] = "Niveau 76"
  REP_TXT.STAND_LV_LEVEL[77] = "Niveau 77"
  REP_TXT.STAND_LV_LEVEL[78] = "Niveau 78"
  REP_TXT.STAND_LV_LEVEL[79] = "Niveau 79"
  REP_TXT.STAND_LV_LEVEL[80] = "Niveau 80"
  REP_TXT.STAND_LV_LEVEL[81] = "Niveau 81"
  REP_TXT.STAND_LV_LEVEL[82] = "Niveau 82"
  REP_TXT.STAND_LV_LEVEL[83] = "Niveau 83"
  REP_TXT.STAND_LV_LEVEL[84] = "Niveau 84"
  REP_TXT.STAND_LV_LEVEL[85] = "Niveau 85"
  REP_TXT.STAND_LV_LEVEL[86] = "Niveau 86"
  REP_TXT.STAND_LV_LEVEL[87] = "Niveau 87"
  REP_TXT.STAND_LV_LEVEL[88] = "Niveau 88"
  REP_TXT.STAND_LV_LEVEL[89] = "Niveau 89"
  REP_TXT.STAND_LV_LEVEL[90] = "Niveau 90"
  REP_TXT.STAND_LV_LEVEL[91] = "Niveau 91"
  REP_TXT.STAND_LV_LEVEL[92] = "Niveau 92"
  REP_TXT.STAND_LV_LEVEL[93] = "Niveau 93"
  REP_TXT.STAND_LV_LEVEL[94] = "Niveau 94"
  REP_TXT.STAND_LV_LEVEL[95] = "Niveau 95"
  REP_TXT.STAND_LV_LEVEL[96] = "Niveau 96"
  REP_TXT.STAND_LV_LEVEL[97] = "Niveau 97"
  REP_TXT.STAND_LV_LEVEL[98] = "Niveau 98"
  REP_TXT.STAND_LV_LEVEL[99] = "Niveau 99"
  REP_TXT.STAND_LV_LEVEL[100] = "Niveau 100"
  ---- BFF Labels
  -- BFF Labels placeholder
  REP_TXT.BFFLabels[0] = {} -- Étranger
  REP_TXT.BFFLabels[0][1] = "Connaissance"
  REP_TXT.BFFLabels[0][2] = "Camarade"
  REP_TXT.BFFLabels[0][3] = "Ami"
  REP_TXT.BFFLabels[0][4] = "Bon ami"
  REP_TXT.BFFLabels[0][5] = "Meilleur ami"
  ---- Fishing Masters placeholder
  REP_TXT.BFFFishingMastersLabels = {}
  REP_TXT.BFFFishingMastersLabels[1] = "Étranger"
  REP_TXT.BFFFishingMastersLabels[2] = "Pote"
  REP_TXT.BFFFishingMastersLabels[3] = "Camarade"
  REP_TXT.BFFFishingMastersLabels[4] = "Ami"
  REP_TXT.BFFFishingMastersLabels[5] = "Bon ami"
  REP_TXT.BFFFishingMastersLabels[6] = "Meilleur ami"
  ---- Barracks Bodyguards placeholder
  REP_TXT.BFFBarracksBodyguardsLabels = {}
  REP_TXT.BFFBarracksBodyguardsLabels[1] = "Garde du corps"
  REP_TXT.BFFBarracksBodyguardsLabels[2] = "Garde personnel"
  REP_TXT.BFFBarracksBodyguardsLabels[3] = "Bras droit"
  ---- The First Responders 1984
  REP_TXT.BFFLabels[1984] = {} -- Interne
  REP_TXT.BFFLabels[1984][1] = "Résident récent"
  REP_TXT.BFFLabels[1984][2] = "Résident de longue date"
  REP_TXT.BFFLabels[1984][3] = "Urgentiste"
  ---- Corbyn 2100
  REP_TXT.BFFLabels[2100] = {} -- Étranger
  REP_TXT.BFFLabels[2100][1] = "Curiosité"
  REP_TXT.BFFLabels[2100][2] = "Non menaçant"
  REP_TXT.BFFLabels[2100][3] = REP_TXT.BFFFishingMastersLabels[4]
  REP_TXT.BFFLabels[2100][4] = "Ami serviable"
  REP_TXT.BFFLabels[2100][5] = REP_TXT.BFFFishingMastersLabels[6]
  -- Chromie 2135
  REP_TXT.BFFLabels[2135] = {} -- Dragonnet
  REP_TXT.BFFLabels[2135][1] = "Recrue temporelle"
  REP_TXT.BFFLabels[2135][2] = "Chrono-trotter"
  REP_TXT.BFFLabels[2135][3] = "Ami de longue date"
  REP_TXT.BFFLabels[2135][4] = "Allié de bronze"
  REP_TXT.BFFLabels[2135][5] = "Restaurateur d’époque"
  REP_TXT.BFFLabels[2135][6] = "Seigneur du temps"
  ---- Wrathion 2517
  REP_TXT.BFFLabels[2517] = {} -- Connaissance
  REP_TXT.BFFLabels[2517][1] = "Complicité"
  REP_TXT.BFFLabels[2517][2] = "Acolyte"
  REP_TXT.BFFLabels[2517][3] = "Croc"
  REP_TXT.BFFLabels[2517][4] = "Amitié"
  REP_TXT.BFFLabels[2517][5] = "Amitié sincère"
  ---- Sabellian 2518
  REP_TXT.BFFLabels[2518] = {} -- Connaissance
  REP_TXT.BFFLabels[2518][1] = "Complicité"
  REP_TXT.BFFLabels[2518][2] = "Acolyte"
  REP_TXT.BFFLabels[2518][3] = "Croc"
  REP_TXT.BFFLabels[2518][4] = "Amitié"
  REP_TXT.BFFLabels[2518][5] = "Amitié sincère"
  ---- Artisan's Consortium - Dragon Isles Branch 2544
  REP_TXT.BFFLabels[2544] = {} -- Indifférence
  REP_TXT.BFFLabels[2544][1] = "Bienveillance"
  REP_TXT.BFFLabels[2544][2] = "Respect"
  REP_TXT.BFFLabels[2544][3] = "Estime"
  REP_TXT.BFFLabels[2544][4] = "Admiration"
  ---- Cobalt Assembly 2550
  REP_TXT.BFFLabels[2550] = {} -- Vide
  REP_TXT.BFFLabels[2550][1] = "Faible"
  REP_TXT.BFFLabels[2550][2] = "Moyenne"
  REP_TXT.BFFLabels[2550][3] = "Élevée"
  REP_TXT.BFFLabels[2550][4] = "Maximum"
  ---- Soridormi 2553
  REP_TXT.BFFLabels[2553] = {} -- Anomalie
  REP_TXT.BFFLabels[2553][1] = "Future amie"
  REP_TXT.BFFLabels[2553][2] = "Scelle-faille"
  REP_TXT.BFFLabels[2553][3] = "Marcheuse du temps"
  REP_TXT.BFFLabels[2553][4] = "Légende"
  ---- The Weaver 2601
  REP_TXT.BFFLabels[2601] = {} -- Étranger
  REP_TXT.BFFLabels[2601][1] = "Connaissance"
  REP_TXT.BFFLabels[2601][2] = "Séide"
  REP_TXT.BFFLabels[2601][3] = "Complice"
  REP_TXT.BFFLabels[2601][4] = "Partenaire"
  REP_TXT.BFFLabels[2601][5] = "Auxiliaire"
  REP_TXT.BFFLabels[2601][6] = "Assistance"
  REP_TXT.BFFLabels[2601][7] = "Compère"
  REP_TXT.BFFLabels[2601][8] = "Génie"
  ---- The General 2605
  REP_TXT.BFFLabels[2605] = {} -- Étranger
  REP_TXT.BFFLabels[2605][1] = "Connaissance"
  REP_TXT.BFFLabels[2605][2] = "Séide"
  REP_TXT.BFFLabels[2605][3] = "Complice"
  REP_TXT.BFFLabels[2605][4] = "Partenaire"
  REP_TXT.BFFLabels[2605][5] = "Auxiliaire"
  REP_TXT.BFFLabels[2605][6] = "Assistance"
  REP_TXT.BFFLabels[2605][7] = "Compère"
  REP_TXT.BFFLabels[2605][8] = "Génie"
  ---- The Vizier 2607
  REP_TXT.BFFLabels[2607] = {} -- Étranger
  REP_TXT.BFFLabels[2607][1] = "Connaissance"
  REP_TXT.BFFLabels[2607][2] = "Séide"
  REP_TXT.BFFLabels[2607][3] = "Complice"
  REP_TXT.BFFLabels[2607][4] = "Partenaire"
  REP_TXT.BFFLabels[2607][5] = "Auxiliaire"
  REP_TXT.BFFLabels[2607][6] = "Assistance"
  REP_TXT.BFFLabels[2607][7] = "Compère"
  REP_TXT.BFFLabels[2607][8] = "Génie"
  ---- Azerothian Archives 2615
  REP_TXT.BFFLabels[2615] = {} -- Stagiaire
  REP_TXT.BFFLabels[2615][1] = "Aide"
  REP_TXT.BFFLabels[2615][2] = "Titulaire"
  REP_TXT.BFFLabels[2615][3] = "en poste"
  REP_TXT.BFFLabels[2615][4] = "titulaire"

  ---------------------------
  -- Tooltips
  ---------------------------
  ---- Initialize
  REP_TXT.elements	= {}
  REP_TXT.elements.name	= {}
  REP_TXT.elements.tip	= {}
  ---- Names and tips
  REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
  REP_TXT.elements.tip.REP_OptionsButton	= "Ouvre une fenêtre pour configurer Reputations."
  REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
  REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "Si cette case n'est pas cochée, la liste de faction est affichée triée par défaut (Blizzard), regroupées par ordre logique et alphabétique. \r\n\r\n Si cette case est cochée, la liste de factions est triée par date. \r\n\r\n Pour vopir les factions | cFFFAA0A0inactive |r  , décochez cette case et allez à la fin de la liste."
  REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
  REP_TXT.elements.tip.REP_ShowMobsButton	= "Cochez cette case pour voir les mobs que vous pouvez tuer pour améliorer votre réputation."
  REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
  REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "Cochez cette case pour voir quêtes que vous pouvez faire pour améliorer votre réputation."
  REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
  REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "Cochez cette case pour voir PvP quêtes que vous pouvez faire pour améliorer votre réputation."
  REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
  REP_TXT.elements.tip.REP_ShowItemsButton	= "Cochez cette case pour voir les articles que vous pouvez remettre à améliorer votre réputation."
  REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
  REP_TXT.elements.tip.REP_ShowInstancesButton	= "Cochez cette case pour voir les donjons que vous pouvez exécuter pour améliorer votre réputation."
  REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
  REP_TXT.elements.tip.REP_ShowGeneralButton	= "Cochez cette case pour afficher des informations générales sur l'amélioration de votre réputation."
  REP_TXT.elements.name.REP_DetailShowAllButton	= REP_TXT.showAll
  REP_TXT.elements.tip.REP_DetailShowAllButton	= "Appuyez sur ce bouton pour sélectionner les quatre cases de gauche. \r\nCela fera apparaître les monstres, quêtes, objets et instances qui vous donnent la réputation de la faction actuellement sélectionnée."
  REP_TXT.elements.name.REP_DetailShowNoneButton	= REP_TXT.showNone
  REP_TXT.elements.tip.REP_DetailShowNoneButton	= "Appuyez sur ce bouton pour désélectionner les quatre cases de gauche. \r\nCela cachera les façons de gagner de la réputation de la faction actuellement sélectionné."
  REP_TXT.elements.name.REP_DetailExpandButton	= REP_TXT.expand
  REP_TXT.elements.tip.REP_DetailExpandButton	= "Appuyez sur ce bouton pour développer toutes les entrées de la liste. Cela va vous montrer les matériaux nécessaires à obtenir dans les quêtes de collecte."
  REP_TXT.elements.name.REP_DetailCollapseButton	= REP_TXT.collapse
  REP_TXT.elements.tip.REP_DetailCollapseButton	= "Appuyez sur ce bouton pour réduire toutes les entrées de la liste. Cela permet de masquer les matériaux nécessaires à obtenir dans les quêtes de collecte."
  REP_TXT.elements.name.REP_DetailSupressNoneFactionButton	= REP_TXT.supressNoneFaction
  REP_TXT.elements.tip.REP_DetailSupressNoneFactionButton	= "Appuyez sur ce bouton pour réactiver toutes les quêtes de cette faction que vous avez exclues par un clic droit sur elles."
  REP_TXT.elements.name.REP_DetailSupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
  REP_TXT.elements.tip.REP_DetailSupressNoneGlobalButton	= "Appuyez sur ce bouton pour réactiver toutes les quêtes pour toutes les factions que vous avez exclues par un clic droit sur elles."
  REP_TXT.elements.name.REP_DetailClearSessionGainButton	= REP_TXT.clearSessionGain
  REP_TXT.elements.tip.REP_DetailClearSessionGainButton	= "Appuyez sur ce bouton pour réinitialiser le compteur de réputation acquise cette session."
  REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
  REP_TXT.elements.tip.REP_EnableMissingBox	= "Activez ce paramètre pour ajouter des points de réputation manquantes nécessaires pour le prochain niveau de réputation derrière la position actuelle de chaque faction dans le cadre de réputation."
  REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
  REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Activez ce paramètre pour afficher une fenêtre de réputation détaillée. \r\nEn plus les informations indiquées dans le cadre des détails d'origine, cela affichera la réputation manquante nécessaire pour atteindre le prochain niveau de réputation et une liste des moyens de gagner cette réputation en dressant la liste des quêtes , monstres, objets et instances qui donnent de la réputation pour la faction choisie."
  REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
  REP_TXT.elements.tip.REP_GainToChatBox	= "Activez ce paramètre pour afficher dans la fen^tre de chat la réputation gagnée pour toutes les factions à chaque gain de réputation.\r\nCeci diffère de l'affichage standard des gains de réputation qui n'indique normalement que les gains dans les factions principales."
  REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
  REP_TXT.elements.tip.REP_NoGuildGainBox	= "Activez ce paramètre pour ne pas afficher les messages de réputation de guilde dans la fenêtre de chat."
  REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
  REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "Activez ce paramètre pour supprimer les messages de gain de réputation standard. \r \n Cela est utile si vous avez activé les messages détaillés de gain de faction . Vous obtiendrez alors des messages différents pour les versions standard et étendu."
  REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
  REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "Activez ce paramètre pour afficher la réputation que vous pouvez gagner en remettant des articles ou les quêtes complétées comme une barre grise recouvrant la barre de réputation normale dans la fenêtre de réputation."
  REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
  REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "Activez ce paramètre pour que la faction affichée soit automatiquement la dernière dans laquelle vous avez gagné de la réputation."
  REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
  REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "Activez ce paramètre pour ne pas basculer automatiquement la faction affichée vers la guilde en cas de gain de réputation de guilde."
  REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
  REP_TXT.elements.tip.REP_SilentSwitchBox	= "Activez ce paramètre pour activer la barre de réputation en mode silencieux (sans message dans la fenêtre de chat)."
  REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
  REP_TXT.elements.name.REP_ChatFrameSlider	= "Fenêtre de chat"
  REP_TXT.elements.tip.REP_ChatFrameSlider	= "Sélectionnez la fenêtre de chat dans laquelle Reputations affiche ses messages"
  REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
  REP_TXT.elements.tip.REP_EnableParagonBarBox  = "Activez cette option pour afficher votre réputation paragon actuelle dans la barre de réputation."
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
  REP_TXT.settings.buffTitle = "Améliorations de réputation"
  REP_TXT.settings.buffSubTitle = "Vous pouvez activer ou désactiver ces améliorations de réputation pour voir quelle réputation vous obtiendriez grâce à différentes activités. Les buffs qui ne se cumulent pas seront désactivés lors du basculement de leurs homologues."
  ---- Buffs
  REP_TXT.settings.harvestBountyRepBuff = "L'Esprit du partage (Les Bienfaits du pèlerin)"
  REP_TXT.settings.info.harvestBountyRepBuff = "Augmente la réputation gagnée de 10%. Dure 1 heure."
  REP_TXT.settings.wickermanRepBuff = "Magie de l'homme d'osier (De la Sanssaint)"
  REP_TXT.settings.info.wickermanRepBuff = "Augmente la récupération du mana et des points de vie de 25%. Augmente l'Endurance de 25%. Dure 2 hrs."
  REP_TXT.settings.wickermanRepBuffUnburdened = "Soulagé (De la Sanssaint)"
  REP_TXT.settings.info.wickermanRepBuffUnburdened = "Vous avez jeté vos soucis dans le feu de l'homme d'osier. Augmente l'expérience et la réputation gagnées de 10%. Dure 2 hrs."
  REP_TXT.settings.wickermanRepBuffGrimVisage = "Grim Visage (De la Sanssaint)"
  REP_TXT.settings.info.wickermanRepBuffGrimVisage = "Vous avez peint votre visage avec les cendres de l'homme d'osier. Augmente l'expérience et la réputation gagnées de 10%. Dure 2 hrs."
  REP_TXT.settings.MrPopularityRankOne = "M. Popularité (Avantages de guilde, Rang 1)"
  REP_TXT.settings.info.MrPopularityRankOne = "Réputation gagnée en tuant des monstres et en achevant des quêtes augmentée de 5%."
  REP_TXT.settings.MrPopularityRankTwo = "M. Popularité (Avantages de guilde, Rang 2)"
  REP_TXT.settings.info.MrPopularityRankTwo = "Réputation gagnée en tuant des monstres et en achevant des quêtes augmentée de 10%."
  REP_TXT.settings.DarkmoonFaireWeeRepBuff = "WOUHOU ! (Foire de Sombrelune)"
  REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "A fait un tour sur le manège ou le grand huit de Sombrelune. Augmente les gains d’expérience et de réputation de 10%."
  REP_TXT.settings.DarkmoonFaireHatRep = "Haut-de-forme de Sombrelune (Foire de Sombrelune)"
  REP_TXT.settings.info.DarkmoonFaireHatRep = "Augmente le gain d’expérience et de réputation de 10% pendant 1 hour. Une seule utilisation."
  REP_TXT.settings.ShowBonusGainsInChat = "Show bonus reputation in chat"
  REP_TXT.settings.info.ShowBonusGainsInChat = "Show bonus reputation from commendations in chat when reputation is gained."
  ---------------------------
  -- Characters tab settings
  ---------------------------
  REP_TXT.settings.characterTabSubTitle = "You can either reset or delete one of your character's addon settings from the list below."
end
