# Blank AMD

## Description

This is a Blank AMD template

## Overview

A Zabbix template that monitors AMD GPUs by doing WMI.get calls to open hardware monitor running on the mining rig. This has the wmi.get calls for Temperature, Load and Fan. Has triggers for Temperature and Load. Has Graphs for individual GPUs show Temperature, Load and Fan Speed.   
  
Intended for mining monitoring.


 


 


Tested on Zabbix-server 3.4 on a Ubuntu 16.04.3 LTS. Agents were tested on Windows 10



## Author

derpaherk

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPU 1 Fan|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/6" and SensorType="Control"]<p>Update: 60</p>|
|GPU 3 Fan|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/18" and SensorType="Control"]<p>Update: 60</p>|
|GPU 0 Fan|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/0" and SensorType="Control"]<p>Update: 60</p>|
|GPU 0 Load|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/0" and SensorType="Load"]<p>Update: 60</p>|
|GPU 2 Temp|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/12" and SensorType="Temperature"]<p>Update: 60</p>|
|GPU 3 Load|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/18" and SensorType="Load"]<p>Update: 60</p>|
|GPU 0 Temp|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/0" and SensorType="Temperature"]<p>Update: 60</p>|
|GPU 1 Load|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/6" and SensorType="Load"]<p>Update: 60</p>|
|GPU 2 Load|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/12" and SensorType="Load"]<p>Update: 60</p>|
|GPU 3 Temp|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/18" and SensorType="Temperature"]<p>Update: 60</p>|
|GPU 2 Fan|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/12" and SensorType="Control"]<p>Update: 60</p>|
|GPU 1 Temp|<p>-</p>|`Zabbix agent`|wmi.get[root\openhardwaremonitor,SELECT Value FROM Sensor WHERE Parent="/atigpu/6" and SensorType="Temperature"]<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

