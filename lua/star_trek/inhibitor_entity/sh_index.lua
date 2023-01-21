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
--        Inhibitor | Index          --
---------------------------------------

Star_Trek.Transporter.Inhibitors = {}

Star_Trek:RequireModules("transporter")

if SERVER then
	include("sv_inhibitor_entity.lua")
end