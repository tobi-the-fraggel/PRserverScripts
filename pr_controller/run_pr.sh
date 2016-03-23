#!/bin/bash
############################################
# Linux PR server automatic restart script #
#					   #
# Written by [R-DEV]BloodyDeed		   #
############################################

DAM=$(exec date +%H:%M:%S)
DAY=$(exec date +%D)
echo "[$DAY $DAM] Bf2 Server Starting" >> restarts.log
echo To stop the restarting press Ctrl+C when the server is being restarted
echo
DAM=$(exec date +%H:%M:%S)
DAY=$(exec date +%D)
trap 'echo; echo [$DAY $DAM] Server Restarter has been STOPPED! >>
restarts.log; exit 1' 2
C1=0
while true
do
C1=$((C1+=1))
# Modify the line bellow to match your server execution command line
$HOME/path/start_pr.sh
DAM=$(exec date +%H:%M:%S)
DAY=$(exec date +%D)
echo "[$DAY $DAM] PR server restarted $C1 time(s)!" >> restarts.log
sleep 10
done
