# Cloud BingoCloud BMS by HTTP

## Description

Template for BMS API

## Overview

The Zabbix Template includes discovery rules, item prototypes, trigger prototypes and graphs, Zabbix will periodically gather resource metrics from HTTP/HTTPS REST API, convert metrics into JSON object, automatically create resource metrics by discovery rules, and send triggers based on the trigger rules.

## Author

BingoCloud

## Macros used

| Name                    | Description          | Default      | Type       |
|-------------------------|----------------------|--------------|------------|
| {$BINGOMS_ACCESS_TOKEN} | BINGOMS_ACCESS_TOKEN | 5            | Text macro |
| {$BINGOMS_API_IP}       | BINGOMS_API_IP       | 10.16.160.11 | Text macro |
| {$BINGO_API_PORT}       | BINGO_API_PORT       | 8098         | Text macro |
| {$BINGO_SDN_VERSION}    | BINGO_SDN_VERSION    | 4.8.17       | Text macro |

## Template links

There are no template links in this template.

## Discovery rules

| Name                                                      | Description | Type       | Key and additional info                        |
|-----------------------------------------------------------|-------------|------------|------------------------------------------------|
| BingoMS CloudNode CloudNodeList Discovery                 | -           | HTTP agent | "bms.CloudNode.CloudNodeList.Discovery         |
| Update: 1m"                                               |
| BingoMS CloudPhysicalNode CloudPhysicalNodeList Discovery | -           | HTTP agent | "bms.CloudPhysicalNode.CloudNodeList.Discovery |
| Update: 1m"                                               |
| BingoMS CloudService CloudServiceList Discovery           | -           | HTTP agent | "bms.CloudService.CloudServiceList.Discovery   |
| Update: 1m"                                               |
| BingoMS CloudStorage CloudStorageList Discovery           | -           | HTTP agent | "bms.CloudStorage.CloudStorageList.Discovery   |
| Update: 1m"                                               |

## Items collected

