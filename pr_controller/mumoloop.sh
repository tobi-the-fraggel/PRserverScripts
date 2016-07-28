#!/bin/bash

# quick 'n dirty server loop for PR and mumo.
# Should keep the server running until
# it exits with exit status 0. Exit
# status 1 or higher will cause a
# an automatic server restart.
# tobi-the-fraggel

date=$(date +"%D-%R")
crashlog=crash.log

echo "$date Running mumo" >>$crashlog
trap 'echo; $date mumo loop stopped! >> $crashlog; exit 1' 2

couter=0
cd mods/pr/bin/PRMurmur
while true; do
	date=$(date +"%D-%R")
	counter=$((counter+=1))
	(taskset -c 1 ./startmumo.sh)
	echo "$date - PRmumo chrashed | server is restarting." >> $crashlog
	sleep 5
done
