# App PHP-FPM

## Overview

(Check the latest version and updates to this doc at the repo: <https://github.com/vigrai/zabbix-template-php-fpm> )


# Zabbix 4.0 Template for PHP-FPM Pools


 


This is a template for monitoring php-fpm and it's pools with [Zabbix](www.zabbix.com).


 


What's special about this template, is that it *automatically* detects (using LLD) the running php-fpm pools and creates items for measuring metrics from each pool. It uses Http Agent type check in zabbix in order to parse the php status information into useful metrics.


 


So, if you are running a server with multiple php-fpm pools, this may be a better alternative for monitoring php than other templates available.


 


# Compatibility


 


This template was tested using:


 


| Software | Vesion |


| ------ | ------ |


| Zabbix Server | 4.0.3 |


| Debian | Stretch (9.8) |


| Php-fpm | 7.2 |


 


It might also work with other combination of versions.


 


# Metrics


 


This are the metrics created for each php-fpm pool:


 


![N|Solid](https://github.com/vigrai/zabbix-template-php-fpm/blob/master/img/metrics.png)


 


# Requirements


 


 - Php-status should be enabled in the php-fpm pools.


 - Php-status should be accessible and located in /php-status\_POOLNAME for each pool (see step 4 of Setup).


 


# Setup


 


Even though this template is made with automation in mind, there's still some manual steps to be done in the client (where php-fpm and zabbix-agent are running) in order to get it working:


 


 1. Clone this template into a temporary directory.


 


 ```


 # git clone https://github.com/vigrai/zabbix-template-php-fpm.git /tmp/zabbix-template


 ```


 


 2. Put the file `php-fpm.discover\_pools.pl` into the /etc/zabbix directory and make it executable.


 


 ```


 # cp /tmp/zabbix-template/php-fpm.discover\_pools.pl /etc/zabbix


 # chmod +x /etc/zabbix/php-fpm.discover\_pools.pl


 # chown zabbix.zabbix /etc/zabbix/php-fpm.discover\_pools.pl


 ```


3. Copy the file userparameter\_php-fpm.conf into /etc/zabbix/zabbix\_agentd.d.


 ```


 # cp /tmp/zabbix-template/userparameter\_php-fpm.conf /etc/zabbix/zabbix\_agentd.d


 ```


4. Make sure that your php-fpm is correctly setup:


 


 [x] The pools should have php-status enabled.


 


 [x] Php-status should be available in the path /fpm-status\_[NAME-OF-THE-POOL]


 


 Example configuration file for pool called *nms* (/etc/php/7.2/fpm/pool.d/nms.conf):


 


 ```[nms]```


 


 `



## Author

Fabio Gallese

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HOST.PHPFPM}|<p>-</p>|`127.0.0.1:8080`|Text macro|
|{$PROTO}|<p>-</p>|`http`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PHP-FPM Pools Discovery|<p>-</p>|`Zabbix agent`|php-fpm.discover_pools<p>Update: 120s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory Used by Pool {#POOLNAME}|<p>-</p>|`Zabbix agent`|proc.mem["php-fpm: pool {#POOLNAME}",,,,pmem]<p>Update: 120s</p><p>LLD</p>|
|PHP-FPM Pool {#POOLNAME} status page|<p>-</p>|`HTTP agent`|php-fpm.status[{#POOLNAME}]<p>Update: 60s</p><p>LLD</p>|
|Process for pool {#POOLNAME}|<p>-</p>|`Zabbix agent`|proc.num["php-fpm: pool {#POOLNAME}"]<p>Update: 60s</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Accepted Connections Per Second|<p>The number of incoming requests per second that the pool has accepted; when a connection is accepted it is removed from the listen queue (displayed in real time).</p>|`Dependent item`|php-fpm.accepted_conn[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Active Processes|<p>The number of servers current processing a page - the minimum is 1 (so even on a fully idle server, the result will be not read 0).</p>|`Dependent item`|php-fpm.active_processes[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Listen Queue|<p>The current number of connections that have been initiated, but not yet accepted. If this value is non-zero it typically means that all the available server processes are currently busy, and there are no processes available to serve the next request. Raising pm.max_children (provided the server can handle it) should help keep this number low. This property follows from the fact that PHP-FPM listens via a socket (TCP or file based), and thus inherits some of the characteristics of sockets.</p>|`Dependent item`|php-fpm.listen_queue[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Listen Queue Len|<p>The upper limit on the number of connections that will be queued. Once this limit is reached, subsequent connections will either be refused, or ignored. This value is set by the php-fpm per pool configuration option 'listen.backlog', which defaults to -1 (unlimited). However, this value is also limited by the system (sysctl) value 'net.core.somaxconn', which defaults to 128 on many Linux systems.</p>|`Dependent item`|php-fpm.listen_queue_len[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Max Active Processes|<p>The highest value that 'active processes' has reached since the php-fpm server started. This value should not exceed pm.max_children.</p>|`Dependent item`|php-fpm.max_active_processes[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Max Children Reached|<p>The number of times that pm.max_children has been reached since the php-fpm pool started (only applicable if the process manager is ondemand or dynamic).</p>|`Dependent item`|php-fpm.max_children_reached[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Max Listen Queue|<p>The maximum number of requests in the queue of pending connections since this FPM pool has started.</p>|`Dependent item`|php-fpm.max_listen_queue[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Pool Name|<p>The name of this pool.</p>|`Dependent item`|php-fpm.pool[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Process Manager|<p>The method used by the process manager to control the number of child processes (possible values: ondemand, dynamic or static) for this pool.</p>|`Dependent item`|php-fpm.process_manager[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Slow Requests|<p>The number of requests that exceeded your request_slowlog_timeout value.</p>|`Dependent item`|php-fpm.slow_requests[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Start Since|<p>How long has this pool been running.</p>|`Dependent item`|php-fpm.start_since[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Start Time|<p>The time when this pool was started.</p>|`Dependent item`|php-fpm.start_time[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|PHP-FPM ({#POOLNAME}): Total Processes|<p>The total number of server processes currently running; the sum of idle processes + active processes. If the process manager is static, this number will match pm.max_children.</p>|`Dependent item`|php-fpm.total_processes[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

