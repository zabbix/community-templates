# UPS CS141 SNMP (RFC1628)

## Overview

Zabbix template to monitor UPS systems with a **CS141 communication card** over **SNMP** using the vendor UPS-MIB implementation from `RFC1628-cs1x1.mib`.

The template focuses on:

- 3-phase **input and output voltages**.
- Per-phase **output load**, **output current** and **output power**.
- **Battery** capacity, voltage, status and remaining runtime.
- **Input frequency** per phase.
- **Internal UPS temperature**.
- **Identification** data (manufacturer, model, firmware, agent version, location, contact, etc.).
- **Alarm monitoring** via:
  - `upsAlarmsPresent` (counter of active alarms),
  - a dedicated virtual flag for `UPS-MIB::upsAlarmBatteryTooOld` (“Battery too old” alarm).

The template uses **symbolic OIDs from `UPS-MIB`** (for example `UPS-MIB::upsInputVoltage.1`).  
To make this work reliably, the standard OS `UPS-MIB` **must be replaced** by the vendor MIB that ships with this template (see *MIB installation* below).

> **Note:** Some objects defined in the MIB are **optional**.  
> Depending on the CS141 firmware version and UPS model, certain items may stay `UNSUPPORTED` (for example `upsSerialNumber`, some alarm-related objects, AUX ports, SensorManager values, etc.). This is normal behaviour and does **not** mean the template is broken.

---

## Requirements

- Zabbix version: **7.4 and higher**.
- Zabbix server or proxy with:
  - SNMP support (net-snmp).
  - Correctly installed **vendor UPS-MIB** from `RFC1628-cs1x1.mib` (module name `UPS-MIB`).
- UPS with **CS141 card** configured for SNMP access (v2c or v3).

The template is written for **SNMPv2c**, but can be used with v3 as well (configure the host interface accordingly).

---

## MIB installation (important)

This template uses **UPS-MIB aliases** everywhere. If your Zabbix server or proxy uses the stock OS `UPS-MIB`, you will see errors like:

> `snmp_parse_oid(): cannot parse OID "UPS-MIB::upsInputVoltage.1"`

To fix this you must:

1. **Install the vendor MIB**

   Copy `RFC1628-cs1x1.mib` from this repository to your MIB directory, e.g.:

   ```bash
   sudo cp RFC1628-cs1x1.mib /usr/share/snmp/mibs/
   ```

   This file defines the module:

   ```text
   UPS-MIB DEFINITIONS ::= BEGIN
   ```

2. **Hide or rename the distribution UPS-MIB**

   Find and move the original file so that net-snmp does not load it anymore, for example:

   ```bash
   sudo mv /usr/share/snmp/mibs/UPS-MIB.txt            /usr/share/snmp/mibs/UPS-MIB.txt.disabled
   ```

3. **Configure net-snmp to load the vendor UPS-MIB**

   In `/etc/snmp/snmp.conf` (or the relevant config file for your system) add or adjust:

   ```conf
   mibdirs +/usr/share/snmp/mibs
   mibs +UPS-MIB
   ```

4. **Verify on the Zabbix server/proxy**

   On the same machine where `zabbix_server` / `zabbix_proxy` runs:

   ```bash
   snmptranslate -On UPS-MIB::upsInputVoltage.1
   snmptranslate -On UPS-MIB::upsLocation.0
   ```

   Both commands must return numeric OIDs (no errors).  
   Only after this step will the template work correctly.

---

## Setup

