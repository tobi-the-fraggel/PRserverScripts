#! /bin/bash

# Simple server control script
# for PR servers.
# Written by tobi-the-fraggel


################### Constants ################
# Some colors for styling
BLUE="\033[1;34m"
BROWN='\033[0;33m'
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m'

# Server details
PR="$HOME/1"
CRASH_LOG="$HOME/1/crash.log"
PR_UPDATER="$PR/mods/pr/bin/"
PR_SCREEN="pr"
MUMO_SCREEN="mumo"
START_PR="$PR/serverloop.sh"
START_MUMO="$PR/mumoloop.sh"
MURMUR="$PR/mods/pr/bin/PRMurmur"
################## /Constants ################



################## functions #################
# Start PR server
start_server() {
cd $PR
screen -S "$PR_SCREEN" -d -m $START_PR
screen -S "$MUMO_SCREEN" -d -m $START_MUMO
}

# Stop PR server
stop_server() {
screen -X -S "$PR_SCREEN" quit
screen -X -S "$MUMO_SCREEN" quit
echo "PR and Mumo instances stopped by controller" >> $CRASH_LOG
}

# Restart PR server
restart_server() {
screen -X -S "$PR_SCREEN" quit
screen -X -S "$MUMO_SCREEN" quit
cd $PR
screen -S "$PR_SCREEN" -d -m $START_PR
screen -S "$MUMO_SCREEN" -d -m $START_MUMO
}

# Update PR server
update_server() {
cd $PR_UPDATER
./prserverupdater-linux64
}
################# /functions ##################



### Main Logic ###
echo -e "${BLUE}Choose option and press 'ENTER'${NC}"
OPTIONS="Start_Server Stop_Server Restart_Server Update_Server Quit_Program"
select opt in $OPTIONS; do
        if [ "$opt" = "Quit_Program" ]; then
        echo -e "${BROWN}Exiting Server Controller${NC}"
        exit
        elif [ "$opt" = "Start_Server" ]; then
        echo -e "${BROWN}Starting Project Reality Server...\n${NC}"
        start_server
        echo -e "${BROWN}Project Reality Server is running. Exiting Server Controller${NC}"
        exit
        elif [ "$opt" = "Stop_Server" ]; then
        echo -e "${BROWN}Stopping Project Reality Server...\n${NC}"
        stop_server
        echo -e "${BROWN}Project Reality has stopped. Exiting Server Controller${NC}"
        exit
        elif [ "$opt" = "Restart_Server" ]; then
        echo -e "${BROWN}Restarting Project Reality Server...\n${NC}"
        restart_server
        echo -e "${BROWN}Server restarted.${NC}"
        exit
        elif [ "$opt" = "Update_Server" ]; then
        echo -e "${BROWN}Updating Project Reality Server...\n${NC}"
        update_server
        echo -e "${BROWN}Project Reality is succesfully updated.\nCheck '/mods/pr/python/game' for new${NC} ${GREEN}'realityconfig_*.py ${NC}${BROWN}files. Exiting Server Controller.${NC}"
        exit
        else
        clear
        echo -e "${BLUE}Bad Option.\nTry${NC} ${RED}'1.Start_Server 2.Stop_Server 3.Restart_Server 4.Update_Server 5.Quit_Program'${NC}"
    fi
done
### End of main logic
