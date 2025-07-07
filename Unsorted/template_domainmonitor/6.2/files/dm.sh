#!/bin/bash
# This script is basically a wrapper for the main python script
# It ensures to be called via the venv which was created


DMPATH=/opt/ZabbixDomainMonitor
cd $DMPATH

# uncomment following lines for debug to log file

#TS=$(date)
#WD=`pwd`
#echo "----- $TS -----" >> log/dm-bash.log
#echo "WD: $WD | DMPATH: $DMPATH" >> log/dm-bash.log
#echo "Received parameters: $1 $2 $3 $4 $5 $6" >> log/dm-bash.log

# Execute python script, handing over Parameters from Zabbix
$DMPATH/.dmvenv/bin/python3 $DMPATH/dm.py -f "$1" -a "$2" -s "$3" -d "$4" --psk "$5" --psk-id "$6"

# Use this for enable debug logs in script
#$DMPATH/.dmvenv/bin/python3 $DMPATH/dm.py -f "$1" -a "$2" -s "$3" -d "$4" --psk "$5" --psk-id "$6" -v


# Print Return result -> displayed in Zabbix Item
RET=$?
if [ $RET -ne 0 ]; then
    echo "Error"
else
    echo "DM executed successfully"
fi

