# Reolink NVR by HTTP

Zabbix 7.4 template for Reolink NVRs using the local HTTP API. Combines NVR camera/HDD discovery with bulk collection and performance metrics from the community camera template.

## Setup

1. Enable HTTP or HTTPS in the NVR network/server settings.
2. Import `template_reolink_nvr_http.yaml` and link it to the NVR host.
3. Configure a host interface with the NVR IP address or DNS name and select the appropriate Connect to option. `{HOST.CONN}` uses this interface address; the technical Host name can remain a descriptive label. An Agent interface can supply the address without installing an agent on the NVR.
4. Set `{$REOLINK.USER}` and secret `{$REOLINK.PASS}`. HTTP on port 80 is the default; for HTTPS use `{$REOLINK.PROTOCOL}=https` and `{$REOLINK.PORT}=443`, or your custom port.
5. Set `{$REOLINK.API.PATH}` to `api.cgi` or `cgi-bin/api.cgi` as supported by the firmware.
6. Enable automatic host inventory to populate model, hardware, installed firmware and serial.
7. Review polling macros, API no-data timeout and the HDD temperature threshold (55 C).
8. Optionally enable `Reolink: Get performance info` after testing `GetPerformance` on your NVR. This master item is disabled by default.

## Collection

| Command | Default interval | Data |
|---|---|---|
| GetDevInfo | 1 minute | Device identity, inventory, JSON/authentication/API health |
| GetChannelstatus | 1 minute | All cameras: discovery, name, model, online state and UID changes |
| GetHddInfo | 5 minutes | All disks: discovery, mount/format checks, storage readiness, temperature, capacity and free space |
| GetPerformance | 10 minutes, disabled initially | CPU and network throughput |

Discovery and camera/disk item prototypes are dependent items. Adding cameras or disks does not add HTTP requests. Default enabled collection averages 2.2 requests per minute per NVR. API availability timeout defaults to 15 minutes and must exceed the longest enabled polling interval.

## Alerts and limitations

- Camera offline and UID changes remain enabled. Discovery retains lost cameras/disks for 30 days; fully unidentified empty channels are excluded. A channel disappearing entirely may leave its dependent item unsupported instead of returning offline: verify actual firmware behavior during commissioning.
- Invalid command responses are rejected before channel/disk extraction, rather than being interpreted as empty discovery or failed disks. Per-command no-data alerts identify unavailable channel/storage data.
- Authentication alerts require explicit authentication error text. Other API errors and invalid JSON have separate diagnostics; undocumented error codes are not assumed to be authentication failures.
- HDD storage readiness means mounted, formatted and positive capacity. It does **not** prove recording is taking place. HDD checks do not replace SMART diagnostics.
- Temperature is collected only if the API provides temperature, temp or hddTemp. Missing readings are discarded; no fake 0/-1 C is stored.
- Capacity/free-space conversion follows the supplied camera template: capacity/size in MiB converted to bytes. Confirm the meaning of `size` on your firmware. No low-free-space alert is included because cyclic recording can normally fill the disk.
- Optional network throughput uses the supplied camera template's conversion of netThroughput by 1000 to bps; confirm the API unit for your model before enabling it.
- HTTPS is supported through the protocol and port macros. Credentials use API query parameters; the password macro is secret, but HTTP requests still transmit it without encryption when HTTP is selected.
- Installed firmware stays in inventory. Online firmware lookup, update-availability alerts and external scripts have been removed. The template does not install firmware.

## Upgrade from the original NVR template

The original template UUID, existing item keys and discovery UUIDs are retained. Import with update-existing options to migrate existing definitions. Review/remove obsolete firmware-check items using import deletion options deliberately. Existing polling intervals now come from macros. The old `{$REOLINK.URL}` macro is no longer used: configure the NVR address in a host interface, and set the protocol/port macros when using HTTPS or a custom port. If several interface types exist, `{HOST.CONN}` selects Agent, SNMP, JMX, then IPMI in that priority order; verify the selected address is the NVR. Test import and real API data in a staging host before applying broadly.

## Validation

YAML parsing, unique UUIDs, dependent master references, JavaScript syntax and sample camera/disk/authentication/error responses were checked. Live Zabbix import and device compatibility have not yet been verified.

## Credits

Based on the user-provided Reolink NVR template and `Reolink Camera by HTTP` from `Unsorted/template_reolink_camera_http/7.4` in this repository. The camera template documents testing on an RLC-520A; that does not establish NVR compatibility.
