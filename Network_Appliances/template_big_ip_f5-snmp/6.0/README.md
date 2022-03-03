# Device BigIP F5

## Overview

Necessário, criar os Mapeamentos de valores da imagem.



## Author

Theo Castelo

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Pools|<p>-</p>|`SNMP agent`|ltmPoolName<p>Update: 43200</p>|
|Nodes|<p>Nome dos Nodes</p>|`SNMP agent`|ltmNodeAddrName<p>Update: 43200</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status do Fan - 3|<p>-</p>|`SNMP agent`|sysChassisFanStatus.3<p>Update: 600</p>|
|Status Fonte de Energia - 2|<p>-</p>|`SNMP agent`|sysChassisPowerSupplyStatus.2<p>Update: 600</p>|
|Status Fonte de Energia - 1|<p>-</p>|`SNMP agent`|sysChassisPowerSupplyStatus.1<p>Update: 600</p>|
|Status do Fan - 1|<p>-</p>|`SNMP agent`|sysChassisFanStatus.1<p>Update: 600</p>|
|Memória em Uso|<p>-</p>|`SNMP agent`|sysHostMemoryUsed<p>Update: 60</p>|
|Status do Fan - 2|<p>-</p>|`SNMP agent`|sysChassisFanStatus.2<p>Update: 600</p>|
|Memória Total|<p>-</p>|`SNMP agent`|sysHostMemoryTotal<p>Update: 3600</p>|
|Status do Fan - 4|<p>-</p>|`SNMP agent`|sysChassisFanStatus.4<p>Update: 600</p>|
|Uso de CPU % por Minuto.|<p>-</p>|`SNMP agent`|sysGlobalHostCpuUsageRatio1m<p>Update: 60</p>|
|Membros Ativos no Pool $1|<p>-</p>|`SNMP agent`|ltmPoolActiveMemberCnt.["{#SNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Membros do Pool $1|<p>-</p>|`SNMP agent`|ltmPoolMemberCnt.["{#SNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Entrada de Bytes no Pool $1|<p>-</p>|`SNMP agent`|ltmPoolStatServerBytesIn.["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Saída de Bytes no Pool $1|<p>-</p>|`SNMP agent`|ltmPoolStatServerBytesOut.["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Conexões Ativas em $1|<p>-</p>|`SNMP agent`|ltmPoolStatServerCurConns.["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Total de Conexões em $1|<p>-</p>|`SNMP agent`|ltmPoolStatServerTotConns.["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Status de Disponibilidade do Pool $1|<p>-</p>|`SNMP agent`|ltmPoolStatusAvailState.["{#SNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Status de Disponibilidade $1|<p>-</p>|`SNMP agent`|ltmPoolStatusDetailReason.["{#SNMPVALUE}"]<p>Update: 60;50/1-7,00:00-24:00</p><p>LLD</p>|
|Conexões Ativas (Server-Side) em $1|<p>-</p>|`SNMP agent`|ltmNodeAddrStatServerCurConns.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Disponibilidade do Node $1|<p>-</p>|`SNMP agent`|ltmNodeAddrStatusAvailState[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Status de disponibilidade do node $1|<p>-</p>|`SNMP agent`|ltmNodeAddrStatusDetailReason[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Status do Node $1|<p>-</p>|`SNMP agent`|ltmNodeAddrStatusEnabledState[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Existem Nodes do Pool {#SNMPVALUE} desativados ou apresentando problemas - ({ITEM.LASTVALUE}/{ITEM.LASTVALUE2}) - Ativos / Total|<p>-</p>|<p>**Expression**: last(/Device BigIP F5/ltmPoolActiveMemberCnt.["{#SNMPVALUE}"])<>last(/Device BigIP F5/ltmPoolMemberCnt.["{#SNMPVALUE}"])</p><p>**Recovery expression**: last(/Device BigIP F5/ltmPoolActiveMemberCnt.["{#SNMPVALUE}"])=last(/Device BigIP F5/ltmPoolMemberCnt.["{#SNMPVALUE}"])</p>|warning|
|Pool {#SNMPVALUE} Indisponível. (Status Atual: {ITEM.VALUE1}).|<p>-</p>|<p>**Expression**: last(/Device BigIP F5/ltmPoolStatusAvailState.["{#SNMPVALUE}"])<>1</p><p>**Recovery expression**: last(/Device BigIP F5/ltmPoolStatusAvailState.["{#SNMPVALUE}"])=1</p>|disaster|
|Existem Nodes do Pool {#SNMPVALUE} desativados ou apresentando problemas - ({ITEM.LASTVALUE}/{ITEM.LASTVALUE2}) - Ativos / Total (LLD)|<p>-</p>|<p>**Expression**: last(/Device BigIP F5/ltmPoolActiveMemberCnt.["{#SNMPVALUE}"])<>last(/Device BigIP F5/ltmPoolMemberCnt.["{#SNMPVALUE}"])</p><p>**Recovery expression**: last(/Device BigIP F5/ltmPoolActiveMemberCnt.["{#SNMPVALUE}"])=last(/Device BigIP F5/ltmPoolMemberCnt.["{#SNMPVALUE}"])</p>|warning|
|Pool {#SNMPVALUE} Indisponível. (Status Atual: {ITEM.VALUE1}). (LLD)|<p>-</p>|<p>**Expression**: last(/Device BigIP F5/ltmPoolStatusAvailState.["{#SNMPVALUE}"])<>1</p><p>**Recovery expression**: last(/Device BigIP F5/ltmPoolStatusAvailState.["{#SNMPVALUE}"])=1</p>|disaster|
