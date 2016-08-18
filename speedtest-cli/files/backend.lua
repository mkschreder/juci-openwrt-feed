local core = require("orange/core"); 

local function speedtest_start(opts) 
	local status = core.shell("speedtest start"); 
	local result = {}; 
	if (status == "" or status == nil) then
		result["status"] = "Could not start speedtest!"; 
	else 
		result["status"] = status; 
	end
	return result; 
end

local function speedtest_status(opts)
	local status = core.shell("speedtest status"); 
	local time = core.shell("date '+%s'", "%s"); 
	local result = {}; 
	if( not status or status == "" ) then 
		result["status"] = "Could not retreive speedtest status!"; 
	end
	for line in status:gmatch("[^\r\n]+") do
		local key, value = line:match("(%S+)%s+(%S+)"); 
		if( key == "timestamp" ) then 
			value = tonumber(value); 
			result["age"] = tonumber(time) - value; 
		end
		result[key:lower()] = value; 
	end

	return result; 
end

local function speedtest_stop(opts)
	local status = core.shell("speedtest stop"); 
	local result = {}; 
	if( not status or status == "" ) then 
		result["status"] = "Could not retreive speedtest status!"; 
	else
		result["status"] = status; 
	end
	return result; 
end

return {
	["start"] = speedtest_start, 
	["stop"] = speedtest_stop,
	["status"] = speedtest_status
}; 
