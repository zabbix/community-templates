# SGE2010_48P

## Overview

Prezados,


 


Este template e para switch cisco SGE2010 e SGE2010P , caso queira acrescentar mais informações fiquem a vontade , apos este , por gentileza inserir novamente no share do zabbix.


# Este template Monitora:


1- Cooler (FAN), 2- Disponibilidade , 3- Latencia , 4- Pacotes de entrada , 5- Pacotes de Saida , 6- Temperatura , 7- Trafego de entrada , 8- Trafego de saida


 Att:


 Magno Monte Cerqueira


Skype: [magnopeem\_rj@hotmail.com](mailto:magnopeem_rj@hotmail.com)


Linkdln: <https://br.linkedin.com/in/magno-monte-cerqueira-976b1587>


Gmail: [magnopeem@gmail.com](mailto:magnopeem@gmail.com)


 


OBS: Esta licença esta sobre regra do GNU.


 



## Author

Magno Monte Cerqueira "magnopeem"

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Pacotes de saída com erro GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifOutErrors.2<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/44 MTU|<p>-</p>|`SNMP agent`|ifMtu.44<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/48|<p>-</p>|`SNMP agent`|ifInErrors.48<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/27 MTU|<p>-</p>|`SNMP agent`|ifMtu.27<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/28|<p>-</p>|`SNMP agent`|ifInErrors.28<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/41|<p>-</p>|`SNMP agent`|ifOperStatus.41<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifInErrors.17<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/39|<p>-</p>|`SNMP agent`|ifOutErrors.39<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/34|<p>-</p>|`SNMP agent`|ifInErrors.34<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/29 MTU|<p>-</p>|`SNMP agent`|ifMtu.29<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/34 MTU|<p>-</p>|`SNMP agent`|ifMtu.34<p>Update: 60</p>|
|Velocidade GigaEthernet 0/1|<p>-</p>|`SNMP agent`|ifSpeed.1<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/33|<p>-</p>|`SNMP agent`|ifInErrors.33<p>Update: 60</p>|
|Velocidade GigaEthernet 0/48|<p>-</p>|`SNMP agent`|ifSpeed.48<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/37|<p>-</p>|`SNMP agent`|ifInErrors.37<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/18 MTU|<p>-</p>|`SNMP agent`|ifMtu.18<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifOutErrors.20<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/33|<p>-</p>|`SNMP agent`|ifOutErrors.33<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/48 MTU|<p>-</p>|`SNMP agent`|ifMtu.48<p>Update: 60</p>|
|Velocidade GigaEthernet 0/7|<p>-</p>|`SNMP agent`|ifSpeed.7<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/14 MTU|<p>-</p>|`SNMP agent`|ifMtu.14<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/1/1|<p>-</p>|`SNMP agent`|ifInOctets.49<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/28|<p>-</p>|`SNMP agent`|ifInOctets.28<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifOperStatus.3<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifOutOctets.3<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/2 MTU|<p>-</p>|`SNMP agent`|ifMtu.2<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/19 MTU|<p>-</p>|`SNMP agent`|ifMtu.19<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/42|<p>-</p>|`SNMP agent`|ifOutOctets.42<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/16 MTU|<p>-</p>|`SNMP agent`|ifMtu.16<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/35|<p>-</p>|`SNMP agent`|ifOperStatus.35<p>Update: 60</p>|
|Velocidade GigaEthernet 0/34|<p>-</p>|`SNMP agent`|ifSpeed.34<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/31|<p>-</p>|`SNMP agent`|ifOperStatus.31<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/1/4|<p>-</p>|`SNMP agent`|ifOutErrors.52<p>Update: 60</p>|
|Velocidade GigaEthernet 0/20|<p>-</p>|`SNMP agent`|ifSpeed.20<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/28|<p>-</p>|`SNMP agent`|ifOutOctets.28<p>Update: 60</p>|
|Velocidade GigaEthernet 0/44|<p>-</p>|`SNMP agent`|ifSpeed.44<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifInOctets.13<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifOutErrors.8<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifInErrors.22<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifOutErrors.23<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/25|<p>-</p>|`SNMP agent`|ifOutOctets.25<p>Update: 60</p>|
|Fan 03|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109252<p>Update: 600</p>|
|Pacotes de saída com erro GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifOutErrors.21<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/43 MTU|<p>-</p>|`SNMP agent`|ifMtu.43<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/4 MTU|<p>-</p>|`SNMP agent`|ifMtu.4<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/22 MTU|<p>-</p>|`SNMP agent`|ifMtu.22<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/5 MTU|<p>-</p>|`SNMP agent`|ifMtu.5<p>Update: 60</p>|
|Velocidade GigaEthernet 0/10|<p>-</p>|`SNMP agent`|ifSpeed.10<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifOutOctets.10<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/48|<p>-</p>|`SNMP agent`|ifOutOctets.48<p>Update: 60</p>|
|Velocidade GigaEthernet 0/40|<p>-</p>|`SNMP agent`|ifSpeed.40<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/35|<p>-</p>|`SNMP agent`|ifInErrors.35<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifInErrors.21<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifInOctets.18<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/11 MTU|<p>-</p>|`SNMP agent`|ifMtu.11<p>Update: 60</p>|
|Velocidade GigaEthernet 0/14|<p>-</p>|`SNMP agent`|ifSpeed.14<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/20 MTU|<p>-</p>|`SNMP agent`|ifMtu.20<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/34|<p>-</p>|`SNMP agent`|ifOperStatus.34<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifInErrors.10<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifOutErrors.18<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/36 MTU|<p>-</p>|`SNMP agent`|ifMtu.36<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifInOctets.12<p>Update: 60</p>|
|Velocidade GigaEthernet 0/39|<p>-</p>|`SNMP agent`|ifSpeed.39<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/36|<p>-</p>|`SNMP agent`|ifOutErrors.36<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/45|<p>-</p>|`SNMP agent`|ifOutOctets.45<p>Update: 60</p>|
|Velocidade GigaEthernet 0/47|<p>-</p>|`SNMP agent`|ifSpeed.47<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/28|<p>-</p>|`SNMP agent`|ifOutErrors.28<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifOutOctets.17<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/34|<p>-</p>|`SNMP agent`|ifInOctets.34<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifOutErrors.11<p>Update: 60</p>|
|Velocidade GigaEthernet 0/43|<p>-</p>|`SNMP agent`|ifSpeed.43<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/31|<p>-</p>|`SNMP agent`|ifOutOctets.31<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/48|<p>-</p>|`SNMP agent`|ifOperStatus.48<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/1/2|<p>-</p>|`SNMP agent`|ifOutErrors.50<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifOutErrors.24<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/43|<p>-</p>|`SNMP agent`|ifOutErrors.43<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifOperStatus.8<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/36|<p>-</p>|`SNMP agent`|ifInOctets.36<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/1/4|<p>-</p>|`SNMP agent`|ifInOctets.52<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/30|<p>-</p>|`SNMP agent`|ifOperStatus.30<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/32|<p>-</p>|`SNMP agent`|ifInOctets.32<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/1/1|<p>-</p>|`SNMP agent`|ifOutOctets.49<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/30|<p>-</p>|`SNMP agent`|ifOutOctets.30<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifOutOctets.23<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/33|<p>-</p>|`SNMP agent`|ifOutOctets.33<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifInOctets.8<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/1/2|<p>-</p>|`SNMP agent`|ifInOctets.50<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifOperStatus.17<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/42|<p>-</p>|`SNMP agent`|ifInErrors.42<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifOperStatus.15<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/39 MTU|<p>-</p>|`SNMP agent`|ifMtu.39<p>Update: 60</p>|
|Velocidade GigaEthernet 0/4|<p>-</p>|`SNMP agent`|ifSpeed.4<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifOutOctets.1<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifOperStatus.2<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/43|<p>-</p>|`SNMP agent`|ifInErrors.43<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/43|<p>-</p>|`SNMP agent`|ifInOctets.43<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifOutErrors.22<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/31|<p>-</p>|`SNMP agent`|ifInErrors.31<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/41 MTU|<p>-</p>|`SNMP agent`|ifMtu.41<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/47|<p>-</p>|`SNMP agent`|ifOperStatus.47<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/33 MTU|<p>-</p>|`SNMP agent`|ifMtu.33<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/32|<p>-</p>|`SNMP agent`|ifOperStatus.32<p>Update: 60</p>|
|Velocidade GigaEthernet 0/31|<p>-</p>|`SNMP agent`|ifSpeed.31<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/38|<p>-</p>|`SNMP agent`|ifOutErrors.38<p>Update: 60</p>|
|Velocidade GigaEthernet 0/23|<p>-</p>|`SNMP agent`|ifSpeed.23<p>Update: 60</p>|
|Velocidade GigaEthernet 0/46|<p>-</p>|`SNMP agent`|ifSpeed.46<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifOutErrors.19<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/40|<p>-</p>|`SNMP agent`|ifOperStatus.40<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/23 MTU|<p>-</p>|`SNMP agent`|ifMtu.23<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/12 MTU|<p>-</p>|`SNMP agent`|ifMtu.12<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifInOctets.20<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifInErrors.11<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifOutErrors.17<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifInErrors.18<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifOperStatus.19<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifInErrors.13<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/1 MTU|<p>-</p>|`SNMP agent`|ifMtu.1<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifInOctets.15<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifInOctets.23<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifOutErrors.6<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/8 MTU|<p>-</p>|`SNMP agent`|ifMtu.8<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifOperStatus.9<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifOutOctets.13<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/36|<p>-</p>|`SNMP agent`|ifOutOctets.36<p>Update: 60</p>|
|Velocidade GigaEthernet 0/24|<p>-</p>|`SNMP agent`|ifSpeed.24<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/46|<p>-</p>|`SNMP agent`|ifOperStatus.46<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/42|<p>-</p>|`SNMP agent`|ifOperStatus.42<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifOutOctets.18<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifOperStatus.23<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/26 MTU|<p>-</p>|`SNMP agent`|ifMtu.26<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifInErrors.15<p>Update: 60</p>|
|Velocidade GigaEthernet 0/8|<p>-</p>|`SNMP agent`|ifSpeed.8<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifOutOctets.7<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifOperStatus.22<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/25|<p>-</p>|`SNMP agent`|ifInErrors.25<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifOperStatus.1<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifInOctets.22<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifOutErrors.7<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifOperStatus.20<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/45|<p>-</p>|`SNMP agent`|ifOutErrors.45<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifOperStatus.13<p>Update: 60</p>|
|Temperatura|<p>-</p>|`SNMP agent`|entPhySensorValue.68420481<p>Update: 120</p>|
|Velocidade GigaEthernet 0/42|<p>-</p>|`SNMP agent`|ifSpeed.42<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/43|<p>-</p>|`SNMP agent`|ifOutOctets.43<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifOutErrors.5<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifOperStatus.24<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/30|<p>-</p>|`SNMP agent`|ifOutErrors.30<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/32|<p>-</p>|`SNMP agent`|ifOutErrors.32<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/26|<p>-</p>|`SNMP agent`|ifInOctets.26<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifInOctets.24<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifOutOctets.19<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifOperStatus.21<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifInErrors.20<p>Update: 60</p>|
|Velocidade GigaEthernet 0/16|<p>-</p>|`SNMP agent`|ifSpeed.16<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/26|<p>-</p>|`SNMP agent`|ifOutOctets.26<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifInOctets.5<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifOperStatus.14<p>Update: 60</p>|
|Velocidade GigaEthernet 0/13|<p>-</p>|`SNMP agent`|ifSpeed.13<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifOutErrors.4<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/44|<p>-</p>|`SNMP agent`|ifOperStatus.44<p>Update: 60</p>|
|Velocidade GigaEthernet 0/2|<p>-</p>|`SNMP agent`|ifSpeed.2<p>Update: 60</p>|
|Velocidade GigaEthernet 0/32|<p>-</p>|`SNMP agent`|ifSpeed.32<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/41|<p>-</p>|`SNMP agent`|ifInErrors.41<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/38|<p>-</p>|`SNMP agent`|ifOutOctets.38<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/27|<p>-</p>|`SNMP agent`|ifOperStatus.27<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifOutOctets.21<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/30|<p>-</p>|`SNMP agent`|ifInErrors.30<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/7 MTU|<p>-</p>|`SNMP agent`|ifMtu.7<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifOutOctets.15<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifOutOctets.16<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/46|<p>-</p>|`SNMP agent`|ifOutErrors.46<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifOutErrors.12<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/29|<p>-</p>|`SNMP agent`|ifInErrors.29<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifInErrors.8<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifInOctets.16<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifInOctets.10<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/25|<p>-</p>|`SNMP agent`|ifOperStatus.25<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/47|<p>-</p>|`SNMP agent`|ifInErrors.47<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifOperStatus.7<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/42|<p>-</p>|`SNMP agent`|ifInOctets.42<p>Update: 60</p>|
|Velocidade GigaEthernet 0/3|<p>-</p>|`SNMP agent`|ifSpeed.3<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/48|<p>-</p>|`SNMP agent`|ifInOctets.48<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifInOctets.9<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifInErrors.2<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/22|<p>-</p>|`SNMP agent`|ifOutOctets.22<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifOutOctets.11<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/32|<p>-</p>|`SNMP agent`|ifInErrors.32<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/41|<p>-</p>|`SNMP agent`|ifOutErrors.41<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/34|<p>-</p>|`SNMP agent`|ifOutOctets.34<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/33|<p>-</p>|`SNMP agent`|ifOperStatus.33<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifInOctets.4<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/39|<p>-</p>|`SNMP agent`|ifInOctets.39<p>Update: 60</p>|
|Velocidade GigaEthernet 0/21|<p>-</p>|`SNMP agent`|ifSpeed.21<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/38|<p>-</p>|`SNMP agent`|ifOperStatus.38<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifOutOctets.14<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifInErrors.19<p>Update: 60</p>|
|Velocidade GigaEthernet 0/36|<p>-</p>|`SNMP agent`|ifSpeed.36<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifOutErrors.10<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/27|<p>-</p>|`SNMP agent`|ifInErrors.27<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/46 MTU|<p>-</p>|`SNMP agent`|ifMtu.46<p>Update: 60</p>|
|Velocidade GigaEthernet 0/17|<p>-</p>|`SNMP agent`|ifSpeed.17<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/33|<p>-</p>|`SNMP agent`|ifInOctets.33<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/39|<p>-</p>|`SNMP agent`|ifOperStatus.39<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifInErrors.14<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/17|<p>-</p>|`SNMP agent`|ifInOctets.17<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/08|<p>-</p>|`SNMP agent`|ifOutOctets.8<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/32|<p>-</p>|`SNMP agent`|ifOutOctets.32<p>Update: 60</p>|
|Velocidade GigaEthernet 0/33|<p>-</p>|`SNMP agent`|ifSpeed.33<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifOutErrors.9<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/1/2|<p>-</p>|`SNMP agent`|ifOutOctets.50<p>Update: 60</p>|
|Velocidade GigaEthernet 0/22|<p>-</p>|`SNMP agent`|ifSpeed.22<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/40|<p>-</p>|`SNMP agent`|ifInOctets.40<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/10 MTU|<p>-</p>|`SNMP agent`|ifMtu.10<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/42|<p>-</p>|`SNMP agent`|ifOutErrors.42<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifOutOctets.12<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/35|<p>-</p>|`SNMP agent`|ifOutOctets.35<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/28 MTU|<p>-</p>|`SNMP agent`|ifMtu.28<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/46|<p>-</p>|`SNMP agent`|ifOutOctets.46<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/6 MTU|<p>-</p>|`SNMP agent`|ifMtu.6<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/18|<p>-</p>|`SNMP agent`|ifOperStatus.18<p>Update: 60</p>|
|Tempo Ligado|<p>-</p>|`SNMP agent`|system.uptime<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/1/4|<p>-</p>|`SNMP agent`|ifOutOctets.52<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/35|<p>-</p>|`SNMP agent`|ifOutErrors.35<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/31 MTU|<p>-</p>|`SNMP agent`|ifMtu.31<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/36|<p>-</p>|`SNMP agent`|ifOperStatus.36<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifOutErrors.16<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/46|<p>-</p>|`SNMP agent`|ifInErrors.46<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/25 MTU|<p>-</p>|`SNMP agent`|ifMtu.25<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/1/3|<p>-</p>|`SNMP agent`|ifOutOctets.51<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifInOctets.7<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/27|<p>-</p>|`SNMP agent`|ifInOctets.27<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifOutOctets.9<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifOperStatus.6<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifOperStatus.12<p>Update: 60</p>|
|Velocidade GigaEthernet 0/45|<p>-</p>|`SNMP agent`|ifSpeed.45<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/25|<p>-</p>|`SNMP agent`|ifOutErrors.25<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/28|<p>-</p>|`SNMP agent`|ifOperStatus.28<p>Update: 60</p>|
|Velocidade GigaEthernet 0/27|<p>-</p>|`SNMP agent`|ifSpeed.27<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/31|<p>-</p>|`SNMP agent`|ifOutErrors.31<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/17 MTU|<p>-</p>|`SNMP agent`|ifMtu.17<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/47|<p>-</p>|`SNMP agent`|ifInOctets.47<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/40|<p>-</p>|`SNMP agent`|ifInErrors.40<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/30 MTU|<p>-</p>|`SNMP agent`|ifMtu.30<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/38 MTU|<p>-</p>|`SNMP agent`|ifMtu.38<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/34|<p>-</p>|`SNMP agent`|ifOutErrors.34<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifOutOctets.24<p>Update: 60</p>|
|Velocidade GigaEthernet 0/35|<p>-</p>|`SNMP agent`|ifSpeed.35<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/37|<p>-</p>|`SNMP agent`|ifOperStatus.37<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/23|<p>-</p>|`SNMP agent`|ifInErrors.23<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/46|<p>-</p>|`SNMP agent`|ifInOctets.46<p>Update: 60</p>|
|Velocidade GigaEthernet 0/37|<p>-</p>|`SNMP agent`|ifSpeed.37<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifOutOctets.6<p>Update: 60</p>|
|Velocidade GigaEthernet 0/30|<p>-</p>|`SNMP agent`|ifSpeed.30<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/29|<p>-</p>|`SNMP agent`|ifOutOctets.29<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifOutErrors.1<p>Update: 60</p>|
|Velocidade GigaEthernet 0/11|<p>-</p>|`SNMP agent`|ifSpeed.11<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/39|<p>-</p>|`SNMP agent`|ifInErrors.39<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifOperStatus.11<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/43|<p>-</p>|`SNMP agent`|ifOperStatus.43<p>Update: 60</p>|
|Velocidade GigaEthernet 0/38|<p>-</p>|`SNMP agent`|ifSpeed.38<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/09|<p>-</p>|`SNMP agent`|ifInErrors.9<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/1/3|<p>-</p>|`SNMP agent`|ifOutErrors.51<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/42 MTU|<p>-</p>|`SNMP agent`|ifMtu.42<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/27|<p>-</p>|`SNMP agent`|ifOutOctets.27<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/37|<p>-</p>|`SNMP agent`|ifInOctets.37<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/37|<p>-</p>|`SNMP agent`|ifOutErrors.37<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/36|<p>-</p>|`SNMP agent`|ifInErrors.36<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifInOctets.6<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/47 MTU|<p>-</p>|`SNMP agent`|ifMtu.47<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/35|<p>-</p>|`SNMP agent`|ifInOctets.35<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifOperStatus.16<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifInErrors.1<p>Update: 60</p>|
|Fan 02|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109251<p>Update: 600</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifInErrors.4<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/40|<p>-</p>|`SNMP agent`|ifOutOctets.40<p>Update: 60</p>|
|Velocidade GigaEthernet 0/28|<p>-</p>|`SNMP agent`|ifSpeed.28<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifOperStatus.5<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/37|<p>-</p>|`SNMP agent`|ifOutOctets.37<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/27|<p>-</p>|`SNMP agent`|ifOutErrors.27<p>Update: 60</p>|
|Velocidade GigaEthernet 0/41|<p>-</p>|`SNMP agent`|ifSpeed.41<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/25|<p>-</p>|`SNMP agent`|ifInOctets.25<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/20|<p>-</p>|`SNMP agent`|ifOutOctets.20<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifOutErrors.14<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/29|<p>-</p>|`SNMP agent`|ifOutErrors.29<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/45|<p>-</p>|`SNMP agent`|ifOperStatus.45<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/15 MTU|<p>-</p>|`SNMP agent`|ifMtu.15<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/37 MTU|<p>-</p>|`SNMP agent`|ifMtu.37<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/21 MTU|<p>-</p>|`SNMP agent`|ifMtu.21<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/41|<p>-</p>|`SNMP agent`|ifInOctets.41<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/47|<p>-</p>|`SNMP agent`|ifOutErrors.47<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/35 MTU|<p>-</p>|`SNMP agent`|ifMtu.35<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/39|<p>-</p>|`SNMP agent`|ifOutOctets.39<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/26|<p>-</p>|`SNMP agent`|ifOperStatus.26<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/31|<p>-</p>|`SNMP agent`|ifInOctets.31<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/10|<p>-</p>|`SNMP agent`|ifOperStatus.10<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/48|<p>-</p>|`SNMP agent`|ifOutErrors.48<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/40|<p>-</p>|`SNMP agent`|ifOutErrors.40<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifOperStatus.4<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifInErrors.5<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/3 MTU|<p>-</p>|`SNMP agent`|ifMtu.3<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/15|<p>-</p>|`SNMP agent`|ifOutErrors.15<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/44|<p>-</p>|`SNMP agent`|ifOutOctets.44<p>Update: 60</p>|
|Velocidade GigaEthernet 0/6|<p>-</p>|`SNMP agent`|ifSpeed.6<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/38|<p>-</p>|`SNMP agent`|ifInOctets.38<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/1/3|<p>-</p>|`SNMP agent`|ifInOctets.51<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/38|<p>-</p>|`SNMP agent`|ifInErrors.38<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/45 MTU|<p>-</p>|`SNMP agent`|ifMtu.45<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/30|<p>-</p>|`SNMP agent`|ifInOctets.30<p>Update: 60</p>|
|Fan 01|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109250<p>Update: 600</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/07|<p>-</p>|`SNMP agent`|ifInErrors.7<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/45|<p>-</p>|`SNMP agent`|ifInErrors.45<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/9 MTU|<p>-</p>|`SNMP agent`|ifMtu.9<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/47|<p>-</p>|`SNMP agent`|ifOutOctets.47<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/21|<p>-</p>|`SNMP agent`|ifInOctets.21<p>Update: 60</p>|
|Velocidade GigaEthernet 0/9|<p>-</p>|`SNMP agent`|ifSpeed.9<p>Update: 60</p>|
|Velocidade GigaEthernet 0/25|<p>-</p>|`SNMP agent`|ifSpeed.25<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/24|<p>-</p>|`SNMP agent`|ifInErrors.24<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/44|<p>-</p>|`SNMP agent`|ifInErrors.44<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/12|<p>-</p>|`SNMP agent`|ifInErrors.12<p>Update: 60</p>|
|Velocidade GigaEthernet 0/26|<p>-</p>|`SNMP agent`|ifSpeed.26<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/32 MTU|<p>-</p>|`SNMP agent`|ifMtu.32<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/1/1|<p>-</p>|`SNMP agent`|ifOutErrors.49<p>Update: 60</p>|
|Ping por Segundo|<p>-</p>|`Simple check`|icmppingsec<p>Update: 30</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifInErrors.3<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/02|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 60</p>|
|Ping|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|
|Velocidade GigaEthernet 0/29|<p>-</p>|`SNMP agent`|ifSpeed.29<p>Update: 60</p>|
|Velocidade GigaEthernet 0/18|<p>-</p>|`SNMP agent`|ifSpeed.18<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/26|<p>-</p>|`SNMP agent`|ifInErrors.26<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/41|<p>-</p>|`SNMP agent`|ifOutOctets.41<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/29|<p>-</p>|`SNMP agent`|ifInOctets.29<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifInOctets.3<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/14|<p>-</p>|`SNMP agent`|ifInOctets.14<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/24 MTU|<p>-</p>|`SNMP agent`|ifMtu.24<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/19|<p>-</p>|`SNMP agent`|ifInOctets.19<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/44|<p>-</p>|`SNMP agent`|ifInOctets.44<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/04|<p>-</p>|`SNMP agent`|ifOutOctets.4<p>Update: 60</p>|
|Velocidade GigaEthernet 0/19|<p>-</p>|`SNMP agent`|ifSpeed.19<p>Update: 60</p>|
|Velocidade GigaEthernet 0/12|<p>-</p>|`SNMP agent`|ifSpeed.12<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/11|<p>-</p>|`SNMP agent`|ifInOctets.11<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/13|<p>-</p>|`SNMP agent`|ifOutErrors.13<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet1/0/05|<p>-</p>|`SNMP agent`|ifOutOctets.5<p>Update: 60</p>|
|Velocidade GigaEthernet 0/5|<p>-</p>|`SNMP agent`|ifSpeed.5<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/45|<p>-</p>|`SNMP agent`|ifInOctets.45<p>Update: 60</p>|
|Tráfego de entrada GigabitEthernet1/0/01|<p>-</p>|`SNMP agent`|ifInOctets.1<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/40 MTU|<p>-</p>|`SNMP agent`|ifMtu.40<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/03|<p>-</p>|`SNMP agent`|ifOutErrors.3<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/13 MTU|<p>-</p>|`SNMP agent`|ifMtu.13<p>Update: 60</p>|
|Estado operacional GigabitEthernet1/0/29|<p>-</p>|`SNMP agent`|ifOperStatus.29<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/06|<p>-</p>|`SNMP agent`|ifInErrors.6<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/26|<p>-</p>|`SNMP agent`|ifOutErrors.26<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet1/0/44|<p>-</p>|`SNMP agent`|ifOutErrors.44<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet1/0/16|<p>-</p>|`SNMP agent`|ifInErrors.16<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

