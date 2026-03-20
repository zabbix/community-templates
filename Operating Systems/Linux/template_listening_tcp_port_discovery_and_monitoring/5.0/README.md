# TCP port monitoring

## Overview

The following template is utilizing Zabbix agent to discover TCP ports in listening state. 


Underneath the hood it will use the command:



```
ss --tcp --listening --numeric
```

This means the remote commands must be enabled. Or you need to convert it as an UserParameter. See discovery section for details.


After that, it will use JavaScript preprocessing step to transform the output suitable for discovery.


By default, the item will check port every 5 minutes. If the port is not reachable for 5 consecutive checks (25 minutes) it is a called a "Disaster".


Explaining video: <https://www.youtube.com/watch?v=BwQwWXoGzGM>


Cheers!



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$TCP.PORT.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$TCP.PORT.NOT_MATCHES}|<p>-</p>|`^\s$`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Listening TCP port discovery|<p>Install UserParameter for zabbix-agent: echo 'UserParameter=ss.tcp.listening,netstat --tcp --listening --numeric-ports' | sudo tee /etc/zabbix/zabbix_agentd.d/ss.tcp.listening.conf Install UserParameter for zabbix-agent2: echo 'UserParameter=ss.tcp.listening,netstat --tcp --listening --numeric-ports' | sudo tee /etc/zabbix/zabbix_agent2.d/ss.tcp.listening.conf Restart Zabbix agent systemctl restart zabbix-agent systemctl restart zabbix-agent2 In this section replace Key: system.run["ss --tcp --listening --numeric"] with: netstat.tcp.listening</p>|`Zabbix agent`|system.run["ss --tcp --listening --numeric"]<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Port {#PORT} is listening|<p>-</p>|`Zabbix agent (active)`|net.tcp.listen[{#PORT}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Port {#PORT} is down for some time|<p>-</p>|<p>**Expression**: {TCP port monitoring:net.tcp.listen[{#PORT}].max(#5)}=0</p><p>**Recovery expression**: </p>|disaster|
|Port {#PORT} is down for some time (LLD)|<p>-</p>|<p>**Expression**: {TCP port monitoring:net.tcp.listen[{#PORT}].max(#5)}=0</p><p>**Recovery expression**: </p>|disaster|
