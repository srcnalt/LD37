function loadMind()
	mind = Image.new('room_3',0,0)

	inv = Inventory.new()

	part_1 = {
		{Image.new('slug', 250, 300), 'slug'},
		{Image.new('pan', 200, 200), 'pan'}
	}

	part_2 = {}
	part_3 = {}

	combination = {}

	curr_part = part_1

	curr_cursor = fist

	passed = false
end

function updateMind(dt)
	curr_cursor = fist

	for i, v in ipairs(curr_part) do
		if mouse_collision(v[1]) then
			curr_cursor = point

			if lm.isDown(1) then
				v[1].x = (#inv.item_list * 66 + 106) * SCALE
				v[1].y = 32 * SCALE

				inv:addItem(Item.new(v[2], v[1]))

				table.remove(curr_part, i)
			end
		end
	end

	lm.setCursor(curr_cursor)
end

function drawMind()
	mind:draw()
    inv:draw()

    for i=1, #curr_part do
    	curr_part[i][1]:draw()
    end
end

function controlMind(key)
	if key == KEYS.inv then
		inv:open()
	end

	if key == KEYS.skip and passed then
		ROOM = ROOM + 1
		shiftScene(Scenes.room)
		loadRoom()
	end

	if key == 1 then
		for i, v in pairs(inv.item_list) do
			if mouse_collision(v.image) then
				table.insert(inv.combine, v)

				--draw as selected

				if #inv.combine == 2 then
					if (inv.combine[1].name == COMBO[ROOM][1] or inv.combine[2].name == COMBO[ROOM][1]) and (inv.combine[1].name == COMBO[ROOM][2] or inv.combine[2].name == COMBO[ROOM][2]) then
						--show message

						passed = true

						inv.opened = false
						end_timer = 1
					else
						inv.combine = {}
						v.is_selected = false
					end
				end
			end
		end
	end
end