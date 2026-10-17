# Speedtest Multiplatform (Ookla CLI)

## Overview

A robust, enterprise-ready internet bandwidth and connection quality monitoring template for **Zabbix 7.0**, powered by the official [Ookla Speedtest CLI](https://www.speedtest.net/apps/cli).

### Key Features
- **True Multiplatform**: Native support for **Windows** (PowerShell 7 / 5.1 & Batch) and **Linux** (POSIX Shell & Python).
- **Zero Heavy Dependencies on Windows**: Includes a native C#/.NET raw TCP socket implementation (`speedtest.ps1`), eliminating the need to install `zabbix_sender` or Python on Windows endpoints. Includes completely silent scheduled task execution via `run_hidden.vbs`.
- **Advanced Quality Metrics**: Tracks not only Download / Upload bandwidth, but also **Idle Latency**, **Jitter**, **Packet Loss**, **Bufferbloat / Latency under Load (IQM)**, **ISP Name**, **External IP**, and **Server Location**.
- **High Efficiency**: Employs a single master trapper item (`speedtest.json`) with JSONPath dependent preprocessing and `DISCARD_VALUE` error handling on all dependent items, parsing 17 metrics from a single network push without entering unsupported states on transient parse errors.
- **Flap-Resistant Alerting**: Threshold triggers evaluate multiple consecutive runs (`{$SPEEDTEST.EVAL.COUNT}`) using `avg` (bandwidth) and `min` (latency/loss) to prevent false positives from transient network noise.
- **Out-of-the-Box Dashboard**: Includes a pre-configured template dashboard (`Speedtest Dashboard`) with bandwidth charts, latency/jitter trends, and status widgets.
- **AI-Setup-Ready**: Includes [`AGENTS.md`](files/AGENTS.md) protocol allowing AI coding assistants (Copilot, Claude Code, Cursor, Antigravity) to inspect your environment, verify CLI paths, and complete installation autonomously with zero configuration.

### Upstream & Author
- **Author**: [@qryuu](https://github.com/qryuu)
- **Upstream Repository**: [qryuu/speedtest-to-zabbix](https://github.com/qryuu/speedtest-to-zabbix) (Full bilingual documentation, updates, and issue tracker)

---

## Macros used

| Name | Description | Default | Type |
| :--- | :--- | :--- | :--- |
| `{$SPEEDTEST.NODATA.WARN}` | Duration without incoming data before firing alert | `3h` | Text macro |
| `{$SPEEDTEST.EVAL.COUNT}` | Number of consecutive test evaluations required for threshold alert | `3` | Text macro |
| `{$SPEEDTEST.WARN.DOWN}` | Low download speed threshold in bps (set to `0` to disable) | `50M` | Text macro |
| `{$SPEEDTEST.WARN.UP}` | Low upload speed threshold in bps (set to `0` to disable) | `20M` | Text macro |
| `{$SPEEDTEST.WARN.PING}` | High idle ping latency threshold in ms (set to `0` to disable) | `50` | Text macro |
| `{$SPEEDTEST.WARN.LOSS}` | Packet loss threshold in percent (set to `0` to disable) | `2` | Text macro |

> [!NOTE]
> **Migration note for upgrading users**: The nodata macro was renamed from `{$SPEEDTEST.NODATA}` to `{$SPEEDTEST.NODATA.WARN}` for naming consistency across warning macros. If you customized this macro at the host level, please migrate your setting to `{$SPEEDTEST.NODATA.WARN}`.

---

## Template links

There are no template links in this template.

---

## Discovery rules

There are no discovery rules in this template.

---

## Items collected

| Name | Description | Type | Key and additional info |
| :--- | :--- | :--- | :--- |
| Speedtest: Raw data (JSON) | Master item receiving raw Ookla Speedtest CLI JSON output | `Zabbix trapper` | `speedtest.json` |
| Speedtest: ISP Name | ISP provider name detected by Speedtest | `Dependent item` | `speedtest.isp` |
| Speedtest: External IP Address | Public WAN IP address of the monitoring client | `Dependent item` | `speedtest.interface.externalip` |
| Speedtest: Server Location | Geographic location of the target test server | `Dependent item` | `speedtest.server.location` |
| Speedtest: Timestamp | ISO 8601 timestamp recorded by Speedtest CLI | `Dependent item` | `speedtest.timestamp` |
| Speedtest: Download Bandwidth | Download bandwidth calculated in bits per second | `Dependent item` | `speedtest.download.bps`<br>Units: `bps` |
| Speedtest: Upload Bandwidth | Upload bandwidth calculated in bits per second | `Dependent item` | `speedtest.upload.bps`<br>Units: `bps` |
| Speedtest: Ping Latency (Idle) | Idle ping round-trip time | `Dependent item` | `speedtest.ping.latency`<br>Units: `ms` |
| Speedtest: Ping Jitter | Latency jitter variation | `Dependent item` | `speedtest.ping.jitter`<br>Units: `ms` |
| Speedtest: Download Latency (Bufferbloat IQM) | Latency measured during download stress test | `Dependent item` | `speedtest.download.latency`<br>Units: `ms` |
| Speedtest: Upload Latency (Bufferbloat IQM) | Latency measured during upload stress test | `Dependent item` | `speedtest.upload.latency`<br>Units: `ms` |
| Speedtest: Packet Loss | Packet loss percentage during test | `Dependent item` | `speedtest.packetloss`<br>Units: `%` |
| Speedtest: Download Data Consumed | Bytes transferred during download test | `Dependent item` | `speedtest.download.bytes`<br>Units: `B` |
| Speedtest: Upload Data Consumed | Bytes transferred during upload test | `Dependent item` | `speedtest.upload.bytes`<br>Units: `B` |
| Speedtest: Server Name | Name of the selected Speedtest server | `Dependent item` | `speedtest.server.name` |
| Speedtest: Server ID | ID of the selected Speedtest server | `Dependent item` | `speedtest.server.id` |
| Speedtest: Result URL | Web URL for sharing the test result | `Dependent item` | `speedtest.result.url` |

---

## Triggers

| Name | Description | Severity | Operational expression |
| :--- | :--- | :--- | :--- |
| Speedtest: No data received for {$SPEEDTEST.NODATA.WARN} | Fires if scheduled execution halts or network fails | `Warning` | `nodata(/template_speedtest_multiplatform/speedtest.json,{$SPEEDTEST.NODATA.WARN})=1` |
| Speedtest: Download speed is low ({ITEM.LASTVALUE} < {$SPEEDTEST.WARN.DOWN}) | Average download bandwidth across consecutive tests dropped below threshold | `Warning` | `avg(/template_speedtest_multiplatform/speedtest.download.bps,#{$SPEEDTEST.EVAL.COUNT})<{$SPEEDTEST.WARN.DOWN} and {$SPEEDTEST.WARN.DOWN}>0` |
| Speedtest: Upload speed is low ({ITEM.LASTVALUE} < {$SPEEDTEST.WARN.UP}) | Average upload bandwidth across consecutive tests dropped below threshold | `Warning` | `avg(/template_speedtest_multiplatform/speedtest.upload.bps,#{$SPEEDTEST.EVAL.COUNT})<{$SPEEDTEST.WARN.UP} and {$SPEEDTEST.WARN.UP}>0` |
| Speedtest: Ping latency is high ({ITEM.LASTVALUE} > {$SPEEDTEST.WARN.PING}ms) | Minimum idle latency across consecutive tests exceeded threshold | `Warning` | `min(/template_speedtest_multiplatform/speedtest.ping.latency,#{$SPEEDTEST.EVAL.COUNT})>{$SPEEDTEST.WARN.PING} and {$SPEEDTEST.WARN.PING}>0` |
| Speedtest: Packet loss detected ({ITEM.LASTVALUE} > {$SPEEDTEST.WARN.LOSS}%) | Minimum packet loss across consecutive tests detected | `Warning` | `min(/template_speedtest_multiplatform/speedtest.packetloss,#{$SPEEDTEST.EVAL.COUNT})>{$SPEEDTEST.WARN.LOSS} and {$SPEEDTEST.WARN.LOSS}>0` |

---

## Dashboards

This template includes a built-in dashboard:
- **Speedtest Dashboard**: Displays Download/Upload bandwidth graphs, Idle/Loaded latency & jitter graphs, Packet Loss gauge, and metadata widgets (ISP, WAN IP, Server Location, Result URL).

---

## Installation & Setup

### 1. Prerequisites
Install the official [Ookla Speedtest CLI](https://www.speedtest.net/apps/cli) on target hosts:
- **Windows**: `winget install Ookla.Speedtest.CLI` or download from official site.
- **Linux**: Install via package manager (`apt install speedtest` or `dnf install speedtest`) following Ookla instructions.

### 2. Import Template into Zabbix
Import `template_speedtest_multiplatform.yaml` via Zabbix Web UI (**Data collection -> Templates -> Import**) or use the automated API scripts in `files/`:

```powershell
# Automated import via PowerShell
.\files\import_template.ps1 -ZabbixUrl "http://zabbix-server/zabbix" -ApiToken "<YOUR_TOKEN>" -LinkToHost "<HOST_NAME>"
```

### 3. Client Execution

#### Windows (Native PowerShell - Zero extra software)
```powershell
# Dry run verification (displays JSON output without sending)
.\files\speedtest.ps1 -DryRun

# Test push to Zabbix Server
.\files\speedtest.ps1 -ZabbixServer "192.168.1.10" -Hostname "<HOST_NAME>"

# Automated 1-step setup wizard (Registers hourly Task Scheduler with silent wrapper)
.\files\setup.ps1 -ZabbixServer "192.168.1.10" -Hostname "<HOST_NAME>" -Schedule Hourly
```

#### Linux (Shell script - No pip required)
```bash
chmod +x files/*.sh

# Dry run verification
./files/speedtest_zabbix.sh -d

# Test push to Zabbix Server
./files/speedtest_zabbix.sh -z 192.168.1.10 -s "<HOST_NAME>"

# Automated 1-step setup wizard (Registers hourly cron)
./files/setup.sh -z 192.168.1.10 -s "<HOST_NAME>" -c hourly
```
