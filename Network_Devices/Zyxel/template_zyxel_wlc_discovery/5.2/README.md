# Zabbix template – Zyxel WLC NXC5500 Discovery (Zabbix 5.2)

Legacy Zabbix **5.2** template for monitoring **Zyxel Wireless LAN Controllers** (NXC series) over SNMP. Tested on Zyxel NXC5500.

> This version is no longer maintained. For Zabbix 7.4 and newer use [`../7.4/template_zyxel_wlc_discovery.yaml`](../7.4/template_zyxel_wlc_discovery.yaml).

## Contents

| File | Description |
|------|-------------|
| `template_zyxel_wlc_discovery.xml` | Zabbix **5.2** export with the template `HW Zyxel WLC Discovery` |

### `HW Zyxel WLC Discovery` (link to the WLC host)

The template is self-contained: ICMP checks are part of the template, no other template has to be linked.

**Items**
- Uptime
- Inventory: location, model, firmware version, product version, serial number (filled into host inventory)
- ICMP ping / loss / response time

**Discovery rules**
- **WLC AP data**: discovers access points managed by the controller. For each AP: admin status, number of associated stations, base MAC address, management IP, ICMP ping / loss / response time, graphs of associated stations and ping
- **WLC Interfaces data**: traffic, inbound / outbound errors, admin and operational status
- **WLC Clients data**: per-client traffic, RSSI, IP and associated AP (*disabled by default*, it can create many items)

**Triggers**
- WLC: unavailable by ICMP ping, high ICMP ping loss, high ICMP ping response time
- AP: unavailable by ICMP ping, high ping loss, high ping response time (suppressed for 10 minutes after a WLC reboot)

## Requirements

- Zabbix server / proxy **5.2**
- SNMP enabled on the WLC, reachable from the Zabbix server / proxy
- `fping` installed on the server / proxy (ICMP items)
- The APs' IP addresses reachable by ICMP from the server / proxy

## Installation

1. **Import the template**: *Configuration → Templates → Import* → `template_zyxel_wlc_discovery.xml`
2. **Create the WLC host**: add an SNMP interface (WLC management IP), set the SNMP community and link the template `HW Zyxel WLC Discovery`.

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$ICMP_LOSS_WARN}` | `20` | WLC ping loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | WLC and AP ping response time threshold (s) |
| `{$ICMP_LOSS_WARN_AP}` | `20` | AP ping loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN_AP}` | `0.30` | AP response time threshold (defined, not used by the 5.2 triggers) |

## Author

Dušan Priechodský – [DuprTECH](https://github.com/DuprTECH) · Source: https://github.com/DuprTECH/Zabbix-Zyxel-WLC-NXC5500
