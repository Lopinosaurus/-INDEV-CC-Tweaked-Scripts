-- Modem API

local modem = peripheral.find("modem") or error("No modem attached !", 0)


function Display()
    io.write("Welcome to TurtleMaster Menu. \n")
    io.write("To send the turtle to special coordinates, type 1. \n")
    io.write("To send the turtle on your position, type 2. \n")

    while true do
        local input = io.read()

        if ("1" == input) then
            io.write("X Coord : ")
            local xCoord = io.read()
            io.write("Z Coord : ")
            local zCoord = io.read()
            -- Send user input to turtle
            modem.transmit(0, 43, ("%s %s %s"):format(input, xCoord, zCoord))
        end

        io.write("Command sent. \n")
        io.write("You can send your next command : \n")
        io.write("Type 1 to send turtle to special coordinates. \n")
        io.write("Type 2 to send turtle to your current position. \n")
    end
end

Display()
