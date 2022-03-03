# Exchange Mailbox Servers_RU

## Overview

39 Items, 5 Triggers 13 Graphs and 6 Screens built from Exchange 2010 Client Access Server Performance Counters for advanced troubleshooting, trending and capacity planning.


Изменены названия Performance Couters для поддержки русской версии сервера Exchange



## Author

Stephen E. Fritz

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Microsoft Exchange Transport Log Search|<p>Provides remote search capability for Microsoft Exchange Transport log files. On Hub Transport servers, this service is dependent upon the Microsoft Exchange Active Directory Topology service. On Edge Transport servers, this service is dependent upon the Microsoft Exchange ADAM service.</p>|`Zabbix agent`|service_state[MSExchangeTransportLogSearch]<p>Update: 30</p>|
|Microsoft Search (Exchange Server)|<p>This is a Microsoft Exchange-customized version of Microsoft Search. This service is dependent on the RPC service.</p>|`Zabbix agent`|service_state[msftesql-Exchange]<p>Update: 30</p>|
|Microsoft Exchange Search Indexer|<p>Drives indexing of mailbox content, which improves the performance of content search. This service is dependent upon the Microsoft Exchange Active Directory Topology and Microsoft Search (Exchange Server) services.</p>|`Zabbix agent`|service_state[MSExchangeSearch]<p>Update: 30</p>|
|MSExchangeIS Средняя задержка RPC|<p>Indicates the RPC latency, in ms, averaged for all operations in the last 1,024 packets. For information about how clients are affected when overall server RPC averaged latencies increase, see Understanding Client Throttling Policies. Shouldn't be higher than 100 ms on average. To determine if certain protocols are causing overall RPC latencies, monitor MSExchangeIS Client (*) RPC Average Latency to separate latencies based on client protocol.</p>|`Zabbix agent`|perf_counter["\MSExchangeIS\Средняя задержка RPC"]<p>Update: 30</p>|
|Почтовый ящик банка данных MSExchange Средняя задержка RPC (клиент)|<p>RPC Average Latency is a server RPC latency, in ms, averaged for the past 1,024 packets. Should be less than 50 ms on average for each client. Wide disparities between different client types, such as IMAP4, Microsoft Outlook Anywhere, or other clients (MAPI), can help direct troubleshooting to appropriate subcomponents.</p>|`Zabbix agent`|perf_counter["\Почтовый ящик банка данных MSExchange(*)\Средняя задержка RPC (клиент)"]<p>Update: 30</p>|
|Microsoft Exchange Server Extension for Windows Server Backup|<p>Enables Windows Server Backup users to back up and recover application data for Microsoft Exchange. This service has no dependencies.</p>|`Zabbix agent`|service_state[WSBExchange]<p>Update: 30</p>|
|Microsoft Exchange System Attendant|<p>Forwards directory lookups to a global catalog server for legacy Outlook clients, generates e-mail addresses and OABs, updates free/busy information for legacy clients, and maintains permissions and group memberships for the server. If this service is disabled, any services that explicitly depend on it will fail to start. This service is dependent on the RPC, Server, Windows Event Log, and Workstation services.</p>|`Zabbix agent`|service_state[MSExchangeSA]<p>Update: 30</p>|
|Exchange Mailbox IS Клиент: неудачных RPC/с|<p>Shows the client-reported rate of failed RPCs (since the store was started). Should be 0 at all times. Higher values may indicate RPC threads are exhausted or client throttling is occurring for clients running versions of Outlook earlier than Office Outlook 2007.</p>|`Zabbix agent`|perf_counter["\MSExchangeIS\Клиент: неудачных RPC/с"]<p>Update: 30</p>|
|Отправка почты MSExchange Серверов-концентраторов в состоянии повторной попытки|<p>Shows the number of Hub Transport servers in retry mode. Should be 0 at all times.</p>|`Zabbix agent`|perf_counter["\Отправка почты MSExchange(*)\Серверов-концентраторов в состоянии повторной попытки"]<p>Update: 30</p>|
|Exchange Mailbox Database Записанных в журнал байтов/с|<p>Shows the rate of bytes written to the log. Should be less than 10,000,000 at all times. With each log file being 1,000,000 bytes in size, 10,000,000 bytes/sec would yield 10 logs per second. This may indicate a large message being sent or a looping message.</p>|`Zabbix agent`|perf_counter["\MSExchange Database(*)\Записанных в журнал байтов/с"]<p>Update: 30</p>|
|Помощник по ведению календаря MSExchange Ошибок запросов|<p>Shows the total number of failures that occurred while the Calendar Attendant was processing events. Should be 0 at all times.</p>|`Zabbix agent`|perf_counter["\Помощник по ведению календаря MSExchange\Ошибок запросов"]<p>Update: 30</p>|
|Интерфейс хранилища MSExchange Неудачных запросов RPC (%)|<p>Shows the percentage of failed requests in the total number of RPC requests. Failed means the sum of failed with error code plus failed with exception. Should be less than 1 at all times.</p>|`Zabbix agent`|perf_counter["\Интерфейс хранилища MSExchange(*)\Неудачных запросов RPC (%)"]<p>Update: 30</p>|
|\Интерфейс хранилища MSExchange Медленных запросов RPC (%)|<p>Shows the percentage of slow RPC requests among all RPC requests. A slow RPC request is one that has taken more than 500 ms. Should be less than 1 at all times.</p>|`Zabbix agent`|perf_counter["\Интерфейс хранилища MSExchange(*)\Медленных запросов RPC (%)"]<p>Update: 30</p>|
|База данных MSExchange ==> Экземпляры(*)\Средняя задержка при чтении в процессе ввода-вывода для (прикрепленной) базы данных|<p>Shows the average length of time, in ms, per database read operation. Should be 20 ms on average. Should show 50 ms spikes.</p>|`Zabbix agent`|perf_counter["\База данных MSExchange ==> Экземпляры(*)\Средняя задержка при чтении в процессе ввода-вывода для (прикрепленной) базы данных"]<p>Update: 30</p>|
|Отправка почты MSExchange Временных сбоев отправки/с|<p>Shows the number of temporary submission failures per second. Should be 0 at all times.</p>|`Zabbix agent`|perf_counter["\Отправка почты MSExchange(*)\Временных сбоев отправки/с"]<p>Update: 30</p>|
|MSExchangeIS (общие папки) Размер очереди получения репликации|<p>Shows the number of replication messages waiting to be processed. Should be less than 100 at all times. This value should return to a minimum value between replication intervals.</p>|`Zabbix agent`|perf_counter["\MSExchangeIS (общие папки)(*)\Размер очереди получения репликации"]<p>Update: 30</p>|
|Почтовый ящик банка данных MSExchange Средняя задержка RPC|<p>Indicates the RPC latency, in ms, averaged for all operations in the last 1,024 packets. Shouldn't be higher than 100 ms on average.</p>|`Zabbix agent`|perf_counter["\Почтовый ящик банка данных MSExchange(*)\Средняя задержка RPC"]<p>Update: 30</p>|
|Exchange Mailbox Database Ожидающих потоков журнала|<p>Shows the number of threads waiting for their data to be written to the log to complete an update of the database. If this number is too high, the log may be a bottleneck. Should be less than 10 on average. Regular spikes concurrent with log record stall spikes indicate that the transaction log disks are a bottleneck. If the value for log threads waiting is more than the spindles available for the logs, there is a bottleneck on the log disks.</p>|`Zabbix agent`|perf_counter["\MSExchange Database(*)\Ожидающих потоков журнала"]<p>Update: 30</p>|
|Интерфейс хранилища MSExchange(_Total) Средняя задержка RPC (мс)|<p>Shows the average latency, in ms, of RPC requests. The average is calculated over all RPCs since exrpc32 was loaded. Should be less than 100 ms at all times.</p>|`Zabbix agent`|perf_counter["\Интерфейс хранилища MSExchange(_Total)\Средняя задержка RPC (мс)"]<p>Update: 30</p>|
|Microsoft Exchange Replication Service|<p>Provides replication functionality for mailbox databases on Mailbox servers in a database availability group (DAG) and database mount functionality for all Mailbox servers. This service is dependent upon the Microsoft Exchange Active Directory Topology service.</p>|`Zabbix agent`|service_state[MSExchangeRepl]<p>Update: 30</p>|
|MSExchangeIS Запросов RPC|<p>Indicates the overall RPC requests currently executing within the information store process. Should be below 70 at all times.</p>|`Zabbix agent`|perf_counter["\MSExchangeIS\Запросов RPC"]<p>Update: 30</p>|
|MSExchangeIS (общие папки) Сообщений в очереди отправки|<p>Shows the current number of submitted messages not yet processed by the transport layer. Should be less than 20 at all times.</p>|`Zabbix agent`|perf_counter["\MSExchangeIS (общие папки)(*)\Сообщений в очереди отправки"]<p>Update: 30</p>|
|Помощник по занятости MSExchange Количество событий, обработанных с ошибками|<p>Shows the total number of failures that occurred while the Resource Booking Attendant was processing events. Should be 0 at all times.</p>|`Zabbix agent`|perf_counter["\Помощник по занятости MSExchange\Количество событий, обработанных с ошибками"]<p>Update: 30</p>|
|Exchange Mailbox Database Ожиданий записи в журнал/с|<p>Shows the number of log records that can't be added to the log buffers per second because the log buffers are full. If this counter is nonzero for a long period of time, the log buffer size may be a bottleneck. The average value should be below 10 per second. Spikes (maximum values) shouldn't be higher than 100 per second. If I/O log write latencies are high, check for RAID5 or synchronize replication on log devices. You can also use the MSExchange Database Instances (Information store/<Database Name>) log record stalls/sec counter to determine which database(s) may be having issues. This will assist you in determining which drive(s) to focus on. This counter is an extended Exchange counter in Performance Monitor.</p>|`Zabbix agent`|perf_counter["\MSExchange Database(*)\Ожиданий записи в журнал/с"]<p>Update: 30</p>|
|База данных MSExchange ==> Экземпляры(*)\Средняя задержка при записи в процессе ввода-вывода для (прикрепленной) базы данных|<p>Shows the average length of time, in ms, per database write operation. Should be 50 ms on average. Spikes of up to 100 ms are acceptable if not accompanied by database page fault stalls.</p>|`Zabbix agent`|perf_counter["\База данных MSExchange ==> Экземпляры(*)\Средняя задержка при записи в процессе ввода-вывода для (прикрепленной) базы данных"]<p>Update: 30</p>|
|Microsoft Exchange Information Store|<p>Manages the Exchange Information Store. This includes mailbox databases and public folder databases. If this service is stopped, mailbox databases and public folder databases on this computer are unavailable. If this service is disabled, any services that explicitly depend on it will fail to start. This service is dependent on the RPC, Server, Windows Event Log, and Workstation services.</p>|`Zabbix agent`|service_state[MSExchangeIS]<p>Update: 30</p>|
|Microsoft Exchange Mailbox Assistants|<p>Performs background processing of mailboxes in the Exchange store. This service is dependent upon the Microsoft Exchange Active Directory Topology service.</p>|`Zabbix agent`|service_state[MSExchangeMailboxAssistants]<p>Update: 30</p>|
|Microsoft Exchange Throttling|<p>Limits the rate of user operations. This service is dependent upon the Microsoft Exchange Active Directory Topology service.</p>|`Zabbix agent`|service_state[MSExchangeThrottling]<p>Update: 30</p>|
|Почтовый ящик банка данных MSExchange Сообщений в очереди отправки|<p>Shows the current number of submitted messages not yet processed by the transport layer. Should be below 50 at all times. Shouldn't be sustained for more than 15 minutes. This may indicate connectivity issues to the transport server.</p>|`Zabbix agent`|perf_counter["\Почтовый ящик банка данных MSExchange(*)\Сообщений в очереди отправки"]<p>Update: 30</p>|
|Microsoft Exchange RPC Client Access|<p>Manages client RPC connections for Exchange. This service is dependent upon the Microsoft Exchange Active Directory Topology service.</p>|`Zabbix agent`|service_state[MSExchangeRPC]<p>Update: 30</p>|
|Отправка почты MSExchange Неудачных отправок в секунду|<p>Shows the number of failed submissions per second. Should be 0 at all times.</p>|`Zabbix agent`|perf_counter["\Отправка почты MSExchange(*)\Неудачных отправок в секунду"]<p>Update: 30</p>|
|\Почтовый ящик банка данных MSExchange(_Total) Средняя задержка RPC (клиент)|<p>Shows a server RPC latency, in ms, averaged for the past 1,024 packets for a particular client protocol. Should be less than 50 ms on average for each client. Wide disparities between different client types, such as IMAP4, Microsoft Outlook Anywhere, or other clients (MAPI), can help direct troubleshooting to appropriate subcomponents.</p>|`Zabbix agent`|perf_counter["\Почтовый ящик банка данных MSExchange(_Total)\Средняя задержка RPC (клиент)"]<p>Update: 30</p>|
|Microsoft Exchange Active Directory Topology|<p>Provides Active Directory topology information to Exchange services. If this service is stopped, most Exchange services are unable to start. This service has no dependencies.</p>|`Zabbix agent`|service_state[MSExchangeADTopology]<p>Update: 30</p>|
|Microsoft Exchange Mail Submission Service|<p>Submits messages from the Mailbox server to Exchange 2010 Hub Transport servers. This service is dependent upon the Microsoft Exchange Active Directory Topology service.</p>|`Zabbix agent`|service_state[MSExchangeMailSubmission]<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

