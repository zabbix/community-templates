# Mesos by HTTP

## Description

This template works out of the box as soon as Mesos Observability Metrics is available inside your cluster; it does not require any Zabbix agent installation or configuration. It allows external monitoring of the Mesos cluster through the metrics HTTP endpoint.

## Overview

 ### Description


zabbix-mesos queries the Observability metrics endpoint, as it's described in [Observability Metrics](https://mesos.apache.org/documentation/latest/monitoring/).


### Installation


1. Import global Zabbix Template (zabbix-mesos-via-http.xml) into your Zabbix server.
2. Create or import hosts identifying your Mesos cluster masters.
3. Create or import hosts identifying your Mesos cluster agents.
4. Assign 'Template App Mesos Master via HTTP' template to Mesos masters
5. Assign 'Template App Mesos Master via HTTP' template to Mesos agents


### Templates


The global export (zabbix-mesos-master.xml) contains following templates:




| Templates | Description |
| --- | --- |
| Template App Mesos Master via HTTP | Template applied to the Mesos masters. |
| Template App Mesos Agent via HTTP | Template applied to the Mesos agents. |


### Licenses




| Template | License |
| --- | --- |
| Template App Mesos Master via HTTP | *GNU General Public License v3.0* [Copyright (C) 2023 Erasys GmbH](https://www.erasys.de/) |
| Template App Mesos Agent via HTTP | *GNU General Public License v3.0* [Copyright (C) 2023 Erasys GmbH](https://www.erasys.de/) |




---


 
# Template App Mesos Master via HTTP


## Author

Ilya Pelevin

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MESOS_CPUS_PERCENT_CRIT}|<p>Maximal tolerated load on the CPUs</p>|`90`|Text macro|
|{$MESOS_CPUS_PERCENT_WARN}|<p>Warning threshold for load on the CPUs</p>|`80`|Text macro|
|{$MESOS_MEMORY_PERCENT_CRIT}|<p>Maximal tolerated load on the memory</p>|`90`|Text macro|
|{$MESOS_MEMORY_PERCENT_WARN}|<p>Warning threshold for load on the memory</p>|`80`|Text macro|
|{$MESOS_MIN_SLAVES_CRIT}|<p>Minimal tolerated number of Mesos agents</p>|`65`|Text macro|
|{$MESOS_MIN_SLAVES_WARN}|<p>Warning threshold for number of Mesos agents</p>|`70`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Get Mesos master metrics||HTTP_AGENT|mesos.master.get_metrics|
|Mesos master: Allocator mesos allocation runs per second|Number of times the allocation algorithm has run per second|DEPENDENT|mesos.master[allocator/mesos/allocation_runs]|
|Mesos master: Allocator mesos allocation run latency ms count|Number of allocation batch latency measurements in the window|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms/count]|
|Mesos master: Allocator mesos allocation run latency ms max|Maximum allocation batch latency in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms/max]|
|Mesos master: Allocator mesos allocation run latency ms min|Minimum allocation batch latency in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms/min]|
|Mesos master: Allocator mesos allocation run latency ms p50|Median allocation batch latency in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms/p50]|
|Mesos master: Allocator mesos allocation run latency ms p90|90th percentile allocation batch latency in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms/p90]|
|Mesos master: Allocator mesos allocation run latency ms p95|95th percentile allocation batch latency in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms/p95]|
|Mesos master: Allocator mesos allocation run latency ms p99|99th percentile allocation batch latency in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms/p99]|
|Mesos master: Allocator mesos allocation run latency ms p999|99.9th percentile allocation batch latency in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms/p999]|
|Mesos master: Allocator mesos allocation run latency ms p9999|99.99th percentile allocation batch latency in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms/p9999]|
|Mesos master: Allocator mesos allocation run latency ms|Allocation batch latency in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_latency_ms]|
|Mesos master: Allocator mesos allocation run ms count|Number of allocation algorithm time measurements in the window|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms/count]|
|Mesos master: Allocator mesos allocation run ms max|Maximum time spent in allocation algorithm in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms/max]|
|Mesos master: Allocator mesos allocation run ms min|Minimum time spent in allocation algorithm in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms/min]|
|Mesos master: Allocator mesos allocation run ms p50|Median time spent in allocation algorithm in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms/p50]|
|Mesos master: Allocator mesos allocation run ms p90|90th percentile of time spent in allocation algorithm in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms/p90]|
|Mesos master: Allocator mesos allocation run ms p95|95th percentile of time spent in allocation algorithm in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms/p95]|
|Mesos master: Allocator mesos allocation run ms p99|99th percentile of time spent in allocation algorithm in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms/p99]|
|Mesos master: Allocator mesos allocation run ms p999|99.9th percentile of time spent in allocation algorithm in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms/p999]|
|Mesos master: Allocator mesos allocation run ms p9999|99.99th percentile of time spent in allocation algorithm in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms/p9999]|
|Mesos master: Allocator mesos allocation run ms|Time spent in allocation algorithm in ms|DEPENDENT|mesos.master[allocator/mesos/allocation_run_ms]|
|Mesos master: Allocator event queue dispatches|Number of dispatch events in the event queue|DEPENDENT|mesos.master[allocator/mesos/event_queue_dispatches]|
|Mesos master: Allocator mesos CPUs offered or allocated|Number of CPUs offered or allocated|DEPENDENT|mesos.master[allocator/mesos/resources/cpus/offered_or_allocated]|
|Mesos master: Allocator mesos CPUs total|Number of CPUs|DEPENDENT|mesos.master[allocator/mesos/resources/cpus/total]|
|Mesos master: Allocator mesos resources disk offered or allocated|Allocated or offered disk space|DEPENDENT|mesos.master[allocator/mesos/resources/disk/offered_or_allocated]|
|Mesos master: Allocator mesos resources disk total|Total disk space|DEPENDENT|mesos.master[allocator/mesos/resources/disk/total]|
|Mesos master: Allocator mesos memory offered or allocated|Allocated or offered memory|DEPENDENT|mesos.master[allocator/mesos/resources/mem/offered_or_allocated]|
|Mesos master: Allocator mesos resources memory total|Total memory|DEPENDENT|mesos.master[allocator/mesos/resources/mem/total]|
|Mesos master: CPUs percent|Percentage of allocated CPUs|DEPENDENT|mesos.master[master/cpus_percent]|
|Mesos master: CPUs revocable percent|Percentage of allocated revocable CPUs|DEPENDENT|mesos.master[master/cpus_revocable_percent]|
|Mesos master: CPUs revocable total|Number of revocable CPUs|DEPENDENT|mesos.master[master/cpus_revocable_total]|
|Mesos master: CPUs revocable used|Number of allocated revocable CPUs|DEPENDENT|mesos.master[master/cpus_revocable_used]|
|Mesos master: CPUs total|Number of CPUs|DEPENDENT|mesos.master[master/cpus_total]|
|Mesos master: CPUs used|Number of allocated CPUs|DEPENDENT|mesos.master[master/cpus_used]|
|Mesos master: Disk percent|Percentage of allocated disk space|DEPENDENT|mesos.master[master/disk_percent]|
|Mesos master: Disk revocable percent|Percentage of allocated revocable disk space|DEPENDENT|mesos.master[master/disk_revocable_percent]|
|Mesos master: Disk revocable total|Revocable disk space|DEPENDENT|mesos.master[master/disk_revocable_total]|
|Mesos master: Disk revocable used|Allocated revocable disk space|DEPENDENT|mesos.master[master/disk_revocable_used]|
|Mesos master: Disk total|Disk space|DEPENDENT|mesos.master[master/disk_total]|
|Mesos master: Disk used|Allocated disk space|DEPENDENT|mesos.master[master/disk_used]|
|Mesos master: Messages dropped|Number of dropped messages|DEPENDENT|mesos.master[master/dropped_messages]|
|Mesos master: Role|Whether this is the elected master|DEPENDENT|mesos.master[master/elected]|
|Mesos master: Event queue dispatches|Number of messages in the event queue|DEPENDENT|mesos.master[master/event_queue_dispatches]|
|Mesos master: Event queue messages|Number of dispatches in the event queue|DEPENDENT|mesos.master[master/event_queue_messages]|
|Mesos master: Frameworks active|Number of active frameworks|DEPENDENT|mesos.master[master/frameworks_active]|
|Mesos master: Frameworks connected|Number of connected frameworks|DEPENDENT|mesos.master[master/frameworks_connected]|
|Mesos master: Frameworks disconnected|Number of disconnected frameworks|DEPENDENT|mesos.master[master/frameworks_disconnected]|
|Mesos master: Frameworks inactive|Number of inactive frameworks|DEPENDENT|mesos.master[master/frameworks_inactive]|
|Mesos master: GPUs percent|Percentage of allocated GPUs|DEPENDENT|mesos.master[master/gpus_percent]|
|Mesos master: GPUs revocable percent|Percentage of allocated revocable GPUs|DEPENDENT|mesos.master[master/gpus_revocable_percent]|
|Mesos master: GPUs revocable total|Number of revocable GPUs|DEPENDENT|mesos.master[master/gpus_revocable_total]|
|Mesos master: GPUs revocable used|Number of allocated revocable GPUs|DEPENDENT|mesos.master[master/gpus_revocable_used]|
|Mesos master: GPUs total|Number of GPUs|DEPENDENT|mesos.master[master/gpus_total]|
|Mesos master: GPUs used|Number of allocated GPUs|DEPENDENT|mesos.master[master/gpus_used]|
|Mesos master: Invalid executor to framework messages|Number of invalid executor to framework messages per second|DEPENDENT|mesos.master[master/invalid_executor_to_framework_messages]|
|Mesos master: Invalid framework to executor messages|Number of invalid framework to executor messages per second|DEPENDENT|mesos.master[master/invalid_framework_to_executor_messages]|
|Mesos master: Invalid status updates|Number of invalid status updates per second|DEPENDENT|mesos.master[master/invalid_status_updates]|
|Mesos master: Invalid status update acknowledgements|Number of invalid operation status update acknowledgements per second|DEPENDENT|mesos.master[master/invalid_status_update_acknowledgements]|
|Mesos master: Memory percent|Percentage of allocated memory|DEPENDENT|mesos.master[master/mem_percent]|
|Mesos master: Memory revocable percent|Percentage of allocated revocable memory|DEPENDENT|mesos.master[master/mem_revocable_percent]|
|Mesos master: Memory revocable total|Revocable memory|DEPENDENT|mesos.master[master/mem_revocable_total]|
|Mesos master: Memory revocable used|Allocated revocable memory|DEPENDENT|mesos.master[master/mem_revocable_used]|
|Mesos master: Memory total|Memory|DEPENDENT|mesos.master[master/mem_total]|
|Mesos master: Memory used|Allocated memory|DEPENDENT|mesos.master[master/mem_used]|
|Mesos master: Messages authenticate|Number of authentication messages per second|DEPENDENT|mesos.master[master/messages_authenticate]|
|Mesos master: Messages deactivate framework|Number of framework deactivation messages per second|DEPENDENT|mesos.master[master/messages_deactivate_framework]|
|Mesos master: Messages decline offers|Number of offers declined per second|DEPENDENT|mesos.master[master/messages_decline_offers]|
|Mesos master: Messages executor to framework|Number of executor to framework messages per second|DEPENDENT|mesos.master[master/messages_executor_to_framework]|
|Mesos master: Messages exited executor|Number of terminated executor messages per second|DEPENDENT|mesos.master[master/messages_exited_executor]|
|Mesos master: Messages framework to executor|Number of messages from a framework to an executor per second|DEPENDENT|mesos.master[master/messages_framework_to_executor]|
|Mesos master: Messages kill task|Number of kill task messages per second|DEPENDENT|mesos.master[master/messages_kill_task]|
|Mesos master: Messages launch tasks|Number of launch task messages per second|DEPENDENT|mesos.master[master/messages_launch_tasks]|
|Mesos master: Messages operation status update acknowledgement|Number of launch task messages per second|DEPENDENT|mesos.master[master/messages_operation_status_update_acknowledgement]|
|Mesos master: Messages reconcile tasks|Number of reconcile task messages per second|DEPENDENT|mesos.master[master/messages_reconcile_tasks]|
|Mesos master: Messages register framework|Number of framework registration messages per second|DEPENDENT|mesos.master[master/messages_register_framework]|
|Mesos master: Messages register slave|Number of agent registration messages per second|DEPENDENT|mesos.master[master/messages_register_slave]|
|Mesos master: Messages re-register framework|Number of framework re-registration messages per second|DEPENDENT|mesos.master[master/messages_reregister_framework]|
|Mesos master: Messages re-register slave|Number of agent re-registration messages per second|DEPENDENT|mesos.master[master/messages_reregister_slave]|
|Mesos master: Messages resource request|Number of resource request messages per second|DEPENDENT|mesos.master[master/messages_resource_request]|
|Mesos master: Messages revive offers|Number of offer revival messages per second|DEPENDENT|mesos.master[master/messages_revive_offers]|
|Mesos master: Messages status update|Number of status update messages per second|DEPENDENT|mesos.master[master/messages_status_update]|
|Mesos master: Messages status update acknowledgement|Number of status update acknowledgement messages per second|DEPENDENT|mesos.master[master/messages_status_update_acknowledgement]|
|Mesos master: Messages suppress offers||DEPENDENT|mesos.master[master/messages_suppress_offers]|
|Mesos master: Messages unregister framework|Number of framework unregistration messages per second|DEPENDENT|mesos.master[master/messages_unregister_framework]|
|Mesos master: Messages unregister slave|Number of agent unregistration messages per second|DEPENDENT|mesos.master[master/messages_unregister_slave]|
|Mesos master: Messages update slave|Number of update agent messages per second|DEPENDENT|mesos.master[master/messages_update_slave]|
|Mesos master: Outstanding offers|Number of outstanding resource offers|DEPENDENT|mesos.master[master/outstanding_offers]|
|Mesos master: Recovery slave removals|Number of agents not reregistered during master failover per second|DEPENDENT|mesos.master[master/recovery_slave_removals]|
|Mesos master: Slaves active|Number of active agents|DEPENDENT|mesos.master[master/slaves_active]|
|Mesos master: Slaves connected|Number of connected agents|DEPENDENT|mesos.master[master/slaves_connected]|
|Mesos master: Slaves disconnected|Number of disconnected agents|DEPENDENT|mesos.master[master/slaves_disconnected]|
|Mesos master: Slaves inactive|Number of inactive agents|DEPENDENT|mesos.master[master/slaves_inactive]|
|Mesos master: Slaves unreachable|Number of unreachable agents per second. Unreachable agents are periodically garbage collected from the registry, which will cause this value to decrease.|DEPENDENT|mesos.master[master/slaves_unreachable]|
|Mesos master: Slave registrations|Number of agents per second that were able to cleanly re-join the cluster and connect back to the master after the master is disconnected.|DEPENDENT|mesos.master[master/slave_registrations]|
|Mesos master: Slave removals reason registered|Number of agents removed when new agents registered at the same address per second|DEPENDENT|mesos.master[master/slave_removals/reason_registered]|
|Mesos master: Slave removals reason unhealthy|Number of agents failed due to failed health checks per second|DEPENDENT|mesos.master[master/slave_removals/reason_unhealthy]|
|Mesos master: Slave removals reason unregistered|Number of agents unregistered per second|DEPENDENT|mesos.master[master/slave_removals/reason_unregistered]|
|Mesos master: Slave removals|Number of agent per second removed for various reasons, including maintenance|DEPENDENT|mesos.master[master/slave_removals]|
|Mesos master: Slaves re-registrations|Number of agent re-registrations per second|DEPENDENT|mesos.master[master/slave_reregistrations]|
|Mesos master: Slaves shutdowns cancelled||DEPENDENT|mesos.master[master/slave_shutdowns_canceled]|
|Mesos master: Slave shutdowns completed||DEPENDENT|mesos.master[master/slave_shutdowns_completed]|
|Mesos master: Slaves shutdowns scheduled||DEPENDENT|mesos.master[master/slave_shutdowns_scheduled]|
|Mesos master: Slaves unreachable cancelled|Number of times per second that an agent was due to be marked unreachable but this transition was cancelled. This happens when the agent removal rate limit is enabled and the agent sends a PONG response message to the master before the rate limit allows the agent to be marked unreachable.|DEPENDENT|mesos.master[master/slave_unreachable_canceled]|
|Mesos master: Slaves unreachable completed|Number of agents per second that were marked as unreachable because they failed health checks. These are agents which were not heard from despite the agent-removal rate limit, and have been marked as unreachable in the master's agent registry.|DEPENDENT|mesos.master[master/slave_unreachable_completed]|
|Mesos master: Slaves unreachable scheduled|Number of agents per second which have failed their health check and are scheduled to be marked unreachable. They will not be marked unreachable immediately due to the Agent Removal Rate-Limit, but master/slave_unreachable_completed will start increasing as they do get removed.|DEPENDENT|mesos.master[master/slave_unreachable_scheduled]|
|Mesos master: Tasks dropped||DEPENDENT|mesos.master[master/tasks_dropped]|
|Mesos master: Tasks error|Number of tasks per second that were invalid|DEPENDENT|mesos.master[master/tasks_error]|
|Mesos master: Tasks failed|Number of failed tasks per second|DEPENDENT|mesos.master[master/tasks_failed]|
|Mesos master: Tasks finished|Number of finished tasks per second|DEPENDENT|mesos.master[master/tasks_finished]|
|Mesos master: Tasks gone||DEPENDENT|mesos.master[master/tasks_gone]|
|Mesos master: Tasks gone by operator||DEPENDENT|mesos.master[master/tasks_gone_by_operator]|
|Mesos master: Tasks killed|Number of killed tasks|DEPENDENT|mesos.master[master/tasks_killed]|
|Mesos master: Tasks killing|Number of tasks currently being killed|DEPENDENT|mesos.master[master/tasks_killing]|
|Mesos master: Tasks lost|Number of lost tasks per second|DEPENDENT|mesos.master[master/tasks_lost]|
|Mesos master: Tasks running|Number of running tasks|DEPENDENT|mesos.master[master/tasks_running]|
|Mesos master: Tasks staging|Number of staging tasks|DEPENDENT|mesos.master[master/tasks_staging]|
|Mesos master: Tasks starting|Number of starting tasks|DEPENDENT|mesos.master[master/tasks_starting]|
|Mesos master: Tasks unreachable|Number of unreachable tasks|DEPENDENT|mesos.master[master/tasks_unreachable]|
|Mesos master: Task lost source master reason slave removed||DEPENDENT|mesos.master[master/task_lost/source_master/reason_slave_removed]|
|Mesos master: Uptime|Uptime in seconds|DEPENDENT|mesos.master[master/uptime_secs]|
|Mesos master: Valid executor to framework messages|Number of valid executor to framework messages per second|DEPENDENT|mesos.master[master/valid_executor_to_framework_messages]|
|Mesos master: Valid framework to executor messages|Number of valid framework to executor messages per second|DEPENDENT|mesos.master[master/valid_framework_to_executor_messages]|
|Mesos master: Valid status updates|Number of valid status update messages per second|DEPENDENT|mesos.master[master/valid_status_updates]|
|Mesos master: Valid status update acknowledgements|Number of valid status update acknowledgement messages per second|DEPENDENT|mesos.master[master/valid_status_update_acknowledgements]|
|Mesos master: Event queue HTTP requests|Number of HTTP requests in the event queue|DEPENDENT|mesos.master[master_event_queue_http_requests]|
|Mesos master: Registrar log ensemble size|The number of masters in the ensemble (cluster) that the current master communicates with (including itself) to form the replicated log quorum. It's imperative that this number is always less than `--quorum * 2` to prevent split-brain. It's also important that it should be greater than or equal to `--quorum` to maintain availability.|DEPENDENT|mesos.master[registrar/log/ensemble_size]|
|Mesos master: Registrar log recovered|Whether the replicated log for the registrar has caught up with the other masters in the cluster. A cluster is operational as long as a quorum of \recovered\ masters is available in the cluster.|DEPENDENT|mesos.master[registrar/log/recovered]|
|Mesos master: Registrar queued operations||DEPENDENT|mesos.master[registrar/queued_operations]|
|Mesos master: Registrar state fetch ms|Registry read latency in ms|DEPENDENT|mesos.master[registrar/state_fetch_ms]|
|Mesos master: Registrar state store ms max|Maximum registry write latency in ms|DEPENDENT|mesos.master[registrar/state_store_ms/max]|
|Mesos master: Registrar state store ms min|Minimum registry write latency in ms|DEPENDENT|mesos.master[registrar/state_store_ms/min]|
|Mesos master: Registrar state store ms p50|Median registry write latency in ms|DEPENDENT|mesos.master[registrar/state_store_ms/p50]|
|Mesos master: Registrar state store ms p90|90th percentile registry write latency in ms|DEPENDENT|mesos.master[registrar/state_store_ms/p90]|
|Mesos master: Registrar state store ms p95|95th percentile registry write latency in ms|DEPENDENT|mesos.master[registrar/state_store_ms/p95]|
|Mesos master: Registrar state store ms p99|99th percentile registry write latency in ms|DEPENDENT|mesos.master[registrar/state_store_ms/p99]|
|Mesos master: Registrar state store ms p999|99.9th percentile registry write latency in ms|DEPENDENT|mesos.master[registrar/state_store_ms/p999]|
|Mesos master: Registrar state store ms p9999|99.99th percentile registry write latency in ms|DEPENDENT|mesos.master[registrar/state_store_ms/p9999]|
|Mesos master: Registrar state store ms|Registry write latency in ms|DEPENDENT|mesos.master[registrar/state_store_ms]|
|System: CPUs total|Number of CPUs available in this master node|DEPENDENT|mesos.master[system/cpus_total]|
|System: load average 1min|Load average for the past minute|DEPENDENT|mesos.master[system/load_1min]|
|System: load average 5min|Load average for the past 5 minutes|DEPENDENT|mesos.master[system/load_5min]|
|System: load average 15min|Load average for the past 15 minutes|DEPENDENT|mesos.master[system/load_15min]|
|System: Memory free|Free memory in bytes|DEPENDENT|mesos.master[system/mem_free_bytes]|
|System: Memory total bytes|Total memory in bytes|DEPENDENT|mesos.master[system/mem_total_bytes]|



