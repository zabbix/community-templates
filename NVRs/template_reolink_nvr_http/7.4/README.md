# Reolink NVR by HTTP

Zabbix 7.4 template for Reolink NVRs using the local HTTP API. Combines NVR camera/HDD discovery with bulk collection and performance metrics from the community camera template.

## Setup

1. Enable HTTP or HTTPS in the NVR network/server settings.
2. Import `template_reolink_nvr_http.yaml` and link it to the NVR host.
3. Set the technical Host name to the NVR IP address or a resolvable DNS name (for example, `10.1.102.196`). The URL uses `{HOST.HOST}`; no host interface is required. Use Visible name for a friendly label.
4. Set `{$REOLINK.USER}` and secret `{$REOLINK.PASS}`. HTTP on port 80 is the default; for HTTPS use `{$REOLINK.PROTOCOL}=https` and `{$REOLINK.PORT}=443`, or your custom port.
5. Set `{$REOLINK.API.PATH}` to `api.cgi` or `cgi-bin/api.cgi` as supported by the firmware.
6. Enable automatic host inventory to populate model, hardware, installed firmware and serial.
7. Review polling macros, API no-data timeout and the HDD temperature threshold (55 C).
8. Optionally enable `Reolink: Get performance info` after testing `GetPerformance` on your NVR. This master item is disabled by default.

## Collection

| Command | Default interval | Data |
|---|---|---|
| GetDevInfo | 1 minute | Device identity, inventory, JSON/authentication/API health |
| GetChannelstatus | 1 minute | All cameras: discovery, name, online state and UID changes |
| GetHddInfo | 5 minutes | All disks: discovery, mount/format checks, storage readiness, temperature, capacity and free space |
| GetChnTypeInfo (POST) | 1 hour per discovered camera | Camera model (`typeInfo`), hardware (`boardInfo`) and installed firmware (`firmVer`) |
| GetPerformance | 10 minutes, disabled initially | CPU and network throughput |

Discovery, camera status and disk metrics use dependent items. Each discovered camera also has one GetChnTypeInfo HTTP master; its model, hardware and installed firmware items share that response. Default enabled collection averages 2.2 requests per minute per NVR plus one request per hour per discovered camera. Set `{$REOLINK.DELAY.CAMERA.INFO}` to change the identity polling interval. API availability timeout defaults to 15 minutes and must exceed the longest enabled polling interval.

## Alerts and limitations

- Camera offline and UID changes remain enabled. Discovery retains lost cameras/disks for 30 days; fully unidentified empty channels are excluded. A channel disappearing entirely may leave its dependent item unsupported instead of returning offline: verify actual firmware behavior during commissioning.
- Invalid command responses are rejected before channel/disk extraction, rather than being interpreted as empty discovery or failed disks. Per-command no-data alerts identify unavailable channel/storage data.
- Authentication alerts require explicit authentication error text. Other API errors and invalid JSON have separate diagnostics; undocumented error codes are not assumed to be authentication failures.
- HDD storage readiness means mounted, formatted and positive capacity. It does **not** prove recording is taking place. HDD checks do not replace SMART diagnostics.
- Temperature is collected only if the API provides temperature, temp or hddTemp. Missing readings are discarded; no fake 0/-1 C is stored.
- Capacity/free-space conversion follows the supplied camera template: capacity/size in MiB converted to bytes. Confirm the meaning of `size` on your firmware. No low-free-space alert is included because cyclic recording can normally fill the disk.
- Optional network throughput uses the supplied camera template's conversion of netThroughput by 1000 to bps; confirm the API unit for your model before enabling it.
- HTTPS is supported through the protocol and port macros. Credentials use API query parameters; the password macro is secret, but HTTP requests still transmit it without encryption when HTTP is selected.
- Camera identity uses a POST JSON body with the discovered channel number. Missing fields and camera API errors discard identity values, preserving the previous readings; offline detection continues through GetChannelstatus. Camera fields appear in Latest data and do not overwrite the NVR host inventory.
- Installed NVR firmware stays in inventory. Online firmware lookup, update-availability alerts and external scripts have been removed. The template does not install firmware.

## Upgrade from the original NVR template

The original template UUID, existing item keys and discovery UUIDs are retained. Import with update-existing options to migrate existing definitions. Review/remove obsolete firmware-check items using import deletion options deliberately. Existing polling intervals now come from macros. The old `{$REOLINK.URL}` macro is no longer used: configure the NVR address in a host interface, and set the protocol/port macros when using HTTPS or a custom port. If several interface types exist, `{HOST.CONN}` selects Agent, SNMP, JMX, then IPMI in that priority order; verify the selected address is the NVR. Test import and real API data in a staging host before applying broadly.

## Validation

YAML parsing, unique UUIDs, dependent master references, JavaScript syntax and sample camera/disk/authentication/error responses were checked. The user verified a GetChnTypeInfo POST on channel 1, returning model, boardInfo and firmVer. Camera extraction was checked against that response and missing/error responses. Live import of this revised template has not yet been verified.

## Credits

Based on the user-provided Reolink NVR template and `Reolink Camera by HTTP` from `Unsorted/template_reolink_camera_http/7.4` in this repository. The camera template documents testing on an RLC-520A; that does not establish NVR compatibility.

## Serial numbers

The physical S/N and UID are separate identifiers. GetDevInfo may return a zero-only serial; such values are discarded and do not populate inventory. The detail field is not used as a serial fallback. Camera UID items are labeled UID. Locate the physical S/N on the product label or packaging when the API does not supply it. An existing zero value in history/inventory is not automatically cleared by this change.
