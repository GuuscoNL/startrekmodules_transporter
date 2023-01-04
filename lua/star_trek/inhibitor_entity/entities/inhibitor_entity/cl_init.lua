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


net.Receive("Star_Trek.Inhibitor.Color", function()
    local ent = net.ReadEntity()
    local color = net.ReadColor()
    ent:SetColor(color)
end)


hook.Add("OnEntityCreated", "CLIENT_OnEntityCreated", function(ent)
    -- Oni before you yell at me for using a timer, it needs to wait a frame before 
    -- any of the NWVars are setup due to latency between the server and client
    timer.Simple(0, function()
        if !IsValid(ent) then return end

        if ent:GetClass() == "inhibitor_entity" and ent:GetSpawner() == LocalPlayer() then
            local color_red = Color( 255, 0, 0 )
            ent:SetColor(color_red) 
        end
    end)
end)
