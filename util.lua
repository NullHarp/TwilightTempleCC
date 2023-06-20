local redInt_0 = peripheral.wrap("redstoneIntegrator_0")
local redInt_1 = peripheral.wrap("redstoneIntegrator_1")
local reader = peripheral.find("blockReader")

local function toggle(integrator,side)
    integrator.setOutput(side,true) sleep(0.25) integrator.setOutput(side,false)
end

local function body_armL(direction)
    if direction == 1 then
        toggle(redInt_1,"right")
    else
        toggle(redInt_1,"front")
    end
end

local function body_armR(direction)
    if direction == 1 then
        toggle(redInt_0,"left")
    else
        toggle(redInt_0,"front")
    end
end
local function body_head(direction)
    if direction == 1 then
        toggle(redInt_0,"back")
    else
        toggle(redInt_1,"back")
    end
end

local function getText(page)
    page = tonumber(page)
    local data = reader.getBlockData()
    if type(data.Items[0]) ~= "nil" then
        if type(data.Items[0].tag) ~= "nil" then
            if type(data.Items[0].tag.pages[page]) ~= "nil" then
                local text = data.Items[0].tag.pages[page]
                return text
            else return nil end
        else return nil end
    else return nil end
end


return {body_armL = body_armL, body_armR = body_armR, body_head = body_head, getText = getText}