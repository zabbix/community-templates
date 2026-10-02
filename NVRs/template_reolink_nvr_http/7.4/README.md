# Reolink NVR by HTTP

Zabbix 7.4 template for monitoring a Reolink NVR and its connected cameras through the local HTTP API. Camera information and recordings are queried through the NVR; direct camera network access is not required.

## Repository structure

The template is stored at `NVRs/template_reolink_nvr_http/7.4/`:

- `template_reolink_nvr_http.yaml`: importable Zabbix template.
- `README.md`: setup, monitored data, alarms and limitations.

GitHub may display `NVRs/template_reolink_nvr_http/7.4` as one combined directory link when each intermediate directory contains only one subdirectory. These are still three nested directories.

## Setup

1. Enable HTTP or HTTPS in the NVR network/server settings.
2. Import `template_reolink_nvr_http.yaml` into Zabbix 7.4 and link the template to the NVR host.
3. Configure the host macros:
   - `{$REOLINK.URL}`: base URL including scheme and optional port, without a trailing slash.
   - `{$REOLINK.USER}`: NVR account.
   - `{$REOLINK.PASS}`: NVR password, stored as a secret macro.
4. Set `{$REOLINK.API.PATH}` to `api.cgi` or `cgi-bin/api.cgi`, depending on firmware.
5. Enable automatic host inventory to populate NVR model, hardware, installed firmware and serial.
6. Keep the Zabbix server/proxy clock synchronized. The NVR clock check uses its reported timezone and active daylight-saving state; no manual seasonal offset is required.
7. Leave performance collection disabled until `GetPerformance` has been tested successfully on the NVR.

Credentials are sent as API query parameters. Use HTTPS when supported; HTTP transmits them without encryption.

## What is monitored

| Scope | Monitored data | API command | Default interval |
|---|---|---|---|
| NVR identity | Name, model, hardware version, installed firmware and reported serial | GetDevInfo | 1 minute |
| API health | JSON validity, explicit authentication failures, other device API errors and availability | GetDevInfo | 1 minute |
| Cameras | Discovery, channel, name and online/offline status | GetChannelstatus | 1 minute, one request for all channels |
| Camera identity | Model (`typeInfo`), hardware (`boardInfo`) and installed firmware (`firmVer`) | GetChnTypeInfo, POST | 1 hour per camera, shared by the three fields |
| Camera recordings | Time since the latest positive-size recorded file in a 26-hour search window | GetTime + Search, POST | 2 hours per camera |
| Storage | Discovery, presence/mount state, mount/format checks, storage readiness, total capacity and free space | GetHddInfo | 5 minutes, one request for all disks |
| Storage temperature | Temperature, only when the firmware supplies it | GetHddInfo | Same 5-minute storage request |
| NVR clock | Absolute difference between NVR UTC time and Zabbix server/proxy time | GetTime | Once per day |
| Optional performance | CPU utilization and network throughput | GetPerformance | 10 minutes; disabled by default |

Camera UID/serial collection and its change alert have been removed. The NVR serial item remains.

Raw master items such as Recording search have history disabled. They may appear without a saved value in Latest data; their dependent items, such as Time since last recording, retain the useful measurements. Item testing or Execute now can be used for troubleshooting.

## What generates an alarm

The conditions below describe the current template defaults. All alarms are high severity except invalid JSON, unavailable channel/storage API data, other device API errors, high CPU and high disk temperature, which are warnings.

| Alarm | Condition |
|---|---|
| NVR offline / API not responding | No GetDevInfo data for 15 minutes |
| Invalid API JSON | GetDevInfo response is not valid JSON |
| Authentication failure | Explicit authentication-error text detected in GetDevInfo response |
| Device API command failed | Parseable JSON contains another unsuccessful GetDevInfo response |
| Channel API data unavailable | No valid channel data for 15 minutes |
| Storage API data unavailable | No valid storage data for 15 minutes |
| Camera offline | A discovered camera reports `online = 0` |
| No camera recordings for more than 24 hours | Latest positive-size file end time is more than 86400 seconds behind the NVR clock; no files in the 26-hour window also exceeds this limit |
| Recording check unavailable | No successful recording-search result for 6 hours |
| HDD missing | A previously discovered disk is absent or not mounted |
| HDD error / unmounted / unformatted | Mount or format flags indicate a problem, an explicit textual error state is reported, or the discovered disk is missing |
| Storage not ready | Discovered disk does not have `mount = 1`, `format = 1` and positive capacity |
| High HDD temperature | Reported temperature exceeds 55 °C |
| NVR clock difference | Absolute UTC clock difference exceeds 300 seconds (5 minutes) |
| Clock check unavailable | No successful clock measurement for 3 days |
| High CPU, optional | CPU utilization remains above 90% for 20 minutes, when performance collection is enabled |

## Recording checks

