Item = {} 
Item.__index = Item

function Item.new(name, img)
	local self = setmetatable({}, Item)

	self.image = img
	self.name  = name
	self.hover_img = Image.new('hover', img.x / SCALE, img.y / SCALE)
	return self
end

function Item:draw()
	self.image:draw()
end

function Item:hover()
	if mouse_collision(self.image) then
		self.hover_img:draw()
		lg.print(self.name, 380 * SCALE, 140 * SCALE)
	end
end