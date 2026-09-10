# HPE StoreOnce Gen4 by HTTP

Official Zabbix template for **HPE StoreOnce Gen4 by HTTP**.

| Property | Value |
| :--- | :--- |
| **Supported Zabbix Version** | `7.0` or higher |
| **Author** | [Snis](https://github.com/snis/zabbix-community-templates) |
| **Repository** | [github.com/snis/zabbix-community-templates](https://github.com/snis/zabbix-community-templates) |
| **License** | [MIT](https://opensource.org/licenses/MIT) |

## Overview

Template for monitoring HPE StoreOnce Gen4 appliances (3620, 3640, 5200, 5250, 5650, VSA)
running software version 4.x via REST API.

Features:
- Single script master item with Bearer token authentication and graceful session logout
- Two-Tier monitoring architecture:
  * Tier 1: Current State monitoring of the 5 core dashboard pillars (Data Services, Licensing, Storage, Hardware, Remote Support)
  * Tier 2: Diagnostic Event Log via filtered Active Alerts LLD (root cause failure discovery)
- System & hardware inventory mapped to Zabbix Host Inventory
- Storage capacity, space utilization, and deduplication ratio tracking
- Low-level discovery for Catalyst Stores with capacity and status monitoring
- Low-level discovery for Power Supplies, Fans, and Storage Controllers with battery status
- Standalone graphs for capacity, space utilization, deduplication, and active alerts
- Interactive 2-page dashboard with high-level KPI cards, gauge widgets, and problem view

Setup:
1. Assign template to host.
2. Configure {$HPE.STOREONCE.USER} and {$HPE.STOREONCE.PASSWORD} macros.
3. Verify {$HPE.STOREONCE.API.HOST}, {$HPE.STOREONCE.API.PORT}, and {$HPE.STOREONCE.API.SCHEME}.

## Setup & Configuration

1. Import the template into your Zabbix server frontend (`Data collection -> Templates -> Import`).
2. Link the template to target host(s).
3. Configure the user macros listed below on host or template level.

## Required & Optional Macros

| Macro | Default Value | Description |
| :--- | :--- | :--- |
| `{$HPE.STOREONCE.API.SCHEME}` | `https` | API scheme (http or https) |
| `{$HPE.STOREONCE.API.PORT}` | `443` | API port |
| `{$HPE.STOREONCE.API.HOST}` | `{HOST.CONN}` | API hostname or IP |
| `{$HPE.STOREONCE.USER}` | `SVC_zabbix` | StoreOnce API service user |
| `{$HPE.STOREONCE.PASSWORD}` | `` | StoreOnce API service password |
| `{$HPE.STOREONCE.DATA.TIMEOUT}` | `20s` | HTTP request timeout for API calls |
| `{$HPE.STOREONCE.HTTP_PROXY}` | `` | HTTP proxy string (optional) |
| `{$HPE.STOREONCE.CAPACITY.WARN}` | `85` | Storage capacity utilization warning threshold in % |
| `{$HPE.STOREONCE.CAPACITY.CRIT}` | `95` | Storage capacity utilization critical threshold in % |
| `{$HPE.STOREONCE.CATSTORE.LLD.FILTER.MATCHES}` | `.*` | Regex filter to include Catalyst stores |
| `{$HPE.STOREONCE.CATSTORE.LLD.FILTER.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Regex filter to exclude Catalyst stores |
| `{$HPE.STOREONCE.ALERT.LLD.FILTER.MATCHES}` | `.*` | Regex filter to include Active Alerts by name |
| `{$HPE.STOREONCE.ALERT.LLD.FILTER.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Regex filter to exclude Active Alerts by name |

## Collected Metrics

This template collects **40** master/dependent metrics directly, plus discovered metrics from **5** discovery rules:

| Item Name | Key | Type | Description |
| :--- | :--- | :--- | :--- |
| HPE StoreOnce: Get data | `hpe.storeonce.get.data` | `SCRIPT` | Retrieves authentication token, fetches all monitoring endpoints, and releases session token. |
| HPE StoreOnce: API data collection errors | `hpe.storeonce.api.errors` | `DEPENDENT` | Errors encountered during API data retrieval. |
| HPE StoreOnce: System name | `hpe.storeonce.system.name` | `DEPENDENT` | System name |
| HPE StoreOnce: System model | `hpe.storeonce.system.model` | `DEPENDENT` | System model |
| HPE StoreOnce: System SKU | `hpe.storeonce.system.sku` | `DEPENDENT` | System SKU |
| HPE StoreOnce: System serial number | `hpe.storeonce.system.serial` | `DEPENDENT` | System serial number |
| HPE StoreOnce: System location | `hpe.storeonce.system.location` | `DEPENDENT` | System location |
| HPE StoreOnce: System contact | `hpe.storeonce.system.contact` | `DEPENDENT` | System contact |
| HPE StoreOnce: Vendor | `hpe.storeonce.system.vendor` | `DEPENDENT` | Storage vendor name. |
| HPE StoreOnce: Software version | `hpe.storeonce.system.sw_version` | `DEPENDENT` | StoreOnce software version. |
| HPE StoreOnce: Operational mode | `hpe.storeonce.system.operational_mode` | `DEPENDENT` | Operational mode of the StoreOnce appliance. |
| HPE StoreOnce: Server management state | `hpe.storeonce.system.server_status` | `DEPENDENT` | Management server status state (ready, initializing, restarting, etc.). |
| HPE StoreOnce: Server management readiness | `hpe.storeonce.system.server_status_percent` | `DEPENDENT` | Server management readiness |
| HPE StoreOnce: Hardware server model | `hpe.storeonce.hw.server_model` | `DEPENDENT` | Hardware server model |
| HPE StoreOnce: Hardware BIOS firmware version | `hpe.storeonce.hw.bios_version` | `DEPENDENT` | Hardware BIOS firmware version |
| HPE StoreOnce: iLO IPv4 address | `hpe.storeonce.hw.ilo_ip` | `DEPENDENT` | iLO IPv4 address |
| HPE StoreOnce: iLO model | `hpe.storeonce.hw.ilo_model` | `DEPENDENT` | iLO model |
| HPE StoreOnce: Hardware overall status | `hpe.storeonce.hw.overall_status` | `DEPENDENT` | Hardware overall report status. |
| HPE StoreOnce: Data services health status | `hpe.storeonce.dataservices.health` | `DEPENDENT` | Overall health level of StoreOnce Data Services (D2D Manager). |
| HPE StoreOnce: Data services operational state | `hpe.storeonce.dataservices.state` | `DEPENDENT` | Data services operational state |
| HPE StoreOnce: Licensing status | `hpe.storeonce.licensing.status` | `DEPENDENT` | Overall licensing status of the StoreOnce appliance. |
| HPE StoreOnce: License in grace period | `hpe.storeonce.licensing.grace_period` | `DEPENDENT` | Whether the appliance is running in a license grace period (1 = True, 0 = False). |
| HPE StoreOnce: Licensing: Licensed capacity | `hpe.storeonce.licensing.capacity_bytes` | `DEPENDENT` | Licensing: Licensed capacity |
| HPE StoreOnce: Licensing: Status summary | `hpe.storeonce.licensing.summary` | `DEPENDENT` | Licensing: Status summary |
| HPE StoreOnce: Remote support status | `hpe.storeonce.support.status` | `DEPENDENT` | Connection status to HPE Remote Support servers. |
| HPE StoreOnce: Remote support status details | `hpe.storeonce.support.details` | `DEPENDENT` | Detailed message regarding HPE Remote Support connection. |
| HPE StoreOnce: Storage: Configured capacity | `hpe.storeonce.storage.configured_bytes` | `DEPENDENT` | Storage: Configured capacity |
| HPE StoreOnce: Storage: Used space | `hpe.storeonce.storage.used_bytes` | `DEPENDENT` | Storage: Used space |
| HPE StoreOnce: Storage: Free space | `hpe.storeonce.storage.free_bytes` | `DEPENDENT` | Storage: Free space |
| HPE StoreOnce: Storage: Overall deduplication ratio | `hpe.storeonce.storage.dedupe_ratio` | `DEPENDENT` | Storage: Overall deduplication ratio |
| HPE StoreOnce: Storage: Overall capacity saved | `hpe.storeonce.storage.saved_bytes` | `DEPENDENT` | Storage: Overall capacity saved |
| HPE StoreOnce: Storage: Overall capacity saved ratio | `hpe.storeonce.storage.saved_percent` | `DEPENDENT` | Storage: Overall capacity saved ratio |
| HPE StoreOnce: Storage: Overall user data stored | `hpe.storeonce.storage.user_bytes` | `DEPENDENT` | Storage: Overall user data stored |
| HPE StoreOnce: Storage space utilization | `hpe.storeonce.storage.space_utilization` | `DEPENDENT` | Calculated local storage space utilization percentage. |
| HPE StoreOnce: Storage health status | `hpe.storeonce.storage.health` | `DEPENDENT` | Reported health status of local storage. |
| HPE StoreOnce: Storage: Simplified status | `hpe.storeonce.storage.simplified_status` | `DEPENDENT` | Storage: Simplified status |
| HPE StoreOnce: Alerts: Total logged | `hpe.storeonce.alerts.total` | `DEPENDENT` | Alerts: Total logged |
| HPE StoreOnce: Alerts active total count | `hpe.storeonce.alerts.active.total` | `DEPENDENT` | Total count of active uncleared alerts on the appliance. |
| HPE StoreOnce: Alerts active critical count | `hpe.storeonce.alerts.active.critical` | `DEPENDENT` | Count of active alerts with Critical severity. |
| HPE StoreOnce: Alerts active warning count | `hpe.storeonce.alerts.active.warning` | `DEPENDENT` | Count of active alerts with Warning severity. |

## Discovery Rules

| Discovery Rule | Key | Item Prototypes | Trigger Prototypes |
| :--- | :--- | :--- | :--- |
| Catalyst stores discovery | `hpe.storeonce.cat.discovery` | 6 | 2 |
| Active alerts discovery | `hpe.storeonce.alerts.discovery` | 1 | 2 |
| Power supplies discovery | `hpe.storeonce.hw.psu.discovery` | 1 | 1 |
| Fans discovery | `hpe.storeonce.hw.fan.discovery` | 1 | 1 |
| Storage controllers discovery | `hpe.storeonce.hw.ctrl.discovery` | 2 | 2 |

## Triggers

The template includes **12** standalone triggers and **8** trigger prototypes:

| Trigger Name | Severity | Operational Data |
| :--- | :--- | :--- |
| HPE StoreOnce: There are errors in API data collection | `WARNING` | Errors: {ITEM.LASTVALUE1} |
| HPE StoreOnce: Software version has changed | `INFO` |  |
| HPE StoreOnce: Operational mode is not PRODUCTION | `WARNING` |  |
| HPE StoreOnce: Server state is not ready | `HIGH` |  |
| HPE StoreOnce: Hardware overall status is not OK | `HIGH` |  |
| HPE StoreOnce: Data services health is not OK | `HIGH` | Health: {ITEM.LASTVALUE1} |
| HPE StoreOnce: Licensing status is not GOOD | `WARNING` | Status: {ITEM.LASTVALUE1} |
| HPE StoreOnce: License is in grace period | `WARNING` |  |
| HPE StoreOnce: Remote support connection issue | `WARNING` | Status: {ITEM.LASTVALUE1} |
| HPE StoreOnce: Storage capacity utilization is high | `WARNING` | Current: {ITEM.LASTVALUE1} |
| HPE StoreOnce: Storage capacity utilization is critical | `HIGH` | Current: {ITEM.LASTVALUE1} |
| HPE StoreOnce: Storage health issue detected | `HIGH` | Status: {ITEM.LASTVALUE1} |
| Catalyst store [{#STORE.NAME}]: Store status is not Online | `HIGH` | Status: {ITEM.LASTVALUE1} |
| Catalyst store [{#STORE.NAME}]: Store health is not OK | `HIGH` | Health: {ITEM.LASTVALUE1} |
| Active Critical Alert on [{#ALERT.RESOURCE}]: {#ALERT.DESC} | `HIGH` | Severity: Critical, Event: {#ALERT.EVENTCODE} |
| Active Warning Alert on [{#ALERT.RESOURCE}]: {#ALERT.DESC} | `WARNING` | Severity: Warning, Event: {#ALERT.EVENTCODE} |
| PSU [{#PSU.NAME}]: Status is not OK | `HIGH` | Status: {ITEM.LASTVALUE1} |
| Fan [{#FAN.NAME}]: Status is not OK | `HIGH` | Status: {ITEM.LASTVALUE1} |
| Storage Controller [{#CTRL.NAME}]: Status is not OK | `HIGH` | Status: {ITEM.LASTVALUE1} |
| Storage Controller [{#CTRL.NAME}]: Backup power is not fully charged | `WARNING` | Status: {ITEM.LASTVALUE1} |

## Visualizations

- **Dashboards (1):**
  * `HPE StoreOnce: Overview` (Pages: System & Storage Overview, Catalyst & Hardware Subsystems)
- **Standalone Graphs (4):**
  * `HPE StoreOnce: Storage capacity & space usage`
  * `HPE StoreOnce: Storage space utilization`
  * `HPE StoreOnce: Deduplication and savings`
  * `HPE StoreOnce: Active alerts count`

## License

This template is published under the [MIT License](https://opensource.org/licenses/MIT).
