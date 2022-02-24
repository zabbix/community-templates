# App Nginx Plus

## Overview

Zabbix NGINX Plus
=================


LLD template for nginx plus.


Please check your api version in template, is macro {$NGINXPLUS\_API\_VER} in defaults is used version 6


Use this command on nginx machine. Higest number is your API version.


curl **<http://127.0.0.1/api/>** 


**[1,2,3,4,5,6]**


**Output (Higest is 6)**


TODO: triggers


 


<p style="font-size: 16px; box-sizing: border-box; margin-t

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$NGINXPLUS_API_VER}|<p>Nginx+ API version</p>|`6`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Nginx+ HTTP upstreams discovery|<p>when the "fields" param is empty it returns only names of upstreams creates LLD macro {#UPSTREAM} containing upstream name</p>|`HTTP agent`|nginxplus.http.upstreams.discovery<p>Update: 1h</p>|
|Nginx+ STREAM upstreams discovery|<p>when the "fields" param is empty it returns only names of upstreams creates LLD macro {#STREAM} containing upstream name</p>|`HTTP agent`|nginxplus.stream.upstreams.discovery<p>Update: 1h</p>|
|Nginx+ HTTP limit_reqs discovery|<p>when the "fields" param is empty it returns only names of upstreams creates LLD macro {#LIMIT_REQ} containing upstream name</p>|`HTTP agent`|nginxplus.http.limit_reqs.discovery<p>Update: 1h</p>|
|Nginx+ HTTP caches discovery|<p>when the "fields" param is empty it returns only names of upstreams creates LLD macro {#CACHE} containing upstream name</p>|`HTTP agent`|nginxplus.http.caches.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|active|<p>-</p>|`Dependent item`|nginxplus.connections.active<p>Update: 0</p>|
|build|<p>-</p>|`Dependent item`|nginxplus.general.build<p>Update: 0</p>|
|version|<p>-</p>|`Dependent item`|nginxplus.general.version<p>Update: 0</p>|
|Nginx+ SSL|<p>-</p>|`HTTP agent`|nginxplus.ssl<p>Update: 1m</p>|
|total|<p>-</p>|`Dependent item`|nginxplus.http.requests.total<p>Update: 0</p>|
|Nginx+ Processes|<p>-</p>|`HTTP agent`|nginxplus.processes<p>Update: 1m</p>|
|generation|<p>-</p>|`Dependent item`|nginxplus.general.generation<p>Update: 0</p>|
|Nginx+ Connections|<p>-</p>|`HTTP agent`|nginxplus.connections<p>Update: 1m</p>|
|Nginx+ HTTP Requests|<p>-</p>|`HTTP agent`|nginxplus.http.requests<p>Update: 1m</p>|
|Nginx+ General|<p>-</p>|`HTTP agent`|nginxplus.basic<p>Update: 1m</p>|
|accepted|<p>-</p>|`Dependent item`|nginxplus.connections.accepted<p>Update: 0</p>|
|session reuses|<p>-</p>|`Dependent item`|nginxplus.ssl.session_reuses<p>Update: 0</p>|
|handshakes|<p>-</p>|`Dependent item`|nginxplus.ssl.handshakes<p>Update: 0</p>|
|respawned|<p>-</p>|`Dependent item`|nginxplus.processes.respawned<p>Update: 0</p>|
|idle|<p>-</p>|`Dependent item`|nginxplus.connections.idle<p>Update: 0</p>|
|dropped|<p>-</p>|`Dependent item`|nginxplus.connections.dropped<p>Update: 0</p>|
|handshakes failed|<p>-</p>|`Dependent item`|nginxplus.ssl.handshakes_failed<p>Update: 0</p>|
|current|<p>-</p>|`Dependent item`|nginxplus.http.requests.current<p>Update: 0</p>|
|Nginx+ HTTP upstream {#UPSTREAM}|<p>-</p>|`HTTP agent`|nginxplus.http.upstream[{#UPSTREAM}]<p>Update: 1m</p><p>LLD</p>|
|peer #0|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_0]<p>Update: 0</p><p>LLD</p>|
|peer #1|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_1]<p>Update: 0</p><p>LLD</p>|
|peer #2|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_2]<p>Update: 0</p><p>LLD</p>|
|peer #3|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_3]<p>Update: 0</p><p>LLD</p>|
|zombies|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},zombies]<p>Update: 0</p><p>LLD</p>|
|state|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_0,state]<p>Update: 0</p><p>LLD</p>|
|unhealthy|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_0,unhealthy]<p>Update: 0</p><p>LLD</p>|
|state|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_1,state]<p>Update: 0</p><p>LLD</p>|
|unhealthy|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_1,unhealthy]<p>Update: 0</p><p>LLD</p>|
|state|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_2,state]<p>Update: 0</p><p>LLD</p>|
|unhealthy|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_2,unhealthy]<p>Update: 0</p><p>LLD</p>|
|state|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_3,state]<p>Update: 0</p><p>LLD</p>|
|unhealthy|<p>-</p>|`Dependent item`|nginxplus.http.upstream[{#UPSTREAM},peer_3,unhealthy]<p>Update: 0</p><p>LLD</p>|
|Nginx+ STREAM upstream {#STREAM}|<p>-</p>|`HTTP agent`|nginxplus.stream.upstream[{#STREAM}]<p>Update: 1m</p><p>LLD</p>|
|peer #0|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},peer_0]<p>Update: 0</p><p>LLD</p>|
|peer #1|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},peer_1]<p>Update: 0</p><p>LLD</p>|
|peer #2|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},peer_2]<p>Update: 0</p><p>LLD</p>|
|zombies|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},zombies]<p>Update: 0</p><p>LLD</p>|
|state|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},peer_0,state]<p>Update: 0</p><p>LLD</p>|
|unhealthy|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},peer_0,unhealthy]<p>Update: 0</p><p>LLD</p>|
|state|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},peer_1,state]<p>Update: 0</p><p>LLD</p>|
|unhealthy|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},peer_1,unhealthy]<p>Update: 0</p><p>LLD</p>|
|state|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},peer_2,state]<p>Update: 0</p><p>LLD</p>|
|unhealthy|<p>-</p>|`Dependent item`|nginxplus.stream.upstream[{#STREAM},peer_2,unhealthy]<p>Update: 0</p><p>LLD</p>|
|Nginx+ limit_req {#LIMIT_REQ}|<p>-</p>|`HTTP agent`|nginxplus.http.limit_reqs[{#LIMIT_REQ}]<p>Update: 1m</p><p>LLD</p>|
|delayed|<p>-</p>|`Dependent item`|nginxplus.http.limit_reqs[{#LIMIT_REQ},delayed]<p>Update: 0</p><p>LLD</p>|
|delayed dry run|<p>-</p>|`Dependent item`|nginxplus.http.limit_reqs[{#LIMIT_REQ},delayed_dry_run]<p>Update: 0</p><p>LLD</p>|
|passed|<p>-</p>|`Dependent item`|nginxplus.http.limit_reqs[{#LIMIT_REQ},passed]<p>Update: 0</p><p>LLD</p>|
|rejected|<p>-</p>|`Dependent item`|nginxplus.http.limit_reqs[{#LIMIT_REQ},rejected]<p>Update: 0</p><p>LLD</p>|
|rejected dry run|<p>-</p>|`Dependent item`|nginxplus.http.limit_reqs[{#LIMIT_REQ},rejected_dry_run]<p>Update: 0</p><p>LLD</p>|
|Nginx+ cache {#CACHE}|<p>-</p>|`HTTP agent`|nginxplus.http.caches[{#CACHE}]<p>Update: 1m</p><p>LLD</p>|
|miss bytes written|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},miss_bytes_written]<p>Update: 0</p><p>LLD</p>|
|updating responses|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},updating_responses]<p>Update: 0</p><p>LLD</p>|
|updating bytes|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},updating_bytes]<p>Update: 0</p><p>LLD</p>|
|stale responses|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},stale_responses]<p>Update: 0</p><p>LLD</p>|
|stale bytes|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},stale_bytes]<p>Update: 0</p><p>LLD</p>|
|size|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},size]<p>Update: 0</p><p>LLD</p>|
|revalidated responses|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},revalidated_responses]<p>Update: 0</p><p>LLD</p>|
|revalidated bytes|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},revalidated_bytes]<p>Update: 0</p><p>LLD</p>|
|miss responses written|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},miss_responses_written]<p>Update: 0</p><p>LLD</p>|
|miss responses|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},miss_responses]<p>Update: 0</p><p>LLD</p>|
|bypass bytes|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},bypass_bytes]<p>Update: 0</p><p>LLD</p>|
|bypass bytes written|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},bypass_bytes_written]<p>Update: 0</p><p>LLD</p>|
|maxsize|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},max_size]<p>Update: 0</p><p>LLD</p>|
|hit responses|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},hit_responses]<p>Update: 0</p><p>LLD</p>|
|hit bytes|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},hit_bytes]<p>Update: 0</p><p>LLD</p>|
|expired responses written|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},expired_responses_written]<p>Update: 0</p><p>LLD</p>|
|expired responses|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},expired_responses]<p>Update: 0</p><p>LLD</p>|
|expired bytes written|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},expired_bytes_written]<p>Update: 0</p><p>LLD</p>|
|expired bytes|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},expired_bytes]<p>Update: 0</p><p>LLD</p>|
|cold|<p>A boolean value indicating whether the "cache loader" process is still loading data from disk into the cache.</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},cold]<p>Update: 0</p><p>LLD</p>|
|bypass responses written|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},bypass_responses_written]<p>Update: 0</p><p>LLD</p>|
|bypass responses|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},bypass_responses]<p>Update: 0</p><p>LLD</p>|
|miss bytes|<p>-</p>|`Dependent item`|nginxplus.http.caches[{#CACHE},miss_bytes]<p>Update: 0</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

