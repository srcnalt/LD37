function loadRoom()
	room = Image.new('room_'..ROOM,0,0)
	char = Char.new(45, 143, 290, 150, 0.2)
	speed = 30 * SCALE

	last_pos = {x = 0, y = 0}

	timer = 0

	talking = false
	count = true
	wait = true
	anim_end = 0

	skip_btn = Image.new('skip_btn', 240, 376)
end

function updateRoom(dt)
	if ROOM > 3 then
		walk(dt)
	elseif room_stage == 0 then
		if count then
			timer = timer + dt
		end

		if timer > 1 then
			anim_end = anim_end + dt

			if anim_end > 1.6 then
				room_stage = 1
				timer = 0
				anim_end = 0
			end

			char:anim(dt)
		end
	elseif room_stage == 1 then
		walk(dt)
		char:anim(dt)

		anim_end = anim_end + dt

		if anim_end > 10 then
			room_stage = 2
			anim_end = 0
		end
	elseif room_stage == 2 then
		talking = false
		char:anim(dt)

		anim_end = anim_end + dt

		if anim_end > 1 then
			anim_end = 0

			shiftScene(Scenes.mind)
			loadMind()
		end
	else
		walk(dt)
		char:anim(dt)
	end
end

function drawRoom()
	room:draw()

	if ROOM < 4 then
		char:draw()
	end

	if talking then
    	lg.rectangle("fill", char.x - 70 * SCALE, char.y - 50 * SCALE, 150 * SCALE, 40 * SCALE, 10)
    	lg.printf({{0, 0, 0}, STORY[NOW]}, char.x - 68 * SCALE, char.y - 48 * SCALE, 148 * SCALE, "left")
    end

    skip_btn:draw()

    --lg.print(ROOM)
end

function controlRoom(key)
	if key == 1 and mouse_collision(skip_btn) and talking then
		talking = false
		timer = 0
		NOW = NOW + 1
	end
end

function walk(dt)

	if ROOM < 4 then
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
	end

	if count then
		timer = timer + dt
	end

	if NOW > #STORY then return end

	if STORY[NOW] == "SWITCH" and wait then
		talking = false
		count = false
		wait = false
		timer = 0
		mind_stage = mind_stage + 1

		shiftScene(Scenes.mind)
		loadMind()
	elseif STORY[NOW] == "STOP" and wait then
		talking = false
		count = false
		wait = false
		timer = 0
	elseif STORY[NOW] == "COME" and wait then
		talking = false
		count = false
		wait = false
		timer = 0
		ROOM = ROOM + 1
		NOW = NOW + 1
		shiftScene(Scenes.mind)
	elseif STORY[NOW] == "END" then
		NOW = 1
		room_stage = 0
		mind_stage = 1
		ROOM = 1

		loadCredits()
		shiftScene(Scenes.credits)
	end

	if timer > 1 then
		talking = true
	end

	if lk.isDown(KEYS.skip) and talking then
		talking = false
		timer = 0
		NOW = NOW + 1
	end
end