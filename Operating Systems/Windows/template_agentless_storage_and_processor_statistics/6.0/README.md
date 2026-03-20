# OS Windows WMI

## Overview

Template for receiving stats with zbxwmi script. This method allows to retrieve stats remotely by WMI without installing agent to OS.


You can get script from: <https://github.com/13hakta/zbxwmi> - with tips and installation manual.


Requires python 3 script (check link above).



## Author

Vitaly Chekryzhev

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$WMI_AUTHFILE}|<p>-</p>|`/etc/zabbix/wmi.pw`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Find drive|<p>Find local disk drive</p>|`External check`|zbxwmi["-action","discover","-k","DeviceID","-fields","VolumeName","-filter","MediaType=12","Win32_LogicalDisk","{$WMI_AUTHFILE}",{HOST.HOST}]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disk I/O|<p>-</p>|`External check`|zbxwmi["-action","json","-fields","DiskWritesPersec,DiskWriteBytesPersec,DiskReadsPersec,DiskReadBytesPersec","-filter","Name='_Total'","Win32_PerfRawData_PerfDisk_LogicalDisk","{$WMI_AUTHFILE}",{HOST.HOST}]<p>Update: 5m</p>|
|CPU #6|<p>-</p>|`Dependent item`|cpu6<p>Update: 0</p>|
|CPU #1|<p>-</p>|`Dependent item`|cpu1<p>Update: 0</p>|
|CPU #7|<p>-</p>|`Dependent item`|cpu7<p>Update: 0</p>|
|CPU #2|<p>-</p>|`Dependent item`|cpu2<p>Update: 0</p>|
|Read / sec|<p>-</p>|`Dependent item`|DiskReadsPersec<p>Update: 0</p>|
|CPU #3|<p>-</p>|`Dependent item`|cpu3<p>Update: 0</p>|
|Writes / sec|<p>-</p>|`Dependent item`|DiskWritesPersec<p>Update: 0</p>|
|CPU #4|<p>-</p>|`Dependent item`|cpu4<p>Update: 0</p>|
|CPU #5|<p>-</p>|`Dependent item`|cpu5<p>Update: 0</p>|
|CPU #8|<p>-</p>|`Dependent item`|cpu8<p>Update: 0</p>|
|Processors|<p>-</p>|`External check`|zbxwmi["-action","json","-fields","PercentProcessorTime","-filter","Name<>'_Total'","Win32_PerfFormattedData_PerfOS_Processor","{$WMI_AUTHFILE}",{HOST.HOST}]<p>Update: 5m</p>|
|Used {#WMI.DEVICEID}|<p>-</p>|`Calculated`|Used[{#WMI.DEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|Disk info {#WMI.DEVICEID}|<p>-</p>|`External check`|zbxwmi["-action","json","-k","DeviceID","-fields","FreeSpace,Size","-item","{#WMI.DEVICEID}","Win32_LogicalDisk","{$WMI_AUTHFILE}","{HOST.HOST}"]<p>Update: 5m</p><p>LLD</p>|
|Free Space {#WMI.DEVICEID}|<p>-</p>|`Dependent item`|FreeSpace[{#WMI.DEVICEID}]<p>Update: 0</p><p>LLD</p>|
|Size {#WMI.DEVICEID}|<p>-</p>|`Dependent item`|Size[{#WMI.DEVICEID}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Low disk space|<p>-</p>|<p>**Expression**: avg(/OS Windows WMI/FreeSpace[{#WMI.DEVICEID}],7200s)<2147483648</p><p>**Recovery expression**: </p>|warning|
|Low disk space (LLD)|<p>-</p>|<p>**Expression**: avg(/OS Windows WMI/FreeSpace[{#WMI.DEVICEID}],7200s)<2147483648</p><p>**Recovery expression**: </p>|warning|
