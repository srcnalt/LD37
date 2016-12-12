function loadCredits()
	back   = Image.new('menu/menu_back', 0, 0)
	front  = Image.new('menu/menu_front', 0, 0)

	pl = Image.new('menu/pl', 0, 0)
	u1 = Image.new('menu/u1', 0, 0)
	u2 = Image.new('menu/u2', 0, 0)
	u3 = Image.new('menu/u3', 0, 0)
	u4 = Image.new('menu/u4', 0, 0)
end

function updateCredits(dt)
	local x, y = lm.getPosition()

	u1.x = 400 + x / 100 * SCALE
	u1.y = 200 + y / 100 * SCALE

	u2.x = 400 - x / 100 * SCALE
	u2.y = 280 + y / 100 * SCALE

	u3.x = 400 + x / 100 * SCALE
	u3.y = 360 - y / 100 * SCALE

	u4.x = 400 - x / 100 * SCALE
	u4.y = 420 - y / 100 * SCALE

	front.x = front.x - dt * 1000
	if front.x < -600 * SCALE then front.x = 0 end

	if lk.isDown(KEYS.skip) then
		shiftScene(Scenes.menu)
		loadMenu()
	end
end

function drawCredits()
	back:draw()
	front:draw()

	pl:draw()
	u1:draw()
	u2:draw()
	u3:draw()
	u4:draw()
end