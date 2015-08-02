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
adress="sanderhaukelidseater@gmail.com"

#tempfile name
TEMPFILE="TKNAMES.tmp"

#tk list of counted names
TKLIST="TKLIST.txt"

###########################################


#generating date
TDD=$(date +"%Y%m%d")

#generating "full" file name
WFL="chatlog_"$TDD"_"
echo $WFL


#grabbing TK'ers names and saving them in $TEMPFILE
cat "$WFL"* | grep TEAMKILLS | cut -d' ' -f4 > $TEMPFILE

#sorting the tempfile for next operation
sort $TEMPFILE | uniq -c | sed 's/^ *//' | sort -k 1n > $TKLIST

cat "$TKLIST" | mail -s $TDD $adress

cat $TKLIST > $(date -I)_TKLIST.txt
