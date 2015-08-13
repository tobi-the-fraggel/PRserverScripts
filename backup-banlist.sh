#!/bin/bash

# Backup script for banlist and server setting files.
# It can be run from anywhere.
# Written by tobi-the-fraggel.


# source directories
ban="mods/pr/settings/banlist.con"
info="mods/pr/settings/banlist_info.log"
settings="settings"

# backup destination
des="/home/pradmin/pr_servers/fcv/admin/logs/banlist_backups"

# removing all files older then 30 days from backups
find $des -type f -mtime +30 -exec rm {} \;

#syncing loop
for p in fcv
do
cd /home/pradmin/pr_servers/
        if [ -e $p/$ban ]; then
        rsync -rt $p/$ban $des/banlist.con$(date +%Y.%m.%d_%H:%M:%S)
        fi
#        if [ -e $p/$info ]; then
#        rsync -rt $p/$info $des/$p/banlist_info.log$(date +%Y.%m.%d_%H:%M:%S)
#        fi
#        if [ -d $p/$settings ]; then
#        rsync -rt $p/$settings $des/$p
#        fi
done