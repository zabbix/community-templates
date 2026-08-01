# catc-proxy

Small C reverse proxy for **Zabbix 7.0+** to **Cisco Catalyst Center**.

This proxy exists to solve the Catalyst Center authentication flow in a way that keeps Zabbix HTTP items simple. Zabbix sends a normal HTTP request to the proxy. The proxy then:

- reads the target Catalyst Center from headers
- reads Catalyst Center credentials from the inbound Basic Auth header
- authenticates to Catalyst Center
- caches the returned token in memory
- forwards the requested API call upstream
- returns the final Catalyst Center response back to Zabbix

It is designed to be small, explicit, and easy to debug with `docker logs`.

---

## What it does

- Accepts inbound HTTP requests from Zabbix
- Uses `Authorization: Basic ...` from the caller for Catalyst Center login
- Uses a header such as `X-CatC-Host` to decide which Catalyst Center to contact
- Authenticates to Catalyst Center at:

POST /dna/system/api/v1/auth/token

- Caches the token per `(host, username)`
- Reuses the token until expiry is near
- If an upstream request returns `401` or `403`, it silently re-authenticates once and retries once
- Forwards request method, path, query string, body, and most headers
- Supports runtime log-level changes without container restart
- Can optionally auto-paginate selected Catalyst Center responses when enabled

---

## Intended use

This proxy is intended to sit next to the Zabbix Template for Catalyst Center.

Typical flow:

```Zabbix HTTP item 
   `-> catc-proxy`  
      `-> Cisco Catalyst Center`  
         `-> JSON response back through proxy`
```

Inbound side:

- usually plain HTTP
- typically local container networking or localhost

Outbound side:

- usually HTTPS to Catalyst Center
- TLS verification can be disabled for lab/PoC use

---

## Request contract

### Required inbound headers

```
Authorization: Basic <base64(username:password)>  
X-CatC-Host: <catalyst-center-host-or-ip>
```

### Optional inbound headers
```
X-CatC-Port: 443  
X-Forwarded-Proto: https  
X-Original-URI: /dna/intent/api/v1/...
```
### Notes

- `Authorization` is used by the proxy to authenticate to Catalyst Center
- `X-CatC-Host` selects the target Catalyst Center instance
- `X-CatC-Port` defaults to `443`
- `X-Forwarded-Proto` defaults to `https`
- `X-Original-URI` can be used when exact path + query preservation is required
- If `X-Original-URI` is not provided, the proxy rebuilds the query string from the inbound request

---

## Runtime configuration

Environment variables:
```
LISTEN_ADDR              default: 0.0.0.0  
LISTEN_PORT              default: 8080  
CATC_HOST_HEADER         default: X-CatC-Host  
DEFAULT_TARGET_SCHEME    default: https  
DEFAULT_TARGET_PORT      default: 443  
INSECURE_SSL             default: true  
UPSTREAM_TIMEOUT_SEC     default: 30  
TOKEN_SKEW_SEC           default: 30  
LOG_LEVEL                default: info   (error|info|debug)  
ADMIN_TOKEN              default: empty
```
### Optional pagination settings

Pagination is **disabled by default** and only exists to help with large Catalyst Center datasets in a controlled way.
```
AUTO_PAGINATE            default: false  
PAGINATE_PAGE_SIZE       default: 500  
PAGINATE_MAX_PAGES       default: 20  
PAGINATE_MAX_RECORDS     default: 5000  
PAGINATE_MAX_SECONDS     default: 25
```
### Pagination behavior

When enabled, the proxy will only attempt auto-pagination when all of the following are true:

- method is `GET`
- endpoint is `/dna/intent/api/v1/device-health`
- the first response looks like pageable JSON
- the response contains a `response` array and `totalCount`

Safety rules:

- disabled unless explicitly enabled
- only active for known-safe scope
- hard limits on pages, records, and total time
- fail-closed on pagination errors rather than silently returning partial merged data
- if caller already asks for a later page with `offset > 1`, auto-pagination is skipped

---

## Logging

The proxy logs to stdout, so in Docker you can inspect it with:
```
docker logs -f catc-proxy
```
### Log levels

