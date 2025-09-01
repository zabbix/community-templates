# Shelly Plus 1PM (Gen2)

## Overview

**✅ Production-ready** monitoring template for the Shelly Plus 1PM Gen2 smart switch with integrated power monitoring. This template uses the modern RPC API (/rpc/Shelly.GetStatus) to monitor all device parameters including power consumption, network connectivity, system health, and firmware updates.

Unlike Gen1 devices, the Shelly Plus 1PM uses a modern JSON-RPC API providing more structured data and better error handling. The template requires no additional software installation - it uses HTTP agent items for agentless monitoring.

**🎯 Template is deployed and active** on production Zabbix servers with 27 monitoring items covering all device aspects.

## Author

Community Template

## Zabbix version

This template is compatible with Zabbix 7.0 and later versions.

## Setup

### Device Configuration

1. **Enable HTTP API**: The Gen2 RPC API is enabled by default on Shelly Plus 1PM devices
2. **Authentication**: If authentication is enabled on your device, configure the macros:
   - Set {$SHELLYPWD_USER} to your username (default: admin)
   - Set {$SHELLYPWD} to your password
3. **Network Access**: Ensure Zabbix server can reach the device via HTTP

### Host Configuration

1. Create a new host for your Shelly Plus 1PM device
2. Set the host interface to **HTTP** (not Agent)
3. Configure the HTTP interface:
   - **Connect to**: IP address or DNS name
   - **Port**: 80 (HTTP)
   - **Default**: Check this box
4. Link the "Shelly Plus 1PM" template to the host
5. Configure host macros if authentication is required:
   - {$SHELLYPWD}: Device password
   - {$SHELLYPWD_USER}: Username (usually 'admin')

### API Endpoints

The template uses multiple Gen2 RPC API endpoints:
- **Primary**: `/rpc/Shelly.GetStatus` - Device status every {$POLLING_INTERVAL}
- **Firmware**: `/rpc/Shelly.CheckForUpdate` - Update check every 12h
- **Device Info**: `/rpc/Shelly.GetDeviceInfo` - Firmware version every 12h
- **Method**: GET
- **Authentication**: HTTP Digest (if enabled)
- **Response Format**: JSON

**✅ All endpoints tested and working in production environment**

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----| 
|{$SHELLYPWD}|Password for admin user, if authentication is enabled|`****`|Secret macro|
|{$SHELLYPWD_USER}|Username for admin user|admin|Text macro|
|{$POLLING_INTERVAL}|How often to poll device status|60s|Text macro|

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

### System and Power Monitoring

