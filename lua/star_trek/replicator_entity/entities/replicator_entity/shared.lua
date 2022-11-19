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
--        Replicator | Server        --
---------------------------------------

if not istable(ENT) then Star_Trek:LoadAllModules() return end

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Replicator"
ENT.Author = "Oninoni"

ENT.Category = "Star Trek"

ENT.Spawnable = true
ENT.Editable = true

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "AllowMedical", {
		KeyName = "allow_medical",
		Edit = {
			type = "Boolean",
			title = "Allow Medical",
			order = 1,
			category = "Replicator Whitelist",
		}
	})

	self:NetworkVar("Bool", 1, "AllowWeapons", {
		KeyName = "allow_weapons",
		Edit = {
			type = "Boolean",
			title = "Allow Weapons",
			order = 2,
			category = "Replicator Whitelist",
		}
	})

	self:NetworkVar("Bool", 2, "AllowMisc", {
		KeyName = "allow_misc",
		Edit = {
			type = "Boolean",
			title = "Allow Misc",
			order = 3,
			category = "Replicator Whitelist",
		}
	})

	if SERVER then
		self:SetAllowMedical(false)
		self:SetAllowWeapons(false)
		self:SetAllowMisc(false)
	end
end