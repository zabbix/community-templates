# Juniper EX

## Overview

This template is for the monitoring of Juniper EX series switching hardware via SNMP.


It requires no additional files or components - just add the template and you're done.


Monitors the following items:


* Device availability (ping check)
* Alarm status (red / yellow)
* 5 minute load average
* CPU use
* Memory use
* Routing engine temperature
* Interfaces
	+ Inbound discarded packets
	+ Inbound errors
	+ Inbound traffic
	+ Outbound discarded packets
	+ Outbound errors
	+ Outbound traffic


Discovery will detect your ports and VLANs, and this will work in virtual chassis configurations.


Tested with the following hardware:


* EX4600
* EX3300
* EX2200


All suggestions, edits and ideas are welcome!



## Author

Jonathan Halewood

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|JunOS Interfaces|<p>-</p>|`SNMP agent`|discovery.ifDescr<p>Update: 300</p>|
|JunOS Hardware|<p>-</p>|`SNMP agent`|jnxRedundancyL1Index<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Yellow alarm|<p>-</p>|`SNMP agent`|YellowAlarm<p>Update: 60</p>|
|Red alarm|<p>-</p>|`SNMP agent`|RedAlarm<p>Update: 30</p>|
|Ping check|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|
|Uptime|<p>-</p>|`SNMP agent`|Uptime<p>Update: 60</p>|
|{#SNMPVALUE} - Inbound discarded packets|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.13.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound traffic|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.10.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound errors|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.14.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound traffic|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.16.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound discarded packets|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.19.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound errors|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.20.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Switch {#SNMPVALUE} - 5 min load avarage|<p>-</p>|`SNMP agent`|jnxOperating5MinLoadAvg.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Switch {#SNMPVALUE} - Memory usage|<p>-</p>|`SNMP agent`|jnxOperatingBuffer.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Switch {#SNMPVALUE} - CPU usage|<p>-</p>|`SNMP agent`|jnxOperatingCPU.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Switch {#SNMPVALUE} - Routing engine temperature|<p>-</p>|`SNMP agent`|jnxOperatingTemp.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOSTNAME} {#SNMPVALUE} - CPU usage above 70%|<p>The CPU load on this node has increased to over 70%. If this is a sudden or unexpected increase, immediate investigation is advised.</p>|<p>**Expression**: min(/Juniper EX/jnxOperatingCPU.[{#SNMPVALUE}],30s)>70 and min(/Juniper EX/jnxOperatingCPU.[{#SNMPVALUE}],30s)<95 and last(/Juniper EX/jnxOperating5MinLoadAvg.[{#SNMPVALUE}])>100 and last(/Juniper EX/jnxOperating5MinLoadAvg.[{#SNMPVALUE}])<300</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} {#SNMPVALUE} - High CPU usage (95%)|<p>The CPU load on this node has increased to over 95%. If this is a sudden or unexpected increase, immediate investigation is advised.</p>|<p>**Expression**: last(/Juniper EX/jnxOperating5MinLoadAvg.[{#SNMPVALUE}])>300 and last(/Juniper EX/jnxOperatingCPU.[{#SNMPVALUE}])>95</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - High temperature|<p>The temperature of this switch is above 60ºC. Please check the status of the fans and environmental conditions immediately.</p>|<p>**Expression**: min(/Juniper EX/jnxOperatingTemp.[{#SNMPVALUE}],60s)>60</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - Memory usage above 70%|<p>-</p>|<p>**Expression**: last(/Juniper EX/jnxOperatingBuffer.[{#SNMPVALUE}])>70 and last(/Juniper EX/jnxOperatingBuffer.[{#SNMPVALUE}])<95</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} {#SNMPVALUE} - Memory usage above 95%|<p>-</p>|<p>**Expression**: last(/Juniper EX/jnxOperatingBuffer.[{#SNMPVALUE}])>95</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - CPU usage above 70% (LLD)|<p>The CPU load on this node has increased to over 70%. If this is a sudden or unexpected increase, immediate investigation is advised.</p>|<p>**Expression**: min(/Juniper EX/jnxOperatingCPU.[{#SNMPVALUE}],30s)>70 and min(/Juniper EX/jnxOperatingCPU.[{#SNMPVALUE}],30s)<95 and last(/Juniper EX/jnxOperating5MinLoadAvg.[{#SNMPVALUE}])>100 and last(/Juniper EX/jnxOperating5MinLoadAvg.[{#SNMPVALUE}])<300</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} {#SNMPVALUE} - High CPU usage (95%) (LLD)|<p>The CPU load on this node has increased to over 95%. If this is a sudden or unexpected increase, immediate investigation is advised.</p>|<p>**Expression**: last(/Juniper EX/jnxOperating5MinLoadAvg.[{#SNMPVALUE}])>300 and last(/Juniper EX/jnxOperatingCPU.[{#SNMPVALUE}])>95</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - High temperature (LLD)|<p>The temperature of this switch is above 60ºC. Please check the status of the fans and environmental conditions immediately.</p>|<p>**Expression**: min(/Juniper EX/jnxOperatingTemp.[{#SNMPVALUE}],60s)>60</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - Memory usage above 70% (LLD)|<p>-</p>|<p>**Expression**: last(/Juniper EX/jnxOperatingBuffer.[{#SNMPVALUE}])>70 and last(/Juniper EX/jnxOperatingBuffer.[{#SNMPVALUE}])<95</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} {#SNMPVALUE} - Memory usage above 95% (LLD)|<p>-</p>|<p>**Expression**: last(/Juniper EX/jnxOperatingBuffer.[{#SNMPVALUE}])>95</p><p>**Recovery expression**: </p>|high|
