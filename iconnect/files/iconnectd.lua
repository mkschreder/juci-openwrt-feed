#!/usr/bin/lua

require("ubus"); 
require("uloop"); 

local iconnect_hub_socket = "/var/run/iconnect.hub.socket"
local iconnect_client_socket = "/var/run/iconnect.client.socket"

uloop.init(); 

local conn = ubus.connect(); 
if conn == nil then
	print("could not connect to ubus socket!"); 
	return; 
end
local hub = ubus.connect(iconnect_hub_socket); 
if hub == nil then 
	print("could not connect to "..iconnect_hub_socket); 
	return; 
end

function configure()
	conn:call("uci", "add", { config = "stunnel", name = "iconnect_client", type = "tunnel" }); 
	conn:call("uci", "add", { config = "stunnel", name = "iconnect_service", type = "tunnel" }); 
	conn:call("uci", "commit", { config = "stunnel" }); 
end

function find_router_ip()
	local dump = conn:call("network.interface", "dump", {}); 
	if(dump == nil) then 
		print("could not dump interface information"); 
		return; 
	end
	for _,iface in ipairs(dump.interface) do 
		if(iface.route) then
			for _,route in ipairs(iface.route) do 
				if(route.target == "0.0.0.0") then
					return route.nexthop; 
				end
			end
		end
	end
	return nil; 
end

configure(); 
local reconf_timer = nil; 
local prev_router_ip = nil; 
function reconfigure()
	local router_ip = find_router_ip()
	if(router_ip and router_ip ~= prev_router_ip) then
		conn:call("uci", "set", { config = "stunnel", section = "iconnect_client", values = { 
			client = "yes", 
			accept = iconnect_client_socket, 
			connect = router_ip..":5555",
			cert = "/etc/stunnel/stunnel.pem",
			CAfile = "/etc/stunnel/stunnel.pem"
		}}); 
		conn:call("uci", "set", { config = "stunnel", section = "iconnect_service", values = { 
			accept = "5555", 
			connect = iconnect_hub_socket,
			cert = "/etc/stunnel/stunnel.pem"
		}}); 
		conn:call("uci", "commit", { config = "stunnel" }); 
		prev_router_ip = router_ip; 
	end
	reconf_timer:set(10000); 
end
reconf_timer = uloop.timer(reconfigure); 
reconf_timer:set(0); 

hub:add({
	["iconnect"] = {
		test = { function (req, msg)
			hub:reply(req, { foo = "bar" }); 
		end, { param = ubus.STRING }}
	}
}); 

uloop.run(); 

