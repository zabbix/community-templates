# Eltex LTE-8X

## Overview

Eltex LTE-8x Template with ONT discovery (Mac & Laser Level), PON I/O traffic, CPU load, Temperature, ONT Count



## Author

nvrskARTIst

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|lte8stONTStateMac|<p>-</p>|`SNMP agent`|lte8stONTStateMac<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OLT2 ONT count PON1|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.4.3.20.0<p>Update: 60</p>|
|CPU5|<p>-</p>|`SNMP agent`|CPU5<p>Update: 300</p>|
|Model|<p>Модель</p>|`SNMP agent`|1.3.6.1.2.1.1.1.0<p>Update: 3600;3600/1-7,08:00-22:00</p>|
|MAC|<p>MacAddress</p>|`SNMP agent`|1.3.6.1.4.1.35265.1.21.2.1.2.0<p>Update: 3600;3600/1-7,08:00-22:00</p>|
|OLT3 PON1 inbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.5.3.10.1.1.0<p>Update: 300</p>|
|FW ONT|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.35265.1.21.2.1.3.0<p>Update: 3600</p>|
|OLT3 ONT count PON0|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.5.2.20.0<p>Update: 60</p>|
|FW LTE|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.35265.1.21.1.29.0<p>Update: 3600</p>|
|OLT3 ONT count PON1|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.5.3.20.0<p>Update: 60</p>|
|OLT1 ONT count PON0|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.3.2.20.0<p>Update: 60</p>|
|OLT0 PON0 inbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.2.2.10.1.1.0<p>Update: 300</p>|
|OLT0 PON0 outbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.2.2.10.2.1.0<p>Update: 300</p>|
|OLT0 PON1 outbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.2.3.10.2.1.0<p>Update: 300</p>|
|OLT3 PON1 outbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.5.3.10.2.1.0<p>Update: 300</p>|
|OLT1 PON0 outbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.3.2.10.2.1.0<p>Update: 300</p>|
|SystemName|<p>Имя свитча, лучше указывать уникальное имя. И желательно не сильно длинное значение.</p>|`SNMP agent`|1.3.6.1.2.1.1.5.0<p>Update: 3600;3600/1-7,08:00-22:00</p>|
|OLT2 PON1 outbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.4.3.10.2.1.0<p>Update: 300</p>|
|Uptime|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.35265.1.21.1.35.0<p>Update: 60</p>|
|OLT1 PON0 inbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.3.2.10.1.1.0<p>Update: 300</p>|
|OLT0 PON1 inbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.2.3.10.1.1.0<p>Update: 300</p>|
|OLT0 ONT count PON0|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.2.2.20.0<p>Update: 60</p>|
|OLT3 PON0 inbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.5.2.10.1.1.0<p>Update: 300</p>|
|SystemLocation|<p>Указываем широту, дынне берем с Яндекс или Google.</p>|`SNMP agent`|1.3.6.1.2.1.1.6.0<p>Update: 3600;3600/1-7,08:00-22:00</p>|
|Temp2|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.30.4.0<p>Update: 60</p>|
|OLT1 ONT count PON1|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.3.3.20.0<p>Update: 60</p>|
|OLT1 PON1 outbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.3.3.10.2.1.0<p>Update: 300</p>|
|OLT3 PON0 outbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.5.2.10.2.1.0<p>Update: 300</p>|
|SystemContact|<p>Контактная информация, используется для заполнения контактной информации или долготы.</p>|`SNMP agent`|1.3.6.1.2.1.1.4.0<p>Update: 3600;3600/1-7,08:00-22:00</p>|
|OLT2 PON0 inbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.4.2.10.1.1.0<p>Update: 300</p>|
|OLT0 ONT count PON1|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.2.3.20.0<p>Update: 60</p>|
|OLT2 PON1 inbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.4.3.10.1.1.0<p>Update: 300</p>|
|OLT2 PON0 outbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.4.2.10.2.1.0<p>Update: 300</p>|
|CPU1|<p>-</p>|`SNMP agent`|CPU1<p>Update: 60</p>|
|CPU15|<p>-</p>|`SNMP agent`|CPU15<p>Update: 900</p>|
|Temp1|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.30.3.0<p>Update: 60</p>|
|OLT2 ONT count PON0|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.4.2.20.0<p>Update: 60</p>|
|OLT1 PON1 inbound|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.35265.1.21.3.3.10.1.1.0<p>Update: 300</p>|
|{#SNMPVALUE} - Laser Power dBm|<p>-</p>|`SNMP agent`|LaserPower.dBm[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - State ID|<p>-</p>|`SNMP agent`|StateID.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|{#SNMPVALUE} - State OLT ID|<p>-</p>|`SNMP agent`|StateOLTID.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|{#SNMPVALUE} - State OLT Port|<p>-</p>|`SNMP agent`|StateOLTPort.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|{#SNMPVALUE} - Status|<p>-</p>|`SNMP agent`|StateState.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Состояние NTE [{#SNMPVALUE}] (OLT:{ITEM.VALUE2}/{ITEM.VALUE3}) - "Unconfigured" (Уровень:{ITEM.LASTVALUE4})|<p>-</p>|<p>**Expression**: last(/Eltex LTE-8X/StateState.[{#SNMPINDEX}])=14 and last(/Eltex LTE-8X/StateOLTID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTPort.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/LaserPower.dBm[{#SNMPINDEX}])>-35</p><p>**Recovery expression**: </p>|information|
|Состояние NTE [{#SNMPVALUE}]  (OLT:{ITEM.VALUE3}/{ITEM.VALUE4} ID:{ITEM.VALUE2}) - "Blocked"|<p>-</p>|<p>**Expression**: last(/Eltex LTE-8X/StateState.[{#SNMPINDEX}])=12 and last(/Eltex LTE-8X/StateID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTPort.[{#SNMPINDEX}])>=0</p><p>**Recovery expression**: </p>|average|
|Уровень ONT [{#SNMPVALUE}] {ITEM.LASTVALUE1} (OLT:{ITEM.VALUE3}/{ITEM.VALUE4} ID:{ITEM.VALUE2}) !|<p>-</p>|<p>**Expression**: max(/Eltex LTE-8X/LaserPower.dBm[{#SNMPINDEX}],300s)<-29 and last(/Eltex LTE-8X/StateID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTPort.[{#SNMPINDEX}])>=0</p><p>**Recovery expression**: </p>|average|
|Состояние NTE [{#SNMPVALUE}] (OLT:{ITEM.VALUE2}/{ITEM.VALUE3}) - "Unconfigured" (Уровень:{ITEM.LASTVALUE4}) (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex LTE-8X/StateState.[{#SNMPINDEX}])=14 and last(/Eltex LTE-8X/StateOLTID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTPort.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/LaserPower.dBm[{#SNMPINDEX}])>-35</p><p>**Recovery expression**: </p>|information|
|Состояние NTE [{#SNMPVALUE}]  (OLT:{ITEM.VALUE3}/{ITEM.VALUE4} ID:{ITEM.VALUE2}) - "Blocked" (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex LTE-8X/StateState.[{#SNMPINDEX}])=12 and last(/Eltex LTE-8X/StateID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTPort.[{#SNMPINDEX}])>=0</p><p>**Recovery expression**: </p>|average|
|Уровень ONT [{#SNMPVALUE}] {ITEM.LASTVALUE1} (OLT:{ITEM.VALUE3}/{ITEM.VALUE4} ID:{ITEM.VALUE2}) ! (LLD)|<p>-</p>|<p>**Expression**: max(/Eltex LTE-8X/LaserPower.dBm[{#SNMPINDEX}],300s)<-29 and last(/Eltex LTE-8X/StateID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTID.[{#SNMPINDEX}])>=0 and last(/Eltex LTE-8X/StateOLTPort.[{#SNMPINDEX}])>=0</p><p>**Recovery expression**: </p>|average|
