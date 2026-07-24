# Immich by HTTP

## Overview

This template monitors an [Immich](https://immich.app/) server via the official HTTP API.

The template uses one Zabbix JavaScript master item to call the Immich API and then derives
availability, version, update, storage, global asset, album, memory, job, library and user
metrics through dependent items. Low-level discovery creates per-queue, per-external-library
and per-user items.

## Requirements

- Zabbix 7.4 or newer
- Network access from the Zabbix server/proxy to the Immich API
- An Immich API key created by an admin user

## Tested versions

This template was built against:

- Zabbix 7.4 export format
- Immich OpenAPI specification published in July 2026

## Setup

1. In Immich, create an API key in **User Settings -> API Keys**.
2. Use an admin user/API key and grant read access to the data the template collects:

   - `server.about`
   - `server.statistics`
   - `server.storage`
   - `server.versionCheck`
   - `job.read`
   - `library.read`
   - `library.statistics`
   - `album.statistics`
   - `memory.statistics`
   - `adminUser.read`

   `/server/ping` and `/server/version` are public in the OpenAPI specification.

3. Import `template_immich_by_http.yaml` into Zabbix.
4. Link **Immich by HTTP** to the host.
5. Set the required host macros.

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$IMMICH.URL.HOST}` | | Immich host name or IP address, without scheme and without port. |
| `{$IMMICH.SCHEME}` | `http` | Request scheme: `http` or `https`. |
| `{$IMMICH.PORT}` | `2283` | Immich HTTP port. |
| `{$IMMICH.API.PATH}` | `/api` | Immich API base path. |
| `{$IMMICH.API.TOKEN}` | | Immich API key. Store as a secret macro. |
| `{$IMMICH.API.INTERVAL}` | `1m` | Polling interval for the master API collection item. |
| `{$IMMICH.API.TIMEOUT}` | `30s` | Timeout for the master API collection item. |
| `{$IMMICH.NODATA}` | `10m` | No-data window for availability triggers. |
| `{$IMMICH.API.ERRORS.WARN}` | `0` | Allowed failed endpoint count before warning. |
| `{$IMMICH.STORAGE.USED.WARN}` | `80` | Storage usage warning threshold in percent. |
| `{$IMMICH.STORAGE.USED.HIGH}` | `90` | Storage usage high threshold in percent. |
| `{$IMMICH.STORAGE.FREE.MIN}` | `5G` | Minimum acceptable free storage reported by Immich. |
| `{$IMMICH.JOBS.FAILED.WARN}` | `0` | Allowed total failed jobs before warning. |
| `{$IMMICH.JOBS.WAITING.WARN}` | `100` | Total waiting-job threshold. |
| `{$IMMICH.JOBS.DELAYED.WARN}` | `100` | Total delayed-job threshold. |
| `{$IMMICH.JOBS.PAUSED.WARN}` | `0` | Allowed number of paused queues before warning. |
| `{$IMMICH.QUEUE.FAILED.WARN}` | `0` | Per-queue failed-job threshold. |
| `{$IMMICH.QUEUE.WAITING.WARN}` | `100` | Per-queue waiting-job threshold. |
| `{$IMMICH.QUEUE.DELAYED.WARN}` | `100` | Per-queue delayed-job threshold. |
| `{$IMMICH.QUEUE.PAUSED.ALERT}` | `1` | Set to `0` to disable paused-queue alerts. |
| `{$IMMICH.LIBRARY.REFRESH.MAX}` | `7d` | Maximum acceptable external-library refresh age. Set to `0` to disable. |
| `{$IMMICH.USER.QUOTA.WARN}` | `90` | User quota usage warning threshold in percent. |
| `{$IMMICH.VERSION.UPDATE.ALERT}` | `1` | Set to `0` to disable update-available notifications. |
| `{$IMMICH.VERSIONCHECK.MAXAGE}` | `2d` | Maximum acceptable age of Immich's version-check timestamp. |
| `{$IMMICH.LLD.LIBRARY.MATCHES}` | `.*` | Keep discovered external libraries whose names match this regex. |
| `{$IMMICH.LLD.LIBRARY.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Drop discovered external libraries whose names match this regex. |
| `{$IMMICH.LLD.USER.STATUS.MATCHES}` | `active\|removing` | User statuses discovered by default. Deleted users are counted globally but not discovered. |
| `{$IMMICH.LLD.USER.NAME.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Drop discovered users whose names match this regex. |

## Collected Data

The template collects:

- service availability from `/server/ping`
- current and latest version, plus stale version-check state
- disk size, used space, free space and usage percentage
- global photo/video counts and media usage from `/server/statistics`
- album and memory counts visible to the API key user
- aggregate job counts and per-queue job counts
- external-library asset counts, usage and refresh age
- admin user counts, per-user usage, quota state and removal state

## Discovery

| Discovery rule | Description |
|----------------|-------------|
| `immich.queue.discovery` | Discovers Immich job queues from `/jobs`. |
| `immich.library.discovery` | Discovers external libraries from `/libraries`. |
| `immich.user.discovery` | Discovers users from `/admin/users?withDeleted=true`. |

## Triggers

- Service not responding
- One or more monitored API endpoints failed
- Update available
- Version-check state stale
- Storage usage high/critical and free space low
- Waiting, delayed, failed and paused job queues
- Users stuck in removing state
- User quota exceeded or high per-user quota usage
- External library not refreshed recently

## Notes and Limitations

- Queue counts use Immich's compact `/jobs` endpoint. The current OpenAPI specification marks it
  as deprecated, but the newer queue endpoint does not provide an equivalent all-queue counter
  view without many per-queue requests. If Immich removes `/jobs`, the API endpoint error trigger
  will surface it.
- Library monitoring covers Immich external libraries. The normal upload library is covered by
  global server statistics.
- Album and memory statistics are scoped to what the API key user can see.

## Feedback

Please open issues or pull requests in the community templates repository.
