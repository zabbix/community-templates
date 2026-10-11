# PTP (IEEE 1588 / linuxptp) Monitoring (Zabbix 7.0)

## Overview
Nanosecond-level Precision Time Protocol (IEEE 1588-2008 / PTPv2) monitoring template for `linuxptp` (`ptp4l`, `phc2sys`, `pmc`) on Zabbix 7.0 LTS.

### Key Features
- **Nanosecond Precision**: Direct hardware timestamp (PHC) synchronization tracking with master offset (ns) and mean path delay (ns).
- **Atomic PMC Query**: Consolidates `TIME_STATUS_NP`, `CURRENT_DATA_SET`, and `PORT_DATA_SET` in a single `pmc` query via JavaScript preprocessing.
- **Complete Daemon Health Check**: Monitors both `ptp4l` (PTP protocol daemon) and `phc2sys` (PHC to system clock transfer daemon) process states.
- **State Triggers**: Immediate alerts on Grandmaster loss (`gmPresent=false`) or port state degradation (not in `SLAVE`/`MASTER`).

## Requirements
- Zabbix 7.0 or newer
- `linuxptp` package installed (`ptp4l`, `phc2sys`, `pmc`)
- Access to Unix domain socket `/var/run/ptp4l` (add `zabbix` user to appropriate group or configure permissions)
- Remote command permission:
  ```ini
  AllowKey=system.run[*]
  ```

## Collected Metrics
| Metric | Key | Unit | Description |
| :--- | :--- | :---: | :--- |
| **PTP Master Offset** | `ptp.offset_from_master` | ns | Deviation from Grandmaster clock (threshold alerts at 1µs / 10µs) |
| **PTP Mean Path Delay** | `ptp.mean_path_delay` | ns | One-way mean path round-trip delay |
| **Grandmaster Presence** | `ptp.gm_present` | - | True if Grandmaster is currently detected |
| **PTP Port State** | `ptp.port_state` | - | Port status (`SLAVE`, `MASTER`, `PASSIVE`, `FAULTY`, etc.) |
| **Grandmaster ID** | `ptp.gm_identity` | - | Active Grandmaster EUI-64 clock identifier |
| **Steps Removed** | `ptp.steps_removed` | - | Boundary clock hops from Grandmaster |
| **Port Identity** | `ptp.port_identity` | - | Local port identifier |
| **ptp4l Process Count** | `proc.num[ptp4l]` | - | Daemon process monitoring for `ptp4l` |
| **phc2sys Process Count** | `proc.num[phc2sys]` | - | Daemon process monitoring for `phc2sys` |

## Upstream Repository
- [qryuu/time-sync-monitoring-to-zabbix](https://github.com/qryuu/time-sync-monitoring-to-zabbix)\n