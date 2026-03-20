# Solustic-Modulo SNMP Generico v1.0.2

## Description

MIBs: - SNMPv2-MIB

## Overview

Template Básico para monitoramento OLT Intelbras 4840E.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disponibilidade do SNMP|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 2m</p>|
|ID do objeto (sysObjectID)|<p>-</p>|`SNMP agent`|SNMPv2-MIB.sysObjectID.0<p>Update: 6h</p>|
|Localizacao (sysLocation)|<p>-</p>|`SNMP agent`|SNMPv2-MIB.sysLocation.0<p>Update: 6h</p>|
|Traps SNMP nao tratados|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|Nome (hostname)|<p>-</p>|`SNMP agent`|SNMPv2-MIB.sysName.0<p>Update: 2h</p>|
|Descricao do sistema (sysDescr)|<p>-</p>|`SNMP agent`|SNMPv2-MIB.sysDescr.0<p>Update: 6h</p>|


## Triggers

There are no triggers in this template.

# Solustic - OLT GCOM EL5610 (Intelbras 4840E) v1.0.0

## Description

MIBs: - SNMPv2-MIB

## Overview

Template Básico para monitoramento OLT Intelbras 4840E.



## Description

Homologado na EL5610-04P (Intelbras 4840E) firmware V100R001B01D001P006SP5

## Overview

Template Básico para monitoramento OLT Intelbras 4840E.



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$EPON.ONU_NOME.IMPORTANTE}|<p>Palavra no nome da ONU que deve ser criado alertas diferenciados</p>|`(?i)(pacpon|pac pon|torre)`|Text macro|
|{$OLT_EPON.POTENCIA_RX_ONU.CRITICO}|<p>Potencia em dBm do sinal da ONU para disparar o alerta.</p>|`-29`|Text macro|
|{$REGEX_IFNAME_VIRTUAL}|<p>-</p>|`VLAN`|Text macro|
|{$REGEX_IFOPERSTATUS_VIRTUAL}|<p>-</p>|`^(2|6)$`|Text macro|
|{$REGEX_IFTYPE_FISICA}|<p>6=ethernetCsmacd, 117=gigabitEthernet</p>|`^(6|117|62)$`|Text macro|
|{$REGEX_IFTYPE_VIRTUAL}|<p>53=propVirtual, 58=frameRelayInterconnect, 131=tunnel, 135=l2vlan, 136=l3ipvlan, 161=ieee8023adLag</p>|`^(53|58|131|135|136|161)$`|Text macro|


## Template links

