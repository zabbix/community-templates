# Graylog: Nodes

## Overview

Template created to monitor GrayLog nodes through LLD (Low Level Discovery)


We added a feature of Zabbix called LLD (Low Level Discovery) in the model, this automation seeks to facilitate the discovery of the nodes in GrayLog, so that you do not have to register the nodes manually just set the time of the discovery rule.


Monitoring Itens:
-----------------


* GrayLog: Filter execution Time (FIltered, Incomming, Outgoing, Process)
* GrayLog: Internal Log Message (Error, Fatal, Trace, Warn)
* GrayLog: Journal ( Journal Size)
* GrayLog: Node Memory(LLD)/( Free Memory, Max Memory, Total Memory, Used Memory)
* GrayLog: Node Status (Lifecycle, Processing, Status )
* GrayLog: Services


Requirements
------------


* Zabbix 3.4;
* Graylog 2.4;
* Zabbix Agent install on Graylog;
* Python 3.4 or > Python3;
* Imports;
	+ import requests;
	+ import json;
	+ import sys


## Author

Beza

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery Node|<p>-</p>|`Zabbix agent`|graylog.discovery.node<p>Update: 3m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GrayLog: Filter execution Time(Outgoing Message) 5min|<p>A common problem that can hit performance or bring message processing to a halt completely is when someone configures a regular expression or other rule that is too CPU expensive or simply never finishes.</p>|`Zabbix agent`|graylog.proc.buffer[ProcessBufferProcessor.outgoingMessages,m5_rate]<p>Update: 3m</p>|
|GrayLog: Processes|<p>-</p>|`Zabbix agent`|proc.num[graylog-server,,]<p>Update: 3m</p>|
|GrayLog: Filter execution Time(FIltered OutMessages) 5min|<p>A common problem that can hit performance or bring message processing to a halt completely is when someone configures a regular expression or other rule that is too CPU expensive or simply never finishes.</p>|`Zabbix agent`|graylog.proc.buffer[ProcessBufferProcessor.filteredOutMessages,m5_rate]<p>Update: 3m</p>|
|GrayLog: Filter execution Time(Incoming Messages) 5min|<p>A common problem that can hit performance or bring message processing to a halt completely is when someone configures a regular expression or other rule that is too CPU expensive or simply never finishes.</p>|`Zabbix agent`|graylog.proc.buffer[ProcessBufferProcessor.incomingMessages,m5_rate]<p>Update: 3m</p>|
|GrayLog: Internal Log Message Fatal 5 min|<p>-</p>|`Zabbix agent`|graylog.inter.log[org.apache.logging.log4j.core.Appender.fatal,m5_rate]<p>Update: 3m</p>|
|GrayLog: Filter execution Time(Process Time) 5min|<p>A common problem that can hit performance or bring message processing to a halt completely is when someone configures a regular expression or other rule that is too CPU expensive or simply never finishes.</p>|`Zabbix agent`|graylog.proc.buffer[ProcessBufferProcessor.processTime,m5_rate]<p>Update: 3m</p>|
|GrayLog: Internal Log Message Trace 5 min|<p>-</p>|`Zabbix agent`|graylog.inter.log[org.apache.logging.log4j.core.Appender.trace,m5_rate]<p>Update: 3m</p>|
|GrayLog: Internal Log Message Error 5 min|<p>-</p>|`Zabbix agent`|graylog.inter.log[org.apache.logging.log4j.core.Appender.error,m5_rate]<p>Update: 3m</p>|
|GrayLog: Internal Log Message Warn 5 min|<p>-</p>|`Zabbix agent`|graylog.inter.log[org.apache.logging.log4j.core.Appender.warn,m5_rate]<p>Update: 3m</p>|
|GrayLog: Service Status|<p>-</p>|`Zabbix agent`|net.tcp.port[{HOST.IP},9000]<p>Update: 3m</p>|
|GrayLog Journal Size|<p>The Graylog journal is the component sitting in front of all message processing that writes all incoming messages to disk. Graylog then reads messages from this journal to parse, process, and store them.</p>|`Zabbix agent`|graylog.journal.size[org.graylog2.journal.entries-uncommitted,value]<p>Update: 5m</p>|
|Graylog: Node Processing|<p>-</p>|`Zabbix agent`|graylog.cluster.status[{#NODEID},is_processing]<p>Update: 3m</p><p>LLD</p>|
|Graylog: Node Status|<p>-</p>|`Zabbix agent`|graylog.cluster.status[{#NODEID},lb_status]<p>Update: 3m</p><p>LLD</p>|
|Graylog: Node Lifecycle|<p>-</p>|`Zabbix agent`|graylog.cluster.status[{#NODEID},lifecycle]<p>Update: 30s</p><p>LLD</p>|
|{#NODEID},GrayLog: Memory Used (%)(Total/Max)|<p>-</p>|`Calculated`|graylog.men.free[{#NODEID}]<p>Update: 3m</p><p>LLD</p>|
|GrayLog: Node Free Memory|<p>-</p>|`Zabbix agent`|graylog.node.men[{#NODEID},free_memory]<p>Update: 3m</p><p>LLD</p>|
|GrayLog: Node Max Memory|<p>-</p>|`Zabbix agent`|graylog.node.men[{#NODEID},max_memory]<p>Update: 3m</p><p>LLD</p>|
|GrayLog: Node Total Memory|<p>-</p>|`Zabbix agent`|graylog.node.men[{#NODEID},total_memory]<p>Update: 3m</p><p>LLD</p>|
|GrayLog: Node Used Memory|<p>-</p>|`Zabbix agent`|graylog.node.men[{#NODEID},used_memory]<p>Update: 3m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

