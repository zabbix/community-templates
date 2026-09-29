# Huawei VRP OSPF by SNMP

## Overview

Monitors OSPFv2 (RFC 4750 OSPF-MIB) on Huawei VRP devices (validated on S5700/S6700/S6730 running VRP, S6730 tested on V200R022C00) via SNMP.

PREREQUISITE (mandatory, done on the device, not in Zabbix):  
By default a Huawei OSPF process is NOT bound to SNMP, so this MIB stays empty until you run, for each OSPF process to monitor:  
  system-view  
  ospf <process-id>  
  quit  
  ospf mib-binding <process-id>  
This only enables SNMP visibility for that process; it does not affect OSPF operation, adjacencies or convergence.

Discovers and monitors:  
- OSPF neighbors (ospfNbrTable): adjacency state, Router ID, state-change counter, retransmission queue length  
- OSPF interfaces (ospfIfTable): interface state, admin status, state-change counter, DR/BDR  
- OSPF areas (ospfAreaTable): SPF run counter, LSA count, ABR/ASBR count  
- Process-wide scalars: Router ID, admin status, ABR/ASBR flag, external LSA count, LSA origination/reception rate

Note: the neighbor discovery index ({#SNMPINDEX}) is the neighbor's Hello source IP address (ospfNbrIpAddr), which can differ from the Router ID shown by 'display ospf peer' on the CLI - both are exposed as separate items.

MIBs used:  
OSPF-MIB (RFC 4750)

Built from the official Huawei S5700/S6700 V200R025C00 documentation (MIB Reference > OSPF-MIB).

## Setup

**Required: bind the OSPF process to SNMP on the device before importing this template.** By default, Huawei VRP does **not** expose OSPF-MIB over SNMP for any process, so every item/discovery rule here returns "No Such Object" until this is done.

Source: Huawei S5700/S6700 documentation (Command Reference > IP Unicast Routing Commands > OSPF Configuration Commands > `ospf mib-binding`; and MIB Reference > OSPF-MIB > ospfNbrTable, "Access Restriction"). Command: `ospf mib-binding process-id`. Views: System view. Default level: 2 (Configuration level).

```
<HUAWEI> system-view
[HUAWEI] ospf 100
[HUAWEI-ospf-100] quit
[HUAWEI] ospf mib-binding 100
```

Replace `100` with the actual OSPF process ID (`display ospf peer` on the device shows it as "OSPF Process N"). Repeat for every OSPF process you want to monitor. This only enables SNMP visibility for that process — it does not affect OSPF operation, adjacencies or convergence.

After binding, confirm with:

```
snmpget -v2c -c <community> <device-ip> 1.3.6.1.2.1.14.1.1.0
```

A valid Router ID back (not "No Such Object") confirms the binding worked and the template can be imported.

## Author

luiz-camillo

## Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$OSPF.NBR.EVENTS.MAX.WARN}|Max allowed increase in ospfNbrEvents within 10m before a neighbor is considered flapping.|5|
|{$OSPF.NBR.RETRANSQLEN.MAX.WARN}|Max acceptable OSPF LSA retransmission queue length for a neighbor.|5|
|{$OSPF.IF.EVENTS.MAX.WARN}|Max allowed increase in ospfIfEvents within 10m before an OSPF interface is considered flapping.|5|
|{$OSPF.AREA.SPFRUNS.MAX.WARN}|Max allowed increase in ospfSpfRuns within 10m before an area is considered unstable.|10|
|{$OSPF.LSA.RATE.MAX.WARN}|Max acceptable rate (LSAs/s) of originated+received LSAs before flagging high churn.|5|
|{$SNMP.TIMEOUT}|Time window used by the SNMP availability trigger.|5m|

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OSPF neighbor discovery|<p>OSPF-MIB::ospfNbrTable discovery. {#SNMPINDEX} = ospfNbrIpAddr.ospfNbrAddressLessIndex (the neighbor Hello source IP, not necessarily its Router ID). Before this template can read any data, the OSPF process on the Huawei VRP device must be bound to SNMP: system-view / ospf <process-id> / quit / ospf mib-binding <process-id>. By default OSPF processes are NOT bound to SNMP (RFC 4750 OSPF-MIB stays empty otherwise).</p>|`SNMP agent`|ospf.nbr.discovery<p>Update: 10m</p>|
|OSPF interface discovery|<p>OSPF-MIB::ospfIfTable discovery. {#SNMPINDEX} = ospfIfIpAddress.ospfAddressLessIf. Before this template can read any data, the OSPF process on the Huawei VRP device must be bound to SNMP: system-view / ospf <process-id> / quit / ospf mib-binding <process-id>. By default OSPF processes are NOT bound to SNMP (RFC 4750 OSPF-MIB stays empty otherwise).</p>|`SNMP agent`|ospf.if.discovery<p>Update: 30m</p>|
|OSPF area discovery|<p>OSPF-MIB::ospfAreaTable discovery. {#SNMPINDEX} = ospfAreaId. Before this template can read any data, the OSPF process on the Huawei VRP device must be bound to SNMP: system-view / ospf <process-id> / quit / ospf mib-binding <process-id>. By default OSPF processes are NOT bound to SNMP (RFC 4750 OSPF-MIB stays empty otherwise).</p>|`SNMP agent`|ospf.area.discovery<p>Update: 1h</p>|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OSPF: Router ID|<p>MIB: OSPF-MIB ospfRouterId - 32-bit integer (IP address form) uniquely identifying the OSPF router.  Before this template can read any data, the OSPF process on the Huawei VRP device must be bound to SNMP: system-view / ospf <process-id> / quit / ospf mib-binding <process-id>. By default OSPF processes are NOT bound to SNMP (RFC 4750 OSPF-MIB stays empty otherwise).</p>|`SNMP agent`|ospf.routerid[ospfRouterId.0]<p>Update: 30m</p>|
|OSPF: Admin status|<p>MIB: OSPF-MIB ospfAdminStat - administrative status of OSPF on the device.</p>|`SNMP agent`|ospf.adminstat[ospfAdminStat.0]<p>Update: 5m</p>|
|OSPF: Area border router status|<p>MIB: OSPF-MIB ospfAreaBdrRtrStatus - whether this device is an Area Border Router.</p>|`SNMP agent`|ospf.abrstatus[ospfAreaBdrRtrStatus.0]<p>Update: 1h</p>|
|OSPF: AS border router status|<p>MIB: OSPF-MIB ospfASBdrRtrStatus - whether this device is configured as an AS Border Router.</p>|`SNMP agent`|ospf.asbrstatus[ospfASBdrRtrStatus.0]<p>Update: 1h</p>|
|OSPF: External LSA count|<p>MIB: OSPF-MIB ospfExternLsaCount - number of external (type-5) LSAs in the link state database.</p>|`SNMP agent`|ospf.externlsacount[ospfExternLsaCount.0]<p>Update: 15m</p>|
|OSPF: Originated LSAs rate|<p>MIB: OSPF-MIB ospfOriginateNewLsas - rate of new LSAs originated by this device. Sustained high rate indicates topology churn.</p>|`SNMP agent`|ospf.originatenewlsas.rate[ospfOriginateNewLsas.0]<p>Update: 5m</p>|
|OSPF: Received LSAs rate|<p>MIB: OSPF-MIB ospfRxNewLsas - rate of new (not self-originated) LSAs received. Sustained high rate indicates topology churn elsewhere in the AS.</p>|`SNMP agent`|ospf.rxnewlsas.rate[ospfRxNewLsas.0]<p>Update: 5m</p>|
|OSPF: Total neighbors|<p>Number of OSPF neighbors currently discovered (any state), aggregated from the per-neighbor ospf.nbr.state[] items created by the neighbor discovery rule.</p>|`Calculated`|ospf.nbr.count<p>Update: 1m</p>|
|OSPF: Neighbors in Full state|<p>Number of OSPF neighbors currently in state full(8), aggregated from the per-neighbor ospf.nbr.state[] items created by the neighbor discovery rule.</p>|`Calculated`|ospf.nbr.count.full<p>Update: 1m</p>|
|OSPF: SNMP agent availability|<p>Availability of SNMP checks on the host. The value of this item corresponds to availability icons in the host list. Possible value: 0 - not available 1 - available 2 - unknown</p>|`Zabbix internal`|zabbix[host,snmp,available]|
|OSPF neighbor {#SNMPINDEX}: State|<p>MIB: OSPF-MIB ospfNbrState - the state of the relationship with this neighbor (full(8) = adjacency up).</p>|`SNMP agent`|ospf.nbr.state[ospfNbrState.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|OSPF neighbor {#SNMPINDEX}: Router ID|<p>MIB: OSPF-MIB ospfNbrRtrId - Router ID of the neighboring router (informational, used for readable alerts).</p>|`SNMP agent`|ospf.nbr.rtrid[ospfNbrRtrId.{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|
|OSPF neighbor {#SNMPINDEX}: State changes|<p>MIB: OSPF-MIB ospfNbrEvents - cumulative count of state changes/errors for this neighbor.</p>|`SNMP agent`|ospf.nbr.events[ospfNbrEvents.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|OSPF neighbor {#SNMPINDEX}: Retransmission queue length|<p>MIB: OSPF-MIB ospfNbrLsRetransQLen - current length of the LSA retransmission queue toward this neighbor.</p>|`SNMP agent`|ospf.nbr.retransqlen[ospfNbrLsRetransQLen.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF interface {#SNMPINDEX}: State|<p>MIB: OSPF-MIB ospfIfState - OSPF interface state (down/waiting/pointToPoint/DR/BDR/otherDR).</p>|`SNMP agent`|ospf.if.state[ospfIfState.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|OSPF interface {#SNMPINDEX}: Admin status|<p>MIB: OSPF-MIB ospfIfAdminStat - administrative status of OSPF on this interface.</p>|`SNMP agent`|ospf.if.adminstat[ospfIfAdminStat.{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|OSPF interface {#SNMPINDEX}: State changes|<p>MIB: OSPF-MIB ospfIfEvents - cumulative count of state changes/errors on this interface.</p>|`SNMP agent`|ospf.if.events[ospfIfEvents.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|OSPF interface {#SNMPINDEX}: Designated router|<p>MIB: OSPF-MIB ospfIfDesignatedRouterId - Router ID of the elected Designated Router on this network.</p>|`SNMP agent`|ospf.if.dr[ospfIfDesignatedRouterId.{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|OSPF interface {#SNMPINDEX}: Backup designated router|<p>MIB: OSPF-MIB ospfIfBackupDesignatedRouterId - Router ID of the elected Backup Designated Router.</p>|`SNMP agent`|ospf.if.bdr[ospfIfBackupDesignatedRouterId.{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|OSPF area {#SNMPINDEX}: SPF runs|<p>MIB: OSPF-MIB ospfSpfRuns - number of times the SPF (Dijkstra) calculation has run for this area.</p>|`SNMP agent`|ospf.area.spfruns[ospfSpfRuns.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|OSPF area {#SNMPINDEX}: LSA count|<p>MIB: OSPF-MIB ospfAreaLsaCount - total LSAs in this area link state database (excludes AS-external).</p>|`SNMP agent`|ospf.area.lsacount[ospfAreaLsaCount.{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|OSPF area {#SNMPINDEX}: ABR count|<p>MIB: OSPF-MIB ospfAreaBdrRtrCount - number of Area Border Routers reachable within this area.</p>|`SNMP agent`|ospf.area.abrcount[ospfAreaBdrRtrCount.{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|OSPF area {#SNMPINDEX}: ASBR count|<p>MIB: OSPF-MIB ospfAsBdrRtrCount - number of AS Border Routers reachable within this area.</p>|`SNMP agent`|ospf.area.asbrcount[ospfAsBdrRtrCount.{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|OSPF: Process administratively disabled|<p>The OSPF process was administratively disabled on this device.</p>|<p>**Expression**: last(/Huawei VRP OSPF by SNMP/ospf.adminstat[ospfAdminStat.0])=2</p>|high|
|OSPF: High LSA churn rate|<p>Sustained high rate of received LSAs, usually a sign of instability somewhere in the OSPF domain.</p>|<p>**Expression**: min(/Huawei VRP OSPF by SNMP/ospf.rxnewlsas.rate[ospfRxNewLsas.0],10m)>{$OSPF.LSA.RATE.MAX.WARN}</p>|warning|
|OSPF: Not all neighbors are Full ({ITEM.LASTVALUE1}/{ITEM.LASTVALUE2})|<p>Summary trigger across all discovered OSPF neighbors. The individual "OSPF neighbor {#SNMPINDEX} is down" triggers already identify which neighbor is affected; this one is for a single at-a-glance NOC-style alert/dashboard tile.</p>|<p>**Expression**: last(/Huawei VRP OSPF by SNMP/ospf.nbr.count.full)<last(/Huawei VRP OSPF by SNMP/ospf.nbr.count) and last(/Huawei VRP OSPF by SNMP/ospf.nbr.count)>0</p>|warning|
|OSPF: No SNMP data collection|<p>SNMP is not available for polling. Check device connectivity, community string and the ospf mib-binding config.</p>|<p>**Expression**: max(/Huawei VRP OSPF by SNMP/zabbix[host,snmp,available],{$SNMP.TIMEOUT})=0</p>|warning|
|OSPF neighbor {#SNMPINDEX} is down|<p>The OSPF adjacency with this neighbor is not Full.</p>|<p>**Expression**: last(/Huawei VRP OSPF by SNMP/ospf.nbr.state[ospfNbrState.{#SNMPINDEX}])<>8</p>|high|
|OSPF neighbor {#SNMPINDEX} is flapping|<p>The neighbor relationship changed state too many times in a short period.</p>|<p>**Expression**: (last(/Huawei VRP OSPF by SNMP/ospf.nbr.events[ospfNbrEvents.{#SNMPINDEX}])-min(/Huawei VRP OSPF by SNMP/ospf.nbr.events[ospfNbrEvents.{#SNMPINDEX}],10m))>{$OSPF.NBR.EVENTS.MAX.WARN}</p>|warning|
|OSPF neighbor {#SNMPINDEX}: Retransmission queue is growing|<p>LSA retransmission queue is not draining, possible congestion or an unstable adjacency.</p>|<p>**Expression**: min(/Huawei VRP OSPF by SNMP/ospf.nbr.retransqlen[ospfNbrLsRetransQLen.{#SNMPINDEX}],10m)>{$OSPF.NBR.RETRANSQLEN.MAX.WARN}</p>|warning|
|OSPF interface {#SNMPINDEX} is down|<p>OSPF is administratively enabled on this interface but its OSPF state is down.</p>|<p>**Expression**: last(/Huawei VRP OSPF by SNMP/ospf.if.state[ospfIfState.{#SNMPINDEX}])=1 and last(/Huawei VRP OSPF by SNMP/ospf.if.adminstat[ospfIfAdminStat.{#SNMPINDEX}])=1</p>|high|
|OSPF interface {#SNMPINDEX} is flapping|<p>The OSPF interface state changed too many times in a short period.</p>|<p>**Expression**: (last(/Huawei VRP OSPF by SNMP/ospf.if.events[ospfIfEvents.{#SNMPINDEX}])-min(/Huawei VRP OSPF by SNMP/ospf.if.events[ospfIfEvents.{#SNMPINDEX}],10m))>{$OSPF.IF.EVENTS.MAX.WARN}</p>|warning|
|OSPF area {#SNMPINDEX}: High SPF recalculation rate|<p>The area recalculated SPF too many times in a short period, indicating topology instability.</p>|<p>**Expression**: (last(/Huawei VRP OSPF by SNMP/ospf.area.spfruns[ospfSpfRuns.{#SNMPINDEX}])-min(/Huawei VRP OSPF by SNMP/ospf.area.spfruns[ospfSpfRuns.{#SNMPINDEX}],10m))>{$OSPF.AREA.SPFRUNS.MAX.WARN}</p>|warning|
