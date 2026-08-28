# FS S3900R by SNMP

## Overview

This template monitors FS (Fiberstore) S3900R series switches via SNMP: device inventory, CPU, memory, interfaces, power supplies, and per-transceiver optical diagnostics (DDM).

Built and verified against a live **S3900-24T4S-R** running firmware `159394` (24x 1G copper + 4x 10G SFP+ uplinks).

## Requirements

- Zabbix server 7.0 or higher
- SNMP access to the switch (SNMPv2c by default; adjust the host's SNMP interface for v3 if needed)

## A note on the transceiver (DDM) discovery rule

The vendor's own optical-diagnostics OID subtree is **not documented anywhere public** (no FIBERSTORE-MIB covers it, and it isn't the subtree some older FS templates reference, which returns "No Such Object" on real hardware). The OIDs used here (`enterprises.52642.9.63.1.7.1.x`) were found empirically by walking the device and matching live, per-port values against known SFF-8472 scaling constants, then **cross-validated against the switch's own CLI** (`show interface tGigaEthernet 0/X`) — TX/RX power, temperature, voltage, bias current, and all five alarm/warning thresholds matched exactly.

Confidence is high, but this is reverse-engineered, not vendor-documented. If you deploy this on a different S3900R unit or firmware and the transceiver metrics look wrong, please open an issue - the OID mapping (or the `^TGigaEthernet` port-name filter used to scope discovery to SFP+-capable ports) may need adjusting for your hardware.

PSU status codes are similarly empirical: only the healthy status (`1`) has been observed, so the "not in normal state" trigger fires on any other value without knowing what those other codes actually mean.

## Discovery rules

| Name | Description |
|------|-------------|
| `net.if.discovery` | Standard IF-MIB interface discovery (traffic, errors, discards, speed, status) |
| `transceiver.ddm.discovery` | Per-transceiver optical diagnostics (TX/RX power, temperature, voltage, bias current) and their live vendor alarm thresholds, for the 4 SFP+-capable ports |
| `psu.discovery` | Power supply status |

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$IF.ERRORS.WARN}` | 2 | Interface error-rate warning threshold |
| `{$IF.UTIL.MAX}` | 90 | Interface bandwidth-utilization warning threshold (%) |
| `{$IFCONTROL}` | 1 | Set to 0 per-interface to suppress its Link down trigger |
| `{$NET.IF.IFNAME.NOT_MATCHES}` etc. | - | Standard interface-discovery filters (see item description) |

Transceiver and PSU alarm thresholds are **not** macros - they're read live from the installed module via SNMP, so they automatically track whatever transceiver is actually plugged into a given port.

## Known limitations

- Transceiver RX-power-low and temperature-too-high triggers have no dependency on their interface's Link-down trigger: Zabbix trigger-prototype dependencies only resolve within the same discovery rule, and these come from two separate ones.
- No chassis temperature or fan monitoring: this device doesn't implement ENTITY-SENSOR-MIB, and no vendor OID for chassis-wide temperature could be found.
