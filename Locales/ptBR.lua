-- Português (Brasil)
--------------------	--------------------
if (GetLocale() =="ptBR") then
-- Binding names
BINDING_HEADER_REPUTATIONS	= "Reputation Guide"
BINDING_NAME_SHOWCONFIG	= "Mostrar janela de opções"
BINDING_NAME_SHOWDETAILS	= "Mostrar janela de detalhes de reputação"

REP_TXT	= {}
REP_TXT.Mob = {}
-- help
REP_TXT.help	= "Uma ferramenta para gerenciar sua reputação"
REP_TXT.command	= "Não foi possível analisar comando"
REP_TXT.usage	= "Uso"
REP_TXT.helphelp	= "Mostra este texto de ajuda"
REP_TXT.helpabout	= "Mostra informações sobre o autor"
REP_TXT.helpstatus	= "Mostra estado da configuração"
-- about
REP_TXT.by	= "por"
REP_TXT.version	= "Versão"
REP_TXT.date	= "Data"
REP_TXT.web	= "Site"
REP_TXT.slash	= "Comando de barra"
-- status
REP_TXT.status	= "Estado"
REP_TXT.disabled	= "desabilitado"
REP_TXT.enabled	= "habilitado"
REP_TXT.statMobs	= "Mostrar monstros [M]"
REP_TXT.statQuests	= "Mostrar missões [Q]"
REP_TXT.statInstances	= "Mostrar Instâncias [D]"
REP_TXT.statItems	= "Mostrar Itens [I]"
REP_TXT.statGeneral	= "Mostrar Geral [G]"
REP_TXT.statMissing	= "Mostrar reputação restante"
REP_TXT.statDetails	= "Mostrar quadro de detalhes extendido"
REP_TXT.statChat	= "Mensagem detalhada no chat"
REP_TXT.statNoGuildChat	= "Sem mensagem para rep. com guilda"
REP_TXT.statSuppress	= "Suprimir mensagem original"
REP_TXT.statPreview	= "Mostrar rep. prévia no quadro de reputações"
REP_TXT.statSwitch	= "Trocar facção da barra de rep. automaticamente"
REP_TXT.statNoGuildSwitch	= "Sem troca para rep. com guilda"
REP_TXT.statSilentSwitch	= "Sem mensagem ao trocar barra"
REP_TXT.statGuildCap	= "Mostrar limite de reputação com a guilda na conversa"
-- XML UI elements
REP_TXT.showQuests	= "Ver Missões"
REP_TXT.showPvPQuests	= "Ver PvP Missões"
REP_TXT.showInstances	= "Ver Instâncias"
REP_TXT.showMobs	= "Ver Monstros"
REP_TXT.showItems	= "Ver Itens"
REP_TXT.showGeneral	= "Ver Geral"
REP_TXT.showAll	= "Ver Tudo"
REP_TXT.showNone	= "Ver Nada"
REP_TXT.expand	= "Expandir"
REP_TXT.collapse	= "Recolher"
REP_TXT.supressNoneFaction	= "Limpar excl. para facção"
REP_TXT.supressNoneGlobal	= "Limpar excl. para todas"
REP_TXT.suppressHint	= "Clique com o direito em uma missão para excluí-la do resumo"
REP_TXT.clearSessionGain	= "Limpar contador de ganho da sessão"
-- options dialog
REP_TXT.showMissing	= "Mostrar reputação restante no quadro de reputações"
REP_TXT.extendDetails	= "Mostrar quadro de detalhes de reputação estendido"
REP_TXT.gainToChat	= "Replace original faction gain messages with a more detailed version"
REP_TXT.noGuildGain	= "Não escrever na conversa para reputação de guilda"
REP_TXT.suppressOriginalGain	= "Suprimir mensagens originais de ganho de reputação"
REP_TXT.showPreviewRep	= "Mostrar reputação que a ser entregue no quadro de reputações"
REP_TXT.switchFactionBar	= "Mudar barra para a facção com que acabou de ganhar reputação"
REP_TXT.noGuildSwitch	= "Não trocar a barra de reputação para reputação de guilda"
REP_TXT.silentSwitch	= "Sem mensagem na janela de conversa ao trocar de barra"
REP_TXT.guildCap	= "Mostrar limite de reputação de guilda na janela de conversa"
REP_TXT.defaultChatFrame	= "Usando janela de conversa padrão"
REP_TXT.chatFrame	= "Usando janela de conversa %d (%s)"
REP_TXT.usingDefaultChatFrame	= "Usando janela de conversa padrão"
REP_TXT.usingChatFrame	= "Usando janela de conversa"
REP_TXT.EnableParagonBar = "Mostre reputação exemplar em bares."
-- various LUA
REP_TXT.options	= "Opções"
REP_TXT.orderByStanding	= "Ordenar por Situação"
REP_TXT.lookup	= "Procurando facção"
REP_TXT.allFactions	= "Listando todas as facções"
REP_TXT.missing	= "(p/ próx.)"
REP_TXT.missing2	= "Restante"
REP_TXT.heroic	= "Heroica"
REP_TXT.normal	= "Normal"
REP_TXT.switchBar	= "Mudando barra de reputação para"
-- REP_ShowFactions
REP_TXT.faction	= "Facção"
REP_TXT.is	= "é"
REP_TXT.withStanding	= "com situação"
REP_TXT.needed	= "necessária"
REP_TXT.mob	= "[Monstro]"
REP_TXT.limited	= "é limitado a"
REP_TXT.limitedPl	= "são limitadas a"
REP_TXT.quest	= "[Missão]"
REP_TXT.instance	= "[Instância]"
REP_TXT.items	= "[Itens]"
REP_TXT.unknown	= "é desconhecida para este jogador"
-- mob Details
REP_TXT.tmob	= "mobs lixo"
REP_TXT.oboss	= "outros chefes"
REP_TXT.aboss	= "Todos os Bosses"
REP_TXT.pboss	= "por chefe"
REP_TXT.fclear	= "full claro"
REP_TXT.AU	= "Qualquer sem nome"
REP_TXT.AN	= "Qualquer nome"
REP_TXT.BB	= "Bucaneiros da Vela Sangrenta"
REP_TXT.SSP	= "Pirata dos Mares do Sul"
REP_TXT.Wa	= "desperdício errante"
REP_TXT.VCm	= "Qualquer Empreendimentos S.A."
REP_TXT.Mob.MoshOgg_Spellcrafter = "Feitífice Mosh'Ogg"
REP_TXT.Mob.BoulderfistOgre = "Ogro Punho de Pedra"
-- Quest Details
REP_TXT.cdq	= "Principal cidade cozinhar quests diárias"
REP_TXT.coq	= "Outra cidade cozinhar quests diárias"
REP_TXT.fdq	= "Principal cidade pescaria quests diárias"
REP_TXT.foq	= "Outra cidade pescaria quests diárias"
REP_TXT.ndq	= "não quests diárias"
REP_TXT.deleted	= "Desatualizado"
REP_TXT.Championing	= "Defender (Tabardo)"
REP_TXT.bpqfg	= "Por cento de ganho de facção busca"
-- items Details
REP_TXT.cbadge	= "Comenda de Outra cidade"
-- instance Details
REP_TXT.srfd	= "Rep repercussões de dungeons"
REP_TXT.tbd	= "ToBe Done"
REP_TXT.nci	= "Casos Cataclysm (normais)"
REP_TXT.hci	= "Casos Cataclysm (heróico)"
REP_TXT.ncit	= "Instâncias normais de Cataclismo com tabardo de facção"
REP_TXT.hcit	= "Instâncias de Cataclismo Heroico com tabardo de facção"
-- ToBeDone general
REP_TXT.tfr	= "Os Lavradores agricultura rep"
REP_TXT.nswts	= "Não tenho certeza quando isso começa"
REP_TXT.mnd	= "Número máximo de quests diárias"
REP_TXT.mnds	= "O número máximo de dallies é "
-- ReputationDetails
REP_TXT.currentRep	= "Reputação atual"
REP_TXT.neededRep	= "Reputação necessária"
REP_TXT.missingRep	= "Reputação restante"
REP_TXT.repInBag	= "Reputação em bolsas"
REP_TXT.repInBagBank	= "Reputação em bolsas e banco"
REP_TXT.repInQuest	= "Reputação em missões"
REP_TXT.factionGained	= "Recebida nesta sessão"
REP_TXT.noInfo	= "Nenhuma informação disponível para esta facção/reputação."
REP_TXT.toExalted	= "Reputação até exaltado"
REP_TXT.toBestFriend = "Reputation to best friend"
-- to chat
REP_TXT.stats	= "(Total: %s%d, Rest.: %d)"
-- config changed
REP_TXT.configQuestion	= "Algumas (novas) opções foram habilitadas. Isto é feito apenas uma vez para cada opção. Recomenda-se que você verifique as configurações do Reputations."
REP_TXT.showConfig	= "Ver config."
REP_TXT.later	= "Mais tarde"
-- UpdateList
REP_TXT.mobShort	= "[M]"
REP_TXT.questShort	= "[Q]"
REP_TXT.instanceShort	= "[D]"
REP_TXT.itemsShort	= "[I]"
REP_TXT.generalShort	= "[G]"
REP_TXT.mobHead	= "Ganhe reputação matando este monstro"
REP_TXT.questHead	= "Ganhe reputação ao fazer esta missão"
REP_TXT.instanceHead	= "Ganhe reputação participando desta instância"
REP_TXT.itemsHead	= "Ganhe reputação ao entregar itens"
REP_TXT.generalHead	= "Informações gerais sobre ganho de reputação"
REP_TXT.mobTip	= "Cada vez que matar este monstro, você ganha reputação. Fazer isto frequentemente ajudará você a alcançar o próximo nível."
REP_TXT.questTip	= "Cada vez que completar esta missão diária ou repetível, você ganha reputação. Fazer isto frequentemente ajudará você a alcançar o próximo nível."
REP_TXT.instanceTip	= "Cada vez que faz esta instância, você ganha reputação. Fazer isto frequentemente ajudará você a alcançar o próximo nível."
REP_TXT.itemsName	= "Entrega de itens"
REP_TXT.itemsTip	= "Cada vez que entrega os itens listados, você ganha reputação. Fazer isto frequentemente ajudará você a alcançar o próximo nível."
REP_TXT.generalTip	= "Esta informação é sobre ganho de reputação com uma facção não necessariamente relacionada a métodos de ganho repetitivos."
REP_TXT.allOfTheAbove	= "Resumo de %d missões listadas acima"
REP_TXT.questSummaryHead	= REP_TXT.allOfTheAbove
REP_TXT.questSummaryTip	= "Esta entrada mostra um resumo de todas as missões listadas acima.\\r\\nIsto é útil supondo que todas as missões listadas sejam diárias, já que isto irá dizer quantos dias levará para você alcançar o próximo nível de reputação se você REPer todas as missões diárias todo dia."
REP_TXT.complete	= "completa"
REP_TXT.active	= "ativa"
REP_TXT.inBag	= "Em bolsas"
REP_TXT.turnIns	= "Entregas:"
REP_TXT.reputation	= "Reputação:"
REP_TXT.reputationCap	= "Limite de reputação:"
REP_TXT.reputationCapCurrent	= "Reputação atual:"
REP_TXT.inBagBank	= "Em bolsas e banco"
REP_TXT.questCompleted	= "Missão completa"
REP_TXT.timesToDo	= "Vezes para fazer:"
REP_TXT.instance2	= "Instância:"
REP_TXT.mode	= "Modo:"
REP_TXT.timesToRun	= "Vezes para fazer:"
REP_TXT.mob2	= "Monstro:"
REP_TXT.location	= "Local:"
REP_TXT.toDo	= "Fazer:"
REP_TXT.quest2	= "Missão:"
REP_TXT.itemsRequired	= "Itens necessários"
REP_TXT.general2	= "Geral:"
REP_TXT.maxStanding	= "Concede reputação até"
-- skills
REP_TXT.skillHerb	= "Herborismo"
REP_TXT.skillMine	= "Mineração"
REP_TXT.skillSkin	= "Esfolamento"
REP_TXT.skillAlch	= "Alquimia"
REP_TXT.skillBlack	= "Ferraria"
REP_TXT.skillEnch	= "Encantamento"
REP_TXT.skillEngi	= "Engenharia"
REP_TXT.skillIncrip	= "Escrivania"
REP_TXT.skillJewel	= "Joalheria"
REP_TXT.skillLeath	= "Couraria"
REP_TXT.skillTail	= "Alfaiataria"
REP_TXT.skillAid	= "Primeiros Socorros"
REP_TXT.skillArch	= "Arqueologia"
REP_TXT.skillCook	= "Culinária"
REP_TXT.skillFish	= "Pesca"
---------------------------
-- Reputation Standing
---------------------------
---- Initialize
REP_TXT.STAND_LV	= {}
REP_TXT.STAND_LV_TIER	= {}
REP_TXT.STAND_LV_TRUST = {}
REP_TXT.STAND_LV_RENOWN	= {}
---- Normal standings
REP_TXT.STAND_LV[0]	= "Desconhecido"
REP_TXT.STAND_LV[1]	= "Odiei"
REP_TXT.STAND_LV[2]	= "Hostil"
REP_TXT.STAND_LV[3]	= "Inamistoso"
REP_TXT.STAND_LV[4]	= "Neutro"
REP_TXT.STAND_LV[5]	= "Amigável"
REP_TXT.STAND_LV[6]	= "Homenageado"
REP_TXT.STAND_LV[7]	= "Reverenciado"
REP_TXT.STAND_LV[8]	= "Exaltado"
REP_TXT.STAND_LV[9] = "Paragão"
---- Tier standings
REP_TXT.STAND_LV_TIER[0] = "Desconhecido"
REP_TXT.STAND_LV_TIER[1] = "Grau 1"
REP_TXT.STAND_LV_TIER[2] = "Grau 2"
REP_TXT.STAND_LV_TIER[3] = "Grau 3"
REP_TXT.STAND_LV_TIER[4] = "Grau 4"
REP_TXT.STAND_LV_TIER[5] = "Grau 5"
REP_TXT.STAND_LV_TIER[6] = "Grau 6"
---- Trust standings
REP_TXT.STAND_LV_TRUST[0] = "Desconhecido"
REP_TXT.STAND_LV_TRUST[1] = "Indecisão"
REP_TXT.STAND_LV_TRUST[2] = "Apreensão"
REP_TXT.STAND_LV_TRUST[3] = "Hesitação"
REP_TXT.STAND_LV_TRUST[4] = "Ambivalência"
REP_TXT.STAND_LV_TRUST[5] = "Cordialidade"
REP_TXT.STAND_LV_TRUST[6] = "Simpatia"
---- Renown standings
REP_TXT.STAND_LV_RENOWN[0] = "Desconhecido"
REP_TXT.STAND_LV_RENOWN[1] = "Renome 1"
REP_TXT.STAND_LV_RENOWN[2] = "Renome 2"
REP_TXT.STAND_LV_RENOWN[3] = "Renome 3"
REP_TXT.STAND_LV_RENOWN[4] = "Renome 4"
REP_TXT.STAND_LV_RENOWN[5] = "Renome 5"
REP_TXT.STAND_LV_RENOWN[6] = "Renome 6"
REP_TXT.STAND_LV_RENOWN[7] = "Renome 7"
REP_TXT.STAND_LV_RENOWN[8] = "Renome 8"
REP_TXT.STAND_LV_RENOWN[9] = "Renome 9"
REP_TXT.STAND_LV_RENOWN[10] = "Renome 10"
REP_TXT.STAND_LV_RENOWN[11] = "Renome 11"
REP_TXT.STAND_LV_RENOWN[12] = "Renome 12"
REP_TXT.STAND_LV_RENOWN[13] = "Renome 13"
REP_TXT.STAND_LV_RENOWN[14] = "Renome 14"
REP_TXT.STAND_LV_RENOWN[15] = "Renome 15"
REP_TXT.STAND_LV_RENOWN[16] = "Renome 16"
REP_TXT.STAND_LV_RENOWN[17] = "Renome 17"
REP_TXT.STAND_LV_RENOWN[18] = "Renome 18"
REP_TXT.STAND_LV_RENOWN[19] = "Renome 19"
REP_TXT.STAND_LV_RENOWN[20] = "Renome 20"
REP_TXT.STAND_LV_RENOWN[21] = "Renome 21"
REP_TXT.STAND_LV_RENOWN[22] = "Renome 22"
REP_TXT.STAND_LV_RENOWN[23] = "Renome 23"
REP_TXT.STAND_LV_RENOWN[24] = "Renome 24"
REP_TXT.STAND_LV_RENOWN[25] = "Renome 25"
---------------------------
-- Tooltips
---------------------------
---- Initialize
REP_TXT.elements	= {}
REP_TXT.elements.name	= {}
REP_TXT.elements.tip	= {}
---- Names and tips
REP_TXT.elements.name.REP_OptionsButton	= REP_TXT.options
REP_TXT.elements.tip.REP_OptionsButton	= "Abre uma janela para configurar o Reputations."
REP_TXT.elements.name.REP_OrderByStandingCheckBox	= REP_TXT.orderByStanding
REP_TXT.elements.tip.REP_OrderByStandingCheckBox	= "Se esta caixa estiver desmarcada, a lista de facções é mostrada na ordem padrão (Blizzard), agrupadas por ordem lógica e alfabética.\\r\\n\\r\\nSe esta caixa estiver marcada, a lista de facções é ordenada pela situação atual.\\r\\n\\r\\nPara ver as facções |cFFFAA0A0inativas|r, desmarque esta caixa e vá para o fim da lista."
REP_TXT.elements.name.REP_ShowMobsButton	= REP_TXT.showMobs
REP_TXT.elements.tip.REP_ShowMobsButton	= "Marque este botão para ver monstros que você pode matar para melhorar sua reputação."
REP_TXT.elements.name.REP_ShowNonPvPQuestsButton	= REP_TXT.showQuests
REP_TXT.elements.tip.REP_ShowNonPvPQuestsButton	= "Marque este botão para ver missões que você pode fazer para melhorar sua reputação."
REP_TXT.elements.name.REP_ShowPvPQuestsButton	= REP_TXT.showPvPQuests
REP_TXT.elements.tip.REP_ShowPvPQuestsButton	= "Marque este botão para ver PvP missões que você pode fazer para melhorar sua reputação."
REP_TXT.elements.name.REP_ShowItemsButton	= REP_TXT.showItems
REP_TXT.elements.tip.REP_ShowItemsButton	= "Marque este botão para ver itens que você pode entregar para melhorar sua reputação."
REP_TXT.elements.name.REP_ShowInstancesButton	= REP_TXT.showInstances
REP_TXT.elements.tip.REP_ShowInstancesButton	= "Marque este botão para ver instâncias que você pode participar para melhorar sua reputação."
REP_TXT.elements.name.REP_ShowGeneralButton	= REP_TXT.showGeneral
REP_TXT.elements.tip.REP_ShowGeneralButton	= "Marque este botão para ver informações gerais sobre como aprimorar sua reputação."
REP_TXT.elements.name.REP_ShowAllButton	= REP_TXT.showAll
REP_TXT.elements.tip.REP_ShowAllButton	= "Pressione este botão para marcar todas as caixas de seleção à esquerda.\\r\\nIsto mostrará monstros, missões, itens e instâncias que lhe concedem reputação com a facção atualmente selecionada."
REP_TXT.elements.name.REP_ShowNoneButton	= REP_TXT.showNone
REP_TXT.elements.tip.REP_ShowNoneButton	= "Pressione este botão para desmarcar todas as quatro caixas de seleção à esquerda.\\r\\nDesta maneira, nada será mostrado sobre como receber reputação para a facção atualmente selecionada."
REP_TXT.elements.name.REP_ExpandButton	= REP_TXT.expand
REP_TXT.elements.tip.REP_ExpandButton	= "Pressione este botão para expandir todas as entradas da lista. Isto mostrará os materiais que precisam ser entregues para missões de coleta."
REP_TXT.elements.name.REP_CollapseButton	= REP_TXT.collapse
REP_TXT.elements.tip.REP_CollapseButton	= "Pressione este botão para recolher todas as entradas da lista. Isto irá ocultar os materiais necessários para entregar em missões de coleta."
REP_TXT.elements.name.REP_SupressNoneFactionButton	= REP_TXT.supressNoneFaction
REP_TXT.elements.tip.REP_SupressNoneFactionButton	= "Pressione este botão para reexibir todas as missões desta facção que você excluiu clicando com o botão direito."
REP_TXT.elements.name.REP_SupressNoneGlobalButton	= REP_TXT.supressNoneGlobal
REP_TXT.elements.tip.REP_SupressNoneGlobalButton	= "Pressione este botão para reexibir todas as missões de todas as facções que você excluiu clicando com o botão direito."
REP_TXT.elements.name.REP_ClearSessionGainButton	= REP_TXT.clearSessionGain
REP_TXT.elements.tip.REP_ClearSessionGainButton	= "Pressione este botão para reiniciar o contador de reputação adquirida nesta sessão."
REP_TXT.elements.name.REP_EnableMissingBox	= REP_TXT.showMissing
REP_TXT.elements.tip.REP_EnableMissingBox	= "Habilite esta opção para adicionar os pontos de reputação restantes para o próximo nível de reputação após a situação atual de cada facção no quadro de reputações."
REP_TXT.elements.name.REP_ExtendDetailsBox	= REP_TXT.extendDetails
REP_TXT.elements.tip.REP_ExtendDetailsBox	= "Habilite esta opção para mostrar um quadro de detalhes de reputação.\\r\\nAlém das informações mostradas no quadro de detalhes original, isto mostrará a reputação restante necessária para alcançar o próximo nível de reputação e uma lista de maneiras de conseguir reputação especificando missões, monstros, itens e instâncias que concedem reputação para a facção escolhida."
REP_TXT.elements.name.REP_GainToChatBox	= REP_TXT.gainToChat
REP_TXT.elements.tip.REP_GainToChatBox	= "Habilite esta opção para mostrar a reputação adquirida para todas as facções sempre que você ganhar reputação.\\r\\nIsto difere da maneira padrão de relatar ganho de reputação pois, normalmente, somente o ganho com a facção principal é listado."
REP_TXT.elements.name.REP_NoGuildGainBox	= REP_TXT.noGuildGain
REP_TXT.elements.tip.REP_NoGuildGainBox	= "Habilite esta opção para não mostrar mensagens na conversa relativas à reputação da guilda."
REP_TXT.elements.name.REP_SupressOriginalGainBox	= REP_TXT.suppressOriginalGain
REP_TXT.elements.tip.REP_SupressOriginalGainBox	= "Habilite esta opção para suprimir as mensagens padrão de reputação.\\r\\nIsto faz sentido caso você tenha habilitado as mensagens de ganho de reputação detalhadas, para que não receba listagens idênticas das versões padrão e estendida."
REP_TXT.elements.name.REP_ShowPreviewRepBox	= REP_TXT.showPreviewRep
REP_TXT.elements.tip.REP_ShowPreviewRepBox	= "Habilite esta opção para mostrar a reputação que você pode receber entregando itens e completando missões como uma barra cinza sobreposta à barra de reputações normal no quadro de reputações."
REP_TXT.elements.name.REP_SwitchFactionBarBox	= REP_TXT.switchFactionBar
REP_TXT.elements.tip.REP_SwitchFactionBarBox	= "Habilite esta opção para trocar automaticamente a facção em observação para a última facção com a qual você ganhou reputação."
REP_TXT.elements.name.REP_NoGuildSwitchBox	= REP_TXT.noGuildSwitch
REP_TXT.elements.tip.REP_NoGuildSwitchBox	= "Habilite esta configuração para não trocar a facção observada para ganhos de reputação da guilda."
REP_TXT.elements.name.REP_SilentSwitchBox	= REP_TXT.silentSwitch
REP_TXT.elements.tip.REP_SilentSwitchBox	= "Habilite esta opção para trocar a barra de reputação silenciosamente (sem uma mensagem na janela de conversa)."
REP_TXT.elements.name.REP_GuildCapBox	= REP_TXT.guildCap
REP_TXT.elements.name.REP_ChatFrameSlider	= "Janela de conversa"
REP_TXT.elements.tip.REP_ChatFrameSlider	= "Selecione em qual janela de conversa o Reputations exibe as mensagens."
REP_TXT.elements.name.REP_EnableParagonBarBox = REP_TXT.EnableParagonBar
REP_TXT.elements.tip.REP_EnableParagonBarBox  = "Habilite esta opção para exibir seu progresso exemplar atual nas barras de reputação."
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
REP_TXT.settings.buffTitle = "Fãs de reputação"
REP_TXT.settings.buffSubTitle = "Você pode alternar esses buffs de reputação para ver quanta reputação você obteria com diferentes atividades. Buffs que não acumulam serão desativados ao alternar seus equivalentes."
---- Buffs
REP_TXT.settings.harvestBountyRepBuff = "O Espírito da Partilha (Festa da Fartura)"
REP_TXT.settings.info.harvestBountyRepBuff = "Aumenta em 10% a reputação obtida. Dura 1 hora."
REP_TXT.settings.wickermanRepBuff = "Invocação do Homem de Palha (Da Noturnália)"
REP_TXT.settings.info.wickermanRepBuff = "Increases experience earned and reputation gained by 10%.  Lasts 2 hrs."
REP_TXT.settings.wickermanRepBuffUnburdened = "Aliviado (Da Noturnália)"
REP_TXT.settings.info.wickermanRepBuffUnburdened = "Você lançou as suas preocupações dentro do fogo do homem de palha. Aumenta em 10% o ganho de experiência e de reputação. Dura 2 hrs."
REP_TXT.settings.wickermanRepBuffGrimVisage = "Feição Sombria (Da Noturnália)"
REP_TXT.settings.info.wickermanRepBuffGrimVisage = "Você pintou o seu rosto com as cinzas do Homem de Palha. Aumenta em 10% a experiência e a reputação obtidas. Dura 2 hrs."
REP_TXT.settings.MrPopularityRankOne = "Queridinho (Benefícios da Guilda, Grau 1)"
REP_TXT.settings.info.MrPopularityRankOne = "Reputação obtida ao matar monstros e cumprir missões aumentada em 5%."
REP_TXT.settings.MrPopularityRankTwo = "Queridinho (Benefícios da Guilda, Grau 2)"
REP_TXT.settings.info.MrPopularityRankTwo = "Reputação obtida ao matar monstros e cumprir missões aumentada em 10%."
REP_TXT.settings.DarkmoonFaireWeeRepBuff = "IUPI! (Feira de Negraluna)"
REP_TXT.settings.info.DarkmoonFaireWeeRepBuff = "Passeou no carrossel ou na montanha-russa de Negraluna. Ganhos de reputação e experiência aumentados em 10%."
REP_TXT.settings.DarkmoonFaireHatRep = "Cartola de Negraluna (Feira de Negraluna)"
REP_TXT.settings.info.DarkmoonFaireHatRep = "Aumenta em 10% os ganhos de experiência e reputação por 1 hour. A cartola é consumida pelo uso."
end
