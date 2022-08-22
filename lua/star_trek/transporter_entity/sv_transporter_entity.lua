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
--     Transporter Entity | Index    --
---------------------------------------

hook.Add("Star_Trek.Transporter.AddRooms", "Star_Trek.Transporter_Entity.AddRooms", function(interface, pads)
	for _, ent in pairs(ents.FindByClass("transporter_console")) do
		if ent == interface.Ent then
			continue
		end

		if ent:GetRoomHidden() then
			continue
		end

		if table.Count(ent.Pads or {}) > 0 then
			local roomName = ent:GetRoomName()
			if not isstring(roomName) or roomName == "" then
				local cycleClass = ent:GetCycleClass()
				cycleClass = cycleClass:sub(1, 1):upper() .. cycleClass:sub(2)

				roomName = cycleClass .. " Transporter Room " .. ent:EntIndex()
			end

			local roomId = ent:EntIndex() + 512

			pads[roomId] = {
				Name = roomName,
				Pads = ent.Pads,
			}
		end
	end
end)

hook.Add("Star_Trek.Transporter.GetPadPosition", "Star_Trek.Transporter_Entity.Override", function(ent)
	local parent = ent:GetParent()
	if not IsValid(parent) then
		return
	end

	if parent:GetClass() ~= "transporter_big_pad" then
		return
	end

	local pos = ent:GetPos()
	local attachmentId = ent:LookupAttachment("teleportPoint")
	if attachmentId > 0 then
		pos = ent:GetAttachment(attachmentId).Pos
	end

	if ent:GetModel() ~= "models/kingpommes/startrek/intrepid/transporter_personnelpad.mdl" then
		return
	end

	local localPos = parent:WorldToLocal(pos)
	return ent:LocalToWorld(localPos)
end)