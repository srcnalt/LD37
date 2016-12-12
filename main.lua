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
	require 'Mind'
	require 'Inventory'
	require 'Item'
	require 'Story'
	require 'Credits'

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
	elseif SCENE == Scenes.credits then
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
	elseif SCENE == Scenes.credits then
		drawCredits()
	end

	drawCurtain()

	if DEBUG then

	end
end

function love.keypressed(key, is_repeated)
	if 	   SCENE == Scenes.intro     then

	elseif SCENE == Scenes.menu then

	elseif SCENE == Scenes.room then

	elseif SCENE == Scenes.mind  then
	    controlMind(key)
	end
end

function love.mousepressed(x, y, button, istouch)
	if SCENE == Scenes.room then
		controlRoom(button)
   	elseif SCENE == Scenes.mind  then
	    controlMind(button)
	end
end