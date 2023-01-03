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
--      Inhibitor Entity | Client    --
---------------------------------------

if not istable(ENT) then Star_Trek:LoadAllModules() return end

include("shared.lua")


net.Receive("Star_Trek.Inhibitor.Create", function()
    ent = net.ReadEntity()
    color = net.ReadColor()
    ent:SetColor(color)
end)