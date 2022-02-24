# iNode-Sense

## Description

byS

## Overview

Sorry, but in Russian



## Author

Sof

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Статус датчика тока|<p>Power sensor current alarm status</p>|`SNMP agent`|pSensorCurrentAlarmStatus<p>Update: 1m</p>|
|Дисбаланс токов фазы L3|<p>Power sensor current disbalance from average 3-phase current (от среднего тока фаз)</p>|`SNMP agent`|pSensorCurrentDisbalanceX10PL3<p>Update: 1m</p>|
|Реактивная мощность фазы L1|<p>Power sensor reactive power</p>|`SNMP agent`|pSensorReactivePowerX1000L1<p>Update: 1m</p>|
|Реактивная мощность фаз L1-3|<p>Power sensor reactive power</p>|`SNMP agent`|pSensorReactivePowerX1000L1-3<p>Update: 1m</p>|
|Device SNMP availability|<p>SNMP service availability</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 5m</p>|
|Частота тока сети|<p>Power sensor frequency</p>|`SNMP agent`|pSensorFrequencyX100<p>Update: 1m</p>|
|Коэфф. искажения напр. фазы L3|<p>Power sensor voltage factor</p>|`SNMP agent`|pSensorVoltageFactorX100L3<p>Update: 1m</p>|
|Дисбаланс токов фазы L2|<p>Power sensor current disbalance from average 3-phase current (от среднего тока фаз)</p>|`SNMP agent`|pSensorCurrentDisbalanceX10PL2<p>Update: 1m</p>|
|Активная мощность фаз L1-3|<p>Power sensor real power</p>|`SNMP agent`|pSensorRealPowerX1000L1-3<p>Update: 1m</p>|
|Коэфф. мощности нагрузки фазы L1|<p>Power sensor power factor</p>|`SNMP agent`|pSensorPowerFactorX100L1<p>Update: 1m</p>|
|Trap POWER ON|<p>"inode-psense POWER ON"</p>|`SNMP trap`|snmptrap["(SNMPv2-SMI::enterprises.43672.0.97)"]<p>Update: 0</p>|
|Ток фазы L2|<p>Power sensor current</p>|`SNMP agent`|pSensorCurrentX100L2<p>Update: 10s</p>|
|Реактивная мощность фазы L2|<p>Power sensor reactive power</p>|`SNMP agent`|pSensorReactivePowerX1000L2<p>Update: 1m</p>|
|Коэфф. мощности нагрузки фазы L2|<p>Power sensor power factor</p>|`SNMP agent`|pSensorPowerFactorX100L2<p>Update: 1m</p>|
|Trap Connected Power Sensor|<p>Variables: traps, traps_level, traps_index "Power sensor:disconnected/connected"</p>|`SNMP trap`|snmptrap["(SNMPv2-SMI::enterprises.43672.0.40|SNMPv2-SMI::enterprises.43672.0.41)"]<p>Update: 0</p>|
|Коэфф. мощности нагрузки фазы L3|<p>Power sensor power factor</p>|`SNMP agent`|pSensorPowerFactorX100L3<p>Update: 1m</p>|
|Ток фазы L3|<p>Power sensor current</p>|`SNMP agent`|pSensorCurrentX100L3<p>Update: 10s</p>|
|Ток фазы L1|<p>Power sensor current</p>|`SNMP agent`|pSensorCurrentX100L1<p>Update: 10s</p>|
|Коэфф. искажения напр. фазы L1|<p>Power sensor voltage factor</p>|`SNMP agent`|pSensorVoltageFactorX100L1<p>Update: 1m</p>|
|Полная мощность фазы L1|<p>Power sensor apparent power</p>|`SNMP agent`|pSensorApparentPowerX1000L1<p>Update: 1m</p>|
|Trap Current|<p>Variables: traps, traps_level, traps_index "Power sensor current"</p>|`SNMP trap`|snmptrap["(SNMPv2-SMI::enterprises.43672.0.44|SNMPv2-SMI::enterprises.43672.0.48|SNMPv2-SMI::enterprises.43672.0.52)"]<p>Update: 0</p>|
|Дисбаланс токов фазы L1|<p>Power sensor current disbalance from average 3-phase current (от среднего тока фаз)</p>|`SNMP agent`|pSensorCurrentDisbalanceX10PL1<p>Update: 1m</p>|
|Статус датчика частоты тока|<p>Power sensor frequency alarm status</p>|`SNMP agent`|pSensorFrequencyAlarmStatus<p>Update: 1m</p>|
|Коэфф. амплитуды тока фазы L2|<p>Power sensor current crest factor (Iamp/Irms)</p>|`SNMP agent`|pSensorCrestFactorX100L2<p>Update: 1m</p>|
|Полная мощность фаз L1-3|<p>Power sensor apparent power</p>|`SNMP agent`|pSensorApparentPowerX1000L1-3<p>Update: 1m</p>|
|Изменилось системное время|<p>-</p>|`SNMP trap`|snmptrap["(SNMPv2-SMI::enterprises.43672.0.92|SNMPv2-SMI::enterprises.43672.0.91)"]<p>Update: 0</p>|
|Напряжение фазы L2|<p>Power sensor voltage</p>|`SNMP agent`|pSensorVoltageX100L2<p>Update: 10s</p>|
|Коэфф. амплитуды тока фазы L1|<p>Power sensor current crest factor (Iamp/Irms)</p>|`SNMP agent`|pSensorCrestFactorX100L1<p>Update: 1m</p>|
|Активная мощность фазы L1|<p>Power sensor real power</p>|`SNMP agent`|pSensorRealPowerX1000L1<p>Update: 1m</p>|
|Реактивная мощность фазы L3|<p>Power sensor reactive power</p>|`SNMP agent`|pSensorReactivePowerX1000L3<p>Update: 1m</p>|
|Статус датчика напряжения тока|<p>Power sensor voltage alarm status</p>|`SNMP agent`|pSensorVoltageAlarmStatus<p>Update: 1m</p>|
|Состояние датчика электропитания|<p>Power sensor module connection</p>|`SNMP agent`|pSensorConnect<p>Update: 1m</p>|
|Активная мощность фазы L3|<p>Power sensor real power</p>|`SNMP agent`|pSensorRealPowerX1000L3<p>Update: 1m</p>|
|Напряжение фазы L3|<p>Power sensor voltage</p>|`SNMP agent`|pSensorVoltageX100L3<p>Update: 10s</p>|
|Полная мощность фазы L2|<p>Power sensor apparent power</p>|`SNMP agent`|pSensorApparentPowerX1000L2<p>Update: 1m</p>|
|Коэфф. амплитуды тока фазы L3|<p>Power sensor current crest factor (Iamp/Irms)</p>|`SNMP agent`|pSensorCrestFactorX100L3<p>Update: 1m</p>|
|Trap Frequency|<p>Variables: traps, traps_level, traps_index "Power sensor frequency"</p>|`SNMP trap`|snmptrap["(SNMPv2-SMI::enterprises.43672.0.42|SNMPv2-SMI::enterprises.43672.0.46|SNMPv2-SMI::enterprises.43672.0.50)"]<p>Update: 0</p>|
|Trap Summary Current|<p>Variables: traps, traps_level, traps_index "Power sensor summary current"</p>|`SNMP trap`|snmptrap["(SNMPv2-SMI::enterprises.43672.0.45|SNMPv2-SMI::enterprises.43672.0.49|SNMPv2-SMI::enterprises.43672.0.53)"]<p>Update: 0</p>|
|Напряжение фазы L1|<p>Power sensor voltage</p>|`SNMP agent`|pSensorVoltageX100L1<p>Update: 10s</p>|
|Активная мощность фазы L2|<p>Power sensor real power</p>|`SNMP agent`|pSensorRealPowerX1000L2<p>Update: 1m</p>|
|Коэфф. искажения напр. фазы L2|<p>Power sensor voltage factor</p>|`SNMP agent`|pSensorVoltageFactorX100L2<p>Update: 1m</p>|
|Суммарный ток фаз L1-L3|<p>Power sensor current</p>|`SNMP agent`|pSensorCurrentX100L1-3<p>Update: 10s</p>|
|Полная мощность фазы L3|<p>Power sensor apparent power</p>|`SNMP agent`|pSensorApparentPowerX1000L3<p>Update: 1m</p>|
|Trap Voltage|<p>Variables: traps, traps_level, traps_index "Power sensor voltage"</p>|`SNMP trap`|snmptrap["(SNMPv2-SMI::enterprises.43672.0.43|SNMPv2-SMI::enterprises.43672.0.47|SNMPv2-SMI::enterprises.43672.0.51)"]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

