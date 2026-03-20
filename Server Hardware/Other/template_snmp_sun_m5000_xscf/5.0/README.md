# SNMP XSCF Sun M5000

## Description

please set {$SNMP_COMMUNITY} macros

## Overview

Simple template to monitor Sun M5000 server over SNMP by XSCF


This template contains:


Firmware state, Hardware state, Ambient Temperature, Serial Number, System State, System Type


CPU discovery


Fan Discovery


Memory board discovery


Memory Unit discovery


<p style="margin: 0px 0px 1.5em

## Author

Dmitry Lavrukhin

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory unit discovery|<p>-</p>|`SNMP agent`|scfComponentTable.mem<p>Update: 86400</p>|
|CPU discovery|<p>-</p>|`SNMP agent`|scfComponentTable.cpu<p>Update: 86400</p>|
|Fan discovery|<p>-</p>|`SNMP agent`|scfComponentTable.fan<p>Update: 86400</p>|
|Memory Board discovery|<p>-</p>|`SNMP agent`|scfComponentTable.memb<p>Update: 86400</p>|
|PSU discovery|<p>-</p>|`SNMP agent`|scfComponentTable.psu<p>Update: 86400</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|scfFirmwareState|<p>SCF software state normal(1), degraded(2), faulted(3), change(254), unknown(255)</p>|`SNMP agent`|scfFirmwareState<p>Update: 3600</p>|
|scfSystemType|<p>-</p>|`SNMP agent`|scfSystemType<p>Update: 86400</p>|
|scfSystemState|<p>Overall system state normal(1), degraded(2), faulted(3), change(254), unknown(255)</p>|`SNMP agent`|scfSystemState<p>Update: 3600</p>|
|scfSystemAmbientTemperatureValue|<p>-</p>|`SNMP agent`|scfSystemAmbientTemperatureValue<p>Update: 600</p>|
|scfSystemSerialNumber|<p>-</p>|`SNMP agent`|scfSystemSerialNumber<p>Update: 86400</p>|
|scfHardwareState|<p>Overall system hardware state normal(1), degraded(2), faulted(3), change(254), unknown(255)</p>|`SNMP agent`|scfHardwareState<p>Update: 3600</p>|
|Memory unit {#BOARDID} status|<p>-</p>|`SNMP agent`|mem.statsu[{#BOARDID}]<p>Update: 60</p><p>LLD</p>|
|CPU {#BOARDID}-{#MODULEID} status|<p>-</p>|`SNMP agent`|cpu.status[{#BOARDID}-{#MODULEID}]<p>Update: 60</p><p>LLD</p>|
|Fan #{#BOARDID} status|<p>-</p>|`SNMP agent`|fan.status[{#BOARDID}]<p>Update: 60</p><p>LLD</p>|
|Memory Board #{#ID} status|<p>-</p>|`SNMP agent`|memb.status[{#ID}]<p>Update: 60</p><p>LLD</p>|
|Power Supply #{#BOARDID} status|<p>-</p>|`SNMP agent`|psu.status[{#BOARDID}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CPU {#BOARDID}-{#MODULEID} Faulted|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:cpu.status[{#BOARDID}-{#MODULEID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Fan #{$BOARDID} Failed|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:fan.status[{#BOARDID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Memory unit {#BOARDID} Faulted|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:mem.statsu[{#BOARDID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Memory Board #{#ID} Faulted|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:memb.status[{#ID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Power Supply #{#BOARDID} Faulted|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:psu.status[{#BOARDID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Memory unit {#BOARDID} Faulted (LLD)|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:mem.statsu[{#BOARDID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|CPU {#BOARDID}-{#MODULEID} Faulted (LLD)|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:cpu.status[{#BOARDID}-{#MODULEID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Fan #{$BOARDID} Failed (LLD)|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:fan.status[{#BOARDID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Memory Board #{#ID} Faulted (LLD)|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:memb.status[{#ID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Power Supply #{#BOARDID} Faulted (LLD)|<p>-</p>|<p>**Expression**: {SNMP XSCF Sun M5000:psu.status[{#BOARDID}].last()}<>1</p><p>**Recovery expression**: </p>|high|
