# Zabbix Integration: Home Assistant Monitoring

**Template:** `Home Assistant - Zabbix`
**Zabbix Version:** 7.0+

## Overview

Agentless monitoring of Home Assistant entities via the REST API:

- Fetches all entity states from Home Assistant (`{$HA.URL}/api/states`) with a single HTTP request
- Discovers entities automatically via Low-Level Discovery (LLD) — no manual configuration per sensor
- Covers sensors, binary sensors, automations, lights, switches, covers, locks, alarms, climate, cameras, zones, persons, and more
- Extracts state, numeric values, and attributes (battery level, unit of measurement, device class, etc.)
- Applies JSON preprocessing, string-to-integer mappings, and value maps to normalize raw HA data
- Includes a built-in dashboard with 7 pages, auto-populated via graph prototypes

**How it works:**

```
ha.raw  (HTTP_AGENT → /api/states, Bearer {$API.TOKEN})
  ├── Direct dependent items  (HA Core Update, Supervisor Update)
  └── LLD Discovery Rules     (battery, temperature, switches, ...)
        └── Item Prototypes   (one item per discovered entity)
              └── Trigger Prototypes
```

## Requirements

- Home Assistant instance with REST API enabled and reachable from Zabbix
- Long-Lived Access Token created in Home Assistant (`Profile → Security → Long-Lived Access Tokens`)
- Accessible base URL (e.g., `http://homeassistant.example.com:8123`)
- Template applied to a Zabbix host that has network access to Home Assistant

## Setup

1. Import `template_homeassistant_api.yaml` into Zabbix 7.0+
2. Create a Zabbix host for your Home Assistant instance
3. Assign this template to the host
4. Set the required macros on the host (or globally):

| Macro | Example | Description |
|---|---:|---|
| `{$HA.URL}` | `http://homeassistant.example.com:8123` | Base URL of the Home Assistant instance |
| `{$API.TOKEN}` | `eyJhbGci...` | Long-Lived Access Token |
| `{$HOST.REACHABLE}` | `1` | Set to `0` to suppress the host unreachable trigger |

## Items Included in the Template

### Home Assistant Core

| Item | Description |
|---|---|
| All Entity States (Master Item) | Single HTTP request to `/api/states` — all other items depend on this |
| HA Core Update | Whether a Home Assistant Core update is available (1=yes, 0=no, 2=unavailable) |
| HA Supervisor Update | Whether a Supervisor update is available |
| Backup Manager State | State of the HA backup manager (idle / creating / receiving / restoring / blocked) |
| Backup Next Scheduled Automatic Backup | Next scheduled automatic backup time, stored as Unix time |
| Backup Last Successful Automatic Backup | Last successful automatic backup time, stored as Unix time |
| Backup Last Attempted Automatic Backup | Last attempted automatic backup time, stored as Unix time |
| Automatic Backup Event Type | State of the last automatic backup task from `event.backup_automatic_backup` (`completed`, `in progress`, `failed`) |
| Automatic Backup Failed Reason | Failure reason from `event.backup_automatic_backup` when the last automatic backup failed |
| Automatic Backup Stage | Current `backup_stage` from `event.backup_automatic_backup`, mapped to a finite set of backup stages |
| Integration Updates | Update availability for all installed integrations |
| Firmware Updates | Firmware update availability for connected devices (device_class: firmware) |
| Restart Required | Services or integrations requiring a restart |
| Device Uptime | Uptime of devices reporting an uptime sensor (ISO8601 → elapsed seconds) |

### Sensors — by Device Class

| Item | Description |
|---|---|
| Battery Level | Battery percentage for all discovered battery sensors |
| Temperature | Temperature readings for all temperature sensors (unit from HA) |
| Humidity | Relative humidity for all humidity sensors |
| Atmospheric Pressure | Barometric pressure sensors |
| Illuminance | Light level / lux sensors |
| Power (W) | Power consumption in Watts |
| Energy (kWh) | Energy consumption in kWh |
| Weight | Weight sensors |
| Signal Strength (dBm) | Wi-Fi / RF signal strength in dBm |
| Distance | Distance sensors |
| Particulate Matter (PM1 / PM2.5 / PM10) | Fine dust sensors (device_class: pm1, pm25, pm10) |
| VOC / Air Pollutants | Volatile organic compounds index (device_class: volatile_organic_compounds, volatile_organic_compounds_parts, or entity_id matching `.*voc_index$`) |
| CO2 Level | Carbon dioxide concentration (ppm) |
| Voltage | Voltage sensors (V) |
| Current | Current sensors (A) |
| Wind Speed | Wind speed sensors |
| Wind Direction | Wind direction sensors (°) |
| Precipitation | Precipitation sensors |
| Sound Pressure Level | Noise / dB sensors |
| Air Quality Index (AQI) | AQI sensors |
| Gas Consumption | Gas consumption (sensor, m³ or ft³) |
| Water Consumption | Water consumption (m³ or gal) |
| ZigBee Link Quality | ZigBee signal quality (LQI) for all `*_linkquality` entities |

