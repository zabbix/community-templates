# Iostat monitoring

## Overview

Please follow to github for install instructions https://github.com/tulnovdl/ZabbixIostatMonitoring



## Author

Dmitry Tulnov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disk Discovery|<p>-</p>|`Zabbix agent`|system.run["iostat -d | awk 'BEGIN {check=0;count=0;array[0]=0;} {if(check==1 && $1 != \"\"){array[count]=$1;count=count+1;}if($1~\"^Device\"){check=1;}} END {printf(\"{\n\t\\"data\\":[\n\");for(i=0;i<count;++i){printf(\"\t\t{\n\t\t\t\\"{#HARDDISK}\\":\\"%s\\"}\", array[i]); if(i+1<count){printf(\",\n\");}} printf(\"]}\n\");}'"]<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disk {#HARDDISK} iostat summary|<p>-</p>|`Zabbix agent`|system.run["iostat -xm -o JSON 1 1 | jq -r '.sysstat.hosts[0].statistics[0].disk | .[] | select(.disk_device == \"{#HARDDISK}\")'"]<p>Update: 20s</p><p>LLD</p>|
|Disk {#HARDDISK} read requests (merged) per second|<p>The number of read requests merged per second that were queued to the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},rrqm/s]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} time spent by the write requests in queue|<p>The average time (in milliseconds) for write requests issued to the device to be served. This includes the time spent by the requests in queue and the time spent servicing them.</p>|`Dependent item`|iostat.summary[{#HARDDISK},w_await]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} % write requests (merged) per second|<p>The percentage of write requests merged together before being sent to the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},wrqm]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} write requests (merged) per second|<p>The number of write requests merged per second that were queued to the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},wrqm/s]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} write data per second|<p>The number of sectors (kilobytes, megabytes) written to the device per second.</p>|`Dependent item`|iostat.summary[{#HARDDISK},wMB/s]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} average size of the write requests|<p>The average size (in kilobytes) of the write requests that were issued to the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},wareq-sz]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} write requests per second|<p>The number (after merges) of write requests completed per second for the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},w/s]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} utilization|<p>Device utilization in %</p>|`Dependent item`|iostat.summary[{#HARDDISK},util]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} time spent by the read requests in queue|<p>The average time (in milliseconds) for read requests issued to the device to be served. This includes the time spent by the requests in queue and the time spent servicing them.</p>|`Dependent item`|iostat.summary[{#HARDDISK},r_await]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} % read requests (merged) per second|<p>The percentage of read requests merged together before being sent to the device</p>|`Dependent item`|iostat.summary[{#HARDDISK},rrqm]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} average queue length of the requests|<p>The average queue length of the requests that were issued to the device. Note: In previous versions, this field was known as avgqu-sz.</p>|`Dependent item`|iostat.summary[{#HARDDISK},aqu-sz]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} discard requests per second|<p>The number (after merges) of discard requests completed per second for the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},d/s]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} average size of the read requests|<p>The average size (in kilobytes) of the read requests that were issued to the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},rareq-sz]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} read requests per second|<p>The number (after merges) of read requests completed per second for the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},r/s]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} time spent by the flush requests in queue|<p>The average time (in milliseconds) for flush requests issued to the device to be served. The block layer combines flush requests and executes at most one at a time. Thus flush operations could be twice as long: Wait for current flush request, then execute it, then wait for the next one.</p>|`Dependent item`|iostat.summary[{#HARDDISK},f_await]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} flush requests per second|<p>The number (after merges) of flush requests completed per second for the device. This counts flush requests executed by disks. Flush requests are not tracked for partitions. Before being merged, flush operations are counted as writes.</p>|`Dependent item`|iostat.summary[{#HARDDISK},f/s]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} time spent by the discard requests in queue|<p>The average time (in milliseconds) for discard requests issued to the device to be served. This includes the time spent by the requests in queue and the time spent servicing them.</p>|`Dependent item`|iostat.summary[{#HARDDISK},d_await]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} % discard requests (merged) per second|<p>The percentage of discard requests merged together before being sent to the device</p>|`Dependent item`|iostat.summary[{#HARDDISK},drqm]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} discard requests (merged) per second|<p>The number of discard requests merged per second that were queued to the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},drqm/s]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} discard data per second|<p>The number of sectors (megabytes) discarded for the device per second.</p>|`Dependent item`|iostat.summary[{#HARDDISK},dMB/s]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} average size of the discard requests|<p>The average size (in kilobytes) of the discard requests that were issued to the device.</p>|`Dependent item`|iostat.summary[{#HARDDISK},dareq-sz]<p>Update: 0</p><p>LLD</p>|
|Disk {#HARDDISK} read data per second|<p>The number of sectors (megabytes) read from the device per second.</p>|`Dependent item`|iostat.summary[{#HARDDISK},rMB/s]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Disk {#HARDDISK} time spent by the read requests in queue|<p>Read request slower than 2ms</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},r_await])>2</p><p>**Recovery expression**: </p>|disaster|
|Disk {#HARDDISK} utilization high|<p>-</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},util])>70</p><p>**Recovery expression**: </p>|high|
|Disk {#HARDDISK} utilization high critical|<p>-</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},util])>90</p><p>**Recovery expression**: </p>|disaster|
|Disk {#HARDDISK} time spent by the write requests in queue to high|<p>Disk query larger than 3 ms, this will lead to slowdowns</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},w_await])>3</p><p>**Recovery expression**: </p>|high|
|Disk {#HARDDISK} time spent by the write requests in queue to high|<p>Disk query larger than 5 ms, this really bad, need to investigate</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},w_await])>5</p><p>**Recovery expression**: </p>|disaster|
|Disk {#HARDDISK} time spent by the read requests in queue (LLD)|<p>Read request slower than 2ms</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},r_await])>2</p><p>**Recovery expression**: </p>|disaster|
|Disk {#HARDDISK} utilization high (LLD)|<p>-</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},util])>70</p><p>**Recovery expression**: </p>|high|
|Disk {#HARDDISK} utilization high critical (LLD)|<p>-</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},util])>90</p><p>**Recovery expression**: </p>|disaster|
|Disk {#HARDDISK} time spent by the write requests in queue to high (LLD)|<p>Disk query larger than 3 ms, this will lead to slowdowns</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},w_await])>3</p><p>**Recovery expression**: </p>|high|
|Disk {#HARDDISK} time spent by the write requests in queue to high (LLD)|<p>Disk query larger than 5 ms, this really bad, need to investigate</p>|<p>**Expression**: last(/Iostat monitoring/iostat.summary[{#HARDDISK},w_await])>5</p><p>**Recovery expression**: </p>|disaster|
