# Grandstream GXW4224 SNMP Template

## Overview
Template for monitoring **Grandstream GXW4224 VoIP Gateway** via SNMP.  
Supports Zabbix **7.4** and provides visibility into firmware, network mode, uptime, temperature sensors, and FXS port states.

## Features
- **Firmware monitoring**
  - Base, Bootloader, Core, Program versions
  - Trigger on firmware change
- **Network mode**
  - Value map for Static / DHCP / PPPoE
- **Device uptime**
  - Preprocessing to convert hundredths of seconds to seconds
  - Trigger on reboot
  - Graph for uptime
- **Temperature sensors**
  - Sensor 1 and Sensor 2 values in °C
  - Trigger on overheating
- **FXS ports**
  - Hook status (On/Off Hook)
  - Registration status (Registered/Not Registered)

## Requirements
- Zabbix 7.4+
- SNMP enabled on Grandstream GXW4224
- Community string configured in host SNMP interface

## Setup
1. Import the template into Zabbix.
2. Link the template to your Grandstream GXW4224 host.
3. Ensure SNMP community and version match your device configuration.
4. After discovery runs, items for all ports will be created automatically.

## Triggers
- Device reboot detected
- Firmware version changed
- Temperature sensor high
- Port hook/registration status changes (visible in Latest data)

## Value maps
- **NetworkMode**:  
  - 1 → Static  
  - 2 → DHCP  
  - 3 → PPPoE

## Author
Contributed by community member for Grandstream GXW4224 monitoring.

---