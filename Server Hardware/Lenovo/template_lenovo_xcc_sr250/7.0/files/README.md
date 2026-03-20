# Zabbix Template – Lenovo XCC (SR250 tuned)

Developed by **Grujowmi**

## Compatibility
- Zabbix 7.0
- SNMP v2c
- Lenovo XClarity Controller (XCC)

## Why this variant
Some platforms (e.g., SR250) expose fewer sensor entries (temperature/fan/voltage/PSU) via SNMP.
This variant keeps the same sensor LLD + graphs, and adds **VPD / inventory** items so you still get useful device identification data.

## What’s monitored
- Overall health (systemHealthStat + health summary LLD)
- LLD discovery + graphs:
  - Temperature sensors (reading vs critical-high)
  - Fan sensors (speed vs critical-low)
  - Voltage sensors (reading vs critical high/low)
- System:
  - sysDescr, sysUpTime
- Inventory / VPD (added):
  - Product name
  - Machine type
  - Machine model
  - Serial number
  - UUID

## Graphs
- Classic graphs + graph prototypes (one per discovered sensor).

## SNMP walk commands (same style)
```bash
snmpwalk -v2c -c public IP_XCC 1.3.6.1.2.1.1 > xcc_sys.txt
snmpwalk -v2c -c public IP_XCC 1.3.6.1.4.1.19046.11.1 > xcc_lenovo_xcc_full.txt
snmpwalk -v2c -c public IP_XCC 1.3.6.1.4.1.19046.11.1.1.4 > xcc_health.txt
snmpwalk -v2c -c public IP_XCC 1.3.6.1.4.1.19046.11.1.1.1 > xcc_temperature.txt
snmpwalk -v2c -c public IP_XCC 1.3.6.1.4.1.19046.11.1.1.3 > xcc_fans.txt
snmpwalk -v2c -c public IP_XCC 1.3.6.1.4.1.19046.11.1.1.2 > xcc_voltage.txt
snmpwalk -v2c -c public IP_XCC 1.3.6.1.4.1.19046.11.1.1.11 > xcc_psu.txt
```

## Notes
- The YAML does not contain any developer nickname; only this README does.
- If you want to squeeze more SR250-specific data (power/energy, event logs, FRU tables), provide SNMP walks from the SR250 and we will extend safely without generating empty items.
