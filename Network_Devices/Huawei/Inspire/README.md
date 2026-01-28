# Template Net Huawei Inspire SNMP

## Overview

This template provides SNMP-based monitoring for **Huawei Inspire Controller** devices, commonly used in telecom and network environments with integrated AC/DC power distribution.

The template focuses on **connectivity, system health, and electrical measurements**, allowing proactive monitoring of both network availability and power conditions.

## Tested on

- Device: Huawei Inspire Controller
- Zabbix version: 6.0 / 7.0
- SNMP version: v2c
- Firmware: Vendor default (telecom environment)

## Features

- Device availability (ICMP ping)
- System uptime
- Network latency and packet loss
- AC power status
- AC measurements:
  - Voltage per phase (L1, L2, L3)
  - Current per phase (L1, L2, L3)
  - Active power
  - Energy consumption (kWh)
- DC output monitoring:
  - Output voltage
  - Output current
  - Output power
  - DC energy consumption
- Power and operational status monitoring via SNMP

## Items

- ICMP Ping
- ICMP Loss
- ICMP Response Time
- System Uptime
- AC Input Voltage (L1, L2, L3)
- AC Input Current (L1, L2, L3)
- AC Active Power
- AC Energy Consumption
- DC Output Voltage
- DC Output Current
- DC Output Power
- DC Energy Consumption
- Power operational and electrical status indicators

## Triggers

- Device unreachable
- High latency
- Packet loss detected
- Power status abnormal
- Electrical parameter out of normal range

## Macros

The following macros can be adjusted if needed:

- `{$SNMP_COMMUNITY}` – SNMP community string
- `{$ICMP_LOSS_WARN}` – Packet loss warning threshold
- `{$ICMP_LATENCY_WARN}` – Latency warning threshold

## Setup

1. Import the template into Zabbix.
2. Assign the template to a Huawei Inspire Controller host.
3. Configure SNMP interface (IP, community, port).
4. Ensure SNMP is enabled on the device.
5. Wait for data collection.

## Notes

- This template uses standard Huawei MIBs and device-specific OIDs.
- Designed for telecom environments with integrated power monitoring.
- Grafana dashboards are not included in this repository.

## Author

Community contribution

## License

Distributed under the same license as the Zabbix community templates repository.
