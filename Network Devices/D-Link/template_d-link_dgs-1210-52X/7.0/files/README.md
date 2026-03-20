# Zabbix Template – D-Link DGS-1210-52X

Developed by **Grujowmi**

## Overview
This template provides SNMP monitoring for D-Link DGS-1210-52X switches.

## Included
- System information (sysDescr, sysName, sysUpTime)
- Interface discovery (IF-MIB / IFX-MIB)
- Traffic monitoring (in/out, 64-bit counters)

## Compatibility
- Zabbix 7.0
- SNMP v2c

## Notes
This model exposes limited hardware sensors. CPU, memory and temperature are not available via SNMP.
