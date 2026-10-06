# BCS NVR by SNMP
## CREATED BY TOMASZ WIĘCASZEK
## Overview

This template monitors BCS network video recorders (NVRs) over SNMP.

It uses the BCS enterprise OID tree:

`1.3.6.1.4.1.1004849`

The template was built from SNMP data observed on a BCS NVR and is intended for community testing on additional BCS models.

## Requirements

- Zabbix 7.0
- SNMP enabled on the NVR
- A Zabbix host with an SNMP interface configured
- Network access from the Zabbix server or proxy to UDP/161 on the NVR

## Tested versions

| Device | Firmware | Zabbix | SNMP |
|---|---|---|---|
| BCS-L-NVR1602-A-4KE-16P(2) | 4.005.00NS004.0.R | 7.0 | v2c |

Other BCS models using the same enterprise tree may work, but have not yet been verified.

## Configuration

Create a host for the NVR, configure its SNMP interface and credentials, and link the template **BCS NVR by SNMP**.

The following user macros can be overridden on the host:

| Macro | Default | Description |
|---|---:|---|
| `{$BCS.NVR.NODATA.TIME}` | `5m` | Time without NVR uptime data before the availability trigger fires. |
| `{$BCS.NVR.CAMERA.OFFLINE.TIME}` | `3m` | Time a camera must remain without a `Connected` state before an alert is generated. |
| `{$BCS.NVR.DISK.STATUS.OK}` | `Running` | Expected healthy physical disk status. |
| `{$BCS.NVR.VOLUME.STATUS.OK}` | `LvAvailable` | Expected healthy logical-volume status. |

SNMP credentials are configured on the host SNMP interface and are not stored in the template.

## Discovery

### Camera discovery

The template automatically discovers configured camera channels.

For each discovered camera it collects:

- channel index
- camera IP address
- camera name
- connection status
- main-stream codec
- main-stream FPS
- main-stream resolution
- main-stream bitrate

Observed connection states include `Connected` and `Unconnect`.

### Disk discovery

The template automatically discovers physical disks exposed by the NVR and monitors their status.

The healthy physical disk state observed during testing is `Running`.

## Metrics

The template collects the following NVR-level information:

- model
- firmware/build information
- software version
- device name
- operating system
- kernel version
- uptime
- raw logical-volume state
- logical-volume health

Logical-volume health is calculated from the raw state. It is healthy only when every reported logical-volume status equals `{$BCS.NVR.VOLUME.STATUS.OK}`.

## Triggers

- **BCS NVR: No SNMP data for 5 minutes**  
  Fires when uptime data is not received within `{$BCS.NVR.NODATA.TIME}`.

- **BCS NVR: Device has recently restarted**  
  Indicates a recent NVR restart based on uptime.

- **BCS NVR: Camera ... is disconnected**  
  Fires when a discovered camera does not report `Connected` for `{$BCS.NVR.CAMERA.OFFLINE.TIME}`.

- **BCS NVR: Disk ... is not Running**  
  Fires when a discovered physical disk differs from `{$BCS.NVR.DISK.STATUS.OK}`.

- **BCS NVR: Logical volume is not available**  
  Fires when at least one logical volume differs from `{$BCS.NVR.VOLUME.STATUS.OK}`.

## Dashboard

The template includes a basic **BCS NVR overview** dashboard with:

- NVR uptime
- logical-volume health
- current problems

## Known limitations

- The template has currently been verified on one BCS NVR model/firmware combination.
- Some camera names can be returned as `Hex-STRING` depending on character encoding and device firmware.
- Offline channels may not expose stream parameters.
- Large full-tree `snmpwalk` operations may occasionally time out while NVR configuration is being changed.
- Per-camera recording-state monitoring is intentionally not included. Testing did not identify a reliable SNMP OID that unambiguously means “this connected camera is currently being recorded”.
- The logical-volume raw-state OID was verified on the tested unit. Additional models with different disk layouts should be validated before declaring compatibility.

## Troubleshooting

Verify vendor-tree access with:

```bash
snmpwalk -On -v2c -c COMMUNITY NVR_IP 1.3.6.1.4.1.1004849
```

For camera information:

```bash
snmpwalk -On -v2c -c COMMUNITY NVR_IP 1.3.6.1.4.1.1004849.2.10.2
```

For storage information:

```bash
snmpwalk -On -v2c -c COMMUNITY NVR_IP 1.3.6.1.4.1.1004849.2.4
```

Do not expose SNMP directly to untrusted networks.

## Feedback and compatibility reports

When reporting support for another BCS model, please include:

- NVR model
- firmware version
- Zabbix version
- SNMP version
- sanitized SNMP output for the relevant vendor-tree branches
- any unsupported items, discovery rules, or triggers

Do not publish SNMP community strings, public IP addresses, serial numbers, or site-specific sensitive data.

## Author

Community contribution prepared from real-device SNMP testing.

## License

MIT
