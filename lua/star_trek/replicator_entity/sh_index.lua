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
--     Replicator Entity | Index     --
---------------------------------------

Star_Trek:RequireModules("replicator")

Star_Trek.Replicator_Entity = Star_Trek.Replicator_Entity or {}

if SERVER then
	include("sv_replicator_entity.lua")
end