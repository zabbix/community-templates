# OLT ZTE C320

## Overview

Template OLT ZTE


 


o que o template faz:


- Temperatura sfp


- uptime


- Interface status


- onu registradas por porta


- status das placas



## Author

Anderson Raber

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ITEM.ID}|<p>-</p>|`1-128`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Rotação Fans|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.3902.1015.2.1.3.10.10.10.1.7<p>Update: 30s</p>|
|ONU Registradas|<p>discovery[{#SNMPVALUE},.1.3.6.1.4.1.3902.1012.3.13.1.1.1]</p>|`SNMP agent`|snmp.enterprises<p>Update: 30s</p>|
|Interface Status|<p>-</p>|`SNMP agent`|discovery[{#SNMPVALUE},IF-MIB::ifDescr]<p>Update: 30s</p>|
|Status Placas|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.3902.1015.2.1.3.13.5.1.1.1.1<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|xgei_1/4/2|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268632320<p>Update: 60s</p>|
|PON 1/10|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268437760<p>Update: 60s</p>|
|PON 2/1|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268500992<p>Update: 60s</p>|
|PON 2/5|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268502016<p>Update: 60s</p>|
|PON 1/14|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268438784<p>Update: 60s</p>|
|PON 1/16|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268439296<p>Update: 60s</p>|
|PON 1/8|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268437248<p>Update: 60s</p>|
|gei_1/4/1|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268632064<p>Update: 60s</p>|
|PON 1/1|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268435456<p>Update: 60s</p>|
|PON 2/13|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268504064<p>Update: 60s</p>|
|PON 2/15|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268504576<p>Update: 60s</p>|
|PON 1/11|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268438016<p>Update: 60s</p>|
|xgei_1/3/2|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268566784<p>Update: 60s</p>|
|PON 1/3|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268435968<p>Update: 60s</p>|
|PON 2/10|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268503296<p>Update: 60s</p>|
|gei_1/3/1|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268566528<p>Update: 60s</p>|
|PON 1/2|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268435712<p>Update: 60s</p>|
|PON 1/13|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268438528<p>Update: 60s</p>|
|PON 2/11|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268503552<p>Update: 60s</p>|
|PON 2/9|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268503040<p>Update: 60s</p>|
|PON 1/4|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268436224<p>Update: 60s</p>|
|PON 1/15|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268439040<p>Update: 60s</p>|
|Device uptime|<p>MIB: SNMPv2-MIB The time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|system.uptime<p>Update: 1m</p>|
|PON 2/4|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268501760<p>Update: 60s</p>|
|PON 1/5|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268436480<p>Update: 60s</p>|
|PON 1/6|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268436736<p>Update: 60s</p>|
|PON 1/9|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268437504<p>Update: 60s</p>|
|PON 2/3|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268501504<p>Update: 60s</p>|
|PON 1/12|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268438272<p>Update: 60s</p>|
|PON 2/2|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268501248<p>Update: 60s</p>|
|PON 2/6|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268502272<p>Update: 60s</p>|
|PON 2/7|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268502528<p>Update: 60s</p>|
|PON 2/12|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268503808<p>Update: 60s</p>|
|PON 1/7|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268436992<p>Update: 60s</p>|
|PON 2/16|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268504832<p>Update: 60s</p>|
|PON 2/14|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268504320<p>Update: 60s</p>|
|PON 2/8|<p>-</p>|`SNMP agent`|3902.1015.3.1.13.1.12.268502784<p>Update: 60s</p>|
|Fan {#SNMPINDEX}|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.3902.1015.2.1.3.10.10.10.1.7.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE}|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.3902.1012.3.13.1.1.13.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE} Status|<p>-</p>|`SNMP agent`|ifOperStatus.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|CPU Load Placa {#SNMPINDEX}|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.3902.1015.2.1.1.3.1.9.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Temperatura Placa {#SNMPINDEX}|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.3902.1015.2.1.3.13.5.1.1.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Status Placa {#SNMPINDEX}|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.3902.1015.2.1.1.3.1.5.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface Down|<p>-</p>|<p>**Expression**: {OLT ZTE C320:ifOperStatus.[{#SNMPINDEX}].last(1)}<>1</p><p>**Recovery expression**: </p>|high|
|Interface Down (LLD)|<p>-</p>|<p>**Expression**: {OLT ZTE C320:ifOperStatus.[{#SNMPINDEX}].last(1)}<>1</p><p>**Recovery expression**: </p>|high|
