# TrueNAS by WebSocket API

## Overview

This template monitors **TrueNAS** through the TrueNAS WebSocket JSON-RPC API. Zabbix itself collects data with HTTP agent items that talk to a small HTTP bridge service named `zabbix-websocket-bridge`. The bridge opens the WebSocket connection to TrueNAS, executes a batch of read-only JSON-RPC calls, and returns one aggregated JSON response to Zabbix. The bridge health endpoint is monitored separately.

TrueNAS 25.04 and later uses a versioned JSON-RPC 2.0 API over WebSocket. The legacy REST API is deprecated in TrueNAS 25.04 and removed in TrueNAS 26, so new integrations should use the WebSocket API.

## Template Summary

| Area | Count |
|---|---:|
| Zabbix version | 7.4 |
| Master items | 2 HTTP agents |
| Dependent items | 54 |
| Low-level discovery rules | 10 |
| Item prototypes | 81 |
| Triggers and trigger prototypes | 56 |
| User macros | 60 |

The template covers bridge health, system information, API health, alerts, boot pool, pools, datasets, disks, services, network adapters, certificates, data protection tasks, apps, containers, and virtual machines.

## Requirements

- Zabbix 7.4
- TrueNAS SCALE 25.04 or newer
- `zabbix-websocket-bridge` reachable from the Zabbix Server or Zabbix Proxy that executes the HTTP agent item
- Network access from the bridge to `wss://<truenas-host>/api/current`
- TrueNAS API user with read permissions for the required API methods
- A user-linked TrueNAS API key
- TLS for API-key authentication
- Docker, Docker Compose, Podman, or another container runtime that can pull from GHCR

## Bridge Deployment

The template sends a POST request to:

```text
{$TRUENAS.WSBRIDGE.URL}/api/v1/jsonrpc/batch
```

The default bridge URL is:

```text
http://zabbix-websocket-bridge:8080
```

This default is meant for Docker deployments where Zabbix Server or Zabbix Proxy and the bridge run in the same Docker network. If the bridge runs on another host, set `{$TRUENAS.WSBRIDGE.URL}` to a reachable HTTP or HTTPS URL.

Bridge project: <https://github.com/VoltKraft/zabbix-websocket-bridge>

The bridge exposes:

| Endpoint | Purpose |
|---|---|
| `GET /health` | Health check. Returns `{"status":"ok"}`. |
| `POST /api/v1/jsonrpc/batch` | Executes one WebSocket JSON-RPC batch against the target from the request body. |

The template checks `GET /health` directly and expects `status` to be `ok`. This separates bridge reachability problems from TrueNAS API or batch-call failures.

The bridge is stateless. It does not store credentials, sessions, targets, request payloads, or responses. Every Zabbix master item request contains the TrueNAS target and the API calls to execute.

### Container Image

Install the bridge from GitHub Container Registry:

```bash
docker pull ghcr.io/voltkraft/zabbix-websocket-bridge:latest
```

Use this image in the deployment examples below:

```text
ghcr.io/voltkraft/zabbix-websocket-bridge:latest
```

### Option A: Zabbix and Bridge in the Same Docker Compose Project

Use this when Zabbix Server or Zabbix Proxy already runs as Docker Compose services. Add the bridge service to the same Compose file or attach it to the same network.

Example service:

```yaml
services:
  zabbix-websocket-bridge:
    image: ghcr.io/voltkraft/zabbix-websocket-bridge:latest
    container_name: zabbix-websocket-bridge
    restart: unless-stopped
```

Do not publish a host port in this setup unless another system outside the Docker network must access the bridge. Zabbix reaches the bridge by Docker DNS name:

```text
http://zabbix-websocket-bridge:8080
```

Start or update the service:

```bash
docker compose up -d zabbix-websocket-bridge
```

Set the host macro:

| Macro | Value |
|---|---|
| `{$TRUENAS.WSBRIDGE.URL}` | `http://zabbix-websocket-bridge:8080` |

Verify from inside the Zabbix Server or Proxy container:

```bash
docker exec -it <zabbix-server-or-proxy-container> \
  curl -s http://zabbix-websocket-bridge:8080/health
```

Expected response:

```json
{"status":"ok"}
```

