requires zabbix 6.2(!!!)
wifi APs are created as separate devices, with interface and data from WLC, AP direct ping, and AP-WLC ping (it is assumed that all APs have a preferred controller, in cases if there is more than one WLC)

# template_Cisco_WiFi_WLC_62
The main template assigned to the controller.

## Macros used
There are no macros links in this template.


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|WLC AP data|Creates nodes with template_Cisco_WiFi_WLC_62_AP template and {$MAC_ADD_DEC} macro|`SNMP agent`|bsnAPName<p>Update: 1h</p>|
|WLC SSID data||`SNMP agent`|bsnDot11EssSsid<p>Update: 1h</p>|






# template_Cisco_WiFi_WLC_62_AP
DO NOT ATTACH!!!
Created automatically by the main template

## Macros used
# template_Cisco_WiFi_WLC_62_AP
|Name|Description|
|----|-----------|
|{$MAC_ADD_DEC}|Decimal display mac address <p>Automatically set by Detection</p>|

