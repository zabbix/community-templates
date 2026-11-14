# Trassir-server

## Overview

Template for TRASSIR CCTV servers (DVR / NVR / VMS) for Zabbix 7.0 and newer.

The template polls the TRASSIR SDK web API (`/health`) with a single HTTP agent item and derives all metrics from the returned JSON with dependent items: SDK availability, disks / database / network / automation status, online and total channels, CPU load, uptime and archive depth.

It is an updated version of the [6.0 template](../6.0) by vanomel. Changes compared to 6.0:

- no linked ICMP template and no extra host groups; the template is self-contained;
- connection scheme is configurable (`{$TRASSIR_SCHEME}`), `{HOST.CONN}` is used instead of `{HOST.IP}`, so hosts with DNS names work;
- SDK status check reworked: a response with `error_code` (e.g. wrong password) is reported as an SDK error;
- SDK password is a secret macro;
- CPU threshold moved to a macro, new "channels offline" item, graphs for channels and archive depth;
- all descriptions are in English.

Template, item, trigger and graph UUIDs are kept, so the template can be imported over the 6.0 version.

## Requirements

- TRASSIR server with the web server and TRASSIR SDK enabled.
- Zabbix 7.0 LTS or newer. Tested on Zabbix 7.4.11.
- Network access from Zabbix server / proxy to the TRASSIR web server port.

## Setup

1. In TRASSIR: open **Server settings** -> **Web server**.
   - Enable the web server (default port: `8080`).
   - Enable **TRASSIR SDK** and set the **SDK password**.
2. In Zabbix: import `template_trassir_cctv_dvr_sdk.yaml`.
3. Create a host with any interface (e.g. Agent) holding the IP address or DNS name of the TRASSIR server. The interface is only used to resolve `{HOST.CONN}`.
4. Link the `Trassir-server` template to the host.
5. Set the host macro `{$TRASSIR_SDK_PASS}`. Change `{$TRASSIR_SCHEME}` / `{$TRASSIR_SDK_PORT}` if the server does not use HTTPS on port 8080.

TLS certificate verification is disabled in the HTTP agent item, because TRASSIR servers normally use a self-signed certificate.

## Macros used

| Macro | Default | Description |
|---|---|---|
| `{$TRASSIR_SDK_PASS}` | *(empty, secret)* | TRASSIR SDK password. Required. |
| `{$TRASSIR_SCHEME}` | `https` | Request scheme of the TRASSIR web server: `https` or `http`. |
| `{$TRASSIR_SDK_PORT}` | `8080` | Port of the TRASSIR web server / SDK. |
| `{$TRASSIR_ARCHIVE_DEPTH}` | `7` | Minimal acceptable archive depth of the main stream, in days. |
| `{$TRASSIR_CPU_LOAD_MAX}` | `85` | CPU load threshold for the high CPU load trigger, in %. |

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

| Name | Description | Type | Key |
|---|---|---|---|
| Trassir server health string | Raw JSON returned by `/health`, master item | HTTP agent | `trassirhealthjson` |
| Trassir SDK connection status | 1 - valid health data, 0 - the SDK returned an error (e.g. wrong password) | Dependent item | `trassirsdkstatus` |
| Trassir disks status | Errors in the operation of archive disks | Dependent item | `trassirdisks` |
| Trassir database status | Errors in the connection to the server database | Dependent item | `trassirdatabase` |
| Trassir network status | Errors in network connections to other servers | Dependent item | `trassirnetwork` |
| Trassir automation status | Errors while executing scripts | Dependent item | `trassirautomation` |
| Trassir channels total | Total number of connected channels (cameras) | Dependent item | `trassirchannelstotal` |
| Trassir channels online | Number of channels working without errors | Dependent item | `trassirchannelsonline` |
| Trassir channels offline | Total minus online | Dependent item | `trassirchannelsoffline` |
| Trassir archive main days depth | Archive depth of the main stream, days | Dependent item | `trassirdisksstatmaindays` |
| Trassir archive sub days depth | Archive depth of the sub stream, days | Dependent item | `trassirdisksstatsubsdays` |
| Trassir archive privilege days depth | Archive depth of privileged channels, days | Dependent item | `trassirdisksstatprivdays` |
| Trassir server cpu load | CPU load, % | Dependent item | `trassircpuload` |
| Trassir server uptime | Time since the server was started | Dependent item | `trassiruptime` |

Status items use the value map `Trassir status`: `0` - errors detected, `1` - no errors detected.

## Triggers

| Name | Severity | Condition |
|---|---|---|
| No new data from trassir server | High | No response from `/health` for 5 minutes |
| Wrong data from trassir server | High | The SDK returned an error instead of health data (check the password). Depends on "No new data from trassir server" |
| Trassir server cpu load too high | High | Average CPU load over 5 checks is above `{$TRASSIR_CPU_LOAD_MAX}` |
| Not all cams online on trassir server | Average | Online channels are below total channels for 5 checks |
| Trassir server disks problem | Average | Disk errors for 2 checks, manual close allowed |
| Trassir server database problem | Average | Database errors for 2 checks, manual close allowed |
| Trassir server network problem | Average | Network errors for 2 checks, manual close allowed |
| Trassir server automation problem | Average | Script errors for 2 checks, manual close allowed |
| Archive depth on main channels is too low | Average | Main stream archive depth is below `{$TRASSIR_ARCHIVE_DEPTH}` days for 5 checks |
| Trassir server was restarted | Warning | Uptime is below 5 minutes, manual close allowed |

## Graphs

- Trassir server cpu load
- Trassir channels
- Trassir archive depth

## Feedback

Please report any issues with the template at https://github.com/zabbix/community-templates/issues
