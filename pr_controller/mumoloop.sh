#!/bin/bash

# quick 'n dirty server loop for PR and mumo.
# Should keep the server running until
# it exits with exit status 0. Exit
# status 1 or higher will cause a
# an automatic server restart.
# tobi-the-fraggel

date=$(date +"%D-%R")

cd mods/pr/bin/PRMurmur
until (taskset -c 1 ./startmumo.sh)
	do
		echo "$date - PRmumo chrashed | server is restarting." >> crash.log
		sleep 5
done
