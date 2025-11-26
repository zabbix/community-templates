# Windows Server DHCP Scopes by SNMP

## Overview

This template provides comprehensive monitoring of DHCP scopes on Windows Server using SNMP. It automatically discovers all DHCP scopes and monitors key metrics including free IPs, used IPs, and DHCP server statistics.

The template has been tested on Windows Server 2022 with Zabbix 7.4.

### Requirements

- Zabbix Server 7.0 or higher
- Windows Server with DHCP Server role installed
- SNMP service enabled and configured on the Windows Server (add your Zabbix server/proxy IP address to the permitted hosts list in the service settings)
- Network connectivity between Zabbix Server/Proxy and the DHCP server on UDP port 161

## Authors

- Zilmar de Souza Junior (Original template)
- Updated for Zabbix 7 by [Bel](https://github.com/lotusflowr)

## Template groups

- Templates
- Templates/Applications

## Tags

|Tag|Value|
|---|-----|
|class|software|
|target|dhcp|
|target|windows-server|

## Macros used

There are no macros in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DHCP: Scopes discovery|<p>Discovers all DHCP scopes configured on the Windows Server using SNMP walk.</p>|`Dependent item`|dhcp.scope.discovery<p>Update: Dependent on master item</p><p>Master item: dhcp.walk</p><p>Lifetime: 30 days</p>|

### LLD Macros

|Macro|Description|
|-----|-----------|
|{#IPSCOPE}|The IP address/network of the discovered DHCP scope|
|{#IPFREE}|Number of free IP addresses in the scope|
|{#IPUSED}|Number of used IP addresses in the scope|
|{#IPOFFERS}|Number of offered IP addresses in the scope|

## Items collected

### Global DHCP Server Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DHCP: ACKs, total|<p>Total number of DHCP ACK messages sent by the server. MIB object: DHCP-MIB::dhcpAcks</p>|`SNMP agent`|dhcp.acks<p>Update: 1m</p><p>History: 7d</p><p>OID: 1.3.6.1.4.1.311.1.3.1.6.0</p>|
|DHCP: Declines, total|<p>Total number of DHCP DECLINE messages received by the server. MIB object: DHCP-MIB::dhcpDeclines</p>|`SNMP agent`|dhcp.declines<p>Update: 1m</p><p>History: 7d</p><p>OID: 1.3.6.1.4.1.311.1.3.1.8.0</p>|
|DHCP: Discovers, total|<p>Total number of DHCP DISCOVER messages received by the server. MIB object: DHCP-MIB::dhcpDiscovers</p>|`SNMP agent`|dhcp.discovers<p>Update: 1m</p><p>History: 7d</p><p>OID: 1.3.6.1.4.1.311.1.3.1.2.0</p>|
|DHCP: NACKs, total|<p>Total number of DHCP NACK messages sent by the server. MIB object: DHCP-MIB::dhcpNacks</p>|`SNMP agent`|dhcp.nacks<p>Update: 1m</p><p>History: 7d</p><p>OID: 1.3.6.1.4.1.311.1.3.1.7.0</p>|
|DHCP: Offers, total|<p>Total number of DHCP OFFER messages sent by the server. MIB object: DHCP-MIB::dhcpOffers</p>|`SNMP agent`|dhcp.offers<p>Update: 1m</p><p>History: 7d</p><p>OID: 1.3.6.1.4.1.311.1.3.1.5.0</p>|
|DHCP: Releases, total|<p>Total number of DHCP RELEASE messages received by the server. MIB object: DHCP-MIB::dhcpReleases</p>|`SNMP agent`|dhcp.releases<p>Update: 1m</p><p>History: 7d</p><p>OID: 1.3.6.1.4.1.311.1.3.1.4.0</p>|
|DHCP: Requests, total|<p>Total number of DHCP REQUEST messages received by the server. MIB object: DHCP-MIB::dhcpRequests</p>|`SNMP agent`|dhcp.requests<p>Update: 1m</p><p>History: 7d</p><p>OID: 1.3.6.1.4.1.311.1.3.1.3.0</p>|
|DHCP: Get scope data|<p>Master item that performs SNMP walk to collect all scope data. Converted to JSON for dependent items. No history stored.</p>|`SNMP agent`|dhcp.walk<p>Update: 1m</p><p>History: 0</p><p>Value type: Text</p><p>OID: walk[1.3.6.1.4.1.311.1.3.2.1.1]</p>|

### Per-Scope Items (LLD)

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DHCP: Scope [{#IPSCOPE}]: IPs free|<p>Number of free IP addresses available in the scope</p>|`Dependent item`|dhcp.free[{#IPSCOPE}]<p>Master item: dhcp.walk</p>|
|DHCP: Scope [{#IPSCOPE}]: IPs used|<p>Number of IP addresses currently allocated in the scope</p>|`Dependent item`|dhcp.allocated[{#IPSCOPE}]<p>Master item: dhcp.walk</p>|
|DHCP: Scope [{#IPSCOPE}]: IPs offered|<p>Number of IP addresses currently offered but not yet acknowledged</p>|`Dependent item`|dhcp.offers[{#IPSCOPE}]<p>Master item: dhcp.walk</p>|
|DHCP: Scope [{#IPSCOPE}]: Network|<p>The network address of the DHCP scope</p>|`Dependent item`|dhcp.scope.network[{#IPSCOPE}]<p>Value type: Text</p><p>Master item: dhcp.walk</p>|
|DHCP: Scope [{#IPSCOPE}]: Utilization, in %|<p>Percentage of the scope that is currently in use. Calculated as: (Used IPs / (Used IPs + Free IPs)) * 100</p>|`Calculated`|dhcp.used.percent[{#IPSCOPE}]<p>Units: %</p><p>Formula: 100 * last(//dhcp.allocated[{#IPSCOPE}]) / (last(//dhcp.allocated[{#IPSCOPE}]) + last(//dhcp.free[{#IPSCOPE}]))</p>|

## Triggers

|Name|Description|Expression|Priority|Operational Data|
|----|-----------|----------|--------|----------------|
|DHCP: Scope [{#IPSCOPE}]: Critical low free IPs (< 5%)|<p>The DHCP scope has less than 5% of IP addresses available. Immediate action is required to prevent service disruption.<br><br>**Possible actions:**<br>- Expand the DHCP scope range<br>- Reduce lease time to free up unused addresses faster<br>- Investigate if there are devices holding multiple leases<br>- Check for DHCP exhaustion attacks</p>|<p>**Expression**: last(/Windows Server DHCP Scopes by SNMP/dhcp.used.percent[{#IPSCOPE}],#1)>=95</p>|HIGH|Free: {ITEM.LASTVALUE2}, Used: {ITEM.LASTVALUE3}, Utilization: {ITEM.LASTVALUE1}|
|DHCP: Scope [{#IPSCOPE}]: Low free IPs (< 10%)|<p>The DHCP scope has less than 10% of IP addresses available. Consider taking action to prevent running out of addresses.<br><br>**Recommended actions:**<br>- Monitor the trend to see if utilization is increasing<br>- Plan to expand the DHCP scope range if needed<br>- Review lease times and adjust if appropriate<br>- Check for unused or stale leases</p>|<p>**Expression**: last(/Windows Server DHCP Scopes by SNMP/dhcp.used.percent[{#IPSCOPE}],#1)>=90</p>|AVERAGE|Free: {ITEM.LASTVALUE2}, Used: {ITEM.LASTVALUE3}, Utilization: {ITEM.LASTVALUE1}|
|DHCP: Scope [{#IPSCOPE}]: High volume of leases|<p>There has been a sudden increase of more than 10% in DHCP scope utilization. This may indicate:<br><br>- A DHCP exhaustion attack<br>- A network issue causing mass reconnections<br>- A large number of new devices connecting to the network<br>- A misconfigured device requesting multiple IP addresses<br><br>Investigate the cause immediately to prevent potential service disruption.</p>|<p>**Expression**: change(/Windows Server DHCP Scopes by SNMP/dhcp.used.percent[{#IPSCOPE}])>10</p>|HIGH|Utilization change: {ITEM.LASTVALUE1}%|

## Graphs

### Per-Scope Graphs (LLD)

|Name|Description|Items|
|----|-----------|-----|
|DHCP: Scope [{#IPSCOPE}]: IPs free/used|<p>Displays the number of free vs. used IP addresses in the scope</p>|<p>- DHCP: Scope [{#IPSCOPE}]: IPs used (Green)<br>- DHCP: Scope [{#IPSCOPE}]: IPs free (Blue)</p>|
|DHCP: Scope [{#IPSCOPE}]: Utilization|<p>Shows the percentage of scope utilization over time</p>|<p>- DHCP: Scope [{#IPSCOPE}]: Utilization, in % (Green)</p>|

## Technical Notes

### SNMP OIDs Used

This template uses Microsoft's DHCP Server MIB (1.3.6.1.4.1.311.1.3):

- **1.3.6.1.4.1.311.1.3.1.x**: Global DHCP server statistics
- **1.3.6.1.4.1.311.1.3.2.1.1**: DHCP scope information table

### Data Collection Method

1. Master Item Pattern: A single SNMP walk collects all scope data (master item: `dhcp.walk`)
   - History storage: 0 (raw data, not stored)
   - Update interval: 1m
   - Preprocessing: SNMP walk converted to JSON format

2. Dependent Items: Extract specific metrics using JSONPath
   - No additional SNMP queries required
   - Minimal system load
   - Consistent data across all metrics

3. Discovery Rule:
   - Uses dependent item type (no additional polling)
   - Preprocessing: Discard unchanged with heartbeat (1h) to reduce database writes
   - Lifetime: 30d for discovered entities

4. Optimizations:
   - Text items (network addresses) use "Discard unchanged with heartbeat" (1h)
   - Calculated items update every 1m for real-time utilization tracking