# Zabbix template – Cisco WLC Discovery (separate AP hosts)

Zabbix 7.4 template for monitoring **Cisco Wireless LAN Controllers** (AireOS and Catalyst 9800 / IOS-XE) over SNMP.
Access points are discovered automatically, and **each AP is created as its own Zabbix host**, so every AP has its own problems, graphs, inventory and maintenance.

## ✨ Highlights

- 🔌 **CDP neighbor detection**: for every AP the template reads, via CDP, **which switch and which switch port the AP is connected to** (switch name, IP and port). You can see right away where to look when an AP goes down.
- 🔗 **Automatic dependencies (Python script)**: I also have a **Python script** that works with the Zabbix API. It uses the CDP data to **set dependencies between APs and their upstream switches** automatically, so when a switch fails you get one alert for the switch instead of one for every AP behind it. The script is not part of this repository. If you're interested, contact me at [info@duprtech.sk](mailto:info@duprtech.sk).
- 🖥️ **Separate host for each AP**: each AP has its own problems, graphs, inventory and maintenance windows.

## Contents

| File | Description |
|------|-------------|
| `template_cisco_wlc_discovery.yaml` | Zabbix export with 2 templates: `HW Cisco WLC Discovery` and `HW Cisco WLC Discovery AP` |

### `HW Cisco WLC Discovery` (link to the WLC host)

**Items**
- CPU utilization, total/free RAM, uptime
- Inventory: hostname, model, serial number, OS, product version, max supported APs
- Number of connected APs / max supported APs (CISCO-LWAPP-AP-MIB)
- HA peer hot-standby status
- Rogue AP count, rogue client count
- Total clients per band (2.4 / 5 / 6 GHz), summed across all AP hosts in group `APs`
- ICMP ping / loss / response time
- SNMP traps: AP disassociation, channel changed, radar (DFS) detected

**Discovery rules**
- **WLC AP data**: discovers APs and creates a host for each one (`AP: <name> (<ip>) <location>`) in host group `APs`, linked to `HW Cisco WLC Discovery AP`
- **WLC SSID data**: per-SSID admin status and client count
- **WLC Interfaces data**: uplink interface traffic, errors and status
- **WLC Clients data**: per-client RSSI, traffic, IP and associated AP (*disabled by default*, can generate a lot of items)

**Triggers**: host down, ICMP loss / latency, low free memory, interface status change, and others.

### `HW Cisco WLC Discovery AP` (linked automatically, do not link by hand)

For each AP:
- Admin / operational status, PoE power status, uptime, join time
- Model, serial number, SW / boot version, base and radio MAC, IP, location
- Site tag, policy tag
- Per radio (2.4 / 5 / 6 GHz): channel, bandwidth, TX power, number of clients, channel / RX / TX utilization
- **CDP neighbor: switch name, IP and port the AP is connected to**
- ICMP ping / loss / response time to the AP

**Triggers**: AP unreachable, high ping loss / latency, operational status DOWN, PoE power not *full*, AP rebooting repeatedly (1h / 1d), location not set.

## Requirements

- Zabbix server / proxy **7.4** or newer
- SNMP (v2c or v3) enabled on the WLC, reachable from the Zabbix server / proxy
- `fping` installed on the server / proxy that pings the APs (ICMP items)
- For SNMP traps: Zabbix SNMP trapper configured, with the WLC sending traps to it

## Installation

1. **Create the global regular expression** used by interface discovery:
   *Administration → General → Regular expressions → New*
   - Name: `WLCs uplink interfaces`
   - Expression: match your uplink interface names, for example `^(TenGigabitEthernet|Port-channel)`
2. **Import the template**: *Data collection → Templates → Import* → `template_cisco_wlc_discovery.yaml`
3. **Create the WLC host**:
   - Add an SNMP interface (WLC management IP) and set the SNMP community or v3 credentials
   - Link the template `HW Cisco WLC Discovery`
   - Set the macros (see below)
4. Wait for discovery to run (AP discovery runs every 6h by default; you can trigger it with *Execute now*). The AP hosts will appear in host group `APs`.

> AP hosts poll their data **through the WLC** (SNMP index `{$SNMPINDEX}`), so they don't need SNMP access to the APs themselves. ICMP checks ping the AP's IP address directly.

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$ICMP_LOSS_WARN}` | `20` | WLC ping loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | Ping response time threshold (s) |
| `{$ICMP_LOSS_WARN_AP}` | `20` | AP ping loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN_AP}` | `0.30` | AP ping response time threshold (s) |
| `{$WLC_NAME}` | `wlc.example.com` | FQDN of the WLC |

Set the SNMP community or SNMPv3 credentials **on the host** (or as global macros), never in the template itself.

## Notes

- The calculated items for clients per band sum the values of all hosts in group `APs`. If you monitor more than one WLC, give each WLC its own AP group and edit the item expressions to match.
- AP hosts use the AP IP address as the technical host name. If an AP changes its IP, a new host is created and the old one is removed after the LLD lifetime (180 days).
- Tested on Cisco Catalyst 9800 (IOS-XE 17.x).

## Custom work & support

Need something extra? I can extend or customize this template for your company's needs, for example new metrics, triggers, dashboards, other Cisco models or integration with your environment. Feel free to get in touch: 📧 [info@duprtech.sk](mailto:info@duprtech.sk)

If this work makes sense to you, give the repo a ⭐ star or support me on Ko-fi ☕

I'm adding more tools and templates over time, so feel free to [follow me on GitHub](https://github.com/DuprTECH) to see what's new.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/duprtech)

## License

[MIT](LICENSE)
"# Zabbix-Cisco-WLC-AireOS-Catalyst-9800-" 
"# Zabbix-Cisco-WLC-AireOS-Catalyst-9800-" 
"# Zabbix-Cisco-WLC-AireOS-Catalyst-9800-" 
"# Zabbix-Cisco-WLC-AireOS-Catalyst-9800-" 

## More scripts, improvements and frequent updates

This folder holds a snapshot of the template. **More scripts, improvements and frequent updates are on my GitHub:**

- 🆕 newer versions and frequent updates
- 🐞 bug fixes
- 🧩 extra scripts and improvements for the template

👉 **Repository:** https://github.com/DuprTECH/Zabbix-Cisco-WLC-AireOS-Catalyst-9800-  
👤 **My GitHub:** https://github.com/DuprTECH
