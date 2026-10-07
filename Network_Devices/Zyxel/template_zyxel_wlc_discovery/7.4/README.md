# Zabbix template – Zyxel WLC NXC5500 Discovery

Zabbix 7.4 template for monitoring **Zyxel Wireless LAN Controllers** (NXC series) over SNMP. ✅ **Tested on Zyxel NXC5500.**
Access points managed by the controller are discovered automatically, with status, client count and ICMP checks for every AP.

## Contents

| File | Description |
|------|-------------|
| `template_zyxel_wlc_discovery.yaml` | Zabbix **7.4** export with the template `HW Zyxel WLC Discovery` |
| `legacy/Zyxel_NXC5500_WLC_zabbix5.2.xml` | Original template for **Zabbix 5.2** (no longer maintained) |

### `HW Zyxel WLC Discovery` (link to the WLC host)

**Items**
- Uptime
- Inventory: location, model, firmware version, product version, serial number (filled into host inventory)
- ICMP ping / loss / response time

**Discovery rules**
- **WLC AP data**: discovers APs (Zyxel MIB `1.3.6.1.4.1.890.1.15.3.5.11`) that are online and have an IP address. For each AP:
  - Admin status, number of associated stations
  - Base MAC address, management IP
  - ICMP ping / loss / response time to the AP
  - Graphs: associated stations, ping and loss
- **WLC Interfaces data**: traffic, inbound / outbound errors, admin and operational status of `lo` and `eth*` interfaces
- **WLC Clients data**: per-client traffic, RSSI, IP and associated AP (*disabled by default*, see [Notes](#notes))

**Triggers**
- WLC: host down (ICMP), high ICMP loss, high ICMP response time
- AP: unreachable by ICMP, high ping loss, high ping response time (suppressed for 10–15 minutes after a WLC reboot)
- Interface operational status changed

## Requirements

- Zabbix server / proxy **7.4** or newer
- SNMP (v2c or v3) enabled on the WLC, reachable from the Zabbix server / proxy
- `fping` installed on the server / proxy (ICMP items)
- The APs' IP addresses reachable by ICMP from the server / proxy

## Installation

1. **Import the template**: *Data collection → Templates → Import* → `template_zyxel_wlc_discovery.yaml`
2. **Create the WLC host**:
   - Add an SNMP interface (WLC management IP) and set the SNMP community or v3 credentials
   - Link the template `HW Zyxel WLC Discovery`
   - Adjust the macros if needed (see below)
3. Wait for discovery to run (AP discovery runs every hour; you can trigger it with *Execute now*).

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$ICMP_LOSS_WARN}` | `20` | WLC ping loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | WLC ping response time threshold (s) |
| `{$ICMP_LOSS_WARN_AP}` | `30` | AP ping loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN_AP}` | `0.30` | AP ping response time threshold (s) |

Set the SNMP community or SNMPv3 credentials **on the host** (or as global macros), never in the template itself.

## Notes

- APs are created as items on the WLC host (not as separate hosts). AP triggers are named `WIFI AP: <name> [<ip>] ...`.
- The **WLC Clients data** rule uses the Airespace MIB (`1.3.6.1.4.1.14179`) and is disabled by default. Enable it only if your controller answers on these OIDs.
- Interface discovery covers `lo` and `eth*` only. Edit the filter on the *WLC Interfaces data* rule to match other interfaces.
- Tested on Zyxel **NXC5500**. Other NXC models (for example NXC2500) use the same Zyxel MIB and should work too, but they have not been tested.
- **Upgrading from the Zabbix 5.2 version**: the template name and item keys are the same, so importing the new file updates the existing template and keeps your history.

## Planned features

- List of SSIDs on each AP
- Number of clients per SSID
- Number of clients per radio (2.4 / 5 GHz)
- List of associated clients (IP, MAC, …)
- Wireless channel of each AP

Want one of these sooner? Get in touch (see below).

## Custom work & support

Need something extra? I can extend or customize this template for your company's needs, for example new metrics, triggers, dashboards, other Zyxel models or integration with your environment. Feel free to get in touch: 📧 [info@duprtech.sk](mailto:info@duprtech.sk)

If this work makes sense to you, give the repo a ⭐ star or support me on Ko-fi ☕

I'm adding more tools and templates over time, so feel free to [follow me on GitHub](https://github.com/DuprTECH) to see what's new.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/duprtech)

## License

[MIT](LICENSE)

## More scripts, improvements and frequent updates

This folder holds a snapshot of the template. **More scripts, improvements and frequent updates are on my GitHub:**

- 🆕 newer versions and frequent updates
- 🐞 bug fixes
- 🧩 extra scripts and improvements for the template

👉 **Repository:** https://github.com/DuprTECH/Zabbix-Zyxel-WLC-NXC5500  
👤 **My GitHub:** https://github.com/DuprTECH
