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
--      Inhibitor Entity | Server    --
---------------------------------------

if not istable(ENT) then Star_Trek:LoadAllModules() return end

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr, ClassName)
    local pos = tr.HitPos
	local ang = ply:GetAngles()

	ang = ang + Angle(0, 180, 0)

	local ent = ents.Create(ClassName)
	ent:SetPos(pos)
	ent:SetAngles(ang)
	ent:Spawn()
	ent:SetVar("active", false)
	ent:SetSpawner(ply)
	local color_red = Color( 255, 0, 0 )
	ent:colorMachine(color_red, ent:GetSpawner())
	ent:SetUseType( SIMPLE_USE )
	ent:SetMachineHealth(100)
	ent:SetRadius(1)

	undo.Create("Transporter Inhibitor")
	undo.AddEntity(ent)
	undo.SetPlayer(ply)
	undo.Finish()

end

function ENT:Initialize()
    self:SetModel("models/props_lab/citizenradio.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion(false)
	end
	
end

function ENT:Use(ply)
	active = self:GetVar("active")
	if not active then
		self:SetVar("active", true)
		local color_green = Color( 0, 255, 0 )
		self:colorMachine(color_green, self:GetSpawner())
		table.insert(Star_Trek.Transporter.Inhibitors, self)
	else
		self:SetVar("active", false)
		local color_red = Color( 255, 0, 0 )
		self:colorMachine(color_red, self:GetSpawner())
		table.RemoveByValue(Star_Trek.Transporter.Inhibitors, self)
	end
end

function ENT:OnRemove()
	if self:GetVar("active") then
		table.RemoveByValue(Star_Trek.Transporter.Inhibitors, self)
	end
end

function ENT:OnTakeDamage( dmginfo )
	local initialHealth = self:GetMachineHealth()
	dmg = dmginfo:GetDamage()
	local newHealth = initialHealth - dmg
	self:SetMachineHealth(newHealth)

	if self:GetVar("active") then
		active = "True"
	else 
		active = "False"
	end
	self.ScannerData = "Activated: " .. active .. "\nRadius: " .. self:GetRadius() .. "\nHealth: " .. self:GetMachineHealth()

	if self:GetMachineHealth() <= 0 then
		local pos = self:GetPos()
		self:Remove()
		local explode = ents.Create( "env_explosion" )
		explode:SetPos(pos)
		explode:Spawn()
		explode:SetKeyValue("iMagnitude", "1")
		explode:Fire( "Explode", 0, 0 )
		explode:EmitSound( "weapon_AWP.Single", 400, 400 )
	end	
end

util.AddNetworkString("Star_Trek.Inhibitor.Create")
function ENT:colorMachine(color, spawner) 
	net.Start("Star_Trek.Inhibitor.Create")
	net.WriteEntity(self)
	net.WriteColor(color)
	net.Send(spawner)
end

hook.Add("Star_Trek.Sensors.ScanEntity", "Star_Trek.Inhibitor.ScanData", function(ent, scanData)
	if ent:GetClass() == "inhibitor_entity" then
		if ent:GetVar("active") then
			active = "True"
		else 
			active = "False"
		end
		scanData.ScannerData = "Activated: " .. active .. "\nRadius: " .. ent:GetRadius() .. "\nHealth: " .. ent:GetMachineHealth()
	end
end)