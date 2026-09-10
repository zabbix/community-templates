# Duo Authentication Proxy Monitoring Template for Zabbix 7.4

[![Zabbix Version](https://img.shields.io/badge/Zabbix-7.4-red.svg)](https://www.zabbix.com/)
[![Agent](https://img.shields.io/badge/Zabbix%20agent%202-systemd-blue.svg)](https://www.zabbix.com/documentation/7.4/en/manual/config/items/itemtypes/zabbix_agent)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

**Author:** `://echo@dla.network [oZark oRChes✝ra✝'d]` | [![GitHub](https://img.shields.io/badge/GitHub-DLA--neTWorK-blue?logo=github)](https://github.com/DLA-neTWorK)

**Version:** 1.0.0

## Overview

Monitoring template for **Cisco Duo Authentication Proxy** on Linux, built for Zabbix 7.4 using **native Zabbix agent 2 keys only**. It covers systemd service state, service resource consumption, the Duo process itself, configuration-file integrity metadata, and locally listening RADIUS ports.

The template is deliberately **credential-free**. It does not read Duo configuration contents, authentication logs, RADIUS secrets, Duo cloud credentials, or Duo cloud data. No custom UserParameter, sudo rule, log permission, external script, or additional package is required.

Validated on Zabbix server and agent 2 **7.4.13**, with a systemd unit named `duoauthproxy.service`, the standard `/opt/duoauthproxy` installation path, and the Duo process running as `duo_authproxy_svc`.

### Key Features

- ✅ **Native systemd collection** - Two raw `systemd.unit.get` master items feed every service metric
- ✅ **Service state coverage** - Active state, substate, boot-enabled state, uptime, restart counter, and main PID
- ✅ **Resource trends** - Service cgroup CPU utilization, memory usage, and task count
- ✅ **Independent process checks** - Process count and RSS memory matched by executable, service account, and command line
- ✅ **Configuration integrity without exposure** - Existence and modification-time metadata only; file contents are never read
- ✅ **Macro-driven RADIUS listener LLD** - One item and trigger per UDP port, with strict port validation
- ✅ **Noise-controlled alerting** - Three-check confirmation for availability, ten-minute persistence for resource warnings
- ✅ **Dependency suppression** - Process, resource, restart, and listener alerts are suppressed while the parent service is down

---

## Monitoring Capabilities

### Raw master items

| Item | Key | History |
|------|-----|---------|
| Get systemd unit state | `systemd.unit.get[{$DUO.SERVICE.NAME},Unit]` | `0` |
| Get systemd service metrics | `systemd.unit.get[{$DUO.SERVICE.NAME},Service]` | `0` |

Both master items intentionally use `history=0`. Their JSON is processed into dependent metrics but is not stored, matching the official Zabbix systemd template pattern. Seeing no history on these two items is expected, not a fault.

### Service metrics (dependent on the `Unit` master)

| Metric | Item key | Notes |
|--------|----------|-------|
| Service active state | `duo.service.active` | Numeric systemd state, displayed via the `Unit Active State` value map |
| Service substate | `duo.service.substate` | Text, normally `running` |
| Service enabled state | `duo.service.enabled` | Numeric, displayed via the `Unit File State` value map |
| Service uptime | `duo.service.uptime` | Seconds since the unit last entered the active state |

### Service resources (dependent on the `Service` master)

| Metric | Item key | Units |
|--------|----------|-------|
| Service CPU utilization | `duo.service.cpu.util` | `%` |
| Service memory usage | `duo.service.memory` | `B` |
| Service tasks | `duo.service.tasks` | count |
| Service restart count | `duo.service.restarts` | count |
| Service main PID | `duo.service.main_pid` | PID |

### Process, configuration, and application checks

| Metric | Item key |
|--------|----------|
| Process count | `proc.num[{$DUO.PROCESS.NAME},{$DUO.PROCESS.USER},,{$DUO.PROCESS.CMDLINE}]` |
| Process RSS memory | `proc.mem[{$DUO.PROCESS.NAME},{$DUO.PROCESS.USER},,{$DUO.PROCESS.CMDLINE},rss]` |
| Configuration file exists | `vfs.file.exists[{$DUO.CONFIG.PATH}]` |
| Configuration modification time | `vfs.file.time[{$DUO.CONFIG.PATH},modify]` |
| Control executable exists | `vfs.file.exists[{$DUO.BINARY.PATH}]` |

### RADIUS listener discovery

| Rule | Key | Interval |
|------|-----|----------|
| Duo: RADIUS listener discovery | `duo.radius.listener.discovery` | 1h |

A script-type LLD rule converts the comma-separated `{$DUO.RADIUS.PORTS}` macro into one item and one trigger per UDP listener. The script validates each port is an integer in the range 1-65535, removes duplicates, and rejects an empty list.

| Item prototype | Key | Interval |
|----------------|-----|----------|
| Duo: UDP `{#DUO.PORT}` listener status | `net.udp.listen[{#DUO.PORT}]` | 1m |

---

## Trigger Summary

**13 triggers total**, all enabled by default.

| Severity | Trigger | Persistence | Parent dependency |
|----------|---------|-------------|-------------------|
| **HIGH** | Service is not active | 3 checks | Root cause |
| **HIGH** | Service has no main process | 3 checks | Service not active |
| **HIGH** | Process is not running | 3 checks | Service not active |
| **HIGH** | UDP `{#DUO.PORT}` listener is not available | 3 checks | Service not active |
| **HIGH** | Configuration file is missing | 3 checks | None |
| **HIGH** | Executable is missing | 3 checks | None |
| **WARNING** | Service is not enabled at boot | Current state | None |
| **WARNING** | Service was automatically restarted | Counter increase | Service not active |
| **WARNING** | Memory usage is high | 10 minutes | Service not active |
| **WARNING** | CPU utilization is high | 10 minutes | Service not active |
| **WARNING** | Task count is high | 10 minutes | Service not active |
| **INFO** | Service has been restarted | Uptime below 10 minutes | Service not active |
| **INFO** | Configuration was modified | On change | None |

Restart and configuration-change events allow **manual close**. Every trigger description states the condition, its operational meaning, and initial investigation guidance. The configuration-change trigger reports only that the modification timestamp changed — it never exposes configuration contents.

---

## Installation Guide

### Prerequisites

- ✅ Zabbix server and frontend **7.4** or later
- ✅ **Zabbix agent 2** installed on the monitored Linux host (the classic agent does not provide `systemd.unit.get`)
- ✅ A systemd-managed Duo Authentication Proxy installation
- ✅ Agent 2 permitted to query systemd over D-Bus and to stat the configured executable and configuration paths

### Step 1: Import the template

1. Download `template_duo_authentication_proxy_by_zabbix_agent2.yaml`
2. Zabbix web interface -> **Data collection** -> **Templates** -> **Import**
3. Select the YAML file and complete import
4. Verify template name: **Duo Authentication Proxy by Zabbix agent 2** in group **Templates/Applications**

### Step 2: Link to the host

Link `Duo Authentication Proxy by Zabbix agent 2` to the Linux host running the Duo proxy. The host needs a Zabbix agent interface.

### Step 3: Set the listener ports

Set `{$DUO.RADIUS.PORTS}` to the comma-separated UDP ports owned by that Duo instance, for example `18120,18121`.

> The default `18121` is a **tested deployment value, not a universal Duo default**. Set this macro to the listener ports actually configured on each target host.

### Step 4: Override paths only if needed

Override the service, process, user, and path macros only when the local installation differs from the defaults.

### Step 5: Validate

1. Confirm both raw systemd master items are **supported** (they will show no stored history — this is by design)
2. Confirm the dependent service, resource, and process metrics populate
3. Confirm the expected UDP listeners are discovered
4. Review thresholds before enabling notifications

---

## Zabbix Configuration

### Macros

| Macro | Default | Purpose |
|-------|---------|---------|
| `{$DUO.SERVICE.NAME}` | `duoauthproxy.service` | systemd unit name |
| `{$DUO.RADIUS.PORTS}` | `18121` | Comma-separated UDP listener ports |
| `{$DUO.PROCESS.NAME}` | `python3` | Process executable name |
| `{$DUO.PROCESS.USER}` | `duo_authproxy_svc` | Operating-system service account |
| `{$DUO.PROCESS.CMDLINE}` | `duoauthproxy` | Process command-line regular expression |
| `{$DUO.CONFIG.PATH}` | `/opt/duoauthproxy/conf/authproxy.cfg` | Configuration path; **metadata only** |
| `{$DUO.BINARY.PATH}` | `/opt/duoauthproxy/bin/authproxyctl` | Control executable path |
| `{$DUO.CPU.UTIL.MAX.WARN}` | `80` | Sustained CPU warning, percent |
| `{$DUO.MEMORY.MAX.WARN}` | `512M` | Sustained service memory warning |
| `{$DUO.TASKS.MAX.WARN}` | `50` | Sustained service task warning |

### Value maps

`Unit Active State` and `Unit File State`, using the same numeric state codes as the official Zabbix systemd template.

### Template links

**None.** The export is self-contained and uses only native Zabbix agent 2 keys.

### Object counts

| Object type | Count |
|-------------|-------|
| Items | 16 |
| Discovery rules | 1 |
| Item prototypes | 1 |
| Triggers and trigger prototypes | 13 |
| Value maps | 2 |
| Macros | 10 |

---

## Troubleshooting

### Raw systemd master items appear empty

**This is expected.** The two `systemd.unit.get` items use `history=0` and exist only to feed dependent metrics. Check the dependent service values and the master item's supported/error state instead.

### Systemd items are unsupported

1. Confirm **Zabbix agent 2** is installed, not the classic agent
2. Confirm `{$DUO.SERVICE.NAME}` matches the local systemd unit name
3. Test directly: `zabbix_get -s <host> -k 'systemd.unit.get[duoauthproxy.service,Unit]'`
4. Check D-Bus access and the agent 2 log

### Process item reports zero

Check `{$DUO.PROCESS.NAME}`, `{$DUO.PROCESS.USER}`, and `{$DUO.PROCESS.CMDLINE}` against the actually running process:

```bash
ps -eo user,comm,args | grep -i duoauthproxy
```

Note the default process name is `python3`, because the Duo proxy runs under a bundled Python interpreter.

### Listener item reports zero

Confirm the port is configured in Duo, present in `{$DUO.RADIUS.PORTS}`, and locally bound:

```bash
ss -lnu | grep 18121
```

Local listener state does **not** prove network firewall access from RADIUS clients.

### Service uptime shows no value

The uptime item deliberately produces no value while the unit is inactive. An empty uptime alongside an inactive service is correct behaviour, not a collection failure.

---

## Known Limitations

- `net.udp.listen[]` confirms a local UDP socket is bound. It does **not** perform a credentialed RADIUS authentication transaction.
- Synthetic RADIUS testing would require extra software and a protected test secret, and is outside the scope of this credential-free template.
- Authentication logs are intentionally excluded because they may contain usernames, source addresses, and other sensitive operational data.
- The installed Duo version is not collected, because the vendor control command may require elevated execution on some installations.

---

## Version History

### v1.0.0 - Initial release

- ✅ Initial Zabbix 7.4 community release
- ✅ systemd, process, resource, configuration, and listener monitoring via native agent 2 keys
- ✅ Macro-driven RADIUS listener LLD with strict port validation
- ✅ Dependency-based suppression and operational trigger descriptions
- ✅ Value maps aligned with the official Zabbix systemd template
- ✅ Validated on Zabbix server and agent 2 version 7.4.13

---

## Support & Resources

### Template Maintainer

**Author:** `://echo@dla.network [oZark oRChes✝ra✝'d]` | [![GitHub](https://img.shields.io/badge/GitHub-DLA--neTWorK-blue?logo=github)](https://github.com/DLA-neTWorK)

When reporting an issue, include the Zabbix version, operating system, Duo version, macro overrides, and sanitized item errors.

> **Never attach `authproxy.cfg`, RADIUS secrets, Duo integration keys, or authentication logs.**

### Cisco Duo Resources

- [Duo Authentication Proxy reference](https://duo.com/docs/authproxy-reference)

### Zabbix Resources

- [Zabbix 7.4 Documentation](https://www.zabbix.com/documentation/7.4/)
- [Zabbix agent 2 item reference](https://www.zabbix.com/documentation/7.4/en/manual/config/items/itemtypes/zabbix_agent)
- [Low-level discovery](https://www.zabbix.com/documentation/7.4/en/manual/discovery/low_level_discovery)
- [Zabbix template guidelines](https://www.zabbix.com/documentation/guidelines/en/template_guidelines)

---

## Quick Reference

| Property | Value |
|----------|-------|
| **Template Name** | Duo Authentication Proxy by Zabbix agent 2 |
| **Template Group** | Templates/Applications |
| **Zabbix Version** | 7.4+ |
| **Monitoring Type** | Zabbix agent 2 (systemd, proc, vfs, net) |
| **Credentials required** | None |
| **Template linkage** | None - standalone |

---

## License & Attribution

**License:** MIT

**Attribution:** Please retain author attribution when sharing or modifying.

This template contains no Cisco Duo software, configuration, credentials, logs, or other third-party source code.
