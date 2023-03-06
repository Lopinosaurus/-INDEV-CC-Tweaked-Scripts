require "turtle_toolbox"

local modem = peripheral.find("modem") or error("No modem attached !", 0)
modem.open(0)

while true
do
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")

    -- Case message == "1"
    local msg = tostring(message)
    -- Message starts with "1"
    if msg:sub(1, 1) == "1" then
        local strX = ""
        local strZ = ""
        -- current = 1 --> x, current = 2 --> z

        local current = 1
        -- Starts at 3 because [1] = 1, [2] == ' ', [3] = first coord
        for i = 3, #msg
        do
            local char = msg:sub(i, i)
            if char ~= " " and current == 1 then
                strX = strX .. char
            end
            if char ~= " " and current == 2 then
                strZ = strZ .. char
            end
            if char == " " then
                current = current + 1
            end
        end

        destCoords = {}
        destCoords[1] = tonumber(strX)
        destCoords[2] = 0 -- don't care because will be overwritten
        destCoords[3] = tonumber(strZ)
        HeadToCoord(destCoords)
    end
end
