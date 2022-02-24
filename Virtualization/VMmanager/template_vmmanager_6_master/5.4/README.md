# App VMmanager 6 Master

## Overview

Version: 2021-12-29

Template for monitoring VMmanager 6 master server
It will discover hosts from VM6, if you enable it


## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$VM6_TOKEN}|<p>Get it by POST request `curl -v  -X POST -H  "accept: application/json" -H  "Content-Type: application/json" -d '{"email": "__ADMIN__EMAIL__", "password": "__PASSWORD__"}' "https://__VM_DOMAIN__/auth/v4/public/token"`</p>|`token`|Text macro|
|{$VM6_URL}|<p>Please fill your domain</p>|`https://__VM_DOMAIN__/vm/v3`|Text macro|
|{$TASK_MAX_RUNNING}|<p>Max running time for tasks in minutes</p>|30|Text macro|
|{$TASK_MAX_WAITING}|<p>Max waiting time for tasks in minutes</p>|5|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Host discovery|<p>Enable host prototype for automatic Zabbix host creation. It will add your cluster nodes to Zabbix with Linux by zabbix agent template </p>|`HTTP agent`|host.discovery<p>Update: 1d</p>|
|Tasks|<p>Watch for tasks in VMmanager</p>|`Depended item`|tasks.new.task<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|New Tasks|<p>API request for new and waiting tasks from VMmanager 6</p>|`HTTP agent`|tasks.new<p>Update: 1m</p>|
|Tasks with error|<p>API request from VMmanager 6 for tasks with error</p>|`HTTP agent`|tasks.error<p>Update: 1m</p>|
|New task count|<p>Count of running and waiting tasks in VMmanager 6</p>|`Depended item`|tasks.new.count|
|Error Task count|<p>Count of tasks with error in VMmanager 6</p>|`Depended item`|tasks.error.count|
|Task {#NAME} {#ID} running time|<p>VMmanager 6 task running time</p>|`Depended item`|`tasks.task[{#ID}, running]`|
|Task {#NAME} {#ID} waiting time|<p>VMmanager 6 task waiting time</p>|`Depended item`|`tasks.task[{#ID}, waiting]`|
|Node {#NODE_ID} {#NODE_NAME} API status|<p>API request for node status from VMmanager 6</p>|`HTTP agent`|`node[{#NODE_ID},api_status]`<p>Update: 1m</p>|
|Node {#NODE_ID} {#NODE_NAME} bird error|<p>VMmanager 6 bird error message</p>|`Depended item`|`node[{#NODE_ID}, bird_error]`|
|Node {#NODE_ID} {#NODE_NAME} cpu used|<p>Allocated cpu cores for VM on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, cpu_used]`|
|Node {#NODE_ID} {#NODE_NAME} ha error|<p>VMmanager 6 node HA error message</p>|`Depended item`|`node[{#NODE_ID}, ha_error]`|
|Node {#NODE_ID} {#NODE_NAME} ha state|<p>VMmanager 6 node HA state</p>|`Depended item`|`node[{#NODE_ID}, ha_state]`|
|Node {#NODE_ID} {#NODE_NAME} memory allocated|<p>Allocated memory for VM on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, mem_allocated]`|
|Node {#NODE_ID} {#NODE_NAME} memory total|<p>Total memory on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, mem_total]`|
|Node {#NODE_ID} {#NODE_NAME} status|<p>VMmanager 6 node status</p>|`Depended item`|`node[{#NODE_ID}, status]`|
|Node {#NODE_ID} {#NODE_NAME} storage allocated|<p>Storage allocated on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, stor_allocated]`|
|Node {#NODE_ID} {#NODE_NAME} storage available|<p>Storage available on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, stor_available]`|
|Node {#NODE_ID} {#NODE_NAME} storage size|<p>Storage size on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, stor_size]`|
|Node {#NODE_ID} {#NODE_NAME} storage used|<p>Storage used on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, stor_used]`|
|Node {#NODE_ID} {#NODE_NAME} vm active|<p>Active vm count on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, vm_active]`|
|Node {#NODE_ID} {#NODE_NAME} vm crashed|<p>Crashed vm count on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, vm_crashed]`|
|Node {#NODE_ID} {#NODE_NAME} vm estimated|<p>Estimated vm count on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, vm_estimated]`|
|Node {#NODE_ID} {#NODE_NAME} vm moving|<p>Moving vm count on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, vm_moving]`|
|Node {#NODE_ID} {#NODE_NAME} vm stopped|<p>Stopped vm count on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, vm_stopped]`|
|Node {#NODE_ID} {#NODE_NAME} vm total|<p>Total vm count on VMmanager 6 node</p>|`Depended item`|`node[{#NODE_ID}, vm_total]`|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|New task error|<p>Check VMmanager 6 tasks for new errors</p>|<p>**Expression**: (last(/Template VMmanager 6 Master/tasks.error.count,#1)<>last(/Template VMmanager 6 Master/tasks.error.count,#2))=1<600</p><p>**Recovery expression**: </p>|warning|
|Task {#NAME} {#ID} running over {$TASK_MAX_RUNNING} min|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/tasks.task[{#ID}, running])>{$TASK_MAX_RUNNING}*60</p><p>**Recovery expression**: </p>|warning|
|Task {#NAME} {#ID} waiting over {$TASK_MAX_WAITING} min|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/tasks.task[{#ID}, waiting])>{$TASK_MAX_WAITING}*60</p><p>**Recovery expression**: </p>|warning|
|Node {#NODE_ID} {#NODE_NAME} bird error|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/node[{#NODE_ID}, bird_error])<>""</p><p>**Recovery expression**: </p>|warning|
|Node {#NODE_ID} {#NODE_NAME} crashed VM > 0|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/node[{#NODE_ID}, vm_crashed])>0</p><p>**Recovery expression**: </p>|warning|
|Node {#NODE_ID} {#NODE_NAME} HA error|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/node[{#NODE_ID}, ha_error])<>"no_error"</p><p>**Recovery expression**: </p>|warning|
|Node {#NODE_ID} {#NODE_NAME} status is not Active|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/node[{#NODE_ID}, status])<>"active"</p><p>**Recovery expression**: </p>|warning|

