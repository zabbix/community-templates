# XPS Retificador SRX by SNMP

## Overview

SNMP health template for XPS Eletronica rectifier systems (USCC 2.0 / "Ultimate" supervision unit).

Tested on model SRX60A / SR60A-48V/3240W (up to 2 Rectifier Units), manual MT00353 Rev. D,
against a real device via `snmpwalk`/`snmpget`.

## What it monitors

- System output voltage (VCC)
- Battery voltage (VBate)
- Consumer load current (ICons)
- Battery charge current (IBatC)
- **Battery discharge current (IBatD)** - priority metric
- **Battery temperature (TBat)** - priority metric
- Ambient temperature 1 and 2 (TempAmb1/TempAmb2)
- Rectifier Unit 1 and 2 current
- Consumer and battery fuse status
- Multiple UR failure flag
- Front-panel alarm LEDs (Urgente / Nao Urgente / Advertencia)

The battery discharge current and battery temperature were prioritized on request, to detect AC mains
loss and the start of battery discharge as early as possible.

## Triggers

- High system output voltage (VCC)
- Battery in discharge (low voltage) / critical undervoltage before automatic disconnection
- Discharge current above normal
- High / critical battery temperature (critical trigger has hysteresis)
- Consumer or battery fuse open
- Multiple UR failure
- Any front-panel alarm LED on (Urgente / Nao Urgente / Advertencia)

## Macros

| Macro | Default | Source | Description |
|---|---:|---|---|
| `{$XPS.VCC.HIGH}` | `60` | Factory default (manual, sec. 8.3 "CC ALTA") | Output voltage considered high, in V. |
| `{$XPS.VBATE.DISCHARGE}` | `49.2` | Factory default (manual, sec. 8.3 "DESCARGA") | Battery voltage below which the USCC flags "battery in discharge", in V. |
| `{$XPS.VBATE.DISCONNECT}` | `42.0` | Factory default (manual, sec. 8.3 "DESCONEC") | Battery voltage below which the USCC disconnects the battery, in V. |
| `{$XPS.IBATD.MIN}` | `1` | Suggested | Discharge current (A) above which to raise a warning. Tune per site load profile. |
| `{$XPS.TBAT.HIGH}` | `35` | Suggested | Battery warning temperature, °C. |
| `{$XPS.TBAT.CRIT}` | `45` | Suggested | Battery critical temperature, °C. |
| `{$XPS.TBAT.CRIT.RESET}` | `43` | Suggested | Recovery (hysteresis) temperature for the critical trigger, °C. |

Macros marked "Suggested" are not factory alarm parameters from the vendor manual; tune them to the
installation site.

## Configuration

Configure the SNMP interface (SNMPv2, community) on the monitored USCC and link this template to the host.

The template has no external template links and can be imported into a clean Zabbix 7.0 installation.

## Notes

OIDs were extracted from the vendor MIB (`xps-mib4.4.mib`, branch `xpsEletronicaUsccUltimate`,
enterprise `1.3.6.1.4.1.34252.5`) and confirmed against a live device.

Known limitations, intentionally left out of this first version:

- The device does not implement the standard `SNMPv2-MIB::system` group (no `sysDescr`/`sysUpTime`), so
  no uptime item is provided.
- `enterprises.34252.5.1.2.*` (AC input voltage) responds on the device as an indexed group
  (`.2.1`, `.2.2`, `.2.3`), not as the flat scalars (`usccUltimateVca1/2/3`) documented in MIB rev 4.4.
  Left out pending clarification from the vendor.
- `enterprises.34252.5.1.16.*` and `.17.*` return non-boolean values not documented in MIB rev 4.4 and
  could not be reliably identified. Left out of this version.
- A full walk of the whole `enterprises.34252` tree stops with an "OID not increasing" error once it
  reaches the Notifications branch (`.5.4`) on this agent; this is expected, that branch is trap-only and
  not meant to be polled, so it does not affect this template (which only reads `.5.1`).
- This product (SRX60A / SR60A-48V/3240W) supports up to 2 Rectifier Units, so UR current is exposed as
  2 fixed items rather than a discovery rule.

## Author

luiz-camillo

## License

MIT License, consistent with the license of the Zabbix Community Templates repository.
