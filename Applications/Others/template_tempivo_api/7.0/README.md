# Tempivo by HTTP (Zabbix 7.0)

**Author:** [Tempivo](https://tempivo.com) — water safety monitoring for buildings.

Import this template to pull **water and ambient temperature**, **humidity** (when enabled in Tempivo), and **alerts** into Zabbix alongside other building sensors (HVAC, energy, access, etc.).

The YAML export includes two linked templates:

| Template | Purpose |
|----------|---------|
| **Tempivo by HTTP** | Organization host: polls `/assets` and `/alerts`, LLD, dashboards |
| **Tempivo asset by HTTP** | Auto-linked to discovered per-sensor hosts (host prototypes) |

## What you get

| Item | Meaning |
|------|---------|
| `Tempivo: Get assets (JSON)` | HTTP poll every 5 minutes |
| `Tempivo: Get alerts (JSON)` | HTTP poll every 5 minutes |
| `Tempivo: Open alerts count` | Non-resolved alerts for the org |
| `Asset {name}: Water temperature` | `lastWaterTemperature` (°C) |
| `Asset {name}: Ambient temperature` | `lastAmbientTemperature` — **no data** if not enabled |
| `Asset {name}: Relative humidity` | `lastRelativeHumidity` (%) — **no data** if not enabled |
| `Asset {name}: Status` | `online` / `offline` / `low_battery` / `alarm` |
| `Asset {name}: Open alerts` | Open alert count per asset |
| `Alert {type} [{id}]: …` | Per open alert: severity, status, details |
| Triggers | API nodata, org/asset open alerts, critical/high severity, offline |
| Graphs | Per-asset temperatures, humidity, alerts; org open-alert count |
| Dashboard **Tempivo** | Pages **Sensors** and **Alerts** |

No SNMP on devices. No agent on sensors. Zabbix server (or proxy) must reach `https://api.tempivo.com` over HTTPS.

### Host layout

| Host | Role |
|------|------|
| **Organization host** (you create) | Links **Tempivo by HTTP** |
| **Discovered asset hosts** (automatic) | One host per sensor via host prototypes; links **Tempivo asset by HTTP** |

Asset hosts are placed in **Discovered hosts** and groups **Tempivo/{asset name}** after discovery runs.

## Prerequisites

1. [Tempivo](https://tempivo.com) organization with sensors deployed.
2. **API key** — Tempivo app → **Integrations** → generate key.
3. Permission to **list assets and alerts** (API integrations add-on, Enterprise, or Cellular API).
4. **Zabbix 7.0+** with HTTP agent items.

## Setup

1. Import `template_tempivo_api.yaml` (**Data collection → Templates → Import**).
2. Create a host, e.g. `Tempivo – {organization name}` (one host per Tempivo organization).
3. Link template **Tempivo by HTTP** to that host.
4. Set host macros:
   - `{$TEMPIVO.API.BASEURL}` = `https://api.tempivo.com/v1`
   - `{$TEMPIVO.API.KEY}` = your API key (**Secret** macro type)
5. **Execute now** on discovery rules *Tempivo assets* and *Tempivo open alerts* (or wait up to 1 h).
6. View data under **Monitoring → Latest data** or dashboard **Tempivo**.

## API documentation

- OpenAPI: [https://api.tempivo.com/docs](https://api.tempivo.com/docs)

## Limits

- Max **500** assets and **500** alerts per poll (single API page).
- Ambient temp and humidity items exist for every asset; values appear only when the API returns those fields.
- Default poll interval: **5 minutes** on master HTTP items.

## Source repository

Maintained at [github.com/tempivo/tempivo-zabbix](https://github.com/tempivo/tempivo-zabbix) (MIT).
