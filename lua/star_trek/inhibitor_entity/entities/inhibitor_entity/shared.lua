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
--    Inhibitor Entity | Shared      --
---------------------------------------

if not istable(ENT) then Star_Trek:LoadAllModules() return end

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Transporter Inhibitor"
ENT.Author = "Jarkyc"

ENT.Category = "Star Trek"

ENT.Spawnable = true
ENT.Editable = true

function ENT:SetupDataTables()
    self:NetworkVar("Float", 0, "Radius", {
        KeyName = "Radius",
        Edit = {
            type = "Float",
            title = "Inhibitor Radius",
            order = 1,
            min = 1,
            max = 5000,
            category = "Inhibitor Settings"
        }

    })

    self:NetworkVar("Int", 1, "MachineHealth", {
        KeyName = "MachineHealth",
        Edit = {
            type = "Int",
            title = "Machine Health",
            order = 1,
            min = 100,
            max = 5000,
            category = "Inhibitor Settings"
        }

    })

    self:NetworkVar("Entity", 2, "Spawner")
end
