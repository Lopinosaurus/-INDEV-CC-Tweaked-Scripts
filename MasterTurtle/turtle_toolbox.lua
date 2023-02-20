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

function FellMode()
    local pos = InventoryLookup("minecraft:diamond_axe")
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
    -- Index of packed table starts from 0
    local currentPos = table.pack(gps.locate)
    -- Equip Modem on Left side if not already equiped
    local modemPos = InventoryLookup("computercraft:ender_modem")
    if (#modemPos ~= 0) then
        assert(turtle.select(pos[1]), "HeadToCoord : Could not select pos[1]")
        assert(turtle.equipLeft(), "HeadToCoord : Could not equipLeft")
    end

    -- Take off to avoid trees and obstacles
    for i = 1, 50, 1
    do
        ClearUpTurtle()
        turtle.up()
    end

    local curTableCoord = table.pack(gps.locate())
    local currentDistance = ProceedDistance2D(curTableCoord, coord)

    while (currentDistance > 1)
    do
        turtle.forward()
        curTableCoord = table.pack(gps.locate())
        currentDistance = ProceedDistance2D(curTableCoord, coord)
        
        if (curTableCoord[0] )
    end

    while (not turtle.detectDown)
    do
        turtle.down()
    end

    -- Need to proceed distance between current coords and targeted coords.
end

function ProceedDistance2D(a, b)
    return math.sqrt(math.pow((b[1] - a[1]), 2) + math.pow((b[2] - a[2]), 2))
end

function ClearUpTurtle()
    if (turtle.detectUp()) then
        MineMode()
        turtle.digUp()
    end
end

function GetOrientation()
    local stonePos = InventoryLookup("minecraft:cobblestone")
    local torchPos = InventoryLookup("minecraft:torch")

    turtle.back()
    if (#stonePos ~= 0) then
         turtle.select(stonePos[1])
        assert(turtle.place())
    end
    turtle.back()
    if (#torchPos ~= 0) then 
        turtle.select(torchPos[1]) 
        assert(turtle.place())
    end

    local properties = table.pack(turtle.inspect())
    for i = 1, #properties[2], 1 
    do
        print(properties[2][i])
    end 
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
