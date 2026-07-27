# Reolink Camera by HTTP

This template provides native, agentless monitoring for Reolink IP cameras via the built-in HTTP/HTTPS CGI API gateway.

It has been tested on the RLC-520A and may well work on other models in the line.

## Overview

The template collects hardware info, some performance logs, and local storage information using Zabbix HTTP Agent bulk item parsing.

## Requirements

* **Zabbix Version:** 7.0 or higher.
* **Camera API Configuration:** Reolink disables the web server by default on several modern hardware versions. You must enable it before Zabbix can pull data:
  1. Open the Reolink Desktop Client or log directly into the camera's standalone Web UI.
  2. Navigate to **Device Settings** > **Network** > **Advanced** > **Server Settings**.
  3. Ensure that **HTTP** or **HTTPS** is checked and enabled.
  4. Optionally test by navigating to http://YOUR_CAMERA_IP:CAMERA_HTTP_PORT/cgi-bin/api.cgi?cmd=GetAbility&user=admin&password=YOUR_PASSWORD    You should see a screen full of JSON info.

---

## Setup & Installation

1. Import the `template_reolink_camera_http.yaml` file into your Zabbix server web interface.
2. Link the template to your destination camera hosts.
3. Consider also linking the official **ICMP Ping** template.  This gives more information, and helps make network issues easy to separate from API issues.
4. Enter the required macro definitions listed below.  Time periods should be at least twice interval times.

### Macros Used

| Macro                      | Description                                                             | Default Value |
|:-------------------------- |:----------------------------------------------------------------------- |:------------- |
| `{$REOLINK.USER}`          | Username assigned to the camera monitoring account.                     | `admin`       |
| `{$REOLINK.PASSWORD}`      | Password assigned to the camera monitoring account.                     | *Required*    |
| `{$REOLINK.PORT}`          | Access port utilized by the camera's internal web handler.              | `443`         |
| `{$REOLINK.PROTOCOL}`      | Specify http or https protocol used by camera web handler.              | `https`       |
| `{$REOLINK.DELAY.DEVICE}`  | Check interval for static hardware identification info.                 | `1h`          |
| `{$REOLINK.DELAY.PERF}`    | Polling intervals for engine execution and processing diagnostics.      | `10m`         |
| `{$REOLINK.DELAY.STORAGE}` | Interval for checking the physical allocation maps of local storage.    | `10m`         |
| `{$REOLINK.NODATA.TIME}`   | Grace period before triggering an alert on missing API data.            | `20m`         |
| `{$REOLINK.CPU.TIME}`      | Time period over which CPU utilization must remain elevated to trigger. | `20m`         |

---

## Template Components

### Collected Items

| Component       | Item Name                       | Key                              | Type       | Description                                                         |
|:--------------- |:------------------------------- |:-------------------------------- |:---------- |:------------------------------------------------------------------- |
| **Device**      | Reolink: Get device info        | `reolink.device.get`             | HTTP Agent | Bulk raw master output for device specifications.                   |
| **Device**      | Reolink: Camera model           | `reolink.device.model`           | Dependent  | Hardware classification name.                                       |
| **Device**      | Reolink: Serial number          | `reolink.device.serial`          | Dependent  | Hardcoded manufacturer motherboard serial index.                    |
| **Device**      | Reolink: Firmware version       | `reolink.device.firmware`        | Dependent  | Current running system software version.                            |
| **Device**      | Reolink: Hardware version       | `reolink.device.hardware`        | Dependent  | Base architecture board identifier.                                 |
| **Device**      | Reolink: Device name            | `reolink.device.name`            | Dependent  | User-assigned network hostname.                                     |
| **Performance** | Reolink: Get performance info   | `reolink.performance.get`        | HTTP Agent | Bulk data poll for runtime operational state.                       |
| **Performance** | Reolink: CPU usage              | `reolink.performance.cpu`        | Dependent  | Percentage of core system chip capacity used.                       |
| **Performance** | Reolink: Network throughput     | `reolink.performance.throughput` | Dependent  | Real-time payload transfer rate in Kbps.                            |
| **Storage**     | Reolink: Get storage info       | `reolink.storage.get`            | HTTP Agent | Bulk array mapping local hardware blocks.                           |
| **Storage**     | Reolink: Storage total capacity | `reolink.storage.total_capacity` | Dependent  | Total hardware capability boundaries of the SD card/drive (MB).     |
| **Storage**     | Reolink: Storage free space     | `reolink.storage.free`           | Dependent  | Remaining space before overwrites start (MB).                       |
| **Storage**     | Reolink: Storage status         | `reolink.storage.format`         | Dependent  | Tracks internal file layout correctness (1 = Formatted, 0 = Error). |
| **Storage**     | Reolink: Storage present        | `reolink.storage.mount`          | Dependent  | Physical status of the media bus slot (1 = Mounted, 0 = Missing).   |

### Triggers

| Name                                            | Expression                                                                                                                  | Severity | Description                                                                                               |
|:----------------------------------------------- |:--------------------------------------------------------------------------------------------------------------------------- |:-------- |:--------------------------------------------------------------------------------------------------------- |
| **Reolink: HTTP API service is down**           | `nodata(/Reolink Camera by HTTP/reolink.performance.get,{$REOLINK.NODATA.TIME})=1`                                          | Average  | Zabbix has not received data updates from the API. The web service may be locked or disabled.             |
| **Reolink: High CPU usage**                     | `min(/Reolink Camera by HTTP/reolink.performance.cpu,{$REOLINK.CPU.TIME})>90`                                               | Warning  | Core system tasks are constrained, which could drop incoming recording frames.                            |
| **Reolink: Storage error or unformatted**       | `last(/Reolink Camera by HTTP/reolink.storage.format)=0`                                                                    | High     | The filesystem has crashed or requires formatting. No local video history is being recorded.              |
| **Reolink: Storage missing**                    | `last(/Reolink Camera by HTTP/reolink.storage.mount)=0`                                                                     | High     | The SD card or target hard drive has been physical removed or completely failed on the hardware bus.      |
| **Reolink: Storage space very low (under 10%)** | `last(/Reolink Camera by HTTP/reolink.storage.free) > (last(/Reolink Camera by HTTP/reolink.storage.total_capacity) * 0.1)` | Warning  | Local buffer spaces are minimal. Flapping is handled natively via an explicit system recovery expression. |

### Visualizations & Graphs

The package provisions native layout objects mapping the following metrics over runtime cycles:

* **CPU Usage** (Continuous filled region map mapping resource footprints against 100% capacity bounds).
* **Network Throughput** (Data flow constraints mapping dynamic device interface activity).
* **Storage Free Space** (A progressive volume layout tracking usage trends on local media).

## License

MIT License. Feel free to modify, extend, or alter this layout structure for other models in the Reolink portfolio. Pull requests and optimizations are always welcome!