## Triggers

|Name|Expression|Priority|
|----|----------|--------|
|Tasks in the cluster are disappearing|min(/Template App Mesos Master via HTTP/mesos.master[master/tasks_lost],300)>0|AVERAGE|
|The cluster has a flapping master node|max(/Template App Mesos Master via HTTP/mesos.master[master/uptime_secs],600)<60|WARNING|
|The master has restarted|last(/Template App Mesos Master via HTTP/mesos.master[master/uptime_secs])<600|INFO|
|Cluster CPUs utilization is above {$MESOS_CPUS_PERCENT_CRIT}%|min(/Template App Mesos Master via HTTP/mesos.master[master/cpus_percent],600)>{$MESOS_CPUS_PERCENT_CRIT} and last(/Template App Mesos Master via HTTP/mesos.master[master/elected])=1|AVERAGE|
|Cluster CPUs utilization is above {$MESOS_CPUS_PERCENT_WARN}%|min(/Template App Mesos Master via HTTP/mesos.master[master/cpus_percent],600)>{$MESOS_CPUS_PERCENT_WARN} and last(/Template App Mesos Master via HTTP/mesos.master[master/elected])=1|WARNING|
|Cluster memory utilization is above {$MESOS_MEMORY_PERCENT_CRIT}%|min(/Template App Mesos Master via HTTP/mesos.master[master/mem_percent],600)>{$MESOS_MEMORY_PERCENT_CRIT} and last(/Template App Mesos Master via HTTP/mesos.master[master/elected])=1|AVERAGE|
|Cluster memory utilization is above {$MESOS_MEMORY_PERCENT_WARN}%|min(/Template App Mesos Master via HTTP/mesos.master[master/mem_percent],600)>{$MESOS_MEMORY_PERCENT_WARN} and last(/Template App Mesos Master via HTTP/mesos.master[master/elected])=1|AVERAGE|
|Number of Mesos agents are critically low|last(/Template App Mesos Master via HTTP/mesos.master[master/slaves_active])<{$MESOS_MIN_SLAVES_CRIT} and last(/Template App Mesos Master via HTTP/mesos.master[master/elected])=1|HIGH|
|Number of Mesos agents are low|last(/Template App Mesos Master via HTTP/mesos.master[master/slaves_active])<{$MESOS_MIN_SLAVES_WARN} and last(/Template App Mesos Master via HTTP/mesos.master[master/elected])=1|WARNING|



