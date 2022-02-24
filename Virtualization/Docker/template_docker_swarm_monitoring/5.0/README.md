# App Docker swarm

## Overview

Monitoring with Docker API, no external scripts need. Use {HOST.DNS} for connect to Docker API.


I'm use SSL client certificate to connect to Docker API (here <https://dker.ru/docs/component-projects/docker-swarm/configure-docker-swarm-for-tls/> you can found HOWTO). You must specify filename of the client's certificate in {$CERT\_FNAME} macro and filename of the client's key in {$KEY\_FNAME}. Certificate and key must be in location for SSL client certificate (see SSLCertLocation in zabbix\_server.conf)



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CERT_FNAME}|<p>-</p>|`dclient-cert.pem`|Text macro|
|{$KEY_FNAME}|<p>-</p>|`dclient-key.pem`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Docker swarm services discovery|<p>-</p>|`HTTP agent`|docker.swarm.services.lld<p>Update: 5m</p>|
|Docker swarm nodes discovery|<p>-</p>|`HTTP agent`|docker.swarm.nodes.lld<p>Update: 1h</p>|
|Docker swarm containers discovery|<p>-</p>|`HTTP agent`|docker.containers.lld<p>Update: 10m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Docker swarm updated at|<p>-</p>|`Dependent item`|docker.swarm.updated_at<p>Update: 0</p>|
|Docker swarm leader node|<p>-</p>|`Dependent item`|docker.swarm.nodes.leader<p>Update: 0</p>|
|Docker swarm services raw|<p>-</p>|`HTTP agent`|docker.swarm.services.raw<p>Update: 5m</p>|
|Docker swarm nodes raw|<p>-</p>|`HTTP agent`|docker.swarm.nodes.raw<p>Update: 1m</p>|
|Docker swarm managers nodes|<p>-</p>|`Dependent item`|docker.swarm.nodes.manager<p>Update: 0</p>|
|Docker swarm raw info|<p>-</p>|`HTTP agent`|docker.swarm.info.raw<p>Update: 1m</p>|
|Docker swarm nodes|<p>-</p>|`Dependent item`|docker.swarm.nodes.total<p>Update: 0</p>|
|Docker swarm tasks raw info|<p>-</p>|`HTTP agent`|docker.swarm.tasks.raw.info<p>Update: 1m</p>|
|Docker swarm ready nodes|<p>-</p>|`Dependent item`|docker.swarm.nodes.ready<p>Update: 0</p>|
|Docker swarm uptime {#SERVICE}|<p>-</p>|`Dependent item`|docker.swarm.service.uptime[{#SERVICE}]<p>Update: 0</p><p>LLD</p>|
|Docker swarm number running tasks for {#SERVICE}|<p>-</p>|`Dependent item`|docker.swarm.tasks.running[{#SERVICE}]<p>Update: 0</p><p>LLD</p>|
|Raw data node {#NAME} at {#ADDR}|<p>-</p>|`HTTP agent`|docker.nodes[{#ID}]<p>Update: 5m</p><p>LLD</p>|
|Node {#NAME} availability|<p>-</p>|`Dependent item`|docker.node.availability[{#ID}]<p>Update: 0</p><p>LLD</p>|
|Node {#NAME} engine version|<p>-</p>|`Dependent item`|docker.node.engine_version[{#ID}]<p>Update: 0</p><p>LLD</p>|
|Node {#NAME} manager status|<p>-</p>|`Dependent item`|docker.node.manager_status[{#ID}]<p>Update: 0</p><p>LLD</p>|
|Node {#NAME} resources CPUs|<p>-</p>|`Dependent item`|docker.node.resources.cpu[{#ID}]<p>Update: 0</p><p>LLD</p>|
|Node {#NAME} resources memory|<p>-</p>|`Dependent item`|docker.node.resources.mem[{#ID}]<p>Update: 0</p><p>LLD</p>|
|Node {#NAME} role|<p>-</p>|`Dependent item`|docker.node.role[{#ID}]<p>Update: 0</p><p>LLD</p>|
|Node {#NAME} status|<p>-</p>|`Dependent item`|docker.node.status[{#ID}]<p>Update: 0</p><p>LLD</p>|
|{#NAME} CPU load %|<p>-</p>|`Calculated`|docker.container.cpu_load[{#ID}]<p>Update: 1m</p><p>LLD</p>|
|Raw data container stats {#NAME}|<p>-</p>|`HTTP agent`|docker.container.stats[{#ID}]<p>Update: 1m</p><p>LLD</p>|
|Raw data container info {#NAME}|<p>-</p>|`HTTP agent`|docker.container[{#ID}]<p>Update: 5m</p><p>LLD</p>|
|{#NAME} CPU usage|<p>-</p>|`Dependent item`|docker.container.cpu[{#ID}]<p>Update: 0</p><p>LLD</p>|
|{#NAME} CPU number|<p>-</p>|`Dependent item`|docker.container.cpu_num[{#ID}]<p>Update: 0</p><p>LLD</p>|
|{#NAME} Mem usage|<p>-</p>|`Dependent item`|docker.container.mem[{#ID}]<p>Update: 0</p><p>LLD</p>|
|{#NAME} CPU system usage|<p>-</p>|`Dependent item`|docker.container.system_cpu[{#ID}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Docker swarm updated service {#SERVICE}|<p>-</p>|<p>**Expression**: {App Docker swarm:docker.swarm.service.uptime[{#SERVICE}].last()}<600</p><p>**Recovery expression**: </p>|warning|
|Docker swarm no running tasks for {#SERVICE}|<p>-</p>|<p>**Expression**: {App Docker swarm:docker.swarm.tasks.running[{#SERVICE}].last()}=0</p><p>**Recovery expression**: {App Docker swarm:docker.swarm.tasks.running[{#SERVICE}].avg(30m)}<1</p>|average|
|Docker swarm no running tasks for {#SERVICE} changed|<p>-</p>|<p>**Expression**: {App Docker swarm:docker.swarm.tasks.running[{#SERVICE}].diff()}=1</p><p>**Recovery expression**: </p>|average|
|Docker swarm updated service {#SERVICE} (LLD)|<p>-</p>|<p>**Expression**: {App Docker swarm:docker.swarm.service.uptime[{#SERVICE}].last()}<600</p><p>**Recovery expression**: </p>|warning|
|Docker swarm no running tasks for {#SERVICE} (LLD)|<p>-</p>|<p>**Expression**: {App Docker swarm:docker.swarm.tasks.running[{#SERVICE}].last()}=0</p><p>**Recovery expression**: {App Docker swarm:docker.swarm.tasks.running[{#SERVICE}].avg(30m)}<1</p>|average|
|Docker swarm no running tasks for {#SERVICE} changed (LLD)|<p>-</p>|<p>**Expression**: {App Docker swarm:docker.swarm.tasks.running[{#SERVICE}].diff()}=1</p><p>**Recovery expression**: </p>|average|
