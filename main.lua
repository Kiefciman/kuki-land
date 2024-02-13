require 'player'
require 'controls'
require 'ground'
camera = require 'camera'
require 'view'

function love.load()
    cam = camera()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    player = Player()
    ground = Ground()
end

function love.update(dt)
   Controls(dt)
   View(cam, player)
end

function love.draw()
    cam:attach()
        DrawGround()
        DrawPlayer()
    cam:detach()
end
