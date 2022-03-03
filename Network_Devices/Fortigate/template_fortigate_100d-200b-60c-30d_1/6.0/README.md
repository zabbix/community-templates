# FGT-CPU

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Numero de Processadores|<p>-</p>|`SNMP agent`|fgProcessorCount<p>Update: 3600</p>|
|Uso de CPU do sistema|<p>-</p>|`SNMP agent`|fgSysCpuUsage<p>Update: 10</p>|


## Triggers

There are no triggers in this template.

# FGT-EQUIPAMENTO

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Versão do banco de dados de assinatura de vírus|<p>-</p>|`SNMP agent`|fgSysVersionAv<p>Update: 600</p>|
|Versão do FortiOS|<p>-</p>|`SNMP agent`|fgSysVersion<p>Update: 600</p>|
|Acessibilidade do dispositivo usando ICMP|<p>-</p>|`Simple check`|icmpping<p>Update: 60</p>|
|Versão do banco de dados de assinatura IPS|<p>-</p>|`SNMP agent`|fgSysVersionIps<p>Update: 600</p>|
|Nome do Dispositivo|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 600</p>|
|Uso de Disco|<p>-</p>|`SNMP agent`|fgSysDiskUsage<p>Update: 600</p>|
|Contato|<p>-</p>|`SNMP agent`|sysContact<p>Update: 600</p>|
|Capacidade de Disco|<p>-</p>|`SNMP agent`|fgSysDiskCapacity<p>Update: 600</p>|
|Fabricante|<p>-</p>|`SNMP agent`|mib-2.47.1.2.1.1.2.1<p>Update: 600</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 600</p>|
|Localização do Dispositivo|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 600</p>|
|Número Serial|<p>-</p>|`SNMP agent`|fnSysSerial<p>Update: 600</p>|
|Modelo do Dispositivo|<p>-</p>|`SNMP agent`|entPhysicalModelName<p>Update: 600</p>|
|Perda de pacotes de dispositivos|<p>-</p>|`Simple check`|icmppingloss<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

# FGT-INTERFACES DISCOVERY

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interfaces de Rede|<p>-</p>|`SNMP agent`|ifname<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Upload $1|<p>-</p>|`SNMP agent`|ifHCOutOctets[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Velocidade do Link $1|<p>-</p>|`SNMP agent`|ifHighSpeed[{#SNMPVALUE}]<p>Update: 600</p><p>LLD</p>|
|Download $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

# FGT-MEMORIA

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


 


Efetuado ajustes do tempo de coleta e algumas aplicações para melhor visualização - Atualizado para a versão 3.2



## Author

Leonardo Nascimento da Silva

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Uso da memória do sistema (%)|<p>-</p>|`SNMP agent`|fgSysMemUsage<p>Update: 10</p>|


## Triggers

There are no triggers in this template.