Supported levels:

error  
info  
debug

### Set log level at startup

docker run --rm -p 8080:8080 \  
  -e LOG_LEVEL=debug \  
  catc-proxy:latest

### Change log level at runtime without restart

If `ADMIN_TOKEN` is set, you can change the level live:
```
curl -X POST \  
  -H 'X-CatC-Admin-Token: changeme' \  
  'http://127.0.0.1:8080/__admin/loglevel?level=debug'
```
Examples:
```
curl -X POST \  
  -H 'X-CatC-Admin-Token: changeme' \  
  'http://127.0.0.1:8080/__admin/loglevel?level=info'
```
```
curl -X POST \  
  -H 'X-CatC-Admin-Token: changeme' \  
  'http://127.0.0.1:8080/__admin/loglevel?level=error'
```
### What debug logging is useful for

At `debug` level the proxy is intended to show enough detail to troubleshoot:

- inbound headers
- rebuilt path and query string
- upstream URL
- forwarded headers
- auth flow
- response status
- response body previews
- pagination decisions and page fetch progress

---

## Curl examples

## 1. Simple example

Fetch network devices from Catalyst Center through the proxy:

curl -s \  
  -H "Authorization: Basic $(printf 'admin:Wert432!' | base64)" \  
  -H 'X-CatC-Host: 10.101.1.141' \  
  -H 'X-CatC-Port: 443' \  
  -H 'X-Forwarded-Proto: https' \  
  'http://127.0.0.1:8080/dna/intent/api/v1/network-device'

---

## 2. Intermediate example

Fetch AP device health with query parameters:

curl -s \  
  -H "Authorization: Basic $(printf 'admin:Wert432!' | base64)" \  
  -H 'X-CatC-Host: 10.101.1.141' \  
  -H 'X-CatC-Port: 443' \  
  -H 'X-Forwarded-Proto: https' \  
  'http://127.0.0.1:8080/dna/intent/api/v1/device-health?deviceRole=AP&limit=500'

Fetch ACCESS switch health:

curl -s \  
  -H "Authorization: Basic $(printf 'admin:Wert432!' | base64)" \  
  -H 'X-CatC-Host: 10.101.1.141' \  
  -H 'X-CatC-Port: 443' \  
  -H 'X-Forwarded-Proto: https' \  
  'http://127.0.0.1:8080/dna/intent/api/v1/device-health?deviceRole=ACCESS&limit=500'

---

## 3. Pagination-oriented example

This example is useful when `AUTO_PAGINATE=true` is enabled in the proxy.

You still send a normal request to the first page. The proxy investigates the first response and, if needed and allowed by guard rails, fetches the additional pages and returns one merged response back.

curl -s \  
  -H "Authorization: Basic $(printf 'admin:Wert432!' | base64)" \  
  -H 'X-CatC-Host: 10.101.1.141' \  
  -H 'X-CatC-Port: 443' \  
  -H 'X-Forwarded-Proto: https' \  
  'http://127.0.0.1:8080/dna/intent/api/v1/device-health?deviceRole=AP'

A more explicit first-page example:

curl -s \  
  -H "Authorization: Basic $(printf 'admin:Wert432!' | base64)" \  
  -H 'X-CatC-Host: 10.101.1.141' \  
  -H 'X-CatC-Port: 443' \  
  -H 'X-Forwarded-Proto: https' \  
  'http://127.0.0.1:8080/dna/intent/api/v1/device-health?deviceRole=AP&limit=500&offset=1'

### Important pagination note

If you manually request a later page such as `offset=501`, the proxy is expected to treat that as an explicit caller choice and **skip auto-pagination**. That prevents it from changing the meaning of a deliberate paged request.

---

## Build with Docker

Minimal build:

docker build -t catc-proxy:latest .

Run:

docker run --rm -p 8080:8080 \  
  -e LOG_LEVEL=info \  
  -e INSECURE_SSL=true \  
  -e ADMIN_TOKEN=changeme \  
  catc-proxy:latest

---

## Dockerfile

Example `Dockerfile`:

FROM debian:bookworm-slim AS build  
RUN apt-get update && apt-get install -y --no-install-recommends \  
    build-essential pkg-config libmicrohttpd-dev libcurl4-openssl-dev libjansson-dev ca-certificates && \  
    rm -rf /var/lib/apt/lists/*  
WORKDIR /src  
COPY catc_proxy.c .  
RUN mkdir -p /out && \  
    cc -O2 -Wall -Wextra -o /out/catc-proxy catc_proxy.c \  
    $(pkg-config --cflags --libs libmicrohttpd libcurl jansson) -lpthread  
  
FROM debian:bookworm-slim  
RUN apt-get update && apt-get install -y --no-install-recommends \  
    libmicrohttpd12 libcurl4 libjansson4 ca-certificates && \  
    rm -rf /var/lib/apt/lists/*  
COPY --from=build /out/catc-proxy /usr/local/bin/catc-proxy  
EXPOSE 8080  
ENTRYPOINT ["/usr/local/bin/catc-proxy"]

---

## Docker Compose

Below is a simple `docker-compose.yml` that will both **build** and **run** the proxy automatically.

Save as:

docker-compose.yml

Content:

services:  
  catc-proxy:  
    build:  
      context: .  
      dockerfile: Dockerfile  
    container_name: catc-proxy  
    ports:  
      - "8080:8080"  
    environment:  
      LISTEN_ADDR: "0.0.0.0"  
      LISTEN_PORT: "8080"  
      CATC_HOST_HEADER: "X-CatC-Host"  
      DEFAULT_TARGET_SCHEME: "https"  
      DEFAULT_TARGET_PORT: "443"  
      INSECURE_SSL: "true"  
      UPSTREAM_TIMEOUT_SEC: "30"  
      TOKEN_SKEW_SEC: "30"  
      LOG_LEVEL: "info"  
      ADMIN_TOKEN: "changeme"  
  
      # Optional auto-pagination  
      AUTO_PAGINATE: "false"  
      PAGINATE_PAGE_SIZE: "500"  
      PAGINATE_MAX_PAGES: "20"  
      PAGINATE_MAX_RECORDS: "5000"  
      PAGINATE_MAX_SECONDS: "25"  
    restart: unless-stopped

### Start with Docker Compose

Build and start in the background:
docker compose up -d --build

View logs:
docker compose logs -f

Stop:
docker compose down

Rebuild after code changes:
docker compose up -d --build

---

## Changing debug level in Docker Compose

The simplest way is to edit the compose file:

LOG_LEVEL: "debug"

Then rebuild/restart:

docker compose up -d --build

You can also leave the compose file at `info` and temporarily switch at runtime with the admin endpoint:

curl -X POST \  
  -H 'X-CatC-Admin-Token: changeme' \  
  'http://127.0.0.1:8080/__admin/loglevel?level=debug'

That is useful when you want more detail without restarting the container.

---

## Example project layout

proxy/  
├── catc_proxy.c  
├── Dockerfile  
├── docker-compose.yml  
└── README.md

---

## Operational notes

- Token cache is in memory only
- Cache is per `(host, username)`
- Container restart clears the token cache
- Inbound side is HTTP by design for simplicity
- Upstream side is typically HTTPS
- `INSECURE_SSL=true` is convenient for lab use, but should be reviewed for production
- Query-string forwarding is supported
- The proxy is intentionally small and specialized, not a general API gateway

---

## Recommended defaults

For a stable first deployment:

LOG_LEVEL=info  
AUTO_PAGINATE=false  
INSECURE_SSL=true   # lab only  
UPSTREAM_TIMEOUT_SEC=30

For troubleshooting:

LOG_LEVEL=debug  
AUTO_PAGINATE=true  # only if you need merged device-health responses

---

## Summary

Use `catc-proxy` when you want Zabbix to call Catalyst Center APIs without handling Catalyst Center token management directly.

The proxy is best suited for:

- Zabbix HTTP master items
- dependent discovery and dependent items
- bulk Catalyst Center API calls
- container-based deployment
- controlled debugging via `docker logs`
- optional guarded pagination for large `device-health` result sets
