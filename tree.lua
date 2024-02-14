require 'maps'
require 'inspect'

function Tree()
    tree = {}
    tree.sprite = love.graphics.newImage('assets/enviorement/trees/1.png')
    tree_map = TreeMap()
    --print(inspect(tree_map))
    return tree
end

function DrawTrees()
    local index = {}
    local trees = {}
    for row, y in pairs(tree_map) do
        index[y] = row
        for col, x in pairs(y) do
            index[x] = col
            if x == 1 then
                tree_to_draw = {}
                tree_to_draw[1] = tree.sprite
                tree_to_draw[2] = index[x] * 32
                tree_to_draw[3] = index[y] * 32
                table.insert(trees, tree_to_draw)
            end
        end
    end
    return trees
end

function AddTreesToSprites(sprites)
    for treeindex, tree in pairs(DrawTrees()) do
        tree_sprite = {}
        tree_sprite[1] = 'tree'
        tree_sprite[2] = tree[1]
        tree_sprite[3] = tree[2]
        tree_sprite[4] = tree[3]
        table.insert(sprites, tree_sprite)
    end
end
