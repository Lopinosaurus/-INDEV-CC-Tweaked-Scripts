-- Modem API

function Display()
    io.write("Welcome to TurtleMaster Menu.")
    io.write("To send the turtle to special coordinates, type 1.")
    io.write("To send the turtle on your position, type 2.")

    local input = io.read()

    if ("1" == input) then
        io.write("X Coord : ")
        local xCoord = io.read()
        io.write("Z Coord : ")
        local zCoord = io.read()

        local tableCoord = { tonumber(xCoord), 0, tonumber(zCoord) }
        HeadToCoord(tableCoord)
    end
end

Display()
