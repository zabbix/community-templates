# Prefect Server Monitoring

## Overview

This template allow to monitor Deployments and Flow Runs from a Prefect Server via API. Set Macros {$PREFECTSERVERIP} and {$PREFECTSEVERPORT}.


## Author

DVoth97

## Macros used

### Template Macros

|Name|Description|Default|Type|
|----|-----------|----|----|
|{$PREFECTSERVERIP}|<p>Serveradress of the Prefect Server</p>|`-`|Text macro|
|{$PREFECTSERVERPORT}|<p>Serverport of the Prefect Server</p>|`-`|Text macro|

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery Deployments|<p>Dicovery Deployment for checking if deployment Shedule is paused or deployment is inactiv</p>|`Dependet item`|discovery.deployments|
|Discovery Flow Runs|<p>Discovery Flow Runs to check the state of the last Run</p>|`Dependet item`|discovery.flow.runs|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Get all Deployments|<p>Master Item for creating Deployments Discovery Rule</p>|`HTTP agent`|get.prefect.all.deployments|
|Get unpaused Deployments|<p>Master Item for creating unpaused Deployments Discovery Rule</p>|`HTTP agent`|get.prefect.unpaused.deployments|
|Deployment {#DEPLOYMENTNAME} Ready State|<p>Item for checking Deployment Ready or not ready state</p>|`Dependet item`|deployment.ready.state[{#DEPLOYMENTID}]|
|Deployment {#DEPLOYMENTNAME} Active State|<p>Item for checking if Deployment is active or paused</p>|`Dependet item`|deployment.ready.active[{#DEPLOYMENTID}]|
|Flow Run {#FLOWNAME}|<p>Master Item getting flows to get Flow Runs</p>|`HTTP agent`|flow.run[{#FLOWNAME}_{#DEPLOYMENTID}]|
|Flow Last Run State {#FLOWNAME}|<p>Item to Monitor last Flow Run State</p>|`HTTP agent`|flow.last.run.state[{#FLOWNAME}_{#DEPLOYMENTID}]|



## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----|----|
|Deployment {#DEPLOYMENTNAME} {ITEM.VALUE}|<p>-</p>|last(/Prefect Server Monitoring/deployment.ready.state[{#DEPLOYMENTID}])<>"READY"|Information|
|Flow Run {#FLOWNAME} Schedule Paused|<p>-</p>|last(/Prefect Server Monitoring/deployment.ready.active[{#DEPLOYMENTID}])="false"|Information|
|Flow Run {#FLOWNAME} {ITEM.VALUE}|<p>-</p>|last(/Prefect Server Monitoring/flow.last.run.state[{#FLOWNAME}_{#DEPLOYMENTID}])<>"COMPLETED" and last(/Prefect Server Monitoring/flow.last.run.state[{#FLOWNAME}_{#DEPLOYMENTID}])<>"PAUSED"|Warning|

