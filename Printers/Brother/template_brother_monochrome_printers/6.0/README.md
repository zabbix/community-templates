# Brother Printers

## Overview

Brother Monochrome Printer Template


 


**Low Tonner Alert** **and Others**


 


tested on: DCP-7065DN | DCP-L5652DN | MFC-7460DN | DCP-L2540DW  




## Author

Renan R. Santos

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template SNMP Interfaces|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescr<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Alert Color|<p>-</p>|`SNMP agent`|brBackLightColor<p>Update: 30s</p>|
|Alert Description|<p>prtAlertDescription</p>|`SNMP agent`|prtAlertDescription<p>Update: 30s</p>|
|Drum Unit Max Capacity|<p>-</p>|`SNMP agent`|prtMarkerSuppliesMaxCapacity.2<p>Update: 10m</p>|
|Status Text 1|<p>prtConsoleDisplayBufferText</p>|`SNMP agent`|mib-2.43.16.5.1.2.1.1<p>Update: 30s</p>|
|Status Text 2|<p>prtConsoleDisplayBufferText</p>|`SNMP agent`|mib-2.43.16.5.1.2.1.2<p>Update: 30s</p>|
|Cartridge name|<p>-</p>|`SNMP agent`|mib-2.43.11.1.1.6.1.1<p>Update: 1d</p>|
|Page Counter|<p>-</p>|`SNMP agent`|prtMarkerLifeCount<p>Update: 5m</p>|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 1h</p>|
|Drum Unit Total Printed|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevel.2<p>Update: 5m</p>|
|Serial Number|<p>-</p>|`SNMP agent`|prtGeneralSerialNumber<p>Update: 1h</p>|
|Device contact details|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 1h</p>|
|Drum Unit % Life Remaining|<p>-</p>|`Calculated`|drum-use<p>Update: 10m</p>|
|Alert Code|<p>prtAlertCode</p>|`SNMP agent`|prtAlertCode<p>Update: 30s</p>|
|Device Name|<p>-</p>|`SNMP agent`|brMultiIFNodeName<p>Update: 1h</p>|
|Model Name|<p>-</p>|`SNMP agent`|hrDeviceDescr<p>Update: 1h</p>|
|JetDirect Check|<p>-</p>|`Simple check`|net.tcp.service[tcp,,9100]<p>Update: 1m</p>|
|Print Spooler Check|<p>-</p>|`Simple check`|net.tcp.service[tcp,,515]<p>Update: 1m</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 1m</p>|
|HTTP Check|<p>-</p>|`Simple check`|net.tcp.service[http]<p>Update: 1m</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Admin status of interface $1|<p>The desired state of the interface.</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Description of interface $1|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/Brother Printers/ifOperStatus[{#SNMPVALUE}],#1)<>last(/Brother Printers/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/Brother Printers/ifOperStatus[{#SNMPVALUE}],#1)<>last(/Brother Printers/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
