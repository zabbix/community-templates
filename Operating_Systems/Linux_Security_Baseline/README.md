# Linux Security Baseline by Zabbix agent 2

## Overview

A lightweight Linux security/audit baseline template for **Zabbix agent 2**.
It provides basic operational signals — filesystem usage, CPU load, memory
availability, and agent availability — with macro-based thresholds, so they can
be consumed as audit evidence.

Vendor-neutral: the only vendor-specific piece (a trigger URL) is a macro that
defaults to empty, so the template works standalone. The optional
`{$BASELINE.URL}` link can point to any dashboard, runbook, or audit system.

## Requirements

- Zabbix 7.4 or newer
- Zabbix agent 2 on the monitored host

## Macros used

| Name | Description | Default |
|---|---|---|
| `{$BASELINE.DISK.PUSED.MAX}` | Filesystem used-space trigger threshold, % (context-aware per `{#FSNAME}`) | `85` |
| `{$BASELINE.CPU.LOAD.MAX}` | CPU load (1m avg) trigger threshold | `4` |
| `{$BASELINE.MEM.PAVAIL.MIN}` | Minimum available memory, % | `10` |
| `{$BASELINE.AGENT.NODATA}` | Agent no-data window | `5m` |
| `{$BASELINE.URL}` | Optional URL attached to triggers (leave empty for none) | *(empty)* |

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
| FS {#FSNAME}: space usage is high | Warning |
| CPU load is too high (avg 5m) | Average |
| Available memory is low | Average |
| Zabbix agent is not responding | High |

## Tags

`class=security`, `source=linux-security-baseline`, `component={storage,cpu,memory,agent}`

## Author

saranf <https://github.com/saranf>
