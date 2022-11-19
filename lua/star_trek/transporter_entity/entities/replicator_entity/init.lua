if not istable(ENT) then Star_Trek:LoadAllModules() return end

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

	constraint.Keepupright(ent, ent:GetAngles(), tr.PhysicsBone, 999999 )
	undo.AddEntity(ent)
	return ent
end

function ENT:Initialize()
    self:SetModel("models/kingpommes/startrek/intrepid/mess_replicator.mdl")
    self:PhysicsInit( SOLID_VPHYSICS )

    local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion(false)
	end

end

function ENT:Use(ply)
	Star_Trek.LCARS:OpenInterface(ply, self, "spawnable_replicator"	)
	
end