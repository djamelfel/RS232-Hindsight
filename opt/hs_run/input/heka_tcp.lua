local write = require "io".write

local host, port = "192.168.2.4", 8125
local socket = require("socket")

local udp = socket.try(socket.udp())
udp:setsockname(host, port)
udp:settimeout()

function process_message()
   while true do
	data, ip, port = udp:receivefrom()
        if data then
	     inject_message({
		Type = "hello",
		Payload = data
	     })
        end
   end
end
