# App VMmanager 6 Master

## Overview

Version: 2026-10-01

Template for monitoring VMmanager 6 master server.
Requires Zabbix 7.0 or newer.

It will discover cluster nodes from VMmanager 6 and can create Zabbix hosts for them, if you enable it (see [Host discovery](#discovery-rules)).

## Setup

1. Import the template into Zabbix and link it to the host of your VMmanager 6 master server.
2. Fill the `{$VM6_URL}` macro with your domain: `https://__VM_DOMAIN__/vm/v3`.
3. Get a long-lived API token and put it into the `{$VM6_TOKEN}` macro.

   Step 1. Get a short-lived session token:

   ```bash
   curl -v -X POST -H "accept: application/json" -H "Content-Type: application/json" \
     -d '{"email": "__ADMIN__EMAIL__", "password": "__PASSWORD__"}' \
     "https://__VM_DOMAIN__/auth/v4/public/token"
   ```

   Step 2. Use the token from step 1 (`$TOKEN`) to issue a long-lived token for Zabbix:

   ```bash
   curl -k -X POST -H "accept: application/json" -H "Content-Type: application/json" \
     -H "x-xsrf-token: $TOKEN" \
     -d '{"description": "Integration with Zabbix", "expires_at": "2030-01-01 00:00:00"}' \
     "https://__VM_DOMAIN__/auth/v4/token"
   ```

   Put the token returned in step 2 into `{$VM6_TOKEN}`. Set `expires_at` according to your security policy and remember to renew the token before it expires.

4. Optionally adjust `{$TASK_MAX_RUNNING}` and `{$TASK_MAX_WAITING}`.

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$VM6_TOKEN}|<p>Auth token for admin user in VMmanager 6. See [Setup](#setup) for how to get a long-lived token</p>|`token`|Text macro|
|{$VM6_URL}|<p>URL for VMmanager 6. Please fill your domain</p>|`https://__VM_DOMAIN__/vm/v3`|Text macro|
|{$TASK_MAX_RUNNING}|<p>Max running time for tasks in minutes</p>|`30`|Text macro|
|{$TASK_MAX_WAITING}|<p>Max waiting time for tasks in minutes</p>|`5`|Text macro|

## Template links

There are no template links in this template.

Host prototypes created by Host discovery are linked to the templates `Linux by Zabbix agent` and `Template VMmanager 6 KVM Hypervisor`, so both must be imported before enabling host creation.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Host discovery|<p>Discovery hosts from VMmanager 6. Creates node items, triggers and graphs. The host prototype `{#CLUSTER_NAME} {#NODE_NAME}` is disabled and not discovered by default: enable it to add your cluster nodes to Zabbix (group `Discovered hosts`, interface `{#NODE_IP}`) with the `Linux by Zabbix agent` and `Template VMmanager 6 KVM Hypervisor` templates</p>|`HTTP agent`|host.discovery<p>Update: 1d</p><p>Keep lost resources: 30d</p>|
|Tasks|<p>Discovery tasks from VMmanager 6 (running and waiting tasks)</p>|`Dependent item`|tasks.new.task<p>Master item: tasks.new</p><p>Keep lost resources: 1h</p>|

### LLD macros

|Discovery rule|Macro|JSONPath|
|----|----|----|
|Host discovery|{#CLUSTER_NAME}|`$.cluster.name`|
|Host discovery|{#NODE_ID}|`$.id`|
|Host discovery|{#NODE_IP}|`$.ip`|
|Host discovery|{#NODE_KERNEL_VER}|`$.kernel_version`|
|Host discovery|{#NODE_NAME}|`$.name`|
|Host discovery|{#NODE_OS}|`$.os_version`|
|Host discovery|{#NODE_QEMU_VER}|`$.qemu_version`|
|Host discovery|{#NODE_VIRT_TYPE}|`$.cluster.virtualization_type`|
|Tasks|{#ID}|`$.id`|
|Tasks|{#NAME}|`$.name`|
|Tasks|{#RUNNING}|`$.running_time`|
|Tasks|{#STATUS}|`$.status`|
|Tasks|{#WAITING}|`$.waiting_time`|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|New Tasks|<p>API request for new and waiting tasks from VMmanager 6</p>|`HTTP agent`|tasks.new<p>Update: 1m</p>|
|Tasks with error|<p>API request from VMmanager 6 for tasks with error</p>|`HTTP agent`|tasks.error<p>Update: 1m</p>|
|New task count|<p>Count of running and waiting tasks in VMmanager 6</p>|`Dependent item`|tasks.new.count|
|Error Task count|<p>Count of tasks with error in VMmanager 6</p>|`Dependent item`|tasks.error.count|
|Task {#NAME} {#ID} running time|<p>VMmanager 6 task running time, s</p>|`Dependent item`|`tasks.task[{#ID}, running]`|
|Task {#NAME} {#ID} waiting time|<p>VMmanager 6 task waiting time, s</p>|`Dependent item`|`tasks.task[{#ID}, waiting]`|
|Node {#NODE_ID} {#NODE_NAME} API status|<p>API request for node status from VMmanager 6</p>|`HTTP agent`|`node[{#NODE_ID},api_status]`<p>Update: 1m</p>|
|Node {#NODE_ID} {#NODE_NAME} bird error|<p>VMmanager 6 bird error message</p>|`Dependent item`|`node[{#NODE_ID}, bird_error]`|
|Node {#NODE_ID} {#NODE_NAME} frr error|<p>VMmanager 6 frr error message</p>|`Dependent item`|`node[{#NODE_ID}, frr_error]`|
|Node {#NODE_ID} {#NODE_NAME} cpu used|<p>Allocated cpu cores for VM on VMmanager 6 node</p>|`Dependent item`|`node[{#NODE_ID}, cpu_used]`|
|Node {#NODE_ID} {#NODE_NAME} ha error|<p>VMmanager 6 node HA error message</p>|`Dependent item`|`node[{#NODE_ID}, ha_error]`|
|Node {#NODE_ID} {#NODE_NAME} ha state|<p>VMmanager 6 node HA state</p>|`Dependent item`|`node[{#NODE_ID}, ha_state]`|
|Node {#NODE_ID} {#NODE_NAME} memory allocated|<p>Allocated memory for VM on VMmanager 6 node, MiB</p>|`Dependent item`|`node[{#NODE_ID}, mem_allocated]`|
|Node {#NODE_ID} {#NODE_NAME} memory total|<p>Total memory on VMmanager 6 node, MiB</p>|`Dependent item`|`node[{#NODE_ID}, mem_total]`|
|Node {#NODE_ID} {#NODE_NAME} status|<p>VMmanager 6 node status</p>|`Dependent item`|`node[{#NODE_ID}, status]`|
|Node {#NODE_ID} {#NODE_NAME} storage allocated|<p>Storage allocated on VMmanager 6 node, MiB</p>|`Dependent item`|`node[{#NODE_ID}, stor_allocated]`|
|Node {#NODE_ID} {#NODE_NAME} storage available|<p>Storage available on VMmanager 6 node, MiB</p>|`Dependent item`|`node[{#NODE_ID}, stor_available]`|
|Node {#NODE_ID} {#NODE_NAME} storage size|<p>Storage size on VMmanager 6 node, MiB</p>|`Dependent item`|`node[{#NODE_ID}, stor_size]`|
|Node {#NODE_ID} {#NODE_NAME} storage used|<p>Storage used on VMmanager 6 node, MiB</p>|`Dependent item`|`node[{#NODE_ID}, stor_used]`|
|Node {#NODE_ID} {#NODE_NAME} vm active|<p>Active vm count on VMmanager 6 node</p>|`Dependent item`|`node[{#NODE_ID}, vm_active]`|
|Node {#NODE_ID} {#NODE_NAME} vm crashed|<p>Crashed vm count on VMmanager 6 node</p>|`Dependent item`|`node[{#NODE_ID}, vm_crashed]`|
|Node {#NODE_ID} {#NODE_NAME} vm estimated|<p>Estimated vm count on VMmanager 6 node</p>|`Dependent item`|`node[{#NODE_ID}, vm_estimated]`|
|Node {#NODE_ID} {#NODE_NAME} vm stopped|<p>Stopped vm count on VMmanager 6 node</p>|`Dependent item`|`node[{#NODE_ID}, vm_stopped]`|
|Node {#NODE_ID} {#NODE_NAME} vm total|<p>Total vm count on VMmanager 6 node</p>|`Dependent item`|`node[{#NODE_ID}, vm_total]`|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|New task error|<p>Check VMmanager 6 tasks for new errors. No automatic recovery, manual close is allowed</p>|<p>**Expression**: (last(/Template VMmanager 6 Master/tasks.error.count,#1)<>last(/Template VMmanager 6 Master/tasks.error.count,#2))=1</p><p>**Recovery expression**: none</p>|warning|
|Task {#NAME} {#ID} running over {$TASK_MAX_RUNNING} min|<p>Manual close is allowed</p>|<p>**Expression**: last(/Template VMmanager 6 Master/tasks.task[{#ID}, running])>{$TASK_MAX_RUNNING}*60</p><p>**Recovery expression**: </p>|warning|
|Task {#NAME} {#ID} waiting over {$TASK_MAX_WAITING} min|<p>Manual close is allowed</p>|<p>**Expression**: last(/Template VMmanager 6 Master/tasks.task[{#ID}, waiting])>{$TASK_MAX_WAITING}*60</p><p>**Recovery expression**: </p>|warning|
|Node {#NODE_ID} {#NODE_NAME} bird error|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/node[{#NODE_ID}, bird_error])<>"" and last(/Template VMmanager 6 Master/node[{#NODE_ID}, bird_error])<>"null"</p><p>**Recovery expression**: </p>|warning|
|Node {#NODE_ID} {#NODE_NAME} frr error|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/node[{#NODE_ID}, frr_error])<>"" and last(/Template VMmanager 6 Master/node[{#NODE_ID}, frr_error])<>"null"</p><p>**Recovery expression**: </p>|warning|
|Node {#NODE_ID} {#NODE_NAME} crashed VM > 0|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/node[{#NODE_ID}, vm_crashed])>0</p><p>**Recovery expression**: </p>|warning|
|Node {#NODE_ID} {#NODE_NAME} HA error|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/node[{#NODE_ID}, ha_error])<>"no_error"</p><p>**Recovery expression**: </p>|warning|
|Node {#NODE_ID} {#NODE_NAME} status is not Active|<p>-</p>|<p>**Expression**: last(/Template VMmanager 6 Master/node[{#NODE_ID}, status])<>"active"</p><p>**Recovery expression**: </p>|warning|

## Graphs

|Name|Items|
|----|-----|
|Node {#NODE_ID} {#NODE_NAME} CPU statistics|cpu used|
|Node {#NODE_ID} {#NODE_NAME} memory statistics|memory allocated, memory total|
|Node {#NODE_ID} {#NODE_NAME} storage statistics|storage allocated, storage available, storage size, storage used|
|Node {#NODE_ID} {#NODE_NAME} VM statistics|vm active, vm crashed, vm estimated, vm stopped, vm total|

## Dashboards

|Name|Description|
|----|-----------|
|VMmanager 6 node graphs|<p>Graph prototype widgets for all discovered nodes: VM, storage, memory and CPU statistics</p>|
