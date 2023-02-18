require "sys_func"

function AttackMode()
    -- TODO
end

function DigMode()
    -- TODO
end

function MineMode()
    -- TODO
end

-- Turtle Troop Creator

function TurtleTroopFormation()
    invPlaces = InventoryLookup("computercraft:turtle_advanced")
    for i = 1, sys_func.TableLength(invPlaces), 1
    do
        -- equip turtle and place it. Then activate it.
    end
end

function InventoryLookup(item)
    invPlaces = {}
    tableCpt = 1

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
