---------------------------------------
---------------------------------------
--         Star Trek Modules         --
--                                   --
--            Created by             --
--              Jarkyc               --
--                                   --
-- This software can be used freely, --
--    but only distributed by        --
--     Jan 'Oninoni' Ziegler.        --
--                                   --
--    Copyright © 2022 Jan Ziegler   --
---------------------------------------
---------------------------------------

---------------------------------------
--      Inhibitor Entity | Index     --
---------------------------------------

--hook.add for transporter

hook.Add("Star_Trek.Transporter.BlockBeamTo", "Star_Trek.Transporter.CheckInhibitors", function(pos)
    if table.getn(Star_Trek.Transporter.Inhibitors) > 0 then
        for k, v in pairs(Star_Trek.Transporter.Inhibitors) do
            inhPos = v:GetPos()
            distance = inhPos:Distance(pos)
            radius = v:GetRadius()

            if distance <= radius then
                return true, "Unable to lock onto target due to interference from a dampening field!"
            end
        end
    end 
end)

