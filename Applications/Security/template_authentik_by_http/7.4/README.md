# Authentik by HTTP

## Overview

This template monitors an authentik identity provider without an agent. It uses the
public health endpoints and the official `/api/v3` REST API. A central Script item
collects the frequently changing data, while a second hourly collection item handles
inventory and low-level discovery to avoid unnecessary API load.

The template covers:

- liveness, readiness, API availability and response times;
- installed/latest version, server clock skew and runtime information;
- worker availability and worker version mismatches;
- queued, running, rejected, warning and failed background tasks;
- successful and failed logins, configuration warnings and critical security/system
  events over one-hour and 24-hour windows;
- counts for users, active/inactive users, superusers, service accounts, groups,
  applications, sessions, tokens, providers, sources, outposts, certificates, flows,
  policies and stages;
- discovery and health monitoring of every outpost;
- discovery of sources and their enabled state;
- blueprint application status and last-application time;
- last status and freshness of LDAP, Kerberos, SCIM, Google Workspace and Microsoft
  Entra synchronization;
- discovery and expiry monitoring of certificates and expiring tokens.

## Requirements

- Zabbix 7.4 or newer.
- authentik 2026.5 or newer. The Tasks API used by the template was introduced in
  recent authentik releases.
- Network access from the Zabbix server or the selected Zabbix proxy to authentik.
- An authentik API token with read access to every monitored API area.

The template was developed against the authentik 2026.5.5 OpenAPI schema.

## Authentik setup

Create a dedicated service account and an API token:

1. In the authentik Admin interface, open **Directory → Users** and create a service
   account for Zabbix.
2. Create an API token for that account and give it an expiry date. Token expiry is
   then monitored by this template as well.
3. Grant read access to these API areas:
   - Admin/System and Version
   - Core users, groups, applications, sessions and tokens
   - Crypto certificate-key pairs
   - Events
   - Flows, Managed Blueprints, Policies and Stages
   - Outposts
   - Providers and Sources
   - Tasks and Workers

A dedicated account in the **authentik Admins** group is the simplest setup and
guarantees complete results. For least privilege, create a custom role containing
only the corresponding `view_*` permissions. If an endpoint is missing from the
role, the template raises “Some API data could not be collected” and shows the
affected endpoint in the collection error details item.

HTTP `401` is reported as an invalid or expired token. HTTP `403` is reported
separately as missing API permission and is not treated as an authentik outage.
Dependent inventory values for inaccessible API areas are discarded instead of
being stored as zero or becoming unsupported.

Unavailable worker, task, and event values are handled in the same way. A successful
worker response with no version mismatch is stored explicitly as zero.

Store the API token in the host macro `{$AUTHENTIK.API.TOKEN}`. It is defined as a
Zabbix secret macro and is not exported after being set.

## Zabbix setup

1. Import `template_authentik_by_http.yaml`.
2. Create a host without an agent interface, or use an existing logical host.
3. Link **Authentik by HTTP**.
4. Set:
   - `{$AUTHENTIK.URL}` to the external base URL, for example
     `https://authentik.example.com` (no trailing slash);
   - `{$AUTHENTIK.API.TOKEN}` to the dedicated API token.
5. If collection runs through a Zabbix proxy, ensure that the proxy can resolve and
   reach the URL.

Self-signed certificates are supported without an additional macro. Certificate-chain
and hostname verification are disabled consistently for the HTTP Agent item prototypes.
The central Script items use Zabbix's `HttpRequest` object, which does not expose a
configurable certificate-verification option.

The HTTPS connection is still encrypted, but the identity of the authentik endpoint
is not verified. Restrict the connection path between Zabbix and authentik to a trusted
network. There is deliberately no `{$AUTHENTIK.TLS.VERIFY}` macro because Zabbix cannot
apply such a switch consistently to both HTTP Agent and Script items.

## Macros

