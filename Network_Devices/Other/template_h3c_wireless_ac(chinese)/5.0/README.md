# H3C AC

## Overview

# H3C 无线控制器  
  
### 功能  
  
- CPU、内存使用率  
- 序列号  
- 流量  
- 各种认证协议在先用户数量  
- 在线AP数  
- DHCP地址池发现，地址池满报警  
- AP发现，AP用户数，AP在线时间监控，AP断线报警  
- 一张聚合图形  
  
### 宏  
  
- {$SNMP\_COMMUNITY}: SNMP v2 团体字  
- {$DHCP\_POOL\_H}: 地址池阈值  
  
### 其他  
  
- CPU、内存的硬件序号因设备型号而定，需要按照型号不同进行调整


 


fix:修正了链接模板后重复应用集无法导入的问题。



## Author

thuhak

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$DHCP_POOL_H}|<p>-</p>|`95`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AP Discovery|<p>-</p>|`SNMP agent`|AP<p>Update: 1200</p>|
|DHCP Server Discovery|<p>-</p>|`SNMP agent`|dhcpserver<p>Update: 1200</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|序列号|<p>-</p>|`SNMP agent`|sn<p>Update: 7200</p>|
|下行流量|<p>-</p>|`SNMP agent`|Bps_out<p>Update: 60</p>|
|上行流量|<p>-</p>|`SNMP agent`|Bps_in<p>Update: 60</p>|
|每秒mac认证用户异常掉线数|<p>-</p>|`SNMP agent`|user.mac_lostcon<p>Update: 60</p>|
|在线AP数量|<p>-</p>|`SNMP agent`|ap.count<p>Update: 120</p>|
|当前关联认证用户总数|<p>-</p>|`SNMP agent`|user.asso<p>Update: 60</p>|
|当前免认证用户总数|<p>-</p>|`SNMP agent`|user.free<p>Update: 60</p>|
|每秒免认证用户异常掉线数|<p>-</p>|`SNMP agent`|user.free_lostcon<p>Update: 60</p>|
|当前mac认证用户总数|<p>-</p>|`SNMP agent`|user.mac<p>Update: 60</p>|
|当前portal认证用户总数|<p>-</p>|`SNMP agent`|user.portal<p>Update: 60</p>|
|每秒DHCP请求数|<p>-</p>|`SNMP agent`|dhcp.requests<p>Update: 60</p>|
|内存使用率|<p>-</p>|`SNMP agent`|cpu.mem_usage<p>Update: 60</p>|
|每秒portal认证用户异常掉线数|<p>-</p>|`SNMP agent`|user.portal_lostcon<p>Update: 60</p>|
|每秒关联证用户异常掉线数|<p>-</p>|`SNMP agent`|user.asso_lostcon<p>Update: 60</p>|
|每秒认证失败|<p>-</p>|`Calculated`|user.lostcon<p>Update: 60</p>|
|CPU 使用率|<p>-</p>|`SNMP agent`|cpu.usage<p>Update: 60</p>|
|当前用户总数|<p>-</p>|`Calculated`|user.count<p>Update: 60</p>|
|AP $1 关联认证在线用户数|<p>-</p>|`SNMP agent`|ap.asso[{#APNAME}]<p>Update: 120</p><p>LLD</p>|
|AP $1 免认证在线用户数|<p>-</p>|`SNMP agent`|ap.free[{#APNAME}]<p>Update: 120</p><p>LLD</p>|
|AP $1 地址|<p>-</p>|`SNMP agent`|ap.ip[{#APNAME}]<p>Update: 7200</p><p>LLD</p>|
|AP $1 mac认证在线用户数|<p>-</p>|`SNMP agent`|ap.mac[{#APNAME}]<p>Update: 30</p><p>LLD</p>|
|AP $1 在线时间|<p>-</p>|`SNMP agent`|ap.onlinetime[{#APNAME}]<p>Update: 120</p><p>LLD</p>|
|AP $1 portal认证在线用户数|<p>-</p>|`SNMP agent`|ap.portal[{#APNAME}]<p>Update: 120</p><p>LLD</p>|
|DHCP 地址池 $1 利用率|<p>-</p>|`SNMP agent`|dhcp.pool[{#DHCPPOOL}]<p>Update: 120</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|AP {#APNAME} 一天不在线|<p>-</p>|<p>**Expression**: {Device H3C AC:ap.onlinetime[{#APNAME}].max(1d)}=0</p><p>**Recovery expression**: </p>|average|
|AC 地址池 {#DHCPPOOL} 快满|<p>地址池 {#DHCPPOOL} 使用率超过{$DHCP_POOL_H}%</p>|<p>**Expression**: {Device H3C AC:dhcp.pool[{#DHCPPOOL}].last()}>95</p><p>**Recovery expression**: </p>|high|
|AP {#APNAME} 一天不在线 (LLD)|<p>-</p>|<p>**Expression**: {Device H3C AC:ap.onlinetime[{#APNAME}].max(1d)}=0</p><p>**Recovery expression**: </p>|average|
|AC 地址池 {#DHCPPOOL} 快满 (LLD)|<p>地址池 {#DHCPPOOL} 使用率超过{$DHCP_POOL_H}%</p>|<p>**Expression**: {Device H3C AC:dhcp.pool[{#DHCPPOOL}].last()}>95</p><p>**Recovery expression**: </p>|high|
