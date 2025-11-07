# Template VyOS by SNMP

## Overview

This template is designed for monitoring **VyOS network appliances** using **SNMP**.  
It provides metrics for system performance, interface statistics, BGP sessions, and environmental data.  
Tested on **Zabbix 7.4.5**.

### Features
- Interface discovery with traffic, errors, and operational status  
- BGP peer discovery with session state monitoring  
- ICMP availability check (ping, loss, response time)  
- System resource monitoring (CPU, memory, uptime)  
- SNMP-based performance collection  

---

## Setup

### Requirements
- VyOS device with SNMP enabled (v2c or v3)  
- Zabbix server or proxy with network access to the VyOS SNMP agent  
- Community string or SNMPv3 credentials configured  

### VyOS SNMP Configuration Example

```bash
set service snmp community public authorization read-only
set service snmp contact "admin@domain.hr"
set service snmp location "VyOS Router"
set service snmp listen-address 0.0.0.0
commit; save
```

### Zabbix Configuration
1. Import the **vyos_snmp_template.yaml** file via *Configuration → Templates → Import*.  
2. Link this template to your VyOS host.  
3. Set SNMP interface and correct community string.  

---

## Template Contents

| **Name** | **Type** | **Key** | **Description** |
|-----------|-----------|---------|-----------------|
| ICMP ping | SIMPLE | `icmpping` | The host accessibility by ICMP ping. 0 - fail; 1 - success. |
| ICMP loss | SIMPLE | `icmppingloss` | The percentage of lost packets. |
| ICMP response time | SIMPLE | `icmppingsec` | The ICMP ping response time (in seconds). |
| Mikrotik: SNMP walk BGP | SNMP_AGENT | `mikrotik.bgp.state` |  |
| VyOS: SNMP walk network interfaces | SNMP_AGENT | `net.if.walk` | Discovering interfaces from IF-MIB. |
| CPU utilization | SNMP_AGENT | `system.cpu.util` | Average CPU utilization. |
| Memory usage | SNMP_AGENT | `system.memory.util` | Used memory percentage. |
| System uptime | SNMP_AGENT | `system.uptime` | Device uptime (in seconds). |
| Interface input traffic | SNMP_AGENT | `net.if.in[{#IFNAME}]` | Incoming traffic per interface. |
| Interface output traffic | SNMP_AGENT | `net.if.out[{#IFNAME}]` | Outgoing traffic per interface. |
| BGP peer state | SNMP_AGENT | `bgp.peer.state[{#PEER}]` | BGP session status per peer. |

**Total items:** 43  
**Low-level discovery rules:** 4  
**Triggers:** 0  

---

## Macros Used

| **Macro** | **Description** |
|------------|----------------|
| {$SNMP_COMMUNITY} | SNMP community string (default: `public`) |
| {$ICMP_TIMEOUT} | ICMP ping timeout in seconds |
| {$ICMP_LOSS_WARN} | Warning threshold for ICMP packet loss (%) |
| {$ICMP_LOSS_CRIT} | Critical threshold for ICMP packet loss (%) |

---

## Discovery Rules

| **Name** | **Key** | **Description** |
|-----------|----------|----------------|
| Interface Discovery | `net.if.walk` | Discovers all network interfaces and their statistics |
| BGP Peer Discovery | `mikrotik.bgp.state` | Discovers all active BGP peers |
| Temperature Sensor Discovery | `sensor.temp.discovery` | Discovers temperature sensors |
| System Service Discovery | `system.service.discovery` | Discovers active VyOS services (if SNMP provides data) |

---

---

**Tested with:** Zabbix 7.4.5  
**Template name:** Template VyOS by SNMP  
**License:** GNU GPL v2
