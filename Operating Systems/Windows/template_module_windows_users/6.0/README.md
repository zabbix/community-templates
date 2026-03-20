# Module Windows users by Zabbix agent

## Description

Get a total of logged-in users in the system.

## Overview

**Attach** this module with your **Template OS Windows by Zabbix agent** or the **Template OS Windows by Zabbix agent active**, and start to get the number of users that are logged in your Windows Server.


This module shows the 'active users' and the 'disconnected users' (consuming system resources).


 


This module works great with my [Grafana Dashboard](https://grafana.com/grafana/dashboards/5363), please take a look.


 


Item details:


 


For a very long time, I tried to get this done in Windows (Linux already comes with this monitoring out of the box), the only option I know was with 'Remote Commands', which can have some security problems, or the company doesn't want to enable, so I figured out how to do this with WMI.


 


Please enjoy.



## Author

Paulo Paim

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of logged in users|<p>The number of users who are currently logged in.</p>|`Zabbix agent`|wmi.getall[root\cimv2,select SessionId from Win32_Process where Name like '%explorer.exe%']<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

# Module Windows users by Zabbix agent active

## Description

Get a total of logged-in users in the system.

## Overview

**Attach** this module with your **Template OS Windows by Zabbix agent** or the **Template OS Windows by Zabbix agent active**, and start to get the number of users that are logged in your Windows Server.


This module shows the 'active users' and the 'disconnected users' (consuming system resources).


 


This module works great with my [Grafana Dashboard](https://grafana.com/grafana/dashboards/5363), please take a look.


 


Item details:


 


For a very long time, I tried to get this done in Windows (Linux already comes with this monitoring out of the box), the only option I know was with 'Remote Commands', which can have some security problems, or the company doesn't want to enable, so I figured out how to do this with WMI.


 


Please enjoy.



## Author

Paulo Paim

## Description

Get a total of logged-in users in the system.

## Overview

**Attach** this module with your **Template OS Windows by Zabbix agent** or the **Template OS Windows by Zabbix agent active**, and start to get the number of users that are logged in your Windows Server.


This module shows the 'active users' and the 'disconnected users' (consuming system resources).


 


This module works great with my [Grafana Dashboard](https://grafana.com/grafana/dashboards/5363), please take a look.


 


Item details:


 


For a very long time, I tried to get this done in Windows (Linux already comes with this monitoring out of the box), the only option I know was with 'Remote Commands', which can have some security problems, or the company doesn't want to enable, so I figured out how to do this with WMI.


 


Please enjoy.



## Author

Paulo Paim

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of logged in users|<p>The number of users who are currently logged in.</p>|`Zabbix agent (active)`|wmi.getall[root\cimv2,select SessionId from Win32_Process where Name like '%explorer.exe%']<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

