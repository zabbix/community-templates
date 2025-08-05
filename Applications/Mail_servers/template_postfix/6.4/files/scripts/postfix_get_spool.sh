#!/bin/bash
###############################################################
# postfix_get_spool.sh - Get number of messages currently in postfix queue dirs
#                        in JSON format
#
# Version: 0.2
# Author: Robin Roevens
# Changelog:
#   2023-12-14: Create
#   2024-01-10: Get postfix queue basedir from config
#

postfix_config=/etc/postfix/main.cf
basedir=$(grep -e ^queue_directory $postfix_config | sed 's/.\+=[[:space:]]\?\(.\+\)/\1/')
[[ $basedir ]] || basedir=/var/spool/postfix  # Fallback to default when not found in config
queuedirs="deferred active maildrop incoming corrupt hold"

idx=0
echo -n '{'
for dir in $queuedirs; do
    [[ $idx != 0 ]] && echo -n ","
    echo -n "\"$dir\":"
    if [ -r $basedir/$dir ]; then
        echo -n $(find "$basedir/$dir" -type f | wc -l)
    else
        echo -n "-1"
    fi
    idx+=1
done
echo -n '}'
