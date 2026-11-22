-------------------------------------------------------------------------------
-- Reputation Guide | Manual lines --
-- Popup to add a reputation source to the selected faction (saved in REP_Data.Global.ManualSources).
-- Addon owned frames only; selectors use the menu API where the client has it, otherwise they cycle on click.
-------------------------------------------------------------------------------
local addonName, REP = ...

local FRAME_WIDTH = 420
local LABEL_WIDTH = 90
local ROW_GAP = 30
local DESCRIPTION_HEIGHT = 62

local KINDS = { "quest", "mob", "instance", "item", "general" }
local EXPANSION_KEYS = { "classic", "tbc", "wotlk", "cata", "mop", "wod", "legion", "bfa", "shadowlands", "dragonflight", "thewarwithin", "midnight", "thelasttitan" }

local ID_LABELS = { quest = "manualQuestID", mob = "manualNpcID", instance = "manualInstanceID", item = "manualItemID" }

local frame

---------------------------
-- Widgets
---------------------------
local function CreateLabel(parent, text, font)
  local label = parent:CreateFontString(nil, "OVERLAY", font or "GameFontNormalSmall")
  label:SetJustifyH("LEFT")
  label:SetText(text or "")
  return label
end

local function CreateEditBox(parent, width, numeric)
  local box = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
  box:SetSize(width, 20)
  box:SetAutoFocus(false)
  box:SetFontObject("ChatFontNormal")
  box:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  box:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
  if numeric then box:SetMaxLetters(12) end
  REP:ElvSkin("editBox", box)
  return box
end

-- Same dropdown style as the details panel (menu API); clients without it get a button that cycles through the options.
local function CreateDropdownSelector(parent, width)
  local ok, dropdown = pcall(CreateFrame, "DropdownButton", nil, parent, "WowStyle1DropdownTemplate")
  if not ok or not dropdown or not dropdown.SetupMenu then return end

  dropdown:SetWidth(width)
  dropdown.options = {}
  REP:ElvSkin("dropdown", dropdown, width)

  function dropdown:SetOptions(options, value)
    self.options = options
    self.value = value ~= nil and value or (options[1] and options[1].value)
    self:GenerateMenu()
  end

  function dropdown:SetValue(value)
    self.value = value
    self:GenerateMenu()
  end

  dropdown:SetupMenu(function(self, rootDescription)
    if rootDescription.SetScrollMode and #self.options > 20 then rootDescription:SetScrollMode(400) end
    for _, option in ipairs(self.options) do
      rootDescription:CreateRadio(option.text, function() return self.value == option.value end, function()
        self.value = option.value
        if self.onChange then self.onChange(option.value) end
      end)
    end
  end)

  return dropdown
end

local function CreateCyclingSelector(parent, width)
  local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  button:SetSize(width, 22)
  REP:ElvSkin("button", button)
  button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  button.options = {}

  function button:SetOptions(options, value)
    self.options = options
    self:SetValue(value ~= nil and value or (options[1] and options[1].value))
  end

  function button:SetValue(value)
    self.value = value
    for _, option in ipairs(self.options) do
      if option.value == value then self:SetText(option.text) return end
    end
    self:SetText("")
  end

  button:SetScript("OnClick", function(self, mouseButton)
    local count = #self.options
    if count == 0 then return end
    local index = 1
    for i, option in ipairs(self.options) do
      if option.value == self.value then index = i break end
    end
    index = index + (mouseButton == "RightButton" and -1 or 1)
    if index > count then index = 1 elseif index < 1 then index = count end
    self:SetValue(self.options[index].value)
    if self.onChange then self.onChange(self.value) end
  end)

  return button
end

local function CreateSelector(parent, width)
  return CreateDropdownSelector(parent, width) or CreateCyclingSelector(parent, width)
end