### Option B: Zabbix Runs in Docker, Bridge Runs as a Separate Container

Use this when Zabbix is already running in Docker, but the bridge is started outside the existing Compose project.

First identify the Docker network used by the Zabbix Server or Proxy container:

```bash
docker inspect <zabbix-server-or-proxy-container> \
  --format '{{range $name, $_ := .NetworkSettings.Networks}}{{println $name}}{{end}}'
```

Start the bridge in that network:

```bash
docker run -d \
  --name zabbix-websocket-bridge \
  --network <zabbix-network> \
  -e HOST=0.0.0.0 \
  -e PORT=8080 \
  -e LOG_LEVEL=info \
  --restart unless-stopped \
  ghcr.io/voltkraft/zabbix-websocket-bridge:latest
```

Use the same macro value as in the Compose setup:

| Macro | Value |
|---|---|
| `{$TRUENAS.WSBRIDGE.URL}` | `http://zabbix-websocket-bridge:8080` |

If you cannot attach the bridge to the Zabbix Docker network, publish a host port and point Zabbix to the Docker host address instead:

```bash
docker run -d \
  --name zabbix-websocket-bridge \
  -p 8080:8080 \
  -e HOST=0.0.0.0 \
  -e PORT=8080 \
  -e LOG_LEVEL=info \
  --restart unless-stopped \
  ghcr.io/voltkraft/zabbix-websocket-bridge:latest
```

In that case set `{$TRUENAS.WSBRIDGE.URL}` to a URL reachable from the Zabbix container, for example:

```text
http://172.17.0.1:8080
```

or, if `host.docker.internal` is configured for the container:

```text
http://host.docker.internal:8080
```

Verify from inside the Zabbix container, not only from the Docker host:

```bash
docker exec -it <zabbix-server-or-proxy-container> \
  curl -s http://<bridge-address>:8080/health
```

### Option C: Zabbix Does Not Run in Docker

Use this when Zabbix Server or Zabbix Proxy is installed directly on Linux packages or another non-containerized installation.

The simplest deployment is to run the bridge as a Docker container on the same host as the Zabbix process:

```bash
docker run -d \
  --name zabbix-websocket-bridge \
  -p 127.0.0.1:8080:8080 \
  -e HOST=0.0.0.0 \
  -e PORT=8080 \
  -e LOG_LEVEL=info \
  --restart unless-stopped \
  ghcr.io/voltkraft/zabbix-websocket-bridge:latest
```

Set the host macro:

| Macro | Value |
|---|---|
| `{$TRUENAS.WSBRIDGE.URL}` | `http://127.0.0.1:8080` |

Verify from the Zabbix Server or Proxy host:

```bash
curl -s http://127.0.0.1:8080/health
```

If the bridge runs on a different host, publish the service on a reachable interface and protect it with firewall rules, a reverse proxy, or another trusted network control:

```bash
docker run -d \
  --name zabbix-websocket-bridge \
  -p 8080:8080 \
  -e HOST=0.0.0.0 \
  -e PORT=8080 \
  -e LOG_LEVEL=info \
  --restart unless-stopped \
  ghcr.io/voltkraft/zabbix-websocket-bridge:latest
```

Then set:

```text
{$TRUENAS.WSBRIDGE.URL}=http://<bridge-host-or-ip>:8080
```

### End-to-End Bridge Test

After `/health` works from the Zabbix Server or Proxy, test a minimal TrueNAS call through the bridge. Replace placeholders before running:

```bash
curl -s -X POST http://<bridge-address>:8080/api/v1/jsonrpc/batch \
  -H 'Content-Type: application/json' \
  -d '{
    "target": {
      "url": "wss://<truenas-host>/api/current",
      "verify_tls": true
    },
    "timeout": 10,
    "calls": [
      {
        "name": "auth_login",
        "method": "auth.login_ex",
        "params": [
          {
            "mechanism": "API_KEY_PLAIN",
            "username": "<truenas-api-user>",
            "api_key": "<truenas-api-key>",
            "login_options": {
              "user_info": false
            }
          }
        ]
      },
      {
        "name": "system_info",
        "method": "system.info",
        "params": []
      }
    ]
  }'
```

