# Template Hyperbackup

## Description
Attention: TESTED only on 5.4.x. Please give me info if it works correctly on 5.0 too.

Template to monitor Synology Hyperbackup status.

Create a zabbix user in your DSM. The user should be in the administrator group as it must be able to ssh to the DSM. You can disable access to all folders and to all programs/functions.
Login on DSM with administrative/root account and create /etc/sudoers.d/zabbix with this inside:
zabbix ALL = NOPASSWD: /bin/more /var/log/messages, /bin/grep
This tells the system that the user zabbix can run as root only this 2 commands without the root password.

Assign the template to the synology.
Pay attention to: the template uses the Dns name of the synology to do the discovery and other stuff.

In the assigned machine you must define two macros:
{$SSH_USERNAME}
{$SSH_PASSWORD}



## Overview
with this template you can monitor the status of the Hyperbackup on your synology with zabbix.

### Features

The template comes with a discovery rule to get all configured backup on the NAS.

1. The template gives you 3 items:
 - The time of the last backup
 - How much time the last backup has lasted
 - The result
2. The template comes with one trigger:
 - If the status of the last backup is not ok, it will fire.


### Environment

Tested on Zabbix version 5.4.1
* on docker

### Note(s)

You can write questions also to [gianluca@romito.net](mailto:gianluca@romito.net)


## Author

Gianluca Romito
## Macros used
{$SSH_USERNAME}
{$SSH_PASSWORD}

## Template links
None
## Discovery rules

* Hyperbackup jobs
 

## Items collected

 - Hyperbackup {#BACKUP.NAME}
 - Hyperbackup {#BACKUP.NAME} length
 - Hyperbackup {#BACKUP.NAME} result

## Triggers
  - HyperBackup {#BACKUP.NAME} Failed on {DNS.NAME}


