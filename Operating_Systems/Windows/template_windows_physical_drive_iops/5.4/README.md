# Windows Physical Disk IOPS

## Overview

This template discover physical disk thrue a powershell code.


As i hate myself to deploy third party scripts on my agents, the powershell code is embeded in this template macro, this mean that you don't have to deploy any additionnal scripts to get it work.


It also use "zabbix active" items to get work behind firewall.


Data are retrieved thrue perfmon values, the template has been made to be compatible with all OS language using numeric value of perfcounter.


This template is better than others because this one calculate the IOPS per physical disk instead of logical drive, meaning a better estimation of true saturation of a disk.


If trigger fire on physical disk too much, it's time to buy SSD :)


Look at the attached screenshots to get a better idea of it.


 


Enjoy


PS: powershell macro has been base64 encoded to be more easy to deploy, if you do not trust the code you can easily revert it back to something readable or just look at the Zabbix Agent log to see the command executed


Tested from Windows 7 till 2016 with success.



## Author

Cédric MARCOUX

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$DISCOVERDISK1}|<p>-</p>|`JABkAHIAaQB2AGUAcwAgAD0AIABHAGUAdAAtAFcAbQBpAE8AYgBqAGUAYwB0ACAAdwBpAG4AMwAyAF8AUABlAHIAZgBGAG8AcgBtAGEAdAB0AGUAZABEAGEAdABhAF8AUABlAHIAZgBEAGkAcwBrAF8AUABoAHkAcwBpAGMAYQBsAEQAaQBzAGsAIAB8ACAAPwB7ACQAXwAuAG4AYQBtAGUAIAAtAG4AZQAgACIAXwBUAG8AdABhAGwAIgB9ACA`|Text macro|
|{$DISCOVERDISK2}|<p>-</p>|`AfAAgAFMAZQBsAGUAYwB0ACAATgBhAG0AZQA7ACQAaQBkAHgAIAA9ACAAMQA7AHcAcgBpAHQAZQAtAGgAbwBzAHQAIAAiAHsAIgA7AHcAcgBpAHQAZQAtAGgAbwBzAHQAIAAiACAAYAAiAGQAYQB0AGEAYAAiADoAWwBgAG4AIgA7AGYAbwByAGUAYQBjAGgAIAAoACQAcABlAHIAZgBEAHIAaQB2AGUAcwAgAGkAbgAgACQAZAByAGkAdgBlAH`|Text macro|
|{$DISCOVERDISK3}|<p>-</p>|`MAKQB7AGkAZgAgACgAJABpAGQAeAAgAC0AbAB0ACAAJABkAHIAaQB2AGUAcwAuAEMAbwB1AG4AdAApAHsAIAAgACAAIAAgACAAIAAkAGwAaQBuAGUAPQAgACIAewAgAGAAIgB7ACMARABJAFMASwBOAFUATQBMAEUAVAB9AGAAIgAgADoAIABgACIAIgAgACsAIAAkAHAAZQByAGYARAByAGkAdgBlAHMALgBOAGEAbQBlACAAKwAgACIAYAAiA`|Text macro|
|{$DISCOVERDISK4}|<p>-</p>|`CAAfQAsACIAOwB3AHIAaQB0AGUALQBoAG8AcwB0ACAAJABsAGkAbgBlADsAfQBlAGwAcwBlAGkAZgAgACgAJABpAGQAeAAgAC0AZwBlACAAJABkAHIAaQB2AGUAcwAuAEMAbwB1AG4AdAApAHsAJABsAGkAbgBlAD0AIAAiAHsAIABgACIAewAjAEQASQBTAEsATgBVAE0ATABFAFQAfQBgACIAIAA6ACAAYAAiACIAIAArACAAJABwAGUAcgBm`|Text macro|
|{$DISCOVERDISK5}|<p>-</p>|`AEQAcgBpAHYAZQBzAC4ATgBhAG0AZQAgACsAIAAiAGAAIgAgAH0AIgA7AHcAcgBpAHQAZQAtAGgAbwBzAHQAIAAkAGwAaQBuAGUAOwB9ACQAaQBkAHgAKwArADsAfQA7AHcAcgBpAHQAZQAtAGgAbwBzAHQAOwB3AHIAaQB0AGUALQBoAG8AcwB0ACAAIgAgAF0AIgA7AHcAcgBpAHQAZQAtAGgAbwBzAHQAIAAiAH0AIgA7AA0ACgA=`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discover PhysicalDisk|<p>Encoded command splitted in 5 macro: $drives = Get-WmiObject win32_PerfFormattedData_PerfDisk_PhysicalDisk | ?{$_.name -ne "_Total"} | Select Name;$idx = 1;write-host "{";write-host " `"data`":[`n";foreach ($perfDrives in $drives){if ($idx -lt $drives.Count){ $line= "{ `"{#DISKNUMLET}`" : `"" + $perfDrives.Name + "`" },";write-host $line;}elseif ($idx -ge $drives.Count){$line= "{ `"{#DISKNUMLET}`" : `"" + $perfDrives.Name + "`" }";write-host $line;}$idx++;};write-host;write-host " ]";write-host "}";</p>|`Zabbix agent (active)`|system.run[%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy ByPass -nologo -EncodedCommand {$DISCOVERDISK1}{$DISCOVERDISK2}{$DISCOVERDISK3}{$DISCOVERDISK4}{$DISCOVERDISK5}]<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disk ({#DISKNUMLET}) - Average Disk Bytes Total|<p>-</p>|`Calculated`|AvgDiskBytesTotal[({#DISKNUMLET})]<p>Update: 15s</p><p>LLD</p>|
|Disk ({#DISKNUMLET}) - % Disk saturation|<p>-</p>|`Calculated`|DiskSaturation[({#DISKNUMLET})]<p>Update: 15s</p><p>LLD</p>|
|Disk ({#DISKNUMLET}) - Current Disk Queue Length|<p>-</p>|`Zabbix agent (active)`|perf_counter["\234({#DISKNUMLET})\198"]<p>Update: 15s</p><p>LLD</p>|
|Disk ({#DISKNUMLET}) - Avg. Disk sec/Read (Latency)|<p>-</p>|`Zabbix agent (active)`|perf_counter["\234({#DISKNUMLET})\208"]<p>Update: 15s</p><p>LLD</p>|
|Disk ({#DISKNUMLET}) - Avg. Disk sec/Write (Latency)|<p>-</p>|`Zabbix agent (active)`|perf_counter["\234({#DISKNUMLET})\210"]<p>Update: 15s</p><p>LLD</p>|
|Disk ({#DISKNUMLET}) - Avg. Disk sec/Transfer (Latency)|<p>Avg. Disk sec/Transfer (Avg. Disk sec/Read, Avg. Disk sec/Write) Displays the average time the disk transfers took to complete, in seconds. Although the scale is seconds, the counter has millisecond precision, meaning a value of 0.004 indicates the average time for disk transfers to complete was 4 milliseconds. This is the counter in Perfmon used to measure IO latency.</p>|`Zabbix agent (active)`|perf_counter["\234({#DISKNUMLET})\212"]<p>Update: 15s</p><p>LLD</p>|
|Disk ({#DISKNUMLET}) - Average Disk Bytes Read|<p>-</p>|`Zabbix agent (active)`|perf_counter["\234({#DISKNUMLET})\226"]<p>Update: 15s</p><p>LLD</p>|
|Disk ({#DISKNUMLET}) - Average Disk Bytes Write|<p>-</p>|`Zabbix agent (active)`|perf_counter["\234({#DISKNUMLET})\228"]<p>Update: 15s</p><p>LLD</p>|
|Disk ({#DISKNUMLET}) - Avg. Disk Queue Length|<p>-</p>|`Zabbix agent (active)`|perf_counter["\234({#DISKNUMLET})\1400"]<p>Update: 15s</p><p>LLD</p>|
|Disk ({#DISKNUMLET}) - % Idle Time|<p>-</p>|`Zabbix agent (active)`|perf_counter["\234({#DISKNUMLET})\1482"]<p>Update: 15s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Disk ({#DISKNUMLET}) - Disk activity saturation for 5 minutes|<p>% Idle Time This counter provides a very precise measurement of how much time the disk remained in idle state, meaning all the requests from the operating system to the disk have been completed and there is zero pending requests. This is how it’s calculated, the system timestamps an event when the disk goes idle, then timestamps another event when the disk receives a new request. At the end of the capture interval, we calculate the percentage of the time spent in idle. This counter ranges from 100 (meaning always Idle) to 0 (meaning always busy).</p>|<p>**Expression**: avg(/Windows Physical Disk IOPS/DiskSaturation[({#DISKNUMLET})],5m)>=99 or avg(/Windows Physical Disk IOPS/perf_counter[" 234({#DISKNUMLET}) 1400"],1m)>=20</p><p>**Recovery expression**: avg(/Windows Physical Disk IOPS/DiskSaturation[({#DISKNUMLET})],5m)<99 or avg(/Windows Physical Disk IOPS/perf_counter[" 234({#DISKNUMLET}) 1400"],1m)<20</p>|warning|
|Disk ({#DISKNUMLET}) - Disk high latency (>20ms) since 1 minute|<p>Should not be higher than ~20ms</p>|<p>**Expression**: avg(/Windows Physical Disk IOPS/perf_counter[" 234({#DISKNUMLET}) 212"],1m)>=20</p><p>**Recovery expression**: avg(/Windows Physical Disk IOPS/perf_counter[" 234({#DISKNUMLET}) 212"],1m)<20</p>|warning|
|Disk ({#DISKNUMLET}) - Disk activity saturation for 5 minutes (LLD)|<p>% Idle Time This counter provides a very precise measurement of how much time the disk remained in idle state, meaning all the requests from the operating system to the disk have been completed and there is zero pending requests. This is how it’s calculated, the system timestamps an event when the disk goes idle, then timestamps another event when the disk receives a new request. At the end of the capture interval, we calculate the percentage of the time spent in idle. This counter ranges from 100 (meaning always Idle) to 0 (meaning always busy).</p>|<p>**Expression**: avg(/Windows Physical Disk IOPS/DiskSaturation[({#DISKNUMLET})],5m)>=99 or avg(/Windows Physical Disk IOPS/perf_counter[" 234({#DISKNUMLET}) 1400"],1m)>=20</p><p>**Recovery expression**: avg(/Windows Physical Disk IOPS/DiskSaturation[({#DISKNUMLET})],5m)<99 or avg(/Windows Physical Disk IOPS/perf_counter[" 234({#DISKNUMLET}) 1400"],1m)<20</p>|warning|
|Disk ({#DISKNUMLET}) - Disk high latency (>20ms) since 1 minute (LLD)|<p>Should not be higher than ~20ms</p>|<p>**Expression**: avg(/Windows Physical Disk IOPS/perf_counter[" 234({#DISKNUMLET}) 212"],1m)>=20</p><p>**Recovery expression**: avg(/Windows Physical Disk IOPS/perf_counter[" 234({#DISKNUMLET}) 212"],1m)<20</p>|warning|
