# Zabbix Windows KMS Activation Monitoring (WMI LLD)

![Zabbix](https://img.shields.io/badge/Zabbix-7.4-red)
![WMI](https://img.shields.io/badge/Data%20source-WMI-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)
![Maintenance](https://img.shields.io/badge/Maintained-yes-brightgreen)

Zabbix template for monitoring **Windows activation expiration** using **WMI** and **Low-Level Discovery (LLD)**.

This template automatically discovers Windows licensing objects via `wmi.getall[]`, creates dependent items, and tracks:

- days until activation expiry
- license status code
- product name
- Windows OS version/build information

The template is designed for **Windows-only** monitoring and does **not** require external PowerShell collector scripts.

---

# Features

- automatic discovery of Windows licensing objects via **WMI LLD**
- monitoring of:
  - days until activation expiry
  - grace period in minutes
  - license status code
  - product name
- additional OS information:
  - Windows caption
  - Windows version
  - Windows build number
- based on a **single raw WMI JSON master item**
- dependent discovery and dependent item prototypes
- no external scripts required
- suitable for centralized Windows activation monitoring

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
Trigger prototypes / graphs
```

The template uses a single WMI query to retrieve raw licensing data as JSON and then builds all discovered metrics from that master item.

This reduces the number of WMI calls and makes the setup cleaner than creating multiple direct WMI items.

---

# Data Sources

## Windows licensing

The template collects licensing data from:

```text
SoftwareLicensingProduct
```

Using the following fields:

- `ID`
- `Name`
- `LicenseStatus`
- `GracePeriodRemaining`

## Windows OS version

The template also collects system version information from:

```text
Win32_OperatingSystem
```

Using:

- `Caption`
- `Version`
- `BuildNumber`


---

# How It Works

## 1. Raw WMI master item

The template creates a master item that runs a WMI query and returns JSON:

```text
wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND ApplicationID='55c92734-d682-4d71-983e-d6ec3f16059f'"]
```

Example output:

```json
[
  {
    "GracePeriodRemaining": 254896,
    "ID": "2de67392-b7a7-462a-b1ca-108dd189f588",
    "LicenseStatus": 1,
    "Name": "Windows(R), Professional edition"
  }
]
```

## 2. Dependent item prototypes

The template automatically creates items such as:

- `Windows(R), Professional edition: Days until activation expiry`
- `Windows(R), Professional edition: License status code`
- `Windows(R), Professional edition: Product name`

A technical item for grace minutes is also created and can be used internally for calculations.

---

# Requirements

- **Zabbix 7.4**
- **Zabbix Agent 2** on Windows
- Windows host with working local WMI access
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

`Timeout=10` is recommended for WMI-based items.

Restart the agent:

```powershell
Restart-Service "Zabbix Agent 2"
```

---

## 2. Test the WMI query locally

```powershell
& "C:\Program Files\Zabbix Agent 2\zabbix_agent2.exe" -t "wmi.getall[root\cimv2,\"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND ApplicationID='55c92734-d682-4d71-983e-d6ec3f16059f'\"]"
```

Expected result:

```json
[
  {
    "GracePeriodRemaining": 254896,
    "ID": "2de67392-b7a7-462a-b1ca-108dd189f588",
    "LicenseStatus": 1,
    "Name": "Windows(R), Professional edition"
  }
]
```

---

## 3. Test from Zabbix server

```bash
zabbix_get -s <HOST_IP> -p 10050 -k 'wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND ApplicationID='\''55c92734-d682-4d71-983e-d6ec3f16059f'\''"]'
```

If JSON is returned correctly, the template will work.

---

## 4. Import the template

Import:

```text
template_windows_kms_wmi_lld.yaml
```

via:

```text
Data collection → Templates → Import
```

---

## 5. Link the template to Windows hosts

After linking the template, run discovery manually once:

```text
Discovery rules → Windows activation discovery → Execute now
```

---

# Created Items

The template creates the following discovered items:

- `{Windows edition}: Days until activation expiry`
- `{Windows edition}: License status code`
- `{Windows edition}: Product name`
- `_INTERNAL_: {Windows edition}: Grace minutes`

It also creates static items:

- `Windows activation raw JSON (WMI)`
- `Windows OS caption`
- `Windows OS version`
- `Windows OS build`

---

# License Status Codes

The following `LicenseStatus` values are used:

| Code | Meaning |
|------|---------|
| 0 | Unlicensed |
| 1 | Licensed |
| 2 | OOBGrace |
| 3 | OOTGrace |
| 4 | NonGenuineGrace |
| 5 | Notification |
| 6 | ExtendedGrace |

---

# Example Use Case

Example discovered item values:

```text
Windows(R), Professional edition: Days until activation expiry = 177.0 d
Windows(R), Professional edition: License status code = 1
Windows(R), Professional edition: Product name = Windows(R), Professional edition
Windows OS version = 10.0.19045
Windows OS build = 19045
```
<img width="791" height="279" alt="изображение" src="https://github.com/user-attachments/assets/046f46ce-8a9b-46e8-89d2-50823ea9ac90" />

---

# Why This Approach

Compared to creating multiple standalone WMI items, this design has several advantages:

- only one raw WMI query is executed
- all discovered items are derived from a single JSON payload
- reduced WMI load
- easier maintenance
- cleaner LLD-based structure

---

# Limitations

- Windows-only
- monitors Windows licensing objects only
- does not include Office / Visio / Project
- depends on working WMI access
- WMI can be slower than native agent keys

---
