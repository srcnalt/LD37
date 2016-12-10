Inventory = {} 
Inventory.__index = Inventory

function Inventory.new()
	local self = setmetatable({}, Inventory)

	self.item_list = {}
	self.combine = {}
	self.x = 94
	self.y = 20
	self.case = Image.new('inv', self.x, self.y)
	self.opened = false

	return self
end

function Inventory:addItem(item)
	table.insert(self.item_list, item)
end

function Inventory:open()
	if not self.opened then
		self.opened = true
	else
		self.opened = false
	end
end

function Inventory:draw()
	if not self.opened then return end

	self.case:draw()

	if #self.combine > 0 then
		self.combine[1]:selected()
	end

	for i=1, #self.item_list do
		self.item_list[i]:draw()
		self.item_list[i]:hover()
	end
end


