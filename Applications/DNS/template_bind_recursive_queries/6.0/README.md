# Bind queries

## Description

Shows recursive queries on your BIND server. Triggers on excesive usage. Best for caching servers.

## Overview

Installation description:

/etc/zabbix/zabbix_agentd.d/userparameter_bind.conf:
```
UserParameter=bind.tcpcl,/bin/cat /tmp/namedtcp.log
UserParameter=bind.udpcl,/bin/cat /tmp/namedudp.log
```

---------------
cron every 30 sec:

/var/spool/cron/root:
```
SHELL=/bin/sh PATH=/sbin:/bin:/usr/sbin:/usr/bin
0-59 * * * * /etc/zabbix/custom/named.sh
0-59 * * * * ( sleep 30; /etc/zabbix/custom/named.sh )
```

/etc/zabbix/custom/named.sh:
```bash
 #!/bin/bash
 /usr/local/named/sbin/rndc status > /tmp/rndcstatus
 cat /tmp/rndcstatus | grep tcp | awk '{ print $3 }' | cut -d '/' -f 1 > /tmp/namedtcp.log
 cat /tmp/rndcstatus | grep recursive | awk '{ print $3 }' | cut -d '/' -f 1 > /tmp/namedudp.log
```
----------------------------- 

add key for rndc in config of named

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Recursive TCP|<p>-</p>|`Zabbix agent`|bind.tcpcl<p>Update: 30s</p>|
|Recursive UDP|<p>-</p>|`Zabbix agent`|bind.udpcl<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.
