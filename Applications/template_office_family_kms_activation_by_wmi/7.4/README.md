# Office Family KMS Activation by WMI

![Zabbix](https://img.shields.io/badge/Zabbix-7.4%2B-red)
![Platform](https://img.shields.io/badge/Platform-Windows%20with%20Microsoft%20Office-blue)
![Data source](https://img.shields.io/badge/Data%20source-WMI-green)
![License](https://img.shields.io/badge/License-MIT-black)
![Maintenance](https://img.shields.io/badge/Maintenance-Community-orange)

This template monitors Microsoft Office activation information on Windows hosts using WMI.

It uses one passive WMI master item, one dependent discovery rule, and dependent item prototypes to collect Office activation-related data while minimizing the number of direct WMI requests.

## Overview

The template discovers Microsoft Office licensing objects from `SoftwareLicensingProduct` and provides monitoring for:

- activation expiration
- license state
- product name
- partial product key
- description

The template is intended for Office family products exposed through Windows licensing data and processed through WMI discovery.

## Requirements

- Zabbix 7.4 or newer
- Microsoft Windows host with Microsoft Office installed
- working WMI access from Zabbix server or proxy
- access to the following WMI namespace and classes:
  - `root\cimv2`
  - `SoftwareLicensingProduct`

## Tested versions

The template has been tested on hosts with:

- Microsoft Office LTSC
- Microsoft Office 2016
- Microsoft Office 2019
- Microsoft Office 2021
- Microsoft Office 2024

## Configuration

No host-side scripts are required.

To use this template:

1. Configure WMI access for the target Windows host.
2. Link the template to the host.
3. Verify that the master WMI item returns Office licensing data.
4. Wait for discovery and dependent item population.

## Data collection

The template uses the `SoftwareLicensingProduct` WMI class to discover Microsoft Office activation objects and collect activation-related properties.

Collected fields:

- `ID`
- `Name`
- `Description`
- `LicenseStatus`
- `GracePeriodRemaining`
- `PartialProductKey`

The main WMI query used by the template is:

```text
wmi.getall[root\cimv2,"SELECT ID,Name,Description,LicenseStatus,GracePeriodRemaining,PartialProductKey FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND Name LIKE '%Office%'"]
````

## Discovery logic

The template uses:

* one passive WMI master item to collect raw Office licensing data
* one dependent low-level discovery rule to identify Office activation objects
* dependent item prototypes to expose activation properties for discovered objects

This design reduces WMI polling overhead and keeps the template lightweight.

## Items

### Static items

* Office activation raw JSON by WMI

### Discovered items

* Days until activation expiry
* License state
* Product name
* Product description
* Partial product key

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
{$OFFICE.KMS.EXPIRATION.DAYS.MIN.WARN}=30
{$OFFICE.KMS.EXPIRATION.DAYS.MIN.CRIT}=7
```

## Notes

* The template is intended for Microsoft Office activation monitoring only.
* WMI results may vary depending on Office edition, license channel, and installed product set.
* A host may expose multiple Office licensing objects, and discovery is used to process them consistently.
* The template does not require external scripts or custom host-side commands.
* Filtering by `Name LIKE '%Office%'` may be adjusted in the template if a specific Office product naming pattern is required.

## Author

Community template for Zabbix.
