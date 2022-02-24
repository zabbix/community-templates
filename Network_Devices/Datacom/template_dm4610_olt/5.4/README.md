# DATACOM DmOS - ONU Interfaces

## Overview

 


SNMP Discovery - Ethernet UNI Interfaces


SNMP - Ethernet UNI Statistics


SNMP - ONU Power



## Author

Guilherme Zamora Rodrigues

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|onuifDescr<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of network interfaces|<p>The number of network interfaces (regardless of their current state) present on this system.</p>|`SNMP agent`|onuifNumber<p>Update: 3600</p>|
|Admin status of interface $1|<p>The desired state of the interface.</p>|`SNMP agent`|onuifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|onuifAlias[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Description of interface $1|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|onuifDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|onuifInErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|onuifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Power RX on $1|<p>Values of power reported by the ONU.</p>|`SNMP agent`|onuIfOnuPowerRx[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Power TX on $1|<p>Values of power reported by the ONU.</p>|`SNMP agent`|onuIfOnuPowerTx[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|onuifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|onuifOutErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|onuifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/DATACOM DmOS - ONU Interfaces/onuifOperStatus[{#SNMPVALUE}],#1)<>last(/DATACOM DmOS - ONU Interfaces/onuifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Power RX overload on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/DATACOM DmOS - ONU Interfaces/onuIfOnuPowerRx[{#SNMPVALUE}])<-27.0 or last(/DATACOM DmOS - ONU Interfaces/onuIfOnuPowerRx[{#SNMPVALUE}])>-8.0</p><p>**Recovery expression**: </p>|high|
|Power TX overload on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/DATACOM DmOS - ONU Interfaces/onuIfOnuPowerTx[{#SNMPVALUE}])>5.0 or last(/DATACOM DmOS - ONU Interfaces/onuIfOnuPowerTx[{#SNMPVALUE}])<-0.5</p><p>**Recovery expression**: </p>|high|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/DATACOM DmOS - ONU Interfaces/onuifOperStatus[{#SNMPVALUE}],#1)<>last(/DATACOM DmOS - ONU Interfaces/onuifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Power RX overload on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/DATACOM DmOS - ONU Interfaces/onuIfOnuPowerRx[{#SNMPVALUE}])<-27.0 or last(/DATACOM DmOS - ONU Interfaces/onuIfOnuPowerRx[{#SNMPVALUE}])>-8.0</p><p>**Recovery expression**: </p>|high|
|Power TX overload on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/DATACOM DmOS - ONU Interfaces/onuIfOnuPowerTx[{#SNMPVALUE}])>5.0 or last(/DATACOM DmOS - ONU Interfaces/onuIfOnuPowerTx[{#SNMPVALUE}])<-0.5</p><p>**Recovery expression**: </p>|high|
