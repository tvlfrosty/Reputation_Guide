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
  if ReputationGuide.UseScrollBoxReputationUI then
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
  ReputationGuide:ElvSkin("scrollBar", scrollFrame.ScrollBar or _G[name .. "ScrollFrameScrollBar"])

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
local function SetCustomTooltip(self, text, title)
	self:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		if title and title ~= "" then
			GameTooltip:SetText(title, 1, 1, 1)
			if text and text ~= "" then GameTooltip:AddLine(text, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, true) end
		else
			GameTooltip:SetText(text or "", nil, nil, nil, nil, true)
		end
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

  -- The options checkbox template of the current clients (Classic included) no longer shows tooltipText.
  SetCustomTooltip(check, description, label)
  ReputationGuide:ElvSkin("check", check)

  return check
end

-- Choice between a few values: a dropdown on clients with the menu API, otherwise a button that cycles.
local function selector(label, description, parent, options, getValue, onSelect)
  local holder = CreateFrame("Frame", nil, parent)
  holder:SetSize(400, 26)

  local text = holder:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
  text:SetPoint("LEFT", holder, "LEFT", 4, 0)
  text:SetText(label)

  local function TextOf(value)
    for _, option in ipairs(options) do
      if option.value == value then return option.text end
    end
    return ""
  end

  local ok, dropdown = false, nil
  if MenuUtil then ok, dropdown = pcall(CreateFrame, "DropdownButton", nil, holder, "WowStyle1DropdownTemplate") end

  if ok and dropdown and dropdown.SetupMenu then
    dropdown:SetWidth(140)
    dropdown:SetupMenu(function(_, rootDescription)
      for _, option in ipairs(options) do
        rootDescription:CreateRadio(option.text, function() return getValue() == option.value end, function() onSelect(option.value) end)
      end
    end)
    holder.Refresh = function() dropdown:GenerateMenu() end
    ReputationGuide:ElvSkin("dropdown", dropdown, 140)
  else
    dropdown = CreateFrame("Button", nil, holder, "UIPanelButtonTemplate")
    dropdown:SetSize(140, 22)
    dropdown:SetScript("OnClick", function(self)
      local current, nextIndex = getValue(), 1
      for i, option in ipairs(options) do
        if option.value == current then nextIndex = (i % #options) + 1 end
      end
      onSelect(options[nextIndex].value)
      self:SetText(TextOf(getValue()))
    end)
    holder.Refresh = function() dropdown:SetText(TextOf(getValue())) end
    ReputationGuide:ElvSkin("button", dropdown)
  end

  dropdown:SetPoint("LEFT", text, "RIGHT", 12, 0)
  SetCustomTooltip(holder, description, label)
  holder:EnableMouse(true)

  return holder
end

-- Slider from minValue to maxValue (step), the value is shown next to it.
local function slider(label, description, parent, minValue, maxValue, step, formatValue, onChange)
  local holder = CreateFrame("Frame", nil, parent)
  holder:SetSize(400, 26)

  local text = holder:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
  text:SetPoint("LEFT", holder, "LEFT", 4, 0)
  text:SetText(label)

  local bar = CreateFrame("Slider", nil, holder, BackdropTemplateMixin and "BackdropTemplate" or nil)
  bar:SetOrientation("HORIZONTAL")
  bar:SetSize(160, 17)
  bar:SetPoint("LEFT", text, "RIGHT", 14, 0)
  if bar.SetBackdrop then
    bar:SetBackdrop({ bgFile = "Interface\\Buttons\\UI-SliderBar-Background", edgeFile = "Interface\\Buttons\\UI-SliderBar-Border", tile = true, tileSize = 8, edgeSize = 8, insets = { left = 3, right = 3, top = 6, bottom = 6 } })
  end
  bar:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
  bar:SetMinMaxValues(minValue, maxValue)
  bar:SetValueStep(step)
  if bar.SetObeyStepOnDrag then bar:SetObeyStepOnDrag(true) end
  ReputationGuide:ElvSkin("slider", bar)

  local valueText = holder:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
  valueText:SetPoint("LEFT", bar, "RIGHT", 8, 0)

  bar:SetScript("OnValueChanged", function(_, value)
    value = math.floor(value / step + 0.5) * step
    valueText:SetText(formatValue(value))
    if not holder.isRefreshing then onChange(value) end
  end)

  holder.SetValue = function(self, value)
    self.isRefreshing = true
    bar:SetValue(value)
    valueText:SetText(formatValue(value))
    self.isRefreshing = false
  end

  SetCustomTooltip(holder, description, label)
  holder:EnableMouse(true)

  return holder
end

local function button(text, tooltip, parent, onclick)
  local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  btn:SetText(text)
  btn.tooltipText = tooltip
  btn:SetScript("OnClick", function(self) onclick(self) end)
  btn:SetHeight(24)
  ReputationGuide:ElvSkin("button", btn)
  return btn
end

-- The reputation factor is applied when the sources list is built, a refresh is enough.
local function REP_ToggleReputationBuff()
  if ReputationGuide.UseModernReputationUI then
    ReputationGuide:RequestDetailFrameRefresh()
  else
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

function ReputationGuide:RefreshDarkmoonFaireBuffOptions()
  local buffOne, buffTwo = _G["REPCheck_DarkmoonFaireWeeRepBuffBox"], _G["REPCheck_DarkmoonFaireHatRepBuffBox"]
  if not buffOne or not buffTwo then return end

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
local REP_OptionsGeneralTab, REP_OptionsCharactersTab, REP_OptionsCharactersTabContent, REP_OptionsDetailsTab
 
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
  REP_OptionsDetailsTab = REPSettings:CreateOptionsPage(REP_TXT.settings.detailsTabTitle, addonName)

  ---------------------------
  -- General options --
  ---------------------------
  local title = REP_OptionsGeneralTab:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  title:SetText(addonName)
  title:SetPoint("TOPLEFT", 16, -16)

  local showMissing = checkbox("EnableMissingBox", REP_TXT.showMissing, REP_TXT.elements.tip.REP_EnableMissingBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ShowMissing = checked end)
  local gainToChat = checkbox("GainToChatBox", REP_TXT.gainToChat, REP_TXT.elements.tip.REP_GainToChatBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.WriteChatMessage = checked end)
  local showPreviewRep = checkbox("ShowPreviewRepBox", REP_TXT.showPreviewRep, REP_TXT.elements.tip.REP_ShowPreviewRepBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ShowPreviewRep = checked end)
  local switchFactionBar = checkbox("SwitchFactionBarBox", REP_TXT.switchFactionBar, REP_TXT.elements.tip.REP_SwitchFactionBarBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.SwitchFactionBar = checked end)
  local silentSwitch = checkbox("SilentSwitchBox", REP_TXT.silentSwitch, REP_TXT.elements.tip.REP_SilentSwitchBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.SilentSwitch = checked end)
  
  -- TODO: Add translations
  local showAllFactionsGains = checkbox("ShowAllFactionsGainsBox", "Show all factions gains", "Show all hidden factions that have reputation changes in chat.", REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ShowAllFactionsGains = checked end)
  
  ---- General options positioning
  title:SetPoint("TOPLEFT", 16, -16)
  showMissing:SetPoint("TOPLEFT", title, "BOTTOMLEFT", -2, -16)
  gainToChat:SetPoint("TOPLEFT", showMissing, "BOTTOMLEFT", 0, 0)
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
    harvestBountyRepBuff = checkbox("HarvestBountyRepBuffBox", REP_TXT.settings.harvestBountyRepBuff, REP_TXT.settings.info.harvestBountyRepBuff, REP_OptionsGeneralTab, function(_, checked) ReputationGuide:SetReputationBuffManually("HarvestBountyRepBuff", checked) REP_ToggleReputationBuff() end)
  end

  if ReputationGuide.AfterWotlk then
    noGuildGain = checkbox("NoGuildGainBox", REP_TXT.noGuildGain, REP_TXT.elements.tip.REP_NoGuildGainBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.NoGuildGain = checked end)
    noGuildSwitch = checkbox("NoGuildSwitchBox", REP_TXT.noGuildSwitch, REP_TXT.elements.tip.REP_NoGuildSwitchBox, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.NoGuildSwitch = checked end)
    
    if ReputationGuide.IsAlliance then -- Alliance
      wickermanRepBuff = checkbox("WickermanRepBuffBox", REP_TXT.settings.wickermanRepBuffUnburdened, REP_TXT.settings.info.wickermanRepBuffUnburdened, REP_OptionsGeneralTab, function(_, checked) ReputationGuide:SetReputationBuffManually("WickermanRepBuff", checked) REP_ToggleReputationBuff() end)
    else -- Horde
      wickermanRepBuff = checkbox("WickermanRepBuffBox", REP_TXT.settings.wickermanRepBuffGrimVisage, REP_TXT.settings.info.wickermanRepBuffGrimVisage, REP_OptionsGeneralTab, function(_, checked) ReputationGuide:SetReputationBuffManually("WickermanRepBuff", checked) REP_ToggleReputationBuff() end)
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
      darkmoonfaireWeeRepBuff = checkbox("DarkmoonFaireWeeRepBuffBox", REP_TXT.settings.DarkmoonFaireWeeRepBuff, REP_TXT.settings.info.DarkmoonFaireWeeRepBuff, REP_OptionsGeneralTab, function(_, checked) ReputationGuide:SetReputationBuffManually("DarkmoonfaireWeeRepBuff", checked) REP_ToggleReputationBuff() ToggleDarkmoonFaireBuff(darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff) end)
      darkmoonfaireHatRepBuff = checkbox("DarkmoonFaireHatRepBuffBox", REP_TXT.settings.DarkmoonFaireHatRep, REP_TXT.settings.info.DarkmoonFaireHatRep, REP_OptionsGeneralTab, function(_, checked) ReputationGuide:SetReputationBuffManually("DarkmoonfaireHatRepBuff", checked) REP_ToggleReputationBuff() ToggleDarkmoonFaireBuff(darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff) end)
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
    wickermanRepBuff = checkbox("WickermanRepBuffBox", REP_TXT.settings.wickermanRepBuff, REP_TXT.settings.info.wickermanRepBuff, REP_OptionsGeneralTab, function(_, checked) ReputationGuide:SetReputationBuffManually("WickermanRepBuff", checked) REP_ToggleReputationBuff() end)

    showPreviewRep:SetPoint("TOPLEFT", gainToChat, "BOTTOMLEFT", 0, 0)
    showAllFactionsGains:SetPoint("TOPLEFT", silentSwitch, "BOTTOMLEFT", -20, 0)
  end

  local showSyncMessages = checkbox("ShowSyncMessagesBox", REP_TXT.showSyncMessages, REP_TXT.showSyncMessagesTip, REP_OptionsGeneralTab, function(_, checked) REP_Data.Global.ShowSyncMessages = checked end)
  showSyncMessages:SetPoint("TOPLEFT", showAllFactionsGains, "BOTTOMLEFT", 0, 0)

  if ReputationGuide.AfterCata then
    showBonusGainsInChat:SetPoint("TOPLEFT", showSyncMessages, "BOTTOMLEFT", 0, 0)
    buffsDivider:SetStartPoint("BOTTOMLEFT", showBonusGainsInChat, 0, -16)
    buffsDivider:SetEndPoint("BOTTOMRIGHT", showBonusGainsInChat, 400, -16)
  else
    buffsDivider:SetStartPoint("BOTTOMLEFT", showSyncMessages, 0, -16)
    buffsDivider:SetEndPoint("BOTTOMRIGHT", showSyncMessages, 400, -16)
  end

  wickermanRepBuff:SetPoint("TOPLEFT", buffSubTitle, "BOTTOMLEFT", -5, -16)
  if ReputationGuide.AfterTBC then
    harvestBountyRepBuff:SetPoint("TOPLEFT", wickermanRepBuff, "BOTTOMLEFT", 0, 0)
  end

  --------------------------------------
  -- Reputation Character options tab --
  --------------------------------------
  local characterTabTitle = REP_OptionsCharactersTab:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  characterTabTitle:SetText(addonName.." "..REP_TXT.characters)
  characterTabTitle:SetPoint("TOPLEFT", 16, -16)

  local characterTabSubTitle = REP_OptionsCharactersTab:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
  characterTabSubTitle:SetJustifyH("LEFT")
  characterTabSubTitle:SetText(REP_TXT.settings.characterTabSubTitle)
  characterTabSubTitle:SetWidth(640)
  characterTabSubTitle:SetTextColor(1, 1, 1, 0.8)
  characterTabSubTitle:SetPoint("TOPLEFT", characterTabTitle, "BOTTOMLEFT", 0, -10)
  characterTabSubTitle:SetWordWrap(true)

  REP_OptionsCharactersTabContent = CreateFrame("Frame", nil, REP_OptionsCharactersTab)
  REP_OptionsCharactersTabContent:SetPoint("TOPLEFT", characterTabSubTitle, "BOTTOMLEFT", 0, -20)
  REP_OptionsCharactersTabContent:SetPoint("RIGHT", 0, 0)
  REP_OptionsCharactersTabContent:SetHeight(1)
  
  ReputationGuide:DisplayProfileFrames(true)

  ------------------------------------
  -- Details frame options tab --
  ------------------------------------
  local detailsTabTitle = REP_OptionsDetailsTab:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  detailsTabTitle:SetText(addonName.." "..REP_TXT.settings.detailsTabTitle)
  detailsTabTitle:SetPoint("TOPLEFT", 16, -16)

  local detailsTabSubTitle = REP_OptionsDetailsTab:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
  detailsTabSubTitle:SetJustifyH("LEFT")
  detailsTabSubTitle:SetText(REP_TXT.settings.detailsTabSubTitle)
  detailsTabSubTitle:SetWidth(640)
  detailsTabSubTitle:SetTextColor(1, 1, 1, 0.8)
  detailsTabSubTitle:SetPoint("TOPLEFT", detailsTabTitle, "BOTTOMLEFT", 0, -10)
  detailsTabSubTitle:SetWordWrap(true)

  local extendDetails = checkbox("ExtendDetailsBox", REP_TXT.extendDetails, REP_TXT.elements.tip.REP_ExtendDetailsBox, REP_OptionsDetailsTab, function(_, checked)
    REP_Data.Global.ExtendDetails = checked
    if ReputationGuide.ApplyDetailFrameMode then ReputationGuide:ApplyDetailFrameMode() end
  end)
  extendDetails:SetPoint("TOPLEFT", detailsTabSubTitle, "BOTTOMLEFT", -2, -16)

  local showStandingBar = checkbox("ShowStandingBarBox", REP_TXT.settings.showStandingBar, REP_TXT.settings.info.showStandingBar, REP_OptionsDetailsTab, function(_, checked)
    REP_Data.Global.ShowStandingBar = checked
    if REP_DetailPanel and REP_DetailPanel.ApplyOptions then REP_DetailPanel:ApplyOptions() end
  end)
  showStandingBar:SetPoint("TOPLEFT", extendDetails, "BOTTOMLEFT", 0, 0)

  local allowResize = checkbox("AllowDetailResizeBox", REP_TXT.settings.allowDetailResize, REP_TXT.settings.info.allowDetailResize, REP_OptionsDetailsTab, function(_, checked)
    REP_Data.Global.AllowDetailResize = checked
    if ReputationGuide.ApplyDetailResizeOption then ReputationGuide:ApplyDetailResizeOption() end
  end)
  allowResize:SetPoint("TOPLEFT", showStandingBar, "BOTTOMLEFT", 0, 0)

  local function ApplyDetailOptions()
    if REP_DetailPanel and REP_DetailPanel.ApplyOptions then REP_DetailPanel:ApplyOptions() end
  end

  local showDescription = checkbox("ShowDetailDescriptionBox", REP_TXT.settings.showDetailDescription, REP_TXT.settings.info.showDetailDescription, REP_OptionsDetailsTab, function(_, checked)
    REP_Data.Global.ShowDetailDescription = checked
    ApplyDetailOptions()
  end)
  showDescription:SetPoint("TOPLEFT", allowResize, "BOTTOMLEFT", 0, 0)

  local showStatistics = checkbox("ShowDetailStatisticsBox", REP_TXT.settings.showDetailStatistics, REP_TXT.settings.info.showDetailStatistics, REP_OptionsDetailsTab, function(_, checked)
    REP_Data.Global.ShowDetailStatistics = checked
    ApplyDetailOptions()
  end)
  showStatistics:SetPoint("TOPLEFT", showDescription, "BOTTOMLEFT", 0, 0)

  local expandByDefault = checkbox("ExpandSourcesByDefaultBox", REP_TXT.settings.expandSourcesByDefault, REP_TXT.settings.info.expandSourcesByDefault, REP_OptionsDetailsTab, function(_, checked)
    REP_Data.Global.ExpandSourcesByDefault = checked
    if REP_BuildUpdateList then REP_BuildUpdateList() end
  end)
  expandByDefault:SetPoint("TOPLEFT", showStatistics, "BOTTOMLEFT", 0, 0)

  local fontSize = selector(REP_TXT.settings.listFontSize, REP_TXT.settings.info.listFontSize, REP_OptionsDetailsTab, {
    { value = "small", text = REP_TXT.settings.fontSmall },
    { value = "normal", text = REP_TXT.settings.fontNormal },
    { value = "large", text = REP_TXT.settings.fontLarge },
  }, function() return REP_Data.Global.DetailListFontSize or "normal" end, function(value)
    REP_Data.Global.DetailListFontSize = value
    ApplyDetailOptions()
  end)
  fontSize:SetPoint("TOPLEFT", expandByDefault, "BOTTOMLEFT", 0, -8)

  local transparency = slider(REP_TXT.settings.backgroundAlpha, REP_TXT.settings.info.backgroundAlpha, REP_OptionsDetailsTab, 20, 100, 5, function(value) return value.."%" end, function(value)
    REP_Data.Global.DetailBackgroundAlpha = value / 100
    ApplyDetailOptions()
  end)
  transparency:SetPoint("TOPLEFT", fontSize, "BOTTOMLEFT", 0, -10)

  ----------------------------------
  -- Init addon settings --
  ----------------------------------
  local function initOptions()
    showMissing:SetChecked(REP_Data.Global.ShowMissing)
    extendDetails:SetChecked(REP_Data.Global.ExtendDetails)
    showStandingBar:SetChecked(REP_Data.Global.ShowStandingBar ~= false)
    allowResize:SetChecked(REP_Data.Global.AllowDetailResize ~= false)
    showDescription:SetChecked(REP_Data.Global.ShowDetailDescription ~= false)
    showStatistics:SetChecked(REP_Data.Global.ShowDetailStatistics ~= false)
    expandByDefault:SetChecked(REP_Data.Global.ExpandSourcesByDefault and true or false)
    fontSize:Refresh()
    transparency:SetValue(math.floor((tonumber(REP_Data.Global.DetailBackgroundAlpha) or 1) * 100 + 0.5))
    gainToChat:SetChecked(REP_Data.Global.WriteChatMessage)
    showPreviewRep:SetChecked(REP_Data.Global.ShowPreviewRep)
    switchFactionBar:SetChecked(REP_Data.Global.SwitchFactionBar)
    silentSwitch:SetChecked(REP_Data.Global.SilentSwitch)
    showAllFactionsGains:SetChecked(REP_Data.Global.ShowAllFactionsGains)
    showSyncMessages:SetChecked(REP_Data.Global.ShowSyncMessages ~= false)

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
    local profileFrame = ReputationGuide.renderedProfileFrames[index]
    
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
  local keys = {}
  for profileKey in pairs(REP_Data.ProfileKeys) do
    table.insert(keys, profileKey)
  end

  table.sort(keys, function(a, b)
    local pa = REP_Data.ProfileKeys[a]
    local pb = REP_Data.ProfileKeys[b]

    if not pa or not pa.profile or not pb or not pb.profile then return end
    local realmA = (pa.profile.realm or ""):lower()
    local realmB = (pb.profile.realm or ""):lower()
    local nameA  = (pa.profile.name or ""):lower()
    local nameB  = (pb.profile.name or ""):lower()

    if realmA == realmB then
      return nameA < nameB
    else
      return realmA < realmB
    end
  end)

  for _, profileKey in ipairs(keys) do
    local k = REP_Data.ProfileKeys[profileKey]
    if k and k.profile and k.profile.class then
      local profileFrame = ReputationGuide:CreateProfileFrame(#renderedProfileFrames + 1, profileKey)
      table.insert(renderedProfileFrames, profileFrame)
    end
  end
end

function ReputationGuide:CreateProfileFrame(index, profileKey, yOffset)
  local characterProfile = REP_Data.ProfileKeys[profileKey]
  if not characterProfile and not characterProfile.profile then return end
  local color = "|c" .. ReputationGuide:GetClassColor(characterProfile.profile.class)
  local profileName = color .. characterProfile.profile.name .. "-" .. characterProfile.profile.realm .. " |r(" .. (LEVEL or "Level") .. " " .. characterProfile.profile.level .. ")"

  local frame = CreateFrame("Frame", nil, REP_OptionsCharactersTabContent)
  frame:SetSize(300, 50)
  frame:SetPoint("TOPLEFT", REP_OptionsCharactersTabContent, "TOPLEFT", 0, (-10 - ((index - 1) * 30)))
  ------ ADD TOOLTIP BUTTON
  frame.addTooltipButton = CreateFrame("Button", "REP_OptionsResetCharacterVariablesButton"..index, REP_OptionsCharactersTabContent)
  frame.addTooltipButton:SetSize(15, 15)
  frame.addTooltipButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
  frame.addTooltipButton.icon = frame.addTooltipButton:CreateTexture(nil, "ARTWORK")
  frame.addTooltipButton.icon:SetAllPoints()
  frame.addTooltipButton.icon:SetTexture(922035)
  frame.addTooltipButton.icon:SetTexCoord(0.15, 0.77, 0.15, 0.77)
  ReputationGuide:CheckCharacterToolTipState(frame.addTooltipButton.icon, profileKey)
  frame.addTooltipButton:SetScript("OnClick", function(self)
    REP_Data.ProfileKeys[profileKey].profile.ShowChar = not REP_Data.ProfileKeys[profileKey].profile.ShowChar
    ReputationGuide:Print(string.format(REP_TXT.settings.characterUpdated, tostring(profileName)))
    ReputationGuide:CheckCharacterToolTipState(self.icon, profileKey)
  end)
  frame.addTooltipButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    if characterProfile.profile.ShowChar then
      GameTooltip:SetText(REP_TXT.settings.tooltips.removeCharacter)
    else
      GameTooltip:SetText(REP_TXT.settings.tooltips.addCharacter)
    end
    GameTooltip:Show()
    self:SetAlpha(0.7)
  end)
  frame.addTooltipButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
    self:SetAlpha(1)
  end)
  ------ Character name + realm
  frame.text = REP_OptionsCharactersTabContent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  frame.text:SetPoint("LEFT", frame.addTooltipButton, "RIGHT", 5, 0)
  frame.text:SetText(profileName)
  ------ RESET BUTTON
  frame.resetButton = CreateFrame("Button", "REP_OptionsResetCharacterVariablesButton"..index, REP_OptionsCharactersTabContent)
  frame.resetButton:SetSize(15, 15)
  frame.resetButton:SetPoint("LEFT", frame.text, "RIGHT", 10, 0)
  frame.resetButton:SetScript("OnClick", function()
    REP_Data.ProfileKeys[profileKey] = {}
    ReputationGuide:Print(string.format(REP_TXT.settings.characterReset, tostring(profileName)))
  end)
  frame.resetButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(REP_TXT.settings.reset)
    GameTooltip:Show()
    self:SetAlpha(0.7)
  end)
  frame.resetButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
    self:SetAlpha(1)
  end)
  frame.resetButton.icon = frame.resetButton:CreateTexture(nil, "ARTWORK")
  frame.resetButton.icon:SetAllPoints()
  frame.resetButton.icon:SetTexture(851904)
  ------ DELETE BUTTON
  frame.deleteButton = CreateFrame("Button", "REP_OptionsDeleteCharacterVariablesButton"..index, REP_OptionsCharactersTabContent)
  frame.deleteButton:SetSize(15, 15)
  frame.deleteButton:SetPoint("LEFT", frame.resetButton, "RIGHT", 10, 0)
  frame.deleteButton:SetNormalAtlas("transmog-icon-remove")
  frame.deleteButton:SetScript("OnClick", function()
    ReputationGuide:RemoveProfileFrame(index)
    REP_Data.ProfileKeys[profileKey] = nil
    ReputationGuide:Print(string.format(REP_TXT.settings.characterDeleted, tostring(profileName)))
    frame = nil
  end)
  frame.deleteButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(REP_TXT.settings.delete)
    GameTooltip:Show()
    self:SetAlpha(0.5)
  end)
  frame.deleteButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
    self:SetAlpha(1)
  end)

  return frame
end

function ReputationGuide:CheckCharacterToolTipState(frame, profileKey)
  if not frame or not profileKey then return end
  local characterProfile = REP_Data.ProfileKeys[profileKey]
  if not characterProfile and not characterProfile.profile then return end

  if characterProfile.profile.ShowChar then
    frame:SetVertexColor(1, 1, 1)
  else
    frame:SetVertexColor(1, 0, 0)
  end
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