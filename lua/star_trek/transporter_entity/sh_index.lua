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

Star_Trek:RequireModules("transporter")

Star_Trek.Transporter_Entity = Star_Trek.Transporter_Entity or {}

if SERVER then
	include("sv_transporter_entity.lua")
end