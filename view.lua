function View(camera, player)
    local screen_width = love.graphics.getWidth()
    local screen_height = love.graphics.getHeight()
    local map_width = 64 * 100
    local map_height = 64 * 100

    camera:lookAt(player.x * 2, player.y * 2)

    love.graphics.setBackgroundColor(0, 0, 1)

    --if camera.x < screen_width / 2 then
    --    camera.x = screen_width / 2
    --end

    --if camera.y < screen_height / 2 then
    --    camera.y = screen_height / 2
    --end

    --if camera.x > map_width - screen_width / 2 then
    --    camera.x = map_width - screen_width / 2
    --end

    --if camera.y > map_height - screen_height / 2 then
    --    camera.y = map_height - screen_height / 2
    --end
end
