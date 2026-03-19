# Watchguard Firewall SNMP Template (post v12.0)

## Overview

An updated Watchguard template using the corrected SNMP OIDs introduced after the v12.0 firmware update. Updated to Zabbix 7.4 schema with bug fixes and discovery improvements over the original 6.0 version.

## Monitored Items

- Active Connections
- Available Memory
- Free Memory
- Total Memory
- CPU Utilization
- Device Description
- Device Location
- Device Name
- Device Uptime
- Total Bytes Received
- Total Bytes Sent

## Discovery Rules

- **Network Interfaces** — discovers interfaces and monitors inbound/outbound traffic, errors, and operational status
- **Access Rules** — discovers firewall access rules and monitors traffic per rule

## Changes from 6.0 version

- Updated to Zabbix 7.4 schema
- Fixed duplicate OID bug — `wgSystemTotalSendBytes` now  uses `.1.3.6.1.4.1.3097.6.3.10.0`
- Fixed interface discovery OID (was using ifOutOctets, now uses ifDescr)
- Added `enabled_lifetime_type: DISABLE_NEVER` to discovery rules to prevent discovered items from being disabled
- Added `lifetime: 30d` to discovery rules
- Added `history: 90d` to metric items
- Improved interface item tags to include interface name for easier filtering

## Requirements

- Zabbix 7.4+
- SNMP v2c enabled on the WatchGuard device
- Tested on WatchGuard Fireware v12.0+

## Setup

1. Import the template into Zabbix
2. Link the template to your WatchGuard host
3. Set the `{$SNMP_COMMUNITY}` macro to match your device's SNMP community string (default: `MonitorZabbix`)
4. Ensure UDP port 161 is accessible from your Zabbix server/proxy to the device

## Author

Original template by klheuser  
Updated to Zabbix 7.4 with bug fixes
