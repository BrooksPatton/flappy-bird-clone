local Bird = require('./Bird')
local Vector = require('./vector')
local bird
local gravity
local flap
local titleFont
local playing
local Pipe = require('./Pipe')
local pipe1
local pipe2

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  gravity = Vector.new(0, 5)
  titleFont = love.graphics.newFont(24)
  resetGame()
end

function love.draw()
  bird:draw()
  pipe1:draw()
  pipe2:draw()

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
  local pipe1Loc = Vector.new(width/2, 0)
  local pipe2Loc = Vector.new(width, 0)
  
  bird = Bird.new(location)
  flap = false
  playing = true
  pipe1 = Pipe.new(pipe1Loc)
  pipe2 = Pipe.new(pipe2Loc)
end
