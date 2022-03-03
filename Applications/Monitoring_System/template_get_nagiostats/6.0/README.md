# App Nagios stats

## Overview

get nagios's statistics with nagiostats


（Nagios 3.x）


install


1. add zabbix user into nagios group to execute nagiostats.


2. deploy the script and Userparameter.


3. import the template.


enjoy




---


UserParameter


UserParameter=get.nagiostats,/etc/zabbix/scripts/get-nagiostats.sh




---


Script


<https://github.com/sewata/getnagiostats/blob/master/get-nagiostats.sh>


 


=20161126


Added Graphs and Screen in the template.



## Author

sewata

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Passive Service Latency (Max)|<p>-</p>|`Zabbix trapper`|psv_srv_latency_max<p>Update: 0</p>|
|Active Hosts Last (15min)|<p>-</p>|`Zabbix trapper`|act_hsts_last_15min<p>Update: 0</p>|
|Passive Host Checks Last (5min)|<p>-</p>|`Zabbix trapper`|psv_hst_checks_last_5min<p>Update: 0</p>|
|Active Host State Change (Average)|<p>-</p>|`Zabbix trapper`|act_hst_state_change_ave<p>Update: 0</p>|
|Command Buffers (Used)|<p>-</p>|`Zabbix trapper`|cmd_buffers_used<p>Update: 0</p>|
|External Commands Last (5min)|<p>-</p>|`Zabbix trapper`|external_cmds_last_5min<p>Update: 0</p>|
|Active Service Execution Time (Average)|<p>-</p>|`Zabbix trapper`|act_srv_exec_time_ave<p>Update: 0</p>|
|Active Hosts Last (5min)|<p>-</p>|`Zabbix trapper`|act_hsts_last_5min<p>Update: 0</p>|
|Total Host State Change (Max)|<p>-</p>|`Zabbix trapper`|total_hst_state_change_max<p>Update: 0</p>|
|Passive Services Last (15min)|<p>-</p>|`Zabbix trapper`|psv_srvs_last_15min<p>Update: 0</p>|
|External Commands Last (15min)|<p>-</p>|`Zabbix trapper`|external_cmds_last_15min<p>Update: 0</p>|
|Active Service Checks Last (1min)|<p>-</p>|`Zabbix trapper`|act_srv_checks_last_1min<p>Update: 0</p>|
|Active Service Latency (Max)|<p>-</p>|`Zabbix trapper`|act_srv_latency_max<p>Update: 0</p>|
|Active Services Last (1min)|<p>-</p>|`Zabbix trapper`|act_srvs_last_1min<p>Update: 0</p>|
|Active Host Latency (Average)|<p>-</p>|`Zabbix trapper`|act_hst_latency_ave<p>Update: 0</p>|
|Active Service Execution Time (Max)|<p>-</p>|`Zabbix trapper`|act_srv_exec_time_max<p>Update: 0</p>|
|Passive Service Latency (Average)|<p>-</p>|`Zabbix trapper`|psv_srv_latency_ave<p>Update: 0</p>|
|Active Service State Change (Average)|<p>-</p>|`Zabbix trapper`|act_srv_state_change_ave<p>Update: 0</p>|
|Passive Host State Change (Average)|<p>-</p>|`Zabbix trapper`|psv_hst_state_change_ave<p>Update: 0</p>|
|Passive Service State Change (Min)|<p>-</p>|`Zabbix trapper`|psv_srv_state_change_min<p>Update: 0</p>|
|Active Host Checks Last (15min)|<p>-</p>|`Zabbix trapper`|act_hst_checks_last_15min<p>Update: 0</p>|
|Active Services Last (5min)|<p>-</p>|`Zabbix trapper`|act_srvs_last_5min<p>Update: 0</p>|
|Active Host Execution Time (Max)|<p>-</p>|`Zabbix trapper`|act_hst_exec_time_max<p>Update: 0</p>|
|External Commands Last (1min)|<p>-</p>|`Zabbix trapper`|external_cmds_last_1min<p>Update: 0</p>|
|Passive Host Checks Last (15min)|<p>-</p>|`Zabbix trapper`|psv_hst_checks_last_15min<p>Update: 0</p>|
|Total Service State Change (Min)|<p>-</p>|`Zabbix trapper`|total_srv_state_change_min<p>Update: 0</p>|
|Total Hosts|<p>-</p>|`Zabbix trapper`|total_hsts<p>Update: 0</p>|
|Total Services|<p>-</p>|`Zabbix trapper`|total_srvs<p>Update: 0</p>|
|get nagiostats|<p>-</p>|`Zabbix agent (active)`|get.nagiostats<p>Update: 60</p>|
|Active Host Execution Time (Average)|<p>-</p>|`Zabbix trapper`|act_hst_exec_time_ave<p>Update: 0</p>|
|Passive Services Last (60min)|<p>-</p>|`Zabbix trapper`|psv_srvs_last_60min<p>Update: 0</p>|
|Passive Host Checks Last (1min)|<p>-</p>|`Zabbix trapper`|psv_hst_checks_last_1min<p>Update: 0</p>|
|Active Host Checks Last (5min)|<p>-</p>|`Zabbix trapper`|act_hst_checks_last_5min<p>Update: 0</p>|
|Active Service State Change (Max)|<p>-</p>|`Zabbix trapper`|act_srv_state_change_max<p>Update: 0</p>|
|Active Service Checks Last (5min)|<p>-</p>|`Zabbix trapper`|act_srv_checks_last_5min<p>Update: 0</p>|
|Passive Services Last (5min)|<p>-</p>|`Zabbix trapper`|psv_srvs_last_5min<p>Update: 0</p>|
|Passive Host Latency (Min)|<p>-</p>|`Zabbix trapper`|psv_hst_latency_min<p>Update: 0</p>|
|Active Services Last (60min)|<p>-</p>|`Zabbix trapper`|act_srvs_last_60min<p>Update: 0</p>|
|Active Service State Change (Min)|<p>-</p>|`Zabbix trapper`|act_srv_state_change_min<p>Update: 0</p>|
|Total Host State Change (Average)|<p>-</p>|`Zabbix trapper`|total_hst_state_change_ave<p>Update: 0</p>|
|Passive Service State Change (Max)|<p>-</p>|`Zabbix trapper`|psv_srv_state_change_max<p>Update: 0</p>|
|Passive Host State Change (Min)|<p>-</p>|`Zabbix trapper`|psv_hst_state_change_min<p>Update: 0</p>|
|Passive Hosts Last (60min)|<p>-</p>|`Zabbix trapper`|psv_hsts_last_60min<p>Update: 0</p>|
|Active Host State Change (Min)|<p>-</p>|`Zabbix trapper`|act_hst_state_change_min<p>Update: 0</p>|
|Active Host Execution Time (Min)|<p>-</p>|`Zabbix trapper`|act_hst_exec_time_min<p>Update: 0</p>|
|Active Hosts Last (1min)|<p>-</p>|`Zabbix trapper`|act_hsts_last_1min<p>Update: 0</p>|
|Active Service Execution Time (Min)|<p>-</p>|`Zabbix trapper`|act_srv_exec_time_min<p>Update: 0</p>|
|Active Services Last (15min)|<p>-</p>|`Zabbix trapper`|act_srvs_last_15min<p>Update: 0</p>|
|Passive Service State Change (Average)|<p>-</p>|`Zabbix trapper`|psv_srv_state_change_ave<p>Update: 0</p>|
|Passive Service Checks Last (15min)|<p>-</p>|`Zabbix trapper`|psv_srv_checks_last_15min<p>Update: 0</p>|
|Command Buffers (High)|<p>-</p>|`Zabbix trapper`|cmd_buffers_high<p>Update: 0</p>|
|Total Service State Change (Average)|<p>-</p>|`Zabbix trapper`|total_srv_state_change_ave<p>Update: 0</p>|
|Passive Hosts Last (5min)|<p>-</p>|`Zabbix trapper`|psv_hsts_last_5min<p>Update: 0</p>|
|Passive Service Latency (Min)|<p>-</p>|`Zabbix trapper`|psv_srv_latency_min<p>Update: 0</p>|
|Active Hosts Last (60min)|<p>-</p>|`Zabbix trapper`|act_hsts_last_60min<p>Update: 0</p>|
|Passive Hosts Last (15min)|<p>-</p>|`Zabbix trapper`|psv_hsts_last_15min<p>Update: 0</p>|
|Command Buffers (Total)|<p>-</p>|`Zabbix trapper`|cmd_buffers_total<p>Update: 0</p>|
|Active Service Checks Last (15min)|<p>-</p>|`Zabbix trapper`|act_srv_checks_last_15min<p>Update: 0</p>|
|Passive Hosts Last (1min)|<p>-</p>|`Zabbix trapper`|psv_hsts_last_1min<p>Update: 0</p>|
|Active Host Latency (Min)|<p>-</p>|`Zabbix trapper`|act_hst_latency_min<p>Update: 0</p>|
|Active Host State Change (Max)|<p>-</p>|`Zabbix trapper`|act_hst_state_change_max<p>Update: 0</p>|
|Total Host State Change (Min)|<p>-</p>|`Zabbix trapper`|total_hst_state_change_min<p>Update: 0</p>|
|Total Service State Change (Max)|<p>-</p>|`Zabbix trapper`|total_srv_state_change_max<p>Update: 0</p>|
|Passive Host State Change (Max)|<p>-</p>|`Zabbix trapper`|psv_hst_state_change_max<p>Update: 0</p>|
|Active Service Latency (Min)|<p>-</p>|`Zabbix trapper`|act_srv_latency_min<p>Update: 0</p>|
|Passive Host Latency (Max)|<p>-</p>|`Zabbix trapper`|psv_hst_latency_max<p>Update: 0</p>|
|Active Host Checks Last (1min)|<p>-</p>|`Zabbix trapper`|act_hst_checks_last_1min<p>Update: 0</p>|
|Passive Service Checks Last (5min)|<p>-</p>|`Zabbix trapper`|psv_srv_checks_last_5min<p>Update: 0</p>|
|Passive Service Checks Last (1min)|<p>-</p>|`Zabbix trapper`|psv_srv_checks_last_1min<p>Update: 0</p>|
|Active Host Latency (Max)|<p>-</p>|`Zabbix trapper`|act_hst_latency_max<p>Update: 0</p>|
|Passive Host Latency (Average)|<p>-</p>|`Zabbix trapper`|psv_hst_latency_ave<p>Update: 0</p>|
|Active Service Latency (Average)|<p>-</p>|`Zabbix trapper`|act_srv_latency_ave<p>Update: 0</p>|
|Passive Services Last (1min)|<p>-</p>|`Zabbix trapper`|psv_srvs_last_1min<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