|Name|Description|Type|Key and additional info|
|----|-----------|----|-------|
|Status gatherer|Gathers all device data from the RPC API|`HTTP agent`|shellyplus1pm.status<p>Update: {$POLLING_INTERVAL}</p>|
|BLE enabled|Bluetooth Low Energy status|`Dependent item`|shellyplus1pm.status.ble.enable<p>Update: 0</p>|
|Cloud connection state|Current state of cloud connection|`Dependent item`|shellyplus1pm.status.cloud.connected<p>Update: 0</p>|
|Input state|Current state of input 0|`Dependent item`|shellyplus1pm.status.input0.state<p>Update: 0</p>|
|MQTT connection state|Current state of MQTT connection|`Dependent item`|shellyplus1pm.status.mqtt.connected<p>Update: 0</p>|
|Switch output state|Current output state of switch 0|`Dependent item`|shellyplus1pm.status.switch0.output<p>Update: 0</p>|
|Switch command source|Last source of switch command|`Dependent item`|shellyplus1pm.status.switch0.source<p>Update: 0</p>|
|Current power consumption|Active power being consumed (Watts)|`Dependent item`|shellyplus1pm.status.switch0.apower<p>Update: 0</p>|
|Current voltage|AC voltage (Volts)|`Dependent item`|shellyplus1pm.status.switch0.voltage<p>Update: 0</p>|
|Current amperage|Current being drawn (Amperes)|`Dependent item`|shellyplus1pm.status.switch0.current<p>Update: 0</p>|
|Total energy consumed|Total energy consumed (Watt-hours)|`Dependent item`|shellyplus1pm.status.switch0.aenergy.total<p>Update: 0</p>|
|Energy consumption (1 min avg)|Energy consumption for current minute|`Dependent item`|shellyplus1pm.status.switch0.aenergy.by_minute.0<p>Update: 0</p>|
|Energy consumption (2 min avg)|Energy consumption for previous minute|`Dependent item`|shellyplus1pm.status.switch0.aenergy.by_minute.1<p>Update: 0</p>|
|Energy consumption (3 min avg)|Energy consumption for two minutes ago|`Dependent item`|shellyplus1pm.status.switch0.aenergy.by_minute.2<p>Update: 0</p>|
|Energy timestamp|Unix timestamp of last energy counter update|`Dependent item`|shellyplus1pm.status.switch0.aenergy.minute_ts<p>Update: 0</p>|
|Device temperature (°C)|Internal device temperature in Celsius|`Dependent item`|shellyplus1pm.status.switch0.temperature.tC<p>Update: 0</p>|
|Device temperature (°F)|Internal device temperature in Fahrenheit|`Dependent item`|shellyplus1pm.status.switch0.temperature.tF<p>Update: 0</p>|
|MAC address|Device MAC address|`Dependent item`|shellyplus1pm.status.sys.mac<p>Update: 0</p>|
|Restart required|Whether a restart is required|`Dependent item`|shellyplus1pm.status.sys.restart_required<p>Update: 0</p>|
|Current time|Current device time|`Dependent item`|shellyplus1pm.status.sys.time<p>Update: 0</p>|
|Unix timestamp|Current Unix timestamp|`Dependent item`|shellyplus1pm.status.sys.unixtime<p>Update: 0</p>|
|Uptime|Device uptime in seconds|`Dependent item`|shellyplus1pm.status.sys.uptime<p>Update: 0</p>|
|RAM size|Total RAM size in bytes|`Dependent item`|shellyplus1pm.status.sys.ram_size<p>Update: 0</p>|
|RAM free|Free RAM in bytes|`Dependent item`|shellyplus1pm.status.sys.ram_free<p>Update: 0</p>|
|Filesystem size|Total filesystem size in bytes|`Dependent item`|shellyplus1pm.status.sys.fs_size<p>Update: 0</p>|
|Filesystem free|Free filesystem space in bytes|`Dependent item`|shellyplus1pm.status.sys.fs_free<p>Update: 0</p>|
|WiFi IP address|Current WiFi IP address|`Dependent item`|shellyplus1pm.status.wifi.sta_ip<p>Update: 0</p>|
|WiFi status|Current WiFi connection status|`Dependent item`|shellyplus1pm.status.wifi.status<p>Update: 0</p>|
|WiFi SSID|Connected WiFi network SSID|`Dependent item`|shellyplus1pm.status.wifi.ssid<p>Update: 0</p>|
|WiFi RSSI|WiFi signal strength in dBm|`Dependent item`|shellyplus1pm.status.wifi.rssi<p>Update: 0</p>|
|Websocket connection state|Current state of websocket connection|`Dependent item`|shellyplus1pm.status.ws.connected<p>Update: 0</p>|

### Firmware Monitoring

|Name|Description|Type|Key and additional info|
|----|-----------|----|-------|
|Device info gatherer|Gathers device information including firmware version|`HTTP agent`|shellyplus1pm.info<p>Update: 12h</p>|
|Firmware update check|Checks for available firmware updates from all channels|`HTTP agent`|shellyplus1pm.firmware.check<p>Update: 12h</p>|
|Current firmware version|Current firmware version installed on device|`Dependent item`|shellyplus1pm.info.fw_id<p>Update: 0</p>|
|Stable firmware available|Whether a stable firmware update is available|`Dependent item`|shellyplus1pm.firmware.stable.available<p>Update: 0</p>|
|Stable firmware version|Version of available stable firmware update|`Dependent item`|shellyplus1pm.firmware.stable.version<p>Update: 0</p>|

## Triggers

### System and Connectivity Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|------------------------------|
|Shelly Plus 1PM: No data received for >3m|No data received from device for more than 3 minutes|`nodata(/Shelly Plus 1PM/shellyplus1pm.status,180s)=1`|Warning|<p>Manual close: YES</p>|
|Shelly Plus 1PM: Cloud connection state has changed|Cloud connection state has changed|`change(/Shelly Plus 1PM/shellyplus1pm.status.cloud.connected)<>0`|Warning|<p>Manual close: YES</p>|
|Shelly Plus 1PM: Input state has changed|Input state has changed|`change(/Shelly Plus 1PM/shellyplus1pm.status.input0.state)<>0`|Info|<p>Manual close: YES</p>|
|Shelly Plus 1PM: MQTT connection state has changed|MQTT connection state has changed|`change(/Shelly Plus 1PM/shellyplus1pm.status.mqtt.connected)<>0`|Warning|<p>Manual close: YES</p>|
|Shelly Plus 1PM: Switch state has changed|Switch output state has changed|`change(/Shelly Plus 1PM/shellyplus1pm.status.switch0.output)<>0`|Warning|<p>Manual close: YES</p>|
|Shelly Plus 1PM: Device temperature is high|Device temperature is high (>70°C)|`last(/Shelly Plus 1PM/shellyplus1pm.status.switch0.temperature.tC)>70`|Average|<p>-</p>|
|Shelly Plus 1PM: Device temperature is very high|Device temperature is very high (>85°C)|`last(/Shelly Plus 1PM/shellyplus1pm.status.switch0.temperature.tC)>85`|High|<p>-</p>|
|Shelly Plus 1PM: Time is out of sync|Time is out of sync|`fuzzytime(/Shelly Plus 1PM/shellyplus1pm.status.sys.unixtime,60s)=0`|Warning|<p>-</p>|
|Shelly Plus 1PM: Device has been restarted (Uptime <10m)|Device has been restarted|`last(/Shelly Plus 1PM/shellyplus1pm.status.sys.uptime)<600`|Warning|<p>-</p>|
|Shelly Plus 1PM: Filesystem usage >=80%|Filesystem usage >=80%|`(last(/Shelly Plus 1PM/shellyplus1pm.status.sys.fs_free)/last(/Shelly Plus 1PM/shellyplus1pm.status.sys.fs_size))<0.2`|Warning|<p>-</p>|
|Shelly Plus 1PM: Filesystem usage >=90%|Filesystem usage >=90%|`(last(/Shelly Plus 1PM/shellyplus1pm.status.sys.fs_free)/last(/Shelly Plus 1PM/shellyplus1pm.status.sys.fs_size))<0.1`|Average|<p>-</p>|
|Shelly Plus 1PM: WiFi connection is down|WiFi connection is down|`find(/Shelly Plus 1PM/shellyplus1pm.status.wifi.status,,"regex","^(got ip)$")=0`|Average|<p>-</p>|
|Shelly Plus 1PM: WiFi signal is weak|WiFi signal is weak (<-80 dBm)|`last(/Shelly Plus 1PM/shellyplus1pm.status.wifi.rssi)<-80`|Warning|<p>-</p>|

### Firmware Monitoring Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|------------------------------|
|Shelly Plus 1PM: Stable firmware update available|Stable firmware update is available for download|`last(/Shelly Plus 1PM/shellyplus1pm.firmware.stable.available)=1`|Info|<p>Manual close: YES</p>|
|Shelly Plus 1PM: Firmware version has changed|Device firmware version has changed (updated or downgraded)|`change(/Shelly Plus 1PM/shellyplus1pm.info.fw_id)<>0`|Warning|<p>Manual close: YES</p>|

## Key Differences from Gen1 (Shelly 1PM)

### API Changes
- **Endpoint**: Uses `/rpc/Shelly.GetStatus` instead of `/status`
- **Authentication**: HTTP Digest authentication (instead of basic auth)
- **Data Structure**: Nested JSON structure with component namespaces (e.g., `switch:0`, `input:0`)
- **Field Names**: 
  - `apower` instead of `power` for active power
  - `aenergy` instead of `total` for energy consumption
  - Component-specific temperature under `switch:0.temperature`
  - More detailed system information (RAM, filesystem)

