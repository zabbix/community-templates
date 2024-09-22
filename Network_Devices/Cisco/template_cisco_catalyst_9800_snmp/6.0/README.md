# zabbix-cisco-9800
Zabbix template for Cisco Catalyst 9800 Series Wireless Controllers

## What it is?
This is a Zabbix template for [Cisco Catalyst 9800 Series Wireless Controllers](https://www.cisco.com/site/us/en/products/networking/wireless/wireless-lan-controllers/catalyst-9800-series/index.html) using SNMP.
It covers wireless monitoring like Wireless Client Count, AP Count, Radio utilization, Mobility tunnel status, and High Availability status.
Please use the "Cisco IOS by SNMP" template or others to get general IOS-XE status like CPU utilization, Memory usage, or interface status.


## Requirements
- Cisco Catalyst 9800 Series Wireless Controller and supported Access Point
  - [Embedded Wireless Controller for Catalyst Access Point](https://www.cisco.com/c/en/us/products/wireless/embedded-wireless-controller-on-catalyst-access-points/index.html) doesn't work [^1] 
  - Other controllers, including [Cisco Catalyst 9800-CL Wireless Controller for Cloud](https://www.cisco.com/c/en/us/products/collateral/wireless/catalyst-9800-cl-wireless-controller-cloud/nb-06-cat9800-cl-cloud-wirel-data-sheet-ctp-en.html) may work
- IOS-XE 17.11 or later software image to get many wireless SNMP OIDs like AIRESPACE-WIRELESS-MIB::bsnDot11EssNumberOfMobileStations
- SNMP and SNMP trap configuration on Catalyst 9800 WLC
- Zabbix 6.0 or later (tested on 6.0.29)
[^1]: Embedded Wireless Controller (EWC) does not support SNMP and does not implement the SNMP MIBs of Cisco Catalyst 9800 Series Wireless Controllers, although EWC might respond to some of the object identifiers (OIDs). [Configuration guide](https://www.cisco.com/c/en/us/td/docs/wireless/controller/ewc/17-6/config-guide/ewc_cg_17_6/new_configuration_model.html)

Here is a sample configuration for SNMP
```
snmp-server community [SNMP COMMUNITY] RO
snmp-server location ["YOUR PHYSICAL ADDRESS"]
snmp-server enable traps wireless bsnAutoRF
snmp-server enable traps rf
snmp-server host [ZABBIX IP ADDRESS] version 2c [SNMP COMMUNITY]
```


## SNMP MIBs used
| Monitoring Item                      | SNMP MIBs                                                                                        |
| ------------------------------------ | ------------------------------------------------------------------------------------------------ |
| AP Name                              | AIRESPACE-WIRELESS-MIB::bsnAPName                                                                |
| AP Channel Number (2.4GHz)           | AIRESPACE-WIRELESS-MIB::bsnAPIfPhyChannelNumber                                                  |
| AP Channel Number (5GHz)             | AIRESPACE-WIRELESS-MIB::bsnAPIfPhyChannelNumber<br>CISCO-LWAPP-AP-MIB::cLApExtensionChannels     |
| AP Channel Bandwidth (5GHz)          | CISCO-LWAPP-AP-MIB::cLAp11ChannelBandwidth                                                       |
| AP Channel Utilization (2.4GHz/5GHz) | AIRESPACE-WIRELESS-MIB::bsnAPIfLoadChannelUtilization                                            |
| AP Operation Status                  | AIRESPACE-WIRELESS-MIB::bsnAPOperationStatus                                                     |
| AP Serial Number                     | AIRESPACE-WIRELESS-MIB::bsnAPSerialNumber                                                        |
| AP Software Version                  | AIRESPACE-WIRELESS-MIB::bsnAPSoftwareVersion                                                     |
| AP Tx Power Level (2.4GHz/5GHz)      | AIRESPACE-WIRELESS-MIB::bsnAPIfPhyTxPowerLevel                                                   |
| Current Number of AP                 | CISCO-LWAPP-AP-MIB::cLApGlobalAPConnectCount.0                                                   |
| Number of APs Supported              | CISCO-LWAPP-AP-MIB::cLApGlobalMaxApsSupported.0                                                  |
| HA SSO status                        | CISCO-LWAPP-HA-MIB::cLHaPeerHotStandbyEvent                                                      |
| Mobility Member Status (Control)     | CISCO-LWAPP-MOBILITY-MIB::cLMobilityGroupMembersOperControlPathStatus                            |
| Mobility Member Status (Data)        | CISCO-LWAPP-MOBILITY-MIB::cLMobilityGroupMembersOperControlPathStatus                            |
| Rouge AP Count                       | AIRESPACE-WIRELESS-MIB::bsnRogueAPDot11MacAddress                                                |
| Rogue Client Count                   | AIRESPACE-WIRELESS-MIB::bsnRogueClientDot11MacAddress                                            |
| SSID Administrative Status           | AIRESPACE-WIRELESS-MIB::bsnDot11EssAdminStatus                                                   |
| SSID Number of Clients               | AIRESPACE-WIRELESS-MIB::bsnDot11EssNumberOfMobileStations                                        |
| AP disassociation                    | AIRESPACE-WIRELESS-MIB::bsnAPDisassociated<br>CISCO-LWAPP-AP-MIB::ciscoLwappApAssociated         |
| Channel Changed                      | AIRESPACE-WIRELESS-MIB::bsnAPCurrentChannelChanged                                               |
| DFS Radar Detection                  | AIRESPACE-WIRELESS-MIB::bsnRadarChannelDetected                                                  |

The template uses just OID and Standard MIB. No need to install vendor MIBs. Please refer to the below MIBs to understand each SNMP MIB.
- AIRESPACE-REF-MIB.my
- AIRESPACE-WIRELESS-CAPABILITY.my
- AIRESPACE-WIRELESS-MIB.my
- CISCO-LWAPP-AP-MIB.my
- CISCO-LWAPP-DOT11-MIB.my
- CISCO-LWAPP-RF-MIB.my
- CISCO-LWAPP-TC-MIB.my
- CISCO-LWAPP-WLAN-MIB.my
- CISCO-SMI.my
- CISCO-TC.my
- ENTITY-MIB.my

[https://github.com/cisco/cisco-mibs](https://github.com/cisco/cisco-mibs)


## Screenshots
![Screenshot1](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/385067/4dd37fb6-fc9d-7e33-23aa-9928b1c4a85b.png)
![Screenshot2](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/385067/fdc40126-9b34-8200-5ac5-6ea7dad9ecd6.png)


## Tested Environment
- Cisco IOS Software [Dublin], C9800 Software (C9800_IOSXE-K9), Version 17.12.3, RELEASE SOFTWARE (fc7)
  - C9800-L-F-K9
  - C9800-CL-K9
- Zabbix 6.0.29

> [!IMPORTANT]
The test is only done in small lab environments. In a large environment, monitor the CPU utilization of the Wireless Controller in case SNMP consumes too many resources.


## Dicovery rules
| Name | Description | Type | Key and additional info |
| ------- | -------| -------| -------|
| bsnAPTable | Enumerate Access Point and create prototype for each | SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnAPName <br>Update: 1h|
| cLMobilityGroupMembersOperEntry | Enumurate Mobility Group Member and createprotoype for each | SNMP Agent | CISCO-LWAPP-MOBILITY-MIB::cLMobilityGroupMembersOperNodeAddress <br>Update: 1h|
| cLWlanSsid | Enumerate SSID and create prototype for each | SNMP Agent | CISCO-LWAPP-WLAN-MIB::cLWlanSsid <br>Update: 1h |


## Items collected
| Name | Description | Type | Key and additional info |
| ------- | -------| -------| -------|
| AP Name                              |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnAPName <br> Update: 1h  |
| AP Channel Number (2.4GHz)           |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnAPIfPhyChannelNumber <br> Update: 15min   |
| AP Channel Number (5GHz)             |Chennel bonding is supported| SNMP Agent |  AIRESPACE-WIRELESS-MIB::bsnAPIfPhyChannelNumber <br> + CISCO-LWAPP-AP-MIB::cLApExtensionChannels <br> Update: 15min|
| AP Channel Bandwidth (5GHz)          |-| SNMP Agent | CISCO-LWAPP-AP-MIB::cLAp11ChannelBandwidth    <br> Update: 15min    |
| AP Channel Utilization (2.4GHz/5GHz) |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnAPIfLoadChannelUtilization  <br> Update: 15min |
| AP Operation Status                  |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnAPOperationStatus  <br> Update: 15min|
| AP Serial Number                     |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnAPSerialNumber <br> Update: 24h |
| AP Software Version                  |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnAPSoftwareVersion  <br> Update 1h |
| AP Tx Power Level (2.4GHz/5GHz)      |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnAPIfPhyTxPowerLevel <br> Update: 15min|
| Current Number of AP                 |-| SNMP Agent | CISCO-LWAPP-AP-MIB::cLApGlobalAPConnectCount.0 <br> Update: 1min |
| Number of APs Supported              |-| SNMP Agent | CISCO-LWAPP-AP-MIB::cLApGlobalMaxApsSupported.0  <br> Update: 15min |
| HA SSO status                        |-| SNMP Agent | CISCO-LWAPP-HA-MIB::cLHaPeerHotStandbyEvent <br> Update: 15min|
| Mobility Member Status (Control)     |-| SNMP Agent | CISCO-LWAPP-MOBILITY-MIB::cLMobilityGroupMembersOperControlPathStatus <br> Update: 1min|
| Mobility Member Status (Data)        |-| SNMP Agent | CISCO-LWAPP-MOBILITY-MIB::cLMobilityGroupMembersOperControlPathStatus  <br> Update: 1min |
| Rouge AP Count                       |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnRogueAPDot11MacAddress <br> Update: 15min |
| Rogue Client Count                   |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnRogueClientDot11MacAddress  <br> Update: 15min|
| SSID Administrative Status           |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnDot11EssAdminStatus <br> Update: 1min |
| SSID Number of Clients               |-| SNMP Agent | AIRESPACE-WIRELESS-MIB::bsnDot11EssNumberOfMobileStations <br> Update: 1min|
| AP diassociation                     |-| SNMP Trap | AIRESPACE-WIRELESS-MIB::bsnAPDisassociated <br> CISCO-LWAPP-AP-MIB::ciscoLwappApAssociated 
| Channel Changed                      |-| SNMP Trap | AIRESPACE-WIRELESS-MIB::bsnAPCurrentChannelChanged |
| DFS Radar Detection                  |-| SNMP Trap | AIRESPACE-WIRELESS-MIB::bsnRadarChannelDetected  |


##  Triggers
| Name | Description | Expression | Priority |
| ------- | -------| -------| -------|
|AP Name: {{ITEM.VALUE}.regsub("SNMPv2\-SMI\:\:enterprises\.14179\.2\.2\.1\.1\.3\..*\=\s(.*)",\1)} Disjoined|Problem trigger TrapOID<br>AIRESPACE-WIRELESS-MIB::bsnAPDisassociated<br><br>Recovery trigger TrapOID<br>CISCO-LWAPP-AP-MIB::ciscoLwappApAssociated<br><br>Tag "APNAME" from<br>AIRESPACE-WIRELESS-MIB::bsnAPName (problem)<br>CISCO-LWAPP-AP-MIB::cLApName (recovery)|<b>Problem expression</b><br>find(/Cisco Catalyst 9800 by SNMP/snmptrap[SNMPv2-SMI::enterprises.14179.2.6.3.8$\|SNMPv2-SMI::enterprises.9.9.513.0.4$],,"regexp","14179.2.6.3.8")=1<br><br><b>Recovery expression</b><br>find(/Cisco Catalyst 9800 by SNMP/snmptrap[SNMPv2-SMI::enterprises.14179.2.6.3.8$\|SNMPv2-SMI::enterprises.9.9.513.0.4$],,"regexp","9.9.513.0.4")=1| Warning|
|Channel Updated Trap on {{ITEM.VALUE}.regsub("SNMPv2\-SMI\:\:enterprises\.14179\.2\.2\.1\.1\.3\..*\=\s(.*)",\1)} Primaly Channel: {{ITEM.VALUE}.regsub("SNMPv2\-SMI\:\:enterprises\.14179\.2\.6\.2\.23\..*\=\s(.*)",\1)} [^2]|AIRESPACE-WIRELESS-MIB::bsnAPCurrentChannelChanged<br><br>APNAME<br>AIRESPACE-WIRELESS-MIB::bsnAPName<br><br>find(/Cisco Catalyst 9800 by SNMP/snmptrap["SNMPv2-SMI::enterprises.14179.2.6.3.16"],86400)=1|<b>Expression</b><br>find(/Cisco Catalyst 9800 by SNMP/snmptrap["SNMPv2-SMI::enterprises.14179.2.6.3.16"],,"like","SNMPv2-SMI::enterprises.14179.2.6.3.16")=1 |Information|
|DFS Detected on {{ITEM.VALUE}.regsub("SNMPv2\-SMI\:\:enterprises\.14179\.2\.2\.1\.1\.3\..*\=\s(.*)",\1)} Channel: {{ITEM.VALUE}.regsub("SNMPv2\-SMI\:\:enterprises\.14179\.2\.2\.2\.1\.4\..*\=\s(.*)",\1)}|Trigger SNMP OID<br>AIRESPACE-WIRELESS-MIB::bsnRadarChannelDetected<br><br>APNAME<br>AIRESPACE-WIRELESS-MIB::bsnAPName<br><br>CHANNEL<br>AIRESPACE-WIRELESS-MIB::bsnAPIfPhyChannelNumber<br><br>find(/Cisco Catalyst 9800 by SNMP/snmptrap["SNMPv2-SMI::enterprises.14179.2.6.3.81"],86400)=1| <b>Expression</b><br>find(/Cisco Catalyst 9800 by SNMP/snmptrap["SNMPv2-SMI::enterprises.14179.2.6.3.81"],,"like","SNMPv2-SMI::enterprises.14179.2.6.3.81")=1|Information|
|HA Peer Hotstandby status changed |Track CISCO-LWAPP-HA-MIB::cLHaPeerHotStandbyEvent| <b>Expression</b><br>change(/Cisco Catalyst 9800 by SNMP/cLHaPeerHotStandbyEvent)<>0 |Warning|
|Maxmimum AP join limit has reached|Trigger<br>CISCO-LWAPP-AP-MIB::cLApGlobalAPConnectCount.0<br>= CISCO-LWAPP-AP-MIB::cLApGlobalMaxApsSupported.0|<b>Expression</b><br>last(/Cisco Catalyst 9800 by SNMP/cLApGlobalAPConnectCount)=last(/Cisco Catalyst 9800 by SNMP/cLApGlobalMaxApsSupported)|Average|
|AP Operation Status changed {#APNAME} |This is tracking AIRESPACE-WIRELESS-MIB::bsnAPOperationStatus.<br>It will be useful when SNMP trap is not used.|<b>Problem expression</b><br>last(/Cisco Catalyst 9800 by SNMP/bsnAPOperationStatus[{#APNAME}])=2 and last(/Cisco Catalyst 9800 by SNMP/bsnAPOperationStatus[{#APNAME}],#1)<>last(/Cisco Catalyst 9800 by SNMP/bsnAPOperationStatus[{#APNAME}],#2)<br><br><b>Recovery expression</b><br>find(/Cisco Catalyst 9800 by SNMP/bsnAPOperationStatus[{#APNAME}],3,,"1")=1|Warning|
|Channel Updated on {#APNAME} |This is tracking AIRESPACE-WIRELESS-MIB::bsnAPIfPhyChannelNumber. <br>This trigger can catch channel update of both manual channel assignment and auto assignment. |<b>Problem expression</b><br>(nodata(/Cisco Catalyst 9800 by SNMP/bsnAPIfPhyChannelNumber-24ghz-[{#APNAME}],900)=0 <br>or<br>nodata(/Cisco Catalyst 9800 by SNMP/bsnAPIfPhyChannelNumber-cLApExtensionChannels-5ghz-[{#APNAME}],900)=0)<br><br>and<br><br>(change(/Cisco Catalyst 9800 by SNMP/bsnAPIfPhyChannelNumber-24ghz-[{#APNAME}])<>0<br>or<br>change(/Cisco Catalyst 9800 by SNMP/bsnAPIfPhyChannelNumber-cLApExtensionChannels-5ghz-[{#APNAME}])<>0)|Information|
|Mobility Peer status down [{#MOBILITYPEER}]|Tracking CISCO-LWAPP-MOBILITY-MIB::cLMobilityGroupMembersOperControlPathStatus|<b>Problem expression</b><br>last(/Cisco Catalyst 9800 by SNMP/cLMobilityGroupMembersOperControlPathStatus[{#MOBILITYPEER}])=2<br>and<br>(last(/Cisco Catalyst 9800 by SNMP/cLMobilityGroupMembersOperControlPathStatus[{#MOBILITYPEER}],#1)<>last(/Cisco Catalyst 9800 by SNMP/cLMobilityGroupMembersOperControlPathStatus[{#MOBILITYPEER}],#2))<br><br><b>Recovery expression</b><br>find(/Cisco Catalyst 9800 by SNMP/cLMobilityGroupMembersOperControlPathStatus[{#MOBILITYPEER}],600,,"1")=1|Warning|

[^2]: trigger is disabled as default