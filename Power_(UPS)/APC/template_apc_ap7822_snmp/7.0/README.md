# APC AP7822 by SNMP

## Overview

This template monitors an **APC AP7822 Metered Rack PDU** through SNMP.

It uses numeric OIDs from **APC PowerNet-MIB v4.6.0**, so PowerNet-MIB does not
need to be installed on the Zabbix server or proxy.

The template contains:

- 36 items
- 11 triggers
- 8 value maps
- Device inventory and capability information
- Total, Bank 1, and Bank 2 current monitoring
- Load-state monitoring based on thresholds configured on the PDU
- Bank low-load, near-overload, and overload thresholds
- Active power, apparent power, and power factor
- Power-supply status and alarm monitoring
- SNMP availability monitoring

## Requirements

- Zabbix 7.0
- An SNMP interface configured on the Zabbix host
- SNMP enabled on the APC AP7822
- Network access from the Zabbix server or proxy to UDP port 161 on the PDU

The template was tested with:

| Component | Version |
|---|---|
| Zabbix | 7.0.28 |
| Device | APC AP7822 |
| Application firmware | v3.9.3 |
| AOS firmware | v3.9.4 |
| SNMP | SNMPv2c |

Other AP7xxx models may expose a similar OID tree, but this template has only
been validated against the AP7822.

## Installation

1. Import `template_apc_ap7822_snmp.yaml` in **Data collection → Templates → Import**.
2. Create a host for the PDU or edit an existing host.
3. Add an SNMP interface using the PDU IP address.
4. Configure the SNMP version and credentials on the host interface.
5. Link the **APC AP7822 by SNMP** template to the host.

No MIB installation or external script is required.

## Macros

| Macro | Default | Description |
|---|---:|---|
| `{$APC.SNMP.TIMEOUT}` | `5m` | Time window used by the SNMP availability trigger. |

## Collected metrics

### Inventory

- PDU name
- Hardware revision
- Firmware revision
- Manufacturing date
- Model
- Serial number
- Device current rating
- Number of outlets, phases, and banks
- Breaker rating
- Controlled and monitored outlet counts
- Device, outlet-layout, and display orientation

### Electrical measurements

- Total current
- Bank 1 current
- Bank 2 current
- Total, Bank 1, and Bank 2 load state
- Bank low-load threshold
- Bank near-overload threshold
- Bank overload threshold
- Configured nominal line-to-line voltage
- Active power
- Apparent power
- Power factor

The current OIDs return tenths of an ampere. The template applies a `0.1`
multiplier during preprocessing.

The nominal voltage item is the configured voltage used by the PDU for power
calculation. It is not a real-time input-voltage measurement.

### Health and availability

- SNMP agent availability
- Power supply 1 status
- Power supply 2 status
- General power-supply alarm

## Triggers

| Trigger condition | Severity |
|---|---|
| SNMP data collection unavailable for `{$APC.SNMP.TIMEOUT}` | Warning |
| Total, Bank 1, or Bank 2 load is low | Information |
| Total, Bank 1, or Bank 2 load is near overload | Warning |
| Total, Bank 1, or Bank 2 load is overloaded | High |
| PDU reports a power-supply alarm | High |

Load triggers use the state reported by the PDU. Thresholds should be configured
on the APC device according to the electrical design and operating requirements
of the installation.

## Known limitations

- The AP7822 has 16 physical outlets but reports `0` controlled outlets and `0`
  outlet-level monitored outlets through the legacy `rPDU` MIB tree.
- Per-outlet switching, state, and current monitoring are therefore not included.
- The template is specific to the legacy APC `rPDU` tree under
  `.1.3.6.1.4.1.318.1.1.12`; it is not intended for newer devices that use
  the `rPDU2` tree.
- Only SNMP polling is included. SNMP trap processing is not configured.

## Author

Mustafa Volkan Vurulkan ([@vurulkan](https://github.com/vurulkan))
