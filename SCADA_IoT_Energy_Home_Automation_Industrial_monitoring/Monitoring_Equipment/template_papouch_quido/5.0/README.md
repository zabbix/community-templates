# Zabbix template – Papouch Quido I/O module (Zabbix 5.0)

Legacy Zabbix **5.0** template for monitoring **Papouch Quido** Ethernet I/O modules over SNMP: digital inputs, relay outputs and the temperature sensor.

> This version is no longer maintained. For Zabbix 7.4 and newer use [`../7.4/template_papouch_quido.yaml`](../7.4/template_papouch_quido.yaml).

## Contents

| File | Description |
|------|-------------|
| `template_papouch_quido.xml` | Zabbix **5.0** export with the template `HW Quido` |

### `HW Quido` (link to the Quido host)

The template is self-contained: ICMP checks are part of the template, no other template has to be linked.

**Items**
- Sensor temperature (°C)
- Location (filled into host inventory), uptime
- ICMP ping / loss / response time

**Discovery rules**

| Rule | MIB table | Item per entry | Value map |
|------|-----------|----------------|-----------|
| **Inputs** | `1.3.6.1.4.1.18248.16.2.1.1` | `Digital input [N] <name>` | `0` = Alert, `1` = OK |
| **Outputs** | `1.3.6.1.4.1.18248.16.3.1.1` | `Relay [N] <name>` | `0` = PowerSupply ON, `1` = PowerSupply OFF |

Only inputs and outputs that have a name set in Quido are discovered.

**Triggers**
- Unavailable by ICMP ping, high ICMP ping loss, high ICMP ping response time
- Sensor temperature too high (above 35 °C, recovers below 33 °C)
- Device rebooted
- Input in alert state (per discovered input)
- Power supply on relay is OFF / was restarted (per discovered relay)

## Requirements

- Zabbix server / proxy **5.0**
- SNMP enabled on Quido, reachable from the Zabbix server / proxy
- `fping` installed on the server / proxy (ICMP items)

## Installation

1. **Name the inputs and outputs** you want to monitor in the Quido web interface.
2. **Import the template**: *Configuration → Templates → Import* → `template_papouch_quido.xml`
3. **Create the Quido host**: add an SNMP interface, set the SNMP community and link the template `HW Quido`.

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$ICMP_LOSS_WARN}` | `20` | Ping loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | Ping response time threshold (s) |

## Author

Dušan Priechodský – [DuprTECH](https://github.com/DuprTECH) · Source: https://github.com/DuprTECH/Zabbix-Quido-Papouch
