function Player()
    player = {}
    player.x = 0
    player.y = 300
    player.speed = 100
    player.sprite = love.graphics.newImage('assets/player/idle_down/0.png')
    player.moving_up = false
    player.moving_down = false
    player.moving_left = false
    player.moving_right = false
    return player
end

function AddPlayerToSprites(sprites)
    sprites[1] = {}
    sprites[1][1] = 'player'
    sprites[1][2] = player.sprite
    sprites[1][3] = player.x
    sprites[1][4] = player.y
end

function GetPlayerSprite(sprites)
    for sprite_index, sprite in pairs(sprites) do
        if sprite[1] == 'player' then
            sprite[3] = player.x
            sprite[4] = player.y
        end
    end
end
