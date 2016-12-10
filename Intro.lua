function loadIntro()
	intro_back = Image.new('intro_back',0,0)
end

function updateIntro(dt)
	if lk.isDown(KEYS.skip) then
		shiftScene(Scenes.menu)
		loadMenu()
	end
end

function drawIntro()
	intro_back:draw()
end