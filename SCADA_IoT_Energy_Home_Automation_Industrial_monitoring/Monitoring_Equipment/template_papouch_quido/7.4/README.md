# Zabbix template – Papouch Quido I/O module

Zabbix 7.4 template for monitoring **Papouch Quido** Ethernet I/O modules over SNMP: digital inputs, relay outputs and the temperature sensor.

## ✨ Highlights

- 🔍 **Automatic discovery of inputs and relays**: every digital input and relay output **that has a name set in Quido** is discovered automatically, with its own item and trigger. The problem shows the name you gave the input (for example *Door open* or *Flood sensor*).
- 🌡️ **Temperature monitoring**: high temperature and **fast temperature change** (for example air conditioning failure in a server room)
- 🔌 **Power supply control through relays**: tells you when the supply on an NC relay is switched off and when it was restarted

## Contents

| File | Description |
|------|-------------|
| `template_papouch_quido.yaml` | Zabbix **7.4** export with the template `HW Quido` |
| [`../5.0/template_papouch_quido.xml`](../5.0/template_papouch_quido.xml) | Original template for **Zabbix 5.0** (no longer maintained) |

### `HW Quido` (link to the Quido host)

**Items**
- Sensor temperature (°C)
- Location (filled into host inventory), uptime
- ICMP ping / loss / response time

**Discovery rules**

| Rule | MIB table | Item per entry | Value map |
|------|-----------|----------------|-----------|
| **Inputs** | `1.3.6.1.4.1.18248.16.2.1.1` | `Digital input [N] <name>` | `0` = Alert ⚠️, `1` = OK ✅ |
| **Outputs** | `1.3.6.1.4.1.18248.16.3.1.1` | `Relay [N] <name>` | `0` = Relay (NC) ✅ ON, `1` = Relay (NC) ❌ OFF |

Inputs and outputs without a name in Quido are skipped.

**Triggers**

| Trigger | Severity |
|---------|----------|
| HOST DOWN (unavailable by ICMP ping) | Disaster |
| High ICMP ping loss | High |
| Large temperature change in the last hour (> `{$QUIDO_TEMP_CHANGE}` °C) | High |
| High sensor temperature (> `{$QUIDO_TEMP_WARN}` °C in the last 3 checks) | Average |
| `<input name>` (input in alert state) | Average |
| Powersupply on relay [N] `<name>` is OFF | Average |
| High ICMP ping response time | Warning |
| Powersupply on relay [N] `<name>` RESTART | Info |
| Device rebooted | Info |

All triggers depend on *HOST DOWN*, so when Quido is unreachable you only get one alert.

## Requirements

- Zabbix server / proxy **7.4** or newer (for Zabbix 5.0 use the template in [`../5.0/`](../5.0/))
- SNMP enabled on Quido, reachable from the Zabbix server / proxy
- `fping` installed on the server / proxy (ICMP items)

## Installation

1. **Name the inputs and outputs** you want to monitor in the Quido web interface. Only named ones are discovered.
2. **Import the template**: *Data collection → Templates → Import* → `template_papouch_quido.yaml`
3. **Create the Quido host**:
   - Add an SNMP interface (Quido IP address) and set the SNMP community
   - Link the template `HW Quido`
   - Adjust the macros if needed (see below)
4. Wait for discovery to run (default every hour; you can trigger it with *Execute now*).

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$QUIDO_TEMP_WARN}` | `45` | High temperature threshold (°C) |
| `{$QUIDO_TEMP_RECOVER}` | `35` | High temperature problem recovers below this value (°C) |
| `{$QUIDO_TEMP_CHANGE}` | `5` | Maximum tolerated temperature change within one hour (°C) |
| `{$ICMP_LOSS_WARN}` | `20` | Ping loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | Ping response time threshold (s) |

Set the SNMP community **on the host** (or as a global macro), never in the template itself.

## Notes

- An input in state `0` is an alert. If your sensor works the other way round, swap the values in the value map `QUIDO Inputs`.
- The relay value map assumes the power supply goes through an **NC (normally closed)** contact: relay `0` = supply ON, `1` = supply OFF. For NO wiring, swap the values in `QUIDO Outputs (NC Relay)` and in the relay triggers.
- *Large temperature change in the last hour* doesn't recover on its own. Close it manually once you've checked the cause.
- **Upgrading from the Zabbix 5.0 version**: the template name and item keys are the same, so importing the new file updates the existing template and keeps your history. The 5.0 version linked `Module ICMP Ping` (now `ICMP Ping`). The ICMP items are now part of this template, so **unlink `ICMP Ping` from `HW Quido` before importing** (or tick *Delete missing* for template links during import), otherwise the import fails on duplicate item keys.

## Custom work & support

Need something extra? I can extend or customize this template for your company's needs, for example new metrics, triggers, dashboards, other Papouch devices or integration with your environment. Feel free to get in touch: 📧 [info@duprtech.sk](mailto:info@duprtech.sk)

If this work makes sense to you, give the repo a ⭐ star or support me on Ko-fi ☕

I'm adding more tools and templates over time, so feel free to [follow me on GitHub](https://github.com/DuprTECH) to see what's new.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/duprtech)

## More scripts, improvements and frequent updates

This folder holds a snapshot of the template. **More scripts, improvements and frequent updates are on my GitHub:**

- 🆕 newer versions and frequent updates
- 🐞 bug fixes
- 🧩 extra scripts and improvements for the template

👉 **Repository:** https://github.com/DuprTECH/Zabbix-Quido-Papouch  
👤 **My GitHub:** https://github.com/DuprTECH