| Name                                                                                                    | Description | Type           | Key and additional info                                                                                |
|---------------------------------------------------------------------------------------------------------|-------------|----------------|--------------------------------------------------------------------------------------------------------|
| BingoMS CloudNode CloudNodeList                                                                         | -           | HTTP agent     | "bms.CloudNode.CloudNodeList                                                                           |
| Update: 1m"                                                                                             |
| BingoMS CloudPhysicalNode CloudPhysicalNodeList                                                         | -           | HTTP agent     | "bms.CloudPhysicalNode.CloudPhysicalNodeList                                                           |
| Update: 1m"                                                                                             |
| BingoMS CloudScale BccChildVer                                                                          | -           | HTTP agent     | "bms.CloudScale.BccChildVer                                                                            |
| Update: 1m"                                                                                             |
| BingoMS CloudScale BccVersion                                                                           | -           | HTTP agent     | "bms.CloudScale.BccVersion                                                                             |
| Update: 23h"                                                                                            |
| BingoMS CloudScale CloudDns                                                                             | -           | HTTP agent     | "bms.CloudScale.CloudDns                                                                               |
| Update: 23h"                                                                                            |
| BingoMS CloudScale CloudNodeNum                                                                         | -           | HTTP agent     | "bms.CloudScale.CloudNodeNum                                                                           |
| Update: 23h"                                                                                            |
| BingoMS CloudScale CloudNtp                                                                             | -           | HTTP agent     | "bms.CloudScale.CloudNtp                                                                               |
| Update: 1m"                                                                                             |
| BingoMS CloudScale ClusterNum                                                                           | -           | HTTP agent     | "bms.CloudScale.ClusterNum                                                                             |
| Update: 23h"                                                                                            |
| BingoMS CloudScale CountallIns                                                                          | -           | HTTP agent     | "bms.CloudScale.CountallIns                                                                            |
| Update: 1m"                                                                                             |
| BingoMS CloudScale CountrunIns                                                                          | -           | HTTP agent     | "bms.CloudScale.CountrunIns                                                                            |
| Update: 1m"                                                                                             |
| BingoMS CloudScale CountstopIns                                                                         | -           | HTTP agent     | "bms.CloudScale.CountstopIns                                                                           |
| Update: 1m"                                                                                             |
| BingoMS CloudScale CpuNum                                                                               | -           | HTTP agent     | "bms.CloudScale.CpuNum                                                                                 |
| Update: 1m"                                                                                             |
| BingoMS CloudScale CpuNumLog                                                                            | -           | HTTP agent     | "bms.CloudScale.CpuNumLog                                                                              |
| Update: 1m"                                                                                             |
| BingoMS CloudScale CpuNumUsed                                                                           | -           | HTTP agent     | "bms.CloudScale.CpuNumUsed                                                                             |
| Update: 1m"                                                                                             |
| BingoMS CloudScale CpuPhyNum                                                                            | -           | HTTP agent     | "bms.CloudScale.CpuPhyNum                                                                              |
| Update: 1m"                                                                                             |
| BingoMS CloudScale MemNum                                                                               | -           | HTTP agent     | "bms.CloudScale.MemNum                                                                                 |
| Update: 1m"                                                                                             |
| BingoMS CloudScale MemNumLog                                                                            | -           | HTTP agent     | "bms.CloudScale.MemNumLog                                                                              |
| Update: 1m"                                                                                             |
| BingoMS CloudScale MemNumUsed                                                                           | -           | HTTP agent     | "bms.CloudScale.MemNumUsed                                                                             |
| Update: 1m"                                                                                             |
| BingoMS CloudScale PhyNodeNum                                                                           | -           | HTTP agent     | "bms.CloudScale.PhyNodeNum                                                                             |
| Update: 1m"                                                                                             |
| BingoMS CloudService CloudServiceList                                                                   | -           | HTTP agent     | "bms.CloudService.CloudServiceList                                                                     |
| Update: 1m"                                                                                             |
| BingoMS CloudStorage CloudStorageList                                                                   | -           | HTTP agent     | "bms.CloudStorage.CloudStorageList                                                                     |
| Update: 1m"                                                                                             |
| BingoMS CloudNode {#NODE_MACHINEID} cpuMax                                                              | -           | Dependent item | "host.cloudNodeList.CloudNode.cpuMax.[{#NODE_MACHINEID}]                                               |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudNode {#NODE_MACHINEID} cpuNode                                                             | -           | Dependent item | "host.cloudNodeList.CloudNode.cpuNode.[{#NODE_MACHINEID}]                                              |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudNode {#NODE_MACHINEID} cpuNum                                                              | -           | Dependent item | "host.cloudNodeList.CloudNode.cpuNum.[{#NODE_MACHINEID}]                                               |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudNode {#NODE_MACHINEID} cpuUsed                                                             | -           | Dependent item | "host.cloudNodeList.CloudNode.cpuUsed.[{#NODE_MACHINEID}]                                              |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudNode {#NODE_MACHINEID} cpu_usage                                                           | -           | Dependent item | "host.cloudNodeList.CloudNode.cpu_usage.[{#NODE_MACHINEID}]                                            |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudNode {#NODE_MACHINEID} memMax                                                              | -           | Dependent item | "host.cloudNodeList.CloudNode.memMax.[{#NODE_MACHINEID}]                                               |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudNode {#NODE_MACHINEID} memNode                                                             | -           | Dependent item | "host.cloudNodeList.CloudNode.memNode.[{#NODE_MACHINEID}]                                              |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudNode {#NODE_MACHINEID} memUsed                                                             | -           | Dependent item | "host.cloudNodeList.CloudNode.memUsed.[{#NODE_MACHINEID}]                                              |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudNode {#NODE_MACHINEID} mem_usage                                                           | -           | Dependent item | "host.cloudNodeList.CloudNode.mem_usage.[{#NODE_MACHINEID}]                                            |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudNode {#NODE_MACHINEID} status                                                              | -           | Dependent item | "host.cloudNodeList.CloudNode.status.[{#NODE_MACHINEID}]                                               |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} agent status                                            | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.agent_status.[{#PHY_NODE_MACHINEID}]                     |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} bcc_service_status cc status                            | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.cc.[{#PHY_NODE_MACHINEID}]            |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} bcc_service_status clc status                           | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.clc.[{#PHY_NODE_MACHINEID}]           |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} bcc_service_status host status                          | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.host.[{#PHY_NODE_MACHINEID}]          |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} bcc_service_status metaweb status                       | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.metaweb.[{#PHY_NODE_MACHINEID}]       |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} bcc_service_status node status                          | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.node.[{#PHY_NODE_MACHINEID}]          |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} harddisk error                                          | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.harddisk_error.[{#PHY_NODE_MACHINEID}]                   |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} network error                                           | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.network_error.[{#PHY_NODE_MACHINEID}]                    |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} sdn_info Ovsdb_server                                   | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Ovsdb_server.[{#PHY_NODE_MACHINEID}]            |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} sdn_info Ovs_vswitchd                                   | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Ovs_vswitchd.[{#PHY_NODE_MACHINEID}]            |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} sdn_info Sdn_controller_mem                             | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_controller_mem.[{#PHY_NODE_MACHINEID}]      |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} sdn_info Sdn_flow_count                                 | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_flow_count.[{#PHY_NODE_MACHINEID}]          |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} sdn_info Sdn_health                                     | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_health.[{#PHY_NODE_MACHINEID}]              |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} sdn_info Sdn_ver                                        | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_ver.[{#PHY_NODE_MACHINEID}]                 |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} sdn_info Sdn_vswitch_cpu                                | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_vswitch_cpu.[{#PHY_NODE_MACHINEID}]         |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Cpuload_5min                                     | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Cpuload_5min.[{#PHY_NODE_MACHINEID}]              |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Cpuload_10min                                    | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Cpuload_10min.[{#PHY_NODE_MACHINEID}]             |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Cpuload_15min                                    | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Cpuload_15min.[{#PHY_NODE_MACHINEID}]             |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server MemoryAll                                        | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.MemoryAll.[{#PHY_NODE_MACHINEID}]                 |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server MemoryPer                                        | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.MemoryPer.[{#PHY_NODE_MACHINEID}]                 |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server MemoryUsed                                       | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.MemoryUsed.[{#PHY_NODE_MACHINEID}]                |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Memory_swapAll                                   | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Memory_swapAll.[{#PHY_NODE_MACHINEID}]            |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Memory_swapPer                                   | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Memory_swapPer.[{#PHY_NODE_MACHINEID}]            |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Memory_swapUsed                                  | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Memory_swapUsed.[{#PHY_NODE_MACHINEID}]           |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Net_connect_count                                | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Net_connect_count.[{#PHY_NODE_MACHINEID}]         |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Ntp_sync_states                                  | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Ntp_sync_states.[{#PHY_NODE_MACHINEID}]           |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server RootUsedPer                                      | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.RootUsedPer.[{#PHY_NODE_MACHINEID}]               |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Sys_process_count                                | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Sys_process_count.[{#PHY_NODE_MACHINEID}]         |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} server Sys_process_zombies_count                        | -           | HTTP agent     | "host.cloudPhysicalNodeList.CloudPhysicalNode.server.Sys_process_zombies_count.[{#PHY_NODE_MACHINEID}] |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudPhysicalNode CloudPhysicalNodeList: BingoMS CloudPhysicalNode {#PHY_NODE_MACHINEID} status | -           | Dependent item | "host.cloudPhysicalNodeList.CloudPhysicalNode.status.[{#PHY_NODE_MACHINEID}]                           |
| Update: 1m                                                                                              |
| LLD"                                                                                                    |
| BingoMS CloudService {#SERVICE_CLOUDSERVICEID} - {#SERVICE_SERVICENAME} status                          | -           | Dependent item | "host.cloudServiceList.Service.status.[{#SERVICE_CLOUDSERVICEID}]                                      |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudStorage {#STORAGE_STORAGEID} - {#STORAGE_STORAGENAME} spaceMax                             | -           | Dependent item | "host.cloudStorageList.Storage.spaceMax.[{#STORAGE_STORAGEID}]                                         |
| Update: 0                                                                                               |
| LLD"                                                                                                    |
| BingoMS CloudStorage {#STORAGE_STORAGEID} - {#STORAGE_STORAGENAME} spaceUsed                            | -           | Dependent item | "host.cloudStorageList.Storage.spaceUsed.[{#STORAGE_STORAGEID}]                                        |
| Update: 0                                                                                               |
| LLD"                                                                                                    |

## Triggers

| Name                                                                                                                                                                       | Description               | Expression                                                                                                                               | Priority |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------|------------------------------------------------------------------------------------------------------------------------------------------|----------|
| 云平台分配CPU超过实际可用数告警                                                                                                                                                          | 云平台分配CPU超过实际可用数告警         | last(/BingoMS/bms.CloudScale.CpuNumUsed) > last(/BingoMS/bms.CloudScale.CpuNum)                                                          | warning  |
| 云计算节点状态异常告警                                                                                                                                                                | 云计算节点状态异常告警               | "Question: find(/BingoMS/host.cloudNodeList.CloudNode.status.[{#NODE_MACHINEID}],,""like"",""available"")=0                              |
| Recover: find(/BingoMS/host.cloudNodeList.CloudNode.status.[{#NODE_MACHINEID}],,""like"",""available"")=1"                                                                 | warning                   |
| 计算节点分配CPU超过实际可用数告警                                                                                                                                                         | 计算节点分配CPU超过实际可用数告警        | "                                                                                                                                        |          |
| last(/BingoMS/host.cloudNodeList.CloudNode.cpuUsed.[{#NODE_MACHINEID}])> last(/BingoMS/host.cloudNodeList.CloudNode.cpuNode.[{#NODE_MACHINEID}])"                          | warning                   |
| 云服务状态停止stopped告警                                                                                                                                                           | 云服务状态停止stopped告警          | "last(/BingoMS/host.cloudServiceList.Service.status.[{#SERVICE_CLOUDSERVICEID}])=""stopped"""                                            | serious  |
| 云存储空间使用率大于80%告警                                                                                                                                                            | 云存储空间使用率大于80%告警           | "                                                                                                                                        |          |
| (last(/BingoMS/host.cloudStorageList.Storage.spaceUsed.[{#STORAGE_STORAGEID}]) / last(/BingoMS/host.cloudStorageList.Storage.spaceMax.[{#STORAGE_STORAGEID}])) * 100 > 80" | warning                   |
| 云物理节点【agent状态】异常告警                                                                                                                                                         | 云物理节点【agent状态】异常告警        | "Question: last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.agent_status.[{#PHY_NODE_MACHINEID}])=""failed""                   |
| Recover: last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.agent_status.[{#PHY_NODE_MACHINEID}])=""success"""                                                     | warning                   |
| 云物理节点【cc状态】异常告警                                                                                                                                                            | 云物理节点【cc状态】异常告警           | "last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.cc.[{#PHY_NODE_MACHINEID}])=""notrunning"""               | warning  |
| 云物理节点【clc状态】异常告警                                                                                                                                                           | 云物理节点【clc状态】异常告警          | "last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.clc.[{#PHY_NODE_MACHINEID}])=""notrunning"""              | warning  |
| 云物理节点【host状态】异常告警                                                                                                                                                          | 云物理节点【host状态】异常告警         | "last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.host.[{#PHY_NODE_MACHINEID}])=""notrunning"""             | warning  |
| 云物理节点【metaweb状态】异常告警                                                                                                                                                       | 云物理节点【metaweb状态】异常告警      | "last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.metaweb.[{#PHY_NODE_MACHINEID}])=""notrunning"""          | warning  |
| 云物理节点【node状态】异常告警                                                                                                                                                          | 云物理节点【node状态】异常告警         | "last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.bcc_service_status.node.[{#PHY_NODE_MACHINEID}])=""notrunning"""             | warning  |
| 云物理节点【ntp同步状态】异常告警                                                                                                                                                         | 云物理节点【ntp同步状态】异常告警        | "find(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.server.Ntp_sync_states.[{#PHY_NODE_MACHINEID}],,""like"",""yes"")=0"         | warning  |
| 云物理节点【sdn ovsdb状态】异常告警                                                                                                                                                     | 云物理节点【sdn ovsdb状态】异常告警    | "find(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Ovsdb_server.[{#PHY_NODE_MACHINEID}],,""like"",""0"")=1"            | warning  |
| 云物理节点【sdn ovswitch状态】异常告警                                                                                                                                                  | 云物理节点【sdn ovswitch状态】异常告警 | "find(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Ovs_vswitchd.[{#PHY_NODE_MACHINEID}],,""like"",""0"")=1"            | warning  |
| 云物理节点【sdn控制器内存>4g】异常告警                                                                                                                                                     | 云物理节点【sdn控制器内存>4g】异常告警    | last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_controller_mem.[{#PHY_NODE_MACHINEID}])>390070272                | warning  |
| 云物理节点【sdn控制器版本不一致】异常告警                                                                                                                                                     | 云物理节点【sdn控制器版本不一致】异常告警    | "find(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_ver.[{#PHY_NODE_MACHINEID}],,""like"",{$BINGO_SDN_VERSION})=0"  | warning  |
| 云物理节点【sdn控制器状态】异常告警                                                                                                                                                        | 云物理节点【sdn控制器状态】异常告警       | "Question: find(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_health.[{#PHY_NODE_MACHINEID}],,""like"",""false"")=1 |
| Recover: find(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_health.[{#PHY_NODE_MACHINEID}],,""like"",""true"")=1"                                     | warning                   |
| 云物理节点【sdn流表>3w】异常告警                                                                                                                                                        | 云物理节点【sdn流表>3w】异常告警       | last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.sdn_info.Sdn_flow_count.[{#PHY_NODE_MACHINEID}])>30000                        | warning  |
| 云物理节点【swap内存百分比>50%】异常告警                                                                                                                                                   | 云物理节点【swap内存百分比>50%】异常告警  | last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.server.Memory_swapPer.[{#PHY_NODE_MACHINEID}])>50                             | warning  |
| 云物理节点【僵尸进程】异常告警                                                                                                                                                            | 云物理节点【僵尸进程】异常告警           | last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.server.Sys_process_zombies_count.[{#PHY_NODE_MACHINEID}])>0                   | warning  |
| 云物理节点【根分区使用百分比>80%】异常告警                                                                                                                                                    | 云物理节点【根分区使用百分比>80%】异常告警   | last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.server.RootUsedPer.[{#PHY_NODE_MACHINEID}])>80                                | warning  |
| 云物理节点【物理内存百分比>80%】异常告警                                                                                                                                                     | 云物理节点【物理内存百分比>80%】异常告警    | last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.server.MemoryPer.[{#PHY_NODE_MACHINEID}])>80                                  | warning  |
| 云物理节点【磁盘】状态异常告警                                                                                                                                                            | 云物理节点【磁盘】状态异常告警           | "find(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.harddisk_error.[{#PHY_NODE_MACHINEID}],,""like"",""normal"")=0"              | warning  |
| 云物理节点【网卡】状态异常告警                                                                                                                                                            | 云物理节点【网卡】状态异常告警           | "find(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.network_error.[{#PHY_NODE_MACHINEID}],,""like"",""normal"")=0"               | warning  |
| 云物理节点【网络连接数>3k】异常告警                                                                                                                                                        | 云物理节点【网络连接数>3k】异常告警       | last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.server.Net_connect_count.[{#PHY_NODE_MACHINEID}])>3000                        | warning  |
| 云物理节点【进程数>5k】异常告警                                                                                                                                                          | 云物理节点【进程数>5k】异常告警         | last(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.server.Sys_process_count.[{#PHY_NODE_MACHINEID}])>5000                        | warning  |
| 云物理节点状态异常告警                                                                                                                                                                | 云物理节点状态异常告警               | "find(/BingoMS/host.cloudPhysicalNodeList.CloudPhysicalNode.status.[{#PHY_NODE_MACHINEID}],,""like"",""available"")=0"                   | warning  |