# Template App Mesos Agent via HTTP


## Author

Ilya Pelevin

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MESOS_AGENT_CPUS_CRIT}|<p>Maximal tolerated load on the CPUs</p>|`90`|Text macro|
|{$MESOS_AGENT_CPUS_WARN}|<p>Warning threshold for load on the CPUs</p>|`80`|Text macro|
|{$MESOS_AGENT_CPUS_MIN}|<p>WMinimum expected agent CPU allocation</p>|`50`|Text macro|
|{$MESOS_AGENT_CPUS_WARN}|<p>Maximal tolerated load on the memory</p>|`90`|Text macro|
|{$MESOS_AGENT_MEMORY_CRIT}|<p>Maximum tolerated agent memory allocation</p>|`90`|Text macro|
|{$MESOS_AGENT_MEMORY_WARN}|<p>Warning threshold for mesos agent memory allocation</p>|`80`|Text macro|
|{$MESOS_AGENT_DISK_CRIT}|<p>Maximum tolerated agent disk allocation</p>|`90`|Text macro|
|{$MESOS_AGENT_DISK_WARN}|<p>Warning threshold for mesos agent disk allocation</p>|`80`|Text macro|

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Get Mesos agent metrics||HTTP_AGENT|mesos.agent.get_metrics|
|Mesos agent: Containerizer fetcher cache size total|The configured maximum size of the fetcher cache in bytes. This value is constant for the life of the Mesos agent.|DEPENDENT|mesos.master[containerizer/fetcher/cache_size_total_bytes]|
|Mesos agent: Containerizer fetcher cache size used|The current amount of data stored in the fetcher cache in bytes.|DEPENDENT|mesos.master[containerizer/fetcher/cache_size_used_bytes]|
|Mesos agent: Task fetches failed|Number of times per second the Mesos fetcher failed to fetch all the URIs for a task.|DEPENDENT|mesos.master[containerizer/fetcher/task_fetches_failed]|
|Mesos agent: Task fetches succeeded|Number of times per second the Mesos fetcher successfully fetched all the URIs for a task.|DEPENDENT|mesos.master[containerizer/fetcher/task_fetches_succeeded]|
|Mesos agent: Containers destroyed due to launch errors|Number of containers destroyed due to launch errors|DEPENDENT|mesos.master[containerizer/mesos/container_destroy_errors]|
|Mesos agent: Garbage collector removals failed|Number of times per second the agent garbage collection process has failed to remove a sandbox path.|DEPENDENT|mesos.master[gc/path_removals_failed]|
|Mesos agent: Garbage collector removals pending|Number of sandbox paths that are currently pending agent garbage collection.|DEPENDENT|mesos.master[gc/path_removals_pending]|
|Mesos agent: Garbage collector removals succeeded|Number of sandbox paths per second the agent successfully removed.|DEPENDENT|mesos.master[gc/path_removals_succeeded]|
|Mesos agent: Containers launch errors per second|Number of container launch errors per second|DEPENDENT|mesos.master[slave/container_launch_errors]|
|Mesos agent: % CPUs allocated|Percentage of allocated CPUs|DEPENDENT|mesos.master[slave/cpus_percent]|
|Mesos agent: % revocable CPUs allocated|Percentage of allocated revocable CPUs|DEPENDENT|mesos.master[slave/cpus_revocable_percent]|
|Mesos agent: revocable CPUs total|Number of revocable CPUs|DEPENDENT|mesos.master[slave/cpus_revocable_total]|
|Mesos agent: revocable CPUs allocated|Number of allocated revocable CPUs|DEPENDENT|mesos.master[slave/cpus_revocable_used]|
|Mesos agent: CPUs total|Number of CPUs|DEPENDENT|mesos.master[slave/cpus_total]|
|Mesos agent: % disk allocated|Percentage of allocated disk space|DEPENDENT|mesos.master[slave/disk_percent]|
|Mesos agent: % revocable disk allocated|Percentage of allocated revocable disk space|DEPENDENT|mesos.master[slave/disk_revocable_percent]|
|Mesos agent: revocable Disk space total|Revocable disk space|DEPENDENT|mesos.master[slave/disk_revocable_total]|
|Mesos agent: revocable Disk space allocated|Allocated revocable disk space|DEPENDENT|mesos.master[slave/disk_revocable_used]|
|Mesos agent: Disk space total|Disk space|DEPENDENT|mesos.master[slave/disk_total]|
|Mesos agent: Disk space allocated|Allocated disk space|DEPENDENT|mesos.master[slave/disk_used]|
|Mesos agent: Executors preempted per second|Number of executors destroyed due to preemption per second|DEPENDENT|mesos.master[slave/executors_preempted]|
|Mesos agent: Executors registering|Number of executors registering|DEPENDENT|mesos.master[slave/executors_registering]|
|Mesos agent: Executors running|Number of executors running|DEPENDENT|mesos.master[slave/executors_running]|
|Mesos agent: Executors terminated per second|Number of terminated executors per second|DEPENDENT|mesos.master[slave/executors_terminated]|
|Mesos agent: Executors terminating|Number of terminating executors|DEPENDENT|mesos.master[slave/executors_terminating]|
|Mesos agent: Executor max allowed age|Maximum allowed age in seconds to delete executor directory|DEPENDENT|mesos.master[slave/executor_directory_max_allowed_age_secs]|
|Mesos agent: Frameworks active|Number of active frameworks|DEPENDENT|mesos.master[slave/frameworks_active]|
|Mesos agent: % GPUs allocated|Percentage of allocated GPUs|DEPENDENT|mesos.master[slave/gpus_percent]|
|Mesos agent: % revocable GPUs allocated|Percentage of allocated revocable GPUs|DEPENDENT|mesos.master[slave/gpus_revocable_percent]|
|Mesos agent: revocable GPUs total|Number of revocable GPUs|DEPENDENT|mesos.master[slave/gpus_revocable_total]|
|Mesos agent: revocable GPUs allocated|Number of allocated revocable GPUs|DEPENDENT|mesos.master[slave/gpus_revocable_used]|
|Mesos agent: GPUs total|Number of GPUs|DEPENDENT|mesos.master[slave/gpus_total]|
|Mesos agent: GPUs used|Number of allocated GPUs|DEPENDENT|mesos.master[slave/gpus_used]|
|Mesos agent: Invalid framework messages|Number of invalid framework messages per second|DEPENDENT|mesos.master[slave/invalid_framework_messages]|
|Mesos agent: Invalid status updates|Number of invalid status updates|DEPENDENT|mesos.master[slave/invalid_status_updates]|
|Mesos agent: % memory allocated|Percentage of allocated memory|DEPENDENT|mesos.master[slave/mem_percent]|
|Mesos agent: % revocable memory allocated|Percentage of allocated revocable memory|DEPENDENT|mesos.master[slave/mem_revocable_percent]|
|Mesos agent: revocable Memory total|Memory revocable total|DEPENDENT|mesos.master[slave/mem_revocable_total]|
|Mesos agent: revocable Memory allocated|Allocated revocable memory|DEPENDENT|mesos.master[slave/mem_revocable_used]|
|Mesos agent: Memory total|Memory total|DEPENDENT|mesos.master[slave/mem_total]|
|Mesos agent: Memory allocated|Allocated memory|DEPENDENT|mesos.master[slave/mem_used]|
|Mesos agent: Recovery errors|Number of errors encountered during agent recovery|DEPENDENT|mesos.master[slave/recovery_errors]|
|Mesos agent: Recovery time|Agent recovery time in seconds. This value is only available after agent recovery succeeded and remains constant for the life of the Mesos agent.|DEPENDENT|mesos.master[slave/recovery_time_secs]|
|Mesos agent: Registration status|Whether this agent is registered with a master|DEPENDENT|mesos.master[slave/registered]|
|Mesos agent: Tasks failed per second|Number of failed tasks per second|DEPENDENT|mesos.master[slave/tasks_failed]|
|Mesos agent: Tasks finished per second|Number of finished tasks per second|DEPENDENT|mesos.master[slave/tasks_finished]|
|Mesos agent: Tasks killed per second|Number of killed tasks per second|DEPENDENT|mesos.master[slave/tasks_killed]|
|Mesos agent: Tasks lost per second|Number of lost tasks per second|DEPENDENT|mesos.master[slave/tasks_lost]|
|Mesos agent: Tasks running|Number of running tasks|DEPENDENT|mesos.master[slave/tasks_running]|
|Mesos agent: Tasks staging|Number of staging tasks|DEPENDENT|mesos.master[slave/tasks_staging]|
|Mesos agent: Tasks starting|Number of starting tasks|DEPENDENT|mesos.master[slave/tasks_starting]|
|Mesos agent: Uptime|Uptime in seconds|DEPENDENT|mesos.master[slave/uptime_secs]|
|Mesos agent: Valid framework messages|Number of valid framework messages per second|DEPENDENT|mesos.master[slave/valid_framework_messages]|
|Mesos agent: Valid status updates|Number of valid status updates|DEPENDENT|mesos.master[slave/valid_status_updates]|
|System: CPUs total|Number of CPUs available|DEPENDENT|mesos.master[system/cpus_total]|
|System: Load average 1min|Load average for the past 1 minutes|DEPENDENT|mesos.master[system/load_1min]|
|System: Load average 5min|Load average for the past 5 minutes|DEPENDENT|mesos.master[system/load_5min]|
|System: Load average 15min|Load average for the past 15 minutes|DEPENDENT|mesos.master[system/load_15min]|
|System: Memory free|Free memory|DEPENDENT|mesos.master[system/mem_free_bytes]|
|System: Memory total|Total memory|DEPENDENT|mesos.master[system/mem_total_bytes]|
|Mesos agent: Volume GIDs free|Number of free gids available for volume gid manager|DEPENDENT|mesos.master[volume_gid_manager/volume_gids_free]|
|Mesos agent: Volume GIDs total|Number of gids configured for volume gid manager|DEPENDENT|mesos.master[volume_gid_manager/volume_gids_total]|


