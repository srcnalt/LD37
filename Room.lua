function loadRoom()
	room = Image.new('room_'..ROOM,0,0)
	char = Char.new(45, 143, 400, 200, 0.2)
	speed = 30 * SCALE

	last_pos = {x = 0, y = 0}

	timer = 0

	talking = false
	count = true

	skip_btn = Image.new('skip_btn', 240, 376)
end

function updateRoom(dt)
	if count then
		timer = timer + dt * 10
	end

	if STORY[NOW] == "SWITCH" then
		talking = false
		count = false
		timer = 0
		NOW = NOW + 1
		shiftScene(Scenes.mind)
		loadMind()
	end

	if timer > 3 then
		talking = true
	end

	if lk.isDown(KEYS.skip) and talking then
		talking = false
		timer = 0
		NOW = NOW + 1
	end

	last_pos.x = char.x
	last_pos.y = char.y

    if lk.isDown(KEYS.up) or lk.isDown(KEYS.up2) then
		char.y = char.y - dt * speed * SCALE
	end

	if lk.isDown(KEYS.down) or lk.isDown(KEYS.down2) then 
		char.y = char.y + dt * speed * SCALE
	end

	if lk.isDown(KEYS.left) or lk.isDown(KEYS.left2) then 
		char.x = char.x - dt * speed * SCALE
	end

	if lk.isDown(KEYS.right) or lk.isDown(KEYS.right2) then 
		char.x = char.x + dt * speed * SCALE
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

	if talking then
    	lg.rectangle("fill", char.x - 70 * SCALE, char.y - 50 * SCALE, 150 * SCALE, 40 * SCALE, 10)
    	lg.printf({{0, 0, 0}, STORY[NOW]}, char.x - 68 * SCALE, char.y - 48 * SCALE, 148 * SCALE, "left")
    end

    skip_btn:draw()
end

function controlRoom(key)
	if key == 1 and mouse_collision(skip_btn) then
		talking = false
		timer = 0
		NOW = NOW + 1
	end
end