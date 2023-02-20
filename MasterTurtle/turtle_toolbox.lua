-- region Turtle Modes
function AttackMode()
    local pos = InventoryLookup("minecraft:diamond_sword")
    if (#pos ~= 0) then
        assert(turtle.select(pos[1]))
        assert(turtle.equipRight())
    end
end

function DigMode()
    local pos = InventoryLookup("minecraft:diamond_shovel")
    if (#pos ~= 0) then
        assert(turtle.select(pos[1]))
        assert(turtle.equipRight())
    end
end

function MineMode()
    local pos = InventoryLookup("minecraft:diamond_pickaxe")
    if (#pos ~= 0) then
        assert(turtle.select(pos[1]))
        assert(turtle.equipRight())
    end
end

function HostileMode()
    AttackMode()
    while (true)
    do
        turtle.attack()
        turtle.attackDown()
        turtle.attackUp()
        turtle.turnLeft()
    end
end

-- endregion

-- region Turtle methods
function HeadToCoord(coord)
    local currentPos = gps.locate()
    -- Equip Modem on Left side if not already equiped
    local modemPos = InventoryLookup("computercraft:ender_modem")
    if (#modemPos ~= 0) then
        assert(turtle.select(pos[1]), "HeadToCoord : Could not select pos[1]")
        assert(turtle.equipLeft(), "HeadToCoord : Could not equipLeft")
    end

    -- Take off to avoid trees and obstacles
    for i = 1, 50, 1
    do
        turtle.up()
    end

    print(gps.locate())

    -- Need to proceed distance between current coords and targeted coords.
end

function ProceedDistance2D(x, y)
    return math.sqrt(math.pow((x[2] - x[1]), 2) + math.pow((y[2] - y[1]), 2))
end

-- endregion


-- region Sys Turtle functions
function InventoryLookup(item)
    local invPlaces = {}
    local tableCpt = 1

    -- 16 is max inv index
    for i = 1, 16, 1
    do
        if (turtle.getItemDetail(i) ~= nil and turtle.getItemDetail(i)["name"] == item) then
            invPlaces[tableCpt] = i
            tableCpt = tableCpt + 1
        end
    end

    return invPlaces
end

-- endregion
