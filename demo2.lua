local pretty = require "cc.pretty"
local util = require("util")
local monitor = peripheral.wrap("monitor_2")
local url = util.url
--local msg = ...

local msg = util.getText(0)
while type(msg) == "nil" do
    msg = util.getText(0)
    sleep(0.25)
end
local tbl = {message = msg}

local body = textutils.serialiseJSON(tbl)
local header = {["content-type"] = "application/json"}
local handle = http.post(url,body,header)
local data = handle.readAll()
local msg = textutils.unserialiseJSON(data).answer 
term.redirect(monitor)
monitor.clear()
monitor.setCursorPos(1,1)
print(msg)