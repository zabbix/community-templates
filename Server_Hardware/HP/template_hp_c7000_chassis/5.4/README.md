# HP C7000 Chassis (EN)

## Description

This template requires the MIBs: CPQRACK-MIB CPQHOST-MIB These are referenced in the template, not the full numeric OID.

## Overview

Based on the C7000 Chassis template by Vladimir Marakshin.


This has been updated to work with Zabbix 4.2. It has had some Russian changed to English, and added the Onboard Administrators to the discovery rule. It also only discovers device bays that have a device in them.


Note that this template required the HP/CPQ MIBs, and still does. It does not use numeric OIDs.


The MIB files can be downloaded from HPE. This link worked to reach the MIB Kit when this was uploaded:


<https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-c04272529>


At least the cpqhost.mib and cpqrack.mib MIBs must be installed in your Zabbix server/proxy (the host that executes the SNMP checks). On a CentOS/RHEL system, that is in /usr/share/snmp/mibs. After they are installed, the Zabbix server/proxy must be restarted.


See the Github project for more recent versions.


<https://github.com/lweeks/zabbix_hp_c7000>



## Author

Lawrence Weeks

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Temperature sensors|<p>The filter on this item prototype excludes temperature sensors with a threshold of -1.</p>|`SNMP agent`|snmp.discovery_env<p>Update: 43200</p>|
|Fan modules|<p>-</p>|`SNMP agent`|snmp.discovery_fans<p>Update: 43200</p>|
|Onboard Administrator modules|<p>-</p>|`SNMP agent`|snmp.discovery_mgr<p>Update: 43200</p>|
|Interconnect modules|<p>-</p>|`SNMP agent`|snmp.discovery_net<p>Update: 43200</p>|
|Device slots|<p>-</p>|`SNMP agent`|snmp.discovery_bays<p>Update: 43200</p>|
|Power units|<p>-</p>|`SNMP agent`|snmp.discovery_power<p>Update: 43200</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Part number of Chassis|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosurePartNumber.1<p>Update: 72000</p>|
|S/N of Chassis|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureSerialNum.1<p>Update: 72000</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 300</p>|
|Power redundancy state|<p>-</p>|`SNMP agent`|cpqRackPowerEnclosureRedundant.1<p>Update: 600</p>|
|FW version of Chassis|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureFWRev.1<p>Update: 72000</p>|
|Name of Chassis|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureName.1<p>Update: 72000</p>|
|Temperature ({#SNMPVALUE}, ID: {#SNMPINDEX})|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureTempCurrent[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Critical temperature ({#SNMPVALUE} ID: {#SNMPINDEX})|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureTempThreshold[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Fan module state {#SNMPINDEX}|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureFanCondition[{#SNMPINDEX}]<p>Update: 600</p><p>LLD</p>|
|OA {#MGR_INDEX} Condition|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureManagerCondition[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|OA {#MGR_INDEX} Firmware|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureManagerFWRev[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|OA {#MGR_INDEX} Part Number|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureManagerPartNumber[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|OA {#MGR_INDEX} Redundant|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureManagerRedundant[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|OA {#MGR_INDEX} Role|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureManagerRole[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|OA {#MGR_INDEX} Serial Number|<p>-</p>|`SNMP agent`|cpqRackCommonEnclosureManagerSerialNum[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|PN Interconnect-module (Slot: {#SNMPINDEX})|<p>-</p>|`SNMP agent`|cpqRackNetConnectorPartNumber[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|SN Interconnect-module (Slot: {#SNMPINDEX})|<p>-</p>|`SNMP agent`|cpqRackNetConnectorSerialNum[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|PN blade {#SNMPVALUE} (Slot: {#SNMPINDEX})|<p>-</p>|`SNMP agent`|cpqRackServerBladePartNumber[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|SN blade {#SNMPVALUE} (Slot: {#SNMPINDEX})|<p>-</p>|`SNMP agent`|cpqRackServerBladeSerialNum[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Blade state {#SNMPVALUE} (Slot: {#SNMPINDEX})|<p>-</p>|`SNMP agent`|cpqRackServerBladeStatus[{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|Output load on PU {#SNMPINDEX}|<p>-</p>|`SNMP agent`|cpqRackPowerSupplyCurPwrOutput[{#SNMPINDEX}]<p>Update: 600</p><p>LLD</p>|
|PU Input status {#SNMPINDEX}|<p>-</p>|`SNMP agent`|cpqRackPowerSupplyInputLineStatus[{#SNMPINDEX}]<p>Update: 600</p><p>LLD</p>|
|PU Status {#SNMPINDEX}|<p>-</p>|`SNMP agent`|cpqRackPowerSupplyStatus[{#SNMPINDEX}]<p>Update: 600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Blade state {#SNMPVALUE} (Slot: {#SNMPINDEX})|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackServerBladeStatus[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
|Temperature {#SNMPVALUE} is high (20C)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureTempThreshold[{#SNMPINDEX}])-last(/bl7000_EN/cpqRackCommonEnclosureTempCurrent[{#SNMPINDEX}])<20 and last(/bl7000_EN/cpqRackCommonEnclosureTempCurrent[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|average|
|Temperature {#SNMPVALUE} is too high (10C)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureTempThreshold[{#SNMPINDEX}])-last(/bl7000_EN/cpqRackCommonEnclosureTempCurrent[{#SNMPINDEX}])<10 and last(/bl7000_EN/cpqRackCommonEnclosureTempCurrent[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|high|
|Fan module state {#SNMPINDEX}|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureFanCondition[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
|OA module {#MGR_INDEX} condition|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureManagerCondition[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
|OA module {#MGR_INDEX} redundancy|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureManagerRedundant[{#SNMPINDEX}])<>3</p><p>**Recovery expression**: </p>|high|
|OA module {#MGR_INDEX} role|<p>-</p>|<p>**Expression**: (last(/bl7000_EN/cpqRackCommonEnclosureManagerRole[{#SNMPINDEX}],#1)<>last(/bl7000_EN/cpqRackCommonEnclosureManagerRole[{#SNMPINDEX}],#2))=1</p><p>**Recovery expression**: </p>|warning|
|Input power status on PU {#SNMPINDEX}|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackPowerSupplyInputLineStatus[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|PU Status {#SNMINDEX}|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackPowerSupplyStatus[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Temperature {#SNMPVALUE} is high (20C) (LLD)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureTempThreshold[{#SNMPINDEX}])-last(/bl7000_EN/cpqRackCommonEnclosureTempCurrent[{#SNMPINDEX}])<20 and last(/bl7000_EN/cpqRackCommonEnclosureTempCurrent[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|average|
|Temperature {#SNMPVALUE} is too high (10C) (LLD)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureTempThreshold[{#SNMPINDEX}])-last(/bl7000_EN/cpqRackCommonEnclosureTempCurrent[{#SNMPINDEX}])<10 and last(/bl7000_EN/cpqRackCommonEnclosureTempCurrent[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|high|
|Fan module state {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureFanCondition[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
|OA module {#MGR_INDEX} condition (LLD)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureManagerCondition[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
|OA module {#MGR_INDEX} redundancy (LLD)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackCommonEnclosureManagerRedundant[{#SNMPINDEX}])<>3</p><p>**Recovery expression**: </p>|high|
|OA module {#MGR_INDEX} role (LLD)|<p>-</p>|<p>**Expression**: (last(/bl7000_EN/cpqRackCommonEnclosureManagerRole[{#SNMPINDEX}],#1)<>last(/bl7000_EN/cpqRackCommonEnclosureManagerRole[{#SNMPINDEX}],#2))=1</p><p>**Recovery expression**: </p>|warning|
|Blade state {#SNMPVALUE} (Slot: {#SNMPINDEX}) (LLD)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackServerBladeStatus[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
|Input power status on PU {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackPowerSupplyInputLineStatus[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|PU Status {#SNMINDEX} (LLD)|<p>-</p>|<p>**Expression**: last(/bl7000_EN/cpqRackPowerSupplyStatus[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
