-- Peripherals
local redInt_0 = peripheral.wrap("redstoneIntegrator_0")
local redInt_1 = peripheral.wrap("redstoneIntegrator_1")
local reader = peripheral.find("blockReader")

local url = ""

-- Quickly toggles a redstone integrator
local function toggle(integrator,side)
    integrator.setOutput(side,true) sleep(0.25) integrator.setOutput(side,false)
end

-- Moves the Totem God's left arm
local function body_armL(direction)
    if direction == 1 then
        toggle(redInt_1,"right")
    else
        toggle(redInt_1,"front")
    end
end

-- Moves the Totem God's right arm
local function body_armR(direction)
    if direction == 1 then
        toggle(redInt_0,"left")
    else
        toggle(redInt_0,"front")
    end
end
-- Moves the Totem God's head
local function body_head(direction)
    if direction == 1 then
        toggle(redInt_0,"back")
    else
        toggle(redInt_1,"back")
    end
end

-- Gets the text of the book in the first slot of the storage provided by the blockReader peripheral
local function getText(page)
    page = tonumber(page)
    local data = reader.getBlockData()
    if type(data.Items[0]) ~= "nil" then
        if type(data.Items[0].tag) ~= "nil" then
            if type(data.Items[0].tag.pages[page]) ~= "nil" then
                local text = data.Items[0].tag.pages[page]
                return text
            end
        end
    end
    return nil
end

return {url = url, body_armL = body_armL, body_armR = body_armR, body_head = body_head, getText = getText}