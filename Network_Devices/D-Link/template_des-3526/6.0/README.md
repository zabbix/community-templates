# DES-3526

## Overview

Updated the template of Sergey.


[Here is a link to its template and source accordingly.](network_devices/d-link/des-3526)



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Ошибки входящие порта 24|<p>-</p>|`SNMP agent`|ifInErrors.24<p>Update: 30s</p>|
|Скорость входящего трафика на порту 12|<p>-</p>|`SNMP agent`|ifInOctets.12<p>Update: 30s</p>|
|Дуплекс статус порта 20|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.20<p>Update: 30s</p>|
|ifOperStatus.12|<p>-</p>|`SNMP agent`|ifOperStatus.12<p>Update: 30s</p>|
|ifHCInOctets.16|<p>-</p>|`SNMP agent`|ifHCInOctets.16<p>Update: 30s</p>|
|Дуплекс статус порта 9|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.9<p>Update: 30s</p>|
|Скорость входящего трафика на порту 22|<p>-</p>|`SNMP agent`|ifInOctets.22<p>Update: 30s</p>|
|Дуплекс статус порта 12|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.12<p>Update: 30s</p>|
|ifHCOutOctets.24|<p>-</p>|`SNMP agent`|ifHCOutOctets.24<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 10|<p>-</p>|`SNMP agent`|ifOutOctets.10<p>Update: 30s</p>|
|ifInUcastPkts.10|<p>-</p>|`SNMP agent`|ifInUcastPkts.10<p>Update: 30s</p>|
|Текущая скорость на порту 15|<p>-</p>|`SNMP agent`|ifHighSpeed.15<p>Update: 30s</p>|
|PVID порта 11|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.11<p>Update: 30s</p>|
|ifInMulticastPkts.21|<p>-</p>|`SNMP agent`|ifInMulticastPkts.21<p>Update: 30s</p>|
|ifHCOutOctets.11|<p>-</p>|`SNMP agent`|ifHCOutOctets.11<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 20|<p>-</p>|`SNMP agent`|ifOutOctets.20<p>Update: 30s</p>|
|ifOperStatus.1|<p>-</p>|`SNMP agent`|ifOperStatus.1<p>Update: 30s</p>|
|ip адрес|<p>-</p>|`SNMP agent`|rmon.19.11.1.1.5120<p>Update: 30s</p>|
|ifInBroadcastPkts.15|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.15<p>Update: 30s</p>|
|Ping|<p>-</p>|`Simple check`|icmpping[<target>,<packets>,<interval>,<size>,<timeout>]<p>Update: 30s</p>|
|Cостояние порта 9|<p>-</p>|`SNMP agent`|ifAdminStatus.9<p>Update: 6s</p>|
|Дуплекс статус порта 4|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.4<p>Update: 30s</p>|
|ifOperStatus.4|<p>-</p>|`SNMP agent`|ifOperStatus.4<p>Update: 30s</p>|
|Скорость входящего трафика на порту 9|<p>-</p>|`SNMP agent`|ifInOctets.9<p>Update: 30s</p>|
|ifInBroadcastPkts.22|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.22<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 13|<p>-</p>|`SNMP agent`|ifOutOctets.13<p>Update: 30s</p>|
|ifHCOutOctets.13|<p>-</p>|`SNMP agent`|ifHCOutOctets.13<p>Update: 30s</p>|
|Ошибки входящие порта 26|<p>-</p>|`SNMP agent`|ifInErrors.26<p>Update: 30s</p>|
|ifOutUcastPkts.24|<p>-</p>|`SNMP agent`|ifOutUcastPkts.24<p>Update: 30s</p>|
|Текущая скорость на порту 3|<p>-</p>|`SNMP agent`|ifHighSpeed.3<p>Update: 30s</p>|
|ifHCInOctets.19|<p>-</p>|`SNMP agent`|ifHCInOctets.19<p>Update: 30s</p>|
|текущее время|<p>-</p>|`SNMP agent`|enterprises.171.12.10.10.1.0<p>Update: 30s</p>|
|Cостояние порта 19|<p>-</p>|`SNMP agent`|ifAdminStatus.19<p>Update: 6s</p>|
|ifInMulticastPkts.18|<p>-</p>|`SNMP agent`|ifInMulticastPkts.18<p>Update: 30s</p>|
|Текущая скорость на порту 19|<p>-</p>|`SNMP agent`|ifHighSpeed.19<p>Update: 30s</p>|
|ifInBroadcastPkts.24|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.24<p>Update: 30s</p>|
|Текущая скорость на порту 24|<p>-</p>|`SNMP agent`|ifHighSpeed.24<p>Update: 30s</p>|
|ifOutMulticastPkts.21|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.21<p>Update: 30s</p>|
|ifHCInOctets.25|<p>-</p>|`SNMP agent`|ifHCInOctets.25<p>Update: 30s</p>|
|Дуплекс статус порта 8|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.8<p>Update: 30s</p>|
|port description 25|<p>-</p>|`SNMP agent`|ifDescr25<p>Update: 30s</p>|
|Дуплекс статус порта 14|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.14<p>Update: 30s</p>|
|ifOutUcastPkts.17|<p>-</p>|`SNMP agent`|ifOutUcastPkts.17<p>Update: 30s</p>|
|Cостояние порта 10|<p>-</p>|`SNMP agent`|ifAdminStatus.10<p>Update: 6s</p>|
|Скорость исходящего трафика на порту 14|<p>-</p>|`SNMP agent`|ifOutOctets.14<p>Update: 30s</p>|
|ifInUcastPkts.25|<p>-</p>|`SNMP agent`|ifInUcastPkts.25<p>Update: 30s</p>|
|ifOperStatus.21|<p>-</p>|`SNMP agent`|ifOperStatus.21<p>Update: 30s</p>|
|ifOutUcastPkts.10|<p>-</p>|`SNMP agent`|ifOutUcastPkts.10<p>Update: 30s</p>|
|ifInMulticastPkts.9|<p>-</p>|`SNMP agent`|ifInMulticastPkts.9<p>Update: 30s</p>|
|port description 12|<p>-</p>|`SNMP agent`|ifDescr12<p>Update: 30s</p>|
|ifOperStatus.2|<p>-</p>|`SNMP agent`|ifOperStatus.2<p>Update: 30s</p>|
|ifInUcastPkts.18|<p>-</p>|`SNMP agent`|ifInUcastPkts.18<p>Update: 30s</p>|
|port description 24|<p>-</p>|`SNMP agent`|ifDescr24<p>Update: 30s</p>|
|ifOutMulticastPkts.19|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.19<p>Update: 30s</p>|
|PVID порта 15|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.15<p>Update: 30s</p>|
|ifInMulticastPkts.1|<p>-</p>|`SNMP agent`|ifInMulticastPkts.1<p>Update: 30s</p>|
|ifHCOutOctets.25|<p>-</p>|`SNMP agent`|ifHCOutOctets.25<p>Update: 30s</p>|
|CPU Utilization|<p>-</p>|`SNMP agent`|enterprises.171.12.1.1.6.2.0<p>Update: 60s</p>|
|ifOutMulticastPkts.7|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.7<p>Update: 30s</p>|
|Cостояние порта 14|<p>-</p>|`SNMP agent`|ifAdminStatus.14<p>Update: 6s</p>|
|ifHCOutOctets.26|<p>-</p>|`SNMP agent`|ifHCOutOctets.26<p>Update: 30s</p>|
|ifOutUcastPkts.13|<p>-</p>|`SNMP agent`|ifOutUcastPkts.13<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 23|<p>-</p>|`SNMP agent`|ifOutOctets.23<p>Update: 30s</p>|
|температура|<p>-</p>|`SNMP agent`|enterprises.171.12.11.1.8.1.2.1<p>Update: 30s</p>|
|Cостояние порта 11|<p>-</p>|`SNMP agent`|ifAdminStatus.11<p>Update: 6s</p>|
|Ошибки исходящие порта 22|<p>-</p>|`SNMP agent`|ifOutErrors.22<p>Update: 30s</p>|
|Текущая скорость на порту 9|<p>-</p>|`SNMP agent`|ifHighSpeed.9<p>Update: 30s</p>|
|Ошибки исходящие порта 9|<p>-</p>|`SNMP agent`|ifOutErrors.9<p>Update: 30s</p>|
|ifOutMulticastPkts.12|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.12<p>Update: 30s</p>|
|PVID порта 25|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.25<p>Update: 30s</p>|
|ifOutUcastPkts.2|<p>-</p>|`SNMP agent`|ifOutUcastPkts.2<p>Update: 30s</p>|
|port description 17|<p>-</p>|`SNMP agent`|ifDescr17<p>Update: 30s</p>|
|Скорость входящего трафика на порту 17|<p>-</p>|`SNMP agent`|ifInOctets.17<p>Update: 30s</p>|
|время ответа ICMP|<p>-</p>|`Simple check`|icmppingsec[<target>,<packets>,<interval>,<size>,<timeout>,<mode>]<p>Update: 30s</p>|
|Ошибки входящие порта 14|<p>-</p>|`SNMP agent`|ifInErrors.14<p>Update: 30s</p>|
|Ошибки входящие порта 22|<p>-</p>|`SNMP agent`|ifInErrors.22<p>Update: 30s</p>|
|ifOutUcastPkts.15|<p>-</p>|`SNMP agent`|ifOutUcastPkts.15<p>Update: 30s</p>|
|Ошибки входящие порта 9|<p>-</p>|`SNMP agent`|ifInErrors.9<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 11|<p>-</p>|`SNMP agent`|ifOutOctets.11<p>Update: 30s</p>|
|Cостояние порта 16|<p>-</p>|`SNMP agent`|ifAdminStatus.16<p>Update: 6s</p>|
|Скорость входящего трафика на порту 10|<p>-</p>|`SNMP agent`|ifInOctets.10<p>Update: 30s</p>|
|ifInUcastPkts.17|<p>-</p>|`SNMP agent`|ifInUcastPkts.17<p>Update: 30s</p>|
|Дуплекс статус порта 13|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.13<p>Update: 30s</p>|
|ifHCOutOctets.20|<p>-</p>|`SNMP agent`|ifHCOutOctets.20<p>Update: 30s</p>|
|port description 21|<p>-</p>|`SNMP agent`|ifDescr21<p>Update: 30s</p>|
|ifInBroadcastPkts.17|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.17<p>Update: 30s</p>|
|Скорость входящего трафика на порту 24|<p>-</p>|`SNMP agent`|ifInOctets.24<p>Update: 30s</p>|
|ifInBroadcastPkts.2|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.2<p>Update: 30s</p>|
|port description 26|<p>-</p>|`SNMP agent`|ifDescr26<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 16|<p>-</p>|`SNMP agent`|ifOutOctets.16<p>Update: 30s</p>|
|ifHCInOctets.10|<p>-</p>|`SNMP agent`|ifHCInOctets.10<p>Update: 30s</p>|
|Cостояние порта 15|<p>-</p>|`SNMP agent`|ifAdminStatus.15<p>Update: 6s</p>|
|PVID порта 23|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.23<p>Update: 30s</p>|
|ifHCOutOctets.5|<p>-</p>|`SNMP agent`|ifHCOutOctets.5<p>Update: 30s</p>|
|Ошибки входящие порта 13|<p>-</p>|`SNMP agent`|ifInErrors.13<p>Update: 30s</p>|
|ifOutUcastPkts.3|<p>-</p>|`SNMP agent`|ifOutUcastPkts.3<p>Update: 30s</p>|
|PVID порта 22|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.22<p>Update: 30s</p>|
|ifInMulticastPkts.26|<p>-</p>|`SNMP agent`|ifInMulticastPkts.26<p>Update: 30s</p>|
|Cостояние порта 4|<p>-</p>|`SNMP agent`|ifAdminStatus.4<p>Update: 6s</p>|
|ifOperStatus.3|<p>-</p>|`SNMP agent`|ifOperStatus.3<p>Update: 30s</p>|
|Дуплекс статус порта 19|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.19<p>Update: 30s</p>|
|ifHCOutOctets.1|<p>-</p>|`SNMP agent`|ifHCOutOctets.1<p>Update: 30s</p>|
|ifOperStatus.17|<p>-</p>|`SNMP agent`|ifOperStatus.17<p>Update: 30s</p>|
|ifOutUcastPkts.7|<p>-</p>|`SNMP agent`|ifOutUcastPkts.7<p>Update: 30s</p>|
|ifHCInOctets.23|<p>-</p>|`SNMP agent`|ifHCInOctets.23<p>Update: 30s</p>|
|port description 14|<p>-</p>|`SNMP agent`|ifDescr14<p>Update: 30s</p>|
|ifOutMulticastPkts.15|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.15<p>Update: 30s</p>|
|Дуплекс статус порта 3|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.3<p>Update: 30s</p>|
|PVID порта 14|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.14<p>Update: 30s</p>|
|PVID порта 1|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.1<p>Update: 30s</p>|
|Скорость входящего трафика на порту 11|<p>-</p>|`SNMP agent`|ifInOctets.11<p>Update: 30s</p>|
|Скорость входящего трафика на порту 13|<p>-</p>|`SNMP agent`|ifInOctets.13<p>Update: 30s</p>|
|Ошибки входящие порта 7|<p>-</p>|`SNMP agent`|ifInErrors.7<p>Update: 30s</p>|
|Текущая скорость на порту 13|<p>-</p>|`SNMP agent`|ifHighSpeed.13<p>Update: 30s</p>|
|Дуплекс статус порта 26-2|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.26-2<p>Update: 30s</p>|
|Текущая скорость на порту 10|<p>-</p>|`SNMP agent`|ifHighSpeed.10<p>Update: 30s</p>|
|Ошибки входящие порта 5|<p>-</p>|`SNMP agent`|ifInErrors.5<p>Update: 30s</p>|
|ifInMulticastPkts.22|<p>-</p>|`SNMP agent`|ifInMulticastPkts.22<p>Update: 30s</p>|
|ifOutUcastPkts.26|<p>-</p>|`SNMP agent`|ifOutUcastPkts.26<p>Update: 30s</p>|
|Ошибки входящие порта 20|<p>-</p>|`SNMP agent`|ifInErrors.20<p>Update: 30s</p>|
|Аппаратная версия|<p>-</p>|`SNMP agent`|rmon.19.3.0<p>Update: 30s</p>|
|Дуплекс статус порта 15|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.15<p>Update: 30s</p>|
|ifInBroadcastPkts.8|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.8<p>Update: 30s</p>|
|PVID порта 8|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.8<p>Update: 30s</p>|
|ifOutMulticastPkts.26|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.26<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 9|<p>-</p>|`SNMP agent`|ifOutOctets.9<p>Update: 30s</p>|
|ifInBroadcastPkts.13|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.13<p>Update: 30s</p>|
|ifHCInOctets.3|<p>-</p>|`SNMP agent`|ifHCInOctets.3<p>Update: 30s</p>|
|UpTime|<p>-</p>|`SNMP agent`|DISMAN-EVENT-MIB_sysUpTimeInstance<p>Update: 30s</p>|
|ifInMulticastPkts.8|<p>-</p>|`SNMP agent`|ifInMulticastPkts.8<p>Update: 30s</p>|
|ifHCInOctets.22|<p>-</p>|`SNMP agent`|ifHCInOctets.22<p>Update: 30s</p>|
|Ошибки исходящие порта 8|<p>-</p>|`SNMP agent`|ifOutErrors.8<p>Update: 30s</p>|
|ifInBroadcastPkts.3|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.3<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 19|<p>-</p>|`SNMP agent`|ifOutOctets.19<p>Update: 30s</p>|
|ifInMulticastPkts.14|<p>-</p>|`SNMP agent`|ifInMulticastPkts.14<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 2|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 30s</p>|
|port description 2|<p>-</p>|`SNMP agent`|ifDescr2<p>Update: 30s</p>|
|ifOperStatus.7|<p>-</p>|`SNMP agent`|ifOperStatus.7<p>Update: 30s</p>|
|ifInBroadcastPkts.4|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.4<p>Update: 30s</p>|
|Текущая скорость на порту 26|<p>-</p>|`SNMP agent`|ifHighSpeed.26<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 21|<p>-</p>|`SNMP agent`|ifOutOctets.21<p>Update: 30s</p>|
|Cостояние порта 5|<p>-</p>|`SNMP agent`|ifAdminStatus.5<p>Update: 6s</p>|
|Скорость входящего трафика на порту 26|<p>-</p>|`SNMP agent`|ifInOctets.26<p>Update: 30s</p>|
|ifOutUcastPkts.1|<p>-</p>|`SNMP agent`|ifOutUcastPkts.1<p>Update: 30s</p>|
|ifHCOutOctets.12|<p>-</p>|`SNMP agent`|ifHCOutOctets.12<p>Update: 30s</p>|
|Ошибки входящие порта 21|<p>-</p>|`SNMP agent`|ifInErrors.21<p>Update: 30s</p>|
|Ошибки исходящие порта 13|<p>-</p>|`SNMP agent`|ifOutErrors.13<p>Update: 30s</p>|
|ifHCInOctets.24|<p>-</p>|`SNMP agent`|ifHCInOctets.24<p>Update: 30s</p>|
|ifHCInOctets.15|<p>-</p>|`SNMP agent`|ifHCInOctets.15<p>Update: 30s</p>|
|Дуплекс статус порта 7|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.7<p>Update: 30s</p>|
|port description 1|<p>-</p>|`SNMP agent`|ifDescr1<p>Update: 30s</p>|
|ifOperStatus.10|<p>-</p>|`SNMP agent`|ifOperStatus.10<p>Update: 30s</p>|
|port description 10|<p>-</p>|`SNMP agent`|ifDescr10<p>Update: 30s</p>|
|Скорость входящего трафика на порту 25|<p>-</p>|`SNMP agent`|ifInOctets.25<p>Update: 30s</p>|
|PVID порта 13|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.13<p>Update: 30s</p>|
|Текущая скорость на порту 25|<p>-</p>|`SNMP agent`|ifHighSpeed.25<p>Update: 30s</p>|
|PVID порта 3|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.3<p>Update: 30s</p>|
|Скорость входящего трафика на порту 5|<p>-</p>|`SNMP agent`|ifInOctets.5<p>Update: 30s</p>|
|Ошибки исходящие порта 16|<p>-</p>|`SNMP agent`|ifOutErrors.16<p>Update: 30s</p>|
|ifInBroadcastPkts.7|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.7<p>Update: 30s</p>|
|ifOutUcastPkts.21|<p>-</p>|`SNMP agent`|ifOutUcastPkts.21<p>Update: 30s</p>|
|ifInBroadcastPkts.12|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.12<p>Update: 30s</p>|
|PVID порта 9|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.9<p>Update: 30s</p>|
|ifInBroadcastPkts.19|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.19<p>Update: 30s</p>|
|ifOperStatus.5|<p>-</p>|`SNMP agent`|ifOperStatus.5<p>Update: 30s</p>|
|ifOutUcastPkts.19|<p>-</p>|`SNMP agent`|ifOutUcastPkts.19<p>Update: 30s</p>|
|ifInBroadcastPkts.20|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.20<p>Update: 30s</p>|
|Cостояние порта 25|<p>-</p>|`SNMP agent`|ifAdminStatus.25<p>Update: 6s</p>|
|Текущая скорость на порту 6|<p>-</p>|`SNMP agent`|ifHighSpeed.6<p>Update: 30s</p>|
|Cостояние порта 2|<p>-</p>|`SNMP agent`|ifAdminStatus.2<p>Update: 6s</p>|
|Ошибки исходящие порта 6|<p>-</p>|`SNMP agent`|ifOutErrors.6<p>Update: 30s</p>|
|Ошибки исходящие порта 7|<p>-</p>|`SNMP agent`|ifOutErrors.7<p>Update: 30s</p>|
|Ошибки исходящие порта 17|<p>-</p>|`SNMP agent`|ifOutErrors.17<p>Update: 30s</p>|
|Скорость входящего трафика на порту 18|<p>-</p>|`SNMP agent`|ifInOctets.18<p>Update: 30s</p>|
|Ошибки исходящие порта 19|<p>-</p>|`SNMP agent`|ifOutErrors.19<p>Update: 30s</p>|
|Текущая скорость на порту 7|<p>-</p>|`SNMP agent`|ifHighSpeed.7<p>Update: 30s</p>|
|ifHCInOctets.1|<p>-</p>|`SNMP agent`|ifHCInOctets.1<p>Update: 30s</p>|
|Текущая скорость на порту 23|<p>-</p>|`SNMP agent`|ifHighSpeed.23<p>Update: 30s</p>|
|ifHCOutOctets.18|<p>-</p>|`SNMP agent`|ifHCOutOctets.18<p>Update: 30s</p>|
|Скорость входящего трафика на порту 1|<p>-</p>|`SNMP agent`|ifInOctets.1<p>Update: 30s</p>|
|Ошибки входящие порта 18|<p>-</p>|`SNMP agent`|ifInErrors.18<p>Update: 30s</p>|
|port description 11|<p>-</p>|`SNMP agent`|ifDescr11<p>Update: 30s</p>|
|port description 22|<p>-</p>|`SNMP agent`|ifDescr22<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 1|<p>-</p>|`SNMP agent`|ifOutOctets.1<p>Update: 30s</p>|
|ifInBroadcastPkts.9|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.9<p>Update: 30s</p>|
|ifHCInOctets.13|<p>-</p>|`SNMP agent`|ifHCInOctets.13<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 7|<p>-</p>|`SNMP agent`|ifOutOctets.7<p>Update: 30s</p>|
|Cостояние порта 24|<p>-</p>|`SNMP agent`|ifAdminStatus.24<p>Update: 6s</p>|
|ifOutUcastPkts.25|<p>-</p>|`SNMP agent`|ifOutUcastPkts.25<p>Update: 30s</p>|
|ifInBroadcastPkts.11|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.11<p>Update: 30s</p>|
|ifInMulticastPkts.5|<p>-</p>|`SNMP agent`|ifInMulticastPkts.5<p>Update: 30s</p>|
|Ошибки входящие порта 12|<p>-</p>|`SNMP agent`|ifInErrors.12<p>Update: 30s</p>|
|Cостояние порта 26|<p>-</p>|`SNMP agent`|ifAdminStatus.26<p>Update: 6s</p>|
|ifInUcastPkts.19|<p>-</p>|`SNMP agent`|ifInUcastPkts.19<p>Update: 30s</p>|
|Ошибки исходящие порта 23|<p>-</p>|`SNMP agent`|ifOutErrors.23<p>Update: 30s</p>|
|ifInBroadcastPkts.10|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.10<p>Update: 30s</p>|
|ifInBroadcastPkts.1|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.1<p>Update: 30s</p>|
|Дуплекс статус порта 25|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.25<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 12|<p>-</p>|`SNMP agent`|ifOutOctets.12<p>Update: 30s</p>|
|ifOperStatus.18|<p>-</p>|`SNMP agent`|ifOperStatus.18<p>Update: 30s</p>|
|Дуплекс статус порта 2|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.2<p>Update: 30s</p>|
|Текущая скорость на порту 4|<p>-</p>|`SNMP agent`|ifHighSpeed.4<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 6|<p>-</p>|`SNMP agent`|ifOutOctets.6<p>Update: 30s</p>|
|Ошибки исходящие порта 26|<p>-</p>|`SNMP agent`|ifOutErrors.26<p>Update: 30s</p>|
|ifInMulticastPkts.4|<p>-</p>|`SNMP agent`|ifInMulticastPkts.4<p>Update: 30s</p>|
|Cостояние порта 18|<p>-</p>|`SNMP agent`|ifAdminStatus.18<p>Update: 6s</p>|
|Скорость входящего трафика на порту 20|<p>-</p>|`SNMP agent`|ifInOctets.20<p>Update: 30s</p>|
|Ошибки исходящие порта 4|<p>-</p>|`SNMP agent`|ifOutErrors.4<p>Update: 30s</p>|
|ifHCOutOctets.15|<p>-</p>|`SNMP agent`|ifHCOutOctets.15<p>Update: 30s</p>|
|ifHCOutOctets.14|<p>-</p>|`SNMP agent`|ifHCOutOctets.14<p>Update: 30s</p>|
|PVID порта 21|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.21<p>Update: 30s</p>|
|ifInUcastPkts.8|<p>-</p>|`SNMP agent`|ifInUcastPkts.8<p>Update: 30s</p>|
|port description 7|<p>-</p>|`SNMP agent`|ifDescr7<p>Update: 30s</p>|
|ifOutUcastPkts.4|<p>-</p>|`SNMP agent`|ifOutUcastPkts.4<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 5|<p>-</p>|`SNMP agent`|ifOutOctets.5<p>Update: 30s</p>|
|Ошибки входящие порта 8|<p>-</p>|`SNMP agent`|ifInErrors.8<p>Update: 30s</p>|
|ifHCOutOctets.6|<p>-</p>|`SNMP agent`|ifHCOutOctets.6<p>Update: 30s</p>|
|ifHCInOctets.18|<p>-</p>|`SNMP agent`|ifHCInOctets.18<p>Update: 30s</p>|
|ifInMulticastPkts.3|<p>-</p>|`SNMP agent`|ifInMulticastPkts.3<p>Update: 30s</p>|
|sysDescr|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 30s</p>|
|Ошибки исходящие порта 24|<p>-</p>|`SNMP agent`|ifOutErrors.24<p>Update: 30s</p>|
|ifInMulticastPkts.7|<p>-</p>|`SNMP agent`|ifInMulticastPkts.7<p>Update: 30s</p>|
|ifOutMulticastPkts.16|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.16<p>Update: 30s</p>|
|ifOperStatus.22|<p>-</p>|`SNMP agent`|ifOperStatus.22<p>Update: 30s</p>|
|ifHCOutOctets.2|<p>-</p>|`SNMP agent`|ifHCOutOctets.2<p>Update: 30s</p>|
|Дуплекс статус порта 6|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.6<p>Update: 30s</p>|
|Cостояние порта 3|<p>-</p>|`SNMP agent`|ifAdminStatus.3<p>Update: 6s</p>|
|ifInMulticastPkts.12|<p>-</p>|`SNMP agent`|ifInMulticastPkts.12<p>Update: 30s</p>|
|ifInUcastPkts.12|<p>-</p>|`SNMP agent`|ifInUcastPkts.12<p>Update: 30s</p>|
|Ошибки исходящие порта 20|<p>-</p>|`SNMP agent`|ifOutErrors.20<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 8|<p>-</p>|`SNMP agent`|ifOutOctets.8<p>Update: 30s</p>|
|Дуплекс статус порта 25-2|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.25-2<p>Update: 30s</p>|
|ifOperStatus.16|<p>-</p>|`SNMP agent`|ifOperStatus.16<p>Update: 30s</p>|
|Ошибки входящие порта 6|<p>-</p>|`SNMP agent`|ifInErrors.6<p>Update: 30s</p>|
|port description 4|<p>-</p>|`SNMP agent`|ifDescr4<p>Update: 30s</p>|
|Cостояние порта 1|<p>-</p>|`SNMP agent`|ifAdminStatus.1<p>Update: 6s</p>|
|Скорость исходящего трафика на порту 24|<p>-</p>|`SNMP agent`|ifOutOctets.24<p>Update: 30s</p>|
|PVID порта 26|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.26<p>Update: 30s</p>|
|port description 8|<p>-</p>|`SNMP agent`|ifDescr8<p>Update: 30s</p>|
|port description 5|<p>-</p>|`SNMP agent`|ifDescr5<p>Update: 30s</p>|
|ifOperStatus.11|<p>-</p>|`SNMP agent`|ifOperStatus.11<p>Update: 30s</p>|
|ifHCOutOctets.3|<p>-</p>|`SNMP agent`|ifHCOutOctets.3<p>Update: 30s</p>|
|Cостояние порта 6|<p>-</p>|`SNMP agent`|ifAdminStatus.6<p>Update: 6s</p>|
|ifHCOutOctets.17|<p>-</p>|`SNMP agent`|ifHCOutOctets.17<p>Update: 30s</p>|
|Ошибки исходящие порта 14|<p>-</p>|`SNMP agent`|ifOutErrors.14<p>Update: 30s</p>|
|Дуплекс статус порта 18|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.18<p>Update: 30s</p>|
|ifOutUcastPkts.9|<p>-</p>|`SNMP agent`|ifOutUcastPkts.9<p>Update: 30s</p>|
|Текущая скорость на порту 1|<p>-</p>|`SNMP agent`|ifHighSpeed.1<p>Update: 30s</p>|
|Скорость входящего трафика на порту 14|<p>-</p>|`SNMP agent`|ifInOctets.14<p>Update: 30s</p>|
|Дуплекс статус порта 5|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.5<p>Update: 30s</p>|
|ifHCInOctets.26|<p>-</p>|`SNMP agent`|ifHCInOctets.26<p>Update: 30s</p>|
|Скорость входящего трафика на порту 8|<p>-</p>|`SNMP agent`|ifInOctets.8<p>Update: 30s</p>|
|Текущая скорость на порту 2|<p>-</p>|`SNMP agent`|ifHighSpeed.2<p>Update: 30s</p>|
|Текущая скорость на порту 11|<p>-</p>|`SNMP agent`|ifHighSpeed.11<p>Update: 30s</p>|
|Ошибки исходящие порта 5|<p>-</p>|`SNMP agent`|ifOutErrors.5<p>Update: 30s</p>|
|ifOutMulticastPkts.8|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.8<p>Update: 30s</p>|
|Ошибки исходящие порта 3|<p>-</p>|`SNMP agent`|ifOutErrors.3<p>Update: 30s</p>|
|Ошибки входящие порта 25|<p>-</p>|`SNMP agent`|ifInErrors.25<p>Update: 30s</p>|
|ifInUcastPkts.15|<p>-</p>|`SNMP agent`|ifInUcastPkts.15<p>Update: 30s</p>|
|ifHCInOctets.21|<p>-</p>|`SNMP agent`|ifHCInOctets.21<p>Update: 30s</p>|
|Ошибки входящие порта 4|<p>-</p>|`SNMP agent`|ifInErrors.4<p>Update: 30s</p>|
|Дуплекс статус порта 17|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.17<p>Update: 30s</p>|
|PVID порта 18|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.18<p>Update: 30s</p>|
|ifOperStatus.20|<p>-</p>|`SNMP agent`|ifOperStatus.20<p>Update: 30s</p>|
|Cостояние порта 12|<p>-</p>|`SNMP agent`|ifAdminStatus.12<p>Update: 6s</p>|
|PVID порта 17|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.17<p>Update: 30s</p>|
|Ошибки входящие порта 10|<p>-</p>|`SNMP agent`|ifInErrors.10<p>Update: 30s</p>|
|ifOutMulticastPkts.18|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.18<p>Update: 30s</p>|
|Дуплекс статус порта 16|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.16<p>Update: 30s</p>|
|ifHCOutOctets.19|<p>-</p>|`SNMP agent`|ifHCOutOctets.19<p>Update: 30s</p>|
|Ошибки входящие порта 1|<p>-</p>|`SNMP agent`|ifInErrors.1<p>Update: 30s</p>|
|port description 20|<p>-</p>|`SNMP agent`|ifDescr20<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 26|<p>-</p>|`SNMP agent`|ifOutOctets.26<p>Update: 30s</p>|
|Ошибки входящие порта 15|<p>-</p>|`SNMP agent`|ifInErrors.15<p>Update: 30s</p>|
|ifInBroadcastPkts.21|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.21<p>Update: 30s</p>|
|ifOperStatus.24|<p>-</p>|`SNMP agent`|ifOperStatus.24<p>Update: 30s</p>|
|PVID порта 2|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.2<p>Update: 30s</p>|
|port description 23|<p>-</p>|`SNMP agent`|ifDescr23<p>Update: 30s</p>|
|ifInBroadcastPkts.6|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.6<p>Update: 30s</p>|
|ifOutMulticastPkts.22|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.22<p>Update: 30s</p>|
|Скорость входящего трафика на порту 2|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 30s</p>|
|Дуплекс статус порта 23|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.23<p>Update: 30s</p>|
|ifOperStatus.15|<p>-</p>|`SNMP agent`|ifOperStatus.15<p>Update: 30s</p>|
|PVID порта 16|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.16<p>Update: 30s</p>|
|Ошибки исходящие порта 2|<p>-</p>|`SNMP agent`|ifOutErrors.2<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 22|<p>-</p>|`SNMP agent`|ifOutOctets.22<p>Update: 30s</p>|
|Ошибки исходящие порта 21|<p>-</p>|`SNMP agent`|ifOutErrors.21<p>Update: 30s</p>|
|Текущая скорость на порту 22|<p>-</p>|`SNMP agent`|ifHighSpeed.22<p>Update: 30s</p>|
|ifOutMulticastPkts.3|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.3<p>Update: 30s</p>|
|ifInUcastPkts.6|<p>-</p>|`SNMP agent`|ifInUcastPkts.6<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 18|<p>-</p>|`SNMP agent`|ifOutOctets.18<p>Update: 30s</p>|
|ifInMulticastPkts.23|<p>-</p>|`SNMP agent`|ifInMulticastPkts.23<p>Update: 30s</p>|
|ifInBroadcastPkts.26|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.26<p>Update: 30s</p>|
|ifInMulticastPkts.16|<p>-</p>|`SNMP agent`|ifInMulticastPkts.16<p>Update: 30s</p>|
|ifInMulticastPkts.19|<p>-</p>|`SNMP agent`|ifInMulticastPkts.19<p>Update: 30s</p>|
|ifOutMulticastPkts.2|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.2<p>Update: 30s</p>|
|port description 19|<p>-</p>|`SNMP agent`|ifDescr19<p>Update: 30s</p>|
|ifOutMulticastPkts.25|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.25<p>Update: 30s</p>|
|ifOutUcastPkts.23|<p>-</p>|`SNMP agent`|ifOutUcastPkts.23<p>Update: 30s</p>|
|Версия прошивки|<p>-</p>|`SNMP agent`|rmon.19.2.0<p>Update: 30s</p>|
|Скорость входящего трафика на порту 21|<p>-</p>|`SNMP agent`|ifInOctets.21<p>Update: 30s</p>|
|ifInBroadcastPkts.16|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.16<p>Update: 30s</p>|
|ifHCInOctets.8|<p>-</p>|`SNMP agent`|ifHCInOctets.8<p>Update: 30s</p>|
|Ошибки входящие порта 17|<p>-</p>|`SNMP agent`|ifInErrors.17<p>Update: 30s</p>|
|ifOperStatus.23|<p>-</p>|`SNMP agent`|ifOperStatus.23<p>Update: 30s</p>|
|Cостояние порта 17|<p>-</p>|`SNMP agent`|ifAdminStatus.17<p>Update: 6s</p>|
|Ошибки исходящие порта 10|<p>-</p>|`SNMP agent`|ifOutErrors.10<p>Update: 30s</p>|
|ifInMulticastPkts.11|<p>-</p>|`SNMP agent`|ifInMulticastPkts.11<p>Update: 30s</p>|
|Ошибки исходящие порта 25|<p>-</p>|`SNMP agent`|ifOutErrors.25<p>Update: 30s</p>|
|Скорость входящего трафика на порту 4|<p>-</p>|`SNMP agent`|ifInOctets.4<p>Update: 30s</p>|
|Скорость входящего трафика на порту 7|<p>-</p>|`SNMP agent`|ifInOctets.7<p>Update: 30s</p>|
|ifInUcastPkts.26|<p>-</p>|`SNMP agent`|ifInUcastPkts.26<p>Update: 30s</p>|
|ifInUcastPkts.21|<p>-</p>|`SNMP agent`|ifInUcastPkts.21<p>Update: 30s</p>|
|PVID порта 5|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.5<p>Update: 30s</p>|
|ifOutUcastPkts.20|<p>-</p>|`SNMP agent`|ifOutUcastPkts.20<p>Update: 30s</p>|
|ifOutMulticastPkts.24|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.24<p>Update: 30s</p>|
|ifOutUcastPkts.8|<p>-</p>|`SNMP agent`|ifOutUcastPkts.8<p>Update: 30s</p>|
|PVID порта 20|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.20<p>Update: 30s</p>|
|ifInUcastPkts.4|<p>-</p>|`SNMP agent`|ifInUcastPkts.4<p>Update: 30s</p>|
|ifHCInOctets.7|<p>-</p>|`SNMP agent`|ifHCInOctets.7<p>Update: 30s</p>|
|ifInUcastPkts.2|<p>-</p>|`SNMP agent`|ifInUcastPkts.2<p>Update: 30s</p>|
|ifInMulticastPkts.17|<p>-</p>|`SNMP agent`|ifInMulticastPkts.17<p>Update: 30s</p>|
|ifInBroadcastPkts.18|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.18<p>Update: 30s</p>|
|PVID порта 19|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.19<p>Update: 30s</p>|
|ifOutUcastPkts.16|<p>-</p>|`SNMP agent`|ifOutUcastPkts.16<p>Update: 30s</p>|
|Дуплекс статус порта 24|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.24<p>Update: 30s</p>|
|Текущая скорость на порту 21|<p>-</p>|`SNMP agent`|ifHighSpeed.21<p>Update: 30s</p>|
|ifHCInOctets.20|<p>-</p>|`SNMP agent`|ifHCInOctets.20<p>Update: 30s</p>|
|PVID порта 12|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.12<p>Update: 30s</p>|
|ifHCInOctets.11|<p>-</p>|`SNMP agent`|ifHCInOctets.11<p>Update: 30s</p>|
|Скорость входящего трафика на порту 23|<p>-</p>|`SNMP agent`|ifInOctets.23<p>Update: 30s</p>|
|ifOutMulticastPkts.11|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.11<p>Update: 30s</p>|
|ifInBroadcastPkts.5|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.5<p>Update: 30s</p>|
|port description 9|<p>-</p>|`SNMP agent`|ifDescr9<p>Update: 30s</p>|
|Скорость входящего трафика на порту 16|<p>-</p>|`SNMP agent`|ifInOctets.16<p>Update: 30s</p>|
|Текущая скорость на порту 18|<p>-</p>|`SNMP agent`|ifHighSpeed.18<p>Update: 30s</p>|
|Дуплекс статус порта 22|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.22<p>Update: 30s</p>|
|MAC|<p>-</p>|`SNMP agent`|mib-2.17.1.1.0<p>Update: 30s</p>|
|Дуплекс статус порта 21|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.21<p>Update: 30s</p>|
|ifHCInOctets.9|<p>-</p>|`SNMP agent`|ifHCInOctets.9<p>Update: 30s</p>|
|ifOutUcastPkts.22|<p>-</p>|`SNMP agent`|ifOutUcastPkts.22<p>Update: 30s</p>|
|Ошибки исходящие порта 1|<p>-</p>|`SNMP agent`|ifOutErrors.1<p>Update: 30s</p>|
|ifInUcastPkts.22|<p>-</p>|`SNMP agent`|ifInUcastPkts.22<p>Update: 30s</p>|
|Ошибки исходящие порта 18|<p>-</p>|`SNMP agent`|ifOutErrors.18<p>Update: 30s</p>|
|Текущая скорость на порту 17|<p>-</p>|`SNMP agent`|ifHighSpeed.17<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 15|<p>-</p>|`SNMP agent`|ifOutOctets.15<p>Update: 30s</p>|
|Дуплекс статус порта 11|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.11<p>Update: 30s</p>|
|Скорость входящего трафика на порту 6|<p>-</p>|`SNMP agent`|ifInOctets.6<p>Update: 30s</p>|
|ifHCOutOctets.8|<p>-</p>|`SNMP agent`|ifHCOutOctets.8<p>Update: 30s</p>|
|ifInMulticastPkts.6|<p>-</p>|`SNMP agent`|ifInMulticastPkts.6<p>Update: 30s</p>|
|Cостояние порта 13|<p>-</p>|`SNMP agent`|ifAdminStatus.13<p>Update: 6s</p>|
|ifInUcastPkts.20|<p>-</p>|`SNMP agent`|ifInUcastPkts.20<p>Update: 30s</p>|
|ifHCInOctets.12|<p>-</p>|`SNMP agent`|ifHCInOctets.12<p>Update: 30s</p>|
|ifOperStatus.8|<p>-</p>|`SNMP agent`|ifOperStatus.8<p>Update: 30s</p>|
|ifInMulticastPkts.25|<p>-</p>|`SNMP agent`|ifInMulticastPkts.25<p>Update: 30s</p>|
|PVID порта 4|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.4<p>Update: 30s</p>|
|ifInMulticastPkts.20|<p>-</p>|`SNMP agent`|ifInMulticastPkts.20<p>Update: 30s</p>|
|Cостояние порта 8|<p>-</p>|`SNMP agent`|ifAdminStatus.8<p>Update: 6s</p>|
|ifHCOutOctets.7|<p>-</p>|`SNMP agent`|ifHCOutOctets.7<p>Update: 30s</p>|
|ifOperStatus.6|<p>-</p>|`SNMP agent`|ifOperStatus.6<p>Update: 30s</p>|
|ifInBroadcastPkts.14|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.14<p>Update: 30s</p>|
|ifOperStatus.25|<p>-</p>|`SNMP agent`|ifOperStatus.25<p>Update: 30s</p>|
|port description 3|<p>-</p>|`SNMP agent`|ifDescr3<p>Update: 30s</p>|
|ifInBroadcastPkts.25|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.25<p>Update: 30s</p>|
|ifInBroadcastPkts.23|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.23<p>Update: 30s</p>|
|ifInUcastPkts.5|<p>-</p>|`SNMP agent`|ifInUcastPkts.5<p>Update: 30s</p>|
|ifOutUcastPkts.12|<p>-</p>|`SNMP agent`|ifOutUcastPkts.12<p>Update: 30s</p>|
|ifOutMulticastPkts.5|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.5<p>Update: 30s</p>|
|ifOutMulticastPkts.10|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.10<p>Update: 30s</p>|
|ifInUcastPkts.23|<p>-</p>|`SNMP agent`|ifInUcastPkts.23<p>Update: 30s</p>|
|ifOperStatus.14|<p>-</p>|`SNMP agent`|ifOperStatus.14<p>Update: 30s</p>|
|ifOutMulticastPkts.14|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.14<p>Update: 30s</p>|
|Ошибки входящие порта 3|<p>-</p>|`SNMP agent`|ifInErrors.3<p>Update: 30s</p>|
|Cостояние порта 7|<p>-</p>|`SNMP agent`|ifAdminStatus.7<p>Update: 6s</p>|
|ifInUcastPkts.3|<p>-</p>|`SNMP agent`|ifInUcastPkts.3<p>Update: 30s</p>|
|ifHCOutOctets.21|<p>-</p>|`SNMP agent`|ifHCOutOctets.21<p>Update: 30s</p>|
|ifOutMulticastPkts.6|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.6<p>Update: 30s</p>|
|PVID порта 10|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.10<p>Update: 30s</p>|
|ifOutMulticastPkts.9|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.9<p>Update: 30s</p>|
|Текущая скорость на порту 14|<p>-</p>|`SNMP agent`|ifHighSpeed.14<p>Update: 30s</p>|
|Ошибки входящие порта 23|<p>-</p>|`SNMP agent`|ifInErrors.23<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 3|<p>-</p>|`SNMP agent`|ifOutOctets.3<p>Update: 30s</p>|
|Скорость входящего трафика на порту 19|<p>-</p>|`SNMP agent`|ifInOctets.19<p>Update: 30s</p>|
|ifOutMulticastPkts.17|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.17<p>Update: 30s</p>|
|Ошибки исходящие порта 12|<p>-</p>|`SNMP agent`|ifOutErrors.12<p>Update: 30s</p>|
|ifOutUcastPkts.6|<p>-</p>|`SNMP agent`|ifOutUcastPkts.6<p>Update: 30s</p>|
|Текущая скорость на порту 20|<p>-</p>|`SNMP agent`|ifHighSpeed.20<p>Update: 30s</p>|
|ifHCInOctets.17|<p>-</p>|`SNMP agent`|ifHCInOctets.17<p>Update: 30s</p>|
|Дуплекс статус порта 26|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.26<p>Update: 30s</p>|
|ifHCInOctets.14|<p>-</p>|`SNMP agent`|ifHCInOctets.14<p>Update: 30s</p>|
|ifOutMulticastPkts.23|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.23<p>Update: 30s</p>|
|ifHCOutOctets.9|<p>-</p>|`SNMP agent`|ifHCOutOctets.9<p>Update: 30s</p>|
|Cостояние порта 20|<p>-</p>|`SNMP agent`|ifAdminStatus.20<p>Update: 6s</p>|
|ifInMulticastPkts.24|<p>-</p>|`SNMP agent`|ifInMulticastPkts.24<p>Update: 30s</p>|
|ifInMulticastPkts.15|<p>-</p>|`SNMP agent`|ifInMulticastPkts.15<p>Update: 30s</p>|
|Ошибки исходящие порта 11|<p>-</p>|`SNMP agent`|ifOutErrors.11<p>Update: 30s</p>|
|Текущая скорость на порту 8|<p>-</p>|`SNMP agent`|ifHighSpeed.8<p>Update: 30s</p>|
|ifHCInOctets.5|<p>-</p>|`SNMP agent`|ifHCInOctets.5<p>Update: 30s</p>|
|Cостояние порта 21|<p>-</p>|`SNMP agent`|ifAdminStatus.21<p>Update: 6s</p>|
|Ошибки входящие порта 19|<p>-</p>|`SNMP agent`|ifInErrors.19<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 4|<p>-</p>|`SNMP agent`|ifOutOctets.4<p>Update: 30s</p>|
|ifInMulticastPkts.2|<p>-</p>|`SNMP agent`|ifInMulticastPkts.2<p>Update: 30s</p>|
|ifOutBroadcastPkts.1|<p>-</p>|`SNMP agent`|ifOutBroadcastPkts.1<p>Update: 30s</p>|
|ifInMulticastPkts.13|<p>-</p>|`SNMP agent`|ifInMulticastPkts.13<p>Update: 30s</p>|
|ifHCInOctets.2|<p>-</p>|`SNMP agent`|ifHCInOctets.2<p>Update: 30s</p>|
|port description 18|<p>-</p>|`SNMP agent`|ifDescr18<p>Update: 30s</p>|
|ifHCOutOctets.16|<p>-</p>|`SNMP agent`|ifHCOutOctets.16<p>Update: 30s</p>|
|ifHCInOctets.6|<p>-</p>|`SNMP agent`|ifHCInOctets.6<p>Update: 30s</p>|
|Cостояние порта 23|<p>-</p>|`SNMP agent`|ifAdminStatus.23<p>Update: 6s</p>|
|port description 6|<p>-</p>|`SNMP agent`|ifDescr6<p>Update: 30s</p>|
|ifOutMulticastPkts.20|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.20<p>Update: 30s</p>|
|ifOutUcastPkts.11|<p>-</p>|`SNMP agent`|ifOutUcastPkts.11<p>Update: 30s</p>|
|ifOutUcastPkts.5|<p>-</p>|`SNMP agent`|ifOutUcastPkts.5<p>Update: 30s</p>|
|port description 16|<p>-</p>|`SNMP agent`|ifDescr16<p>Update: 30s</p>|
|ifHCOutOctets.22|<p>-</p>|`SNMP agent`|ifHCOutOctets.22<p>Update: 30s</p>|
|ifHCInOctets.4|<p>-</p>|`SNMP agent`|ifHCInOctets.4<p>Update: 30s</p>|
|ifOperStatus.13|<p>-</p>|`SNMP agent`|ifOperStatus.13<p>Update: 30s</p>|
|PVID порта 6|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.6<p>Update: 30s</p>|
|ifInUcastPkts.1|<p>-</p>|`SNMP agent`|ifInUcastPkts.1<p>Update: 30s</p>|
|Текущая скорость на порту 16|<p>-</p>|`SNMP agent`|ifHighSpeed.16<p>Update: 30s</p>|
|ifOutUcastPkts.14|<p>-</p>|`SNMP agent`|ifOutUcastPkts.14<p>Update: 30s</p>|
|ifInUcastPkts.14|<p>-</p>|`SNMP agent`|ifInUcastPkts.14<p>Update: 30s</p>|
|серийный номер|<p>-</p>|`SNMP agent`|mib-2.47.1.1.1.1.11.1<p>Update: 30s</p>|
|ifOperStatus.26|<p>-</p>|`SNMP agent`|ifOperStatus.26<p>Update: 30s</p>|
|Ошибки исходящие порта 15|<p>-</p>|`SNMP agent`|ifOutErrors.15<p>Update: 30s</p>|
|ifOutMulticastPkts.13|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.13<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 25|<p>-</p>|`SNMP agent`|ifOutOctets.25<p>Update: 30s</p>|
|ifOperStatus.19|<p>-</p>|`SNMP agent`|ifOperStatus.19<p>Update: 30s</p>|
|ifInUcastPkts.9|<p>-</p>|`SNMP agent`|ifInUcastPkts.9<p>Update: 30s</p>|
|ifInUcastPkts.11|<p>-</p>|`SNMP agent`|ifInUcastPkts.11<p>Update: 30s</p>|
|ifInUcastPkts.24|<p>-</p>|`SNMP agent`|ifInUcastPkts.24<p>Update: 30s</p>|
|ifOutUcastPkts.18|<p>-</p>|`SNMP agent`|ifOutUcastPkts.18<p>Update: 30s</p>|
|Ошибки входящие порта 16|<p>-</p>|`SNMP agent`|ifInErrors.16<p>Update: 30s</p>|
|Скорость исходящего трафика на порту 17|<p>-</p>|`SNMP agent`|ifOutOctets.17<p>Update: 30s</p>|
|Ошибки входящие порта 2|<p>-</p>|`SNMP agent`|ifInErrors.2<p>Update: 30s</p>|
|Текущая скорость на порту 12|<p>-</p>|`SNMP agent`|ifHighSpeed.12<p>Update: 30s</p>|
|ifHCOutOctets.10|<p>-</p>|`SNMP agent`|ifHCOutOctets.10<p>Update: 30s</p>|
|ifHCOutOctets.23|<p>-</p>|`SNMP agent`|ifHCOutOctets.23<p>Update: 30s</p>|
|Скорость входящего трафика на порту 15|<p>-</p>|`SNMP agent`|ifInOctets.15<p>Update: 30s</p>|
|Ошибки входящие порта 11|<p>-</p>|`SNMP agent`|ifInErrors.11<p>Update: 30s</p>|
|Дуплекс статус порта 10|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.10<p>Update: 30s</p>|
|port description 15|<p>-</p>|`SNMP agent`|ifDescr15<p>Update: 30s</p>|
|PVID порта 24|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.24<p>Update: 30s</p>|
|sysLocation|<p>Местоположение</p>|`SNMP agent`|sysLocation<p>Update: 30s</p>|
|ifInUcastPkts.16|<p>-</p>|`SNMP agent`|ifInUcastPkts.16<p>Update: 30s</p>|
|Дуплекс статус порта 1|<p>-</p>|`SNMP agent`|dot3StatsDuplexStatus.1<p>Update: 30s</p>|
|ifOutMulticastPkts.4|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.4<p>Update: 30s</p>|
|Текущая скорость на порту 5|<p>-</p>|`SNMP agent`|ifHighSpeed.5<p>Update: 30s</p>|
|ifHCOutOctets.4|<p>-</p>|`SNMP agent`|ifHCOutOctets.4<p>Update: 30s</p>|
|Cостояние порта 22|<p>-</p>|`SNMP agent`|ifAdminStatus.22<p>Update: 6s</p>|
|ifInUcastPkts.13|<p>-</p>|`SNMP agent`|ifInUcastPkts.13<p>Update: 30s</p>|
|ifInMulticastPkts.10|<p>-</p>|`SNMP agent`|ifInMulticastPkts.10<p>Update: 30s</p>|
|ifInUcastPkts.7|<p>-</p>|`SNMP agent`|ifInUcastPkts.7<p>Update: 30s</p>|
|Скорость входящего трафика на порту 3|<p>-</p>|`SNMP agent`|ifInOctets.3<p>Update: 30s</p>|
|ifOutMulticastPkts.1|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.1<p>Update: 30s</p>|
|ifOperStatus.9|<p>-</p>|`SNMP agent`|ifOperStatus.9<p>Update: 30s</p>|
|PVID порта 7|<p>-</p>|`SNMP agent`|mib-2.17.7.1.4.5.1.1.7<p>Update: 30s</p>|
|port description 13|<p>-</p>|`SNMP agent`|ifDescr13<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

