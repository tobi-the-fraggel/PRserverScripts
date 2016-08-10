#!/bin/bash

# quick 'n dirty server loop for PR and mumo.
# Should keep the server running until
# it exits with exit status 0. Exit
# status 1 or higher will cause a
# an automatic server restart.
# tobi-the-fraggel

date=$(exec date +"%D %R:%S")
crashlog=crash.log

echo "$date Starting PR server" >> $crashlog
trap 'echo; echo $date Server loop interrupted by user: $USER >> $crashlog; screen -X -S mumo quit; exit 1' 2

counter=0
while true; do
	date=$(exec date +"%D %R:%S")
	counter=$((counter+=1))
	taskset -c 1 ./start_pr.sh
	echo "$date PR server restarted $counter time(s)!" >> $crashlog
	sleep 5
done
