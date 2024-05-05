local maxHealth = 5
local health = maxHealth

local arg = ...


local function bossbarCommand(command)
    commands.exec("bossbar set minecraft:boss "..command)
end

local function addHealth(amount)
    if health+amount <= maxHealth then
        health = health+amount
    else
        health = maxHealth
    end
    bossbarCommand("value "..health)
end

local function subHealth(amount)
    if health-amount >= 0 then
        health = health-amount
    else
        health = 0
    end
    bossbarCommand("value "..health)
end

bossbarCommand("max "..maxHealth)
bossbarCommand("value "..maxHealth)
while true do
    local input = read()
    if string.find(input,"add") then
        local num = string.match(input,"%d+")
        if type(num) == "nil" then
            num = 1
        end
        addHealth(num)
    elseif string.find(input,"sub") then
        local num = string.match(input,"%d+")
        if type(num) == "nil" then
            num = 1
        end
        subHealth(num)
    elseif string.find(input,"max") then
        local num = string.match(input,"%d+")
        if type(num) == "nil" then
            num = 1
        end
        maxHealth = tonumber(num)
        health = maxHealth
        bossbarCommand("max "..maxHealth)
        bossbarCommand("value "..maxHealth)
    end
end
