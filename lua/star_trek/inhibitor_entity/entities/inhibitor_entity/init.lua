if not istable(ENT) then Star_Trek:LoadAllModules() return end

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local radius
local typeof

function ENT:SpawnFunction(ply, tr, ClassName)
    local pos = tr.HitPos
	local ang = ply:GetAngles()

	ang = ang + Angle(0, 180, 0)


	local ent = ents.Create(ClassName)
	ent:SetPos(pos)
	ent:SetAngles(ang)
	ent:Spawn()
	ent:SetVar("active", false)
	local color_red = Color( 255, 0, 0 )
	ent:SetColor(color_red)
	ent:SetUseType( SIMPLE_USE )
	ent:SetMachineHealth(100)
	

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
		self:SetColor(color_green)
		table.insert(Star_Trek.Transporter.Inhibitors, self)
	else
		self:SetVar("active", false)
		local color_red = Color( 255, 0, 0 )
		self:SetColor(color_red)
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
