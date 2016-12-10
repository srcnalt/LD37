Inventory = {} 
Inventory.__index = Inventory

function Inventory.new()
	local self = setmetatable({}, Inventory)

	self.item_list = {}
	self.x = 10
	self.y = 10
	self.case = Image.new('inv', self.x, self.y)
	self.opened = false

	return self
end

function Inventory:addItem(item)
	table.insert(self.item_list, item)
end

function Inventory:open()
	self.opened = true
end

function Inventory:draw()
	if not self.opened then return end

	self.case:draw()

	for i=1, #self.item_list do
		self.item_list[i]:drawAt((i - 1) * 50 + 4, 15)
	end
end
