# Monitoring HR-Link service

## Overview

This template is intended for monitoring the service HR-Link (https://hr-link.ru/)

- Automatic detection and notification of failures of containers and services.

- Checking the availability of the web service.

## Author

Vadim Gurko

## Setup

Import the Template_App_HR-Link.yaml template into your Zabbix instance (Configuration --> Templates --> Import), and apply the template to a host.

## Zabbix configuration

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HRLINK.SERVICE.URL}|<p>URL HR-Link portal for monitoring</p>|`hrlink.domain.com`|Text macro|

## Template links

Information and plug-in are available here: https://github.com/VAGurko/zabbix_template_hrlink

The procedure for making changes is described here: https://github.com/VAGurko/zabbix-community-templates/wiki/Порядок-внесения-изменений-в-шаблон

## Discovery rules

|Name|Description| Type          | Key and additional info                       |
|----|-----------|---------------|-----------------------------------------------|
|HR-Link Containers|<p>-</p>| `HTTP agent` | http_value_hrlink_containers<p>Update: 1h</p> |
|HR-Link Service|<p>-</p>| `HTTP agent` | http_value_hrlink_service<p>Update: 1h</p> |


## Items collected

|Name|Description| Type         | Key and additional info                                                                       |
|----|-----------|--------------|-----------------------------------------------------------------------------------------------|
|HR-Link Number of containers|<p>-</p>| `HTTP agent` | test_http_value_hrlink_number_of_containers<p>Update: 1m</p> |
|HR-Link Number of services|<p>-</p>| `HTTP agent` | test_http_value_hrlink_number_of_services<p>Update: 1m</p> |
|Ping web-service HR-Link|<p>-</p>| `HTTP agent` | pingwebhrlink<p>Update: 1m</p> |
|HR-Link containers {#CONTAINERS_SERVICE} error message|<p>-</p>| `HTTP agent` | http_value_hrlink_health_containers_error_message_["{#CONTAINERS_SERVICE}"]<p>Update: 10m</p> |
|HR-Link containers {#CONTAINERS_SERVICE} status|<p>-</p>| `HTTP agent` | http_value_hrlink_health_containers_status_["{#CONTAINERS_SERVICE}"]<p>Update: 1m</p> |
|HR-Link containers {#CONTAINERS_SERVICE} version|<p>-</p>| `HTTP agent` | http_value_hrlink_health_containers_version_["{#CONTAINERS_SERVICE}"]<p>Update: 10m</p> |
|HR-Link service {#SERVICE_NAME} status|<p>-</p>| `HTTP agent` | http_value_hrlink_health_service_status_["{#SERVICE_NAME}"]<p>Update: 1m</p> |
|HR-Link service {#SERVICE_NAME} version|<p>-</p>| `HTTP agent` | http_value_hrlink_health_service_["{#SERVICE_NAME}"]<p>Update: 10m</p> |

## Triggers

|Name|Description|Expression| Priority    |
|----|-----------|----------|-------------|
|Portal HR-Link unavailable|<p>-</p>|<p>**Expression**: nodata(/Template_App_HR-Link/pingwebhrlink,5m)=1</p><p>**Recovery expression**: </p>| Warning     |
|HR-Link containers {#CONTAINERS_SERVICE} stopped|<p>-</p>|<p>**Expression**: sum(/HR-Link service template/http_value_hrlink_health_containers_status_["{#CONTAINERS_SERVICE}"],#5)>=5</p><p>**Recovery expression**: </p>| Warning     |
|HR-Link containers {#CONTAINERS_SERVICE} version changed|<p>-</p>|<p>**Expression**: last(/HR-Link service template/http_value_hrlink_health_containers_version_["{#CONTAINERS_SERVICE}"],#1)>0 and last(/HR-Link service template/http_value_hrlink_health_containers_version_["{#CONTAINERS_SERVICE}"]) <> last(/HR-Link service template/http_value_hrlink_health_containers_version_["{#CONTAINERS_SERVICE}"],#1)</p><p>**Recovery expression**: last(/HR-Link service template/http_value_hrlink_health_containers_version_["{#CONTAINERS_SERVICE}"]) = last(/HR-Link service template/http_value_hrlink_health_containers_version_["{#CONTAINERS_SERVICE}"],#1)</p>| information |
|HR-Link service {#SERVICE_NAME} stopped|<p>-</p>|<p>**Expression**: sum(/HR-Link service template/http_value_hrlink_health_service_status_["{#SERVICE_NAME}"],#5)>=5</p><p>**Recovery expression**: </p>| Warning     |
|HR-Link service {#SERVICE_NAME} version changed|<p>-</p>|<p>**Expression**: last(/HR-Link service template/http_value_hrlink_health_service_["{#SERVICE_NAME}"],#1)>0 and last(/HR-Link service template/http_value_hrlink_health_service_["{#SERVICE_NAME}"]) <> last(/HR-Link service template/http_value_hrlink_health_service_["{#SERVICE_NAME}"],#1)</p><p>**Recovery expression**: last(/HR-Link service template/http_value_hrlink_health_service_["{#SERVICE_NAME}"]) = last(/HR-Link service template/http_value_hrlink_health_service_["{#SERVICE_NAME}"],#1)</p>| information |

## Known issues

You can report problems here: https://github.com/VAGurko/zabbix_template_hrlink/issues

## References

Official website: https://hr-link.ru/

Official documentation: https://hr-link.omnidesk.ru/knowledge_base/