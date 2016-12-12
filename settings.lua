lg = love.graphics
lk = love.keyboard
lm = love.mouse

SCALE = 2
DEBUG = true

Scenes = {
	intro 	= 0,
	menu  	= 1,
	room  	= 2,
	mind  	= 3,
	credits = 4
}

ROOM = 1

SCENE = Scenes.credits

next_scene = Scenes.intro
curtain = lg.newImage('img/curtain.png')

curtain_alpha = 255  
curtain_darken = true
curtain_start  = false  

lg = love.graphics
lk = love.keyboard
lm = love.mouse

love.window.setMode(600 * SCALE, 400 * SCALE, {fullscreen = false, centered = true})

lg.setDefaultFilter('nearest', 'nearest')
lg.setFont(lg.newFont("fnt/font.ttf", 10 * SCALE))

KEYS = {
	right = 'd',
	right2= 'right',
	left  = 'a',
	left2 = 'left',
	up    = 'w',
	up2   = 'up',
	down  = 's',
	down2 = 'down',
	take  = 'e',
	skip  = 'space',
	inv   = 'i'
}

point = love.mouse.newCursor('img/cursor_1.png',4, 1)
fist  = love.mouse.newCursor('img/cursor_2.png',4, 1)

lm.setCursor(fist)