function loadCredits()
	back   = Image.new('menu_back', 0, 0)
	front  = Image.new('menu_front', 0, 0)
end

function updateCredits(dt)
	local x, y = lm.getPosition()

	front.x = front.x - dt * 1000
	if front.x < -600 * SCALE then front.x = 0 end

	if lk.isDown(KEYS.skip) then
		shiftScene(Scenes.intro)
		loadIntro()
	end
end

function drawCredits()
	back:draw()
	front:draw()
end