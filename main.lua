local Bird = require('./Bird')
local Vector = require('./vector')
local bird
local gravity

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  local location = Vector.new(25, 25)
  bird = Bird.new(location)
  gravity = Vector.new(0, 5)
end

function love.draw()
  bird:draw()
end

function love.update(dt)
  if dt > 0.029 then dt = 0.029 end

  bird:applyForce(gravity * dt)
  bird:update()
end
