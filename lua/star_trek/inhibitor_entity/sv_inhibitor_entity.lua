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
--        Inhibitor | Server         --
---------------------------------------

--hook.add for transporter

hook.Add("Star_Trek.Transporter.BlockBeamTo", "Star_Trek.Transporter_Inhibitors.CheckInhibitors", function(pos)
    if #Star_Trek.Transporter_Inhibitors > 0 then
        for k, v in pairs(Star_Trek.Transporter_Inhibitors) do
            inhPos = v:GetPos()
            distance = inhPos:Distance(pos)
            radius = v:GetRadius()

            if distance <= radius then
                return true, "Unable to lock onto target due to interference from a dampening field!"
            end
        end
    end
end)

