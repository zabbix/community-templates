# Check Mount Point

## Description

Monitora os pontos de montagem do Gluster

## Overview

First Step- You will need put the user parameter below in your zabbix\_agent.conf


 


UserParameter=vfs.fs.mounted[*],findmnt -nr -o source -T $1 > /dev/null && echo 0 || echo 1


 


this parameter will return if the mount point is OK


 


Second Step - Import the template


 


Third Step - Change the Item Key, You need put your mount point, like the exemple below.


 


ex: vfs.fs.mounted[put your mounte point here]


 


 


 


 


 



## Author

Rodrigo Américo

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Mount Point|<p>0 = Yes 1 = No</p>|`Zabbix agent`|vfs.fs.mounted[your_mount_point]<p>Update: 10m</p>|


## Triggers

There are no triggers in this template.

