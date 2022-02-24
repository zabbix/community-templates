# Emby

## Overview

For this template, you only need to change the {$ EMBY\_URL} and {$ EMBY\_TOKEN} macros


To generate the token API, follow the instructions: <https://github.com/MediaBrowser/Emby/wiki>


 


Note: if possible use the Emby URL in http, there may be problems using https


 



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$EMBY_TOKEN}|<p>-</p>|``|Text macro|
|{$EMBY_URL}|<p>-</p>|``|Text macro|
|{$PORT_EMBY}|<p>-</p>|`8096`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Emby Version|<p>-</p>|`Dependent item`|emby.version<p>Update: 0</p>|
|Book Count|<p>-</p>|`Dependent item`|book.count<p>Update: 0</p>|
|Trailer Count|<p>-</p>|`Dependent item`|trailer.count<p>Update: 0</p>|
|Box Set Count|<p>-</p>|`Dependent item`|boxset.count<p>Update: 0</p>|
|Emby itens count|<p>-</p>|`HTTP agent`|itens.count<p>Update: 15m</p>|
|Item Count|<p>-</p>|`Dependent item`|item.count<p>Update: 0</p>|
|Game System Count|<p>-</p>|`Dependent item`|gamesystem.count<p>Update: 0</p>|
|Album Count|<p>-</p>|`Dependent item`|album.count<p>Update: 0</p>|
|TV Shows Count|<p>-</p>|`Dependent item`|series.count<p>Update: 0</p>|
|Emby-Server Process|<p>-</p>|`Zabbix agent`|proc.num[EmbyServer]<p>Update: 1m</p>|
|Artist Count|<p>-</p>|`Dependent item`|artist.count<p>Update: 0</p>|
|Game Count|<p>-</p>|`Dependent item`|game.count<p>Update: 0</p>|
|Movies Count|<p>-</p>|`Dependent item`|movies.count<p>Update: 0</p>|
|Episode Count|<p>-</p>|`Dependent item`|episode.count<p>Update: 0</p>|
|System Info|<p>-</p>|`HTTP agent`|system.info<p>Update: 1d</p>|
|Music Video Count|<p>-</p>|`Dependent item`|musicvideo.count<p>Update: 0</p>|
|Song Count|<p>-</p>|`Dependent item`|song.count<p>Update: 0</p>|
|Program Count|<p>-</p>|`Dependent item`|program.count<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

