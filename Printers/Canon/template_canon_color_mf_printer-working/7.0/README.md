# Canon Color MF printers (Zabbix 7.0)

This version updates the existing **Canon Color MF printers** template for
Zabbix 7.0. It keeps the template UUID and the keys of five working legacy
items, so an existing installation can update the template in place. The
remaining checks use standard System, Host Resources, and Printer MIB objects,
plus discovery of Canon's available page counters.

The template was validated against a Canon MF660C Series `/P` using SNMPv1 and
Zabbix 7.0.30. Canon documents related MF750C counter names, but this updated
template has not been tested on an MF750C or other Canon model.

## Setup

1. Configure the printer host's SNMP interface with its address, protocol
   version, and credentials. No printer IP or community name is hardcoded in
   the template.
2. Import the YAML file with **Update existing** enabled for templates, items,
   discovery rules, triggers, graphs, and value maps. Review the import diff
   before deleting missing objects: older installations may have useful item
   history associated with the removed fixed checks.
3. Run toner, waste toner container, paper input, and Canon counter discovery.
   Check the values and unsupported item count before enabling notifications.

## Data collected

| Data | Source | Notes |
| --- | --- | --- |
| Availability and latency | ICMP checks | Requires Zabbix ICMP checks. |
| Model, name, location, serial, uptime | System and Printer MIBs | The five legacy keys retain their history. |
| Device IPv4 addresses | IP-MIB discovery | Discovers each non-loopback address reported by the printer, including when the SNMP interface uses a DNS name. |
| Device, cover, and console status | Host Resources and Printer MIBs | Cover status follows RFC 3805: `3`/`5` open, `4`/`6` closed. |
| Marker life count and counter unit | Printer MIB | The MF660C reports unit `7` (impressions). Marker life count is distinct from Canon's copy-and-print total. |
| CMYK toner names, raw levels, capacities, percentages | Printer MIB discovery | Percentage is `100 × level / capacity` when capacity is positive. |
| Waste toner container capacity and free space | Printer MIB discovery | Created only for rows with `prtMarkerSuppliesClass=4` (receptacle) and `prtMarkerSuppliesType=4` (waste toner). The row index is discovered, not fixed. |
| Paper input names, raw levels, capacities, status | Printer MIB discovery | No paper-out trigger is defined because status is a bit field and the level may be a sentinel value. |
| Canon page counters | Canon private MIB discovery | The printer supplies each counter name and index; unavailable counters create no item. |

Toner warnings use distinct ranges: 10–19% (warning), 1–9% (high), and 0%
(disaster). A negative raw level or nonpositive capacity does not trigger a
toner alert. An unknown or zero capacity may leave the calculated percentage
unsupported while the raw values remain available.

The Canon counter discovery reads names from
`1.3.6.1.4.1.1602.1.11.1.4.1.3` and values from
`1.3.6.1.4.1.1602.1.11.1.4.1.4`. On the tested MF660C, counter `101` was
**Total 1**, `108` was **Total (Black 1)**, `301` was **Print (Total 1)**, and
`501` was **Scan (Total 1)**. Counter availability varies by model and region.

The former fixed `Device.IP.address` used one contributor's IP address. The
7.0 template discovers `ipAdEntAddr` entries from IP-MIB and creates
`Device.IP.address[{#SNMPINDEX}]` for each non-loopback IPv4 address. This
also works when the host's SNMP interface is configured with a DNS name.
The fixed maintenance-cartridge items used standard Printer MIB capacity and
level OIDs with supply index 5, which MF660C does not expose. Canon's MF660C
consumables list names only toner cartridges. Other MF models, including
imageCLASS X MF1538C II, have a separate waste toner container. The new
discovery reads the Printer MIB class, type, name, and unit at each supply
index. Only waste toner receptacles create capacity and free-space items;
`prtMarkerSuppliesLevel` means remaining space for a receptacle. Negative
values indicate an unspecified or unknown capacity/level rather than a
measured amount. This discovery has been checked for zero matches on MF660C;
it has not been tested against an MF model with a waste toner container. The
previous private counter OIDs used a branch that MF660C does not implement.
The former `Tray1.paper.out` checked `prtInputStatus=1`; RFC 3805 defines this
as *unavailable on request*, not an empty tray. The 7.0 template uses discovery
for IPv4 addresses, toner, waste toner containers, paper inputs, and counters.
MF660C exposes only four toner rows in `prtMarkerSuppliesTable`, so waste toner
container discovery creates no items on that model.

## References

- [Printer MIB v2 (RFC 3805)](https://www.rfc-editor.org/rfc/rfc3805)
- [Canon MF660C counter guide](https://oip.manual.canon/USRMA-9960-zz-SSM-660-enUS/contents/devu-mng_set-status-counter.html)
- [Canon MF660C consumables list](https://oip.manual.canon/USRMB-0001-zz-SSM-660-enLN/contents/devu-mainte-consumables_rep-list.html)
- [Canon imageCLASS X MF1538C II replacement parts](https://oip.manual.canon/USRMA-8451-zz-SSMX-1500II-enUS/contents/devu-mainte-repl_parts.html)
- [Canon MF750C counter guide](https://oip.manual.canon/USRMA-7184-zz-SSM-750-enUV/contents/devu-mng_set-status-counter.html)

## Authors

This is a Zabbix 7.0 update of the community Canon Color MF printers template,
which credits aikucits for the original version. MF660C validation and the
7.0 update were contributed by hshimomura.
