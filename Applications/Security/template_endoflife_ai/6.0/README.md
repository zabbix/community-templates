# endoflife.ai EOL by HTTP — Zabbix template

Zabbix template that watches the software stack you define and alerts before —
and after — any of it goes end-of-life, using the
[endoflife.ai API](https://endoflife.ai/api) (480+ products, verified daily
against vendor lifecycle pages).

Works on Zabbix 6.0 LTS and later. Agentless: one HTTP call from the Zabbix
server/proxy per hour, no scripts to install.

## How it works

- One HTTP-agent master item POSTs to `https://api.endoflife.ai/v1/batch`
  once per hour with the stack you set in `{$EOL.STACK.BODY}`.
- A discovery rule creates items per component: **EOL Risk Score** (0–100),
  **status** (`active` / `warn` / `eol`), **days until EOL** (negative once
  past), **EOL date**, **latest release**, **risk band**.
- Triggers:
  - **High** — component is end-of-life
  - **Warning** — end-of-life within 180 days
  - **Average** — EOL Risk Score at or above `{$EOL.SCORE.CRIT}` (default 76,
    the Critical band; depends on the EOL trigger to avoid duplicate alerts)
  - **Warning** — no data from the API for 6 hours

## Setup

1. Import `template_endoflife_ai.yaml` (Configuration → Templates → Import).
2. Link **endoflife.ai EOL by HTTP** to a host (any host — the checks run
   from the server/proxy, not the monitored box).
3. Set the `{$EOL.STACK.BODY}` macro to what that host runs:

```json
{"products":[{"slug":"windows-server","version":"2016"},{"slug":"postgresql","version":"12"},{"slug":"openjdk","version":"11"}]}
```

Product slugs: `https://api.endoflife.ai/v1/products`. Omit `"version"` to
score a product's riskiest tracked cycle.

## Rate limits and batch size

| Tier | Requests/day | Batch size | How |
|---|---|---|---|
| Anonymous | 100 per IP | 5 products | nothing needed |
| Free key | 500 | 5 | `POST /v1/keys/free` with your email — instant, no card |
| Starter / Pro | 10,000 / unlimited | 25 / 50 | <https://endoflife.ai/api> |

The hourly poll uses 24 requests/day per linked host. Set `{$EOL.API.KEY}`
to send a key; leave it empty for anonymous use. To monitor more than 5
components on one host anonymously, clone the master item with a second
stack body, or link the template to multiple hosts with per-host macros.

## Links

- API docs & OpenAPI spec: <https://endoflife.ai/api>
- Risk Score methodology: <https://endoflife.ai/risk-score>
- Lifecycle data source: <https://endoflife.date> (plus endoflife.ai custom-tracked products)

License: MIT.
