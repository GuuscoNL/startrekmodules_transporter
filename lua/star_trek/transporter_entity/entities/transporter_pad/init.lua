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

	local ent = ents.Create(ClassName)
	ent:SetPos(pos)
	ent:SetAngles(ang)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()
	if isstring(self.Model) then
		self:SetModel(self.Model)
	else
		self:SetModel("models/props_phx/construct/metal_plate1.mdl")
		self:SetMaterial("phoenix_storms/wire/pcb_red")

		self.DefaultModel = true
	end

	self:PhysicsInit(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion(false)
		phys:EnableCollisions(false)
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

	if closestDistance < 500 and IsValid(closestEntity) then
		if table.Count(closestEntity.Pads) >= 32 then
			return
		end

		table.insert(closestEntity.Pads, self)
		self.Console = closestEntity

		if self.DefaultModel then
			self:SetMaterial("phoenix_storms/wire/pcb_green")
		end
	end
end

function ENT:OnRemove()
	if IsValid(self.Console) then
		table.RemoveByValue(self.Console.Pads, self)
	end
end