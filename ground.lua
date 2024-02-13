function Ground()
    ground = {}
    ground.sprite = love.graphics.newImage('assets/ground/grass.png')
    return ground
end

function DrawGround()
    for y = 0, 100 do
        for x = 0, 100 do
            love.graphics.push()
            love.graphics.scale(2, 2)
            love.graphics.draw(ground.sprite, x * 32, y * 32)
            love.graphics.pop()
        end
    end
end
