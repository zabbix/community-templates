# OpenZFS by Zabbix agent 2

Author: colttt

Monitoring template for **OpenZFS 2.3 on Linux** and **Zabbix 7.0 LTS**, using **passive Zabbix Agent 2 checks**.

The template makes extensive use of **native JSON output** from `zpool` and `zfs`, JSONPath preprocessing, dependent items and low-level discovery (LLD). It also reads Linux ZFS kernel statistics directly. No Python, `jq`, ZED hooks or additional host-side parsing scripts are required.

## Features

| Component | Monitoring |
| --- | --- |
| Pools | Health, capacity, fragmentation, diagnostic messages, data/scan errors and capacity forecast |
| Scrub / resilver | Scan status, issued-byte progress, elapsed time, scan errors, overdue scrubs, long-running/stalled resilvers |
| Hot spares | Available (`AVAIL`) and in-use (`INUSE`) states, active spare replacements |
| VDEVs | Device state, existing and increasing read/write/checksum errors, slow I/O counters and optional scan activity |
| Datasets | Used/available space, quotas, snapshots and compression ratio |
| Performance | Per-pool read/write IOPS and throughput from interval-based samples |
| ARC / L2ARC | Cache sizes, hit/miss counters and interval-based hit ratios |
| ZIL | Commit statistics, SLOG activity and commit errors |

Pools, VDEVs and datasets are automatically discovered. The template includes a three-page **OpenZFS overview** dashboard. Items and triggers use the tag `system: zfs`.

## Alerting and discovery behavior

- **Existing VDEV errors:** A persistent alert fires whenever any READ, WRITE or CKSUM counter is non-zero, even when errors predate the first collected value. The original increasing-counter triggers remain available for newly occurring errors.
- **Consolidated pool errors:** A single `Pool {#POOL}: ZFS errors reported` alert covers both permanent data errors and scan-reported errors. Both source items remain available for diagnosis. The old standalone scan-errors trigger is disabled so it is also updated on existing installations with *Delete missing* disabled.
- **Hot spare states:** `ONLINE`, `INUSE`, `AVAIL` and the compatibility spelling `AVAILABLE` are accepted as healthy VDEV states. `INUSE` still produces a separate hot-spare-in-use notice. `DEGRADED`, `FAULTED`, `OFFLINE` and `UNAVAIL` are not healthy states.
- **Conditional VDEV discovery:** LLD overrides only discover read/write/checksum error items, `slow_ios` and `scan_processed` when the corresponding JSON fields exist. This avoids empty or unsupported metrics on idle hot spares and RAIDZ/mirror group VDEVs. Resilver-specific `scan_processed` remains available whenever ZFS exposes it.
- **Scan progress:** During a running scrub/resilver, progress uses `scan_stats.issued / scan_stats.to_examine`, matching `zpool status`. A finished scan reports 100%, even if the issued-byte count differs from the amount to examine.

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

- Zabbix 7.0 LTS and Zabbix Agent 2 using passive checks.
- OpenZFS 2.3 on Linux with the `zpool` and `zfs` utilities.
- `sudo` for the restricted read-only ZFS commands, with matching paths and arguments in the supplied configuration.
- Read access to `/proc/spl/kstat/zfs/` and `/sys/module/zfs/version` for the Agent 2 process.

## Installation

1. Check the paths to `sudo`, `zpool` and `zfs` in the files below; adapt them for your distribution if necessary.
2. Install [`files/sudo_zabbix-openzfs`](files/sudo_zabbix-openzfs) as `/etc/sudoers.d/zabbix-openzfs` with `root:root`, mode `0440`; validate with `visudo -cf /etc/sudoers.d/zabbix-openzfs`.
3. Install [`files/openzfs.conf`](files/openzfs.conf) as `/etc/zabbix/zabbix_agent2.d/openzfs.conf`; avoid duplicate `UserParameter` definitions.
4. Enable passive Agent 2 checks from your Zabbix server or proxy (`Server=` and TCP port 10050) and restart `zabbix-agent2`.
5. Import `template_OpenZFS_by_Zabbix_agent_2.yaml`, link **OpenZFS by Zabbix agent 2** to the host and set the macros as needed.

**Important:** `zpool status -j --json-flat-vdevs --json-int` is required. Without `--json-int`, `scan_stats.start_time` and `scan_stats.end_time` can be formatted date strings rather than Unix timestamps, breaking numeric scrub/resilver items. The supplied Agent 2 configuration and sudoers rule already contain `--json-int`.

The `zpool list -Hp ... --json` command deliberately uses `-p` for exact, machine-readable size values. Its numeric JSON strings work with the template's preprocessing; `--json-int` is needed specifically for `zpool status` scan timestamps. Large 64-bit GUIDs should not be treated as precise JavaScript numbers.

## Notes and upgrades

- Raw JSON master items do not retain history; dependent items store extracted metrics.
- `zpool iostat -Hpv 1 2` uses the **second** sample to report recent interval I/O, rather than the initial long-term average.
- `zpool status` only exposes the most recent scan, not a complete scrub history. The template retains successful scrubs observed through Zabbix history, including across later resilvers; a scrub before monitoring began may remain unknown.
- Optional metrics are absent rather than zero when ZFS does not report them.
- A `DEGRADED` pool or data corruption may require investigation even when the pool state is `ONLINE`.
- The template **monitors** scrub intervals; it does not schedule or launch scrubs.

When updating an existing Zabbix installation, enable **Update existing** and **Create new**, and disable **Delete missing**. Include discovery and trigger prototype updates in the import rules. A customized dashboard can be preserved by importing a local variant without a dashboard (not included in the upstream repository template); the main repository YAML includes the stock dashboard.

After enabling conditional LLD overrides, previously discovered items for missing fields can become *lost* and follow the discovery rule's normal retention period (7 days by default). **Delete missing OFF** controls template import only, not that LLD lifecycle.
