# Monitoring PPPoE with SNMP
## Overview
Template for monitor PPPoE Sections in Huawei NE-800
## Author
gleydsoncavalcanti
## Macros Used
|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PPPDOWN}|<p>-</p>|`1`|Text macro|
## Template links
There are no template links in this template.
## Discovery rules
There are no template discovery rules in this template.
## Items collected
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Sessões ativas|<p>This object go information number of active sessions in server PPPoE</p>|`SNMP agent`|CurrentSessions<p>Update: 1m</p>|
|Sessões ativas - Alteração|<p>this object go information number of sessions that changed in the server PPPoE</p>|`Calculated`|CurrentSessionsChange<p>Update: 1m</p>||Name|Description|Type|Key and additional info|

## Triggers collected

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Rápida queda de sessões ativas ({ITEM.LASTVALUE1})|<p>-</p>|<p>**Expression**: last(/Huawei - PPPoE Server/CurrentSessionsChange)<=-{$PPPDOWN}</p><p>**Recovery expression**: </p>|information|
|Rápido aumento de sessões ativas ({ITEM.LASTVALUE1})|<p>-</p>|<p>**Expression**: last(/Huawei - PPPoE Server/CurrentSessionsChange)>={$PPPDOWN}</p><p>**Recovery expression**: </p>|information|
