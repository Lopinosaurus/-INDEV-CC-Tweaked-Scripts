-- Modem API

function Connect()
    -- Finding modem
    local modem = peripheral.find("modem") or error("Main.Connect : No modem found.", 0)
    modem.open(43)
end
