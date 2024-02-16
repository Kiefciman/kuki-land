function Controls(dt, player)
    local x_velocity = 0
    local y_velocity = 0

    if love.keyboard.isDown('right') then
        x_velocity = player.speed * dt
    end

    if love.keyboard.isDown('left') then
        x_velocity = -player.speed * dt
    end

    if love.keyboard.isDown('up') then
        y_velocity = -player.speed * dt
    end

    if love.keyboard.isDown('down') then
        y_velocity = player.speed * dt
    end

    player.body:setLinearVelocity(x_velocity, y_velocity)
    --print(player.body:getLinearVelocity())
end
