# Basic HUAWEI SNMP with traps AR161 and S2220E

## Author

rkarepanov@gmail.com

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fan Sensors detect|<p>Searches the CISCO-ENVMON-MIB for the Fan sensors, use ciscoEnvMonFanStatusDescr as key.</p>|`SNMP agent`|ciscoEnvMonFanStatusDescr<p>Update: 60</p>|
|Huawei chassis component|<p>Searches the Cisco MIB for the chassis model and blades.</p>|`SNMP agent`|ceAssetOrderablePartNumber<p>Update: 60</p>|
|Power Supply detect|<p>Searches the CISCO-ENVMON-MIB for the Fan sensors, use ciscoEnvMonSupplyStatusDescr as key.</p>|`SNMP agent`|ciscoEnvMonSupplyStatusDescr<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CONFIG-MAN-MIB-trap|<p>-</p>|`SNMP trap`|snmptrap["CISCO-CONFIG-MAN-MIB"]<p>Update: 0</p>|
|uptime|<p>-</p>|`SNMP agent`|uptime<p>Update: 30</p>|
|MIB-trap-LOGIN|<p>-</p>|`SNMP trap`|snmptrap["(CISCO.*MIB)((.|[[:space:]])*)(LOGIN)"]<p>Update: 0</p>|
|CPU Usage|<p>-</p>|`SNMP agent`|cpmCPUTotal5min<p>Update: 300</p>|
|MIB-trap-BGP|<p>-</p>|`SNMP trap`|snmptrap["(CISCO.*MIB)((.|[[:space:]])*)(BGP)"]<p>Update: 0</p>|
|MIB-trap-SLA|<p>-</p>|`SNMP trap`|snmptrap["(CISCO.*MIB)((.|[[:space:]])*)(SLA)"]<p>Update: 0</p>|
|Memory usage|<p>-</p>|`SNMP agent`|MemoryPoolUsed<p>Update: 300</p>|
|Temperature|<p>-</p>|`SNMP agent`|tempofhuawei<p>Update: 300</p>|
|State of "$1"|<p>-</p>|`SNMP agent`|ciscoEnvMonFanState[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Cisco P/N: "$1"|<p>-</p>|`SNMP agent`|ceAssetOrderablePartNumber[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|State of "$1"|<p>-</p>|`SNMP agent`|ciscoEnvMonSupplyState[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Problem with: {HOST.NAME}:{#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Basic HUAWEI SNMP with traps AR161 and S2220E:ciscoEnvMonFanState[{#SNMPVALUE}].last()}>1</p><p>**Recovery expression**: </p>|high|
|Problem with: {HOST.NAME}:{#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Basic HUAWEI SNMP with traps AR161 and S2220E:ciscoEnvMonSupplyState[{#SNMPVALUE}].last()}>6</p><p>**Recovery expression**: </p>|information|
|Problem with: {HOST.NAME}:{#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Basic HUAWEI SNMP with traps AR161 and S2220E:ciscoEnvMonFanState[{#SNMPVALUE}].last()}>1</p><p>**Recovery expression**: </p>|high|
|Problem with: {HOST.NAME}:{#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Basic HUAWEI SNMP with traps AR161 and S2220E:ciscoEnvMonSupplyState[{#SNMPVALUE}].last()}>6</p><p>**Recovery expression**: </p>|information|
