local Pipe = {}
Pipe.__index = Pipe

function Pipe.new(location)
  local t = {}
  setmetatable(t, Pipe)

  t.location = location
  t.color = {0, 55, 0}
  t.gapSize = 150
  t.gapLocation = love.math.random(t.gapSize, height - t.gapSize)

  return t
end

function Pipe:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle('fill', self.location.x, self.location.y, 50, self.gapLocation)
  love.graphics.rectangle('fill', self.location.x, self.gapLocation + self.gapSize, 50, height)
end

return Pipe
