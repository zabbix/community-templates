# Zabbix Template Jellyfin by HTTP

This template monitors a **Jellyfin** media server through the Jellyfin HTTP API.

It uses Zabbix script master items with the built-in `HttpRequest` object, dependent items, JavaScript preprocessing and low-level discovery. No Zabbix agent, external scripts, SSH or SNMP access is required on the Jellyfin host.

## Requirements

- Zabbix Server or Proxy 7.4 or newer
- JavaScript/script item support on the Zabbix Server or Proxy
- A Jellyfin API key
- A Zabbix host with `{HOST.CONN}` set
- If using HTTPS, a certificate trusted by the Zabbix Server or Proxy

## Installation

1. Import `template_jellyfin_by_http.yaml` in Zabbix.
2. Create or select the Zabbix host representing the Jellyfin server.
3. Assign the template **Jellyfin by HTTP**.
4. Set `{$JELLYFIN.API.TOKEN}` to a Jellyfin API key and store it as a secret macro.
5. Adjust `{$JELLYFIN.HOST}`, `{$JELLYFIN.SCHEME}`, `{$JELLYFIN.PORT}` and `{$JELLYFIN.BASEPATH}` if Jellyfin is not reachable as `http://{HOST.CONN}:8096`.

Default URL:

```text
http://{HOST.CONN}:8096
```

`{HOST.CONN}` is resolved by Zabbix from the host interface connection setting. If the host interface is set to **Connect to: DNS**, the DNS field is used; if it is set to **Connect to: IP**, the IP field is used.

Script items are executed by the Zabbix Server or Zabbix Proxy, not by the monitored host's Zabbix agent. Therefore the Zabbix Server or Proxy must be able to resolve and reach `{$JELLYFIN.HOST}` directly. A working Zabbix agent only proves that agent checks work; it does not prove that API requests to Jellyfin work.

The default `{$JELLYFIN.HOST}` value is `{HOST.CONN}`. The template's script items handle this value explicitly and fall back to the real host connection address, avoiding Zabbix user-macro nesting problems.

When testing an item on the template itself, `{HOST.CONN}` may remain unresolved and produce `Bad hostname`. Test on an actual host with the template linked.

For a standard local Jellyfin installation no URL macro is required:

| Macro | Value |
|---|---|
| `{$JELLYFIN.HOST}` | `{HOST.CONN}` |
| `{$JELLYFIN.SCHEME}` | `http` |
| `{$JELLYFIN.PORT}` | `8096` |
| `{$JELLYFIN.BASEPATH}` | empty |

For a reverse proxy, use the external base URL, for example:

```text
https://jellyfin.example.org
https://example.org/jellyfin
```

That corresponds to:

| Public URL | `{$JELLYFIN.HOST}` | `{$JELLYFIN.SCHEME}` | `{$JELLYFIN.PORT}` | `{$JELLYFIN.BASEPATH}` |
|---|---|---|---|---|
| `https://jellyfin.example.org` | `jellyfin.example.org` | `https` | `443` | empty |
| `https://example.org/jellyfin` | `example.org` | `https` | `443` | `/jellyfin` |

## Creating the API key

In Jellyfin, go to **Dashboard -> Advanced -> API Keys** and create a key for Zabbix. The template sends it in the `X-MediaBrowser-Token` header.

## Monitored API areas

| Area | Endpoint |
|---|---|
| System info and API availability | `/System/Info` |
| Media counts | `/Items/Counts` |
| Active sessions and playback | `/Sessions?activeWithinSeconds=...` |
| Users and user policy counters | `/Users` |
| Libraries | `/Library/MediaFolders` |
| Plugins | `/Plugins` |
| Scheduled tasks | `/ScheduledTasks` |
| Activity log warnings/errors | `/System/ActivityLog/Entries` |
| Storage folders | `/System/Info/Storage` |

The storage endpoint is handled defensively. If the Jellyfin version does not provide `/System/Info/Storage` and returns `404` or `405`, the template records `Jellyfin: Storage endpoint supported = No` and skips storage discovery.

## Main Metrics

### Availability and system

- Authenticated API availability
- Jellyfin version, server name, server ID
- Product name, operating system, architecture
- Local address and WebSocket port
- Pending restart flag
- Shutting down flag
- Update available flag
- Startup wizard completed flag

### Media library

- Total item count
- Movies, series, episodes
- Songs, albums, artists
- Music videos, books, box sets, trailers, programs
- Library discovery with per-library item counters
- Per-library last media added age when Jellyfin reports the timestamp

### Sessions and playback

- Active sessions
- Active users
- Playing streams
- Paused streams
- Direct streams
- Transcoding streams
- Total reported transcoding bitrate
- Current active session users
- Current now-playing summary
- Current transcoding reasons

### Users

- Total users
- Administrator users
- Disabled users
- Users without password
- Users with remote access
- Users with public sharing enabled
- Locked out users

### Plugins

- Installed plugin count
- Plugins with non-OK status
- Plugins requiring restart
- Plugin discovery with status, version and uninstall flag

### Scheduled tasks

- Scheduled task count
- Running task count
- Tasks with non-completed last result
- Task discovery with state, progress, last result, last completion age and last error

### Activity log

- Recent Error/Critical entries
- Recent Warning entries
- Latest problem entry summary

### Storage

- Storage endpoint availability
- Minimum free bytes across Jellyfin-reported folders
- Minimum free percentage across Jellyfin-reported folders
- Lowest-free-space folder path
- Storage folder discovery with free/used bytes, free percentage, path and type

