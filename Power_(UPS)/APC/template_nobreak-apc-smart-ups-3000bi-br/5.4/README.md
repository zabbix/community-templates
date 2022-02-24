# Nobreak-APC-SMART-UPS-3000BI-BR

## Description

## In English: Template for Zabbix 3.4 and above. Collects and displays information about voltage, current, power, status, temperature, and battery usage. UPS MIB: http://www.oidview.com/mibs/0/UPS-MIB.html Software SGM Auto-Shutdown V4.1: http://www.apc.com/shop/br/pt/products/Software-SGM-Auto-Shutdown-V4-1-para-Linux-s%C3%B3-Brasil-/P-SFSGM41L?isCurrentSite=true --------- ## Em Português: Template para Zabbix 3.4 ou superior. Coleta e exibe informações da tensão, corrente, potência, status, temperatura e uso da bateria. UPS MIB: http://www.oidview.com/mibs/0/UPS-MIB.html Software SGM Auto-Shutdown V4.1: http://www.apc.com/shop/br/pt/products/Software-SGM-Auto-Shutdown-V4-1-para-Linux-s%C3%B3-Brasil-/P-SFSGM41L?isCurrentSite=true --------- ## Developed by: * Victor Igor (victor.igor.redes@gmail.com), sysadmin; * Aécio Pires (http://aeciopires.com), sysadmin. Shared by **Dynavideo** (http://www.dynavideo.com.br)

## Overview

**## In English:**


Template for Zabbix 3.4 and above.


Collects and displays information about voltage, current, power, status, temperature, and battery usage.


UPS MIB: <http://www.oidview.com/mibs/0/UPS-MIB.html>


Software SGM Auto-Shutdown V4.1:


<http://www.apc.com/shop/br/pt/products/Software-SGM-Auto-Shutdown-V4-1-para-Linux-s%C3%B3-Brasil-/P-SFSGM41L?isCurrentSite=true>


Dashboard Grafana: <https://grafana.com/dashboards/3926>


---------


**## Em Português:**


Template para Zabbix 3.4 ou superior.


Coleta e exibe informações da tensão, corrente, potência, status, temperatura e uso da bateria.


UPS MIB: <http://www.oidview.com/mibs/0/UPS-MIB.html>


Software SGM Auto-Shutdown V4.1:


<http://www.apc.com/shop/br/pt/products/Software-SGM-Auto-Shutdown-V4-1-para-Linux-s%C3%B3-Brasil-/P-SFSGM41L?isCurrentSite=true>


Dashboard Grafana: <https://grafana.com/dashboards/3926>


---------


**## Developed by:**


* Victor Igor (victor.igor.redes@gmail.com), sysadmin;


* Aécio Pires (<http://aeciopires.com>), sysadmin.


Shared by **Dynavideo** (<http://www.dynavideo.com.br>)



## Author

Aécio Pires e Victor Igor

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|upsBatteryTemperature|<p>-</p>|`SNMP agent`|upsBatteryTemperature<p>Update: 10s</p>|
|upsOutputCurrent|<p>-</p>|`SNMP agent`|upsOutputCurrent<p>Update: 10s</p>|
|upsOutputVoltage|<p>-</p>|`SNMP agent`|upsOutputVoltage<p>Update: 10s</p>|
|upsInputLineBads|<p>-</p>|`SNMP agent`|upsInputLineBads<p>Update: 30s</p>|
|upsConfigInputVoltage|<p>-</p>|`SNMP agent`|upsConfigInputVoltage<p>Update: 30s</p>|
|Real Data at BatteryCurrent|<p>-</p>|`Calculated`|RealDataBatteryCurrent<p>Update: 10s</p>|
|upsEstimatedMinutesRemaining|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 10s</p>|
|Real Data at InputCurrent|<p>-</p>|`Calculated`|RealDataInputCurrent<p>Update: 10s</p>|
|Real Data at BatteryVoltage|<p>-</p>|`Calculated`|RealDataBatteryVoltage<p>Update: 10s</p>|
|upsInputVoltage|<p>-</p>|`SNMP agent`|upsInputVoltage<p>Update: 10s</p>|
|upsBatteryCurrent|<p>-</p>|`SNMP agent`|upsBatteryCurrent<p>Update: 10s</p>|
|Real Data at OutputFrequency|<p>-</p>|`Calculated`|RealDataOutputFrequency<p>Update: 10s</p>|
|Real Data at InputFrequency|<p>-</p>|`Calculated`|RealDataInputFrequency<p>Update: 10s</p>|
|upsOutputFrequency|<p>-</p>|`SNMP agent`|upsOutputFrequency<p>Update: 10s</p>|
|upsInputCurrent|<p>-</p>|`SNMP agent`|upsInputCurrent<p>Update: 10s</p>|
|upsOutputPercentLoad|<p>-</p>|`SNMP agent`|upsOutputPercentLoad<p>Update: 10s</p>|
|upsOutputPower|<p>-</p>|`SNMP agent`|upsOutputPower<p>Update: 10s</p>|
|Battery Status|<p>-</p>|`SNMP agent`|upsBatteryStatus<p>Update: 60s</p>|
|upsBatteryVoltage|<p>-</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 10s</p>|
|upsInputFrequency|<p>-</p>|`SNMP agent`|upsInputFrequency<p>Update: 10s</p>|


## Triggers

There are no triggers in this template.

