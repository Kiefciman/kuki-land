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
--require 'collision'
require 'display'

function love.load()
    world = love.physics.newWorld(0, 0, true)
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)
    sprites = {}
    cam = camera()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    player = Player(world)
    AddPlayerToSprites(sprites)
    ground = Ground()
    --tree = Tree(world)
    TreeMap()
    AddTreesToSprites(sprites, world)
    --fixYSort(sprites)
end

function love.update(dt)
    Controls(dt, player)
    View(cam, player)
    UpdatePlayerSprite(sprites)
    --UpdateTreeSprite(sprites)
    --table.sort(sprites, YSort)
    YSort(sprites, 'y', 'id')
    world:update(dt)
    UpdatePlayer()
    --UpdateTrees()
end

function love.draw()
    cam:attach()
        DrawGround()
        love.graphics.push()
        love.graphics.scale(2, 2)
        for _, sprite in pairs(sprites) do
            love.graphics.draw(sprite.sprite, sprite.x, sprite.y)
            --love.graphics.polygon('line', sprite[5]:getWorldPoints(sprite[6]:getPoints()))
        end
        love.graphics.pop()
    cam:detach()
end

function beginContact(a, b, collision)
    --local x, y = collision:getNormal()
    --print(x, y, a:getBody():getUserData(), b:getBody():getUserData())
end

function endContact()
    
end

function preSolve()
    
end

function postSolve()
    
end
