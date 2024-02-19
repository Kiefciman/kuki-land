inspect = require 'inspect'
require 'settings'

function TreeMap()
    math.randomseed(os.time())
    tree_map = {}

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

    --local index = {}
    --for y, row in pairs(tree_map) do
    --    index[row] = y
    --    for x1, col1 in pairs(row) do
    --        index[col1] = x1
    --        for x2, col2 in pairs(row) do
    --            index[col2] = x2 -1
    --            if col1 == 1 then
    --                if col2 == 1 then
    --                    --print(tree_map[index[row]][index[col1]], tree_map[index[row]][index[col2]])
    --                    tree_map[index[row]][index[col2]] = 2
    --                end
    --            end
    --        end
    --    end
    --end

    --print(inspect(tree_map))
    return tree_map
end