The response should contain `"ok": true` and a successful `system_info` result. If this test fails, fix the bridge-to-TrueNAS path before troubleshooting Zabbix item preprocessing.

### Bridge Security

- The bridge does not authenticate incoming HTTP requests. Expose it only to trusted Zabbix Server or Proxy instances.
- Do not publish the bridge to the internet.
- Prefer Docker-internal networking or `127.0.0.1` binding where possible.
- Use firewall rules or a reverse proxy with authentication if the bridge must be reachable over a routed network.
- Keep `{$TRUENAS.API.TLS_VERIFY}` set to `true` for production.
- Do not place API keys in the bridge configuration. The template sends the API key from the Zabbix Secret Text macro for each request.

Community template note: the bridge project is public, but it is licensed separately. Do not copy third-party bridge source code into this repository unless the license is acceptable for the Zabbix Community Templates repository. For this template, keep the bridge as an external public dependency and document how to deploy it.

## TrueNAS API Calls

The TrueNAS data master item sends one batch containing these JSON-RPC calls:

| Batch name | Method |
|---|---|
| `auth_login` | `auth.login_ex` |
| `system_info` | `system.info` |
| `update_available_versions` | `update.available_versions` |
| `cpu_usage` | `reporting.get_data` |
| `cpu_temperature` | `reporting.get_data` |
| `system_ready` | `system.ready` |
| `alerts` | `alert.list` |
| `pools` | `pool.query` |
| `boot_pool` | `boot.get_state` |
| `datasets` | `pool.dataset.query` |
| `disks` | `disk.query` |
| `disk_temperatures` | `disk.temperatures` |
| `services` | `service.query` |
| `interfaces` | `interface.query` |
| `certificates` | `certificate.query` |
| `cloud_backups` | `cloud_backup.query` |
| `cloud_sync_tasks` | `cloudsync.query` |
| `periodic_snapshot_tasks` | `pool.snapshottask.query` |
| `rsync_tasks` | `rsynctask.query` |
| `replication_tasks` | `replication.query` |
| `apps` | `app.query` |
| `vms` | `vm.query` |

The TrueNAS API user must be allowed to read system, alert, pool, dataset, disk, service, network interface, certificate, update, reporting, data protection, app, and VM data. App-container data is read from `app.query`. Update monitoring uses `update.available_versions` and requires update-read permissions such as `SYSTEM_UPDATE_READ`. Network adapter monitoring uses `interface.query` and requires `NETWORK_INTERFACE_READ`. Certificate monitoring uses `certificate.query` and requires `CERTIFICATE_READ`. Periodic snapshot monitoring requires `SNAPSHOT_TASK_READ`; the other data protection APIs require their corresponding read permissions.

App container monitoring is derived from the `container_details` data returned by `app.query`; the template does not call `container.query`. If a TrueNAS version does not support one of the optional app or VM methods, the related discovery rule returns no objects and `TrueNAS: API calls failed` reports the failed batch call.

## Setup

### 1. Install or Deploy the Bridge

Deploy `zabbix-websocket-bridge` where it can reach the TrueNAS WebSocket API. If the bridge runs in the same Docker Compose project as Zabbix, use the Docker service name in `{$TRUENAS.WSBRIDGE.URL}`.

### 2. Create a TrueNAS Monitoring User

Create a dedicated TrueNAS user for monitoring. Grant only the read permissions required by the API methods listed above.

### 3. Generate an API Key

Generate a user-linked API key for the monitoring user. Store the generated key immediately because TrueNAS displays it only once.

### 4. Import the Template

Import `template_truenas_by_websocket_api.yaml` in Zabbix:

```text
Data collection -> Templates -> Import
```

### 5. Create the Zabbix Host

Create a host for the TrueNAS system. Set the host interface address to the TrueNAS management DNS name or IP address used by the bridge.

The template builds the target WebSocket URL as:

```text
wss://{HOST.CONN}{$TRUENAS.API.PATH}
```

The current template therefore targets the default HTTPS/WebSocket port 443.

### 6. Configure Host Macros

At minimum, set these macros at host level:

