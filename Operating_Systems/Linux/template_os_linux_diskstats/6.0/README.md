# OS Linux diskstats

## Description

Self-contained template for monitoring disk statistics on Linux systems. Source: https://github.com/frei-style/zabbix-linux-diskstats-template

## Overview

This is a self-contained monitoring template to get I/O statistics of block devices on Linux systems.



## Author

Manuel Frei

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discover Block Devices|<p>-</p>|`Dependent item`|linux.diskstats.discovery<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|diskstats (master)|<p>-</p>|`Zabbix agent (active)`|vfs.file.contents[/proc/diskstats]<p>Update: 30s</p>|
|{#DEVICE_NAME}: discards completed|<p>This is the total number of discards completed successfully. Linux 4.18+</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},discardsCompleted]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: time spent discarding|<p>This is the total number of milliseconds spent by all discards (as measured from __make_request() to end_that_request_last()). Linux 4.18+</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},timeSpentDiscarding]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: writes completed|<p>This is the total number of writes completed successfully per second.</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},writesCompleted]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: weighted time spent doing I/Os|<p>This is the numer per second of each of this actions: I/O start, I/O completion, I/O merge, or read. This can provide an easy measure of both I/O completion time and the backlog that may be accumulating.</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},weightedTimeSpentDoingIOs]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: time spent writing|<p>This is the total number of milliseconds spent by all writes (as measured from __make_request() to end_that_request_last()).</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},timeSpentWriting]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: time spent reading|<p>This is the total number of milliseconds spent by all reads (as measured from __make_request() to end_that_request_last()).</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},timeSpentReading]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: time spent flushing|<p>This is the total number of milliseconds spent by all discards (as measured from __make_request() to end_that_request_last()). Linux 5.5+</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},timeSpentFlushing]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: time spent doing I/Os|<p>Number of milliseconds spent doing I/Os. Since Linux 5.0 this field counts jiffies when at least one request was started or completed. If request runs more than 2 jiffies then some I/O time might be not accounted in case of concurrent requests.</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},timeSpentDoingIOs]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: sectors written|<p>This is the total number of sectors written successfully per second.</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},sectorsWritten]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: discards merged|<p>Discards which are adjacent to each other may be merged for efficiency. Thus two 4K reads may become one 8K read before it is ultimately handed to the disk, and so it will be counted (and queued) as only one I/O. This field lets you know how often this was done. Linux 4.18+</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},discardsMerged]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: sectors read|<p>Number of sectors read per second.</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},sectorsRead]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: sectors discarded|<p>This is the total number of sectors discarded successfully. Linux 4.18+</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},sectorsDiscarded]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: reads merged|<p>Number of reads merged per second.</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},readsMerged]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: reads completed|<p>This is the total number of reads completed successfully.</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},readsCompleted]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: I/Os currently in progress|<p>Number of I/Os currently in progress.</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},iOsCurrentlyInProgress]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: flush requests completed|<p>This is the number of flush requests completed successfully per second. Block layer combines flush requests and executes at most one at a time. This counts flush requests executed by disk. Not tracked for partitions. Linux 5.5+</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},flushRequestsCompleted]<p>Update: 0</p><p>LLD</p>|
|{#DEVICE_NAME}: writes merged|<p>This is the total number of writes merged per second.</p>|`Dependent item`|linux.diskstats[{#DEVICE_NAME},writesMerged]<p>Update: 0</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

