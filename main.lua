-- ██╗  ██╗██╗   ██╗██╗  ██╗██╗      ██╗      █████╗ ███╗   ██╗██████╗ 
-- ██║ ██╔╝██║   ██║██║ ██╔╝██║      ██║     ██╔══██╗████╗  ██║██╔══██╗
-- █████╔╝ ██║   ██║█████╔╝ ██║█████╗██║     ███████║██╔██╗ ██║██║  ██║
-- ██╔═██╗ ██║   ██║██╔═██╗ ██║╚════╝██║     ██╔══██║██║╚██╗██║██║  ██║
-- ██║  ██╗╚██████╔╝██║  ██╗██║      ███████╗██║  ██║██║ ╚████║██████╔╝
-- ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝      ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 

require 'player'
require 'controls'
require 'ground'
camera = require 'camera'
require 'view'
require 'tree'
--require 'maps'
require 'inspect'
require 'y_sort'

function love.load()
    sprites = {}
    cam = camera()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    player = Player()
    AddPlayerToSprites(sprites)
    ground = Ground()
    tree = Tree()
    TreeMap()
    AddTreesToSprites(sprites)
end

function love.update(dt)
    Controls(dt)
    View(cam, player)
    GetPlayerSprite(sprites)
    table.sort(sprites, YSort)
    end

function love.draw()
    cam:attach()
        DrawGround()
        love.graphics.push()
        love.graphics.scale(2, 2)
        for sprite_index, sprite in pairs(sprites) do
            love.graphics.draw(sprite[2], sprite[3], sprite[4])
        end
        love.graphics.pop()
    cam:detach()
end
