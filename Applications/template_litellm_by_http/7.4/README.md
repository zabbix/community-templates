
# LiteLLM by HTTP

## Overview

This template monitors a [LiteLLM](https://docs.litellm.ai/) proxy server over HTTP.

Prometheus metrics are scraped from the LiteLLM `/metrics/` endpoint by an HTTP-agent
master item and parsed with dependent items (Prometheus → JSON, then JSONPath).
Availability is taken from the unauthenticated `/health/liveliness` and `/health/readiness`
endpoints. Deployments are discovered from `/model/info`, which lists every configured
deployment with or without traffic, one per model + api_base.

## Requirements

Zabbix version: 7.4 and higher.

## Tested versions

This template has been tested on:

- LiteLLM v1.106.4 with the Prometheus callback enabled (openai-compatible deployments with an
  explicit `api_base`)
- Zabbix 7.4.16

## Configuration

> Zabbix should be configured according to the instructions in the
> [Templates out of the box](https://www.zabbix.com/documentation/7.4/manual/config/templates_out_of_the_box)
> section.

## Setup

On the LiteLLM proxy:

1. **Enable the Prometheus exporter**. In the proxy config:

   ```yaml
   litellm_settings:
     callbacks: ["prometheus"]
   ```

   Without this, `/metrics` is not registered and there is nothing to scrape.

2. **Create a virtual key for scraping and discovery.** Create one whose allowed routes
   include `/metrics` and `/model/info`:

   ```bash
   curl -sS https://<litellm-host>/key/generate \
     -H 'Authorization: Bearer <MASTER_KEY>' -H 'Content-Type: application/json' \
     -d '{"key_alias":"zabbix-metrics","allowed_routes":["/metrics","/model/info"]}'
   ```

   Use the `/metrics` path exactly (a `/metrics/*` wildcard does **not** match `/metrics`).
   `/model/info` lists only the models the key and its team may use, so set no `models`
   restriction on the key or its team. `require_auth_for_metrics_endpoint: false` opens
   `/metrics` only; `/model/info` still needs the key.

In Zabbix:

1. Import the template.
2. Create (or pick) a host for the proxy and add an **interface** whose DNS/IP is the LiteLLM
   host — the items use `{HOST.CONN}`.
3. Link the **LiteLLM by HTTP** template to the host.
4. Set the host macros — at minimum `{$LITELLM.API.TOKEN}`, and `{$LITELLM.SCHEME}` /
   `{$LITELLM.PORT}` / `{$LITELLM.METRICS.PATH}` if they differ from the defaults.

The metrics request always carries the key in the **`x-litellm-api-key`** header, leaving the
`Authorization` header free. If `/metrics` is *also* behind ingress HTTP Basic auth, both
layers coexist: set the master item's *Authentication* to **Basic** and fill
`{$LITELLM.METRICS.USER}` / `{$LITELLM.METRICS.PASSWORD}`.

The HTTP-agent items verify the TLS certificate and host name. For a private CA, add its root
to the directory set by `SSLCALocation` on the Zabbix server or proxy that polls the host (when
set, it replaces the system CA store). Plain HTTP via `{$LITELLM.SCHEME}` is not affected.

Triggers are chained so that a full-proxy outage does not fan out: **LiteLLM: Service is not
responding** is the root, and the readiness, database, scrape, latency, error-rate and
per-deployment triggers depend on it (with a few specific-cause refinements — e.g. *Readiness
status is not healthy* also depends on *Database is not connected*, and a deployment *partial
outage* depends on that deployment's *complete outage*). When the proxy is down you get one
High alert instead of a dozen.

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$LITELLM.API.TOKEN}|<p>LiteLLM virtual key allowed to call /metrics and /model/info, with no model restriction. Sent in the x-litellm-api-key header. (Secret)</p>|``|
|{$LITELLM.SCHEME}|<p>Request scheme: http or https.</p>|`https`|
|{$LITELLM.PORT}|<p>TCP port of the LiteLLM proxy.</p>|`443`|
|{$LITELLM.METRICS.PATH}|<p>Path of the Prometheus metrics endpoint. Keep the trailing slash.</p>|`/metrics/`|
|{$LITELLM.METRICS.USER}|<p>Optional username if the metrics endpoint is behind HTTP Basic auth (set the master item Authentication to Basic to use it).</p>|``|
|{$LITELLM.METRICS.PASSWORD}|<p>Optional password for HTTP Basic auth on the metrics endpoint. (Secret)</p>|``|
|{$LITELLM.HTTP.TIMEOUT}|<p>HTTP request timeout for the agent items.</p>|`10s`|
|{$LITELLM.METRICS.NODATA}|<p>Interval with no data after which availability/scrape triggers fire. Keep it well above the 1m item interval.</p>|`10m`|
|{$LITELLM.ERROR.IGNORE.STATUS}|<p>Proxy response status excluded from the error rate and counted as rate-limited instead.</p>|`429`|
|{$LITELLM.ERROR.RATE.WARN}|<p>Proxy request error-rate warning threshold, in percent.</p>|`5`|
|{$LITELLM.LATENCY.WARN}|<p>Average request latency warning threshold, in seconds.</p>|`10`|
|{$LITELLM.LATENCY.CRIT}|<p>Average request latency critical threshold, in seconds.</p>|`30`|
|{$LITELLM.DEPLOYMENT.ERROR.RATE.WARN}|<p>Per-deployment error-rate warning threshold, in percent.</p>|`10`|
|{$LITELLM.DEPLOYMENT.UNREPORTED.PERIOD}|<p>How long a discovered deployment may have no state series before the "state not reported" trigger fires.</p>|`2h`|
|{$LITELLM.LLD.MODEL.MATCHES}|<p>Discovered deployments whose model name matches this regex are kept.</p>|`.*`|
|{$LITELLM.LLD.MODEL.NOT_MATCHES}|<p>Discovered deployments whose model name matches this regex are dropped.</p>|`CHANGE_IF_NEEDED`|

## Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|LiteLLM: Get metrics|<p>Raw Prometheus payload from the LiteLLM /metrics/ endpoint, converted to JSON for dependent items.</p>|HTTP agent|litellm.metrics<p>**Preprocessing**: Prometheus to JSON</p>|
|LiteLLM: Get model info|<p>Raw JSON from /model/info: every configured deployment, with or without traffic.</p>|HTTP agent|litellm.model_info|
|LiteLLM: Service alive|<p>Liveliness probe (/health/liveliness). 1 = alive, 0 = bad response.</p>|HTTP agent|litellm.liveness<p>**Value map**: LiteLLM service state</p>|
|LiteLLM: Get readiness|<p>Raw JSON from the /health/readiness endpoint.</p>|HTTP agent|litellm.readiness.raw|
|LiteLLM: Readiness status|<p>Overall readiness status reported by /health/readiness.</p>|Dependent item|litellm.readiness.status<p>**Master item**: LiteLLM: Get readiness</p>|
|LiteLLM: Database connection|<p>Database connection state from /health/readiness.</p>|Dependent item|litellm.readiness.db<p>**Master item**: LiteLLM: Get readiness</p>|
|LiteLLM: Requests per second|<p>Client-side requests to the proxy, per second (all routes and keys).</p>|Dependent item|litellm.requests.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Failed requests per second|<p>Proxy-side failed responses per second, excluding the status in {$LITELLM.ERROR.IGNORE.STATUS} (rate-limit rejections by default).</p>|Dependent item|litellm.requests.failed.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Rate-limited requests per second|<p>Proxy requests rejected with the status in {$LITELLM.ERROR.IGNORE.STATUS} (429 rate limits by default), per second. Excluded from the error rate.</p>|Dependent item|litellm.requests.ratelimited.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: LLM API failures per second|<p>Failed LLM API calls per second as counted by LiteLLM, which includes requests rejected by its own rate limits.</p>|Dependent item|litellm.llm.failed.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Error rate|<p>Failed requests as a percentage of proxy requests, both excluding the status in {$LITELLM.ERROR.IGNORE.STATUS}.</p>|Calculated|litellm.error.ratio|
|LiteLLM: In-flight requests|<p>HTTP requests currently being processed across workers.</p>|Dependent item|litellm.in_flight<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Total tokens per second|<p>Total tokens (input + output) processed per second.</p>|Dependent item|litellm.tokens.total.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Input tokens per second|<p>Prompt/input tokens processed per second.</p>|Dependent item|litellm.tokens.input.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Output tokens per second|<p>Completion/output tokens produced per second.</p>|Dependent item|litellm.tokens.output.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Total spend|<p>Cumulative spend reported by the proxy across all keys.</p>|Dependent item|litellm.spend.total<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Request latency, sum rate|<p>Helper: per-second rate of the total request latency histogram sum.</p>|Dependent item|litellm.request.latency.sum.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Request latency, count rate|<p>Helper: per-second rate of the total request latency histogram count.</p>|Dependent item|litellm.request.latency.count.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Request latency, average|<p>Average end-to-end request latency over the last interval (total latency).</p>|Calculated|litellm.request.latency.avg|
|LiteLLM: LLM API latency, sum rate|<p>Helper: per-second rate of the upstream LLM API latency histogram sum.</p>|Dependent item|litellm.llm.latency.sum.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: LLM API latency, count rate|<p>Helper: per-second rate of the upstream LLM API latency histogram count.</p>|Dependent item|litellm.llm.latency.count.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: LLM API latency, average|<p>Average latency of upstream LLM API calls over the last interval.</p>|Calculated|litellm.llm.latency.avg|
|LiteLLM: Cache hits per second|<p>Cache hits per second.</p>|Dependent item|litellm.cache.hits.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Cache misses per second|<p>Cache misses per second.</p>|Dependent item|litellm.cache.misses.rate<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Cache hit ratio|<p>Cache hits as a percentage of all cache lookups over the last interval.</p>|Calculated|litellm.cache.hit.ratio|
|LiteLLM: Total users|<p>Number of users known to the proxy (requires DB-backed user tracking).</p>|Dependent item|litellm.total_users<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Teams count|<p>Number of teams known to the proxy.</p>|Dependent item|litellm.teams_count<p>**Master item**: LiteLLM: Get metrics</p>|

## Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|LiteLLM: Service is not responding|<p>The LiteLLM liveliness probe is failing or no data has been received.</p>|`last(/LiteLLM by HTTP/litellm.liveness)=0 or nodata(/LiteLLM by HTTP/litellm.liveness,{$LITELLM.METRICS.NODATA})=1`|High||
|LiteLLM: Readiness status is not healthy|<p>The proxy reports a readiness status other than "healthy".</p>|`last(/LiteLLM by HTTP/litellm.readiness.status)<>"healthy" and length(last(/LiteLLM by HTTP/litellm.readiness.status))>0`|Average|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p><p>- LiteLLM: Database is not connected</p>|
|LiteLLM: Database is not connected|<p>The proxy reports that its database is not connected.</p>|`last(/LiteLLM by HTTP/litellm.readiness.db)<>"connected" and length(last(/LiteLLM by HTTP/litellm.readiness.db))>0`|High|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p>|
|LiteLLM: Prometheus metrics are not being collected|<p>No data from the /metrics scrape. Check the endpoint, the API key, and that the prometheus callback is enabled.</p>|`nodata(/LiteLLM by HTTP/litellm.requests.rate,{$LITELLM.METRICS.NODATA})=1`|Warning|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p>|
|LiteLLM: Request error rate is high|<p>The proxy failed-request ratio, excluding the status in {$LITELLM.ERROR.IGNORE.STATUS}, has stayed above the threshold for 5 minutes.</p>|`min(/LiteLLM by HTTP/litellm.error.ratio,5m)>{$LITELLM.ERROR.RATE.WARN}`|Warning|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p><p>- LiteLLM: Prometheus metrics are not being collected</p>|
|LiteLLM: Request latency is critically high|<p>Average request latency has stayed above the critical threshold for 5 minutes.</p>|`min(/LiteLLM by HTTP/litellm.request.latency.avg,5m)>{$LITELLM.LATENCY.CRIT}`|High|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p>|
|LiteLLM: Request latency is high|<p>Average request latency has stayed above the warning threshold for 5 minutes.</p>|`min(/LiteLLM by HTTP/litellm.request.latency.avg,5m)>{$LITELLM.LATENCY.WARN}`|Warning|<p>**Depends on**:</p><p>- LiteLLM: Request latency is critically high</p>|

## LLD rule Deployments discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|LiteLLM: Deployments discovery|<p>Discovers configured LLM deployments from /model/info, one per model + api_base (aliases collapse into {#ALIASES}). A removed deployment is deleted after a day, which closes its problems.</p>|Dependent item|litellm.deployment.discovery<p>**Master item**: LiteLLM: Get model info</p><p>**Preprocessing**: JavaScript</p><p>LLD macros: `{#MODEL}`, `{#API_BASE}`, `{#PROVIDER}`, `{#ALIASES}`</p>|

### Item prototypes for Deployments discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|LiteLLM: Deployment state [{#MODEL}]|<p>Deployment health: 0 = healthy, 1 = partial outage, 2 = complete outage, 3 = not reported (no traffic since the last proxy restart). Worst state across the model names routed here: {#ALIASES}.</p>|Dependent item|litellm.deployment.state["{#MODEL}","{#API_BASE}"]<p>**Master item**: LiteLLM: Get metrics</p><p>**Value map**: LiteLLM deployment state</p>|
|LiteLLM: Deployment successful responses per second [{#MODEL}]|<p>Successful upstream responses per second for this deployment.</p>|Dependent item|litellm.deployment.success.rate["{#MODEL}","{#API_BASE}"]<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Deployment failed responses per second [{#MODEL}]|<p>Failed upstream responses per second for this deployment.</p>|Dependent item|litellm.deployment.failure.rate["{#MODEL}","{#API_BASE}"]<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Deployment total requests per second [{#MODEL}]|<p>Total upstream requests per second for this deployment.</p>|Dependent item|litellm.deployment.total.rate["{#MODEL}","{#API_BASE}"]<p>**Master item**: LiteLLM: Get metrics</p>|
|LiteLLM: Deployment error rate [{#MODEL}]|<p>Failed responses as a percentage of total requests for this deployment.</p>|Calculated|litellm.deployment.failure.ratio["{#MODEL}","{#API_BASE}"]|
|LiteLLM: Deployment cooldowns per second [{#MODEL}]|<p>Rate at which this deployment is cooled down by the router (provider errors / rate limits).</p>|Dependent item|litellm.deployment.cooled_down.rate["{#MODEL}","{#API_BASE}"]<p>**Master item**: LiteLLM: Get metrics</p>|

### Trigger prototypes for Deployments discovery

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|LiteLLM: Deployment [{#MODEL}] is in complete outage|<p>Deployment {#MODEL} ({#API_BASE}) reports a complete outage.</p>|`last(/LiteLLM by HTTP/litellm.deployment.state["{#MODEL}","{#API_BASE}"])=2`|High|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p>|
|LiteLLM: Deployment [{#MODEL}] is in partial outage|<p>Deployment {#MODEL} ({#API_BASE}) reports a partial outage.</p>|`last(/LiteLLM by HTTP/litellm.deployment.state["{#MODEL}","{#API_BASE}"])=1`|Warning|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p><p>- LiteLLM: Deployment [{#MODEL}] is in complete outage</p>|
|LiteLLM: Deployment [{#MODEL}] state not reported|<p>The proxy has no state series for {#MODEL} ({#API_BASE}): it has served no request since the last proxy restart, so its health is unknown here.</p>|`min(/LiteLLM by HTTP/litellm.deployment.state["{#MODEL}","{#API_BASE}"],{$LITELLM.DEPLOYMENT.UNREPORTED.PERIOD})=3`|Info|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p>|
|LiteLLM: Deployment [{#MODEL}] error rate is high|<p>Upstream error ratio for deployment {#MODEL} ({#API_BASE}) has stayed high for 5 minutes.</p>|`min(/LiteLLM by HTTP/litellm.deployment.failure.ratio["{#MODEL}","{#API_BASE}"],5m)>{$LITELLM.DEPLOYMENT.ERROR.RATE.WARN}`|Average|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p>|
|LiteLLM: Deployment [{#MODEL}] is being cooled down|<p>The router has been cooling down deployment {#MODEL} ({#API_BASE}), indicating upstream errors or rate limiting.</p>|`min(/LiteLLM by HTTP/litellm.deployment.cooled_down.rate["{#MODEL}","{#API_BASE}"],5m)>0`|Warning|<p>**Depends on**:</p><p>- LiteLLM: Service is not responding</p>|

## Value maps

|Name|Value|Mapped to|
|----|-----|---------|
|LiteLLM service state|0|Down|
|LiteLLM service state|1|Up|
|LiteLLM deployment state|0|Healthy|
|LiteLLM deployment state|1|Partial outage|
|LiteLLM deployment state|2|Complete outage|
|LiteLLM deployment state|3|Not reported|

## Dashboards and graphs

The template ships a **LiteLLM overview** dashboard and the following host-level graphs, all
also usable standalone:

- LiteLLM: Output tokens per second
- LiteLLM: Requests and errors
- LiteLLM: Token throughput
- LiteLLM: Latency
- LiteLLM: Cache operations
- LiteLLM: Deployment throughput [{#MODEL} @ {#API_BASE}] (graph prototype)

## Notes & limitations

- Counters carry the Prometheus client `_total` suffix; rates use *change per second*.
- Counter metrics with no data yet are treated as `0`.
- Some gauges only populate with certain features: `litellm_remaining_requests/tokens_metric`
  need upstream `x-ratelimit-*` headers; `litellm_total_users` / `litellm_teams_count` need
  DB-backed user/team tracking. They report `0` until then.
- Requests rejected by LiteLLM's own rate limits (status 429) are client-side policy, so the
  error rate leaves out `{$LITELLM.ERROR.IGNORE.STATUS}` and *Rate-limited requests per second*
  counts them. *LLM API failures per second* still includes them, because LiteLLM's metric
  carries no status label. They never reach a discovered deployment's items.
- Model names routed to the same backend (model + api_base) collapse into one discovered
  deployment; their series are summed and the state is the worst across them.
- Per-deployment items match the `litellm_model_name` and `api_base` metric labels against
  `/model/info`: the provider prefix and trailing slashes are stripped to match. Tested only with
  openai-compatible deployments that set `api_base` explicitly.
- LiteLLM keeps one state series per deployment id and updates it only on traffic, so a rarely
  used model name keeps its last state (e.g. partial outage) until its next request.
- If the key may not call `/model/info` (HTTP 403), *LiteLLM: Get model info* turns unsupported
  and discovery stops; already discovered deployments are kept.

## Upgrading from 7.4-0

- Allow the key to call `/model/info` before importing, or discovery stops (see above).
- TLS verification is now on. Make sure the polling server or proxy trusts the proxy's
  certificate, or every HTTP-agent item turns unsupported.
- Per-deployment item keys changed from `[<model_id>]` to `["<model>","<api_base>"]`. The old
  per-deployment items are disabled at once and deleted after 1d, with their history.

## Author

@nikosch86

## Feedback

Please report any issues with the template at the source repository:
[`https://github.com/nikosch86/zabbix-litellm`](https://github.com/nikosch86/zabbix-litellm)
