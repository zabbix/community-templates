# Mikrotik - BGP LLD

## Overview

MikroTik BGP LLD usando SSH


Ajustes os intervalos de atualizações de acordo com sua necessidade. 


Declare macros do template de acordo com configuração do seu RouterOS.


{$MIKROTIK\_SSH\_PASS}


{$MIKROTIK\_SSH\_PORT}


{$MIKROTIK\_SSH\_USER}


 


Altere o timeout do zabbix-server "zabbix\_server.conf"


Timeout=30


 


OBS: O template não vai monitora peers desabilitados.


O template monitora os seguintes itens


{#PEERNAME} ({#REMOTEAS}) - Prefix


{#PEERNAME} ({#REMOTEAS}) - Status


E gera alarme caso o status do peer vier diferente de "established"


 


Qualquer duvida, segue email para contato.


Email: [jorge.iwano@gmail.com](mailto:jorge.iwano@gmail.com)



## Author

Jorge Iwano

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MIKROTIK_SSH_PASS}|<p>-</p>|`password`|Text macro|
|{$MIKROTIK_SSH_PORT}|<p>-</p>|`22`|Text macro|
|{$MIKROTIK_SSH_USER}|<p>-</p>|`admin`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP - Peers|<p>-</p>|`SSH agent`|ssh.run[,,{$MIKROTIK_SSH_PORT},]<p>Update: 3600s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#PEERNAME} ({#REMOTEAS}) - Prefix|<p>-</p>|`SSH agent`|ssh.run[{#PEERNAME}-prefix,,{$MIKROTIK_SSH_PORT},]<p>Update: 60s</p><p>LLD</p>|
|{#PEERNAME} ({#REMOTEAS}) - Status|<p>-</p>|`SSH agent`|ssh.run[{#PEERNAME}-status,,{$MIKROTIK_SSH_PORT},]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Peer {#PEERNAME} not established|<p>-</p>|<p>**Expression**: find(/Mikrotik - BGP LLD/ssh.run[{#PEERNAME}-status,,22,],,"like","established")=0</p><p>**Recovery expression**: </p>|disaster|
|Peer {#PEERNAME} not established (LLD)|<p>-</p>|<p>**Expression**: find(/Mikrotik - BGP LLD/ssh.run[{#PEERNAME}-status,,22,],,"like","established")=0</p><p>**Recovery expression**: </p>|disaster|
