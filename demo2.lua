local util = require("util")

local msg = util.getText(0)
while type(msg) == "nil" do
    msg = util.getText(0)
    sleep(0.25)
end
local pretty = require "cc.pretty"
local tbl = {message = msg}

local body = textutils.serialiseJSON(tbl)
local header = {["content-type"] = "application/json"}
local handle = http.post("https://d8f3-2603-9000-8710-1400-a488-ba3c-e2cf-6576.ngrok.io/oracle",body,header)
local data = handle.readAll()
local msg = textutils.unserialiseJSON(data).message
print(msg)