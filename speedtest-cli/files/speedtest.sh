#!/bin/sh

LOCKFILE=/tmp/speedtest.lock
OUTPUT=/tmp/speedtest

# make sure the lockfile is removed when we exit and then claim it

speedtest_run(){
	trap "rm -f ${LOCKFILE}; exit" INT TERM EXIT
	echo "timestamp $(date '+%s')" > ${OUTPUT}
	/usr/bin/speedtest_cli.py | grep Mbit | sed 's/://g' >> ${OUTPUT}
	#cat /tmp/foo | grep Mbit | sed 's/://g' >> ${OUTPUT}
	rm -f ${LOCKFILE}
}

if [ "$1" == "status" ]; then 
	if [ ! -f ${OUTPUT} ]; then 
		echo "No speedtest data is available. Run 'start' first!"; 
	else
		cat ${OUTPUT}; 
	fi
elif [ "$1" == "start" ]; then  
	if [ -e ${LOCKFILE} ] && kill -0 `cat ${LOCKFILE}`; then
		echo "Speedtest is in progress!"
		exit 
	else
		speedtest_run &
		echo $! > ${LOCKFILE}
		echo "Speedtest started"; 
	fi
elif [ "$1" == "stop" ]; then
	if [ ! -f ${LOCKFILE} ]; then 
		echo "Speedtest is not running!"; 
	else
		kill -SIGTERM `cat ${LOCKFILE}`
		kill -SIGTERM `ps -ef | grep speedtest_cli.py | grep -v grep | awk '{print $2}'`
		echo "Speedtest terminated!"; 
	fi
else
	echo "Usage: speedtest <start|status|cancel>"
fi 

