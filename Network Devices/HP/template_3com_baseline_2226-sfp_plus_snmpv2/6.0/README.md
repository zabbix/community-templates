# 3COM Baseline 2226-SFP Plus SNMPv2

## Overview

Switch 26 ports


Monitoring on Speed, Portstatus, Last Changed, In and Out Throughput and number of errors.


Graphs for IN and OUT throughput per port


Adapted from the layout https://www.zabbix.com/forum/attachment.php?attachmentid=4762&d=1337691484



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Port 14 Last Changed|<p>Port 14 Last Changed</p>|`SNMP agent`|ifLastChange.2182<p>Update: 120</p>|
|Port 10 Traffic IN|<p>Port 10 Traffic IN</p>|`SNMP agent`|ifInOctects.1670<p>Update: 120</p>|
|Port 25 Traffic IN|<p>Port 25 Traffic IN</p>|`SNMP agent`|ifInOctects.3590<p>Update: 120</p>|
|Port 24 Last Changed|<p>Port 24 Last Changed</p>|`SNMP agent`|ifLastChange.3462<p>Update: 120</p>|
|Port 18 Traffic OUT|<p>Port 18 Traffic OUT</p>|`SNMP agent`|ifOutOctets.2694<p>Update: 120</p>|
|Port 13 Traffic IN|<p>Port 13 Traffic IN</p>|`SNMP agent`|ifInOctects.2054<p>Update: 120</p>|
|Port 09 Traffic IN|<p>Port 09 Traffic IN</p>|`SNMP agent`|ifInOctects.1542<p>Update: 120</p>|
|Port 18 Last Changed|<p>Port 18 Last Changed</p>|`SNMP agent`|ifLastChange.2694<p>Update: 120</p>|
|Port 01 Traffic OUT|<p>Port 01 Traffic OUT</p>|`SNMP agent`|ifOutOctets.518<p>Update: 120</p>|
|Port 02 Last Changed|<p>Port 02 Last Changed</p>|`SNMP agent`|ifLastChange.646<p>Update: 120</p>|
|Port 11 Speed|<p>Port 11 Speed</p>|`SNMP agent`|ifspeed.1798<p>Update: 120</p>|
|Port 24 Traffic IN|<p>Port 24 Traffic IN</p>|`SNMP agent`|ifInOctects.3462<p>Update: 120</p>|
|Port 09 Status|<p>Port 09 Status</p>|`SNMP agent`|ifOperStatus.1542<p>Update: 120</p>|
|Port 08 Traffic OUT|<p>Port 08 Traffic OUT</p>|`SNMP agent`|ifOutOctets.1414<p>Update: 120</p>|
|Port 06 Traffic IN|<p>Port 06 Traffic IN</p>|`SNMP agent`|ifInOctects.1158<p>Update: 120</p>|
|Port 21 Traffic OUT|<p>Port 21 Traffic OUT</p>|`SNMP agent`|ifOutOctets.3078<p>Update: 120</p>|
|Port 17 Traffic OUT|<p>Port 17 Traffic OUT</p>|`SNMP agent`|ifOutOctets.2566<p>Update: 120</p>|
|Port 19 Speed|<p>Port 19 Speed</p>|`SNMP agent`|ifspeed.2822<p>Update: 120</p>|
|Port 21 Traffic OUT Errors|<p>Port 21 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.3078<p>Update: 120</p>|
|Port 09 Traffic OUT Errors|<p>Port 09 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.1542<p>Update: 120</p>|
|Port 11 Traffic IN Errors|<p>Port 11 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.1798<p>Update: 120</p>|
|Port 04 Traffic IN|<p>Port 04 Traffic IN</p>|`SNMP agent`|ifInOctects.902<p>Update: 120</p>|
|Port 23 Speed|<p>Port 23 Speed</p>|`SNMP agent`|ifspeed.3334<p>Update: 120</p>|
|Port 04 Speed|<p>Port 04 Speed</p>|`SNMP agent`|ifspeed.902<p>Update: 120</p>|
|Port 07 Status|<p>Port 07 Status</p>|`SNMP agent`|ifOperStatus.1286<p>Update: 120</p>|
|Port 15 Traffic OUT Errors|<p>Port 15 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.2310<p>Update: 120</p>|
|Port 20 Traffic IN Errors|<p>Port 20 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.2950<p>Update: 120</p>|
|Port 10 Traffic OUT Errors|<p>Port 10 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.1670<p>Update: 120</p>|
|Port 07 Traffic IN|<p>Port 07 Traffic IN</p>|`SNMP agent`|ifInOctects.1286<p>Update: 120</p>|
|Port 05 Traffic OUT Errors|<p>Port 05 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.1030<p>Update: 120</p>|
|Port 26 Status|<p>Port 26 Status</p>|`SNMP agent`|ifOperStatus.3718<p>Update: 120</p>|
|Port 22 Traffic OUT Errors|<p>Port 22 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.3206<p>Update: 120</p>|
|Port 16 Traffic OUT Errors|<p>Port 16 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.2438<p>Update: 120</p>|
|Port 10 Traffic IN Errors|<p>Port 10 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.1670<p>Update: 120</p>|
|Port 18 Status|<p>Port 18 Status</p>|`SNMP agent`|ifOperStatus.2694<p>Update: 120</p>|
|Port 05 Last Changed|<p>Port 05 Last Changed</p>|`SNMP agent`|ifLastChange.1030<p>Update: 120</p>|
|Port 24 Speed|<p>Port 24 Speed</p>|`SNMP agent`|ifspeed.3462<p>Update: 120</p>|
|Port 08 Speed|<p>Port 08 Speed</p>|`SNMP agent`|ifspeed.1414<p>Update: 120</p>|
|Port 23 Traffic OUT Errors|<p>Port 23 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.3334<p>Update: 120</p>|
|Port 21 Last Changed|<p>Port 21 Last Changed</p>|`SNMP agent`|ifLastChange.3078<p>Update: 120</p>|
|Port 15 Last Changed|<p>Port 15 Last Changed</p>|`SNMP agent`|ifLastChange.2310<p>Update: 120</p>|
|Port 11 Status|<p>Port 11 Status</p>|`SNMP agent`|ifOperStatus.1798<p>Update: 120</p>|
|Port 19 Status|<p>Port 19 Status</p>|`SNMP agent`|ifOperStatus.2822<p>Update: 120</p>|
|Port SFP 26 Speed|<p>Port 01 Speed</p>|`SNMP agent`|ifspeed.3974<p>Update: 120</p>|
|Port SFP 26 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.3974<p>Update: 120</p>|
|Port 12 Speed|<p>Port 12 Speed</p>|`SNMP agent`|ifspeed.1926<p>Update: 120</p>|
|Port 17 Status|<p>Port 17 Status</p>|`SNMP agent`|ifOperStatus.2566<p>Update: 120</p>|
|Port 23 Last Changed|<p>Port 23 Last Changed</p>|`SNMP agent`|ifLastChange.3334<p>Update: 120</p>|
|Port 13 Status|<p>Port 13 Status</p>|`SNMP agent`|ifOperStatus.2054<p>Update: 120</p>|
|Port 14 Speed|<p>Port 14 Speed</p>|`SNMP agent`|ifspeed.2182<p>Update: 120</p>|
|Port 22 Traffic IN|<p>Port 22 Traffic IN</p>|`SNMP agent`|ifInOctects.3206<p>Update: 120</p>|
|Port 25 Last Changed|<p>Port 25 Last Changed</p>|`SNMP agent`|ifLastChange.3590<p>Update: 120</p>|
|Port 04 Traffic OUT|<p>Port 04 Traffic OUT</p>|`SNMP agent`|ifOutOctets.902<p>Update: 120</p>|
|Port 08 Traffic IN Errors|<p>Port 08 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.1414<p>Update: 120</p>|
|Port 20 Status|<p>Port 20 Status</p>|`SNMP agent`|ifOperStatus.2950<p>Update: 120</p>|
|Port 20 Speed|<p>Port 20 Speed</p>|`SNMP agent`|ifspeed.2950<p>Update: 120</p>|
|Port 12 Traffic OUT Errors|<p>Port 12 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.1926<p>Update: 120</p>|
|Port 06 Traffic OUT Errors|<p>Port 06 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.1158<p>Update: 120</p>|
|Port 10 Traffic OUT|<p>Port 10 Traffic OUT</p>|`SNMP agent`|ifOutOctets.1670<p>Update: 120</p>|
|Port SFP 26 Traffic IN|<p>Port 26 Traffic IN</p>|`SNMP agent`|ifInOctects.3974<p>Update: 120</p>|
|Port 20 Last Changed|<p>Port 20 Last Changed</p>|`SNMP agent`|ifLastChange.2950<p>Update: 120</p>|
|Port 16 Status|<p>Port 16 Status</p>|`SNMP agent`|ifOperStatus.2438<p>Update: 120</p>|
|Port 08 Traffic OUT Errors|<p>Port 08 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.1414<p>Update: 120</p>|
|Port SFP 26 Traffic OUT|<p>Port 01 Traffic OUT</p>|`SNMP agent`|ifOutOctets.3974<p>Update: 120</p>|
|Port 13 Traffic OUT Errors|<p>Port 13 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.2054<p>Update: 120</p>|
|Port 18 Speed|<p>Port 18 Speed</p>|`SNMP agent`|ifspeed.2694<p>Update: 120</p>|
|Port 16 Last Changed|<p>Port 16 Last Changed</p>|`SNMP agent`|ifLastChange.2438<p>Update: 120</p>|
|Port 05 Traffic OUT|<p>Port 05 Traffic OUT</p>|`SNMP agent`|ifOutOctets.1030<p>Update: 120</p>|
|Port 16 Speed|<p>Port 16 Speed</p>|`SNMP agent`|ifspeed.2438<p>Update: 120</p>|
|Port 09 Traffic OUT|<p>Port 09 Traffic OUT</p>|`SNMP agent`|ifOutOctets.1542<p>Update: 120</p>|
|Port 23 Traffic IN|<p>Port 23 Traffic IN</p>|`SNMP agent`|ifInOctects.3334<p>Update: 120</p>|
|Port 05 Traffic IN|<p>Port 05 Traffic IN</p>|`SNMP agent`|ifInOctects.1030<p>Update: 120</p>|
|Port 02 Status|<p>Port 02 Status</p>|`SNMP agent`|ifOperStatus.646<p>Update: 120</p>|
|Port 23 Status|<p>Port 23 Status</p>|`SNMP agent`|ifOperStatus.3334<p>Update: 120</p>|
|Port 19 Traffic OUT|<p>Port 19 Traffic OUT</p>|`SNMP agent`|ifOutOctets.2822<p>Update: 120</p>|
|Port 07 Speed|<p>Port 07 Speed</p>|`SNMP agent`|ifspeed.1286<p>Update: 120</p>|
|Port 01 Traffic OUT Errors|<p>Port 01 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.518<p>Update: 120</p>|
|Port SFP 25 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.3846<p>Update: 120</p>|
|Port SFP 25 Traffic IN|<p>Port 01 Traffic IN</p>|`SNMP agent`|ifInOctects.3846<p>Update: 120</p>|
|Port 08 Status|<p>Port 08 Status</p>|`SNMP agent`|ifOperStatus.1414<p>Update: 120</p>|
|Port 12 Traffic IN|<p>Port 12 Traffic IN</p>|`SNMP agent`|ifInOctects.1926<p>Update: 120</p>|
|Port 26 Traffic IN Errors|<p>Port 26 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.3718<p>Update: 120</p>|
|Port 02 Traffic OUT Errors|<p>Port 02 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.646<p>Update: 120</p>|
|Port 02 Traffic IN Errors|<p>Port 02 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.646<p>Update: 120</p>|
|Port 21 Traffic IN|<p>Port 21 Traffic IN</p>|`SNMP agent`|ifInOctects.3078<p>Update: 120</p>|
|Port 13 Traffic OUT|<p>Port 13 Traffic OUT</p>|`SNMP agent`|ifOutOctets.2054<p>Update: 120</p>|
|Port 11 Last Changed|<p>Port 11 Last Changed</p>|`SNMP agent`|ifLastChange.1798<p>Update: 120</p>|
|Port 21 Traffic IN Errors|<p>Port 21 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.3078<p>Update: 120</p>|
|Port 13 Speed|<p>Port 13 Speed</p>|`SNMP agent`|ifspeed.2054<p>Update: 120</p>|
|Port 12 Status|<p>Port 12 Status</p>|`SNMP agent`|ifOperStatus.1926<p>Update: 120</p>|
|Port 08 Traffic IN|<p>Port 08 Traffic IN</p>|`SNMP agent`|ifInOctects.1414<p>Update: 120</p>|
|Port 25 Traffic OUT Errors|<p>Port 25 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.3590<p>Update: 120</p>|
|Port 03 Traffic OUT Errors|<p>Port 03 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.774<p>Update: 120</p>|
|Port 06 Status|<p>Port 06 Status</p>|`SNMP agent`|ifOperStatus.1158<p>Update: 120</p>|
|Port 17 Last Changed|<p>Port 17 Last Changed</p>|`SNMP agent`|ifLastChange.2566<p>Update: 120</p>|
|Port 20 Traffic OUT|<p>Port 20 Traffic OUT</p>|`SNMP agent`|ifOutOctets.2950<p>Update: 120</p>|
|Port 23 Traffic IN Errors|<p>Port 23 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.3334<p>Update: 120</p>|
|Port 24 Traffic OUT|<p>Port 24 Traffic OUT</p>|`SNMP agent`|ifOutOctets.3462<p>Update: 120</p>|
|Port 24 Status|<p>Port 24 Status</p>|`SNMP agent`|ifOperStatus.3462<p>Update: 120</p>|
|Port 18 Traffic OUT Errors|<p>Port 18 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.2694<p>Update: 120</p>|
|Port 06 Traffic OUT|<p>Port 06 Traffic OUT</p>|`SNMP agent`|ifOutOctets.1158<p>Update: 120</p>|
|Port 21 Status|<p>Port 21 Status</p>|`SNMP agent`|ifOperStatus.3078<p>Update: 120</p>|
|Port SFP 25 Traffic OUT|<p>Port 01 Traffic OUT</p>|`SNMP agent`|ifOutOctets.3846<p>Update: 120</p>|
|Port 17 Traffic OUT Errors|<p>Port 17 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.2566<p>Update: 120</p>|
|Port 15 Traffic IN Errors|<p>Port 15 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.2310<p>Update: 120</p>|
|Port 11 Traffic OUT|<p>Port 11 Traffic OUT</p>|`SNMP agent`|ifOutOctets.1798<p>Update: 120</p>|
|Port 19 Traffic IN Errors|<p>Port 19 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.2822<p>Update: 120</p>|
|Port 02 Traffic OUT|<p>Port 02 Traffic OUT</p>|`SNMP agent`|ifOutOctets.646<p>Update: 120</p>|
|Port SFP 26 Status|<p>Port 01 Status</p>|`SNMP agent`|ifOperStatus.3974<p>Update: 120</p>|
|Port 18 Traffic IN Errors|<p>Port 18 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.2694<p>Update: 120</p>|
|Port 24 Traffic OUT Errors|<p>Port 24 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.3462<p>Update: 120</p>|
|Port 07 Last Changed|<p>Port 07 Last Changed</p>|`SNMP agent`|ifLastChange.1286<p>Update: 120</p>|
|Port 15 Speed|<p>Port 15 Speed</p>|`SNMP agent`|ifspeed.2310<p>Update: 120</p>|
|Port 22 Speed|<p>Port 22 Speed</p>|`SNMP agent`|ifspeed.3206<p>Update: 120</p>|
|Port 09 Last Changed|<p>Port 09 Last Changed</p>|`SNMP agent`|ifLastChange.1542<p>Update: 120</p>|
|Port 26 Traffic OUT Errors|<p>Port 26 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.3718<p>Update: 120</p>|
|Port 09 Traffic IN Errors|<p>Port 09 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.1542<p>Update: 120</p>|
|Port 02 Speed|<p>Port 02 Speed</p>|`SNMP agent`|ifspeed.646<p>Update: 120</p>|
|Port 10 Last Changed|<p>Port 10 Last Changed</p>|`SNMP agent`|ifLastChange.1670<p>Update: 120</p>|
|Port 24 Traffic IN Errors|<p>Port 24 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.3462<p>Update: 120</p>|
|Port 10 Speed|<p>Port 10 Speed</p>|`SNMP agent`|ifspeed.1670<p>Update: 120</p>|
|Port 13 Traffic IN Errors|<p>Port 13 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.2054<p>Update: 120</p>|
|Port 11 Traffic OUT Errors|<p>Port 11 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.1798<p>Update: 120</p>|
|Port 21 Speed|<p>Port 21 Speed</p>|`SNMP agent`|ifspeed.3078<p>Update: 120</p>|
|Port 17 Traffic IN Errors|<p>Port 17 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.2566<p>Update: 120</p>|
|Port 07 Traffic IN Errors|<p>Port 07 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.1286<p>Update: 120</p>|
|Port 25 Status|<p>Port 25 Status</p>|`SNMP agent`|ifOperStatus.3590<p>Update: 120</p>|
|Port 03 Traffic IN|<p>Port 03 Traffic IN</p>|`SNMP agent`|ifInOctects.774<p>Update: 120</p>|
|Port 22 Traffic OUT|<p>Port 22 Traffic OUT</p>|`SNMP agent`|ifOutOctets.3206<p>Update: 120</p>|
|Port 15 Traffic IN|<p>Port 15 Traffic IN</p>|`SNMP agent`|ifInOctects.2310<p>Update: 120</p>|
|Port 12 Last Changed|<p>Port 12 Last Changed</p>|`SNMP agent`|ifLastChange.1926<p>Update: 120</p>|
|Port 01 Traffic IN Errors|<p>Port 01 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.518<p>Update: 120</p>|
|Port 13 Last Changed|<p>Port 13 Last Changed</p>|`SNMP agent`|ifLastChange.2054<p>Update: 120</p>|
|Port 07 Traffic OUT|<p>Port 07 Traffic OUT</p>|`SNMP agent`|ifOutOctets.1286<p>Update: 120</p>|
|Port 03 Status|<p>Port 03 Status</p>|`SNMP agent`|ifOperStatus.774<p>Update: 120</p>|
|Port 04 Traffic IN Errors|<p>Port 04 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.902<p>Update: 120</p>|
|Port SFP 25 Traffic IN Errors|<p>Port 01 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.3846<p>Update: 120</p>|
|Port 01 Last Changed|<p>Port 01 Last Changed</p>|`SNMP agent`|ifLastChange.518<p>Update: 120</p>|
|Port 10 Status|<p>Port 10 Status</p>|`SNMP agent`|ifOperStatus.1670<p>Update: 120</p>|
|Port 12 Traffic IN Errors|<p>Port 12 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.1926<p>Update: 120</p>|
|Port SFP 25 Traffic OUT Errors|<p>Port 01 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.3846<p>Update: 120</p>|
|Port SFP 26 Traffic OUT Errors|<p>Port 01 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.3974<p>Update: 120</p>|
|Port 09 Speed|<p>Port 09 Speed</p>|`SNMP agent`|ifspeed.1542<p>Update: 120</p>|
|Port 14 Traffic IN|<p>Port 14 Traffic IN</p>|`SNMP agent`|ifInOctects.2182<p>Update: 120</p>|
|Port SFP 26 Traffic IN Errors|<p>Port 01 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.3974<p>Update: 120</p>|
|Port 25 Traffic OUT|<p>Port 25 Traffic OUT</p>|`SNMP agent`|ifOutOctets.3590<p>Update: 120</p>|
|Port 07 Traffic OUT Errors|<p>Port 07 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.1286<p>Update: 120</p>|
|Port 19 Traffic OUT Errors|<p>Port 19 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.2822<p>Update: 120</p>|
|Port SFP 25 Speed|<p>Port 01 Speed</p>|`SNMP agent`|ifspeed.3846<p>Update: 120</p>|
|Port 26 Traffic IN|<p>Port 26 Traffic IN</p>|`SNMP agent`|ifInOctects.3718<p>Update: 120</p>|
|Port 02 Traffic IN|<p>Port 02 Traffic IN</p>|`SNMP agent`|ifInOctects.646<p>Update: 120</p>|
|Port 06 Speed|<p>Port 06 Speed</p>|`SNMP agent`|ifspeed.1158<p>Update: 120</p>|
|Port 26 Speed|<p>Port 26 Speed</p>|`SNMP agent`|ifspeed.3718<p>Update: 120</p>|
|Port 01 Status|<p>Port 01 Status</p>|`SNMP agent`|ifOperStatus.518<p>Update: 120</p>|
|Port 14 Traffic IN Errors|<p>Port 14 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.2182<p>Update: 120</p>|
|Port 04 Status|<p>Port 04 Status</p>|`SNMP agent`|ifOperStatus.902<p>Update: 120</p>|
|Port 05 Speed|<p>Port 05 Speed</p>|`SNMP agent`|ifspeed.1030<p>Update: 120</p>|
|Port 20 Traffic OUT Errors|<p>Port 20 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.2950<p>Update: 120</p>|
|Port 04 Last Changed|<p>Port 04 Last Changed</p>|`SNMP agent`|ifLastChange.902<p>Update: 120</p>|
|Port 05 Traffic IN Errors|<p>Port 05 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.1030<p>Update: 120</p>|
|Port 15 Traffic OUT|<p>Port 15 Traffic OUT</p>|`SNMP agent`|ifOutOctets.2310<p>Update: 120</p>|
|Port 14 Traffic OUT Errors|<p>Port 14 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.2182<p>Update: 120</p>|
|Port 06 Last Changed|<p>Port 06 Last Changed</p>|`SNMP agent`|ifLastChange.1158<p>Update: 120</p>|
|Port 16 Traffic IN|<p>Port 16 Traffic IN</p>|`SNMP agent`|ifInOctects.2438<p>Update: 120</p>|
|Port 22 Last Changed|<p>Port 22 Last Changed</p>|`SNMP agent`|ifLastChange.3206<p>Update: 120</p>|
|Port 08 Last Changed|<p>Port 08 Last Changed</p>|`SNMP agent`|ifLastChange.1414<p>Update: 120</p>|
|Port 12 Traffic OUT|<p>Port 12 Traffic OUT</p>|`SNMP agent`|ifOutOctets.1926<p>Update: 120</p>|
|Port 19 Traffic IN|<p>Port 19 Traffic IN</p>|`SNMP agent`|ifInOctects.2822<p>Update: 120</p>|
|Port 26 Traffic OUT|<p>Port 26 Traffic OUT</p>|`SNMP agent`|ifOutOctets.3718<p>Update: 120</p>|
|Port 04 Traffic OUT Errors|<p>Port 04 Traffic OUT Errors</p>|`SNMP agent`|ifOutErrors.902<p>Update: 120</p>|
|Port 25 Traffic IN Errors|<p>Port 25 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.3590<p>Update: 120</p>|
|Port 01 Traffic IN|<p>Port 01 Traffic IN</p>|`SNMP agent`|ifInOctects.518<p>Update: 120</p>|
|Port 03 Traffic IN Errors|<p>Port 03 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.774<p>Update: 120</p>|
|Port 26 Last Changed|<p>Port 26 Last Changed</p>|`SNMP agent`|ifLastChange.3718<p>Update: 120</p>|
|Port 14 Status|<p>Port 14 Status</p>|`SNMP agent`|ifOperStatus.2182<p>Update: 120</p>|
|Port 15 Status|<p>Port 15 Status</p>|`SNMP agent`|ifOperStatus.2310<p>Update: 120</p>|
|Port SFP 25 Status|<p>Port 01 Status</p>|`SNMP agent`|ifOperStatus.3846<p>Update: 120</p>|
|Port 03 Traffic OUT|<p>Port 03 Traffic OUT</p>|`SNMP agent`|ifOutOctets.774<p>Update: 120</p>|
|Port 25 Speed|<p>Port 25 Speed</p>|`SNMP agent`|ifspeed.3590<p>Update: 120</p>|
|Port 03 Last Changed|<p>Port 03 Last Changed</p>|`SNMP agent`|ifLastChange.774<p>Update: 120</p>|
|Port 16 Traffic IN Errors|<p>Port 16 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.2438<p>Update: 120</p>|
|Port 05 Status|<p>Port 05 Status</p>|`SNMP agent`|ifOperStatus.1030<p>Update: 120</p>|
|Port 06 Traffic IN Errors|<p>Port 06 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.1158<p>Update: 120</p>|
|Port 17 Speed|<p>Port 17 Speed</p>|`SNMP agent`|ifspeed.2566<p>Update: 120</p>|
|Port 16 Traffic OUT|<p>Port 16 Traffic OUT</p>|`SNMP agent`|ifOutOctets.2438<p>Update: 120</p>|
|Port 01 Speed|<p>Port 01 Speed</p>|`SNMP agent`|ifspeed.518<p>Update: 120</p>|
|Port 18 Traffic IN|<p>Port 18 Traffic IN</p>|`SNMP agent`|ifInOctects.2694<p>Update: 120</p>|
|Port 03 Speed|<p>Port 03 Speed</p>|`SNMP agent`|ifspeed.774<p>Update: 120</p>|
|Port 22 Status|<p>Port 22 Status</p>|`SNMP agent`|ifOperStatus.3206<p>Update: 120</p>|
|Port 22 Traffic IN Errors|<p>Port 22 Traffic IN Errors</p>|`SNMP agent`|ifInErrors.3206<p>Update: 120</p>|
|Port 17 Traffic IN|<p>Port 17 Traffic IN</p>|`SNMP agent`|ifInOctects.2566<p>Update: 120</p>|
|Port 23 Traffic OUT|<p>Port 23 Traffic OUT</p>|`SNMP agent`|ifOutOctets.3334<p>Update: 120</p>|
|Port 14 Traffic OUT|<p>Port 14 Traffic OUT</p>|`SNMP agent`|ifOutOctets.2182<p>Update: 120</p>|
|Port 19 Last Changed|<p>Port 19 Last Changed</p>|`SNMP agent`|ifLastChange.2822<p>Update: 120</p>|
|Port 11 Traffic IN|<p>Port 11 Traffic IN</p>|`SNMP agent`|ifInOctects.1798<p>Update: 120</p>|
|Port 20 Traffic IN|<p>Port 20 Traffic IN</p>|`SNMP agent`|ifInOctects.2950<p>Update: 120</p>|


## Triggers

There are no triggers in this template.

