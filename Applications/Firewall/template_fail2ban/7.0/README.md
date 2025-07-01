# Fail2ban

## Overview

Fail2Ban template for Zabbix
============================


**Features:**

Should work on zabbix 5.0~7.0, tested on 7.2.5

Automatic discovery of jails


Monitor service status


Monitor jails


Jails graph


 


**The installation instruction is in this repository.** [github.com/hermanekt/zabbix-fail2ban-discovery-](cat-app/firewall/fail2ban/visit)



## Author

Tomas Hermanek

## Installation
1. Place `fail2ban.conf` in `/etc/zabbix/zabbix_agentd.d/` directory.
2. Restart the Zabbix agent service.
3. Enable zabbix user using fail2ban-client with sudo permission by creating file `/etc/sudoers.d/zabbix-fail2ban` with permission 440, owner root and group root. Add the following line to the file:
```
zabbix ALL=NOPASSWD: /usr/bin/fail2ban-client
```
4. Validate the permission is good by running the following command, expecting the output to be similar to this rather than permission denied:
```
$ sudo -u zabbix sudo /usr/bin/fail2ban-client status
Status
|- Number of jail:	2
`- Jail list:	frps-ssh-ban, sshd
```
5. Import the template into Zabbix and link it to the host.

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

| Name               | Description                                     | Type           | Key and additional info             |
| ------------------ | ----------------------------------------------- | -------------- | ----------------------------------- |
| Fail2ban discovery | <p>Discovery of jails from fail2ban daemon.</p> | `Zabbix agent` | fail2ban.discovery<p>Update: 30</p> |


## Items collected

| Name                        | Description                                | Type           | Key and additional info                             |
| --------------------------- | ------------------------------------------ | -------------- | --------------------------------------------------- |
| Fail2Ban service is running | <p>ping - tests if the server is alive</p> | `Zabbix agent` | proc.num[fail2ban-server]<p>Update: 60</p>          |
| Fail2ban $1 banned IPs      | <p>-</p>                                   | `Zabbix agent` | fail2ban.status[{#JAIL}]<p>Update: 60</p><p>LLD</p> |


## Triggers

There are no triggers in this template.

