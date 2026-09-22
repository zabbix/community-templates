# BunkerWeb by HTTP

Author: [Bunkerity](https://www.bunkerweb.io/)

Maintainer: [Bunkerity](https://github.com/bunkerity)

Source: [bunkerity/bunkerweb-zabbix-template](https://github.com/bunkerity/bunkerweb-zabbix-template)

This template monitors one BunkerWeb instance through the BunkerWeb PRO Prometheus exporter. Zabbix makes one HTTP request per interval, then processes the response through dependent items and low-level discovery. It does not need a Zabbix agent on the BunkerWeb host.

## Requirements

- BunkerWeb PRO with the Monitoring and Prometheus exporter plugins
- Zabbix 7.0 or a later 7.x release
- Network access from the Zabbix server or proxy to the exporter

## Configure BunkerWeb

Enable both plugins and allow the Zabbix server or proxy address:

```env
USE_MONITORING=yes
USE_PROMETHEUS_EXPORTER=yes
PROMETHEUS_EXPORTER_ALLOW_IP=192.0.2.10/32
```

Replace `192.0.2.10/32` with the address or network of your Zabbix server or proxy. The exporter listens on port `9113` and serves `/metrics` by default. See the [BunkerWeb feature documentation](https://docs.bunkerweb.io/latest/features/#prometheus-exporter-pro) for the exporter settings.

## Import and configure the template

1. Import `template_bunkerweb.yaml` into Zabbix.
2. Create one host for each BunkerWeb instance.
3. Add an interface whose address points to that instance. The template builds the scrape URL from `{HOST.CONN}`.
4. Link the **BunkerWeb by HTTP** template to the host.
5. Override the host macros if the exporter uses a different port or path, or if you need different filters and alert thresholds.

The exporter exposes in-memory counters for one BunkerWeb instance. It does not aggregate counters across a cluster.

## Macros

| Macro                              | Default    | Purpose                                                                            |
| ---------------------------------- | ---------- | ---------------------------------------------------------------------------------- |
| `{$BUNKERWEB.EXPORTER.SCHEME}`     | `http`     | Scheme used to reach the exporter                                                  |
| `{$BUNKERWEB.EXPORTER.PORT}`       | `9113`     | Must match `PROMETHEUS_EXPORTER_PORT`                                              |
| `{$BUNKERWEB.EXPORTER.PATH}`       | `/metrics` | Must match `PROMETHEUS_EXPORTER_URL`                                               |
| `{$BUNKERWEB.EXPORTER.INTERVAL}`   | `1m`       | Scrape interval                                                                    |
| `{$BUNKERWEB.SERVICE.MATCHES}`     | `.*`       | Services included in discovery                                                     |
| `{$BUNKERWEB.SERVICE.NOT_MATCHES}` | `^$`       | Services excluded from discovery                                                   |
| `{$BUNKERWEB.DICT.MATCHES}`        | `.*`       | Shared dictionaries included in discovery                                          |
| `{$BUNKERWEB.DICT.NOT_MATCHES}`    | `^$`       | Shared dictionaries excluded from discovery                                        |
| `{$BUNKERWEB.5XX.WARN}`            | `5`        | 5xx response percentage that raises a warning                                      |
| `{$BUNKERWEB.ATTACKS.MAX}`         | `10`       | Blocked requests per second that raises a warning                                  |
| `{$BUNKERWEB.SHM.TIMELEFT}`        | `7d`       | Warn when projected shared-dictionary exhaustion is closer than this value         |
| `{$BUNKERWEB.NODATA.TIMEOUT}`      | `5m`       | Time without a successful scrape before Zabbix reports the exporter as unreachable |

## Collected data

The template collects the following data:

- BunkerWeb version and exporter availability
- Active NGINX connections and metric-pipeline errors
- Request rates by service and status class
- Attack rates, top attacker IPs, and top attacked URIs
- Request latency, traffic volume, upstream status, cache status, and TLS protocol use
- Shared-dictionary capacity, free space, usage, and projected exhaustion time

Service discovery uses `bw_http_latency_count`. Shared-dictionary discovery uses `bw_shm_capacity_bytes`. A service appears after it handles its first request following a full BunkerWeb restart.

## Triggers

The template reports problems for:

- Exporter reachability and an uninitialized Monitoring plugin
- Metric-pipeline errors
- Sustained 5xx responses and elevated attack rates
- Failing upstreams and deprecated TLS versions
- Projected shared-dictionary exhaustion

The template macros control these thresholds.

## Dashboard

The **BunkerWeb overview** dashboard shows exporter availability, the BunkerWeb version, metric pipeline errors, and current NGINX connections.

## Troubleshooting

### Exporter is unreachable

Confirm that BunkerWeb is running, the port and path macros match the exporter settings, and `PROMETHEUS_EXPORTER_ALLOW_IP` includes the Zabbix server or proxy address.

### Monitoring plugin is not initialized

Set `USE_MONITORING=yes`. The exporter returns HTTP 503 with an explanation when the Monitoring plugin has not initialized. The template accepts that status and reports the configuration problem.

### No services or shared dictionaries appear

Check the `MATCHES` and `NOT_MATCHES` macros on the host. The defaults include all services and dictionaries.

## License

Bunkerity releases this template and its documentation under the [MIT License](https://github.com/bunkerity/bunkerweb-zabbix-template/blob/main/LICENSE).
