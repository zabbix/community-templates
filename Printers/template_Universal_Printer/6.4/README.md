# Universal Printer Template

## Description

This template is valid for all printer manufacturers and all devices that are attached to the [RFC1759](https://tools.ietf.org/html/rfc1759.html) and [RFC3805](https://tools.ietf.org/html/rfc3805) (Printer-MIB).

## Overview

The serial number, trays, toner and output trays are discovered (LLD) and monitored. The counter and filling levels are displayed in graphs.

### The following components are detected:

#### Input

- Input trays
- Manual feed

#### Media Transfer

- Simplex Module
- Duplex Module

#### Supplies

- Toner cartridges
- Drumps
- Transfer Kit
- Waste Toner Box

#### Output

- Output trays
- Finisher

 



## Author

Nico Wieczorek

https://github.com/nwiecz/Zabbix-Templates



## Macros used

There are no macros links in this template.


## Template links

Network Generic Device by SNMP

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Cover|<p>-</p>|`SNMP agent`|prtCoverDescription<p>Update: 1h</p>|
|Input|<p>-</p>|`SNMP agent`|prtInputDescription<p>Update: 1h</p>|
|Media Path|<p>-</p>|`SNMP agent`|prtMediaPathDescription<p>Update: 1h</p>|
|Output|<p>-</p>|`SNMP agent`|prtOutputDescription<p>Update: 1h</p>|
|Supplies|<p>-</p>|`SNMP agent`|prtMarkerSuppliesDescription<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device console display|<p>-</p>|`SNMP agent`|prtConsoleDisplayBufferText<p>Update: 1m</p>|
|Device MAC address|<p>-</p>|`SNMP agent`|ifPhysAddress<p>Update: 1h</p>|
|Device Type|<p>-</p>|`SNMP agent`|hrDeviceDescr<p>Update: 12h</p>|
|Printer error state|<p>-</p>|`SNMP agent`|hrPrinterDetectedErrorState<p>Update: 1m</p>|
|Printer lifetime counter|<p>-</p>|`SNMP agent`|prtMarkerLifeCount<p>Update: 1m</p>|
|Printer power on counter|<p>-</p>|`SNMP agent`|prtMarkerPowerOnCount<p>Update: 1m</p>|
|Printer serial number|<p>-</p>|`SNMP agent`|prtGeneralSerialNumber<p>Update: 12h</p>|
|Printer status|<p>-</p>|`SNMP agent`|hrPrinterStatus<p>Update: 1m</p>|
|Cover $1|<p>-</p>|`SNMP agent`|prtCoverDescription[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Cover Status of $1|<p>-</p>|`SNMP agent`|prtCoverStatus[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Input $1|<p>-</p>|`SNMP agent`|prtInputDescription[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Input Capacity $1|<p>-</p>|`Calculated`|prtInputCapacity[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Input current level $1|<p>-</p>|`SNMP agent`|prtInputCurrentLevel[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Input max capacity $1|<p>-</p>|`SNMP agent`|prtInputMaxCapacity[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Input Media Name $1|<p>-</p>|`SNMP agent`|prtInputMediaName[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Input Model $1|<p>-</p>|`SNMP agent`|prtInputModel[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Input SerialNumber $1|<p>-</p>|`SNMP agent`|prtInputSerialNumber[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Input status $1|<p>-</p>|`SNMP agent`|prtInputStatus[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Input Type $1|<p>-</p>|`SNMP agent`|prtInputType[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Media Path Description of supplies $1|<p>-</p>|`SNMP agent`|prtMediaPathDescription[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Media Path Status of supplies $1|<p>-</p>|`SNMP agent`|prtMediaPathStatus[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Media Path Type of supplies $1|<p>-</p>|`SNMP agent`|prtMediaPathType[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Output $1|<p>-</p>|`SNMP agent`|prtOutputDescription[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Output max Capacity $1|<p>-</p>|`SNMP agent`|prtOutputMaxCapacity[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Output remaining Capacity $1|<p>-</p>|`SNMP agent`|prtOutputRemainingCapacity[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Output Status $1|<p>-</p>|`SNMP agent`|prtOutputStatus[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Capacity of supplies $1|<p>-</p>|`Calculated`|prtMarkerSuppliesCapacity[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Color Value of supplies $1|<p>-</p>|`SNMP agent`|prtMarkerColorantValue[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Description of supplies $1|<p>-</p>|`SNMP agent`|prtMarkerSuppliesDescription[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Level of supplies $1|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevel[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|max Capacity of supplies $1|<p>-</p>|`SNMP agent`|prtMarkerSuppliesMaxCapacity[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Error ({ITEM.VALUE}) on Printer {HOST.NAME}|<p>-</p>|<p>**Expression**: last(/Universal Printer/hrPrinterDetectedErrorState,#1:now-600s)<>0</p>|Warning|
|Cover {#SNMPVALUE} on printer {HOST.NAME} is not closed (LLD)|<p>-</p>|<p>**Expression**: last(/Universal Printer/prtCoverStatus[{#SNMPVALUE}],#1:now-600s)<>4 and last(/Universal Printer/prtCoverStatus[{#SNMPVALUE}],#1:now-600s)<>6</p>|Information|
|Input {#SNMPVALUE} on printer {HOST.NAME} has changed (LLD)|<p>-</p>|<p>**Expression**: last(/Universal Printer/prtInputStatus[{#SNMPVALUE}],#1:now-600s)<>0</p>|Information|
|Output {#SNMPVALUE} on printer {HOST.NAME} has changed (LLD)|<p>-</p>|<p>**Expression**: last(/Universal Printer/prtOutputStatus[{#SNMPVALUE}],#1:now-600s)<>0</p>|Information|
|Toner {#SNMPVALUE} is low on printer {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: last(/Universal Printer/prtMarkerSuppliesCapacity[{#SNMPVALUE}])<10</p>|Warning|
