lg = love.graphics
lk = love.keyboard
lm = love.mouse

SCALE = 3
DEBUG = true

Scenes = {
	intro = 0,
	menu  = 1,
	room  = 2,
	mind  = 3
}

ROOM = 1

SCENE = Scenes.intro

next_scene = Scenes.intro
curtain = lg.newImage('img/curtain.png')

curtain_alpha = 255  
curtain_darken = true
curtain_start  = false  

lg = love.graphics
lk = love.keyboard
lm = love.mouse

love.window.setMode(300 * SCALE, 200 * SCALE, {fullscreen = false, centered = true})

lg.setDefaultFilter('nearest', 'nearest')
lg.setFont(lg.newFont("fnt/font.ttf", 10 * SCALE))

KEYS = {
	right = 'd',
	left  = 'a',
	up    = 'w',
	down  = 's',
	take  = 'e',
	skip  = 'space',
	inv   = 'i'
}