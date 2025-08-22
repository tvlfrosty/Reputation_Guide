----------------------------
-- TODO: Clean up this file
----------------------------
local addonName, ReputationGuide = ...

ReputationGuide.Tools = {}

local REPT = ReputationGuide.Tools

REPT.Settings = {}

local REPSettings = REPT.Settings

REPSettings.Objects = {}

local function Mixin(o, mixin)
	for k,v in pairs(mixin) do
		o[k] = v;
	end
	return o;
end

local REPSettingsObjectMixin, REPSettingsPanelMixin;
REPSettingsObjectMixin = {
  RegisterObject = function(self, o)
		local objects = self.Objects
		if not objects then
			objects = {}
			self.Objects = objects;
		end
		tinsert(objects, o);
	end
}

REPSettingsPanelMixin = {}

Mixin(REPSettingsPanelMixin, REPSettingsObjectMixin);
Mixin(REPSettings, REPSettingsPanelMixin);

-- Utility: get container width depending on API
local function GetOptionsContainerWidth()
  if InterfaceOptionsFramePanelContainer then
    return InterfaceOptionsFramePanelContainer:GetWidth()
  elseif SettingsPanel then
    return SettingsPanel:GetWidth()
  else
    return 750 -- fallback until shown
  end
end

-- Utility: get insets depending on container
local function GetScrollFrameInsets()
  if ReputationGuide.AfterShadowLands then
    return 0, -20, -4, 4
  else
    return 0, -26, -4, 4
  end
end

-- Utility: create a scrollable content area
local function CreateScrollablePanel(name, parent)
  local scrollFrame = CreateFrame("ScrollFrame", name .. "ScrollFrame", parent, "UIPanelScrollFrameTemplate")

  local left, right, top, bottom = GetScrollFrameInsets()
  scrollFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", left, top)
  scrollFrame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", right, bottom)

  local content = CreateFrame("Frame", name .. "Content", scrollFrame)
  content:SetSize(GetOptionsContainerWidth() - 30, 1) -- start small, grow with content
  scrollFrame:SetScrollChild(content)

  return scrollFrame, content
end

local Categories, AddOnCategoryID, RootCategoryID = {}, addonName, nil
REPSettings.CreateOptionsPage = function(self, text, parentCategory, isRootCategory)
  local scrollParent
  local subcategory

  if Settings and Settings.RegisterCanvasLayoutCategory then
    -- Dragonflight API path
    local outerFrame = CreateFrame("Frame", addonName .. "-" .. text, UIParent)
    outerFrame:SetSize(GetOptionsContainerWidth(), 600)

    -- Wrap it in scrollable content
    scrollParent, subcategory = CreateScrollablePanel(addonName .. "-" .. text, outerFrame)

    local category
    if text == addonName then
      category = Settings.RegisterCanvasLayoutCategory(outerFrame, text)
      Settings.RegisterAddOnCategory(category)
      AddOnCategoryID = category.ID
      ReputationGuide.settingsCategory = AddOnCategoryID
    else
      parentCategory = Categories[parentCategory or addonName]
      category = Settings.RegisterCanvasLayoutSubcategory(parentCategory.category, outerFrame, text)
      if isRootCategory then RootCategoryID = category.ID end
    end

    subcategory.category = category
    Categories[text] = subcategory
    return subcategory
  else
    -- Old InterfaceOptions path
    local outerFrame = CreateFrame("Frame", addonName .. "-" .. text, InterfaceOptionsFramePanelContainer)
    scrollParent, subcategory = CreateScrollablePanel(addonName .. "-" .. text, outerFrame)

    subcategory.name = text
    if text ~= addonName then subcategory.parent = parentCategory or addonName end
    InterfaceOptions_AddCategory(outerFrame)
    Categories[text] = subcategory
    return subcategory
  end
end

---- Fix for removed standard tooltips from the InterfaceOptionsCheckButtonTemplate
local function SetCustomTooltip(self, text)
	self:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText(text, nil, nil, nil, nil, true)
		GameTooltip:Show()
	end)

	self:SetScript("OnLeave", function(self)
		if GameTooltip:GetOwner() == self then
			GameTooltip:Hide()
		end
	end)
end

