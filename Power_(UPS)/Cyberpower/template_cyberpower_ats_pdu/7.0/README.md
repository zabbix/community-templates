# CyberPower ATS PDU by SNMP

## Overview

Template for monitoring a **CyberPower Switched ATS PDU** (for example PDU44004: 200–240 V, 10 A) over SNMP.

It collects:

- the bank load: current, voltage, active/apparent power, power factor, energy and load state
- the ATS: the selected source, voltage/frequency and their status for sources A and B, phase sync, and the status of internal power supplies A/B
- the name and on/off state of outlets 1–12
- system data: PDU name, location and uptime

Data comes from CyberPower **CPS-MIB** (`1.3.6.1.4.1.3808`) and **SNMPv2-MIB**.

Author: [Splunner](https://github.com/Splunner)

## Requirements

- Zabbix 7.0 or newer (folder `7.0` for Zabbix 7.0–7.4, folder `8.0` for Zabbix 8.0)
- A CyberPower ATS PDU with SNMP v1, v2c or v3 enabled

Tested on Zabbix 7.0 and 8.0 with SNMP v1, v2c and v3.

## Setup

1. In the PDU web interface, go to **System → Network Service → SNMP**. Enable SNMPv1/v2c or SNMPv3 there and allow access from the Zabbix server or proxy IP.
2. Check access from the Zabbix server or proxy:
   ```
   snmpwalk -v2c -c <community> -On <PDU_IP> 1.3.6.1.4.1.3808.1.1.6.9.4
   ```
3. Import `template_cyberpower_ats_pdu.yaml` from the folder that matches your Zabbix version.
4. Create a host with an **SNMP interface**, set the SNMP version and credentials on the interface, and link the template **CyberPower ATS PDU by SNMP**.
5. If needed, override the macros below on the host.

## Macros used

| Macro | Default | Description |
|---|---|---|
| `{$ATS.VOLT.MIN}` | `207` | Lower source voltage threshold, V. |
| `{$ATS.VOLT.MAX}` | `253` | Upper source voltage threshold, V. |
| `{$ATS.PREFERRED_SOURCE}` | `1` | Preferred ATS source: `1` = Source A, `2` = Source B. |

SNMP credentials (community or SNMPv3 settings) are set on the host's SNMP interface, not in the template.

## Items

| Name | Key | Units | Notes |
|---|---|---|---|
| PDU: Name | `pdu.name` | | ePDUIdentName, polled every 1h |
| PDU: Load current | `pdu.load.current` | A | ×0.1 |
| PDU: Load state | `pdu.load.state` | | Normal / Low / Near overload / Overload |
| PDU: Voltage | `pdu.voltage` | V | ×0.1 |
| PDU: Active power | `pdu.active.power` | W | |
| PDU: Apparent power | `pdu.apparent.power` | VA | |
| PDU: Power factor | `pdu.power.factor` | | ×0.01 |
| PDU: Energy | `pdu.energy` | kWh | ×0.1 |
| PDU: Energy counter start time | `pdu.energy.start_time` | | polled every 1h |
| ATS: Selected source | `ats.source.selected` | | Source A / Source B |
| ATS: Phase sync | `ats.phase.sync` | | In sync / Out of sync |
| ATS: Power supply A status | `ats.psuA.status` | | OK / Error |
| ATS: Power supply B status | `ats.psuB.status` | | OK / Error |
| Source A: Voltage | `ats.sourceA.voltage` | V | |
| Source A: Voltage status | `ats.sourceA.volt.status` | | OK / Error |
| Source A: Frequency | `ats.sourceA.frequency` | Hz | |
| Source A: Frequency status | `ats.sourceA.freq.status` | | OK / Error |
| Source B: Voltage | `ats.sourceB.voltage` | V | |
| Source B: Voltage status | `ats.sourceB.volt.status` | | OK / Error |
| Source B: Frequency | `ats.sourceB.frequency` | Hz | |
| Source B: Frequency status | `ats.sourceB.freq.status` | | OK / Error |
| Outlet N: Name (N = 1–12) | `pdu.outletN.name` | | polled every 1h |
| Outlet N: State (N = 1–12) | `pdu.outletN.status` | | On / Off |
| System: Location | `system.location` | | sysLocation, polled every 1h |
| System: Uptime | `system.uptime` | uptime | sysUpTime |

In total: 47 items.

## Triggers

| Name | Severity | Expression (simplified) |
|---|---|---|
| ATS: Load is not on the preferred source | High | selected source ≠ `{$ATS.PREFERRED_SOURCE}` |
| Source A: Voltage status is not OK | High | voltage status ≠ OK |
| Source B: Voltage status is not OK | High | voltage status ≠ OK |
| Source A: Voltage is out of range for 3m | Warning | voltage outside `{$ATS.VOLT.MIN}`..`{$ATS.VOLT.MAX}` for 3 minutes; depends on the "Voltage status" trigger |
| Source B: Voltage is out of range for 3m | Warning | as above |
| ATS: Sources are not in phase sync | Warning | phase sync ≠ In sync |
| ATS: Internal power supply A or B is not OK | Average | PSU A or PSU B status ≠ OK |
| PDU: Load is in overload state | High | load state = Overload |
| PDU: Load is near overload | Warning | load state = Near overload; depends on the overload trigger |
| Outlet N: Switched OFF (last 5m) (N = 1–12) | Warning | outlet went from On to Off in the last 5 minutes |
| Outlet N: Switched ON (last 5m) (N = 1–12) | Information | outlet went from Off to On in the last 5 minutes |
| System: Device has been restarted | Warning | uptime < 10m (manual close allowed) |

In total: 34 triggers.

## Notes

- Load values are read from row `.1` of ePDULoadStatusTable. On the tested unit, row `.2` returns no data for columns 8–11.
- Source A/B voltage and frequency (ePDU2SourceStatus) are reported in whole volts and hertz, so no multiplier is applied.
- The template has fixed items for 12 outlets. On a model with fewer outlets, the extra outlet items become unsupported and can be disabled on the host.

## License

MIT, as for all templates in this repository.
