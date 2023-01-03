if not istable(ENT) then Star_Trek:LoadAllModules() return end

include("shared.lua")


net.Receive("Star_Trek.Inhibitor.Create", function()
    ent = net.ReadEntity()
    color = net.ReadColor()
    ent:SetColor(color)
end)