# Template Cisco Nexus Optical Power

## Overview

This Zabbix template monitors SFP/SFP+ DOM optical RX/TX power and related thresholds on Cisco Nexus switches using SNMP and ENTITY-SENSOR-MIB / CISCO-ENTITY-SENSOR-MIB.

It discovers transceiver sensors and creates items for:
- RX optical power (dBm)
- TX optical power (dBm)
- RX/TX warning thresholds
- RX/TX alarm thresholds

Tested on:
- Cisco Nexus 9000 series

## Setup

1. Import the template into Zabbix 7.4.
2. Configure SNMP on the Cisco Nexus device.
3. Link the template to the host.
4. Wait for discovery to run (by default every 1h).

## Macros used

This template does not require any user macros by default.

## Discovery rules

- Optical RX power discovery
- Optical TX power discovery
- Thresholds discovery for RX/TX (high/low, warning and alarm)

## Items collected (per interface)

- `{#IFNAME}: RX optical power`
- `{#IFNAME}: TX optical power`
- `{#IFNAME}: RX optical high/low warning threshold`
- `{#IFNAME}: RX optical high/low alarm threshold`
- `{#IFNAME}: TX optical high/low warning threshold`
- `{#IFNAME}: TX optical high/low alarm threshold`

## Triggers

- `{#IFNAME}: RX optical power out of WARNING range`
- `{#IFNAME}: RX optical power out of ALARM range`
- `{#IFNAME}: TX optical power out of WARNING range`
- `{#IFNAME}: TX optical power out of ALARM range`

## Author

Template created by **Endrit Ajeti**.
