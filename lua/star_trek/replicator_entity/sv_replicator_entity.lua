---------------------------------------
---------------------------------------
--         Star Trek Modules         --
--                                   --
--            Created by             --
--       Jan 'Oninoni' Ziegler       --
--                                   --
-- This software can be used freely, --
--    but only distributed by me.    --
--                                   --
--    Copyright © 2022 Jan Ziegler   --
---------------------------------------
---------------------------------------

---------------------------------------
--     Replicator Entity | Server     --
---------------------------------------

hook.Add("Star_Trek.Replicator.GetReplicatorList", "Replicator_Entity.OverrideCategories", function(ent)
	if ent:GetClass() ~= "replicator_entity" then
		return
	end

	local categories = table.Copy(Star_Trek.Replicator.Categories)
	for _, category in pairs(categories) do
		local name = category.Name
		if category.Disabled then
			if name == "MEDICAL" and ent:GetAllowMedical() then
				category.Disabled = false
			elseif name == "WEAPONS" and ent:GetAllowWeapons() then
				category.Disabled = false
			elseif name == "MISC" and ent:GetAllowMisc() then
				category.Disabled = false
			end
		end
	end

	return categories
end)