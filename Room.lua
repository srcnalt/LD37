function loadRoom()
	room = Image.new('room_'..ROOM,0,0)
	char = Char.new(26, 48, 200, 100, 0.2)
	speed = 30

	inv = Inventory.new()

	inv:addItem(Item.new('tigu', 'item_1'))

	last_pos = {x = 0, y = 0}
end

function updateRoom(dt)
	last_pos.x = char.x
	last_pos.y = char.y

    if lk.isDown(KEYS.up) then
		char.y = char.y - dt * speed * SCALE
	end

	if lk.isDown(KEYS.down) then 
		char.y = char.y + dt * speed * SCALE
	end

	if lk.isDown(KEYS.left) then 
		char.x = char.x - dt * speed * SCALE
	end

	if lk.isDown(KEYS.right) then 
		char.x = char.x + dt * speed * SCALE
	end

	if lk.isDown(KEYS.inv) then
		inv:open()
	end

	if not char_collision(char) then
		char.x = last_pos.x
		char.y = last_pos.y
	end

	char:anim(dt)
end

function drawRoom()
	room:draw()
	char:draw()

    love.graphics.rectangle("fill", char.x - 40 * SCALE, char.y - 30 * SCALE, 80 * SCALE, 20 * SCALE, 10)

    inv:draw()
end