> Zabbix should be configured according to the instructions in the  
> [*Templates out of the box*](https://www.zabbix.com/documentation/7.4/en/manual/config/templates_out_of_the_box) section of the official documentation.

1. **Prepare SNMP access on the UPS**

   - Enable SNMP on the CS141 card.
   - Configure community string (for SNMPv2c) or SNMPv3 credentials.
   - Allow queries from your Zabbix server/proxy IP.

2. **Install the vendor UPS-MIB on Zabbix server/proxy**  
   Follow the steps in the *MIB installation* section above.

3. **Create a host in Zabbix**

   - Add a new host to represent the UPS.
   - Configure an SNMP interface pointing to the CS141 IP address.
   - Link this template: **`UPS_CS141_SNMP_RFC1628`**.

4. **(Optional) Adjust macros** on the template or host (see below) to match your environment (nominal voltage, thresholds, etc.).

5. Wait for several polling intervals. Items and problems should start to appear.

---

## Macros used

| Name | Description | Default |
|------|-------------|---------|
| `{$UPS_VOLT_NOMINAL}` | Nominal phase voltage used for input/output deviation triggers. | `230` |
| `{$UPS_INPUT_VOLT_WARN_DEV}` | Allowed deviation from nominal **input** voltage before raising a **warning** (absolute, V). | `10` |
| `{$UPS_INPUT_VOLT_CRIT_DEV}` | Allowed deviation from nominal **input** voltage before raising a **critical** problem (absolute, V). | `20` |
| `{$UPS_OUTPUT_VOLT_WARN_DEV}` | Allowed deviation from nominal **output** voltage before raising a **warning** (absolute, V). | `10` |
| `{$UPS_OUTPUT_VOLT_CRIT_DEV}` | Allowed deviation from nominal **output** voltage before raising a **critical** problem (absolute, V). | `20` |
| `{$UPS_FREQ_NOMINAL}` | Nominal mains frequency. | `50` |
| `{$UPS_INPUT_FREQ_WARN_DEV}` | Allowed input frequency deviation for **warning** level (Hz). | `2` |
| `{$UPS_INPUT_FREQ_CRIT_DEV}` | Allowed input frequency deviation for **critical** level (Hz). | `3` |
| `{$UPS_TEMP_MAX}` | Maximum allowed internal UPS temperature (°C). | `40` |
| `{$UPS_BATT_CAP_WARN}` | Battery capacity threshold for low capacity warning (%). | `30` |
| `{$UPS_RUNTIME_MIN_WARN}` | Remaining runtime in minutes at or below which a warning is raised. | `10` |
| `{$UPS_LOAD_WARN}` | Per-phase apparent load at or above which a **high load** warning is raised (%). | `85` |
| `{$UPS_LOAD_CRIT}` | Per-phase apparent load at or above which a **critical overload** is raised (%). | `95` |
| `{$UPS_BATT_VOLT_MIN}` | Minimal allowed battery voltage (V). | `220` |
| `{$UPS_BATT_VOLT_MAX}` | Maximal allowed battery voltage (V). | `300` |
| `{$UPS_ON_BAT_SEC_WARN}` | Time on battery before raising a **warning** (seconds). | `60` |
| `{$UPS_ON_BAT_SEC_CRIT}` | Time on battery before raising a **high** severity alert (seconds). | `300` |
| `{$UPS_ALARMS_WARN}` | Warning threshold for minimal allowed warnings. | `2` |
| `{$UPS_ALARMS_CRIT}` | Warning threshold for minimal allowed warnings. | `3` |

---

## Items

The template defines **47 items**. The most important groups are:

### Identification

- **UPS manufacturer** – `upsIdentManufacturer.0`
- **UPS model** – `upsIdentModel.0` (+ trigger “model has changed”)
- **UPS firmware version** – `upsIdentUPSSoftwareVersion.0`
- **UPS agent software version** – `upsIdentAgentSoftwareVersion.0`
- **UPS name / location / system contact** – `upsIdentName.0`, `upsLocation.0`, `upsSystemContact.0`
- **UPS serial number** – `upsSerialNumber.0`  
  > Optional: some firmware versions do not implement this object (item may stay UNSUPPORTED).

### Power and voltages

- **Output voltage L1–L3** – `upsOutputVoltage.1–3` (V)
- **Input voltage L1–L3** – `upsInputVoltage.1–3` (V)  
  Triggers compare deviation vs `{$UPS_VOLT_NOMINAL}` and `{$UPS_*_VOLT_*_DEV}`.

- **Output load L1–L3** – `upsOutputPercentLoad.1–3` (% of nominal)  
  Used for high-load / overload triggers.

- **Output current L1–L3** – `upsOutputCurrent.1–3` (A)
- **Output power L1–L3** – `upsOutputPower.1–3` (W)

### Battery and runtime

- **Battery capacity** – `upsEstimatedChargeRemaining.0` (%)
- **Battery voltage** – `upsBatteryVoltage.0` (V)
- **UPS battery status** – `upsBatteryStatus.0` (valuemap: Unknown/Normal/Low/Depleted)
- **Remaining runtime** – `upsEstimatedMinutesRemaining.0` (min)
- **Seconds on battery** – `upsSecondsOnBattery.0` (s) – used with `{$UPS_ON_BAT_SEC_*}`.

### Frequencies and temperature

- **Input frequency L1–L3** – `upsInputFrequency.1–3` (Hz)
- **UPS internal temperature** – `upsBatteryTemperature.0` or vendor-specific internal sensor (°C).

### Status and alarms

- **UPS status raw / output source** – `upsOutputSource.0` and related state items.
- **UPS active alarms count** – `upsAlarmsPresent.0`
- **UPS alarm descriptor [1]** – `UPS-MIB::upsAlarmDescr.1` (text identifier of the first active alarm entry).
- **Alarm: Battery too old (SNMP flag)** – calculated item `ups.alarm.battery_too_old` returning `1` when `UPS-MIB::upsAlarmBatteryTooOld` is present in the active alarms set, `0` otherwise.

### AUX ports and SensorManager (optional)

- **AUX port 1–4 state** – `auxPort1.0`–`auxPort4.0` (valuemap *UPS AUX port state*).
- **SensorManager sensors 1–8** – `sensorMan1Value.0`–`sensorMan8Value.0` (0.1 unit scaling).

> **Important:** AUX and SensorManager objects are optional in the CS141 firmware.  
> On some devices these items will consistently return `No Such Object` and be marked UNSUPPORTED in Zabbix. This is expected and safe to ignore if your card does not provide these functions.

---

## Triggers

The template defines **26 triggers**.  
Main triggers include:

### Identification / meta

- **UPS model has changed** (INFO)  
- **UPS serial number has changed** (INFO)

### Voltages and frequencies

- **UPS output voltage deviation warning / critical** – per-phase deviation from `{$UPS_VOLT_NOMINAL}` exceeding `{$UPS_OUTPUT_VOLT_WARN_DEV}` / `{$UPS_OUTPUT_VOLT_CRIT_DEV}`.
- **UPS input voltage deviation warning / critical** – deviation thresholds based on `{$UPS_INPUT_VOLT_*_DEV}`.
- **UPS input frequency deviation warning / critical** – deviation from `{$UPS_FREQ_NOMINAL}` exceeding `{$UPS_INPUT_FREQ_*_DEV}`.

### Load and power

- **UPS output load is high / critical** – any phase load ≥ `{$UPS_LOAD_WARN}` / `{$UPS_LOAD_CRIT}`.

### Battery and runtime

- **UPS battery capacity is low** – capacity ≤ `{$UPS_BATT_CAP_WARN}`.
- **UPS battery status: LOW / DEPLETED** – based on `upsBatteryStatus.0` valuemap (3 / 4).
- **UPS runtime is low** – remaining runtime ≤ `{$UPS_RUNTIME_MIN_WARN}` minutes.
- **UPS battery voltage out of range** – outside `{$UPS_BATT_VOLT_MIN}`–`{$UPS_BATT_VOLT_MAX}`.
- **UPS alarm: Battery too old (SNMP)** – based on calculated item `ups.alarm.battery_too_old` (1 = alarm active).

### Temperature

- **UPS temperature is high** – internal temperature ≥ `{$UPS_TEMP_MAX}` °C.

### On-battery / mains state

- **UPS is on battery (warning / high)** – UPS running on battery (`upsOutputSource = battery`) longer than `{$UPS_ON_BAT_SEC_WARN}` / `{$UPS_ON_BAT_SEC_CRIT}`.

### Alarms and communication

- **UPS has active alarms (warning / high)** – `upsAlarmsPresent` exceeds internal thresholds (warning / high).
- **No SNMP data from UPS (10m)** – `nodata()` safeguard on one of the core items.

### AUX ports

- **UPS AUX Port N active** – `auxPortN = 1` for ports 1–4.

---

## Value maps

The template defines the following value maps:

| Name | Mapping |
|------|---------|
| **UPS battery status** | `1 → Unknown`, `2 → Normal`, `3 → Low`, `4 → Depleted` |
| **UPS AUX port state** | `0 → OK`, `1 → Active` |

---

## Template tags

Template-level tags:

- `class: ups`
- `protocol: snmp`
- `type: cs141`

These can be used in Zabbix dashboards (Problems widget, etc.) to filter UPS-related problems.

---

## Notes and limitations

- The template is built strictly around `UPS-MIB` as implemented by the vendor `RFC1628-cs1x1.mib`.  
  If the wrong MIB is loaded, symbolic OIDs will not resolve.
- Some objects are **optional** in CS141 firmware; corresponding items will be UNSUPPORTED on devices where they are not implemented. This is expected and documented above.
- The template aims to provide a solid base. Additional vendor-specific OIDs can be added later as needed (more detailed alarms, extra sensors, etc.).

---

## Feedback

If you find issues or have suggestions (additional OIDs, better descriptions, extra triggers), please open an issue or pull request in the repository where this template is hosted.
