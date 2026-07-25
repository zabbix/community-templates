# Audiobookshelf by HTTP

Zabbix 7.4 template for monitoring an [audiobookshelf](https://www.audiobookshelf.org/) server through its HTTP API. It requires no Zabbix agent on the audiobookshelf host and no external scripts.


## What is monitored

| Area | Metrics |
|---|---|
| Availability | Core API status, administrative endpoint status, collection errors, collection time |
| Performance | Slowest API request duration and endpoint |
| Server | Version, initialization state, configured language |
| Users | Total, enabled and locked accounts |
| Playback | Open user playback sessions and open share sessions |
| Work | Active server tasks and queued metadata tasks |
| Backups | Count, newest backup timestamp and size; missing/stale backup triggers |
| Libraries (LLD) | Type, media items, audio files/episodes, total duration, total size, folders, filesystem watcher, auto-scan schedule, last scan/version, last update and metadata issue count |

The collection master item requests these endpoints:

```text
/status
/api/libraries?include=stats
/api/users
/api/sessions/open
/api/tasks?include=queue
/api/backups
```

Library discovery creates an additional hourly request to `/api/libraries/<id>?include=filterdata` for each discovered library. This provides the issue count without storing the much larger filter-data response.

The master script converts all responses into a small aggregate. In particular, the raw `/api/users` response can contain API tokens and is **never stored** in Zabbix.

## Requirements

- Zabbix 7.4 or newer.
- audiobookshelf reachable from the Zabbix server or the proxy that monitors the host.
- A dedicated audiobookshelf API key assigned to an admin/root account, or a legacy admin/root user token. Administrative rights are required for user, open-session and backup metrics.

The upstream API documentation currently warns that it is out of date. This template therefore uses the documented stable endpoints and verifies their current behavior against the audiobookshelf server source.

## Installation

1. Import `template_audiobookshelf_by_http.yaml` in **Data collection → Templates → Import**.
2. Create a host for the audiobookshelf instance. No host interface is required by the template.
3. Link **Audiobookshelf by HTTP** to the host.
4. Override these host macros:

   - `{$AUDIOBOOKSHELF.URL}` — complete URL such as `https://abs.example.com`, without a trailing slash.
   - `{$AUDIOBOOKSHELF.API.TOKEN}` — dedicated API key assigned to an admin/root user (or a legacy user token); keep it as a secret macro.

5. Optionally set `{$AUDIOBOOKSHELF.HTTP.PROXY}` when the Zabbix server/proxy must use an HTTP proxy.
6. Use **Execute now** on `Audiobookshelf: Get data`, then check **Monitoring → Latest data**.

On current audiobookshelf versions, create a dedicated key under **Settings → API Keys** and assign it to an admin/root account. Older installations can use the token shown on the admin/root account under **Settings → Users**.

## Important macros

| Macro | Default | Purpose |
|---|---:|---|
| `{$AUDIOBOOKSHELF.UPDATE.INTERVAL}` | `5m` | Server-wide collection interval |
| `{$AUDIOBOOKSHELF.ISSUES.UPDATE.INTERVAL}` | `1h` | Per-library issue check interval |
| `{$AUDIOBOOKSHELF.HTTP.TIMEOUT}` | `30s` | Request/script timeout |
| `{$AUDIOBOOKSHELF.RESPONSE.TIME.WARN}` | `5000` | Slow API threshold in milliseconds |
| `{$AUDIOBOOKSHELF.BACKUP.MAX.AGE}` | `2d` | Maximum backup age; `0` disables backup alerts |
| `{$AUDIOBOOKSHELF.LIBRARY.ISSUES.WARN}` | `0` | Allowed issue count before warning |
| `{$AUDIOBOOKSHELF.LIBRARY.SCAN.MAX.AGE}` | `0` | Maximum full-scan age; a duration such as `7d` enables the alert |
| `{$AUDIOBOOKSHELF.LIBRARY.WATCHER.TRIGGER}` | `0` | Set to `1` to alert on disabled library watchers |
| `{$AUDIOBOOKSHELF.LLD.LIBRARY.MATCHES}` | `^.*$` | Libraries included by discovery |
| `{$AUDIOBOOKSHELF.LLD.LIBRARY.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Libraries excluded by discovery |

## Trigger behavior

- API failure is raised only after the core endpoints have failed throughout a 10-minute window.
- Administrative endpoint failure is separate, so an insufficient token is easy to distinguish from a server outage.
- Locked users produce a security warning.
- No backup and stale backup alerts can both be disabled by setting `{$AUDIOBOOKSHELF.BACKUP.MAX.AGE}` to `0`.
- A disabled library watcher is recorded but does not alert by default, because disabling it can be intentional.
- Full-scan age is recorded but does not alert by default, because the filesystem watcher can keep a library current without regular full scans.
- Any library issue count above `{$AUDIOBOOKSHELF.LIBRARY.ISSUES.WARN}` produces a warning.

## Notes

- Library duration is returned in seconds and size in bytes.
- For podcast libraries, “audio files” represents podcast episodes with audio.
- `lastUpdate` is the timestamp reported by audiobookshelf for the library; it is not treated as a scan freshness guarantee.
- Hardware, container, filesystem capacity, CPU and memory are outside the audiobookshelf API. Monitor those with the appropriate OS, container or storage template on the underlying host.
- The official API reference is at [api.audiobookshelf.org](https://api.audiobookshelf.org/).
