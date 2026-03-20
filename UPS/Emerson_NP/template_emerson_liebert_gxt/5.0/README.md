# Emerson_Liebert

## Overview

Athough I've seen some Emerson templates, none of them worked with my UPS GXT3-XXXXX. So I created this template with lld for the UPS outputs and some itens that I usually need (like % Load).


It's basic but can help someone in need some day.


Battery Charge Status, Battery Charge Remaining %, Battery Voltage, System Info (Contact, Uptime, Serial, Firmware and etc), Output Load and Input Voltage


ps: There's a macro for SNMP community, so you might want to change it.


Tested in Zabbix 3.4.3


 


Cheers!


 


##################


 


Embora eu já tenha visto alguns templates de No-Breaks Emerson na internet, nenhum deles funcionou com meu equipamento (modelo GXT3-XXXX). Então eu criei este template com lld para descobrir as saidas e criar as % de carga de cada saída.


É um template básico mas pode ajudar alguém algum dia.


Carga de Bateria, Status da Bateris, Carga Restante (em %), Carga Restante (em min), Voltagem da Bateria, Informações do Equipamento (Nome, Tempo sem desligar, número de série, versão do firmware e etc), Carga de Saida e Tensão de Entrada.


Obs: Há uma macro criada para a community do SNMP, então talvez você queira alterar.


 


Sucesso!


 Luiz Fernando Gondin Santos



## Author

Luiz Fernando Gondin

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|UPS Load Output|<p>Output Load Discovery</p>|`SNMP agent`|upsOutputPercentLoad<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Output Source|<p>-</p>|`SNMP agent`|upsOutputSource<p>Update: 30s</p>|
|System Firmware Version|<p>-</p>|`SNMP agent`|lgpAgentIdenFirmwareVersion<p>Update: 1m</p>|
|System Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 1m</p>|
|System Description|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 1m</p>|
|Battery Status|<p>-</p>|`SNMP agent`|upsBatteryStatus<p>Update: 30s</p>|
|System Network Card Model|<p>-</p>|`SNMP agent`|lgpAgentIdenModel<p>Update: 1m</p>|
|Battery Voltage|<p>-</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 30s</p>|
|Ups Input Voltage|<p>-</p>|`SNMP agent`|upsConfigInputVoltage<p>Update: 30s</p>|
|System Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 1m</p>|
|Battery Time Remaining|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 1m</p>|
|Ups Output Voltage|<p>-</p>|`SNMP agent`|upsConfigOutputVoltage<p>Update: 30s</p>|
|Battery Charge Remaining|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 1m</p>|
|System Manufacturer|<p>-</p>|`SNMP agent`|lgpAgentIdenManufacturer<p>Update: 1m</p>|
|System Serial Number|<p>-</p>|`SNMP agent`|lgpAgentIdenSerialNumber<p>Update: 1m</p>|
|System Contact|<p>-</p>|`SNMP agent`|sysContact<p>Update: 1m</p>|
|Ups Auto Restart|<p>-</p>|`SNMP agent`|upsAutoRestart<p>Update: 30s</p>|
|System Model|<p>-</p>|`SNMP agent`|upsIdenModel<p>Update: 1m</p>|
|System Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 1m</p>|
|Output Load at Line {#SNMPINDEX}|<p>Discovered Output Load Percentual</p>|`SNMP agent`|ups.Output.Percentload.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

