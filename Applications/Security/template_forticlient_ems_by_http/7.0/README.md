# FortiClient EMS by HTTP

Author: [Nilleftw](https://github.com/Nilleftw).

Zabbix 7.0 template for FortiClient EMS 7.4.8 monitoring over HTTPS. Import [template_forticlient_ems_by_http.yaml](template_forticlient_ems_by_http.yaml). No SNMP interface is required.

Template vendor is **Nilleftw** (maintainer), with version **7.0-0** for the first numbered revision on the Zabbix 7.0 branch. This is a template revision, not an EMS version or a required Zabbix patch level. Template tags are `class: software`, `target: forticlient-ems`, and `target: fortinet`.

## Setup

Create one Zabbix host per EMS site and set these host macros:

| Macro | Value |
|---|---|
| `{$EMS.API.URL}` | EMS base URL, for example `https://ems.example.com` |
| `{$EMS.API.SITE}` | Site name, such as `default` |
| `{$EMS.API.USERNAME}` | EMS account with access to the selected site |
| `{$EMS.API.PASSWORD}` | Password stored as **Secret text** |
| `{$EMS.API.PERFMON.EXTENDED}` | `0` by default; set to `1` to query optional diagnostic series |

Item names show the resolved site name in Latest data. The template does not add a `site:{$EMS.API.SITE}` item tag because Zabbix displays user macros in item tags literally in that view. If site-based problem routing is needed, set a literal host tag such as `site:default` on each EMS host.

The script normalizes an explicit default HTTPS port (`:443`) before setting the Origin and Referer headers. This avoids an EMS CSRF rejection observed with `https://host:443`.

Each collection group has one Script master item and dependent metrics. **Disable a group's master item to stop its API requests.** Disabling a dependent item only stops storing that metric; its master still polls. Polling intervals are controlled by the corresponding `{$EMS.API.<GROUP>.INTERVAL}` template macro.

| Group | Master key | Default interval | Scope | Default state | Data |
|---|---|---:|---|---|---|
| License | `ems.api.license.raw` | 5m | Site | Enabled | EPP, ZTNA, all active license types, trial status |
| Endpoints | `ems.api.endpoints.raw` | 10m | Site | Enabled | Total, online, offline, managed, unmanaged |
| Security | `ems.api.security.raw` | 30m | Site | Enabled | Vulnerabilities, affected endpoints, profile/tag errors, active forensics |
| Performance | `ems.api.perfmon.raw` | 5m | Global | Enabled | CPU, RAM, highest disk usage, EMS node count, database latency; optional diagnostics |
| System | `ems.api.system.raw` | 15m | Global | Enabled | HA members, signature update, upgrade and repackager status |
| Certificates | `ems.api.certificates.raw` | 1h | Global | Enabled | Certificate counts, expiry within 30 days, earliest expiry |
| Alerts | `ems.api.alerts.raw` | 10m | Site | Disabled | Alert count and unread alerts for the API account |
| Inventory | `ems.api.inventory.raw` | 1h | Global | Disabled | Site and workgroup counts |

The Alerts and Inventory master and dependent items are disabled by default because unread alerts are account-specific and site/workgroup counts rarely change. Performance swap, duplicate online-endpoint count, and CPU-core count are also disabled. The Performance script does not query swap or the duplicate endpoint count. Database connection count, network rates and connections, keep-alive metrics, and per-process CPU/RAM are optional diagnostics: their items are disabled and their Grafana queries are skipped by default. To collect them, set `{$EMS.API.PERFMON.EXTENDED}` to `1` and enable the desired dependent items. For multi-site EMS, enable the global groups on only one host to avoid collecting the same data repeatedly. Some global groups require an EMS account with global administrator access.

The disk item is the highest usage across all returned volumes, including `/boot` when present. The API data identifies disk devices rather than mount points, so the template does not exclude `/boot` automatically. A full boot partition can also prevent upgrades. Use host-level disk monitoring when mount-specific alerts are needed.

## License discovery

EPP and ZTNA retain their fixed item keys. Low-level discovery adds nine metrics for each other license type with used, allocated, future, or expired seats. Types with only zero values are omitted. The raw license item stores normalized counts and dates; EMS serial numbers and host IDs are discarded. Expiry timestamps interpret EMS's timezone-free date as UTC and use `0` when no date is available.

## Triggers

The following triggers are enabled by default:

| Condition | Severity | Default |
|---|---|---|
| No license API data for 20 minutes | High | Enabled |
| No Performance API data for 20 minutes | High | Enabled |
| No Certificate API data for three hours | High | Enabled |
| EPP, ZTNA, or discovered license utilization reaches `{$EMS.API.LICENSE.WARN}` | Warning | 90% |
| Allocated license expires within `{$EMS.API.LICENSE.EXPIRY_WARN_DAYS}` | Warning | 30 days |
| Allocated license has expired | High | Enabled |
| At least one server certificate expires within 30 calendar days | Warning | Enabled |
| At least one server certificate has expired | High | Enabled |
| Fewer live HA members than configured members | High | Enabled |
| 15-minute average CPU exceeds `{$EMS.API.PERFMON.CPU_WARN}` | Warning | 85% |
| 15-minute average RAM exceeds `{$EMS.API.PERFMON.RAM_WARN}` | Warning | 90% |
| 15-minute average maximum disk usage exceeds `{$EMS.API.PERFMON.DISK_WARN}` | Warning | 90% |
| EMS profile or Zero Trust tag errors are present | Warning | Enabled |

Endpoint online percentage and critical vulnerability triggers are included but **disabled by default**; their usefulness depends on deployment policy and existing findings. If a master item is intentionally disabled, disable its no-data trigger as well. Zabbix notifications also require an action configured in Zabbix.

## Host dashboard

The template includes **EMS: Overview**, a host dashboard with EPP and ZTNA license summaries, online and offline endpoint counts, 24-hour CPU/RAM/disk graphs, an EPP used-versus-allocated seats graph, and current problems. It uses enabled items only. Open it from the monitored host's Dashboards tab after linking the template.

## Data handling and compatibility

The template stores normalized monitoring values instead of raw EMS responses. This matters because some EMS API responses contain sensitive fields. Credentials and cookies remain inside a Script execution. Default triggers focus on API availability, license capacity and expiry, server certificate expiry, and HA availability.

The license, dashboard, and several other routes were observed in the EMS web interface; they are not all present in the supplied Fortinet OpenAPI files. See API coverage below for the routes used by each group. Performance collection uses EMS's internal Grafana endpoints and may need adjustments on other EMS versions. Certificate expiry comparisons use the date portion of the EMS response.

## Validation

Imported into Zabbix 7.0.32 and tested against FortiClient EMS 7.4.8. Six collection groups are enabled by default and two are optional. The license discovery created nine Chromebook items with correct values. The HTTP template provides 22 trigger definitions, including three license discovery trigger prototypes; 20 are enabled and two are disabled by default. The host dashboard imported with all nine widgets; all four graphs returned SVG data through the Zabbix widget endpoint.

References: [Zabbix Script items](https://www.zabbix.com/documentation/7.0/en/manual/config/items/itemtypes/script), [dependent items](https://www.zabbix.com/documentation/7.0/en/manual/config/items/itemtypes/dependent_items), and [template import](https://www.zabbix.com/documentation/7.0/en/manual/api/reference/configuration/import).

## API coverage

The routes below were observed and tested against FortiClient EMS 7.4.8 Linux. Authentication uses `POST /api/v1/auth/signin` for the configured site. Most monitoring routes are internal EMS web interface calls and are absent from the supplied Fortinet Developer Network OpenAPI files. Revalidate them when upgrading EMS.

| Group | Routes used after sign-in | Stored values |
|---|---|---|
| License | `GET /api/v1/license/get` | Normalized seats, expiry dates, trial status and license type discovery |
| Endpoints | `GET /api/v1/endpoints/count`, `GET /api/v1/endpoints/connection/donut`, `GET /api/v1/endpoints/management/donut` | Endpoint counts and online percentage |
| Security | `GET /api/v1/vulnerabilities/summary`, `GET /api/v1/profiles/error_count`, `GET /api/v1/tags/zero_trust/error_count`, `GET /api/v1/forensics/active/count` | Vulnerability and error counts |
| Alerts | `GET /api/v1/alerts/count`, `GET /api/v1/alerts/count_unread` | Alert counts; unread is specific to the API account |
| System | `GET /api/v1/system/ha/info`, `GET /api/v1/system/signatures/poll`, `GET /api/v1/system/check_upgrade`, `GET /api/v1/system/cloud/repackager/status` | HA, signature, upgrade and repackager status |
| Certificates | `GET /api/v1/server_certificates/index`, `GET /api/v1/client_certificates/index` | Counts and server certificate expiry summary |
| Inventory | `GET /api/v1/sites/names/index`, `GET /api/v1/workgroups/index` | Site and workgroup counts |
| Performance | `POST /api/v1/performance_dashboard/login`, `GET /api/v1/performance_dashboard/dashboard_search`, internal Grafana dashboard definition and data query | CPU, RAM, disk, EMS node count and DB latency by default; optional database, network, keep-alive and process diagnostics when extended collection is enabled |

Each group makes one sign-in request and then its listed calls per polling interval. Disable a group's Script master item to avoid those requests. Dependent items do not make separate API requests.

The EMS web application contains many more GET routes, including endpoint and event lists. Those lists may be large or contain personal data, so the template does not store their raw responses. `GET /api/v1/forti_care/get` is excluded because its response contains a password field. Routes requiring client certificates are also outside this session-based template.

## License

MIT (repository-wide license). Maintained by Nilleftw; not an official Fortinet template.
