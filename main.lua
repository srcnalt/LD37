function love.load()
	require 'settings'
	require 'lib.Image'
	require 'lib.Anim'
	require 'lib.Mech'
	require 'lib.Area'
	require 'lib.Voxel'
	require 'Char'
	require 'Intro'
	require 'Menu'
	require 'Room'
	require 'Inventory'
	require 'Item'

	if SCENE == Scenes.intro then
		loadIntro()
	elseif SCENE == Scenes.menu then
		loadMenu()
	elseif SCENE == Scenes.room then
		loadRoom()
	elseif SCENE == Scenes.mind then
		loadMind()
	else
		loadCredits()
	end
end

function love.update(dt)
	if SCENE == Scenes.intro then
		updateIntro(dt)
	elseif SCENE == Scenes.menu then
		updateMenu(dt)
	elseif SCENE == Scenes.room then
		updateRoom(dt)
	elseif SCENE == Scenes.mind then
		updateMind(dt)
	else
		updateCredits(dt)
	end

	updateCurtain(dt)
end

function love.draw()
	if SCENE == Scenes.intro then
		drawIntro()
	elseif SCENE == Scenes.menu then
		drawMenu()
	elseif SCENE == Scenes.room then
		drawRoom()
	elseif SCENE == Scenes.mind then
		drawMind()
	else
		drawCredits()
	end

	drawCurtain()

	if DEBUG then

	end
end