| Macro | Required | Notes |
|---|---|---|
| `{$TRUENAS.API.USER}` | Yes | TrueNAS user associated with the API key. |
| `{$TRUENAS.API.KEY}` | Yes | Store as Secret Text. |
| `{$TRUENAS.WSBRIDGE.URL}` | Usually | Keep the default only if the bridge is reachable by that Docker service name. |
| `{$TRUENAS.API.TLS_VERIFY}` | Optional | Set to `false` only for self-signed or untrusted certificates. |
| `{$TRUENAS.API.PATH}` | Optional | Default is `/api/current`. |

### 7. Check Data Collection

After linking the template, check `TrueNAS: WebSocket bridge health` first. Then check `TrueNAS: Get data`; the TrueNAS data dependent items and discovery rules depend on this batch master item.

## Macros

| Macro | Default | Description |
|---|---|---|
| `{$TRUENAS.API.KEY}` | empty | TrueNAS SCALE API key used to authenticate against the TrueNAS API. |
| `{$TRUENAS.API.PATH}` | `/api/current` | Path of the target WebSocket JSON-RPC API. This value is appended to `{HOST.CONN}` to build the final WebSocket URL. |
| `{$TRUENAS.API.TLS_VERIFY}` | `true` | Whether TLS certificate verification is enabled when the bridge connects to the TrueNAS WebSocket API. |
| `{$TRUENAS.API.USER}` | empty | TrueNAS user name used with `{$TRUENAS.API.KEY}` for the WebSocket JSON-RPC login request. |
| `{$TRUENAS.APP.NAME.MATCHES}` | `^.*$` | Regular expression for app discovery inclusion. |
| `{$TRUENAS.APP.NAME.NOT_MATCHES}` | `^$` | Regular expression for app discovery exclusion. |
| `{$TRUENAS.APP.STATE.OK.MATCHES}` | `^RUNNING$` | Regular expression for app states considered healthy. |
| `{$TRUENAS.BOOT.POOL.USED.MAX.CRIT}` | `90` | Critical threshold for boot pool used space, in percent. |
| `{$TRUENAS.BOOT.POOL.USED.MAX.WARN}` | `80` | Warning threshold for boot pool used space, in percent. |
| `{$TRUENAS.CERT.EXPIRES.WARN}` | `30` | Warning threshold for certificate expiration, in days before the certificate valid-until date. |
| `{$TRUENAS.CERT.NAME.MATCHES}` | `^.*$` | Regular expression for certificate discovery inclusion by certificate name. |
| `{$TRUENAS.CERT.NAME.NOT_MATCHES}` | `^$` | Regular expression for certificate discovery exclusion by certificate name. |
| `{$TRUENAS.CONTAINER.CPU.UTIL.MAX.CRIT}` | `95` | Critical threshold for container CPU utilization, in percent. |
| `{$TRUENAS.CONTAINER.CPU.UTIL.MAX.WARN}` | `85` | Warning threshold for container CPU utilization, in percent. |
| `{$TRUENAS.CONTAINER.MEMORY.USED.MAX.CRIT}` | `95` | Critical threshold for container memory usage, in percent. |
| `{$TRUENAS.CONTAINER.MEMORY.USED.MAX.WARN}` | `85` | Warning threshold for container memory usage, in percent. |
| `{$TRUENAS.CONTAINER.NAME.MATCHES}` | `^.*$` | Regular expression for container discovery inclusion. |
| `{$TRUENAS.CONTAINER.NAME.NOT_MATCHES}` | `^$` | Regular expression for container discovery exclusion. |
| `{$TRUENAS.CONTAINER.STATE.OK.MATCHES}` | `^RUNNING$` | Regular expression for container states considered healthy. |
| `{$TRUENAS.CONTAINER.STORAGE.USED.MAX.CRIT}` | `90` | Critical threshold for container storage usage, in percent. |
| `{$TRUENAS.CONTAINER.STORAGE.USED.MAX.WARN}` | `80` | Warning threshold for container storage usage, in percent. |
| `{$TRUENAS.CPU.TEMP.MAX.CRIT}` | `90` | Critical threshold for CPU temperature, in degrees Celsius. |
| `{$TRUENAS.CPU.TEMP.MAX.WARN}` | `80` | Warning threshold for CPU temperature, in degrees Celsius. |
| `{$TRUENAS.CPU.UTIL.MAX}` | `90` | Warning threshold for CPU utilization, in percent. |
| `{$TRUENAS.DATASET.NAME.MATCHES}` | `^.*$` | Regular expression for dataset discovery inclusion. |
| `{$TRUENAS.DATASET.NAME.NOT_MATCHES}` | `^$` | Regular expression for dataset discovery exclusion. |
| `{$TRUENAS.DATASET.USED.MAX.CRIT}` | `90` | Critical threshold for dataset used space, in percent. |
| `{$TRUENAS.DATASET.USED.MAX.WARN}` | `80` | Warning threshold for dataset used space, in percent. |
| `{$TRUENAS.DP.TASK.JOB.STATE.FAILED.MATCHES}` | `^(FAILED\|ABORTED\|ERROR\|EXCEPTION)$` | Regular expression for Data Protection task job states considered failed. Non-empty job error text is also treated as failed. |
| `{$TRUENAS.DP.TASK.NAME.MATCHES}` | `^.*$` | Regular expression for Data Protection task discovery inclusion by normalized task name. |
| `{$TRUENAS.DP.TASK.NAME.NOT_MATCHES}` | `^$` | Regular expression for Data Protection task discovery exclusion by normalized task name. |
| `{$TRUENAS.DP.TASK.TYPE.MATCHES}` | `^.*$` | Regular expression for Data Protection task discovery inclusion by task type. Supported types: `truecloud_backup`, `cloud_sync`, `periodic_snapshot`, `rsync`, `replication`. |
| `{$TRUENAS.DP.TASK.TYPE.NOT_MATCHES}` | `^$` | Regular expression for Data Protection task discovery exclusion by task type. |
| `{$TRUENAS.DISK.NAME.MATCHES}` | `^.*$` | Regular expression for disk discovery inclusion. |
| `{$TRUENAS.DISK.NAME.NOT_MATCHES}` | `^$` | Regular expression for disk discovery exclusion. |
| `{$TRUENAS.DISK.TEMP.MAX.CRIT}` | `55` | Critical disk temperature threshold, in degrees Celsius. |
| `{$TRUENAS.DISK.TEMP.MAX.WARN}` | `45` | Warning disk temperature threshold, in degrees Celsius. |
| `{$TRUENAS.INTERFACE.LINK.MONITOR.MATCHES}` | `^.*$` | Regular expression for network interfaces whose link state should raise trigger alerts. |
| `{$TRUENAS.INTERFACE.LINK.MONITOR.NOT_MATCHES}` | `^$` | Regular expression for network interfaces excluded from link state trigger alerts. |
| `{$TRUENAS.INTERFACE.LINK.STATE.UP.MATCHES}` | `^(LINK_STATE_UP\|UP\|ACTIVE)$` | Regular expression for network interface link states considered up. |
| `{$TRUENAS.INTERFACE.NAME.MATCHES}` | `^.*$` | Regular expression for network interface discovery inclusion by interface name. |
| `{$TRUENAS.INTERFACE.NAME.NOT_MATCHES}` | `^$` | Regular expression for network interface discovery exclusion by interface name. |
| `{$TRUENAS.INTERFACE.TYPE.MATCHES}` | `^.*$` | Regular expression for network interface discovery inclusion by interface type. |
| `{$TRUENAS.INTERFACE.TYPE.NOT_MATCHES}` | `^$` | Regular expression for network interface discovery exclusion by interface type. |
| `{$TRUENAS.POOL.NAME.MATCHES}` | `^.*$` | Regular expression for pool discovery inclusion. |
| `{$TRUENAS.POOL.NAME.NOT_MATCHES}` | `^$` | Regular expression for pool discovery exclusion. |
| `{$TRUENAS.POOL.USED.MAX.CRIT}` | `90` | Critical threshold for pool used space, in percent. |
| `{$TRUENAS.POOL.USED.MAX.WARN}` | `80` | Warning threshold for pool used space, in percent. |
| `{$TRUENAS.SERVICE.NAME.MATCHES}` | `^.*$` | Regular expression for service discovery inclusion. |
| `{$TRUENAS.SERVICE.NAME.NOT_MATCHES}` | `^$` | Regular expression for service discovery exclusion. |
| `{$TRUENAS.VM.CPU.UTIL.MAX.CRIT}` | `95` | Critical threshold for VM CPU utilization, in percent. |
| `{$TRUENAS.VM.CPU.UTIL.MAX.WARN}` | `85` | Warning threshold for VM CPU utilization, in percent. |
| `{$TRUENAS.VM.DISK.USED.MAX.CRIT}` | `90` | Critical threshold for VM disk usage, in percent. |
| `{$TRUENAS.VM.DISK.USED.MAX.WARN}` | `80` | Warning threshold for VM disk usage, in percent. |
| `{$TRUENAS.VM.MEMORY.USED.MAX.CRIT}` | `95` | Critical threshold for VM memory usage, in percent. |
| `{$TRUENAS.VM.MEMORY.USED.MAX.WARN}` | `85` | Warning threshold for VM memory usage, in percent. |
| `{$TRUENAS.VM.NAME.MATCHES}` | `^.*$` | Regular expression for VM discovery inclusion. |
| `{$TRUENAS.VM.NAME.NOT_MATCHES}` | `^$` | Regular expression for VM discovery exclusion. |
| `{$TRUENAS.VM.STATE.OK.MATCHES}` | `^RUNNING$` | Regular expression for VM states considered healthy. |
| `{$TRUENAS.WSBRIDGE.URL}` | `http://zabbix-websocket-bridge:8080` | URL of the `zabbix-websocket-bridge` instance. |

