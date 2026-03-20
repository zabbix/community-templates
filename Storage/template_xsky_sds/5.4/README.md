# Storage XSKY XMS by HTTP

## Description

Template for XMS API

## Overview

The Zabbix Template includes discovery rules, item prototypes, trigger prototypes and graphs, Zabbix will periodically gather resource metrics from HTTP/HTTPS REST API, convert metrics into JSON object, automatically create resource metrics by discovery rules, and send triggers based on the trigger rules.

## Author

XSKY

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$XMS_ACCESS_TOKEN}|<p>XMS Access Token</p>|`d862495fc8304b738e537d9c121ce2a6`|Text macro|
|{$XMS_API_IP}|<p>XMS API IP Address</p>|`10.255.20.148`|Text macro|
|{$XMS_API_PORT}|<p>XMS API Port</p>|`8051`|Text macro|
|{$XMS_BUCKET_ALLOCATED_OBJECTS.MAX.WARN}|<p>XMS Bucket Allocated Objects</p>|`80`|Text macro|
|{$XMS_BUCKET_ALLOCATED_SIZE.MAX.WARN}|<p>Max Warn Percentage of XMS Bucket Allocated Size</p>|`80`|Text macro|
|{$XMS_OSDS_IO_UTIL.MAX.WARN}|<p>Max Warn Percentage of XMS OSDS IO Util</p>|`90`|Text macro|
|{$XMS_OSDS_USED_BYTE.MAX.DISASTER}|<p>Max Disaster Percentage of XMS OSDS Used Byte</p>|`85`|Text macro|
|{$XMS_OSDS_USED_BYTE.MAX.WARN}|<p>Max Warn Percentage of XMS OSDS Used_Byte</p>|`80`|Text macro|
|{$XMS_OS_USER_ALLOCATED_OBJECTS.MAX.WARN}|<p>Max Warn Percentage of XMS OS User Allocated Objects</p>|`80`|Text macro|
|{$XMS_OS_USER_ALLOCATED_SIZE.MAX.WARN}|<p>Max Warn Percentage of XMS OS_User Allocated Size</p>|`80`|Text macro|
|{$XMS_POOL_DATA_KBYTE.MAX.DISASTER}|<p>Max Disaster Percentage of XMS Pool Data kbyte</p>|`90`|Text macro|
|{$XMS_POOL_DATA_KBYTE.MAX.HIGH}|<p>Max High Percentage of XMS Pool Data kbyte</p>|`85`|Text macro|
|{$XMS_POOL_DATA_KBYTE.MAX.WARN}|<p>Max Warn Percentage of XMS Pool Data kbyte</p>|`80`|Text macro|
|{$XMS_S3_LOAD_BALANCER_ACTIVE_CONNECTIONS.WARN}|<p>Max Warn Value of XMS S3 Load Balancer Active Connections</p>|`1024`|Text macro|
|{$XMS_S3_LOAD_BALANCER_CPU_UTIL.WARN}|<p>Max Warn Percentage of XMS S3 Load Balancer CPU Util</p>|`80`|Text macro|
|{$XMS_S3_LOAD_BALANCER_MEM_USAGE_PERCENT.WARN}|<p>Max Warn Percentage of XMS S3 Load Balancer MEM Usage</p>|`80`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|XMS Network Interfaces Discovery|<p>-</p>|`HTTP agent`|xms.hosts.network_interfaces.discovery<p>Update: 1h</p>|
|XMS Services Discovery|<p>-</p>|`HTTP agent`|xms.hosts.services.discovery<p>Update: 1h</p>|
|XMS OS-Zones Discovery|<p>-</p>|`HTTP agent`|xms.os_zones.discovery<p>Update: 1h</p>|
|XMS Host Discovery|<p>-</p>|`HTTP agent`|xms.hosts.discovery<p>Update: 1h</p>|
|XMS Disk (Cache) Discovery|<p>-</p>|`HTTP agent`|xms.hosts.disk_cache.discovery<p>Update: 1h</p>|
|XMS S3 Load Balancer Discovery|<p>-</p>|`HTTP agent`|xms.os_s3_load_balancers.discovery<p>Update: 1h</p>|
|XMS OS-Bucket Discovery|<p>-</p>|`HTTP agent`|xms.os_buckets.discovery<p>Update: 1h</p>|
|XMS NFS-Gateways Discovery|<p>-</p>|`HTTP agent`|xms.os_nfs_gateways.discovery<p>Update: 1h</p>|
|XMS POOL Discovery|<p>-</p>|`HTTP agent`|xms.pools.discovery<p>Update: 1h</p>|
|XMS OS-User Discovery|<p>-</p>|`HTTP agent`|xms.os_users.discovery<p>Update: 1h</p>|
|XMS OSD Discovery|<p>-</p>|`HTTP agent`|xms.host.osds.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|XMS OS-NFS-Gateways|<p>-</p>|`HTTP agent`|xms.os_nfs_gateways.get<p>Update: 1m</p>|
|XMS Hosts|<p>-</p>|`HTTP agent`|xms.hosts.get<p>Update: 1m</p>|
|XMS Network Interfaces|<p>-</p>|`HTTP agent`|xms.hosts.network_interfaces.get<p>Update: 1m</p>|
|XMS OS-Users|<p>-</p>|`HTTP agent`|xms.os_users.get<p>Update: 1m</p>|
|XMS Cluster  Version|<p>-</p>|`Dependent item`|xms.cluster.version<p>Update: 0</p>|
|XMS OSDs|<p>-</p>|`HTTP agent`|xms.hosts.osds.get<p>Update: 1m</p>|
|XMS Pools|<p>-</p>|`HTTP agent`|xms.pools.get<p>Update: 1m</p>|
|XMS Cluster  Os Bucket Num|<p>-</p>|`Dependent item`|xms.cluster.stats.os_bucket_num<p>Update: 0</p>|
|XMS OS-Buckets|<p>-</p>|`HTTP agent`|xms.os_buckets.get<p>Update: 1m</p>|
|XMS OS-Zones|<p>-</p>|`HTTP agent`|xms.os_zone.get<p>Update: 1m</p>|
|XMS Services|<p>-</p>|`HTTP agent`|xms.hosts.services.get<p>Update: 1m</p>|
|XMS Cluster Stats|<p>-</p>|`HTTP agent`|xms.cluster.stats.get<p>Update: 1m</p>|
|XMS OS-S3_Load_Balancer|<p>-</p>|`HTTP agent`|xms.os_s3_load_balancer.get<p>Update: 1m</p>|
|XMS Cluster|<p>-</p>|`HTTP agent`|xms.cluster.get<p>Update: 1m</p>|
|XMS Cache Disks|<p>-</p>|`HTTP agent`|xms.hosts.disk_cache.get<p>Update: 1m</p>|
|Host {#HOSTNAME} Network {#NETWORKNAME} Receive Bytes|<p>-</p>|`Dependent item`|host.network_interfaces.rx_bandwidth_kbyte[{#NETWORKID}]<p>Update: 0</p><p>LLD</p>|
|Host {#HOSTNAME} Network {#NETWORKNAME} Receive Packets|<p>-</p>|`Dependent item`|host.network_interfaces.rx_pps[{#NETWORKID}]<p>Update: 0</p><p>LLD</p>|
|Host {#HOSTNAME} Network {#NETWORKNAME} Status|<p>-</p>|`Dependent item`|host.network_interfaces.status[{#NETWORKID}]<p>Update: 0</p><p>LLD</p>|
|Host {#HOSTNAME} Network {#NETWORKNAME} Transmit Bytes|<p>-</p>|`Dependent item`|host.network_interfaces.tx_bandwidth_kbyte[{#NETWORKID}]<p>Update: 0</p><p>LLD</p>|
|Host {#HOSTNAME} Network {#NETWORKNAME} Transmit Packets|<p>-</p>|`Dependent item`|host.network_interfaces.tx_pps[{#NETWORKID}]<p>Update: 0</p><p>LLD</p>|
|XMS {#HOSTNAME} {#TYPE} Status|<p>-</p>|`Dependent item`|host.service.status[{#HOSTID}.{#TYPE}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-Zones {#XMS_OS_ZONE_NAME} Alias|<p>-</p>|`Dependent item`|xms.os_zones.alias[{#XMS_OS_ZONE_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-Zones {#XMS_OS_ZONE_NAME} Connect Status|<p>-</p>|`Dependent item`|xms.os_zones.connected[{#XMS_OS_ZONE_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-Zones {#XMS_OS_ZONE_NAME} Objects OPS|<p>-</p>|`Dependent item`|xms.os_zones.samples.objects_pm[{#XMS_OS_ZONE_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-Zones {#XMS_OS_ZONE_NAME} Object Bytes Ps|<p>-</p>|`Dependent item`|xms.os_zones.samples.object_kbytes_ps[{#XMS_OS_ZONE_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-Zones {#XMS_OS_ZONE_NAME} Total Objects|<p>-</p>|`Dependent item`|xms.os_zones.samples.total_objects[{#XMS_OS_ZONE_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-Zones {#XMS_OS_ZONE_NAME} Total Object Capacity|<p>-</p>|`Dependent item`|xms.os_zones.samples.total_object_bytes[{#XMS_OS_ZONE_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Host {#HOSTNAME} Status|<p>-</p>|`Dependent item`|xms.hosts.status[{#HOSTID}]<p>Update: 0</p><p>LLD</p>|
|XMS Host {#XMS_HOST_NAME} Disk {#XMS_HOST_DEVICE} Status|<p>-</p>|`Dependent item`|xms.host.disk.status[{#XMS_OSD_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Load balancer {#XMS_S3_LOAD_BALANCER_NAME} Active Connections|<p>-</p>|`Dependent item`|xms.s3_load_balancer.samples.active_connections[{#XMS_S3_LOAD_BALANCER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Load balancer {#XMS_S3_LOAD_BALANCER_NAME} CPU Util|<p>-</p>|`Dependent item`|xms.s3_load_balancer.samples.cpu_util[{#XMS_S3_LOAD_BALANCER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Load balancer {#XMS_S3_LOAD_BALANCER_NAME} Mem Usage Util|<p>-</p>|`Dependent item`|xms.s3_load_balancer.samples.mem_usage_percent[{#XMS_S3_LOAD_BALANCER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Load balancer {#XMS_S3_LOAD_BALANCER_NAME} Status|<p>-</p>|`Dependent item`|xms.s3_load_balancer.status[{#XMS_S3_LOAD_BALANCER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Versioned|<p>-</p>|`Dependent item`|xms.buckets.flag.versioned[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Rx Bandwidth Byte Rate|<p>-</p>|`Dependent item`|xms.buckets.samples.rx_bandwidth_kbyte[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Up Latency Us|<p>-</p>|`Dependent item`|xms.buckets.samples.up_latency_us[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Tx Ops|<p>-</p>|`Dependent item`|xms.buckets.samples.tx_ops_pm[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Tx Bandwidth Byte Rate|<p>-</p>|`Dependent item`|xms.buckets.samples.tx_bandwidth_kbyte[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Total Tx Bytes|<p>-</p>|`Dependent item`|xms.buckets.samples.total_tx_bytes[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Total Rx Bytes|<p>-</p>|`Dependent item`|xms.buckets.samples.total_rx_bytes[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Rx Ops|<p>-</p>|`Dependent item`|xms.buckets.samples.rx_ops_pm[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Latency Up|<p>-</p>|`Dependent item`|xms.buckets.samples.latency_up[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Owner|<p>-</p>|`Dependent item`|xms.buckets.owner[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Latency Down|<p>-</p>|`Dependent item`|xms.buckets.samples.latency_down[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Down Latency Us|<p>-</p>|`Dependent item`|xms.buckets.samples.down_latency_us[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Del Ops|<p>-</p>|`Dependent item`|xms.buckets.samples.del_ops_pm[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Allocated Size|<p>-</p>|`Dependent item`|xms.buckets.samples.allocated_size[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Allocated Objects|<p>-</p>|`Dependent item`|xms.buckets.samples.allocated_objects[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Quota Max Size|<p>-</p>|`Dependent item`|xms.buckets.quota_max_size[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Quota Max Objects|<p>-</p>|`Dependent item`|xms.buckets.quota_max_objects[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Bucket {#XMS_BUCKET_NAME} Status|<p>-</p>|`Dependent item`|xms.buckets.status[{#XMS_BUCKET_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS NFS Gateway {#XMS_NFS_GATEWAY_NAME} Cpu Util Rate|<p>-</p>|`Dependent item`|xms.nfs_gateway.samples.cpu_util[{#XMS_NFS_GATEWAY_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS NFS Gateway {#XMS_NFS_GATEWAY_NAME} Down Bandwidth Byte|<p>-</p>|`Dependent item`|xms.nfs_gateway.samples.down_bandwidth_kbyte[{#XMS_NFS_GATEWAY_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS NFS Gateway {#XMS_NFS_GATEWAY_NAME} Down Latency Us|<p>-</p>|`Dependent item`|xms.nfs_gateway.samples.down_latency_us[{#XMS_NFS_GATEWAY_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS NFS Gateway {#XMS_NFS_GATEWAY_NAME} Down Ops|<p>-</p>|`Dependent item`|xms.nfs_gateway.samples.down_ops[{#XMS_NFS_GATEWAY_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS NFS Gateway {#XMS_NFS_GATEWAY_NAME} Mem Usage Util Rate|<p>-</p>|`Dependent item`|xms.nfs_gateway.samples.mem_usage_percent[{#XMS_NFS_GATEWAY_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS NFS Gateway {#XMS_NFS_GATEWAY_NAME} Up Bandwidth Byte|<p>-</p>|`Dependent item`|xms.nfs_gateway.samples.up_bandwidth_kbyte[{#XMS_NFS_GATEWAY_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS NFS Gateway {#XMS_NFS_GATEWAY_NAME} Up Latency Us|<p>-</p>|`Dependent item`|xms.nfs_gateway.samples.up_latency_us[{#XMS_NFS_GATEWAY_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS NFS Gateway {#XMS_NFS_GATEWAY_NAME} Up Ops|<p>-</p>|`Dependent item`|xms.nfs_gateway.samples.up_ops[{#XMS_NFS_GATEWAY_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Actual Capacity|<p>-</p>|`Dependent item`|xms.pool.samples.actual_kbyte[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Data Capacity|<p>-</p>|`Dependent item`|xms.pool.samples.data_kbyte[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Read Bandwidth|<p>-</p>|`Dependent item`|xms.pool.samples.read_bandwidth_kbyte[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Read Iops|<p>-</p>|`Dependent item`|xms.pool.samples.read_iops[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Read Latency|<p>-</p>|`Dependent item`|xms.pool.samples.read_latency_us[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Recovery Bandwidth|<p>-</p>|`Dependent item`|xms.pool.samples.recovery_bandwidth_kbyte[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Recovery Iops|<p>-</p>|`Dependent item`|xms.pool.samples.recovery_iops[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Write Bandwidth|<p>-</p>|`Dependent item`|xms.pool.samples.write_bandwidth_kbyte[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Write Iops|<p>-</p>|`Dependent item`|xms.pool.samples.write_iops[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Write Latency|<p>-</p>|`Dependent item`|xms.pool.samples.write_latency_us[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS Pool {#POOLNAME} Status|<p>-</p>|`Dependent item`|xms.pool.status[{#POOLID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Allocated Objects|<p>-</p>|`Dependent item`|xms.os_user.allocated_objects[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Allocated Size|<p>-</p>|`Dependent item`|xms.os_user.allocated_size[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Bucket Num|<p>-</p>|`Dependent item`|xms.os_user.bucket_num[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Bucket Quota Max Objects|<p>-</p>|`Dependent item`|xms.os_user.bucket_quota_max_objects[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Bucket Quota Max Size|<p>-</p>|`Dependent item`|xms.os_user.bucket_quota_max_size[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Max Buckets|<p>-</p>|`Dependent item`|xms.os_user.max_buckets[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Del Ops|<p>-</p>|`Dependent item`|xms.os_user.samples.del_ops_pm[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Rx Bandwidth Byte Rate|<p>-</p>|`Dependent item`|xms.os_user.samples.rx_bandwidth_kbyte[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Rx Ops|<p>-</p>|`Dependent item`|xms.os_user.samples.rx_ops_pm[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Tx_Bandwidth_Byte Rate|<p>-</p>|`Dependent item`|xms.os_user.samples.tx_bandwidth_kbyte[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Tx Ops|<p>-</p>|`Dependent item`|xms.os_user.samples.tx_ops_pm[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} Status|<p>-</p>|`Dependent item`|xms.os_user.status[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} User Quota Max Objects|<p>-</p>|`Dependent item`|xms.os_user.user_quota_max_objects[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OS-User {#XMS_OS_USER_NAME} User Quota Max Size|<p>-</p>|`Dependent item`|xms.os_user.user_quota_max_size[{#XMS_OS_USER_ID}]<p>Update: 0</p><p>LLD</p>|
|XMS OSD {#OSDID} IO Util|<p>-</p>|`Dependent item`|hosts.osds.io_util[{#OSDID}]<p>Update: 0</p><p>LLD</p>|
|XMS OSD {#OSDID} Name|<p>-</p>|`Dependent item`|hosts.osds.name[{#OSDID}]<p>Update: 0</p><p>LLD</p>|
|XMS OSD {#OSDID} Total Byte|<p>-</p>|`Dependent item`|hosts.osds.samples.total_Byte.data[{#OSDID}]<p>Update: 0</p><p>LLD</p>|
|XMS OSD {#OSDID} Used Byte|<p>-</p>|`Dependent item`|hosts.osds.samples.used_Byte.data[{#OSDID}]<p>Update: 0</p><p>LLD</p>|
|XMS OSD {#OSDID} Status|<p>-</p>|`Dependent item`|hosts.osds.status[{#OSDID}]<p>Update: 0</p><p>LLD</p>|
|XMS OSD {#OSDID} Type|<p>-</p>|`Dependent item`|hosts.osds.type[{#OSDID}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Host {#HOSTNAME}  {#OSDNAME} IO Usage Is Greater Than {$XMS_OSDS_IO_UTIL.MAX.WARN}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.io_util[{#OSDID}])>=90</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.io_util[{#OSDID}])<90</p>|warning|
|Host {#HOSTNAME} {#OSDNAME} Data Usage Is Greater Than {$XMS_OSDS_USED_BYTE.MAX.DISASTER}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.samples.used_Byte.data[{#OSDID}])>={#OSD_TOTALKBYTE}*85/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.samples.used_Byte.data[{#OSDID}])<{#OSD_TOTALKBYTE}*85/100*1024</p>|disaster|
|Host {#HOSTNAME} {#OSDNAME} Data Usage Is Greater Than {$XMS_OSDS_USED_BYTE.MAX.WARN}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.samples.used_Byte.data[{#OSDID}])>={#OSD_TOTALKBYTE}*80/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.samples.used_Byte.data[{#OSDID}])<{#OSD_TOTALKBYTE}*80/100*1024</p>|warning|
|Host {#HOSTNAME} {#OSDNAME} Status Is error|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","active")=1</p>|disaster|
|Host {#HOSTNAME} {#OSDNAME} Status Is Stopped|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","stopped")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","active")=1</p>|warning|
|Host {#HOSTNAME} {#OSDNAME} Status Is Warning|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","warning")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","active")=1</p>|warning|
|Host {#HOSTNAME} Status Is error|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","active")=1</p>|disaster|
|Host {#HOSTNAME} Status Is offline|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","offline")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","active")=1</p>|disaster|
|Host {#HOSTNAME} Status Is warning|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","warning")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","active")=1</p>|warning|
|Host  {#XMS_HOST_NAME} Cache Disk {#XMS_HOST_DEVICE} Status Is error|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.host.disk.status[{#XMS_OSD_ID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.host.disk.status[{#XMS_OSD_ID}],,"like","active")=1</p>|disaster|
|Host {#HOSTNAME} Network {#NETWORKNAME} is offline|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/host.network_interfaces.status[{#NETWORKID}],,"like","down")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/host.network_interfaces.status[{#NETWORKID}],,"like","up")=1</p>|high|
|Service {#TYPE} of Host {#HOSTNAME} is offline|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/host.service.status[{#HOSTID}.{#TYPE}],,"like","false")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/host.service.status[{#HOSTID}.{#TYPE}],,"like","true")=1</p>|high|
|Object Storage Bucket {#XMS_BUCKET_NAME} Allocated Objects Is Greater Than {$XMS_BUCKET_ALLOCATED_OBJECTS.MAX.WARN}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.buckets.samples.allocated_objects[{#XMS_BUCKET_ID}])>={#XMS_BUCKET_QUOTA_MAX_OBJECTS}*80/100 and {#XMS_BUCKET_QUOTA_MAX_OBJECTS} > 0</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.buckets.samples.allocated_objects[{#XMS_BUCKET_ID}])<{#XMS_BUCKET_QUOTA_MAX_OBJECTS}*80/100 or {#XMS_BUCKET_QUOTA_MAX_OBJECTS} = 0</p>|warning|
|Object Storage Bucket {#XMS_BUCKET_NAME} Allocated Size Is Greater Than {$XMS_BUCKET_ALLOCATED_SIZE.MAX.WARN}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.buckets.samples.allocated_size[{#XMS_BUCKET_ID}])>={#XMS_BUCKET_QUOTA_MAX_SIZE}*80/100 and {#XMS_BUCKET_QUOTA_MAX_SIZE} > 0</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.buckets.samples.allocated_size[{#XMS_BUCKET_ID}])<{#XMS_BUCKET_QUOTA_MAX_SIZE}*80/100 or {#XMS_BUCKET_QUOTA_MAX_SIZE} = 0</p>|warning|
|S3 Load Balancer {#XMS_S3_LOAD_BALANCER_NAME} Active Connections Are Greater Than {$XMS_S3_LOAD_BALANCER_ACTIVE_CONNECTIONS.WARN}|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.active_connections[{#XMS_S3_LOAD_BALANCER_ID}])>=1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.active_connections[{#XMS_S3_LOAD_BALANCER_ID}])<1024</p>|warning|
|S3 Load Balancer {#XMS_S3_LOAD_BALANCER_NAME} CPU Usage is Greater Than {$XMS_S3_LOAD_BALANCER_CPU_UTIL.WARN}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.cpu_util[{#XMS_S3_LOAD_BALANCER_ID}])>=80</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.cpu_util[{#XMS_S3_LOAD_BALANCER_ID}])<80</p>|warning|
|S3 Load Balancer {#XMS_S3_LOAD_BALANCER_NAME} Memory Usage is Greater Than {$XMS_S3_LOAD_BALANCER_MEM_USAGE_PERCENT.WARN}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.mem_usage_percent[{#XMS_S3_LOAD_BALANCER_ID}])>=80</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.mem_usage_percent[{#XMS_S3_LOAD_BALANCER_ID}])<80</p>|warning|
|S3 Load Balancer {#XMS_S3_LOAD_BALANCER_NAME} Status Is Error|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.status[{#XMS_S3_LOAD_BALANCER_ID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.status[{#XMS_S3_LOAD_BALANCER_ID}],,"like","active")=1</p>|disaster|
|Object Storage User {#XMS_OS_USER_NAME} Allocated Objects Is Greater Than {$XMS_OS_USER_ALLOCATED_OBJECTS.MAX.WARN}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.os_user.allocated_objects[{#XMS_OS_USER_ID}])>={#XMS_OS_USER_USER_QUOTA_MAX_OBJECTS}*80/100 and {#XMS_OS_USER_USER_QUOTA_MAX_OBJECTS} > 0</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.os_user.allocated_objects[{#XMS_OS_USER_ID}])<{#XMS_OS_USER_USER_QUOTA_MAX_OBJECTS}*80/100 or {#XMS_OS_USER_USER_QUOTA_MAX_OBJECTS} = 0</p>|warning|
|Object Storage User {#XMS_OS_USER_NAME} Allocated Size Is Greater Than {$XMS_OS_USER_ALLOCATED_SIZE.MAX.WARN}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.os_user.allocated_size[{#XMS_OS_USER_ID}])>={#XMS_OS_USER_USER_QUOTA_MAX_SIZE}*80/100 and {#XMS_OS_USER_USER_QUOTA_MAX_SIZE} > 0</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.os_user.allocated_size[{#XMS_OS_USER_ID}])<{#XMS_OS_USER_USER_QUOTA_MAX_SIZE}*80/100 or {#XMS_OS_USER_USER_QUOTA_MAX_SIZE} = 0</p>|warning|
|Pool {#POOLNAME} Capacity Usage Is Greater Than {$XMS_POOL_DATA_KBYTE.MAX.DISASTER}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])>={#POOLSTATUS_ACTUAL_KBYTE}*90/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])<{#POOLSTATUS_ACTUAL_KBYTE}*90/100*1024</p>|disaster|
|Pool {#POOLNAME}  Capacity Usage Is Greater Than {$XMS_POOL_DATA_KBYTE.MAX.HIGH}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])>={#POOLSTATUS_ACTUAL_KBYTE}*85/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])<{#POOLSTATUS_ACTUAL_KBYTE}*85/100*1024</p>|high|
|Pool {#POOLNAME} Capacity Usage Is Greater Than {$XMS_POOL_DATA_KBYTE.MAX.WARN}%|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])>={#POOLSTATUS_ACTUAL_KBYTE}*80/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])<{#POOLSTATUS_ACTUAL_KBYTE}*80/100*1024</p>|warning|
|Pool {#POOLNAME} Status Is degraded|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","degraded")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","active")=1</p>|warning|
|Pool {#POOLNAME} Status Is error|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","active")=1</p>|disaster|
|Pool {#POOLNAME} Status Is full|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","full")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","active")=1</p>|disaster|
|Host {#HOSTNAME} Network {#NETWORKNAME} is offline (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/host.network_interfaces.status[{#NETWORKID}],,"like","down")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/host.network_interfaces.status[{#NETWORKID}],,"like","up")=1</p>|high|
|Service {#TYPE} of Host {#HOSTNAME} is offline (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/host.service.status[{#HOSTID}.{#TYPE}],,"like","false")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/host.service.status[{#HOSTID}.{#TYPE}],,"like","true")=1</p>|high|
|Host {#HOSTNAME} Status Is error (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","active")=1</p>|disaster|
|Host {#HOSTNAME} Status Is offline (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","offline")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","active")=1</p>|disaster|
|Host {#HOSTNAME} Status Is warning (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","warning")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.hosts.status[{#HOSTID}],,"like","active")=1</p>|warning|
|Host  {#XMS_HOST_NAME} Cache Disk {#XMS_HOST_DEVICE} Status Is error (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.host.disk.status[{#XMS_OSD_ID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.host.disk.status[{#XMS_OSD_ID}],,"like","active")=1</p>|disaster|
|S3 Load Balancer {#XMS_S3_LOAD_BALANCER_NAME} Active Connections Are Greater Than {$XMS_S3_LOAD_BALANCER_ACTIVE_CONNECTIONS.WARN} (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.active_connections[{#XMS_S3_LOAD_BALANCER_ID}])>=1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.active_connections[{#XMS_S3_LOAD_BALANCER_ID}])<1024</p>|warning|
|S3 Load Balancer {#XMS_S3_LOAD_BALANCER_NAME} CPU Usage is Greater Than {$XMS_S3_LOAD_BALANCER_CPU_UTIL.WARN}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.cpu_util[{#XMS_S3_LOAD_BALANCER_ID}])>=80</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.cpu_util[{#XMS_S3_LOAD_BALANCER_ID}])<80</p>|warning|
|S3 Load Balancer {#XMS_S3_LOAD_BALANCER_NAME} Memory Usage is Greater Than {$XMS_S3_LOAD_BALANCER_MEM_USAGE_PERCENT.WARN}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.mem_usage_percent[{#XMS_S3_LOAD_BALANCER_ID}])>=80</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.samples.mem_usage_percent[{#XMS_S3_LOAD_BALANCER_ID}])<80</p>|warning|
|S3 Load Balancer {#XMS_S3_LOAD_BALANCER_NAME} Status Is Error (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.status[{#XMS_S3_LOAD_BALANCER_ID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.s3_load_balancer.status[{#XMS_S3_LOAD_BALANCER_ID}],,"like","active")=1</p>|disaster|
|Object Storage Bucket {#XMS_BUCKET_NAME} Allocated Objects Is Greater Than {$XMS_BUCKET_ALLOCATED_OBJECTS.MAX.WARN}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.buckets.samples.allocated_objects[{#XMS_BUCKET_ID}])>={#XMS_BUCKET_QUOTA_MAX_OBJECTS}*80/100 and {#XMS_BUCKET_QUOTA_MAX_OBJECTS} > 0</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.buckets.samples.allocated_objects[{#XMS_BUCKET_ID}])<{#XMS_BUCKET_QUOTA_MAX_OBJECTS}*80/100 or {#XMS_BUCKET_QUOTA_MAX_OBJECTS} = 0</p>|warning|
|Object Storage Bucket {#XMS_BUCKET_NAME} Allocated Size Is Greater Than {$XMS_BUCKET_ALLOCATED_SIZE.MAX.WARN}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.buckets.samples.allocated_size[{#XMS_BUCKET_ID}])>={#XMS_BUCKET_QUOTA_MAX_SIZE}*80/100 and {#XMS_BUCKET_QUOTA_MAX_SIZE} > 0</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.buckets.samples.allocated_size[{#XMS_BUCKET_ID}])<{#XMS_BUCKET_QUOTA_MAX_SIZE}*80/100 or {#XMS_BUCKET_QUOTA_MAX_SIZE} = 0</p>|warning|
|Pool {#POOLNAME} Capacity Usage Is Greater Than {$XMS_POOL_DATA_KBYTE.MAX.DISASTER}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])>={#POOLSTATUS_ACTUAL_KBYTE}*90/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])<{#POOLSTATUS_ACTUAL_KBYTE}*90/100*1024</p>|disaster|
|Pool {#POOLNAME}  Capacity Usage Is Greater Than {$XMS_POOL_DATA_KBYTE.MAX.HIGH}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])>={#POOLSTATUS_ACTUAL_KBYTE}*85/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])<{#POOLSTATUS_ACTUAL_KBYTE}*85/100*1024</p>|high|
|Pool {#POOLNAME} Capacity Usage Is Greater Than {$XMS_POOL_DATA_KBYTE.MAX.WARN}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])>={#POOLSTATUS_ACTUAL_KBYTE}*80/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.pool.samples.data_kbyte[{#POOLID}])<{#POOLSTATUS_ACTUAL_KBYTE}*80/100*1024</p>|warning|
|Pool {#POOLNAME} Status Is degraded (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","degraded")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","active")=1</p>|warning|
|Pool {#POOLNAME} Status Is error (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","active")=1</p>|disaster|
|Pool {#POOLNAME} Status Is full (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","full")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/xms.pool.status[{#POOLID}],,"like","active")=1</p>|disaster|
|Object Storage User {#XMS_OS_USER_NAME} Allocated Objects Is Greater Than {$XMS_OS_USER_ALLOCATED_OBJECTS.MAX.WARN}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.os_user.allocated_objects[{#XMS_OS_USER_ID}])>={#XMS_OS_USER_USER_QUOTA_MAX_OBJECTS}*80/100 and {#XMS_OS_USER_USER_QUOTA_MAX_OBJECTS} > 0</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.os_user.allocated_objects[{#XMS_OS_USER_ID}])<{#XMS_OS_USER_USER_QUOTA_MAX_OBJECTS}*80/100 or {#XMS_OS_USER_USER_QUOTA_MAX_OBJECTS} = 0</p>|warning|
|Object Storage User {#XMS_OS_USER_NAME} Allocated Size Is Greater Than {$XMS_OS_USER_ALLOCATED_SIZE.MAX.WARN}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/xms.os_user.allocated_size[{#XMS_OS_USER_ID}])>={#XMS_OS_USER_USER_QUOTA_MAX_SIZE}*80/100 and {#XMS_OS_USER_USER_QUOTA_MAX_SIZE} > 0</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/xms.os_user.allocated_size[{#XMS_OS_USER_ID}])<{#XMS_OS_USER_USER_QUOTA_MAX_SIZE}*80/100 or {#XMS_OS_USER_USER_QUOTA_MAX_SIZE} = 0</p>|warning|
|Host {#HOSTNAME}  {#OSDNAME} IO Usage Is Greater Than {$XMS_OSDS_IO_UTIL.MAX.WARN}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.io_util[{#OSDID}])>=90</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.io_util[{#OSDID}])<90</p>|warning|
|Host {#HOSTNAME} {#OSDNAME} Data Usage Is Greater Than {$XMS_OSDS_USED_BYTE.MAX.DISASTER}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.samples.used_Byte.data[{#OSDID}])>={#OSD_TOTALKBYTE}*85/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.samples.used_Byte.data[{#OSDID}])<{#OSD_TOTALKBYTE}*85/100*1024</p>|disaster|
|Host {#HOSTNAME} {#OSDNAME} Data Usage Is Greater Than {$XMS_OSDS_USED_BYTE.MAX.WARN}% (LLD)|<p>-</p>|<p>**Expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.samples.used_Byte.data[{#OSDID}])>={#OSD_TOTALKBYTE}*80/100*1024</p><p>**Recovery expression**: last(/Storage XSKY XMS by HTTP/hosts.osds.samples.used_Byte.data[{#OSDID}])<{#OSD_TOTALKBYTE}*80/100*1024</p>|warning|
|Host {#HOSTNAME} {#OSDNAME} Status Is error (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","error")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","active")=1</p>|disaster|
|Host {#HOSTNAME} {#OSDNAME} Status Is Stopped (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","stopped")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","active")=1</p>|warning|
|Host {#HOSTNAME} {#OSDNAME} Status Is Warning (LLD)|<p>-</p>|<p>**Expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","warning")=1</p><p>**Recovery expression**: find(/Storage XSKY XMS by HTTP/hosts.osds.status[{#OSDID}],,"like","active")=1</p>|warning|
