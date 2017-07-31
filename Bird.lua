local Vector = require('./vector')
local Bird = {}

Bird.__index = Bird

function Bird.new(location)
  local t = {}
  setmetatable(t, Bird)

  t.location = location
  t.size = 15
  t.color = {255, 0, 0}
  t.acceleration = Vector.new(0, 0)
  t.velocity = Vector.new(0, 0)
  t.upwardForce = Vector.new(0, -250)

  return t
end

function Bird:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle('fill', self.location.x, self.location.y, self.size, self.size)
end

function Bird:applyForce(force)
  self.acceleration = self.acceleration + force
end

function Bird:update()
  self.velocity = self.velocity + self.acceleration
  self.location = self.location + self.velocity
  self.acceleration = self.acceleration * 0
end

function Bird:flap(dt)
  self.velocity = self.velocity * 0
  self:applyForce(self.upwardForce * dt)
end

return Bird
