# Brother Printers

## Overview

Termplate para monitoramento de impressoras Brother.


Testado nos modelos 8912DW e HL5452.


 



## Author

Fernando Lozer

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Consumables|<p>-</p>|`SNMP agent`|consumablesID<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Contador de Páginas|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.43.10.2.1.4.1.1<p>Update: 3600</p>|
|JetDirect Check|<p>-</p>|`Simple check`|net.tcp.service[tcp,,9100]<p>Update: 30</p>|
|Print Spooler Check|<p>-</p>|`Simple check`|net.tcp.service[tcp,,515]<p>Update: 30</p>|
|Número de Série|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.43.5.1.1.17.1<p>Update: 3600</p>|
|Localização|<p>-</p>|`SNMP agent`|sysLocation.0<p>Update: 3600</p>|
|HTTP Check|<p>-</p>|`Simple check`|net.tcp.service[http]<p>Update: 30</p>|
|Vida Útil restante do Cilindro|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.43.11.1.1.9.1.2<p>Update: 3600</p>|
|Status do Equipamento|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.43.18.1.1.8.1.1<p>Update: 3600</p>|
|Contato|<p>-</p>|`SNMP agent`|sysContact.0<p>Update: 3600</p>|
|Modelo|<p>-</p>|`SNMP agent`|hrDeviceDescr.1<p>Update: 3600</p>|
|$1 Current Capacity|<p>-</p>|`SNMP agent`|ConsumableCurrentCapacity[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|$1 Max Capacity|<p>-</p>|`SNMP agent`|ConsumableMaxCapacity[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|$1 Calculated Capacity (current/max)|<p>Depending on the consumable (toner vs drum/belt) this calculation will return a particular percentage. Drum Units & Belt Units return integer values that can be used in calculations to determine a percentage of how much of the unit is remaining. Max "status" is stored in the MIB and is used in the calculation. Toner consumables return the follow codes: -3 = Level Okay -2 = Low Warning (equivalent to “max status”) 0 = Critical/empty Toner possibilities for calculations of current / max * 100 -3 / -2 * 100 = 150% -2 / -2 * 100 = 100% 0 / -2 * 100 = 0% The calculations above are used in the triggers to make it very straight forward on determining if a toner is low or not.</p>|`Calculated`|CosumableCalculated[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOSTNAME} {#SNMPVALUE} - Critical: {ITEM.LASTVALUE}|<p>Checks if at "critical" level for Toners (code = 0) or drum/belt (<10%)</p>|<p>**Expression**: {Brother Printers:CosumableCalculated[{#SNMPVALUE}].last(0)}<10 or {Brother Printers:ConsumableCurrentCapacity[{#SNMPVALUE}].last(0)}=0</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - Low Warning: {ITEM.LASTVALUE}|<p>Checks if at "warning" level for Toners (code = -2) or drum/belt (>10% & <30%)</p>|<p>**Expression**: {Brother Printers:CosumableCalculated[{#SNMPVALUE}].last(0)}>10 and {Brother Printers:CosumableCalculated[{#SNMPVALUE}].last(0)}<30 or {Brother Printers:ConsumableCurrentCapacity[{#SNMPVALUE}].last(0)} = -2</p><p>**Recovery expression**: </p>|warning|
|{HOSTNAME} {#SNMPVALUE} - Critical: {ITEM.LASTVALUE} (LLD)|<p>Checks if at "critical" level for Toners (code = 0) or drum/belt (<10%)</p>|<p>**Expression**: {Brother Printers:CosumableCalculated[{#SNMPVALUE}].last(0)}<10 or {Brother Printers:ConsumableCurrentCapacity[{#SNMPVALUE}].last(0)}=0</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - Low Warning: {ITEM.LASTVALUE} (LLD)|<p>Checks if at "warning" level for Toners (code = -2) or drum/belt (>10% & <30%)</p>|<p>**Expression**: {Brother Printers:CosumableCalculated[{#SNMPVALUE}].last(0)}>10 and {Brother Printers:CosumableCalculated[{#SNMPVALUE}].last(0)}<30 or {Brother Printers:ConsumableCurrentCapacity[{#SNMPVALUE}].last(0)} = -2</p><p>**Recovery expression**: </p>|warning|