|Name|
|----|
|Solustic-Modulo SNMP Generico v1.0.2|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Descoberta de interfaces PON|<p>-</p>|`SNMP agent`|EPON-PON-CONFIG-MIB.eponPonOpmTable<p>Update: 12h</p>|
|Descoberta de ONUs|<p>-</p>|`SNMP agent`|EPON-ONU-CONFIG-MIB.eponOnuInfoTable<p>Update: 2h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status de ONU (JSON)|<p>-</p>|`SNMP agent`|EPON-ONU-CONFIG-MIB.eponOnuOperationStatus<p>Update: 1m</p>|
|Tempo de atividade (uptime)|<p>-</p>|`SNMP agent`|SNMPv2-MIB.sysUpTime.0<p>Update: 2m</p>|
|Interface PON {{#SNMPINDEX}.regsub("(\d+)\.(\d+)","\1/\2")}: Temperatura|<p>-</p>|`SNMP agent`|EPON-PON-CONFIG-MIB.eponPonOpmTemperature[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface PON {{#SNMPINDEX}.regsub("(\d+)\.(\d+)","\1/\2")}: Corrente bias|<p>-</p>|`SNMP agent`|EPON-PON-CONFIG-MIB.eponPonOpmBias[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface PON {{#SNMPINDEX}.regsub("(\d+)\.(\d+)","\1/\2")}: Voltagem|<p>-</p>|`SNMP agent`|EPON-PON-CONFIG-MIB.eponPonOpmVcc[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Total de ONUs offline na PON {{#SNMPINDEX}.regsub("(\d+)\.(\d+)","\1/\2")}|<p>-</p>|`Dependent item`|EPON-ONU-CONFIG-MIB.eponOnuOperationStatus.[{#SNMPINDEX},onustatus != 1]<p>Update: 0</p><p>LLD</p>|
|ONU {#CARD}/{#PON}/{#ONU} {{#ONUID}.regsub("(\w+).(\w+).(\w+).(\w+).(\w+).(\w+)","\1:\2:\3:\4:\5:\6")} ({#ONUNAME}): Potencia Rx|<p>-</p>|`SNMP agent`|EPON-ONU-CONFIG-MIB.eponOnuOpmRxPower.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|ONU {#CARD}/{#PON}/{#ONU} {{#ONUID}.regsub("(\w+).(\w+).(\w+).(\w+).(\w+).(\w+)","\1:\2:\3:\4:\5:\6")} ({#ONUNAME}): Status|<p>-</p>|`Dependent item`|EPON-ONU-CONFIG-MIB.eponOnuOperationStatus.[{#SNMPINDEX}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|ONU {#CARD}/{#PON}/{#ONU} {{#ONUID}.regsub("(\w+).(\w+).(\w+).(\w+).(\w+).(\w+)","\1:\2:\3:\4:\5:\6")} ({#ONUNAME}) está offline|<p>-</p>|<p>**Expression**: {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOperationStatus.[{#SNMPINDEX}].diff()} = 1 and {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOperationStatus.[{#SNMPINDEX}].last()} = 0</p><p>**Recovery expression**: {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOperationStatus.[{#SNMPINDEX}].last()} = 1</p>|average|
|Potencia da ONU {#CARD}/{#PON}/{#ONU} {{#ONUID}.regsub("(\w+).(\w+).(\w+).(\w+).(\w+).(\w+)","\1:\2:\3:\4:\5:\6")} ({#ONUNAME}) abaixo do limite|<p>ultima leitura: {ITEM.LASTVALUE1} limite: {$OLT_EPON.POTENCIA_RX_ONU.CRITICO} dBm</p>|<p>**Expression**: {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOpmRxPower.[{#SNMPINDEX}].last()} <= -29</p><p>**Recovery expression**: {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOpmRxPower.[{#SNMPINDEX}].min(1h)} >= ( -29 + 2 )</p>|average|
|ONU {#CARD}/{#PON}/{#ONU} {{#ONUID}.regsub("(\w+).(\w+).(\w+).(\w+).(\w+).(\w+)","\1:\2:\3:\4:\5:\6")} ({#ONUNAME}) está offline (LLD)|<p>-</p>|<p>**Expression**: {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOperationStatus.[{#SNMPINDEX}].diff()} = 1 and {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOperationStatus.[{#SNMPINDEX}].last()} = 0</p><p>**Recovery expression**: {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOperationStatus.[{#SNMPINDEX}].last()} = 1</p>|average|
|Potencia da ONU {#CARD}/{#PON}/{#ONU} {{#ONUID}.regsub("(\w+).(\w+).(\w+).(\w+).(\w+).(\w+)","\1:\2:\3:\4:\5:\6")} ({#ONUNAME}) abaixo do limite (LLD)|<p>ultima leitura: {ITEM.LASTVALUE1} limite: {$OLT_EPON.POTENCIA_RX_ONU.CRITICO} dBm</p>|<p>**Expression**: {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOpmRxPower.[{#SNMPINDEX}].last()} <= -29</p><p>**Recovery expression**: {Solustic-GCOM_EL5610_Intelbras_4840E:EPON-ONU-CONFIG-MIB.eponOnuOpmRxPower.[{#SNMPINDEX}].min(1h)} >= ( -29 + 2 )</p>|average|
