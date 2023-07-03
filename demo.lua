local util = require("util")
local comp = false
local url = util.url
while comp == false do
    local text = util.getText(0)
    if type(text) ~= "nil" then
        local ws = assert(http.websocket("wss://0e11-2603-9000-8710-1400-d48-256b-2b41-77d5.ngrok-free.app/echo"))
        ws.send(text) -- Send a message
        local handle = ws.receive()
        local file = fs.open("voice.pcm","wb")
        file.write(handle)
        file.close()
        ws.close()
        shell.run("austream voice.pcm")
        comp = true
    end
    sleep(0.0)    
end
