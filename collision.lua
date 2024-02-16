function Collision(entity, object)
    if entity.x > object[3] then
        if entity.x + entity.sprite:getWidth() < object[3] + object[2]:getWidth() then

            if entity.moving_up then
                if entity.y + entity.sprite:getHeight() > object[4] + object[2]:getHeight() then
                    if entity.y + entity.sprite:getHeight() < object[4] + object[2]:getHeight() + 10 then
                       entity.can_go_up = false
                    end
                end
            else
                entity.can_go_up = true
            end

            if entity.moving_down then
                if entity.y + entity.sprite:getHeight() < object[4] + object [2]:getHeight() then
                    if entity.y + entity.sprite:getHeight() > object[4] + object[2]:getHeight() - 20 then
                        entity.can_go_down = false
                    end
                end
            else
                entity.can_go_down = true
            end
        end
    end

    if entity.y + entity.sprite:getHeight() < object[4] + object[2]:getHeight() + 10 then
        if entity.y + entity.sprite:getHeight() > object[4] + object[2]:getHeight() - 20 then

            if entity.moving_right then
                if entity.x + entity.sprite:getWidth() > object[3] then
                    if entity.x + entity.sprite:getWidth() < object[3] + object[2]:getWidth() then
                        entity.can_go_right = false
                    end
                end
            else
                entity.can_go_right = true
            end

            if entity.moving_left then
                if entity.x < object[3] + object[2]:getWidth() then
                    if entity.x > object[3] then
                        entity.can_go_left = false
                    end
                end
            else
                entity.can_go_left = true
            end
        end
    end
end