Each camera search reads the NVR clock and requests main-stream recordings from the preceding 26 hours. Positive-size files are examined and the largest `EndTime` is compared with that clock. `PlaybackTime` is not used for recording age.

- No files in the window produces a capped age of 26 hours, sufficient to trigger the default 24-hour alarm.
- API failures produce an unsupported/check-unavailable condition, rather than being interpreted as an absence of recordings.
- A 2-hour polling interval means the 24-hour threshold is normally detected at the next successful check, potentially up to about 2 hours later.
- Motion-only cameras can legitimately have no files while a store is closed. Adjust the threshold for cameras that can remain inactive longer than 24 hours.
- Indexed positive-size files provide evidence of recording; they do not prove that video is playable, intact or visually useful.
- File closure delays, clock changes and firmware-specific search behavior can affect the result.

## Clock checks

The daily check converts the NVR wall clock to UTC using Reolink's reported `Time.timeZone` and, when active, `Time.isDst` and `Dst.offset`. It compares that UTC time with the Zabbix server/proxy system clock.

This verifies clock synchronization. It does not verify that the NVR is configured for the correct geographic timezone. A correctly synchronized NVR can display another timezone without triggering this alarm.

The obsolete `{$REOLINK.TIME.UTC.OFFSET}` macro is no longer used and can be removed from host overrides. Daily polling means clock problems and recoveries may take up to one day to be detected.

## Configuration macros

| Macro | Default | Purpose |
|---|---|---|
| `{$REOLINK.URL}` | http://CHANGE_ME | NVR base URL |
| `{$REOLINK.USER}` | admin | NVR account |
| `{$REOLINK.PASS}` | Secret | NVR password |
| `{$REOLINK.API.PATH}` | api.cgi | API endpoint path |
| `{$REOLINK.DELAY.DEVICE}` | 1m | Device/API collection |
| `{$REOLINK.DELAY.CHANNELS}` | 1m | Bulk camera-status collection |
| `{$REOLINK.DELAY.CAMERA.INFO}` | 1h | Camera identity collection |
| `{$REOLINK.DELAY.STORAGE}` | 5m | Bulk disk collection |
| `{$REOLINK.DELAY.RECORDING}` | 2h | Recording search per camera |
| `{$REOLINK.RECORDING.MAX.AGE}` | 86400 | Recording-age alarm threshold, seconds |
| `{$REOLINK.TIME.DIFF.MAX}` | 300 | Clock-difference threshold, seconds |
| `{$REOLINK.NODATA.TIME}` | 15m | Device/channel/storage no-data grace period |
| `{$REOLINK.HDD.TEMP.MAX}` | 55 | Disk-temperature threshold, °C |
| `{$REOLINK.DELAY.PERF}` | 10m | Optional performance polling |
| `{$REOLINK.CPU.MAX}` | 90 | CPU threshold, percent |
| `{$REOLINK.CPU.TIME}` | 20m | High-CPU evaluation window |

The clock polling interval is set to `1d` in its item. The recording-search and clock-check no-data grace periods are respectively 6 hours and 3 days. Review these if changing their polling intervals.

## Storage and compatibility limitations

- Storage readiness confirms mounting, formatting and positive capacity; it does not prove recording.
- Presence/error/readiness alarms apply to discovered disks. A global alarm for an NVR that has never discovered any disk is not included.
- Capacity and free space are converted from the assumed MiB API values to bytes. Confirm this against the NVR Storage screen.
- Free space reaching zero does not generate an alarm: cyclic recording can normally fill the disk.
- Temperature is collected only when reported as `temperature`, `temp` or `hddTemp`. This is not SMART monitoring.
- Optional network throughput uses the inherited conversion of `netThroughput` multiplied by 1000 to bps; verify the API unit before relying on it.
- API support varies with hardware and firmware. GetAbility advertising a feature does not guarantee a successful command.
- Camera discovery retains lost resources for 30 days and excludes fully unidentified empty channels. A channel disappearing entirely may leave a dependent item unsupported instead of returning offline.
- No firmware installation, online firmware-update checks or external scripts are included.

## Updating an existing installation

Import with Update existing and Create new for the relevant items, discovery rules and item prototypes. Host macro overrides take precedence over template defaults.

When upgrading from a version containing camera UID collection, review the import preview and use Delete missing for item prototypes to remove the obsolete UID prototype and its change alert. Review other deletions before applying them.

## Validation and credits

API samples for camera identity, channel status, disk data, recording search and NVR time were supplied by the contributor. YAML parsing and JavaScript sample checks were performed; these do not establish compatibility with every Reolink NVR or replace live Zabbix execution tests.

Based on the contributor's Reolink NVR template and Reolink Camera by HTTP from `Unsorted/template_reolink_camera_http/7.4`. The initial working baseline was commit `9e8edc9a`; subsequent changes add camera identity, recording and clock checks and remove camera UID collection.
