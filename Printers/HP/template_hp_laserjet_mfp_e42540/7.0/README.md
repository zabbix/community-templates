# HP LaserJet MFP E42540 by SNMP

## Overview

Monitors an HP LaserJet MFP E42540 (monochrome, and compatible HP Enterprise/Managed printers) over SNMP, using only the standard **Printer-MIB (RFC 3805)** and **Host Resources MIB**. No vendor-specific/private MIB is required for the core metrics, so this template will generally also work — as-is or with minimal changes — on other HP Enterprise/Managed printers that expose the same standard MIBs.

This template is structurally identical to the `template_hp_color_laserjet_mfp_e78630` template — since discovery is fully SNMP LLD-based, it will simply discover fewer consumables (typically 1 black cartridge plus drum/maintenance kits) instead of 4 color cartridges.

Author: github.com/ikbalr

## Requirements

- Zabbix version: 7.0
- SNMP (v1/v2c, tested with v2c) enabled on the printer, with a community string configured (default macro value: `public`)
- Printer must support Printer-MIB (RFC 3805) and Host Resources MIB (standard on virtually all network-attached HP LaserJet/Enterprise printers)

## Tested versions

- HP LaserJet MFP E42540

## Setup

1. Import the template into Zabbix.
2. Create a host for the printer, add an **SNMP interface** (port 161).
3. Link the template `HP LaserJet MFP E42540 SNMP` to the host.
4. If the printer's SNMP community string is not `public`, override the `{$SNMP_COMMUNITY}` macro at the host level.
5. Wait for the discovery rules to run (or trigger them manually via **Execute now**) so that consumables, paper trays, and active alerts are discovered.

## Macros

| Macro | Default | Description |
|---|---|---|
| `{$SNMP_COMMUNITY}` | `public` | SNMP community string |
| `{$SUPPLY.LOW.WARN}` | `20` | Consumable level (%) threshold for a WARNING trigger |
| `{$SUPPLY.LOW.CRIT}` | `8` | Consumable level (%) threshold for a HIGH (critical) trigger |

## Items collected

- Device model, serial number, system name
- Device status (`hrDeviceStatus`: running / warning / down)
- Total pages printed (lifetime engine cycle counter, and its per-second rate)
- Total monochrome / color impressions (lifetime, HP private MIB — the color counter will typically read 0/not-applicable on this monochrome model)

### Discovery rule: Consumables (toner/supplies) discovery

Auto-discovers every consumable reported via `prtMarkerSuppliesTable` (black toner cartridge, drum, maintenance kit, document feeder kit, etc.). For each discovered consumable:

- Level (raw, `prtMarkerSuppliesLevel`)
- Max capacity (`prtMarkerSuppliesMaxCapacity`)
- Level percent (calculated)
- A graph showing level (%) over time

### Discovery rule: Paper trays discovery

Auto-discovers every paper tray reported via `prtInputTable`. For each tray:

- Current level
- Max capacity
- Status (`prtInputStatus`)
- A graph showing current level over time

### Discovery rule: Active alerts discovery

Auto-discovers currently active device conditions/alerts via `prtAlertTable` (e.g. toner low, tray empty, cover open, paper jam). This reflects the **live** state — items only exist while the condition is active. It does **not** provide a historical event log (HP does not expose the historical Event Log page via standard SNMP); Zabbix's own Problems history serves as the closest equivalent once triggers have fired at least once.

## Triggers

- Device is in DOWN status
- Device is in WARNING status
- `{consumable}` is low / critically low (based on `{$SUPPLY.LOW.WARN}` / `{$SUPPLY.LOW.CRIT}`)
- `{tray}` reports an issue (empty/jam/offline)
- `{alert}` (critical) / `{alert}` (warning) / `{alert}` (info) — from the active alerts discovery

## Dashboard

A template dashboard ("HP E42540 Overview") is included with:
- Graph grid of all discovered consumable levels (%)
- Graph grid of all discovered tray levels
- Device status, model, serial number, and total page count widgets

## Known limitations

- The detailed Usage Page breakdown by job type (Print/Copy/Fax) is **not** available via standard SNMP.
- Values are only as fresh as the item's polling interval (default 5 minutes for supply/tray levels); they are not push/real-time.
