# Mikrotik

## Overview

NESSE TEMPLATE MONITORAMOS 


CPU


DISCO


MEMORIA


INTERFACE


NOME DO EQUIPAMENTO


UPTIME


TEMPERATURA 


VOLTAGEM


VERSÃO DO MIKOTIK


 


 



## Author

Renato Severino

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`sksnmp`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces Discovery|<p>.</p>|`SNMP agent`|net.if.discovery<p>Update: 60s</p>|
|Storage discovery|<p>HOST-RESOURCES-MIB::hrStorage discovery with storage filter</p>|`SNMP agent`|storage.discovery<p>Update: 1h</p>|
|Verificar CPU|<p>-</p>|`SNMP agent`|system.discoverycpu<p>Update: 3s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Firmware Aguardando Upgrade|<p>-</p>|`SNMP agent`|mtxrFirmwareUpgradeVersion<p>Update: 10m</p>|
|Software ID|<p>-</p>|`SNMP agent`|mikrotik.software.id<p>Update: 10m</p>|
|System name|<p>-</p>|`SNMP agent`|mikrotik.identity.name<p>Update: 10m</p>|
|Temperatura|<p>-</p>|`SNMP agent`|mtxrHlTemperature<p>Update: 1m</p>|
|Espaco usado em Disco|<p>-</p>|`SNMP agent`|mikrotik.used.disk.space<p>Update: 5m</p>|
|Firmware Ativo|<p>-</p>|`SNMP agent`|mtxrFirmwareVersion<p>Update: 10m</p>|
|CPU Load|<p>-</p>|`SNMP agent`|mtxCPULoad<p>Update: 30s</p>|
|Memoria Total|<p>-</p>|`SNMP agent`|mikrotik.total.memory<p>Update: 1h</p>|
|Serial Number|<p>-</p>|`SNMP agent`|mtxrSerialNumber<p>Update: 30s</p>|
|Rede - DHCP Leases|<p>-</p>|`SNMP agent`|mtxrDHCPLeaseCount<p>Update: 1m</p>|
|Frequencia Processador|<p>-</p>|`SNMP agent`|mtxrHlProcessorFrequency<p>Update: 10m</p>|
|Memoria em Uso|<p>-</p>|`SNMP agent`|mikrotik.used.memory<p>Update: 30s</p>|
|Espaco Total em Disco|<p>-</p>|`SNMP agent`|mikrotik.total.disk.space<p>Update: 10m</p>|
|Voltagem|<p>-</p>|`SNMP agent`|mtxrHlVoltage<p>Update: 1m</p>|
|System version and hw|<p>-</p>|`SNMP agent`|mikrotik.version.and.hw<p>Update: 10m</p>|
|System uptime|<p>-</p>|`SNMP agent`|mikrotik.uptime<p>Update: 2m</p>|
|Interface {#IFNAME}({#IFALIAS}): Discards In|<p>-</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 300s</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Erros In|<p>-</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 300s</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bytes In|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 120;30/2-6,07:00-21:00</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Discards Out|<p>-</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 300s</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Erros Out|<p>-</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bytes Out|<p>-</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 120;30/2-6,07:00-21:00</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>-</p>|`SNMP agent`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>-</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 240s;120s/2-6,07:00-21:00</p><p>LLD</p>|
|Disk-{#SNMPINDEX}: Space utilization|<p>Space utilization in % for Disk-{#SNMPINDEX}</p>|`Calculated`|vfs.fs.pused[hrStorageSize.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk-{#SNMPINDEX}: Total space|<p>MIB: HOST-RESOURCES-MIB The size of the storage represented by this entry, in units of hrStorageAllocationUnits. This object is writable to allow remote configuration of the size of the storage area in those cases where such an operation makes sense and is possible on the underlying system. For example, the amount of main memory allocated to a buffer pool might be modified or the amount of disk space allocated to virtual memory might be modified.</p>|`SNMP agent`|vfs.fs.total[hrStorageSize.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk-{#SNMPINDEX}: Used space|<p>MIB: HOST-RESOURCES-MIB The amount of the storage represented by this entry that is allocated, in units of hrStorageAllocationUnits.</p>|`SNMP agent`|vfs.fs.used[hrStorageSize.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Uso de CPU {#SNMPINDEX}|<p>-</p>|`SNMP agent`|cpucore[ifnum{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>-</p>|<p>**Expression**: (last(/Mikrotik/net.if.status[ifOperStatus.{#SNMPINDEX}])=2 and (last(/Mikrotik/net.if.status[ifOperStatus.{#SNMPINDEX}],#1)<>last(/Mikrotik/net.if.status[ifOperStatus.{#SNMPINDEX}],#2))=1)</p><p>**Recovery expression**: </p>|average|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>-</p>|<p>**Expression**: (last(/Mikrotik/net.if.status[ifOperStatus.{#SNMPINDEX}])=2 and (last(/Mikrotik/net.if.status[ifOperStatus.{#SNMPINDEX}],#1)<>last(/Mikrotik/net.if.status[ifOperStatus.{#SNMPINDEX}],#2))=1)</p><p>**Recovery expression**: </p>|average|
