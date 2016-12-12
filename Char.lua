Char = {} 
Char.__index = Char

function Char.new(w, h, x, y, speed)
	local self = setmetatable({}, Char)
	local walk  = lg.newImage("img/char/walk.png")
	local idle  = lg.newImage("img/char/idle.png")
	local fall  = lg.newImage("img/char/fall.png")
	local rise  = lg.newImage("img/char/rise.png")
	local goup  = lg.newImage("img/char/goup.png")
	local godw  = lg.newImage("img/char/godw.png")

	self.frame = 4
	self.walk  = newAnimation(walk, w, h, speed, self.frame)
	self.idle  = newAnimation(idle, w, h, speed, self.frame)
	self.fall  = newAnimation(fall, w, h, 0.2, self.frame)
	self.fall:setMode('once')
	self.rise  = newAnimation(rise, w, h, 0.2, 8)
	self.goup  = newAnimation(goup, w, h, speed, self.frame)
	self.godw  = newAnimation(godw, w, h, speed, self.frame)


	self.curr  = self.rise
	self.x 	 = x * SCALE
	self.y 	 = y * SCALE
	self.w 	 = w * SCALE
	self.h 	 = h * SCALE
	self.s 	 = speed * SCALE
	self.d 	 = 1
	self.area= Area.new(w, h, x, y, 'fill')
	return self
end

function Char:anim(dt)
	if room_stage == 0 then
		self.rise:update(dt)
	elseif room_stage == 2 then
		self.curr = self.fall
		self.fall:update(dt)
	else
		self.curr = self.idle

		if lk.isDown(KEYS.left) or lk.isDown(KEYS.left2) then
			self.d = -1
			self.walk:update(dt)
			self.curr = self.walk
		elseif lk.isDown(KEYS.right) or lk.isDown(KEYS.right2) then
			self.d = 1
			self.walk:update(dt)
			self.curr = self.walk
		elseif lk.isDown(KEYS.up) or lk.isDown(KEYS.up2) then
			self.goup:update(dt)
			self.curr = self.goup
		elseif lk.isDown(KEYS.down) or lk.isDown(KEYS.down2) then
			self.godw:update(dt)
			self.curr = self.godw
		else
			self.idle:update(dt)
			self.curr = self.idle
		end

		self.area.x = self.x
		self.area.y = self.y
	end
end

function Char:draw()
	self.curr:draw(self.x, self.y, 0, self.d * SCALE, SCALE, self.w / (2 * SCALE))
end