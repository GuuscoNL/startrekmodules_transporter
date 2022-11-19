if not istable(INTERFACE) then Star_Trek:LoadAllModules() return end
local SELF = INTERFACE

SELF.BaseInterface = "replicator"

function SELF:Open(ent)
	local categories = table.Copy(Star_Trek.Replicator.Categories)
	

	table.insert(categories, {
		Name = "CLEAN",
		Color = Star_Trek.LCARS.ColorOrange,
		Buttons = {},
	})

	table.insert(categories, {
		Name = "CLOSE",
		Color = Star_Trek.LCARS.ColorRed,
		Buttons = {},
	})

    local categoryCount = #categories

    for _, category in pairs(categories) do
        category.Disabled = false
    end

	local success, window = Star_Trek.LCARS:CreateWindow(
		"category_list",
		Vector(0, 14, 8),
		Angle(0, 180, 90),
		nil,
		500,
		500,
		function(windowData, interfaceData, ply, categoryId, buttonId, buttonData)
			if buttonId then
				local selected = windowData.Selected
				local categoryData = windowData.Categories[selected]
				if istable(categoryData) then
					local pos, angle = Star_Trek.LCARS:GetInterfacePosAngleGlobal(ent)
					pos = pos + angle:Up() * -7
					pos = pos + angle:Right() * -6

					if istable(Star_Trek.Logs) then
						Star_Trek.Logs:AddEntry(ent, ply, "Replicating " .. buttonData.Name)
					end

					Star_Trek.Replicator:CreateObject(buttonData.Data, pos, ent:GetAngles())
				end

				interfaceData:Close()
			else
                -- If the button is the second to last one in the categories (The clean but is second to last)
				if categoryId == categoryCount - 1 then
					local pos, angle = Star_Trek.LCARS:GetInterfacePosAngleGlobal(ent)
					pos = pos + angle:Right() * 6

					local targets = ents.FindInSphere(pos, 20)
					local cleanEntities = {}
					for _, target in pairs(targets) do
						if target.Replicated then
							table.insert(cleanEntities, target)
						end
					end

					if #cleanEntities == 0 then
						ent:EmitSound("star_trek.lcars_error")
					else
						if istable(Star_Trek.Logs) then
							Star_Trek.Logs:AddEntry(ent, ply, "Activating Recycler")
						end

						for _, cleanEnt in pairs(cleanEntities) do
							Star_Trek.Replicator:RecycleObject(cleanEnt)
						end
					end

					interfaceData:Close()

					return false
                -- If the button is the last one in the categories (the close button is the last)
				elseif categoryId == categoryCount then
					windowData:Close()

					return false
				end
			end
		end,
		categories,
		"REPLICATOR",
		"REPL",
		true
	)
	if not success then
		return false, menuWindow
	end

	return true, {window}
end