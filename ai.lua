local url, text = ...
local file = fs.open("text","r")
text = file.readAll()
local player = peripheral.wrap("left")
local chat = peripheral.wrap("top")
if chat == nil then
    error("no chatbox detected")
end
if player == nil then
    error("no player detector detected")
end

print(text)
local in_range = false
while not in_range do
    in_range = player.isPlayersInRange(15)
end
local body = textutils.serialiseJSON({prompt = text})
print("URL Valid: "..tostring(http.checkURL(url)))
if http.checkURL(url) then
    local headers = {["Content-Type"] = 'application/json'}
    local file,err = http.post(url,body,headers,false)
    print(err)
    local data = file.readAll()
    local suc, res = pcall(textutils.unserialiseJSON,data)
    if suc then
        chat.sendMessage(res.message,"Scourage of Water","<>","",15)
    else
        print(data)
    end
end