inspect = require 'lib/inspect'
require 'settings'

function TreeMap()
    math.randomseed(os.time())
    tree_map = {}

    for y = 1, map_size / 3 do
        local row = {}
        table.insert(tree_map, row)
        for x = 1, map_size do
            table.insert(row, 0)
        end
    end

    for y = 1, map_size / 3 do
        local row = {}
        table.insert(tree_map, row)
        for x = 1, map_size / 3 do
            table.insert(row, 0)
        end
        for x = 1, map_size / 3 do
            local probability = math.floor(math.random() * 100)
            if probability > 95 then
                table.insert(row, 1)
            else
                table.insert(row, 0)
            end
        end
        for x = 1, map_size / 3 do
            table.insert(row, 0)
        end
    end

    for y = 1, map_size / 3 do
        local row = {}
        table.insert(tree_map, row)
        for x = 1, map_size do
            table.insert(row, 0)
        end
    end

    return tree_map
end

function GroundMap()
    math.randomseed(os.time())
    ground_map = {}

    function GroundEdgeLR(row) -- LR - left/right
        local probability = math.floor(math.random() * 100)
        local a = 50

        if probability > a then
            table.insert(row, 1)
        else
            table.insert(row, 0)
        end
    end

    function GroundEdgeUD(map_size) --UD - up/down
        local a = 50
        local row = {}

        for x = 1, map_size + 2 do
            local probability = math.floor(math.random() * 100)

            if probability > a then
                table.insert(row, 1)
            else
                table.insert(row, 0)
            end
        end

        table.insert(ground_map, row)
    end

    GroundEdgeUD(map_size)

    for y = 1, map_size do
        local row = {}
        table.insert(ground_map, row)

        GroundEdgeLR(row)

        for x = 1, map_size do
            table.insert(row, 1) -- HERE set to 1
        end

        GroundEdgeLR(row)
    end

    GroundEdgeUD(map_size)

    return ground_map
end
