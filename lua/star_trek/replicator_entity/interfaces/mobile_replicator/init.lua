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
--  LCARS Mobile Replicator | Server --
---------------------------------------

if not istable(INTERFACE) then Star_Trek:LoadAllModules() return end
local SELF = INTERFACE

SELF.BaseInterface = "replicator"

SELF.LogType = false

function SELF:Open(ent)
	local success, windows = SELF.Base.Open(self, ent)
	if not success then
		return false, windows
	end

	return true, windows, Vector(0, 14, -2), Angle(0, 180, 90)
end