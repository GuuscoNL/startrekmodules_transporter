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
			category = "Transporter Effect",
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

	self:NetworkVar("String", 1, "RoomName", {
		KeyName = "room_name",
		Edit = {
			type = "Generic",
			title = "Name",
			order = 0,
			category = "Transporter Room",
			waitforenter = true,
		}
	})

	self:NetworkVar("Bool", 0, "RoomHidden", {
		KeyName = "room_hidden",
		Edit = {
			type = "Boolean",
			title = "Hidden",
			order = 1,
			category = "Transporter Room",
		}
	})

	if SERVER then
		self:SetCycleClass("federation")

		self:NetworkVarNotify("CycleClass", self.OnVarChanged)
		self:NetworkVarNotify("RoomName",   self.OnVarChanged)
		self:NetworkVarNotify("RoomHidden", self.OnVarChanged)
	end
end