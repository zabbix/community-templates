# Ubiquiti Unifi AP LR SNMPv1

## Overview

Template para Ubiquiti Unifi AP e Wifi



## Author

leonardog50

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces|<p>-</p>|`SNMP agent`|ifDescr<p>Update: 30</p>|
|Memory Discovery|<p>-</p>|`SNMP agent`|memory.discovery<p>Update: 1h</p>|
|CPU Discovery|<p>HOST-RESOURCES-MIB::hrProcessorTable discovery</p>|`SNMP agent`|hrProcessorLoad.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Incoming Traffic No-Unicast 02|<p>-</p>|`SNMP agent`|ifInNoUcast.2<p>Update: 600</p>|
|Guests connected to site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap, guest-num_sta, sum]<p>Update: 60s</p>|
|{#ALIAS} '$2' state|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, adopted]<p>Update: 600s</p>|
|Incoming Traffic Unicast 03|<p>-</p>|`SNMP agent`|ifInUcast.3<p>Update: 600</p>|
|Outgoing Traffic 06|<p>-</p>|`SNMP agent`|ifOutOctets.6<p>Update: 300</p>|
|Radio RSSI|<p>-</p>|`SNMP agent`|ubntWlStatRssi<p>Update: 30s</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>-</p>|`SNMP agent`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>Update: 30s</p>|
|Guests connected to {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, guest-num_sta]<p>Update: 60s</p>|
|Bandwidth 07|<p>-</p>|`SNMP agent`|ifSpeed.7<p>Update: 600</p>|
|Outgoing Traffic 01|<p>-</p>|`SNMP agent`|ifOutOctets.1<p>Update: 300</p>|
|Incoming Traffic Unicast 05|<p>-</p>|`SNMP agent`|ifInUcast.5<p>Update: 600</p>|
|Number of WLANs on site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[wlan, items_num, count]<p>Update: 60s</p>|
|Model of {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, model]<p>Update: 3600s</p>|
|Incoming Traffic No-Unicast 06|<p>-</p>|`SNMP agent`|ifInNoUcast.6<p>Update: 600</p>|
|Number of $2 AP's on site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap, isolated, count]<p>Update: 60s</p>|
|Incoming Traffic No-Unicast 01|<p>-</p>|`SNMP agent`|ifInNoUcast.1<p>Update: 600</p>|
|AirMax Capacity|<p>-</p>|`SNMP agent`|ubntAirMaxCapacity<p>Update: 30s</p>|
|Operation Status 04|<p>-</p>|`SNMP agent`|ifOperStatus.4<p>Update: 60</p>|
|Wireless incoming traffic of site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap, rx_bytes, sum]<p>Update: 30s</p>|
|Radio Chain Mask|<p>-</p>|`SNMP agent`|ubntRadioChainmask<p>Update: 30s</p>|
|Radio Mode|<p>-</p>|`SNMP agent`|ubntRadioMode<p>Update: 30s</p>|
|Operating system|<p>-</p>|`SNMP agent`|system.sw.os<p>Update: 3600s</p>|
|Device uptime|<p>-</p>|`SNMP agent`|system.uptime[sysUpTime]<p>Update: 30s</p>|
|Radio TX Power|<p>-</p>|`SNMP agent`|ubntRadioTxPower<p>Update: 30s</p>|
|Operation Status 06|<p>-</p>|`SNMP agent`|ifOperStatus.6<p>Update: 60</p>|
|Users connected to {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, user-num_sta]<p>Update: 60s</p>|
|Outgoing Traffic 03|<p>-</p>|`SNMP agent`|ifOutOctets.3<p>Update: 300</p>|
|Bandwidth 05|<p>-</p>|`SNMP agent`|ifSpeed.5<p>Update: 600</p>|
|Bandwidth 04|<p>-</p>|`SNMP agent`|ifSpeed.4<p>Update: 600</p>|
|Device name|<p>-</p>|`SNMP agent`|system.name<p>Update: 1h</p>|
|Firmware of {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, version]<p>Update: 3600s</p>|
|Users connected to site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap, user-num_sta, sum]<p>Update: 60s</p>|
|Bandwidth 03|<p>-</p>|`SNMP agent`|ifSpeed.3<p>Update: 600</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>-</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 30s</p>|
|Incoming Traffic Unicast 04|<p>-</p>|`SNMP agent`|ifInUcast.4<p>Update: 600</p>|
|Incoming Traffic No-Unicast 07|<p>-</p>|`SNMP agent`|ifInNoUcast.7<p>Update: 600</p>|
|Wireless power on {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, ng-tx_power]<p>Update: 120s</p>|
|Bandwidth 02|<p>-</p>|`SNMP agent`|ifSpeed.2<p>Update: 600</p>|
|Outgoing Traffic 04|<p>-</p>|`SNMP agent`|ifOutOctets.4<p>Update: 300</p>|
|Operation Status 03|<p>-</p>|`SNMP agent`|ifOperStatus.3<p>Update: 60</p>|
|Description Interface $1|<p>-</p>|`SNMP agent`|ifDescr.1<p>Update: 600</p>|
|TX retries on {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, ng_tx_retries]<p>Update: 60s</p>|
|Wireless outgoing drops on site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap,stat.tx_dropped, sum]<p>Update: 30s</p>|
|Incoming Traffic 05|<p>-</p>|`SNMP agent`|ifInOctets.5<p>Update: 300</p>|
|Device description|<p>-</p>|`SNMP agent`|system.descr<p>Update: 1h</p>|
|Outgoing Traffic 05|<p>-</p>|`SNMP agent`|ifOutOctets.5<p>Update: 300</p>|
|Incoming Traffic 04|<p>-</p>|`SNMP agent`|ifInOctets.4<p>Update: 300</p>|
|Number of all AP's on site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap, items_num, count]<p>Update: 3600s</p>|
|HP V1910-48G Switch JE009A|<p>-</p>|`SNMP agent`|system.hw.version<p>Update: 3600s</p>|
|Device uptime|<p>MIB: SNMPv2-MIB The time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|system.uptime<p>Update: 30s</p>|
|Incoming Traffic Unicast 02|<p>-</p>|`SNMP agent`|ifInUcast.2<p>Update: 600</p>|
|Clients connected to {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, num_sta]<p>Update: 60s</p>|
|Number of $2 AP's on site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap, locating, count]<p>Update: 60s</p>|
|Operation Status 05|<p>-</p>|`SNMP agent`|ifOperStatus.5<p>Update: 60</p>|
|Operation Status 02|<p>-</p>|`SNMP agent`|ifOperStatus.2<p>Update: 60</p>|
|Incoming Traffic Unicast 06|<p>-</p>|`SNMP agent`|ifInUcast.6<p>Update: 600</p>|
|Incoming Traffic Unicast 07|<p>-</p>|`SNMP agent`|ifInUcast.7<p>Update: 600</p>|
|Incoming Traffic Unicast 01|<p>-</p>|`SNMP agent`|ifInUcast.1<p>Update: 600</p>|
|Firmware version|<p>MIB: ENTITY-MIB</p>|`SNMP agent`|system.hw.firmware<p>Update: 3600s</p>|
|Incoming Traffic  01|<p>-</p>|`SNMP agent`|ifInOctets.1<p>Update: 300</p>|
|Operation Status 07|<p>-</p>|`SNMP agent`|ifOperStatus.7<p>Update: 60</p>|
|Device Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|Radio Rx Rate|<p>-</p>|`SNMP agent`|ubntWlStatRxRate<p>Update: 30s</p>|
|Number of $2 AP's on site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap, adopted, count]<p>Update: 600s</p>|
|Serial of {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID},  serial]<p>Update: 3600</p>|
|Radio Signal|<p>-</p>|`SNMP agent`|ubntWlStatSignal<p>Update: 30s</p>|
|SNMP traps (fallback)|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|Clients connected to site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap, num_sta, sum]<p>Update: 30s</p>|
|Radio Noise|<p>-</p>|`SNMP agent`|ubntWlStatNoiseFloor<p>Update: 30s</p>|
|Description Interface $1|<p>-</p>|`SNMP agent`|ifDescr.4<p>Update: 600</p>|
|Wireless channel on {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, ng-channel]<p>Update: 120s</p>|
|TX timeout on {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, ng_ast_txto]<p>Update: 60s</p>|
|Incoming Traffic 06|<p>-</p>|`SNMP agent`|ifInOctets.6<p>Update: 300</p>|
|Device Chipset Version|<p>-</p>|`SNMP agent`|ubntChipsetVersion<p>Update: 60s</p>|
|Incoming Traffic 07|<p>-</p>|`SNMP agent`|ifInOctets.7<p>Update: 300</p>|
|Radio Channel Width|<p>-</p>|`SNMP agent`|ubntWlStatChanWidth<p>Update: 30s</p>|
|Incoming Traffic 02|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 300</p>|
|Wireless outgoing traffic on {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, tx_bytes]<p>Update: 60s</p>|
|Incoming Traffic No-Unicast 03|<p>-</p>|`SNMP agent`|ifInNoUcast.3<p>Update: 600</p>|
|Outgoing Traffic  02|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 300</p>|
|Radio CCQ|<p>-</p>|`SNMP agent`|ubntWlStatCcq<p>Update: 30s</p>|
|Device Contact Details|<p>-</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|AirMax Quality|<p>-</p>|`SNMP agent`|ubntAirMaxQuality<p>Update: 30s</p>|
|Wireless incoming traffic of {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, rx_bytes]<p>Update: 60s</p>|
|Bandwidth 06|<p>-</p>|`SNMP agent`|ifSpeed.6<p>Update: 600</p>|
|Wireless outgoing traffic on site|<p>-</p>|`Zabbix agent (active)`|unifi.site.state[ap, tx_bytes, sum]<p>Update: 30s</p>|
|Hardware model name|<p>MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.hw.model<p>Update: 3600s</p>|
|{#ALIAS} '$2' state|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, isolated]<p>Update: 60s</p>|
|Radio Frequency|<p>-</p>|`SNMP agent`|ubntRadioFreq<p>Update: 30s</p>|
|Incoming Traffic No-Unicast 05|<p>-</p>|`SNMP agent`|ifInNoUcast.5<p>Update: 600</p>|
|Incoming Traffic 03|<p>-</p>|`SNMP agent`|ifInOctets.3<p>Update: 300</p>|
|Radio Tx Rate|<p>-</p>|`SNMP agent`|ubntWlStatTxRate<p>Update: 30s</p>|
|Outgoing Traffic 07|<p>-</p>|`SNMP agent`|ifOutOctets.7<p>Update: 300</p>|
|Operation Status 01|<p>-</p>|`SNMP agent`|ifOperStatus.1<p>Update: 60</p>|
|Device UPTIME|<p>-</p>|`SNMP agent`|sysUpTimeInstance<p>Update: 300</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 30s</p>|
|CPU utilization|<p>MIB: MY-PROCESS-MIB CPU utilization in %</p>|`SNMP agent`|system.cpu.util[myCPUUtilization5Min.0]<p>Update: 180s</p>|
|Description Interface $1|<p>-</p>|`SNMP agent`|ifDescr.3<p>Update: 600</p>|
|Description Interface $1|<p>-</p>|`SNMP agent`|ifDescr.2<p>Update: 600</p>|
|SNMP availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 1m</p>|
|Description Interface $1|<p>-</p>|`SNMP agent`|ifDescr.7<p>Update: 600</p>|
|Radio Count Stations|<p>-</p>|`SNMP agent`|ubntWlStatStaCount<p>Update: 30s</p>|
|Device location|<p>-</p>|`SNMP agent`|system.location<p>Update: 1h</p>|
|Description Interface $1|<p>-</p>|`SNMP agent`|ifDescr.5<p>Update: 600</p>|
|Bandwidth 01|<p>-</p>|`SNMP agent`|ifSpeed.1<p>Update: 600</p>|
|Description Interface $1|<p>-</p>|`SNMP agent`|ifDescr.6<p>Update: 600</p>|
|AirMax Enabled|<p>-</p>|`SNMP agent`|ubntAirMaxEnabled<p>Update: 30s</p>|
|Device Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 300</p>|
|Wireless outgoing drops on {#ALIAS}|<p>-</p>|`Zabbix agent (active)`|unifi.ap.state[{#ID}, stat.tx_dropped]<p>Update: 60s</p>|
|Incoming Traffic No-Unicast 04|<p>-</p>|`SNMP agent`|ifInNoUcast.4<p>Update: 600</p>|
|Admin status of interface $1|<p>-</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 3600s</p><p>LLD</p>|
|Description of interface $1|<p>-</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 3600s</p><p>LLD</p>|
|Inbound errors on interface $1|<p>-</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Operational status of interface $1|<p>-</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Outbound errors on interface $1|<p>-</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>-</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Speed of interface $1|<p>-</p>|`SNMP agent`|ifSpeed[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|#{#SNMPINDEX}: Memory utilization|<p>-</p>|`Calculated`|vm.memory.pused[memoryUsedPercentage.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|#{#SNMPINDEX}: Total memory|<p>-</p>|`Calculated`|vm.memory.total[memoryTotal.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|#{#SNMPINDEX}: Total memory in units|<p>-</p>|`SNMP agent`|vm.memory.units.total[hrStorageSize.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|#{#SNMPINDEX}: Used memory in units|<p>-</p>|`SNMP agent`|vm.memory.units.used[hrStorageUsed.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|#{#SNMPINDEX}: Memory units|<p>-</p>|`SNMP agent`|vm.memory.units[hrStorageAllocationUnits.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|#{#SNMPINDEX}: Used memory|<p>-</p>|`Calculated`|vm.memory.used[memoryUsed.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|#{#SNMPINDEX}: CPU utilization|<p>-</p>|`SNMP agent`|system.cpu.util[hrProcessorLoad.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|#{#SNMPINDEX}: High CPU utilization|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: avg(/Ubiquiti Unifi AP LR SNMPv1/system.cpu.util[hrProcessorLoad.{#SNMPINDEX}],5m)>{$CPU_UTIL_MAX}</p><p>**Recovery expression**: </p>|average|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/Ubiquiti Unifi AP LR SNMPv1/ifOperStatus[{#SNMPVALUE}],#1)<>last(/Ubiquiti Unifi AP LR SNMPv1/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|#{#SNMPINDEX}: High memory utilization|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: avg(/Ubiquiti Unifi AP LR SNMPv1/vm.memory.pused[memoryUsedPercentage.{#SNMPINDEX}],5m)>{$MEMORY_UTIL_MAX}</p><p>**Recovery expression**: </p>|average|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/Ubiquiti Unifi AP LR SNMPv1/ifOperStatus[{#SNMPVALUE}],#1)<>last(/Ubiquiti Unifi AP LR SNMPv1/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|#{#SNMPINDEX}: High memory utilization (LLD)|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: avg(/Ubiquiti Unifi AP LR SNMPv1/vm.memory.pused[memoryUsedPercentage.{#SNMPINDEX}],5m)>{$MEMORY_UTIL_MAX}</p><p>**Recovery expression**: </p>|average|
|#{#SNMPINDEX}: High CPU utilization (LLD)|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: avg(/Ubiquiti Unifi AP LR SNMPv1/system.cpu.util[hrProcessorLoad.{#SNMPINDEX}],5m)>{$CPU_UTIL_MAX}</p><p>**Recovery expression**: </p>|average|
