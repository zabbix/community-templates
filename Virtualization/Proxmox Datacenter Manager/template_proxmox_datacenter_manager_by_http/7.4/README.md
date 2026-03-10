# Proxmox Datacenter Manager by HTTP — Zabbix Template

A community-maintained Zabbix template for monitoring **Proxmox Datacenter Manager (PDM)** via its REST API using HTTP agent and script items. No external scripts or agents required.

> Tested against PDM 1.0, Zabbix 7.4

---

## Overview

Proxmox Datacenter Manager is a standalone product for centrally managing multiple Proxmox VE and Proxmox Backup Server instances ("remotes"). This template monitors the PDM instance itself and all configured remotes through the PDM API.

---

## Features

- PDM API availability and version monitoring
- Automatic discovery of all configured PVE remotes
- Automatic discovery of all configured PBS remotes
- Per-remote subscription status monitoring with per-remote alerts
- PVE remote: VM count, LXC count, node count, connection status, SSL fingerprint
- PBS remote: connection status, datastore count, SSL fingerprint
- PDM subscription status per remote
- Version change detection

---

## Requirements

- Zabbix 7.2 or newer (uses JSONPath filter expressions)
- PDM accessible over HTTPS (default port 8443)
- API token with appropriate permissions (see Setup)

---

## Setup

### 1. Create an API token in PDM

Navigate to **PDM Web UI → Access → API Tokens** and create a token for a dedicated monitoring user.

The token needs the following permissions:

```
["perm", "/", ["Sys.Audit"]]
["perm", "/remotes", ["Remote.Audit"]]
```

After creation, copy the **Token ID** (format: `user@realm!tokenname`) and the **Token Secret** (UUID format).

### 2. Import the template

In Zabbix: **Configuration → Templates → Import** and select the `zbx_export_templates.json` file.

### 3. Create a host

Create a new host in Zabbix representing your PDM instance. Link the template **Proxmox Datacenter Manager by HTTP** to it.

### 4. Set host macros

On the host, go to **Macros** and set the following:

| Macro | Value | Description |
|---|---|---|
| `{$PDM.URL.HOST}` | `your-pdm-host.domain.com` | Hostname or IP of PDM |
| `{$PDM.URL.PORT}` | `8443` | API port (default 8443) |
| `{$PDM.TOKEN.ID}` | `root@pam!zabbix-monitor` | API Token ID |
| `{$PDM.TOKEN.SECRET}` | `your-token-secret-uuid` | API Token Secret |

---

## Collected Items

### Base items

| Item | Key | Description |
|---|---|---|
| API service status | `pdm.api.available` | HTTP status code of the PDM API |
| Get version | `pdm.version` | PDM version string |
| Get remotes list | `pdm.remotes.list` | Raw JSON of all configured remotes |
| Get subscription data | `pdm.subscription.raw` | Raw JSON of all remote subscription states |
| Get subscription status | `pdm.subscription` | PDM node subscription info |

### PVE remote discovery (per discovered remote)

| Item | Description |
|---|---|
| Connection status | Whether the remote has at least one online node |
| VM count | Number of non-template QEMU VMs |
| LXC count | Number of LXC containers |
| Node count | Number of cluster nodes |
| Fingerprint | SSL fingerprint from remote config |
| Get status | Raw resource data (master item, history not stored) |

### PBS remote discovery (per discovered remote)

| Item | Description |
|---|---|
| Connection status | Whether the PBS host is reachable and returning data |
| Datastore count | Number of configured datastores |
| Fingerprint | SSL fingerprint from PBS status |
| Get status | Raw PBS node status (master item, history not stored) |

### Subscription discovery (per discovered remote)

| Item | Description |
|---|---|
| Subscription state | Active/none/unknown per remote |

---

## Triggers

| Name | Severity | Description |
|---|---|---|
| PDM: API service not available | Disaster | API returns non-200 status |
| PDM: Version has changed | Info | PDM was updated — acknowledge to close |
| PDM: Remote PBS [name] not connected | High | PBS remote unreachable |
| PDM: Remote PVE [name] not connected | High | PVE remote has no online nodes |
| PDM: Remote [name] subscription not active | Warning | Remote has no valid subscription (ignores unknown state) |
| PDM: Subscription not active | Warning | PDM node subscription not active |

---

## Known Limitations

- The PDM API does not expose a `/status` endpoint per remote — PVE connection status is derived from the `/resources` endpoint by checking for at least one node with `status: online`
- PBS connection status is derived from the `/pbs/remotes/{id}/status` response — if the host is unreachable, PDM returns an error which is treated as disconnected
- Subscription state `unknown` does not trigger an alert by design, as PDM may report unknown for remotes it cannot query at that moment
- SSL certificate verification is disabled by default since PDM uses self-signed certificates — configure `{$PDM.VERIFY.PEER}` and `{$PDM.VERIFY.HOST}` macros if you have valid certificates

---

## API Reference

This template uses the following PDM API endpoints:

```
GET /api2/json/version
GET /api2/json/remotes/remote
GET /api2/json/remotes/remote/{id}/config
GET /api2/json/resources/subscription
GET /api2/json/pve/remotes/{id}/resources
GET /api2/json/pbs/remotes/{id}/status
GET /api2/json/pbs/remotes/{id}/datastore
```

Full API documentation: https://pdm.proxmox.com/docs/api-viewer/index.html

---

## Authentication

PDM uses its own token format, distinct from PVE:

```
Authorization: PDMAPIToken <tokenid>:<secret>
```

Example:
```
Authorization: PDMAPIToken root@pam!zabbix-monitor:secret
```

Note: this is different from PVE which uses `PVEAPIToken=tokenid=secret`.

---

## License

Community template — free to use and modify.
