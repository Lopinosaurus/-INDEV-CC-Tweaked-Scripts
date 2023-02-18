-- Thread used to continually refuel the turtle

while (true)
do
    if (assert(turtle.getFuelLevel()) == 0) then
        assert(turtle.refuel())
    end
end
