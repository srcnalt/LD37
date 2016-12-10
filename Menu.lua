function loadMenu()
	--rot = 0
	--brain = Voxel.new('brain', 40, {1,2,3,4,5,6,7,7,7,7})
end

function updateMenu(dt)
	--brain.rot = brain.rot + dt

	if lk.isDown(KEYS.skip) then
		shiftScene(Scenes.room)
		loadRoom()
	end
end

function drawMenu()
	--brain:draw(250, 200, 2)
end