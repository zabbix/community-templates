# Nginx

## Description

Nginx template created by Alireza Zabihi zabihi.a.r@gmail.com

## Overview

Zabbix 4 Nginx monitoring by Alireza Zabihi based on Alex Gluck solution.


Connection Statistics:


* Active
* Reading
* Waiting
* Writing
* Requests pro connection
* Request Statistics:
* Accepted
* Handled
* Total


Linux and Nginx performance monitoring:


* File descriptors (Maximum and Current)
* CPU Cores
* Worker\_Connections
* Worker\_Processes
* Maximum supported connection depended on configuration
* Nginx service status


and ...


<ul style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; padding-left: 2em; co</p>



## Author

Alireza Zabihi

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Reading connections|<p>The current number of connections where nginx is reading the request header.</p>|`Zabbix agent`|nginx[reading]<p>Update: 120s</p>|
|Waiting connections|<p>The current number of idle client connections waiting for a request.</p>|`Zabbix agent`|nginx[waiting]<p>Update: 120s</p>|
|Handled connections|<p>The total number of handled connections. Generally, the parameter value is the same as accepts unless some resource limits have been reached.</p>|`Zabbix agent`|nginx[handled]<p>Update: 120s</p>|
|Maximum file descriptors|<p>-</p>|`Zabbix agent`|nginx[max_file_descriptors]<p>Update: 24h</p>|
|Active connections|<p>The current number of active client connections including Waiting connections.</p>|`Zabbix agent`|nginx[active]<p>Update: 120s</p>|
|Accepted connections|<p>The total number of accepted client connections. handled</p>|`Zabbix agent`|nginx[accepts]<p>Update: 120s</p>|
|Number of requests per connection|<p>-</p>|`Zabbix agent`|nginx[req_per_conn]<p>Update: 120s</p>|
|Number of maximum worker_connections per Process|<p>-</p>|`Zabbix agent`|nginx[worker_connections]<p>Update: 12h</p>|
|Number of Maximum supported connection depend on Configuration|<p>worker_processes * worker_connections</p>|`Calculated`|nginx_max_connctions<p>Update: 12h</p>|
|Nginx service status|<p>Nginx service status</p>|`Zabbix agent`|nginx[check]<p>Update: 60s</p>|
|Writing connections|<p>The current number of connections where nginx is writing the response back to the client.</p>|`Zabbix agent`|nginx[writing]<p>Update: 120s</p>|
|CPU Cores|<p>Number of all CPU Cores on the system</p>|`Zabbix agent`|nginx[cpu_cores]<p>Update: 24h</p>|
|Current open file descriptors|<p>-</p>|`Zabbix agent`|nginx[open_file_descriptors]<p>Update: 240s</p>|
|Number of perfork Nginx processes|<p>-</p>|`Zabbix agent`|nginx[worker_processes]<p>Update: 12h</p>|
|Handles requests|<p>The total number of client requests.</p>|`Zabbix agent`|nginx[requests]<p>Update: 120s</p>|


## Triggers

There are no triggers in this template.

