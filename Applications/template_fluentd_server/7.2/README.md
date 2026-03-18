# Fluentd Server by HTTP

## Overview

This template monitors a [Fluentd](https://www.fluentd.org/) log aggregation server via its built-in `monitor_agent` HTTP endpoint. It collects plugin metrics (buffer health, retry counts, emit rates) for all input and output plugins through a single master HTTP item and extracts individual values using JSONPath preprocessing.

Designed for Fluentd servers deployed as Docker containers in an HA pair (e.g. with Keepalived VIP), but works with any Fluentd instance that has `monitor_agent` enabled on port 9880.

### Requirements

Enable `monitor_agent` in your Fluentd config with plugin IDs set:

```
<source>
  @type monitor_agent
  @id monitor_agent_input
  bind 0.0.0.0
  port 9880
</source>
```

Assign `@id` to each input/output plugin you want to track — the template uses plugin IDs to extract per-plugin metrics.

### Monitored items

**Service availability**
- ICMP ping
- Monitor agent port (9880) reachability
- Forward port (24224) reachability
- Monitor agent data (no-data detection)

**Output plugin metrics** (per plugin: `output_client_logs`, `output_firewall_syslog`, `output_chassis_syslog`, `output_network_syslog`, `output_ise_syslog`, `output_storware_syslog`, `output_file`, `output_modsecurity_events`)
- Retry count
- Buffer queue length
- Buffer available space (%)
- Emit records (cumulative)

**Input plugin emit records** (per plugin: `input_forward`, `input_syslog_tcp`, `input_syslog_udp`, `input_network_syslog`, `input_ise_syslog`, `input_storware_syslog`)

### Triggers

| Trigger | Severity |
|---------|----------|
| Host is unreachable | Disaster |
| Monitor agent port 9880 is down | High |
| Monitor agent not responding (no data 3m) | High |
| Forward port 24224 is down | High |
| Output [Client Logs / Firewall Syslog]: buffer space below 20% | High |
| Output [other plugins]: buffer space below 20% | Average |
| Any output plugin: retry count > 0 | Average |

Port and no-data triggers have dependency chains (won't fire if host is already down).

### Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$FLUENTD_HTTP_PORT}` | `9880` | monitor_agent HTTP port |
| `{$FLUENTD_FWD_PORT}` | `24224` | Fluentd forward protocol port |

### Customisation

- To add more output/input plugins: duplicate a dependent item and update the JSONPath plugin ID filter
- To adjust buffer space thresholds: modify the trigger expressions
- Plugin IDs in JSONPath filters must match the `@id` values in your Fluentd config
