Voxel = {}
Voxel.__index = Voxel

function Voxel.new(name, width, order)
  	local self 	= setmetatable({}, Voxel)

  	self.img 	= lg.newImage('img/' .. name .. '.png')
  	self.frames = self.img:getWidth() / width
  	self.order 	= order
	self.quads 	= {}
	self.len 	= #order
	self.rot 	= 0
	self.width 	= width
	self.height = self.img:getHeight()

	for i=1, self.frames do
		self.quads[i] = lg.newQuad((i - 1) * width, 0, self.width, self.height, self.img:getWidth(), self.img:getHeight())
	end

  return self
end

function Voxel.draw(self, x, y, s)
  	for i = self.len, 1, -1 do
  		love.graphics.setColor(225 - i * 5, 225 - i * 5, 225 - i * 5, 255)
		lg.draw(self.img, self.quads[self.order[i]], x * SCALE, y + (i - 1) * SCALE * 3 * s, self.rot, SCALE * s, SCALE * s, self.width/2, self.height/2)
	end
end