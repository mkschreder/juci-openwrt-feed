#!/usr/bin/lua
-- Author: Martin K. Schröder, Copyright 2015

-- iconnect ubus rpc service 
-- allows exposing ubus api to another host through access controlled interface 
-- TODO: right now only a proof of concept. Do not use in production! 

require("ubus");
require("uloop");
local juci = require("juci/core");

uloop.init();

-- this is a quick fix to make sure that when services start simultaneously, this one waits until all others have started
-- TODO: solve this using procd
juci.shell("sleep 2"); 

local conn = ubus.connect();
if conn == nil then
        print("could not connect to ubus socket!");
        return;
end

local iconnect_hub_socket = "/var/run/iconnect.client.sock"; 
local hub = nil; 
-- ubus.connect(iconnect_hub_socket);
-- if hub == nil then
--        print("could not connect to "..iconnect_hub_socket);
--        return;
--end

local clid = juci.shell("openssl x509 -noout -in /etc/stunnel/self-signed-key.pem -fingerprint | sed 's/://g' | cut -f 2 -d '='");
clid = clid:match("%S+");

local function iconnect_access(sid)
	return true; 
end

local function iconnect_login(req, msg)

end

local function iconnect_logout(req, msg)

end

local function iconnect_call(req, msg)
	local res = {}; 
	if(not iconnect_access(msg.sid)) then return 1; end; 
	if(msg.data == nil or type(msg.data) ~= "table") then msg.data = {}; end 

	if(not msg or not msg.object or msg.object == "") then res.error = "No object specified!"; 
	elseif(not msg or not msg.method or msg.method == "") then res.error = "No method specified!"; 
	end
	
	if(not res.error) then 
		local data = conn:call(msg.object, msg.method, msg.data); 
		if(not data) then res.error = "Call Failed!";
		else res = data; end
	end
	hub:reply(req, res); 
end

local function iconnect_list(req, msg)
	local res = {}; 
	if(not iconnect_access(msg.sid)) then return 1; end 
	if(not res.error) then
		local namespaces = conn:objects()
		for i, n in ipairs(namespaces) do
			local signatures = conn:signatures(n)
			res[n] = signatures; 
		end
	end
	hub:reply(req, res); 
	return 0; 
end

-- listen on ubus events locally and forward them onto the hub ubus
-- Important: do not broadcast all events (it will make all setting changes in uci be broadcasted onto the network!)
conn:listen({
	["button*"] = function(ev, kind)
		hub:send(kind, { from = clid, data = ev }); 
	end,
	["network.interface"] = function(ev, kind)
		-- { "hotplug.iface": {"interface":"wan","action":"ifdown"} }
		if(ev.interface == "wan" and ev.action == "ifup") then
			reconnect(); 
		elseif(ev.interface == "wan" and ev.action == "ifdown" and hub) then
			hub:close(); 
			hub = nil; 
		end
	end
}); 

function reconnect()
	hub = ubus.connect(iconnect_hub_socket); 
	if(not hub) then return; end
	-- hub:call(clid, "list", {}); 
	hub:add({
		[clid] = {
			login = { iconnect_login, { username = ubus.STRING, password = ubus.STRING } }, 
			logout = { iconnect_logout, { sid = ubus.STRING } }, 
			call = { iconnect_call, { sid = ubus.STRING, object = ubus.STRING, method = ubus.STRING } }, 
			list = { iconnect_list, { sid = ubus.STRING, object = ubus.STRING } }
		}
	});
end
reconnect(); 

uloop.run();

