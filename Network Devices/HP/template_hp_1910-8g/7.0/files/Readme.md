# Zabbix Template – HP Switch (1910 Series)

Developed by **Grujowmi**

## Overview
SNMP template for HP 1910 / ProCurve-like switches.

## Features
- System information (sysDescr, sysName, sysUpTime)
- Interface discovery (LLD)
- Per-interface traffic (bps, derived from ifHCInOctets/ifHCOutOctets)
- Per-interface errors
- Trigger prototypes (link down, errors)
- Graph prototype (traffic in/out)

## Compatibility
- Zabbix 7.0
- SNMP v2c

## Notes
If interface discovery is empty, verify that IF-MIB/IFX-MIB is allowed for the SNMP user/community (views/ACLs).
