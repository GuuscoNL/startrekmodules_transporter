if not istable(ENT) then Star_Trek:LoadAllModules() return end

include("shared.lua")


hook.Add("HUDPaint", "Star_Trek.Transporter.InhibitorRadius", function()
    ply = LocalPlayer()
    ent = ply:GetEyeTrace().Entity

    tbl = ent:GetTable()

    if IsValid(ent) and tbl["GetSpawner"] ~= nil and ent:GetSpawner() == ply then
        radius = ent:GetRadius()
        entPos = ent:GetPos()
        cam.Start3D()
            render.DrawWireframeSphere(entPos, radius, 32, 32, Color(255, 0, 0))
        cam.End3D()
    end
end)
