# 3par

## Overview

Beta TolkitPosh for 3par-7200 monitorig


Please contact with questions in the mail or telegram


Просьба обращаться с вопросами в почту или telegram


For multiple unique problems with host windows and powershell 3par toolkit HPE. I'm going to redo everything under linux Until the end of 2018, I'm going to have time


I apologize for not informative in use, I deliberately raised the threshold of entry so that no one would destroy the data in the storage system


По многочисленным и уникальным проблемам с хостами windows и powershell 3par toolkit HPE. Я собираюсь переделать все под linux. До конца 2018 года собираюсь успеть


Прошу прощения за не информативность в использовании, я намеренно повысил порог вхождения чтоб никто не уничтожил данные в СХД


<https://github.com/Toh3mi/zabbix-3par>


mail [x.tohemi@gmail.com](mailto:x.tohemi@gmail.com)


telegram @toh3mi


 



## Author

Toh3mi

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|LLD Json 3parDisk data|<p>-</p>|`Zabbix agent`|3parPDCheck<p>Update: 30m</p>|
|LLD Json 3parVV data|<p>-</p>|`Zabbix agent`|3parVVCheck<p>Update: 1h</p>|
|LLD Json 3parVlun data|<p>-</p>|`Zabbix agent`|StatVlunCheck<p>Update: 30m</p>|
|LLD Json 3parPortCheck data|<p>-</p>|`Zabbix agent`|3parPortCheck<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|3par Json StatVV|<p>-</p>|`Zabbix agent`|StatVVNew<p>Update: 15s</p>|
|3par Json VVData|<p>-</p>|`Zabbix agent`|3parVVData<p>Update: 1m</p>|
|3par Json PortsData|<p>-</p>|`Zabbix agent`|3parPortsData<p>Update: 1m</p>|
|3par Json StatVlun|<p>-</p>|`Zabbix agent`|StatVlunNew<p>Update: 15s</p>|
|3par Json PDdata|<p>-</p>|`Zabbix agent`|3parPDData<p>Update: 1m</p>|
|3par Json StatPD|<p>-</p>|`Zabbix agent`|StatPDNew<p>Update: 30s</p>|
|3par Json StatPort|<p>-</p>|`Zabbix agent`|StatPortNew<p>Update: 15s</p>|
|3par Json StatLink|<p>-</p>|`Zabbix agent`|StatLinkNew<p>Update: 90s</p>|
|3parDisk FREE B {#RPM}K {#TYPE} {#DISKID} {#CAGEPOS}|<p>-</p>|`Dependent item`|3parDiskFREEB["{#DISKID}","{#CAGEPOS}"]<p>Update: 0</p><p>LLD</p>|
|3parDisk STATE {#RPM}K {#TYPE} {#DISKID} {#CAGEPOS}|<p>-</p>|`Dependent item`|3parDiskSTATE["{#DISKID}","{#CAGEPOS}"]<p>Update: 0</p><p>LLD</p>|
|3parDisk TOTAL B {#RPM}K {#TYPE} {#DISKID} {#CAGEPOS}|<p>-</p>|`Dependent item`|3parDiskTOTALB["{#DISKID}","{#CAGEPOS}"]<p>Update: 0</p><p>LLD</p>|
|3parDisk IO/s {#RPM}K {#TYPE} {#DISKID} {#CAGEPOS}|<p>-</p>|`Dependent item`|3pardisk["{#DISKID}","{#CAGEPOS}","IOCur"]<p>Update: 0</p><p>LLD</p>|
|3parDisk B/s {#RPM}K {#TYPE} {#DISKID} {#CAGEPOS}|<p>-</p>|`Dependent item`|3pardisk["{#DISKID}","{#CAGEPOS}","KBCur"]<p>Update: 0</p><p>LLD</p>|
|3parVV B/s {#ID} {#PROV} {#NAME}|<p>-</p>|`Dependent item`|3parVVB["{#ID}","{#PROV}","{#NAME}"]<p>Update: 0</p><p>LLD</p>|
|3parVV IO/s {#ID} {#PROV} {#NAME}|<p>-</p>|`Dependent item`|3parVVIO["{#ID}","{#PROV}","{#NAME}"]<p>Update: 0</p><p>LLD</p>|
|3parVV STATE {#ID} {#PROV} {#NAME}|<p>-</p>|`Dependent item`|3parVVSTATE["{#ID}","{#PROV}","{#NAME}"]<p>Update: 0</p><p>LLD</p>|
|3parVV TOTAL B {#ID} {#PROV} {#NAME}|<p>-</p>|`Dependent item`|3parVVTOTALB["{#ID}","{#PROV}","{#NAME}"]<p>Update: 0</p><p>LLD</p>|
|3parVV USED B {#ID} {#PROV} {#NAME}|<p>-</p>|`Dependent item`|3parVVUSEDB["{#ID}","{#PROV}","{#NAME}"]<p>Update: 0</p><p>LLD</p>|
|3parVLun B/s {#NAMEVLUN}|<p>-</p>|`Dependent item`|3parVLunB["{#NAMEVLUN}"]<p>Update: 0</p><p>LLD</p>|
|3parVLun IO/s {#NAMEVLUN}|<p>-</p>|`Dependent item`|3parVLunIO["{#NAMEVLUN}"]<p>Update: 0</p><p>LLD</p>|
|3parPort B/s {#PROTOCOL} {#DEVICE} {#LABEL}|<p>-</p>|`Dependent item`|3parPortB["{#DEVICE}"]<p>Update: 0</p><p>LLD</p>|
|3parPort IOSzCur {#PROTOCOL} {#DEVICE} {#LABEL}|<p>-</p>|`Dependent item`|3parPortIOSzCur["{#DEVICE}"]<p>Update: 0</p><p>LLD</p>|
|3parPort IO/s {#PROTOCOL} {#DEVICE} {#LABEL}|<p>-</p>|`Dependent item`|3parPortIO["{#DEVICE}"]<p>Update: 0</p><p>LLD</p>|
|3parPort STATE {#PROTOCOL} {#DEVICE} {#LABEL} Port {#PORTWWN} Node {#NODEWWN}|<p>-</p>|`Dependent item`|3parPortSTATE["{#PROTOCOL}","{#DEVICE}","{#LABEL}","{#PORTWWN}"]<p>Update: 0</p><p>LLD</p>|
|3parPort SvtCur {#PROTOCOL} {#DEVICE} {#LABEL}|<p>-</p>|`Dependent item`|3parPortSvtCur["{#DEVICE}"]<p>Update: 0</p><p>LLD</p>|
|3parPort TYPE {#PROTOCOL} {#DEVICE} {#LABEL} Port {#PORTWWN} Node {#NODEWWN}|<p>-</p>|`Dependent item`|3parPortTYPE["{#PROTOCOL}","{#DEVICE}","{#LABEL}","{#PORTWWN}"]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|3parDisk STATE {#DISKID} {#CAGEPOS} Проверь срочно диск!!!|<p>-</p>|<p>**Expression**: {3par_monitoring:3parDiskSTATE["{#DISKID}","{#CAGEPOS}"].str(normal,#1)}=0</p><p>**Recovery expression**: </p>|not classified|
|3parPort Статус {#PROTOCOL} {#DEVICE} {#LABEL} {#PORTWWN} не готов. СРОЧНО ПРОВЕРИТЬ!!!|<p>-</p>|<p>**Expression**: {3par_monitoring:3parPortSTATE["{#PROTOCOL}","{#DEVICE}","{#LABEL}","{#PORTWWN}"].diff()}=1</p><p>**Recovery expression**: </p>|disaster|
|3parPort Тип {#PROTOCOL} {#DEVICE} {#LABEL} {#PORTWWN} в статусе Free. СРОЧНО ПЕРЕПРОВЕРИТЬ!!!|<p>-</p>|<p>**Expression**: {3par_monitoring:3parPortTYPE["{#PROTOCOL}","{#DEVICE}","{#LABEL}","{#PORTWWN}"].str(free,#1)}=1</p><p>**Recovery expression**: </p>|disaster|
|3parVVSTATE {#ID} {#PROV} {#NAME} Warning not normal|<p>-</p>|<p>**Expression**: {3par_monitoring:3parVVSTATE["{#ID}","{#PROV}","{#NAME}"].logsource(normal)}=0</p><p>**Recovery expression**: </p>|disaster|
|3parDisk STATE {#DISKID} {#CAGEPOS} Проверь срочно диск!!! (LLD)|<p>-</p>|<p>**Expression**: {3par_monitoring:3parDiskSTATE["{#DISKID}","{#CAGEPOS}"].str(normal,#1)}=0</p><p>**Recovery expression**: </p>|not classified|
|3parVVSTATE {#ID} {#PROV} {#NAME} Warning not normal (LLD)|<p>-</p>|<p>**Expression**: {3par_monitoring:3parVVSTATE["{#ID}","{#PROV}","{#NAME}"].logsource(normal)}=0</p><p>**Recovery expression**: </p>|disaster|
|3parPort Статус {#PROTOCOL} {#DEVICE} {#LABEL} {#PORTWWN} не готов. СРОЧНО ПРОВЕРИТЬ!!! (LLD)|<p>-</p>|<p>**Expression**: {3par_monitoring:3parPortSTATE["{#PROTOCOL}","{#DEVICE}","{#LABEL}","{#PORTWWN}"].diff()}=1</p><p>**Recovery expression**: </p>|disaster|
|3parPort Тип {#PROTOCOL} {#DEVICE} {#LABEL} {#PORTWWN} в статусе Free. СРОЧНО ПЕРЕПРОВЕРИТЬ!!! (LLD)|<p>-</p>|<p>**Expression**: {3par_monitoring:3parPortTYPE["{#PROTOCOL}","{#DEVICE}","{#LABEL}","{#PORTWWN}"].str(free,#1)}=1</p><p>**Recovery expression**: </p>|disaster|
