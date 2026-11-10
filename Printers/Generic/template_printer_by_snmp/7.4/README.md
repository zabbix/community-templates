# Printer by SNMP

Vendor-independent Zabbix template for network printers and MFPs.

It uses only standard MIBs — **Printer-MIB (RFC 3805)** and **HOST-RESOURCES-MIB (RFC 2790)** — and contains no vendor-specific OIDs and no hardcoded device indexes. The printer device, marker supplies, input trays and covers are all discovered with LLD, so the same template works across vendors and models.

## Requirements

- Zabbix 7.4 (uses `walk[]` SNMP items and *SNMP walk to JSON* / *SNMP walk value* preprocessing).
- SNMP enabled on the printer (v1, v2c or v3).

## Tested on

- Kyocera FS-6525MFP (firmware 2MY_7000.004.006)
- HP LaserJet Pro MFP M127fn
- HP LaserJet Pro MFP M428fdn

Reports for other vendors and models are welcome.

## Setup

1. Import `template_printer_by_snmp.yaml` (*Data collection → Templates → Import*).
2. Create a host with an SNMP interface. Set the SNMP version and the community or v3 credentials on the interface. The template does not depend on them.
3. Link the template **Printer by SNMP**.
4. Optional: adjust the macros below.

**HP and SNMPv3:** HP printers (Jetdirect) grant SNMPv3 access only in the context `Jetdirect`. Set *Context name* = `Jetdirect` on the host SNMP interface, otherwise requests fail with `authorizationError`.

## Macros

| Macro | Default | Description |
|---|---|---|
| `{$PRINTER.SUPPLY.LOW}` | `15` | Low supply threshold, %. Supports context per supply name, e.g. `{$PRINTER.SUPPLY.LOW:"Black Toner"}`. |
| `{$PRINTER.SUPPLY.CRIT}` | `5` | Critically low supply threshold, %. Supports context per supply name. |
| `{$PRINTER.TRAY.TYPE.EXCLUDE}` | `^5$` | Regex of `prtInputType` values to skip. `5` = sheetFeedManual (MP / bypass tray, usually empty). Set to `^$` to monitor all trays. |
| `{$PRINTER.TRAY.EXCLUDE}` | `^$` | Regex of input tray names to skip. |
| `{$SNMP.TIMEOUT}` | `5m` | Time without SNMP data before the availability trigger fires. |

## Discovery rules

| Name | Source | Description |
|---|---|---|
| Printer device discovery | `hrPrinterTable` | Finds printer devices (rows of `hrPrinterTable`; `hrDeviceType` is not required, some devices don't report it). Creates model, serial number, status, device status, console display text, detected error state and page counter items. |
| Marker supplies discovery | `prtMarkerSuppliesTable` | Toner, waste toner box, drum, fuser, etc. Creates raw level, max capacity and remaining % items. |
| Input trays discovery | `prtInputTable` | Paper trays. Creates current level and level % items. |
| Covers discovery | `prtCoverTable` | Front/side covers, document feeder cover, etc. |

## Items

- SNMP agent availability, system description, uptime.
- Alerts: active critical entries of `prtAlertTable`, decoded to text.
- Per printer device: model, serial number, total page count, pages per hour, printer status, device status, console display text, detected error state (decoded `hrPrinterDetectedErrorState` flags).
- Per supply: level (raw), max capacity, remaining %.
- Per tray: current level (raw), level %.
- Per cover: status.

## Triggers

| Name | Severity |
|---|---|
| Printer: No SNMP data collection for `{$SNMP.TIMEOUT}` | Average |
| Printer: Has been restarted (uptime < 10m) | Info |
| Printer: Critical alert: *text* | High |
| Printer: Device is down (hrDeviceStatus) | High |
| Printer: Serial number has changed (device replaced?) | Info |
| Printer: Toner is empty / Toner is low | High / Warning |
| Printer: Paper jam | High |
| Printer: Door is open | Average |
| Printer: Out of paper | Warning |
| Printer: Marker supply is missing | High |
| Printer: Output tray is full | Average |
| Printer: Service requested | Average |
| Printer: Offline | Average |
| Printer: Preventive maintenance is overdue | Info |
| *Supply*: Is empty / Is full (receptacles) | High |
| *Supply*: Critically low / Low | Average / Warning |
| Tray "*name*": Out of paper | Warning |
| Cover "*name*" is open | Average |

## Notes

- Some devices (for example older Kyocera FS series) report supply levels only as `-2` (unknown) or `-3` (some remaining). In that case the remaining % item returns `-1` (shown as *n/a*), and toner problems are reported by the *Toner is low / Toner is empty* triggers based on `hrPrinterDetectedErrorState`, and by the alert table.
- Some devices report `0` as cover status (not defined by RFC 3805, means the cover has no sensor). It is shown as *not reported* and does not fire the cover trigger.
- For receptacles (`prtMarkerSuppliesClass` = 4, e.g. waste toner box) the level is the remaining free space, so a low value means *almost full*.
- Optional data that many low-end devices don't implement (serial number, page counter, console display text, alert table) is handled gracefully: if the OID is missing, the item simply stays empty instead of becoming unsupported. Trays and covers are only discovered if the device reports them.
- Console display text and supply/tray/cover names sent as UTF-8 Hex-STRING are decoded automatically.
- The meaning of the page counter (sheets, impressions, clicks) depends on the vendor. For per-function counters (print/copy/scan, mono/color) use vendor-specific MIBs in a separate template.

## Author

HugoFiermein
