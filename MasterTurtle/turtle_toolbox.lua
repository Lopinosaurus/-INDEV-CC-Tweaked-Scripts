-- Will always equipRight because Left is used by Wireless modem
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

function HeadToCoord(coord)
    local currentPos = gps.locate()
    -- Equip Modem on Left side if not already equiped
    local modemPos = InventoryLookup("computercraft:ender_modem")
    if (#modemPos ~= 0) then
        assert(turtle.select(pos[1]))
        assert(turtle.equipLeft())
    end

    -- Take off to avoid trees and obstacles
    for i = 1, 50, 1
    do
        assert(turtle.up)
    end

    -- Need to proceed distance between current coords and targeted coords.
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
