# Lenovo EMC PX4-200d

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery Perfomance|<p>An entry of one disk I/O performance.</p>|`SNMP agent`|ioEntry<p>Update: 1h</p>|
|Discovery Function|<p>Connected client count</p>|`SNMP agent`|conIndex<p>Update: 1h</p>|
|Discovery Fan|<p>Entry for connected USB device</p>|`SNMP agent`|fanEntry<p>Update: 1h</p>|
|Discovery Devices|<p>Entry for connected USB device</p>|`SNMP agent`|usbEntry<p>Update: 1h</p>|
|Discovery Disks|<p>Connected client count</p>|`SNMP agent`|diskID<p>Update: 1h</p>|
|Discovery Temp|<p>Entry for temperature sensor</p>|`SNMP agent`|tempEntry<p>Update: 1h</p>|
|Discovery Volt|<p>Entry for temperature sensor</p>|`SNMP agent`|voltEntry<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|NAS host name|<p>Iomega NAS host name.</p>|`SNMP agent`|deviceName.0<p>Update: 120s</p>|
|First DNS server|<p>The first DNS server</p>|`SNMP agent`|dns0.0<p>Update: 120s</p>|
|Media service status|<p>Whether media service is enabled 0 disable 1 enable</p>|`SNMP agent`|mediaServiceEnabled.0<p>Update: 120s</p>|
|First WINS server|<p>The first wins server</p>|`SNMP agent`|wins0.0<p>Update: 120s</p>|
|Raid level|<p>Raid level(5/10)</p>|`SNMP agent`|raidLevel.0<p>Update: 120s</p>|
|Device description|<p>Description of this device.</p>|`SNMP agent`|deviceDescr.0<p>Update: 120s</p>|
|SNMP Trap|<p>Iomega NAS notofications</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|Raid status|<p>Description of raid status. There are five different status: NORMAL REBUILDING DEGRADED REBUILDFS FAULTED</p>|`SNMP agent`|raidStatus.0<p>Update: 120s</p>|
|Backup DNS server|<p>Backup DNS server</p>|`SNMP agent`|dns1.0<p>Update: 120s</p>|
|Backup WINS server|<p>Backup wins server</p>|`SNMP agent`|wins1.0<p>Update: 120s</p>|
|Remote access status|<p>Whether RA is enabled 0 Disable 1 Enable</p>|`SNMP agent`|raEnabled.0<p>Update: 120s</p>|
|{#SNMPVALUE} Average queue lenght|<p>-</p>|`SNMP agent`|ioAvgQueue.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Average service time at disk|<p>-</p>|`SNMP agent`|ioAvgSvc.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Average disk utilization|<p>-</p>|`SNMP agent`|ioAvgUtil.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Average waiting time|<p>Average waiting time (queue + service)</p>|`SNMP agent`|ioAvgWait.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} CPU time during I/O requests|<p>Percentage of CPU time during which I/O requests were issued to the device.</p>|`SNMP agent`|ioCpuTime.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Kilobytes read per seconds|<p>-</p>|`SNMP agent`|ioKbrs.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Kilobytes written per seconds|<p>-</p>|`SNMP agent`|ioKbws.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Read merges per seconds|<p>-</p>|`SNMP agent`|ioMgrs.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Write merges per seconds|<p>-</p>|`SNMP agent`|ioMgws.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Read io request per seconds|<p>-</p>|`SNMP agent`|ioReqrs.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Write io request per seconds|<p>-</p>|`SNMP agent`|ioReqws.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|Connected client #{#SNMPVALUE} For a given protocol|<p>Connected client count for a given protocol</p>|`SNMP agent`|conCount.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|Connected client #{#SNMPVALUE} Protocol used by this kind of clients|<p>Protocol used by this kind of clients</p>|`SNMP agent`|conProtocol.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Value|<p>Rotation speed of the fan in RPM</p>|`SNMP agent`|fanValue.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|USB device #{#SNMPVALUE} Manufacture|<p>Manufucture of the device</p>|`SNMP agent`|usbManufacture.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|USB device #{#SNMPVALUE} Model|<p>Model of the USB device</p>|`SNMP agent`|usbModel.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|USB device #{#SNMPVALUE} Type|<p>USB device type(such UPS(3), PTP(6), printer(7) and so on)</p>|`SNMP agent`|usbType.[{#SNMPINDEX}]<p>Update: 120s</p><p>LLD</p>|
|{#SNMPVALUE} Capacity|<p>Capacity of disk</p>|`SNMP agent`|diskSize.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} Status|<p>Status of Disk. There are four status: NORMAL FOREIGN FAULTED MISSING</p>|`SNMP agent`|diskStatus.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} Value|<p>-</p>|`SNMP agent`|tempEntry.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} Value|<p>Entry for volt sensor</p>|`SNMP agent`|voltEntry.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#SNMPVALUE} status is faulted|<p>-</p>|<p>**Expression**: find(/Lenovo EMC PX4-200d/diskStatus.[{#SNMPINDEX}],,"like","FAULTED")=1</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} status is foreign|<p>-</p>|<p>**Expression**: find(/Lenovo EMC PX4-200d/diskStatus.[{#SNMPINDEX}],,"like","FOREIGN")=1</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} status is missing|<p>-</p>|<p>**Expression**: find(/Lenovo EMC PX4-200d/diskStatus.[{#SNMPINDEX}],,"like","MISSING")=1</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} status is faulted (LLD)|<p>-</p>|<p>**Expression**: find(/Lenovo EMC PX4-200d/diskStatus.[{#SNMPINDEX}],,"like","FAULTED")=1</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} status is foreign (LLD)|<p>-</p>|<p>**Expression**: find(/Lenovo EMC PX4-200d/diskStatus.[{#SNMPINDEX}],,"like","FOREIGN")=1</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} status is missing (LLD)|<p>-</p>|<p>**Expression**: find(/Lenovo EMC PX4-200d/diskStatus.[{#SNMPINDEX}],,"like","MISSING")=1</p><p>**Recovery expression**: </p>|high|
