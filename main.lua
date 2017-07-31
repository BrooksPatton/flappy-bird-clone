local Bird = require('./Bird')
local Vector = require('./vector')
local bird
local gravity
local flap
local titleFont
local playing

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  gravity = Vector.new(0, 5)
  titleFont = love.graphics.newFont(24)
  resetGame()
end

function love.draw()
  bird:draw()
  if not bird.isAlive then
    love.graphics.setColor(255, 255, 255)
    love.graphics.setFont(titleFont)
    love.graphics.print('Game Over', width/2 - 64, height/2 - 12)
  end
end

function love.update(dt)
  if dt > 0.029 then dt = 0.029 end

  bird:applyForce(gravity * dt)

  if flap then 
    bird:flap(dt)
    flap = false
  end

  bird:update()

  if not bird.isAlive then
    playing = false
  end
end

function love.keypressed(key, scancode, isrepeat)
  if key == 'space' then
    flap = true
  end

  if key == 'return' and playing == false then
    resetGame()
  end
end

function resetGame()
  local location = Vector.new(25, 25)
  bird = Bird.new(location)
  flap = false
  playing = true
end