## Items Collected

### System and API

| Metric group | Examples |
|---|---|
| API and bridge health | Bridge health endpoint status, bridge batch response status, API login response, failed API calls, authenticator |
| System identity | Hostname, version, product, serial number |
| System readiness | System ready state, uptime, restart detection |
| CPU and memory | CPU model, cores, physical cores, CPU utilization, CPU temperature, physical memory, ECC memory |
| Load average | 1 minute, 5 minute, 15 minute |
| Updates | Available update count and available versions |
| Alerts | Total, warning, and critical alerts |
| Boot pool | Health, status, warning flag, size, allocated, free, used percentage |
| Network adapters | Total, link up, and monitored link down counters |
| Certificates | Total, expiring soon, and expired certificate counters |
| Data protection | Total, enabled, and failed Data Protection task counters |
| Apps, containers, VMs | Total and running or not-running counters |

### Low-Level Discovery

| Discovery rule | Item prototypes | Trigger prototypes | Scope |
|---|---:|---:|---|
| App discovery | 7 | 3 | App state and update availability |
| Certificate discovery | 6 | 2 | Certificate expiration, parsed state, common name, and SAN |
| Container discovery | 10 | 7 | Container state, CPU, memory, and storage |
| Data protection task discovery | 7 | 1 | TrueCloud Backup, Cloud Sync, Periodic Snapshot, Rsync, and Replication tasks |
| Dataset discovery | 9 | 2 | Dataset usage, quota, reservation, read-only state |
| Disk discovery | 7 | 5 | Disk identity, size, temperature, and ZFS errors |
| Interface discovery | 10 | 1 | Network adapter link state, MTU, MAC, aliases, DHCP, IPv6 auto, and media |
| Pool discovery | 12 | 9 | Pool health, status, capacity, scan errors, and ZFS errors |
| Service discovery | 2 | 1 | Enabled services not running |
| VM discovery | 11 | 7 | VM state, CPU, memory, disk, vCPUs |

