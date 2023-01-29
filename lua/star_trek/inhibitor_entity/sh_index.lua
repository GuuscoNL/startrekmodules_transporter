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

Star_Trek:RequireModules("transporter")

Star_Trek.Transporter_Inhibitors = {}

if SERVER then
	include("sv_inhibitor_entity.lua")
end