### Sensors — by Entity ID Pattern

| Item | Description |
|---|---|
| Automation State | State of all automations (enabled / disabled / unavailable) |
| Camera State | Camera availability and mode |
| Light State | On / off / unavailable state for all lights |
| Switch State | On / off / unavailable / unknown state for all switches |
| Cover State & Position | Open / closed / opening / closing and position % for covers and blinds |
| Climate — Current Temperature | Current temperature measured by a climate entity |
| Climate — Target Temperature | Set point / target temperature of a climate entity |
| Climate — HVAC Action | Active HVAC mode (heating / cooling / idle / etc.) |
| Lock State | Locked / unlocked / jammed / locking / unlocking state |
| Alarm Panel State | Disarmed / armed / pending / triggered state |
| Weather Forecast | Current weather condition (15 conditions mapped to numeric values) |
| Zone — Latitude / Longitude / Radius | Geographic data for HA zones |
| Zone — Persons Count | Number of persons currently inside a zone |
| Person Location | GPS coordinates of persons (Companion App) |
| Occupancy | Occupancy binary sensor state |
| Door / Window Contact | Open / closed state for door and window contact sensors |

### Safety Binary Sensors

> Safety-critical triggers. Smoke, CO, and gas sensors additionally fire a **HIGH** offline trigger when no data is received for `{$SAFETY.SENSOR.NODATA.TIMEOUT}` seconds (default 30 min). This ensures you are alerted if a sensor goes offline.

| Item | Trigger |
|---|---|
| Smoke Sensor | DISASTER when smoke detected; HIGH when sensor offline |
| Carbon Monoxide Sensor | DISASTER when CO detected; HIGH when sensor offline |
| Gas Sensor (binary) | DISASTER when gas leak detected; HIGH when sensor offline |
| Moisture / Flood Sensor | HIGH when moisture detected |
| Motion Sensor | State monitoring (no alert by default) |
| Window Sensor (binary) | State monitoring (no alert by default) |

### Home Assistant Apps (Add-ons) Monitoring

> Requires **Home Assistant Supervisor** entities to be enabled in:
> **Settings → Devices & Services → Home Assistant Supervisor**
>
> By default only update entities are enabled. Running, CPU, and Memory entities must be enabled manually in Home Assistant.

| Item | Description |
|---|---|
| Add-on Running State | Whether each add-on is running, stopped, or unavailable |

**Macros for Add-on Monitoring:**

| Macro | Example | Description |
|---|---:|---|
| `{$SWITCH.TRIGGER.ADDON.RUNNING}` | `1` | Enable (1) or disable (0) the "add-on not running" trigger |

### HA Companion App (Mobile)

| Item | Description |
|---|---|
| Step Counter | Daily steps tracked by the Companion App |
| Distance Traveled | Distance traveled (km or mi) |
| Floors Ascended | Floors climbed |
| Floors Descended | Floors descended |
| Storage Available | Free device storage (%) |

## Host System Monitoring

