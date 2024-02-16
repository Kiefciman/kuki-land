inspect = require 'inspect'

map_size = 100

function TreeMap()
    tree_map = {}
    math.randomseed(os.time())

    for y = 1, map_size + 1 do
        row = {}
        table.insert(tree_map, row)
        for x = 1, map_size + 1 do
            local probability = math.floor(math.random() * 100)
            if probability > 95 then
                table.insert(row, 1)
            else
                table.insert(row, 0)
            end
        end
    end

    --print(inspect(tree_map))
    return tree_map
end
