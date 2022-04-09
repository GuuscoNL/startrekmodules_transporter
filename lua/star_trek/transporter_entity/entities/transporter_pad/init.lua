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
--      Transporter Pad | Server     --
---------------------------------------

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr, ClassName)
	if not tr.Hit then return end

	local pos = tr.HitPos + Vector(0, 0, 1)
	local ang = ply:GetAngles()

	ang.p = 0
	ang.r = 0
	ang = ang + Angle(0, 0, -90)

	local ent = ents.Create(ClassName)
	ent:SetPos(pos)
	ent:SetAngles(ang)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()
	self:SetModel("models/props_c17/streetsign004e.mdl")
	self:SetModelScale(2)

	self:SetMaterial("phoenix_storms/wire/pcb_red")

	self:PhysicsInit(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion(false)
	end

	local consoleEntities = ents.FindByClass("transporter_console")

	local closestDistance = math.huge
	local closestEntity = nil

	local pos = self:GetPos()
	for _, ent in pairs(consoleEntities) do
		local dist = pos:Distance(ent:GetPos())
		if dist < closestDistance then
			closestDistance = dist
			closestEntity = ent
		end
	end

	if IsValid(closestEntity) then
		table.insert(closestEntity.Pads, self)

		self:SetMaterial("phoenix_storms/wire/pcb_green")
	end
end