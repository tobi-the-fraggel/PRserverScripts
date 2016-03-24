#! /bin/bash

# Simple server control script
# for PR servers.
# Written by tobi-the-fraggel

################### Constants
# Some colors for styling
BLUE='\033[1;34m'
BROWN='\033[0;33m'
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m'

# Server details
PR="$HOME/fcv/"
PR_UPDATER="$HOME/fcv/mods/pr/bin/"
SCREEN="pr"
START="run_pr.sh"


################## functions
# Start PR server
start_server() {
screen -S "$SCREEN" -d -m $PR/$START
}

# Stop PR server
stop_server() {
screen -S pr -X quit
}

# Restart PR server
restart_server() {
screen -x "$SCREEN" -X stuff "exit$(echo -ne '\015')"
screen -x "$SCREEN" -X stuff "$PR/$START"
#screen -S "$SCREEN" -d -m $PR/$START
}

# Update PR server
update_server() {
cd $PR_UPDATER
./prserverupdater-linux64
}


### Main Logic ###
echo -e "${BLUE}Choose option and press 'ENTER'${NC}"
OPTIONS="${BLUE}Start_Server Stop_Server Restart_Server Update_Server Quit_Program${NC}"
select opt in $OPTIONS; do
	if [ "$opt" = "Quit_Program" ]; then
    	echo -e "${BROWN}Exiting Server Controller${NC}"
        exit
	elif [ "$opt" = "Start_Server" ]; then
    	echo -e "${BROWN}Starting Project Reality Server...\n${NC}"
        start_server
    	echo -e "${BROWN}Project Reality Server is running. Exiting Server Controller${NC}"
        exit
	elif [ "$opt" = "Stop_Server"]; then
    	echo -e "${BROWN}Stopping Project Reality Server...\n${NC}"
		stop_server
    	echo -e "${BROWN}Project Reality has stopped. Exiting Server Controller${NC}"
		exit
    elif [ "$opt" = "Restart_Server" ]; then
    	echo -e "${BROWN}Restarting Project Reality Server...\n${NC}"
		restart_server
    	echo -e "${BROWN}${NC}"
		exit
	elif [ "" = "Update_Server" ]; then
    	echo -e "${BROWN}Updating Project Reality Server...\n${NC}"
		update_server
    	echo -e "${BROWN}Project Reality is succesfully updated.\nCheck '/mods/pr/python/game' for new${NC} ${GREEN}'realityconfig_*.py ${NC}${BROWN}files. Exiting Server Controller.${NC}"
		exit
	else
    	clear
        echo -e "${BLUE}Bad Option.\nTry${NC} ${RED}'1.Start_Server 2.Stop_Server 3.Restart_Server 4.Update_Server 5.Quit_Program'${NC}"
    fi
done
