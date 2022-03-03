# OS Windows Server

## Description

Шаблон подходит для ОС Windows Server 2012, 2016. Посетите. Группа ВК:https://vk.com/simplezabbix Видео про шаблон:https://youtu.be/FWqFyRu8hmQ

## Overview

Данный шаблон основан на счетчиках производительности Windows. Низкоуровневое обнаружение сетевых интерфейсов и дисков используется для создания ключей "perf\_counter[счетчик,<период>]"


Посетите.


Группа ВК:https://vk.com/simplezabbix


 


Видео про шаблон:https://youtu.be/FWqFyRu8hmQ



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|discovery service|<p>Обнаружение служб Windows</p>|`Zabbix agent`|service.discovery<p>Update: 24h</p>|
|discovery Interface|<p>Обнаружение сетевых интрефейсов</p>|`Zabbix agent`|net.if.discovery<p>Update: 24h</p>|
|discovery local disk|<p>Обнаружение дисков</p>|`Zabbix agent`|vfs.fs.discovery<p>Update: 24h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Проверка Cертификата|<p>-</p>|`Zabbix agent`|system.run[Powershell.exe "& {(Get-ChildItem -Path cert: -Recurse -ExpiringInDays 45 | where {$_.PSPath -notmatch 'Remote Desktop' -and $_.PSPath -notmatch 'Operations Manager'}).subject}"]<p>Update: 4h</p>|
|Проверка по ICMP (ping)|<p>-</p>|`Simple check`|icmpping<p>Update: 1m</p>|
|Memory Capacity (Physical) Bytes|<p>Размер физической памяти</p>|`Zabbix agent`|system.run[Powershell.exe "((Get-WmiObject Win32_PhysicalMemory).Capacity | Measure-Object -Sum).Sum"]<p>Update: 24h</p>|
|Process Total Private Bytes|<p>показывает объем выделенной памяти для процесса. Если сумма всех private bytes для всех процессов превысит предел памяти, описанный выше, это значит, что в системе образовалась нехватка памяти и приложения будут отказывать</p>|`Zabbix agent`|perf_counter["\Process(_Total)\Private Bytes",300]<p>Update: 5m</p>|
|Processor Queue Length|<p>Показания счетчика действительно очень важны для поиска проблем с производительностью процессора. Постоянное наличие большой очереди запросов к ЦП явно свидетельствует о том, что процессор не справляется с обработкой данных и является узким местом.</p>|`Zabbix agent`|perf_counter["\System\Processor Queue Length",60]<p>Update: 1m</p>|
|Системное время UTC|<p>-</p>|`Zabbix agent`|system.localtime[utc]<p>Update: 1m</p>|
|Processor Time|<p>Загруженность процессора в % (среднее значение за 1 минуту)</p>|`Zabbix agent`|perf_counter["\Processor(_Total)\% Processor Time",60]<p>Update: 1m</p>|
|Processor Context Switches|<p>в многозадачных ОС и средах - процесс прекращения выполнения процессором одной задачи (процесса, потока, нити) с сохранением всей необходимой информации и состояния, необходимых для последующего продолжения с прерванного места, и восстановления и загрузки состояния задачи, к выполнению которой переходит процессор.</p>|`Zabbix agent`|perf_counter["\System\Context Switches/sec",60]<p>Update: 1m</p>|
|Memory Commit Limit|<p>показывает максимальный объем памяти, который может быть выделен системой. Обычно это фиксированная величина, которая определяется операционной системой</p>|`Zabbix agent`|perf_counter["\Memory\Commit Limit",300]<p>Update: 5m</p>|
|Memory Available (Physical) %|<p>Процент используемой физической памяти</p>|`Calculated`|MemoryAvailablePhysicalProc<p>Update: 1m</p>|
|Memory Available Bytes|<p>-</p>|`Zabbix agent`|perf_counter["\Memory\Available Bytes",60]<p>Update: 1m</p>|
|Проверка статуса Firewall|<p>Для работы нужно добавить в файл конфигурации zabbix агента #CheckFirewall UserParameter=CheckFirewall, PowerShell.exe "(Get-NetFirewallProfile -Profile Domain,Public,Private).enabled"</p>|`Zabbix agent`|CheckFirewall<p>Update: 4h</p>|
|Проверка Обновлений|<p>Если в системе нет установленных обновлений, то элемент данных станет не поддерживаемый. Так как скрипт выдает ошибку. Для работы нужно добавить в файл конфигурации zabbix агента и разместить PS скрипт в папке. #UpdateWindows UserParameter=Update, PowerShell.exe -File "C: Program Files Zabbix lastDateUpdate.ps1"</p>|`Zabbix agent`|system.run["PowerShell.exe [int][double]::Parse((Get-Date((Get-ItemProperty -Path Registry::'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\Results\Install').LastSuccessTime) -UFormat %s))"]<p>Update: 4h</p>|
|Memory Committed Bytes In Use %|<p>Соотношение величин счетчиков Commited Bytes и Commit Limit. Следя за счетчиком %Committed Bytes In Use, можно увидеть, что при достижении им величины 100% система начнет увеличивать размеры файла подкачки, пытаясь удовлетворить растущие запросы на память.</p>|`Zabbix agent`|perf_counter["\Memory\% Committed Bytes In Use",300]<p>Update: 5m</p>|
|Состояние службы {#SERVICE.DISPLAYNAME}|<p>Описание: {#SERVICE.DESCRIPTION}</p>|`Zabbix agent`|service.info[{#SERVICE.NAME}]<p>Update: 3m</p><p>LLD</p>|
|Interface:{#IFNAME}, Received Bytes/sec|<p>-</p>|`Zabbix agent`|perf_counter["\Network Interface({#IFNAME})\Bytes Received/sec",60]<p>Update: 1m</p><p>LLD</p>|
|Interface:{#IFNAME}, Sent Bytes/sec|<p>-</p>|`Zabbix agent`|perf_counter["\Network Interface({#IFNAME})\Bytes Sent/sec",60]<p>Update: 1m</p><p>LLD</p>|
|Interface:{#IFNAME}, Current Bandwidth|<p>-</p>|`Zabbix agent`|perf_counter["\Network Interface({#IFNAME})\Current Bandwidth",]<p>Update: 24h</p><p>LLD</p>|
|Interface:{#IFNAME}, Output Queue Length|<p>Счетчик фиксирует длину очереди исходящих пакетов адаптера. Приемлемыми считаются значения 1 и 2. Но если этот показатель часто достигает уровня 3, 4 или более высоких отметок, это значит, что сетевой адаптер ввода/вывода не справляется с запросами сервера на передачу данных в сеть.</p>|`Zabbix agent`|perf_counter["\Network Interface({#IFNAME})\Output Queue Length",300]<p>Update: 5m</p><p>LLD</p>|
|Interface:{#IFNAME}, Utilization Received|<p>-</p>|`Calculated`|UtilizationReceived.[{#IFNAME}]<p>Update: 1m</p><p>LLD</p>|
|Interface:{#IFNAME}, Utilization Sent|<p>-</p>|`Calculated`|UtilizationSent.[{#IFNAME}]<p>Update: 1m</p><p>LLD</p>|
|LogicalDisk {#FSNAME} Disk Time %|<p>Тип файловой системы:{#FSTYPE} Тип диска:{#FSDRIVETYPE} Счетчик отображает, какую часть времени диск расходует на обслуживание запросов на чтение и запись. Если его значения стабильно сохраняются на уровне вблизи отметки 100%, система работает с диском весьма интенсивно. Если же идет постоянный активный обмен данными и при этом создаются большие очереди, возможно, что дисковая подсистема не справляется с нагрузкой. В типичных условиях эксплуатации значение этого счетчика не должно превышать 50.</p>|`Zabbix agent`|perf_counter["\LogicalDisk({#FSNAME})\% Disk Time",300]<p>Update: 5m</p><p>LLD</p>|
|LogicalDisk {#FSNAME} Free Space|<p>Тип файловой системы:{#FSTYPE} Тип диска:{#FSDRIVETYPE}</p>|`Zabbix agent`|perf_counter["\LogicalDisk({#FSNAME})\% Free Space",300]<p>Update: 5m</p><p>LLD</p>|
|LogicalDisk {#FSNAME} Avg. Disk Queue Length|<p>Тип файловой системы:{#FSTYPE} Тип диска:{#FSDRIVETYPE} Показатель этого счетчика отражает среднее число ожидающих обработки запросов к диску на ввод и вывод данных. Если он стабильно выше 2, значит, в диске образовался «затор».</p>|`Zabbix agent`|perf_counter["\LogicalDisk({#FSNAME})\Avg. Disk Queue Length",60]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface:{#IFNAME}, Output Queue Length > 3|<p>Счетчик фиксирует длину очереди исходящих пакетов адаптера. Приемлемыми считаются значения 1 и 2. Но если этот показатель часто достигает уровня 3, 4 или более высоких отметок, это значит, что сетевой адаптер ввода/вывода не справляется с запросами сервера на передачу данных в сеть.</p>|<p>**Expression**: last(/OS Windows Server/perf_counter[" Network Interface({#IFNAME}) Output Queue Length",300])>3</p><p>**Recovery expression**: </p>|warning|
|Interface:{#IFNAME}, Utilization Received > 50%|<p>Utilization Received = {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/OS Windows Server/UtilizationReceived.[{#IFNAME}])>50</p><p>**Recovery expression**: </p>|information|
|Interface:{#IFNAME}, Utilization Received > 90%|<p>Utilization Received = {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/OS Windows Server/UtilizationReceived.[{#IFNAME}])>90</p><p>**Recovery expression**: </p>|high|
|Interface:{#IFNAME}, Utilization Sent > 50%|<p>Utilization Sent = {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/OS Windows Server/UtilizationSent.[{#IFNAME}])>50</p><p>**Recovery expression**: </p>|information|
|Interface:{#IFNAME}, Utilization Sent > 90%|<p>Utilization Sent = {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/OS Windows Server/UtilizationSent.[{#IFNAME}])>90</p><p>**Recovery expression**: </p>|high|
|Состояние службы {#SERVICE.DISPLAYNAME} = {ITEM.LASTVALUE}|<p>Состояние службы {#SERVICE.DISPLAYNAME} = {ITEM.LASTVALUE} Если отслеживать состояние службы не нужно, просто отключите триггер</p>|<p>**Expression**: last(/OS Windows Server/service.info[{#SERVICE.NAME}])<>0</p><p>**Recovery expression**: </p>|high|
|LogicalDisk {#FSNAME} Avg. Disk Queue Length > 2 (15 min)|<p>Среднее значение за 15 минут > 2 Показатель этого счетчика отражает среднее число ожидающих обработки запросов к диску на ввод и вывод данных. Если он стабильно выше 2, значит, в диске образовался «затор».</p>|<p>**Expression**: avg(/OS Windows Server/perf_counter[" LogicalDisk({#FSNAME}) Avg. Disk Queue Length",60],15m)>2</p><p>**Recovery expression**: </p>|warning|
|LogicalDisk {#FSNAME} Avg. Disk Queue Length > 10 (3 min)|<p>Среднее значение за 3 минут > 10 Показатель этого счетчика отражает среднее число ожидающих обработки запросов к диску на ввод и вывод данных. Если он стабильно выше 10, значит, у системы серьезные проблема с производительностью диска.</p>|<p>**Expression**: avg(/OS Windows Server/perf_counter[" LogicalDisk({#FSNAME}) Avg. Disk Queue Length",60],3m)>10</p><p>**Recovery expression**: </p>|high|
|LogicalDisk {#FSNAME} Free Space < 5%|<p>-</p>|<p>**Expression**: last(/OS Windows Server/perf_counter[" LogicalDisk({#FSNAME}) % Free Space",300])<5</p><p>**Recovery expression**: </p>|high|
|LogicalDisk {#FSNAME} Free Space < 15%|<p>-</p>|<p>**Expression**: last(/OS Windows Server/perf_counter[" LogicalDisk({#FSNAME}) % Free Space",300])<15</p><p>**Recovery expression**: </p>|average|
|Состояние службы {#SERVICE.DISPLAYNAME} = {ITEM.LASTVALUE} (LLD)|<p>Состояние службы {#SERVICE.DISPLAYNAME} = {ITEM.LASTVALUE} Если отслеживать состояние службы не нужно, просто отключите триггер</p>|<p>**Expression**: last(/OS Windows Server/service.info[{#SERVICE.NAME}])<>0</p><p>**Recovery expression**: </p>|high|
|Interface:{#IFNAME}, Output Queue Length > 3 (LLD)|<p>Счетчик фиксирует длину очереди исходящих пакетов адаптера. Приемлемыми считаются значения 1 и 2. Но если этот показатель часто достигает уровня 3, 4 или более высоких отметок, это значит, что сетевой адаптер ввода/вывода не справляется с запросами сервера на передачу данных в сеть.</p>|<p>**Expression**: last(/OS Windows Server/perf_counter[" Network Interface({#IFNAME}) Output Queue Length",300])>3</p><p>**Recovery expression**: </p>|warning|
|Interface:{#IFNAME}, Utilization Received > 50% (LLD)|<p>Utilization Received = {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/OS Windows Server/UtilizationReceived.[{#IFNAME}])>50</p><p>**Recovery expression**: </p>|information|
|Interface:{#IFNAME}, Utilization Received > 90% (LLD)|<p>Utilization Received = {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/OS Windows Server/UtilizationReceived.[{#IFNAME}])>90</p><p>**Recovery expression**: </p>|high|
|Interface:{#IFNAME}, Utilization Sent > 50% (LLD)|<p>Utilization Sent = {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/OS Windows Server/UtilizationSent.[{#IFNAME}])>50</p><p>**Recovery expression**: </p>|information|
|Interface:{#IFNAME}, Utilization Sent > 90% (LLD)|<p>Utilization Sent = {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/OS Windows Server/UtilizationSent.[{#IFNAME}])>90</p><p>**Recovery expression**: </p>|high|
|LogicalDisk {#FSNAME} Avg. Disk Queue Length > 2 (15 min) (LLD)|<p>Среднее значение за 15 минут > 2 Показатель этого счетчика отражает среднее число ожидающих обработки запросов к диску на ввод и вывод данных. Если он стабильно выше 2, значит, в диске образовался «затор».</p>|<p>**Expression**: avg(/OS Windows Server/perf_counter[" LogicalDisk({#FSNAME}) Avg. Disk Queue Length",60],15m)>2</p><p>**Recovery expression**: </p>|warning|
|LogicalDisk {#FSNAME} Avg. Disk Queue Length > 10 (3 min) (LLD)|<p>Среднее значение за 3 минут > 10 Показатель этого счетчика отражает среднее число ожидающих обработки запросов к диску на ввод и вывод данных. Если он стабильно выше 10, значит, у системы серьезные проблема с производительностью диска.</p>|<p>**Expression**: avg(/OS Windows Server/perf_counter[" LogicalDisk({#FSNAME}) Avg. Disk Queue Length",60],3m)>10</p><p>**Recovery expression**: </p>|high|
|LogicalDisk {#FSNAME} Free Space < 5% (LLD)|<p>-</p>|<p>**Expression**: last(/OS Windows Server/perf_counter[" LogicalDisk({#FSNAME}) % Free Space",300])<5</p><p>**Recovery expression**: </p>|high|
|LogicalDisk {#FSNAME} Free Space < 15% (LLD)|<p>-</p>|<p>**Expression**: last(/OS Windows Server/perf_counter[" LogicalDisk({#FSNAME}) % Free Space",300])<15</p><p>**Recovery expression**: </p>|average|
