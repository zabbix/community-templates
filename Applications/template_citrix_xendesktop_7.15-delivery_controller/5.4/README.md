# C24_CVAD-715_Broker_v1.00

## Overview

Monitoring template for Delivery Controller included in CVAD (Citrix Virtual Apps and Desktops) ver 7.15.


Installation details


1. Prior to template import - create host group called C24 - XD 7.15 Broker
2. After import - update template macro section with correct host names.


For more information about template configuration setings and template hiistory please visit [citrix24 blog](https://blog.citrix24.com/xendesktop-7-x-monitoring-template-delivery-controller/)



## Author

citrix24

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CTX_LIC_SRV}|<p>-</p>|`add your host name`|Text macro|
|{$DB_SRV}|<p>-</p>|`add your host name`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Broker_CitrixConfigurationLogging|<p>-</p>|`Zabbix agent`|service.info[CitrixConfigurationLogging]<p>Update: 1m</p>|
|Broker_CitrixAppLibrary|<p>-</p>|`Zabbix agent`|service.info[CitrixAppLibrary]<p>Update: 1m</p>|
|Broker_CitrixTrust|<p>-</p>|`Zabbix agent`|service.info[CitrixTrust]<p>Update: 1m</p>|
|Broker_CitrixHighAvailabilityService|<p>-</p>|`Zabbix agent`|service.info[CitrixHighAvailabilityService]<p>Update: 1m</p>|
|Broker_Event_1201|<p>The connection between the Citrix Broker Service and the database has been lost.</p>|`Zabbix agent (active)`|eventlog[Application,,Warning,"Citrix Broker Service",1201,,]<p>Update: 1m</p>|
|Broker_Event_1170|<p>The Citrix Broker Service has successfully detected suitable licenses on the license server 'dc01.lab.citrix24.ctx'. This controller is no longer in the out-of-box licensing grace period.</p>|`Zabbix agent (active)`|eventlog[Application,,,,1170,,]<p>Update: 1m</p>|
|Broker_CitrixConfigSyncService|<p>-</p>|`Zabbix agent`|service.info[CitrixConfigSyncService]<p>Update: 1m</p>|
|Broker_Event_1151|<p>-</p>|`Zabbix agent (active)`|eventlog[Application,,Error,"Citrix Broker Service",1151,,]<p>Update: 1m</p>|
|Broker_CitrixMonitor|<p>-</p>|`Zabbix agent`|service.info[CitrixMonitor]<p>Update: 1m</p>|
|Broker_CitrixConfigurationService|<p>-</p>|`Zabbix agent`|service.info[CitrixConfigurationService]<p>Update: 1m</p>|
|Broker_Event_1150|<p>-</p>|`Zabbix agent (active)`|eventlog[Application,,Information,"Citrix Broker Service",1150,,]<p>Update: 1m</p>|
|Broker_CitrixAnalytics|<p>-</p>|`Zabbix agent`|service.info[CitrixAnalytics]<p>Update: 1m</p>|
|Broker_Event_1199|<p>-</p>|`Zabbix agent (active)`|eventlog[Application,,,,1199,,]<p>Update: 1m</p>|
|Broker_PerfCounter_Brokered Sessions|<p>-</p>|`Zabbix agent`|perf_counter[\Citrix Broker Service\Brokered Sessions,]<p>Update: 1m</p>|
|Broker_CitrixADIdentityService|<p>-</p>|`Zabbix agent`|service.info[CitrixADIdentityService]<p>Update: 1m</p>|
|Broker_CitrixTelemetryService|<p>-</p>|`Zabbix agent`|service.info[CitrixTelemetryService]<p>Update: 1m</p>|
|Broker_CitrixBrokerService|<p>-</p>|`Zabbix agent`|service.info[CitrixBrokerService]<p>Update: 1m</p>|
|Broker_Event_3500|<p>The Citrix Broker Service has detected that the issue with communication with the database has been resolved and will resume normal brokering activity using configuration in the main site database.</p>|`Zabbix agent (active)`|eventlog[Application,,Information,,3500,,]<p>Update: 1m</p>|
|Broker_CitrixHostService|<p>-</p>|`Zabbix agent`|service.info[CitrixHostService]<p>Update: 1m</p>|
|Broker_Event_1169|<p>Controller {HOSTNAME} has entered the out-of-box grace period as no suitable licenses were found on the license server {$CTX_LIC_SRV}. You have 281 hour(s) remaining before this controller stops providing desktop and application sessions.</p>|`Zabbix agent (active)`|eventlog[Application,,,,1169,,]<p>Update: 1m</p>|
|Broker_CitrixPrivilegedService|<p>-</p>|`Zabbix agent`|service.info[CitrixPrivilegedService]<p>Update: 1m</p>|
|Broker_CitrixMachineCreationService|<p>-</p>|`Zabbix agent`|service.info[CitrixMachineCreationService]<p>Update: 1m</p>|
|Broker_Event_1200|<p>The connection between the Citrix Broker Service and the database has been restored.</p>|`Zabbix agent (active)`|eventlog[Application,,Information,"Citrix Broker Service",1200,,]<p>Update: 1m</p>|
|Broker_CitrixDelegatedAdmin|<p>-</p>|`Zabbix agent`|service.info[CitrixDelegatedAdmin]<p>Update: 1m</p>|
|Broker_Event_505|<p>Information An import to the local DB failed; see below for more information</p>|`Zabbix agent (active)`|eventlog[Application,,,,505,,]<p>Update: 1m</p>|
|Broker_CitrixEnvTest|<p>-</p>|`Zabbix agent`|service.info[CitrixEnvTest]<p>Update: 1m</p>|
|Broker_CitrixStorefront|<p>-</p>|`Zabbix agent`|service.info[CitrixStorefront]<p>Update: 1m</p>|
|Broker_CitrixOrchestration|<p>-</p>|`Zabbix agent`|service.info[CitrixOrchestration]<p>Update: 1m</p>|
|Broker_CitrixConnector|<p>-</p>|`Zabbix agent`|service.info[CitrixConnector]<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

