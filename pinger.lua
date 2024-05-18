local url = ... 

local data
local isError = true
if http.checkURL(url) then
    print("Url found")

    local a,b,c = http.get(url)
    if type(a) ~= "nil" then
        isError = false
        a = a.readAll()
        fail,data = pcall(textutils.unserialiseJSON,a)
    else
        isError = true
        print(b)
        if type(c) ~= "nil" then
            local suc, res = pcall(textutils.unserialiseJSON,c)
            if suc == true then
                for i,v in pairs(res) do
                    print(i.." "..v)
                end
            else
                print(data)
            end
        end
    end

    if isError == false then
        if type(data) == "table" then
            for i,v in pairs(data) do
                print(i.." "..v) 
            end
        else
            print(v)
        end
    end
end