# chrony

## Overview

chrony accuracy Infomation Template


Japanese version template is in the [link](cat-app/ntp/chrony-accuracy-template-japanese).  
日本語版テンプレートは[こちら](cat-app/ntp/chrony-accuracy-template-japanese)


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
|chronyc sources|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc sources]<p>Update: 10m</p>|
|NTP offset|<p>Time deviation between the NTP server</p>|`Dependent item`|Lastoffset<p>Update: 0</p>|
|NTP polling|<p>Displays the synchronization interval with the NTP server.</p>|`Dependent item`|Updateinterval<p>Update: 0</p>|
|NTP time difference (ms)|<p>Displays the difference between NTP time and system time.</p>|`Dependent item`|Systemtime_ms<p>Update: 0</p>|
|chronyReach|<p>過去8回の問合せ成功回数を8ビットで表現します。</p>|`Zabbix agent (active)`|system.run[chronyc sources|grep \* |awk '{print$5}']<p>Update: 10m</p>|
|NTP offset (long term average)|<p>Time deviation between the NTP server (long term average)</p>|`Dependent item`|RMSoffset<p>Update: 0</p>|
|Leap status|<p>Leap status Normal Insert second Delete second Not synchronized</p>|`Dependent item`|LeapStatus<p>Update: 0</p>|
|NTP synchronized server|<p>-</p>|`Dependent item`|Reference<p>Update: 0</p>|
|Network total delay|<p>Network total delay up to stratum-1.</p>|`Dependent item`|Rootdelay<p>Update: 0</p>|
|NTP time difference (direction)|<p>Displays the direction of the difference between NTP time and system time.</p>|`Dependent item`|Systemtime<p>Update: 0</p>|
|NTP stratum|<p>The stratum of the this server</p>|`Dependent item`|Stratum<p>Update: 0</p>|
|chronyc tracking|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc tracking]<p>Update: 10m</p>|
|chrony Version|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc -v]<p>Update: 1h</p>|


## Triggers

There are no triggers in this template.

