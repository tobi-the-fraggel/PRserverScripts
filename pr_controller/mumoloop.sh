#!/bin/bash

# quick 'n dirty server loop for PR and mumo.
# Should keep the server running until
# it exits with exit status 0. Exit
# status 1 or higher will cause a
# an automatic server restart.
# tobi-the-fraggel

date=$(exec date +"%D %R:%S")
crashlog=crash.log

echo "$date Running mumo" >>$crashlog
trap 'echo; echo $date mumo loop stopped by: $USER >> $crashlog; screen -X -S pr quit; exit 1' 2

counter=0
cd mods/pr/bin/PRMurmur
while true; do
	date=$(exec date +"%D %R:%S")
	counter=$((counter+=1))
	taskset -c 1 ./startmumo.sh
	echo "$date - PRmumo chrashed | server is restarting." >> $crashlog
	sleep 5
done
