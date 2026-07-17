# MikroTik CCR — Zabbix monitoring template (RouterOS 7.x, REST)

Standalone, pure-REST Zabbix template for MikroTik CCR routers. Does not require SNMP — everything flows through `/rest/*` over HTTP. Designed for LLD-based discovery and monitoring of system health, interfaces, SFPs, BGP, VRRP, and conntrack.

## What it monitors

- **System:** CPU, memory, disk, uptime, RouterOS version and identity.
- **Hardware health:** temperatures (CPU/SFP/switch/board), fans, PSUs (LLD + state items).
- **Interfaces:** LLD for interfaces with counters (rx/tx bytes/packets), errors, drops; counters converted to bps/pps.
- **Ethernet / SFP DOM:** per-port SFP optical telemetry (TX/RX power, temperature, voltage, bias), module presence and vendor info.
- **BGP:** per-peer discovery (state, sent/received prefix counts, byte counters, uptime).
- **VRRP:** per-VRRP discovery and state monitoring (master/backup/init/fault/disabled/invalid), with expected-role macros to avoid false alarms.
- **Connection tracking:** totals, IPv4/IPv6 breakdowns and utilisation %.
- **ICMP checks:** reachability and latency from the Zabbix server.

## Requirements

- RouterOS 7.x (validated against 7.21.4 long-term on CCR2004-1G-12S+2XS)
- Zabbix 7.0+
- RouterOS `www` service enabled (`/rest/*` endpoint)
- A RouterOS user with `read,api,rest-api` policy (no write privileges required)

## Quick start

1. Enable the `www` service on the router and restrict access to your Zabbix server IP via the service `address` ACL.
2. Create a read-only RouterOS user for Zabbix with the `read,api,rest-api` policy.
3. In Zabbix, import `template_mikrotik_ccr_v7_rest.yaml` (**Administration → Templates → Import**). Enable **Create new** and **Update existing** for all sections and ensure **Template macros** is checked.
4. Create a host for each CCR and link the `MikroTik CCR v7 REST` template. Configure a single IPv4 interface on the host (used as `{HOST.CONN}` in REST URLs) and set the required host macros:

| Macro | Description |
|---|---|
| `{$ROUTEROS.REST.USER}` | REST API username (default: `zabbix-readonly`) |
| `{$ROUTEROS.REST.PASSWORD}` | REST API password — set as **Secret text** in Zabbix |
| `{$ROUTEROS.VRRP.EXPECTED_STATE}` | Optional: set to `1` on hosts that should be VRRP backup to prevent wrong-role alerts |

## Important notes

- The template defaults to plain HTTP (`http` / port `80`) to avoid certificate management. Lock the `www` service to your Zabbix collector IP using the RouterOS service `address` ACL. Override `{$ROUTEROS.REST.SCHEME}` and `{$ROUTEROS.REST.PORT}` per host if you prefer HTTPS.
- RouterOS logs each successful REST login to the system log by default. To reduce log noise: `/system logging set 0 topics=info,!account`
- If triggers show unknown macro errors after import, re-import and ensure **Template macros** is checked.

## Macros reference

| Macro | Default | Description |
|---|---|---|
| `{$ROUTEROS.REST.SCHEME}` | `http` | REST scheme |
| `{$ROUTEROS.REST.PORT}` | `80` | REST API port |
| `{$ROUTEROS.REST.USER}` | `zabbix-readonly` | RouterOS API user |
| `{$ROUTEROS.REST.PASSWORD}` | _(empty)_ | RouterOS API password (Secret text) |
| `{$ROUTEROS.REST.TIMEOUT}` | `10s` | Per-request timeout |
| `{$ROUTEROS.POLL.FAST}` | `10s` | Poll cadence for interfaces and BGP counters |
| `{$ROUTEROS.POLL.NORMAL}` | `1m` | Poll cadence for system resources and VRRP |
| `{$ROUTEROS.POLL.SLOW}` | `5m` | Poll cadence for health sensors and SFP DOM |
| `{$ROUTEROS.CPU.LOAD.HIGH}` | `85` | CPU load alert threshold (%) |
| `{$ROUTEROS.MEM.UTIL.HIGH}` | `85` | Memory utilisation alert threshold (%) |
| `{$ROUTEROS.DISK.UTIL.HIGH}` | `85` | Disk utilisation alert threshold (%) |
| `{$ROUTEROS.CONNTRACK.UTIL.HIGH}` | `85` | Conntrack utilisation alert threshold (%) |
| `{$ROUTEROS.SFP.TEMP.HIGH}` | `70` | SFP temperature ceiling (°C) |
| `{$ROUTEROS.SFP.RX_POWER.LOW}` | `-20` | SFP RX power floor (dBm) |
| `{$ROUTEROS.SFP.TX_POWER.LOW}` | `-9` | SFP TX power floor (dBm) |
| `{$ROUTEROS.VRRP.EXPECTED_STATE}` | `0` | Expected VRRP role: `0`=master, `1`=backup |

## Troubleshooting

- **HTTP 401 or empty data:** verify `{$ROUTEROS.REST.USER}` / `{$ROUTEROS.REST.PASSWORD}` and that the RouterOS user `address` field includes the Zabbix collector IP.
- **Empty REST responses but port reachable:** check the `www` service `address` ACL on the router.
- **Unknown macros after import:** re-import the template with **Template macros** → Create new enabled.

## License

MIT License. Source repository: [github.com/paskotis/mikrotik-ccr-v7-rest-zabbix-template](https://github.com/paskotis/mikrotik-ccr-v7-rest-zabbix-template)
