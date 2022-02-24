# [Шаблон] TELNET - HP StorageWorks

## Overview

**Version:** 4 *(04.04.2018)*


* *+ 24 HDD (***Enclosure 1*) HW status (SMART, media errors, bad sectors) and triggers*


**Supported models:** 2312fc, p2000, 2040 SAN (*2050 - works in progress*)


**Language:** Russian only


**Features:**


* No external apps\scripts
* No LLD
* Telnet (you can use SSH instead, but telnet is really quicker)
* Regex (to get raw response from device or for pre-cleaning data for XPath)
* 2-step preprocessing (xPath & regex)
* Components health state\ operational status
* Basic performance and status


**Installation:**


1. Import this Template
2. Create two macro (at every device if all accounts are different or in template itself if accounts are equal):
	* {$SAN\_LOGIN} with CLI Login
	* {$SAN\_PASSWD} with CLI Password


Now you have 1 new Template:


* [Шаблон] TELNET - HP StorageWorks"


And several new value mappings:


* HP (StorageWorks) Blame State
* HP (StorageWorks) Component Health
* HP (StorageWorks) Controller ID
* HP (StorageWorks) Controller Location
* HP (StorageWorks) Controller Status
* HP (StorageWorks) Enclosure Status
* HP (StorageWorks) Failover State
* HP (StorageWorks) HDD LED Status
* HP (StorageWorks) Job Name
* HP (StorageWorks) Port Status
* HP (StorageWorks) PSU Location
* HP (StorageWorks) Status
* HP (StorageWorks) VDISK Status


I tried to create all Keys of Items in most understood look. If you will have questions with understanding of Ites's names.


All Applications of higher level are contain information about quantity of subcomponents.


So:


* App "Storage" contains the number of the connected Enclosures
* App "Enclosure" contains the number of disks slots and installed physical disks
* App "Controllers" contains the number of the vdisks
* App "Virt(ual). disks" contains the number of the physical disks, used in vdisks and nuber of Volumes


By default, all source XML Items for all basic subsystems are enabled ("XML" application).


By default, only basic set of dependent Items is enabled. For getting data from 1 basic Storage (without expansions):


* 1 disks enclosure
* 2 controllers (A.B)
* 4 FC ports (A1,B1,A2,B2)
* 2 PSUs (left, right)
* 1 physical disk (first in enclosure)
* 1 virtual disk (first on controller A)
* versions of main components


## Author

