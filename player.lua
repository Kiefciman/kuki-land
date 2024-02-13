function Player()
    player = {}
    player.x = 0
    player.y = 300
    player.speed = 100
    player.sprite = love.graphics.newImage('assets/player/idle_down/0.png')
    return player
end

function DrawPlayer()
    love.graphics.push()
    love.graphics.scale(2, 2)
    love.graphics.draw(player.sprite, player.x, player.y)
    love.graphics.pop()
end
