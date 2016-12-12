Image = {} 
Image.__index = Image

function Image.new(name, x, y)
  local self = setmetatable({}, Image)
  local img  = lg.newImage("img/" .. name .. ".png")
  
  self.name = name
  self.image = img
  self.x 	 = x * SCALE
  self.y 	 = y * SCALE
  self.w 	 = img:getWidth()  * SCALE
  self.h 	 = img:getHeight() * SCALE
  return self
end

function Image:setPos(x, y)
  self.x = x
  self.y = y
end

function Image:getPos()
  return self.x, self.y
end

function Image:draw()
  lg.draw(self.image, self.x, self.y, 0, SCALE)
end

function Image:drawAt(x, y)
  lg.draw(self.image, x, y, 0, SCALE)
end