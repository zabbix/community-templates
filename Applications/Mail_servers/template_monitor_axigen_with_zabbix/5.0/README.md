# App Axigen-Services

## Description

Axigen template

## Overview

Zabbix-Axigen
=============


Monitor Axigen With Zabbix


Usage
=====


Go to your Axigen Web-Admin -> Status & Monitoring -> Reporting Service -Ensure your SNMP listner is enable


* Scroll down to SNMP Parameters and enable snmp also Set SNMP community.
* Use the Snmp community in template "" or you can also set your own Macro.
* On the Axigen Web Admin Go to Services > Services Mangement > Scroll down and reload Reporting Service.


<a id="user-content-provides-visibliity-on-the-following" class="anchor" style="box-sizing: border-box; background-color: initial; color: #0366d6; float: left; padding-right: 4px;
===================================================================================================================================================================================



## Author

Ahrar Khan

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|SMTP response time|<p>-</p>|`Simple check`|net.tcp.service.perf[smtp]<p>Update: 60</p>|
|WebAdmin service is running|<p>-</p>|`Zabbix agent`|net.tcp.service[tcp,,9000]<p>Update: 60</p>|
|SMTP-IN failed authentications|<p>-</p>|`SNMP agent`|SmtpInFailedAuthentications<p>Update: 60</p>|
|IMAP response time|<p>-</p>|`Simple check`|net.tcp.service.perf[imap]<p>Update: 60</p>|
|SMTP-IN rejected|<p>-</p>|`SNMP agent`|SmtpInRejected<p>Update: 60</p>|
|SMTP-IN authenticated|<p>-</p>|`SNMP agent`|SmtpInAuthenticated<p>Update: 60</p>|
|Queue size|<p>-</p>|`SNMP agent`|QueueSize<p>Update: 60</p>|
|CLI service is running|<p>-</p>|`Zabbix agent`|net.tcp.service[tcp,,7000]<p>Update: 60</p>|
|SMTP-IN accepted|<p>-</p>|`SNMP agent`|SmtpInAccepted<p>Update: 60</p>|
|POP3 response time|<p>-</p>|`Simple check`|net.tcp.service.perf[pop]<p>Update: 60</p>|
|SMTP-IN connections|<p>-</p>|`SNMP agent`|SmtpInConnections<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

