# SNMP Mikrotik

## Overview

Based upon default template "Mikrotik by SNMP" from Zabbix v6.4.11

1: Implemented dynamic SNMP indexes for all Network interfaces discovery item prototypes
2: Implemented optical power monitoring using MikroTik MIB with OIDs Tx=1.3.6.1.4.1.14988.1.1.19.1.1.9 Rx=1.3.6.1.4.1.14988.1.1.19.1.1.10
3: Added a trigger prototype warning for optical Rx power beyond dBm range from -15 to +15

This resolves the interfaces like PPPoE, L2TP etc to be monitored properly as the SNMP indexes for these keep changing and we never get alerts.

## Author
Parvinder Singh

