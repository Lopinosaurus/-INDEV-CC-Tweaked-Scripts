function string:startswith(start)
    return self:sub(1, #start) == start
end
