# Delta UPS SNMP v1

## Overview

Simple **SNMPv1** template for Delta UPS with LLD for lines.  
Tested on Zabbix 3.0 but should works on older versions.


Required extra configuration:


Macro for {$SNMP\_COMMUNITY}  
UPS-MIB



## Author

sim

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|UPS Output Line Discovery|<p>-</p>|`SNMP agent`|UPSOutputLineDiscovery<p>Update: 7200</p>|
|UPS Input Line Discovery|<p>-</p>|`SNMP agent`|UPSInputLineDiscovery<p>Update: 7200</p>|
|UPS Bypass Line Discovery|<p>-</p>|`SNMP agent`|UPSBypassLineDiscovery<p>Update: 7200</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|UPS Model|<p>-</p>|`SNMP agent`|upsIdentModel<p>Update: 7200</p>|
|Config Output Frequency|<p>-</p>|`SNMP agent`|upsConfigOutputFreq<p>Update: 60</p>|
|UPS Source Type|<p>other(1), none(2), normal(3), bypass(4), battery(5), booster(6), reducer(7)</p>|`SNMP agent`|upsOutputSource<p>Update: 30</p>|
|Config Input Frequency|<p>-</p>|`SNMP agent`|upsConfigInputFreq<p>Update: 60</p>|
|Number of Bypass Lines|<p>-</p>|`SNMP agent`|upsBypassNumLines<p>Update: 7200</p>|
|Config Output Voltage|<p>-</p>|`SNMP agent`|upsConfigOutputVoltage<p>Update: 60</p>|
|ICMP loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 60</p>|
|ICMP ping|<p>-</p>|`Simple check`|icmpping<p>Update: 60</p>|
|Number of Output Lines|<p>-</p>|`SNMP agent`|upsOutputNumLines<p>Update: 7200</p>|
|UPS Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime.2<p>Update: 60</p>|
|Battery Current Amp DC|<p>-</p>|`SNMP agent`|upsBatteryCurrent<p>Update: 60</p>|
|Config Output V-A|<p>-</p>|`SNMP agent`|upsConfigOutputVA<p>Update: 60</p>|
|UPS Battery Voltage|<p>-</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 60</p>|
|UPS Battery Status|<p>unknown(1), batteryNormal(2), batteryLow(3), batteryDepleted(4)</p>|`SNMP agent`|upsBatteryStatus<p>Update: 60</p>|
|UPS Manufacturer|<p>-</p>|`SNMP agent`|upsIdentManufacturer<p>Update: 7200</p>|
|UPS Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 7200</p>|
|Config Input Voltage|<p>-</p>|`SNMP agent`|upsConfigInputVoltage<p>Update: 60</p>|
|Battery Charge Level in %|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 30</p>|
|Number of Input Lines|<p>-</p>|`SNMP agent`|upsInputNumLines<p>Update: 7200</p>|
|ICMP response time|<p>-</p>|`Simple check`|icmppingsec<p>Update: 60</p>|
|UPS Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 7200</p>|
|UPS Line {#SNMPINDEX} Output Voltage|<p>-</p>|`SNMP agent`|upsOutputCurrent.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|UPS Line {#SNMPINDEX} Output Percent Load|<p>-</p>|`SNMP agent`|upsOutputPercentLoad.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|UPS Line {#SNMPINDEX} Output Power|<p>-</p>|`SNMP agent`|upsOutputPower.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|UPS Line {#SNMPINDEX} Output Current|<p>-</p>|`SNMP agent`|upsOutputVoltage.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|UPS Input {#SNMPINDEX} Current|<p>-</p>|`SNMP agent`|upsInputCurrent.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|UPS Input {#SNMPINDEX} Frequency|<p>-</p>|`SNMP agent`|upsInputFrequency.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|UPS Input {#SNMPINDEX} Voltage|<p>-</p>|`SNMP agent`|upsInputVoltage.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|UPS Line {#SNMPINDEX} Bypass Voltage|<p>-</p>|`SNMP agent`|upsBypassVoltage.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME}: Line {#SNMPINDEX} load is greater than  > 60%|<p>-</p>|<p>**Expression**: avg(/Delta UPS SNMP v1/upsOutputPercentLoad.[{#SNMPVALUE}],5m)>60</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME}: Line {#SNMPINDEX} load is greater than  > 80%|<p>-</p>|<p>**Expression**: avg(/Delta UPS SNMP v1/upsOutputPercentLoad.[{#SNMPVALUE}],5m)>80</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}: Line {#SNMPINDEX} load is greater than  > 60% (LLD)|<p>-</p>|<p>**Expression**: avg(/Delta UPS SNMP v1/upsOutputPercentLoad.[{#SNMPVALUE}],5m)>60</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME}: Line {#SNMPINDEX} load is greater than  > 80% (LLD)|<p>-</p>|<p>**Expression**: avg(/Delta UPS SNMP v1/upsOutputPercentLoad.[{#SNMPVALUE}],5m)>80</p><p>**Recovery expression**: </p>|high|
