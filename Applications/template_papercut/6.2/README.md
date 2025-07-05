# Zabbix template for PaperCut NG and PaperCut MF monitoring

## Overview

The template to monitor PaperCut MF and PaperCut NG by Zabbix 6.x using HTTP agent.

## Setup

> See [Zabbix templates importing](https://www.zabbix.com/documentation/5.2/manual/xml_export_import/templates#importing) for basic instructions on how to import a template.

1. Create a new host
2. Set/change the host macros required for PaperCut authentication:
```text
{$PAPERCUT_AUTH_KEY}
{$PAPERCUT_PORT}
```
3. Link the template to host created early

## Zabbix configuration

No specific Zabbix configuration is required

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$PAPERCUT_AUTH_KEY} |<p>PaperCut authentication key. (see http://localhost:9191/app?service=page/OptionsAdvanced on PaperCut server)</p> | |
|{$PAPERCUT_PORT} |<p>Port on which PaperCut is listening.</p> |`9191` |
|{$PAPERCUT.NODATA_TIMEOUT} |<p>Timeout after which no data trigger will be executed.</p> |`30m` |

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PaperCut device discovery|Discovery of all printer devices from PaperCut|Dependent_item|papercut.device.discovery <p>**Preprocessing**:<br>- JSONPath: `$.devices`<br>- DISCARD_UNCHANGED_HEARTBEAT: `6h`</p> |
|PaperCut printer discovery|Discovery of all printers from PaperCut|Dependent_item|papercut.printer.discovery <p>**Preprocessing**:<br>- JSONPath: `$.printers`<br>- DISCARD_UNCHANGED_HEARTBEAT: `6h`</p> |

## Items collected

|Name|Description|Type|Key and additional info|
|----------|--------------|----------|----------|
|PaperCut API: Devices| |HTTP_Agent|papercut.api.devices|
|PaperCut API: Monitoring| |HTTP_Agent|papercut.api|
|PaperCut API: Printers| |HTTP_Agent|papercut.api.printers|
|PaperCut Database Active Connections| |Dependent_item|papercut.database.activeConnections <p>**Preprocessing**:<br>- JSONPath: `$.database.activeConnections`</p> |
|PaperCut Database Max Connections| |Dependent_item|papercut.database.maxConnections <p>**Preprocessing**:<br>- JSONPath: `$.database.maxConnections`</p> |
|PaperCut Database Status| |Dependent_item|papercut.database.status <p>**Preprocessing**:<br>- JSONPath: `$.database.status`</p> |
|PaperCut Devices Count| |Dependent_item|papercut.devices.total <p>**Preprocessing**:<br>- JSONPath: `$.devices.count`</p> |
|PaperCut Devices in Error| |Dependent_item|papercut.devices.inErrorCount <p>**Preprocessing**:<br>- JSONPath: `$.devices.inErrorCount`</p> |
|PaperCut Devices in Error Percentage| |Dependent_item|papercut.devices.inErrorPercentage <p>**Preprocessing**:<br>- JSONPath: `$.devices.inErrorPercentage`</p> |
|PaperCut Disk Space Free| |Dependent_item|papercut.system.diskspace.free <p>**Preprocessing**:<br>- JSONPath: `$.applicationServer.systemMetrics.diskSpaceFreeMB`<br>- Custom multiplier: `1024000`</p> |
|PaperCut DiskSpace Used| |Dependent_item|papercut.system.diskspace.used <p>**Preprocessing**:<br>- JSONPath: `$.applicationServer.systemMetrics.diskSpaceUsedPercentage`</p> |
|PaperCut Held Jobs Count| |Dependent_item|papercut.printers.heldJobCountTotal <p>**Preprocessing**:<br>- JSONPath: `$.printers.heldJobCountTotal`</p> |
|PaperCut Held Jobs Count Max| |Dependent_item|papercut.printers.heldJobsCountMax <p>**Preprocessing**:<br>- JSONPath: `$.printers.heldJobsCountMax`</p> |
|PaperCut JVM Memory Used Percentage| |Dependent_item|papercut.system.jvmMemoryUsed <p>**Preprocessing**:<br>- JSONPath: `$.applicationServer.systemMetrics.jvmMemoryUsedPercentage`</p> |
|PaperCut printed pages in the last 60 minutes| |HTTP_Agent|papercut.api.stats.recentPagesCount <p>**Preprocessing**:<br>- JSONPath: `$.recentPagesCount`</p> |
|PaperCut Printers Count| |Dependent_item|papercut.printers.total <p>**Preprocessing**:<br>- JSONPath: `$.printers.count`</p> |
|PaperCut Printers in Error| |Dependent_item|papercut.printers.inErrorCount <p>**Preprocessing**:<br>- JSONPath: `$.printers.inErrorCount`</p> |
|PaperCut Printers in Error Percentage| |Dependent_item|papercut.printers.inErrorPercentage <p>**Preprocessing**:<br>- JSONPath: `$.printers.inErrorPercentage`</p> |
|PaperCut Uptime| |Dependent_item|papercut.system.uptimeHours <p>**Preprocessing**:<br>- JSONPath: `$.applicationServer.systemMetrics.uptimeHours`</p> |
|PaperCut Valid License| |Dependent_item|papercut.license.valid <p>**Preprocessing**:<br>- JSONPath: `$.license.valid`</p> |
|PaperCut Valid License Remaining Days| |Dependent_item|papercut.license.upgradeAssuranceRemainingDays <p>**Preprocessing**:<br>- JSONPath: `$.license.upgradeAssuranceRemainingDays`<br>- Custom multiplier: `86400`</p> |
|PaperCut Version| |Dependent_item|papercut.system.version <p>**Preprocessing**:<br>- JSONPath: `$.applicationServer.systemInfo.version`</p> |
|Percentage Active Connections| |Calculated|papercut.database.activeConnections.percentage|
|Device {#DEVICE_NAME}: Status| |Dependent_item|papercut.device.status["{#DEVICE_NAME}"] <p>**Preprocessing**:<br>- JSONPath: `$.devices[?(@.name == "{#DEVICE_NAME}")].state.status.first()`</p> |
|Device {#DEVICE_NAME}: Status Description| |Dependent_item|papercut.device.status.description["{#DEVICE_NAME}"] <p>**Preprocessing**:<br>- JSONPath: `$.devices[?(@.name == "{#DEVICE_NAME}")].state.statusDescription.first()`</p> |
|Printer {#PRINTER_NAME}: Held Jobs| |Dependent_item|papercut.printer.heldjobs["{#PRINTER_NAME}"] <p>**Preprocessing**:<br>- JSONPath: `$.printers[?(@.name == "{#PRINTER_NAME}")].heldJobsCount.first()`</p>|
|Printer {#PRINTER_NAME}: Status| |Dependent_item|papercut.printer.status["{#PRINTER_NAME}"] <p>**Preprocessing**:<br>- JSONPath: `$.printers[?(@.name == "{#PRINTER_NAME}")].status.first()`</p>|

## Triggers

Appropriate triggers are associated with the items

## Feedback

Please report any issues with the template here in the "Issues" tab.
