# Wazuh by HTTP

Author: Rémi Piazza

## Overview

Monitors a [Wazuh](https://wazuh.com/) deployment (manager, indexer and dashboard) over HTTP, without external scripts or agents:

- **Wazuh Manager by HTTP** collects data from the Wazuh REST API (port 55000): manager version, daemon states (discovery), cluster state, configuration validation, agent connection counters and per-agent status (discovery).
- **Wazuh Indexer by HTTP** collects data from the indexer (OpenSearch) REST API (port 9200): cluster status, shards, number of nodes, and per-node JVM heap, CPU and disk usage (discovery).
- **Wazuh Dashboard by HTTP** checks the availability of the Wazuh dashboard login page.
- **Wazuh by HTTP** is a parent template linking the three templates above, for all-in-one deployments.
- **Wazuh Manager by Zabbix agent** (optional, not linked by the parent) adds checks that the API cannot provide: processes, freshness of `alerts.json`, `ossec.log` errors and Filebeat.

Each template ships a dashboard, and graphs or graph prototypes where relevant.

## Requirements

Zabbix version: 7.0 and higher.

## Tested versions

This template has been tested on:

- Zabbix 7.0 (server and web, Docker images `zabbix/zabbix-server-pgsql` and `zabbix/zabbix-web-nginx-pgsql`, `alpine-7.0-latest`)
- Wazuh 4.14.9 (all-in-one installation on Ubuntu 22.04)
- Zabbix agent 2 7.0 (for the optional agent template)

## Configuration

> Zabbix should be configured according to the instructions in the [Templates out of the box](https://www.zabbix.com/documentation/7.0/manual/config/templates_out_of_the_box) section.

### Choosing the templates

- All-in-one deployment: link **Wazuh by HTTP** to the host running Wazuh.
- Distributed deployment: link each of **Wazuh Manager by HTTP**, **Wazuh Indexer by HTTP** and **Wazuh Dashboard by HTTP** to the host that runs the matching component. Do not link a sub-template and the parent to the same host.
- Optional: link **Wazuh Manager by Zabbix agent** to the manager host (requires a Zabbix agent).
- Host CPU, memory and disk metrics are not part of these templates: link the standard Linux template as well.

### Wazuh API user (manager)

Create a dedicated read-only user named `zbx_monitor`:

1. In the Wazuh dashboard, open **Server management**, **Security**, **Users** and create the user `zbx_monitor` with a password that satisfies the Wazuh password policy.
2. In **Roles mapping**, map `zbx_monitor` to the built-in read-only role (`readonly`).

The user must be able to call `GET /manager/info`, `/manager/status`, `/manager/configuration/validation`, `/cluster/status`, `/agents` and `/agents/summary/status`.

### Indexer user

Create an indexer user named `zbx_monitor` that can only monitor the cluster. In **Indexer management**, **Security**, **Internal users**, create the user, then create the role and the mapping with the security API (replace the placeholders):

```bash
curl -sk -u "admin:$ADMIN_PASSWORD" -X PUT https://<indexer>:9200/_plugins/_security/api/roles/zbx_monitor \
  -H 'Content-Type: application/json' -d '{"cluster_permissions":["cluster_monitor"]}'

curl -sk -u "admin:$ADMIN_PASSWORD" -X PUT https://<indexer>:9200/_plugins/_security/api/rolesmapping/zbx_monitor \
  -H 'Content-Type: application/json' -d '{"users":["zbx_monitor"]}'
```

Make sure that the indexer HTTP interface listens on an address reachable by the Zabbix server or proxy (`http.host` in `opensearch.yml`).

### Macros on the host

Set `{$WAZUH.API.USER}`, `{$WAZUH.API.PASSWORD}`, `{$WAZUH.INDEXER.USER}` and `{$WAZUH.INDEXER.PASSWORD}` on the host. The host interface address (`{HOST.CONN}`) is used to reach every component, so the interface must use an address or DNS name that is valid for the TLS certificates.

### TLS

- **Manager API items** are Script items. They always verify the certificate against the CA store of the Zabbix server or proxy, and this cannot be disabled. The default Wazuh API certificate is self-signed and only valid for `localhost`: replace it with a certificate signed by a CA trusted by the Zabbix server or proxy, valid for the name or address used by the host.
- **Indexer and dashboard items** are HTTP agent items with `SSL verify peer` and `SSL verify host` enabled. The default certificates only contain the address `127.0.0.1`: issue certificates valid for the name or address used by the host, or disable `SSL verify host` on these items (the option cannot be set with a macro).

### Optional agent template

On the manager host, install a Zabbix agent (or agent 2) with `ServerActive` configured, then give it read access to the Wazuh logs:

```bash
usermod -aG wazuh zabbix
systemctl restart zabbix-agent2
```

Check with `ps` that the processes `wazuh-analysisd`, `wazuh-remoted` and `filebeat` exist on your version.

## Wazuh by HTTP

Wazuh all-in-one: links the manager, indexer and dashboard templates. Link this template to a host that runs all Wazuh components (all-in-one deployment). For a distributed deployment, link each sub-template to the host that runs the matching component instead: - Wazuh Manager by HTTP - Wazuh Indexer by HTTP - Wazuh Dashboard by HTTP

### Template links

|Name|
|----|
|Wazuh Manager by HTTP|
|Wazuh Indexer by HTTP|
|Wazuh Dashboard by HTTP|

## Wazuh Manager by HTTP

Monitors a Wazuh manager through its REST API (port 55000) without any agent or external script.

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|`{$WAZUH.API.SCHEME}`|Wazuh API scheme (http or https).|`https`|
|`{$WAZUH.API.PORT}`|Wazuh API port.|`55000`|
|`{$WAZUH.API.USER}`|Wazuh API user. Create a dedicated user with a read-only role.|`zbx_monitor`|
|`{$WAZUH.API.PASSWORD}`|Wazuh API user password. (secret text)||
|`{$WAZUH.API.HTTP.PROXY}`|HTTP proxy used to reach the Wazuh API, for example http://proxy.example.com:3128. Leave empty to connect directly.||
|`{$WAZUH.API.INTERVAL}`|Collection interval for the core API data.|`1m`|
|`{$WAZUH.API.AGENTS.INTERVAL}`|Collection interval for the agents list.|`2m`|
|`{$WAZUH.API.VALIDATION.INTERVAL}`|Collection interval for the configuration validation.|`1h`|
|`{$WAZUH.API.NODATA.TIME}`|No-data period before the API is considered unavailable.|`5m`|
|`{$WAZUH.DAEMON.NAME.MATCHES}`|Filter of discovered daemons by name (regex). Optional daemons such as wazuh-integratord or wazuh-clusterd are excluded by default.|`^wazuh-(analysisd\|remoted\|db\|execd\|modulesd\|syscheckd\|logcollector\|monitord\|authd\|apid)$`|
|`{$WAZUH.DAEMON.NAME.NOT_MATCHES}`|Filter to exclude discovered daemons by name (regex).|`CHANGE_IF_NEEDED`|
|`{$WAZUH.AGENT.NAME.MATCHES}`|Filter of discovered agents by name (regex).|`.+`|
|`{$WAZUH.AGENT.NAME.NOT_MATCHES}`|Filter to exclude discovered agents by name (regex).|`CHANGE_IF_NEEDED`|
|`{$WAZUH.AGENT.ID.NOT_MATCHES}`|Filter to exclude discovered agents by id (regex). 000 is the manager itself.|`^000$`|
|`{$WAZUH.AGENTS.DISCONNECTED.MAX.WARN}`|Maximum number of disconnected agents before a warning is raised.|`10`|

### Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh Manager: Get core data|Authenticates against the Wazuh API (JWT) and collects manager info, daemon status, cluster status and the agents connection summary in a single JSON document. TLS certificates are verified against the CA store of the Zabbix server or proxy.|Script|`wazuh.api.core.get`<br>Update: `{$WAZUH.API.INTERVAL}`|
|Wazuh Manager: Get agents list|Retrieves the list of registered agents (id, name, IP, version, status code) with pagination.|Script|`wazuh.api.agents.get`<br>Update: `{$WAZUH.API.AGENTS.INTERVAL}`<br>History: do not keep|
|Wazuh Manager: Get configuration validation|Asks the manager to validate its ossec.conf (GET /manager/configuration/validation).|Script|`wazuh.api.validation.get`<br>Update: `{$WAZUH.API.VALIDATION.INTERVAL}`<br>History: do not keep|
|Wazuh Manager: Version|Installed Wazuh manager version. Every value is kept so that the change trigger can compare two consecutive values.|Dependent item|`wazuh.manager.version`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.info.data.affected_items[0].version`|
|Wazuh Manager: Configuration validation|Result of the manager configuration validation. Possible values: 0 - OK, 1 - KO.|Dependent item|`wazuh.manager.config.valid`<br>Master item: `wazuh.api.validation.get`<br>Preprocessing: JSONPath: `$.validation.data.affected_items[0].status`; JavaScript: `var v = String(value).replace(/"/g, ''); return v === 'OK' ? 0 : 1;`; Discard unchanged with heartbeat: `1d`|
|Wazuh Manager: Cluster enabled|Whether the Wazuh cluster is enabled on this node.|Dependent item|`wazuh.cluster.enabled`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.cluster.data.enabled`; JavaScript: `return String(value).replace(/"/g, '') === 'yes' ? 1 : 0;`; Discard unchanged with heartbeat: `1h`|
|Wazuh Manager: Cluster running|Whether the Wazuh cluster daemon is running.|Dependent item|`wazuh.cluster.running`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.cluster.data.running`; JavaScript: `return String(value).replace(/"/g, '') === 'yes' ? 1 : 0;`; Discard unchanged with heartbeat: `1h`|
|Wazuh Manager: Agents: Active|Number of agents in connection state: active.|Dependent item|`wazuh.agents.active`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.summary.data.connection.active`|
|Wazuh Manager: Agents: Disconnected|Number of agents in connection state: disconnected.|Dependent item|`wazuh.agents.disconnected`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.summary.data.connection.disconnected`|
|Wazuh Manager: Agents: Never connected|Number of agents in connection state: never connected.|Dependent item|`wazuh.agents.never_connected`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.summary.data.connection.never_connected`|
|Wazuh Manager: Agents: Pending|Number of agents in connection state: pending.|Dependent item|`wazuh.agents.pending`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.summary.data.connection.pending`|
|Wazuh Manager: Agents: Total|Number of agents in connection state: total.|Dependent item|`wazuh.agents.total`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.summary.data.connection.total`|
|Wazuh Manager: Agents: Configuration not synced|Number of agents whose group configuration is not synchronized.|Dependent item|`wazuh.agents.config.not_synced`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.summary.data.configuration.not_synced`|

### Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Wazuh Manager: API is unavailable or not returning data|No data received from the Wazuh API. Check the manager service, the API port, the credentials and the TLS trust (the item error message gives the reason).|`nodata(/Wazuh Manager by HTTP/wazuh.api.core.get,{$WAZUH.API.NODATA.TIME})=1`|High||
|Wazuh Manager: Version has changed|The Wazuh manager version has changed (upgrade or downgrade).|`change(/Wazuh Manager by HTTP/wazuh.manager.version)=1 and length(last(/Wazuh Manager by HTTP/wazuh.manager.version))>0`|Info|Manual close: yes|
|Wazuh Manager: Configuration is invalid|The manager reports an invalid configuration. A restart or reload would fail until it is fixed.|`last(/Wazuh Manager by HTTP/wazuh.manager.config.valid)=1`|Average|Depends on: Wazuh Manager: API is unavailable or not returning data|
|Wazuh Manager: Cluster daemon is not running|The cluster is enabled but the cluster daemon is not running on this node.|`last(/Wazuh Manager by HTTP/wazuh.cluster.enabled)=1 and last(/Wazuh Manager by HTTP/wazuh.cluster.running)=0`|High|Depends on: Wazuh Manager: API is unavailable or not returning data|
|Wazuh Manager: Too many agents disconnected|The number of disconnected agents has been above the threshold for 15 minutes.|`min(/Wazuh Manager by HTTP/wazuh.agents.disconnected,15m)>{$WAZUH.AGENTS.DISCONNECTED.MAX.WARN}`|Warning|Depends on: Wazuh Manager: API is unavailable or not returning data|

### LLD rule: Wazuh daemons discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh daemons discovery|Discovers the daemons reported by GET /manager/status. By default only the daemons expected to run on every manager are kept (see {$WAZUH.DAEMON.NAME.MATCHES}).|Dependent item|`wazuh.manager.daemons.discovery`<br>Master item: `wazuh.api.core.get`|

Filters:

|Label|Macro|Filter|Operator|
|-----|-----|------|--------|
|A|`{#DAEMON}`|`{$WAZUH.DAEMON.NAME.MATCHES}`|matches|
|B|`{#DAEMON}`|`{$WAZUH.DAEMON.NAME.NOT_MATCHES}`|does not match|

#### Item prototypes for Wazuh daemons discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh Manager: Daemon [{#DAEMON}]: State|State of the {#DAEMON} daemon. Possible values: 0 - Running, 1 - Stopped, 2 - Failed, 3 - Unknown.|Dependent item|`wazuh.manager.daemon.state["{#DAEMON}"]`<br>Master item: `wazuh.api.core.get`<br>Preprocessing: JSONPath: `$.status.data.affected_items[0]['{#DAEMON}']`; JavaScript: `var m = {'running': 0, 'stopped': 1, 'failed': 2}; var v = String(valu...`; Discard unchanged with heartbeat: `1h`|

#### Trigger prototypes for Wazuh daemons discovery

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Wazuh Manager: Daemon [{#DAEMON}]: Not running|The {#DAEMON} daemon is stopped or failed.|`last(/Wazuh Manager by HTTP/wazuh.manager.daemon.state["{#DAEMON}"])>0`|High|Depends on: Wazuh Manager: API is unavailable or not returning data|

### LLD rule: Wazuh agents discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh agents discovery|Discovers the registered agents. The manager itself (agent 000) is excluded by default.|Dependent item|`wazuh.agents.discovery`<br>Master item: `wazuh.api.agents.get`|

Filters:

|Label|Macro|Filter|Operator|
|-----|-----|------|--------|
|A|`{#AGENT.NAME}`|`{$WAZUH.AGENT.NAME.MATCHES}`|matches|
|B|`{#AGENT.NAME}`|`{$WAZUH.AGENT.NAME.NOT_MATCHES}`|does not match|
|C|`{#AGENT.ID}`|`{$WAZUH.AGENT.ID.NOT_MATCHES}`|does not match|

#### Item prototypes for Wazuh agents discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh Manager: Agent [{#AGENT.NAME}]: Status|Connection status of agent {#AGENT.NAME} ({#AGENT.IP}). Possible values: 0 - Active, 1 - Disconnected, 2 - Never connected, 3 - Pending, 4 - Unknown.|Dependent item|`wazuh.agent.status["{#AGENT.ID}"]`<br>Master item: `wazuh.api.agents.get`<br>Preprocessing: JSONPath: `$[?(@.id=='{#AGENT.ID}')].st.first()`; Discard unchanged with heartbeat: `1h`|
|Wazuh Manager: Agent [{#AGENT.NAME}]: Version|Wazuh agent version of {#AGENT.NAME}.|Dependent item|`wazuh.agent.version["{#AGENT.ID}"]`<br>Master item: `wazuh.api.agents.get`<br>Preprocessing: JSONPath: `$[?(@.id=='{#AGENT.ID}')].version.first()`; Discard unchanged with heartbeat: `1d`|

#### Trigger prototypes for Wazuh agents discovery

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Wazuh Manager: Agent [{#AGENT.NAME}]: Disconnected|Agent {#AGENT.NAME} ({#AGENT.IP}) is disconnected. The manager marks an agent as disconnected only after its own disconnection delay has elapsed.|`last(/Wazuh Manager by HTTP/wazuh.agent.status["{#AGENT.ID}"])=1`|Warning|Depends on: Wazuh Manager: API is unavailable or not returning data|
|Wazuh Manager: Agent [{#AGENT.NAME}]: Never connected|Agent {#AGENT.NAME} ({#AGENT.IP}) is registered but has never connected.|`last(/Wazuh Manager by HTTP/wazuh.agent.status["{#AGENT.ID}"])=2`|Info|Manual close: yes|

### Dashboards

|Name|Widgets|
|----|-------|
|Wazuh Manager: overview|8 widgets|

## Wazuh Indexer by HTTP

Monitors a Wazuh indexer (OpenSearch) through its REST API (port 9200) without any agent or external script.

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|`{$WAZUH.INDEXER.SCHEME}`|Wazuh indexer scheme (http or https).|`https`|
|`{$WAZUH.INDEXER.PORT}`|Wazuh indexer port.|`9200`|
|`{$WAZUH.INDEXER.USER}`|Indexer user (basic authentication). Create a dedicated read-only user.|`zbx_monitor`|
|`{$WAZUH.INDEXER.PASSWORD}`|Indexer user password. (secret text)||
|`{$WAZUH.INDEXER.HTTP.PROXY}`|HTTP proxy used to reach the Wazuh indexer, for example http://proxy.example.com:3128. Leave empty to connect directly.||
|`{$WAZUH.INDEXER.INTERVAL}`|Collection interval.|`1m`|
|`{$WAZUH.INDEXER.NODATA.TIME}`|No-data period before the indexer is considered unavailable.|`5m`|
|`{$WAZUH.INDEXER.UNASSIGNED.TIME}`|Time unassigned shards must persist before the problem is raised.|`15m`|
|`{$WAZUH.INDEXER.HEAP.MAX.WARN}`|JVM heap usage warning threshold, %.|`85`|
|`{$WAZUH.INDEXER.HEAP.MAX.CRIT}`|JVM heap usage critical threshold, %.|`95`|
|`{$WAZUH.INDEXER.CPU.MAX.WARN}`|CPU usage warning threshold, %.|`90`|
|`{$WAZUH.INDEXER.DISK.FREE.MIN.WARN}`|Free disk space warning threshold, %.|`15`|
|`{$WAZUH.INDEXER.DISK.FREE.MIN.CRIT}`|Free disk space critical threshold, %.|`10`|

### Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh Indexer: Get cluster health|GET /_cluster/health on the Wazuh indexer.|HTTP agent|`wazuh.indexer.cluster.health.get`<br>Update: `{$WAZUH.INDEXER.INTERVAL}`|
|Wazuh Indexer: Get nodes stats|GET /_nodes/stats/jvm,fs,os on the Wazuh indexer, filtered to the fields used by this template.|HTTP agent|`wazuh.indexer.nodes.stats.get`<br>Update: `{$WAZUH.INDEXER.INTERVAL}`<br>History: do not keep|
|Wazuh Indexer: Cluster status|Cluster health status. Possible values: 0 - Green, 1 - Yellow, 2 - Red, 3 - Unknown.|Dependent item|`wazuh.indexer.cluster.status`<br>Master item: `wazuh.indexer.cluster.health.get`<br>Preprocessing: JSONPath: `$.status`; JavaScript: `var m = {'green': 0, 'yellow': 1, 'red': 2}; var v = String(value).rep...`; Discard unchanged with heartbeat: `1h`|
|Wazuh Indexer: Number of nodes|Number of nodes in the cluster.|Dependent item|`wazuh.indexer.nodes`<br>Master item: `wazuh.indexer.cluster.health.get`<br>Preprocessing: JSONPath: `$.number_of_nodes`|
|Wazuh Indexer: Active shards|Number of active shards.|Dependent item|`wazuh.indexer.shards.active`<br>Master item: `wazuh.indexer.cluster.health.get`<br>Preprocessing: JSONPath: `$.active_shards`|
|Wazuh Indexer: Unassigned shards|Number of unassigned shards.|Dependent item|`wazuh.indexer.shards.unassigned`<br>Master item: `wazuh.indexer.cluster.health.get`<br>Preprocessing: JSONPath: `$.unassigned_shards`|
|Wazuh Indexer: Relocating shards|Number of relocating shards.|Dependent item|`wazuh.indexer.shards.relocating`<br>Master item: `wazuh.indexer.cluster.health.get`<br>Preprocessing: JSONPath: `$.relocating_shards`|
|Wazuh Indexer: Initializing shards|Number of initializing shards.|Dependent item|`wazuh.indexer.shards.initializing`<br>Master item: `wazuh.indexer.cluster.health.get`<br>Preprocessing: JSONPath: `$.initializing_shards`|
|Wazuh Indexer: Pending tasks|Number of cluster-level pending tasks.|Dependent item|`wazuh.indexer.tasks.pending`<br>Master item: `wazuh.indexer.cluster.health.get`<br>Preprocessing: JSONPath: `$.number_of_pending_tasks`|
|Wazuh Indexer: Active shards, in %|Percentage of active shards.|Dependent item|`wazuh.indexer.shards.active_pct`<br>Master item: `wazuh.indexer.cluster.health.get`<br>Preprocessing: JSONPath: `$.active_shards_percent_as_number`|

### Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Wazuh Indexer: API is unavailable or not returning data|No data received from the Wazuh indexer. Check the service, the port, the credentials and the TLS trust.|`nodata(/Wazuh Indexer by HTTP/wazuh.indexer.cluster.health.get,{$WAZUH.INDEXER.NODATA.TIME})=1`|High||
|Wazuh Indexer: Cluster status is red|At least one primary shard is not allocated: data may be unavailable.|`last(/Wazuh Indexer by HTTP/wazuh.indexer.cluster.status)=2`|High|Depends on: Wazuh Indexer: API is unavailable or not returning data|
|Wazuh Indexer: Cluster status is yellow|At least one replica shard is not allocated.|`last(/Wazuh Indexer by HTTP/wazuh.indexer.cluster.status)=1`|Warning|Depends on: Wazuh Indexer: API is unavailable or not returning data|
|Wazuh Indexer: Number of nodes has decreased|A node left the indexer cluster.|`change(/Wazuh Indexer by HTTP/wazuh.indexer.nodes)<0`|Average|Depends on: Wazuh Indexer: API is unavailable or not returning data<br>Manual close: yes|
|Wazuh Indexer: Unassigned shards|There have been unassigned shards for more than {$WAZUH.INDEXER.UNASSIGNED.TIME}.|`min(/Wazuh Indexer by HTTP/wazuh.indexer.shards.unassigned,{$WAZUH.INDEXER.UNASSIGNED.TIME})>0`|Warning|Depends on: Wazuh Indexer: API is unavailable or not returning data|

### LLD rule: Wazuh indexer nodes discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh indexer nodes discovery|Discovers the indexer nodes from GET /_nodes/stats.|Dependent item|`wazuh.indexer.nodes.discovery`<br>Master item: `wazuh.indexer.nodes.stats.get`|

#### Item prototypes for Wazuh indexer nodes discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh Indexer: Node [{#NODE.NAME}]: JVM heap used, in %|Percentage of JVM heap in use on node {#NODE.NAME}.|Dependent item|`wazuh.indexer.node.heap["{#NODE.ID}"]`<br>Master item: `wazuh.indexer.nodes.stats.get`<br>Preprocessing: JSONPath: `$.nodes['{#NODE.ID}'].jvm.mem.heap_used_percent`|
|Wazuh Indexer: Node [{#NODE.NAME}]: CPU usage, in %|CPU usage reported by node {#NODE.NAME}.|Dependent item|`wazuh.indexer.node.cpu["{#NODE.ID}"]`<br>Master item: `wazuh.indexer.nodes.stats.get`<br>Preprocessing: JSONPath: `$.nodes['{#NODE.ID}'].os.cpu.percent`|
|Wazuh Indexer: Node [{#NODE.NAME}]: Disk total space|Total size of the data filesystem of node {#NODE.NAME}.|Dependent item|`wazuh.indexer.node.fs.total["{#NODE.ID}"]`<br>Master item: `wazuh.indexer.nodes.stats.get`<br>Preprocessing: JSONPath: `$.nodes['{#NODE.ID}'].fs.total.total_in_bytes`|
|Wazuh Indexer: Node [{#NODE.NAME}]: Disk available space|Available space on the data filesystem of node {#NODE.NAME}.|Dependent item|`wazuh.indexer.node.fs.available["{#NODE.ID}"]`<br>Master item: `wazuh.indexer.nodes.stats.get`<br>Preprocessing: JSONPath: `$.nodes['{#NODE.ID}'].fs.total.available_in_bytes`|
|Wazuh Indexer: Node [{#NODE.NAME}]: Disk free space, in %|Free space on the data filesystem of node {#NODE.NAME}.|Calculated|`wazuh.indexer.node.fs.free_pct["{#NODE.ID}"]`<br>Update: `{$WAZUH.INDEXER.INTERVAL}`|

#### Trigger prototypes for Wazuh indexer nodes discovery

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Wazuh Indexer: Node [{#NODE.NAME}]: JVM heap usage is critical|JVM heap usage has been above {$WAZUH.INDEXER.HEAP.MAX.CRIT}% for 5 minutes.|`min(/Wazuh Indexer by HTTP/wazuh.indexer.node.heap["{#NODE.ID}"],5m)>{$WAZUH.INDEXER.HEAP.MAX.CRIT}`|High|Depends on: Wazuh Indexer: API is unavailable or not returning data|
|Wazuh Indexer: Node [{#NODE.NAME}]: JVM heap usage is high|JVM heap usage has been above {$WAZUH.INDEXER.HEAP.MAX.WARN}% for 5 minutes.|`min(/Wazuh Indexer by HTTP/wazuh.indexer.node.heap["{#NODE.ID}"],5m)>{$WAZUH.INDEXER.HEAP.MAX.WARN}`|Warning|Depends on: Wazuh Indexer: API is unavailable or not returning data|
|Wazuh Indexer: Node [{#NODE.NAME}]: CPU usage is high|CPU usage has been above {$WAZUH.INDEXER.CPU.MAX.WARN}% for 15 minutes.|`min(/Wazuh Indexer by HTTP/wazuh.indexer.node.cpu["{#NODE.ID}"],15m)>{$WAZUH.INDEXER.CPU.MAX.WARN}`|Warning|Depends on: Wazuh Indexer: API is unavailable or not returning data|
|Wazuh Indexer: Node [{#NODE.NAME}]: Free disk space is critical|Free space is below {$WAZUH.INDEXER.DISK.FREE.MIN.CRIT}%. OpenSearch high disk watermark is 10% free by default: shards are moved away.|`last(/Wazuh Indexer by HTTP/wazuh.indexer.node.fs.free_pct["{#NODE.ID}"])<{$WAZUH.INDEXER.DISK.FREE.MIN.CRIT}`|High|Depends on: Wazuh Indexer: API is unavailable or not returning data|
|Wazuh Indexer: Node [{#NODE.NAME}]: Free disk space is low|Free space is below {$WAZUH.INDEXER.DISK.FREE.MIN.WARN}%. OpenSearch low disk watermark is 15% free by default: no new shards are allocated.|`last(/Wazuh Indexer by HTTP/wazuh.indexer.node.fs.free_pct["{#NODE.ID}"])<{$WAZUH.INDEXER.DISK.FREE.MIN.WARN}`|Warning|Depends on: Wazuh Indexer: API is unavailable or not returning data|

#### Graph prototypes for Wazuh indexer nodes discovery

|Name|Items|
|----|-----|
|Wazuh Indexer: Node [{#NODE.NAME}]: JVM heap used, in %|`wazuh.indexer.node.heap["{#NODE.ID}"]`|
|Wazuh Indexer: Node [{#NODE.NAME}]: CPU usage, in %|`wazuh.indexer.node.cpu["{#NODE.ID}"]`|
|Wazuh Indexer: Node [{#NODE.NAME}]: Disk free space, in %|`wazuh.indexer.node.fs.free_pct["{#NODE.ID}"]`|

### Graphs

|Name|Items|
|----|-----|
|Wazuh Indexer: Shards|`wazuh.indexer.shards.active`, `wazuh.indexer.shards.unassigned`|

### Dashboards

|Name|Widgets|
|----|-------|
|Wazuh Indexer: overview|11 widgets|

## Wazuh Dashboard by HTTP

Checks the availability of the Wazuh dashboard with an HTTP request to its login page, without any agent or external script.

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|`{$WAZUH.DASHBOARD.SCHEME}`|Wazuh dashboard scheme (http or https).|`https`|
|`{$WAZUH.DASHBOARD.PORT}`|Wazuh dashboard port.|`443`|
|`{$WAZUH.DASHBOARD.PATH}`|Path used for the availability check (must be reachable without authentication).|`/app/login`|
|`{$WAZUH.DASHBOARD.HTTP.PROXY}`|HTTP proxy used to reach the Wazuh dashboard, for example http://proxy.example.com:3128. Leave empty to connect directly.||
|`{$WAZUH.DASHBOARD.INTERVAL}`|Collection interval.|`1m`|
|`{$WAZUH.DASHBOARD.NODATA.TIME}`|No-data period before the dashboard is considered unavailable.|`5m`|

### Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh Dashboard: HTTP status code|HTTP status code returned by the Wazuh dashboard login page.|HTTP agent|`wazuh.dashboard.http.status`<br>Update: `{$WAZUH.DASHBOARD.INTERVAL}`<br>Preprocessing: Regular expression: `^HTTP/\S+\s+(\d{3}) -> \1`|

### Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Wazuh Dashboard: Unavailable|No response from the dashboard (connection refused, timeout or TLS error). See the item error message.|`nodata(/Wazuh Dashboard by HTTP/wazuh.dashboard.http.status,{$WAZUH.DASHBOARD.NODATA.TIME})=1`|High||
|Wazuh Dashboard: Unexpected HTTP status code|The dashboard returned an HTTP error for three consecutive checks.|`min(/Wazuh Dashboard by HTTP/wazuh.dashboard.http.status,#3)>=400`|High|Depends on: Wazuh Dashboard: Unavailable|

### Dashboards

|Name|Widgets|
|----|-------|
|Wazuh Dashboard: overview|3 widgets|

## Wazuh Manager by Zabbix agent

Complements "Wazuh Manager by HTTP" with checks that the Wazuh API cannot provide: processes, freshness of alerts.json (detects a silent stall of the detection pipeline), ERROR and CRITICAL lines in ossec.log and the Filebeat process. Link it to the host running the Wazuh manager, in addition to the HTTP templates. It is not linked by the "Wazuh by HTTP" parent template because it needs a Zabbix agent.

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|`{$WAZUH.ALERTS.LOG.PATH}`|Path of the Wazuh alerts file.|`/var/ossec/logs/alerts/alerts.json`|
|`{$WAZUH.ALERTS.AGE.MAX}`|Maximum time without a write to alerts.json before the pipeline is considered stalled. Lower it on busy installations with many agents; raise it on quiet labs.|`30m`|
|`{$WAZUH.OSSEC.LOG.PATH}`|Path of the Wazuh manager log.|`/var/ossec/logs/ossec.log`|
|`{$WAZUH.OSSEC.LOG.ERROR.REGEX}`|Regular expression of the ossec.log lines to collect.|`: (ERROR\|CRITICAL):`|
|`{$WAZUH.FILEBEAT.PROCESS}`|Name of the process forwarding alerts to the indexer.|`filebeat`|

### Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Wazuh Manager: analysisd process count|Number of running wazuh-analysisd processes (event analysis engine). Independent of the Wazuh API.|Zabbix agent|`proc.num[wazuh-analysisd]`<br>Update: `1m`|
|Wazuh Manager: remoted process count|Number of running wazuh-remoted processes (agent communication daemon).|Zabbix agent|`proc.num[wazuh-remoted]`<br>Update: `1m`|
|Wazuh Manager: Filebeat process count|Number of running Filebeat processes, which forward alerts to the Wazuh indexer.|Zabbix agent|`proc.num[{$WAZUH.FILEBEAT.PROCESS}]`<br>Update: `1m`|
|Wazuh Manager: alerts.json last modification time|Unix timestamp of the last write to alerts.json. It stops advancing when the detection pipeline stalls.|Zabbix agent|`vfs.file.time[{$WAZUH.ALERTS.LOG.PATH},modify]`<br>Update: `1m`|
|Wazuh Manager: ERROR and CRITICAL entries in ossec.log|Lines of ossec.log matching {$WAZUH.OSSEC.LOG.ERROR.REGEX}. Requires an active agent (ServerActive).|Zabbix agent (active)|`log[{$WAZUH.OSSEC.LOG.PATH},"{$WAZUH.OSSEC.LOG.ERROR.REGEX}",,,skip]`<br>Update: `1s`|

### Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Wazuh Manager: wazuh-analysisd is not running|The event analysis engine has stopped: security events are no longer processed. Restart the wazuh-manager service and investigate the cause in ossec.log.|`last(/Wazuh Manager by Zabbix agent/proc.num[wazuh-analysisd])=0`|High|Manual close: yes|
|Wazuh Manager: wazuh-remoted is not running|The daemon receiving events from agents has stopped.|`last(/Wazuh Manager by Zabbix agent/proc.num[wazuh-remoted])=0`|High|Manual close: yes|
|Wazuh Manager: Filebeat is not running|Filebeat has stopped: alerts are no longer reaching the Wazuh indexer.|`last(/Wazuh Manager by Zabbix agent/proc.num[{$WAZUH.FILEBEAT.PROCESS}])=0`|High|Manual close: yes|
|Wazuh Manager: No alerts generated for {$WAZUH.ALERTS.AGE.MAX}|alerts.json has not been updated although wazuh-analysisd is running: the detection pipeline may be stalled. Check disk space, permissions and ossec.log. Raise {$WAZUH.ALERTS.AGE.MAX} on quiet installations.|`(now() - last(/Wazuh Manager by Zabbix agent/vfs.file.time[{$WAZUH.ALERTS.LOG.PATH},modify]))>{$WAZUH.ALERTS.AGE.MAX} and last(/Wazuh Manager by Zabbix agent/proc.num[wazuh-analysisd])>0`|High|Manual close: yes|
|Wazuh Manager: alerts.json cannot be read|No value for the alerts.json modification time: the file is missing or not readable by the zabbix user (is it a member of the wazuh group?). See the item error message.|`nodata(/Wazuh Manager by Zabbix agent/vfs.file.time[{$WAZUH.ALERTS.LOG.PATH},modify],10m)=1`|Average||
|Wazuh Manager: ERROR or CRITICAL entries detected in ossec.log|ERROR or CRITICAL messages appeared in ossec.log during the last 5 minutes. Review the latest values of the item.|`count(/Wazuh Manager by Zabbix agent/log[{$WAZUH.OSSEC.LOG.PATH},"{$WAZUH.OSSEC.LOG.ERROR.REGEX}",,,skip],5m)>0`|Warning|Manual close: yes|

### Graphs

|Name|Items|
|----|-----|
|Wazuh Manager: Processes|`proc.num[wazuh-analysisd]`, `proc.num[wazuh-remoted]`, `proc.num[{$WAZUH.FILEBEAT.PROCESS}]`|

### Dashboards

|Name|Widgets|
|----|-------|
|Wazuh Manager (agent): overview|7 widgets|

## Feedback

Please report any issues with the template by opening an issue in the community-templates repository.

## License

MIT
