require 'player'
require 'controls'
require 'ground'

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    player = Player()
    ground = Ground()
end

function love.update(dt)
   Controls(dt)
end

function love.draw()
    DrawGround()
    DrawPlayer()
end
