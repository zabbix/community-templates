# Palo Alto SNMPv2 64-bit counters

## Overview

Hi everyone,


I created this template because i updated two Palo Alto from 8.1.4 to 9.0.3 and some counter went from 32 to 64bits 


I just modified the template below from Pavol Rehak so check it out (for details details and trap configuration) :


[https://share.zabbix.com/network\_devices/palo-alto/paloalto-snmpv3-zabbix4-0](network_devices/palo-alto/paloalto-snmpv3-zabbix4-0)


 


I changed all snmpv3 to snmpv2 and added graphs for discovered interface traffic (in & out)


I had some error on storage discovery too that i fixed


 


###


NAME : Template Palo Alto SNMPv2 64-bit counters


### 


TESTED : zabbix 4.2 and PAN OS 9.0.3-h3 but should work on zabbix 3.4 and PAN OS 8.1



## Author

Remi Chanoine

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|entPhysical discovery - Temperature|<p>-</p>|`SNMP agent`|entPhysicalName.discovery<p>Update: 1d</p>|
|hrStorage discovery|<p>-</p>|`SNMP agent`|hrStorageDescr.discovery<p>Update: 1d</p>|
|CPU discovery|<p>-</p>|`SNMP agent`|hrDeviceDescr.discovery<p>Update: 1d</p>|
|interface discovery|<p>-</p>|`SNMP agent`|ifName.discovery<p>Update: 1d</p>|
|entPhysical discovery - Fan|<p>-</p>|`SNMP agent`|entPhysicalName.discovery.fan<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Uptime|<p>"The amount of time since this host was last initialized. Note that this is different from sysUpTime in the SNMPv2-MIB [RFC1907] because sysUpTime is the uptime of the network management portion of the system."</p>|`SNMP agent`|hrSystemUptime.0<p>Update: 1m</p>|
|Hostname|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name.</p>|`SNMP agent`|sysName.0<p>Update: 1d</p>|
|HA mode|<p>Current high-availability peer state.</p>|`SNMP agent`|panSysHAMode.0<p>Update: 12h</p>|
|HA status trap|<p>-</p>|`SNMP trap`|snmptrap["HA link change"]<p>Update: 0</p>|
|HA peer state|<p>Current high-availability peer state.</p>|`SNMP agent`|panSysHAPeerState.0<p>Update: 1m</p>|
|System shutdown|<p>-</p>|`SNMP trap`|snmptrap["System shutdown"]<p>Update: 0</p>|
|General trap|<p>-</p>|`SNMP trap`|snmptrap["General trap"]<p>Update: 0</p>|
|HA state|<p>Current high-availability state.</p>|`SNMP agent`|panSysHAState.0<p>Update: 1m</p>|
|Undefined traps|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software. It is mandatory that this only contain printable ASCII characters.</p>|`SNMP agent`|sysDescr.0<p>Update: 1d</p>|
|$1 opration status|<p>"The operational status of the sensor."</p>|`SNMP agent`|entPhySensorOperStatus.["{#PHY}"]<p>Update: 1m</p><p>LLD</p>|
|$1 sensor value|<p>The most recent measurement obtained by the agent for this sensor.</p>|`SNMP agent`|entPhySensorValue.["{#PHY}"]<p>Update: 1m</p><p>LLD</p>|
|$1 class|<p>-</p>|`SNMP agent`|entPhysicalClass.["{#PHY}"]<p>Update: 1m</p><p>LLD</p>|
|$1 sensor description|<p>-</p>|`SNMP agent`|entPhysicalDescr.["{#PHY}"]<p>Update: 1d</p><p>LLD</p>|
|$1 storage size|<p>-</p>|`SNMP agent`|hrStorageSize.["{#STOR}"]<p>Update: 30m</p><p>LLD</p>|
|$1 storage type|<p>-</p>|`SNMP agent`|hrStorageType.["{#STOR}"]<p>Update: 12h</p><p>LLD</p>|
|$1 storage used|<p>-</p>|`SNMP agent`|hrStorageUsed.["{#STOR}"]<p>Update: 1m</p><p>LLD</p>|
|{#CPU} status|<p>"The current operational state of the device described by this row of the table. A value unknown(1) indicates that the current state of the device is unknown. running(2) indicates that the device is up and running and that no unusual error conditions are known. The warning(3) state indicates that agent has been informed of an unusual error condition by the operational software (e.g., a disk device driver) but that the device is still 'operational'. An example would be a high number of soft errors on a disk. A value of testing(4), indicates that the device is not available for use because it is in the testing state. The state of down(5) is used only when the agent has been informed that the device is not available for any use."</p>|`SNMP agent`|hrDeviceStatus.["{#CPU}"]<p>Update: 1m</p><p>LLD</p>|
|{#CPU} load - percentage|<p>"The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary."</p>|`SNMP agent`|hrProcessorLoad.["{#CPU}"]<p>Update: 1m</p><p>LLD</p>|
|$1 admin status|<p>-</p>|`SNMP agent`|ifAdminStatus.["{#IFNAME}"]<p>Update: 2m</p><p>LLD</p>|
|$1 alias (description)|<p>-</p>|`SNMP agent`|ifAlias.["{#IFNAME}"]<p>Update: 6h</p><p>LLD</p>|
|$1 input traffic (30 sec)|<p>-</p>|`SNMP agent`|ifHCInOctets.["{#IFNAME}"]<p>Update: 30s</p><p>LLD</p>|
|$1 output traffic (30 sec)|<p>-</p>|`SNMP agent`|ifHCOutOctets.["{#IFNAME}"]<p>Update: 30s</p><p>LLD</p>|
|$1 link status|<p>-</p>|`SNMP agent`|ifOperStatus.["{#IFNAME}"]<p>Update: 2m</p><p>LLD</p>|
|$1 opration status|<p>-</p>|`SNMP agent`|entPhySensorOperStatus.fan.["{#PHY}"]<p>Update: 1m</p><p>LLD</p>|
|$1 sensor value|<p>-</p>|`SNMP agent`|entPhySensorValue.fan.["{#PHY}"]<p>Update: 1m</p><p>LLD</p>|
|$1 class|<p>-</p>|`SNMP agent`|entPhysicalClass.fan.["{#PHY}"]<p>Update: 1m</p><p>LLD</p>|
|$1 sensor description|<p>-</p>|`SNMP agent`|entPhysicalDescr.fan.["{#PHY}"]<p>Update: 1d</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#PHY} sensor status not ok|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorOperStatus.["{#PHY}"].last()}<>1</p><p>**Recovery expression**: </p>|average|
|{#PHY} temperature above 65 °C|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorValue.["{#PHY}"].last()}>65</p><p>**Recovery expression**: </p>|average|
|{#PHY} temperature above 70 °C|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorValue.["{#PHY}"].last()}>70</p><p>**Recovery expression**: </p>|high|
|{#PHY} temperature above 80 °C|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorValue.["{#PHY}"].last()}>80</p><p>**Recovery expression**: </p>|disaster|
|{#PHY} sensor status not ok|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorOperStatus.fan.["{#PHY}"].last()}<>1</p><p>**Recovery expression**: </p>|average|
|{#CPU} status down|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrDeviceStatus.["{#CPU}"].last()}=5</p><p>**Recovery expression**: </p>|average|
|{#CPU} status warning|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrDeviceStatus.["{#CPU}"].last()}=3</p><p>**Recovery expression**: </p>|warning|
|CPU load on {#CPU} more than 90%|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrProcessorLoad.["{#CPU}"].last()}>90</p><p>**Recovery expression**: </p>|average|
|CPU load on {#CPU} more than 95%|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrProcessorLoad.["{#CPU}"].last()}>95</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 2% on {#STOR}|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrStorageUsed.["{#STOR}"].last()} / {Palo Alto SNMPv2 64-bit counters:hrStorageSize.["{#STOR}"].last()} * 100 > 98</p><p>**Recovery expression**: </p>|disaster|
|Free disk space is less than 5% on {#STOR}|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrStorageUsed.["{#STOR}"].last()} / {Palo Alto SNMPv2 64-bit counters:hrStorageSize.["{#STOR}"].last()} * 100 > 95</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 10% on {#STOR}|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrStorageUsed.["{#STOR}"].last()} / {Palo Alto SNMPv2 64-bit counters:hrStorageSize.["{#STOR}"].last()} * 100 > 90</p><p>**Recovery expression**: </p>|average|
|{#IFNAME} interface down|<p>interface ifAdminStatus is up(1) and ifOperStatus is down(2)</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:ifAdminStatus.["{#IFNAME}"].last()}=1 and {Palo Alto SNMPv2 64-bit counters:ifOperStatus.["{#IFNAME}"].last()}=2</p><p>**Recovery expression**: </p>|high|
|{#PHY} sensor status not ok (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorOperStatus.["{#PHY}"].last()}<>1</p><p>**Recovery expression**: </p>|average|
|{#PHY} temperature above 65 °C (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorValue.["{#PHY}"].last()}>65</p><p>**Recovery expression**: </p>|average|
|{#PHY} temperature above 70 °C (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorValue.["{#PHY}"].last()}>70</p><p>**Recovery expression**: </p>|high|
|{#PHY} temperature above 80 °C (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorValue.["{#PHY}"].last()}>80</p><p>**Recovery expression**: </p>|disaster|
|Free disk space is less than 2% on {#STOR} (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrStorageUsed.["{#STOR}"].last()} / {Palo Alto SNMPv2 64-bit counters:hrStorageSize.["{#STOR}"].last()} * 100 > 98</p><p>**Recovery expression**: </p>|disaster|
|Free disk space is less than 5% on {#STOR} (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrStorageUsed.["{#STOR}"].last()} / {Palo Alto SNMPv2 64-bit counters:hrStorageSize.["{#STOR}"].last()} * 100 > 95</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 10% on {#STOR} (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrStorageUsed.["{#STOR}"].last()} / {Palo Alto SNMPv2 64-bit counters:hrStorageSize.["{#STOR}"].last()} * 100 > 90</p><p>**Recovery expression**: </p>|average|
|{#CPU} status down (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrDeviceStatus.["{#CPU}"].last()}=5</p><p>**Recovery expression**: </p>|average|
|{#CPU} status warning (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrDeviceStatus.["{#CPU}"].last()}=3</p><p>**Recovery expression**: </p>|warning|
|CPU load on {#CPU} more than 90% (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrProcessorLoad.["{#CPU}"].last()}>90</p><p>**Recovery expression**: </p>|average|
|CPU load on {#CPU} more than 95% (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:hrProcessorLoad.["{#CPU}"].last()}>95</p><p>**Recovery expression**: </p>|high|
|{#IFNAME} interface down (LLD)|<p>interface ifAdminStatus is up(1) and ifOperStatus is down(2)</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:ifAdminStatus.["{#IFNAME}"].last()}=1 and {Palo Alto SNMPv2 64-bit counters:ifOperStatus.["{#IFNAME}"].last()}=2</p><p>**Recovery expression**: </p>|high|
|{#PHY} sensor status not ok (LLD)|<p>-</p>|<p>**Expression**: {Palo Alto SNMPv2 64-bit counters:entPhySensorOperStatus.fan.["{#PHY}"].last()}<>1</p><p>**Recovery expression**: </p>|average|
