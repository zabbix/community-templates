# UPS CS141 Modbus Default

## Overview

The template to monitor UPS systems with CS141 communication card using the OEM **MODBUS Default** address map (registers 97–150) via Zabbix agent 2 Modbus plugin.

The template is focused on:
- 3-phase input and output voltages.
- Per-phase output load.
- Battery capacity, voltage and remaining runtime.
- Input frequency.
- Internal UPS temperature.
- A set of individual alarm bits (general fault, charger failed, battery low, AUX ports, etc.).

Registers 97–150 are implemented as Modbus items via Zabbix agent 2 `modbus.get[]` key.   


## Requirements

Zabbix version: **7.4 and higher**. :contentReference[oaicite:1]{index=1}  

The following is required on the Zabbix side:

- Zabbix agent 2 installed on a host that will poll the UPS over Modbus/TCP.
- Modbus plugin enabled for Zabbix agent 2.


## Tested versions

This template has been tested on:
- Piller UPS with CS141 card (OEM Modbus Default map).

Other UPS models using CS141 with the same register map are expected to work, but have not been explicitly tested.


## Configuration

> Zabbix should be configured according to the instructions in the  
> [Templates out of the box](https://www.zabbix.com/documentation/7.4/en/manual/config/templates_out_of_the_box) section of the official documentation.

Additionally, the Zabbix agent 2 Modbus plugin must be configured according to the Zabbix documentation.


## Setup

1. Install Zabbix agent 2 on a host that will poll the UPS over Modbus/TCP.
   - This can be the Zabbix server itself with a local agent.
   - On most installations no additional configuration is required if the Modbus plugin is enabled by default.

2. Make sure the agent can reach the UPS CS141 Modbus/TCP interface (network connectivity, firewalls, etc.).

3. Create a host in Zabbix to represent the UPS and link this template:
   - If you use a **local agent** on the Zabbix server, just set the Agent interface to `127.0.0.1` or the server hostname.
   - If you use **active checks**, the host name in Zabbix should match the `Hostname` parameter in the agent configuration (this is standard Zabbix requirement).

4. Set connection macros on the host or template:
   - `{$MODBUS_IP}` – IP address of the CS141 card.
   - `{$MODBUS_PORT}` – Modbus/TCP port (default `502`).
   - `{$MODBUS_SLAVE}` – Modbus unit/slave ID (usually `1`).

5. Wait for several polling intervals for the first data and triggers to appear.


### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$MODBUS_IP}|<p>IP address of the CS141 Modbus/TCP interface.</p>|`192.0.2.1` (example, should be overridden)|
|{$MODBUS_PORT}|<p>Modbus/TCP port on CS141.</p>|`502`|
|{$MODBUS_SLAVE}|<p>Modbus unit/slave ID for the UPS.</p>|`1`|
|{$UPS_VOLT_NOMINAL}|<p>Nominal phase-to-phase voltage used for input/output voltage deviation triggers.</p>|`400`|
|{$UPS_OUTPUT_VOLT_WARN_DEV}|<p>Allowed deviation (absolute value) from nominal output voltage before raising a **warning**.</p>|`20`|
|{$UPS_OUTPUT_VOLT_CRIT_DEV}|<p>Allowed deviation (absolute value) from nominal output voltage before raising a **critical** problem.</p>|`40`|
|{$UPS_INPUT_VOLT_WARN_DEV}|<p>Allowed deviation (absolute value) from nominal input voltage before raising a **warning**.</p>|`20`|
|{$UPS_INPUT_VOLT_CRIT_DEV}|<p>Allowed deviation (absolute value) from nominal input voltage before raising a **critical** problem.</p>|`40`|
|{$UPS_FREQ_NOMINAL}|<p>Nominal mains frequency for deviation calculations.</p>|`50`|
|{$UPS_INPUT_FREQ_WARN_DEV}|<p>Allowed input frequency deviation (absolute value) for **warning** level.</p>|`0.3`|
|{$UPS_INPUT_FREQ_CRIT_DEV}|<p>Allowed input frequency deviation (absolute value) for **critical** level.</p>|`0.5`|
|{$UPS_TEMP_MAX}|<p>Maximum allowed internal UPS temperature in °C.</p>|`60`|
|{$UPS_BATT_CAP_WARN}|<p>Battery capacity threshold in % for low capacity warning.</p>|`30`|
|{$UPS_RUNTIME_MIN_WARN}|<p>Remaining runtime in minutes at or below which a warning is raised.</p>|`10`|
|{$UPS_LOAD_WARN}|<p>Per-phase apparent load in % at or above which a **high load** warning is raised.</p>|`80`|
|{$UPS_LOAD_CRIT}|<p>Per-phase apparent load in % at or above which an **overload** (disaster) is raised.</p>|`100`|
|{$UPS_ALARM_BATTERY_BAD}|<p>Enable trigger for “Battery bad” alarm (1 = enabled, 0 = disabled).</p>|`1`|
|{$UPS_ALARM_ON_BATTERY}|<p>Enable trigger for “On battery” alarm.</p>|`1`|
|{$UPS_ALARM_BATTERY_LOW}|<p>Enable trigger for “Battery low” alarm.</p>|`1`|
|{$UPS_ALARM_BATTERY_DEPLETED}|<p>Enable trigger for “Battery depleted” alarm.</p>|`1`|
|{$UPS_ALARM_OVER_TEMP}|<p>Enable trigger for “Over temperature” alarm.</p>|`1`|
|{$UPS_ALARM_INPUT_BAD}|<p>Enable trigger for “Input bad” alarm.</p>|`1`|
|{$UPS_ALARM_OUTPUT_BAD}|<p>Enable trigger for “Output bad” alarm.</p>|`1`|
|{$UPS_ALARM_OUTPUT_OVERLOAD}|<p>Enable trigger for “Output overload” alarm.</p>|`1`|
|{$UPS_ALARM_ON_BYPASS}|<p>Enable trigger for “On bypass” alarm.</p>|`1`|
|{$UPS_ALARM_BYPASS_BAD}|<p>Enable trigger for “Bypass bad” alarm.</p>|`1`|
|{$UPS_ALARM_OUTPUT_OFF_REQUEST}|<p>Enable trigger for “Output Off as requested” alarm.</p>|`1`|
|{$UPS_ALARM_UPS_OFF_REQUEST}|<p>Enable trigger for “UPS Off as requested” alarm.</p>|`1`|
|{$UPS_ALARM_CHARGER_FAILED}|<p>Enable trigger for “Charger failed” alarm.</p>|`1`|
|{$UPS_ALARM_UPS_OUTPUT_OFF}|<p>Enable trigger for “UPS output off” alarm.</p>|`1`|
|{$UPS_ALARM_UPS_SYSTEM_OFF}|<p>Enable trigger for “UPS system off” alarm.</p>|`1`|
|{$UPS_ALARM_FAN_FAILURE}|<p>Enable trigger for “Fan failure” alarm.</p>|`1`|
|{$UPS_ALARM_FUSE_FAILURE}|<p>Enable trigger for “Fuse failure” alarm.</p>|`1`|
|{$UPS_ALARM_GENERAL_FAULT}|<p>Enable trigger for “General fault” alarm.</p>|`1`|
|{$UPS_ALARM_DIAG_TEST_FAILED}|<p>Enable trigger for “Diagnostic test failed” alarm.</p>|`1`|
|{$UPS_ALARM_COMM_LOST}|<p>Enable trigger for “Communication lost” alarm.</p>|`1`|
|{$UPS_ALARM_AWAITING_POWER}|<p>Enable trigger for “Awaiting power” alarm.</p>|`1`|
|{$UPS_ALARM_SHUTDOWN_PENDING}|<p>Enable trigger for “Shutdown pending” alarm.</p>|`1`|
|{$UPS_ALARM_SHUTDOWN_IMMINENT}|<p>Enable trigger for “Shutdown imminent” alarm.</p>|`1`|
|{$UPS_ALARM_TEST_IN_PROGRESS}|<p>Enable trigger for “Test in progress” alarm.</p>|`1`|
|{$UPS_ALARM_AUX1}|<p>Enable trigger for AUX Port 1 alarm.</p>|`1`|
|{$UPS_ALARM_AUX2}|<p>Enable trigger for AUX Port 2 alarm.</p>|`1`|
|{$UPS_ALARM_AUX3}|<p>Enable trigger for AUX Port 3 alarm.</p>|`1`|
|{$UPS_ALARM_AUX4}|<p>Enable trigger for AUX Port 4 alarm.</p>|`1`|


### Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Output voltage L1|<p>Modbus 97: `OUTPUT_VOLT0` – Output voltage Phase 1 (scaled 0.1 V).</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,97,1,uint16,be,0]`|
|Output voltage L2|<p>Modbus 98: `OUTPUT_VOLT1` – Output voltage Phase 2 (scaled 0.1 V).</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,98,1,uint16,be,0]`|
|Output voltage L3|<p>Modbus 99: `OUTPUT_VOLT2` – Output voltage Phase 3 (scaled 0.1 V).</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,99,1,uint16,be,0]`|
|Output load L1|<p>Modbus 100: `OUTPOWER0` – Output apparent power Phase 1 in %.</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,100,1,uint16,be,0]`|
|Output load L2|<p>Modbus 101: `OUTPOWER1` – Output apparent power Phase 2 in %.</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,101,1,uint16,be,0]`|
|Output load L3|<p>Modbus 102: `OUTPOWER2` – Output apparent power Phase 3 in %.</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,102,1,uint16,be,0]`|
|Battery capacity|<p>Modbus 103: `BATTCAP` – Battery capacity in %.</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,103,1,uint16,be,0]`|
|Input voltage L1|<p>Modbus 104: `INVOLT0` – Input voltage Phase 1 (signed, scaled 0.1 V).</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,104,1,int16,be,0]`|
|Input voltage L2|<p>Modbus 105: `INVOLT1` – Input voltage Phase 2 (signed, scaled 0.1 V).</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,105,1,int16,be,0]`|
|Input voltage L3|<p>Modbus 106: `INVOLT2` – Input voltage Phase 3 (signed, scaled 0.1 V).</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,106,1,int16,be,0]`|
|UPS internal temperature|<p>Modbus 107: `TEMPDEG` – Internal temperature in °C (signed, scaled 0.1 °C).</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,107,1,int16,be,0]`|
|Remaining runtime|<p>Modbus 108: `AUTONOMTIME` – Remaining autonomy time in minutes.</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,108,1,int16,be,0]`|
|UPS status raw|<p>Modbus 109: `STATUS` – UPS status word (ASCII HEX / UPSMAN).</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,109,1,uint16,be,0]`|
|Battery voltage|<p>Modbus 110: `BATTVOLT` – Battery voltage (signed, scaled 0.1 V).</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,110,1,int16,be,0]`|
|Input frequency L1|<p>Modbus 111: `INFREQ0` – Input frequency Phase 1.</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,111,1,uint16,be,0]`|
|Input frequency L2|<p>Modbus 112: `INFREQ1` – Input frequency Phase 2.</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,112,1,uint16,be,0]`|
|Input frequency L3|<p>Modbus 113: `INFREQ2` – Input frequency Phase 3.</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,113,1,uint16,be,0]`|
|… alarm flags 1–n|<p>Modbus 118–138, 139–142, 150: individual alarm bits (battery bad, on battery, battery low, charger failed, general fault, communication lost, AUX ports 1–4, etc.) mapped as separate items with valuemap “UPS alarm state”.</p>|Zabbix agent (active)|`modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,<register>,1,uint16,be,0]`|

