#!/bin/bash

# Simple unban script for project reality
# Script checks for hashes in FCV's
# Server 1, 2 and 3 banlists
# If it detects the key given as script
# argument then it will be removed from
# the correspnonding banlist file.

# argument and its expected lenght
HASH=$1
LENGTH=$(echo $HASH | wc -m)

# Paths
BANLISTS=("/var/prbf2/1/mods/pr/settings/banlist.con", "/var/prbf2/2/mods/pr/settings/banlist.con", "/var/prbf2/3/mods/pr/settings/banlist.con")

# checks for existing argument, lenght of string and validity of characters.
if [ -z "$1" ]; then
	echo "Plz append cd key hash like a script argument."
	exit 1
elif [ "$LENGTH" -ne "33" ]; then
	echo -e "Argument consists out of an invalid number of characters.\nCHECK HASH KEY!\nexited script"
	exit 1
elif ! [[ $1 =~ [a-f0-9]{32} ]]; then #:; else
	echo -e "Argument consists at least one invalid character.\nCHECK HASH KEY!\nexited script"
	exit 1
fi

# play it save from here
set -e

# Main logic
for check in ${BANLISTS[@]}; do
	if [[ grep ${HASH} ${check} ]]; then
		sed -i '/${$1}/d' ${check}
	else
		echo "key wasn't banned on ${check} or has already been removed."
	fi
done
