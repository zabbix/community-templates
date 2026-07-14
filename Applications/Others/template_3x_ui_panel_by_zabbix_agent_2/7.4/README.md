# 3X-UI Panel by Zabbix agent 2

## Overview

This template monitors Linux servers running **3X-UI Panel** and **Xray-core**.

It combines:

- Zabbix agent 2 checks for local services, processes, sockets, files and the SQLite database;
- HTTP agent requests to the 3X-UI Panel API;
- dependent items with JSONPath and JavaScript preprocessing;
- low-level discovery for inbounds, clients, nodes, ports and Xray outbounds;
- triggers, classic graphs, graph prototypes and a host dashboard.

No external scripts are required.

## Template information

| Field | Value |
|---|---|
| Author | [TyranR](https://github.com/TyranR) |
| Zabbix version | 7.4 |
| Template file | `template_3x_ui_panel_by_zabbix_agent_2.yaml` |
| Template name | `3X-UI Panel by Zabbix agent 2` |
| Tested application | 3X-UI Panel with Xray-core |
| Collection methods | Zabbix agent 2 and HTTP agent |
| License | MIT |

## Requirements

- Zabbix Server or Proxy 7.4;
- Zabbix agent 2 installed on the monitored Linux host;
- active agent checks configured for the host;
- a 3X-UI Panel API token;
- network access from the Zabbix Server or Proxy to the configured 3X-UI API URL.

## Installation

1. Import `template_3x_ui_panel_by_zabbix_agent_2.yaml`.
2. Link the template to the Linux host running 3X-UI.
3. Configure the required host macros.
4. Confirm that active Zabbix agent 2 checks are working.
5. Verify API availability and check for unsupported items.

## Required macros

| Macro | Example | Description |
|---|---|---|
| `{$3XUI.API.URL}` | `https://vpn.example.com:2053/secret-path/panel/api` | Base API URL reachable from the Zabbix Server or Proxy. Do not append an endpoint such as `/server/status`. |
| `{$3XUI.API.TOKEN}` | `secret` | 3X-UI API bearer token. Store it as a Secret text macro. |
| `{$3XUI.PROCESS.XRAY}` | `xray-linux-amd64` | Command-line substring used to detect the Xray process. |
| `{$3XUI.DB.PATH}` | `/etc/x-ui/x-ui.db` | Path to the local 3X-UI SQLite database. |

The template contains additional macros for thresholds and optional checks. Review the template macro list after import before enabling optional features.

## Monitored components

### Panel and Xray

- `x-ui.service` state;
- panel and Xray process counts;
- API availability and response status;
- panel and Xray versions;
- Xray state and diagnostic result text;
- local panel and inbound sockets.

### System and application metrics

- CPU, memory and disk utilization;
- load averages;
- disk read and write rates;
- network upload and download rates;
- TCP and UDP connection counts;
- application memory, threads and uptime.

### Inbounds and clients

- aggregate inbound and client counters;
- inbound discovery with protocol, port, status, traffic, quota and expiry data;
- optional client discovery with online state, traffic, quota, expiry and last-online data;
- unique local TCP and UDP port discovery.

### Nodes and Xray outbounds

- optional node discovery for central 3X-UI panels;
- node health, heartbeat, versions and connection counters;
- outbound traffic aggregates;
- optional outbound discovery;
- optional observatory metrics.

### Database, backups, logs and TLS

- SQLite database existence, size, owner, permissions and modification age;
- optional backup directory checks;
- panel and Xray log counters;
- optional TLS certificate checks.

## Optional features

High-cardinality or installation-specific checks are disabled by default, including:

- client discovery;
- node discovery;
- outbound discovery;
- local inbound port triggers;
- observatory triggers;
- log triggers;
- TLS checks;
- database modification-age trigger;
- backup checks.

Enable them only after configuring the related macros and confirming that the data is available in your installation.

## Security

The API token should be treated as an administrator credential.

- Store `{$3XUI.API.TOKEN}` as a Secret text macro.
- Restrict API access to the Zabbix Server or Proxy address.
- Do not expose database dumps, private keys, subscription links or complete Xray configuration in Zabbix history.

The template intentionally collects operational states and counters rather than sensitive configuration data.

## Template contents

- 123 regular items;
- 6 discovery rules;
- 56 item prototypes;
- 4 trigger prototypes;
- 1 template trigger;
- 21 classic graphs;
- 12 graph prototypes;
- 1 template dashboard;
- 57 user macros.

## Notes

The community edition does not include the optional Zabbix Web scenario from the upstream project because direct `web.test.*` references are not accepted by the community repository validation. API availability remains monitored through native HTTP agent items.

The full upstream project, including extended documentation and the optional Web UI scenario, is available at:

[github.com/TyranR/zabbix-3x-ui-monitoring](https://github.com/TyranR/zabbix-3x-ui-monitoring)

