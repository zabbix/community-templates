# Flowtriq Agent by HTTP (Zabbix 7.0)

Monitors a [Flowtriq](https://flowtriq.com) DDoS detection agent via its Prometheus-compatible metrics endpoint.

## Overview

Flowtriq is a DDoS detection and mitigation platform. The Flowtriq agent (`ftagent`) analyzes sFlow/NetFlow traffic data and exposes a `/metrics` endpoint in Prometheus exposition format on port 9145 by default.

This template uses the Zabbix HTTP agent to scrape that endpoint and extract metrics with Prometheus preprocessing. No Zabbix agent installation is needed on the monitored host.

## What you get

### Items

| Item | Key | Type | Description |
|------|-----|------|-------------|
| Get metrics | `flowtriq.metrics.get` | HTTP agent (master) | Raw scrape of the Prometheus endpoint |
| Traffic PPS | `flowtriq.traffic.pps` | Dependent | Packets per second across all interfaces |
| Traffic BPS | `flowtriq.traffic.bps` | Dependent | Bits per second across all interfaces |
| Active flows | `flowtriq.traffic.flows` | Dependent | Number of flows currently tracked |
| Active attacks | `flowtriq.active_attacks` | Dependent | Number of attacks in progress |
| Total incidents | `flowtriq.incidents.total` | Dependent | Incident detection rate (per second) |
| Mitigated incidents | `flowtriq.incidents.mitigated` | Dependent | Mitigation trigger rate (per second) |
| Agent uptime | `flowtriq.agent.uptime` | Dependent | Seconds since agent process start |
| Flow sources | `flowtriq.agent.flow_sources` | Dependent | Active sFlow/NetFlow collector count |
| Last API report | `flowtriq.agent.last_report` | Dependent | Timestamp of last successful API report |

### Triggers

| Trigger | Severity | Description |
|---------|----------|-------------|
| Metrics endpoint not responding | High | No data received within `{$FLOWTRIQ.NODATA.TIMEOUT}` |
| Active DDoS attack detected | Warning | One or more attacks currently in progress |
| Sustained DDoS attack (5+ minutes) | High | Attack ongoing for at least 5 minutes continuously |
| Agent recently restarted | Info | Agent uptime is less than 10 minutes |
| No active flow sources | High | Agent is not receiving any flow data |
| Agent not reporting to API | Average | Agent has not reported to the Flowtriq API within expected interval |

### Dashboard

The template includes a **Flowtriq Agent** dashboard with four panels:

- **Traffic rates** - PPS and BPS over time
- **Attack activity** - Active attack count over time
- **Incident rate** - New incidents and mitigations per second
- **Agent health** - Uptime and flow source count

## Prerequisites

1. A running Flowtriq agent (v1.9+) with the metrics endpoint enabled (enabled by default).
2. Zabbix 7.0 or newer with HTTP agent support.
3. Network connectivity from the Zabbix server or proxy to the agent on port 9145 (TCP).

Verify the endpoint is reachable:

```
curl http://<agent-host>:9145/metrics
```

You should see Prometheus exposition format output with lines like `flowtriq_traffic_pps`, `flowtriq_active_attacks`, etc.

## Setup

1. Import `template_flowtriq_agent_http.yaml` into Zabbix via **Data collection > Templates > Import**.
2. Create a host for each Flowtriq agent node.
3. Link the **Flowtriq Agent by HTTP** template to the host.
4. Set the following macro on the host (host-level override):
   - `{$FLOWTRIQ.AGENT.HOST}` = hostname or IP of the Flowtriq agent

   Other macros have sensible defaults but can be overridden:
   - `{$FLOWTRIQ.AGENT.PORT}` = `9145`
   - `{$FLOWTRIQ.AGENT.SCHEME}` = `http`
   - `{$FLOWTRIQ.METRICS.PATH}` = `/metrics`
   - `{$FLOWTRIQ.SCRAPE.INTERVAL}` = `30s`
   - `{$FLOWTRIQ.NODATA.TIMEOUT}` = `10m`
   - `{$FLOWTRIQ.API.LAG.WARN}` = `600` (seconds)

5. Wait for the first scrape interval or click **Execute now** on the master item.
6. Check **Monitoring > Latest data** for items with key prefix `flowtriq.`.

## Agent configuration

The Flowtriq agent metrics endpoint is enabled by default. If it has been disabled, add these lines to the agent configuration file (`/etc/flowtriq/agent.yml`):

```yaml
metrics_enabled: true
metrics_port: 9145
metrics_path: /metrics
```

Restart the agent after changing the configuration.

## Macros reference

| Macro | Default | Description |
|-------|---------|-------------|
| `{$FLOWTRIQ.AGENT.HOST}` | *(required)* | Agent hostname or IP |
| `{$FLOWTRIQ.AGENT.PORT}` | `9145` | Agent metrics port |
| `{$FLOWTRIQ.AGENT.SCHEME}` | `http` | URL scheme (`http` or `https`) |
| `{$FLOWTRIQ.METRICS.PATH}` | `/metrics` | Path to the metrics endpoint |
| `{$FLOWTRIQ.SCRAPE.INTERVAL}` | `30s` | Polling interval |
| `{$FLOWTRIQ.NODATA.TIMEOUT}` | `10m` | No-data trigger threshold |
| `{$FLOWTRIQ.API.LAG.WARN}` | `600` | API reporting lag warning (seconds) |

## Feedback

Report issues or suggest improvements via the [community-templates](https://github.com/zabbix/community-templates) repository.
