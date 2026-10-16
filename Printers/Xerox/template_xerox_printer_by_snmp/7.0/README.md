# Xerox Printer by SNMP

## Overview

Generic Zabbix template for Xerox printers and MFPs, built on standard SNMP MIBs
(SNMPv2-MIB, HOST-RESOURCES-MIB, Printer-MIB / RFC 3805). Supplies, input trays and printer
alerts are discovered automatically (LLD), so the same template works across models without
hard-coded OID indexes.

Tested on Zabbix 7.2 with:

- Xerox VersaLink C405 (color MFP)
- Xerox VersaLink C415 (color MFP)
- Xerox VersaLink B415 (monochrome MFP)
- Xerox VersaLink B315 (monochrome MFP)
- Xerox 8135

The template should work on other Xerox devices exposing the standard Printer-MIB, but only
the models above have been verified.

Author: Rémi Piazza (remipiazza)

## Requirements

- Zabbix 7.0 or later (template exported in 7.0 format).
- SNMP enabled on the printer (on VersaLink models: *Connectivity > Protocols > SNMP*).
- SNMP v1/v2c is configured through the host interface and the `{$SNMP_COMMUNITY}` macro.
  SNMPv3 works if you set the security parameters on the host SNMP interface.

## Setup

1. Import `template_xerox_printer_by_snmp.yaml`.
2. Create a host with an **SNMP interface** and link the template **Xerox Printer by SNMP**.
3. Adjust the macros below if needed.

Optional: automatic registration with a network discovery rule.

1. *Data collection > Discovery*: create a rule with your IP ranges and an SNMP check on
   `1.3.6.1.2.1.1.1.0` (sysDescr).
2. *Alerts > Actions > Discovery actions*: condition *Received value contains* `Xerox`;
   operations *Create host*, *Add to host group*, *Link template* `Xerox Printer by SNMP`.

## Macros used

| Name | Description | Default |
|------|-------------|---------|
| `{$SNMP_COMMUNITY}` | SNMP v1/v2c community. | `public` |
| `{$XEROX.HRIDX}` | hrDeviceIndex of the printer in HOST-RESOURCES-MIB (usually 1). | `1` |
| `{$XEROX.NODATA}` | Period without data before the "No SNMP data collection" trigger fires. | `5m` |
| `{$XEROX.SUPPLY.CRIT}` | Supply critical threshold (%). | `10` |
| `{$XEROX.SUPPLY.WARN}` | Supply warning threshold (%). | `20` |
| `{$XEROX.SUPPLY.MATCHES}` | Supplies LLD: supply names to include (regex). | `.*` |
| `{$XEROX.SUPPLY.NOT_MATCHES}` | Supplies LLD: supply names to exclude (regex). | `CHANGE_IF_NEEDED` |
| `{$XEROX.SUPPLY.NOALERT}` | Supplies that are collected but get no triggers (waste containers by default). | `(?i)waste` |
| `{$XEROX.TRAY.NOALERT}` | Input trays that are collected but get no "empty" trigger (bypass / manual feed trays are normally empty). | `(?i)bypass\|manual\|multi` |
| `{$XEROX.ALERT.CODES}` | Regex matched against `prtAlertDescription`; a HIGH trigger fires on match. Example: `010-421\|091-446`. | `CHANGE_IF_NEEDED` |

## Items

| Name | Description |
|------|-------------|
| System description / System name | sysDescr, sysName. |
| Serial number | prtGeneralSerialNumber. |
| Uptime | sysUpTime. |
| Pages printed (total) | prtMarkerLifeCount. |
| Device status | hrDeviceStatus. |
| Printer status | hrPrinterStatus. |
| Detected error state (raw) | First octet of hrPrinterDetectedErrorState, with dependent items for paper jam, cover open, out of paper, out of toner, service requested and offline. |

## Discovery rules

| Rule | Description |
|------|-------------|
| Supplies discovery | Per supply (toner, drum, imaging unit, fuser, transfer unit, waste container...): level, max capacity, remaining %, and days left (trend over 4 weeks). If a printer does not report a max capacity, the level is assumed to already be a percentage. |
| Input trays discovery | Level per input tray. |
| Printer alerts discovery | Severity and description of each active alert (prtAlert table). Alerts disappear from the host when cleared. |

## Triggers

| Name | Severity |
|------|----------|
| No SNMP data collection | HIGH |
| Printer has been restarted | INFO |
| Serial number has changed | INFO |
| Device status is down | HIGH |
| Device status is warning | WARNING |
| Paper jam | HIGH |
| Service requested | HIGH |
| Cover open | WARNING |
| Out of paper | AVERAGE |
| Out of toner | AVERAGE |
| Printer is offline | AVERAGE |
| [supply] is below {$XEROX.SUPPLY.CRIT}% (critical) | HIGH |
| [supply] is below {$XEROX.SUPPLY.WARN}% (warning) | WARNING |
| Tray [name] is empty | WARNING |
| Critical alert: [description] | AVERAGE |
| Watched alert code: [description] | HIGH |

## Notes and limitations

- Status triggers (device down/warning and the error flags: paper jam, cover open, out of paper, out of toner, service requested, offline) require two consecutive polls before firing. Some printers briefly report unknown values for a single poll, for example when waking from sleep.
- Supply levels reported as -1, -2 or -3 (other / unknown / some remaining) give a remaining
  value of -1 and never fire the low-level triggers. Input trays reporting -3 are not
  considered empty.
- Waste containers are collected but have no triggers by default, because the meaning of the
  reported level (remaining capacity or fill level) was not verified on every model. Remove
  `waste` from `{$XEROX.SUPPLY.NOALERT}` to enable triggers for them.
- Color and black-and-white page counters from the Xerox private MIB are not included, since
  their OIDs were not verified on VersaLink models.
- After a discovery rule creates new items, "not enough data" errors on calculated items are
  expected until the level and max capacity items have received their first values.

## Feedback

Issues and improvements are welcome through the community-templates repository.
