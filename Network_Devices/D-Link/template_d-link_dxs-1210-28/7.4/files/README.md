# Zabbix Template – D-Link DXS-1210 (SNMP v2c)

## Overview
This template targets **D-Link DXS-1210 series** switches (tested on **DXS-1210-28S**).
It is built for **Zabbix 7.4** and uses **SNMP v2c**.

It provides:
- Basic system information (SYS-MIB)
- Interface discovery (LLD) using IF-MIB / IFX-MIB
- Traffic (64-bit counters), errors, admin/oper status
- Basic hardware health (temperature, fan, PSU) and memory gauges using D-Link enterprise OIDs

CPU utilization is **not included** because the available enterprise subtree does not expose an unambiguous CPU load metric in the provided walk.

## Requirements
- Zabbix Server/Proxy **7.4**
- Switch reachable via SNMP from Zabbix server or assigned proxy
- SNMP v2c enabled on the switch
- Community configured (default macro: `{$SNMP_COMMUNITY}`)

## Import
1. Zabbix UI → **Data collection → Templates → Import**
2. Import file: `Template_Net_DLink_DXS1210_SNMP_7.4.yaml`
3. Ensure options are enabled to import templates, items, discovery rules, prototypes and triggers.

Notes:
- UUIDs are **UUIDv4** stored as **32 hex characters** (no dashes), matching the strict validator observed on your Zabbix instance.

## Host configuration
On the switch host:
- Create/ensure an **SNMP interface** with the switch management IP
- Set macro `{$SNMP_COMMUNITY}` to the correct community
- If you use a proxy, assign the host to the proxy

## Interface discovery
- Host → **Discovery** → ensure the rule is **enabled**
- Optionally click **Run now**
- Wait a few minutes for LLD to create items/triggers

LLD filters out non-physical entries such as VLAN interfaces (`L2VLAN`), routing interfaces (`rif`) and any internal CPU pseudo-interfaces.

## What is monitored
### System
- sysUpTime, sysName, sysDescr, sysLocation, sysContact, sysObjectID

### Interfaces (LLD)
- Admin/Oper status
- In/Out traffic (bps)
- In/Out errors (per second)

### Hardware health (enterprise OIDs)
- Temperature (Center)
- Fan status (Right Fan)
- Power supply status (Power 1)
- Memory gauges (raw vendor units)

## Limitations
- Memory values are kept as **raw vendor gauges** (units not guaranteed by the device)
- CPU utilization not included (no reliable OID found in the provided enterprise subtree)

## Troubleshooting
- If interface items show `Unsupported`, verify the host has an SNMP interface and that SNMP v2c community is correct.
- If the device returns `OID not increasing` during `snmpwalk`, use:
  `snmpwalk -v2c -c <community> -Cc <ip> <oid>`
