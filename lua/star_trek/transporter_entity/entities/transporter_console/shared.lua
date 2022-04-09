---------------------------------------
---------------------------------------
--        Star Trek Utilities        --
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
--    Transporter Console | Shared   --
---------------------------------------

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Transporter Console"
ENT.Author = "Oninoni"

ENT.Category = "Star Trek"

ENT.Spawnable = true
ENT.Editable = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "CycleClass", {
		KeyName = "cycle_class",
		Edit = {
			type = "Combo",
			title = "Faction",
			order = 0,
			category = "Main",
			text = "Federation",
			values = {
				["Federation"] = "federation",
				["Klingon"] = "klingon",
				["Romulan"] = "romulan",
				["Cardassian"] = "cardassian",
				["Borg"] = "borg",
			}
		}
	})

	if SERVER then
		self:SetCycleClass("federation")
	end
end