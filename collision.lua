function Collision(entity, object)
    if entity.moving_up then
        if entity.x > object[3] then
            if entity.x + entity.sprite:getWidth() < object[3] + object[2]:getWidth() then
                if entity.y + entity.sprite:getHeight() > object[4] + object[2]:getHeight() then
                    if entity.y + entity.sprite:getHeight() < object[4] + object[2]:getHeight() + 10 then
                       entity.y = object[4] + object[2]:getHeight() / 2 + entity.sprite:getHeight() / 1.5
                    end
                end
            end
        end
    end
end
