
# Docker Swarm by Zabbix agent 2

## Overview

The template to monitor Docker Swarm services by Zabbix agent 2.

Swarm replaces task containers on every redeploy or update, and a new container gets a new name.
Container-based monitoring then creates new items for every task and keeps the old ones until they are deleted, so metric history is split between containers.
This template keeps the service as the main entity: items are keyed by service name, and metrics of all service tasks are aggregated per service.

Template `Docker Swarm by Zabbix agent 2` — collects metrics by polling zabbix-agent2 with the `swarm.sh` user parameter.
All metrics are collected in one go and processed with dependent items.

The template links `Docker by Zabbix agent 2` for the Docker engine metrics and overrides its `{$DOCKER.LLD.FILTER.CONTAINER.NOT_MATCHES}` macro, so swarm task containers are excluded from its container discovery.
Containers that are not swarm tasks are discovered by `Docker by Zabbix agent 2` as before.

Metrics of task resource usage are collected on every node for the tasks running on that node.
Swarm-wide metrics (replicas, update state, failed tasks) are collected on manager nodes only.

## Requirements

Zabbix version: 7.0 and higher.

## Tested versions

This template has been tested on:
- Docker 29.8.0 (API 1.56), single-node swarm
- Zabbix agent 2 7.0.30

## Configuration

> Zabbix should be configured according to the instructions in the [Templates out of the box](https://www.zabbix.com/documentation/7.0/manual/config/templates_out_of_the_box) section.

## Setup

Setup and configure Zabbix agent 2 with the Docker monitoring plugin on every swarm node. The user by which the Zabbix agent 2 is running should have access permissions to the Docker socket. The `docker` CLI and `curl` are required on the node.

1. Add the `zabbix` user to the `docker` group to give Zabbix agent 2 access to the Docker socket, and check the access:

   ```
   usermod -aG docker zabbix
   sudo -u zabbix docker info --format '{{.Swarm.LocalNodeState}}'
   ```

   The second command should print `active`.

2. Copy `files/swarm.sh` and `files/swarm.conf` to `/etc/zabbix/zabbix_agent2.d/userparameters.d/` and make the script executable:

   ```
   chmod 755 /etc/zabbix/zabbix_agent2.d/userparameters.d/swarm.sh
   ```

3. Add to `zabbix_agent2.conf`:

   ```
   Include=/etc/zabbix/zabbix_agent2.d/userparameters.d/*.conf
   UserParameterDir=/etc/zabbix/zabbix_agent2.d/userparameters.d
   ```

4. Restart Zabbix agent 2, so it picks up the new group membership and the user parameter:

   ```
   systemctl restart zabbix-agent2
   ```

5. Import the template and link `Docker Swarm by Zabbix agent 2` to the host instead of `Docker by Zabbix agent 2`.

Test availability: `zabbix_get -s docker-host -k swarm.services.get`

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$SWARM.LLD.FILTER.SERVICE.MATCHES}|<p>Filter of discoverable swarm services.</p>|`.*`|
|{$SWARM.LLD.FILTER.SERVICE.NOT_MATCHES}|<p>Filter to exclude discovered swarm services.</p>|`CHANGE_IF_NEEDED`|
|{$SWARM.NODATA.TIMEOUT}|<p>Period without data after which the "Failed to fetch swarm data" trigger fires.</p>|`10m`|
|{$SWARM.SERVICE.CPU.UTIL.MAX}|<p>Threshold of the service CPU usage, % of one core. Supports context: {$SWARM.SERVICE.CPU.UTIL.MAX:"stack_service"}.</p>|`90`|
|{$SWARM.SERVICE.CPU.UTIL.TIME}|<p>Period of the high CPU usage trigger.</p>|`15m`|
|{$SWARM.SERVICE.MEM.UTIL.MAX}|<p>Threshold of the service task memory utilization, %. Supports context.</p>|`90`|
|{$SWARM.SERVICE.MEM.UTIL.TIME}|<p>Period of the high memory utilization trigger.</p>|`15m`|
|{$SWARM.SERVICE.REPLICAS.TIMEOUT}|<p>How long a service may run below desired replicas before the triggers fire. Supports context.</p>|`5m`|
|{$SWARM.SERVICE.UNHEALTHY.TIMEOUT}|<p>How long service tasks may be unhealthy before the trigger fires. Supports context.</p>|`5m`|
|{$SWARM.SERVICE.TASK.FAILED.PERIOD}|<p>How long the task failure problem stays open. Supports context.</p>|`15m`|
|{$DOCKER.LLD.FILTER.CONTAINER.NOT_MATCHES}|<p>Overrides the macro of Docker by Zabbix agent 2: excludes swarm task containers from its container discovery, they are monitored per service.</p>|`\.([0-9]+\|[a-z0-9]{25})\.[a-z0-9]{25}$`|

### Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Get swarm snapshot|<p>Output of swarm.sh: task containers of this node with their stats, services, update states and failed tasks.</p>|Zabbix agent|swarm.services.get|
|Swarm services data|<p>Snapshot aggregated per service.</p>|Dependent item|swarm.services.aggr<p>**Preprocessing**</p><ul><li><p>JavaScript: `The text is too long. Please see the template.`</p></li></ul>|
|Swarm services count|<p>Number of swarm services seen by this node.</p>|Dependent item|swarm.services.count<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.count`</p></li></ul>|

### Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Swarm: Failed to fetch swarm data|<p>Zabbix has not received data for items for the last {$SWARM.NODATA.TIMEOUT}.</p>|`nodata(/Docker Swarm by Zabbix agent 2/swarm.services.count,{$SWARM.NODATA.TIMEOUT})=1`|Warning|**Manual close**: Yes|

### LLD rule Swarm services discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Swarm services discovery|<p>Discovery of swarm services.</p>|Dependent item|swarm.services.discovery<p>**Preprocessing**</p><ul><li><p>JavaScript: `The text is too long. Please see the template.`</p></li><li><p>Discard unchanged with heartbeat: `15m`</p></li></ul>|

### Item prototypes for Swarm services discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Service {#SERVICE}: Tasks running|<p>Running tasks of the service on this node.</p>|Dependent item|swarm.service.tasks.running[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].tasks_running`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Tasks unhealthy|<p>Running tasks of the service on this node with a failing healthcheck.</p>|Dependent item|swarm.service.tasks.unhealthy[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].tasks_unhealthy`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Health failing streak|<p>Max number of consecutive failed healthchecks among running tasks.</p>|Dependent item|swarm.service.health.failing[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].health_failing`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: OOM killed tasks|<p>Task containers on this node killed by the OOM killer.</p>|Dependent item|swarm.service.tasks.oom[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].tasks_oom`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Task started at|<p>Start time of the newest running task on this node.</p>|Dependent item|swarm.service.task.started[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].started`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Last task finished at|<p>Finish time of the last stopped task on this node.</p>|Dependent item|swarm.service.task.finished[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].finished`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Last task exit code|<p>Exit code of the last stopped task on this node.</p>|Dependent item|swarm.service.task.exitcode[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].last_exit_code`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Last task error|<p>Docker error of the last stopped task on this node.</p>|Dependent item|swarm.service.task.error[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].last_error`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Replicas running|<p>Running replicas across the swarm. Managers only.</p>|Dependent item|swarm.service.replicas.running[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].replicas_running`</p><p>⛔️Custom on fail: Discard value</p></li></ul>|
|Service {#SERVICE}: Replicas desired|<p>Desired replicas across the swarm; for global services - number of eligible nodes. Managers only.</p>|Dependent item|swarm.service.replicas.desired[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].replicas_desired`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Update state|<p>State of the last service update: none, updating, completed, paused, rollback_started, rollback_paused, rollback_completed. Managers only.</p>|Dependent item|swarm.service.update.state[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].update_state`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Image|<p>Image of the service.</p>|Dependent item|swarm.service.image[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].image`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1d`</p></li></ul>|
|Service {#SERVICE}: Last failed task time|<p>Time of the last failed or rejected task of the service (crash, failed healthcheck, image pull error). Managers only.</p>|Dependent item|swarm.service.task.failed.time[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].task_failed_time`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Last failed task error|<p>Swarm error of the last failed or rejected task of the service. Managers only.</p>|Dependent item|swarm.service.task.failed.error[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].task_failed_error`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: CPU usage|<p>CPU usage of all service tasks on this node, % of one core.</p>|Dependent item|swarm.service.cpu[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: CPU kernelmode usage|<p>CPU time in kernel mode per second of all service tasks on this node, in cores.</p>|Dependent item|swarm.service.cpu.kernel[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu_kernel`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: CPU usermode usage|<p>CPU time in user mode per second of all service tasks on this node, in cores.</p>|Dependent item|swarm.service.cpu.user[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu_user`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: CPU throttled|<p>Max share of time a service task was throttled by its CPU limit.</p>|Dependent item|swarm.service.cpu.throttled[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu_throttled`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Online CPUs|<p>CPUs available to the service tasks.</p>|Dependent item|swarm.service.cpu.online[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].online_cpus`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Memory used|<p>Memory usage without inactive file cache of all service tasks on this node.</p>|Dependent item|swarm.service.memory[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Memory usage total|<p>Memory usage including file cache of all service tasks on this node.</p>|Dependent item|swarm.service.memory.total[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem_total`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Memory usage inactive|<p>Inactive file cache of all service tasks on this node.</p>|Dependent item|swarm.service.memory.inactive[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem_inactive`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Memory limit|<p>Memory limits of all service tasks on this node; host memory for tasks without a limit.</p>|Dependent item|swarm.service.memory.limit[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem_limit`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Memory utilization|<p>Max memory utilization among service tasks on this node, relative to the task memory limit.</p>|Dependent item|swarm.service.memory.pct[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem_pct`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Processes|<p>Processes of all service tasks on this node.</p>|Dependent item|swarm.service.pids[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].pids`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Network bytes received per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.net.rx[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].net_rx`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|
|Service {#SERVICE}: Network bytes sent per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.net.tx[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].net_tx`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|
|Service {#SERVICE}: Network packets received per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.net.rx.packets[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].net_rx_packets`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|
|Service {#SERVICE}: Network packets sent per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.net.tx.packets[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].net_tx_packets`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|
|Service {#SERVICE}: Network errors received per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.net.rx.errors[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].net_rx_errors`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|
|Service {#SERVICE}: Network errors sent per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.net.tx.errors[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].net_tx_errors`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|
|Service {#SERVICE}: Network incoming packets dropped per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.net.rx.dropped[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].net_rx_dropped`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|
|Service {#SERVICE}: Network outgoing packets dropped per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.net.tx.dropped[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].net_tx_dropped`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|
|Service {#SERVICE}: Disk read per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.blk.read[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].blk_read`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|
|Service {#SERVICE}: Disk write per second|<p>Sum over all service tasks on this node.</p>|Dependent item|swarm.service.blk.write[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].blk_write`</p><p>⛔️Custom on fail: Discard value</p></li><li>Change per second</li></ul>|

### Trigger prototypes for Swarm services discovery

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Swarm: Service {#SERVICE}: Unhealthy tasks|<p>Service tasks have had a failing healthcheck for {$SWARM.SERVICE.UNHEALTHY.TIMEOUT}.</p>|`min(/Docker Swarm by Zabbix agent 2/swarm.service.tasks.unhealthy[{#SERVICE}],{$SWARM.SERVICE.UNHEALTHY.TIMEOUT:"{#SERVICE}"})>0`|Warning|**Manual close**: Yes|
|Swarm: Service {#SERVICE}: Task was OOM killed|<p>A task of the service was killed by the OOM killer.</p>|`last(/Docker Swarm by Zabbix agent 2/swarm.service.tasks.oom[{#SERVICE}])>last(/Docker Swarm by Zabbix agent 2/swarm.service.tasks.oom[{#SERVICE}],#2)`|Average|**Manual close**: Yes|
|Swarm: Service {#SERVICE}: Update failed ({ITEM.LASTVALUE1})|<p>The last service update was paused or rolled back. Resolves with the next successful update.</p>|`find(/Docker Swarm by Zabbix agent 2/swarm.service.update.state[{#SERVICE}],,"regexp","^(paused\|rollback_started\|rollback_paused\|rollback_completed)$")=1`|Average|**Manual close**: Yes|
|Swarm: Service {#SERVICE}: High CPU usage|<p>CPU usage of the service is over {$SWARM.SERVICE.CPU.UTIL.MAX} for {$SWARM.SERVICE.CPU.UTIL.TIME}.</p>|`min(/Docker Swarm by Zabbix agent 2/swarm.service.cpu[{#SERVICE}],{$SWARM.SERVICE.CPU.UTIL.TIME:"{#SERVICE}"})>{$SWARM.SERVICE.CPU.UTIL.MAX:"{#SERVICE}"}`|Warning||
|Swarm: Service {#SERVICE}: High memory utilization|<p>Memory utilization of a service task is over {$SWARM.SERVICE.MEM.UTIL.MAX} for {$SWARM.SERVICE.MEM.UTIL.TIME}.</p>|`min(/Docker Swarm by Zabbix agent 2/swarm.service.memory.pct[{#SERVICE}],{$SWARM.SERVICE.MEM.UTIL.TIME:"{#SERVICE}"})>{$SWARM.SERVICE.MEM.UTIL.MAX:"{#SERVICE}"}`|Warning||
|Swarm: Service {#SERVICE}: Task failed|<p>A task of the service crashed, was killed as unhealthy or could not start. Resolves after {$SWARM.SERVICE.TASK.FAILED.PERIOD}.</p>|`last(/Docker Swarm by Zabbix agent 2/swarm.service.task.failed.time[{#SERVICE}])>now()-{$SWARM.SERVICE.TASK.FAILED.PERIOD:"{#SERVICE}"} and length(last(/Docker Swarm by Zabbix agent 2/swarm.service.task.failed.error[{#SERVICE}]))>=0`|Warning|**Manual close**: Yes|
|Swarm: Service {#SERVICE}: No running replicas|<p>The service has had no running replicas for {$SWARM.SERVICE.REPLICAS.TIMEOUT}. A redeploy that completes within this period does not fire the trigger.</p>|`max(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.running[{#SERVICE}],{$SWARM.SERVICE.REPLICAS.TIMEOUT:"{#SERVICE}"})=0 and last(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.desired[{#SERVICE}])>0`|High||
|Swarm: Service {#SERVICE}: Replicas below desired|<p>The service has had fewer running replicas than desired for {$SWARM.SERVICE.REPLICAS.TIMEOUT}.</p>|`max(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.running[{#SERVICE}],{$SWARM.SERVICE.REPLICAS.TIMEOUT:"{#SERVICE}"})<last(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.desired[{#SERVICE}])`|Average|**Depends on**:<br><ul><li>Swarm: Service {#SERVICE}: No running replicas</li></ul>|

## Feedback

Please report any issues with the template at [`https://github.com/noakky/zabbix-template-docker-swarm/issues`](https://github.com/noakky/zabbix-template-docker-swarm/issues)

## Author

[noakky](https://github.com/noakky)
