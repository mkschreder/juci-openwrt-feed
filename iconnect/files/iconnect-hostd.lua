#!/usr/bin/lua
-- Author: Martin K. Schröder, Copyright 2015

-- iconnect ubus host service 
-- provides a host ubus interface for listing and working with clients (separate from slave shared ubus context)
-- TODO: right now only a proof of concept. Do not use in production! 

require("ubus");
require("uloop");
local juci = require("juci/core");

uloop.init();

local conn = ubus.connect();
if conn == nil then
        print("could not connect to ubus socket!");
        return;
end

local iconnect_hub_socket = "/var/run/iconnect.hub.sock"; 
local hub = ubus.connect(iconnect_hub_socket);
if hub == nil then
        print("could not connect to "..iconnect_hub_socket);
        return;
end

local function forward_call(method, req, msg)
	local res = {}; 
	if(msg.host and msg.host ~= "") then
		local host = msg.host; 
		msg.host = nil; 
		local data = hub:call(host, method, msg); 
		if(data) then res = data; end
	end
	conn:reply(req, res); 
	return 0; 
end

local function iconnect_clients(req, msg)
	local res = { clients = {} }; 
	local namespaces = hub:objects()
	for i, n in ipairs(namespaces) do
		table.insert(res.clients, { id = n }); 
	end
	conn:reply(req, res); 
	return 0; 
end

hub:listen({
	["*"] = function(ev, kind)
		conn:send("iconnect.hubevent", { type = kind, event = ev });
	end
});

conn:add({
	iconnect = {
		login = { function(req, msg) return forward_call("login", req, msg); end, { host = ubus.STRING, username = ubus.STRING, password = ubus.STRING } }, 
		logout = { function(req, msg) return forward_call("logout", req, msg); end, { host = ubus.STRING, sid = ubus.STRING } }, 
		call = { function(req, msg) return forward_call("call", req, msg); end, { host = ubus.STRING, sid = ubus.STRING, object = ubus.STRING, method = ubus.STRING } }, 
		list = { function(req, msg) return forward_call("list", req, msg); end, { host = ubus.STRING, sid = ubus.STRING, object = ubus.STRING } }, 
		clients = { iconnect_clients, {} }
	}, 
	["sysupgrade.example"] = {
		upgrade = { function(req, msg) 
			juci.shell("online-upgrade&"); 
			conn:reply(req, {}); 
		end, {}}
	}
});

uloop.run();
