Speedtest
=========

This is a speedtest client written in python which uses speedtest.net. 

RPC backend: 

	/speedtest
		start - starts a new speedtest 
		stop - aborts a speedtest
		status - prints last speedtest status

RPC output: 

	call "/speedtest" status '{}'
	{
		"result": {
			"timestamp": <time when speedtest was run (in router time!)>
			"age": <time in seconds since speedtest was run>,
			"upload": "10.88",
			"download": "45.85"
		}
	}
		
