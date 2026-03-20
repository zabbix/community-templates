# XSM SNMP Devices

## Overview

Grettings people, here is an XML template developed by me, to monitoring the all 24 Interfaces, 5 fan cooler, latency, temperature and more from the Cisco SGE2000P switch.


 


The only thing to consider here is, you will need to change the SNMP community set in here, because i made it for the company that i'm working right now


 


c yaa



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Tráfico de Salida GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifOutOctets.11<p>Update: 60</p>|
|Fan 02|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109250<p>Update: 600</p>|
|Estado operacional GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifOperStatus.24<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifOutOctets.8<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifOperStatus.22<p>Update: 60</p>|
|Temperatura|<p>-</p>|`SNMP agent`|entPhySensorValue.68420481<p>Update: 120</p>|
|Tráfico de Salida GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifOutOctets.16<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifOperStatus.19<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifOperStatus.7<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifOutOctets.22<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/10 MTU|<p>-</p>|`SNMP agent`|ifMtu.10<p>Update: 60</p>|
|Velocidad GigaEthernet 0/8|<p>-</p>|`SNMP agent`|ifSpeed.8<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifInErrors.15<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifOperStatus.18<p>Update: 60</p>|
|Fan 03|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109251<p>Update: 600</p>|
|Velocidad GigaEthernet 0/22|<p>-</p>|`SNMP agent`|ifSpeed.22<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifInOctets.22<p>Update: 60</p>|
|Velocidad GigaEthernet 0/12|<p>-</p>|`SNMP agent`|ifSpeed.12<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifInErrors.13<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifOperStatus.15<p>Update: 60</p>|
|Velocidad GigaEthernet 0/1|<p>-</p>|`SNMP agent`|ifSpeed.1<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifOutErrors.17<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifOperStatus.10<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifOutErrors.4<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifInErrors.17<p>Update: 60</p>|
|Ping por Segundo|<p>-</p>|`Simple check`|icmppingsec<p>Update: 30</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifInErrors.8<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifInOctets.16<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifOutErrors.23<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifInErrors.16<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifOutOctets.4<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifOutOctets.21<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifInOctets.18<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifInOctets.10<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifInOctets.12<p>Update: 60</p>|
|Velocidad GigaEthernet 0/10|<p>-</p>|`SNMP agent`|ifSpeed.10<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifOutErrors.15<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifOutOctets.6<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifOutOctets.23<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/4 MTU|<p>-</p>|`SNMP agent`|ifMtu.4<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifOutOctets.13<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifOperStatus.17<p>Update: 60</p>|
|Velocidad GigaEthernet 0/21|<p>-</p>|`SNMP agent`|ifSpeed.21<p>Update: 60</p>|
|Ping|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|
|Velocidad GigaEthernet 0/17|<p>-</p>|`SNMP agent`|ifSpeed.17<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifOutOctets.3<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifInOctets.13<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifInOctets.19<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifOutOctets.12<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifOperStatus.14<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifOperStatus.9<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/6 MTU|<p>-</p>|`SNMP agent`|ifMtu.6<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifOutErrors.5<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifInOctets.1<p>Update: 60</p>|
|Velocidad GigaEthernet 0/23|<p>-</p>|`SNMP agent`|ifSpeed.23<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifInErrors.2<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/12 MTU|<p>-</p>|`SNMP agent`|ifMtu.12<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifInErrors.18<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifOperStatus.8<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifOutOctets.10<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifOutOctets.5<p>Update: 60</p>|
|Velocidad GigaEthernet 0/7|<p>-</p>|`SNMP agent`|ifSpeed.7<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifOperStatus.23<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifOutErrors.9<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifOperStatus.6<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifInOctets.5<p>Update: 60</p>|
|Velocidad GigaEthernet 0/6|<p>-</p>|`SNMP agent`|ifSpeed.6<p>Update: 60</p>|
|Velocidad GigaEthernet 0/4|<p>-</p>|`SNMP agent`|ifSpeed.4<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifInErrors.6<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/3 MTU|<p>-</p>|`SNMP agent`|ifMtu.3<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifOutOctets.24<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifInErrors.9<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifInOctets.24<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifInOctets.6<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/13 MTU|<p>-</p>|`SNMP agent`|ifMtu.13<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/14 MTU|<p>-</p>|`SNMP agent`|ifMtu.14<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifInOctets.23<p>Update: 60</p>|
|Velocidad GigaEthernet 0/11|<p>-</p>|`SNMP agent`|ifSpeed.11<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifOperStatus.2<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifInErrors.24<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifInErrors.19<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifInOctets.20<p>Update: 60</p>|
|Velocidad GigaEthernet 0/15|<p>-</p>|`SNMP agent`|ifSpeed.15<p>Update: 60</p>|
|Velocidad GigaEthernet 0/13|<p>-</p>|`SNMP agent`|ifSpeed.13<p>Update: 60</p>|
|Fan 01|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109249<p>Update: 600</p>|
|Velocidad de puerto GigaEthernet 0/24 MTU|<p>-</p>|`SNMP agent`|ifMtu.24<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/7 MTU|<p>-</p>|`SNMP agent`|ifMtu.7<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifOperStatus.1<p>Update: 60</p>|
|Velocidad GigaEthernet 0/18|<p>-</p>|`SNMP agent`|ifSpeed.18<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifOutOctets.18<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifOperStatus.21<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifOutErrors.7<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifOperStatus.5<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/1 MTU|<p>-</p>|`SNMP agent`|ifMtu.1<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifInErrors.10<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifOutErrors.19<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifOutErrors.10<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifOutErrors.2<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifInErrors.7<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifInErrors.20<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifOperStatus.13<p>Update: 60</p>|
|Velocidad GigaEthernet 0/16|<p>-</p>|`SNMP agent`|ifSpeed.16<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifInOctets.8<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifOutErrors.1<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifOperStatus.4<p>Update: 60</p>|
|Velocidad GigaEthernet 0/24|<p>-</p>|`SNMP agent`|ifSpeed.24<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifInOctets.17<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/11 MTU|<p>-</p>|`SNMP agent`|ifMtu.11<p>Update: 60</p>|
|Fan 05|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109253<p>Update: 600</p>|
|Estado operacional GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifOperStatus.11<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifOutOctets.9<p>Update: 60</p>|
|Velocidad GigaEthernet 0/5|<p>-</p>|`SNMP agent`|ifSpeed.5<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifInErrors.22<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifInOctets.21<p>Update: 60</p>|
|Velocidad GigaEthernet 0/20|<p>-</p>|`SNMP agent`|ifSpeed.20<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifOutErrors.6<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifOutErrors.14<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/5 MTU|<p>-</p>|`SNMP agent`|ifMtu.5<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifOutErrors.18<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifOutOctets.14<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifInErrors.5<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifOutErrors.21<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifInOctets.9<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/2 MTU|<p>-</p>|`SNMP agent`|ifMtu.2<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifOutErrors.12<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifInErrors.1<p>Update: 60</p>|
|Velocidad GigaEthernet 0/14|<p>-</p>|`SNMP agent`|ifSpeed.14<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/23 MTU|<p>-</p>|`SNMP agent`|ifMtu.23<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifInOctets.7<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifOutErrors.22<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifOperStatus.20<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifOutErrors.20<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/21 MTU|<p>-</p>|`SNMP agent`|ifMtu.21<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/16 MTU|<p>-</p>|`SNMP agent`|ifMtu.16<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifInErrors.14<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifOutOctets.17<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifInErrors.11<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifInOctets.15<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/22 MTU|<p>-</p>|`SNMP agent`|ifMtu.22<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifOutOctets.15<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifOperStatus.16<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifInErrors.23<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/18 MTU|<p>-</p>|`SNMP agent`|ifMtu.18<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/8 MTU|<p>-</p>|`SNMP agent`|ifMtu.8<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifInOctets.4<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifOutErrors.8<p>Update: 60</p>|
|Fan 04|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109252<p>Update: 600</p>|
|Tráfico de entrada GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifInOctets.14<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifInOctets.11<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifOutErrors.24<p>Update: 60</p>|
|Tiempo Conectado|<p>-</p>|`SNMP agent`|system.uptime<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifOutErrors.11<p>Update: 60</p>|
|Tráfico de entrada GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifInOctets.3<p>Update: 60</p>|
|Velocidad GigaEthernet 0/2|<p>-</p>|`SNMP agent`|ifSpeed.2<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifOutOctets.20<p>Update: 60</p>|
|Velocidad GigaEthernet 0/19|<p>-</p>|`SNMP agent`|ifSpeed.19<p>Update: 60</p>|
|Velocidad GigaEthernet 0/9|<p>-</p>|`SNMP agent`|ifSpeed.9<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/15 MTU|<p>-</p>|`SNMP agent`|ifMtu.15<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifOutOctets.7<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifInErrors.21<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifOutOctets.19<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifOperStatus.12<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifInErrors.4<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/9 MTU|<p>-</p>|`SNMP agent`|ifMtu.9<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifOutErrors.16<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifOutErrors.3<p>Update: 60</p>|
|Velocidad GigaEthernet 0/3|<p>-</p>|`SNMP agent`|ifSpeed.3<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifOperStatus.3<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/17 MTU|<p>-</p>|`SNMP agent`|ifMtu.17<p>Update: 60</p>|
|Paquetes de salida con errores GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifOutErrors.13<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifInErrors.3<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/19 MTU|<p>-</p>|`SNMP agent`|ifMtu.19<p>Update: 60</p>|
|Tráfico de Salida GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifOutOctets.1<p>Update: 60</p>|
|Velocidad de puerto GigaEthernet 0/20 MTU|<p>-</p>|`SNMP agent`|ifMtu.20<p>Update: 60</p>|
|Paquetes de entrada con errores GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifInErrors.12<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

