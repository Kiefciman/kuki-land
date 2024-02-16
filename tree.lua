require 'maps'
require 'inspect'

function Tree(world)
    tree = {}
    tree.sprite = love.graphics.newImage('assets/enviorement/trees/1.png')
    tree_map = TreeMap()
    tree.body = love.physics.newBody(world, tree.x, tree.y, 'static')
    tree.body:setFixedRotation(true)
    tree.shape = love.physics.newRectangleShape(tree.sprite:getWidth() / 4, tree.sprite:getHeight() / 5)
    tree.fixture = love.physics.newFixture(tree.body, tree.shape, 1)
    return tree
end

function TreePositions()
    local index = {}
    local tree_positions = {}
    for row, y in pairs(tree_map) do
        index[y] = row
        for col, x in pairs(y) do
            index[x] = col
            if x == 1 then
                position = {}
                position[1] = index[x]
                position[2] = index[y]
                table.insert(tree_positions, position)
            end
        end
    end
    return tree_positions
end

function AddTreesToSprites(sprites, world)
    local id_no = 1
    for _, position in pairs(TreePositions()) do
        tree = Tree(world)
        tree.body:setX(position[1] * 32)
        tree.body:setY(position[2] * 32)
        tree.x = tree.body:getX() - tree.sprite:getWidth() / 2
        tree.y = tree.body:getY() - tree.sprite:getHeight() + tree.sprite:getHeight() / 8
        tree_sprite = {}
        tree_sprite[1] = 'tree'
        tree_sprite[2] = tree.sprite
        tree_sprite[3] = tree.x
        tree_sprite[4] = tree.y
        tree_sprite[5] = tree.body
        tree_sprite[6] = tree.shape
        tree.body:setUserData(id_no)
        tree_sprite[7] = tree.body:getUserData()
        table.insert(sprites, tree_sprite)
        id_no = id_no + 1
    end
end

--function UpdateTreeSprite(sprites, fixture)
--    for _, sprite in pairs(sprites) do
--        if sprite[1] == 'tree' then
--            if sprite[7] == fixture:getBody():getUserData() then
--                sprite[3] = fixture:getBody():getX()
--                sprite[4] = fixture:getBody():getY()
--                sprite[5] = tree.body
--                sprite[6] = tree.shape
--            end
--        end
--    end
--end

function UpdateTrees()
    tree.x = tree.body:getX() - tree.sprite:getWidth() / 2
    tree.y = tree.body:getY() - tree.sprite:getHeight() / 2
    tree.body:setLinearVelocity(0, 0)
end
