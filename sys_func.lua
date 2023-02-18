function TableLength(table)
    local length = 0

    for k, v in pairs(table)
    do
        length = length + 1
    end

    return length
end
