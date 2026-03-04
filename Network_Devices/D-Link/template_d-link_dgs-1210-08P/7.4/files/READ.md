# Zabbix Template – D-Link DGS-1210 (SNMP v2c)

## 📌 Overview

This Zabbix template provides monitoring for **D-Link DGS-1210 series switches**
(tested on **DGS-1210-08P**) using **SNMP v2c**.

The template is designed to be:
- **Stable**
- **Production-ready**
- **Fully compatible with Zabbix 7.4**
- Based only on **reliable SNMP data actually exposed by the device**

CPU, memory and temperature metrics are intentionally excluded, as they are not
consistently or reliably exposed by this switch model.

---

## ✅ Features

### General monitoring
- System uptime (`sysUpTime`)
- Device name (`sysName`)
- System description (`sysDescr`)
- Location (`sysLocation`)
- System Object ID (`sysObjectID`)

### Network interfaces (LLD)
Automatic interface discovery using **IF-MIB / IFX-MIB**:
- Operational status
- Administrative status
- Inbound / outbound traffic (bps)
- Input / output errors
- Automatic exclusion of internal / non-physical interfaces (CPU, VLAN, rif)

> ⚠️ The discovery **does not create new hosts**.  
> It only creates items on the existing switch host.

---

## 🔧 Requirements

- **Zabbix Server / Proxy 7.4**
- SNMP **v2c enabled** on the switch
- SNMP community configured (e.g. `public`)
- Network connectivity between the switch and:
  - Zabbix server **or**
  - Assigned Zabbix proxy

---

## 📥 Template Import

1. Zabbix UI → **Data collection → Templates → Import**
2. Select the file:
