
# XenServer by script

## Overview

This template monitors XenServer and XCP-ng resource pools without installing any agent. The Zabbix server calls the XenServer XAPI endpoint directly through the `xenserver.collect` script item, then dependent items and low-level discovery rules extract pool, host, VM, and storage repository (SR) data.

## Requirements

- Zabbix version: 7.0 and higher.
- Network access from the Zabbix server (or proxy) to the XenServer master on HTTPS (port 443).
- A XenServer user with read access to the pool.

## Author

Marshall Wu

## Tested versions

This template has been tested on:
- Zabbix 7.0.32 (Docker, Zabbix server and web frontend)
- A two-host XenServer pool with three running VMs and eight SRs

## Configuration

> Zabbix should be configured according to the instructions in the [Templates out of the box](https://www.zabbix.com/documentation/7.0/manual/config/templates_out_of_the_box) section.

## Setup

1. Import `template_xenserver_by_script.yaml` into Zabbix (**Data collection → Templates → Import**).
2. Create a host for the pool and link the **XenServer by script** template to it.
3. Set the host macros described in [Macros used](#macros-used).

**Use the pool master as the URL.** XAPI on a pool slave returns `HOST_IS_SLAVE` and does not follow the redirect. If you point the host at a slave, data collection fails with that error. The error message includes the master address.

To customise the template without losing changes on re-import, use **Full clone** on the template and link the copy to your hosts.

## Macros used

|Name|Description|Default|
|----|-----------|-------|
|`{$XENSERVER.URL}`|XAPI base URL of the pool master, for example `https://10.0.0.10`.|`https://your-xenserver.example.com`|
|`{$XENSERVER.USER}`|XenServer user with read access.|`root`|
|`{$XENSERVER.PASSWORD}`|XenServer password. Stored as secret text.|(empty)|
|`{$XENSERVER.SR.UTIL.MAX}`|SR utilisation percentage above which the SR trigger fires.|`80`|

## Items

|Name|Description|
|----|-----------|
|Collect XenServer data|Single XAPI call that returns pool, host, VM, and SR data as JSON, plus RRD performance counters. Runs every 5 minutes with a 30-second timeout.|
|Pool hosts live / total|Number of live hosts and total hosts in the pool.|
|Pool VMs total / running|Number of VMs and running VMs in the pool.|
|API available|1 if the XAPI login and collection succeeded, 0 otherwise.|
|Host CPU utilisation (RRD)|Host CPU utilisation from RRD counters.|
|Host network received / transmitted (RRD)|Host network throughput from RRD counters.|
|Host RRD error|Error text returned when RRD counters cannot be read.|

## Discovery

|Name|Description|Item prototypes|Trigger prototypes|Graph prototypes|
|----|-----------|---------------|------------------|----------------|
|Host discovery|Discovers each pool host by UUID.|Live, CPU count, CPU utilisation (RRD), network received and transmitted (RRD), memory total, memory free|Host is not live|Memory|
|VM discovery|Discovers each VM by UUID.|Power state, vCPUs, memory max, CPU utilisation, memory actual|None|None|
|SR discovery|Discovers each storage repository by UUID.|Size, used, utilisation|Utilisation above `{$XENSERVER.SR.UTIL.MAX}`%|Size and used|

## Triggers

|Name|Severity|Description|
|----|--------|-----------|
|XenServer API is not available|High|The XAPI login or collection has failed.|
|XenServer data collection has stopped|High|No data from `xenserver.collect` for 15 minutes.|
|Pool host count changed|Info|The number of hosts in the pool has changed.|
|XenServer host performance counters unavailable|Warning|RRD counters could not be read.|
|Host {#NAME} is not live|High|A pool host is not live (discovered per host).|
|SR {#NAME} utilisation is above 80%|Warning|An SR is more than `{$XENSERVER.SR.UTIL.MAX}`% full (discovered per SR).|

## Dashboard

The template includes a dashboard, **XenServer pool overview**, with live counts of hosts and VMs. It appears on every host linked to the template.

## Troubleshooting

- **`HOST_IS_SLAVE`:** the URL points to a pool slave. Change `{$XENSERVER.URL}` to the master address shown in the error.
- **`API available` is 0:** check the URL, user, and password macros, and that the Zabbix server can reach the master on port 443.
- **SR discovery reports graph errors:** two or more SRs share a name, so their graph prototypes clash. Rename the SRs on the pool.
