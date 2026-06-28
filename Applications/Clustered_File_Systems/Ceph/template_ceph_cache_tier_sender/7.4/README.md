# Template App Ceph Cache Tier per OSD by sender

**Author:** Alexander Rydzewski ([GitHub](https://github.com/AlexRydzewski))  
**License:** MIT  
**Zabbix:** 7.4  
**Ceph:** 19.x / 20.x OSD nodes with cache tiers

Per-OSD cache-tier metrics via `zabbix_sender`, complementing the [Prometheus endpoint templates](../template_ceph_squid_by_prometheus/7.4/) (which do not expose promote/flush/evict rates, tier latencies, dirty objects, or proxy read/write counters).

No sudo UserParameters are required. The collector reads local OSD admin sockets and pushes trapper data.

## Related templates

| Template | Host |
|----------|------|
| [Squid Prometheus](../template_ceph_squid_by_prometheus/7.4/) or [Tentacle Prometheus](../template_ceph_tentacle_by_prometheus/7.4/) | One host per cluster |
| **This template** | **Each OSD node** that should report cache-tier metrics |

## Requirements

- Zabbix 7.4+
- `ceph`, `zabbix_sender`, `systemd` on each OSD node
- Root access to read Ceph OSD admin sockets (`/var/run/ceph/*osd.*.asok` or `/run/ceph/...`)
- Zabbix agent config: `Server`/`ServerActive` and `Hostname` matching the Zabbix host name

## Import

1. **Data collection → Templates → Import**
2. Select `template_ceph_cache_tier_sender.yaml`

## Install collector on each OSD node

Copy the `files/` directory to the OSD node, then:

```bash
cd files
sudo ./install.sh
```

Optional raw perf-dump branch (disabled in Zabbix by default):

```bash
sudo ./install.sh --enable-raw
```

This installs:

- `/usr/local/sbin/ceph-osd-perf-zabbix`
- systemd timers: discovery (10m), perf-pick (15s), optional perf-raw (60s)

### Verify without sending

```bash
sudo /usr/local/sbin/ceph-osd-perf-zabbix --dry --show --discovery --perf-pick
```

### Send once manually

```bash
sudo /usr/local/sbin/ceph-osd-perf-zabbix --discovery --perf-pick
```

## Link template to OSD hosts

For each OSD node:

1. Create a Zabbix host; name must match `Hostname` in agent config.
2. Link **Template App Ceph Cache Tier per OSD by sender**.
3. Wait for discovery (~10 min) or run `--discovery` manually.
4. Confirm items under **Monitoring → Latest data** (filter tag `component:cache-tier`).

## Discovery branches

`ceph-osd-perf-zabbix --discovery` feeds both trap keys every 10 minutes:

| Discovery rule | Default | Data source |
|----------------|---------|-------------|
| **Ceph cache-tier local OSD discovery** | Enabled | `--perf-pick` every 15s — promote/flush/evict, latencies, dirty objects |
| **Ceph raw local OSD discovery** | Disabled | `--perf-raw` &lt;1/min — full perf-dump JSON + dependent items |

Enable the raw branch only if you need BlueStore/recovery metrics not covered by Prometheus. It adds one TEXT item plus dependent items per OSD and may duplicate Prometheus data.

## Cache-tier metrics (per OSD)

| Metric | Source counter |
|--------|----------------|
| Promote / flush / evict rate | `tier_promote`, `agent_flush`, `agent_evict` |
| Dirty objects | `tier_dirty` |
| Read / promote / flush latency | `osd_tier_r_lat`, `osd_tier_promote_lat`, `osd_tier_flush_lat` |
| Proxy read / write rate | `tier_proxy_read`, `tier_proxy_write` |

**Note:** flush/evict use `agent_flush` / `agent_evict`. Legacy `tier_flush` / `tier_evict` counters do not report usable data on modern Ceph.

## Macros

| Macro | Default | Purpose |
|-------|---------|---------|
| `{$CEPH.CACHE.DISCOVERY.NODATA}` | `15m` | Discovery heartbeat timeout |
| `{$CEPH.CACHE.RAW.NODATA}` | `10m` | Per-OSD raw perf-dump timeout (raw branch only) |

## Triggers (included)

| Trigger | Severity |
|---------|----------|
| Ceph cache-tier: no OSD discovery data | Warning |
| OSD {#CEPH_DAEMON}: no raw perf dump data | Warning (raw branch only) |

### Runbook: discovery nodata

1. `systemctl status ceph-osd-perf-zabbix-discovery.timer`
2. `sudo /usr/local/sbin/ceph-osd-perf-zabbix --show --discovery`
3. Check `zabbix_sender` reachability and agent `Hostname` vs Zabbix host name

## Built-in dashboard

**Monitoring → Hosts → \<OSD host\> → Dashboards → Ceph — Cache tier**

Per-OSD promote/flush/evict rates and latencies.

## Optional Grafana dashboard

Combined cluster + cache-tier view: [ceph-cluster-overview.json](https://github.com/AlexRydzewski/ceph-prometheus-zabbix-monitoring/blob/main/grafana/ceph-cluster-overview.json)

## Uninstall

```bash
sudo systemctl disable --now ceph-osd-perf-zabbix-discovery.timer \
                         ceph-osd-perf-zabbix-perf-pick.timer \
                         ceph-osd-perf-zabbix-perf-raw.timer 2>/dev/null || true
sudo rm -f /usr/local/sbin/ceph-osd-perf-zabbix \
          /etc/systemd/system/ceph-osd-perf-zabbix@.service \
          /etc/systemd/system/ceph-osd-perf-zabbix-*.timer
sudo systemctl daemon-reload
```

## References

- [Ceph mgr Prometheus](https://docs.ceph.com/en/latest/mgr/prometheus/) — metrics this template does **not** replace
- [Project source](https://github.com/AlexRydzewski/ceph-prometheus-zabbix-monitoring)
