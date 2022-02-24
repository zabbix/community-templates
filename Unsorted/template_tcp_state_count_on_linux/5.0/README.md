# TCP-state-count bulkget

## Description

The number of TCP sessions. Using "dependent item" net.tcp.count.master[<source port>,<dest port>] https://github.com/mutz0623/zabbix_TCP-state-count-module

## Overview

 About


* loadable module for aggregating TCP sessions.
* 2017/9 Enabled for "depend item". so you can reduce server-agent NW connection frequency and load.


 


Requirements 


* zabbix 3.0
* Linux


 


 


 



## Author

mutsumi Iwata

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,ESTABLISHED]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,FIN_WAIT1]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,LAST_ACK]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,SYN_RECV]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,CLOSING]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,FIN_WAIT2]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,LAST_ACK]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,TIME_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,SYN_RECV]<p>Update: 0</p>|
|TCP count local port $1 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[445,]<p>Update: 30s</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,CLOSING]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,CLOSING]<p>Update: 0</p>|
|TCP count local port $1 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[80,]<p>Update: 30s</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,LAST_ACK]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,LISTEN]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,TIME_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,CLOSING]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,CLOSING]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,LISTEN]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,CLOSING]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,LISTEN]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,FIN_WAIT2]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,ESTABLISHED]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,SYN_SENT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,FIN_WAIT2]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,LISTEN]<p>Update: 0</p>|
|TCP count local port $1 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[20772,]<p>Update: 30s</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,FIN_WAIT2]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,TIME_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,TIME_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,FIN_WAIT2]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,CLOSE]<p>Update: 0</p>|
|TCP count remote port $2 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[,445]<p>Update: 30s</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,FIN_WAIT1]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,ESTABLISHED]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,ESTABLISHED]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,FIN_WAIT2]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,FIN_WAIT1]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,CLOSING]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,SYN_RECV]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,ESTABLISHED]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,ESTABLISHED]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,FIN_WAIT1]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,ESTABLISHED]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,SYN_RECV]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[,10051]<p>Update: 30s</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,FIN_WAIT1]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,FIN_WAIT1]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,FIN_WAIT1]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,FIN_WAIT1]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,LISTEN]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,LAST_ACK]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,TIME_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,TIME_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,CountAll]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,LAST_ACK]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,SYN_RECV]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,TIME_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,SYN_RECV]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,SYN_SENT]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,FIN_WAIT1]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,FIN_WAIT2]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,FIN_WAIT2]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,FIN_WAIT1]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,CLOSING]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,LAST_ACK]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,FIN_WAIT1]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,CountAll]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,CLOSING]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,LAST_ACK]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,ESTABLISHED]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,ESTABLISHED]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,CountAll]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,TIME_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,CLOSING]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,FIN_WAIT2]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,CLOSE]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,CountAll]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,ESTABLISHED]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,LAST_ACK]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,FIN_WAIT1]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,LAST_ACK]<p>Update: 0</p>|
|TCP count remote port $2 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[,80]<p>Update: 30s</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,LISTEN]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count all master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[]<p>Update: 30s</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,CountAll]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,SYN_RECV]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,LISTEN]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,LAST_ACK]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,ESTABLISHED]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,CLOSING]<p>Update: 0</p>|
|TCP count remote port $2 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[,10050]<p>Update: 30s</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,FIN_WAIT1]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,SYN_RECV]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,LISTEN]<p>Update: 0</p>|
|TCP count local port $1 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[10050,]<p>Update: 30s</p>|
|TCP count local port $1 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[10051,]<p>Update: 30s</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,CountAll]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,ESTABLISHED]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,TIME_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,SYN_RECV]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,FIN_WAIT2]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,SYN_RECV]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,CLOSING]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,TIME_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,FIN_WAIT1]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,SYN_RECV]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,LISTEN]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,CountAll]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,SYN_SENT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,CLOSING]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,FIN_WAIT1]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,TIME_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,FIN_WAIT2]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,LISTEN]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,ESTABLISHED]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[,443]<p>Update: 30s</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,LAST_ACK]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,LAST_ACK]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,CountAll]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,FIN_WAIT2]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,SYN_RECV]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,TIME_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,SYN_SENT]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,LISTEN]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,LISTEN]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,CountAll]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,ESTABLISHED]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,TIME_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,FIN_WAIT2]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,LAST_ACK]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,CLOSE]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,CLOSING]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,FIN_WAIT2]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,CLOSE]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,TIME_WAIT]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,LISTEN]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,443,CountAll]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,ESTABLISHED]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,CountAll]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10050,,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,SYN_RECV]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,SYN_RECV]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,80,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count remote port $2 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[,20772]<p>Update: 30s</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,20772,LISTEN]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,TIME_WAIT]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,LAST_ACK]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,LISTEN]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[80,,CountAll]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,CountAll]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[20772,,CountAll]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,FIN_WAIT2]<p>Update: 0</p>|
|TCP count local port $1 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[22,]<p>Update: 30s</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,CLOSE]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[443,,CountAll]<p>Update: 0</p>|
|TCP count local port $1 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[443,]<p>Update: 30s</p>|
|TCP count remote port $2 master|<p>-</p>|`Zabbix agent`|net.tcp.count.bulk[,22]<p>Update: 30s</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[22,,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,22,CLOSING]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[10051,,LAST_ACK]<p>Update: 0</p>|
|TCP count local port $1 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[445,,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10050,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,445,SYN_SENT]<p>Update: 0</p>|
|TCP count remote port $2 $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,10051,CLOSE_WAIT]<p>Update: 0</p>|
|TCP count $3|<p>-</p>|`Dependent item`|net.tcp.count.depend[,,SYN_RECV]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

