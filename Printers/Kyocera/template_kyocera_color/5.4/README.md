# Kyocera color

## Overview

### Tested colored printers:

- ECOSYS M6030cdn
- ECOSYS P5021cdw

### Functions

- information about the remaining toner in the cartridges
- triggers on residual less than 5%
- chart template to track the toner levels of all cartridges

## Author

Miromani4

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|toners|<p>-</p>|`SNMP agent`|toners<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device description|<p>-</p>|`SNMP agent`|hrDeviceDescr<p>Update: 1h</p>|
|percent_{#SNMPVALUE}|<p>-</p>|`Calculated`|percent_[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|toner current {#SNMPVALUE}|<p>-</p>|`SNMP agent`|toner_current_[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|toner default {#SNMPVALUE}|<p>-</p>|`SNMP agent`|toner_default_[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#SNMPVALUE} Toner less 5%|<p>-</p>|<p>**Expression**: last(/Kyocera color/percent_[{#SNMPVALUE}])<5</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Toner less 5% (LLD)|<p>-</p>|<p>**Expression**: last(/Kyocera color/percent_[{#SNMPVALUE}])<5</p><p>**Recovery expression**: </p>|high|
