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