> **Note:** Full list of alarm items exactly follows the CS141 Modbus Default map for registers 118–150 as implemented in the template.   


### Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|UPS output voltage deviation warning|<p>Output voltage on any phase deviates from nominal more than `{$UPS_OUTPUT_VOLT_WARN_DEV}`.</p>|`abs(last(/UPS_CS141_Modbus_Default/modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,97,1,uint16,be,0])-{$UPS_VOLT_NOMINAL})>{$UPS_OUTPUT_VOLT_WARN_DEV} or abs(last(/UPS_CS141_Modbus_Default/modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,98,1,uint16,be,0])-{$UPS_VOLT_NOMINAL})>{$UPS_OUTPUT_VOLT_WARN_DEV} or abs(last(/UPS_CS141_Modbus_Default/modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,99,1,uint16,be,0])-{$UPS_VOLT_NOMINAL})>{$UPS_OUTPUT_VOLT_WARN_DEV}`|Warning| |
|UPS output voltage deviation critical|<p>Output voltage on any phase deviates from nominal more than `{$UPS_OUTPUT_VOLT_CRIT_DEV}`.</p>|similar, using `{$UPS_OUTPUT_VOLT_CRIT_DEV}`|High| |
|UPS input voltage deviation warning|<p>Input voltage on any phase deviates from nominal more than `{$UPS_INPUT_VOLT_WARN_DEV}`.</p>|based on registers 104–106|Warning| |
|UPS input voltage deviation critical|<p>Input voltage on any phase deviates from nominal more than `{$UPS_INPUT_VOLT_CRIT_DEV}`.</p>|based on registers 104–106|High| |
|UPS input frequency deviation warning|<p>Input frequency deviates from `{$UPS_FREQ_NOMINAL}` more than `{$UPS_INPUT_FREQ_WARN_DEV}`.</p>|based on register 111|Warning| |
|UPS input frequency deviation critical|<p>Input frequency deviates from `{$UPS_FREQ_NOMINAL}` more than `{$UPS_INPUT_FREQ_CRIT_DEV}`.</p>|based on register 111|High| |
|UPS load high on any phase (>= {$UPS_LOAD_WARN}%)|<p>Output apparent power on any phase exceeds `{$UPS_LOAD_WARN}`% for 5 minutes.</p>|based on registers 100–102|Warning| |
|UPS overload on any phase (>= {$UPS_LOAD_CRIT}%)|<p>Output apparent power on any phase exceeds `{$UPS_LOAD_CRIT}`%.</p>|based on registers 100–102|Disaster| |
|UPS battery capacity low (<= {$UPS_BATT_CAP_WARN}%)|<p>Battery capacity is below configured warning threshold.</p>|based on register 103|Warning| |
|UPS runtime is low (<= {$UPS_RUNTIME_MIN_WARN} min)|<p>Remaining autonomy time in minutes is below configured threshold.</p>|based on register 108|Average| |
|UPS temperature is high (>= {$UPS_TEMP_MAX}°C)|<p>Internal UPS temperature exceeds configured limit.</p>|based on register 107|High| |
|No data from UPS Modbus items (10m)|<p>No Modbus data from CS141 for 10 minutes (status register).</p>|`nodata(/UPS_CS141_Modbus_Default/modbus.get["tcp://{$MODBUS_IP}:{$MODBUS_PORT}",{$MODBUS_SLAVE},3,109,1,uint16,be,0],10m)=1`|Warning|May be used as dependency for other triggers.|
|Alarm: Battery bad|<p>Battery bad alarm is active (if enabled by macro).</p>|`last(...)=1 and {$UPS_ALARM_BATTERY_BAD}=1`|High| |
|Alarm: On battery|<p>UPS is running on battery (if enabled by macro).</p>|`last(...)=1 and {$UPS_ALARM_ON_BATTERY}=1`|Warning/Info| |
|Alarm: Battery low / depleted / over temperature / input bad / output bad / output overload / on bypass / bypass bad|<p>Alarm bits from CS141 mapped one-by-one to triggers, each controlled by its own `{$UPS_ALARM_*}` macro.</p>|`last(...)=1 and {$UPS_ALARM_...}=1`|Warning/High/Disaster depending on condition| |
|Alarm: Charger failed|<p>Charger failed alarm is active.</p>|`last(...)=1 and {$UPS_ALARM_CHARGER_FAILED}=1`|High| |
|Alarm: General fault|<p>General fault alarm is active.</p>|`last(...)=1 and {$UPS_ALARM_GENERAL_FAULT}=1`|High| |
|Alarm: Communication lost|<p>Internal communication lost alarm is active (different from Zabbix communication loss).</p>|`last(...)=1 and {$UPS_ALARM_COMM_LOST}=1`|High| |
|Alarm: Shutdown pending / shutdown imminent|<p>Shutdown is pending or imminent.</p>|`last(...)=1 and {$UPS_ALARM_SHUTDOWN_*}=1`|High/Disaster| |
|Alarm: Test in progress|<p>Battery/diagnostic test is running.</p>|`last(...)=1 and {$UPS_ALARM_TEST_IN_PROGRESS}=1`|Info| |
|AUX Port 1–4 active|<p>State of AUX digital inputs (e.g., external contacts).</p>|`last(...)=1 and {$UPS_ALARM_AUXn}=1`|Warning| |

> **Note:** Some expressions above are abbreviated in this document for readability. Exact expressions are defined in the template and based on the corresponding Modbus register numbers and macros.   


## Valuemaps

The template defines the following valuemap:

|Name|Mapping|
|----|-------|
|UPS alarm state|`0 → OK`, `1 → Alarm`| :contentReference[oaicite:5]{index=5}  


## Template tags

The template is tagged as follows:

- `class: ups`
- `protocol: modbus`
- `type: cs141` :contentReference[oaicite:6]{index=6}  


## Feedback

If you find issues or have suggestions for improvement (additional registers, better descriptions, more triggers), please open an issue or pull request in the repository where this template is hosted.
