---------------------------------------
---------------------------------------
--        Star Trek Utilities        --
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
--    Transporter Console | Server   --
---------------------------------------

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/kingpommes/startrek/intrepid/misc_console.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
end

function ENT:Use(ply)
	Star_Trek.LCARS:OpenInterface(ply, self, "mobile_transporter")
end