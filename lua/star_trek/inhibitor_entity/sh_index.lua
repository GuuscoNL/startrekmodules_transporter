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

Star_Trek.Transporter.Inhibitors = Star_Trek.Transporter.Inhibitors or {}

Star_Trek:RequireModules("transporter")

if SERVER then
	include("sv_inhibitor_entity.lua")
end