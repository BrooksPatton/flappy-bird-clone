local Bird = require('./Bird')
local Vector = require('./vector')
local bird
local gravity
local flap

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  local location = Vector.new(25, 25)
  bird = Bird.new(location)
  gravity = Vector.new(0, 5)
  flap = false
end

function love.draw()
  bird:draw()
end

function love.update(dt)
  if dt > 0.029 then dt = 0.029 end

  bird:applyForce(gravity * dt)

  if flap then 
    bird:flap(dt)
    flap = false
  end

  bird:update()
end

function love.keypressed(key, scancode, isrepeat)
  if key == 'space' then
    flap = true
  end
end
