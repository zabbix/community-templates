# App Kaspersky

## Overview

É obrigatório ter o SNMP habilitado no server, bem como ter habilitado o SNMP na console de gerenciamento do Kaspersky (KSC)


Método de coleta, via SNMPv2


Itens coletados:


* Quantidade de Hosts com licenças expiradas
* Quantidade de Hosts sem verificação
* Quantidade de Hosts sem conexão
* Quantidade de hosts com licença expirando
* Quantidade de hosts localizados
* Quantidade de hosts com Antivírus
* Número de vírus no Unprocessed files
* Quantidade de eventos críticos
* Status da atualização da base
* Último update.


## Author

Carlos Eduardo

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Hosts sem conexão|<p>O número de hosts que não está conectado ao servidor por um longo tempo.</p>|`SNMP agent`|hostsNotConnectedLongTime.0<p>Update: 5h</p>|
|Host licença expirada|<p>O número de hosts com a licença expirada.</p>|`SNMP agent`|hostsLicenceExpired.0<p>Update: 1d</p>|
|Número de host com Antivirus|<p>O número de hosts com software antivírus.</p>|`SNMP agent`|hostsWithAntivirus.0<p>Update: 1d</p>|
|Hosts não verificados|<p>O número de hosts que não foram verificados ultimamente.</p>|`SNMP agent`|hostsNotScannedLately.0<p>Update: 200m</p>|
|Licença expirando em 7 dias|<p>O número de hosts com a licença expirando. A licença considera expirar se expirou menos de 7 dias.</p>|`SNMP agent`|hostsLicenceExpiring.0<p>Update: 1d</p>|
|Ultimo update|<p>A última vez em que o servidor foi atualizado</p>|`SNMP agent`|lastServerUpdateTime.0<p>Update: 700m</p>|
|Quantidade de Eventos Criticos|<p>O número de eventos críticos no servidor.</p>|`SNMP agent`|criticalEventsCount.0<p>Update: 10m</p>|
|Número de host|<p>O número de hosts na console</p>|`SNMP agent`|hostsInGroups.0<p>Update: 1d</p>|
|Status atualização da base|<p>Status atualizado da base</p>|`SNMP agent`|updatesStatus.0<p>Update: 5h</p>|
|Número de Host com vírus Unprocessed Files|<p>O número de hosts com objetos Unprocessed Files</p>|`SNMP agent`|hostsNotCuredObject.0<p>Update: 20m</p>|


## Triggers

There are no triggers in this template.

