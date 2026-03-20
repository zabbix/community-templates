# Template SNMP D-Link DES-1210-28

Autor: m.beloglazov@gmail.com

Template: Template D-link DES-1210-28 SNMP

Version Zabbix: 3.0## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info||


#----|-----------|----|----|
|LLD Interfaces|<p>-</p>|`SNMP agent`|dlink.des1210.snmp.discovery<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of network interfaces|<p>-</p>|`SNMP agent`|dlink.des1210.ifNumber<p>Update: 3600</p>|
|Device name|<p>-</p>|`SNMP agent`|dlink.des1210.sysName<p>Update: 3600</p>|
|Device uptime|<p>-</p>|`SNMP agent`|dlink.des1210.sysUpTime<p>Update: 60</p>|
|Device description|<p>-</p>|`SNMP agent`|dlink.des1210.sysDescr<p>Update: 3600</p>|
|Device location|<p>-</p>|`SNMP agent`|dlink.des1210.sysLocation<p>Update: 3600</p>|
|Interface {#SNMPINDEX} DuplexStatus|<p>unknown(1) halfDuplex(2) fullDuplex(3)</p>|`SNMP agent`|dlink.des1210.duplexstatus[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface $1 Inbound errors|<p>-</p>|`SNMP agent`|dlink.des1210.ifInErrors[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface $1 In|<p>Incoming traffic on interface</p>|`SNMP agent`|dlink.des1210.ifInOctets[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Interface $1 Operational status|<p>-</p>|`SNMP agent`|dlink.des1210.ifOperStatus[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|interface $1 Outbound errors|<p>-</p>|`SNMP agent`|dlink.des1210.ifOutErrors[{#SNMPINDEX}]<p>Update: 60|


#Interface $1 Out|<p>Outgoing traffic on interface</p>|`SNMP agent`|dlink.des1210.ifOutOctets[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Interface $1 Speed|<p>-</p>|`SNMP agent`|dlink.des1210.ifSpeed[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} Errors on network interface {#SNMPINDEX}|<p>-</p>|<p>**Expression**: avg(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifInErrors[{#SNMPINDEX}],1800s)>1 or avg(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOutErrors[{#SNMPINDEX}],1800s)>1</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME} Interface {#SNMPINDEX} is down.|<p>-</p>|<p>**Expression**: last(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOperStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Interface {#SNMPINDEX} is up.|<p>-</p>|<p>**Expression**: last(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOperStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Operational status was changed on interface {#SNMPINDEX}|<p>-</p>|<p>**Expression**: (last(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOperStatus[{#SNMPINDEX}],#1)<>last(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOperStatus[{#SNMPINDEX}],#2))=1</p><p>**Recovery expression**: </p>|information|
|{HOST.NAME} Errors on network interface {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: avg(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifInErrors[{#SNMPINDEX}],1800s)>1 or avg(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOutErrors[{#SNMPINDEX}],1800s)>1</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME} Interface {#SNMPINDEX} is down. (LLD)|<p>-</p>|<p>**Expression**: last(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOperStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Interface {#SNMPINDEX} is up. (LLD)|<p>-</p>|<p>**Expression**: last(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOperStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Operational status was changed on interface {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: (last(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOperStatus[{#SNMPINDEX}],#1)<>last(/Template SNMP D-Link DES-1210-28/dlink.des1210.ifOperStatus[{#SNMPINDEX}],#2))=1</p><p>**Recovery expression**: </p>|information|
