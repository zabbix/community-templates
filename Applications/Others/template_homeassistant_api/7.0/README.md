# Zabbix Integration: Home Assistant Monitoring

**Template:** `Home Assistant - Zabbix`  
**Zabbix Version:** 7.0+  

---

## 💡 Overview

Agentless monitoring of Home Assistant entities via the REST API:  
- Fetches all `entity` states from Home Assistant (`{$HA.URL}/api/states`)  
- Discovers entities (automations, sensors, switches, cameras, zones, etc.) via Low-Level Discovery (LLD)  
- Extracts state, values, and attributes (e.g., battery level, temperature, disk usage)  
- Applies JSON preprocessing and value mappings to normalize data  
- Generates dependent items and trigger prototypes for various entity types

---

## 🔍 Requirements

- Home Assistant instance with REST API enabled  
- Long-Lived Access Token stored in macro `{$API.TOKEN}`  
- Accessible URL `{$HA.URL}` (e.g., `http://192.168.10.121:8123`)  
- Template applied to a Zabbix host with network access to HA  

   | Macro                                    | Example Value                        | Description                                    |
   |------------------------------------------|--------------------------------------|------------------------------------------------|
   | `{$API.TOKEN}`                           | _(SECRET)_                           | Home Assistant Long-Lived Access Token         |
   | `{$HA.URL}`                              | `http://192.168.1.100:8123`          | Base URL of the Home Assistant API             |
   | `{$BATTERY.MINIMUM}`                     | `30`                                 | Battery level threshold (%)                    |
   | `{$ZIGBEE.SIGNAL.MINIMUM}`               | `20`                                 | Minimum Zigbee link quality (LQI)              |
   | `{$DISK.PFREE.MIN.WARN.GIB}`             | `2`                                  | Minimum free disk space (GiB)                  |
   | `{$MEMORY.UTIL.MAX.PERCENT}`             | `95`                                 | Maximum memory utilization (%)                 |
   | `{$CPU.UTIL.MAX.PERCENT}`                | `90`                                 | Maximum CPU utilization (%)                    |
   | `{$STORAGE_PERCENT}`                     | `5`                                  | Free storage percentage threshold (%)          |
   | `{$SWAP.PFREE.MIN.WARN.PERCENT}`         | `50`                                 | Minimum free swap percentage (%)               |
   | `{$TRIGGER.HUMIDITY.CRITICAL.LOW}`       | `0`                                  | Critically dry (danger)                        |
   | `{$TRIGGER.HUMIDITY.WARNING.LOW}`        | `0`                                  | Low humidity (warn)                            |
   | `{$TRIGGER.HUMIDITY.NORMAL.LOW}`         | `0`                                  | Min safe humidity                              |
   | `{$TRIGGER.HUMIDITY.NORMAL.HIGH}`        | `0`                                  | Max safe humidity                              |
   | `{$TRIGGER.HUMIDITY.WARNING.HIGH}`       | `0`                                  | High humidity (warn)                           |
   | `{$TRIGGER.HUMIDITY.CRITICAL.HIGH}`      | `0`                                  | Critically humid (danger)                      |
   | `{$TRIGGER.TEMPERATURE.CRITICAL.LOW}`    | `0`                                  | Critically cold (danger)                       |
   | `{$TRIGGER.TEMPERATURE.WARNING.LOW}`     | `0`                                  | Low temp (warn)                                |
   | `{$TRIGGER.TEMPERATURE.NORMAL.LOW}`      | `0`                                  | Min safe temp                                  |
   | `{$TRIGGER.TEMPERATURE.NORMAL.HIGH}`     | `0`                                  | Max safe RH                                    |
   | `{$TRIGGER.TEMPERATURE.WARNING.HIGH}`    | `0`                                  | High temp (warn)                               |
   | `{$TRIGGER.TEMPERATURE.CRITICAL.HIGH}`   | `0`                                  | Critically hot (danger)                        |
   | `{$BACKUP.MAX.AGE.DAYS}`                 | `7`                                  | Maximum age of backup (days)                   |
   | `{$POWER.CONSUMPTION.MAX.WATT}`          | `1000`                               | Maximum power consumption (Watt)               |
   | `{$LOAD.AVG.MAX.1M}`                     | `2`                                  | Load average (1m) threshold                    |
   | `{$LOAD.AVG.MAX.5M}`                     | `1.5`                                | Load average (5m) threshold                    |
   | `{$LOAD.AVG.MAX.15M}`                    | `1`                                  | Load average (15m) threshold                   |
   | `{$SWITCH.TRIGGER}`                      | `1` or `0`                           | Enable/disable trigger for each feature        |

---

## 📑 Items Included in the Template

