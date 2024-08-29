# App Patroni

## Overview

The template to monitor Patroni by Zabbix works without any external scripts.
It works with both standalone and cluster instances.
The metrics are collected in one pass remotely using an HTTP agent. 
They are getting values from REST API `/cluster`. (ref: [Patroni - Cluster status endpoints](https://patroni.readthedocs.io/en/latest/rest_api.html#cluster-status-endpoints))

### Provided monitorings

#### Cluster level

- Cluster Health (=0: Critical, =1: Warning, >=2: Healthy, see detail in item `Patroni cluster status health code` description)
- Leader, Sync-standby, and Replica node number
- Timeline consistency between nodes

#### Node level

- Node's host, port, role, timeline, lag
- Node's role change

### Usage

- Please modify the macro `{$PATRONI.API.HOSTNAME}` to point to your Patroni cluster hostname.
- Maybe you might modify the macro `{$PATRONI.API.PORT}`, too.

### Note

- The status check item's interval is as short as possible to report problems immediately(default: `{$PATRONI.API.STAUTS_CHECK_INTERVAL}`: 30s), but the history would be discarded with a long-term heartbeat(default: `{$PATRONI.API.STATUS_DISCARD_UNCHANGED_INTERVAL}`: 1h)
- The config check item is disabled as default. Re-enable it if necessary.

## Author

Yioda

## Macros used

| name | Description | Default | Type |
|---|---|---|---|
| {$PATRONI.API.CONFIG_DISCARD_UNCHANGED_INTERVAL} | The interval would discard config record if no changed. | 1d | Text |
| {$PATRONI.API.HOSTNAME} | Patroni cluster API hostname. | 127.0.0.1 | Text |
| {$PATRONI.API.PORT} | Patroni cluster API port. | 8008 | Text |
| {$PATRONI.API.SCHEME} | Patroni API schema. | http | Text |
| {$PATRONI.API.STATUS_DISCARD_UNCHANGED_INTERVAL} | The interval would discard status record if no changed. | 1h | Text |
| {$PATRONI.API.STAUTS_CHECK_INTERVAL} | Patroni status check interval. | 30s | Text |
| {$PATRONI.API.STAUTS_NO_RESPONSE_THRESHOLD} | Patroni status check no response threshold, must > {$PATRONI.API.STAUTS_CHECK_INTERVAL}. | 60s | Text |

## Template links

There are no template links in this template.

## Discovery rules

| name | Description | Type | Key and additional info |
|---|---|---|---|
| Patroni server discovery |  | HTTP agent | patroni.server.discovery |


## Items collected

| name | Description | Type | Key and additional info |
|---|---|---|---|
| Get Patroni cluster config |  | HTTP agent | patroni.endpoint.cluster.config |
| Get Patroni cluster status |  | HTTP agent | patroni.endpoint.cluster.status |
| Patroni cluster status json data: Patroni cluster status health code |  | Dependent item | patroni.endpoint.cluster.status.health_code |
| Get Patroni cluster status: Patroni cluster status json data |  | Dependent item | patroni.endpoint.cluster.status.json_data |
| Patroni cluster status json data: Patroni cluster leader number |  | Dependent item | patroni.endpoint.cluster.status.leader.num |
| Patroni cluster status json data: Patorni cluster pause mode |  | Dependent item | patroni.endpoint.cluster.status.pause_mode |
| Patroni cluster status json data: Patroni cluster replica number |  | Dependent item | patroni.endpoint.cluster.status.replica.num |
| Get Patroni cluster status: Patroni cluster status responsiveness |  | Dependent item | patroni.endpoint.cluster.status.responsiveness |
| Patroni cluster status json data: Patroni cluster sync_standby number |  | Dependent item | patroni.endpoint.cluster.status.syncstandby.num |
| Patroni cluster status json data: Patroni cluster status timeline consistency |  | Dependent item | patroni.endpoint.cluster.status.timeline_consistency |
| Get Patroni cluster status: Patroni node: {#SERVER} host |  | Dependent item | patroni.endpoint.cluster.member.host[{#SERVER}] |
| Get Patroni cluster status: Patroni node: {#SERVER} lag |  | Dependent item | patroni.endpoint.cluster.member.lag[{#SERVER}] |
| Get Patroni cluster status: Patroni node: {#SERVER} port |  | Dependent item | patroni.endpoint.cluster.member.port[{#SERVER}] |
| Get Patroni cluster status: Patroni node: {#SERVER} role |  | Dependent item | patroni.endpoint.cluster.member.role[{#SERVER}] |
| Get Patroni cluster status: Patroni node: {#SERVER} timeline |  | Dependent item | patroni.endpoint.cluster.member.timeline[{#SERVER}] |


## Triggers

| name | Description | Expression | Priority |
|---|---|---|---|
| Patroni Cluster Status: WARNING (without any sync_standby node) |  | Problem: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.health_code.last()}=1Recovery: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.health_code.last()}>=2 | Warning |
| Patroni Cluster Status: CRITICAL (without any leader node) |  | Problem: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.health_code.last()}=0Recovery: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.health_code.last()}>=2 | High |
| Patroni cluster is PAUSED |  | Problem: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.pause_mode.last()}=1Recovery: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.pause_mode.last()}=0 | Warning |
| Patroni cluster: Some nodes have different timelines |  | Problem: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.timeline_consistency.last()}=1Recovery: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.timeline_consistency.last()}=0 | Warning |
| Patroni cluster: NO RESPONSE in {$PATRONI.API.STAUTS_NO_RESPONSE_THRESHOLD} |  | Problem: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.responsiveness.nodata({$PATRONI.API.STAUTS_NO_RESPONSE_THRESHOLD})}=1Recovery: {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.status.responsiveness.nodata({$PATRONI.API.STAUTS_NO_RESPONSE_THRESHOLD})}=0 | High |
| Patroni node: {#SERVER} role changed |  | {Template App Patroni Cluster monitoring by HTTP:patroni.endpoint.cluster.member.role[{#SERVER}].change()}<>0 | Warning |
