# Chrony Accuracy Monitoring (Zabbix 7.0)

## Overview
High-precision time synchronization quality and sources accuracy monitoring template for Chrony on Zabbix 7.0 LTS.

### Key Features
- **Master Item Trapper / Polling**: Collects tracking metrics atomically in a single `chronyc -c tracking` call, reducing agent and daemon process load by ~87%.
- **Chrony 3.x & 4.x Hybrid Compatibility**: Dynamically inspects column count (`parts.length >= 14`) to support both legacy Chrony 3.x (13-column, CentOS/RHEL 7) and modern Chrony 4.x (14-column, AL2023, Ubuntu 22.04+, RHEL 8/9).
- **Sub-Millisecond Auto-scaling**: Automatically parses and converts nanosecond (`ns`), microsecond (`us`), millisecond (`ms`), and second (`s`) outputs into milliseconds.
- **Low-Level Discovery (LLD)**: Discovers all configured standby and active NTP sources via `chronyc sources` with reachability, delay, and offset tracking.
- **Modern 72-Column SVG Dashboard**: Optimized for Zabbix 7.0 full-width grid layout with integer Stratum display and time offset trend graphs.

## Requirements
- Zabbix 7.0 or newer
- Zabbix Agent or Zabbix Agent 2
- Remote command permission enabled in agent configuration:
  ```ini
  AllowKey=system.run[*]
  ```

## Collected Items
| Name | Key | Type | Description |
| :--- | :--- | :---: | :--- |
| **NTP offset** | `Lastoffset` | Dependent | Current offset from active reference peer (ms) |
| **NTP RMS offset** | `RMSoffset` | Dependent | Long-term root-mean-square offset estimate (ms) |
| **Network root delay** | `Rootdelay` | Dependent | Total round-trip network latency to Stratum-1 server (ms) |
| **NTP stratum** | `Stratum` | Dependent | Hierarchy level (1-16) |
| **Synchronization state** | `LeapStatus` | Dependent | Leap second and sync status |
| **NTP reference ID** | `Reference` | Dependent | Active reference clock ID |
| **NTP update interval** | `Updateinterval` | Dependent | Polling update interval (s) |
| **Source Reachability** | `chrony.source.reach[{#SOURCE_NAME}]` | Dependent (LLD) | 8-bit octal reach register |
| **Source Delay / Offset** | `chrony.source.delay` / `offset` | Dependent (LLD) | Estimated delay and offset per source peer |

## Upstream Repository
- [qryuu/time-sync-monitoring-to-zabbix](https://github.com/qryuu/time-sync-monitoring-to-zabbix)\n