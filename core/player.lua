----------------------------------------------------------
-- Reputation Guide | Player --
-- Active reputation buffs and known profession skills.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

---------------------------
-- Character variables --
---------------------------
---- Race/Side/Difficulty
REP.IsHeroic = false
REP.IsAlliance = false
REP.IsHorde = false
REP.IsHuman = false
REP.IsDeathKnight = false
REP.IsRogue = false
---- Guild Tracking
REP.GuildName = nil
---- Garrison Trading post level 3
REP.HasTradingPost = false

--------------------------------------
-- 08 Check active reputation buffs --
--------------------------------------
-- Reputation buffs that are switched on (and off again) automatically when the player has the buff.
-- A setting the user switched on is never switched off automatically.
local REPUTATION_BUFFS = {
  { key = "WickermanRepBuff", box = "WickermanRepBuffBox", spells = {24705, 95987} },
  { key = "HarvestBountyRepBuff", box = "HarvestBountyRepBuffBox", spells = {61849} },
  { key = "DarkmoonfaireHatRepBuff", box = "DarkmoonFaireHatRepBuffBox", spells = {136583} },
  { key = "DarkmoonfaireWeeRepBuff", box = "DarkmoonFaireWeeRepBuffBox", spells = {46668} },
}

local function HasAnyAura(spells)
  for _, spellID in ipairs(spells) do
    if REP:PlayerHasAura(spellID) then return true end
  end

  return false
end

local function GetBuffState()
  local settings = REP_Data and REP_Data.Global
  if not settings then return end

  -- AutoReputationBuffs[key]: switched on by the addon because of the buff.
  -- DeclinedReputationBuffs[key]: switched off by the user while the buff was active, stays off until the buff is gone.
  settings.AutoReputationBuffs = settings.AutoReputationBuffs or {}
  settings.DeclinedReputationBuffs = settings.DeclinedReputationBuffs or {}

  return settings, settings.AutoReputationBuffs, settings.DeclinedReputationBuffs
end

function REP:CheckActiveReputationBuffs()
  local settings, auto, declined = GetBuffState()
  if not settings then return end

  local changed = false

  for _, buff in ipairs(REPUTATION_BUFFS) do
    local key = buff.key
    local isActive = HasAnyAura(buff.spells)

    if isActive then
      if not settings[key] and not declined[key] then
        settings[key] = true
        auto[key] = true
        changed = true
      end
    else
      declined[key] = nil

      if settings[key] and auto[key] then
        settings[key] = false
        changed = true
      end

      auto[key] = nil
    end
  end

  if changed then REP:OnReputationBuffsChanged() end
end

-- Called by the options checkboxes: the user decides, the addon doesn't switch this setting off anymore.
function REP:SetReputationBuffManually(key, checked)
  local settings, auto, declined = GetBuffState()
  if not settings then return end

  settings[key] = checked and true or false
  auto[key] = nil

  for _, buff in ipairs(REPUTATION_BUFFS) do
    if buff.key == key then
      declined[key] = (not checked and HasAnyAura(buff.spells)) or nil
    end
  end
end

-- Aura events come in bursts, the buffs are checked once per burst.
function REP:RequestReputationBuffCheck()
  if REP._buffCheckPending then return end
  REP._buffCheckPending = true

  C_Timer.After(0.5, function()
    REP._buffCheckPending = false
    REP:CheckActiveReputationBuffs()
  end)
end

function REP:OnReputationBuffsChanged()
  for _, buff in ipairs(REPUTATION_BUFFS) do
    local box = _G["REPCheck_"..buff.box]
    if box then box:SetChecked(REP_Data.Global[buff.key] and true or false) end
  end

  if REP.RefreshDarkmoonFaireBuffOptions then REP:RefreshDarkmoonFaireBuffOptions() end

  -- Reputation values depend on the buffs, refresh the sources list.
  if REP.InitComplete then
    if REP.UseModernReputationUI then
      if REP.RequestDetailFrameRefresh then REP:RequestDetailFrameRefresh() end
    elseif ReputationFrame and ReputationFrame:IsVisible() then
      REP:RequestClassicReputationFrameUpdate()
    end
  end
