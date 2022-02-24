# chrony

## Overview

chrony accuracy Infomation Template


Japanese version template is in the .  
日本語版テンプレートは


Sammeln Sie alle Informationen, die in der chronyc Befehl angezeigt wird.


When you use a template  
Please make the following settings zabbix\_agentd.conf.


EnableRemoteCommands=1


UnsafeUserParameters=1


 
 

In ZabbixAgent is installed environment  
It will use the chrony template.  



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$NTP_OFFSET}|<p>-</p>|`50`|Text macro|
|{$NTP_OFFSET_LARGE}|<p>-</p>|`5000`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|NTP offset (long term average)|<p>Time deviation between the NTP server (long term average)</p>|`Zabbix agent (active)`|system.run[chronyc tracking |grep "RMS offset"|awk '{print$4}']<p>Update: 600</p>|
|chronyc tracking|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc tracking]<p>Update: 600</p>|
|NTP offset|<p>Time deviation between the NTP server</p>|`Zabbix agent (active)`|system.run[chronyc tracking |grep "Last offset"|awk '{print$4}']<p>Update: 600</p>|
|Network total delay|<p>Network total delay up to stratum-1.</p>|`Zabbix agent (active)`|system.run[chronyc tracking |grep "Root delay"|awk '{print$4}']<p>Update: 10</p>|
|NTP stratum|<p>The stratum of the synchronous NTP server</p>|`Zabbix agent (active)`|system.run[chronyc sources|grep \* |awk '{print$3}']<p>Update: 1800</p>|
|NTP polling|<p>Displays the synchronization interval with the NTP server.</p>|`Zabbix agent (active)`|system.run[chronyc tracking |grep "Update interval"|awk '{print$4}']<p>Update: 600</p>|
|NTP time difference (direction)|<p>Displays the direction of the difference between NTP time and system time.</p>|`Zabbix agent (active)`|system.run[chronyc tracking |grep "System time"|awk '{print$6}']<p>Update: 10</p>|
|chrony Version|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc -v]<p>Update: 3600</p>|
|chronyReach|<p>過去8回の問合せ成功回数を8ビットで表現します。</p>|`Zabbix agent (active)`|system.run[chronyc sources|grep \* |awk '{print$5}']<p>Update: 600</p>|
|NTP time difference (ms)|<p>Displays the difference between NTP time and system time.</p>|`Zabbix agent (active)`|system.run[chronyc tracking |grep "System time"|awk '{print$4}']<p>Update: 10</p>|
|NTP synchronized server|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc sources|grep \* |awk '{print$2}']<p>Update: 600</p>|
|chronyc sources|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc sources]<p>Update: 600</p>|
|Leap status|<p>Leap status Normal Insert second Delete second Not synchronized</p>|`Zabbix agent (active)`|system.run[chronyc tracking |grep "Leap status"|awk '{print$4}']<p>Update: 600</p>|


## Triggers

There are no triggers in this template.