## Triggers

|Name|Expression|Priority|
|----|----------|--------|
|Mesos agent: CPU allocation is above {$MESOS_AGENT_CPUS_CRIT} for {$MESOS_AGENT_METRICS_TOLERANCE} on {HOST.NAME}|min(/Template App Mesos Agent via HTTP/mesos.master[slave/cpus_percent],{$MESOS_AGENT_METRICS_TOLERANCE})>{$MESOS_AGENT_CPUS_CRIT}|AVERAGE|
|Mesos agent: CPU allocation is above {$MESOS_AGENT_CPUS_WARN} for {$MESOS_AGENT_METRICS_TOLERANCE} on {HOST.NAME}|min(/Template App Mesos Agent via HTTP/mesos.master[slave/cpus_percent],{$MESOS_AGENT_METRICS_TOLERANCE})>{$MESOS_AGENT_CPUS_WARN}|WARNING|
|Mesos agent: CPU allocation is below {$MESOS_AGENT_CPUS_MIN} for {$MESOS_AGENT_METRICS_TOLERANCE} on {HOST.NAME}|min(/Template App Mesos Agent via HTTP/mesos.master[slave/cpus_percent],{$MESOS_AGENT_METRICS_TOLERANCE})<{$MESOS_AGENT_CPUS_MIN}|INFO|
|Mesos agent: Disk allocation is above {$MESOS_AGENT_DISK_CRIT} for {$MESOS_AGENT_METRICS_TOLERANCE} on {HOST.NAME}|min(/Template App Mesos Agent via HTTP/mesos.master[slave/disk_percent],{$MESOS_AGENT_METRICS_TOLERANCE})>{$MESOS_AGENT_DISK_CRIT}|AVERAGE|
|Mesos agent: Disk allocation is above {$MESOS_AGENT_DISK_WARN} for {$MESOS_AGENT_METRICS_TOLERANCE} on {HOST.NAME}|min(/Template App Mesos Agent via HTTP/mesos.master[slave/disk_percent],{$MESOS_AGENT_METRICS_TOLERANCE})>{$MESOS_AGENT_DISK_WARN}|WARNING|
|Mesos agent: Memory allocation is above {$MESOS_AGENT_MEMORY_CRIT} for {$MESOS_AGENT_METRICS_TOLERANCE} on {HOST.NAME}|min(/Template App Mesos Agent via HTTP/mesos.master[slave/mem_percent],{$MESOS_AGENT_METRICS_TOLERANCE})>{$MESOS_AGENT_MEMORY_CRIT}|AVERAGE|
|Mesos agent: Memory allocation is above {$MESOS_AGENT_MEMORY_WARN} for {$MESOS_AGENT_METRICS_TOLERANCE} on {HOST.NAME}|min(/Template App Mesos Agent via HTTP/mesos.master[slave/mem_percent],{$MESOS_AGENT_METRICS_TOLERANCE})>{$MESOS_AGENT_MEMORY_WARN}|WARNING|
|Mesos agent on {HOST.NAME} has not registered with the cluster|last(/Template App Mesos Agent via HTTP/mesos.master[slave/registered])=0|INFO|
|Mesos agent has restarted on {HOST.NAME}|max(/Template App Mesos Agent via HTTP/mesos.master[slave/uptime_secs],{$MESOS_AGENT_METRICS_TOLERANCE})<{$MESOS_AGENT_METRICS_TOLERANCE}|INFO|
