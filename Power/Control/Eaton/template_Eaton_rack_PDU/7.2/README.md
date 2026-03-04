# EATON Rack PDU Template for Rack PDU G4 and Rack PDU G3 (formerly Eaton ePDU G3)

## Overview

This template is derivated from teamplate Eaton ePDU created by Valentin Stangaciu

This updated template is compatible with EATON Rack PDU G4 and Eaton Rack PDU G3 (formerly ePDU G3). This one is permitting to access to all the data of branches and outlets up to Managed PDU.

This new version is adding an Automatic Discovery Rules which is adding automatically the items described in Discovery Rules below and these related graphs for Current and Power on each branches automatically.


The Template has been tested with 
- Eaton Rack PDU G4 Metered Input
- Eaton Rack PDU G4 Managed
- Eaton Rack PDU G3 Switched
- Eaton Rack PDU G3 Managed


Created in Zabbix v5.4
Updated in Zabbix v7.2



## Author

Valentin Stangaciu - valentin.stangaciu@cs.upt.ro
Updated and Modified by 
Quentin Renard - quentin.renard@gmail.com

## Macros used

There are no macros links in this template.

## Template links

Template Module Generic SNMP

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Input|<p>Defining Number of Input (1ph or 3 phases)</p>|`SNMP agent`|inputCurrent<p>Update: 30s</p>|
|Input Current|<p>PDU Input Current</p>|`SNMP agent`|inputCurrent<p>Update: 30s</p>|
|Input Power|<p>PDU Input Power</p>|`SNMP agent`|inputPower<p>Update: 30s</p>|
|Input Voltage|<p>PDU Input Voltage</p>|`SNMP agent`|inputVoltage<p>Update: 30s</p>|
|Group|<p>PDU Branches</p>|`SNMP agent`|groupsInfo<p>Update: 30s</p>|
|Group Voltage|<p>Voltage for each PDU Branches</p>|`SNMP agent`|groupVoltage<p>Update: 30s</p>|
|Group Current|<p>Current for each PDU Branches</p>|`SNMP agent`|groupCurrent<p>Update: 30s</p>|
|Outlet|<p>Defining Number of Outlets</p>|`SNMP agent`|outlet<p>Update: 30s</p>|
|Outlet Current|<p>Outlet Current</p>|`SNMP agent`|outletCurrent<p>Update: 30s</p>|
|Outlet Power|<p>Outlet Power</p>|`SNMP agent`|outletPower<p>Update: 30s</p>|
