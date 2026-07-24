# Immich by HTTP

## Overview

This template monitors an [Immich](https://immich.app/) server via the official HTTP API.

The template uses one Zabbix JavaScript master item to call the Immich API and then derives
availability, version, update, storage, global asset, album, job, library and user
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
   - `adminUser.read`

   `/server/ping` and `/server/version` are public in the OpenAPI specification.

3. Import `template_immich_by_http.yaml` into Zabbix.
4. Link **Immich by HTTP** to the host.
5. Set the required host macros listed below.

## Macros

### Required host macros

These macros must be set on the Zabbix host that has the **Immich by HTTP** template linked.
The master item builds the API base URL as:

```text
{$IMMICH.SCHEME}://{$IMMICH.URL.HOST}:{$IMMICH.PORT}{$IMMICH.API.PATH}
```

For a default Docker installation reachable at `http://immich.example.net:2283/api`, set:

| Macro | Example | Description |
|-------|---------|-------------|
| `{$IMMICH.URL.HOST}` | `immich.example.net` | Host name or IP address of the Immich server. Do not include `http://`, `https://`, a port, or `/api`. |
| `{$IMMICH.API.TOKEN}` | `SECRET_TEXT` | Immich API key sent in the `x-api-key` header. Store this as a Zabbix secret macro. Use a key created by an admin user so the admin-only statistics, jobs, libraries and users endpoints can be read. |

If your Immich URL does not use the defaults, also override these host macros:

| Macro | Default | When to change it |
|-------|---------|-------------------|
| `{$IMMICH.SCHEME}` | `http` | Set to `https` when Immich is exposed through TLS, for example behind a reverse proxy. |
| `{$IMMICH.PORT}` | `2283` | Set to the externally reachable TCP port. For a standard HTTPS reverse proxy this is usually `443`; if the proxy hides the port, set this macro to `443`. |
| `{$IMMICH.API.PATH}` | `/api` | Change only if Immich is published below a different API path. Keep the leading slash. |

Examples:

| Public Immich URL | Required macro values |
|-------------------|-----------------------|
| `http://192.0.2.10:2283/api` | `{$IMMICH.URL.HOST}=192.0.2.10`, keep defaults for scheme, port and API path. |
| `https://photos.example.net/api` | `{$IMMICH.URL.HOST}=photos.example.net`, `{$IMMICH.SCHEME}=https`, `{$IMMICH.PORT}=443`. |
| `https://example.net/immich/api` | `{$IMMICH.URL.HOST}=example.net`, `{$IMMICH.SCHEME}=https`, `{$IMMICH.PORT}=443`, `{$IMMICH.API.PATH}=/immich/api`. |

### Optional host macros

The remaining macros have defaults and only need to be changed for tuning intervals, thresholds,
trigger behavior or discovery filters.

| Macro | Default | Description |
|-------|---------|-------------|
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
| `{$IMMICH.QUEUE.PAUSED.ALERT}` | `true` | Set to `false` to disable paused-queue alerts. |
| `{$IMMICH.LIBRARY.REFRESH.ALERT}` | `true` | Set to `false` to disable stale external-library refresh alerts. |
| `{$IMMICH.LIBRARY.REFRESH.MAX}` | `7d` | Maximum acceptable external-library refresh age. |
| `{$IMMICH.USER.QUOTA.WARN}` | `90` | User quota usage warning threshold in percent. |
| `{$IMMICH.VERSION.UPDATE.ALERT}` | `true` | Set to `false` to disable update-available notifications. |
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
- album counts visible to the API key user
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
- Album statistics are scoped to what the API key user can see.

## Feedback

Please open issues or pull requests in the community templates repository.
