
# Huawei Wireless Access Controller (AC) Template

## Overview

This Zabbix template is designed to monitor Huawei Wireless Access Controllers (ACs) and their associated Access Points (APs). By leveraging the **HUAWEI-WLAN-AP-MIB** and **HUAWEI-WLAN-AP-RADIO-MIB**, it provides comprehensive monitoring capabilities for wireless network infrastructure. All MIB items are referenced using the full OIDs, so no template importing is needed.
### Purpose

This template is intended to simplify the deployment and monitoring of Huawei wireless infrastructures within Zabbix environments. It provides a ready-to-use solution for maintaining optimal performance and diagnosing issues across both ACs and their managed APs.


## Key Features

- **WLC Network Interface Monitoring**:  
  Uses the "Huawei VRP by SNMP" template for monitoring WLC network interfaces.
  
- **Automatic AP Discovery**:  
  The template automatically discovers all Access Points (APs) managed by the controller and provides in-depth monitoring of each one, including:
  - Model and hardware details
  - Operational status
  - Connected clients
  - And other relevant performance and operational metrics


## Requirements

- **Zabbix Version**: 7.x or later
- **SNMP Configuration**: Ensure SNMP is enabled on the Huawei WLC with the appropriate community or credentials.


## Setup Instructions

1. **Linked Template**:  
    The "Huawei VRP by SNMP" template should already be included with your Zabbix installation. If it is not, make sure you download it from the files directory and import it into Zabbix.
    
2. **Import the Template**:  
    Import the `template_huawei_wireless_ac.yaml` file into your Zabbix environment.
    
3. **Configure SNMP**:  
    Ensure the Huawei AC is accessible via SNMP and that the correct community string or credentials are configured in Zabbix.
    
4. **Enable Discovery Rules**:  
    Discovery rules for APs will automatically detect and monitor all connected APs.


## Author

João Pires (www.noshut.pt)  
Feel free to use, adapt, and improve this template. Contributions and feedback from the community are always welcome!


## License

