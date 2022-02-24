# App Needrestart

## Overview

Template for needrestart to check if the server needs a reboot / restart of services after package upgrade.


[www.kaneo-gmbh.de](https://www.kaneo-gmbh.de)


### Install packages



```
apt install needrestart
```

### Zabbix agent user parameter:



```
UserParameter=needrestart.kernel,sudo needrestart -b -r l -k | grep 'NEEDRESTART-KSTA:' | grep -Eo '[0-9]'  
UserParameter=needrestart.libs,sudo needrestart -b -r l -l | grep NEEDRESTART-SVC | wc -l
```

### sudoers entry:



```
# allow zabbix to check for needrestart in batch listing mode  
zabbix             ALL = NOPASSWD: /usr/sbin/needrestart -b -r l *  
  

```


## Author

kaneo GmbH

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Kernel ABI update available|<p>-</p>|`Zabbix agent`|needrestart.kernel<p>Update: 14400</p>|
|Services using old libs|<p>-</p>|`Zabbix agent`|needrestart.libs<p>Update: 14400</p>|


## Triggers

There are no triggers in this template.

