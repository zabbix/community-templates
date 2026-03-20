# Other - NeoXL

## Overview

The template is based on the "BDT-MS-MIB" (Version 201702211500Z). The SNMP capabilities of the libaries are pretty limited. All possible values are being checked and triggers are being used.


**Features**


* Check of the Health Status of the Library
* Scan for Modules/Expansions
* Check of the "Drive Power Module" of each Expansion
* Check of the "Power Supply Status" of each Expansion
* Inventory Checks like Installed Firmware, Serial Number and so on.




---


Template was tested with a NEOxl 80 and Firmware 2.80.



## Author

Marcel Wiechmann

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|
|Template Module Generic SNMP|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BDT Module Discovery|<p>-</p>|`SNMP agent`|BdtDeviceStatModEntry<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device Robotic FW Revision|<p>-</p>|`SNMP agent`|bdtDeviceDatRoboticSWRev<p>Update: 1h</p>|
|Device Robotic HW Revision|<p>-</p>|`SNMP agent`|bdtDeviceDatRoboticHWRev<p>Update: 1h</p>|
|Current Device Activity|<p>-</p>|`SNMP agent`|bdtDeviceStatAct<p>Update: 5m</p>|
|Device World Wide ID|<p>-</p>|`SNMP agent`|bdtDeviceDatWWI<p>Update: 1h</p>|
|Device SW Revision|<p>-</p>|`SNMP agent`|bdtDeviceDatSWRevision<p>Update: 1h</p>|
|Device Serial Number|<p>-</p>|`SNMP agent`|bdtDeviceDatSerialNum<p>Update: 1h</p>|
|Current Device Health Status|<p>-</p>|`SNMP agent`|bdtDeviceStatHealth<p>Update: 5m</p>|
|Device SW Build Date|<p>-</p>|`SNMP agent`|bdtDeviceDatSWBuildDate<p>Update: 1h</p>|
|Current Module {#SNMPINDEX} Drive Power Module 1 Status|<p>-</p>|`SNMP agent`|bdtDeviceStatModEntryDPwr1[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Current Module {#SNMPINDEX} Drive Power Module 2 Status|<p>-</p>|`SNMP agent`|bdtDeviceStatModEntryDPwr2[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Current Module {#SNMPINDEX} Health Stat|<p>-</p>|`SNMP agent`|bdtDeviceStatModEntryHealth[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Current Module {#SNMPINDEX} Power Supply Status|<p>-</p>|`SNMP agent`|bdtDeviceStatModEntryPwrSupply[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Drive Power Module 1 Status of Module {#MODULE_ID} is NOT ok|<p>-</p>|<p>**Expression**: {Other - NeoXL:bdtDeviceStatModEntryDPwr1[{#SNMPINDEX}].regexp(OK)}=0</p><p>**Recovery expression**: </p>|warning|
|Drive Power Module 2 Status of Module {#MODULE_ID} is NOT ok|<p>-</p>|<p>**Expression**: {Other - NeoXL:bdtDeviceStatModEntryDPwr2[{#SNMPINDEX}].regexp(OK)}=0</p><p>**Recovery expression**: </p>|warning|
|Power Supply Status of Module {#MODULE_ID} is NOT ok|<p>-</p>|<p>**Expression**: {Other - NeoXL:bdtDeviceStatModEntryPwrSupply[{#SNMPINDEX}].regexp(OK)}=0</p><p>**Recovery expression**: </p>|warning|
|Drive Power Module 1 Status of Module {#MODULE_ID} is NOT ok (LLD)|<p>-</p>|<p>**Expression**: {Other - NeoXL:bdtDeviceStatModEntryDPwr1[{#SNMPINDEX}].regexp(OK)}=0</p><p>**Recovery expression**: </p>|warning|
|Drive Power Module 2 Status of Module {#MODULE_ID} is NOT ok (LLD)|<p>-</p>|<p>**Expression**: {Other - NeoXL:bdtDeviceStatModEntryDPwr2[{#SNMPINDEX}].regexp(OK)}=0</p><p>**Recovery expression**: </p>|warning|
|Power Supply Status of Module {#MODULE_ID} is NOT ok (LLD)|<p>-</p>|<p>**Expression**: {Other - NeoXL:bdtDeviceStatModEntryPwrSupply[{#SNMPINDEX}].regexp(OK)}=0</p><p>**Recovery expression**: </p>|warning|
