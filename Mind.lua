function loadMind()
	mind = {
		Image.new('old_room/room',0,0),
		Image.new('sci_room/room',0,0)
	}

	anim = {
		{
			{newAnimation(lg.newImage("img/old_room/tent1.png"), 256, 140, 1, 2), 	{x=0,y=0}},
			{newAnimation(lg.newImage("img/old_room/tent2.png"), 520, 88, 0.5, 4),  {x=0,y=312}},
		},
		{

		}
	}

	inv = Inventory.new()
	inv_btn = Image.new('inv_btn', 240, 0)
	examine = Image.new('examine',0,0)

	items = {
		{		
			{Image.new('old_room/glasses', 242, 156), 'Glasses',  	"Looks like it's designed for women."},
			{Image.new('old_room/suit',    290, 270), 'Suit', 		"The suit looks quite old and dusty. Looks like hasn't been touched in a long time."},
			{Image.new('old_room/picture', 262, 108), 'Picture', 	"It's a picture of an old man."},
			{Image.new('old_room/leaf',    515, 180), 'Plant', 		"This plant is alive, someone has been looking after it."}
		},
		{
			{Image.new('sci_room/screw',   313, 295), 'Screw Driver', 	"There is something in the drawer."},
			{Image.new('sci_room/circuit', 100, 187), 'Circuit Board', 	"Someone tried to hack this door from inside... But failed... Who?"},
			{Image.new('sci_room/paper',   383, 244), 'Paper', 			"Paper full of ones and zeros... Somehow I feel like I understand this text."},
			{Image.new('sci_room/cable',   256, 208), 'Pile of Cable', 	"Pile of elektrical cable. It has some sort of weird socket on it."},
		}
	}

	combination = {}

	curr_cursor = fist

	passed = false
	failed = false
	invcln = false
end

function updateMind(dt)
	curr_cursor = fist

	for i, v in ipairs(items[mind_stage]) do
		if mouse_collision(v[1]) then
			curr_cursor = point

			if lm.isDown(1) then
				v[1].x = (#inv.item_list * 66 + 106) * SCALE
				v[1].y = 32 * SCALE

				inv:addItem(Item.new(v[2], Image.new(v[1].name..'2', v[1].x / SCALE, v[1].y / SCALE)))

				table.remove(items[mind_stage], i)
			end
		end
	end

	for i,v in ipairs(anim[mind_stage]) do
		v[1]:update(dt)
	end

	lm.setCursor(curr_cursor)
end

function drawMind()
	if ROOM > 3 then
		shiftScene(Scenes.room)
		loadRoom()
		return
	end

	mind[mind_stage]:draw()

    for i, v in ipairs(items[mind_stage]) do
    	v[1]:draw()
    end

    for i,v in ipairs(anim[mind_stage]) do
    	v[1]:draw(v[2].x * SCALE, v[2].y * SCALE, 0, SCALE, SCALE)
    end

    for i, v in pairs(items[mind_stage]) do
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

    inv:draw()

    inv_btn:draw()
end

function controlMind(key)
	if key == KEYS.inv then
		inv:open()
	end

	if key == KEYS.skip and passed then
		ROOM = ROOM + 1
		NOW = NOW + 1
		invcln = true
		passed = false
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

				if #inv.combine == 2 then
					if inv.combine[1].name == inv.combine[2].name then 
						inv.combine = {}
						v.is_selected = false
					elseif (inv.combine[1].name == COMBO[ROOM][1] or inv.combine[2].name == COMBO[ROOM][1]) and (inv.combine[1].name == COMBO[ROOM][2] or inv.combine[2].name == COMBO[ROOM][2]) then
						passed = true
						end_timer = 1
						failed = false
						room_stage = room_stage + 1

						for i,v in ipairs(inv.item_list) do
							v.is_selected = false
						end
					else
						inv.combine = {}

						for i,v in ipairs(inv.item_list) do
							v.is_selected = false
						end
						
						failed = true
					end
				end
			end
		end
	end
end