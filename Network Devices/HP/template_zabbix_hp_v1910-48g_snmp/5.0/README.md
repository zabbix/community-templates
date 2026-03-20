# SNMP HP v1910-48G

## Overview

This template expanded the original 24 ports template to 48 ports published by Павел Яковлев and made compatible with Zabbix 2.0.x+


It is necessary to set:


* {$SNMP\_COMMUNITY} - **public** is the default value for read-only and **private** for read-write.
* {$SNMP\_PORT} - The value **161** is the default for SNMP port.


The template was tested in Zabbix:


* 2.0.6
* 2.2.7


## Author

Rômulo Mendes Figueiredo

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OutErrorsFa0/41|<p>-</p>|`SNMP agent`|ifOutErrors.41<p>Update: 120</p>|
|InErrorsFa0/15|<p>-</p>|`SNMP agent`|ifInErrors.15<p>Update: 120</p>|
|InErrorsFa0/42|<p>-</p>|`SNMP agent`|ifInErrors.42<p>Update: 120</p>|
|Bytes Rx port 34|<p>-</p>|`SNMP agent`|ifInOctets.34<p>Update: 120</p>|
|Bytes Tx port 36|<p>-</p>|`SNMP agent`|ifOutOctets.36<p>Update: 120</p>|
|Bytes Rx port 46|<p>-</p>|`SNMP agent`|ifInOctets.46<p>Update: 120</p>|
|OutErrorsFa0/47|<p>-</p>|`SNMP agent`|ifOutErrors.47<p>Update: 120</p>|
|Model|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.1.1.0<p>Update: 3600</p>|
|Status port 48|<p>-</p>|`SNMP agent`|ifOperStatus.48<p>Update: 120</p>|
|InErrorsFa0/45|<p>-</p>|`SNMP agent`|ifInErrors.45<p>Update: 120</p>|
|OutErrorsFa0/30|<p>-</p>|`SNMP agent`|ifOutErrors.30<p>Update: 120</p>|
|InErrorsFa0/26|<p>-</p>|`SNMP agent`|ifInErrors.26<p>Update: 120</p>|
|Bytes Rx port 28|<p>-</p>|`SNMP agent`|ifInOctets.28<p>Update: 120</p>|
|Bytes Rx port 12|<p>-</p>|`SNMP agent`|ifInOctets.12<p>Update: 120</p>|
|InErrorsFa0/28|<p>-</p>|`SNMP agent`|ifInErrors.28<p>Update: 120</p>|
|Bytes Rx port 5|<p>-</p>|`SNMP agent`|ifInOctets.5<p>Update: 120</p>|
|OutErrorsFa0/33|<p>-</p>|`SNMP agent`|ifOutErrors.33<p>Update: 120</p>|
|Bytes Rx port 9|<p>-</p>|`SNMP agent`|ifInOctets.9<p>Update: 120</p>|
|OutErrorsFa0/12|<p>-</p>|`SNMP agent`|ifOutErrors.12<p>Update: 120</p>|
|Status port 24|<p>-</p>|`SNMP agent`|ifOperStatus.24<p>Update: 120</p>|
|InErrorsFa0/37|<p>-</p>|`SNMP agent`|ifInErrors.37<p>Update: 120</p>|
|InErrorsFa0/2|<p>-</p>|`SNMP agent`|ifInErrors.2<p>Update: 120</p>|
|Status port 19|<p>-</p>|`SNMP agent`|ifOperStatus.19<p>Update: 120</p>|
|Bytes Tx port 1|<p>-</p>|`SNMP agent`|ifOutOctets.1<p>Update: 120</p>|
|OutErrorsFa0/10|<p>-</p>|`SNMP agent`|ifOutErrors.10<p>Update: 120</p>|
|Status port 3|<p>-</p>|`SNMP agent`|ifOperStatus.3<p>Update: 120</p>|
|InErrorsFa0/5|<p>-</p>|`SNMP agent`|ifInErrors.5<p>Update: 120</p>|
|InErrorsFa0/35|<p>-</p>|`SNMP agent`|ifInErrors.35<p>Update: 120</p>|
|Bytes Tx port 34|<p>-</p>|`SNMP agent`|ifOutOctets.34<p>Update: 120</p>|
|Status port 2|<p>-</p>|`SNMP agent`|ifOperStatus.2<p>Update: 120</p>|
|Bytes Tx port 4|<p>-</p>|`SNMP agent`|ifOutOctets.4<p>Update: 120</p>|
|InErrorsFa0/31|<p>-</p>|`SNMP agent`|ifInErrors.31<p>Update: 120</p>|
|Bytes Tx port 22|<p>-</p>|`SNMP agent`|ifOutOctets.22<p>Update: 120</p>|
|Bytes Tx port 38|<p>-</p>|`SNMP agent`|ifOutOctets.38<p>Update: 120</p>|
|Bytes Rx port 17|<p>-</p>|`SNMP agent`|ifInOctets.17<p>Update: 120</p>|
|InErrorsFa0/18|<p>-</p>|`SNMP agent`|ifInErrors.18<p>Update: 120</p>|
|Bytes Rx port 2|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 120</p>|
|Status port 35|<p>-</p>|`SNMP agent`|ifOperStatus.35<p>Update: 120</p>|
|Status port 30|<p>-</p>|`SNMP agent`|ifOperStatus.30<p>Update: 120</p>|
|OutErrorsFa0/32|<p>-</p>|`SNMP agent`|ifOutErrors.32<p>Update: 120</p>|
|Status port 37|<p>-</p>|`SNMP agent`|ifOperStatus.37<p>Update: 120</p>|
|Status port 23|<p>-</p>|`SNMP agent`|ifOperStatus.23<p>Update: 120</p>|
|Status port 43|<p>-</p>|`SNMP agent`|ifOperStatus.43<p>Update: 120</p>|
|Bytes Tx port 35|<p>-</p>|`SNMP agent`|ifOutOctets.35<p>Update: 120</p>|
|Bytes Rx port 25|<p>-</p>|`SNMP agent`|ifInOctets.25<p>Update: 120</p>|
|InErrorsFa0/17|<p>-</p>|`SNMP agent`|ifInErrors.17<p>Update: 120</p>|
|InErrorsFa0/30|<p>-</p>|`SNMP agent`|ifInErrors.30<p>Update: 120</p>|
|OutErrorsFa0/13|<p>-</p>|`SNMP agent`|ifOutErrors.13<p>Update: 120</p>|
|Status port 46|<p>-</p>|`SNMP agent`|ifOperStatus.46<p>Update: 120</p>|
|Bytes Rx port 6|<p>-</p>|`SNMP agent`|ifInOctets.6<p>Update: 120</p>|
|OutErrorsFa0/11|<p>-</p>|`SNMP agent`|ifOutErrors.11<p>Update: 120</p>|
|OutErrorsFa0/7|<p>-</p>|`SNMP agent`|ifOutErrors.7<p>Update: 120</p>|
|Status port 36|<p>-</p>|`SNMP agent`|ifOperStatus.36<p>Update: 120</p>|
|Status port 4|<p>-</p>|`SNMP agent`|ifOperStatus.4<p>Update: 120</p>|
|Bytes Tx port 17|<p>-</p>|`SNMP agent`|ifOutOctets.17<p>Update: 120</p>|
|Status port 9|<p>-</p>|`SNMP agent`|ifOperStatus.9<p>Update: 120</p>|
|Bytes Rx port 44|<p>-</p>|`SNMP agent`|ifInOctets.44<p>Update: 120</p>|
|InErrorsFa0/36|<p>-</p>|`SNMP agent`|ifInErrors.36<p>Update: 120</p>|
|OutErrorsFa0/5|<p>-</p>|`SNMP agent`|ifOutErrors.5<p>Update: 120</p>|
|OutErrorsFa0/27|<p>-</p>|`SNMP agent`|ifOutErrors.27<p>Update: 120</p>|
|OutErrorsFa0/26|<p>-</p>|`SNMP agent`|ifOutErrors.26<p>Update: 120</p>|
|Bytes Tx port 41|<p>-</p>|`SNMP agent`|ifOutOctets.41<p>Update: 120</p>|
|Status port 26|<p>-</p>|`SNMP agent`|ifOperStatus.26<p>Update: 120</p>|
|OutErrorsFa0/36|<p>-</p>|`SNMP agent`|ifOutErrors.36<p>Update: 120</p>|
|Bytes Tx port 6|<p>-</p>|`SNMP agent`|ifOutOctets.6<p>Update: 120</p>|
|Bytes Rx port 36|<p>-</p>|`SNMP agent`|ifInOctets.36<p>Update: 120</p>|
|InErrorsFa0/34|<p>-</p>|`SNMP agent`|ifInErrors.34<p>Update: 120</p>|
|Bytes Rx port 18|<p>-</p>|`SNMP agent`|ifInOctets.18<p>Update: 120</p>|
|Bytes Rx port 38|<p>-</p>|`SNMP agent`|ifInOctets.38<p>Update: 120</p>|
|Bytes Tx port 13|<p>-</p>|`SNMP agent`|ifOutOctets.13<p>Update: 120</p>|
|OutErrorsFa0/39|<p>-</p>|`SNMP agent`|ifOutErrors.39<p>Update: 120</p>|
|OutErrorsFa0/20|<p>-</p>|`SNMP agent`|ifOutErrors.20<p>Update: 120</p>|
|Bytes Rx port 47|<p>-</p>|`SNMP agent`|ifInOctets.47<p>Update: 120</p>|
|InErrorsFa0/14|<p>-</p>|`SNMP agent`|ifInErrors.14<p>Update: 120</p>|
|Status port 10|<p>-</p>|`SNMP agent`|ifOperStatus.10<p>Update: 120</p>|
|Bytes Rx port 4|<p>-</p>|`SNMP agent`|ifInOctets.4<p>Update: 120</p>|
|Bytes Tx port 42|<p>-</p>|`SNMP agent`|ifOutOctets.42<p>Update: 120</p>|
|InErrorsFa0/10|<p>-</p>|`SNMP agent`|ifInErrors.10<p>Update: 120</p>|
|OutErrorsFa0/24|<p>-</p>|`SNMP agent`|ifOutErrors.24<p>Update: 120</p>|
|InErrorsFa0/8|<p>-</p>|`SNMP agent`|ifInErrors.8<p>Update: 120</p>|
|Status port 17|<p>-</p>|`SNMP agent`|ifOperStatus.17<p>Update: 120</p>|
|InErrorsFa0/33|<p>-</p>|`SNMP agent`|ifInErrors.33<p>Update: 120</p>|
|Bytes Tx port 45|<p>-</p>|`SNMP agent`|ifOutOctets.45<p>Update: 120</p>|
|InErrorsFa0/6|<p>-</p>|`SNMP agent`|ifInErrors.6<p>Update: 120</p>|
|Uptime|<p>-</p>|`SNMP agent`|Uptime<p>Update: 60</p>|
|OutErrorsFa0/22|<p>-</p>|`SNMP agent`|ifOutErrors.22<p>Update: 120</p>|
|Bytes Tx port 28|<p>-</p>|`SNMP agent`|ifOutOctets.28<p>Update: 120</p>|
|Bytes Tx port 23|<p>-</p>|`SNMP agent`|ifOutOctets.23<p>Update: 120</p>|
|Status port 45|<p>-</p>|`SNMP agent`|ifOperStatus.45<p>Update: 120</p>|
|Status port 1|<p>-</p>|`SNMP agent`|ifOperStatus.1<p>Update: 120</p>|
|Bytes Rx port 23|<p>-</p>|`SNMP agent`|ifInOctets.23<p>Update: 120</p>|
|Bytes Rx port 40|<p>-</p>|`SNMP agent`|ifInOctets.40<p>Update: 120</p>|
|Bytes Tx port 9|<p>-</p>|`SNMP agent`|ifOutOctets.9<p>Update: 120</p>|
|OutErrorsFa0/21|<p>-</p>|`SNMP agent`|ifOutErrors.21<p>Update: 120</p>|
|Bytes Rx port 22|<p>-</p>|`SNMP agent`|ifInOctets.22<p>Update: 120</p>|
|OutErrorsFa0/43|<p>-</p>|`SNMP agent`|ifOutErrors.43<p>Update: 120</p>|
|Status port 28|<p>-</p>|`SNMP agent`|ifOperStatus.28<p>Update: 120</p>|
|InErrorsFa0/40|<p>-</p>|`SNMP agent`|ifInErrors.40<p>Update: 120</p>|
|Status port 25|<p>-</p>|`SNMP agent`|ifOperStatus.25<p>Update: 120</p>|
|InErrorsFa0/4|<p>-</p>|`SNMP agent`|ifInErrors.4<p>Update: 120</p>|
|Bytes Rx port 29|<p>-</p>|`SNMP agent`|ifInOctets.29<p>Update: 120</p>|
|InErrorsFa0/21|<p>-</p>|`SNMP agent`|ifInErrors.21<p>Update: 120</p>|
|InErrorsFa0/44|<p>-</p>|`SNMP agent`|ifInErrors.44<p>Update: 120</p>|
|Status port 11|<p>-</p>|`SNMP agent`|ifOperStatus.11<p>Update: 120</p>|
|Bytes Tx port 30|<p>-</p>|`SNMP agent`|ifOutOctets.30<p>Update: 120</p>|
|OutErrorsFa0/40|<p>-</p>|`SNMP agent`|ifOutErrors.40<p>Update: 120</p>|
|OutErrorsFa0/42|<p>-</p>|`SNMP agent`|ifOutErrors.42<p>Update: 120</p>|
|Status port 12|<p>-</p>|`SNMP agent`|ifOperStatus.12<p>Update: 120</p>|
|Bytes Tx port 16|<p>-</p>|`SNMP agent`|ifOutOctets.16<p>Update: 120</p>|
|Status port 47|<p>-</p>|`SNMP agent`|ifOperStatus.47<p>Update: 120</p>|
|Bytes Tx port 11|<p>-</p>|`SNMP agent`|ifOutOctets.11<p>Update: 120</p>|
|Status port 29|<p>-</p>|`SNMP agent`|ifOperStatus.29<p>Update: 120</p>|
|OutErrorsFa0/4|<p>-</p>|`SNMP agent`|ifOutErrors.4<p>Update: 120</p>|
|Bytes Tx port 18|<p>-</p>|`SNMP agent`|ifOutOctets.18<p>Update: 120</p>|
|InErrorsFa0/41|<p>-</p>|`SNMP agent`|ifInErrors.41<p>Update: 120</p>|
|InErrorsFa0/38|<p>-</p>|`SNMP agent`|ifInErrors.38<p>Update: 120</p>|
|OutErrorsFa0/6|<p>-</p>|`SNMP agent`|ifOutErrors.6<p>Update: 120</p>|
|OutErrorsFa0/44|<p>-</p>|`SNMP agent`|ifOutErrors.44<p>Update: 120</p>|
|InErrorsFa0/7|<p>-</p>|`SNMP agent`|ifInErrors.7<p>Update: 120</p>|
|OutErrorsFa0/37|<p>-</p>|`SNMP agent`|ifOutErrors.37<p>Update: 120</p>|
|Bytes Tx port 39|<p>-</p>|`SNMP agent`|ifOutOctets.39<p>Update: 120</p>|
|InErrorsFa0/19|<p>-</p>|`SNMP agent`|ifInErrors.19<p>Update: 120</p>|
|Bytes Rx port 24|<p>-</p>|`SNMP agent`|ifInOctets.24<p>Update: 120</p>|
|InErrorsFa0/29|<p>-</p>|`SNMP agent`|ifInErrors.29<p>Update: 120</p>|
|Bytes Tx port 8|<p>-</p>|`SNMP agent`|ifOutOctets.8<p>Update: 120</p>|
|OutErrorsFa0/1|<p>-</p>|`SNMP agent`|ifOutErrors.1<p>Update: 120</p>|
|Status port 27|<p>-</p>|`SNMP agent`|ifOperStatus.27<p>Update: 120</p>|
|Bytes Tx port 19|<p>-</p>|`SNMP agent`|ifOutOctets.19<p>Update: 120</p>|
|Status port 8|<p>-</p>|`SNMP agent`|ifOperStatus.8<p>Update: 120</p>|
|Bytes Tx port 37|<p>-</p>|`SNMP agent`|ifOutOctets.37<p>Update: 120</p>|
|InErrorsFa0/16|<p>-</p>|`SNMP agent`|ifInErrors.16<p>Update: 120</p>|
|Bytes Tx port 46|<p>-</p>|`SNMP agent`|ifOutOctets.46<p>Update: 120</p>|
|Bytes Tx port 40|<p>-</p>|`SNMP agent`|ifOutOctets.40<p>Update: 120</p>|
|Status port 22|<p>-</p>|`SNMP agent`|ifOperStatus.22<p>Update: 120</p>|
|Bytes Rx port 8|<p>-</p>|`SNMP agent`|ifInOctets.8<p>Update: 120</p>|
|OutErrorsFa0/28|<p>-</p>|`SNMP agent`|ifOutErrors.28<p>Update: 120</p>|
|OutErrorsFa0/38|<p>-</p>|`SNMP agent`|ifOutErrors.38<p>Update: 120</p>|
|Status port 34|<p>-</p>|`SNMP agent`|ifOperStatus.34<p>Update: 120</p>|
|OutErrorsFa0/8|<p>-</p>|`SNMP agent`|ifOutErrors.8<p>Update: 120</p>|
|Bytes Tx port 44|<p>-</p>|`SNMP agent`|ifOutOctets.44<p>Update: 120</p>|
|OutErrorsFa0/2|<p>-</p>|`SNMP agent`|ifOutErrors.2<p>Update: 120</p>|
|InErrorsFa0/43|<p>-</p>|`SNMP agent`|ifInErrors.43<p>Update: 120</p>|
|Bytes Tx port 3|<p>-</p>|`SNMP agent`|ifOutOctets.3<p>Update: 120</p>|
|Bytes Rx port 42|<p>-</p>|`SNMP agent`|ifInOctets.42<p>Update: 120</p>|
|Bytes Rx port 41|<p>-</p>|`SNMP agent`|ifInOctets.41<p>Update: 120</p>|
|OutErrorsFa0/15|<p>-</p>|`SNMP agent`|ifOutErrors.15<p>Update: 120</p>|
|OutErrorsFa0/46|<p>-</p>|`SNMP agent`|ifOutErrors.46<p>Update: 120</p>|
|InErrorsFa0/22|<p>-</p>|`SNMP agent`|ifInErrors.22<p>Update: 120</p>|
|Bytes Tx port 5|<p>-</p>|`SNMP agent`|ifOutOctets.5<p>Update: 120</p>|
|Status port 21|<p>-</p>|`SNMP agent`|ifOperStatus.21<p>Update: 120</p>|
|Bytes Rx port 14|<p>-</p>|`SNMP agent`|ifInOctets.14<p>Update: 120</p>|
|Bytes Tx port 25|<p>-</p>|`SNMP agent`|ifOutOctets.25<p>Update: 120</p>|
|Status port 16|<p>-</p>|`SNMP agent`|ifOperStatus.16<p>Update: 120</p>|
|Bytes Rx port 26|<p>-</p>|`SNMP agent`|ifInOctets.26<p>Update: 120</p>|
|Bytes Tx port 27|<p>-</p>|`SNMP agent`|ifOutOctets.27<p>Update: 120</p>|
|InErrorsFa0/46|<p>-</p>|`SNMP agent`|ifInErrors.46<p>Update: 120</p>|
|Status port 42|<p>-</p>|`SNMP agent`|ifOperStatus.42<p>Update: 120</p>|
|OutErrorsFa0/48|<p>-</p>|`SNMP agent`|ifOutErrors.48<p>Update: 120</p>|
|InErrorsFa0/23|<p>-</p>|`SNMP agent`|ifInErrors.23<p>Update: 120</p>|
|Bytes Rx port 11|<p>-</p>|`SNMP agent`|ifInOctets.11<p>Update: 120</p>|
|Bytes Rx port 19|<p>-</p>|`SNMP agent`|ifInOctets.19<p>Update: 120</p>|
|Bytes Tx port 31|<p>-</p>|`SNMP agent`|ifOutOctets.31<p>Update: 120</p>|
|Status port 31|<p>-</p>|`SNMP agent`|ifOperStatus.31<p>Update: 120</p>|
|Bytes Rx port 35|<p>-</p>|`SNMP agent`|ifInOctets.35<p>Update: 120</p>|
|InErrorsFa0/3|<p>-</p>|`SNMP agent`|ifInErrors.3<p>Update: 120</p>|
|Bytes Rx port 1|<p>-</p>|`SNMP agent`|ifInOctets.1<p>Update: 120</p>|
|InErrorsFa0/25|<p>-</p>|`SNMP agent`|ifInErrors.25<p>Update: 120</p>|
|Bytes Rx port 3|<p>-</p>|`SNMP agent`|ifInOctets.3<p>Update: 120</p>|
|Bytes Tx port 20|<p>-</p>|`SNMP agent`|ifOutOctets.20<p>Update: 120</p>|
|OutErrorsFa0/45|<p>-</p>|`SNMP agent`|ifOutErrors.45<p>Update: 120</p>|
|Bytes Tx port 12|<p>-</p>|`SNMP agent`|ifOutOctets.12<p>Update: 120</p>|
|OutErrorsFa0/25|<p>-</p>|`SNMP agent`|ifOutErrors.25<p>Update: 120</p>|
|Bytes Tx port 2|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 120</p>|
|OutErrorsFa0/3|<p>-</p>|`SNMP agent`|ifOutErrors.3<p>Update: 120</p>|
|InErrorsFa0/12|<p>-</p>|`SNMP agent`|ifInErrors.12<p>Update: 120</p>|
|Bytes Tx port 14|<p>-</p>|`SNMP agent`|ifOutOctets.14<p>Update: 120</p>|
|Bytes Rx port 45|<p>-</p>|`SNMP agent`|ifInOctets.45<p>Update: 120</p>|
|Status port 6|<p>-</p>|`SNMP agent`|ifOperStatus.6<p>Update: 120</p>|
|InErrorsFa0/48|<p>-</p>|`SNMP agent`|ifInErrors.48<p>Update: 120</p>|
|Bytes Rx port 7|<p>-</p>|`SNMP agent`|ifInOctets.7<p>Update: 120</p>|
|InErrorsFa0/27|<p>-</p>|`SNMP agent`|ifInErrors.27<p>Update: 120</p>|
|Bytes Tx port 32|<p>-</p>|`SNMP agent`|ifOutOctets.32<p>Update: 120</p>|
|Bytes Rx port 31|<p>-</p>|`SNMP agent`|ifInOctets.31<p>Update: 120</p>|
|Bytes Rx port 13|<p>-</p>|`SNMP agent`|ifInOctets.13<p>Update: 120</p>|
|Status port 14|<p>-</p>|`SNMP agent`|ifOperStatus.14<p>Update: 120</p>|
|Status port 32|<p>-</p>|`SNMP agent`|ifOperStatus.32<p>Update: 120</p>|
|Bytes Rx port 32|<p>-</p>|`SNMP agent`|ifInOctets.32<p>Update: 120</p>|
|Bytes Rx port 43|<p>-</p>|`SNMP agent`|ifInOctets.43<p>Update: 120</p>|
|Bytes Tx port 21|<p>-</p>|`SNMP agent`|ifOutOctets.21<p>Update: 120</p>|
|Status port 38|<p>-</p>|`SNMP agent`|ifOperStatus.38<p>Update: 120</p>|
|OutErrorsFa0/19|<p>-</p>|`SNMP agent`|ifOutErrors.19<p>Update: 120</p>|
|Bytes Tx port 7|<p>-</p>|`SNMP agent`|ifOutOctets.7<p>Update: 120</p>|
|InErrorsFa0/39|<p>-</p>|`SNMP agent`|ifInErrors.39<p>Update: 120</p>|
|InErrorsFa0/11|<p>-</p>|`SNMP agent`|ifInErrors.11<p>Update: 120</p>|
|OutErrorsFa0/23|<p>-</p>|`SNMP agent`|ifOutErrors.23<p>Update: 120</p>|
|Bytes Tx port 26|<p>-</p>|`SNMP agent`|ifOutOctets.26<p>Update: 120</p>|
|Bytes Rx port 10|<p>-</p>|`SNMP agent`|ifInOctets.10<p>Update: 120</p>|
|Status port 33|<p>-</p>|`SNMP agent`|ifOperStatus.33<p>Update: 120</p>|
|Bytes Rx port 16|<p>-</p>|`SNMP agent`|ifInOctets.16<p>Update: 120</p>|
|Bytes Tx port 24|<p>-</p>|`SNMP agent`|ifOutOctets.24<p>Update: 120</p>|
|Bytes Tx port 29|<p>-</p>|`SNMP agent`|ifOutOctets.29<p>Update: 120</p>|
|InErrorsFa0/20|<p>-</p>|`SNMP agent`|ifInErrors.20<p>Update: 120</p>|
|OutErrorsFa0/16|<p>-</p>|`SNMP agent`|ifOutErrors.16<p>Update: 120</p>|
|Bytes Rx port 20|<p>-</p>|`SNMP agent`|ifInOctets.20<p>Update: 120</p>|
|Status port 5|<p>-</p>|`SNMP agent`|ifOperStatus.5<p>Update: 120</p>|
|Status port 18|<p>-</p>|`SNMP agent`|ifOperStatus.18<p>Update: 120</p>|
|Bytes Tx port 33|<p>-</p>|`SNMP agent`|ifOutOctets.33<p>Update: 120</p>|
|OutErrorsFa0/14|<p>-</p>|`SNMP agent`|ifOutErrors.14<p>Update: 120</p>|
|Bytes Rx port 21|<p>-</p>|`SNMP agent`|ifInOctets.21<p>Update: 120</p>|
|Status port 39|<p>-</p>|`SNMP agent`|ifOperStatus.39<p>Update: 120</p>|
|InErrorsFa0/47|<p>-</p>|`SNMP agent`|ifInErrors.47<p>Update: 120</p>|
|Bytes Tx port 48|<p>-</p>|`SNMP agent`|ifOutOctets.48<p>Update: 120</p>|
|Status port 7|<p>-</p>|`SNMP agent`|ifOperStatus.7<p>Update: 120</p>|
|InErrorsFa0/13|<p>-</p>|`SNMP agent`|ifInErrors.13<p>Update: 120</p>|
|Bytes Rx port 30|<p>-</p>|`SNMP agent`|ifInOctets.30<p>Update: 120</p>|
|Bytes Tx port 10|<p>-</p>|`SNMP agent`|ifOutOctets.10<p>Update: 120</p>|
|Status port 44|<p>-</p>|`SNMP agent`|ifOperStatus.44<p>Update: 120</p>|
|OutErrorsFa0/18|<p>-</p>|`SNMP agent`|ifOutErrors.18<p>Update: 120</p>|
|InErrorsFa0/32|<p>-</p>|`SNMP agent`|ifInErrors.32<p>Update: 120</p>|
|OutErrorsFa0/9|<p>-</p>|`SNMP agent`|ifOutErrors.9<p>Update: 120</p>|
|Bytes Rx port 33|<p>-</p>|`SNMP agent`|ifInOctets.33<p>Update: 120</p>|
|OutErrorsFa0/31|<p>-</p>|`SNMP agent`|ifOutErrors.31<p>Update: 120</p>|
|OutErrorsFa0/17|<p>-</p>|`SNMP agent`|ifOutErrors.17<p>Update: 120</p>|
|Status port 41|<p>-</p>|`SNMP agent`|ifOperStatus.41<p>Update: 120</p>|
|Bytes Rx port 27|<p>-</p>|`SNMP agent`|ifInOctets.27<p>Update: 120</p>|
|InErrorsFa0/9|<p>-</p>|`SNMP agent`|ifInErrors.9<p>Update: 120</p>|
|Bytes Rx port 15|<p>-</p>|`SNMP agent`|ifInOctets.15<p>Update: 120</p>|
|Bytes Tx port 47|<p>-</p>|`SNMP agent`|ifOutOctets.47<p>Update: 120</p>|
|Status port 13|<p>-</p>|`SNMP agent`|ifOperStatus.13<p>Update: 120</p>|
|OutErrorsFa0/34|<p>-</p>|`SNMP agent`|ifOutErrors.34<p>Update: 120</p>|
|Bytes Tx port 43|<p>-</p>|`SNMP agent`|ifOutOctets.43<p>Update: 120</p>|
|Bytes Rx port 37|<p>-</p>|`SNMP agent`|ifInOctets.37<p>Update: 120</p>|
|InErrorsFa0/1|<p>-</p>|`SNMP agent`|ifInErrors.1<p>Update: 120</p>|
|Bytes Rx port 48|<p>-</p>|`SNMP agent`|ifInOctets.48<p>Update: 120</p>|
|InErrorsFa0/24|<p>-</p>|`SNMP agent`|ifInErrors.24<p>Update: 120</p>|
|OutErrorsFa0/29|<p>-</p>|`SNMP agent`|ifOutErrors.29<p>Update: 120</p>|
|Bytes Tx port 15|<p>-</p>|`SNMP agent`|ifOutOctets.15<p>Update: 120</p>|
|Bytes Rx port 39|<p>-</p>|`SNMP agent`|ifInOctets.39<p>Update: 120</p>|
|Status port 15|<p>-</p>|`SNMP agent`|ifOperStatus.15<p>Update: 120</p>|
|Status port 40|<p>-</p>|`SNMP agent`|ifOperStatus.40<p>Update: 120</p>|
|OutErrorsFa0/35|<p>-</p>|`SNMP agent`|ifOutErrors.35<p>Update: 120</p>|
|Status port 20|<p>-</p>|`SNMP agent`|ifOperStatus.20<p>Update: 120</p>|


## Triggers

There are no triggers in this template.

