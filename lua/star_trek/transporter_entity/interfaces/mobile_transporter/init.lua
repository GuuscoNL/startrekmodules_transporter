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
-- LCARS Mobile Transporter | Server --
---------------------------------------

if not istable(INTERFACE) then Star_Trek:LoadAllModules() return end
local SELF = INTERFACE

SELF.BaseInterface = "transporter"

SELF.LogType = false

SELF.Solid = true

function SELF:Open(ent, cycleClass)
	local success, windows = self:OpenInternal(
		Vector(-13, 0, 6),
		Angle(20, 0, -20),
		350,
		Vector(-30, 4, 19),
		Angle(55, 0, -20),
		500,
		500,
		Vector(0, -4, 6),
		Angle(0, 0, -20)
	)
	if not success then
		return false, windows
	end

	self.CycleClass = cycleClass

	return true, windows, Vector(0, 3, 15), Angle(180, 0, -90)
end