Anth0nyME

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Физ. диск (2.7) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.8) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_8,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.24) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.health-numeric<p>Update: 0</p>|
|Физ. диск (1.18) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.location<p>Update: 0</p>|
|Физ. диск (1.9) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.9.iops<p>Update: 0</p>|
|Контроллер (B)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-controllers-0,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.13) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.19) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.19.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.8) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.vendor<p>Update: 0</p>|
|Физ. диск (1.4) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.health-numeric<p>Update: 0</p>|
|Физ. диск (1.12) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.health-numeric<p>Update: 0</p>|
|Идентификатор хранилища|<p>-</p>|`Dependent item`|hp.msa.system-information.current-node-wwn<p>Update: 0</p>|
|Порт (B4) - тип подключения|<p>Порт 4 из 4</p>|`Dependent item`|hp.msa.ports.0.15.media<p>Update: 0</p>|
|Физ. диск (2.8) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.led-status-numeric<p>Update: 0</p>|
|Физ. диск (2.4) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.14) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.12) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.led-status-numeric<p>Update: 0</p>|
|Физ. диск (2.4) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.state<p>Update: 0</p>|
|Физ. диск (1.13) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.type<p>Update: 0</p>|
|Физ. диск (2.6) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.20) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.20.smart-count-1<p>Update: 0</p>|
|Вирт. диск (2) - состояние|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.health-numeric<p>Update: 0</p>|
|Физ. диск (2.11) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.state<p>Update: 0</p>|
|Физ. диск (1.11) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.10) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.10.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.2) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.8) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.owner-numeric<p>Update: 0</p>|
|Порт (B2) - идентификатор|<p>Порт 2 из 2</p>|`Dependent item`|hp.msa.ports.0.7.target-id<p>Update: 0</p>|
|Физ. диск (1.5) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.size-numeric<p>Update: 0</p>|
|Вирт. диск (2) - номер диска|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.serial-number<p>Update: 0</p>|
|Тип оборудования|<p>-</p>|`Dependent item`|hp.msa.system-information.product-brand<p>Update: 0</p>|
|Физ. диск (2.8) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.owner-numeric<p>Update: 0</p>|
|Физ. диск (2.5) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.type<p>Update: 0</p>|
|Контроллер (A) - инт. управления|<p>-</p>|`Dependent item`|hp.msa.controllers.1.ip-address<p>Update: 0</p>|
|Физ. диск (1.2) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.16) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.16.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.6) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.location<p>Update: 0</p>|
|Физ. диск (1.24)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_24,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Контроллер (B) (MC) - загрузчик|<p>-</p>|`Dependent item`|hp.msa.versions.1.2.mc-loader<p>Update: 0</p>|
|Физ. диск (1.8) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.8.number-of-media-errors-1<p>Update: 0</p>|
|БП (1.1) - расположение|<p>-</p>|`Dependent item`|hp.msa.power-supplies.1.1.position-numeric<p>Update: 0</p>|
|Физ. диск (1.9) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.health-numeric<p>Update: 0</p>|
|Физ. диск (1.19) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.type<p>Update: 0</p>|
|Физ. диск (2.2) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.state<p>Update: 0</p>|
|Физ. диск (2.1) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.health-numeric<p>Update: 0</p>|
|Физ. диск (2.4) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.location<p>Update: 0</p>|
|Физ. диск (1.17) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.health-numeric<p>Update: 0</p>|
|Физ. диск (1.15) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.15.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.1) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.9) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.virtual-disk-serial<p>Update: 0</p>|
|Полка (2) - тип|<p>-</p>|`Dependent item`|hp.msa.enclosures.2.model<p>Update: 0</p>|
|Физ. диск (2.9) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.enclosure-wwn<p>Update: 0</p>|
|Полка (1) - серийный номер|<p>-</p>|`Dependent item`|hp.msa.enclosures.1.midplane-serial-number<p>Update: 0</p>|
|Физ. диск (1.6) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.size-numeric<p>Update: 0</p>|
|Физ. диск (1.4) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.vendor<p>Update: 0</p>|
|Физ. диск (1.18) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.18.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.2) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_2,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.2)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_2,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.4) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.state<p>Update: 0</p>|
|Физ. диск (1.4) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_4,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.20) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.3) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.owner-numeric<p>Update: 0</p>|
|Порт (A3) - тип подключения|<p>Порт 3 из 4</p>|`Dependent item`|hp.msa.ports.1.5.media<p>Update: 0</p>|
|Полка (2) - статус|<p>-</p>|`Dependent item`|hp.msa.enclosures.2.status-numeric<p>Update: 0</p>|
|Физ. диск (1.13) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.1) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.size-numeric<p>Update: 0</p>|
|Физ. диск (1.14) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.vendor<p>Update: 0</p>|
|Контроллер (A) - процессор|<p>-</p>|`Dependent item`|hp.msa.controllers.1.sc-cpu-type<p>Update: 0</p>|
|Физ. диск (2.11) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.owner-numeric<p>Update: 0</p>|
|Контроллер (B) - состояние|<p>-</p>|`Dependent item`|hp.msa.controllers.0.health-numeric<p>Update: 0</p>|
|Физ. диск (1.23) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_23,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.16) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.model<p>Update: 0</p>|
|Физ. диск (1.5) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (2.10) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.type<p>Update: 0</p>|
|Блок питания (2.1)|<p>Исходные данные по БП 1 Полки 2</p>|`Telnet agent`|telnet.run[hp-msa-power-supplies-2_1,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|БП (1.2) - вентилятор|<p>-</p>|`Dependent item`|hp.msa.power-supplies.1.2.fan.health-numeric<p>Update: 0</p>|
|Физ. диск (1.12) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.13) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.health-numeric<p>Update: 0</p>|
|Физ. диск (2.3) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.model<p>Update: 0</p>|
|Физ. диск (1.23) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.vendor<p>Update: 0</p>|
|Физ. диск (2.6) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.14) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.14.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (2.5) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.location<p>Update: 0</p>|
|Физ. диск (1.3) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.virtual-disk-serial<p>Update: 0</p>|
|БП (2.2) - состояние|<p>-</p>|`Dependent item`|hp.msa.power-supplies.2.2.health-numeric<p>Update: 0</p>|
|Физ. диск (1.8) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.8.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.7) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.11) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.avg-rsp-time<p>Update: 0</p>|
|Порт (B3) - состояние|<p>Порт 3 из 4</p>|`Dependent item`|hp.msa.ports.0.13.health-numeric<p>Update: 0</p>|
|Физ. диск (1.18) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.type<p>Update: 0</p>|
|Полка (1) - модель|<p>-</p>|`Dependent item`|hp.msa.enclosures.1.description<p>Update: 0</p>|
|Физ. диск (1.13) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.13.iops<p>Update: 0</p>|
|Физ. диск (1.15) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.15.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.8) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.enclosure-wwn<p>Update: 0</p>|
|Вирт. диск (1) - разделы|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.num-array-partitions<p>Update: 0</p>|
|Порт (B2) - состояние|<p>Порт 2 из 4</p>|`Dependent item`|hp.msa.ports.0.11.health-numeric<p>Update: 0</p>|
|Физ. диск (1.10) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.5) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.5.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.18) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.18.iops<p>Update: 0</p>|
|Блок питания (1.1)|<p>Исходные данные по БП 1 Полки 1</p>|`Telnet agent`|telnet.run[hp-msa-power-supplies-1_1,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.16) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.16.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.15) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.state<p>Update: 0</p>|
|Физ. диск (1.16) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.location<p>Update: 0</p>|
|Физ. диск (1.8)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_8,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.11) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.led-status-numeric<p>Update: 0</p>|
|Физ. диск (2.1) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.5) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.21) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.21.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (2.2) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.3) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.size-numeric<p>Update: 0</p>|
|Физ. диск (1.16) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.state<p>Update: 0</p>|
|Физ. диск (2.7) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.avg-rsp-time<p>Update: 0</p>|
|БП (1.1) - вентилятор|<p>-</p>|`Dependent item`|hp.msa.power-supplies.1.1.fan.health-numeric<p>Update: 0</p>|
|Физ. диск (2.1) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.type<p>Update: 0</p>|
|Физ. диск (1.1) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.21) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.21.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.1) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.11) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.location<p>Update: 0</p>|
|Физ. диск (1.1) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.1.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.8)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_8,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.12) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.size-numeric<p>Update: 0</p>|
|Контроллер (B) - расположение|<p>-</p>|`Dependent item`|hp.msa.controllers.0.position-numeric<p>Update: 0</p>|
|Физ. диск (1.4) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (2.1) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.23)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_23,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.8) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.health-numeric<p>Update: 0</p>|
|Физ. диск (1.5) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.owner-numeric<p>Update: 0</p>|
|Физ. диск (2.3) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.avg-rsp-time<p>Update: 0</p>|
|Вирт. диск (1) - номер диска|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.serial-number<p>Update: 0</p>|
|Вирт. диск (2) - разделы|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.num-array-partitions<p>Update: 0</p>|
|Физ. диск (2.6) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.type<p>Update: 0</p>|
|Физ. диск (1.2) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.2.iops<p>Update: 0</p>|
|Физ. диск (1.12) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.avg-rsp-time<p>Update: 0</p>|
|БП (1.1) - модель|<p>-</p>|`Dependent item`|hp.msa.power-supplies.1.1.model<p>Update: 0</p>|
|Физ. диск (1.9) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.type<p>Update: 0</p>|
|Физ. диск (1.9) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.location<p>Update: 0</p>|
|Физ. диск (2.7) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.type<p>Update: 0</p>|
|Физ. диск (1.17) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.type<p>Update: 0</p>|
|Физ. диск (1.21) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.state<p>Update: 0</p>|
|Физ. диск (1.20) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.state<p>Update: 0</p>|
|Физ. диск (1.17) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.17.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.7) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.7.smart-count-1<p>Update: 0</p>|
|Физ. диск (1.10) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.state<p>Update: 0</p>|
|Физ. диск (1.14)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_14,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Вирт. диск (2) - имя|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.name<p>Update: 0</p>|
|БП (2.1) - состояние|<p>-</p>|`Dependent item`|hp.msa.power-supplies.2.1.health-numeric<p>Update: 0</p>|
|Физ. диск (1.13) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.13.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (2.5) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.vendor<p>Update: 0</p>|
|Физ. диск (1.6) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.21) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.12)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_12,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Порт (A4) - тип подключения|<p>Порт 4 из 4</p>|`Dependent item`|hp.msa.ports.1.7.media<p>Update: 0</p>|
|Физ. диск (1.18) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.23) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.23.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.7) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.7.iops<p>Update: 0</p>|
|Физ. диск (1.7) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.7.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.7) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.location<p>Update: 0</p>|
|Физ. диск (1.4) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.11) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.type<p>Update: 0</p>|
|Физ. диск (1.2) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.location<p>Update: 0</p>|
|Физ. диск (1.9)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_9,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Место отказа|<p>-</p>|`Dependent item`|hp.msa.system-information.health-blame-numeric<p>Update: 0</p>|
|Физ. диск (1.9) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.size-numeric<p>Update: 0</p>|
|Вирт. диск (1) - тип массива|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.raidtype<p>Update: 0</p>|
|Физ. диск (1.3) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.1) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.vendor<p>Update: 0</p>|
|Физ. диск (1.4) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.6)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_6,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Вирт. диск (2) - тип массива|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.raidtype<p>Update: 0</p>|
|Физ. диск (1.8) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.size-numeric<p>Update: 0</p>|
|Физ. диск (1.4) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.location<p>Update: 0</p>|
|Физ. диск (1.22) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.state<p>Update: 0</p>|
|Физ. диск (1.21) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.vendor<p>Update: 0</p>|
|Физ. диск (1.4) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.type<p>Update: 0</p>|
|Хосты|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-hosts,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.1) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.location<p>Update: 0</p>|
|Полка (1) - состояние|<p>-</p>|`Dependent item`|hp.msa.enclosures.1.health-numeric<p>Update: 0</p>|
|Физ. диск (1.15) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.model<p>Update: 0</p>|
|Физ. диск (1.14) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.16) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.virtual-disk-serial<p>Update: 0</p>|
|БП (2.2) - расположение|<p>-</p>|`Dependent item`|hp.msa.power-supplies.2.2.position-numeric<p>Update: 0</p>|
|Физ. диск (1.8) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.location<p>Update: 0</p>|
|Физ. диск (1.22) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.owner-numeric<p>Update: 0</p>|
|Порт (B1) - статус|<p>Порт 1 из 2</p>|`Dependent item`|hp.msa.ports.0.5.status-numeric<p>Update: 0</p>|
|Физ. диск (1.19) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.19.smart-count-1<p>Update: 0</p>|
|Физ. диск (1.6) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.model<p>Update: 0</p>|
|Физ. диск (2.4) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.vendor<p>Update: 0</p>|
|Порт (B1) - статус|<p>Порт 1 из 4</p>|`Dependent item`|hp.msa.ports.0.9.status-numeric<p>Update: 0</p>|
|Физ. диск (1.4) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.4.number-of-bad-blocks-1<p>Update: 0</p>|
|Контроллер (B) - порты|<p>-</p>|`Dependent item`|hp.msa.controllers.0.host-ports<p>Update: 0</p>|
|Вирт. диск (1) - физ. дисков подменных|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.sparecount<p>Update: 0</p>|
|Физ. диск (2.6) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.10) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.size-numeric<p>Update: 0</p>|
|Физ. диск (2.6) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.size-numeric<p>Update: 0</p>|
|Физ. диск (2.10) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.enclosure-wwn<p>Update: 0</p>|
|Порт (A3) - статус|<p>Порт 3 из 4</p>|`Dependent item`|hp.msa.ports.1.5.status-numeric<p>Update: 0</p>|
|Физ. диск (2.7) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.model<p>Update: 0</p>|
|Физ. диск (1.14) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.owner-numeric<p>Update: 0</p>|
|Порт (A2) - тип подключения|<p>Порт 2 из 2 4</p>|`Dependent item`|hp.msa.ports.1.3.media<p>Update: 0</p>|
|Физ. диск (1.21) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.21) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.size-numeric<p>Update: 0</p>|
|Физ. диск (2.12) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.virtual-disk-serial<p>Update: 0</p>|
|БП (2.1) - вентилятор|<p>-</p>|`Dependent item`|hp.msa.power-supplies.2.1.fan.health-numeric<p>Update: 0</p>|
|Физ. диск (2.6) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (2.9) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.type<p>Update: 0</p>|
|Физ. диск (2.8) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.vendor<p>Update: 0</p>|
|Порт (B1) - идентификатор|<p>Порт 1 из 2</p>|`Dependent item`|hp.msa.ports.0.5.target-id<p>Update: 0</p>|
|Физ. диск (2.2) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.20) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.20.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.4) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.4.smart-count-1<p>Update: 0</p>|
|Физ. диск (1.23) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.18) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.model<p>Update: 0</p>|
|Порт (A4) - состояние|<p>Порт 4 из 4</p>|`Dependent item`|hp.msa.ports.1.7.health-numeric<p>Update: 0</p>|
|Физ. диск (1.6) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.18) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.17) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_17,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.5) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.5.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.11) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.11.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (2.4) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.size-numeric<p>Update: 0</p>|
|Физ. диск (1.10) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.10) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (2.6) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.10)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_10,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Полка (2) - физ. диски|<p>-</p>|`Dependent item`|hp.msa.enclosures.2.number-of-disks<p>Update: 0</p>|
|Физ. диск (1.22) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.type<p>Update: 0</p>|
|Физ. диск (1.4)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_4,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.11) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.size-numeric<p>Update: 0</p>|
|Порт (B2) - статус|<p>Порт 2 из 4</p>|`Dependent item`|hp.msa.ports.0.11.status-numeric<p>Update: 0</p>|
|Блок питания (2.2)|<p>Исходные данные по БП 2 Полки 2</p>|`Telnet agent`|telnet.run[hp-msa-power-supplies-2_2,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.2)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_2,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.10) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.vendor<p>Update: 0</p>|
|Физ. диск (1.3) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.state<p>Update: 0</p>|
|Физ. диск (1.22) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.19) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_19,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.13) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.13.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.9) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.13) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.16) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.owner-numeric<p>Update: 0</p>|
|Хранилище - состояние|<p>-</p>|`Dependent item`|hp.msa.system-information.health-numeric<p>Update: 0</p>|
|Порт (B2) - состояние|<p>Порт 2 из 2</p>|`Dependent item`|hp.msa.ports.0.7.health-numeric<p>Update: 0</p>|
|Физ. диск (1.15) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.21) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.health-numeric<p>Update: 0</p>|
|Физ. диск (2.3) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.location<p>Update: 0</p>|
|Физ. диск (2.2) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.type<p>Update: 0</p>|
|БП (2.1) - расположение|<p>-</p>|`Dependent item`|hp.msa.power-supplies.2.1.position-numeric<p>Update: 0</p>|
|Физ. диск (1.2) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.2.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.8) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (2.10) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.size-numeric<p>Update: 0</p>|
|Физ. диск (1.10) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.10.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.19) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.24) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.type<p>Update: 0</p>|
|Физ. диск (1.22) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.health-numeric<p>Update: 0</p>|
|Физ. диск (1.3) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.vendor<p>Update: 0</p>|
|Порт (B1) - тип подключения|<p>Порт 1 из 4</p>|`Dependent item`|hp.msa.ports.0.9.media<p>Update: 0</p>|
|Физ. диск (1.20) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.type<p>Update: 0</p>|
|Производитель|<p>-</p>|`Dependent item`|hp.msa.system-information.vendor-name<p>Update: 0</p>|
|Контроллер (A) (SC) - загрузчик|<p>-</p>|`Dependent item`|hp.msa.versions.1.1.sc-loader<p>Update: 0</p>|
|Физ. диск (1.1) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.size-numeric<p>Update: 0</p>|
|Физ. диск (2.7) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.size-numeric<p>Update: 0</p>|
|Контроллер (A) (SC) - конт. дисков|<p>-</p>|`Dependent item`|hp.msa.versions.1.1.sc-fw<p>Update: 0</p>|
|Полка (2) - модель|<p>-</p>|`Dependent item`|hp.msa.enclosures.2.description<p>Update: 0</p>|
|Физ. диск (2.7) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.17) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.size-numeric<p>Update: 0</p>|
|Физ. диск (1.24) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.21) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.21.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.3) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.6)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_6,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.12) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.owner-numeric<p>Update: 0</p>|
|Контроллер (A)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-controllers-1,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.3) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.virtual-disk-serial<p>Update: 0</p>|
|Полка (1) - статус|<p>-</p>|`Dependent item`|hp.msa.enclosures.1.status-numeric<p>Update: 0</p>|
|Физ. диск (2.7) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.health-numeric<p>Update: 0</p>|
|Физ. диск (1.1) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (2.2) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (2.11) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.health-numeric<p>Update: 0</p>|
|Физ. диск (1.15) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.location<p>Update: 0</p>|
|Физ. диск (2.3) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.health-numeric<p>Update: 0</p>|
|Физ. диск (1.7)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_7,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.18) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.18.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.20) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.health-numeric<p>Update: 0</p>|
|Физ. диск (1.14) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.type<p>Update: 0</p>|
|Физ. диск (1.7) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.1) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.virtual-disk-serial<p>Update: 0</p>|
|Контроллер (A) - идентификатор|<p>-</p>|`Dependent item`|hp.msa.controllers.1.node-wwn<p>Update: 0</p>|
|Физ. диск (1.13) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.vendor<p>Update: 0</p>|
|Порт (B1) - состояние|<p>Порт 1 из 4</p>|`Dependent item`|hp.msa.ports.0.9.health-numeric<p>Update: 0</p>|
|Физ. диск (2.3) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.21) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_21,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.13) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_13,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Полка (2) - идентификатор|<p>-</p>|`Dependent item`|hp.msa.enclosures.2.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.6) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.6.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.12) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.vendor<p>Update: 0</p>|
|Физ. диск (1.14) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.health-numeric<p>Update: 0</p>|
|Физ. диск (1.7) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.type<p>Update: 0</p>|
|Вирт. диск (1) - текущая задача|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.current-job-numeric<p>Update: 0</p>|
|Вирт. диск (2) - тип дисков|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.array-drive-type<p>Update: 0</p>|
|Физ. диск (1.22) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.5) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_5,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Вирт. диск (1) - объём|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.size-numeric<p>Update: 0</p>|
|Физ. диск (1.13) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.13.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.12) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.type<p>Update: 0</p>|
|Физ. диск (1.2) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.model<p>Update: 0</p>|
|Физ. диск (1.17) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.owner-numeric<p>Update: 0</p>|
|Физ. диск (2.11) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.type<p>Update: 0</p>|
|Физ. диск (2.2) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.location<p>Update: 0</p>|
|Физ. диск (1.19) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.health-numeric<p>Update: 0</p>|
|Контроллер (B) - инт. управления|<p>-</p>|`Dependent item`|hp.msa.controllers.0.ip-address<p>Update: 0</p>|
|Физ. диск (1.9) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.14) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.model<p>Update: 0</p>|
|Физ. диск (1.24) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.24.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.2) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.5) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.location<p>Update: 0</p>|
|Физ. диск (2.8) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.model<p>Update: 0</p>|
|Физ. диск (2.4) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.owner-numeric<p>Update: 0</p>|
|Физ. диск (2.3) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.size-numeric<p>Update: 0</p>|
|Физ. диск (2.12) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.health-numeric<p>Update: 0</p>|
|Физ. диск (2.10) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.model<p>Update: 0</p>|
|Физ. диск (1.17) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.location<p>Update: 0</p>|
|Физ. диск (2.8) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.health-numeric<p>Update: 0</p>|
|Физ. диск (1.5) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.state<p>Update: 0</p>|
|Физ. диск (2.10) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.location<p>Update: 0</p>|
|Физ. диск (1.17) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.3) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.3.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (2.3) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.11) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.18) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.led-status-numeric<p>Update: 0</p>|
|Физ. диск (2.5) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.state<p>Update: 0</p>|
|Физ. диск (1.15) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.owner-numeric<p>Update: 0</p>|
|Порт (A2) - статус|<p>Порт 2 из 2 4</p>|`Dependent item`|hp.msa.ports.1.3.status-numeric<p>Update: 0</p>|
|Физ. диск (1.8) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.8.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.4) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.15) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.15.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.18) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.vendor<p>Update: 0</p>|
|Физ. диск (2.2) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.12) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.type<p>Update: 0</p>|
|Физ. диск (1.1) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.model<p>Update: 0</p>|
|Физ. диск (1.8) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.type<p>Update: 0</p>|
|Порт (B2) - статус|<p>Порт 2 из 2</p>|`Dependent item`|hp.msa.ports.0.7.status-numeric<p>Update: 0</p>|
|Физ. диск (1.6) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.1)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_1,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.5) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.5.iops<p>Update: 0</p>|
|Физ. диск (1.20) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.location<p>Update: 0</p>|
|Физ. диск (1.1) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.17) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.led-status-numeric<p>Update: 0</p>|
|Физ. диск (2.4)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_4,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.6) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.health-numeric<p>Update: 0</p>|
|Физ. диск (1.20) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.20.iops<p>Update: 0</p>|
|Порт (A1) - идентификатор|<p>Порт 1 из 2 4</p>|`Dependent item`|hp.msa.ports.1.1.target-id<p>Update: 0</p>|
|Физ. диск (1.17) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.state<p>Update: 0</p>|
|Физ. диск (2.10)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_10,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.7) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.owner-numeric<p>Update: 0</p>|
|Физ. диск (2.1) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.state<p>Update: 0</p>|
|Физ. диск (1.1) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.1.iops<p>Update: 0</p>|
|Порт (B2) - идентификатор|<p>Порт 2 из 4</p>|`Dependent item`|hp.msa.ports.0.11.target-id<p>Update: 0</p>|
|Физ. диск (2.8) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.11) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.vendor<p>Update: 0</p>|
|Физ. диск (1.6) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.health-numeric<p>Update: 0</p>|
|Физ. диск (1.22) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.vendor<p>Update: 0</p>|
|Физ. диск (1.3) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.model<p>Update: 0</p>|
|coldStart Trap|<p>-</p>|`SNMP trap`|snmptrap[coldStart]<p>Update: 0</p>|
|Физ. диск (1.9) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.owner-numeric<p>Update: 0</p>|
|Физ. диск (2.7) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.state<p>Update: 0</p>|
|Физ. диск (1.20) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.model<p>Update: 0</p>|
|Вирт. диск (2) - физ. дисков в сборке|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.diskcount<p>Update: 0</p>|
|Физ. диск (1.10) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.17) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.17.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.12) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.15) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.14) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.location<p>Update: 0</p>|
|Физ. диск (1.22)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_22,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.2) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.model<p>Update: 0</p>|
|Физ. диск (1.2) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.21)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_21,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.20) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.size-numeric<p>Update: 0</p>|
|Контроллер (A) - статус|<p>-</p>|`Dependent item`|hp.msa.controllers.1.status-numeric<p>Update: 0</p>|
|Физ. диск (1.7) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.22) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.13)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_13,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.10) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.type<p>Update: 0</p>|
|Порт (B1) - идентификатор|<p>Порт 1 из 4</p>|`Dependent item`|hp.msa.ports.0.9.target-id<p>Update: 0</p>|
|Физ. диск (1.14) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.14.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.1) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.avg-rsp-time<p>Update: 0</p>|
|Контроллер (B) (MC) - версия|<p>-</p>|`Dependent item`|hp.msa.versions.1.2.mc-fw<p>Update: 0</p>|
|Порт (A4) - идентификатор|<p>Порт 4 из 4</p>|`Dependent item`|hp.msa.ports.1.7.target-id<p>Update: 0</p>|
|Физ. диск (2.1) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.vendor<p>Update: 0</p>|
|Физ. диск (1.6) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.6.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.3) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.3.iops<p>Update: 0</p>|
|Полка (1) - идентификатор|<p>-</p>|`Dependent item`|hp.msa.enclosures.1.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.15) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.avg-rsp-time<p>Update: 0</p>|
|Контроллер (A) - состояние|<p>-</p>|`Dependent item`|hp.msa.controllers.1.health-numeric<p>Update: 0</p>|
|Физ. диск (1.12) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.12.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (2.6) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.vendor<p>Update: 0</p>|
|Физ. диск (1.7) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.model<p>Update: 0</p>|
|Физ. диск (1.9) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_9,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Полка (2) - состояние|<p>-</p>|`Dependent item`|hp.msa.enclosures.2.health-numeric<p>Update: 0</p>|
|Полка (1) - отсеки|<p>-</p>|`Dependent item`|hp.msa.enclosures.1.slots<p>Update: 0</p>|
|Подключено полок|<p>-</p>|`Dependent item`|hp.msa.system-information.enclosure-count<p>Update: 0</p>|
|Физ. диск (1.21) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.5) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.5) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.model<p>Update: 0</p>|
|Физ. диск (1.4) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.4.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.19) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.19.iops<p>Update: 0</p>|
|Физ. диск (1.22) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.location<p>Update: 0</p>|
|Физ. диск (1.23) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.3)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_3,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.1) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.model<p>Update: 0</p>|
|Физ. диск (1.14) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (2.9)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_9,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|БП (1.1) - состояние|<p>-</p>|`Dependent item`|hp.msa.power-supplies.1.1.health-numeric<p>Update: 0</p>|
|Физ. диск (1.13) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.state<p>Update: 0</p>|
|Физ. диск (2.5)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_5,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.17) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.model<p>Update: 0</p>|
|Контроллер (A) (SC) - конт. памяти|<p>-</p>|`Dependent item`|hp.msa.versions.1.1.sc-memory<p>Update: 0</p>|
|Физ. диск (1.23) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.23.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (2.6) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.state<p>Update: 0</p>|
|Полка (2) - серийный номер|<p>-</p>|`Dependent item`|hp.msa.enclosures.2.midplane-serial-number<p>Update: 0</p>|
|Физ. диск (1.3) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_3,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.6) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.6.number-of-bad-blocks-1<p>Update: 0</p>|
|Вирт. диск (2) - физ. дисков подменных|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.sparecount<p>Update: 0</p>|
|Физ. диск (2.12) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.state<p>Update: 0</p>|
|Контроллер (B) (SC) - конт. дисков|<p>-</p>|`Dependent item`|hp.msa.versions.1.2.sc-fw<p>Update: 0</p>|
|Физ. диск (1.6) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.vendor<p>Update: 0</p>|
|Физ. диск (1.11) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.model<p>Update: 0</p>|
|Физ. диск (1.10) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_10,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Порт (A1) - тип подключения|<p>Порт 1 из 2 4</p>|`Dependent item`|hp.msa.ports.1.1.media<p>Update: 0</p>|
|Физ. диск (1.12) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.13) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.14) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.14.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.10) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.16)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_16,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.15) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_15,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.19) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.state<p>Update: 0</p>|
|Физ. диск (1.16) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.16.smart-count-1<p>Update: 0</p>|
|Физ. диск (1.3) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.3.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.8) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.21) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.location<p>Update: 0</p>|
|Физ. диск (1.10) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.10.iops<p>Update: 0</p>|
|Физ. диск (1.13) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.9) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.9.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (2.11) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.location<p>Update: 0</p>|
|Физ. диск (2.2) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.health-numeric<p>Update: 0</p>|
|Физ. диск (1.3) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.enclosure-wwn<p>Update: 0</p>|
|БП (1.2) - состояние|<p>-</p>|`Dependent item`|hp.msa.power-supplies.1.2.health-numeric<p>Update: 0</p>|
|Физ. диск (1.4) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.4.iops<p>Update: 0</p>|
|Физ. диск (2.5) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.8) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.state<p>Update: 0</p>|
|Физ. диск (1.15) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.type<p>Update: 0</p>|
|Физ. диск (2.4) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.type<p>Update: 0</p>|
|Физ. диск (2.3) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.vendor<p>Update: 0</p>|
|Контроллер (A) (MC) - версия|<p>-</p>|`Dependent item`|hp.msa.versions.1.1.mc-fw<p>Update: 0</p>|
|Физ. диск (2.7) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.23) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.health-numeric<p>Update: 0</p>|
|Физ. диск (1.24) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.vendor<p>Update: 0</p>|
|Физ. диск (1.20)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_20,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.18) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_18,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.5)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_5,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.3) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.location<p>Update: 0</p>|
|Физ. диск (1.15)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_15,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.9) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.location<p>Update: 0</p>|
|Физ. диск (2.12) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.16) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.health-numeric<p>Update: 0</p>|
|Физ. диск (2.6) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.location<p>Update: 0</p>|
|Физ. диск (2.5) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.2) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.state<p>Update: 0</p>|
|Физ. диск (1.9) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.9.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.11) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_11,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|SNMP trap fallback|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|Физ. диск (1.2) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.vendor<p>Update: 0</p>|
|Физ. диск (2.9) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.size-numeric<p>Update: 0</p>|
|Физ. диск (1.12) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.12.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (2.9) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.health-numeric<p>Update: 0</p>|
|Физ. диск (1.12) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.size-numeric<p>Update: 0</p>|
|Вирт. диск (2) - контроллер|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.13) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.location<p>Update: 0</p>|
|Физ. диск (2.11) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.23) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.10) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.4) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.owner-numeric<p>Update: 0</p>|
|Контроллер (B) (SC) - загрузчик|<p>-</p>|`Dependent item`|hp.msa.versions.1.2.sc-loader<p>Update: 0</p>|
|Физ. диск (2.5) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.owner-numeric<p>Update: 0</p>|
|Порт (B4) - состояние|<p>Порт 4 из 4</p>|`Dependent item`|hp.msa.ports.0.15.health-numeric<p>Update: 0</p>|
|Физ. диск (2.4) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.model<p>Update: 0</p>|
|Физ. диск (1.7) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.health-numeric<p>Update: 0</p>|
|Физ. диск (2.9) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.2) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.type<p>Update: 0</p>|
|Физ. диск (1.23) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.23.iops<p>Update: 0</p>|
|Полка (1) - тип|<p>-</p>|`Dependent item`|hp.msa.enclosures.1.model<p>Update: 0</p>|
|Порт (B3) - идентификатор|<p>Порт 3 из 4</p>|`Dependent item`|hp.msa.ports.0.13.target-id<p>Update: 0</p>|
|Физ. диск (1.7) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.led-status-numeric<p>Update: 0</p>|
|Тип хранилища|<p>-</p>|`Dependent item`|hp.msa.system-information.system-information<p>Update: 0</p>|
|Контроллер (B) - отказ партнёра|<p>-</p>|`Dependent item`|hp.msa.controllers.0.failed-over-numeric<p>Update: 0</p>|
|Физ. диск (1.2) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.virtual-disk-serial<p>Update: 0</p>|
|Виртуальные диски|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-vdisks,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.4) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.enclosure-wwn<p>Update: 0</p>|
|Контроллер (B) (SC) - конт. памяти|<p>-</p>|`Dependent item`|hp.msa.versions.1.2.sc-memory<p>Update: 0</p>|
|Физ. диск (1.24) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.owner-numeric<p>Update: 0</p>|
|БП (1.2) - модель|<p>-</p>|`Dependent item`|hp.msa.power-supplies.1.2.model<p>Update: 0</p>|
|Физ. диск (1.18) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.1) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.1.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (2.2) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.size-numeric<p>Update: 0</p>|
|Физ. диск (1.5) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.5.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.4) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.health-numeric<p>Update: 0</p>|
|Физ. диск (1.8) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.model<p>Update: 0</p>|
|Контроллер (B) - процессор|<p>-</p>|`Dependent item`|hp.msa.controllers.0.sc-cpu-type<p>Update: 0</p>|
|Физ. диск (2.8) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.size-numeric<p>Update: 0</p>|
|Физ. диск (2.5) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.6) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.state<p>Update: 0</p>|
|Физ. диск (1.19) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.22) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.22.iops<p>Update: 0</p>|
|Версии компонентов|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-versions,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.7) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.state<p>Update: 0</p>|
|Физ. диск (1.12) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.3) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.health-numeric<p>Update: 0</p>|
|Физ. диск (1.15) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.15.iops<p>Update: 0</p>|
|Контроллер (B) - идентификатор|<p>-</p>|`Dependent item`|hp.msa.controllers.0.node-wwn<p>Update: 0</p>|
|Физ. диск (2.5) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.model<p>Update: 0</p>|
|Физ. диск (1.21) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.model<p>Update: 0</p>|
|Контроллер (A) - отказ партнёра|<p>-</p>|`Dependent item`|hp.msa.controllers.1.failed-over-numeric<p>Update: 0</p>|
|Порт (B1) - тип подключения|<p>Порт 1 из 2</p>|`Dependent item`|hp.msa.ports.0.5.media<p>Update: 0</p>|
|Вирт. диск (1) - свободно|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.freespace-numeric<p>Update: 0</p>|
|Физ. диск (1.2) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.health-numeric<p>Update: 0</p>|
|Физ. диск (1.16) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.enclosure-wwn<p>Update: 0</p>|
|Контроллер (B) - статус|<p>-</p>|`Dependent item`|hp.msa.controllers.0.status-numeric<p>Update: 0</p>|
|Вирт. диск (2) - объём|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.size-numeric<p>Update: 0</p>|
|Физ. диск (1.16) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.led-status-numeric<p>Update: 0</p>|
|Хранилище|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-system-information,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.16) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.type<p>Update: 0</p>|
|Контроллер (A) - порты|<p>-</p>|`Dependent item`|hp.msa.controllers.1.host-ports<p>Update: 0</p>|
|Физ. диск (1.19)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_19,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.2) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.11) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.state<p>Update: 0</p>|
|Контроллер (A) (MC) - загрузчик|<p>-</p>|`Dependent item`|hp.msa.versions.1.1.mc-loader<p>Update: 0</p>|
|Физ. диск (1.20) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_20,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.18) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.health-numeric<p>Update: 0</p>|
|Физ. диск (1.11) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.11.iops<p>Update: 0</p>|
|Физ. диск (1.5) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.health-numeric<p>Update: 0</p>|
|Физ. диск (1.1) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.health-numeric<p>Update: 0</p>|
|Физ. диск (2.1)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_1,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.12) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.location<p>Update: 0</p>|
|Физ. диск (1.10) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.avg-rsp-time<p>Update: 0</p>|
|Порт (A4) - статус|<p>Порт 4 из 4</p>|`Dependent item`|hp.msa.ports.1.7.status-numeric<p>Update: 0</p>|
|Физ. диск (1.23) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.state<p>Update: 0</p>|
|Физ. диск (1.11) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.1) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.type<p>Update: 0</p>|
|Физ. диск (1.14) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.20) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.11) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.vendor<p>Update: 0</p>|
|БП (2.2) - модель|<p>-</p>|`Dependent item`|hp.msa.power-supplies.2.2.model<p>Update: 0</p>|
|Физ. диск (2.10) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.health-numeric<p>Update: 0</p>|
|Физ. диск (2.4) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.led-status-numeric<p>Update: 0</p>|
|БП (1.2) - расположение|<p>-</p>|`Dependent item`|hp.msa.power-supplies.1.2.position-numeric<p>Update: 0</p>|
|Физ. диск (1.21) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.21.iops<p>Update: 0</p>|
|Физ. диск (1.22) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.20) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.20.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (2.10) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.10) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.location<p>Update: 0</p>|
|Порт (B1) - состояние|<p>Порт 1 из 2</p>|`Dependent item`|hp.msa.ports.0.5.health-numeric<p>Update: 0</p>|
|Физ. диск (2.5) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.health-numeric<p>Update: 0</p>|
|Физ. диск (2.12) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.12.model<p>Update: 0</p>|
|Физ. диск (1.9) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.17) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (2.8) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.type<p>Update: 0</p>|
|Вирт. диск (2) - текущая задача|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.current-job-numeric<p>Update: 0</p>|
|Физ. диск (1.14) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.size-numeric<p>Update: 0</p>|
|Физ. диск (1.23) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.location<p>Update: 0</p>|
|Физ. диск (2.3) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.12) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.12.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.5) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.7) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.11) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.enclosure-wwn<p>Update: 0</p>|
|Вирт. диск (1) - физ. дисков в сборке|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.diskcount<p>Update: 0</p>|
|Физ. диск (1.16) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.vendor<p>Update: 0</p>|
|Физ. диск (1.6) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.type<p>Update: 0</p>|
|Физ. диск (1.17)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_17,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.12) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.owner-numeric<p>Update: 0</p>|
|Порт (B3) - тип подключения|<p>Порт 3 из 4</p>|`Dependent item`|hp.msa.ports.0.13.media<p>Update: 0</p>|
|Физ. диск (1.14) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_14,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.23) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.owner-numeric<p>Update: 0</p>|
|Физ. диск (2.12)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_12,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.2) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.2.size-numeric<p>Update: 0</p>|
|Порт (A2) - состояние|<p>Порт 2 из 2 4</p>|`Dependent item`|hp.msa.ports.1.3.health-numeric<p>Update: 0</p>|
|Физ. диск (1.5) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.type<p>Update: 0</p>|
|Физ. диск (1.24) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.16) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (2.9) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.vendor<p>Update: 0</p>|
|Физ. диск (1.18) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.3) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.state<p>Update: 0</p>|
|Контроллер (A) - расположение|<p>-</p>|`Dependent item`|hp.msa.controllers.1.position-numeric<p>Update: 0</p>|
|Физ. диск (1.10) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.vendor<p>Update: 0</p>|
|Контроллер (B) - вирт. диски|<p>-</p>|`Dependent item`|hp.msa.controllers.0.virtual-disks<p>Update: 0</p>|
|Разделы|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-volumes,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.23) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.size-numeric<p>Update: 0</p>|
|Физ. диск (1.10) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.model<p>Update: 0</p>|
|Физ. диск (1.6) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.19) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.location<p>Update: 0</p>|
|Физ. диск (1.15) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.health-numeric<p>Update: 0</p>|
|Физ. диск (2.6) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.6.model<p>Update: 0</p>|
|Физ. диск (1.16) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.16.iops<p>Update: 0</p>|
|Физ. диск (2.1) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.avg-rsp-time<p>Update: 0</p>|
|Вирт. диск (1) - состояние|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.health-numeric<p>Update: 0</p>|
|Физ. диск (1.11) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.17) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.avg-rsp-time<p>Update: 0</p>|
|Внутреннее имя|<p>-</p>|`Dependent item`|hp.msa.system-information.system-name<p>Update: 0</p>|
|Порт (B2) - тип подключения|<p>Порт 2 из 2</p>|`Dependent item`|hp.msa.ports.0.7.media<p>Update: 0</p>|
|Порт (B2) - тип подключения|<p>Порт 2 из 4</p>|`Dependent item`|hp.msa.ports.0.11.media<p>Update: 0</p>|
|Физ. диск (1.22) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.22.smart-count-1<p>Update: 0</p>|
|Физ. диск (1.14) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.14.iops<p>Update: 0</p>|
|Физ. диск (2.3) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.2.3.type<p>Update: 0</p>|
|Физ. диск (1.8) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.led-status-numeric<p>Update: 0</p>|
|Вирт. диск (1) - контроллер|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.23) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.23.smart-count-1<p>Update: 0</p>|
|Физ. диск (1.18) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.size-numeric<p>Update: 0</p>|
|Физ. диск (1.9) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.9.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.10) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.2) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.2.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.12) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.state<p>Update: 0</p>|
|Физ. диск (1.19) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.23) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.10) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.10.health-numeric<p>Update: 0</p>|
|Физ. диск (1.24) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.enclosure-wwn<p>Update: 0</p>|
|Полка (2) - отсеки|<p>-</p>|`Dependent item`|hp.msa.enclosures.2.slots<p>Update: 0</p>|
|Физ. диск (1.19) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.size-numeric<p>Update: 0</p>|
|Порт (A2) - идентификатор|<p>Порт 2 из 2 4</p>|`Dependent item`|hp.msa.ports.1.3.target-id<p>Update: 0</p>|
|Физ. диск (1.9) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.5) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.vendor<p>Update: 0</p>|
|Физ. диск (1.19) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.virtual-disk-serial<p>Update: 0</p>|
|Модель хранилища|<p>-</p>|`Dependent item`|hp.msa.system-information.model<p>Update: 0</p>|
|Физ. диск (1.8) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.8.iops<p>Update: 0</p>|
|Физ. диск (1.19) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.vendor<p>Update: 0</p>|
|Порт (A3) - состояние|<p>Порт 3 из 4</p>|`Dependent item`|hp.msa.ports.1.5.health-numeric<p>Update: 0</p>|
|Физ. диск (1.6) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.6.iops<p>Update: 0</p>|
|Порт (A1) - статус|<p>Порт 1 из 2 4</p>|`Dependent item`|hp.msa.ports.1.1.status-numeric<p>Update: 0</p>|
|Физ. диск (2.5) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.2.5.size-numeric<p>Update: 0</p>|
|Физ. диск (1.21) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.9) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.state<p>Update: 0</p>|
|Физ. диск (1.24) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.11) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.model<p>Update: 0</p>|
|Физ. диск (1.9) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.vendor<p>Update: 0</p>|
|Физ. диск (1.12) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_12,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.17) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.17.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.24) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.size-numeric<p>Update: 0</p>|
|Физ. диск (1.1) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.1.state<p>Update: 0</p>|
|Физ. диск (1.23) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.type<p>Update: 0</p>|
|Физ. диск (1.6) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.6.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (2.4) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.2.4.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.1) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_1,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (2.7) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.vendor<p>Update: 0</p>|
|Физ. диск (1.7) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.size-numeric<p>Update: 0</p>|
|Физ. диск (1.22) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.22.number-of-media-errors-1<p>Update: 0</p>|
|Блок питания (1.2)|<p>Исходные данные по БП 2 Полки 1</p>|`Telnet agent`|telnet.run[hp-msa-power-supplies-1_2,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.21) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.type<p>Update: 0</p>|
|Физ. диск (1.13) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.model<p>Update: 0</p>|
|Физ. диск (1.11) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.size-numeric<p>Update: 0</p>|
|Порт (A3) - идентификатор|<p>Порт 3 из 4</p>|`Dependent item`|hp.msa.ports.1.5.target-id<p>Update: 0</p>|
|Физ. диск (1.5) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.5.virtual-disk-serial<p>Update: 0</p>|
|Физ. диск (1.1) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.1.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (2.3)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_3,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Порт (B4) - статус|<p>Порт 4 из 4</p>|`Dependent item`|hp.msa.ports.0.15.status-numeric<p>Update: 0</p>|
|Физ. диск (1.22) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.22.number-of-bad-blocks-1<p>Update: 0</p>|
|Вирт. диск (2) - свободно|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.freespace-numeric<p>Update: 0</p>|
|Физ. диск (2.11)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_11,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.12) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.vendor<p>Update: 0</p>|
|Физ. диск (2.7) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.7.location<p>Update: 0</p>|
|Физ. диск (1.16) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.16.size-numeric<p>Update: 0</p>|
|Физ. диск (1.13) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.13.size-numeric<p>Update: 0</p>|
|Полка (2)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-enclosures-2,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.17) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.17.vendor<p>Update: 0</p>|
|Физ. диск (1.23) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.23.model<p>Update: 0</p>|
|Физ. диск (1.20) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.virtual-disk-serial<p>Update: 0</p>|
|Вирт. диск (1) - статус|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.status<p>Update: 0</p>|
|Физ. диск (1.11) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.11.smart-count-1<p>Update: 0</p>|
|Физ. диск (1.7) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.7.vendor<p>Update: 0</p>|
|Физ. диск (1.12) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.model<p>Update: 0</p>|
|Физ. диск (2.2) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.2.2.vendor<p>Update: 0</p>|
|Физ. диск (1.12) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.12.iops<p>Update: 0</p>|
|Контроллер (A) - вирт. диски|<p>-</p>|`Dependent item`|hp.msa.controllers.1.virtual-disks<p>Update: 0</p>|
|Порты|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-ports,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.6) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_6,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.18)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_18,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Расположение|<p>-</p>|`Dependent item`|hp.msa.system-information.system-location<p>Update: 0</p>|
|Порт (A1) - состояние|<p>Порт 1 из 2 4</p>|`Dependent item`|hp.msa.ports.1.1.health-numeric<p>Update: 0</p>|
|Физ. диск (2.7)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-2_7,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.15) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.size-numeric<p>Update: 0</p>|
|Физ. диск (1.17) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.17.iops<p>Update: 0</p>|
|Вирт. диск (2) - статус|<p>-</p>|`Dependent item`|hp.msa.vdisks.2.status<p>Update: 0</p>|
|Физ. диск (1.3) - тип|<p>-</p>|`Dependent item`|hp.msa.disks.1.3.type<p>Update: 0</p>|
|Физ. диск (1.22) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_22,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|БП (2.2) - вентилятор|<p>-</p>|`Dependent item`|hp.msa.power-supplies.2.2.fan.health-numeric<p>Update: 0</p>|
|Физ. диск (1.20) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.9) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.model<p>Update: 0</p>|
|Физ. диск (1.21) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.21.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.19) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.19.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.16) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_16,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.11) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.11.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.19) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.model<p>Update: 0</p>|
|Физ. диск (1.8) - номер вирт. диска|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.virtual-disk-serial<p>Update: 0</p>|
|Вирт. диск (1) - тип дисков|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.array-drive-type<p>Update: 0</p>|
|Физ. диск (1.8) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.8.state<p>Update: 0</p>|
|Физ. диск (1.3) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.3.smart-count-1<p>Update: 0</p>|
|Физ. диск (1.24) - производительность|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.24.iops<p>Update: 0</p>|
|Физ. диск (2.8) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.location<p>Update: 0</p>|
|Физ. диск (2.9) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.state<p>Update: 0</p>|
|Физ. диск (1.22) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.model<p>Update: 0</p>|
|Физ. диск (1.15) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (2.10) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.2.10.state<p>Update: 0</p>|
|Порт (B4) - идентификатор|<p>Порт 4 из 4</p>|`Dependent item`|hp.msa.ports.0.15.target-id<p>Update: 0</p>|
|Вирт. диск (1) - имя|<p>-</p>|`Dependent item`|hp.msa.vdisks.1.name<p>Update: 0</p>|
|Физ. диск (1.20) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.12) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.12.location<p>Update: 0</p>|
|Физ. диск (2.11) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.11.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.11) - состояние|<p>-</p>|`Dependent item`|hp.msa.disks.1.11.health-numeric<p>Update: 0</p>|
|Физ. диск (1.24) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_24,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.24) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.model<p>Update: 0</p>|
|Полка (1) - физ. диски|<p>-</p>|`Dependent item`|hp.msa.enclosures.1.number-of-disks<p>Update: 0</p>|
|Физ. диск (1.20) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.20.vendor<p>Update: 0</p>|
|Физ. диск (2.8) - идентификатор полки|<p>-</p>|`Dependent item`|hp.msa.disks.2.8.enclosure-wwn<p>Update: 0</p>|
|Физ. диск (1.18) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.18.smart-count-1<p>Update: 0</p>|
|Физ. диск (1.4) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.model<p>Update: 0</p>|
|Физ. диск (1.24) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.24.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (2.1) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.2.1.location<p>Update: 0</p>|
|Физ. диск (1.18) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.18.state<p>Update: 0</p>|
|Физ. диск (1.15) - производитель|<p>-</p>|`Dependent item`|hp.msa.disks.1.15.vendor<p>Update: 0</p>|
|Физ. диск (1.10) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.10.number-of-bad-blocks-1<p>Update: 0</p>|
|Полка (1)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-enclosures-1,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Порт (B3) - статус|<p>Порт 3 из 4</p>|`Dependent item`|hp.msa.ports.0.13.status-numeric<p>Update: 0</p>|
|Физ. диск (1.7) - статистика|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disk-statistics-1_7,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.24) - SMART|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.24.smart-count-1<p>Update: 0</p>|
|Физ. диск (2.9) - модель|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.model<p>Update: 0</p>|
|БП (2.1) - модель|<p>-</p>|`Dependent item`|hp.msa.power-supplies.2.1.model<p>Update: 0</p>|
|Физ. диск (2.9) - индикатор|<p>-</p>|`Dependent item`|hp.msa.disks.2.9.led-status-numeric<p>Update: 0</p>|
|Физ. диск (1.22) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.22.size-numeric<p>Update: 0</p>|
|Физ. диск (1.9) - ср. время отклика|<p>-</p>|`Dependent item`|hp.msa.disks.1.9.avg-rsp-time<p>Update: 0</p>|
|Физ. диск (1.24) - расположение|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.location<p>Update: 0</p>|
|Физ. диск (1.2) - плохие сектора|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.2.number-of-bad-blocks-1<p>Update: 0</p>|
|Физ. диск (1.4) - объём|<p>-</p>|`Dependent item`|hp.msa.disks.1.4.size-numeric<p>Update: 0</p>|
|Физ. диск (1.7) - ошибки|<p>-</p>|`Dependent item`|hp.msa.disk-statistics.1.7.number-of-media-errors-1<p>Update: 0</p>|
|Физ. диск (1.19) - контроллер|<p>-</p>|`Dependent item`|hp.msa.disks.1.19.owner-numeric<p>Update: 0</p>|
|Физ. диск (1.14) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.14.state<p>Update: 0</p>|
|Физ. диск (1.11)|<p>-</p>|`Telnet agent`|telnet.run[hp-msa-disks-1_11,{HOST.CONN},23,utf8]<p>Update: 1h</p>|
|Физ. диск (1.24) - использование|<p>-</p>|`Dependent item`|hp.msa.disks.1.24.state<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

