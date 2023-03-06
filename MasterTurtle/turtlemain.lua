require "turtle_toolbox"

local modem = peripheral.find("modem") or error("No modem attached !", 0)
modem.open(0)

while true
do
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")

    -- Case message == "1"
    if string.byte(tostring(message)) == 49 then
        turtle.forward()
    end
end
