---------------------------
-- Initialize Addon vars --
---------------------------
local addonName, ReputationGuide = ...

-----------------------------
-- Other Addon loaded vars --
-----------------------------
ReputationGuide.hasElvUILoaded = false
ReputationGuide.hasPrettyRepsLoaded = false
ReputationGuide.hasParagonReputationLoaded = false
ReputationGuide.hasInactiveReputationHeadersLoaded = false

function ReputationGuide:GetExternalAddonsStatus()
  if (C_AddOns and type(C_AddOns.IsAddOnLoaded) == "function") then
    ReputationGuide.hasElvUILoaded = C_AddOns.IsAddOnLoaded("ElvUI")
    ReputationGuide.hasPrettyRepsLoaded = C_AddOns.IsAddOnLoaded("PrettyReps")
    ReputationGuide.hasParagonReputationLoaded = C_AddOns.IsAddOnLoaded("ParagonReputation")
    ReputationGuide.hasInactiveReputationHeadersLoaded = C_AddOns.IsAddOnLoaded("InactiveReputationHeaders")
  else
    ReputationGuide.hasElvUILoaded = IsAddOnLoaded("ElvUI")
    ReputationGuide.hasPrettyRepsLoaded = IsAddOnLoaded("PrettyReps")
    ReputationGuide.hasParagonReputationLoaded = IsAddOnLoaded("ParagonReputation")
    ReputationGuide.hasInactiveReputationHeadersLoaded = IsAddOnLoaded("InactiveReputationHeaders")
  end
end

-- function ReputationGuide_GetExternalAddonsStatus()
--   ReputationGuide:Print("ReputationGuide.hasElvUILoaded: "..tostring(ReputationGuide.hasElvUILoaded))
--   ReputationGuide:Print("ReputationGuide.hasPrettyRepsLoaded: "..tostring(ReputationGuide.hasPrettyRepsLoaded))
--   ReputationGuide:Print("ReputationGuide.hasParagonReputationLoaded: "..tostring(ReputationGuide.hasParagonReputationLoaded))
--   ReputationGuide:Print("ReputationGuide.hasInactiveReputationHeadersLoaded: "..tostring(ReputationGuide.hasInactiveReputationHeadersLoaded))
-- end
---------------------------------------------------------------------------------------------
-- Paragon Reputation (addon by Fail): its settings (ParagonReputationDB) are used for the paragon bars
-- of this addon too: the bar color and the text format. Its toast and sound work on their own.
---------------------------------------------------------------------------------------------
local function GetParagonReputationDB()
  if not ReputationGuide.hasParagonReputationLoaded then return end
  local db = _G.ParagonReputationDB
  if type(db) ~= "table" then return end
  return db
end

-- The bar color chosen in Paragon Reputation (r, g, b), or nil.
function ReputationGuide:GetParagonReputationColor()
  local db = GetParagonReputationDB()
  local value = db and db.value
  if type(value) ~= "table" or not tonumber(value[1]) then return end
  return tonumber(value[1]), tonumber(value[2]) or 0, tonumber(value[3]) or 0
end

-- The bar text in the format chosen in Paragon Reputation ("Paragon", "Exalted", "935", "935 / 7,500" or
-- the reputation still needed / "+" the reputation past a waiting reward), or nil without the addon.
-- value is the progress towards the next reward (current % threshold).
function ReputationGuide:FormatParagonReputationText(value, threshold, rewardPending)
  local db = GetParagonReputationDB()
  if not db or not value or not threshold then return end

  local shown = rewardPending and (value + threshold) or value
  local format = db.text

  if format == "EXALTED" then
    return FACTION_STANDING_LABEL8 or "Exalted"
  elseif format == "CURRENT" then
    return BreakUpLargeNumbers(shown)
  elseif format == "VALUE" then
    return BreakUpLargeNumbers(shown).." / "..BreakUpLargeNumbers(threshold)
  elseif format == "DEFICIT" then
    if rewardPending then return "+"..BreakUpLargeNumbers(value) end
    return BreakUpLargeNumbers(threshold - value)
  end
  return ReputationGuide:getFactionLabel("paragon")
end
