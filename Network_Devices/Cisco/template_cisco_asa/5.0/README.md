# Cisco ASA

## Description

Version 1.1.3, Release date 29.4.2020 Made by: Ville Leinonen/www.hacknetwork.org Template is tested in Zabbix 4.4 and ASA version 9.14(1) Changelog: SNMPv3 support added TODO (maybe): Interface statistic and more triggers.

## Overview

Version 1.1


Template is tested against Zabbix version 4.4.6 and ASA version 9.14(1).


Failover role can be primary or secondary, it based in your ASA configuration.


Failover status can be Active unit or Standby unit. This indicates which of your Firewall is active right now.


Template also populates inventory fields automaticly.


This is snmpv2 template, but v3 is coming soon.


 


Version 1.1.3


SNMPv3 support added, new macros:


{$SECURITY\_NAME} = Username


{$AUTH\_PASSPHRASE} = Authentication password 


{$PRIV\_PASSPHRASE} = Encryption password


 


Use authentication algorithm SHA and encryption algorithm AES (128).


Added OID: ASA System name (ciscoASAsysName)


 


OLD VERSIONS, USE GITHUB <https://github.com/hrleinonen/zabbix>


More information (soon) <https://www.hacknetwork.org/?page_id=304>



## Author

Ville Leinonen

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of CPU Cores|<p>Discovery number of CPU cores</p>|`SNMP agent`|numOfcore<p>Update: 5m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Chassis Version|<p>-</p>|`SNMP agent`|deviceChassis<p>Update: 60m</p>|
|Failover Role Secondary|<p>Can be: - Primary unit (this device) - Secondary unit (this device)</p>|`SNMP agent`|cfwHardwareStatusFoSecondary<p>Update: 5m</p>|
|Description|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 60m</p>|
|Vendor Name|<p>-</p>|`SNMP agent`|deviceVendor<p>Update: 60m</p>|
|Active AnyConnect Sessions|<p>-</p>|`SNMP agent`|crasSVCNumSessions<p>Update: 5m</p>|
|Failover Role Primary|<p>Can be: - Primary unit (this device) - Secondary unit (this device)</p>|`SNMP agent`|cfwHardwareStatusFoPrimary<p>Update: 5m</p>|
|Connections In Use|<p>Number of connections currently in use by the entire firewall.</p>|`SNMP agent`|cfwConnectionStatValueCurrentInUse<p>Update: 5m</p>|
|Failover Status|<p>Firewall cluster Failover status. Indicates which of the Firewall is active unit in the cluster.</p>|`SNMP agent`|cfwHardwareStatusDetailFoStatus<p>Update: 1m</p>|
|Model Name|<p>-</p>|`SNMP agent`|deviceModel<p>Update: 60m</p>|
|Number of network interfaces|<p>The number of network interfaces (regardless of their current state) present on this system.</p>|`SNMP agent`|ifNumber<p>Update: 60m</p>|
|ASA Version|<p>-</p>|`SNMP agent`|ciscoASA<p>Update: 60m</p>|
|ROMMON Version|<p>-</p>|`SNMP agent`|ciscoROMMON<p>Update: 60m</p>|
|Memory Used|<p>-</p>|`SNMP agent`|ciscoMemoryPoolUsed<p>Update: 1m</p>|
|Memoty Total|<p>-</p>|`Calculated`|ciscoMemoryTotal<p>Update: 1m</p>|
|sysUpTime|<p>-</p>|`SNMP agent`|sysUpTimeInstance<p>Update: 5m</p>|
|Memory Pool Largest Free|<p>-</p>|`SNMP agent`|ciscoMemoryPoolLargestFree<p>Update: 1m</p>|
|Active IKE Peers|<p>-</p>|`SNMP agent`|ciscoIKEPeers<p>Update: 5m</p>|
|Memory Usage|<p>-</p>|`Calculated`|ciscoMemUsage<p>Update: 1m</p>|
|Active WebVPN Sessions|<p>-</p>|`SNMP agent`|crasWebvpnNumSessions<p>Update: 5m</p>|
|Maximum Crypto Throughput|<p>-</p>|`SNMP agent`|ccaMaxCryptoThroughput<p>Update: 60m</p>|
|Total VPN sessions|<p>Total number of VPN sessions.</p>|`Calculated`|totalVPNsessions<p>Update: 5m</p>|
|Memory Free|<p>-</p>|`SNMP agent`|ciscoMemoryPoolFree<p>Update: 1m</p>|
|Chassis Serial Number|<p>-</p>|`SNMP agent`|deviceSerialNum<p>Update: 60m</p>|
|ASA System name|<p>-</p>|`SNMP agent`|ciscoASAsysName<p>Update: 60m</p>|
|Maximum Crypto Sessions|<p>-</p>|`SNMP agent`|ccaMaxCryptoConnections<p>Update: 60m</p>|
|Connections Max Use|<p>Highest number of connections in use at any one time since system start.</p>|`SNMP agent`|cfwConnectionStatValueMaxUse<p>Update: 5m</p>|
|Core {#SNMPINDEX} 1min|<p>-</p>|`SNMP agent`|cpmCPUTotal1minRev[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Core {#SNMPINDEX} 5min|<p>-</p>|`SNMP agent`|cpmCPUTotal5minRev[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

