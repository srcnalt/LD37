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

	if #self.item_list == 0 then
		lg.print("I have to find some clues...", 115 * SCALE, 105 * SCALE)
	elseif #self.item_list == 1 then
		lg.print("I have to find some other items...", 115 * SCALE, 105 * SCALE)
	elseif not passed and not failed then
		lg.print("I have to combine these items to help me remember...", 115 * SCALE, 105 * SCALE)
	elseif failed then
		lg.print("This combination did not work, have to try something else...", 115 * SCALE, 105 * SCALE)
	elseif passed and MESSAGE[ROOM] then
		lg.print(MESSAGE[ROOM], 115 * SCALE, 105 * SCALE)
	end
end