## Trigger Summary

| Severity | Count | Examples |
|---|---:|---|
| High | 9 | Bridge health check failed, API login failed, bridge request failed, boot pool unhealthy, pool unhealthy, pool offline, expired certificates |
| Average | 20 | API batch failed, system not ready, critical capacity, high temperatures, data protection task failures, app/container/VM state mismatch |
| Warning | 23 | Warning alerts, warning capacity, certificate expiration, network link down, ZFS read/write/checksum errors, high CPU utilization |
| Information | 4 | Updates available, app updates available, system restarted |

Important trigger areas:

- API availability and authentication
- Bridge health endpoint and batch response health
- TrueNAS alert counts
- Certificate expiration
- Network adapter link state
- Boot pool and data pool health
- Pool, dataset, container, and VM capacity
- Disk and CPU temperature
- Disk and pool ZFS errors
- Data Protection task job failures
- App, container, service, and VM state
- System update availability and restart detection

## Tags

Template-level tags:

| Tag | Value |
|---|---|
| `class` | `storage` |
| `target` | `truenas` |

Items and triggers also use component, scope, and task type tags for filtering:

- `component`: `application`, `bridge`, `certificate`, `cpu`, `dataprotection`, `environment`, `hardware`, `memory`, `network`, `raw`, `storage`, `system`, `virtualization`
- `scope`: `availability`, `capacity`, `health`, `notice`, `performance`
- `task_type`: populated for Data Protection task item prototypes