> Requires the [System Monitor Integration](https://www.home-assistant.io/integrations/systemmonitor/) to be enabled in Home Assistant.
> Enable all desired entities in **Settings → Devices & Services → System Monitor**.

| Item | Description |
|---|---|
| CPU Utilization | Processor utilization (%) |
| Memory Utilization | RAM usage (%) |
| Memory Used | RAM used (MiB) |
| Memory Free | RAM free (MiB) |
| Swap Used | Swap space used (MiB) |
| Swap Free | Swap space free (MiB) |
| Swap Utilization | Swap usage (%) |
| Disk Free | Free disk space (GiB) |
| Disk Used | Used disk space (GiB) |
| Load Average (1 min) | System load average — 1 minute |
| Load Average (5 min) | System load average — 5 minutes |
| Load Average (15 min) | System load average — 15 minutes |
| Network In | Incoming network throughput (MB/s) |
| Network Out | Outgoing network throughput (MB/s) |
| Network Packets In | Incoming packets per second |
| Network Packets Out | Outgoing packets per second |

## Macros Reference

### Connection & Access

| Macro | Example | Description |
|---|---:|---|
| `{$HA.URL}` | `http://homeassistant.example.com:8123` | Home Assistant base URL |
| `{$API.TOKEN}` | `eyJhbGci...` | Long-Lived Access Token |
| `{$HOST.REACHABLE}` | `1` | Controls the no-data / unreachable trigger (1 = active) |

### Thresholds

| Macro | Example | Description |
|---|---:|---|
| `{$BATTERY.MINIMUM}` | `30` | Low battery threshold (%) |
| `{$TRIGGER.TEMPERATURE}` | `44` | Device temperature threshold (°C). The trigger fires above this value. |
| `{$ZIGBEE.SIGNAL.MINIMUM}` | `20` | Minimum ZigBee LQI before trigger |
| `{$DBM.SIGNAL.MINIMUM}` | `-80` | Minimum dBm signal quality before trigger |
| `{$CPU.UTIL.MAX.PERCENT}` | `90` | Maximum CPU utilization (%) |
| `{$MEMORY.UTIL.MAX.PERCENT}` | `95` | Maximum memory utilization (%) |
| `{$SWAP.PFREE.MIN.WARN.PERCENT}` | `50` | Maximum swap utilization (%) |
| `{$DISK.PFREE.MIN.WARN.GIB}` | `2` | Minimum free disk space (GiB) |
| `{$STORAGE_PERCENT}` | `5` | Minimum free storage for Companion App (%) |
| `{$CO2.WARNING.PPM}` | `1000` | CO2 warning threshold (ppm) |
| `{$CO2.CRITICAL.PPM}` | `2000` | CO2 critical threshold (ppm) |
| `{$AQI.MAX}` | `100` | Air quality index warning threshold |
| `{$SOUND.PRESSURE.MAX.DB}` | `80` | Sound pressure warning threshold (dB) |
| `{$SAFETY.SENSOR.NODATA.TIMEOUT}` | `1800` | Seconds without data before safety sensor offline trigger fires |
| `{$BACKUP.LAST.SUCCESS.MAX.HOURS}` | `48` | Maximum age in hours of the last successful automatic backup |

### Temperature Thresholds

| Macro | Example | Description |
|---|---:|---|
| `{$TRIGGER.TEMPERATURE.CRITICAL.LOW}` | `12` | Critically cold threshold (°C) |
| `{$TRIGGER.TEMPERATURE.WARNING.LOW}` | `15` | Warning — too cold (°C) |
| `{$TRIGGER.TEMPERATURE.NORMAL.LOW}` | `18` | Minimum of normal range (°C) |
| `{$TRIGGER.TEMPERATURE.NORMAL.HIGH}` | `27` | Maximum of normal range (°C) |
| `{$TRIGGER.TEMPERATURE.WARNING.HIGH}` | `31` | Warning — too warm (°C) |
| `{$TRIGGER.TEMPERATURE.CRITICAL.HIGH}` | `35` | Critically hot threshold (°C) |

### Humidity Thresholds

| Macro | Example | Description |
|---|---:|---|
| `{$TRIGGER.HUMIDITY.CRITICAL.LOW}` | `0` | Critically dry (%) |
| `{$TRIGGER.HUMIDITY.WARNING.LOW}` | `30` | Warning — too dry (%) |
| `{$TRIGGER.HUMIDITY.NORMAL.LOW}` | `40` | Minimum of normal range (%) |
| `{$TRIGGER.HUMIDITY.NORMAL.HIGH}` | `60` | Maximum of normal range (%) |
| `{$TRIGGER.HUMIDITY.WARNING.HIGH}` | `70` | Warning — too humid (%) |
| `{$TRIGGER.HUMIDITY.CRITICAL.HIGH}` | `100` | Critically humid (%) |

### Trigger Switches

All trigger switches accept context macros — e.g. `{$SWITCH.TRIGGER.BATTERY:"{#ENTITY_ID}"}` to disable a trigger for one specific entity only.

| Macro | Example | Description |
|---|---:|---|
| `{$SWITCH.TRIGGER.BATTERY}` | `1` | Low battery trigger (1 or 0) |
| `{$SWITCH.TRIGGER.BATTERY.UNAVAILABLE}` | `1` | Battery unavailable trigger (1 or 0) |
| `{$SWITCH.TRIGGER.FIRMWARE}` | `1` | Firmware update available trigger (1 or 0) |
| `{$SWITCH.TRIGGER.HA_UPDATE}` | `1` | Integration update available trigger (1 or 0) |
| `{$SWITCH.TRIGGER.HUMIDITY}` | `0` | Humidity out-of-range trigger (1 or 0, off by default) |
| `{$SWITCH.TRIGGER.TEMPERATURE}` | `0` | Temperature out-of-range trigger (1 or 0, off by default) |
| `{$SWITCH.TRIGGER.ZIGBEE}` | `1` | ZigBee signal quality trigger (1 or 0) |
| `{$SWITCH.TRIGGER.RESTART.REQUIRED}` | `1` | Restart required trigger (1 or 0) |
| `{$SWITCH.TRIGGER.STORAGE}` | `1` | Low storage trigger (1 or 0) |
| `{$SWITCH.TRIGGER.CO2}` | `1` | CO2 level trigger (1 or 0) |
| `{$SWITCH.TRIGGER.MOISTURE}` | `1` | Moisture / flood trigger (1 or 0) |
| `{$SWITCH.TRIGGER.AQI}` | `1` | Air quality index trigger (1 or 0) |
| `{$SWITCH.TRIGGER.SOUND.PRESSURE}` | `1` | Sound pressure trigger (1 or 0) |
| `{$SWITCH.TRIGGER.LOCK}` | `1` | Lock jammed trigger (1 or 0) |
| `{$SWITCH.TRIGGER.LOCK.OPEN}` | `0` | Lock unlocked trigger (1 or 0, off by default) |
| `{$SWITCH.TRIGGER.ADDON.RUNNING}` | `1` | Add-on not running trigger (1 or 0) |
| `{$SWITCH.TRIGGER.BACKUP}` | `0` | Backup triggers: integration unavailable, missing next schedule, stale successful backup, and automatic backup failed event (1 or 0, off by default) |

## Dashboard

The template includes a built-in **"Home Assistant - Zabbix"** dashboard with 7 pages. All widgets are driven by graph prototypes and data-over widgets that auto-populate as entities are discovered — no manual widget configuration needed.

| Page | Content |
|---|---|
| **Temperature** | Temperature graphs for all discovered temperature sensors (2 per row) |
| **Humidity** | Humidity graphs for all discovered humidity sensors (2 per row) |
| **Air Quality** | CO2, Atmospheric Pressure, Particulate Matter (PM1/PM2.5/PM10), VOC, Air Quality Index |
| **Energy** | Power (W), Energy (kWh), Voltage (V), Current (A), Gas (m³), Water (m³) |
| **System Monitor** | CPU, Memory, Disk, Network, Load Average, Swap |
| **Battery** | Battery level graphs for all discovered battery sensors (3 per row) |
| **Devices & Signals** | ZigBee Link Quality, Wi-Fi Signal (dBm), Weather Forecast, Add-on Status, Locks & Contacts |

## Value Maps

| Value Map | Used by |
|---|---|
| `update` | HA Core, Supervisor, and integration update entities |
| `firmware-update` | Firmware update entities |
| `addon-running` | Add-on running state (1=running, 0=stopped, 2=unavailable) |
| `backup_manager` | Backup manager state (0=idle, 1=create backup, 2=receive backup, 3=restore backup, 4=blocked, 5=unavailable) |
| `backup_automatic_event` | Automatic backup event state (0=completed, 1=in progress, 2=failed, 3=unavailable) |
| `backup_automatic_stage` | Automatic backup stage (0=none, 1=addon_repositories, 2=addons, 3=await_addon_restarts, 4=docker_config, 5=cleaning_up, 6=finishing_file, 7=folders, 8=home_assistant, 9=upload_to_agents, 10=unavailable) |
| `battery` | Battery sensors (-1=unavailable) |
| `temperature` | Temperature sensors (-1=unknown, 0=unavailable) |
| `automation` | Automation state (0=disabled, 1=enabled, 2=unavailable) |
| `camera` | Camera state (0=unavailable, 1=available, 2=idle) |
| `contact-sensor` | Door/window contact (0=closed, 1=open) |
| `light` | Light state (0=off, 1=on, 2=unavailable) |
| `switch` | Switch state (0=off, 1=on, 2=unavailable, 3=unknown) |
| `occupancy` | Occupancy sensor (0=clear, 1=detected) |
| `motion` | Motion sensor (0=clear, 1=detected, 2=unavailable) |
| `window` | Window sensor (0=closed, 1=open, 2=unavailable) |
| `smoke` | Smoke sensor (0=clear, 1=detected, 2=unavailable) |
| `co-binary` | CO sensor (0=clear, 1=detected, 2=unavailable) |
| `gas-binary` | Gas sensor (0=clear, 1=detected, 2=unavailable) |
| `moisture-binary` | Moisture/flood sensor (0=dry, 1=wet, 2=unavailable) |
| `cover-state` | Cover (0=closed, 1=open, 2=opening, 3=closing, 4=unavailable) |
| `lock-state` | Lock (0=locked, 1=unlocked, 2=locking, 3=unlocking, 4=jammed, 5=unavailable) |
| `alarm-state` | Alarm panel (0=disarmed … 9=triggered, 10=unavailable) |
| `weather` | Weather forecast (15 conditions mapped to 1–15) |
| `restart required` | Restart state (0–3) |
| `dbm` | dBm signal (0=unavailable) |
| `distance` | Distance sensor (-1=unknown, -2=unavailable) |
| `kWh` | Energy sensor (0=unavailable) |
