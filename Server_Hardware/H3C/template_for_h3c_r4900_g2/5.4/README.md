# H3C_basic_momitoring_G2

## Overview

通过SNMP监控H3C HDM的模板，适用的服务器机型为R4900 G2, 在HDM 1.03.19版本上进行了验证。支持获取信息有入风口温度、HDM版本号、BIOS版本号、处理器健康状态、风扇健康状态、PCIe模块的状态、电源健康状态、厂商名称、产品名称。  
  
Monitoring H3C HDM template through SNMP, and the applicable server model is R4900 G2, which is verified on HDM version 1.03.19. Support to obtain information including Inlet Temp, HDM Version, BIOS Version, Health Status of Processor, Health Status of Fan, Status of the PCIe Module, Health status of Power, Manufactory name, Product name.



## Author

H3C

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|hh3cManufactory|<p>-</p>|`SNMP agent`|hh3cManufactory<p>Update: 1m</p>|
|hh3cSrvName|<p>-</p>|`SNMP agent`|hh3cSrvName<p>Update: 1m</p>|
|hh3cPCIeCardStatus|<p>PCIE</p>|`SNMP agent`|hh3cPCIeCardStatus<p>Update: 1m</p>|
|h3cSrvBiosVersion|<p>-</p>|`SNMP agent`|h3cSrvBiosVersion<p>Update: 1m</p>|
|hh3cSrvHdmVersion|<p>-</p>|`SNMP agent`|hh3cSrvHdmVersion<p>Update: 1m</p>|
|hh3cFanHealthStatus|<p>-</p>|`SNMP agent`|hh3cFanHealthStatus<p>Update: 1m</p>|
|hh3cPwrHealthStatus|<p>-</p>|`SNMP agent`|hh3cPwrHealthStatus<p>Update: 1m</p>|
|hh3cCPUHealthStatus|<p>-</p>|`SNMP agent`|hh3cCPUHealthStatus<p>Update: 1m</p>|
|hh3cSensorServerityLevel_Inlet Temp|<p>-</p>|`SNMP agent`|hh3cSensorServerityLevel_Inlet_Temp<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

