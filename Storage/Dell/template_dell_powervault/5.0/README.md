# DELL POWERVAULT TL2000

## Overview

Created and configured in Zabbix 3.2


 


By using SNMP, I believe it works in other versions.


 


DELL MIBs required


 


Link: https://www.dell.com/support/home/br/en/brbsdt1/drivers/driversdetails?driverId=M0KV7



## Author

Geraldo Jr

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Drive Enumeration|<p>-</p>|`SNMP agent`|driveEntryId<p>Update: 86400</p>|
|Library Enumeration|<p>-</p>|`SNMP agent`|libraryEntryId<p>Update: 86400</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Uptime|<p>-</p>|`SNMP agent`|shadowStatusTimeStamp.0<p>Update: 300</p>|
|Display Name|<p>-</p>|`SNMP agent`|shadowIdDisplayName<p>Update: 86400</p>|
|Status Global do Dispositivo|<p>-</p>|`SNMP agent`|shadowStatusGlobalStatus<p>Update: 60</p>|
|Description|<p>-</p>|`SNMP agent`|shadowIdDescription<p>Update: 86400</p>|
|Drive $1|<p>-</p>|`SNMP agent`|driveEntryId[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Erro de leitura Hard $1|<p>Contagem de recuperação de erros Hard de leitura para o cartucho atual</p>|`SNMP agent`|driveHardReadErrors[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Erro de gravação Hard $1|<p>Contagem de recuperação de erros Soft de gravação para o cartucho atual</p>|`SNMP agent`|driveHardWrtErrors[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Cargas do cartucho  {#SNMPINDEX}|<p>Cargas totais do cartucho para a unidade.</p>|`SNMP agent`|driveLoads[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Drive Product ID $1|<p>-</p>|`SNMP agent`|driveProductId[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|Drive SCSI ID $1|<p>-</p>|`SNMP agent`|driveScsiId[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Drive Product Serial Number $1|<p>-</p>|`SNMP agent`|driveSerNum[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|Erro de leitura Soft $1|<p>Contagem de recuperação de erros Soft de leitura para o cartucho atual</p>|`SNMP agent`|driveSoftReadErrors[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Erro de gravação Soft $1|<p>Contagem de recuperação de erros Soft de gravação para o cartucho atual</p>|`SNMP agent`|driveSoftWrtErrors[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Tempo de movimentação $1|<p>Total de horas de movimentação de unidade deste dispositivo.</p>|`SNMP agent`|driveTpHrs[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Library - Qtde de Drivers|<p>Number of drives contained in this library.</p>|`SNMP agent`|libraryDrvCnt[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Library - Error Description|<p>-</p>|`SNMP agent`|libraryFaultDescr[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Library - Código do Erro|<p>The library Fault error code.</p>|`SNMP agent`|libraryFaultFSC[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Library - Severidade do Erro|<p>The library Fault error code.</p>|`SNMP agent`|libraryFaultSev[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Library - Service TAG|<p>-</p>|`SNMP agent`|libraryServiceTag[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|Library - Qtde de Slots|<p>Number of cartridge slots contained in this library</p>|`SNMP agent`|librarySlotCnt[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Library - Status|<p>-</p>|`SNMP agent`|libraryState[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Library - Uptime|<p>-</p>|`SNMP agent`|libraryTimeStamp[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Erro de gravação Hard em TL2000|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:driveHardWrtErrors[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|average|
|Erro de gravação Soft (leve) no TL2000|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:driveSoftWrtErrors[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|warning|
|Erro de leitura Hard no TL2000|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:driveHardReadErrors[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|average|
|Erro de leitura Soft (leve)  no TL2000|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:driveSoftReadErrors[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|warning|
|Erro em Dispositivo de Fita (TL2000)|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:libraryFaultSev[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|warning|
|Erro de gravação Hard em TL2000 (LLD)|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:driveHardWrtErrors[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|average|
|Erro de gravação Soft (leve) no TL2000 (LLD)|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:driveSoftWrtErrors[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|warning|
|Erro de leitura Hard no TL2000 (LLD)|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:driveHardReadErrors[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|average|
|Erro de leitura Soft (leve)  no TL2000 (LLD)|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:driveSoftReadErrors[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|warning|
|Erro em Dispositivo de Fita (TL2000) (LLD)|<p>-</p>|<p>**Expression**: {DELL POWERVAULT TL2000:libraryFaultSev[{#SNMPVALUE}].last()}>0</p><p>**Recovery expression**: </p>|warning|
