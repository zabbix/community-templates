# App e2guardian - Active

## Description

https://github.com/e2guardian/e2guardian/blob/master/notes/dstats_format USER.MACRO={$E2GUARDIAN_DSTATS} UserParameter=e2guardian[*],tail -1 $1 | cut -f $2

## Overview

Introduction
============


This is my approach for a performance monitoring Template of [E2guardian](http://e2guardian.org/).


This Template was created on and for Zabbix 3.4 and E2Guardian 4.1.x on Debian 9 Stretch.


Installation
------------


Please check the GitHub Page for latest version and instructions. 


Changes
-------


 


* February 2018: initial commit.
* 03 April 2018: Switch to Zabbix agent (active) & converted s


## Author

Marco Hofmann

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$E2GUARDIAN_DSTATS}|<p>-</p>|`/var/log/e2guardian/dstats.log`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|e2guardian - httpworkers queue|<p>4. httpwQ - Number of connections waiting in queue for a worker thread. In normal use this will be 0 (and on occasion 1 or 2) but will increase once all worker threads are busy. Lowish numbers are OK for transitory peaks. High numbers indicate an overloaded system. If there is still memory and cpu available, then httpworkers may be increased.</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},4]<p>Update: 5m</p>|
|e2guardian - log queue|<p>5. logQ - Number of messages waiting to be logged to disk. In normal use 0. An increase in number may indicate system overloading, but should not otherwise affect performance.</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},5]<p>Update: 5m</p>|
|e2guardian - timestamp of dstats dump|<p>1. Time - in unix format</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},1]<p>Update: 5m</p>|
|e2guardian - Number of List Option Containers in use|<p>11. LCcnt - Number of List Option Containers in use. A new List Option Container is created at start up and on gentle restart. Old containers are deleted once all connections still using it have finished. Normally figure will be one, but may rise after a gentle restart(s) and should return to one after a period of time.</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},11]<p>Update: 5m</p>|
|e2guardian - maximum number file descriptor in use|<p>10. maxfd - Indication of maximum number file descriptor in use</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},10]<p>Update: 5m</p>|
|e2guardian - requests since last stats dump|<p>8. reqs - indication of number of requests handled since last stats line. Only an indication as requests made over https tunnels (i.e. non-MITM) cannot be counted, so each https tunnel is counted as one request.</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},8]<p>Update: 5m</p>|
|e2guardian - connections per second|<p>7. conx/s - average connections per sec over period since last stats line.</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},7]<p>Update: 5m</p>|
|e2guardian - requests per second|<p>9. reqs/s - average requests per sec over period since last stats line.</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},9]<p>Update: 5m</p>|
|e2guardian - httpworkers busy|<p>3. busy - Number of httpworker threads busy handling connections at current time</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},3]<p>Update: 5m</p>|
|e2guardian - httpworkers total|<p>2. httpw - Number of httpworker threads running</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},2]<p>Update: 5m</p>|
|e2guardian - total sum connections each 5 minutes|<p>6. conx - number of connections handled since last stats line.</p>|`Zabbix agent (active)`|e2guardian[{$E2GUARDIAN_DSTATS},6]<p>Update: 5m</p>|


## Triggers

There are no triggers in this template.

