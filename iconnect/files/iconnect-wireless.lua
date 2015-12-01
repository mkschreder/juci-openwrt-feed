#!/usr/bin/lua

require("ubus");
require("uloop");
local juci = require("juci/core");

uloop.init();

local conn = ubus.connect();
if conn == nil then
        print("could not connect to ubus socket!");
        return;
end

local iconnect_hub_socket = "/var/run/iconnect.client.sock"; 
local hub = ubus.connect(iconnect_hub_socket);
if hub == nil then
        print("could not connect to "..iconnect_hub_socket);
        return;
end

local clid = juci.shell("openssl x509 -noout -in /etc/stunnel/client-cert.pem -fingerprint | sed 's/://g' | cut -f 2 -d '='");
clid = clid:match("%S+");

hub:add({
        [clid.."/wireless"] = {
				configure = {
					function(req, msg)
						local res = {}; 
						if(msg.ssid) then juci.shell("echo 'Settings ssid to "..msg.ssid.."' > /dev/console"); end
						hub:reply(req, res); 
				end, { param = ubus.STRING }}, 
                test = { function (req, msg)
                        hub:reply(req, { foo = "bar" });
                end, { param = ubus.STRING }}
        }
});

uloop.run();