| Macro | Default | Purpose |
| --- | --- | --- |
| `{$AUTHENTIK.URL}` | `https://authentik.example.com` | authentik base URL without trailing slash |
| `{$AUTHENTIK.API.TOKEN}` | empty | API token (secret macro) |
| `{$AUTHENTIK.INTERVAL}` | `5m` | Main health, task and event collection |
| `{$AUTHENTIK.INVENTORY.INTERVAL}` | `1h` | Inventory and discovery |
| `{$AUTHENTIK.INVENTORY.NODATA}` | `3h` | Inventory no-data threshold |
| `{$AUTHENTIK.OUTPOST.INTERVAL}` | `5m` | Per-outpost health collection |
| `{$AUTHENTIK.HTTP.TIMEOUT}` | `30s` | HTTP/script timeout |
| `{$AUTHENTIK.HTTP.PROXY}` | empty | Optional HTTP proxy URL |
| `{$AUTHENTIK.NODATA}` | `15m` | No-data threshold |
| `{$AUTHENTIK.RESPONSE_TIME.WARN}` | `2000` | API response warning threshold in ms |
| `{$AUTHENTIK.CLOCK_SKEW.MAX}` | `60` | Maximum clock difference in seconds |
| `{$AUTHENTIK.LOGIN_FAILED.WARN}` | `10` | Failed logins per hour |
| `{$AUTHENTIK.EVENTS.CRITICAL.WARN}` | `0` | Critical events per hour |
| `{$AUTHENTIK.EVENTS.WARNING.WARN}` | `0` | Configuration warnings per 24 hours |
| `{$AUTHENTIK.TASKS.QUEUED.WARN}` | `25` | Persistent queued-task threshold |
| `{$AUTHENTIK.SYNC.INTERVAL}` | `15m` | Source/provider sync-status polling |
| `{$AUTHENTIK.SYNC.MAX_AGE}` | `25h` | Maximum age of a successful sync |
| `{$AUTHENTIK.CERT.EXPIRY.WARN}` | `30d` | Certificate expiry warning |
| `{$AUTHENTIK.TOKEN.EXPIRY.WARN}` | `14d` | Token expiry warning |
| `{$AUTHENTIK.OUTPOST.LAST_SEEN.MAX}` | `10m` | Maximum outpost check-in age |
| `{$AUTHENTIK.LLD.LIFETIME}` | `30d` | Retention of lost discovered objects |

Expiry, outpost and synchronization macros support context overrides. Examples:

```text
{$AUTHENTIK.CERT.EXPIRY.WARN:"My signing certificate"} = 60d
{$AUTHENTIK.TOKEN.EXPIRY.WARN:"zabbix-monitoring"} = 30d
{$AUTHENTIK.OUTPOST.LAST_SEEN.MAX:"LDAP outpost"} = 20m
{$AUTHENTIK.SYNC.MAX_AGE:"Weekly LDAP sync"} = 8d
```

## Trigger notes

Availability triggers use `Authentik: Server is not alive` as their root cause.
When liveness fails, the API, collection, worker, inventory, and outpost follow-up
alerts are suppressed through trigger dependencies.

Boolean state items are stored internally as `0` and `1` for reliable numeric trigger
expressions, but their shared value map displays them consistently as `false` and
`true`.

Task warning/error counters are persistent summary values in authentik. The related
triggers therefore alert when a counter increases, indicating a newly recorded warning
or failure, instead of continuously alerting on historical task records.

Critical event monitoring includes `policy_exception`,
`property_mapping_exception`, `system_task_exception`, `system_exception`,
`configuration_error` and `suspicious_request`. The most recent matching event is
also retained as text for diagnosis. Event context can contain operational metadata;
restrict access to the Zabbix host accordingly.

Disabled sources are collected but do not alert by default because disabled built-in
or staged sources are often intentional.

## References

- [authentik API overview](https://api.goauthentik.io/)
- [authentik monitoring documentation](https://docs.goauthentik.io/sys-mgmt/ops/monitoring/)
