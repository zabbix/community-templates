# ViPNet IDS SNMPv2

## Description

ViPNet IDS SNMPv2 template

## Overview

Infotecs ViPNet IDS 


 



## Author

Antik89

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ATCKS.HIGH}|<p>count of attacks to inform high count of attacks trigger</p>|`25`|Text macro|
|{$ATCKS.MED}|<p>count of attacks to inform medium count of attacks trigger</p>|`125`|Text macro|
|{$CPU.LOAD}|<p>high cpu load value</p>|`75`|Text macro|
|{$LIC.DAYS}|<p>days of license time to inform</p>|`30`|Text macro|
|{$RAM.USAGE}|<p>max RAM usage</p>|`75`|Text macro|
|{$SENSOR.ID}|<p>paste item Sensor ID here</p>|`357810809`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Last day attacks (events severity)|<p>-</p>|`SNMP agent`|lastday.attacks.events.severity<p>Update: 15m</p>|
|Last day attacks (attacked ip addresses)|<p>-</p>|`SNMP agent`|lastday.attacks.attacked.ip<p>Update: 15m</p>|
|Detection interface|<p>-</p>|`SNMP agent`|detection.interface<p>Update: 1h</p>|
|Last day attacks (events name)|<p>-</p>|`SNMP agent`|lastday.attacks.events.name<p>Update: 15m</p>|
|Last day attacks (attacker ip addresses)|<p>-</p>|`SNMP agent`|lastday.attacks.attacker.ip<p>Update: 15m</p>|
|Last day attacks (events count)|<p>-</p>|`SNMP agent`|lastday.attacks.events.count<p>Update: 15m</p>|
|Last day attacks (events URL)|<p>-</p>|`SNMP agent`|lastday.attacks.events.url<p>Update: 15m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Services status|<p>IDS services status</p>|`SNMP agent`|services.status<p>Update: 120s</p>|
|Software version build|<p>IDS software version build</p>|`SNMP agent`|software.build<p>Update: 1d</p>|
|Attacks count for day period (information severity)|<p>IDS attacks count for day period (information severity)</p>|`SNMP agent`|attacks.information.day<p>Update: 1h</p>|
|System partition free space|<p>IDS system partition free space</p>|`SNMP agent`|systempartition.freespace<p>Update: 1h</p>|
|Software version minor|<p>IDS software version minor</p>|`SNMP agent`|software.minor<p>Update: 1d</p>|
|RAM usage|<p>IDS RAM usage</p>|`SNMP agent`|RAM.usage<p>Update: 30s</p>|
|Attacks count for month period (medium severity)|<p>IDS attacks count for month period (medium severity)</p>|`SNMP agent`|attacks.medium.month<p>Update: 1h</p>|
|Sensor service status|<p>IDS Sensor service status</p>|`SNMP agent`|sensor.status<p>Update: 120s</p>|
|Database free space|<p>IDS Database free space</p>|`SNMP agent`|DB.space<p>Update: 1h</p>|
|Attacks count for year period (information severity)|<p>IDS attacks count for year period (information severity)</p>|`SNMP agent`|attacks.information.year<p>Update: 1h</p>|
|Attacks count for month period (high severity)|<p>IDS attacks count for month period (high severity)</p>|`SNMP agent`|attacks.high.month<p>Update: 1h</p>|
|Attacks count for year period (low severity)|<p>IDS attacks count for year period (low severity)</p>|`SNMP agent`|attacks.low.year<p>Update: 1h</p>|
|Attacks count for month period (information severity)|<p>IDS attacks count for month period (information severity)</p>|`SNMP agent`|attacks.information.month<p>Update: 1h</p>|
|Sensor ID|<p>IDS sensor ID</p>|`SNMP agent`|sensor.ID<p>Update: 1h</p>|
|CPU load|<p>IDS CPU load</p>|`SNMP agent`|CPU.load<p>Update: 30s</p>|
|System partition usage|<p>IDS system partition usage</p>|`SNMP agent`|systempartition.usage<p>Update: 1h</p>|
|Hardware version|<p>IDS hardware version (platform)</p>|`SNMP agent`|hardware.version<p>Update: 1d</p>|
|Serial number|<p>IDS Serial number</p>|`SNMP agent`|serial.number<p>Update: 1d</p>|
|Attacks count for year period (medium severity)|<p>IDS attacks count for year period (medium severity)</p>|`SNMP agent`|attacks.medium.year<p>Update: 1h</p>|
|Detection rules date|<p>IDS Detection rules date</p>|`SNMP agent`|rules.date<p>Update: 1d</p>|
|Attacks count for day period|<p>IDS attacks count for day period</p>|`SNMP agent`|attacks.day<p>Update: 1h</p>|
|Attacks count for month period|<p>IDS attacks count for day period</p>|`SNMP agent`|attacks.month<p>Update: 1d</p>|
|Attacks count for year period (high severity)|<p>IDS attacks count for year period (high severity)</p>|`SNMP agent`|attacks.high.year<p>Update: 1h</p>|
|License expiration date|<p>IDS license expiration date</p>|`SNMP agent`|license.expdate<p>Update: 1d</p>|
|Attacks count for day period (medium severity)|<p>IDS attacks count for day period (medium severity)</p>|`SNMP agent`|attacks.medium.day<p>Update: 1h</p>|
|Attacks count for year period|<p>IDS attacks count for year period</p>|`SNMP agent`|attacks.year<p>Update: 1d</p>|
|Software version major|<p>IDS software version major</p>|`SNMP agent`|software.major<p>Update: 1d</p>|
|Uptime|<p>MIB: SNMPv2-MIB The time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|system.uptime[sysUpTime.0]<p>Update: 30s</p>|
|Attacks count for day period (high severity)|<p>IDS attacks count for day period (high severity)</p>|`SNMP agent`|attacks.high.day<p>Update: 5m</p>|
|License days before expiration|<p>IDS license days before expiration</p>|`SNMP agent`|license.expdays<p>Update: 1d</p>|
|Software version|<p>IDS software version</p>|`SNMP agent`|software.version<p>Update: 1d</p>|
|Total attacks|<p>IDS DB total attacks</p>|`SNMP agent`|total.attacks<p>Update: 15m</p>|
|Attacks count for day period (low severity)|<p>IDS attacks count for day period (low severity)</p>|`SNMP agent`|attacks.low.day<p>Update: 1h</p>|
|Software version hotfix|<p>IDS software version hotfix</p>|`SNMP agent`|software.hotfix<p>Update: 1d</p>|
|Attacks count for month period (low severity)|<p>IDS attacks count for month period (low severity)</p>|`SNMP agent`|attacks.low.month<p>Update: 1h</p>|
|Loader service status|<p>IDS Loader service status</p>|`SNMP agent`|loader.status<p>Update: 120s</p>|
|Last day attacks (attacked ip address №{#SNMPINDEX})|<p>-</p>|`SNMP agent`|lastday.attacks.attacked.ip[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Detection interface name {#SNMPVALUE}|<p>-</p>|`SNMP agent`|detection.interface.name.[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Detection interface state discription {#SNMPVALUE}|<p>-</p>|`SNMP agent`|detection.interface.state.discription.[{#SNMPVALUE}]<p>Update: 2m</p><p>LLD</p>|
|Detection interface state {#SNMPVALUE}|<p>-</p>|`SNMP agent`|detection.interface.state.[{#SNMPVALUE}]<p>Update: 2m</p><p>LLD</p>|
|Last day events name №{#SNMPINDEX}|<p>-</p>|`SNMP agent`|lastdayevents.events.name[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Last day attacks (attacker ip addresses №{#SNMPINDEX})|<p>-</p>|`SNMP agent`|lastday.attacks.attacker.ip[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Last day attacks (events count) №{#SNMPINDEX}|<p>-</p>|`SNMP agent`|lastday.attacks.events.count[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Last day events URL №{#SNMPINDEX}|<p>-</p>|`SNMP agent`|lastday.attacks.events.url[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} {#SNMPVALUE} detection interface state changed to down|<p>-</p>|<p>**Expression**: change(/ViPNet IDS SNMPv2/detection.interface.state.[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} {#SNMPVALUE} detection interface state changed to down (LLD)|<p>-</p>|<p>**Expression**: change(/ViPNet IDS SNMPv2/detection.interface.state.[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
