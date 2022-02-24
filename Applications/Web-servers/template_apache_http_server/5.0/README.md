# Apache

## Overview

This template is for Apache HTTP server monitoring. It contains one master item that connects to HTTP Agent every 10 seconds, requests server-status page, provided by mod-status Apache module and spreads collected information between 18 dependent items. No triggers. See screenshot for details.


Refer to the blog post


<https://blog.zabbix.com/apache-http-server-monitoring/6972>


for even more details.



## Author

Andris Zeila

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Version|<p>-</p>|`Dependent item`|apache.version<p>Update: 0</p>|
|Workers starting up|<p>-</p>|`Dependent item`|apache.workers.starting<p>Update: 0</p>|
|Total traffic|<p>-</p>|`Dependent item`|apache.traffic<p>Update: 0</p>|
|Workers idle cleanup|<p>-</p>|`Dependent item`|apache.workers.cleanup<p>Update: 0</p>|
|CPU load|<p>-</p>|`Dependent item`|apache.cpuload<p>Update: 0</p>|
|Workers reading request|<p>-</p>|`Dependent item`|apache.workers.reading<p>Update: 0</p>|
|Workers finishing|<p>-</p>|`Dependent item`|apache.workers.finishing<p>Update: 0</p>|
|Bytes per second|<p>-</p>|`Dependent item`|apache.bytessec<p>Update: 0</p>|
|Total requests|<p>-</p>|`Dependent item`|apache.requests<p>Update: 0</p>|
|Workers keepalive (read)|<p>-</p>|`Dependent item`|apache.workers.keepalive<p>Update: 0</p>|
|Apache HTTP Server status|<p>-</p>|`HTTP agent`|apache.status<p>Update: 10s</p>|
|Bytes per request|<p>-</p>|`Dependent item`|apache.bytesreq<p>Update: 0</p>|
|Workers sending reply|<p>-</p>|`Dependent item`|apache.workers.sending<p>Update: 0</p>|
|Requests per second|<p>-</p>|`Dependent item`|apache.requestssec<p>Update: 0</p>|
|Workers waiting for connection|<p>-</p>|`Dependent item`|apache.workers.waiting<p>Update: 0</p>|
|Uptime|<p>-</p>|`Dependent item`|apache.uptime<p>Update: 0</p>|
|Workers DNS lookup|<p>-</p>|`Dependent item`|apache.workers.dnslookup<p>Update: 0</p>|
|Workers logging|<p>-</p>|`Dependent item`|apache.workers.logging<p>Update: 0</p>|
|Workers closing connection|<p>-</p>|`Dependent item`|apache.workers.closing<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

