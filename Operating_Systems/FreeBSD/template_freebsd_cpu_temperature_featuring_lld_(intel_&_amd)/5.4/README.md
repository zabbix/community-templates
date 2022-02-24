# FreeBSD Core Temp

## Description

Monitor core temperature of Intel CPUs. The 'coretemp' kernel module must be loaded.

## Overview

### Update: there's an amdtemp module in FreeBSD kernel, similar to coretemp. So this should work on AMD processors, too!


 


1) load [coretemp kernel module](https://www.freebsd.org/cgi/man.cgi?coretemp): **kldload coretemp** (for Intel CPUs) or [amdtemp kernel module](https://www.freebsd.org/cgi/man.cgi?query=amdtemp): **kldload amdtemp** (for AMD CPUs)


2) add **coretemp\_load="YES"** or **amdtemp\_load="YES"** to **/boot/loader.conf**


3) create **userparameter\_coretemp.conf** file in zabbix\_agentd.conf.d, 


*** make sure you have bash installed and the Include directive is present and valid in zabbix\_agentd.conf to include individual files ***



```
UserParameter=coretemp.cpu.discovery, /usr/local/bin/bash -c 'echo -n "{\"data\":["; for i in `sysctl -a | grep "dev.cpu.*.temperature" | awk -F "." '\''{print $3}'\'' | sort -n` ; do echo -n "{\"{#CPUCORE}\":\""$i"\"}," ; done | sed "s/.$//"; echo -n "]}"'
```


```
UserParameter=coretemp.cpu[*], sysctl dev.cpu.$1.temperature | sed 's/.$//' | awk '{print $NF}'
```

 


4) restart zabbix\_agentd, import & apply the template


5) also make sure zabbix\_agentd has all the paths needed: in **/etc/rc.conf**



```
zabbix\_agentd\_paths="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"  
  
  

```


## Author

Felicián Hoppál

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU core discovery|<p>-</p>|`Zabbix agent`|coretemp.cpu.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU Core {#CPUCORE} Temp|<p>-</p>|`Zabbix agent`|coretemp.cpu[{#CPUCORE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CPU Core {#CPUCORE} temperature is above 85C on {HOST.NAME}|<p>-</p>|<p>**Expression**: avg(/FreeBSD Core Temp/coretemp.cpu[{#CPUCORE}],#3)>85</p><p>**Recovery expression**: </p>|high|
|CPU Core {#CPUCORE} temperature is above 85C on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: avg(/FreeBSD Core Temp/coretemp.cpu[{#CPUCORE}],#3)>85</p><p>**Recovery expression**: </p>|high|
