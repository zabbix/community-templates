# Template App Ceph Tentacle by Prometheus endpoint

**Author:** Alexander Rydzewski ([GitHub](https://github.com/AlexRydzewski))  
**License:** MIT  
**Zabbix:** 7.4  
**Ceph:** 20.x (Tentacle), mgr `prometheus` module enabled

Monitor a Ceph cluster from **one Zabbix host** by scraping the mgr Prometheus HTTP endpoint (`/metrics`). No Ceph client credentials or `ceph` binary are required on the Zabbix poller.

Item keys use the `ceph20.*` prefix to match Ceph 20/Tentacle metrics and avoid collisions with the Squid `ceph19.*` template.

## Related templates

| Template | Host |
|----------|------|
| This template (Tentacle) | One host per cluster — mgr Prometheus scrape |
| [Template App Ceph Squid by Prometheus endpoint](../template_ceph_squid_by_prometheus/7.4/) | Ceph 19.x only; use **one** Prometheus template per cluster |
| [Template App Ceph Cache Tier per OSD by sender](../template_ceph_cache_tier_sender/7.4/) | Each OSD node — cache-tier metrics not in Prometheus |

## Requirements

- Zabbix 7.4+
- Ceph 20.2+ (Tentacle) with mgr `prometheus` module
- HTTP reachability from Zabbix server/proxy to mgr `:9283` (directly or via load balancer)

## Import

1. **Data collection → Templates → Import**
2. Select `template_ceph_tentacle_by_prometheus.yaml`
3. Create a Zabbix host for the cluster and link this template

## Configure mgr Prometheus

```bash
ceph mgr module enable prometheus
ceph config set mgr mgr/prometheus/server_port 9283
```

## Stable scrape URL (recommended)

Point Zabbix at a **stable URL**, not a single mgr IP. HAProxy (or similar) on any host Zabbix can reach is typical:

```haproxy
listen ceph_mycluster_mgr_prometheus
    bind        127.0.0.1:19283
    mode        http
    option      httpchk GET /metrics
    http-check  expect string ceph_health_status
    default-server inter 5s fall 2 rise 1
    server mgr1 10.0.0.11:9283 check
    server mgr2 10.0.0.12:9283 check
```

Lab setups may use a direct mgr URL: `http://<mgr-host>:9283/metrics`.

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$CEPH.PROMETHEUS.URL}` | *(empty — required)* | Full metrics URL, e.g. `http://127.0.0.1:19283/metrics` |
| `{$CEPH.POOL.PUSED.WARN}` | `80` | Pool percent-used warning threshold |

## Metrics (summary)

- **Cluster:** health status/detail, MON quorum, OSD up/in, capacity, PG state counters, slow ops, degraded/misplaced/unfound objects
- **Pools (LLD):** IOPS, bandwidth, percent used
- **OSDs (LLD):** apply/commit latency, slow ops
- **Master items:** 6s performance scrape, 1m state/PG scrape, 3m capacity scrape

Item keys use the `ceph20.*` prefix. See [Ceph mgr Prometheus](https://docs.ceph.com/en/latest/mgr/prometheus/) for metric semantics.

## Triggers (included)

- Cluster health WARN / ERR
- Per-check `ceph_health_detail` items (LLD)
- OSD down / out, MON quorum loss
- Degraded / misplaced / unfound objects
- Pool capacity above `{$CEPH.POOL.PUSED.WARN}`
- Prometheus scrape nodata (6s, 1m, 3m master items)

## Built-in dashboards

Open **Monitoring → Hosts → \<host\> → Dashboards**:

| Dashboard | Content |
|-----------|---------|
| **Ceph — Cluster health** | Health, slow ops, object counts, capacity, MON/OSD/MGR status |
| **Ceph — Pool performance** | Per-pool bandwidth, IOPS, percent used |
| **Ceph — OSD performance** | Per-OSD apply/commit latency and slow ops |

## Optional Grafana dashboard

A combined Grafana dashboard (Prometheus + cache-tier sender data) is maintained in the [project repository](https://github.com/AlexRydzewski/ceph-prometheus-zabbix-monitoring):

`grafana/ceph-cluster-overview.json` — requires [alexanderzobnin-zabbix-datasource](https://grafana.com/grafana/plugins/alexanderzobnin-zabbix-app/).

## References

- [Ceph PG states](https://docs.ceph.com/en/latest/rados/operations/pg-states/)
- [Ceph mgr Prometheus](https://docs.ceph.com/en/latest/mgr/prometheus/)
- [Project source](https://github.com/AlexRydzewski/ceph-prometheus-zabbix-monitoring)
