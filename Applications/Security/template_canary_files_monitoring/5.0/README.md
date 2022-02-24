# Canary

## Overview

Canary files can help you identify information breaches or ransomware attacks.


The script monitors when a file, or set of files, are accessed and upon detection execute several commands to help identify the source of the event.


This script should be run by cron every minute.


The file files2monitor should contain the files to monitor, all in one line, space separated.


Dependencies: inotify-tools, flock, zabbix\_sender


Script and Zabbix template to:


Detect actions on canary files, read, write or open.


Support for multiple files monitoring.


Avoid multiple simultaneous execution of the script using flock.


Sends information to zabbix only when incident happens, for monitoring resource optimization.


Records information from inotify, top, netstat, lsof, who, ps and fuser upon event detection.


Dependencies: inotify-tools, flock, zabbix\_sender


https://github.com/rggassner/gassnerZabbixScripts/tree/master/canary


The shell script can be found in the github repository above.


Suggestions are welcome!



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Canary status|<p>Status used for triggers. 1 - Canary is dead 0 - Canary is alive</p>|`Zabbix trapper`|canary.status[]<p>Update: 0</p>|
|netstat|<p>Show output of "netstat -tupan" (First one thousand lines)</p>|`Zabbix trapper`|canary.netstat[]<p>Update: 0</p>|
|top|<p>"top" command when canary file was triggered.</p>|`Zabbix trapper`|canary.top[]<p>Update: 0</p>|
|ps|<p>Show "ps -ef f" output (First one thousand lines)</p>|`Zabbix trapper`|canary.ps[]<p>Update: 0</p>|
|who|<p>"who -a" command when canary file was triggered.</p>|`Zabbix trapper`|canary.who[]<p>Update: 0</p>|
|lsofile|<p>Show lsof for the canary file that triggered.</p>|`Zabbix trapper`|canary.lsofile[]<p>Update: 0</p>|
|fuser|<p>Show fuser for all the pids using the file</p>|`Zabbix trapper`|canary.fuser[]<p>Update: 0</p>|
|lsof|<p>Show lsof for all the files (First one thousand lines)</p>|`Zabbix trapper`|canary.lsof[]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

