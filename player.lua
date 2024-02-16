require 'inspect'

function Player(world)
    player = {}
    player.x = 0
    player.y = 300
    player.speed = 6000
    player.sprite = love.graphics.newImage('assets/player/idle_down/0.png')
    player.moving_up = false
    player.moving_down = false
    player.moving_left = false
    player.moving_right = false
    player.can_go_up = true
    player.can_go_down = true
    player.can_go_right = true
    player.can_go_left = true
    player.body = love.physics.newBody(world, player.x, player.y, 'dynamic')
    player.body:setFixedRotation(true)
    player.shape = love.physics.newRectangleShape(player.sprite:getWidth() / 3, player.sprite:getHeight() / 4)
    player.fixture = love.physics.newFixture(player.body, player.shape, 1)
    player.id = 0
    return player
end

function AddPlayerToSprites(sprites)
    sprites[1] = {}
    sprites[1][1] = 'player'
    sprites[1][2] = player.sprite
    sprites[1][3] = player.x
    sprites[1][4] = player.y
end

function UpdatePlayerSprite(sprites)
    for _, sprite in pairs(sprites) do
        if sprite[1] == 'player' then
            sprite[3] = player.x
            sprite[4] = player.y
            sprite[5] = player.body
            sprite[6] = player.shape
        end
    end
end

function UpdatePlayer()
    player.x = player.body:getX() - player.sprite:getWidth() / 2
    player.y = player.body:getY() - player.sprite:getHeight() + player.sprite:getHeight() / 6
    player.body:setLinearVelocity(0, 0)
end
