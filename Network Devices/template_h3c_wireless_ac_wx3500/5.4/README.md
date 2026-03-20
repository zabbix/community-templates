# Network-H3C-WLC

## Overview

# 宏


{$APCOUNTS} AP总数


{$SNMP\_COMMUNITY} 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AP/STA|<p>-</p>|`SNMP agent`|h3cDot11RadioStaCurAssocSum<p>Update: 30s</p>|
|Access Points|<p>-</p>|`SNMP agent`|hos.ap<p>Update: 30s</p>|
|SSID/STA|<p>-</p>|`SNMP agent`|h3cDot11APConfigPortalStaNum<p>Update: 30s</p>|
|Radio/STA|<p>-</p>|`SNMP agent`|h3cDot11APMacAddress<p>Update: 30s</p>|
|Client Signal|<p>-</p>|`SNMP agent`|h3cDot11StationSignalStrength<p>Update: 10m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|当前AP总数|<p>-</p>|`SNMP agent`|h3cDot11APConnectCount<p>Update: 30s</p>|
|控制器CPU利用率-slot1|<p>-</p>|`SNMP agent`|cpu-1<p>Update: 60s</p>|
|控制器在线时间|<p>-</p>|`SNMP agent`|AC-System-Uptime<p>Update: 60s</p>|
|当前客户端总数|<p>-</p>|`SNMP agent`|h3cDot11StationConnectCount<p>Update: 30s</p>|
|控制器内存利用率-slot2|<p>-</p>|`SNMP agent`|memory-2<p>Update: 60s</p>|
|控制器CPU利用率-slot2|<p>-</p>|`SNMP agent`|cpu-2<p>Update: 60s</p>|
|漫游次数|<p>-</p>|`SNMP agent`|h3cDot11IntraACRoamingSuccCnt2<p>Update: 30s</p>|
|控制器主机名|<p>-</p>|`SNMP agent`|sysName<p>Update: 30s</p>|
|控制器内存利用率-slot1|<p>-</p>|`SNMP agent`|memory-1<p>Update: 60s</p>|
|当前在线客户端数量/AP - {#APNAME}|<p>-</p>|`SNMP agent`|h3cDot11ApStationCurAssocSum[{#APNAME}]<p>Update: 30s</p><p>LLD</p>|
|AP CPU实时利用率 - {#APNAME}|<p>-</p>|`SNMP agent`|hos.apCPU.[{#APNAME}]<p>Update: 30s</p><p>LLD</p>|
|AP 内存实时利用率 - {#APNAME}|<p>-</p>|`SNMP agent`|hos.apMemory.[{#APNAME}]<p>Update: 30s</p><p>LLD</p>|
|AP 在线时间 - {#APNAME}|<p>-</p>|`SNMP agent`|hos.apUptime.[{#APNAME}]<p>Update: 20s</p><p>LLD</p>|
|客户端关联失败数 - {#APNAME}|<p>-</p>|`SNMP agent`|hos.AssocFailNum.[{#APNAME}]<p>Update: 20s</p><p>LLD</p>|
|SSID/客户端- {#SSIDNAME}|<p>-</p>|`SNMP agent`|h3cDot11APConfigPortalStaNum[{#SSIDNAME}]<p>Update: 30s</p><p>LLD</p>|
|AP $1 - 射频1客户端数|<p>-</p>|`SNMP agent`|hos.radio1[{#APNAME}]<p>Update: 30s</p><p>LLD</p>|
|AP $1 - 射频2客户端数|<p>-</p>|`SNMP agent`|hos.radio2[{#APNAME}]<p>Update: 30s</p><p>LLD</p>|
|AP $1 - 射频3客户端数|<p>-</p>|`SNMP agent`|hos.radio3[{#APNAME}]<p>Update: 30s</p><p>LLD</p>|
|$1 - 客户端信号强度|<p>-</p>|`SNMP agent`|hos.clising[{#CLIENTIP}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#APNAME} AP在线用户>65，请及时确认|<p>-</p>|<p>**Expression**: last(/Network-H3C-WLC/h3cDot11ApStationCurAssocSum[{#APNAME}])>65</p><p>**Recovery expression**: last(/Network-H3C-WLC/h3cDot11ApStationCurAssocSum[{#APNAME}])<65</p>|high|
|信号强度>-75db，请及时确认|<p>-</p>|<p>**Expression**: last(/Network-H3C-WLC/hos.clising[{#CLIENTIP}])<-75</p><p>**Recovery expression**: last(/Network-H3C-WLC/hos.clising[{#CLIENTIP}])>-75</p>|average|
|{#APNAME} AP在线用户>65，请及时确认 (LLD)|<p>-</p>|<p>**Expression**: last(/Network-H3C-WLC/h3cDot11ApStationCurAssocSum[{#APNAME}])>65</p><p>**Recovery expression**: last(/Network-H3C-WLC/h3cDot11ApStationCurAssocSum[{#APNAME}])<65</p>|high|
|信号强度>-75db，请及时确认 (LLD)|<p>-</p>|<p>**Expression**: last(/Network-H3C-WLC/hos.clising[{#CLIENTIP}])<-75</p><p>**Recovery expression**: last(/Network-H3C-WLC/hos.clising[{#CLIENTIP}])>-75</p>|average|