## Triggers

| Trigger | Default severity |
|---|---|
| API is not available | High |
| Server is shutting down | High |
| Restart is pending | Warning |
| Startup wizard is not completed | Warning |
| Update is available | Info |
| Users without password detected | Info |
| Locked out users detected | Warning |
| Recent Error/Critical activity entries detected | Warning |
| Many recent Warning activity entries | Info |
| High active session count | Warning, disabled by default |
| High playing stream count | Warning, disabled by default |
| High transcoding stream count | Warning, disabled by default |
| Library has fewer items than expected | Info, disabled by default |
| Plugin status is not OK | Warning |
| Scheduled task last result is not OK | Average |
| Scheduled task has been running too long | Warning |
| Low free space on a storage folder | Warning |

## Macros

| Macro | Default | Description |
|---|---:|---|
| `{$JELLYFIN.API.TOKEN}` | empty | Jellyfin API key. Use a secret macro. |
| `{$JELLYFIN.HOST}` | `{HOST.CONN}` | Hostname or IP address used to connect to Jellyfin. |
| `{$JELLYFIN.SCHEME}` | `http` | URL scheme used to connect to Jellyfin: `http` or `https`. |
| `{$JELLYFIN.PORT}` | `8096` | Jellyfin HTTP API port. Use `443` for a normal HTTPS reverse proxy. |
| `{$JELLYFIN.BASEPATH}` | empty | Optional reverse-proxy subpath, for example `/jellyfin`. |
| `{$JELLYFIN.HTTP.TIMEOUT}` | `10s` | HTTP timeout for API requests. |
| `{$JELLYFIN.NODATA.TIME}` | `15m` | API no-data threshold. |
| `{$JELLYFIN.SYSTEM.INTERVAL}` | `5m` | `/System/Info` polling interval. |
| `{$JELLYFIN.SESSIONS.INTERVAL}` | `1m` | Session polling interval. |
| `{$JELLYFIN.SESSION.ACTIVE.SECONDS}` | `120` | Active session filter window for `/Sessions`. |
| `{$JELLYFIN.INVENTORY.INTERVAL}` | `15m` | Inventory endpoint polling interval. |
| `{$JELLYFIN.DISCOVERY.INTERVAL}` | `1h` | Library discovery interval. |
| `{$JELLYFIN.TASKS.INTERVAL}` | `5m` | Scheduled task polling interval. |
| `{$JELLYFIN.ACTIVITY.INTERVAL}` | `5m` | Activity log polling interval. |
| `{$JELLYFIN.ACTIVITY.LIMIT}` | `200` | Activity entries fetched per poll. |
| `{$JELLYFIN.ACTIVITY.WINDOW}` | `3600` | Activity evaluation window in seconds. |
| `{$JELLYFIN.ACTIVITY.ERROR.MAX}` | `0` | Maximum Error/Critical entries in the window. |
| `{$JELLYFIN.ACTIVITY.WARNING.MAX}` | `20` | Maximum Warning entries in the window. |
| `{$JELLYFIN.UPDATE.TRIGGER}` | `1` | Set to `0` to disable the update trigger. |
| `{$JELLYFIN.SESSIONS.MAX}` | `0` | Maximum active sessions. `0` disables the trigger. |
| `{$JELLYFIN.STREAMS.MAX}` | `0` | Maximum playing streams. `0` disables the trigger. |
| `{$JELLYFIN.TRANSCODING.MAX}` | `0` | Maximum transcodes. `0` disables the trigger. |
| `{$JELLYFIN.USERS.NO_PASSWORD.MAX}` | `0` | Maximum users without password. Set to `-1` to disable. |
| `{$JELLYFIN.PLUGIN.STATUS.OK}` | `^(Active\|Disabled\|Superseded\|Superceded\|Deleted)$` | Plugin statuses considered OK. |
| `{$JELLYFIN.TASK.STATUS.OK}` | `^Completed$` | Task last-result statuses considered OK. Supports task-name context. |
| `{$JELLYFIN.TASK.RUNNING.WARN}` | `6h` | Running task duration before alerting. Supports task-name context. |
| `{$JELLYFIN.LIBRARY.MIN_ITEMS}` | `0` | Minimum expected items per library. `0` disables the trigger. Supports library-name context. |
| `{$JELLYFIN.STORAGE.PFREE.MIN}` | `10` | Minimum storage free percentage. Supports storage-name context. |
| `{$JELLYFIN.STORAGE.FREE.MIN}` | `10G` | Minimum storage free bytes. Supports storage-name context. |
| `{$JELLYFIN.STORAGE.INTERVAL}` | `15m` | Storage endpoint polling interval. |

## Notes

- The activity log counts are capped by `{$JELLYFIN.ACTIVITY.LIMIT}` because only the fetched entries can be evaluated.
- Stream bitrate is only available when Jellyfin reports `TranscodingInfo.Bitrate`.
- Direct stream/direct play separation is not always explicit in `/Sessions`; the template reports non-transcoding playing sessions as direct streams.
- HTTPS requests are made by Zabbix script items through `HttpRequest`. For private CAs or self-signed certificates, add the CA certificate to the trust store used by the Zabbix Server or Proxy.

## References

- Jellyfin OpenAPI stable specification: <https://repo.jellyfin.org/releases/openapi/jellyfin-openapi-stable.json>
- Jellyfin OpenAPI archive: <https://repo.jellyfin.org/releases/openapi/>
