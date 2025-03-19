# Zabbix Ekara Template

## Overview

Ekara is a fully hybrid platform, capable of monitoring 100% of existing applications and ensuring the availability and performance of your environment (intranet and internet).
Ekara robots execute scenarios (user journeys) according to a predefined schedule.
The scenario results are the scenario status and the duration of every step as well as browser's metrics for Web applications.

The Zabbix Ekara Template is useful for real_time monitoring. For user journeys (scenarios) configuration and a deepen analysis, access the Ekara Portal directly.
The template is designed to interface with Ekara APIs to display in customized dashboards :
* Scenarios statuses,
* Trigger problem event based on scenario status,
* Get observability KPIs (performance and availability),

## Setup

### Import the template

*Data collection -> Templates -> Import*

![ImportTemplate](./doc/import.png)

### Fill up these macros

*Select the template -> Macros*

### Assign the template to a host

*Data collection -> Hosts -> Select host and assign template*

That host will have items, triggers and graphs created automatically for each scenarios.

### Enjoy (and wait)<br></br>

## Zabbix configuration

You can also modify the {$UPDATE.INTERVAL} macro, which is the number of minutes between each API call for metrics retrieval.<br></br>

## Template links

There are no template links in this template.<br></br>

## Macros used

|Macro|Description|Default value|
|-|-|-|
|{$EKARA.INTERVAL}|Define at which frequency to refresh the data|`15m`|
|{$EKARA.LOGIN}|Put your Ekara login here| - |
|{$EKARA.PASSWORD}|Put your password here|`SECRET_TEXT`|
|{$EKARA.URL}|Url to connect to the Ekara API|`https://api.ekara.ip-label.net/`|

## Items

|Name|Description|Type|Key|Update Interval|Preprocessing|
|-|-|-|-|-|-|
|Get all apps & active scenarios|Get all information of the scenarios|Script|`get.apps.active.scenarios`|10m| - |
|Get all scenarios statuses|Get the statuses of the scenarios|Script|`get.scenarios.statuses`|10m| - |
|Get all apps & active scenarios check|Data collection check|Dependent item|`get.apps.active.scenarios.check`| - | </p><ul><li><p> JSON Path: `$.error` </p><p></p></li><li><p> Discard unchanged with heartbeat: `3h` </p></li></ul> |
|Get all scenarios statuses check|Data collection check|Dependent item|`get.scenarios.statuses.check`| - | </p><ul><li><p> JSON Path: `$.error` </p><p></p></li><li><p> Discard unchanged with heartbeat: `3h` </p></li></ul> |

## Triggers

|Name|Description|Expression|Severity|
|-|-|-|-|
|Get all apps & active scenarios: Failed| - |`length(last(/Ekara Template/get.apps.active.scenarios.check))>0`|Warning|
|Get all scenarios statuses: Failed| - |`length(last(/Ekara Template/get.scenarios.statuses.check))>0`|Warning|

## Discovery rules

### Set Ekara items

|Name|Description|Type|Key|
|-|-|-|-|
|Set Ekara items|This will discover the metrics for each scenarios|Dependent Item|`set.ekara.items`|

**LLD Macros**

|Name|JSON Path|
|-|-|
|{#SCENARIO.APP}|`$.['applicationName']`|
|{#SCENARIO.ID}|`$.['id']`|
|{#SCENARIO.METRIC}|`$.['preferredMetric']`|
|{#SCENARIO.NAME}|`$.['name']`|
|{#SCENARIO.STATE}|`$.['active']`|
|{#SCENARIO.TYPE}|`$.['plugins'][1].['Name']`|

**Filters**

|Macro|| Regular expression|
|-|-|-|
|{#SCENARIO.STATE}|matches|`1`|

**Items prototype**

|Name|Description|Type|Key|Update Interval|Preprocessing|
|-|-|-|-|-|-|
|{#SCENARIO.NAME}: availability|Get the availability of the scenario|Dependent Item|`get.scenarios.availability[{#SCENARIO.ID}]`|-| <p><ul><li><p> JSON Path: `$.kpis[?(@.label=='availability')].value.first()` </p></li></ul> |
|{#SCENARIO.NAME}: results|Get the results for each scenarios|Script|`get.scenarios.results[{#SCENARIO.ID}]`|{$UPDATE.INTERVAL}|-|
|{#SCENARIO.NAME}: results check|Data collection check|Dependent Item|`get.scenarios.results.check[{#SCENARIO.ID}]`|-| <p><ul><li><p> JSON Path: `$.error` </p><p></p></li><li><p> Discard unchanged with heartbeat: `3h` </p></li></ul> |
|{#SCENARIO.NAME}: {#SCENARIO.METRIC}|Get the metric of the scenario if available|Dependent Item|`get.scenarios.metric[{#SCENARIO.ID}]`|-| <p><ul><li><p> JSON Path: `$.kpis[?(@.label=='{#SCENARIO.METRIC}')].value.first()` </p></li></ul> |

**Triggers prototype**

|Name|Description|Expression|Severity|
|-|-|-|-|
|{#SCENARIO.NAME}: Failed to get results| - |`length(last(/Ekara Template/get.scenarios.results.check[{#SCENARIO.ID}]))>0`|Warning|

### Set Ekara status items

|Name|Description|Type|Key|
|-|-|-|-|
|Set Ekara status items|This will discover the status for each scenarios|Dependent Item|`set.ekara.status.items`|

**LLD Macros**

|Name|JSON Path|
|-|-|
|{#SCENARIO.ID}|`$.['scenarioId']`|
|{#SCENARIO.NAME}|`$.['scenarioName']`|

**Items prototype**

|Name|Description|Type|Key|Update Interval|Preprocessing|
|-|-|-|-|-|-|
|{#SCENARIO.NAME}: status|Get the status of the scenario|Dependent Item|`get.scenarios.statuses[{#SCENARIO.ID}]`|-|`$[?(@.scenarioId=='{#SCENARIO.ID}')].currentStatus.first()`|

**Triggers prototype**

|Name|Description|Expression|Severity|
|-|-|-|-|
|{#SCENARIO.NAME}: Status is not success|This will be created for each scenarios and trigger a problem if the scenario's status isn't successful|`last(/Ekara Template/get.scenarios.statuses[{#SCENARIO.ID}])<>1`|Average|

## Feedback

Please report any issues with the template at [https://help.ip-label.net/](https://help.ip-label.net/)
