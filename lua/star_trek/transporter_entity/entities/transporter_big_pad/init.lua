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
--    Big Transporter Pad | Server   --
---------------------------------------

if not istable(ENT) then Star_Trek:LoadAllModules() return end

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr, ClassName)
	if not tr.Hit then return end

	local pos = tr.HitPos + Vector(0, 0, 64)
	local ang = ply:GetAngles()

	ang.p = 0
	ang.r = 0
	ang = ang + Angle(0, -90, 0)

	local ent = ents.Create(ClassName)
	ent:SetPos(pos)
	ent:SetAngles(ang)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:AddPad(model, pos, ang)
	local pad = ents.Create("transporter_pad")

	local worldPos, worldAng = LocalToWorld(pos, ang, self:GetPos(), self:GetAngles())
	pad:SetPos(worldPos)
	pad:SetAngles(worldAng)
	pad:SetParent(self)

	pad.Model = model

	pad:Spawn()
	pad:Activate()

	table.insert(self.Pads, pad)
end

function ENT:Initialize()
	self:SetModel("models/kingpommes/startrek/intrepid/transporter_pad.mdl")

	self:PhysicsInit(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion(false)
	end

	self.Pads = {}

	timer.Simple(0, function()
		self:AddPad("models/kingpommes/startrek/intrepid/transporter_cargopad.mdl", Vector(), Angle())

		self:AddPad("models/kingpommes/startrek/intrepid/transporter_personnelpad.mdl", Vector(), Angle(0,   0, 0))
		self:AddPad("models/kingpommes/startrek/intrepid/transporter_personnelpad.mdl", Vector(), Angle(0,  60, 0))
		self:AddPad("models/kingpommes/startrek/intrepid/transporter_personnelpad.mdl", Vector(), Angle(0, 120, 0))
		self:AddPad("models/kingpommes/startrek/intrepid/transporter_personnelpad.mdl", Vector(), Angle(0, 180, 0))
		self:AddPad("models/kingpommes/startrek/intrepid/transporter_personnelpad.mdl", Vector(), Angle(0, 240, 0))
		self:AddPad("models/kingpommes/startrek/intrepid/transporter_personnelpad.mdl", Vector(), Angle(0, 300, 0))
	end)
end

function ENT:OnRemove()
	for _, pad in pairs(self.Pads) do
		pad:Remove()
	end
end