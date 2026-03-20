# Halley Linux Disk_iostat

## Overview

Template for monitoring Linux Disk with iostat with explanations and advices.


Use LLD discovery: discover only [hsv]d[a-z]


The idea is from <https://wiki.enchtex.info/howto/zabbix/zabbix_iostat_monitoring>


I edited the script and add explanations and advises to the template


Script write data in a cache file to not make a lot of requests


To install: follow instructions from <https://cloud.mail.ru/public/6LpD/qkVgL4E8z>


Any recommends are welcome



## Author

Tudor Ticau

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IOSTAT: Hard disk drive discovery|<p>-</p>|`Zabbix agent`|iostat[]<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|iostat: Avg queue length on $2|<p>The average queue length of the requests that were issued to the device. - Average Queue Lenght. Usual is 2 per physical disk. So, if we have 5 disks, an average queue lenght under 10 is fine</p>|`Zabbix agent`|iostat[avgqu,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: Avg queue size on $2|<p>The average queue size of the requests that were issued to the device. Is calculated in sectors*512 (usual size of a sector in Unix)</p>|`Zabbix agent`|iostat[avgrq,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: I/O latency on $2|<p>The average time (in milliseconds) for I/O requests issued to the device to be served. This includes the time spent by the requests in queue and the time spent servicing them. In other words I/O time for complete a process (read the disk, change data, write in disk) - (SSD usually is under 5 ms, HDD 100 ms )</p>|`Zabbix agent`|iostat[await,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: Read I/O latency on $2|<p>The average time (in milliseconds) for read I/O requests issued to the device to be served. This includes the time spent by the requests in queue and the time spent servicing them. (SSD usually is under 1 ms, HDD 30 ms )</p>|`Zabbix agent`|iostat[rawait,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: KBps $1 on $2|<p>The total number of kilobytes read per second. SSD has until 400 Mb/s, HDD until 60 Mb/s</p>|`Zabbix agent`|iostat[read,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: Merged read IOPS on $2|<p>The number of read requests merged per second that were queued to the device. Reads and writes which are adjacent to each other may be merged for efficiency. Thus two 4K reads may become one 8K read before it is ultimately handed to the disk, and so it will be counted (and queued) as only one I/O. This field lets you know how often this was done.</p>|`Zabbix agent`|iostat[rrqm,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: Read IOPS on $2|<p>The number of read requests that were issued to the device per second. In other words, how many IOPS per second are read. SSD can handle until 30 000 IOPS, HDD - 170</p>|`Zabbix agent`|iostat[rs,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: Utilization % on $2|<p>Percentage of CPU time during which I/O requests were issued to the device (bandwidth utilization for the device). Device saturation occurs when this value is close to 100%.</p>|`Zabbix agent`|iostat[util,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: Write I/O latency on $2|<p>The average time (in milliseconds) for write I/O requests issued to the device to be served. This includes the time spent by the requests in queue and the time spent servicing them. (SSD usually is under 4 ms, HDD 70 ms )</p>|`Zabbix agent`|iostat[wawait,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: KBps $1 on $2|<p>The total number of kilobytes written per second. SSD has until 400 Mb/s, HDD until 60 Mb/s</p>|`Zabbix agent`|iostat[write,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: Merged write IOPS on $2|<p>The number of write requests merged per second that were queued to the device. Reads and writes which are adjacent to each other may be merged for efficiency. Thus two 4K reads may become one 8K read before it is ultimately handed to the disk, and so it will be counted (and queued) as only one I/O. This field lets you know how often this was done.</p>|`Zabbix agent`|iostat[wrqm,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|
|iostat: Write IOPS on $2|<p>The number of write requests that were issued to the device per second. In other words, how many IOPS per second are read. SSD can handle until 10 000 IOPS, HDD - 170</p>|`Zabbix agent`|iostat[ws,{#HDNAME}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Disk: {#HDNAME} I/O latency high|<p>Disk transfer time for an I/O operations take over 200 ms to execute. This can be a problem for your disk performance. Consider that an SSD must complete an I/O req in < 5 ms, and a HDD < 150 ms</p>|<p>**Expression**: {Halley Linux Disk_iostat:iostat[await,{#HDNAME}].avg(120)}>200</p><p>**Recovery expression**: </p>|average|
|Disk: {#HDNAME} Utilization high|<p>Saturation (bandwidth utilization for the device). Device saturation occurs when this value is close to 100% and in this time device can't deserve CPU requests. Server is going very slow</p>|<p>**Expression**: {Halley Linux Disk_iostat:iostat[util,{#HDNAME}].avg(120)}>90</p><p>**Recovery expression**: </p>|high|
|Disk: {#HDNAME} I/O latency high (LLD)|<p>Disk transfer time for an I/O operations take over 200 ms to execute. This can be a problem for your disk performance. Consider that an SSD must complete an I/O req in < 5 ms, and a HDD < 150 ms</p>|<p>**Expression**: {Halley Linux Disk_iostat:iostat[await,{#HDNAME}].avg(120)}>200</p><p>**Recovery expression**: </p>|average|
|Disk: {#HDNAME} Utilization high (LLD)|<p>Saturation (bandwidth utilization for the device). Device saturation occurs when this value is close to 100% and in this time device can't deserve CPU requests. Server is going very slow</p>|<p>**Expression**: {Halley Linux Disk_iostat:iostat[util,{#HDNAME}].avg(120)}>90</p><p>**Recovery expression**: </p>|high|
