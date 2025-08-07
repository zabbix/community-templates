# Sophos XG/SFOS Firewall SNMPv2 (v20+) with IPsec VPN Discovery

## Description

This template is an enhanced version of the original community template for Sophos XG series firewalls (SFOS v18 and newer), tested up to SFOS v21. It provides comprehensive monitoring via SNMPv2.

* **Original Template Author:** R.P.Wimmer
* **Enhancements by:** Bráulio Augusto
* **Original Template Source:** [https://github.com/zabbix/community-templates/tree/main/Network_Devices/template_sophos_xg_firewall_version_18.0.x/6.0](https://github.com/zabbix/community-templates/tree/main/Network_Devices/template_sophos_xg_firewall_version_18.0.x/6.0)

This version includes all original functionalities and adds a new Low-Level Discovery (LLD) rule for IPsec Site-to-Site VPN tunnels.

## Overview

This template works in conjunction with the standard Zabbix module templates to provide basic functionality (CPU, interfaces, etc.) and adds specific monitoring for Sophos services, hardware, licenses, and the new VPN discovery feature.

Sophos version 20 or higher is required, as this version allows you to monitor IPsec connections.

**New Feature Added: IPsec Site-to-Site VPN Discovery**
-   Automatically discovers all configured IPsec tunnels using SNMP.
-   Creates item prototypes for each tunnel to monitor its **Connection Status** and **Activation Status**.
-   Includes two intelligent trigger prototypes:
    1.  A **high-severity** alert for real connection failures (a tunnel that was previously active has dropped).
    2.  A **low-severity** informational alert when a tunnel is intentionally disabled in the firewall configuration.
-   This logic avoids false positives for backup/failover links and planned maintenance.

**MIBs Used:**
* SFOS-FIREWALL-MIB
* HOST-RESOURCES-MIB (via linked template)
* IF-MIB (via linked template)

64 static items and 39 triggers + discovered interface items and triggers

Necessary MIB:
SOPHOS-XG-MIBxx.txt - you have to upload it on monitoring endpoint server or proxy (for CentOS /usr/share/snmp/mib)  
 https://docs.sophos.com/nsg/sophos-firewall/MIB/SOPHOS-XG-MIB.zip  
---
## Zabbix Version

Created and tested on **Zabbix 7.0**.

---

## Setup Instructions

1.  **Ensure Base Templates Exist:** This template depends on standard Zabbix modules. Before importing, make sure the following templates are available in your Zabbix instance:
    * `Template Module Generic SNMP`
    * `Template Module Interfaces SNMP`
    * `Template Module HOST-RESOURCES-MIB CPU SNMP`
2.  **Import this template file** into your Zabbix instance (`Configuration -> Templates -> Import`). Zabbix should link the dependencies automatically.
3.  **Value maps** already created in the template

    * **Name:** `Sophos VPN Connection Status`
        * `0` -> `Inactive`
        * `1` -> `Active`
        * `2` -> `Partially Active`

    * **Name:** `Sophos VPN Activation Status`
        * `0` -> `Inactive`
        * `1` -> `Active`

4.  **Link the template** (`Sophos XG FW 18 SNMPv2`) to your Sophos Firewall host.
5.  **Configure the `{$SNMP_COMMUNITY}` macro** on the host with your SNMP community string.

---

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>Your SNMP community string.</p>|`public`|Text macro|
|{$CPU.UTIL.CRIT}|<p>Critical threshold for CPU utilization.</p>|`90`|Text macro|
|{$DISK_UTIL_MAX}|<p>Critical threshold for disk utilization.</p>|`90`|Text macro|
|{$MEMORY_UTIL_MAX}|<p>Critical threshold for memory utilization.</p>|`90`|Text macro|
|{$SWAP_UTIL_MAX}|<p>Critical threshold for swap utilization.</p>|`90`|Text macro|


## Template links

|Name|
|----|
|Template Module Generic SNMP|
|Template Module HOST-RESOURCES-MIB CPU SNMP|
|Template Module Interfaces SNMP|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IPsec VPN Tunnels Discovery|<p>Discovers tunnels and creates items to monitor their status.<br><b>Discovery OID:</b> .1.3.6.1.4.1.2604.5.1.6.1.1.1.1.2 (VPN Name)<br><b>Monitored OIDs:</b> .1.3.6.1.4.1.2604.5.1.6.1.1.1.1.9 (Connection Status) and .1.3.6.1.4.1.2604.5.1.6.1.1.1.1.10 (Activation Status)</p>|`SNMP agent`|ipsec.tunnel.discovery<p>Update: 1h</p>|
|Network interfaces discovery|<p>Discovering interfaces from IF-MIB (inherited from linked template).</p>|`SNMP agent`|net.if.discovery<p>Update: 1h</p>|


## Items collected (Sample)

This template adds specific items for Sophos firewalls. Other items for CPU, Memory, and general SNMP are inherited from the linked module templates.

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device name|<p>The name of the firewall device.</p>|`SNMP agent`|applianceName<p>Update: 1h</p>|
|Firmware version|<p>The current SFOS firmware version.</p>|`SNMP agent`|firewallVersion<p>Update: 1h</p>|
|Memory utilization|<p>System memory utilization percentage.</p>|`SNMP agent`|memoryPercentUsage<p>Update: 1m</p>|
|VPN Connection Status: {#VPN_NAME}|<p>The real-time connection status of the discovered IPsec tunnel.</p>|`SNMP agent`|sophos.ipsec.conn.status[{#VPN_NAME}]<p>Update: 1m</p><p>LLD</p>|
|VPN Activation Status: {#VPN_NAME}|<p>The configuration state (enabled/disabled) of the discovered IPsec tunnel.</p>|`SNMP agent`|sophos.ipsec.activation.status[{#VPN_NAME}]<p>Update: 1h</p><p>LLD</p>|


## Triggers (Sample)

Includes specific triggers for Sophos services and intelligent triggers for the newly discovered VPN tunnels.

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|ALERT: VPN connection {#VPN_NAME} is down|<p>Fires if a previously active VPN connection drops. Ignores tunnels that were already disconnected.</p>|<p>**Expression**: (last(...)conn.status...=0 or 2) and min(...)conn.status...,5m)=1</p>|Disaster|
|INFO: VPN {#VPN_NAME} has been disabled|<p>Fires with a low priority if a VPN tunnel is intentionally disabled in the firewall configuration.</p>|<p>**Expression**: last(...)activation.status...=0</p>|Information|
|Memory utilization high|<p>Fires if memory usage is above {$MEMORY_UTIL_MAX}.</p>|<p>**Expression**: avg(/.../memoryPercentUsage,15m)>{$MEMORY_UTIL_MAX}</p>|High|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>Fires if an interface link goes down (inherited from linked template).</p>|<p>**Expression**: ...</p>|Average|