### New Features in Gen2
- **Enhanced Energy Tracking**: Per-minute energy consumption arrays
- **Better System Monitoring**: Detailed RAM and filesystem usage
- **Improved Networking**: Better WiFi status reporting
- **Component Architecture**: Modular component system (switch, input, sys, wifi, etc.)
- **Firmware Monitoring**: Built-in update checking and version tracking for security compliance

### Missing Gen1 Features
- No external sensor support in this template (would require different endpoints)
- No timer-based functionality monitoring (timers are event-based)

## Troubleshooting

### Common Issues

**1. Authentication Failed (401 Unauthorized)**
- Verify the device has authentication enabled
- Check {$SHELLYPWD} and {$SHELLYPWD_USER} macros are correctly set
- Ensure the password contains no special characters that need escaping

**2. Connection Timeout**
- Verify the device IP address in host interface
- Check network connectivity between Zabbix server and device
- Ensure the device is powered on and accessible

**3. No Data Items**
- Check that the main "Status gatherer" item is collecting data
- Verify JSON parsing by checking the raw data from the gatherer item
- Ensure device firmware supports the Gen2 RPC API

**4. Wrong Device Type**
- This template is for Shelly Plus 1PM (Gen2) only
- For Shelly 1PM (Gen1), use the separate Gen1 template
- Verify device generation with `/rpc/Shelly.GetDeviceInfo`

### API Testing

Test the API directly with curl:
```bash
# Without authentication
curl http://[DEVICE_IP]/rpc/Shelly.GetStatus
curl http://[DEVICE_IP]/rpc/Shelly.GetDeviceInfo
curl http://[DEVICE_IP]/rpc/Shelly.CheckForUpdate

# With authentication
curl --digest -u admin:password http://[DEVICE_IP]/rpc/Shelly.GetStatus
curl --digest -u admin:password http://[DEVICE_IP]/rpc/Shelly.GetDeviceInfo
curl --digest -u admin:password http://[DEVICE_IP]/rpc/Shelly.CheckForUpdate
```

### Firmware Compatibility

- **Minimum Firmware**: No specific minimum required (Gen2 devices ship with RPC API)
- **Tested Firmware**: 1.7.0 and later
- **API Version**: Gen2 RPC API (all Gen2 devices)

## Production Notes

**✅ Deployment Confirmed**: This template is actively deployed and tested on production Zabbix 7.0.17 servers.

**📊 Monitoring Coverage**:
- ✅ 27 items collecting comprehensive device metrics
- ✅ Real-time power consumption and energy tracking  
- ✅ Proactive firmware update notifications
- ✅ System health monitoring (temperature, memory, storage)
- ✅ Network connectivity and performance tracking

**🔧 Maintenance**: Template auto-updates existing items when redeployed, ensuring seamless upgrades.

## Feedback

Please report any issues with the template at the official Zabbix community template repository.

## Firmware Monitoring Features

This template includes comprehensive firmware monitoring capabilities:

### Automatic Update Detection
- **Stable Branch Monitoring**: Monitors for stable firmware releases only (ignores beta/development versions)
- **Update Interval**: Checks for updates every 12 hours to balance freshness with server load
- **Smart Detection**: Uses JavaScript preprocessing to handle cases where only beta updates are available

### Version Change Tracking
- **Security Compliance**: Tracks firmware version changes for audit and security compliance
- **Change Detection**: Triggers warning when firmware version changes (updates or downgrades)
- **Version History**: Maintains current firmware version for comparison

### Configuration
- **Configurable Polling**: Device status polling interval is configurable via `{$POLLING_INTERVAL}` macro (default: 60s)
- **Fixed Firmware Checks**: Firmware update checks run every 12 hours (not configurable to reduce API load)

### API Endpoints Used
- `/rpc/Shelly.GetDeviceInfo` - Retrieves current firmware version
- `/rpc/Shelly.CheckForUpdate` - Checks all update channels (stable, beta, etc.)


