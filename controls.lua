local redInt_0 = peripheral.wrap("redstoneIntegrator_0")
local redInt_1 = peripheral.wrap("redstoneIntegrator_1")

local function toggle(integrator,side)
    integrator.setOutput(side,true) sleep(0.25) integrator.setOutput(side,false)
end

local function armL(direction)
    if direction == 1 then
        toggle(redInt_1,"right")
    else
        toggle(redInt_1,"front")
    end
end

local function armR(direction)
    if direction == 1 then
        toggle(redInt_0,"left")
    else
        toggle(redInt_0,"front")
    end
end
local function head(direction)
    if direction == 1 then
        toggle(redInt_0,"back")
    else
        toggle(redInt_1,"back")
    end
end

return {armL = armL, armR = armR, head = head}