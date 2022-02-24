# aa Siemens Hipath

## Author

Cesar Buffulin

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery Siemens Card|<p>-</p>|`SNMP agent`|h150eCards<p>Update: 60s</p>|
|Discovery Siemens Port on TMCAS2|<p>-</p>|`SNMP agent`|h150ePorts<p>Update: 60s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Hardware Version|<p>-</p>|`SNMP agent`|sysHardwareVersion<p>Update: 240s</p>|
|System State|<p>-</p>|`SNMP agent`|sysState<p>Update: 60s</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 90s</p>|
|Software Version|<p>Contains the version string of the system software.</p>|`SNMP agent`|sysSoftwareVersion<p>Update: 240s</p>|
|Processor Load Level|<p>The actual CPU load level (per cent).</p>|`SNMP agent`|h150eLoadLevel<p>Update: 30s</p>|
|Slot Card Serial Number {#CARDTYPE}|<p>-</p>|`SNMP agent`|cardCodeNumber[{#CARDTYPE}]<p>Update: 60s</p><p>LLD</p>|
|Slot Card Number {#CARDTYPE}|<p>-</p>|`SNMP agent`|cardSlotNum[{#CARDTYPE}]<p>Update: 60s</p><p>LLD</p>|
|Slot Card State {#CARDTYPE}|<p>-</p>|`SNMP agent`|cardState[{#CARDTYPE}]<p>Update: 60s</p><p>LLD</p>|
|StatusPort {#PORTTYPE}|<p>-</p>|`SNMP agent`|portStatusIndex.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CardState Problem {#CARDTYPE}|<p>-</p>|<p>**Expression**: {aa Siemens Hipath:cardState[{#CARDTYPE}].prev()}>1</p><p>**Recovery expression**: </p>|warning|
|StatusPort Inactive On TMCAS2 {#PORTTYPE}|<p>-</p>|<p>**Expression**: {aa Siemens Hipath:portStatusIndex.[{#SNMPINDEX}].prev()}<>2</p><p>**Recovery expression**: </p>|warning|
|CardState Problem {#CARDTYPE} (LLD)|<p>-</p>|<p>**Expression**: {aa Siemens Hipath:cardState[{#CARDTYPE}].prev()}>1</p><p>**Recovery expression**: </p>|warning|
|StatusPort Inactive On TMCAS2 {#PORTTYPE} (LLD)|<p>-</p>|<p>**Expression**: {aa Siemens Hipath:portStatusIndex.[{#SNMPINDEX}].prev()}<>2</p><p>**Recovery expression**: </p>|warning|
