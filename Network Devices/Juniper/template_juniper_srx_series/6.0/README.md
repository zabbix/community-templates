# Template Juniper SRX

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|JunOS Interfaces|<p>-</p>|`SNMP agent`|discovery.ifDescr<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Node 1 PFE Memory usage|<p>-</p>|`SNMP agent`|jnxJsSPUMonitoringMemoryUsage.10<p>Update: 30</p>|
|Flow sessions (Available)|<p>-</p>|`Calculated`|jnxJsSPUMonitoringAvailableFlowSession.0<p>Update: 60</p>|
|Node1 PFE CPU usage|<p>-</p>|`SNMP agent`|jnxJsSPUMonitoringCPUUsage.10<p>Update: 30</p>|
|Node 0 PFE CPU usage|<p>-</p>|`SNMP agent`|jnxJsSPUMonitoringCPUUsage.0<p>Update: 30</p>|
|Yellow alarm|<p>-</p>|`SNMP agent`|jnxYellowAlarmState<p>Update: 60</p>|
|Node 0 CPU temperature|<p>-</p>|`SNMP agent`|jnxOperatingTemp.9.1.0.0<p>Update: 60</p>|
|Node 1 RE Memory usage|<p>-</p>|`SNMP agent`|jnxOperatingBuffer.9.2.0.0<p>Update: 30</p>|
|Node 0 PFE Memory usage|<p>-</p>|`SNMP agent`|jnxJsSPUMonitoringMemoryUsage.0<p>Update: 30</p>|
|Flow sessions (Current)|<p>-</p>|`SNMP agent`|jnxJsSPUMonitoringCurrentFlowSession.0<p>Update: 60</p>|
|Node 0 RE Memory usage|<p>-</p>|`SNMP agent`|jnxOperatingBuffer.9.1.0.0<p>Update: 30</p>|
|Node 1 CPU temperature|<p>-</p>|`SNMP agent`|jnxOperatingTemp.9.2.0.0<p>Update: 60</p>|
|Uptime|<p>-</p>|`SNMP agent`|Uptime<p>Update: 60</p>|
|Red alarm|<p>-</p>|`SNMP agent`|jnxRedAlarmState<p>Update: 30</p>|
|Node 1 RE CPU usage|<p>-</p>|`SNMP agent`|jnxOperatingCPU.9.2.0.0<p>Update: 30</p>|
|Node 0 RE CPU usage|<p>-</p>|`SNMP agent`|jnxOperatingCPU.9.1.0.0<p>Update: 30</p>|
|Flow sessions (Max)|<p>-</p>|`SNMP agent`|jnxJsSPUMonitoringMaxFlowSession.0<p>Update: 60</p>|
|Ping check|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|
|{#SNMPVALUE} - Inbound discarded packets|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.13.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound traffic|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.10.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound errors|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.14.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound traffic|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.16.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound discarded packets|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.19.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound errors|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.20.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

