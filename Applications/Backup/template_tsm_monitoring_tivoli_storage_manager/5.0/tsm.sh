#!/bin/bash
#set -e
# Title: tsm.sh
# Description: Script to gather data from TSM and report back to zabbix.
# Original Author: Chris S. / [wings4marie @ gmail DOT com] / [IRC: Parabola@Freenode]
# Author: Chris Jones / [rollercow @ sucs.org] - Mostly tidying
# Modify by Haim Cohen [https://www.linkedin.com/in/haimc/]
###################################################################################
#
# Tested with TSM 8.1 and zabbix 2.0.11 by Haim Cohen 2019
#
#################
# CONFIGURATION #
#################
zabbix_sender="/usr/bin/zabbix_sender"
zabbix_mon="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # agent hostname as registered in Zabbix frontend
zabbix_config="/etc/zabbix/zabbix_agentd.conf"
zabbix_log="/dev/null"
tsm_binary="/usr/bin/dsmadmc" # Path to the admin CLI binary tool
tsm_se="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # target tsm server name
tsm_user="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # TSM username
tsm_pass="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # TSM Password

#################
#  FUNCTIONS    #
#################
function send_value {
        "$zabbix_sender" -c $zabbix_config -s $zabbix_mon -k $1 -o $2 > $zabbix_log
}

function tsm_cmd {
        "$tsm_binary" -se=$tsm_se -id=$tsm_user -pa=$tsm_pass -dataonly=yes "$1" | grep -v ANS0102W # shuts up persistent warning
}

#################
#  DRIVE STATS  #
#################

function tsm_drives_offline { # Number of drives marked as offline
        offlineDrives=$(tsm_cmd "SELECT COUNT(*) FROM drives WHERE NOT online='YES'")
        send_value tsm.drives.offline.count "$offlineDrives"
}

function tsm_drives_online { # Number of drives online
        onlineDrives=$(tsm_cmd "SELECT COUNT(*) FROM drives WHERE  online='YES'")
        send_value tsm.drives.online.count "$onlineDrives"
}


function tsm_drives_loaded { # Number of drives with a tape (loaded)
        loadedDrives=$(tsm_cmd "SELECT COUNT(*) FROM drives WHERE drive_state='LOADED'")
        send_value tsm.drives.loaded.count "$loadedDrives"
}

function tsm_drives_empty { # Number of "empty" Drives within your library
        emptyDrives=$(tsm_cmd "SELECT COUNT(*) FROM drives WHERE drive_state='EMPTY'")
        send_value tsm.drives.empty.count "$emptyDrives"
}

#################
#  POOL  STATS  #
#################

function tsm_diskpool_usage { # See NOTES
        diskpool=$(tsm_cmd "SELECT volume_name,stgpool_name,pct_utilized FROM volumes WHERE stgpool_name= 'DISKPOOL' ORDER BY stgpool_name DESC")
        echo "$diskpool" | while read disk _ num
        do
                send_value tsm.pools."${disk:(-5)}" "$num"
        done
}

function tsm_logpool_usage { # See NOTES
        logpool=$(tsm_cmd "SELECT volume_name,stgpool_name,pct_utilized FROM volumes WHERE stgpool_name= 'LOGPOOL' ORDER BY stgpool_name DESC")
        echo "$logpool" | while read log _ num
        do
                send_value tsm.pools."${log:(-4)}" "$num"
        done
}

#################
#   TSM STATS   #
#################

function tsm_nodes_count { #Total number of nodes in your TSM environment
        nodeCount=$(tsm_cmd "SELECT COUNT(*) FROM nodes")
        send_value tsm.nodes.count "$nodeCount"
}

function tsm_nodes_locked { # number of nodes marked as locked
        lockedNodes=$(tsm_cmd "SELECT count(node_name) FROM nodes WHERE locked='YES'")
        send_value tsm.nodes.locked.count "$lockedNodes"
}

function tsm_nodes_sessioncount {
        sessCount=$(tsm_cmd "SELECT COUNT(*) FROM sessions WHERE session_type='Node'")
        send_value tsm.nodes.sessions.count "$sessCount"
}

function tsm_failedjobs { # Number of jobs marked as "Failed"
        failedInt=$(tsm_cmd "query event * *  begind=today-1 begint=00:00:00 endd=today-1 endt=23:59:59 exceptionsonly=yes" | grep Failed | wc -l)
        send_value tsm.jobs.missed "$failedInt"
}

function tsm_missedjobs { # Number of jobs marked as "Missed"
        missedInt=$(tsm_cmd "query event * *  begind=today-1 begint=00:00:00 endd=today-1 endt=23:59:59 exceptionsonly=yes" | grep Missed | wc -l)
        send_value tsm.jobs.missed "$missedInt"
}

function tsm_summary_24hrs { #Data in B by activity
        summary=$(tsm_cmd "SELECT activity,sum(bytes) FROM summary where end_time>current_timestamp-24 hours GROUP BY activity" | sed 's/ //')
        for jobtype in archive backup full_dbbackup migration offsitereclamation reclamation restore retrieve stgpoolbackup
        do
                echo "$summary" | grep -i $jobtype > /dev/null
                if [ $? = 0 ]
                then
                    send_value tsm.summary.daily.$jobtype $(echo "$summary" | grep -i $jobtype | awk {'print $2'})
                fi
        done
}

function tsm_summary_total_stored { # Total data stored in B
        totalStored=$(tsm_cmd "SELECT cast(SUM(logical_mb)*1024*1024 as bigint) FROM occupancy")
        send_value tsm.summary.total.stored "$totalStored"
}
#################
#  SCHEDULING   #
#################
###############################################################################
# Place functions within each Category for execution                          #
# INFO: (Use Cron)                                                            #
# daily - Scheduled for 8am, 7 days a week                                    #
# hourly - Run every 60 minutes                                               #
# Below are my Cron entries                                                   #
#                                                                             #
# 0 8 * * * /bin/bash "/etc/zabbix/externalscripts/tsm.sh" daily              #
# 0,60 * * * * /bin/bash "/etc/zabbix/externalscripts/tsm.sh" hourly          #
#                                                                             #
###############################################################################


function daily {
    tsm_missedjobs
    tsm_failedjobs
    tsm_summary_24hrs
}

function hourly {
    tsm_scratchvols
    tsm_totalvols
    tsm_consolidate_num
    tsm_tapes_errors
    tsm_drives_offline
    tsm_drives_online
    tsm_drives_loaded
    tsm_drives_empty
    tsm_nodes_count
    tsm_nodes_locked
    tsm_nodes_sessioncount
    tsm_summary_total_stored
    #tsm_diskpool_usage
    #tsm_logpool_usage
}

if [[ "$1" == *hourly* ]]; then
        hourly
elif [[ "$1" == *daily* ]]; then
        daily
else echo "Useage: tsm.sh [hourly|daily]"
fi
