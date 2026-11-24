# CyberPower ATS/PDU – Zabbix SNMP template

Zabbix template for monitoring the **CyberPower ATS PDU** (Switched ATS PDU, 200–240 V, 10 A) over SNMP.

| | |
|---|---|
| Template name | `CyberPower-ATS-PDU` |
| Template version | `1.0` |
| Zabbix version | `8.0.0` (tested) |
| SNMP | v1 / v2c / v3 |
| Items | `49` |
| Triggers | `34` |
| Value maps | 4 |

## MIB branches used

| Branch | OID | Data |
|---|---|---|
| SNMPv2-MIB system | `1.3.6.1.2.1.1` | name, location, contact, uptime |
| ePDU load status | `1.3.6.1.4.1.3808.1.1.3.2.3.1.1` | current, voltage, power, PF, energy, load state |
| ePDU2 source status | `1.3.6.1.4.1.3808.1.1.6.9.4.1` | ATS source A/B: voltage, frequency, status, phase sync |
| ePDU outlets | `1.3.6.1.4.1.3808.1.1.3.3` | outlet 1–12 name and state |

## Items

- **System:** name, location, contact, uptime
- **Load:** current (A), voltage (V), active power (W), apparent power (VA), power factor, energy (kWh), load state
- **ATS:** selected source, source A/B voltage, frequency and status, phase sync, PSU A/B status
- **Outlets 1–12:** name, state (On/Off)

## Triggers

| Trigger | Severity |
|---|---|
| ATS switched from Source A | High |
| Source A / B voltage problem | High |
| Source A / B voltage out of range | Warning |
| Phase sync lost | Warning |
| PDU load near overload / overload | Warning / High |
| Outlet N switched ON (last 5 min) ×12 | Information |
| Outlet N switched OFF (last 5 min) ×12 | Warning |
| Device restarted (uptime < 10m) | Warning |

## Value maps

| Map | Values |
|---|---|
| CyberPower load state | 1 Normal, 2 Low, 3 Near overload, 4 Overload |
| ATS source | 1 Source A, 2 Source B |
| ATS status | 1 OK, default Problem |
| Outlet state | 1 On, 2 Off |

## Macros

| Macro | Default | Description |
|---|---|---|
| `{$SNMP_COMMUNITY}` | – | SNMP v1/v2c community |
| `{$ATS.VOLT.MIN}` | 207 | Source voltage low threshold (V) |
| `{$ATS.VOLT.MAX}` | 253 | Source voltage high threshold (V) |

## Setup

1. PDU web UI → **System → Network Service** → enable SNMPv1 or SNMPv3, restrict access to the Zabbix server IP.
2. Test from the Zabbix server:
   ```
   snmpwalk -v1 -c <community> -On <PDU_IP> 1.3.6.1.4.1.3808.1.1.6.9.4
   ```
3. Zabbix → **Data collection → Hosts** → add host, SNMP interface, link template `CyberPower-ATS-PDU-PDU44004`.

## Notes

- Source A/B voltage and frequency (ePDU2) are reported in whole V / Hz – no multiplier.
- ePDU load status row `.2` (bank 1) returns `NULL` for columns 8–11 – always use row `.1`.
- Load current is reported in 0.1 A resolution (multiplier `0.1`).