end

-- Classic: bag and buff updates come in bursts, the reputation frame is updated once per burst.
function REP:RequestClassicReputationFrameUpdate()
  if REP._classicFrameUpdatePending then return end
  REP._classicFrameUpdatePending = true

  C_Timer.After(0.2, function()
    REP._classicFrameUpdatePending = false

    if ReputationFrame and ReputationFrame:IsVisible() then
      ReputationFrame_Update()
    end
  end)
end

------------------------
-- 18 extracting Skill information
------------------------
function REP:ExtractSkills()
  if (REP.AfterCata) then
    local professions = {}
    local name, skillLine
    local prof1, prof2, archaeology, fishing, cooking, firstaid = GetProfessions()

    if (prof1) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(prof1)
      if name then professions[1] = name end
    end

    if (prof2) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(prof2)
      if name then professions[2] = name end
    end

    if (archaeology) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(archaeology)
      if name then professions[3] = name end
    end

    if (fishing) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(fishing)
      if name then professions[4] = name end
    end

    if (cooking) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(cooking)
      if name then professions[5] = name end
    end

    if (firstaid) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(firstaid)
      if name then professions[6] = name end
    end

    for skillIndex in pairs(professions) do
      local skillName = professions[skillIndex]
      if (skillName == REP_TXT.skillHerb) then
        REP.Herb = true
      elseif (skillName == REP_TXT.skillSkin) then
        REP.Skin = true
      elseif (skillName == REP_TXT.skillMine) then
        REP.Mine = true
      elseif (skillName == REP_TXT.skillAlch) then
        REP.Alche = true
      elseif (skillName == REP_TXT.skillBlack) then
        REP.Black = true
      elseif (skillName == REP_TXT.skillEnch) then
        REP.Enchan = true
      elseif (skillName == REP_TXT.skillEngi) then
        REP.Engin = true
      elseif (skillName == REP_TXT.skillIncrip) then
        REP.Incrip = true
      elseif (skillName == REP_TXT.skillJewel) then
        REP.Jewel = true
      elseif (skillName == REP_TXT.skillLeath) then
        REP.Leath = true
      elseif (skillName == REP_TXT.skillTail) then
        REP.Tailor = true
      elseif (skillName == REP_TXT.skillAid) then
        REP.Aid = true
      elseif (skillName == REP_TXT.skillArch) then
        REP.Arch = true
      elseif (skillName == REP_TXT.skillCook) then
        REP.Cook = true
      elseif (skillName == REP_TXT.skillFish) then
        REP.Fish = true
      end
    end
  else
    for _, skillName in ipairs(REP:GetSkillLineNames()) do

      if (skillName == REP_TXT.skillAlch) then
        REP.Alche = true
      end

      if (skillName == REP_TXT.skillBlack) then
        REP.Black = true
      end

      if (skillName == REP_TXT.skillEnch) then
        REP.Enchan = true
      end

      if (skillName == REP_TXT.skillEngi) then
        REP.Engin = true
      end

      if (skillName == REP_TXT.skillHerb) then
        REP.Herb = true
      end

      if (skillName == REP_TXT.skillLeath) then
        REP.Leath = true
      end

      if (skillName == REP_TXT.skillMine) then
        REP.Mine = true
      end

      if (skillName == REP_TXT.skillSkin) then
        REP.Skin = true
      end

      if (skillName == REP_TXT.skillTail) then
        REP.Tailor = true
      end

      if (skillName == REP_TXT.skillCook) then
        REP.Cook = true
      end

      if (skillName == REP_TXT.skillAid) then
        REP.Aid = true
      end

      if (skillName == REP_TXT.skillFish) then
        REP.Fish = true
      end
    end
  end
end
