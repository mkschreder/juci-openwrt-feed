#!/usr/bin/lua
-- Example client that publishes to the same socket as the one exposed by server
-- normally this should not be done because it allows any connected client to 
-- easily see and manipulate all other clients. This is just a proof of concept!

require("ubus"); 
require("uloop"); 

-- connection to local ubus
local conn = ubus.connect(); 
if(conn == nil) then
	print("could not connect to ubus"); 
end

local export = ubus.connect("/var/run/iconnect.client.socket"); 
if(export == nil) then
	print("could not connect to ubus client socket!"); 
end

export:add({
	["/routers/my_router"] = {
		info = {
			function(req, msg)
				local i = conn:call("router", "info", {}); 
				export:reply(req, i); 
			end, {}
		}
	}
}); 

uloop.run(); 
