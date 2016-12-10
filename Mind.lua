function loadMind()
	mind = Image.new('room_2',0,0)

	inv = Inventory.new()

	inv:addItem(Item.new('test', Image.new('item_1', #inv.item_list * 66 + 106, 32)))
	inv:addItem(Item.new('test2', Image.new('item_1', #inv.item_list * 66 + 106, 32)))
end

function updateMind(dt)
	-- body
end

function drawMind()
	mind:draw()
    inv:draw()
end

function controlRoom(key)
	if key == KEYS.inv then
		inv:open()
	end
end