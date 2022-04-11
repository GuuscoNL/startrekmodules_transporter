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

		if table.Count(ent.Pads) > 0 then
			local roomName = ent:GetRoomName()
			if not isstring(roomName) or roomName == "" then
				local cycleClass = ent:GetCycleClass()
				cycleClass = cycleClass:sub(1, 1):upper() .. cycleClass:sub(2)

				roomName = cycleClass .. " Transporter Room " .. ent:EntIndex()
			end

			pads[roomName] = ent.Pads
		end
	end
end)