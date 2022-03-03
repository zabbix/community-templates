# _T_Zbx_Lin_HAPROXY2_stats_Prometheus

## Description

frontend stats bind *:8880 http-request use-service prometheus-exporter if { path /metrics } stats enable stats uri /stats stats refresh 10s

## Overview

Permit getting stats via prometheus exporter (since haproxy 2.0)


First, configure your haproxy to expose frontend stats page like this :


frontend stats  
 bind *:8880  
 http-request use-service prometheus-exporter if { path /metrics }  
 stats enable  
 stats uri /stats  
 stats refresh 10s


Then, check the item haproxy.prometheus.allmetrics URL.


Discovery for frontends, backends, servers.


* Check if <50% of backend are down (not up, like DRAIN, NOLB, etc )on a frontend.
* Check if connections are >90/95% of the limit on frontend
* Check status of frontend and backend.


## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|HAProxy Backend Discover|<p>-</p>|`Dependent item`|haproxy.backend.discovery<p>Update: 0</p>|
|HAProxy Server discovery|<p>-</p>|`Dependent item`|haproxy.server.discovery<p>Update: 0</p>|
|HAProxy Frontend Discover|<p>-</p>|`Dependent item`|haproxy.frontend.discovery<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Haproxy Prometheus Metrics|<p>-</p>|`HTTP agent`|haproxy.prometheus.allmetrics<p>Update: 1m</p>|
|backend  [{#BACKEND_NAME}] active|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},BACKEND,act]<p>Update: 0</p><p>LLD</p>|
|backend [{#BACKEND_NAME}] backup|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},BACKEND,bck]<p>Update: 0</p><p>LLD</p>|
|backend  [{#BACKEND_NAME}] backend up-down transitions|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},BACKEND,chkdown]<p>Update: 0</p><p>LLD</p>|
|backend [{#BACKEND_NAME}] downtime|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},BACKEND,downtime]<p>Update: 0</p><p>LLD</p>|
|backend [{#BACKEND_NAME}] Number of available servers|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},BACKEND,nb_available_servers_by_backend]<p>Update: 0</p><p>LLD</p>|
|backend [{#BACKEND_NAME}] Number of servers|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},BACKEND,nb_servers_by_backend]<p>Update: 0</p><p>LLD</p>|
|backend [{#BACKEND_NAME}] current sessions|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},BACKEND,scur]<p>Update: 0</p><p>LLD</p>|
|backend [{#BACKEND_NAME}] max sessions|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},BACKEND,smax]<p>Update: 0</p><p>LLD</p>|
|backend [{#BACKEND_NAME}] status|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},BACKEND,status]<p>Update: 0</p><p>LLD</p>|
|Server [{#BACKEND_NAME}/{#SERVER_NAME}] backend server up-down transitions|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},{#SERVER_NAME},chkdown]<p>Update: 0</p><p>LLD</p>|
|Server [{#BACKEND_NAME}/{#SERVER_NAME}] backend server downtime|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},{#SERVER_NAME},downtime]<p>Update: 0</p><p>LLD</p>|
|Server [{#BACKEND_NAME}/{#SERVER_NAME}] backend server status|<p>-</p>|`Dependent item`|haproxy.stats[{#BACKEND_NAME},{#SERVER_NAME},status]<p>Update: 0</p><p>LLD</p>|
|frontend [{#FRONTEND_NAME}] current sessions|<p>-</p>|`Dependent item`|haproxy.stats[{#FRONTEND_NAME},FRONTEND,scur]<p>Update: 0</p><p>LLD</p>|
|frontend [{#FRONTEND_NAME}] session limit|<p>-</p>|`Dependent item`|haproxy.stats[{#FRONTEND_NAME},FRONTEND,slim]<p>Update: 0</p><p>LLD</p>|
|frontend [{#FRONTEND_NAME}] max sessions|<p>-</p>|`Dependent item`|haproxy.stats[{#FRONTEND_NAME},FRONTEND,smax]<p>Update: 0</p><p>LLD</p>|
|frontend [{#FRONTEND_NAME}] status|<p>-</p>|`Dependent item`|haproxy.stats[{#FRONTEND_NAME},FRONTEND,status]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Backend {#BACKEND_NAME} is degraded|<p>-</p>|<p>**Expression**: (last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,nb_available_servers_by_backend]) / last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,nb_servers_by_backend]) ) <0.5</p><p>**Recovery expression**: </p>|average|
|Backend {#BACKEND_NAME} number of down state change|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,chkdown])>last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,chkdown],#1)</p><p>**Recovery expression**: </p>|high|
|Backend {#BACKEND_NAME} state is not UP|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,status],#1)<>1</p><p>**Recovery expression**: </p>|high|
|Frontend {#FRONTEND_NAME} current connexion > 90% of limit|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,scur]) * 100 / last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,slim]) > 90</p><p>**Recovery expression**: </p>|average|
|Frontend {#FRONTEND_NAME} current connexion > 95% of limit|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,scur]) * 100 / last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,slim]) > 95</p><p>**Recovery expression**: </p>|high|
|Frontend {#FRONTEND_NAME}  state is not OPEN|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,status],#1)<>1</p><p>**Recovery expression**: </p>|high|
|Backend {#BACKEND_NAME} is degraded (LLD)|<p>-</p>|<p>**Expression**: (last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,nb_available_servers_by_backend]) / last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,nb_servers_by_backend]) ) <0.5</p><p>**Recovery expression**: </p>|average|
|Backend {#BACKEND_NAME} number of down state change (LLD)|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,chkdown])>last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,chkdown],#1)</p><p>**Recovery expression**: </p>|high|
|Backend {#BACKEND_NAME} state is not UP (LLD)|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#BACKEND_NAME},BACKEND,status],#1)<>1</p><p>**Recovery expression**: </p>|high|
|Frontend {#FRONTEND_NAME} current connexion > 90% of limit (LLD)|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,scur]) * 100 / last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,slim]) > 90</p><p>**Recovery expression**: </p>|average|
|Frontend {#FRONTEND_NAME} current connexion > 95% of limit (LLD)|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,scur]) * 100 / last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,slim]) > 95</p><p>**Recovery expression**: </p>|high|
|Frontend {#FRONTEND_NAME}  state is not OPEN (LLD)|<p>-</p>|<p>**Expression**: last(/_T_Zbx_Lin_HAPROXY2_stats_Prometheus/haproxy.stats[{#FRONTEND_NAME},FRONTEND,status],#1)<>1</p><p>**Recovery expression**: </p>|high|
