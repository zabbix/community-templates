# APC PDU APDU10351ME Zabbix Template

A simple Zabbix template for monitoring APC rack PDU (Power Distribution Unit) `APDU10351ME` systems via SNMP using APC cPDU MIB v1.8.

This PDU model doesn't meter all power outlets.

## Features

### Monitored Parameters
- **Phase Thresholds**
  - Low Load Threshold (warning level)
  - Near Overload Threshold (high warning level)
  - Overload Threshold (critical level)
- **Phase Loads**
  - Real-time current monitoring for all 3 phases
  - Current values in Amperes (A)

### Applications
The template organizes monitoring into three logical applications:
- **Phases** - Real-time phase load monitoring
- **Thresholds** - Configuration thresholds for each phase
- **Information** - Device identification and status

### Status Mapping
The template includes APC Status Load State mapping:
- `lowLoad` - Phase load below low threshold
- `normal` - Phase load within normal range
- `nearOverload` - Phase load approaching overload threshold
- `overload` - Phase load exceeds overload threshold

## Configuration

### Configurable Macros
The template uses macros for easy SNMP configuration:

| Macro | Default Value | Description |
|-------|---------------|-------------|
| `{$SNMP_COMMUNITY}` | public | SNMP community string |

## Installation

1. **Import Template**
   ```
   Configuration → Templates → Import
   ```
   Select the `template_apc_pdu_apdu10351me.yaml` file

2. **Configure SNMP**
   - Create a new host or select existing host
   - Configure SNMP interface with your PDU IP address
   - Set up SNMP credentials (community string)

3. **Link Template**
   - Link the "APC PDU APDU10351ME" template to your host
   - Adjust macro values if needed for your environment

4. **Verify**
   - Check that items are collecting data
   - Verify triggers are working correctly

## Requirements

- **Zabbix Server**: 7.x or higher
- **SNMP**: v1/v2c support required
- **Network**: SNMP access to APC PDU device
- **Permissions**: Read access to APC cPDU MIB OIDs

## SNMP OIDs Used

### Phase Thresholds
| Parameter | OID | Description |
|-----------|-----|-------------|
| Phase 1 Low Load Threshold | 1.3.6.1.4.1.318.1.1.32.3.2.1.5.1.1 | Low load warning threshold for phase 1 |
| Phase 2 Low Load Threshold | 1.3.6.1.4.1.318.1.1.32.3.2.1.5.1.2 | Low load warning threshold for phase 2 |
| Phase 3 Low Load Threshold | 1.3.6.1.4.1.318.1.1.32.3.2.1.5.1.3 | Low load warning threshold for phase 3 |
| Phase 1 Near Overload Threshold | 1.3.6.1.4.1.318.1.1.32.3.2.1.7.1.1 | Near overload threshold for phase 1 |
| Phase 2 Near Overload Threshold | 1.3.6.1.4.1.318.1.1.32.3.2.1.7.1.2 | Near overload threshold for phase 2 |
| Phase 3 Near Overload Threshold | 1.3.6.1.4.1.318.1.1.32.3.2.1.7.1.3 | Near overload threshold for phase 3 |
| Phase 1 Overload Threshold | 1.3.6.1.4.1.318.1.1.32.3.2.1.6.1.1 | Overload threshold for phase 1 |
| Phase 2 Overload Threshold | 1.3.6.1.4.1.318.1.1.32.3.2.1.6.1.2 | Overload threshold for phase 2 |
| Phase 3 Overload Threshold | 1.3.6.1.4.1.318.1.1.32.3.2.1.6.1.3 | Overload threshold for phase 3 |

### Phase Loads
| Parameter | OID | Description |
|-----------|-----|-------------|
| Phase 1 Load | 1.3.6.1.4.1.318.1.1.32.3.4.1.5.1.1 | Current load for phase 1 |
| Phase 2 Load | 1.3.6.1.4.1.318.1.1.32.3.4.1.5.1.2 | Current load for phase 2 |
| Phase 3 Load | 1.3.6.1.4.1.318.1.1.32.3.4.1.5.1.3 | Current load for phase 3 |

## Triggers

The template includes comprehensive triggers for all phases:

### Warning Triggers (HIGH priority)
- **Phase Near Overload** - Triggered when phase load exceeds near overload threshold

### Critical Triggers (DISASTER priority)
- **Phase Overload** - Triggered when phase load exceeds overload threshold

### Information Triggers (INFO priority)
- **No Load** - Triggered when phase load is below low load threshold

## Graphs

The template includes a stacked graph "APC Current Usage" showing all three phases:
- Phase 1: Green (33FF33)
- Phase 2: Cyan (33FFFF)
- Phase 3: Blue (3333FF)

## Disclaimer

This template is provided as-is. Test thoroughly in your environment before production use. The author is not responsible for any issues that may arise from using this template.