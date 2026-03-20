# SNMP Router OSPF v2

## Description

https://share.zabbix.com/network_devices/snmp-router-ospf-v2-1

## Overview

Generic monitoring of OSPF-MIB compatible devices, including software routers.


Inspired by [SNMP Router OSPF - V2 + fix](network_devices/generic/snmp-router-ospf-v2-fix "SNMP Router OSPF - V2 + fix") and [Cisco OSPF Neighbors](network_devices/cisco/cisco-ospf-neighbors "Cisco OSPF Neighbors") templates.


Changes:


* Neighbor down detect by non-null DR and null BDR
* LSA and interface event rate monitoring
* Application prototypes


 



## Author

Ilia Slepnev

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OSPF Interfaces|<p>Identifies OSPF Interfaces.</p>|`SNMP agent`|ospfIfIpAddress<p>Update: 5m</p>|
|OSPF Areas|<p>-</p>|`SNMP agent`|ospfAreaId<p>Update: 5m</p>|
|OSPF Neighbors|<p>-</p>|`SNMP agent`|ospfNbrIpAddr<p>Update: 5m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OSPF New LSA originate rate|<p>Dependent item for graphing</p>|`Dependent item`|ospfOriginateNewLsasPerSecond<p>Update: 0</p>|
|OSPF New LSAs received count|<p>The number of link state advertisements received that are determined to be new instantiations. This number does not include newer instantiations of self-originated link state advertisements. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ospfDiscontinuityTime.</p>|`SNMP agent`|ospfRxNewLsas<p>Update: 5m</p>|
|OSPF router ID|<p>A 32-bit integer uniquely identifying the router in the Autonomous System. By convention, to ensure uniqueness, this should default to the value of one of the router's IP interface addresses. This object is persistent and when written the entity SHOULD save the change to non-volatile storage.</p>|`SNMP agent`|ospfRouterId<p>Update: 10m</p>|
|OSPF AS-scope LSA count|<p>The number of AS-scope link state advertisements in the AS-scope link state database.</p>|`SNMP agent`|ospfAsLsaCount<p>Update: 5m</p>|
|OSPF New LSAs originated count|<p>The number of new link state advertisements that have been originated. This number is incremented each time the router originates a new LSA. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ospfDiscontinuityTime.</p>|`SNMP agent`|ospfOriginateNewLsas<p>Update: 5m</p>|
|OSPF router admin status|<p>The administrative status of OSPF in the router. The value 'enabled' denotes that the OSPF Process is active on at least one interface; 'disabled' disables it on all interfaces.</p>|`SNMP agent`|ospfAdminStat<p>Update: 5m</p>|
|OSPF New LSA receive rate|<p>Dependent item for graphing</p>|`Dependent item`|ospfRxNewLsasPerSecond<p>Update: 0</p>|
|OSPF External LSA count|<p>The number of external (LS type-5) link state advertisements in the link state database. OSPF Version 2, Appendix A.4.5 AS external link advertisements</p>|`SNMP agent`|ospfExternLsaCount<p>Update: 5m</p>|
|OSPF interface $1 admin status|<p>The OSPF interface's administrative status. The value formed on the interface, and the interface will be advertised as an internal route to some area. The value 'disabled' denotes that the interface is external to OSPF.</p>|`SNMP agent`|ospfIfAdminStat[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF interface $1 Backup Designated Router|<p>The IP Address of the Backup Designated Router.</p>|`SNMP agent`|ospfIfBackupDesignatedRouter[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF interface $1 Designated Router|<p>The IP Address of the Designated Router.</p>|`SNMP agent`|ospfIfDesignatedRouter[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF interface $1 events|<p>The number of times this OSPF interface has changed its state or an error has occurred. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ospfDiscontinuityTime.</p>|`SNMP agent`|ospfIfEvents[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF interface $1 hello interval|<p>The length of time, in seconds, between the Hello packets that the router sends on the interface. This value must be the same for all routers attached to a common network.</p>|`SNMP agent`|ospfIfHelloInterval[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|OSPF interface $1 dead interval|<p>The number of seconds that a router's Hello packets have not been seen before it's neighbors declare the router down. This should be some multiple of the Hello interval. This value must be the same for all routers attached to a common network.</p>|`SNMP agent`|ospfIfRtrDeadInterval[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|OSPF interface $1 state|<p>The OSPF Interface State.</p>|`SNMP agent`|ospfIfState[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF interface $1 Interface Type|<p>The OSPF interface type. By way of a default, this field may be intuited from the corresponding value of ifType. Broadcast LANs, such as Ethernet and IEEE 802.5, take the value 'broadcast', X.25 and similar technologies take the value 'nbma', and links that are definitively point to point take the value 'pointToPoint'.</p>|`SNMP agent`|ospfIfType[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF interface $1 event rate|<p>Dependent item for graphs</p>|`Dependent item`|ospfIfEventsPerSecond[{#SNMPINDEX}]<p>Update: 0</p><p>LLD</p>|
|OSPF area $1 LSA count|<p>The total number of link-state advertisements in this area's link-state database, excluding AS External LSA's.</p>|`SNMP agent`|ospfAreaLsaCount[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF area $1 status|<p>This variable displays the status of the entry. Setting it to 'invalid' has the effect of rendering it inoperative. The internal effect (row removal) is implementation dependent.</p>|`SNMP agent`|ospfAreaStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF area $1 SPF run count|<p>The number of times that the intra-area route table has been calculated using this area's link-state database. This is typically done using Dijkstra's algorithm.</p>|`SNMP agent`|ospfSpfRuns[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF area $1 SPF run rate|<p>Dependent item for graphing</p>|`Dependent item`|ospfSpfRunsPerSecond[{#SNMPINDEX}]<p>Update: 0</p><p>LLD</p>|
|OSPF NBMA Neighbor $1 Status|<p>This variable displays the status of the entry. Setting it to 'invalid' has the effect of rendering it inoperative. The internal effect (row removal) is implementation dependent.</p>|`SNMP agent`|ospfNbmaNbrStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF Neighbor $1 Router ID|<p>A 32-bit integer (represented as a type IpAddress) uniquely identifying the neighboring router in the Autonomous System.</p>|`SNMP agent`|ospfNbrRtrId[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|OSPF neighbor $1 state|<p>The State of the relationship with this Neighbor. [RU] Возможные состояния Down — начальное состояние процесса обнаружения соседей. Это состояние указывает на то, что от соседей не была получена свежая информация. В NBMA сетях Hello-пакеты могут отправляться и соседям в состоянии Down, однако с меньшей частотой (PollInterval) Attempt — это состояние имеет смысл только для соседей, которые присоединены к NBMA сетям. Оно указывает на то, что от соседа не была получена свежая информация и что нужно сделать попытку связаться с соседом. Это делается путём отправки соседу сообщений Hello с промежутком времени Hello Interval (в Cisco в этом состоянии сообщения Hello отправляются каждый PollInterval. Имеет смысл для соседей в NBMA сетях, которые заданы командой neighbor) Init — состояние, в котором находится маршрутизатор, отправивший своему соседу hello и ожидающий от него ответного hello Two-way — при получении ответных hello маршрутизатор должен увидеть в них свой RID в списке соседей. Если это так, то он устанавливает отношения и переходит в состояние two-way Когда в широковещательном сегменте более 3х маршрутизаторов, то в этом состоянии остаются между собой маршрутизаторы DROTHER Exstart — маршрутизаторы определяют Master/Slave отношения на основании Router ID. Маршрутизатор с высшим RID становится Master-маршрутизатором, который определяет DD Sequence number, а также первым начинает обмен DD-пакетами Exchange — маршрутизаторы посылают друг другу database description пакеты (DD) с информацией о сетях, содержащихся в их собственной LSDB Loading — Если маршрутизатор видит, что части маршрутов нет в его LSDB, он посылает сообщение LSR с перечислением тех сетей, по которым он хочет получить дополнительную информацию. Пока маршрутизатор находится в ожидании ответа в виде LSU сообщений, он пребывает в состоянии Loading Full — Когда маршрутизатор получил всю информацию и LSDB на обоих маршрутизаторах синхронизирована, оба маршрутизатора переходят в состояние fully adjacent (FULL)</p>|`SNMP agent`|ospfNbrState[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|OSPF area {#SNMPINDEX} not active|<p>-</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfAreaStatus[{#SNMPINDEX}].last()}>1</p><p>**Recovery expression**: </p>|warning|
|OSPF interface {#SNMPINDEX} Backup Designated Router is down|<p>DR exists, but not BackupDR — misconfiguration or OSPF link is down</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfIfBackupDesignatedRouter[{#SNMPINDEX}].str(0.0.0.0)}=1 and {SNMP Router OSPF v2:ospfIfDesignatedRouter[{#SNMPINDEX}].str(0.0.0.0)}<>1</p><p>**Recovery expression**: </p>|average|
|OSPF interface {#SNMPINDEX} disabled|<p>-</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfIfAdminStat[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|information|
|OSPF interface {#SNMPINDEX} event|<p>-</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfIfEvents[{#SNMPINDEX}].diff()}<>0</p><p>**Recovery expression**: </p>|information|
|OSPF NBMA Neighbor {#SNMPVALUE} Status|<p>-</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbmaNbrStatus[{#SNMPINDEX}].last()}>1</p><p>**Recovery expression**: </p>|warning|
|OSPF neighbor {#SNMPVALUE} state: attempt|<p>Attempt — это состояние имеет смысл только для соседей, которые присоединены к NBMA сетям. Оно указывает на то, что от соседа не была получена свежая информация и что нужно сделать попытку связаться с соседом. Это делается путём отправки соседу сообщений Hello с промежутком времени Hello Interval (в Cisco в этом состоянии сообщения Hello отправляются каждый PollInterval. Имеет смысл для соседей в NBMA сетях, которые заданы командой neighbor)</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|OSPF neighbor {#SNMPVALUE} state: down|<p>down — начальное состояние процесса обнаружения соседей. Это состояние указывает на то, что от соседей не была получена свежая информация. В NBMA сетях Hello-пакеты могут отправляться и соседям в состоянии Down, однако с меньшей частотой (PollInterval)</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|average|
|OSPF neighbor {#SNMPVALUE} state: exchange|<p>Exchange — маршрутизаторы посылают друг другу database description пакеты (DD) с информацией о сетях, содержащихся в их собственной LSDB</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=6</p><p>**Recovery expression**: </p>|warning|
|OSPF neighbor {#SNMPVALUE} state: exstart|<p>Exstart — маршрутизаторы определяют Master/Slave отношения на основании Router ID. Маршрутизатор с высшим RID становится Master-маршрутизатором, который определяет DD Sequence number, а также первым начинает обмен DD-пакетами</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=5</p><p>**Recovery expression**: </p>|average|
|OSPF neighbor {#SNMPVALUE} state: init|<p>init — состояние, в котором находится маршрутизатор, отправивший своему соседу hello и ожидающий от него ответного hello</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|average|
|OSPF neighbor {#SNMPVALUE} state: loading|<p>Loading — Если маршрутизатор видит, что части маршрутов нет в его LSDB, он посылает сообщение LSR с перечислением тех сетей, по которым он хочет получить дополнительную информацию. Пока маршрутизатор находится в ожидании ответа в виде LSU сообщений, он пребывает в состоянии Loading</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=7</p><p>**Recovery expression**: </p>|warning|
|OSPF interface {#SNMPINDEX} Backup Designated Router is down (LLD)|<p>DR exists, but not BackupDR — misconfiguration or OSPF link is down</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfIfBackupDesignatedRouter[{#SNMPINDEX}].str(0.0.0.0)}=1 and {SNMP Router OSPF v2:ospfIfDesignatedRouter[{#SNMPINDEX}].str(0.0.0.0)}<>1</p><p>**Recovery expression**: </p>|average|
|OSPF interface {#SNMPINDEX} disabled (LLD)|<p>-</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfIfAdminStat[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|information|
|OSPF interface {#SNMPINDEX} event (LLD)|<p>-</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfIfEvents[{#SNMPINDEX}].diff()}<>0</p><p>**Recovery expression**: </p>|information|
|OSPF area {#SNMPINDEX} not active (LLD)|<p>-</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfAreaStatus[{#SNMPINDEX}].last()}>1</p><p>**Recovery expression**: </p>|warning|
|OSPF NBMA Neighbor {#SNMPVALUE} Status (LLD)|<p>-</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbmaNbrStatus[{#SNMPINDEX}].last()}>1</p><p>**Recovery expression**: </p>|warning|
|OSPF neighbor {#SNMPVALUE} state: attempt (LLD)|<p>Attempt — это состояние имеет смысл только для соседей, которые присоединены к NBMA сетям. Оно указывает на то, что от соседа не была получена свежая информация и что нужно сделать попытку связаться с соседом. Это делается путём отправки соседу сообщений Hello с промежутком времени Hello Interval (в Cisco в этом состоянии сообщения Hello отправляются каждый PollInterval. Имеет смысл для соседей в NBMA сетях, которые заданы командой neighbor)</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|OSPF neighbor {#SNMPVALUE} state: down (LLD)|<p>down — начальное состояние процесса обнаружения соседей. Это состояние указывает на то, что от соседей не была получена свежая информация. В NBMA сетях Hello-пакеты могут отправляться и соседям в состоянии Down, однако с меньшей частотой (PollInterval)</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|average|
|OSPF neighbor {#SNMPVALUE} state: exchange (LLD)|<p>Exchange — маршрутизаторы посылают друг другу database description пакеты (DD) с информацией о сетях, содержащихся в их собственной LSDB</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=6</p><p>**Recovery expression**: </p>|warning|
|OSPF neighbor {#SNMPVALUE} state: exstart (LLD)|<p>Exstart — маршрутизаторы определяют Master/Slave отношения на основании Router ID. Маршрутизатор с высшим RID становится Master-маршрутизатором, который определяет DD Sequence number, а также первым начинает обмен DD-пакетами</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=5</p><p>**Recovery expression**: </p>|average|
|OSPF neighbor {#SNMPVALUE} state: init (LLD)|<p>init — состояние, в котором находится маршрутизатор, отправивший своему соседу hello и ожидающий от него ответного hello</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|average|
|OSPF neighbor {#SNMPVALUE} state: loading (LLD)|<p>Loading — Если маршрутизатор видит, что части маршрутов нет в его LSDB, он посылает сообщение LSR с перечислением тех сетей, по которым он хочет получить дополнительную информацию. Пока маршрутизатор находится в ожидании ответа в виде LSU сообщений, он пребывает в состоянии Loading</p>|<p>**Expression**: {SNMP Router OSPF v2:ospfNbrState[{#SNMPINDEX}].last()}=7</p><p>**Recovery expression**: </p>|warning|
