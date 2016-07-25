#!/bin/bash

# quick 'n dirty server loop for PR and mumo.
# Should keep the server running until
# it exits with exit status 0. Exit
# status 1 or higher will cause a
# an automatic server restart.
# tobi-the-fraggel

date=$(date +"%D-%R")
crashlog=crash.log

#until (taskset -c 1 ./start_pr.sh)
#	do
#		echo "$date - PR server chrashed | server is restarting." >> $crashlog
#		sleep 5
#done
echo "$date Starting PR server" >> $crashlog
trap 'echo; echo $date Server loop stopped! >> $crashlog; exit 1' 2

counter=0
while true; do
	date=$(date +"%D-%R")
	counter=$((counter+=1))
	(taskset -c 1 ./start_pr.sh)
	echo "$date PR server restarted $counter time(s)!" >> $crashlog
	sleep 5
done
