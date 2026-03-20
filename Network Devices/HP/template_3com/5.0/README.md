# 3COM 4500 28 Ports

## Overview

Template para monitorar o Switch 3COM, modelo 4500 de 28 portas.


Gráficos por porta, Entrada e Saída, Erro de tráfego nas 28 portas.


O template exibe a alteração e status da porta.


O template foi criado por: Marcelo Carvalho eu fiz somente a edição.



## Author

Marcelo Carvalo e edição Gerson Thiago

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Port 22 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227794<p>Update: 30</p>|
|Port 6 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227666<p>Update: 30</p>|
|Port 10 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227698<p>Update: 30</p>|
|Port 6 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227666<p>Update: 30</p>|
|Port 11 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227706<p>Update: 30</p>|
|Port 17 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227754<p>Update: 30</p>|
|Port 27 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227834<p>Update: 30</p>|
|Port 3 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227642<p>Update: 30</p>|
|Port 25 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227818<p>Update: 30</p>|
|Port 11 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227706<p>Update: 30</p>|
|Port 8 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227682<p>Update: 30</p>|
|Port 20 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227778<p>Update: 30</p>|
|Port 1 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227626<p>Update: 30</p>|
|Port 21 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227786<p>Update: 30</p>|
|Port 27 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227834<p>Update: 30</p>|
|Port 4 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227650<p>Update: 30</p>|
|Port 16 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227746<p>Update: 30</p>|
|Port 19 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227770<p>Update: 30</p>|
|Port 1 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227626<p>Update: 30</p>|
|Port 9 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227690<p>Update: 30</p>|
|Port 2 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227634<p>Update: 30</p>|
|Port 9 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227690<p>Update: 30</p>|
|Port 15 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227738<p>Update: 30</p>|
|Port 8 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227682<p>Update: 30</p>|
|Port 17 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227754<p>Update: 30</p>|
|Port 16 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227746<p>Update: 30</p>|
|Port 15 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227738<p>Update: 30</p>|
|Port 8 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227682<p>Update: 30</p>|
|Port 14 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227730<p>Update: 30</p>|
|Port 14 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227730<p>Update: 30</p>|
|Port 22 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227794<p>Update: 30</p>|
|Port 15 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227738<p>Update: 30</p>|
|Port 5 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227658<p>Update: 30</p>|
|Port 19 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227770<p>Update: 30</p>|
|Port 20 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227778<p>Update: 30</p>|
|Port 4 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227650<p>Update: 30</p>|
|Port 23 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227802<p>Update: 30</p>|
|Port 3 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227642<p>Update: 30</p>|
|Port 16 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227746<p>Update: 30</p>|
|Port 28 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227842<p>Update: 30</p>|
|Port 27 Traffic OUT|<p>-</p>|`SNMP agent`|ifOutOctets.4227834<p>Update: 30</p>|
|Port 5 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227658<p>Update: 30</p>|
|Port 21 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227786<p>Update: 30</p>|
|Port 9 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227690<p>Update: 30</p>|
|Port 11 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227706<p>Update: 30</p>|
|Port 19 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227770<p>Update: 30</p>|
|Port 6 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227666<p>Update: 30</p>|
|Port 24 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227810<p>Update: 30</p>|
|Port 18 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227762<p>Update: 30</p>|
|Port 12 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227714<p>Update: 30</p>|
|Port 9 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227690<p>Update: 30</p>|
|Port 21 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227786<p>Update: 30</p>|
|Port 26 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227826<p>Update: 30</p>|
|Port 10 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227698<p>Update: 30</p>|
|Port 18 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227762<p>Update: 30</p>|
|Port 20 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227778<p>Update: 30</p>|
|Port 24 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227810<p>Update: 30</p>|
|Port 21 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227786<p>Update: 30</p>|
|Port 27 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227834<p>Update: 30</p>|
|Port 2 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227634<p>Update: 30</p>|
|Port 5 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227658<p>Update: 30</p>|
|Port 28 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227842<p>Update: 30</p>|
|Port 7 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227674<p>Update: 30</p>|
|Port 19 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227770<p>Update: 30</p>|
|Port 11 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227706<p>Update: 30</p>|
|Port 15 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227738<p>Update: 30</p>|
|Port 22 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227794<p>Update: 30</p>|
|Port 24 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227810<p>Update: 30</p>|
|Port 21 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227786<p>Update: 30</p>|
|Port 2 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227634<p>Update: 30</p>|
|Port 1 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227626<p>Update: 30</p>|
|Port 23 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227802<p>Update: 30</p>|
|Port 13 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227722<p>Update: 30</p>|
|Port 3 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227642<p>Update: 30</p>|
|Port 21 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227786<p>Update: 30</p>|
|Port 15 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227738<p>Update: 30</p>|
|Port 14 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227730<p>Update: 30</p>|
|Port 20 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227778<p>Update: 30</p>|
|Port 19 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227770<p>Update: 30</p>|
|Port 18 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227762<p>Update: 30</p>|
|Port 8 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227682<p>Update: 30</p>|
|Port 7 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227674<p>Update: 30</p>|
|Port 18 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227762<p>Update: 30</p>|
|Port 24 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227810<p>Update: 30</p>|
|Port 12 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227714<p>Update: 30</p>|
|Port 7 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227674<p>Update: 30</p>|
|Port 3 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227642<p>Update: 30</p>|
|Port 24 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227810<p>Update: 30</p>|
|Port 26 Traffic OUT|<p>-</p>|`SNMP agent`|ifOutOctets.4227826<p>Update: 30</p>|
|Port 14 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227730<p>Update: 30</p>|
|Port 27 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227834<p>Update: 30</p>|
|Port 17 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227754<p>Update: 30</p>|
|Port 9 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227690<p>Update: 30</p>|
|Port 8 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227682<p>Update: 30</p>|
|Port 8 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227682<p>Update: 30</p>|
|Port 19 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227770<p>Update: 30</p>|
|Port 5 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227658<p>Update: 30</p>|
|Port 1 Traffic OUT|<p>-</p>|`SNMP agent`|ifOutOctets.4227626<p>Update: 30</p>|
|Port 6 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227666<p>Update: 30</p>|
|Port 13 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227722<p>Update: 30</p>|
|Port 2 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227634<p>Update: 30</p>|
|Port 25 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227818<p>Update: 30</p>|
|Port 17 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227754<p>Update: 30</p>|
|Port 1 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227626<p>Update: 30</p>|
|Port 14 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227730<p>Update: 30</p>|
|Port 3 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227642<p>Update: 30</p>|
|Port 28 Traffic OUT|<p>-</p>|`SNMP agent`|ifOutOctets.4227842<p>Update: 30</p>|
|Port 9 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227690<p>Update: 30</p>|
|Port 3 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227642<p>Update: 30</p>|
|Port 15 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227738<p>Update: 30</p>|
|Port 5 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227658<p>Update: 30</p>|
|Port 28 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227842<p>Update: 30</p>|
|Port 22 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227794<p>Update: 30</p>|
|Port 2 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227634<p>Update: 30</p>|
|Port 23 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227802<p>Update: 30</p>|
|Port 20 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227778<p>Update: 30</p>|
|Port 1 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227626<p>Update: 30</p>|
|Port 5 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227658<p>Update: 30</p>|
|Port 12 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227714<p>Update: 30</p>|
|Port 15 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227738<p>Update: 30</p>|
|Port 22 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227794<p>Update: 30</p>|
|Port 4 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227650<p>Update: 30</p>|
|Port 12 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227714<p>Update: 30</p>|
|Port 8 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227682<p>Update: 30</p>|
|Port 14 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227730<p>Update: 30</p>|
|Port 10 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227698<p>Update: 30</p>|
|Port 10 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227698<p>Update: 30</p>|
|Port 14 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227730<p>Update: 30</p>|
|Port 4 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227650<p>Update: 30</p>|
|Port 22 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227794<p>Update: 30</p>|
|Port 20 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227778<p>Update: 30</p>|
|Port 26 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227826<p>Update: 30</p>|
|Port 26 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227826<p>Update: 30</p>|
|Port 17 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227754<p>Update: 30</p>|
|Port 4 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227650<p>Update: 30</p>|
|Port 2 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227634<p>Update: 30</p>|
|Port 10 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227698<p>Update: 30</p>|
|Port 27 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227834<p>Update: 30</p>|
|Port 5 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227658<p>Update: 30</p>|
|Port 4 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227650<p>Update: 30</p>|
|Port 6 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227666<p>Update: 30</p>|
|Port 11 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227706<p>Update: 30</p>|
|Port 13 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227722<p>Update: 30</p>|
|Port 7 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227674<p>Update: 30</p>|
|Port 7 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227674<p>Update: 30</p>|
|Port 6 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227666<p>Update: 30</p>|
|Port 28 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227842<p>Update: 30</p>|
|Port 16 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227746<p>Update: 30</p>|
|Port 13 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227722<p>Update: 30</p>|
|Port 17 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227754<p>Update: 30</p>|
|Port 25 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227818<p>Update: 30</p>|
|Port 25 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227818<p>Update: 30</p>|
|Port 2 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227634<p>Update: 30</p>|
|Port 16 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227746<p>Update: 30</p>|
|Port 18 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227762<p>Update: 30</p>|
|Port 7 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227674<p>Update: 30</p>|
|Port 3 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227642<p>Update: 30</p>|
|Port 7 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227674<p>Update: 30</p>|
|Port 26 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227826<p>Update: 30</p>|
|Port 26 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227826<p>Update: 30</p>|
|Port 1 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227626<p>Update: 30</p>|
|Port 11 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227706<p>Update: 30</p>|
|Port 25 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227818<p>Update: 30</p>|
|Port 10 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227698<p>Update: 30</p>|
|Port 24 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227810<p>Update: 30</p>|
|Port 12 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227714<p>Update: 30</p>|
|Port 25 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227818<p>Update: 30</p>|
|Port 23 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227802<p>Update: 30</p>|
|Port 6 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227666<p>Update: 30</p>|
|Port 21 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227786<p>Update: 30</p>|
|Port 27 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227834<p>Update: 30</p>|
|Port 19 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227770<p>Update: 30</p>|
|Port 22 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227794<p>Update: 30</p>|
|Port 26 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227826<p>Update: 30</p>|
|Port 10 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227698<p>Update: 30</p>|
|Port 4 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227650<p>Update: 30</p>|
|Port 13 Traffic OUT |<p>-</p>|`SNMP agent`|ifOutOctets.4227722<p>Update: 30</p>|
|Port 23 Last Changed|<p>-</p>|`SNMP agent`|ifLastChange.4227802<p>Update: 30</p>|
|Port 25 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227818<p>Update: 30</p>|
|Port 18 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227762<p>Update: 30</p>|
|Port 11 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227706<p>Update: 30</p>|
|Port 16 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227746<p>Update: 30</p>|
|Port 28 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227842<p>Update: 30</p>|
|Port 23 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227802<p>Update: 30</p>|
|Port 24 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227810<p>Update: 30</p>|
|Port 12 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227714<p>Update: 30</p>|
|Port 23 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227802<p>Update: 30</p>|
|Port 13 Speed|<p>-</p>|`SNMP agent`|ifspeed.4227722<p>Update: 30</p>|
|Port 20 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227778<p>Update: 30</p>|
|Port 9 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227690<p>Update: 30</p>|
|Port 13 Traffic IN|<p>-</p>|`SNMP agent`|ifInOctects.4227722<p>Update: 30</p>|
|Port 18 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227762<p>Update: 30</p>|
|Port 12 Traffic IN Errors|<p>-</p>|`SNMP agent`|ifInErrors.4227714<p>Update: 30</p>|
|Port 16 Traffic OUT Errors|<p>-</p>|`SNMP agent`|ifOutErrors.4227746<p>Update: 30</p>|
|Port 17 Status|<p>-</p>|`SNMP agent`|ifOperStatus.4227754<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

