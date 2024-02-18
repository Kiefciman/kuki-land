function YSort(sprites, y, id)
    table.sort(sprites, function(sprite1, sprite2)
        return
            sprite1[y] + sprite1.sprite:getHeight() < sprite2[y] + sprite2.sprite:getHeight() or
            (sprite1[y] + sprite1.sprite:getHeight() == sprite2[y] + sprite2.sprite:getHeight() and
                sprite1[id] < sprite2[id])
    end)
end
