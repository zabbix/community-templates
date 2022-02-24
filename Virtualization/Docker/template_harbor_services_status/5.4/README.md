# Harbor

## Overview


```
# Zabbix Template for Harbor  

This template uses http agent to get informations from [Harbor](https://goharbor.io/) API, such as:

1. Monitor Items
    1. Health of services: Core, Jobservice, Redis, Database, Portal, ..., etc
    1. System information: Version, Regitstry URL, Has CA Root, ..., etc
    1. Statistic: Public/Private Project and Repository count
    1. Storage usage
1. Triggers
    1. Unhealthy Services
    1. Every operations on Harbor (excluding pulling images `PULL\_ARTIFACT`)
    1. Insufficient storage size

## Tested version

- Harbor: `2.0.1`
- Zabbix: `5.0.1`

## Useage

1. Import Templates: Zabbix Web Page --> [Configuration] --> [Templates] --> [Import] this xml file
1. Link this template to an existing host or a new host
1. Update the Macro to specify your Harbor info: [Configuration] --> your host --> [Macros] --> [Inherited and host macros]
    - {$HARBOR\_PASSWORD}
    - {$HARBOR\_URL}
    - {$HARBOR\_USERNAME}

## Reference

- [View and Test the Harbor REST API via Swagger](https://goharbor.io/docs/1.10/build-customize-contribute/configure-swagger/)
- [Zabbix - HTTP AGENT](https://www.zabbix.com/documentation/current/manual/config/items/itemtypes/http)
```


## Author

Yioda

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HARBOR_PASSWORD}|<p>-</p>|`****`|Secret macro|
|{$HARBOR_URL}|<p>-</p>|`127.0.0.1`|Text macro|
|{$HARBOR_USERNAME}|<p>-</p>|`****`|Secret macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status of Redis|<p>1: healthy 0: unhealthy</p>|`Dependent item`|harbor.status.redis<p>Update: 0</p>|
|Registry Storage Provider Name|<p>-</p>|`Dependent item`|harbor.system.info.registry_storage_provider_name<p>Update: 0</p>|
|Status of Database|<p>1: healthy 0: unhealthy</p>|`Dependent item`|harbor.status.database<p>Update: 0</p>|
|Status of Portal|<p>1: healthy 0: unhealthy</p>|`Dependent item`|harbor.status.portal<p>Update: 0</p>|
|Private Project Count|<p>-</p>|`Dependent item`|harbor.statistics.private_project_count<p>Update: 0</p>|
|Status of Core|<p>1: healthy 0: unhealthy</p>|`Dependent item`|harbor.status.core<p>Update: 0</p>|
|External URL|<p>-</p>|`Dependent item`|harbor.system.info.external_url<p>Update: 0</p>|
|Free volume storage size (percent)|<p>-</p>|`Calculated`|harbor.system.info.volume.storage.free.percent<p>Update: 1m</p>|
|Status|<p>1: healthy 0: unhealthy</p>|`Dependent item`|harbor.status<p>Update: 0</p>|
|Status of Notary|<p>1: healthy 0: unhealthy</p>|`Dependent item`|harbor.status.notary<p>Update: 0</p>|
|Read Only|<p>-</p>|`Dependent item`|harbor.system.info.read_only<p>Update: 0</p>|
|Auth mode|<p>-</p>|`Dependent item`|harbor.system.info.auth_mode<p>Update: 0</p>|
|Status of Registry|<p>1: healthy 0: unhealthy</p>|`Dependent item`|harbor.status.registry<p>Update: 0</p>|
|Public Project Count|<p>-</p>|`Dependent item`|harbor.statistics.public_project_count<p>Update: 0</p>|
|With Notary|<p>-</p>|`Dependent item`|harbor.system.info.with_notary<p>Update: 0</p>|
|Total volume storage size|<p>-</p>|`Dependent item`|harbor.system.info.volume.storage.total<p>Update: 0</p>|
|Status of Registryctl|<p>1: healthy 0: unhealthy</p>|`Dependent item`|harbor.status.registryctl<p>Update: 0</p>|
|Statistics|<p>-</p>|`HTTP agent`|harbor.statistics<p>Update: 1m</p>|
|Version|<p>-</p>|`Dependent item`|harbor.system.info.version<p>Update: 0</p>|
|System Status Information|<p>-</p>|`HTTP agent`|harbor.allstatus<p>Update: 30s</p>|
|Has CA Root|<p>-</p>|`Dependent item`|harbor.system.info.has_ca_root<p>Update: 0</p>|
|Self Restriction|<p>-</p>|`Dependent item`|harbor.system.info.self_registration<p>Update: 0</p>|
|Free volume storage size|<p>-</p>|`Dependent item`|harbor.system.info.volume.storage.free<p>Update: 0</p>|
|System Volume Information|<p>-</p>|`HTTP agent`|harbor.system.info.volume<p>Update: 30s</p>|
|Public Repository Count|<p>-</p>|`Dependent item`|harbor.statistics.public_repo_count<p>Update: 0</p>|
|System Information|<p>-</p>|`HTTP agent`|harbor.system.info<p>Update: 5m</p>|
|Notification Enable|<p>-</p>|`Dependent item`|harbor.system.info.notification_enable<p>Update: 0</p>|
|With Chatmuseum|<p>-</p>|`Dependent item`|harbor.system.info.with_chartmuseum<p>Update: 0</p>|
|Project Creation Restriction|<p>-</p>|`Dependent item`|harbor.system.info.project_creation_restriction<p>Update: 0</p>|
|Core log watch|<p>Core log monitoring</p>|`Zabbix agent (active)`|log[/var/log/harbor/core.log,"Handle notification with Handler 'AuditLog' on topic (.*)",,,,\1]<p>Update: 20s</p>|
|Status of Jobservice|<p>1: healthy 0: unhealthy</p>|`Dependent item`|harbor.status.jobservice<p>Update: 0</p>|
|Registry URL|<p>-</p>|`Dependent item`|harbor.system.info.registry_url<p>Update: 0</p>|
|Private Repository Count|<p>-</p>|`Dependent item`|harbor.statistics.private_repo_count<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

