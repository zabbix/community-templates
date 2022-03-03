# SNMP - Lexmark MONO

## Overview

Template customizado para monitorar os itens:


 


01 Device model


**Maintenance Kit level (Photo Condutor)**


Maintenance Kit capacity


Printer Status


Page Counter


Toner print level 


Toner print capacity


05 Device Serial Number


**KIT Manutenção**


**Kit Rolo**


 


Os itens em negrito foram acrescentados e já estão com as  triggers criada para disparar abaixo de 5%


 


**Criado para monitorar o modelo Lexmark MX711dhe. Em tempo, informo que para monitorar outro modelo de impressora lexmark basta alterar nos itens o SNMP OID.**


Para buscar OID inserir o comando no terminal 


# snmpwalk -v2c -c public + ip (o comando retornara todas OID . )


Template atualizado pois durante a substituição do fotocondutor, a impressora reporta "0" no status do toner para o Zabbix, o que gerava um falso positivo. Para corrigir esse erro, fizemos uma alteraçao na Trigger para desconsiderar o status "0" do toner, reportando toner esgotado quando estiver em 1%, e "Finalizando" entre 1 e 5%, podendo ser alterado conforme sua necessidade.



## Author

Thiago Surette

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Maintenance Kit capacity|<p>-</p>|`SNMP agent`|MaintenanceKitMaxCapacity<p>Update: 3600</p>|
|KIT Manutencao|<p>-</p>|`SNMP agent`|Kitmanutencao<p>Update: 30s</p>|
|01 Device model|<p>-</p>|`SNMP agent`|deviceModel<p>Update: 30</p>|
|Page Counter|<p>-</p>|`SNMP agent`|prtMarkerLifeCount<p>Update: 60</p>|
|05 Device Serial Number|<p>-</p>|`SNMP agent`|serialNumber<p>Update: 3600</p>|
|Device Manufacturer|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|deviceManufacturer<p>Update: 3600</p>|
|Toner print level|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevel<p>Update: 80s</p>|
|Kit Rolo|<p>-</p>|`SNMP agent`|Kitrolo<p>Update: 30s</p>|
|Printer Status|<p>-</p>|`SNMP agent`|prtConsoleDescription<p>Update: 60</p>|
|Maintenance Kit level|<p>-</p>|`SNMP agent`|MaintenanceKitCurrentLevel<p>Update: 60s</p>|
|Toner print capacity|<p>-</p>|`SNMP agent`|prtMarkerSuppliesMaxCapacity<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