-- Multi-line text field with a border; scrolls when the text is longer than the box.
local function CreateMultiLineEditBox(parent, width, height, maxLetters)
  local box = CreateFrame("Frame", nil, parent, BackdropTemplateMixin and "BackdropTemplate" or nil)
  box:SetSize(width, height)
  if box.SetBackdrop then
    box:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 12, insets = { left = 3, right = 3, top = 3, bottom = 3 } })
    box:SetBackdropColor(0, 0, 0, 0.6)
    box:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
  end
  REP:ElvSkin("box", box)

  local scroll = CreateFrame("ScrollFrame", nil, box)
  scroll:SetPoint("TOPLEFT", box, "TOPLEFT", 6, -6)
  scroll:SetPoint("BOTTOMRIGHT", box, "BOTTOMRIGHT", -6, 6)

  local edit = CreateFrame("EditBox", nil, scroll)
  edit:SetMultiLine(true)
  edit:SetAutoFocus(false)
  edit:SetFontObject("ChatFontNormal")
  edit:SetWidth(width - 12)
  edit:SetMaxLetters(maxLetters)
  scroll:SetScrollChild(edit)

  edit:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  edit:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
  edit:SetScript("OnCursorChanged", function(self, _, y, _, lineHeight)
    local offset = scroll:GetVerticalScroll()
    local visible = scroll:GetHeight()
    y = -y
    if y < offset then
      scroll:SetVerticalScroll(y)
    elseif y + lineHeight > offset + visible then
      scroll:SetVerticalScroll(y + lineHeight - visible)
    end
  end)

  box:EnableMouse(true)
  box:SetScript("OnMouseDown", function() edit:SetFocus() end)

  local counter = box:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
  local font, size, flags = counter:GetFont()
  if font and size then counter:SetFont(font, size - 1, flags) end
  counter:SetPoint("TOPRIGHT", box, "BOTTOMRIGHT", -2, -2)
  counter:SetJustifyH("RIGHT")

  local function UpdateCounter()
    local text = edit:GetText() or ""
    local length = strlenutf8 and strlenutf8(text) or #text
    counter:SetText(length.."/"..maxLetters)
  end
  edit:SetScript("OnTextChanged", UpdateCounter)
  UpdateCounter()

  function box:GetText() return edit:GetText() end
  function box:SetText(text) edit:SetText(text or "") scroll:SetVerticalScroll(0) UpdateCounter() end

  return box
end

local function CreateCheck(parent, text)
  local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
  check:SetSize(24, 24)
  REP:ElvSkin("check", check)
  check.Label = CreateLabel(check, text, "GameFontHighlightSmall")
  check.Label:SetPoint("LEFT", check, "RIGHT", 2, 0)
  return check
end

