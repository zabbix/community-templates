# Windows KMS Activation by WMI

![Zabbix](https://img.shields.io/badge/Zabbix-7.4-red)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![Data source](https://img.shields.io/badge/Data%20source-WMI-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Maintenance](https://img.shields.io/badge/Maintained-yes-brightgreen)

Zabbix template for monitoring **Windows activation expiration** via **WMI** and **Low-Level Discovery (LLD)**.

The template is intended for Windows activation objects only and automatically discovers licensing entries from `SoftwareLicensingProduct`.

It uses a **single WMI master item**, a **dependent discovery rule**, and **dependent item prototypes** for the final metrics.

---

# Features

- automatic discovery of Windows activation objects via **WMI LLD**
- monitoring of:
  - days until activation expiry
  - license state
  - product name
- additional Windows OS information:
  - OS caption
  - OS version
  - OS build number
- no external PowerShell scripts required
- one WMI master item + dependent discovery
- human-readable license state via value mapping

---

# Architecture

```text
WMI query
   ↓
Raw JSON master item
   ↓
Dependent discovery rule
   ↓
Dependent item prototypes
   ↓
Trigger prototypes
```

The template performs one WMI query to collect licensing data, stores the result as raw JSON, and uses that JSON as the source for all discovered metrics.

This reduces the number of WMI calls and keeps the structure simple and maintainable.

---

# Data Sources

## Windows activation

The template uses:

```text
SoftwareLicensingProduct
```

with the following fields:

- `ID`
- `Name`
- `LicenseStatus`
- `GracePeriodRemaining`

The main WMI query is:

```text
wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND ApplicationID='55c92734-d682-4d71-983e-d6ec3f16059f'"]
```

## Windows OS information

The template also collects:

```text
Win32_OperatingSystem
```

for:

- `Caption`
- `Version`
- `BuildNumber`

---

# Repository Structure

```text
.
└─ template_windows_kms_activation_by_wmi.yaml
```

---

# How It Works

## 1. Raw WMI master item

The template creates a master item:

```text
Windows activation raw JSON by WMI
```

This item stores the raw JSON returned by the WMI query.

Example output:

```json
[
  {
    "GracePeriodRemaining": 254373,
    "ID": "2de67392-b7a7-462a-b1ca-108dd189f588",
    "LicenseStatus": 1,
    "Name": "Windows(R), Professional edition"
  }
]
```

## 2. Dependent discovery rule

A dependent discovery rule uses the raw JSON item as its master source.

The following LLD macros are extracted using JSONPath:

- `{#LICENSEID}` → `$.ID`
- `{#LICENSENAME}` → `$.Name`

## 3. Dependent item prototypes

The template automatically creates:

- `{#LICENSENAME}: Days until activation expiry`
- `{#LICENSENAME}: License state`
- `{#LICENSENAME}: Product name`

The template also creates static OS information items:

- `Windows OS caption`
- `Windows OS version`
- `Windows OS build`

---

# Created Items

## Static items

- `Windows activation raw JSON by WMI`
- `Windows OS caption`
- `Windows OS version`
- `Windows OS build`

## Discovered items

For each discovered Windows licensing object:

- `Days until activation expiry`
- `License state`
- `Product name`

---

# License State Mapping

The following `LicenseStatus` values are mapped into readable text:

| Code | Meaning |
|------|---------|
| 0 | Unlicensed |
| 1 | Licensed |
| 2 | OOBGrace |
| 3 | OOTGrace |
| 4 | NonGenuineGrace |
| 5 | Notification |
| 6 | ExtendedGrace |

Users see **human-readable state values**, not raw numeric codes.

---

# Triggers

The template includes trigger prototypes for:

- activation expires in less than warning threshold
- activation expires in less than critical threshold
- license is not in `Licensed` state

Default macros:

```text
{$WINDOWS.KMS.EXPIRATION.DAYS.MIN.WARN}=30
{$WINDOWS.KMS.EXPIRATION.DAYS.MIN.CRIT}=7
```

---

# Requirements

- **Zabbix 7.4**
- **Zabbix Agent 2**
- Windows host
- working WMI access
- access to:
  - `root\cimv2`
  - `SoftwareLicensingProduct`
  - `Win32_OperatingSystem`

---

# Installation

## 1. Configure Zabbix Agent 2

Example:

```ini
Server=<Zabbix server IP or DNS>
Hostname=<exactly as configured in Zabbix>
Timeout=10
```

`Timeout=10` is recommended if WMI queries are slow.

Restart the agent:

```powershell
Restart-Service "Zabbix Agent 2"
```

---

## 2. Test the WMI query from the Zabbix server

```bash
zabbix_get -s <HOST_IP> -p 10050 -k 'wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND ApplicationID='\''55c92734-d682-4d71-983e-d6ec3f16059f'\''"]'
```

Expected result: JSON array with Windows activation objects.

---

## 3. Import the template

Import:

```text
template_windows_kms_activation_by_wmi.yaml
```

via:

```text
Data collection → Templates → Import
```

---

## 4. Link the template to hosts

Link the template to Windows hosts that should be monitored.

---

## 5. Run discovery

After linking, run the dependent discovery rule or wait for the next update cycle of the master item.

---

# Example Values

```text
Windows(R), Professional edition: Days until activation expiry = 177.0 d
Windows(R), Professional edition: License state = Licensed
Windows(R), Professional edition: Product name = Windows(R), Professional edition
Windows OS version = 10.0.19045
Windows OS build = 19045
```
<img width="1219" height="216" alt="изображение" src="https://github.com/user-attachments/assets/c8ba0392-b906-4932-bbaf-d35216e44587" />

---

# Why This Approach

Compared to multiple standalone WMI items, this template:

- executes only one WMI query for activation data
- derives all discovered metrics from one JSON payload
- reduces WMI load
- avoids external scripts
- provides a clean community-template-friendly structure

---

# Troubleshooting

## 1. `Windows activation raw JSON by WMI` is empty or becomes `Not supported`

### Fixes

- verify WMI access on the monitored host
- verify that Windows activation objects are present
- set agent timeout:

```ini
Timeout=10
```

- if needed, increase polling timeout

---

## 2. Discovery does not create any items

### Checks

Make sure the discovery rule is:

- **Type**: `Dependent item`
- **Master item**: `Windows activation raw JSON by WMI`

LLD macro paths should be:

```text
{#LICENSEID}   -> $.ID
{#LICENSENAME} -> $.Name
```

---

## 3. OS version items stay empty

The OS information items may use longer update intervals than the master activation item.

Check:

- `Windows OS caption`
- `Windows OS version`
- `Windows OS build`

If needed, temporarily reduce their update interval for testing.

---

## 4. Local `zabbix_agent2.exe -t` test fails in PowerShell

Complex WMI keys with embedded quoting can be difficult to test locally in PowerShell.

### Recommendation

Use `zabbix_get` from the Zabbix server instead:

```bash
zabbix_get -s <HOST_IP> -p 10050 -k 'wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND ApplicationID='\''55c92734-d682-4d71-983e-d6ec3f16059f'\''"]'
```

---

## 5. Windows 10 and Windows 11 are hard to distinguish by version only

This is expected in some environments because both may report version `10.0.x`.

Use together:

- `Windows OS caption`
- `Windows OS version`
- `Windows OS build`

`BuildNumber` is especially useful for distinguishing modern Windows releases.

---

# Limitations

- Windows-only
- intended for Windows activation objects only
- depends on working WMI access
- WMI can be slower than standard agent keys

---

# Future Improvements

Possible future extensions:

- graph prototypes for activation countdown
- exact expiration timestamp item
- dashboard widgets
- stricter Windows edition categorization

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

This template was created for centralized monitoring of Windows activation expiration in Zabbix using WMI and low-level discovery.
