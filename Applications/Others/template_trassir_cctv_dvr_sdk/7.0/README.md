# Trassir-server

## Overview

Template for Trassir CCTV DVR/NVR servers compatible with Zabbix 7.0 / 7.2 / 7.4.

This template allows monitoring DVR server related metrics via the Trassir Web SDK API (HTTP Agent). It connects via HTTPS/HTTP, bypasses self-signed SSL certificate validation, supports both IP and domain name connections (`{HOST.CONN}`), and collects server health, disk status, channel statistics, CPU load, and archive depth.

## Requirements

- Trassir VMS server with Web Server and Trassir SDK enabled.
- Zabbix version 7.0 LTS or newer.

## Setup

1. In TRASSIR GUI: go to **Server Settings** -> **Web Server**.
   - Enable Web Server (default port: `8080`).
   - Enable **Trassir SDK** and configure **SDK Password**.
   - Grant permissions for: Object tree, Events, Read settings.
2. In Zabbix: import `template_trassir_cctv_dvr_sdk.yaml`.
3. Create a host with an **Agent** interface (IP or DNS) pointing to the Trassir server.
4. Link the `Trassir-server` template.
5. Set the required macro `{$TRASSIR_SDK_PASS}`.

## Macros used

| Macro | Default | Description |
|---|---|---|
| `{$TRASSIR_SCHEME}` | `https` | Protocol scheme: `https` or `http` |
| `{$TRASSIR_SDK_PORT}` | `8080` | Web server port on remote host |
| `{$TRASSIR_SDK_PASS}` | ` ` | Password to Trassir SDK |
| `{$TRASSIR_ARCHIVE_DEPTH}` | `7` | Minimal acceptable archive depth threshold in days |

## Items collected

| Name | Description | Type | Key |
|---|---|---|---|
| Trassir server health string | Raw health JSON from `/health` | `HTTP agent` | `trassirhealthjson` |
| Trassir channels online | Number of operational cameras | `Dependent item` | `trassirchannelsonline` |
| Trassir channels total | Total number of connected cameras | `Dependent item` | `trassirchannelstotal` |
| Trassir archive main days depth | Current main stream archive depth in days | `Dependent item` | `trassirdisksstatmaindays` |
| Trassir archive privilege days depth | Current privilege stream archive depth in days | `Dependent item` | `trassirdisksstatprivdays` |
| Trassir archive sub days depth | Current sub stream archive depth in days | `Dependent item` | `trassirdisksstatsubsdays` |
| Trassir disks status | Status of server storage disks | `Dependent item` | `trassirdisks` |
| Trassir database status | Database connection status | `Dependent item` | `trassirdatabase` |
| Trassir network status | Network interconnect status | `Dependent item` | `trassirnetwork` |
| Trassir automation status | Automation / script execution status | `Dependent item` | `trassirautomation` |
| Trassir SDK connection status | Connection & session validity check | `Dependent item` | `trassirsdkstatus` |
| Trassir server cpu load | Current CPU load percentage | `Dependent item` | `trassircpuload` |
| Trassir server uptime | Server uptime in seconds | `Dependent item` | `trassiruptime` |

## Triggers

- **High:** `Unavailable / No new data from trassir server` (no response for 5 minutes).
- **High:** `Wrong data from trassir server` (authentication / password error).
- **High:** `Trassir server cpu load too high` (CPU > 85% for 5 checks).
- **Average:** `Not all cams online on trassir server` (online cameras < total cameras for 5 checks).
- **Average:** `Trassir server disks problem` (disk errors detected).
- **Average:** `Trassir server database problem` (database connection errors).
- **Average:** `Trassir server network problem` (network errors).
- **Average:** `Archive depth on main channels is too low` (depth < `{$TRASSIR_ARCHIVE_DEPTH}`).
- **Average:** `Trassir server automation problem` (script execution errors).
- **Warning:** `Trassir server was restarted` (uptime < 300s).
