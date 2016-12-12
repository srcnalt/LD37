function loadMenu()
	back   = Image.new('menu/menu_back', 0, 0)
	front  = Image.new('menu/menu_front', 0, 0)
	bad    = Image.new('menu/bad', 0, 0)
	sector = Image.new('menu/sector', 0, 0)
	st 	   = Image.new('menu/st', 0, 350)
end

function updateMenu(dt)
	local x, y = lm.getPosition()

	bad.x = 50 + x / 100 * SCALE
	bad.y = 50 + y / 100 * SCALE

	sector.x = 220 + y / 100 * SCALE
	sector.y = 345 + x / 100 * SCALE

	front.x = front.x - dt * 1000
	if front.x < -600 * SCALE then front.x = 0 end

	if lk.isDown(KEYS.skip) then
		shiftScene(Scenes.room)
		loadRoom()
	end
end

function drawMenu()
	back:draw()
	front:draw()
	bad:draw()
	sector:draw()
	st:draw()
end