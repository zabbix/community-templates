# Zabbix Office Family KMS Activation Monitoring (WMI LLD)

![Zabbix](https://img.shields.io/badge/Zabbix-7.4-red)
![WMI](https://img.shields.io/badge/Data%20source-WMI-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)
![Maintenance](https://img.shields.io/badge/Maintained-yes-brightgreen)

Zabbix template for monitoring **Microsoft Office family activation expiration** using **WMI** and **Low-Level Discovery (LLD)**.

The template is designed to discover and monitor Office licensing objects such as:

- Office ProPlus
- Visio Pro
- Project Pro

It uses a single raw WMI JSON item as the master source and builds all discovered metrics as dependent items.

---

# Features

- automatic discovery of Office family licensing objects via **WMI LLD**
- monitoring of:
  - days until activation expiry
  - grace period in minutes
  - license status code
  - product name
- based on a **single raw WMI JSON master item**
- dependent discovery and dependent item prototypes
- no external PowerShell collector scripts required
- suitable for centralized Office family activation monitoring

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

The template executes a single WMI query, stores the raw result as JSON, and builds all discovered metrics from that master item.

This reduces the number of WMI calls and makes the template cleaner and easier to maintain.

---

# Monitored Products

The template is intended for Office family products that appear in `SoftwareLicensingProduct`, including:

- Microsoft Office ProPlus
- Microsoft Visio Pro
- Microsoft Project Pro

In the tested environment, the following objects were discovered:

- `Office 16, Office16ProPlusVL_KMS_Client edition`
- `Office 16, Office16VisioProVL_KMS_Client edition`
- `Office 16, Office16ProjectProVL_KMS_Client edition`

---

# Data Source

The template uses the WMI class:

```text
SoftwareLicensingProduct
```

and extracts the following fields:

- `ID`
- `Name`
- `LicenseStatus`
- `GracePeriodRemaining`

The master WMI query is:

```text
wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND Name LIKE '%Office%'"]
```

---

# Repository Structure

```text
.
└─ template_office_kms_wmi_lld.yaml
```

---

# How It Works

## 1. Raw WMI master item

The template creates a master item:

```text
Office family activation raw JSON (WMI)
```

Example output:

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

- `{#ID}` → `$.ID`
- `{#NAME}` → `$.Name`
- `{#STATUS}` → `$.LicenseStatus`
- `{#GRACE}` → `$.GracePeriodRemaining`

## 3. Dependent item prototypes

The template automatically creates items such as:

- `{#NAME}: Days until activation expiry`
- `{#NAME}: License status code`
- `{#NAME}: Product name`
- `_INTERNAL_: {#NAME}: Grace minutes`

---

# Requirements

- **Zabbix 7.4**
- **Zabbix Agent 2**
- Windows host with Office family products installed
- working local WMI access
- access to `root\cimv2`
- access to `SoftwareLicensingProduct`

---

# Installation

## 1. Configure Zabbix Agent 2

Example:

```ini
Server=<Zabbix server IP or DNS>
Hostname=<exactly as configured in Zabbix>
Timeout=10
```

`Timeout=10` is strongly recommended because the Office WMI query may take longer than the Windows-only query.

Restart the agent:

```powershell
Restart-Service "Zabbix Agent 2"
```

---

## 2. Test the WMI query from Zabbix server

```bash
zabbix_get -s <HOST_IP> -p 10050 -k 'wmi.getall[root\cimv2,"SELECT ID,Name,LicenseStatus,GracePeriodRemaining FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL AND Name LIKE '\''%Office%'\''"]'
```

If the host has Office family products, the command should return a JSON array.

---

## 3. Import the template

Import:

```text
template_office_family_kms_wmi_lld.yaml
```

via:

```text
Data collection → Templates → Import
```

---

## 4. Link the template to Windows hosts

After linking the template, run discovery manually once:

```text
Discovery rules → Office family activation discovery → Execute now
```

---

# Created Items

The template creates discovered items such as:

- `Office 16, Office16ProPlusVL_KMS_Client edition: Days until activation expiry`
- `Office 16, Office16VisioProVL_KMS_Client edition: Days until activation expiry`
- `Office 16, Office16ProjectProVL_KMS_Client edition: Days until activation expiry`

Additional discovered items:

- `{#NAME}: License status code`
- `{#NAME}: Product name`
- `_INTERNAL_: {#NAME}: Grace minutes`

Static item:

- `Office family activation raw JSON (WMI)`

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

# Example Values

```text
Office 16, Office16ProPlusVL_KMS_Client edition: Days until activation expiry = 177.0 d
Office 16, Office16ProPlusVL_KMS_Client edition: License status code = 1
Office 16, Office16VisioProVL_KMS_Client edition: Days until activation expiry = 177.0 d
Office 16, Office16ProjectProVL_KMS_Client edition: Days until activation expiry = 177.0 d
```
<img width="967" height="343" alt="изображение" src="https://github.com/user-attachments/assets/652ba8e5-55f9-47dc-9c56-45f6512264f2" />

---

# Why This Approach

Compared to creating multiple standalone WMI items, this template has several advantages:

- only one raw WMI query is executed
- all discovered items are derived from a single JSON payload
- reduced WMI load
- easier maintenance
- clean LLD-based design

---

# Limitations

- Windows-only
- intended for Office family licensing objects only
- depends on working WMI access
- WMI queries may require increased agent timeout
- product matching is currently based on:

```text
Name LIKE '%Office%'
```

In the tested environment this also matched Visio and Project objects.

---

# Recommended Future Improvements

Possible future extensions:

- trigger prototypes:
  - `< 30 days`
  - `< 7 days`
  - `LicenseStatus <> 1`
- graph prototypes for activation countdown
- separate Office / Visio / Project templates if needed
- calculated item for exact expiration timestamp

---

# Author

This project was created for centralized monitoring of Office family activation expiration in Zabbix using WMI and low-level discovery.
