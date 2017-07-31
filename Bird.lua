local Vector = require('./vector')
local Bird = {}

Bird.__index = Bird

function Bird.new(location)
  local t = {}
  setmetatable(t, Bird)

  t.location = location
  t.size = 15
  t.color = {255, 0, 0}

  return t
end

function Bird:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle('fill', self.location.x, self.location.y, self.size, self.size)
end

return Bird