## Security Notes

- Use a dedicated TrueNAS monitoring account.
- Store `{$TRUENAS.API.KEY}` as a Secret Text macro at host level.
- Keep `{$TRUENAS.API.TLS_VERIFY}` set to `true` with valid certificates.
- Do not commit real API keys, exported host macros containing secrets, or private bridge URLs.
- The template is designed for read-only monitoring. The bridge configuration should not expose destructive TrueNAS API methods.
- Restrict access to the bridge endpoint. It accepts requests that cause API calls to a TrueNAS system.

## Known Limitations

- The current template depends on `zabbix-websocket-bridge`; the bridge implementation is not contained in this version folder yet.
- The TrueNAS target URL is currently built as `wss://{HOST.CONN}{$TRUENAS.API.PATH}` and does not expose a dedicated port macro.
- Optional or permissioned methods such as `interface.query`, `certificate.query`, `app.query`, `vm.query`, `cloud_backup.query`, `cloudsync.query`, `pool.snapshottask.query`, `rsynctask.query`, or `replication.query` can be unavailable on some TrueNAS versions or installations. App containers are monitored through `app.query` container details instead of a separate `container.query` call.
- Disk temperatures and reporting metrics depend on hardware support and TrueNAS middleware data availability.
- TrueNAS 24.10 and older can use different endpoint behavior and are not the primary target.

## Troubleshooting

| Symptom | Check |
|---|---|
| `TrueNAS: Get data` is unsupported | Verify `{$TRUENAS.WSBRIDGE.URL}`, bridge reachability, and bridge logs. |
| Bridge request fails | Check that the Zabbix Server or Proxy can reach the bridge URL. |
| WebSocket bridge health check failed | Verify `GET {$TRUENAS.WSBRIDGE.URL}/health`, bridge container state, bridge logs, and network path from Zabbix Server or Proxy. |
| API login failed | Verify `{$TRUENAS.API.USER}`, `{$TRUENAS.API.KEY}`, and TrueNAS API-key status. |
| TLS error | Check TrueNAS certificate trust and `{$TRUENAS.API.TLS_VERIFY}`. |
| Some discovery rules are empty | Confirm the related API method exists and the API user has read permissions. |
| Network adapters are missing | Confirm that the API user has `NETWORK_INTERFACE_READ` permission. |
| Unused network adapters trigger link-down alerts | Exclude them with `{$TRUENAS.INTERFACE.LINK.MONITOR.NOT_MATCHES}` or the interface discovery filter macros. |
| Certificates are missing | Confirm that the API user has `CERTIFICATE_READ` permission. |
| Data Protection tasks are missing | Confirm permissions for Cloud Backup, Cloud Sync, Snapshot Tasks, Rsync Tasks, and Replication Tasks. |
| `TrueNAS: API calls failed` is non-zero | Check `TrueNAS: API failed call details` or the trigger operational data for the failed method name and returned error. |
| Dependent items have no data | Confirm that `TrueNAS: Get data` returns valid JSON and review preprocessing errors. |

## Files

| Path | Purpose |
|---|---|
| `template_truenas_by_websocket_api.yaml` | Zabbix 7.4 template export |

## References

- TrueNAS API documentation: <https://api.truenas.com/>
- TrueNAS API client: <https://github.com/truenas/api_client>
-

## License

This template is intended for the Zabbix Community Templates repository and is published under the repository MIT license.

## Author

[VoltKraft](https://github.com/VoltKraft)
