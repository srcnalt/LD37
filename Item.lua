Item = {} 
Item.__index = Item

function Item.new(name, img)
	local self = setmetatable({}, Item)

	self.image = Image.new(img, 0, 0)
	self.name  = name

	return self
end

function Item:drawAt(x, y)
	self.image:drawAt(x, y)
end