| Item                                           | Description                                                                                                          |
|------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| **Automations**                                | Monitors active automations in Home Assistant, detecting faulty or blocked automations.                              |
| **Battery Status**                             | Checks battery level of devices (sensors, remotes), alerts on low battery.                                           |
| **Cameras**                                    | Monitors camera availability and status, including reachability and stream health.                                   |
| **Contact Sensors**                            | Tracks state of doors/windows sensors (open/closed).                                                                 |
| **Firmware Updates**                           | Detects available firmware updates for integrated devices.                                                          |
| **Humidity Sensors**                           | Monitors humidity levels in environments.                                                                            |
| **Additional Humidity Sensors**                | Includes extra humidity sensor types for broader coverage.                                                           |
| **Temperature Sensors**                        | Monitors temperature readings from Home Assistant.                                                                   |
| **Air Pressure**                               | Tracks atmospheric pressure via HA sensors for weather trends.                                                       |
| **Weight Sensors**                             | Monitors weight readings from Home Assistant `device_class = "weight"` sensors (e.g. smart scales).                  |
| **Person Zone Assignment**                     | Follows which zone (Home, Work, etc.) a person entity is currently in.                                              |
| **Zone Radius**                                | Monitors configured zone radius to ensure accurate geofencing.                                                       |
| **Longitude**                                  | Displays longitude attribute of zone entities.                                                                      |
| **Latitude**                                   | Displays latitude attribute of zone entities.                                                                       |
| **Home Assistant Updates**                     | Monitors HA core version and alerts when a new release is available.                                                |
| **Power Consumption**                          | Tracks instantaneous power usage (Watt) of devices like smart plugs.                                                |
| **Energy Monitoring**                          | Tracks cumulative energy usage (kWh) for devices.                                                                   |
| **Weather Forecast**                           | Integrates HA weather forecast data (temperature, precipitation probability, wind speed).                          |
| **Zigbee Link Quality**                        | Monitors signal quality (LQI) of Zigbee devices and triggers on low values.                                         |
| **Occupancy**                                  | Detects presence/motion sensor state to indicate room occupancy.                                                    |
| **Illuminance**                                | Monitors light level (lux) for use in automations like adaptive lighting.                                          |
| **PM2.5**                                      | Tracks fine particulate matter concentration for air quality monitoring.                                            |
| **VOC**                                        | Monitors volatile organic compound levels for indoor air quality.                                                  |
| **Light Status**                               | Tracks on/off state of Home Assistant light entities.                                                              |
| **Step Counter (Companion App)**               | Reads step count reported by the HA companion app.                                                                 |
| **Distance Traveled (Companion App)**          | Measures distance covered based on companion app data.                                                             |
| **Floors Descended (Companion App)**           | Tracks floors descended from device sensor data.                                                                    |
| **Floors Ascended (Companion App)**            | Tracks floors ascended from device sensor data.                                                                     |
| **Storage Available (Companion App) (%)**      | Monitors free storage on HA companion devices, triggers below threshold.                                            |
| **Restart Required**                           | Alerts when a restart is required for HA or integrated devices.                                                     |
| **Switch Status**                              | Monitors state (on/off) of switch entities.                                                                         |
| **Device Uptime**                              | Monitors uptime of devices connected to Home Assistant.                                                             |
| **Backup**                                     | Monitors the last backup status.                              |
| **Host Not Reachable Trigger** | Fires when no data is received from  for 900 s while the host is still reachable  |

### 🖥️ Host System Monitoring ([System Monitor Integration](https://www.home-assistant.io/integrations/systemmonitor/) Required)
>  This section requires the **System Monitor Integration** in Home Assistant.  
>  **Note:** Make sure **all desired entities are enabled** in Home Assistant exposes them and Zabbix can query them correctly.

| Item                             | Description                                                                                       |
|----------------------------------|---------------------------------------------------------------------------------------------------|
| **CPU Utilization (%)**          | Shows the current CPU usage as a percentage.                                                     |
| **Load (1m)**                    | Average system load over the last 1 minute.                                                      |
| **Load (5m)**                    | Average system load over the last 5 minutes.                                                     |
| **Load (15m)**                   | Average system load over the last 15 minutes.                                                    |
| **Memory Utilization (%) & Trigger** | Shows the current memory usage as a percentage. Triggers an alert when utilization is high.      |
| **Memory Used (MiB) & Trigger**      | RAM currently in use in MiB. Triggers an alert when memory usage is high.                        |
| **Memory Free (MiB) & Trigger**      | Available RAM in MiB. Triggers an alert when free memory is low.                                  |
| **Swap Free (MiB)**              | Amount of unused swap space in MiB.                                                               |
| **Swap Used (MiB)**              | Amount of swap space currently used in MiB.                                                       |
| **Swap Utilization (%)**         | Percentage of swap usage.                                                                        |
| **Disk Used (GiB) & Trigger**       | Disk space currently in use in GiB. Triggers an alert when disk usage is high.                   |
| **Disk Free (GiB) & Trigger**        | Available disk space in GiB. Triggers an alert when free disk space is low.                      |
| **Network In (MB/s)**            | Incoming network traffic in megabytes per second.                                                 |
| **Network Out (MB/s)**           | Outgoing network traffic in megabytes per second.                                                 |
| **Network Packets In**           | Count of incoming network packets.                                                                |
| **Network Packets Out**          | Count of outgoing network packets.                                                                |

---
