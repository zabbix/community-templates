# Supermicro SNMP Superdoctor 5 LLD

## Overview

Monitor Supermicro servers by snmp vs SuperDoctor5 (SD5). 


Monitored items:


1. Fans (RPM)
2. Physical disks (by hba or LSI raid card (see SD5 documentation)). By default deactivated.
	* model
	* serial number (trigger exists)
	* smart status (trigger exists)
3. Power Supply (ok or not, trigger exists)
4. Temperatures (celsius, trigger exists)
5. Power Supply Input Voltages (for tests, trigger exists). By default deactivated.
6. Memory
	* model
	* serial number (trigger exists)
	* manufacturer
	* location
	* error count (trigger exists)
	* capacity
7. Mainboard
	* model
	* bios version (trigger exists)


All items is searching by lld (excluding mainboard model and bios version). Filtering if set to not monitored in SD5.


Macroses:


1. {$SNMP\_COMMUNITY}
2. {$SUPERMICRO\_DISCOVERY\_TIME} - period of discovering (how often).
3. {$DISC\_DISCOVERY\_TIME} - period of discovering for disks (i suppose that you may change it more often)
4. {$PD\_REQUEST\_PERIOD} - period of requesting data from disks.


Regular expressions:


1. Filtering RAID (Result is False, expression - RAID)
2. Filtering Microsoft Storage Space Device (Result is False, expression - Filtering Microsoft Storage Space Device)


Value mappings:


1. Supermicro physical disk smart status (0 ⇒ OK 2 ⇒ Critical)
2. Supermicro power supply status (SNMP) (0 ⇒ OK 1 ⇒ Warning 2 ⇒ Critical)


I don't use disks in production and power voltages, but i've tested this functions.


For using this template you have to configure snmp and install super doctor 5.


You can use template as is and make commens with your wishes or other. i will glad to see interesting ideas for upgrading this template.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|FANs|<p>-</p>|`SNMP agent`|supermicro_fanmonitemid<p>Update: {$SUPERMICRO_DISCOVERY_TIME}</p>|
|Power Supply|<p>-</p>|`SNMP agent`|supermicro_psmonitemid<p>Update: {$SUPERMICRO_DISCOVERY_TIME}</p>|
|Temperatures|<p>-</p>|`SNMP agent`|supermicro_tempmonitemid<p>Update: {$SUPERMICRO_DISCOVERY_TIME}</p>|
|Physical disk|<p>-</p>|`SNMP agent`|supermicro_diskmodel<p>Update: {$DISC_DISCOVERY_TIME}</p>|
|Memory|<p>-</p>|`SNMP agent`|supermicro_memory_id<p>Update: {$SUPERMICRO_DISCOVERY_TIME}</p>|
|Power Supply Input voltages|<p>-</p>|`SNMP agent`|supermicro_inpvoltageid<p>Update: {$SUPERMICRO_DISCOVERY_TIME}</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Supermicro mainboard bios version|<p>-</p>|`SNMP agent`|supermicro_mb_biosversion<p>Update: 1d</p>|
|Supermicro mainboard model|<p>-</p>|`SNMP agent`|supermicro_mb_model<p>Update: 1d</p>|
|Supermicro $1 RPMs|<p>-</p>|`SNMP agent`|supermicro_fanrpms[{#MONITEMNAME}]<p>Update: 5m</p><p>LLD</p>|
|Supermicro $1|<p>-</p>|`SNMP agent`|supermicro_psstatus[{#MONITEMNAME}]<p>Update: 15m</p><p>LLD</p>|
|Supermicro $1|<p>-</p>|`SNMP agent`|supermicro_temp[{#MONITEMNAME}]<p>Update: 5m</p><p>LLD</p>|
|Supermicro disk {#SNMPINDEX} model|<p>-</p>|`SNMP agent`|supermicro_disc_model[{#SNMPINDEX}]<p>Update: {$PD_REQUEST_PERIOD}</p><p>LLD</p>|
|Supermicro disk {#SNMPINDEX} smart status|<p>-</p>|`SNMP agent`|supermicro_disk_smart[{#SNMPINDEX}]<p>Update: {$PD_REQUEST_PERIOD}</p><p>LLD</p>|
|Supermicro disk {#SNMPINDEX} serial number|<p>-</p>|`SNMP agent`|supermicro_disk_sn[{#SNMPINDEX}]<p>Update: {$PD_REQUEST_PERIOD}</p><p>LLD</p>|
|Supermicro memory $1 capacity|<p>-</p>|`SNMP agent`|supermicro_memory_cap[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Supermicro memory $1 error count|<p>-</p>|`SNMP agent`|supermicro_memory_errcount[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Supermicro memory $1 location|<p>-</p>|`SNMP agent`|supermicro_memory_location[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Supermicro memory $1 manufacturer|<p>-</p>|`SNMP agent`|supermicro_memory_manufacturer[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Supermicro memory $1 model|<p>-</p>|`SNMP agent`|supermicro_memory_model[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Supermicro memory $1 sn|<p>-</p>|`SNMP agent`|supermicro_memory_sn[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Supermicro $1|<p>-</p>|`SNMP agent`|supermicro_acinp[{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Supermicro physical disc was changed to {ITEM.LASTVALUE} on {HOST.DNS}|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_disk_sn[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|Supermicro physical disk status is {ITEM.LASTVALUE} on {HOST.DNS}|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_disk_smart[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} is {ITEM.LASTVALUE} on {HOST.DNS}|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_acinp[{#SNMPVALUE}].last()}<220</p><p>**Recovery expression**: </p>|average|
|Memory bank on {HOST.DNS}  has {ITEM.LASTVALUE} errors|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_memory_errcount[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|warning|
|Memory bank on {HOST.DNS}  was changed|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_memory_sn[{#SNMPVALUE}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|{#SNMPVALUE} is {ITEM.LASTVALUE} on {HOST.DNS}|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_psstatus[{#MONITEMNAME}].last()}=1</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} is {ITEM.LASTVALUE} on {HOST.DNS}|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_psstatus[{#MONITEMNAME}].last()}=2</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} is {ITEM.LASTVALUE} on {HOST.DNS}|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_temp[{#MONITEMNAME}].last()}>70</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} is {ITEM.LASTVALUE} on {HOST.DNS} (LLD)|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_psstatus[{#MONITEMNAME}].last()}=1</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} is {ITEM.LASTVALUE} on {HOST.DNS} (LLD)|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_psstatus[{#MONITEMNAME}].last()}=2</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} is {ITEM.LASTVALUE} on {HOST.DNS} (LLD)|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_temp[{#MONITEMNAME}].last()}>70</p><p>**Recovery expression**: </p>|high|
|Supermicro physical disc was changed to {ITEM.LASTVALUE} on {HOST.DNS} (LLD)|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_disk_sn[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|Supermicro physical disk status is {ITEM.LASTVALUE} on {HOST.DNS} (LLD)|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_disk_smart[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|high|
|Memory bank on {HOST.DNS}  has {ITEM.LASTVALUE} errors (LLD)|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_memory_errcount[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|warning|
|Memory bank on {HOST.DNS}  was changed (LLD)|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_memory_sn[{#SNMPVALUE}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|{#SNMPVALUE} is {ITEM.LASTVALUE} on {HOST.DNS} (LLD)|<p>-</p>|<p>**Expression**: {Supermicro SNMP Superdoctor 5 LLD:supermicro_acinp[{#SNMPVALUE}].last()}<220</p><p>**Recovery expression**: </p>|average|
