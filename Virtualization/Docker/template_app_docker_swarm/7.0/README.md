
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

Open files of task processes are compared with their `nofile` ulimit (`ulimits` of the service or the defaults of the Docker daemon).
The limit applies to every process separately, so the template reports the highest share of the limit used by one process of the service.
At the limit the application fails with `Too many open files`.

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

5. Optional, for open files monitoring: let Zabbix agent 2 count open files of task processes.
   The `nofile` limits are read from `/proc/<pid>/limits`, which is readable by everyone, but `/proc/<pid>/fd` of processes of other users is readable only with the `CAP_DAC_READ_SEARCH` capability.
   Give it to the agent with a systemd drop-in:

   ```
   mkdir -p /etc/systemd/system/zabbix-agent2.service.d
   cat >/etc/systemd/system/zabbix-agent2.service.d/swarm.conf <<'EOF'
   [Service]
   AmbientCapabilities=CAP_DAC_READ_SEARCH
   EOF
   systemctl daemon-reload
   systemctl restart zabbix-agent2
   ```

   The capability lets the agent and its user parameters read any file on the node. The `docker` group from step 1 already gives equivalent access, so the capability does not widen it much.
   Without the capability the item `Swarm open files readable` is `Denied`, and the open files items get no data; the open files limit is collected anyway.

6. Import the template and link `Docker Swarm by Zabbix agent 2` to the host instead of `Docker by Zabbix agent 2`.

Test availability: `zabbix_get -s docker-host -k swarm.services.get`. With the capability, the `limits` section of the output has `"fds"` of 0 or more; `-1` means that access is denied.

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$SWARM.LLD.FILTER.SERVICE.MATCHES}|<p>Filter of discoverable swarm services.</p>|`.*`|
|{$SWARM.LLD.FILTER.SERVICE.NOT_MATCHES}|<p>Filter to exclude discovered swarm services.</p>|`CHANGE_IF_NEEDED`|
|{$SWARM.NODATA.TIMEOUT}|<p>Period without data after which the "Failed to fetch swarm data" trigger fires.</p>|`10m`|
|{$SWARM.SERVICE.CPU.THROTTLED.MAX}|<p>Threshold of the CPU throttling of a service task, % of CPU scheduler periods. Supports context: {$SWARM.SERVICE.CPU.THROTTLED.MAX:"stack_service"}.</p>|`25`|
|{$SWARM.SERVICE.CPU.THROTTLED.TIME}|<p>Period of the CPU throttling trigger. Supports context.</p>|`15m`|
|{$SWARM.SERVICE.MEM.UTIL.MAX}|<p>Threshold of the service task memory utilization, %. The default 100 never fires; set it per service to enable the trigger: {$SWARM.SERVICE.MEM.UTIL.MAX:"stack_service"}=90.</p>|`100`|
|{$SWARM.SERVICE.MEM.UTIL.TIME}|<p>Period of the high memory utilization trigger.</p>|`15m`|
|{$SWARM.SERVICE.NOFILE.UTIL.CRIT}|<p>Critical threshold of the open files utilization of a service task process, % of its soft nofile ulimit. Supports context.</p>|`90`|
|{$SWARM.SERVICE.NOFILE.UTIL.TIME}|<p>Period of the open files utilization triggers. Supports context.</p>|`5m`|
|{$SWARM.SERVICE.NOFILE.UTIL.WARN}|<p>Warning threshold of the open files utilization of a service task process, % of its soft nofile ulimit. Supports context.</p>|`80`|
|{$SWARM.SERVICE.REPLICAS.TIMEOUT}|<p>How long a service may run below desired replicas before the triggers fire. Supports context.</p>|`5m`|
|{$SWARM.SERVICE.UNHEALTHY.TIMEOUT}|<p>How long service tasks may be unhealthy before the trigger fires. Supports context.</p>|`5m`|
|{$SWARM.SERVICE.TASK.FAILED.PERIOD}|<p>How long the task failure problem stays open. Supports context.</p>|`15m`|
|{$SWARM.SERVICE.UPDATE.FAILED.PERIOD}|<p>How long after the start of a failed update the problem stays open while the service runs all desired replicas. Supports context.</p>|`1h`|
|{$DOCKER.LLD.FILTER.CONTAINER.NOT_MATCHES}|<p>Overrides the macro of Docker by Zabbix agent 2: excludes swarm task containers from its container discovery, they are monitored per service.</p>|`\.([0-9]+\|[a-z0-9]{25})\.[a-z0-9]{25}$`|

### Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Get swarm snapshot|<p>Output of swarm.sh: task containers of this node with their stats and open files, services, update states and failed tasks.</p>|Zabbix agent|swarm.services.get|
|Swarm services data|<p>Snapshot aggregated per service.</p>|Dependent item|swarm.services.aggr<p>**Preprocessing**</p><ul><li><p>JavaScript: `The text is too long. Please see the template.`</p></li></ul>|
|Swarm services count|<p>Number of swarm services seen by this node.</p>|Dependent item|swarm.services.count<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.count`</p></li></ul>|
|Swarm open files readable|<p>1 if swarm.sh can count open files of the task processes, 0 if access to /proc/&lt;pid&gt;/fd is denied: Zabbix agent 2 needs CAP_DAC_READ_SEARCH, see README.md. No value while no tasks run on this node.</p>|Dependent item|swarm.services.nofile<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.nofile`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|

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
|Service {#SERVICE}: Update started at|<p>Start time of the last service update. Managers only.</p>|Dependent item|swarm.service.update.started[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].update_started`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Update message|<p>Docker message of the last service update, e.g. the task that paused it. Managers only.</p>|Dependent item|swarm.service.update.message[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].update_message`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Image|<p>Image of the service.</p>|Dependent item|swarm.service.image[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].image`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1d`</p></li></ul>|
|Service {#SERVICE}: Last failed task time|<p>Time of the last failed or rejected task of the service (crash, failed healthcheck, image pull error). Managers only.</p>|Dependent item|swarm.service.task.failed.time[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].task_failed_time`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Last failed task error|<p>Swarm error of the last failed or rejected task of the service. Managers only.</p>|Dependent item|swarm.service.task.failed.error[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].task_failed_error`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: CPU usage|<p>CPU usage of all service tasks on this node, % of one core.</p>|Dependent item|swarm.service.cpu[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: CPU limit|<p>CPU limits of all service tasks on this node, in cores; node CPUs for tasks without a limit.</p>|Dependent item|swarm.service.cpu.limit[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu_limit`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: CPU utilization|<p>Max CPU utilization among service tasks on this node, relative to the task CPU limit (node CPUs for tasks without a limit).</p>|Dependent item|swarm.service.cpu.util[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu_util`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: CPU kernelmode usage|<p>CPU time in kernel mode per second of all service tasks on this node, in cores.</p>|Dependent item|swarm.service.cpu.kernel[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu_kernel`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: CPU usermode usage|<p>CPU time in user mode per second of all service tasks on this node, in cores.</p>|Dependent item|swarm.service.cpu.user[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu_user`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: CPU throttled|<p>Max share of CPU scheduler periods in which a service task was throttled by its CPU limit.</p>|Dependent item|swarm.service.cpu.throttled[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].cpu_throttled`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Online CPUs|<p>CPUs available to the service tasks.</p>|Dependent item|swarm.service.cpu.online[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].online_cpus`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Memory used|<p>Memory usage without inactive file cache of all service tasks on this node.</p>|Dependent item|swarm.service.memory[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Memory usage total|<p>Memory usage including file cache of all service tasks on this node.</p>|Dependent item|swarm.service.memory.total[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem_total`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Memory usage inactive|<p>Inactive file cache of all service tasks on this node.</p>|Dependent item|swarm.service.memory.inactive[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem_inactive`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Memory limit|<p>Memory limits of all service tasks on this node; host memory for tasks without a limit.</p>|Dependent item|swarm.service.memory.limit[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem_limit`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Memory utilization|<p>Max memory utilization among service tasks on this node, relative to the task memory limit.</p>|Dependent item|swarm.service.memory.pct[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].mem_pct`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Processes|<p>Processes of all service tasks on this node.</p>|Dependent item|swarm.service.pids[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].pids`</p><p>⛔️Custom on fail: Set value to: `0`</p></li></ul>|
|Service {#SERVICE}: Open files|<p>Open file descriptors of all processes of the service tasks on this node. Requires CAP_DAC_READ_SEARCH for Zabbix agent 2, see README.md.</p>|Dependent item|swarm.service.nofile.open[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].nofile_open`</p><p>⛔️Custom on fail: Discard value</p></li></ul>|
|Service {#SERVICE}: Open files limit|<p>Lowest soft nofile ulimit (RLIMIT_NOFILE) among processes of the service tasks on this node: the ulimits of the service or the defaults of the Docker daemon.</p>|Dependent item|swarm.service.nofile.limit[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].nofile_limit`</p><p>⛔️Custom on fail: Discard value</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|
|Service {#SERVICE}: Open files utilization|<p>Highest share of its soft nofile ulimit used by one process of the service tasks on this node. The limit applies to each process separately. Requires CAP_DAC_READ_SEARCH for Zabbix agent 2, see README.md.</p>|Dependent item|swarm.service.nofile.pct[{#SERVICE}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.services['{#SERVICE}'].nofile_pct`</p><p>⛔️Custom on fail: Discard value</p></li></ul>|
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
|Swarm: Service {#SERVICE}: CPU throttled by limit|<p>A service task was throttled by its CPU limit in over {$SWARM.SERVICE.CPU.THROTTLED.MAX}% of CPU scheduler periods on average for {$SWARM.SERVICE.CPU.THROTTLED.TIME}: it needs more CPU than the limit gives and slows down. Usage close to the limit without throttling is not a problem. Raise the CPU limit of the service or find what loads it.</p>|`avg(/Docker Swarm by Zabbix agent 2/swarm.service.cpu.throttled[{#SERVICE}],{$SWARM.SERVICE.CPU.THROTTLED.TIME:"{#SERVICE}"})>{$SWARM.SERVICE.CPU.THROTTLED.MAX:"{#SERVICE}"}`|Warning||
|Swarm: Service {#SERVICE}: High memory utilization|<p>Memory utilization of a service task is over {$SWARM.SERVICE.MEM.UTIL.MAX} for {$SWARM.SERVICE.MEM.UTIL.TIME}. Off by default ({$SWARM.SERVICE.MEM.UTIL.MAX}=100): services with caches or a heap sized to the limit (databases, JVM, Go) run close to it normally; the OOM trigger reports real memory shortage. Enable per service with the macro context.</p>|`min(/Docker Swarm by Zabbix agent 2/swarm.service.memory.pct[{#SERVICE}],{$SWARM.SERVICE.MEM.UTIL.TIME:"{#SERVICE}"})>{$SWARM.SERVICE.MEM.UTIL.MAX:"{#SERVICE}"}`|Warning||
|Swarm: Service {#SERVICE}: Almost out of open files|<p>A process of the service uses over {$SWARM.SERVICE.NOFILE.UTIL.CRIT}% of its nofile ulimit for {$SWARM.SERVICE.NOFILE.UTIL.TIME}: "Too many open files" errors are close. Raise ulimits.nofile of the service or restart it, then find the descriptor leak.</p>|`min(/Docker Swarm by Zabbix agent 2/swarm.service.nofile.pct[{#SERVICE}],{$SWARM.SERVICE.NOFILE.UTIL.TIME:"{#SERVICE}"})>{$SWARM.SERVICE.NOFILE.UTIL.CRIT:"{#SERVICE}"}`|Average||
|Swarm: Service {#SERVICE}: Running out of open files|<p>A process of the service uses over {$SWARM.SERVICE.NOFILE.UTIL.WARN}% of its nofile ulimit for {$SWARM.SERVICE.NOFILE.UTIL.TIME}. At the limit new files and connections fail with "Too many open files". Raise ulimits.nofile of the service or find the descriptor leak.</p>|`min(/Docker Swarm by Zabbix agent 2/swarm.service.nofile.pct[{#SERVICE}],{$SWARM.SERVICE.NOFILE.UTIL.TIME:"{#SERVICE}"})>{$SWARM.SERVICE.NOFILE.UTIL.WARN:"{#SERVICE}"}`|Warning|**Depends on**:<br><ul><li>Swarm: Service {#SERVICE}: Almost out of open files</li></ul>|
|Swarm: Service {#SERVICE}: Update failed ({ITEM.LASTVALUE1})|<p>The last service update was paused or rolled back. Fires for {$SWARM.SERVICE.UPDATE.FAILED.PERIOD} after the update started, later only while the service runs below desired replicas, so an old failed update of a healthy service does not fire. Resolves with the next successful update.</p>|`find(/Docker Swarm by Zabbix agent 2/swarm.service.update.state[{#SERVICE}],,"regexp","^(paused\|rollback_started\|rollback_paused\|rollback_completed)$")=1 and length(last(/Docker Swarm by Zabbix agent 2/swarm.service.update.message[{#SERVICE}]))>=0 and (last(/Docker Swarm by Zabbix agent 2/swarm.service.update.started[{#SERVICE}])>now()-{$SWARM.SERVICE.UPDATE.FAILED.PERIOD:"{#SERVICE}"} or max(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.running[{#SERVICE}],{$SWARM.SERVICE.REPLICAS.TIMEOUT:"{#SERVICE}"})<last(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.desired[{#SERVICE}]))`|Average|**Manual close**: Yes|
|Swarm: Service {#SERVICE}: Task failed|<p>A task of the service crashed, was killed as unhealthy or could not start. Resolves after {$SWARM.SERVICE.TASK.FAILED.PERIOD}.</p>|`last(/Docker Swarm by Zabbix agent 2/swarm.service.task.failed.time[{#SERVICE}])>now()-{$SWARM.SERVICE.TASK.FAILED.PERIOD:"{#SERVICE}"} and length(last(/Docker Swarm by Zabbix agent 2/swarm.service.task.failed.error[{#SERVICE}]))>=0`|Warning|**Manual close**: Yes|
|Swarm: Service {#SERVICE}: No running replicas|<p>The service has had no running replicas for {$SWARM.SERVICE.REPLICAS.TIMEOUT}. A redeploy that completes within this period does not fire the trigger.</p>|`max(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.running[{#SERVICE}],{$SWARM.SERVICE.REPLICAS.TIMEOUT:"{#SERVICE}"})=0 and last(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.desired[{#SERVICE}])>0`|High||
|Swarm: Service {#SERVICE}: Replicas below desired|<p>The service has had fewer running replicas than desired for {$SWARM.SERVICE.REPLICAS.TIMEOUT}.</p>|`max(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.running[{#SERVICE}],{$SWARM.SERVICE.REPLICAS.TIMEOUT:"{#SERVICE}"})<last(/Docker Swarm by Zabbix agent 2/swarm.service.replicas.desired[{#SERVICE}])`|Average|**Depends on**:<br><ul><li>Swarm: Service {#SERVICE}: No running replicas</li></ul>|

## Feedback

Please report any issues with the template at [`https://github.com/noakky/zabbix-template-docker-swarm/issues`](https://github.com/noakky/zabbix-template-docker-swarm/issues)

## Author

[noakky](https://github.com/noakky)
