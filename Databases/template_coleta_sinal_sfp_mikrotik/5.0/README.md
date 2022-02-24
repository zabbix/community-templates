# Sinal SFP Mikrotik

## Description

Igor Dib

## Overview

segue template para coletar sinal SFP no mikrotik, criar um expressão regular com nome   
**EXCLUSAO\_ETHER-SINAL SFP**  
**Resultado VERDADEIRA ^sfp**  
**Resultado é FALSO ^NULLO$**   
para o discovery achar somente as SFP, assim não ira criar gráficos de ether.


 


espero que ajudem o pessoal 


Abrass a todos


Igor Dib.



## Author

Igor Dib

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces Discovery|<p>-</p>|`SNMP agent`|net.if2.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interface {#IFNAME}({#IFALIAS}): RX Power|<p>-</p>|`SNMP agent`|enterprises.[RXenterprises.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): TX Power|<p>-</p>|`SNMP agent`|enterprises.[TXenterprises.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): Sinal RX Está acima de -25dBm|<p>-</p>|<p>**Expression**: {Sinal SFP Mikrotik:enterprises.[RXenterprises.{#SNMPINDEX}].prev()}<-25.</p><p>**Recovery expression**: {Sinal SFP Mikrotik:enterprises.[RXenterprises.{#SNMPINDEX}].prev()}>-25.</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Sinal TX Está acima de -25dBm|<p>-</p>|<p>**Expression**: {Sinal SFP Mikrotik:enterprises.[TXenterprises.{#SNMPINDEX}].prev()}<-25</p><p>**Recovery expression**: {Sinal SFP Mikrotik:enterprises.[TXenterprises.{#SNMPINDEX}].prev()}>-25</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Sinal RX Está acima de -25dBm (LLD)|<p>-</p>|<p>**Expression**: {Sinal SFP Mikrotik:enterprises.[RXenterprises.{#SNMPINDEX}].prev()}<-25.</p><p>**Recovery expression**: {Sinal SFP Mikrotik:enterprises.[RXenterprises.{#SNMPINDEX}].prev()}>-25.</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Sinal TX Está acima de -25dBm (LLD)|<p>-</p>|<p>**Expression**: {Sinal SFP Mikrotik:enterprises.[TXenterprises.{#SNMPINDEX}].prev()}<-25</p><p>**Recovery expression**: {Sinal SFP Mikrotik:enterprises.[TXenterprises.{#SNMPINDEX}].prev()}>-25</p>|warning|
