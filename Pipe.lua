local Pipe = {}
local Vector = require('./vector')

Pipe.__index = Pipe

function Pipe.new(location)
  local t = {}
  setmetatable(t, Pipe)

  t.location = location
  t.color = {0, 55, 0}
  t.gapSize = 150
  t.gapLocation = love.math.random(t.gapSize, height - t.gapSize)
  t.active = true
  t.width = 50
  t.speed = 150

  return t
end

function Pipe:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle('fill', self.location.x, self.location.y, self.width, self.gapLocation)
  love.graphics.rectangle('fill', self.location.x, self.gapLocation + self.gapSize, self.width, height)
end

function Pipe:update(dt)
  self.location.x = self.location.x - self.speed * dt

  if self:isOffScreen() then
    self.active = false
  end
end

function Pipe:isOffScreen()
  if self.location.x + self.width < 0 then
    return true
  else
    return false
  end
end

function Pipe:collidingWith(bird)
  if self:collideXWithBird(bird) and self:collideYWithBird(bird) then
    return true
  else
    return false
  end
end

function Pipe:collideXWithBird(bird)
  return (bird.location.x > self.location.x and bird.location.x < self.location.x + self.width) or
    (bird.location.x + bird.size > self.location.x and bird.location.x + bird.size < self.location.x + self.width)
end

function Pipe:collideYWithBird(bird)
  return bird.location.y < self.gapLocation or bird.location.y + bird.size > self.gapLocation + self.gapSize
end

return Pipe
