# Windows ICMP Macro Discovery Active

## Overview

Sometimes we are faced with an infrastructure distributed over the Internet. In case there is no VPN, using zabbix active agents is a great way to configure monitoring of servers and workstations. But what if we just want to check the availability of the IP camera and other devices behind the NAT? Of course we should use an agent!


This template uses a macros with "!"-separated pairs for hosts and IP-addresses for LLD and makes a very simple ICMP checks for each host.



## Author

Maxim M. Demichev

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ICMP_DEVICES}|<p>-</p>|`127.0.0.1,localhost ! 127.0.1.1,camera1`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ICMP Macro Discovery|<p>-</p>|`Zabbix agent (active)`|system.run["echo {$ICMP_DEVICES} && break"]<p>Update: 10m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Overall ICMP hosts status|<p>-</p>|`External check`|zbx_app_worst_trigger.php["{HOST.HOST}", "/ICMP/"]<p>Update: 1m</p>|
|ICMP Devices Macros Content|<p>-</p>|`Zabbix agent (active)`|system.run["echo {$ICMP_DEVICES}"]<p>Update: 1h</p>|
|Response for ICMP agent ping {#ICMPDEVICENAME}|<p>-</p>|`Zabbix agent (active)`|system.run["ping -n 4 {#ICMPDEVICEIP}"]<p>Update: 5m</p><p>LLD</p>|
|{#ICMPDEVICENAME} ICMP availability|<p>-</p>|`Zabbix agent (active)`|system.run["ping -n 4 {#ICMPDEVICEIP} | find /v /c \"\""]<p>Update: 1m</p><p>LLD</p>|
|{#ICMPDEVICENAME} ICMP packet loss|<p>-</p>|`Zabbix agent (active)`|system.run["ping -n 4 {#ICMPDEVICEIP} | findstr [0-9]"]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Недоступен узел {#ARPADDRESS} во внутренней сети|<p>-</p>|<p>**Expression**: last(/Windows ICMP Macro Discovery Active/system.run["ping -n 4 {#ICMPDEVICEIP} | find /v /c " ""])=0</p><p>**Recovery expression**: </p>|information|
|Недоступен узел {#ARPADDRESS} во внутренней сети (LLD)|<p>-</p>|<p>**Expression**: last(/Windows ICMP Macro Discovery Active/system.run["ping -n 4 {#ICMPDEVICEIP} | find /v /c " ""])=0</p><p>**Recovery expression**: </p>|information|
