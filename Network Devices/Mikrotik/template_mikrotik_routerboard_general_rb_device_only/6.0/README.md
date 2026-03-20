# Mikrotik RouterBOARD

## Description

Ros 专用模板（RB设备） 该模板只用于RouterOS路由系统监控，其它设备请绕路。 By:【犯罪嫌疑人】

## Overview

 ①丶该模板仅用于RB设备... 


 ②丶该模板适用于4.x及以上版本；4.x以下版本不要下载，下了也没什么卵用！


 


 


 


 


 


 


 


 


人生的第一次这样就→


做得不好尽管上来怼我，反正也帮不了你。



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|发现网络接口|<p>正则表达式2-3位数字 ^ d{2,3}$</p>|`SNMP agent`|net.if.discovery<p>Update: 30s</p>|
|发现本地网卡接口|<p>正则表达式1-10号网卡 ^([1,2,3,4,5,6,7,8,9]|10)$</p>|`SNMP agent`|discoverylocal<p>Update: 30s</p>|
|发现接口流量统计|<p>-</p>|`SNMP agent`|net.if.discoveryStatistics<p>Update: 30s</p>|
|自动检查CPU|<p>-</p>|`SNMP agent`|system.discoverycpu<p>Update: 3s</p>|
|自动检查VPN拨出帐号|<p>-</p>|`SNMP agent`|net.if.discoveryppp<p>Update: 30s</p>|
|自动发现本地网卡流量统计|<p>-</p>|`SNMP agent`|net.if.discoveryStatisticslocal<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|设备温度|<p>-</p>|`SNMP agent`|mikrotik.device.temperature<p>Update: 30s</p>|
|内存使用率|<p>-</p>|`Calculated`|vm.memory.pused[memoryUsedPercentage.Memory]<p>Update: 30s</p>|
|剩余内存|<p>-</p>|`Calculated`|vm.memory.free[hrStoragefree.Memory]<p>Update: 30s</p>|
|CPU使用率（总）|<p>提示：请根据自己设备的核心数来填！复制公式代码即可。 参考如下： 2核心公式 (last(cpucore[ifnum1])+last(cpucore[ifnum2]))/2 3核心公式 (last(cpucore[ifnum1])+last(cpucore[ifnum2])+last(cpucore[ifnum3]))/3 4核心公式 (last(cpucore[ifnum1])+last(cpucore[ifnum2])+last(cpucore[ifnum3])+last(cpucore[ifnum4]))/4</p>|`Calculated`|cpucore[ifnum]<p>Update: 30s</p>|
|运行时间|<p>-</p>|`SNMP agent`|mikrotik.uptime<p>Update: 30s</p>|
|已用内存|<p>-</p>|`SNMP agent`|vm.memory.used[hrStorageUsed.Memory]<p>Update: 15s</p>|
|CPU温度|<p>-</p>|`SNMP agent`|mikrotik.cpu.temperature<p>Update: 30s</p>|
|内存大小|<p>-</p>|`SNMP agent`|vm.memory.total[hrStorageSize.Memory]<p>Update: 15s</p>|
|{#IFNAME}流量接收|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 1s</p><p>LLD</p>|
|{#IFNAME}流量发送|<p>-</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 1s</p><p>LLD</p>|
|{#IFNAME}网卡流量接收|<p>-</p>|`SNMP agent`|net.if.in[localin.{#SNMPINDEX}]<p>Update: 1s</p><p>LLD</p>|
|{#IFNAME}网卡流量发送|<p>-</p>|`SNMP agent`|net.if.out[localout.{#SNMPINDEX}]<p>Update: 1s</p><p>LLD</p>|
|{#IFNAME}接收总量获取|<p>-</p>|`SNMP agent`|net.if[interface.in.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#IFNAME}发送总量获取|<p>-</p>|`SNMP agent`|net.if[interface.out.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU{#SNMPINDEX}使用|<p>-</p>|`SNMP agent`|cpucore[ifnum{#SNMPINDEX}]<p>Update: 15s</p><p>LLD</p>|
|{#IFNAME}流量接收|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctetsppp.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#IFNAME}流量发送|<p>-</p>|`SNMP agent`|net.if.out[ifHCOutOctetsppp.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#IFNAME}本地网卡接收总量获取|<p>-</p>|`SNMP agent`|net.if[localinterface.in.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#IFNAME}本地网卡发送总量获取|<p>-</p>|`SNMP agent`|net.if[localinterface.out{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

