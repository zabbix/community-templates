# Windows KMS Activation by WMI

![Zabbix](https://img.shields.io/badge/Zabbix-7.4%2B-red)
![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Data source](https://img.shields.io/badge/Data%20source-WMI-green)
![License](https://img.shields.io/badge/License-MIT-black)
![Maintenance](https://img.shields.io/badge/Maintenance-Community-orange)

This template monitors Windows activation information on Microsoft Windows hosts using WMI.

It uses one passive WMI master item, one dependent discovery rule, and dependent item prototypes to collect activation-related data while minimizing the number of direct WMI requests.

## Overview

The template discovers Windows licensing objects from `SoftwareLicensingProduct` and provides monitoring for:

- activation expiration
- license state
- product name

It also collects basic operating system information:

- OS caption
- OS version
- OS build number

## Requirements

- Zabbix 7.4 or newer
- Microsoft Windows host
- working WMI access from Zabbix server or proxy
- access to the following WMI namespace and classes:
  - `root\cimv2`
  - `SoftwareLicensingProduct`
  - `Win32_OperatingSystem`

## Tested versions

The template has been tested on:

- Windows 10
- Windows 11
- Windows Server 2019
- Windows Server 2022

## Configuration

No host-side scripts are required.

To use this template:

1. Configure WMI access for the target Windows host.
2. Link the template to the host.
3. Verify that the master WMI item returns licensing data.
4. Wait for discovery and dependent item population.

## Data collection

The template uses the `SoftwareLicensingProduct` WMI class to discover Windows activation objects and collect activation-related properties.

Collected fields:

- `ID`
- `Name`
- `LicenseStatus`
- `GracePeriodRemaining`

The main WMI query used by the template is:

```text
wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND ApplicationID='55c92734-d682-4d71-983e-d6ec3f16059f'"]
````

The template also collects basic OS information from `Win32_OperatingSystem`.

Collected fields:

* `Caption`
* `Version`
* `BuildNumber`

## Discovery logic

The template uses:

* one passive WMI master item to collect raw licensing data
* one dependent low-level discovery rule to identify Windows activation objects
* dependent item prototypes to expose activation properties for discovered objects

This design reduces WMI polling overhead and keeps the template lightweight.

## Items

### Static items

* Windows activation raw JSON by WMI
* Windows OS caption
* Windows OS version
* Windows OS build number

### Discovered items

* Days until activation expiry
* License state
* Product name

## Value mapping

`LicenseStatus` values are mapped to the following states:

| Code | Meaning         |
| ---- | --------------- |
| 0    | Unlicensed      |
| 1    | Licensed        |
| 2    | OOBGrace        |
| 3    | OOTGrace        |
| 4    | NonGenuineGrace |
| 5    | Notification    |
| 6    | ExtendedGrace   |

## Triggers

The template includes trigger prototypes for:

* activation expires in less than warning threshold
* activation expires in less than critical threshold
* license state is not `Licensed`

Default user macros:

```text
{$WINDOWS.KMS.EXPIRATION.DAYS.MIN.WARN}=30
{$WINDOWS.KMS.EXPIRATION.DAYS.MIN.CRIT}=7
```

## Notes

* The template is intended for Windows activation monitoring only.
* WMI results may vary depending on Windows edition and licensing channel.
* A host may expose multiple licensing objects, and discovery is used to process them consistently.
* The template does not require external scripts or custom host-side commands.

## Author

Community template for Zabbix.
