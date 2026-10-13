# SentinelOne by HTTP

Author: Rémi Piazza ([remipiazza](https://github.com/remipiazza)).

## Overview

This template monitors the status of the SentinelOne agent of a machine through the SentinelOne Management Console REST API (v2.1) using the HTTP agent. It does not require any external script.

For each host, one master item queries the API for the agent whose computer name matches the host, and dependent items extract the metrics from the response.

## Requirements

Zabbix version: 7.0 and higher.

## Tested versions

This template has been tested on:

- SentinelOne Management Console API v2.1 (agent version 26.1.2.177)

## Configuration

> Zabbix should be configured according to the instructions in the [Templates out of the box](https://www.zabbix.com/documentation/current/en/manual/config/templates_out_of_the_box) section.

## Setup

### SentinelOne side

Nothing else needs to be configured in SentinelOne: no webhook, rule or policy change. The template only reads data through the API.

1. **Create a service user.** In the console, go to `Settings` -> `Users` -> `Service Users` (labelled `Policies and Settings` -> `User Management` -> `Service Users` in some console versions) and create a service user with the **Viewer** role and a scope covering the monitored sites.
2. **Generate the token.** Choose the longest expiration offered and note the date. Copy the token in full: it is displayed only once, and a truncated token is rejected with `401 Authentication Failed`.
3. **Check the token** before using it in Zabbix (on Windows PowerShell, use `curl.exe`):

   ```
   curl -s -H "Authorization: ApiToken <TOKEN>" "https://example.sentinelone.net/web/api/v2.1/agents?computerName=server01&limit=1"
   ```

   The response must contain `"totalItems":1`.
4. **Check the computer name.** The name looked up by Zabbix must match, exactly, the computer name of the agent in the endpoints list of the console.

### Zabbix side

1. Set the following user macros, preferably on a parent template or on the host group so that they are defined once:
   - `{$SENTINELONE.URL}` - the console URL, e.g., `https://example.sentinelone.net`;
   - `{$SENTINELONE.TOKEN}` - the API token (secret macro).
2. Make sure the **DNS name** field of the main interface of each host is filled. The part before the first dot is used as the computer name in SentinelOne (for example, `server01.example.local` is looked up as `server01`).
3. Link the template to the hosts.

### Token renewal

The API token expires on the date chosen when it was generated. Before this date, use `Actions` -> `Regenerate API Token` on the service user and update `{$SENTINELONE.TOKEN}`. If this option is not available on an expired account, use `Actions` -> `Copy User` to create a new service user with the same scope, then delete the old one. Menu labels may differ between console versions. If the token is not renewed in time, the "No data from API" trigger fires.

If the agent is not found in the console, the dependent items are left without data and the "Agent not found in console" trigger fires.

### Macros used

| Name | Description | Default |
| ---- | ----------- | ------- |
| {$SENTINELONE.URL} | SentinelOne Management Console URL without trailing slash, e.g., https://example.sentinelone.net. |  |
| {$SENTINELONE.TOKEN} | API token of a read-only (Viewer) service user. |  |
| {$SENTINELONE.API.PATH} | Sub-path of the SentinelOne REST API. | `/web/api/v2.1` |
| {$SENTINELONE.HTTP.PROXY} | HTTP proxy for the API request. If empty, no proxy is used. |  |
| {$SENTINELONE.INTERVAL} | Update interval of the API request. | `10m` |
| {$SENTINELONE.TIMEOUT} | Timeout of the API request. | `15s` |
| {$SENTINELONE.NODATA_TIMEOUT} | Period without data after which the "No data from API" trigger fires. | `30m` |
| {$SENTINELONE.LAST_ACTIVE.MAX.WARN} | Maximum time since the last agent communication before the "No recent activity" trigger fires. | `1h` |

### Items

| Name | Description | Type | Key and additional info |
| ---- | ----------- | ---- | ----------------------- |
| SentinelOne: Get agent | Queries the SentinelOne API for the agent whose computer name matches the short name (part before the first dot) of the DNS name of the host interface. The raw response feeds all dependent items. | HTTP agent | sentinelone.agent.get |
| SentinelOne: Agents found | Number of agents returned by the console for this host (pagination.totalItems). 0 means the machine is not in the console, more than 1 means duplicate agents. Not discarded with a heartbeat because the "No data from API" trigger relies on it. | Dependent item | sentinelone.agent.found<br>**Preprocessing**<br>JSON Path: `$.pagination.totalItems` (on fail: discard value) |
| SentinelOne: Agent active | Whether the agent is currently connected to the management console (isActive). | Dependent item | sentinelone.agent.active<br>**Preprocessing**<br>JSON Path: `$.data[0].isActive` (on fail: discard value)<br>Boolean to decimal<br>Discard unchanged with heartbeat: `1h` |
| SentinelOne: Network status | Network state reported by the console (networkStatus). The value "disconnected" indicates that the machine is isolated from the network by SentinelOne (network quarantine). Unrecognized values are stored as 0. | Dependent item | sentinelone.agent.network_status<br>**Preprocessing**<br>JSON Path: `$.data[0].networkStatus` (on fail: discard value)<br>JavaScript: `see the template`<br>Discard unchanged with heartbeat: `1h` |
| SentinelOne: Last active | Date of the last communication between the agent and the console (lastActiveDate). | Dependent item | sentinelone.agent.last_active<br>**Preprocessing**<br>JSON Path: `$.data[0].lastActiveDate` (on fail: discard value)<br>JavaScript: `see the template` |
| SentinelOne: Infected | Whether the agent reports the machine as infected (infected). | Dependent item | sentinelone.agent.infected<br>**Preprocessing**<br>JSON Path: `$.data[0].infected` (on fail: discard value)<br>Boolean to decimal<br>Discard unchanged with heartbeat: `1h` |
| SentinelOne: Active threats | Number of active threats on the machine (activeThreats). | Dependent item | sentinelone.agent.threats<br>**Preprocessing**<br>JSON Path: `$.data[0].activeThreats` (on fail: discard value)<br>Discard unchanged with heartbeat: `1h` |
| SentinelOne: Operational state | Operational state of the agent (operationalState). "na" is the normal state; any other value means the agent was disabled, fully or partially, from the console. Observed values: na, partially_disabled; fully_disabled and disabled_error are mapped as well. Unrecognized values are stored as 0. | Dependent item | sentinelone.agent.operational_state<br>**Preprocessing**<br>JSON Path: `$.data[0].operationalState` (on fail: discard value)<br>JavaScript: `see the template`<br>Discard unchanged with heartbeat: `1h` |
| SentinelOne: Operational state expiration | Date at which a temporary disabled state ends (operationalStateExpiration). 0 if there is no expiration. | Dependent item | sentinelone.agent.operational_state.expiration<br>**Preprocessing**<br>JSON Path: `$.data[0].operationalStateExpiration` (on fail: discard value)<br>JavaScript: `see the template` |
| SentinelOne: Agent version | Agent version (agentVersion). | Dependent item | sentinelone.agent.version<br>**Preprocessing**<br>JSON Path: `$.data[0].agentVersion` (on fail: discard value)<br>Discard unchanged with heartbeat: `1h` |
| SentinelOne: Agent up to date | Whether the agent runs the latest version available in the console (isUpToDate). | Dependent item | sentinelone.agent.up_to_date<br>**Preprocessing**<br>JSON Path: `$.data[0].isUpToDate` (on fail: discard value)<br>Boolean to decimal<br>Discard unchanged with heartbeat: `1h` |

### Triggers

| Name | Description | Expression | Severity | Dependencies and additional info |
| ---- | ----------- | ---------- | -------- | -------------------------------- |
| SentinelOne: No data from API | The API request has not returned data for the configured period. Possible causes: expired or revoked API token, wrong console URL or API path, network or proxy issue, API rate limiting. Check the error of the "SentinelOne: Get agent" item. | `nodata(/SentinelOne by HTTP/sentinelone.agent.found,{$SENTINELONE.NODATA_TIMEOUT})=1` | Warning |  |
| SentinelOne: Agent not found in console | No agent with this name exists in the console: the agent is not installed, was removed or decommissioned, the machine was renamed, or the DNS name of the host does not match the SentinelOne computer name. Check the DNS name of the host interface and the console inventory. | `last(/SentinelOne by HTTP/sentinelone.agent.found)=0` | High | **Depends on**:<br>SentinelOne: No data from API |
| SentinelOne: Duplicate agents in console | More than one agent has the same name in the console; only the first one is read. Remove the stale entry in the console. | `last(/SentinelOne by HTTP/sentinelone.agent.found)>1` | Info |  |
| SentinelOne: Active threat detected | The agent reports an infected machine or active threats. Review the threat in the SentinelOne console and follow the incident response procedure. | `last(/SentinelOne by HTTP/sentinelone.agent.infected)=1 or last(/SentinelOne by HTTP/sentinelone.agent.threats)>0` | High |  |
| SentinelOne: Agent is not active | The agent is not connected to the console. The agent service may be stopped, the machine powered off, or the connection to the console blocked. Check the machine and the agent service. | `last(/SentinelOne by HTTP/sentinelone.agent.active)=0 and last(/SentinelOne by HTTP/sentinelone.agent.found)>0` | Average | **Depends on**:<br>SentinelOne: Agent not found in console |
| SentinelOne: Machine is network-quarantined | The machine is isolated from the network by SentinelOne (network quarantine). Check that the isolation is intended and release it from the console when appropriate. | `last(/SentinelOne by HTTP/sentinelone.agent.network_status)=3 and last(/SentinelOne by HTTP/sentinelone.agent.active)=1` | High |  |
| SentinelOne: Agent is disabled | The agent was disabled, fully or partially, from the console, so the machine may be unprotected while the agent still reports to the console. Check who disabled it and re-enable it; the "Operational state expiration" item shows when a temporary state ends. | `last(/SentinelOne by HTTP/sentinelone.agent.operational_state)<>1 and last(/SentinelOne by HTTP/sentinelone.agent.found)>0` | High |  |
| SentinelOne: No recent activity | The agent has not communicated with the console for longer than the period defined by {$SENTINELONE.LAST_ACTIVE.MAX.WARN}. Check the machine, the agent service and the connectivity. | `(now()-last(/SentinelOne by HTTP/sentinelone.agent.last_active))>{$SENTINELONE.LAST_ACTIVE.MAX.WARN} and last(/SentinelOne by HTTP/sentinelone.agent.found)>0` | Warning | **Depends on**:<br>SentinelOne: Agent is not active |
| SentinelOne: Agent is not up to date | The agent is not at the latest version available in the console. Plan an upgrade according to your agent upgrade policy. | `last(/SentinelOne by HTTP/sentinelone.agent.up_to_date)=0 and last(/SentinelOne by HTTP/sentinelone.agent.version)<>"" and last(/SentinelOne by HTTP/sentinelone.agent.found)>0` | Info |  |

### Dashboards

The template includes the dashboard **SentinelOne: Agent overview**, which shows the main agent states (active, network, operational state, infection, threats, version, last activity) for the host.

### Tags

- Template: `class: software`, `subclass: security`, `target: sentinelone`.
- Items: `component` (`raw`, `application` or `network`) and `target: sentinelone`.
- Triggers: `scope` (`security`, `availability` or `notice`) and `target: sentinelone`.

## Feedback

Please report any issues or suggestions through the [Zabbix community templates repository](https://github.com/zabbix/community-templates), mentioning the template name and its author (@remipiazza).

You can also discuss this template on the [Zabbix forum](https://www.zabbix.com/forum).

This template is published under the MIT license.
