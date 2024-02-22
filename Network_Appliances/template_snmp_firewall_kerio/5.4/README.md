# Template: SNMP_FIREWALL_KERIO_CONTROL_LLD_VERSAO-1.0

## Overview

Template for monitoring Kerio Control Firewall using SNMP.

Contact: alimoradimllm99@gmail.com

## Macros used

No macros used in this template.

## Template links

No links to other templates.

## Discovery rules

### LLD Discovery Firewall Description
Discovers firewall descriptions.
- **Type:** SNMP agent
- **Key:** sysDescr.discovery
- **Update interval:** 84600 seconds

### Discovery LLD Information Memory Firewall
Discovers memory information for the firewall.
- **Type:** SNMP agent
- **Key:** fgHaStatsMemUsage2.discovery
- **Update interval:** 84600 seconds

### Discovery LLD Information Processor Firewall
Discovers processor information for the firewall.
- **Type:** SNMP agent
- **Key:** fgHaStatsCpuUsages.discovery
- **Update interval:** 84600 seconds

### Firewall Network Interface LLD Discovery
Discovers network interfaces of the firewall.
- **Type:** SNMP agent
- **Key:** FwIfName.discovery
- **Update interval:** 84600 seconds

### Discovery LLD Hardware Inventory
Discovers hardware inventory information.
- **Type:** SNMP agent
- **Key:** fgHaStatsHostname.discovery
- **Update interval:** 84600 seconds

## Items collected

### System Health
- **Package Loss (%):** Monitors packet loss.
- **Latency:** Monitors latency.
- **Availability:** Monitors availability.
- **On Time:** Uptime of the firewall.

### Firewall Information
- **Number of Services:** Number of services running.
- **Contact Information:** Contact information of the firewall.
- **Equipment Description:** Description of the equipment.
- **Location Information:** Location of the firewall.
- **OID Information:** OID information of the firewall.
- **Hostname:** Hostname of the firewall.
- **Firewall Version:** Version of the firewall.

### Memory Usage
- **Memory in Use (%):** Memory usage.
- **Memory Cache Usage (%):** Cache memory usage.
- **Total Memory (MB):** Total memory available.
- **Buffering Memory Usage (%):** Buffering memory usage.
- **Shared Memory Usage (%):** Shared memory usage.
- **Free Total Memory (MB):** Free total memory.

### Processor Usage
- **Processor Usage (%):** Processor usage.

### Network Interface
- **Administrative Status:** Status of network interfaces.
- **Alias:** Alias of network interfaces.
- **Information:** Information of network interfaces.
- **Description:** Description of network interfaces.
- **MAC Address:** MAC address of network interfaces.
- **Type:** Type of network interfaces.
- **Inbound Traffic:** Inbound traffic on interfaces.
- **Outbound Traffic:** Outbound traffic on interfaces.

## Triggers

### Firewall Health
- **Firewall Processor Usage High:** Triggered when processor usage exceeds 50%.
- **Firewall Memory Usage High:** Triggered when memory usage exceeds 1000 MB.
- **Network Interface Down:** Triggered when a network interface goes down.

### LLD Triggers
- **Firewall Processor Usage High (LLD):** Triggered when processor usage exceeds 50% for any discovered entity.
- **Firewall Memory Usage High (LLD):** Triggered when memory usage exceeds 1000 MB for any discovered entity.
- **Network Interface Down (LLD):** Triggered when a network interface goes down for any discovered entity.