This template is distributed under the [MIT License](https://opensource.org/licenses/MIT).


## Macros Used

| Macro                      | Value | Description                       |
| -------------------------- | ----- | --------------------------------- |
| {$AP_STATE_CRIT_STATUS}    | 4     | Critical AP state                 |
| {$AP_STATE_NORMAL_STATUS}  | 8     | Normal AP state                   |
| {$AP_TEMP_MAX_CRIT_STATUS} | 50    | Maximum critical temperature (°C) |
| {$AP_TEMP_MIN_CRIT_STATUS} | -10   | Minimum critical temperature (°C) |
| {$SNMP_COMMUNITY}          |       | SNMP Community                    |


## Items Collected

| Name           | Key            | Type       | Description                  |
| -------------- | -------------- | ---------- | ---------------------------- |
| ac-users-2.4   | ac-users-2.4   | SNMP_AGENT | Total clients on 2.4GHz band |
| ac-users-5     | ac-users-5     | SNMP_AGENT | Total clients on 5GHz band   |
| ac-users-total | ac-users-total | SNMP_AGENT | Total connected clients      |


## Discovery Rules

| Name         | Key              | Description                    |
| ------------ | ---------------- | ------------------------------ |
| AP Discovery | wlc.ap.discovery | Discover APs managed by the AC |


## AP Discovery Items Prototypes

| Name                                            | Key                                                          | Type       | Units   | Description                         |
| ----------------------------------------------- | ------------------------------------------------------------ | ---------- | ------- | ----------------------------------- |
| ap-2.4GHz-channel-interference-rate-[{#APNAME}] | ap-2.4GHz-channel-interference-rate-[{#APNAME}-{#SNMPINDEX}] | SNMP_AGENT | %       | 2.4GHz channel interference rate    |
| ap-2.4GHz-radio-noise-[{#APNAME}]               | ap-2.4GHz-radio-noise-[{#APNAME}-{#SNMPINDEX}]               | SNMP_AGENT | dBm     | 2.4GHz radio interference noise     |
| ap-5GHz-channel-interference-rate-[{#APNAME}]   | ap-5GHz-channel-interference-rate-[{#APNAME}-{#SNMPINDEX}]   | SNMP_AGENT | %       | 5GHz channel interference rate      |
| ap-5GHz-radio-noise-[{#APNAME}]                 | ap-5GHz-radio-noise-[{#APNAME}-{#SNMPINDEX}]                 | SNMP_AGENT | dBm     | 5GHz radio interference noise       |
| ap-clients-5GHz-[{#APNAME}]                     | ap-clientes-5-[{#APNAME}-{#SNMPINDEX}]                       | SNMP_AGENT | Clients | Number of clients on 5GHz band      |
| ap-clients-2.4GHz-[{#APNAME}]                   | ap-clients-2.4GHz-[{#APNAME}-{#SNMPINDEX}]                   | SNMP_AGENT | Clients | Number of clients on 2.4GHz band    |
| ap-clients-[{#APNAME}]                          | ap-clients-[{#APNAME}-{#SNMPINDEX}]                          | SNMP_AGENT | Clients | Total number of clients connected   |
| ap-cpu-[{#APNAME}]                              | ap-cpu-[{#APNAME}-{#SNMPINDEX}]                              | SNMP_AGENT | %       | AP CPU usage                        |
| ap-eth-download[{#APNAME}]                      | ap-eth-download[{#APNAME}-{#SNMPINDEX}]                      | SNMP_AGENT | bps     | Ethernet downstream rate            |
| ap-eth-upload[{#APNAME}]                        | ap-eth-upload[{#APNAME}-{#SNMPINDEX}]                        | SNMP_AGENT | bps     | Ethernet upstream rate              |
| ap-group-[{#APNAME}]                            | ap-group-[{#APNAME}-{#SNMPINDEX}]                            | SNMP_AGENT |         | AP group information                |
| ap-id-[{#APNAME}]                               | ap-id-[{#APNAME}-{#SNMPINDEX}]                               | SNMP_AGENT |         | AP identifier                       |
| ap-latitude-[{#APNAME}]                         | ap-latitude-[{#APNAME}-{#SNMPINDEX}]                         | SNMP_AGENT |         | AP latitude information             |
| ap-longitude-[{#APNAME}]                        | ap-longitude-[{#APNAME}-{#SNMPINDEX}]                        | SNMP_AGENT |         | AP longitude information            |
| ap-mac-[{#APNAME}]                              | ap-MAC-[{#APNAME}-{#SNMPINDEX}]                              | SNMP_AGENT |         | AP MAC address                      |
| ap-memory-[{#APNAME}]                           | ap-memory-[{#APNAME}-{#SNMPINDEX}]                           | SNMP_AGENT | %       | AP memory usage                     |
| ap-model-[{#APNAME}]                            | ap-model-[{#APNAME}-{#SNMPINDEX}]                            | SNMP_AGENT |         | AP model                            |
| ap-name-[{#APNAME}]                             | ap-NAME-[{#APNAME}-{#SNMPINDEX}]                             | SNMP_AGENT |         | AP name                             |
| ap-remote-neighbor-interface-id-[{#APNAME}]     | ap-remote-neighbor-interface-id-[{#APNAME}-{#SNMPINDEX}]     | SNMP_AGENT |         | Remote neighbor interface ID (LLDP) |
| ap-remote-neighbor-system-name-[{#APNAME}]      | ap-remote-neighbor-system-name-[{#APNAME}-{#SNMPINDEX}]      | SNMP_AGENT |         | Remote neighbor system name (LLDP)  |
| ap-state-name-[{#APNAME}]                       | ap-state-name-[{#APNAME}-{#SNMPINDEX}]                       | SNMP_AGENT |         | AP state in text format             |
| ap-temp-[{#APNAME}]                             | ap-temp-[{#APNAME}-{#SNMPINDEX}]                             | SNMP_AGENT | ºC      | AP temperature                      |


## AP Discovery Triggers Prototypes

| Name                                        | Expression                                                                      | Severity | Description                 |
| ------------------------------------------- | ------------------------------------------------------------------------------- | -------- | --------------------------- |
| AP {#APNAME} State is different from normal | `last(/WLC Huawei/ap-state-[{#APNAME}-{#SNMPINDEX}])={$AP_STATE_CRIT_STATUS}`   | Average  | Indicates abnormal AP state |
| AP {#APNAME} Temperature above critical     | `last(/WLC Huawei/ap-temp-[{#APNAME}-{#SNMPINDEX}])>{$AP_TEMP_MAX_CRIT_STATUS}` | Warning  | High AP temperature         |


## AP Discovery Graph Prototypes

| Name                       | Items Included                               | Description                                      |
| -------------------------- | -------------------------------------------- | ------------------------------------------------ |
| AP-Clients-[{#APNAME}]     | - ap-clients-[{#APNAME}-{#SNMPINDEX}]        | Graph showing total clients connected to the AP. |
|                            | - ap-clients-2.4GHz-[{#APNAME}-{#SNMPINDEX}] | Clients on 2.4GHz band.                          |
|                            | - ap-clientes-5-[{#APNAME}-{#SNMPINDEX}]     | Clients on 5GHz band.                            |
| AP-Temperature-[{#APNAME}] | - ap-temp-[{#APNAME}-{#SNMPINDEX}]           | Displays AP temperature.                         |
| AP-Traffic-[{#APNAME}]     | - ap-eth-download[{#APNAME}-{#SNMPINDEX}]    | Ethernet downstream traffic.                     |
|                            | - ap-eth-upload[{#APNAME}-{#SNMPINDEX}]      | Ethernet upstream traffic.                       |
