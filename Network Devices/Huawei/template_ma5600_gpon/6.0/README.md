# SNMP Interfaces Huawei

## Overview

Templete para OLT's Huawei MA5600 e outras OLT's menores.


Observações: 


Dentro do servidor zabbix será necessário editar o arquivo "/etc/snmp/snmp.conf" no meu caso o servidor é ubuntu server. Já dentro do arquivo escreva a linha "noRangeCheck yes" caso ela ainda não exista ou caso ela exista basta descomentar, esse passo é importante para que não retorne erro de "index out of range".


Os equipamentos da Huawei nas interfaces GPON tem um problema com o MIB-ifAlias e MIB-ifDescr, sempre irão retornar o apelido e descrição das interfaces GPON com o mesmo nome. Assim o zabbix não consegue identifica-las separadamente. Porém o MIB-ifName trás o resultado correto das interfaces, segue os exemplos:

 

IF-MIB::ifDescr.[4194304000](tel:(419)%20430-4000) = STRING: Huawei-MA5600-V800R015-GPON\_UNI
IF-MIB::ifDescr.[4194304256](tel:(419)%20430-4256) = STRING: Huawei-MA5600-V800R015-GPON\_UNI
IF-MIB::ifDescr.[4194304512](tel:(419)%20430-4512) = STRING: Huawei-MA5600-V800R015-GPON\_UNI
 
 


IF-MIB::ifName.[4194304000](tel:(419)%20430-4000) = STRING: GPON 0/0/0
IF-MIB::ifName.[4194304256](tel:(419)%20430-4256) = STRING: GPON 0/0/1
IF-MIB::ifName.[4194304512](tel:(419)%20430-4512) = STRING: GPON 0/0/2
 
Agradecimentos: Jorge Iwano, Rodrigo Gregório, Willian Nawate



## Author

Hudson Teixeira

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifName<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of network interfaces|<p>The number of network interfaces (regardless of their current state) present on this system.</p>|`SNMP agent`|ifNumber<p>Update: 60</p>|
|Admin status of interface $1|<p>The desired state of the interface.</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Name of interface $1|<p>-</p>|`SNMP agent`|ifName[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/SNMP Interfaces Huawei/ifOperStatus[{#SNMPVALUE}],#1)<>last(/SNMP Interfaces Huawei/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/SNMP Interfaces Huawei/ifOperStatus[{#SNMPVALUE}],#1)<>last(/SNMP Interfaces Huawei/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
