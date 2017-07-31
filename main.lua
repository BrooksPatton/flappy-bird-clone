local Bird = require('./Bird')
local Vector = require('./vector')
local bird

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  local location = Vector.new(25, 25)
  bird = Bird.new(location)
end

function love.draw()
  bird:draw()
end

function love.update(dt)
end
