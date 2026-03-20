# Template Juniper EX

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
|Uptime|<p>-</p>|`SNMP agent`|Uptime<p>Update: 60</p>|
|Yellow alarm|<p>-</p>|`SNMP agent`|YellowAlarm<p>Update: 60</p>|
|Red alarm|<p>-</p>|`SNMP agent`|RedAlarm<p>Update: 30</p>|
|Ping check|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|
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
|{HOSTNAME} {#SNMPVALUE} - CPU usage above 70%|<p>The CPU load on this node has increased to over 70%. If this is a sudden or unexpected increase, immediate investigation is advised.</p>|<p>**Expression**: {Template Juniper EX:jnxOperatingCPU.[{#SNMPVALUE}].min(30)}>70 and {Template Juniper EX:jnxOperatingCPU.[{#SNMPVALUE}].min(30)}<95 and {Template Juniper EX:jnxOperating5MinLoadAvg.[{#SNMPVALUE}].last(30)}>100 and {Template Juniper EX:jnxOperating5MinLoadAvg.[{#SNMPVALUE}].last(0)}<300</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} {#SNMPVALUE} - High CPU usage (95%)|<p>The CPU load on this node has increased to over 95%. If this is a sudden or unexpected increase, immediate investigation is advised.</p>|<p>**Expression**: {Template Juniper EX:jnxOperating5MinLoadAvg.[{#SNMPVALUE}].last(0)}>300 and {Template Juniper EX:jnxOperatingCPU.[{#SNMPVALUE}].last(0)}>95</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - High temperature|<p>The temperature of this switch is above 60ºC. Please check the status of the fans and environmental conditions immediately.</p>|<p>**Expression**: {Template Juniper EX:jnxOperatingTemp.[{#SNMPVALUE}].min(60)}>60</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - Memory usage above 70%|<p>-</p>|<p>**Expression**: {Template Juniper EX:jnxOperatingBuffer.[{#SNMPVALUE}].last(0)}>70 and {Template Juniper EX:jnxOperatingBuffer.[{#SNMPVALUE}].last(0)}<95</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} {#SNMPVALUE} - Memory usage above 95%|<p>-</p>|<p>**Expression**: {Template Juniper EX:jnxOperatingBuffer.[{#SNMPVALUE}].last(0)}>95</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - CPU usage above 70% (LLD)|<p>The CPU load on this node has increased to over 70%. If this is a sudden or unexpected increase, immediate investigation is advised.</p>|<p>**Expression**: {Template Juniper EX:jnxOperatingCPU.[{#SNMPVALUE}].min(30)}>70 and {Template Juniper EX:jnxOperatingCPU.[{#SNMPVALUE}].min(30)}<95 and {Template Juniper EX:jnxOperating5MinLoadAvg.[{#SNMPVALUE}].last(30)}>100 and {Template Juniper EX:jnxOperating5MinLoadAvg.[{#SNMPVALUE}].last(0)}<300</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} {#SNMPVALUE} - High CPU usage (95%) (LLD)|<p>The CPU load on this node has increased to over 95%. If this is a sudden or unexpected increase, immediate investigation is advised.</p>|<p>**Expression**: {Template Juniper EX:jnxOperating5MinLoadAvg.[{#SNMPVALUE}].last(0)}>300 and {Template Juniper EX:jnxOperatingCPU.[{#SNMPVALUE}].last(0)}>95</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - High temperature (LLD)|<p>The temperature of this switch is above 60ºC. Please check the status of the fans and environmental conditions immediately.</p>|<p>**Expression**: {Template Juniper EX:jnxOperatingTemp.[{#SNMPVALUE}].min(60)}>60</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - Memory usage above 70% (LLD)|<p>-</p>|<p>**Expression**: {Template Juniper EX:jnxOperatingBuffer.[{#SNMPVALUE}].last(0)}>70 and {Template Juniper EX:jnxOperatingBuffer.[{#SNMPVALUE}].last(0)}<95</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} {#SNMPVALUE} - Memory usage above 95% (LLD)|<p>-</p>|<p>**Expression**: {Template Juniper EX:jnxOperatingBuffer.[{#SNMPVALUE}].last(0)}>95</p><p>**Recovery expression**: </p>|high|
