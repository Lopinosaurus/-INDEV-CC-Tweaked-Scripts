require "sys_func"

-- Will always equipRight because Left is used by Wireless modem
function AttackMode()
    local pos = InventoryLookup("minecraft:diamond_sword")
    assert(turtle.select(pos[1]))
    assert(turtle.equipRight())
end

function DigMode()
    local pos = InventoryLookup("minecraft:diamond_shovel")
    assert(turtle.select(pos[1]))
    assert(turtle.equipRight())
end

function MineMode()
    local pos = InventoryLookup("minecraft:diamond_pickaxe")
    assert(turtle.select(pos[1]))
    assert(turtle.equipRight())
end

function HostileMode()
    AttackMode()
    while (true)
    do
        assert(turtle.attack())
        assert(turtle.attackDown())
        assert(turtle.attackUp())
        assert(turtle.turnLeft())
    end
end

function Display()
    -- TODO
end

function InventoryLookup(item)
    local invPlaces = {}
    local tableCpt = 1

    -- 16 is max inv index
    for i = 1, 16, 1
    do
        if (assert(turtle.getItemDetail(1)["name"] == item)) then
            invPlaces[tableCpt] = i
            tableCpt = tableCpt + 1
        end
    end

    return invPlaces
end
