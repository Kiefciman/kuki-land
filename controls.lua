function Controls(dt)
    if love.keyboard.isDown('right')
    then
        player.x = player.x + player.speed * dt
    end
    if love.keyboard.isDown('left')
    then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown('up')
    then
        player.y = player.y - player.speed * dt
    end
    if love.keyboard.isDown('down')
    then
        player.y = player.y + player.speed * dt
    end
end
