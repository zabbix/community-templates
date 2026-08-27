# OutageDeck by HTTP

## Overview

This template monitors one cloud or SaaS provider through the public [OutageDeck API](https://outagedeck.com/developers/api?utm_source=zabbix&utm_medium=integration&utm_campaign=zabbix_template). It is agentless and uses a Zabbix script item with dependent items.

The template was tested with Zabbix 7.4 and the OutageDeck v1 API.

## Setup

1. Import `template_outagedeck_by_http.yaml` into Zabbix 7.4 or newer.
2. Create a host without an interface, or choose an existing host that represents the external provider.
3. Link the `OutageDeck by HTTP` template to the host.
4. Set `{$OUTAGEDECK.PROVIDER}` to a provider slug such as `github`, `aws`, `cloudflare`, `openai` or `stripe`.
5. Optionally set `{$OUTAGEDECK.API.KEY}` to an OutageDeck API key for a higher quota.

The Zabbix server or proxy performing the check requires outbound HTTPS access to `outagedeck.com`.

## Zabbix configuration

| Macro | Default | Description |
| --- | --- | --- |
| `{$OUTAGEDECK.API.KEY}` | empty | Optional API key. Store it as a secret macro. |
| `{$OUTAGEDECK.API.URL}` | `https://outagedeck.com/api/v1` | OutageDeck API base URL. |
| `{$OUTAGEDECK.HTTP.PROXY}` | empty | Optional proxy used by the Zabbix `HttpRequest` object. |
| `{$OUTAGEDECK.HTTP.TIMEOUT}` | `10s` | Request timeout. |
| `{$OUTAGEDECK.INTERVAL}` | `5m` | Provider polling interval. |
| `{$OUTAGEDECK.NODATA.TIME}` | `15m` | No-data window for API availability. |
| `{$OUTAGEDECK.PROVIDER}` | `github` | Provider slug to monitor. |
| `{$OUTAGEDECK.RESPONSE.TIME.MAX}` | `3` | Maximum three-request average response time in seconds; `0` disables the trigger. |
| `{$OUTAGEDECK.SOURCE.MAX.AGE}` | `1h` | Maximum accepted age of official provider data. |

Create one Zabbix host per provider when monitoring several providers. Override the provider macro on each host.

## Template links

None.

## Discovery rules

`OutageDeck: Services discovery` discovers every service returned for the selected provider. It creates service name, category and normalized status items, plus warning and high-severity trigger prototypes.

## Items collected

- API availability, HTTP status, response time and collection error.
- Provider name and normalized status.
- Active incident count.
- Official-source data age and status URL.
- Current provider headline and summary.
- Per-service name, category and normalized status through low-level discovery.

Status values are normalized as `Unknown`, `Operational`, `Maintenance`, `Degraded`, `Partial outage` and `Major outage`.

## Triggers

- OutageDeck API unavailable.
- API response time above the configured threshold.
- Provider status unknown while the API is available.
- Provider degraded, partial outage or major outage.
- One or more active provider incidents.
- Official provider data older than the configured threshold.
- Discovered service degraded, partial outage or major outage.

## Feedback

Report template issues at [outagedeck/zabbix-template](https://github.com/outagedeck/zabbix-template/issues).

## Known issues

- The template monitors one provider per Zabbix host.
- OutageDeck reports the state published by each provider's official source. It does not perform synthetic checks from the Zabbix network location.

## References

- [OutageDeck API documentation](https://outagedeck.com/developers/api?utm_source=zabbix&utm_medium=integration&utm_campaign=zabbix_template)
- [OutageDeck provider directory](https://outagedeck.com/providers?utm_source=zabbix&utm_medium=integration&utm_campaign=zabbix_template)
