# OpenZFS by Zabbix agent 2

Author: colttt

Monitoring template for **OpenZFS 2.3 on Linux** and **Zabbix 7.0 LTS**, using **passive Zabbix Agent 2 checks**.

The template uses native `zpool` / `zfs` commands, Linux ZFS kernel statistics, dependent items, low-level discovery (LLD), JSONPath and built-in Zabbix preprocessing.

## Features

| Component | Monitoring |
| --- | --- |
| Pools | Health, capacity, fragmentation, diagnostic messages, data errors and capacity forecasting |
| Scrub / resilver | Scan state, progress, runtime, scan errors, overdue scrubs, long-running or stalled resilvers |
| Hot spares | Spares in use and replacement groups |
| VDEVs | State, read/write/checksum errors, slow I/O counters and scan activity |
| Datasets | Used/available space, quotas, snapshots and compression ratio |
| Performance | Per-pool read/write IOPS and throughput |
| ARC / L2ARC | Cache size, hit/miss counters and interval-based hit ratios |
| ZIL | Commit statistics, SLOG activity and commit errors |

Pools, VDEVs and datasets are discovered automatically. The template includes an **OpenZFS overview** dashboard with health, scrub/resilver, and capacity/performance views. Items and triggers are tagged `system: zfs` for easy filtering.

## Triggers

- **Pools:** not ONLINE, high/critical capacity, forecasted capacity exhaustion, data or scan errors, and diagnostic messages.
- **Scrub / resilver:** scrub overdue or history unknown; resilver running, stalled or unusually long.
- **Hot spares:** spare currently in use.
- **VDEVs:** non-ONLINE state; increasing read, write, checksum or slow-I/O counters.
- **Datasets:** quota utilization above the configured threshold.
- **ZIL:** increasing commit-error counter.

## Configuration macros

| Macro | Default | Description |
| --- | --- | --- |
| `{$ZFS.POOL.CAP.WARN}` | `80` | Pool capacity warning threshold (%) |
| `{$ZFS.POOL.CAP.HIGH}` | `90` | Pool capacity high threshold (%) |
| `{$ZFS.DATASET.CAP.WARN}` | `90` | Dataset quota utilization warning (%) |
| `{$ZFS.SCRUB.MAXAGE}` | `2592000` | Maximum age of an observed successful scrub (30 days, seconds) |
| `{$ZFS.SCRUB.LOOKBACK}` | `180d` | History window for previously observed completed scrubs |
| `{$ZFS.SCAN.STALL.WINDOW}` | `2h` | Observation window for stalled scan progress |
| `{$ZFS.RESILVER.MAXDURATION}` | `604800` | Long-running resilver threshold (7 days, seconds) |
| `{$ZFS.POOL.FORECAST.HORIZON}` | `7d` | Time horizon for pool-capacity forecasting |

## Requirements

- Zabbix Agent 2
- OpenZFS 2.3 on Linux, with `zpool` and `zfs` available
- `sudo` for the restricted read-only ZFS commands
- Read access to `/proc/spl/kstat/zfs/` and `/sys/module/zfs/version` for the relevant Agent 2 items

## Installation

1. Check the paths to `sudo`, `zpool` and `zfs`; adjust the supplied files if your distribution uses different paths.
2. Copy `zabbix-openzfs.sudoers` to `/etc/sudoers.d/zabbix-openzfs`, owned by `root:root` with mode `0440`. Validate it with `visudo -cf /etc/sudoers.d/zabbix-openzfs`.
3. Copy `zabbix_agent2_openzfs.conf` to `/etc/zabbix/zabbix_agent2.d/openzfs.conf`. Avoid duplicate `UserParameter` definitions.
4. Ensure Agent 2 allows passive checks from your Zabbix server/proxy (`Server=` and TCP port 10050), then restart `zabbix-agent2`.
5. Import the Zabbix 7.0 YAML template and link **OpenZFS by Zabbix agent 2** to the host. Configure the macros as needed.

## Notes

- Raw JSON master items do not retain history; dependent items store the extracted metrics.
- `zpool iostat -Hpv 1 2` is parsed using its **second** sample to report current interval I/O rather than the initial long-term average.
- `zpool status` exposes the most recent scan, not a permanent scrub history. A prior scrub may therefore be unknown when monitoring starts during a resilver; the template tracks successfully completed scrubs observed by Zabbix.
- Optional or missing metrics use Zabbix *Custom on fail* handling where appropriate; missing values should not be confused with zero.
- With `--json-int`, 64-bit pool/VDEV GUIDs are JSON numbers. JavaScript may lose precision when parsing values above `2^53`; the current discovery uses VDEV names rather than numeric GUIDs as identifiers.
- This template **monitors** scrub intervals; it does not schedule or start scrub operations.
