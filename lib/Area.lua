Area = {}
Area.__index = Area

function Area.new(w, h, x, y, mode)
	local self = setmetatable({}, Area)
	self.x = x * SCALE
	self.y = y * SCALE
	self.w = w * SCALE
	self.h = h * SCALE
	self.m = mode

	return self
end

function Area:draw()
	lg.rectangle(self.m, self.x, self.y, self.w, self.h)
end

function Area:follow_mouse()
	x, y = lm.getPosition()

	self.x = x
	self.y = y
end