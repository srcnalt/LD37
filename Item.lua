Item = {} 
Item.__index = Item

function Item.new(name, img)
	local self = setmetatable({}, Item)

	self.image = img
	self.name  = name
	self.hover_img = Image.new('hover', img.x / SCALE, img.y / SCALE)
	self.selected_img = Image.new('selected', img.x / SCALE, img.y / SCALE)
	self.is_selected = false
	return self
end

function Item:draw()
	self.image:draw()
end

function Item:hover()
	if mouse_collision(self.image) and not self.is_selected and not passed then
		self.hover_img:draw()
		lg.print(self.name, 380 * SCALE, 140 * SCALE)
	end
end

function Item:selected()
	self.selected_img:draw()
	self.is_selected = true
end