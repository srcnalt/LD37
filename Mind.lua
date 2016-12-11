function loadMind()
	mind = Image.new('room_3',0,0)

	inv = Inventory.new()
	inv_btn = Image.new('inv_btn', 240, 0)
	examine = Image.new('examine',0,0)

	part_1 = {
		{Image.new('slug', 250, 300), 'slug', 'wow a slug, i can eat it!'},
		{Image.new('pan', 200, 200), 'pan', 'this might be useful'}
	}

	part_2 = {}
	part_3 = {}

	combination = {}

	curr_part = part_1

	curr_cursor = fist

	passed = false
	failed = false
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

    for i, v in pairs(curr_part) do
    	if mouse_collision(v[1]) then
    		local mx = v[1].x + (v[1].w - examine.w) / 2
    		local my = v[1].y - 60 * SCALE
    		local padding = 4 * SCALE

    		examine:drawAt(mx, my)
    		lg.setColor(0,0,0,255)
    		lg.printf(v[3], mx + padding, my + padding, examine.w - 2 * padding)
    		lg.setColor(255,255,255,255)
    	end
    end
   inv_btn:draw()
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
		if mouse_collision(inv_btn) then
			if inv.opened then
				inv.opened = false
			else
				inv.opened = true
			end
		end

		for i, v in pairs(inv.item_list) do
			if mouse_collision(v.image) then
				table.insert(inv.combine, v)

				--draw as selected

				if #inv.combine == 2 then
					if inv.combine[1].name == inv.combine[2].name then 
						inv.combine = {}
						v.is_selected = false
					elseif (inv.combine[1].name == COMBO[ROOM][1] or inv.combine[2].name == COMBO[ROOM][1]) and (inv.combine[1].name == COMBO[ROOM][2] or inv.combine[2].name == COMBO[ROOM][2]) then
						--show message

						passed = true
						end_timer = 1
						failed = false
					else
						inv.combine = {}
						v.is_selected = false
						failed = true
					end
				end
			end
		end
	end
end