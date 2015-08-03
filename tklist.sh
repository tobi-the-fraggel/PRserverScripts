#!/bin/bash
###
#Purpose: Find and count TK'ers from a given time
#
#CAUCTION: Script not made portable must be executed from within /logs/
#
#

###########################################
#VARIABLES

#email address (needs mailutils)
adress="EMAIL_HERE"

#tk list of counted names
TKLIST="$(date -I)_TKLIST.txt"

###########################################


#generating date
TDD=$(date +"%Y%m%d")


#grabbing TK'ers names file by file and save them in a log.
for WFL in "chatlog_"$TDD"_"*; do
        echo "+++++Tk's on $WFL+++++" >> $TKLIST
        grep TEAMKILLS $WFL | cut -d' ' -f4 | sort | uniq -c | sort -n | sed 's/^[ \t]*//g' >> $TKLIST
        echo "+++++End++++++" >> $TKLIST
        echo "" >> $TKLIST
done

cat "$TKLIST" | mail -s $TDD $adress