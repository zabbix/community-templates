# Microsoft Office Family KMS Activation by WMI

![Zabbix](https://img.shields.io/badge/Zabbix-7.4-red)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![Data source](https://img.shields.io/badge/Data%20source-WMI-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Maintenance](https://img.shields.io/badge/Maintained-yes-brightgreen)

Zabbix template for monitoring **Microsoft Office family activation expiration** via **WMI** and **Low-Level Discovery (LLD)**.

The template is intended for Microsoft volume-licensed Office family products and automatically discovers licensing objects from Windows WMI.

In tested environments, the query matched:

- Microsoft Office ProPlus
- Microsoft Visio Pro
- Microsoft Project Pro

This template uses a **single passive WMI master item** and a **dependent discovery rule** to build all monitored metrics.

---

# Features

- automatic discovery of Office family licensing objects via **WMI LLD**
- monitoring of:
  - days until activation expiry
  - license state
  - product name
- no external PowerShell scripts required
- one passive WMI master item
- dependent discovery and dependent item prototypes
- low WMI query count compared to multiple standalone checks

---

# Architecture

```text
WMI query
   ↓
Passive raw JSON master item
   ↓
Dependent discovery rule
   ↓
Dependent item prototypes
   ↓
Trigger prototypes / graphs
````

The template executes one WMI query, stores the raw result as JSON, and derives all discovered items from it.

This design reduces the number of WMI calls and keeps the structure simple and maintainable.

---

# Monitored Products

The template is intended for Office family licensing objects visible in:

```text
SoftwareLicensingProduct
```

In tested environments, the following products were discovered:

* `Office 16, Office16ProPlusVL_KMS_Client edition`
* `Office 16, Office16VisioProVL_KMS_Client edition`
* `Office 16, Office16ProjectProVL_KMS_Client edition`

---

# Data Source

The template uses the WMI class:

```text
SoftwareLicensingProduct
```

and extracts these fields:

* `ID`
* `Name`
* `LicenseStatus`
* `GracePeriodRemaining`

The master WMI query is:

```text
wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND Name LIKE '%Office%'"]
```

---

# Repository Structure

```text
.
└─ template_office_family_kms_activation_by_wmi.yaml
```

---

# How It Works

## 1. Raw WMI master item

The template creates a master item:

```text
Office family activation raw JSON by WMI
```

This item is configured as:

```text
Type: Zabbix agent
```

That means the Zabbix server polls the host directly.

Example result:

```json
[
  {
    "GracePeriodRemaining": 254861,
    "ID": "4f414197-0fc2-4c01-b68a-86cbb9ac254c",
    "LicenseStatus": 1,
    "Name": "Office 16, Office16ProjectProVL_KMS_Client edition"
  },
  {
    "GracePeriodRemaining": 254861,
    "ID": "6bf301c1-b94a-43e9-ba31-d494598c47fb",
    "LicenseStatus": 1,
    "Name": "Office 16, Office16VisioProVL_KMS_Client edition"
  },
  {
    "GracePeriodRemaining": 254861,
    "ID": "d450596f-894d-49e0-966a-fd39ed4c4c64",
    "LicenseStatus": 1,
    "Name": "Office 16, Office16ProPlusVL_KMS_Client edition"
  }
]
```

## 2. Dependent discovery rule

A dependent discovery rule uses the raw JSON item as its master source.

LLD macros are extracted using JSONPath:

* `{#LICENSEID}` → `$.ID`
* `{#LICENSENAME}` → `$.Name`

## 3. Dependent item prototypes

The template automatically creates the following discovered items:

* `{#LICENSENAME}: Days until activation expiry`
* `{#LICENSENAME}: License state`
* `{#LICENSENAME}: Product name`

No extra internal items are required.

---

# Created Items

## Static item

* `Office family activation raw JSON by WMI`

## Discovered items

For each discovered Office family licensing object:

* `Days until activation expiry`
* `License state`
* `Product name`

---

# License State Mapping

The following `LicenseStatus` values are mapped into readable text:

| Code | Meaning         |
| ---- | --------------- |
| 0    | Unlicensed      |
| 1    | Licensed        |
| 2    | OOBGrace        |
| 3    | OOTGrace        |
| 4    | NonGenuineGrace |
| 5    | Notification    |
| 6    | ExtendedGrace   |

Users see **human-readable state values**, not raw numeric codes.

---

# Triggers

The template includes trigger prototypes for:

* activation expires in less than warning threshold
* activation expires in less than critical threshold
* license is not in `Licensed` state

Default macros:

```text
{$OFFICEFAMILY.KMS.EXPIRATION.DAYS.MIN.WARN}=30
{$OFFICEFAMILY.KMS.EXPIRATION.DAYS.MIN.CRIT}=7
```

---

# Requirements

* **Zabbix 7.4**
* **Zabbix Agent 2**
* Windows host with Office family products installed
* working WMI access
* access to:

  * `root\cimv2`
  * `SoftwareLicensingProduct`

---

# Installation

## 1. Configure Zabbix Agent 2

Example:

```ini
Server=<Zabbix server IP or DNS>
Hostname=<exactly as configured in Zabbix>
Timeout=10
```

`Timeout=10` is recommended because Office WMI queries may take longer than simpler checks.

Restart the agent:

```powershell
Restart-Service "Zabbix Agent 2"
```

---

## 2. Test the WMI query from the Zabbix server

```bash
zabbix_get -s <HOST_IP> -p 10050 -k 'wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND Name LIKE '\''%Office%'\''"]'
```

Expected result: JSON array with Office family licensing objects.

---

## 3. Import the template

Import:

```text
template_office_family_kms_activation_by_wmi.yaml
```

via:

```text
Data collection → Templates → Import
```

---

## 4. Link the template to hosts

Link the template to Windows hosts with Office family products installed.

---

## 5. Run discovery

Because the master item is passive (`Zabbix agent`), discovery can be executed manually from the Zabbix UI after import and linking.

---

# Example Values

```text
Office 16, Office16ProPlusVL_KMS_Client edition: Days until activation expiry = 177.0 d
Office 16, Office16ProPlusVL_KMS_Client edition: License state = Licensed
Office 16, Office16VisioProVL_KMS_Client edition: Days until activation expiry = 177.0 d
Office 16, Office16ProjectProVL_KMS_Client edition: Days until activation expiry = 177.0 d
```

---

# Why This Approach

Compared to multiple standalone WMI items, this template:

* executes only one WMI query
* derives all discovered metrics from one JSON payload
* reduces WMI load
* avoids external collector scripts
* provides a clean community-template-friendly structure

---

# Troubleshooting

## 1. `Office family activation raw JSON by WMI` is empty or becomes `Not supported`

### Fixes

* verify WMI access on the monitored host
* verify that the host really has Office family products installed
* set agent timeout:

```ini
Timeout=10
```

* if needed, increase item timeout in the master item

---

## 2. Discovery does not create any items

### Checks

Make sure the discovery rule is:

* **Type**: `Dependent item`
* **Master item**: `Office family activation raw JSON by WMI`

LLD macro paths should be:

```text
{#LICENSEID}   -> $.ID
{#LICENSENAME} -> $.Name
```

---

## 3. Local `zabbix_agent2.exe -t` test fails in PowerShell

This may happen because complex `wmi.getall[...]` keys are hard to quote correctly in PowerShell.

### Recommendation

Use `zabbix_get` from the Zabbix server instead:

```bash
zabbix_get -s <HOST_IP> -p 10050 -k 'wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND Name LIKE '\''%Office%'\''"]'
```

---

## 4. Query works for Office ProPlus and also returns Visio / Project

This is expected in environments where those products are exposed through `SoftwareLicensingProduct` with names matching the Office family query.

---

# Limitations

* Windows-only
* intended for Microsoft Office family licensing objects
* depends on working WMI access
* current filter is based on:

```text
Name LIKE '%Office%'
```

In tested environments this also included Visio and Project.

---

# Future Improvements

Possible future extensions:

* separate Office / Visio / Project templates if stricter separation is needed
* graph prototypes for activation countdown
* exact expiration timestamp item
* dashboard widgets

---

# License

MIT License

```text
MIT License

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files to deal in the Software
without restriction.
```

---

# Author

This template was created for centralized monitoring of Microsoft Office family activation expiration in Zabbix using WMI and low-level discovery.