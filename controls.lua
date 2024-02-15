function Controls(dt)
    if love.keyboard.isDown('right')
    then
        player.x = player.x + player.speed * dt
        player.moving_right = true
    else
        player.moving_right = false
    end

    if love.keyboard.isDown('left')
    then
        player.x = player.x - player.speed * dt
        player.moving_left = true
    else
        player.moving_left = false
    end

    if love.keyboard.isDown('up')
    then
        player.y = player.y - player.speed * dt
        player.moving_up = true
    else
        player.moving_up = false
    end

    if love.keyboard.isDown('down')
    then
        player.y = player.y + player.speed * dt
        player.moving_down = true
    else
        player.moving_down = false
    end
end
