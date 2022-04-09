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

function ENT:SpawnFunction(ply, tr, ClassName)
	if not tr.Hit then return end

	local pos = tr.HitPos
	local ang = ply:GetAngles()

	ang.p = 0
	ang.r = 0
	ang = ang + Angle(0, 90, 0)

	local ent = ents.Create(ClassName)
	ent:SetPos(pos)
	ent:SetAngles(ang)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()
	self:SetModel("models/kingpommes/startrek/intrepid/misc_console.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)

	self:PhysicsInit(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion(false)
	end
	self.Pads = {}
end

function ENT:Use(ply)
	Star_Trek.LCARS:OpenInterface(ply, self, "mobile_transporter", self:GetCycleClass())
end