---------------------------
-- Options
---------------------------
local function GetStandingOptions(factionID)
  local standing, standingType = REP:GetSourceStanding(factionID)
  local options = {}

  if standingType == "renown" then
    local levels = C_MajorFactions and C_MajorFactions.GetRenownLevels and C_MajorFactions.GetRenownLevels(factionID)
    local maxLevel = (levels and #levels > 0 and #levels) or (REP.MaxFactionLevel and REP.MaxFactionLevel[factionID]) or 30
    for level = 1, maxLevel do
      options[#options + 1] = { value = level, text = (REP_TXT.renown or "Renown").." "..level }
    end
  elseif standingType == "friendship" then
    local ranks = C_GossipInfo and C_GossipInfo.GetFriendshipReputationRanks and C_GossipInfo.GetFriendshipReputationRanks(factionID)
    local currentLevel = ranks and ranks.currentLevel or 1
    local maxLevel = (ranks and ranks.maxLevel and ranks.maxLevel > 0 and ranks.maxLevel) or (REP.MaxFactionLevel and REP.MaxFactionLevel[factionID]) or 8
    local offset = (standing or currentLevel) - currentLevel
    for level = 1, maxLevel do
      options[#options + 1] = { value = level + offset, text = string.format(REP_TXT.manualLevel, level) }
    end
  else
    for standingID = 1, 8 do
      local text = _G["FACTION_STANDING_LABEL"..standingID] or tostring(standingID)
      if standingID == 8 and standingType == "paragon" and REP.getFactionLabel then
        text = text.." / "..REP:getFactionLabel("paragon")
      end
      options[#options + 1] = { value = standingID, text = text }
    end
  end

  return options, standing, standingType
end

local function GetExpansionOptions(first, last)
  local options = {}
  for index = first, last do
    local key = EXPANSION_KEYS[index + 1]
    if key then
      options[#options + 1] = { value = index, text = _G["EXPANSION_NAME"..index] or key }
    end
  end
  return options
end

---------------------------
-- Layout per type
---------------------------
local function UpdateTypeFields()
  local kind = frame.Type.value
  local idLabel = ID_LABELS[kind]

  frame.IDLabel:SetShown(idLabel ~= nil)
  frame.ID:SetShown(idLabel ~= nil)
  if idLabel then frame.IDLabel:SetText(REP_TXT[idLabel]) end

  frame.CountLabel:SetShown(kind == "item")
  frame.Count:SetShown(kind == "item")
  frame.ZoneLabel:SetShown(kind == "mob")
  frame.Zone:SetShown(kind == "mob")
  frame.Repeatable:SetShown(kind == "quest")
  frame.Pvp:SetShown(kind == "quest")
end

local function UpdateUntilOptions()
  local since = frame.Since.value or 0
  local options = { { value = -1, text = REP_TXT.manualNoEnd } }
  for _, option in ipairs(GetExpansionOptions(since, #EXPANSION_KEYS - 1)) do options[#options + 1] = option end

  local current = frame.Until.value
  if current and current ~= -1 and current < since then current = -1 end
  frame.Until:SetOptions(options, current or -1)
end

---------------------------
-- Saving
---------------------------
local function ShowError(text)
  frame.Error:SetText(text or "")
end

local function Save()
  local kind = frame.Type.value
  local from, to = frame.From.value, frame.To.value
  local rep = tonumber(frame.Rep:GetText())
  local id = tonumber(frame.ID:GetText())
  local description = strtrim((frame.Description:GetText() or ""):gsub("[\r\n]+", " "))
  if description == "" then description = nil end

  if not rep or rep == 0 then return ShowError(REP_TXT.manualErrorRep) end
  if not from or not to or from > to then return ShowError(REP_TXT.manualErrorRange) end
  if (kind == "quest" or kind == "mob") and not id and not description then return ShowError(REP_TXT.manualErrorID) end
  if kind == "item" and not id then return ShowError(REP_TXT.manualErrorID) end
  if (kind == "instance" or kind == "general") and not description then return ShowError(REP_TXT.manualErrorDescription) end

  local source = { kind = kind, from = from, to = to, rep = rep, name = description }

  if kind == "quest" then
    source.id = id
    source.repeatable = frame.Repeatable:GetChecked() and true or false
    source.pvp = frame.Pvp:GetChecked() and true or false
  elseif kind == "mob" then
    source.npc = id
    local zone = strtrim(frame.Zone:GetText() or "")
    if zone ~= "" then source.map = zone end
  elseif kind == "instance" then
    source.instanceID = id
  elseif kind == "item" then
    source.items = { [id] = math.max(1, tonumber(frame.Count:GetText()) or 1) }
  elseif kind == "general" then
    source.head = description
  end

  if frame.Side.value ~= "Both" then source.side = frame.Side.value end
  if frame.Since.value and frame.Since.value > 0 then source.since = EXPANSION_KEYS[frame.Since.value + 1] end
  if frame.Until.value and frame.Until.value >= 0 then source.before = EXPANSION_KEYS[frame.Until.value + 2] end
  if REP.IsForever then source.forever = true end
  if frame.standingType == "renown" or frame.standingType == "friendship" then source.renown = true end

  REP:AddManualSource(frame.factionID, source)
  REP:Print(REP.HELP_COLOUR..addonName..":|r "..string.format(REP_TXT.manualSaved, frame.factionName or ""), true)
  frame:Hide()
end

---------------------------
-- Frame
---------------------------
local function AddRow(labelText, anchor, offsetY)
  local label = CreateLabel(frame, labelText)
  label:SetWidth(LABEL_WIDTH)
  label:SetPoint("TOPLEFT", anchor, "TOPLEFT", 0, offsetY or -ROW_GAP)
  return label
end

local function CreateManualEntryFrame()
  local ok, created = pcall(CreateFrame, "Frame", "REP_ManualEntryFrame", UIParent, "BasicFrameTemplateWithInset")
  if not ok then
    created = CreateFrame("Frame", "REP_ManualEntryFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
    if created.SetBackdrop then
      created:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", tile = true, tileSize = 32, edgeSize = 32, insets = { left = 11, right = 12, top = 12, bottom = 11 } })
    end
    local close = CreateFrame("Button", nil, created, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", created, "TOPRIGHT", -4, -4)
    created.repCloseButton = close
  end

  frame = created
  frame:SetSize(FRAME_WIDTH, 420 + DESCRIPTION_HEIGHT - 14)
  frame:SetPoint("CENTER")
  frame:SetFrameStrata("DIALOG")
  frame:SetToplevel(true)
  frame:SetClampedToScreen(true)
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", frame.StartMoving)
  frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
  frame:Hide()

  -- The popup belongs to the faction it was opened for: close it when another faction is selected.
  local elapsedSinceCheck = 0
  frame:SetScript("OnUpdate", function(self, elapsed)
    elapsedSinceCheck = elapsedSinceCheck + elapsed
    if elapsedSinceCheck < 0.25 then return end
    elapsedSinceCheck = 0

    if ReputationFrame and not ReputationFrame:IsVisible() then self:Hide() return end

    local factionData = REP:GetFactionDataToBuildReputationlist()
    if not factionData or factionData.factionID ~= self.factionID then self:Hide() end
  end)

  -- Close together with the reputation frame (Escape, character frame closed, other tab).
  if ReputationFrame and ReputationFrame.HookScript then
    ReputationFrame:HookScript("OnHide", function() frame:Hide() end)
  end

  frame.Title = CreateLabel(frame, "", "GameFontHighlight")
  frame.Title:SetPoint("TOP", frame, "TOP", 0, -6)
  frame.Title:SetWidth(FRAME_WIDTH - 60)
  frame.Title:SetJustifyH("CENTER")

  local controlX = LABEL_WIDTH + 4
  local wide = FRAME_WIDTH - LABEL_WIDTH - 40

  local first = CreateLabel(frame, REP_TXT.manualType)
  first:SetWidth(LABEL_WIDTH)
  first:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -40)
  frame.Type = CreateSelector(frame, 140)
  frame.Type:SetPoint("LEFT", first, "LEFT", controlX, 0)
  local kinds = {}
  for _, kind in ipairs(KINDS) do kinds[#kinds + 1] = { value = kind, text = REP_TXT["manualType_"..kind] } end
  frame.Type:SetOptions(kinds, "quest")
  frame.Type.onChange = UpdateTypeFields

  local fromLabel = AddRow(REP_TXT.manualFrom, first)
  frame.From = CreateSelector(frame, 140)
  frame.From:SetPoint("LEFT", fromLabel, "LEFT", controlX, 0)

  local toLabel = AddRow(REP_TXT.manualTo, fromLabel)
  frame.To = CreateSelector(frame, 140)
  frame.To:SetPoint("LEFT", toLabel, "LEFT", controlX, 0)

  frame.IDLabel = AddRow(REP_TXT.manualQuestID, toLabel)
  frame.ID = CreateEditBox(frame, 100, true)
  frame.ID:SetPoint("LEFT", frame.IDLabel, "LEFT", controlX + 6, 0)
  frame.CountLabel = CreateLabel(frame, REP_TXT.manualCount)
  frame.CountLabel:SetPoint("LEFT", frame.ID, "RIGHT", 16, 0)
  frame.Count = CreateEditBox(frame, 50, true)
  frame.Count:SetPoint("LEFT", frame.CountLabel, "RIGHT", 10, 0)

  local descriptionLabel = AddRow(REP_TXT.manualDescription, frame.IDLabel)
  frame.Description = CreateMultiLineEditBox(frame, wide + 6, DESCRIPTION_HEIGHT, 250)
  frame.Description:SetPoint("TOPLEFT", descriptionLabel, "TOPLEFT", controlX, 4)

  local repLabel = AddRow(REP_TXT.manualRep, descriptionLabel, -ROW_GAP - DESCRIPTION_HEIGHT + 14)
  frame.Rep = CreateEditBox(frame, 100, true)
  frame.Rep:SetPoint("LEFT", repLabel, "LEFT", controlX + 6, 0)

  local sideLabel = AddRow(REP_TXT.manualSide, repLabel)
  frame.Side = CreateSelector(frame, 140)
  frame.Side:SetPoint("LEFT", sideLabel, "LEFT", controlX, 0)
  frame.Side:SetOptions({
    { value = "Both", text = REP_TXT.manualBothSides },
    { value = "Alliance", text = FACTION_ALLIANCE or "Alliance" },
    { value = "Horde", text = FACTION_HORDE or "Horde" },
  }, "Both")

  local sinceLabel = AddRow(REP_TXT.manualSince, sideLabel)
  frame.Since = CreateSelector(frame, 200)
  frame.Since:SetPoint("LEFT", sinceLabel, "LEFT", controlX, 0)
  frame.Since.onChange = UpdateUntilOptions

  local untilLabel = AddRow(REP_TXT.manualUntil, sinceLabel)
  frame.Until = CreateSelector(frame, 200)
  frame.Until:SetPoint("LEFT", untilLabel, "LEFT", controlX, 0)

  frame.ZoneLabel = AddRow(REP_TXT.manualZone, untilLabel)
  frame.Zone = CreateEditBox(frame, wide, false)
  frame.Zone:SetPoint("LEFT", frame.ZoneLabel, "LEFT", controlX + 6, 0)

  frame.Repeatable = CreateCheck(frame, REP_TXT.manualRepeatable)
  frame.Repeatable:SetPoint("TOPLEFT", untilLabel, "TOPLEFT", controlX - 4, -ROW_GAP + 6)
  frame.Pvp = CreateCheck(frame, REP_TXT.manualPvp)
  frame.Pvp:SetPoint("LEFT", frame.Repeatable, "RIGHT", 110, 0)

  frame.Error = CreateLabel(frame, "", "GameFontRedSmall")
  frame.Error:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 16, 44)
  frame.Error:SetWidth(FRAME_WIDTH - 32)

  frame.SaveButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  frame.SaveButton:SetSize(100, 22)
  frame.SaveButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOM", -6, 14)
  frame.SaveButton:SetText(REP_TXT.manualSave)
  frame.SaveButton:SetScript("OnClick", Save)

  frame.CancelButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  frame.CancelButton:SetSize(100, 22)
  frame.CancelButton:SetPoint("BOTTOMLEFT", frame, "BOTTOM", 6, 14)
  frame.CancelButton:SetText(CANCEL or "Cancel")
  frame.CancelButton:SetScript("OnClick", function() frame:Hide() end)

  REP:ElvSkin("panel", frame)
  REP:ElvSkin("close", frame.CloseButton or frame.repCloseButton)
  REP:ElvSkin("button", frame.SaveButton)
  REP:ElvSkin("button", frame.CancelButton)
end

---------------------------
-- Opening
---------------------------
function REP:OpenManualEntry()
  local factionData = REP:GetFactionDataToBuildReputationlist()
  local factionID = factionData and factionData.factionID

  if not factionID then
    REP:Print(REP.HELP_COLOUR..addonName..":|r "..REP_TXT.manualNoFaction, true)
    return
  end

  if not frame then CreateManualEntryFrame() end

  local options, standing, standingType = GetStandingOptions(factionID)
  frame.factionID = factionID
  frame.factionName = factionData.name
  frame.standingType = standingType

  frame.Title:SetText(string.format(REP_TXT.manualTitle, factionData.name or factionID))
  frame.From:SetOptions(options, standing or options[1].value)
  frame.To:SetOptions(options, options[#options].value)

  local current = REP.ExpansionIndex or 0
  frame.Since:SetOptions(GetExpansionOptions(0, current), current)
  frame.Until.value = -1
  UpdateUntilOptions()

  frame.ID:SetText("")
  frame.Count:SetText("1")
  frame.Description:SetText("")
  frame.Rep:SetText("")
  frame.Zone:SetText(GetRealZoneText and GetRealZoneText() or "")
  frame.Repeatable:SetChecked(true)
  frame.Pvp:SetChecked(false)
  frame.Side:SetValue("Both")
  ShowError()
  UpdateTypeFields()

  frame:Show()
  frame:Raise()
end

---------------------------
-- Options menu of the sources list (modern panel)
---------------------------
function REP:AddManualEntriesToMenu(rootDescription)
  rootDescription:CreateDivider()
  rootDescription:CreateButton(REP_TXT.manualAdd, function() REP:OpenManualEntry() end)

  local factionData = REP:GetFactionDataToBuildReputationlist()
  local factionID = factionData and factionData.factionID
  local sources = factionID and REP:GetManualSources(factionID)
  if not sources or #sources == 0 then return end

  local submenu = rootDescription:CreateButton(REP_TXT.manualLines)
  for index, source in ipairs(sources) do
    submenu:CreateButton(REP_TXT.manualRemove..": "..REP:DescribeManualSource(source), function()
      REP:RemoveManualSource(factionID, index)
      REP:Print(REP.HELP_COLOUR..addonName..":|r "..REP_TXT.manualRemoved, true)
    end)
  end
end
