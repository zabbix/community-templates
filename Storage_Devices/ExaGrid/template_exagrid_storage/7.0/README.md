# ExaGrid Tiered Backup Storage by SNMP

## Overview

Template for monitoring ExaGrid Tiered Backup Storage appliances via SNMP.
This template combines ExaGrid's proprietary MIBs with standard MIB-II to provide a complete observability picture without requiring external API scripts. It is designed to track core health, storage utilization (Landing and Retention zones), network performance, system resources, and security anomalies.

Tested on:
* ExaGrid Tiered Backup Storage appliances

## Setup

1. Enable SNMP (v2c or v3) on the ExaGrid appliance via the web management interface.
2. Allow SNMP traffic from your Zabbix Server or Proxy to the ExaGrid appliance.
3. Import the template into Zabbix and assign it to the target host.
4. Set the required macros: `{$SNMP_COMMUNITY}`.

## Macros used

| Name | Description | Default | Type |
|------|-------------|---------|------|
| `{$SNMP_COMMUNITY}` | SNMP community string for polling data. | `public` | Text macro |

## Template links

There are no template links in this template.

## Discovery rules

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| Network Interfaces Discovery | Discovers all active network interfaces (eth, bond, lo) using standard MIB-II. | SNMP agent | `net.if.discovery`<br>Update: 1h |

## Items collected

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| System: Hostname | Appliance hostname. | SNMP agent | `system.hostname`<br>Update: 1h |
| System: Uptime | System uptime. | SNMP agent | `system.uptime`<br>Update: 5m |
| ExaGrid: System status | Overall hardware and system health state. | SNMP agent | `exagrid.system.status`<br>Update: 3m |
| ExaGrid: Pending deduplication data | Amount of data waiting in the deduplication queue. | SNMP agent | `exagrid.dedup.pending`<br>Update: 5m |
| ExaGrid: Landing Zone configured space | Total physical capacity of the Landing Zone. | SNMP agent | `exagrid.landingspace.configured`<br>Update: 1h |
| ExaGrid: Landing Zone free space | Logical free space projected in the Landing Zone. | SNMP agent | `exagrid.landingspace.free`<br>Update: 5m |
| ExaGrid: Landing Zone saved space (Logical) | Space saved by deduplication/compression on the Landing Zone. | Calculated | `exagrid.landingspace.used`<br>Update: 5m |
| ExaGrid: Retention configured space | Total physical capacity of the Retention tier. | SNMP agent | `exagrid.retention.configured`<br>Update: 1h |
| ExaGrid: Retention free space | Logical free space projected in the Retention tier. | SNMP agent | `exagrid.retention.free`<br>Update: 5m |
| ExaGrid: Retention used space | Physical space utilized in the Retention tier. | Calculated | `exagrid.retention.used`<br>Update: 5m |
| System: Total Memory (RAM) | Total RAM available on the system. | SNMP agent | `system.ram.total`<br>Update: 1h |
| System: Free Memory (RAM) | Free RAM available on the system. | SNMP agent | `system.ram.free`<br>Update: 3m |
| System: CPU Idle | CPU idle time percentage. | SNMP agent | `system.cpu.idle`<br>Update: 1m |
| System: CPU Utilization | Calculated CPU utilization percentage. | Calculated | `system.cpu.utilization`<br>Update: 1m |
| System: Load Average (1m) | CPU load average over 1 minute. | SNMP agent | `system.cpu.load1`<br>Update: 3m |
| Security: Logged in Users | Number of active users logged into the console/SSH. | SNMP agent | `system.users.logged`<br>Update: 5m |
| Security: Total Running Processes | Total number of running processes. | SNMP agent | `system.processes.total`<br>Update: 5m |
| Security: Established TCP Connections | Number of established TCP connections. | SNMP agent | `net.tcp.established`<br>Update: 3m |
| Interface {#IFNAME}: Bits received | Inbound network traffic on the discovered interface. | SNMP agent | `net.if.in[{#IFNAME}]`<br>Update: 3m |
| Interface {#IFNAME}: Bits sent | Outbound network traffic on the discovered interface. | SNMP agent | `net.if.out[{#IFNAME}]`<br>Update: 3m |

## Triggers

| Name | Description | Expression | Priority |
|------|-------------|------------|----------|
| `{HOST.NAME}: System status is in Warning state` | The ExaGrid appliance has detected an internal warning (e.g., disk warning, temperature). Check the console. | `last(/Templete_Exagrid_Storage/exagrid.system.status)=2` | Warning |
| `{HOST.NAME}: System status is in Error state` | The ExaGrid appliance reported a critical hardware or system failure. | `last(/Templete_Exagrid_Storage/exagrid.system.status)=3` | High |
| `{HOST.NAME}: Security Warning - Active SSH/Console session detected` | An active user session was detected on the backup appliance. Verify if an authorized team member is performing maintenance. | `last(/Templete_Exagrid_Storage/system.users.logged)>0` | Warning |

## Author

**João Lacerda**
* [LinkedIn](https://www.linkedin.com/in/j-lacerda/)

## License

MIT License

Copyright (c) 2024 Zabbix

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.