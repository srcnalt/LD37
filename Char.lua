Char = {} 
Char.__index = Char

function Char.new(w, h, x, y, speed)
	local self = setmetatable({}, Char)
	local walk  = lg.newImage("img/walk.png")
	local idle  = lg.newImage("img/idle.png")
	local take  = lg.newImage("img/take.png")

	self.frame = math.ceil(walk:getWidth() / w)
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
	self.area= Area.new(w, h, x, y, 'fill')
	return self
end

function Char:anim(dt)
	if lk.isDown(KEYS.left) or lk.isDown(KEYS.left2) then
		self.d = -1
		self.walk:update(dt)
		self.curr = self.walk
	elseif lk.isDown(KEYS.right) or lk.isDown(KEYS.right2) then
		self.d = 1
		self.walk:update(dt)
		self.curr = self.walk
	elseif lk.isDown(KEYS.up) or lk.isDown(KEYS.down) or lk.isDown(KEYS.up2) or lk.isDown(KEYS.down2) then
		self.walk:update(dt)
		self.curr = self.walk
	elseif lk.isDown(KEYS.take) then
		self.take:update(dt)
		self.curr = self.take
	else
		self.idle:update(dt)
		self.curr = self.idle
	end

	self.area.x = self.x
	self.area.y = self.y
end

function Char:draw()
	self.curr:draw(self.x, self.y, 0, self.d * SCALE, SCALE, self.w / (2 * SCALE))
end