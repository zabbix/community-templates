# Servarr by HTTP

## Overview

Templates to monitor the Servarr stack by HTTP, without external scripts: [Prowlarr](https://prowlarr.com), [Sonarr](https://sonarr.tv), [Radarr](https://radarr.video), [Lidarr](https://lidarr.audio), [Bazarr](https://www.bazarr.media) and [Overseerr](https://overseerr.dev).

All templates are in one file, `template_servarr_by_http.yaml`:

|Template|Use|
|--------|---|
|`Servarr by HTTP`|Links all application templates, for hosts running the whole stack|
|`Prowlarr by HTTP`|Prowlarr and availability of each indexer|
|`Sonarr by HTTP`|Sonarr|
|`Radarr by HTTP`|Radarr|
|`Lidarr by HTTP`|Lidarr|
|`Bazarr by HTTP`|Bazarr and availability of each subtitle provider|
|`Overseerr by HTTP`|Overseerr|

If you run only a part of the stack, link only the application templates you need to the host, not `Servarr by HTTP`.
Do not link `Servarr by HTTP` together with an application template: Zabbix refuses to link a template twice.

## Requirements

Zabbix version: 7.0 and higher.

## Tested versions

Tested on Zabbix 7.0.32 against a mock of the APIs, built from the Prowlarr OpenAPI specification.

## Setup

1. Import `template_servarr_by_http.yaml`.
2. Link `Servarr by HTTP` or the application templates you need to a host. No agent interface is required.
3. Set the URL and API key macros of each linked application on the host. The API key is in Settings > General of each application.

## Prowlarr indexers

Indexer state comes from `/api/v1/indexerstatus`, so it reflects failures of the queries Prowlarr already makes. The template does not test indexers itself, as this would use up tracker limits, so an indexer nobody queries stays `Available`.

Prowlarr unblocks a failed indexer on a backoff timer and blocks it again on the next failure. The problem therefore opens after one uninterrupted block of `{$PROWLARR.INDEXER.BLOCKED.TIMEOUT}` and resolves only after `{$PROWLARR.INDEXER.RECOVERY.TIMEOUT}` without a block. Both macros support the indexer name as context.

Blocks grow step by step: 1, 5, 15, 30 minutes and longer. With the default `15m` the first block long enough is the third one, so the problem usually opens 30 to 60 minutes after an indexer goes down. For faster alerts set `{$PROWLARR.INDEXER.BLOCKED.TIMEOUT}` to `5m`, at the cost of more short problems.

The Prowlarr health item skips `IndexerStatusCheck` and `IndexerLongTermStatusCheck`, since indexers have their own triggers.

## Known limitations

- `Prowlarr: All indexers are unavailable` counts blocked indexers including ones disabled while blocked, so it can fire too early in that case.
- `Queue has not been empty for too long` fires on a busy queue too, not only on a stuck one.

## Template Prowlarr by HTTP

### Macros

|Name|Description|Default|
|----|-----------|-------|
|{$PROWLARR.API.KEY}|Prowlarr API key.||
|{$PROWLARR.API.NODATA.TIMEOUT}|No API data for this long raises a problem.|`15m`|
|{$PROWLARR.HTTP.PROXY}|HTTP proxy for requests, if needed.||
|{$PROWLARR.INDEXER.BLOCKED.TIMEOUT}|How long an indexer stays blocked before the problem. Supports context.|`15m`|
|{$PROWLARR.INDEXER.RECOVERY.TIMEOUT}|How long an indexer stays unblocked before recovery. Supports context.|`1h`|
|{$PROWLARR.STATUS.NODATA.TIMEOUT}|No response for this long raises a problem.|`3m`|
|{$PROWLARR.URL}|Prowlarr URL.|`http://prowlarr:9696`|

### Items

|Name|Description|Type|Key|
|----|-----------|----|---|
|Prowlarr: Service status|Response of the ping endpoint.|HTTP agent|prowlarr.service.status|
|Prowlarr: Health issues|Issues from the health page.|HTTP agent|prowlarr.health|
|Prowlarr: Update status|Whether a newer version can be installed.|HTTP agent|prowlarr.update.status|
|Prowlarr: Get indexers|Enabled indexers.|HTTP agent|prowlarr.indexers.get|
|Prowlarr: Enabled indexers|Number of enabled indexers.|Dependent item|prowlarr.indexers.enabled|
|Prowlarr: Get blocked indexers|Indexers blocked after failures.|HTTP agent|prowlarr.indexer_status.get|
|Prowlarr: Blocked indexers|Number of blocked indexers.|Dependent item|prowlarr.indexers.blocked|

### Triggers

|Name|Description|Severity|
|----|-----------|--------|
|Prowlarr: Service is unavailable|The service does not respond to ping.|High|
|Prowlarr: Health check reports an error|See operational data for details.|Average|
|Prowlarr: Health check reports a warning|See operational data for details.|Warning|
|Prowlarr: Update is available|A newer version can be installed.|Info|
|Prowlarr: All indexers are unavailable|Every enabled indexer has been blocked for {$PROWLARR.INDEXER.BLOCKED.TIMEOUT}.|High|
|Prowlarr: Failed to fetch API data|No API data for {$PROWLARR.API.NODATA.TIMEOUT}. Check the API key.|Average|

### LLD rule Indexer discovery

|Name|Description|Type|Key|
|----|-----------|----|---|
|Prowlarr: Indexer [{#NAME}]: State|Whether Prowlarr has blocked the indexer.|Dependent item|prowlarr.indexer.state[{#ID}]|

|Trigger prototype|Description|Severity|
|-----------------|-----------|--------|
|Prowlarr: Indexer [{#NAME}]: Unavailable|The indexer has been blocked for {$PROWLARR.INDEXER.BLOCKED.TIMEOUT:"{#NAME}"}.|Average|

## Template Sonarr by HTTP

### Macros

|Name|Description|Default|
|----|-----------|-------|
|{$SONARR.API.KEY}|Sonarr API key.||
|{$SONARR.API.NODATA.TIMEOUT}|No API data for this long raises a problem.|`15m`|
|{$SONARR.HTTP.PROXY}|HTTP proxy for requests, if needed.||
|{$SONARR.QUEUE.TIMEOUT}|How long the queue may stay non-empty.|`1h`|
|{$SONARR.STATUS.NODATA.TIMEOUT}|No response for this long raises a problem.|`3m`|
|{$SONARR.URL}|Sonarr URL.|`http://sonarr:8989`|

### Items

|Name|Description|Type|Key|
|----|-----------|----|---|
|Sonarr: Service status|Response of the ping endpoint.|HTTP agent|sonarr.service.status|
|Sonarr: Health issues|Issues from the health page.|HTTP agent|sonarr.health|
|Sonarr: Update status|Whether a newer version can be installed.|HTTP agent|sonarr.update.status|
|Sonarr: Queue size|Items in the download queue.|HTTP agent|sonarr.queue.size|
|Sonarr: Missing items|Monitored items without a file.|HTTP agent|sonarr.wanted.missing|

### Triggers

|Name|Description|Severity|
|----|-----------|--------|
|Sonarr: Service is unavailable|The service does not respond to ping.|High|
|Sonarr: Health check reports an error|See operational data for details.|Average|
|Sonarr: Health check reports a warning|See operational data for details.|Warning|
|Sonarr: Update is available|A newer version can be installed.|Info|
|Sonarr: Queue has not been empty for too long|The queue has not been empty for {$SONARR.QUEUE.TIMEOUT}.|Warning|
|Sonarr: Missing items are wanted|Monitored items have no file.|Info|
|Sonarr: Failed to fetch API data|No API data for {$SONARR.API.NODATA.TIMEOUT}. Check the API key.|Average|

## Template Radarr by HTTP

### Macros

|Name|Description|Default|
|----|-----------|-------|
|{$RADARR.API.KEY}|Radarr API key.||
|{$RADARR.API.NODATA.TIMEOUT}|No API data for this long raises a problem.|`15m`|
|{$RADARR.HTTP.PROXY}|HTTP proxy for requests, if needed.||
|{$RADARR.QUEUE.TIMEOUT}|How long the queue may stay non-empty.|`1h`|
|{$RADARR.STATUS.NODATA.TIMEOUT}|No response for this long raises a problem.|`3m`|
|{$RADARR.URL}|Radarr URL.|`http://radarr:7878`|

### Items

|Name|Description|Type|Key|
|----|-----------|----|---|
|Radarr: Service status|Response of the ping endpoint.|HTTP agent|radarr.service.status|
|Radarr: Health issues|Issues from the health page.|HTTP agent|radarr.health|
|Radarr: Update status|Whether a newer version can be installed.|HTTP agent|radarr.update.status|
|Radarr: Queue size|Items in the download queue.|HTTP agent|radarr.queue.size|
|Radarr: Missing items|Monitored items without a file.|HTTP agent|radarr.wanted.missing|

### Triggers

|Name|Description|Severity|
|----|-----------|--------|
|Radarr: Service is unavailable|The service does not respond to ping.|High|
|Radarr: Health check reports an error|See operational data for details.|Average|
|Radarr: Health check reports a warning|See operational data for details.|Warning|
|Radarr: Update is available|A newer version can be installed.|Info|
|Radarr: Queue has not been empty for too long|The queue has not been empty for {$RADARR.QUEUE.TIMEOUT}.|Warning|
|Radarr: Missing items are wanted|Monitored items have no file.|Info|
|Radarr: Failed to fetch API data|No API data for {$RADARR.API.NODATA.TIMEOUT}. Check the API key.|Average|

## Template Lidarr by HTTP

### Macros

|Name|Description|Default|
|----|-----------|-------|
|{$LIDARR.API.KEY}|Lidarr API key.||
|{$LIDARR.API.NODATA.TIMEOUT}|No API data for this long raises a problem.|`15m`|
|{$LIDARR.HTTP.PROXY}|HTTP proxy for requests, if needed.||
|{$LIDARR.QUEUE.TIMEOUT}|How long the queue may stay non-empty.|`1h`|
|{$LIDARR.STATUS.NODATA.TIMEOUT}|No response for this long raises a problem.|`3m`|
|{$LIDARR.URL}|Lidarr URL.|`http://lidarr:8686`|

### Items

|Name|Description|Type|Key|
|----|-----------|----|---|
|Lidarr: Service status|Response of the ping endpoint.|HTTP agent|lidarr.service.status|
|Lidarr: Health issues|Issues from the health page.|HTTP agent|lidarr.health|
|Lidarr: Update status|Whether a newer version can be installed.|HTTP agent|lidarr.update.status|
|Lidarr: Queue size|Items in the download queue.|HTTP agent|lidarr.queue.size|
|Lidarr: Missing items|Monitored items without a file.|HTTP agent|lidarr.wanted.missing|

### Triggers

|Name|Description|Severity|
|----|-----------|--------|
|Lidarr: Service is unavailable|The service does not respond to ping.|High|
|Lidarr: Health check reports an error|See operational data for details.|Average|
|Lidarr: Health check reports a warning|See operational data for details.|Warning|
|Lidarr: Update is available|A newer version can be installed.|Info|
|Lidarr: Queue has not been empty for too long|The queue has not been empty for {$LIDARR.QUEUE.TIMEOUT}.|Warning|
|Lidarr: Missing items are wanted|Monitored items have no file.|Info|
|Lidarr: Failed to fetch API data|No API data for {$LIDARR.API.NODATA.TIMEOUT}. Check the API key.|Average|

## Template Bazarr by HTTP

### Macros

|Name|Description|Default|
|----|-----------|-------|
|{$BAZARR.API.KEY}|Bazarr API key.||
|{$BAZARR.API.NODATA.TIMEOUT}|No API data for this long raises a problem.|`15m`|
|{$BAZARR.HTTP.PROXY}|HTTP proxy for requests, if needed.||
|{$BAZARR.PROVIDER.THROTTLED.TIMEOUT}|How long a provider stays throttled before the problem. Supports context.|`15m`|
|{$BAZARR.STATUS.NODATA.TIMEOUT}|No response for this long raises a problem.|`3m`|
|{$BAZARR.URL}|Bazarr URL.|`http://bazarr:6767`|

### Items

|Name|Description|Type|Key|
|----|-----------|----|---|
|Bazarr: Service status|Response of the ping endpoint.|HTTP agent|bazarr.service.status|
|Bazarr: Health issues|Issues from the status page.|HTTP agent|bazarr.health|
|Bazarr: Update status|Whether a newer version is available.|HTTP agent|bazarr.update.status|
|Bazarr: Missing subtitles|Subtitles wanted for episodes and movies.|HTTP agent|bazarr.subtitles.missing|
|Bazarr: Get providers|Enabled subtitle providers and their state.|HTTP agent|bazarr.providers.get|

### Triggers

|Name|Description|Severity|
|----|-----------|--------|
|Bazarr: Service is unavailable|The service does not respond to ping.|High|
|Bazarr: Health check reports an issue|See operational data for details.|Warning|
|Bazarr: Update is available|A newer version is available.|Info|
|Bazarr: Subtitles are missing|Episodes or movies have no wanted subtitles.|Info|
|Bazarr: Failed to fetch API data|No API data for {$BAZARR.API.NODATA.TIMEOUT}. Check the API key.|Average|

### LLD rule Provider discovery

|Name|Description|Type|Key|
|----|-----------|----|---|
|Bazarr: Provider [{#NAME}]: State|Whether Bazarr has throttled the provider.|Dependent item|bazarr.provider.state["{#NAME}"]|

|Trigger prototype|Description|Severity|
|-----------------|-----------|--------|
|Bazarr: Provider [{#NAME}]: Unavailable|The provider has been throttled for {$BAZARR.PROVIDER.THROTTLED.TIMEOUT:"{#NAME}"}.|Warning|

## Template Overseerr by HTTP

### Macros

|Name|Description|Default|
|----|-----------|-------|
|{$OVERSEERR.API.KEY}|Overseerr API key.||
|{$OVERSEERR.API.NODATA.TIMEOUT}|No API data for this long raises a problem.|`15m`|
|{$OVERSEERR.HTTP.PROXY}|HTTP proxy for requests, if needed.||
|{$OVERSEERR.ISSUES.OPEN.MAX.HIGH}|Open issues for the average severity problem.|`10`|
|{$OVERSEERR.ISSUES.OPEN.MAX.WARN}|Open issues for the warning problem.|`1`|
|{$OVERSEERR.STATUS.NODATA.TIMEOUT}|No response for this long raises a problem.|`3m`|
|{$OVERSEERR.URL}|Overseerr URL.|`http://overseerr:5055`|

### Items

|Name|Description|Type|Key|
|----|-----------|----|---|
|Overseerr: Get status|Status endpoint response.|HTTP agent|overseerr.status.get|
|Overseerr: Service status|Set when the status endpoint responds.|Dependent item|overseerr.service.status|
|Overseerr: Update status|Whether a newer version is available.|Dependent item|overseerr.update.status|
|Overseerr: Version|Installed version.|Dependent item|overseerr.version|
|Overseerr: Open issues|Number of open issues.|HTTP agent|overseerr.issues.open|
|Overseerr: Pending requests|Number of pending requests.|HTTP agent|overseerr.requests.pending|

### Triggers

|Name|Description|Severity|
|----|-----------|--------|
|Overseerr: Service is unavailable|The service does not respond.|High|
|Overseerr: Update is available|A newer version is available.|Info|
|Overseerr: Too many open issues|Open issues reached {$OVERSEERR.ISSUES.OPEN.MAX.HIGH}.|Average|
|Overseerr: There are open issues|Open issues reached {$OVERSEERR.ISSUES.OPEN.MAX.WARN}.|Warning|
|Overseerr: Requests are pending|Requests are waiting for approval.|Info|
|Overseerr: Failed to fetch API data|No API data for {$OVERSEERR.API.NODATA.TIMEOUT}. Check the API key.|Average|

## Author

noakky

## Credits

Started from the templates in [ramboramjad/servarr-stack-monitoring](https://github.com/ramboramjad/servarr-stack-monitoring), MIT License, Copyright (c) 2025 ramboramjad.

## License

MIT
