# Cisco_SB_SG350XG-2F10

## Overview

Template for Cisco Small Business Switch SG350XG-2F10


- Device Details  
- Traffic on Ports (IN/OUT)  
- Errors on Ports (IN/OUT)  
- Status on Ports  
- Admin-Status on Ports  
- Status OOB  
- Ping Latency  
- Trigger Status Port with dependency to Admin-Status of Port  
- Trigger Errors on Ports  
- Trigger OOB Port  
- 9 Example-Graphs  
  




## Author

Thomas Oecknick

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System Temperatur|<p>-</p>|`SNMP agent`|entPhySensorValue.68420481<p>Update: 60</p>|
|Traffic incomming Interface te1/0/6|<p>-</p>|`SNMP agent`|ifInOctets.6<p>Update: 30s</p>|
|MTU Size Interface te1/0/7|<p>-</p>|`SNMP agent`|ifMtu.7<p>Update: 60</p>|
|PortSpeed te1/0/12|<p>-</p>|`SNMP agent`|ifSpeed.12<p>Update: 60</p>|
|Traffic incomming Interface te1/0/10|<p>-</p>|`SNMP agent`|ifInOctets.10<p>Update: 30s</p>|
|MTU Size Interface te2/0/12|<p>-</p>|`SNMP agent`|ifMtu.64<p>Update: 60</p>|
|PortSpeed te2/0/11|<p>-</p>|`SNMP agent`|ifSpeed.63<p>Update: 60</p>|
|Errors Outbound Port te1/0/6|<p>-</p>|`SNMP agent`|ifOutErrors.6<p>Update: 60</p>|
|Traffic outgoing Interface te2/0/11|<p>-</p>|`SNMP agent`|ifOutOctets.63<p>Update: 30s</p>|
|Status Port te2/0/1|<p>-</p>|`SNMP agent`|ifOperStatus.53<p>Update: 30s</p>|
|Ping|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|
|Traffic outgoing Interface te1/0/3|<p>-</p>|`SNMP agent`|ifOutOctets.3<p>Update: 30s</p>|
|Traffic outgoing Interface te1/0/7|<p>-</p>|`SNMP agent`|ifOutOctets.7<p>Update: 30s</p>|
|Status Port te1/0/6|<p>-</p>|`SNMP agent`|ifOperStatus.6<p>Update: 30s</p>|
|Traffic incomming Interface te1/0/3|<p>-</p>|`SNMP agent`|ifInOctets.3<p>Update: 30s</p>|
|PortSpeed te1/0/8|<p>-</p>|`SNMP agent`|ifSpeed.8<p>Update: 60</p>|
|MTU Size Interface te1/0/9|<p>-</p>|`SNMP agent`|ifMtu.9<p>Update: 60</p>|
|MTU Size Interface te1/0/6|<p>-</p>|`SNMP agent`|ifMtu.6<p>Update: 60</p>|
|Admin Status Port te1/0/7|<p>-</p>|`SNMP agent`|ifAdminStatus.7<p>Update: 30s</p>|
|Traffic outgoing Interface te2/0/3|<p>-</p>|`SNMP agent`|ifOutOctets.55<p>Update: 30s</p>|
|Errors Inbound te2/0/6|<p>-</p>|`SNMP agent`|ifInErrors.58<p>Update: 60</p>|
|Errors Outbound Port te1/0/10|<p>-</p>|`SNMP agent`|ifOutErrors.10<p>Update: 60</p>|
|Traffic incomming Interface te1/0/2|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 30s</p>|
|Admin Status Port te1/0/11|<p>-</p>|`SNMP agent`|ifAdminStatus.11<p>Update: 30s</p>|
|MTU Size Interface te1/0/10|<p>-</p>|`SNMP agent`|ifMtu.10<p>Update: 60</p>|
|Status Port te2/0/7|<p>-</p>|`SNMP agent`|ifOperStatus.59<p>Update: 30s</p>|
|Traffic outgoing Interface te1/0/9|<p>-</p>|`SNMP agent`|ifOutOctets.9<p>Update: 30s</p>|
|Errors Inbound te2/0/7|<p>-</p>|`SNMP agent`|ifInErrors.59<p>Update: 60</p>|
|Errors Outbound Port te1/0/4|<p>-</p>|`SNMP agent`|ifOutErrors.4<p>Update: 60</p>|
|Traffic incomming Interface te1/0/4|<p>-</p>|`SNMP agent`|ifInOctets.4<p>Update: 30s</p>|
|Errors Inbound te2/0/2|<p>-</p>|`SNMP agent`|ifInErrors.54<p>Update: 60</p>|
|Errors Inbound te1/0/7|<p>-</p>|`SNMP agent`|ifInErrors.7<p>Update: 60</p>|
|Traffic outgoing Interface te2/0/4|<p>-</p>|`SNMP agent`|ifOutOctets.56<p>Update: 30s</p>|
|Traffic outgoing Interface te1/0/10|<p>-</p>|`SNMP agent`|ifOutOctets.10<p>Update: 30s</p>|
|Device Firmware Version|<p>-</p>|`SNMP agent`|Firmware<p>Update: 600</p>|
|Admin Status Port te2/0/10|<p>-</p>|`SNMP agent`|ifAdminStatus.62<p>Update: 30s</p>|
|Admin Status Port te1/0/12|<p>-</p>|`SNMP agent`|ifAdminStatus.12<p>Update: 30s</p>|
|Traffic outgoing Interface te2/0/5|<p>-</p>|`SNMP agent`|ifOutOctets.57<p>Update: 30s</p>|
|Errors Inbound te1/0/11|<p>-</p>|`SNMP agent`|ifInErrors.11<p>Update: 60</p>|
|Errors Outbound Port te1/0/1|<p>-</p>|`SNMP agent`|ifOutErrors.1<p>Update: 60</p>|
|Ping pro Sekunde|<p>-</p>|`Simple check`|icmppingsec<p>Update: 30</p>|
|Errors Outbound Port te2/0/8|<p>-</p>|`SNMP agent`|ifOutErrors.60<p>Update: 60</p>|
|MTU Size Interface te2/0/9|<p>-</p>|`SNMP agent`|ifMtu.61<p>Update: 60</p>|
|Status Port te1/0/11|<p>-</p>|`SNMP agent`|ifOperStatus.11<p>Update: 30s</p>|
|Admin Status Port te1/0/2|<p>-</p>|`SNMP agent`|ifAdminStatus.2<p>Update: 30s</p>|
|Status Port te2/0/8|<p>-</p>|`SNMP agent`|ifOperStatus.60<p>Update: 30s</p>|
|PortSpeed te1/0/2|<p>-</p>|`SNMP agent`|ifSpeed.2<p>Update: 60</p>|
|Errors Inbound te1/0/1|<p>-</p>|`SNMP agent`|ifInErrors.1<p>Update: 60</p>|
|Admin Status Port te1/0/8|<p>-</p>|`SNMP agent`|ifAdminStatus.8<p>Update: 30s</p>|
|Fan 01|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109250<p>Update: 600</p>|
|PortSpeed te1/0/6|<p>-</p>|`SNMP agent`|ifSpeed.6<p>Update: 60</p>|
|Errors Inbound te2/0/3|<p>-</p>|`SNMP agent`|ifInErrors.55<p>Update: 60</p>|
|Admin Status Port te2/0/6|<p>-</p>|`SNMP agent`|ifAdminStatus.58<p>Update: 30s</p>|
|Errors Inbound te2/0/10|<p>-</p>|`SNMP agent`|ifInErrors.62<p>Update: 60</p>|
|Errors Inbound te2/0/5|<p>-</p>|`SNMP agent`|ifInErrors.57<p>Update: 60</p>|
|Traffic outgoing Interface te2/0/8|<p>-</p>|`SNMP agent`|ifOutOctets.60<p>Update: 30s</p>|
|MTU Size Interface te2/0/5|<p>-</p>|`SNMP agent`|ifMtu.57<p>Update: 60</p>|
|Admin Status Port te1/0/5|<p>-</p>|`SNMP agent`|ifAdminStatus.5<p>Update: 30s</p>|
|Stystem Name|<p>-</p>|`SNMP agent`|SysName<p>Update: 60</p>|
|PortSpeed te1/0/3|<p>-</p>|`SNMP agent`|ifSpeed.3<p>Update: 60</p>|
|Errors Outbound Port te1/0/3|<p>-</p>|`SNMP agent`|ifOutErrors.3<p>Update: 60</p>|
|Admin Status Port te1/0/4|<p>-</p>|`SNMP agent`|ifAdminStatus.4<p>Update: 30s</p>|
|Errors Inbound te2/0/9|<p>-</p>|`SNMP agent`|ifInErrors.61<p>Update: 60</p>|
|Errors Outbound Port te1/0/12|<p>-</p>|`SNMP agent`|ifOutErrors.12<p>Update: 60</p>|
|Errors Outbound Port te2/0/12|<p>-</p>|`SNMP agent`|ifOutErrors.64<p>Update: 60</p>|
|PortSpeed te1/0/10|<p>-</p>|`SNMP agent`|ifSpeed.10<p>Update: 60</p>|
|Traffic incomming Interface te2/0/1|<p>-</p>|`SNMP agent`|ifInOctets.53<p>Update: 30s</p>|
|Status Port te1/0/5|<p>-</p>|`SNMP agent`|ifOperStatus.5<p>Update: 30s</p>|
|Errors Inbound te1/0/4|<p>-</p>|`SNMP agent`|ifInErrors.4<p>Update: 60</p>|
|MTU Size Interface te1/0/8|<p>-</p>|`SNMP agent`|ifMtu.8<p>Update: 60</p>|
|Stystem Description|<p>-</p>|`SNMP agent`|SysDescr<p>Update: 60</p>|
|Admin Status Port te2/0/4|<p>-</p>|`SNMP agent`|ifAdminStatus.56<p>Update: 30s</p>|
|Errors Inbound te1/0/10|<p>-</p>|`SNMP agent`|ifInErrors.10<p>Update: 60</p>|
|PortSpeed te2/0/9|<p>-</p>|`SNMP agent`|ifSpeed.61<p>Update: 60</p>|
|Traffic incomming Interface te1/0/9|<p>-</p>|`SNMP agent`|ifInOctets.9<p>Update: 30s</p>|
|Traffic incomming Interface te1/0/7|<p>-</p>|`SNMP agent`|ifInOctets.7<p>Update: 30s</p>|
|Errors Inbound te1/0/12|<p>-</p>|`SNMP agent`|ifInErrors.12<p>Update: 60</p>|
|MTU Size Interface te2/0/11|<p>-</p>|`SNMP agent`|ifMtu.63<p>Update: 60</p>|
|Errors Outbound Port te2/0/10|<p>-</p>|`SNMP agent`|ifOutErrors.62<p>Update: 60</p>|
|Traffic incomming Interface te2/0/7|<p>-</p>|`SNMP agent`|ifInOctets.59<p>Update: 30s</p>|
|Traffic incomming Interface te1/0/1|<p>-</p>|`SNMP agent`|ifInOctets.1<p>Update: 30s</p>|
|Admin Status Port te1/0/1|<p>-</p>|`SNMP agent`|ifAdminStatus.1<p>Update: 30s</p>|
|Traffic incomming Interface te1/0/5|<p>-</p>|`SNMP agent`|ifInOctets.5<p>Update: 30s</p>|
|Traffic outgoing Interface te2/0/6|<p>-</p>|`SNMP agent`|ifOutOctets.58<p>Update: 30s</p>|
|PortSpeed te2/0/5|<p>-</p>|`SNMP agent`|ifSpeed.57<p>Update: 60</p>|
|Admin Status Port te2/0/11|<p>-</p>|`SNMP agent`|ifAdminStatus.63<p>Update: 30s</p>|
|Admin Status Port te2/0/7|<p>-</p>|`SNMP agent`|ifAdminStatus.59<p>Update: 30s</p>|
|Status Port te1/0/7|<p>-</p>|`SNMP agent`|ifOperStatus.7<p>Update: 30s</p>|
|Status Port te1/0/8|<p>-</p>|`SNMP agent`|ifOperStatus.8<p>Update: 30s</p>|
|Status Port te2/0/4|<p>-</p>|`SNMP agent`|ifOperStatus.56<p>Update: 30s</p>|
|MTU Size Interface te2/0/1|<p>-</p>|`SNMP agent`|ifMtu.53<p>Update: 60</p>|
|Traffic outgoing Interface te1/0/12|<p>-</p>|`SNMP agent`|ifOutOctets.12<p>Update: 30s</p>|
|Errors Inbound te1/0/5|<p>-</p>|`SNMP agent`|ifInErrors.5<p>Update: 60</p>|
|PortSpeed te1/0/4|<p>-</p>|`SNMP agent`|ifSpeed.4<p>Update: 60</p>|
|Errors Inbound te1/0/2|<p>-</p>|`SNMP agent`|ifInErrors.2<p>Update: 60</p>|
|MTU Size Interface te1/0/3|<p>-</p>|`SNMP agent`|ifMtu.3<p>Update: 60</p>|
|Errors Outbound Port te1/0/7|<p>-</p>|`SNMP agent`|ifOutErrors.7<p>Update: 60</p>|
|Errors Outbound Port te2/0/3|<p>-</p>|`SNMP agent`|ifOutErrors.55<p>Update: 60</p>|
|Traffic outgoing Interface te1/0/11|<p>-</p>|`SNMP agent`|ifOutOctets.11<p>Update: 30s</p>|
|Traffic outgoing Interface te1/0/5|<p>-</p>|`SNMP agent`|ifOutOctets.5<p>Update: 30s</p>|
|Traffic outgoing Interface te1/0/4|<p>-</p>|`SNMP agent`|ifOutOctets.4<p>Update: 30s</p>|
|Admin Status Port te2/0/8|<p>-</p>|`SNMP agent`|ifAdminStatus.60<p>Update: 30s</p>|
|Fan 02|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109251<p>Update: 600</p>|
|OOB Status MGMT|<p>-</p>|`SNMP agent`|ifOperStatus.1050<p>Update: 30s</p>|
|Traffic outgoing Interface te2/0/12|<p>-</p>|`SNMP agent`|ifOutOctets.64<p>Update: 30s</p>|
|PortSpeed te2/0/3|<p>-</p>|`SNMP agent`|ifSpeed.55<p>Update: 60</p>|
|Errors Inbound te1/0/8|<p>-</p>|`SNMP agent`|ifInErrors.8<p>Update: 60</p>|
|Traffic outgoing Interface te2/0/7|<p>-</p>|`SNMP agent`|ifOutOctets.59<p>Update: 30s</p>|
|Status Port te2/0/12|<p>-</p>|`SNMP agent`|ifOperStatus.64<p>Update: 30s</p>|
|Admin Status Port te1/0/3|<p>-</p>|`SNMP agent`|ifAdminStatus.3<p>Update: 30s</p>|
|Errors Outbound Port te2/0/4|<p>-</p>|`SNMP agent`|ifOutErrors.56<p>Update: 60</p>|
|Traffic outgoing Interface te1/0/1|<p>-</p>|`SNMP agent`|ifOutOctets.1<p>Update: 30s</p>|
|Admin Status Port te2/0/9|<p>-</p>|`SNMP agent`|ifAdminStatus.61<p>Update: 30s</p>|
|PortSpeed te1/0/7|<p>-</p>|`SNMP agent`|ifSpeed.7<p>Update: 60</p>|
|Status Port te2/0/9|<p>-</p>|`SNMP agent`|ifOperStatus.61<p>Update: 30s</p>|
|Status Port te2/0/2|<p>-</p>|`SNMP agent`|ifOperStatus.54<p>Update: 30s</p>|
|MTU Size Interface te2/0/7|<p>-</p>|`SNMP agent`|ifMtu.59<p>Update: 60</p>|
|Admin Status Port te1/0/9|<p>-</p>|`SNMP agent`|ifAdminStatus.9<p>Update: 30s</p>|
|Status Port te2/0/3|<p>-</p>|`SNMP agent`|ifOperStatus.55<p>Update: 30s</p>|
|Errors Outbound Port te2/0/2|<p>-</p>|`SNMP agent`|ifOutErrors.54<p>Update: 60</p>|
|Errors Outbound Port te1/0/11|<p>-</p>|`SNMP agent`|ifOutErrors.11<p>Update: 60</p>|
|PortSpeed te2/0/8|<p>-</p>|`SNMP agent`|ifSpeed.60<p>Update: 60</p>|
|Errors Inbound te1/0/9|<p>-</p>|`SNMP agent`|ifInErrors.9<p>Update: 60</p>|
|Admin Status Port te1/0/10|<p>-</p>|`SNMP agent`|ifAdminStatus.10<p>Update: 30s</p>|
|System Uptime|<p>-</p>|`SNMP agent`|system.uptime<p>Update: 60</p>|
|Errors Inbound te1/0/6|<p>-</p>|`SNMP agent`|ifInErrors.6<p>Update: 60</p>|
|MTU Size Interface te1/0/2|<p>-</p>|`SNMP agent`|ifMtu.2<p>Update: 60</p>|
|MTU Size Interface te1/0/11|<p>-</p>|`SNMP agent`|ifMtu.11<p>Update: 60</p>|
|Traffic incomming Interface te1/0/12|<p>-</p>|`SNMP agent`|ifInOctets.12<p>Update: 30s</p>|
|Status Port te2/0/5|<p>-</p>|`SNMP agent`|ifOperStatus.57<p>Update: 30s</p>|
|Traffic outgoing Interface te1/0/8|<p>-</p>|`SNMP agent`|ifOutOctets.8<p>Update: 30s</p>|
|Errors Inbound te2/0/8|<p>-</p>|`SNMP agent`|ifInErrors.60<p>Update: 60</p>|
|Errors Outbound Port te2/0/7|<p>-</p>|`SNMP agent`|ifOutErrors.59<p>Update: 60</p>|
|Traffic incomming Interface te2/0/10|<p>-</p>|`SNMP agent`|ifInOctets.62<p>Update: 30s</p>|
|Traffic incomming Interface te2/0/5|<p>-</p>|`SNMP agent`|ifInOctets.57<p>Update: 30s</p>|
|Traffic incomming Interface te2/0/8|<p>-</p>|`SNMP agent`|ifInOctets.60<p>Update: 30s</p>|
|Traffic outgoing Interface te2/0/9|<p>-</p>|`SNMP agent`|ifOutOctets.61<p>Update: 30s</p>|
|Traffic outgoing Interface te2/0/10|<p>-</p>|`SNMP agent`|ifOutOctets.62<p>Update: 30s</p>|
|PortSpeed te2/0/1|<p>-</p>|`SNMP agent`|ifSpeed.53<p>Update: 60</p>|
|Errors Inbound te2/0/12|<p>-</p>|`SNMP agent`|ifInErrors.64<p>Update: 60</p>|
|Traffic incomming Interface te1/0/11|<p>-</p>|`SNMP agent`|ifInOctets.11<p>Update: 30s</p>|
|Status Port te1/0/1|<p>-</p>|`SNMP agent`|ifOperStatus.1<p>Update: 30s</p>|
|Status Port te1/0/9|<p>-</p>|`SNMP agent`|ifOperStatus.9<p>Update: 30s</p>|
|MTU Size Interface te2/0/2|<p>-</p>|`SNMP agent`|ifMtu.54<p>Update: 60</p>|
|Errors Inbound te2/0/4|<p>-</p>|`SNMP agent`|ifInErrors.56<p>Update: 60</p>|
|Errors Outbound Port te2/0/1|<p>-</p>|`SNMP agent`|ifOutErrors.53<p>Update: 60</p>|
|Traffic outgoing Interface te2/0/1|<p>-</p>|`SNMP agent`|ifOutOctets.53<p>Update: 30s</p>|
|Errors Outbound Port te2/0/6|<p>-</p>|`SNMP agent`|ifOutErrors.58<p>Update: 60</p>|
|Admin Status Port te2/0/3|<p>-</p>|`SNMP agent`|ifAdminStatus.55<p>Update: 30s</p>|
|MTU Size Interface te1/0/4|<p>-</p>|`SNMP agent`|ifMtu.4<p>Update: 60</p>|
|Admin Status Port te1/0/6|<p>-</p>|`SNMP agent`|ifAdminStatus.6<p>Update: 30s</p>|
|Traffic outgoing Interface te1/0/6|<p>-</p>|`SNMP agent`|ifOutOctets.6<p>Update: 30s</p>|
|Admin Status Port te2/0/2|<p>-</p>|`SNMP agent`|ifAdminStatus.54<p>Update: 30s</p>|
|Errors Outbound Port te2/0/11|<p>-</p>|`SNMP agent`|ifOutErrors.63<p>Update: 60</p>|
|CPU Utilization|<p>-</p>|`SNMP agent`|rlCpuUtilDuringLast5Minutes<p>Update: 30s</p>|
|Errors Outbound Port te2/0/9|<p>-</p>|`SNMP agent`|ifOutErrors.61<p>Update: 60</p>|
|Admin Status Port te2/0/5|<p>-</p>|`SNMP agent`|ifAdminStatus.57<p>Update: 30s</p>|
|PortSpeed te2/0/12|<p>-</p>|`SNMP agent`|ifSpeed.64<p>Update: 60</p>|
|PortSpeed te2/0/2|<p>-</p>|`SNMP agent`|ifSpeed.54<p>Update: 60</p>|
|Traffic outgoing Interface te2/0/2|<p>-</p>|`SNMP agent`|ifOutOctets.54<p>Update: 30s</p>|
|Status Port te2/0/11|<p>-</p>|`SNMP agent`|ifOperStatus.63<p>Update: 30s</p>|
|PortSpeed te1/0/11|<p>-</p>|`SNMP agent`|ifSpeed.11<p>Update: 60</p>|
|MTU Size Interface te2/0/3|<p>-</p>|`SNMP agent`|ifMtu.55<p>Update: 60</p>|
|Traffic incomming Interface te2/0/11|<p>-</p>|`SNMP agent`|ifInOctets.63<p>Update: 30s</p>|
|PortSpeed te1/0/5|<p>-</p>|`SNMP agent`|ifSpeed.5<p>Update: 60</p>|
|Traffic incomming Interface te2/0/2|<p>-</p>|`SNMP agent`|ifInOctets.54<p>Update: 30s</p>|
|Status Port te1/0/10|<p>-</p>|`SNMP agent`|ifOperStatus.10<p>Update: 30s</p>|
|Errors Inbound te2/0/11|<p>-</p>|`SNMP agent`|ifInErrors.63<p>Update: 60</p>|
|Traffic incomming Interface te2/0/4|<p>-</p>|`SNMP agent`|ifInOctets.56<p>Update: 30s</p>|
|MTU Size Interface te2/0/4|<p>-</p>|`SNMP agent`|ifMtu.56<p>Update: 60</p>|
|Errors Inbound te2/0/1|<p>-</p>|`SNMP agent`|ifInErrors.53<p>Update: 60</p>|
|Status Port te1/0/12|<p>-</p>|`SNMP agent`|ifOperStatus.12<p>Update: 30s</p>|
|PortSpeed te2/0/10|<p>-</p>|`SNMP agent`|ifSpeed.62<p>Update: 60</p>|
|Traffic incomming Interface te2/0/6|<p>-</p>|`SNMP agent`|ifInOctets.58<p>Update: 30s</p>|
|Status Port te1/0/2|<p>-</p>|`SNMP agent`|ifOperStatus.2<p>Update: 30s</p>|
|Traffic incomming Interface te2/0/9|<p>-</p>|`SNMP agent`|ifInOctets.61<p>Update: 30s</p>|
|Fan 03|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109252<p>Update: 600</p>|
|Stystem Kontakt|<p>-</p>|`SNMP agent`|SysContact<p>Update: 60</p>|
|MTU Size Interface te2/0/10|<p>-</p>|`SNMP agent`|ifMtu.62<p>Update: 60</p>|
|Traffic outgoing Interface te1/0/2|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 30s</p>|
|Errors Outbound Port te1/0/8|<p>-</p>|`SNMP agent`|ifOutErrors.8<p>Update: 60</p>|
|Status Port te1/0/4|<p>-</p>|`SNMP agent`|ifOperStatus.4<p>Update: 30s</p>|
|PortSpeed te1/0/1|<p>-</p>|`SNMP agent`|ifSpeed.1<p>Update: 60</p>|
|Admin Status Port te2/0/1|<p>-</p>|`SNMP agent`|ifAdminStatus.53<p>Update: 30s</p>|
|PortSpeed te2/0/4|<p>-</p>|`SNMP agent`|ifSpeed.56<p>Update: 60</p>|
|Errors Outbound Port te1/0/5|<p>-</p>|`SNMP agent`|ifOutErrors.5<p>Update: 60</p>|
|Traffic incomming Interface te2/0/12|<p>-</p>|`SNMP agent`|ifInOctets.64<p>Update: 30s</p>|
|PortSpeed te1/0/9|<p>-</p>|`SNMP agent`|ifSpeed.9<p>Update: 60</p>|
|Admin Status Port te2/0/12|<p>-</p>|`SNMP agent`|ifAdminStatus.64<p>Update: 30s</p>|
|MTU Size Interface te1/0/5|<p>-</p>|`SNMP agent`|ifMtu.5<p>Update: 60</p>|
|MTU Size Interface te2/0/6|<p>-</p>|`SNMP agent`|ifMtu.58<p>Update: 60</p>|
|Errors Outbound Port te1/0/2|<p>-</p>|`SNMP agent`|ifOutErrors.2<p>Update: 60</p>|
|Traffic incomming Interface te2/0/3|<p>-</p>|`SNMP agent`|ifInOctets.55<p>Update: 30s</p>|
|Stystem Location|<p>-</p>|`SNMP agent`|SysLocation<p>Update: 60</p>|
|Errors Outbound Port te2/0/5|<p>-</p>|`SNMP agent`|ifOutErrors.57<p>Update: 60</p>|
|PortSpeed te2/0/7|<p>-</p>|`SNMP agent`|ifSpeed.59<p>Update: 60</p>|
|PortSpeed te2/0/6|<p>-</p>|`SNMP agent`|ifSpeed.58<p>Update: 60</p>|
|MTU Size Interface te2/0/8|<p>-</p>|`SNMP agent`|ifMtu.60<p>Update: 60</p>|
|Errors Inbound te1/0/3|<p>-</p>|`SNMP agent`|ifInErrors.3<p>Update: 60</p>|
|Status Port te2/0/6|<p>-</p>|`SNMP agent`|ifOperStatus.58<p>Update: 30s</p>|
|MTU Size Interface te1/0/1|<p>-</p>|`SNMP agent`|ifMtu.1<p>Update: 60</p>|
|Errors Outbound Port te1/0/9|<p>-</p>|`SNMP agent`|ifOutErrors.9<p>Update: 60</p>|
|MTU Size Interface te1/0/12|<p>-</p>|`SNMP agent`|ifMtu.12<p>Update: 60</p>|
|Status Port te1/0/3|<p>-</p>|`SNMP agent`|ifOperStatus.3<p>Update: 30s</p>|
|Status Port te2/0/10|<p>-</p>|`SNMP agent`|ifOperStatus.62<p>Update: 30s</p>|
|Traffic incomming Interface te1/0/8|<p>-</p>|`SNMP agent`|ifInOctets.8<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

