Char = {} 
Char.__index = Char

function Char.new(w, h, x, y, speed)
	local self = setmetatable({}, Char)
	local walk  = lg.newImage("img/walk.png")
	local idle  = lg.newImage("img/idle.png")
	local take  = lg.newImage("img/take.png")

	self.image = img
	self.frame = walk:getWidth() / w
	self.walk  = newAnimation(walk, w, h, speed, self.frame)
	self.idle  = newAnimation(idle, w, h, speed, self.frame)
	self.take  = newAnimation(take, w, h, speed, self.frame)
	self.curr  = self.walk
	self.x 	 = x * SCALE
	self.y 	 = y * SCALE
	self.w 	 = w * SCALE
	self.h 	 = h * SCALE
	self.s 	 = speed * SCALE
	self.d 	 = 1
	return self
end

function Char:anim(dt)
	if lk.isDown(KEYS.left) then
		self.d = -1
		self.walk:update(dt)
		self.curr = self.walk
	elseif lk.isDown(KEYS.right) then
		self.d = 1
		self.walk:update(dt)
		self.curr = self.walk
	elseif lk.isDown(KEYS.take) then
		self.take:update(dt)
		self.curr = self.take
	else
		self.idle:update(dt)
		self.curr = self.idle
	end
end

function Char:draw()
	self.curr:draw(self.x, self.y, 0, self.d * SCALE, SCALE, self.w / (2 * SCALE))
end