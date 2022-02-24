# App IIS Service

## Overview

16 Items, 4 Triggers 5 Graphs and 2 Screens built for IIS 7.5, 8.0, 8.5 and 10 Services, Ports and Performance Counters.


Developed through "Template Windows 2008 R2 IIS Server" template. ([https://share.zabbix.com/cat-app/web-servers/template-windows-2008-r2-iis-server](cat-app/web-servers/template-windows-2008-r2-iis-server))



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IIS Web Service(_Total) Bytes Received/sec|<p>Rate of total bytes transferred by service (received)</p>|`Zabbix agent`|perf_counter["\Web Service(_Total)\Bytes Received/sec",300]<p>Update: 30</p>|
|IIS World Side Web Publishing Service|<p>World Wide Web Publishing Service</p>|`Zabbix agent`|service_state[W3SVC]<p>Update: 30</p>|
|IIS Web Service Cache Metadata Cache Hits|<p>The ratio of user-mode metadata cache hits to total cache requests (since service startup)</p>|`Zabbix agent`|perf_counter["\Web Service Cache\Metadata Cache Hits",300]<p>Update: 30</p>|
|IIS Web Service Cache Current URIs Cached|<p>URI information blocks currently in the user-mode cache</p>|`Zabbix agent`|perf_counter["\Web Service Cache\Current URIs Cached",300]<p>Update: 30</p>|
|IIS Web Service Cache URI Cache Hits %|<p>The ratio of user-mode URI Cache Hits to total cache requests (since service startup)</p>|`Zabbix agent`|perf_counter["\Web Service Cache\URI Cache Hits %",300]<p>Update: 30</p>|
|IIS Web Service(_Total) Get Requests/sec|<p>Total number of HTTP GET requests received by WWW service</p>|`Zabbix agent`|perf_counter["\Web Service(_Total)\Get Requests/sec",300]<p>Update: 30</p>|
|IIS Service Port 443 (HTTPS)|<p>-</p>|`Zabbix agent`|net.tcp.listen[443]<p>Update: 30</p>|
|IIS Web Service(_Total) Bytes Total/sec|<p>Rate of total bytes transferred by service (sum of bytes sent and received)</p>|`Zabbix agent`|perf_counter["\Web Service(_Total)\Bytes Total/sec",300]<p>Update: 30</p>|
|IIS Web Service Cache Current Metadata Cached|<p>Current number of metadata information blocks currently in the user-mode cache.</p>|`Zabbix agent`|perf_counter["\Web Service Cache\Current Metadata Cached",300]<p>Update: 30</p>|
|IIS Service Port 80 (HTTP)|<p>-</p>|`Zabbix agent`|net.tcp.listen[80]<p>Update: 30</p>|
|IIS Web Service Cache Current Files Cached|<p>Current number of files whose content is in the user-mode cache</p>|`Zabbix agent`|perf_counter["\Web Service Cache\Current Files Cached",300]<p>Update: 30</p>|
|IIS Web Service(_Total) Post Requests/sec|<p>Number of HTTP requests using POST method</p>|`Zabbix agent`|perf_counter["\Web Service(_Total)\Post Requests/sec",300]<p>Update: 30</p>|
|IIS Web Service Cache File Cache Hits %|<p>The ratio of user-mode file cache hits to total cache requests (since service startup). Note: This value might be low if the Kernel URI cache hits percentage is high.</p>|`Zabbix agent`|perf_counter["\Web Service Cache\File Cache Hits %",300]<p>Update: 30</p>|
|IIS Web Service(_Total) Current Connections|<p>Current number of connections to the service</p>|`Zabbix agent`|perf_counter["\Web Service(_Total)\Current Connections",300]<p>Update: 30</p>|
|IIS Admin Service|<p>IIS Admin Service</p>|`Zabbix agent`|service_state[IISAdmin]<p>Update: 30</p>|
|IIS Web Service(_Total) Bytes Sent/sec|<p>Rate of total bytes transferred by service (sent)</p>|`Zabbix agent`|perf_counter["\Web Service(_Total)\Bytes Sent/sec",300]<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

