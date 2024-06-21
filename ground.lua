require 'settings'
require 'maps'

ground_map = GroundMap()

function Ground()
    ground = {}
    ground.sprite = love.graphics.newImage('assets/ground/grass.png')
    return ground
end

function DrawGround()
    local index = {}

    for row, y in pairs(ground_map) do
        index[y] = row
        for col, x in pairs(y) do
            index[x] = col
            if x == 1 then
                love.graphics.draw(ground.sprite, index[x] * 32 - 32, index[y] * 32 - 32) -- 32 = edge tiles
            end
        end
    end
end
