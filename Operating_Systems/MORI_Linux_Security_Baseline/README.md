# MORI Linux Security Baseline

## Overview

A lightweight security/audit baseline template for Linux endpoints monitored by
**Zabbix agent 2**. It surfaces disk / CPU / memory / agent-availability problems
so they can be consumed as audit evidence. Vendor-neutral: the only vendor-specific
piece (a trigger URL) is a macro that defaults to empty.

## Requirements

- Zabbix 7.4 or newer
- Zabbix agent 2 on the monitored host

## Macros used

| Name | Description | Default |
|---|---|---|
| `{$MORI.DISK.PUSED.MAX}` | Filesystem used-space trigger threshold, % (context-aware per `{#FSNAME}`) | `85` |
| `{$MORI.CPU.LOAD.MAX}` | CPU load (1m avg) trigger threshold | `4` |
| `{$MORI.MEM.PAVAIL.MIN}` | Minimum available memory, % | `10` |
| `{$MORI.AGENT.NODATA}` | Agent no-data window | `5m` |
| `{$MORI.URL}` | Optional URL attached to triggers (leave empty for none) | *(empty)* |

## Discovery rules

- **Mounted filesystem discovery** (`vfs.fs.discovery`) → per-mount used-% item + trigger.

## Items

- CPU: load average (1m) — `system.cpu.load[all,avg1]`
- Memory: available, in % — `vm.memory.size[pavailable]`
- Zabbix agent availability — `agent.ping`
- FS {#FSNAME}: space used, in % — `vfs.fs.size[{#FSNAME},pused]` (prototype)

## Triggers

| Name | Severity |
|---|---|
| FS {#FSNAME}: space usage is high | High |
| CPU load is too high (avg 5m) | Average |
| Available memory is low | High |
| Zabbix agent is not responding | High |

## Tags

`class=security`, `source=mori`, `component={storage,cpu,memory,agent}`

## Author

saranf <https://github.com/saranf>
