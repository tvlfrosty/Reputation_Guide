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
  if ReputationGuide.AfterCata then
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