local function checkbox(name, label, description, parent, onclick)
  local check = CreateFrame("CheckButton", "REPCheck_" .. name, parent, "InterfaceOptionsCheckButtonTemplate")
  check:SetScript("OnClick", function(self)
    local checked = self:GetChecked()
    PlaySound(checked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
    onclick(self, checked and true or false)
  end)
  check.label = _G[check:GetName() .. "Text"]
  check.label:SetText(label)
  check.tooltipText = label
  check.tooltipRequirement = description

  if ReputationGuide.AfterCata then
    SetCustomTooltip(check, description)
  end

  return check
end

local function button(text, tooltip, parent, onclick)
  local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  btn:SetText(text)
  btn.tooltipText = tooltip
  btn:SetScript("OnClick", function(self) onclick(self) end)
  btn:SetHeight(24)
  return btn
end

local function HideBlizzOptions()
  HideUIPanel(InterfaceOptionsFrame)
  HideUIPanel(GameMenuFrame)
end

local function REP_ToggleReputationBuff()
  REP_FactionGain = {}
  REP_InitEnFactionGains(ReputationGuide.GuildName)
  if not ReputationGuide.AfterDragonflight then
    ReputationFrame_Update()
  end
end

local function ToggleMrPopularityRank(lowerRank, higherRank)
  lowerRank:Enable()
  lowerRank:SetAlpha(1)
  higherRank:Enable()
  higherRank:SetAlpha(1)
  
  if REP_Data.Global.GuildRepBuffRankOne then
    higherRank:Disable()
    higherRank:SetAlpha(0.4)
  elseif REP_Data.Global.GuildRepBuffRankTwo then
    lowerRank:Disable()
    lowerRank:SetAlpha(0.4)
  end
end

local function ToggleDarkmoonFaireBuff(buffOne, buffTwo)
  buffOne:Enable()
  buffOne:SetAlpha(1)
  buffTwo:Enable()
  buffTwo:SetAlpha(1)

  if REP_Data.Global.DarkmoonfaireWeeRepBuff then
    buffTwo:Disable()
    buffTwo:SetAlpha(0.4)
  elseif REP_Data.Global.DarkmoonfaireHatRepBuff then
    buffOne:Disable()
    buffOne:SetAlpha(0.4)
  end
end

-------------------------------------------------------------------------------
-- TODO: Clean up this function (Options page should only be rendered once.)
-------------------------------------------------------------------------------
local REP_OptionsGeneralTab, REP_OptionsCharactersTab, REP_OptionsCharactersTabContent
 
function REPSettings:Open()
  if InterfaceOptionsFrame_OpenToCategory then
    InterfaceOptionsFrame_OpenToCategory(ReputationGuide.settingsCategory)
  else
    Settings.OpenToCategory(ReputationGuide.settingsCategory)
  end
end


function ReputationGuide:RenderAddonSettingsFrame()
  REP_OptionsGeneralTab = REPSettings:CreateOptionsPage(addonName)
  REP_OptionsCharactersTab = REPSettings:CreateOptionsPage("Characters", addonName, true)

  ---------------------------
  -- General options --
  ---------------------------
  local title = REP_OptionsGeneralTab:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  title:SetText(addonName)
  title:SetPoint("TOPLEFT", 16, -16)

  local showMissing = checkbox("EnableMissingBox", REP_TXT.showMissing, REP_TXT.elements.tip.REP_EnableMissingBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ShowMissing = checked end)
  local extendDetails = checkbox("ExtendDetailsBox", REP_TXT.extendDetails, REP_TXT.elements.tip.REP_ExtendDetailsBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ExtendDetails = checked end)
  local gainToChat = checkbox("GainToChatBox", REP_TXT.gainToChat, REP_TXT.elements.tip.REP_GainToChatBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.WriteChatMessage = checked end)
  local showPreviewRep = checkbox("ShowPreviewRepBox", REP_TXT.showPreviewRep, REP_TXT.elements.tip.REP_ShowPreviewRepBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ShowPreviewRep = checked end)
  local switchFactionBar = checkbox("SwitchFactionBarBox", REP_TXT.switchFactionBar, REP_TXT.elements.tip.REP_SwitchFactionBarBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.SwitchFactionBar = checked end)
  local silentSwitch = checkbox("SilentSwitchBox", REP_TXT.silentSwitch, REP_TXT.elements.tip.REP_SilentSwitchBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.SilentSwitch = checked end)
  
  -- TODO: Add translations
  local showAllFactionsGains = checkbox("ShowAllFactionsGainsBox", "Show all factions gains", "Show all hidden factions that have reputation changes in chat.", REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ShowAllFactionsGains = checked end)
  
  ---- General options positioning
  title:SetPoint("TOPLEFT", 16, -16)
  showMissing:SetPoint("TOPLEFT", title, "BOTTOMLEFT", -2, -16)
  extendDetails:SetPoint("TOPLEFT", showMissing, "BOTTOMLEFT", 0, 0)
  gainToChat:SetPoint("TOPLEFT", extendDetails, "BOTTOMLEFT", 0, 0)
  switchFactionBar:SetPoint("TOPLEFT", showPreviewRep, "BOTTOMLEFT", 0, 0)  
  silentSwitch:SetPoint("TOPLEFT", switchFactionBar, "BOTTOMLEFT", 20, 0)

  ------------------------------
  -- Reputation Buffs options --
  ------------------------------
  ---- Reputation Buffs options init
  local noGuildGain, noGuildSwitch, enableParagonBar, showBonusGainsInChat, wickermanRepBuff, harvestBountyRepBuff, guildRepBuffRankOne, guildRepBuffRankTwo, darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff
  local buffsDivider = REP_OptionsGeneralTab:CreateLine()
  local buffTitle = REP_OptionsGeneralTab:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  local buffSubTitle = REP_OptionsGeneralTab:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
  ---- Buff divider
  buffsDivider:SetColorTexture(0.82, 0.82, 0.82, 0.2)
  buffsDivider:SetThickness(1)
  ---- Buff title
  buffTitle:SetText(REP_TXT.settings.buffTitle)
  buffTitle:SetPoint("TOPLEFT", buffsDivider, "BOTTOMLEFT", 0, -16)
  ---- Buff subtitle
  buffSubTitle:SetJustifyH("LEFT")
  buffSubTitle:SetText(REP_TXT.settings.buffSubTitle)
  buffSubTitle:SetWidth(640)
  buffSubTitle:SetTextColor(1, 1, 1, 0.8)
  buffSubTitle:SetPoint("TOPLEFT", buffTitle, "BOTTOMLEFT", 0, -10)
  buffSubTitle:SetWordWrap(true)

  ---- Reputation Buffs options init part 2
  if ReputationGuide.AfterTBC then
    harvestBountyRepBuff = checkbox("HarvestBountyRepBuffBox", REP_TXT.settings.harvestBountyRepBuff, REP_TXT.settings.info.harvestBountyRepBuff, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.HarvestBountyRepBuff = checked REP_ToggleReputationBuff() end)
  end

  if ReputationGuide.AfterWotlk then
    noGuildGain = checkbox("NoGuildGainBox", REP_TXT.noGuildGain, REP_TXT.elements.tip.REP_NoGuildGainBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.NoGuildGain = checked end)
    noGuildSwitch = checkbox("NoGuildSwitchBox", REP_TXT.noGuildSwitch, REP_TXT.elements.tip.REP_NoGuildSwitchBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.NoGuildSwitch = checked end)
    
    if ReputationGuide.IsAlliance then -- Alliance
      wickermanRepBuff = checkbox("WickermanRepBuffBox", REP_TXT.settings.wickermanRepBuffUnburdened, REP_TXT.settings.info.wickermanRepBuffUnburdened, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.WickermanRepBuff = checked REP_ToggleReputationBuff() end)
    else -- Horde
      wickermanRepBuff = checkbox("WickermanRepBuffBox", REP_TXT.settings.wickermanRepBuffGrimVisage, REP_TXT.settings.info.wickermanRepBuffGrimVisage, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.WickermanRepBuff = checked REP_ToggleReputationBuff() end)
    end

    noGuildGain:SetPoint("TOPLEFT", gainToChat, "BOTTOMLEFT", 20, 0)
    showPreviewRep:SetPoint("TOPLEFT", noGuildGain, "BOTTOMLEFT", -20, 0)
    noGuildSwitch:SetPoint("TOPLEFT", silentSwitch, "BOTTOMLEFT", 0, 0)
    
    if not ReputationGuide.AfterMoP then
      guildRepBuffRankOne = checkbox("GuildRepBuffRankOneBox", REP_TXT.settings.MrPopularityRankOne, REP_TXT.settings.info.MrPopularityRankOne, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.GuildRepBuffRankOne = checked ToggleMrPopularityRank(guildRepBuffRankOne, guildRepBuffRankTwo) REP_ToggleReputationBuff() end)
      guildRepBuffRankTwo = checkbox("GuildRepBuffRankTwoBox", REP_TXT.settings.MrPopularityRankTwo, REP_TXT.settings.info.MrPopularityRankTwo, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.GuildRepBuffRankTwo = checked ToggleMrPopularityRank(guildRepBuffRankOne, guildRepBuffRankTwo) REP_ToggleReputationBuff() end)
      guildRepBuffRankOne:SetPoint("TOPLEFT", harvestBountyRepBuff, "BOTTOMLEFT", 0, 0)
      guildRepBuffRankTwo:SetPoint("TOPLEFT", guildRepBuffRankOne, "BOTTOMLEFT", 0, 0)
      ToggleMrPopularityRank(guildRepBuffRankOne, guildRepBuffRankTwo)
    end

    if ReputationGuide.AfterCata then
      darkmoonfaireWeeRepBuff = checkbox("DarkmoonFaireWeeRepBuffBox", REP_TXT.settings.DarkmoonFaireWeeRepBuff, REP_TXT.settings.info.DarkmoonFaireWeeRepBuff, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.DarkmoonfaireWeeRepBuff = checked REP_ToggleReputationBuff() ToggleDarkmoonFaireBuff(darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff) end)
      darkmoonfaireHatRepBuff = checkbox("DarkmoonFaireHatRepBuffBox", REP_TXT.settings.DarkmoonFaireHatRep, REP_TXT.settings.info.DarkmoonFaireHatRep, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.DarkmoonfaireHatRepBuff = checked REP_ToggleReputationBuff() ToggleDarkmoonFaireBuff(darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff) end)
      ToggleDarkmoonFaireBuff(darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff)

      showBonusGainsInChat = checkbox("ShowBonusGainsInChatBox", REP_TXT.settings.ShowBonusGainsInChat, REP_TXT.settings.info.ShowBonusGainsInChat, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ShowBonusGainsInChat = checked end)

      if ReputationGuide.AfterMoP then
        darkmoonfaireWeeRepBuff:SetPoint("TOPLEFT", harvestBountyRepBuff, "BOTTOMLEFT", 0, 0)
      else
        darkmoonfaireWeeRepBuff:SetPoint("TOPLEFT", guildRepBuffRankTwo, "BOTTOMLEFT", 0, 0)
      end

      darkmoonfaireHatRepBuff:SetPoint("TOPLEFT", darkmoonfaireWeeRepBuff, "BOTTOMLEFT", 0, 0)
    end

    if ReputationGuide.AfterWoD then
      enableParagonBar = checkbox("EnableParagonBarBox", REP_TXT.EnableParagonBar, REP_TXT.elements.tip.REP_EnableParagonBarBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ShowParagonBar = checked end)
      enableParagonBar:SetPoint("TOPLEFT", noGuildSwitch, "BOTTOMLEFT", -20, 0)
      showAllFactionsGains:SetPoint("TOPLEFT", enableParagonBar, "BOTTOMLEFT", 0, 0)
    else
      showAllFactionsGains:SetPoint("TOPLEFT", noGuildSwitch, "BOTTOMLEFT", -20, 0)
    end
  else
    wickermanRepBuff = checkbox("WickermanRepBuffBox", REP_TXT.settings.wickermanRepBuff, REP_TXT.settings.info.wickermanRepBuff, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.WickermanRepBuff = checked REP_ToggleReputationBuff() end)

    showPreviewRep:SetPoint("TOPLEFT", gainToChat, "BOTTOMLEFT", 0, 0)
    showAllFactionsGains:SetPoint("TOPLEFT", silentSwitch, "BOTTOMLEFT", -20, 0)
  end

  if ReputationGuide.AfterCata then
    showBonusGainsInChat:SetPoint("TOPLEFT", showAllFactionsGains, "BOTTOMLEFT", 0, 0)
    buffsDivider:SetStartPoint("BOTTOMLEFT", showBonusGainsInChat, 0, -16)
    buffsDivider:SetEndPoint("BOTTOMRIGHT", showBonusGainsInChat, 400, -16)
  else
    buffsDivider:SetStartPoint("BOTTOMLEFT", showAllFactionsGains, 0, -16)
    buffsDivider:SetEndPoint("BOTTOMRIGHT", showAllFactionsGains, 400, -16)
  end

  wickermanRepBuff:SetPoint("TOPLEFT", buffSubTitle, "BOTTOMLEFT", -5, -16)
  if ReputationGuide.AfterTBC then
    harvestBountyRepBuff:SetPoint("TOPLEFT", wickermanRepBuff, "BOTTOMLEFT", 0, 0)
  end

  --------------------------------------
  -- Characters for tooltip --
  --------------------------------------
  if REP_Data.ProfileKeys and ReputationGuide:TableSize(REP_Data.ProfileKeys) > 0 then
    local tooltipDivider = REP_OptionsGeneralTab:CreateLine()
    local tooltipTitle = REP_OptionsGeneralTab:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    local tooltipSubTitle = REP_OptionsGeneralTab:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    ---- Buff divider
    tooltipDivider:SetColorTexture(0.82, 0.82, 0.82, 0.2)
    tooltipDivider:SetThickness(1)
  
    if not ReputationGuide.realm then ReputationGuide.realm = GetRealmName() end

    ---- Buff title
    tooltipTitle:SetText("Show these " .. ReputationGuide.realm .. " characters on tooltips:")
    tooltipTitle:SetPoint("TOPLEFT", tooltipDivider, "BOTTOMLEFT", 0, -16)
    ---- Buff subtitle
    -- tooltipSubTitle:SetJustifyH("LEFT")
    -- tooltipSubTitle:SetText("")
    -- tooltipSubTitle:SetWidth(640)
    -- tooltipSubTitle:SetTextColor(1, 1, 1, 0.8)
    -- tooltipSubTitle:SetPoint("TOPLEFT", tooltipTitle, "BOTTOMLEFT", 0, -10)
    -- tooltipSubTitle:SetWordWrap(true)

    if ReputationGuide.AfterCata then
      tooltipDivider:SetStartPoint("BOTTOMLEFT", darkmoonfaireHatRepBuff, 0, -16)
      tooltipDivider:SetEndPoint("BOTTOMRIGHT", darkmoonfaireHatRepBuff, 400, -16)
    else
      if ReputationGuide.AfterWotlk then
        tooltipDivider:SetStartPoint("BOTTOMLEFT", guildRepBuffRankTwo, 0, -16)
        tooltipDivider:SetEndPoint("BOTTOMRIGHT", guildRepBuffRankTwo, 400, -16)
      else
        if ReputationGuide.AfterTBC then
          tooltipDivider:SetStartPoint("BOTTOMLEFT", harvestBountyRepBuff, 0, -16)
          tooltipDivider:SetEndPoint("BOTTOMRIGHT", harvestBountyRepBuff, 400, -16)
        else
          tooltipDivider:SetStartPoint("BOTTOMLEFT", wickermanRepBuff, 0, -16)
          tooltipDivider:SetEndPoint("BOTTOMRIGHT", wickermanRepBuff, 400, -16)
        end
      end
    end

    local lastCheckbox

    for profileKey, profileData in pairs(REP_Data.ProfileKeys) do
      local k = REP_Data.ProfileKeys[profileKey]
      if k and k.profile and ReputationGuide.realm == k.profile.realm and k.profile.class then
        local color = "|c" .. ReputationGuide:GetClassColor(k.profile.class)
        local cb = checkbox("Show"..profileKey.."InTooltipBox", color .. k.profile.name .. " |r(Level " .. k.profile.level .. ")", "", REP_OptionsGeneralTab, function(_, checked) k.profile.ShowChar = checked end)
        cb:SetChecked(k.profile.ShowChar)

        if not lastCheckbox then
          cb:SetPoint("TOPLEFT", tooltipTitle, "BOTTOMLEFT", -2, -10)
        else
          cb:SetPoint("TOPLEFT", lastCheckbox, "BOTTOMLEFT", 0, -4)
        end

        lastCheckbox = cb
      end
    end

    if lastCheckbox then
      local spacer = CreateFrame("Frame", nil, REP_OptionsGeneralTab)
      spacer:SetSize(1, 30) -- width doesn't matter, height = extra space
      spacer:SetPoint("TOPLEFT", lastCheckbox, "BOTTOMLEFT", 0, -10)
    end
  end

  --------------------------------------
  -- Reputation Character options tab --
  --------------------------------------
  local characterTabTitle = REP_OptionsCharactersTab:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  characterTabTitle:SetText(addonName.." Characters")
  characterTabTitle:SetPoint("TOPLEFT", 16, -16)

  local characterTabSubTitle = REP_OptionsCharactersTab:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
  characterTabSubTitle:SetJustifyH("LEFT")
  characterTabSubTitle:SetText(REP_TXT.settings.characterTabSubTitle)
  characterTabSubTitle:SetWidth(640)
  characterTabSubTitle:SetTextColor(1, 1, 1, 0.8)
  characterTabSubTitle:SetPoint("TOPLEFT", characterTabTitle, "BOTTOMLEFT", 0, -10)
  characterTabSubTitle:SetWordWrap(true)

  REP_OptionsCharactersTabScrollFrame = CreateFrame("ScrollFrame", nil, REP_OptionsCharactersTab, "UIPanelScrollFrameTemplate")
  REP_OptionsCharactersTabScrollFrame:SetPoint("TOPLEFT", characterTabSubTitle, "BOTTOMLEFT", 0, -20)
  REP_OptionsCharactersTabScrollFrame:SetSize(REP_OptionsCharactersTab:GetWidth(), 400)

  REP_OptionsCharactersTabContent = CreateFrame("Frame", nil, REP_OptionsCharactersTabScrollFrame)
  REP_OptionsCharactersTabContent:SetSize(REP_OptionsCharactersTab:GetWidth(), 400)
  REP_OptionsCharactersTabScrollFrame:SetScrollChild(REP_OptionsCharactersTabContent)
  
  ReputationGuide:DisplayProfileFrames(true)

  ----------------------------------
  -- Init addon settings --
  ----------------------------------
  local function initOptions()
    showMissing:SetChecked(REP_Data.Global.ShowMissing)
    extendDetails:SetChecked(REP_Data.Global.ExtendDetails)
    gainToChat:SetChecked(REP_Data.Global.WriteChatMessage)
    showPreviewRep:SetChecked(REP_Data.Global.ShowPreviewRep)
    switchFactionBar:SetChecked(REP_Data.Global.SwitchFactionBar)
    silentSwitch:SetChecked(REP_Data.Global.SilentSwitch)
    showAllFactionsGains:SetChecked(REP_Data.Global.ShowAllFactionsGains)

    wickermanRepBuff:SetChecked(REP_Data.Global.WickermanRepBuff)

    if ReputationGuide.AfterTBC then
      harvestBountyRepBuff:SetChecked(REP_Data.Global.HarvestBountyRepBuff)
    end

    if ReputationGuide.AfterWotlk then
      noGuildGain:SetChecked(REP_Data.Global.NoGuildGain)
      noGuildSwitch:SetChecked(REP_Data.Global.NoGuildSwitch)
      
      if not ReputationGuide.AfterMoP then
        guildRepBuffRankOne:SetChecked(REP_Data.Global.GuildRepBuffRankOne)
        guildRepBuffRankTwo:SetChecked(REP_Data.Global.GuildRepBuffRankTwo)
      end
    end

    if ReputationGuide.AfterCata then
      showBonusGainsInChat:SetChecked(REP_Data.Global.ShowBonusGainsInChat)
      darkmoonfaireWeeRepBuff:SetChecked(REP_Data.Global.DarkmoonfaireWeeRepBuff)
      darkmoonfaireHatRepBuff:SetChecked(REP_Data.Global.DarkmoonfaireHatRepBuff)
    end

    if ReputationGuide.AfterWoD then
      enableParagonBar:SetChecked(REP_Data.Global.ShowParagonBar)
    end
  end

  initOptions()
end

renderedProfileFrames = {}
ReputationGuide.renderedProfileFrames = renderedProfileFrames

function ReputationGuide:DisplayProfileFrames(initOnly)
  if REP_OptionsCharactersTabContent then
    for i, child in ipairs({REP_OptionsCharactersTabContent:GetChildren()}) do
      child:Hide()
    end
  end
  
  local index = 0
  for profileKey, profileData in pairs(REP_Data.ProfileKeys) do
    index = index + 1
    profileFrame = ReputationGuide.renderedProfileFrames[index]
    
    if profileFrame then
      if not initOnly then
        profileFrame:SetPoint("TOPLEFT", REP_OptionsCharactersTabContent, "TOPLEFT", 0, (-10 - ((index - 1) * 30)))
      end

      profileFrame.resetButton:Show()
      profileFrame.deleteButton:Show()
    end
  end
end

function ReputationGuide:RenderProfileFrames()  
  for profileKey, profileData in pairs(REP_Data.ProfileKeys) do
    local k = REP_Data.ProfileKeys[profileKey]
    if k and k.profile then
      local profileFrame = ReputationGuide:CreateProfileFrame(#renderedProfileFrames + 1, profileKey)
      table.insert(renderedProfileFrames, profileFrame)
    end
  end
end

function ReputationGuide:CreateProfileFrame(index, profileKey, yOffset)
  local characterProfile = REP_Data.ProfileKeys[profileKey]
  local profileName = format("%s-%s", characterProfile.profile.name, characterProfile.profile.realm)

  local frame = CreateFrame("Frame", nil, REP_OptionsCharactersTabContent)
  frame:SetSize(300, 50)
  frame:SetPoint("TOPLEFT", REP_OptionsCharactersTabContent, "TOPLEFT", 0, (-10 - ((index - 1) * 30)))

  frame.text = REP_OptionsCharactersTabContent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  frame.text:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
  frame.text:SetText(profileName)
  
  frame.resetButton = CreateFrame("Button", "REP_OptionsResetCharacterVariablesButton"..index, REP_OptionsCharactersTabContent, "UIPanelButtonTemplate")
  frame.resetButton:SetSize(80, 20)
  frame.resetButton:SetPoint("LEFT", frame.text, "RIGHT", 10, 0)
  frame.resetButton:SetText("Reset")
  frame.resetButton:SetScript("OnClick", function()
    REP_Data.ProfileKeys[profileKey] = {}
    ReputationGuide:Print("The saved variables for "..tostring(profileName).." has been reset.")
  end)

  frame.deleteButton = CreateFrame("Button", "REP_OptionsDeleteCharacterVariablesButton"..index, REP_OptionsCharactersTabContent, "UIPanelButtonTemplate")
  frame.deleteButton:SetSize(80, 20)
  frame.deleteButton:SetPoint("LEFT", frame.resetButton, "RIGHT", 10, 0)
  frame.deleteButton:SetText("Delete")
  frame.deleteButton:SetScript("OnClick", function()
    ReputationGuide:RemoveProfileFrame(index)
    REP_Data.ProfileKeys[profileKey] = nil
    ReputationGuide:Print(tostring(profileName).." has been removed from the saved variables.")
    frame = nil
  end)

  return frame
end

function ReputationGuide:RemoveProfileFrame(index)
  local frame = renderedProfileFrames[index]
  if frame then
    if frame.text then
      frame.text:Hide()
      frame.text = nil
    end

    if frame.resetButton then
      frame.resetButton:SetScript("OnClick", nil)
      frame.resetButton = nil
    end

    if frame.deleteButton then
      frame.deleteButton:SetScript("OnClick", nil)
      frame.deleteButton = nil
    end

    frame:Hide()
    frame:SetParent(nil)
    frame:ClearAllPoints()
    frame = nil
  end

  table.remove(renderedProfileFrames, index)
  ReputationGuide:DisplayProfileFrames()
end