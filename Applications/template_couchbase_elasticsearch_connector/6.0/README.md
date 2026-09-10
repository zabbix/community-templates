# Couchbase Elasticsearch Connector by HTTP for Zabbix 6.0

## Overview

This directory contains the Zabbix 6.0 LTS export of **Couchbase Elasticsearch Connector by HTTP**. It monitors multiple Couchbase Elasticsearch Connector instances through native Dropwizard JSON metrics, using one HTTP request per connector per polling interval and dependent items for all derived data.

Tested with Zabbix 6.0.48 and Couchbase Elasticsearch Connector 4.4.8. This development candidate was imported, re-exported, and runtime-validated on a fresh Zabbix installation using a controlled HTTP fixture server, then smoke-tested read-only against two live CBES 4.4.8 endpoints.

## Requirements

- Zabbix Server or Proxy 6.0.x can reach each connector metrics endpoint.
- The monitored host has a usable `{HOST.CONN}` interface address.
- Each connector exposes Dropwizard JSON at `/metrics` or the configured path.
- No agent, container integration, or external script is required.

## Installation

Import [`template_couchbase_elasticsearch_connector.yaml`](template_couchbase_elasticsearch_connector.yaml), link **Couchbase Elasticsearch Connector by HTTP** to a host, and configure `{$CBES.INSTANCES}`.

The default discovers `default:31415`. Multiple connectors use a strict comma-separated list:

```text
{$CBES.INSTANCES}=esr:31415,esr-dal-log:31416
```

Names may contain letters, digits, dots, underscores, and hyphens, but not spaces. Names and ports must be unique. Invalid or ambiguous input makes discovery unsupported.

## Important macros

| Macro | Default | Purpose |
|---|---:|---|
| `{$CBES.INSTANCES}` | `default:31415` | Connector `name:port` entries |
| `{$CBES.SCHEME}` | `http` | Endpoint scheme |
| `{$CBES.METRICS.PATH}` | `/metrics` | Metrics path |
| `{$CBES.INTERVAL}` | `1m` | Per-connector poll interval |
| `{$CBES.HTTP.TIMEOUT}` | `10s` | HTTP timeout |
| `{$CBES.NODATA}` | `5m` | Missing-status fallback |
| `{$CBES.HISTORY.PERF}` | `7d` | Performance history |
| `{$CBES.HISTORY.COUNTER}` | `1d` | Counter-delta history |
| `{$CBES.HISTORY.STATUS}` | `1d` | Status history |
| `{$CBES.TRENDS.PERF}` | `90d` | Performance trends |
| `{$CBES.HEARTBEAT}` | `1h` | Stable-value heartbeat |

These workload thresholds all default to `0`, meaning disabled:

```text
{$CBES.BULK_RETRY.WARN}
{$CBES.DOC_RETRY.WARN}
{$CBES.BACKLOG.WARN}
{$CBES.BACKLOG.GROWTH}
{$CBES.ESWAIT.WARN}
{$CBES.LATENCY.WARN}
```

They support instance-name contexts, for example:

```text
{$CBES.BACKLOG.WARN:"esr-dal-log"}=5000000
```

## Monitoring scope

The template stores collection status, backlog, Elasticsearch request wait, write queue, retry/failure deltas, throughput, p95/p99 latency, and aggregate DCP status. Raw JSON, raw cumulative counters, and the intermediate DCP summary are not stored.

Enabled-by-default triggers cover endpoint failure, explicit DCP disconnection, rejected documents, Elasticsearch connection failure, rejection-log failure, and connector-state save failure. Retry, backlog, Elasticsearch-wait, and latency triggers remain inert until their macros are set above zero.

The four error-counter triggers are event-style: they recover on the next zero delta and remain available in event history.

## Graphs and dashboard

The template includes only:

- `ESR [{#ESR.NAME}]: Backlog and write queue`
- `ESR [{#ESR.NAME}]: Latency and Elasticsearch wait`
- `Couchbase Elasticsearch Connector overview`, containing the two graph-prototype widgets.

## Retention

Raw master and intermediate items use `history=0`. Performance history defaults to 7 days, counter/status history to 1 day, and selected performance trends to 90 days. Unchanged DCP and event-status values use a one-hour heartbeat; performance and retry-window items are not throttled because that would alter trigger calculations.

## DCP compatibility

The `dcp.connectionStatus{remote=...}` gauges are present in the tested 4.4.8 stack but are not a documented public CBES monitoring contract. An explicit numeric value other than `1` is Unhealthy. Missing or invalid DCP metrics are Unknown and do not alarm.

## Troubleshooting and limitations

- Discovery errors: validate the strict `name:port` list; trailing commas and duplicate ports are invalid.
- Collection unavailable: verify HTTP 200, JSON response, routing from the selected Server/Proxy, and the complete required v1 metric schema.
- DCP Unknown: inspect the raw metrics endpoint and connector/DCP-client compatibility.
- No performance alarms: configure positive workload thresholds; zero intentionally disables them.
- Growing backlog uses two 15-minute windows. On a newly discovered connector, Zabbix initially reports `not enough data` for the shifted window and does not create a problem; evaluation can begin against a partial previous window after about 15 minutes. Consider the full first 30 minutes a warm-up period.

## Validation status

**RUNTIME-VALIDATED ON ZABBIX 6.0.48.** Validation covered native import/re-export, discovery, Duktape preprocessing, reset-safe deltas and throughput, trigger lifecycle and dependency behavior, instance macro contexts, graphs, dashboard rendering, and retention. A read-only smoke test against two live CBES 4.4.8 endpoints additionally confirmed payload compatibility, dependent metric collection, aggregate DCP health, and default trigger behavior. Zabbix Proxy execution has not been tested.

## Author and project

Author: [hozgryldz](https://github.com/hozgryldz)

Standalone project: [zabbix-template-couchbase-elasticsearch-connector](https://github.com/hozgryldz/zabbix-template-couchbase-elasticsearch-connector)

## License

MIT, under the license of the Zabbix Community Templates repository.
